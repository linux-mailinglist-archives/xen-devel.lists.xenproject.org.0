Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D27B1D7F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 15:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609699.948802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqtj-0006EQ-9b; Thu, 28 Sep 2023 13:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609699.948802; Thu, 28 Sep 2023 13:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqtj-0006Cg-5u; Thu, 28 Sep 2023 13:17:43 +0000
Received: by outflank-mailman (input) for mailman id 609699;
 Thu, 28 Sep 2023 13:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRba=FM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qlqth-0006Ca-AU
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 13:17:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66487f85-5e01-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 15:17:40 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 948EF4EE0739;
 Thu, 28 Sep 2023 15:17:38 +0200 (CEST)
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
X-Inumbo-ID: 66487f85-5e01-11ee-878a-cb3800f73035
Message-ID: <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
Date: Thu, 28 Sep 2023 15:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com>
 <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
 <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/23 14:51, Jan Beulich wrote:
> On 28.09.2023 14:46, Simone Ballarin wrote:
>> On 13/09/23 10:02, Jan Beulich wrote:
>>> On 12.09.2023 11:36, Simone Ballarin wrote:
>>>> Add or move inclusion guards to address violations of
>>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>>> to prevent the contents of a header file being included more than
>>>> once").
>>>>
>>>> Inclusion guards must appear at the beginning of the headers
>>>> (comments are permitted anywhere) and the #if directive cannot
>>>> be used for other checks.
>>>>
>>>> Simone Ballarin (10):
>>>>     misra: add deviation for headers that explicitly avoid guards
>>>>     misra: modify deviations for empty and generated headers
>>>>     misra: add deviations for direct inclusion guards
>>>>     xen/arm: address violations of MISRA C:2012 Directive 4.10
>>>>     xen/x86: address violations of MISRA C:2012 Directive 4.10
>>>>     x86/EFI: address violations of MISRA C:2012 Directive 4.10
>>>>     xen/common: address violations of MISRA C:2012 Directive 4.10
>>>>     xen/efi: address violations of MISRA C:2012 Directive 4.10
>>>>     xen: address violations of MISRA C:2012 Directive 4.10
>>>>     x86/asm: address violations of MISRA C:2012 Directive 4.10
>>>
>>> Just to mention it here again for the entire series, seeing that despite
>>> my earlier comments to this effect a few R-b have arrived: If private
>>> headers need to gain guards (for, imo, no real reason), we first need to
>>> settle on a naming scheme for these guards, such that guards used in
>>> private headers aren't at risk of colliding with ones used headers
>>> living in one of the usual include directories. IOW imo fair parts of
>>> this series may need redoing.
>>>
>>> Jan
>>>
>>
>> My proposal is:
>> - the relative path from "xen/arch" for files in this directory
>>     (i.e. X86_X86_X86_MMCONFIG_H for "xen/arch/x86/x86_64/mmconfig.h";
> 
> X86_X86_64_MMCONFIG_H that is?
> 
> Yet then this scheme won't hold for xen/arch/include/asm/... ? It's also
> not clear whether you're deliberately omitting leading/trailing underscores
> here, which may be a way to distinguish private from global headers.

Each name that begins with a double or single underscore (__, _) 
followed by an uppercase letter is reserved. Using a reserved identifier 
is an undefined-b.

I would be better to avoid them.

> 
>> - for the others, the entire path.
> 
> What exactly is "entire" here?
> 
> Jan

Let me try again.

If we are inside xen/arch the relative path starting from this directory:
   | xen/arch/x86/include/asm/compat.h
   X86_INCLUDE_ASM_COMPAT_H

For xen/include, the current convention.
Maybe, in a future patch, we can consider removing the leading _.

For the others, the relative path after xen:
   | xen/common/efi/efi.h
   COMMON_EFI_EFI_H



-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


