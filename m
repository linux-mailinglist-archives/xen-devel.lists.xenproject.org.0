Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866416DA455
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 23:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519000.806122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkWla-00073M-Sd; Thu, 06 Apr 2023 21:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519000.806122; Thu, 06 Apr 2023 21:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkWla-000715-Pr; Thu, 06 Apr 2023 21:03:34 +0000
Received: by outflank-mailman (input) for mailman id 519000;
 Thu, 06 Apr 2023 21:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pkWlZ-00070z-Fw
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 21:03:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b75b6c1-d4be-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 23:03:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ABD860F8A;
 Thu,  6 Apr 2023 21:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CD6C433EF;
 Thu,  6 Apr 2023 21:03:27 +0000 (UTC)
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
X-Inumbo-ID: 7b75b6c1-d4be-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680815008;
	bh=baSuc3BibvB3PyiGiOM2HhWxK6GVI9IxnZZWwuwsNt0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mM5y2v9V0XrBUWuQ+oK7Za92/KG4pQawUlDfs4D9f8p5l5p/db+J1EMs+aK00T4ah
	 TNhy/0UbJhvvOo+EhrgsHRcFRfqDu6uuWiB2u0FDhll7tBlcXbCwQpnt4C2SzgAQ5o
	 FkCVHvmzLW+3qL3A1MSZWJwiwKaJ7E8ZT9d1S+DXYjxnWmLPMqoGUJ2wfkC3Z5Usds
	 7kJnUOW47MvF/Er4O8flIxqzXfN78Mx1/jzeHG49Hgp1xcTIUgdOHxb1t/8/CJhZB5
	 KHNnBB9G5Q0AUzTTNVxjNxFsmWRxy55a1VsqG89cdVCusrafau1kzkiVuTtiv4CFa4
	 9CjUpyzp5YwVw==
Date: Thu, 6 Apr 2023 14:03:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Gianluca Guida <gianluca@rivosinc.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 4/5] xen/arm: switch ARM to use generic implementation
 of bug.h
In-Reply-To: <cce5e277-8692-d339-0283-55620c349fcf@xen.org>
Message-ID: <alpine.DEB.2.22.394.2304061403190.111906@ubuntu-linux-20-04-desktop>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com> <8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com> <3a94ad32-159d-d06f-cba6-3bb40f9f2085@xen.org> <alpine.DEB.2.22.394.2304021557140.4566@ubuntu-linux-20-04-desktop>
 <cce5e277-8692-d339-0283-55620c349fcf@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Apr 2023, Julien Grall wrote:
