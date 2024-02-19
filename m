Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08BD85A6B1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682955.1062223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc56y-0005P1-DM; Mon, 19 Feb 2024 14:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682955.1062223; Mon, 19 Feb 2024 14:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc56y-0005Mf-AE; Mon, 19 Feb 2024 14:59:16 +0000
Received: by outflank-mailman (input) for mailman id 682955;
 Mon, 19 Feb 2024 14:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NiMn=J4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rc56w-0005MN-Iz
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:59:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7078a391-cf37-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 15:59:11 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 916FA4EE073A;
 Mon, 19 Feb 2024 15:59:10 +0100 (CET)
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
X-Inumbo-ID: 7078a391-cf37-11ee-98f5-efadbce2ee36
Message-ID: <f28aed5e-0983-48fa-828f-b2133ca35086@bugseng.com>
Date: Mon, 19 Feb 2024 15:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b1d2b64c8117d61ea42cf4e9feae128541eb0b61.1708348799.git.federico.serafini@bugseng.com>
 <a6e8bd32-cc32-4084-907d-e2cd6d46e3e6@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <a6e8bd32-cc32-4084-907d-e2cd6d46e3e6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/02/24 14:43, Jan Beulich wrote:
> On 19.02.2024 14:24, Federico Serafini wrote:
>> Update ECLAIR configuration to consider safe switch clauses ending
>> with __{get,put}_user_bad().
>>
>> Update docs/misra/deviations.rst accordingly.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> As mentioned I'm not happy with this, not the least because of it being
> unclear why these two would be deviated, when there's no sign of a
> similar deviation for, say, __bad_atomic_size(). Imo this approach
> doesn't scale, and that's already leaving aside that the purpose of
> identically named (pseudo-)helpers could differ between architectures,
> thus putting under question ...
> 
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -368,6 +368,10 @@ safe."
>>   -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
>>   -doc_end
>>   
>> +-doc_begin="Switch clauses ending with constructs \"__get_user_bad()\" and \"__put_user_bad()\" are safe: they denote an unreachable program point."
>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/__(put|get)_user_bad\\(\\);/))))"}
>> +-doc_end
> 
> ... the global scope of such a deviation. While it may not be a good idea,
> even within an arch such (pseudo-)helpers could be used for multiple
> distinct purposes.

Would you agree with adding the missing break statement after
the uses of __{put,get}_user_bad() (as it is already happening for
uses of __bad_atomic_size())?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

