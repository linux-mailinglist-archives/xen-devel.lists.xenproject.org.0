Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71F9069DD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 12:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739771.1146721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhaQ-0003lu-GX; Thu, 13 Jun 2024 10:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739771.1146721; Thu, 13 Jun 2024 10:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhaQ-0003j1-DJ; Thu, 13 Jun 2024 10:21:42 +0000
Received: by outflank-mailman (input) for mailman id 739771;
 Thu, 13 Jun 2024 10:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+hf=NP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sHhaO-0003iv-Pu
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 10:21:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b82b7156-296e-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 12:21:38 +0200 (CEST)
Received: from [172.20.10.8] (unknown [78.209.79.104])
 by support.bugseng.com (Postfix) with ESMTPSA id 6C0494EE0756;
 Thu, 13 Jun 2024 12:21:37 +0200 (CEST)
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
X-Inumbo-ID: b82b7156-296e-11ef-b4bb-af5377834399
Message-ID: <d6540755-878d-404a-af89-b006a8e7fed5@bugseng.com>
Date: Thu, 13 Jun 2024 12:21:36 +0200
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

Right, thanks.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

