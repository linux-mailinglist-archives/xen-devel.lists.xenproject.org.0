Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D8583410
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 22:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376465.609248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGncT-0008A2-1j; Wed, 27 Jul 2022 20:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376465.609248; Wed, 27 Jul 2022 20:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGncS-000875-VD; Wed, 27 Jul 2022 20:27:00 +0000
Received: by outflank-mailman (input) for mailman id 376465;
 Wed, 27 Jul 2022 20:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oGncR-00086z-MN
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 20:26:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 768fdd20-0dea-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 22:26:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87349B82282;
 Wed, 27 Jul 2022 20:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477E2C433C1;
 Wed, 27 Jul 2022 20:26:55 +0000 (UTC)
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
X-Inumbo-ID: 768fdd20-0dea-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658953616;
	bh=TLiDUjVEo7v3zFvmH/RZk624bWJTIvZF5/mUW78k9tA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jbSU1NASspwAIl6lH81vVaGGmRpl0tjIg7FCbesrJtv6IbMQooY/XuKAn7RIJwcCv
	 FYcRUZkO4bK6A11y5a6Efdj4h3eWI5gMC37dtBkkk4CbEG3/vvi89SQJvH4+qMPfSt
	 EvYaHtk6naFGnVRscGtXpG0/KzuySOdZzi4pRv0THZNMJI1IexwDUt3HvX0Do2tP9i
	 iYzzB3eecFflxQ1iIyiKR1HwKxJzZGeOnufQruvgRzcdCja4dgwNTx88pAkaLoWB/i
	 JKMt8O2N4bRaBAkXJG03LV641AeuAHhmlArCPbAEBGY3+1vxs40+yHfrqJpxbP7ruR
	 7dl1m1S10f6ug==
Date: Wed, 27 Jul 2022 13:26:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7
 violation
In-Reply-To: <649c2902-0d36-bfc7-43a8-98e6c38b6ecd@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207271325210.4648@ubuntu-linux-20-04-desktop>
References: <20220705210218.483854-1-burzalodowa@gmail.com> <20220705210218.483854-4-burzalodowa@gmail.com> <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com> <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com> <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com> <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com> <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com> <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com> <8522a9aa-e7f5-9b8a-5a8f-4c6d1403317b@gmail.com>
 <alpine.DEB.2.22.394.2207251727470.4648@ubuntu-linux-20-04-desktop> <981e2fb9-6f99-2113-86ab-f3da860b74b9@suse.com> <alpine.DEB.2.22.394.2207261704400.4648@ubuntu-linux-20-04-desktop> <649c2902-0d36-bfc7-43a8-98e6c38b6ecd@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1700696390-1658953582=:4648"
Content-ID: <alpine.DEB.2.22.394.2207271326260.4648@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1700696390-1658953582=:4648
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2207271326261.4648@ubuntu-linux-20-04-desktop>