> On 03/04/2023 00:15, Stefano Stabellini wrote:
> > On Fri, 31 Mar 2023, Julien Grall wrote:
> > > Hi Oleksii,
> > > 
> > > I was going to ack the patch but then I spotted something that would want
> > > some
> > > clarification.
> > > 
> > > On 29/03/2023 11:50, Oleksii Kurochko wrote:
> > > > diff --git a/xen/arch/arm/include/asm/bug.h
> > > > b/xen/arch/arm/include/asm/bug.h
> > > > index cacaf014ab..3fb0471a9b 100644
> > > > --- a/xen/arch/arm/include/asm/bug.h
> > > > +++ b/xen/arch/arm/include/asm/bug.h
> > > > @@ -1,6 +1,24 @@
> > > >    #ifndef __ARM_BUG_H__
> > > >    #define __ARM_BUG_H__
> > > >    +/*
> > > > + * Please do not include in the header any header that might
> > > > + * use BUG/ASSERT/etc maros asthey will be defined later after
> > > > + * the return to <xen/bug.h> from the current header:
> > > > + *
> > > > + * <xen/bug.h>:
> > > > + *  ...
> > > > + *   <asm/bug.h>:
> > > > + *     ...
> > > > + *     <any_header_which_uses_BUG/ASSERT/etc macros.h>
> > > > + *     ...
> > > > + *  ...
> > > > + *  #define BUG() ...
> > > > + *  ...
> > > > + *  #define ASSERT() ...
> > > > + *  ...
> > > > + */
> > > > +
> > > >    #include <xen/types.h>
> > > >      #if defined(CONFIG_ARM_32)
> > > > @@ -11,76 +29,7 @@
> > > >    # error "unknown ARM variant"
> > > >    #endif
> > > >    -#define BUG_FRAME_STRUCT
> > > > -
> > > > -struct bug_frame {
> > > > -    signed int loc_disp;    /* Relative address to the bug address */
> > > > -    signed int file_disp;   /* Relative address to the filename */
> > > > -    signed int msg_disp;    /* Relative address to the predicate (for
> > > > ASSERT) */
> > > > -    uint16_t line;          /* Line number */
> > > > -    uint32_t pad0:16;       /* Padding for 8-bytes align */
> > > > -};
> > > > -
> > > > -#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> > > > -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
> > > > -#define bug_line(b) ((b)->line)
> > > > -#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
> > > > -
> > > > -/* Many versions of GCC doesn't support the asm %c parameter which
> > > > would
> > > > - * be preferable to this unpleasantness. We use mergeable string
> > > > - * sections to avoid multiple copies of the string appearing in the
> > > > - * Xen image. BUGFRAME_run_fn needs to be handled separately.
> > > > - */
> > > 
> > > Given this comment ...
> > > 
> > > > -#define BUG_FRAME(type, line, file, has_msg, msg) do {
> > > > \
> > > > -    BUILD_BUG_ON((line) >> 16);
> > > > \
> > > > -    BUILD_BUG_ON((type) >= BUGFRAME_NR);
> > > > \
> > > > -    asm ("1:"BUG_INSTR"\n"
> > > > \
> > > > -         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"
> > > > \
> > > > -         "2:\t.asciz " __stringify(file) "\n"
> > > > \
> > > > -         "3:\n"
> > > > \
> > > > -         ".if " #has_msg "\n"
> > > > \
> > > > -         "\t.asciz " #msg "\n"
> > > > \
> > > > -         ".endif\n"
> > > > \
> > > > -         ".popsection\n"
> > > > \
> > > > -         ".pushsection .bug_frames." __stringify(type) ", \"a\",
> > > > %progbits\n"\
> > > > -         "4:\n"
> > > > \
> > > > -         ".p2align 2\n"
> > > > \
> > > > -         ".long (1b - 4b)\n"
> > > > \
> > > > -         ".long (2b - 4b)\n"
> > > > \
> > > > -         ".long (3b - 4b)\n"
> > > > \
> > > > -         ".hword " __stringify(line) ", 0\n"
> > > > \
> > > > -         ".popsection");
> > > > \
> > > > -} while (0)
> > > > -
> > > > -/*
> > > > - * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set
> > > > the
> > > > - * flag but instead rely on the default value from the compiler). So
> > > > the
> > > > - * easiest way to implement run_in_exception_handler() is to pass the
> > > > to
> > > > - * be called function in a fixed register.
> > > > - */
> > > > -#define  run_in_exception_handler(fn) do {
> > > > \
> > > > -    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"
> > > > \
> > > > -         "1:"BUG_INSTR"\n"
> > > > \
> > > > -         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","
> > > > \
> > > > -         "             \"a\", %%progbits\n"
> > > > \
> > > > -         "2:\n"
> > > > \
> > > > -         ".p2align 2\n"
> > > > \
> > > > -         ".long (1b - 2b)\n"
> > > > \
> > > > -         ".long 0, 0, 0\n"
> > > > \
> > > > -         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );
> > > > \
> > > > -} while (0)
> > > > -
> > > > -#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
> > > > -
> > > > -#define BUG() do {                                              \
> > > > -    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
> > > > -    unreachable();                                              \
> > > > -} while (0)
> > > > -
> > > > -#define assert_failed(msg) do {                                 \
> > > > -    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
> > > > -    unreachable();                                              \
> > > > -} while (0)
> > > > +#define BUG_ASM_CONST   "c"
> > > 
> > > ... you should explain in the commit message why this is needed and the
> > > problem described above is not a problem anymore.
> > > 
> > > For instance, I managed to build it without 'c' on arm64 [1]. But it does
> > > break on arm32 [2]. I know that Arm is also where '%c' was an issue.
> > > 
> > > Skimming through linux, the reason seems to be that GCC may add '#' when
> > > it
> > > should not. That said, I haven't look at the impact on the generic
> > > implementation. Neither I looked at which version may be affected (the
> > > original message was from 2011).
> > > 
> > > However, without an explanation, I am afraid this can't go in because I am
> > > worry we may break some users (thankfully that might just be a compilation
> > > issues rather than weird behavior).
> > > 
> > > Bertrand, Stefano, do you know if this is still an issue?
> > 
> > I don't know, but I confirm your observation.
> > 
> > In my system, both ARM64 and ARM32 compile without problems with "c".
> > Without "c', only ARM64 compiles without problems, while ARM32 breaks.
> > 
> > My ARM32 compiler is:
> > arm-linux-gnueabihf-gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
> > 
> > Additing a meaningful explanation to the commit message might be
> > difficult in this case.
> 
> Agree. One would need to look at the compiler code to confirm. We should at
> least acknowledge the change in the commit message and also...
> 
> > 
> > Maybe instead we could run a few tests with different versions of arm64
> > and arm32 gcc to check that everything still works? If everything checks
> > out, given that the issue has been unchanged for 10+ years we could just
> > keep "c" and move forward with it?
> 
> ... confirm that we are still able to compile with GCC 4.9 (arm32) and GCC 5.1
> (arm64).
> 
> Do we have those compiler in the CI? (I couldn't easily confirm from the
> automation directory).

In the CI we have:
- arm64v8/alpine:3.12, gcc 9.3.0
- arm64v8/debian:unstable, gcc 12.2.0
- arm64v8/debian:unstable cross arm32, gcc 12.2.0
- yocto, not sure exactly but it is going to be 9.x or newer

