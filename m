Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122FA906C84
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739854.1146800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHiyZ-0003Rr-TT; Thu, 13 Jun 2024 11:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739854.1146800; Thu, 13 Jun 2024 11:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHiyZ-0003QL-Qp; Thu, 13 Jun 2024 11:50:43 +0000
Received: by outflank-mailman (input) for mailman id 739854;
 Thu, 13 Jun 2024 11:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+hf=NP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sHiyZ-0003QF-5D
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 11:50:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28d34f2d-297b-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 13:50:41 +0200 (CEST)
Received: from [157.138.77.22] (unknown [157.138.77.22])
 by support.bugseng.com (Postfix) with ESMTPSA id A00CE4EE0756;
 Thu, 13 Jun 2024 13:50:40 +0200 (CEST)
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
X-Inumbo-ID: 28d34f2d-297b-11ef-90a3-e314d9c70b13
Message-ID: <c1f92d1f-0934-4603-b3b8-a77402643f22@bugseng.com>
Date: Thu, 13 Jun 2024 13:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C Rule
 17.7
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <a5137c812eefab7e0417670386b0fee35468504d.1718264354.git.federico.serafini@bugseng.com>
 <55f46457-4182-4e1b-a792-e94cc6c16864@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <55f46457-4182-4e1b-a792-e94cc6c16864@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/24 12:08, Jan Beulich wrote:
> On 13.06.2024 11:07, Federico Serafini wrote:
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -364,6 +364,17 @@ Deviations related to MISRA C:2012 Rules:
>>          by `stdarg.h`.
>>        - Tagged as `deliberate` for ECLAIR.
>>   
>> +   * - R17.7
>> +     - Not using the return value of a function do not endanger safety if it
>> +       coincides with the first actual argument.
>> +     - Tagged as `safe` for ECLAIR. Such functions are:
>> +         - __builtin_memcpy()
>> +         - __builtin_memmove()
>> +         - __builtin_memset()
>> +         - __cpumask_check()
>> +         - strlcat()
>> +         - strlcpy()
> 
> These last two aren't similar to strcat/strcpy in what they return, so I'm
> not convinced they should be listed here. Certainly not with the "coincides"
> justification.

Thanks to violations of Rule 17.7 I noticed that safe_strcpy()
and safe_strcat() are used without checking the return value.
Is this intentional?

[1]
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/665/PROJECT.ecd;/by_service/MC3R1.R17.7.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"message","inputs":[{"enabled":true,"text":"^.*safe_strcpy"}]}]}}}

[2]
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/665/PROJECT.ecd;/sources/xen/arch/x86/setup.c.html#R5021_1{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"message","inputs":[{"enabled":true,"text":"^.*safe_strcat"}]}]}}}

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