On Wed, 27 Jul 2022, Xenia Ragiadakou wrote:
> On 7/27/22 03:10, Stefano Stabellini wrote:
> > On Tue, 26 Jul 2022, Jan Beulich wrote:
> > > On 26.07.2022 02:33, Stefano Stabellini wrote:
> > > > On Mon, 25 Jul 2022, Xenia Ragiadakou wrote:
> > > > > On 7/25/22 09:32, Jan Beulich wrote:
> > > > > > On 24.07.2022 19:20, Xenia Ragiadakou wrote:
> > > > > > > On 7/7/22 10:55, Jan Beulich wrote:
> > > > > > > > On 07.07.2022 09:27, Xenia Ragiadakou wrote:
> > > > > > > > > On 7/6/22 11:51, Jan Beulich wrote:
> > > > > > > > > > On 06.07.2022 10:43, Xenia Ragiadakou wrote:
> > > > > > > > > > > On 7/6/22 10:10, Jan Beulich wrote:
> > > > > > > > > > > > On 05.07.2022 23:02, Xenia Ragiadakou wrote:
> > > > > > > > > > > > > The function idle_loop() is referenced only in
> > > > > > > > > > > > > domain.c.
> > > > > > > > > > > > > Change its linkage from external to internal by adding
> > > > > > > > > > > > > the
> > > > > > > > > > > > > storage-class
> > > > > > > > > > > > > specifier static to its definitions.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Since idle_loop() is referenced only in inline
> > > > > > > > > > > > > assembly, add
> > > > > > > > > > > > > the 'used'
> > > > > > > > > > > > > attribute to suppress unused-function compiler
> > > > > > > > > > > > > warning.
> > > > > > > > > > > > 
> > > > > > > > > > > > While I see that Julien has already acked the patch, I'd
> > > > > > > > > > > > like to
> > > > > > > > > > > > point
> > > > > > > > > > > > out that using __used here is somewhat bogus. Imo the
> > > > > > > > > > > > better
> > > > > > > > > > > > approach
> > > > > > > > > > > > is to properly make visible to the compiler that the
> > > > > > > > > > > > symbol is
> > > > > > > > > > > > used by
> > > > > > > > > > > > the asm(), by adding a fake(?) input.
> > > > > > > > > > > 
> > > > > > > > > > > I 'm afraid I do not understand what do you mean by
> > > > > > > > > > > "adding a
> > > > > > > > > > > fake(?)
> > > > > > > > > > > input". Can you please elaborate a little on your
> > > > > > > > > > > suggestion?
> > > > > > > > > > 
> > > > > > > > > > Once the asm() in question takes the function as an input,
> > > > > > > > > > the
> > > > > > > > > > compiler
> > > > > > > > > > will know that the function has a user (unless, of course,
> > > > > > > > > > it finds
> > > > > > > > > > a
> > > > > > > > > > way to elide the asm() itself). The "fake(?)" was because
> > > > > > > > > > I'm not
> > > > > > > > > > deeply
> > > > > > > > > > enough into Arm inline assembly to know whether the input
> > > > > > > > > > could then
> > > > > > > > > > also be used as an instruction operand (which imo would be
> > > > > > > > > > preferable) -
> > > > > > > > > > if it can't (e.g. because there's no suitable constraint or
> > > > > > > > > > operand
> > > > > > > > > > modifier), it still can be an input just to inform the
> > > > > > > > > > compiler.
> > > > > > > > > 
> > > > > > > > > According to the following statement, your approach is the
> > > > > > > > > recommended
> > > > > > > > > one:
> > > > > > > > > "To prevent the compiler from removing global data or
> > > > > > > > > functions which
> > > > > > > > > are referenced from inline assembly statements, you can:
> > > > > > > > > -use __attribute__((used)) with the global data or functions.
> > > > > > > > > -pass the reference to global data or functions as operands to
> > > > > > > > > inline
> > > > > > > > > assembly statements.
> > > > > > > > > Arm recommends passing the reference to global data or
> > > > > > > > > functions as
> > > > > > > > > operands to inline assembly statements so that if the final
> > > > > > > > > image does
> > > > > > > > > not require the inline assembly statements and the referenced
> > > > > > > > > global
> > > > > > > > > data or function, then they can be removed."
> > > > > > > > > 
> > > > > > > > > IIUC, you are suggesting to change
> > > > > > > > > asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) :
> > > > > > > > > "memory" )
> > > > > > > > > into
> > > > > > > > > asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) :
> > > > > > > > > "memory"
> > > > > > > > > );
> > > > > > > > 
> > > > > > > > Yes, except that I can't judge about the "S" constraint.
> > > > > > > > 
> > > > > > > 
> > > > > > > This constraint does not work for arm32. Any other thoughts?
> > > > > > > 
> > > > > > > Another way, as Jan suggested, is to pass the function as a 'fake'
> > > > > > > (unused) input.
> > > > > > > I 'm suspecting something like the following could work
> > > > > > > asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) :
> > > > > > > "memory")
> > > > > > > What do you think?
> > > > > > 
> > > > > > Well, yes, X should always be a fallback option. But I said already
> > > > > > when
> > > > > > you suggested S that I can't judge about its use, so I guess I'm the
> > > > > > wrong one to ask. Even more so that you only say "does not work",
> > > > > > without
> > > > > > any details ...
> > > > > > 
> > > > > 
> > > > > The question is addressed to anyone familiar with arm inline assembly.
> > > > > I added the arm maintainers as primary recipients to this email to
> > > > > make this
> > > > > perfectly clear.
> > > > > 
> > > > > When cross-compiling Xen on x86 for arm32 with
> > > > > asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory"
> > > > > );
> > > > > compilation fails with the error: impossible constraint in ‘asm'
> > > > 
> > > > Unfortunately looking at the GCC manual pages [1], it doesn't seem to be
> > > > possible. The problem is that the definition of "S" changes between
> > > > aarch64 and arm (the 32-bit version).
> > > > 
> > > > For aarch64:
> > > > 
> > > > S   An absolute symbolic address or a label reference
> > > > 
> > > > This is what we want. For arm instead:
> > > > 
> > > > S   A symbol in the text segment of the current file
> > > > 
> > > > This is not useful for what we need to do here. As far as I can tell,
> > > > there is no other way in GCC assembly inline for arm to do this.
> > > > 
> > > > So we have 2 choices: we use the __used keyword as Xenia did in this
> > > > patch. Or we move the implementation of switch_stack_and_jump in
> > > > assembly. I attempted a prototype of the latter to see how it would come
> > > > out, see below.
> > > > 
> > > > I don't like it very much. I prefer the version with __used that Xenia
> > > > had in this patch. But I am OK either way.
> > > 
> > > You forgot the imo better intermediate option of using the "X" constraint.
> > 
> > I couldn't get "X" to compile in any way (not even for arm64). Do you
> > have a concrete example that you think should work using "X" as
> > constraint?
> 
> I proposed the X constraint for the case that the function is used as a fake
> (unused) input operand to the inline asm.
> For instance, in the example below, the function is listed in the input
> operands but there is not corresponding reference to it.
> 
> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" );


