Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2F91602A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747313.1154686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0kg-0008RJ-AW; Tue, 25 Jun 2024 07:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747313.1154686; Tue, 25 Jun 2024 07:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0kg-0008P5-6r; Tue, 25 Jun 2024 07:38:06 +0000
Received: by outflank-mailman (input) for mailman id 747313;
 Tue, 25 Jun 2024 07:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQf/=N3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sM0kf-0008Oz-9B
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:38:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dad5299a-32c5-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 09:38:03 +0200 (CEST)
Received: from [172.20.10.8] (unknown [37.161.81.3])
 by support.bugseng.com (Postfix) with ESMTPSA id 3FFC34EE0738;
 Tue, 25 Jun 2024 09:38:02 +0200 (CEST)
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
X-Inumbo-ID: dad5299a-32c5-11ef-b4bb-af5377834399
Message-ID: <8d61a7d8-dd34-4bea-822e-c880437d4828@bugseng.com>
Date: Tue, 25 Jun 2024 09:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 09/13] x86/mm: add defensive return
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <f3adf3d5dac5c4c108207883472f3ebcfa11c685.1719218291.git.federico.serafini@bugseng.com>
 <3ba59d21-bf67-4585-8e94-5a01cff18ec3@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <3ba59d21-bf67-4585-8e94-5a01cff18ec3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/24 17:39, Jan Beulich wrote:
> On 24.06.2024 11:04, Federico Serafini wrote:
>> Add defensive return statement at the end of an unreachable
>> default case. Other than improve safety,
> 
> It is particularly with this in mind that ...
> 
>> this meets the requirements
>> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
>> statement shall terminate every switch-clause".
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/x86/mm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index 648d6dd475..2e19ced15e 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -916,6 +916,7 @@ get_page_from_l1e(
>>                   return 0;
>>               default:
>>                   ASSERT_UNREACHABLE();
>> +                return 0;
>>               }
> 
> ... returning "success" in such a case can't be quite right. As indicated
> elsewhere, really we want -EINTERNAL for such cases, just that errno.h
> doesn't know anything like this, and I'm also unaware of a somewhat
> similar identifier that we might "clone" from elsewhere. Hence we'll want
> to settle on some existing error code which we then use here and in
> similar situations. EINVAL is the primary example of what I would prefer
> to _not_ see used for this.

Sorry, I got confused by the ASSERT_UNREACHABLE followed by a
return 0 few lines above.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

