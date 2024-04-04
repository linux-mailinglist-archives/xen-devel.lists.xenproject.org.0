Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62895899254
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 01:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701031.1095040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsWwL-0004bA-Ug; Thu, 04 Apr 2024 23:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701031.1095040; Thu, 04 Apr 2024 23:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsWwL-0004Z5-S7; Thu, 04 Apr 2024 23:56:17 +0000
Received: by outflank-mailman (input) for mailman id 701031;
 Thu, 04 Apr 2024 23:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1z08=LJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsWwL-0004Yz-8Y
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 23:56:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eacfbc76-f2de-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 01:56:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6B3B2CE0B68;
 Thu,  4 Apr 2024 23:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD04C433F1;
 Thu,  4 Apr 2024 23:56:08 +0000 (UTC)
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
X-Inumbo-ID: eacfbc76-f2de-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712274969;
	bh=2gNIFzSHqSNI48cGHQSIVqgVk5UzNnwvU8gBaXTDe+g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YsqkiVRWNr/6GrMqfKeJpwDuTP4OkJ16UKU0V2VFO1hxFARyMW6a6/wu5dBsSXUT8
	 iThXnbhM1GKhbfPzpZz0WQXJxY4Xd97JAmM3DmX7dvY/w0hL6zyqVTw69fNumliejh
	 4MXQChH1J/kdaE9fpk06qk/LGWw0ASIArOpvbu0I6drAgPfRC6jdkI0aatJLwadzxz
	 eA31IRZf1pquo2aHbFKzv5sQtbt5S51nbU4DQtMBU7iAdSUTMPvcpIOZU3u97xzKPC
	 crYkN/0JYU0Bf+5Lf67GJUr97upc3A90Kk/5YR+FN/NvMRD3PevNzJxva/z5SZx1xr
	 jM70bhPJDDVyg==
Date: Thu, 4 Apr 2024 16:56:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <e3e13f3f-3df6-4eb4-8b73-21387007e7c3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404041548530.2245130@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop> <e3e13f3f-3df6-4eb4-8b73-21387007e7c3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Apr 2024, Jan Beulich wrote:
> On 04.04.2024 03:12, Stefano Stabellini wrote:
> > --- a/docs/misra/C-language-toolchain.rst
> > +++ b/docs/misra/C-language-toolchain.rst
> > @@ -480,4 +480,73 @@ The table columns are as follows:
> >       - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
> >  
> >  
> > +Sizes of Integer types
> > +______________________
> > +
> > +Xen expects System V ABI on x86_64:
> > +  https://gitlab.com/x86-psABIs/x86-64-ABI
> > +
> > +Xen expects AAPCS32 on ARMv8-A AArch32:
> > +  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
> > +
> > +Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
> > +  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
> > +
> > +A summary table of data types, sizes and alignment is below:
> > +
> > +.. list-table::
> > +   :widths: 10 10 10 45
> > +   :header-rows: 1
> > +
> > +   * - Type
> > +     - Size
> > +     - Alignment
> > +     - Architectures
> > +
> > +   * - char 
> > +     - 8 bits
> > +     - 8 bits
> > +     - all architectures
> 
> This one _may_ be acceptable, but already feels like going too far.
> 
> > +   * - short
> > +     - 16 bits
> > +     - 16 bits
> > +     - all architectures
> > +
> > +   * - int
> > +     - 32 bits
> > +     - 32 bits
> > +     - all architectures
> 
> These two I continue to disagree with. The values are minimum required ones.

The purpose of the document docs/misra/C-language-toolchain.rst is to
describe the reference safety-supported configuration. In a way, this
document is similar to SUPPORT.md but for safety instead of security.

Here, we need to write down the stable configuration, the one everyone
is aligned and convinced should work correctly.

Now, let's say that I believe you and agree with you that it should be
possible to support int as 64-bit. This configuration is not tested. If
I can draw a comparison, it would be similar to ask for XSM to be
security supported while in fact is marked as experimental in
SUPPORT.md.

If you want, taking inspiration from SUPPORT.md, we can have a
"supported" column and a "experimental" column. In the experimental
column we can write down "at least 32-bit" or "32-bit or larger".


> Even if code changes may be needed (Misra already helps us here by stopping
> undue mixing of e.g. unsigned int and uint32_t in at least some situations),
> there's no inherent requirement in Xen for such restrictions.

I hope that my comparison with XSM and SUPPORT.md helps explain why we
need to clarify the safety supported configuration with the values we
actually validate Xen with.

Your goal is to write down what should work with Xen, which is also OK
but it is a different goal. It is OK to say that we aim for Xen to also
work with other configurations too, and list them. That was not my
intention, but I can expand the scope if you request.

 
> > +   * - long
> > +     - 32 bits
> > +     - 32 bits 
> > +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> > +
> > +   * - long
> > +     - 64 bits
> > +     - 64 bits 
> > +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> > +
> > +   * - long long
> > +     - 64-bit
> > +     - 32-bit
> > +     - x86_32
> > +
> > +   * - long long
> > +     - 64-bit
> > +     - 64-bit
> > +     - 64-bit architectures, ARMv8-A AArch32, ARMv8-R AArch32
> 
> Along the lines of the above, simply saying "64-bit architectures" here
> is too generic. Whereas for long (above) and ...
> 
> > +   * - pointer
> > +     - 32-bit
> > +     - 32-bit
> > +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> > +
> > +   * - pointer
> > +     - 64-bit
> > +     - 64-bit
> > +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> 
> ... pointers I agree (and the special mentioning of the architectures
> in parentheses could even be omitted imo). To summarize, my counter
> proposal:
> 
>    * - char 
>      - at least 8 bits

this

>      - equaling size
>      - all architectures
> 
>    * - char
>      - 8 bits
>      - 8 bits
>      - x86, ARM, RISC-V, PPC
> 
>    * - short
>      - at least 16 bits

and this

>      - equaling size
>      - all architectures
> 
>    * - short
>      - 16 bits
>      - 16 bits
>      - x86, ARM, RISC-V, PPC
> 
>    * - int
>      - at least 32 bits

and this, more below


>      - equaling size
>      - all architectures
> 
>    * - int
>      - 32 bits
>      - 32 bits
>      - x86, ARM, RISC-V, PPC
> 
>    * - long
>      - 32 bits
>      - 32 bits 
>      - 32-bit architectures
> 
>    * - long
>      - 64 bits
>      - 64 bits 
>      - 64-bit architectures
> 
>    * - long long
>      - 64-bit
>      - 32-bit
>      - x86_32
> 
>    * - long long
>      - 64-bit
>      - 64-bit
>      - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R AArch32
> 
>    * - pointer
>      - 32-bit
>      - 32-bit
>      - 32-bit architectures
> 
>    * - pointer
>      - 64-bit
>      - 64-bit
>      - 64-bit architectures
> 
> Eventually, by properly decoupling pointers from longs (via using {,u}intptr_t
> appropriately), the restrictions on "long" could also be lifted.
> 
> Note that the generic requirements on char and short also are imposed by C99.
> It may therefore not be necessary to state them explicitly, but rather refer
> to that standard (just like you're now referencing the SysV psABI-s).

I am OK with the above, except for the three instances of "at least". As
mentioned earlier, we need to specify the supported and validated
configuration. If you want we can also add another field to express what
we aim at getting Xen to work with, but it should be separate.

