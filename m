Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9492736598
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 10:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551459.861013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBWI2-00086D-TH; Tue, 20 Jun 2023 08:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551459.861013; Tue, 20 Jun 2023 08:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBWI2-00084M-OK; Tue, 20 Jun 2023 08:00:38 +0000
Received: by outflank-mailman (input) for mailman id 551459;
 Tue, 20 Jun 2023 08:00:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8C9p=CI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBWI1-00084G-9u
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 08:00:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87a7999b-0f40-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 10:00:32 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.46.142.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 214514EE0737;
 Tue, 20 Jun 2023 10:00:29 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 87a7999b-0f40-11ee-8611-37d641c3527e
Message-ID: <1e46b737-9e33-4175-e2fe-7d7e9cd275c0@bugseng.com>
Date: Tue, 20 Jun 2023 10:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH v2 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
To: Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <9c3c83c17cb3a4ee9cc1241cefc15840d23d107e.1687167502.git.nicola.vetrini@bugseng.com>
 <e6d66407-9777-160f-274e-3f0808cf514b@suse.com>
Content-Language: en-US
In-Reply-To: <e6d66407-9777-160f-274e-3f0808cf514b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/23 12:29, Jan Beulich wrote:
> On 19.06.2023 11:56, Nicola Vetrini wrote:
>> --- a/xen/common/xmalloc_tlsf.c
>> +++ b/xen/common/xmalloc_tlsf.c
>> @@ -140,9 +140,6 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>>           *fl = flsl(*r) - 1;
>>           *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>           *fl -= FLI_OFFSET;
>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>> -         *fl = *sl = 0;
>> -         */
>>           *r &= ~t;
>>       }
>>   }
> 
> As indicated before, I don't think simply dropping the commented out code
> is appropriate here. Personally I'd prefer if it was kept (using #if/#else),
> but I'd also be okay with replacing it by a respective assertion. That said,
> if other maintainers think this is the way to go, then I don't mean to
> stand in the way.
> 

As Andrew Cooper suggested in the previous patch revision 
(https://lore.kernel.org/xen-devel/6bac57d5-c30e-f763-3abe-b3f335f366f7@suse.com/T/#m5722285215bb30d7f1202b9921e2c92d5ea98d6a), 
I removed the commented-out code, since it contains unused logic, but I 
would be okay with replacing it with an assertion, if you think it's better.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