Also replying to Jan, yes, this doesn't build for me, not even for
arm64. The error is below.


arch/arm/domain.c: In function ‘continue_new_vcpu’:
arch/arm/domain.c:345:30: error: ‘return_to_new_vcpu32’ undeclared (first use in this function)
  345 |         reset_stack_and_jump(return_to_new_vcpu32);
      |                              ^~~~~~~~~~~~~~~~~~~~
./arch/arm/include/asm/current.h:48:65: note: in definition of macro ‘switch_stack_and_jump’
   48 |     asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
      |                                                                 ^~
arch/arm/domain.c:345:9: note: in expansion of macro ‘reset_stack_and_jump’
  345 |         reset_stack_and_jump(return_to_new_vcpu32);
      |         ^~~~~~~~~~~~~~~~~~~~
arch/arm/domain.c:345:30: note: each undeclared identifier is reported only once for each function it appears in
  345 |         reset_stack_and_jump(return_to_new_vcpu32);
      |                              ^~~~~~~~~~~~~~~~~~~~
./arch/arm/include/asm/current.h:48:65: note: in definition of macro ‘switch_stack_and_jump’
   48 |     asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
      |                                                                 ^~
arch/arm/domain.c:345:9: note: in expansion of macro ‘reset_stack_and_jump’
  345 |         reset_stack_and_jump(return_to_new_vcpu32);
      |         ^~~~~~~~~~~~~~~~~~~~
  CC      arch/arm/domain_build.o
arch/arm/domain.c:348:30: error: ‘return_to_new_vcpu64’ undeclared (first use in this function)
  348 |         reset_stack_and_jump(return_to_new_vcpu64);
      |                              ^~~~~~~~~~~~~~~~~~~~
./arch/arm/include/asm/current.h:48:65: note: in definition of macro ‘switch_stack_and_jump’
   48 |     asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
      |                                                                 ^~
arch/arm/domain.c:348:9: note: in expansion of macro ‘reset_stack_and_jump’
  348 |         reset_stack_and_jump(return_to_new_vcpu64);
      |         ^~~~~~~~~~~~~~~~~~~~
make[2]: *** [Rules.mk:246: arch/arm/domain.o] Error 1
--8323329-1700696390-1658953582=:4648--

