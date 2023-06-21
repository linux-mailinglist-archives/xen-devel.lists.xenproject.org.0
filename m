Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19543738E82
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 20:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553098.863461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC2SC-0002cg-KI; Wed, 21 Jun 2023 18:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553098.863461; Wed, 21 Jun 2023 18:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC2SC-0002as-H5; Wed, 21 Jun 2023 18:21:16 +0000
Received: by outflank-mailman (input) for mailman id 553098;
 Wed, 21 Jun 2023 18:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gfgj=CJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qC2SB-0002am-Qk
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 18:21:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6650e815-1060-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 20:21:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DD1CB828471B;
 Wed, 21 Jun 2023 13:21:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ODwE_xhMYs-t; Wed, 21 Jun 2023 13:21:09 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4B3788285717;
 Wed, 21 Jun 2023 13:21:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1g4KpaxqDmIl; Wed, 21 Jun 2023 13:21:09 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E55E2828471B;
 Wed, 21 Jun 2023 13:21:08 -0500 (CDT)
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
X-Inumbo-ID: 6650e815-1060-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4B3788285717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687371669; bh=oUEM0Wq+0jxEqT9zQxbQ5GitcPeRepGOjcHWlKYHdmY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=ozbpplnZfdgR8hJ7xqtFhG/YVisyTrk5LvWVOdkDMkz5Z4AhGAwIsnSWrNADTeuf0
	 PXtrKDdiGpq8XYYEjnBptCk0ycPxKImtfVP0QL8s2Kwl2UhjqCSnmMvxLJMYKlHUe/
	 aUJk8jBq+1jKtRom3D0dHI0Itc1ULn/GD4OF41v8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <8ac54b2e-b074-18eb-38bf-1041a8109d7b@raptorengineering.com>
Date: Wed, 21 Jun 2023 13:21:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/23 12:54 PM, Andrew Cooper wrote:
> On 21/06/2023 5:59 pm, Shawn Anastasio wrote:
>>  xen/arch/ppc/Kconfig.debug              |   5 +
>>  xen/arch/ppc/Makefile                   |   3 +
>>  xen/arch/ppc/boot-of.c                  | 116 +++++++++++++
>>  xen/arch/ppc/configs/ppc64_defconfig    |   1 +
>>  xen/arch/ppc/early_printk.c             |  28 +++
>>  xen/arch/ppc/include/asm/boot.h         |  24 +++
>>  xen/arch/ppc/include/asm/bug.h          |   6 +
>>  xen/arch/ppc/include/asm/byteorder.h    |  37 ++++
>>  xen/arch/ppc/include/asm/cache.h        |   6 +
>>  xen/arch/ppc/include/asm/early_printk.h |  15 ++
>>  xen/arch/ppc/include/asm/msr.h          |  67 ++++++++
>>  xen/arch/ppc/include/asm/processor.h    | 207 ++++++++++++++++++++++
>>  xen/arch/ppc/include/asm/reg_defs.h     | 218 ++++++++++++++++++++++++
>>  xen/arch/ppc/include/asm/string.h       |   6 +
>>  xen/arch/ppc/include/asm/types.h        |  35 ++++
>>  xen/arch/ppc/ppc64/Makefile             |   1 +
>>  xen/arch/ppc/ppc64/asm-offsets.c        |  55 ++++++
>>  xen/arch/ppc/ppc64/head.S               |  48 +++---
>>  xen/arch/ppc/ppc64/of-call.S            |  85 +++++++++
>>  xen/arch/ppc/setup.c                    |  31 ++++
>>  20 files changed, 972 insertions(+), 22 deletions(-)
>>  create mode 100644 xen/arch/ppc/boot-of.c
>>  create mode 100644 xen/arch/ppc/early_printk.c
>>  create mode 100644 xen/arch/ppc/include/asm/boot.h
>>  create mode 100644 xen/arch/ppc/include/asm/bug.h
>>  create mode 100644 xen/arch/ppc/include/asm/byteorder.h
>>  create mode 100644 xen/arch/ppc/include/asm/cache.h
>>  create mode 100644 xen/arch/ppc/include/asm/early_printk.h
>>  create mode 100644 xen/arch/ppc/include/asm/msr.h
>>  create mode 100644 xen/arch/ppc/include/asm/processor.h
>>  create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
>>  create mode 100644 xen/arch/ppc/include/asm/string.h
>>  create mode 100644 xen/arch/ppc/include/asm/types.h
>>  create mode 100644 xen/arch/ppc/ppc64/of-call.S
>>  create mode 100644 xen/arch/ppc/setup.c
> 
> This is a surprising amount of infrastructure.  I'm guessing it's a
> consequence of needing byteorder ?

Right, byteorder as well as va_{start,end,arg}. I could try to trim it
down further.

> There's a series still out deleting swathes of junk in byteorder.  I
> guess I need to kick that thread again, but it mostly boils down to
> using __builtin_bswap$N() (and on x86, reimplementing them on old enough
> compilers).  Presumably all versions of GCC (and eventually Clang) we
> care to support with ppc64 understand this builtin ?

Yes, those builtins should work just fine on any reasonably recent gcc
or clang toolchain. What would be the correct approach to integrating
these into byteorder.h? Would adding some `#define __arch_swab$N
__builtin_bswap$N` macros be the way to go?

> I've noticed a couple of other things.  asm/types.h repeats some
> antipatterns which we're trying to delete for MISRA reasons in other
> architectures.  I was already planning to fix that up xen-wide, and I
> guess now is the better time to do so.
> 
> Elsewhere, you've got a number of __inline__'s.  We think those are all
> vestigial now, so should be switched to using a plain inline.

Will do.

> Also, there are a bunch of UL() or ULL() macros which encoding a
> difference between asm and C.  In Xen, we use _AC() for that, which you
> can find in <xen/const.h>.

Thanks for the pointer, I'll update the usage of UL/ULL.

> Similarly, there are some functions which ought to be __init, so it
> would be good to get them correct from the start.

Good catch. This actually goes along with your subsequent observation
about Open Firmware residing in the bottom 4G of memory. See below.

> Maybe as an intermediate step, just get the infinite loop moved from asm
> up into C?  That gets the stack setup, and various of the asm helpers,
> without all the rest of the C required to get early_printk() to work.

Would you like that plus the serial patch in this same series, or would
you like me to just get the C infinite loop going for this series?

> Something we've been trying very hard to do generally is declutter
> processor.h, and on x86, we've got asm-defns.h as a more appropriate
> place to have the stuff which is expected to be common to all asm code,
> and never encountered in C.

Sounds good, I'll move the common asm-only stuff to an asm-defns.h.

> A couple of questions before I dive further in.
> 
> Given:
> 
> #define r0  0
> 
> do the assemblers really not understand register names?  That seems mad.

Yeah as surprising as it is, ppc64 assemblers don't handle register
names by default. I think at some point a flag was added to GAS (and
probably llvm? will have to check) to define them for you, but I'm not
sure which version introduced the flag.

I'll do some digging and if the flag is available a reasonable versions
of both toolchains (what exactly would constitute this? Are there
project-wide expectations of older toolchains working, and if so, how
old?) then I can get rid of these.

> Also, given the transformations to call into OpenFirmware, presumably
> this limits Xen to running below the 4G boundary and on identity mappings?

Interaction with Open Firmware directly shouldn't be necessary past
early init, so it shouldn't impose any restrictions on the memory map
once paging is up and going. It will just require grabbing all of the
required information from OF (essentially dumping the device tree into a
local copy) before making the switch.

I'll also mark the relevant functions as __init.

> ~Andrew

Thanks,
Shawn

