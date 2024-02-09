Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33284F24F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 10:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678598.1056024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNGw-0004BD-1G; Fri, 09 Feb 2024 09:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678598.1056024; Fri, 09 Feb 2024 09:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNGv-000481-TJ; Fri, 09 Feb 2024 09:34:13 +0000
Received: by outflank-mailman (input) for mailman id 678598;
 Fri, 09 Feb 2024 09:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFPS=JS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rYNGu-00047v-1n
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 09:34:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 604abc3a-c72e-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 10:34:09 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 37C844EE0739;
 Fri,  9 Feb 2024 10:34:09 +0100 (CET)
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
X-Inumbo-ID: 604abc3a-c72e-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Fri, 09 Feb 2024 10:34:09 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>, Jbeulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH] docs/misra: add x86_64 and arm64 asm-offset.c to
 exclude-list
In-Reply-To: <2a335c77-bafb-4a42-a10b-f01c9985c5f8@xen.org>
References: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
 <ccc568a3-d81c-482c-8768-c5934e3943a8@xen.org>
 <a6ed69c037c23cf2b0854ef52d797921@bugseng.com>
 <2a335c77-bafb-4a42-a10b-f01c9985c5f8@xen.org>
Message-ID: <1f0b2c1621d76884ed36e3bceb8a1989@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-09 10:28, Julien Grall wrote:
> On 09/02/2024 07:52, Nicola Vetrini wrote:
>> Hi Julien,
> 
> Hi Nicola,
> 
>> 
>> On 2024-02-08 22:33, Julien Grall wrote:
>>> Hi Nicola,
>>> 
>>> On 08/02/2024 07:55, Nicola Vetrini wrote:
>>>> These two files contain several deliberate violations of MISRA C 
>>>> rules and
>>>> they are not linked in the final Xen binary, therefore they can be 
>>>> exempted
>>>> from MISRA compliance.
>>> 
>>> I am curious, what are the violations you are talking about?
>>> 
>>> Cheers,
>>> 
>> 
>> The one that prompted the exclusion is for R20.12 on arm for the 
>> macros DEFINE and OFFSET, where the second argument of OFFSET is a 
>> macro and is used as a normal parameter and a stringification operand.
>> However, there are other special cases (e.g., the file not being 
>> linked, which violates R2.1 and was already decided to deviate that 
>> aspect).
> 
> Thanks for the clarification. I think it would be worth to add what you 
> just wrote in the commit message. This give an idea to the reviewer why 
> we excluded it.
> 
> With Jan's request addressed:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
>> 

Thanks. I did send a v2 of this patch addressing Jan's request. I'll let 
him decide whether he wants a more detailed commit message.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

