Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075D5808C2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 02:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374895.607085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG8W8-00015E-Fn; Tue, 26 Jul 2022 00:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374895.607085; Tue, 26 Jul 2022 00:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG8W8-00012I-CH; Tue, 26 Jul 2022 00:33:44 +0000
Received: by outflank-mailman (input) for mailman id 374895;
 Tue, 26 Jul 2022 00:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xban=X7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oG8W7-00012C-5r
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 00:33:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98971548-0c7a-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 02:33:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D58D61466;
 Tue, 26 Jul 2022 00:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9845DC341C6;
 Tue, 26 Jul 2022 00:33:38 +0000 (UTC)
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
X-Inumbo-ID: 98971548-0c7a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658795619;
	bh=tYxghph7QJqyKPD2IEK+sAJ6pT0jxePQEvrZQwQg404=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YqoXBWBrtLydlBC4mTD/3xS/9PTDbB3RCjaIyGd4M06zFIGLZuvxw0R4jUHFK1y5Q
	 ZLPGSVaiRr1hIEzSnYTiuzpas3iMoOxiAmDbFPE5Zk+T0or477cfFBD2fCccjXcwSg
	 FGVG7p0a6SNK860Xtbf3fkOZUBzwMapz0yli+1AL3wyRFg3B3LlR9PhAi4jiQPzUxD
	 kZWx+iXADvmchDFDNWxfGdojHo52LYJdvuYgG1OqbfAbXMwC7/QfRURPt1aSteTDsH
	 oqFK2syUfbZw+3UH8iOetc0QSQMmr8d/HMENHDLWI/97/Ek5hkMBpvMMWWxzPf7MvK
	 WAWalsjViSAuw==
Date: Mon, 25 Jul 2022 17:33:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7
 violation
In-Reply-To: <8522a9aa-e7f5-9b8a-5a8f-4c6d1403317b@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207251727470.4648@ubuntu-linux-20-04-desktop>
References: <20220705210218.483854-1-burzalodowa@gmail.com> <20220705210218.483854-4-burzalodowa@gmail.com> <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com> <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com> <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com> <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com> <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com> <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com> <8522a9aa-e7f5-9b8a-5a8f-4c6d1403317b@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1515025650-1658795618=:4648"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1515025650-1658795618=:4648
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 25 Jul 2022, Xenia Ragiadakou wrote:
> On 7/25/22 09:32, Jan Beulich wrote:
> > On 24.07.2022 19:20, Xenia Ragiadakou wrote:
> > > On 7/7/22 10:55, Jan Beulich wrote:
> > > > On 07.07.2022 09:27, Xenia Ragiadakou wrote:
> > > > > On 7/6/22 11:51, Jan Beulich wrote:
> > > > > > On 06.07.2022 10:43, Xenia Ragiadakou wrote:
> > > > > > > On 7/6/22 10:10, Jan Beulich wrote:
> > > > > > > > On 05.07.2022 23:02, Xenia Ragiadakou wrote:
> > > > > > > > > The function idle_loop() is referenced only in domain.c.
> > > > > > > > > Change its linkage from external to internal by adding the
> > > > > > > > > storage-class
> > > > > > > > > specifier static to its definitions.
> > > > > > > > > 
> > > > > > > > > Since idle_loop() is referenced only in inline assembly, add
> > > > > > > > > the 'used'
> > > > > > > > > attribute to suppress unused-function compiler warning.
> > > > > > > > 
> > > > > > > > While I see that Julien has already acked the patch, I'd like to
> > > > > > > > point
> > > > > > > > out that using __used here is somewhat bogus. Imo the better
> > > > > > > > approach
> > > > > > > > is to properly make visible to the compiler that the symbol is
> > > > > > > > used by
> > > > > > > > the asm(), by adding a fake(?) input.
> > > > > > > 
> > > > > > > I 'm afraid I do not understand what do you mean by "adding a
> > > > > > > fake(?)
> > > > > > > input". Can you please elaborate a little on your suggestion?
> > > > > > 
> > > > > > Once the asm() in question takes the function as an input, the
> > > > > > compiler
> > > > > > will know that the function has a user (unless, of course, it finds
> > > > > > a
> > > > > > way to elide the asm() itself). The "fake(?)" was because I'm not
> > > > > > deeply
> > > > > > enough into Arm inline assembly to know whether the input could then
> > > > > > also be used as an instruction operand (which imo would be
> > > > > > preferable) -
> > > > > > if it can't (e.g. because there's no suitable constraint or operand
> > > > > > modifier), it still can be an input just to inform the compiler.
> > > > > 
> > > > > According to the following statement, your approach is the recommended
> > > > > one:
> > > > > "To prevent the compiler from removing global data or functions which
> > > > > are referenced from inline assembly statements, you can:
> > > > > -use __attribute__((used)) with the global data or functions.
> > > > > -pass the reference to global data or functions as operands to inline
> > > > > assembly statements.
> > > > > Arm recommends passing the reference to global data or functions as
> > > > > operands to inline assembly statements so that if the final image does
> > > > > not require the inline assembly statements and the referenced global
> > > > > data or function, then they can be removed."
> > > > > 
> > > > > IIUC, you are suggesting to change
> > > > > asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
> > > > > into
> > > > > asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory"
> > > > > );
> > > > 
> > > > Yes, except that I can't judge about the "S" constraint.
> > > > 
> > > 
> > > This constraint does not work for arm32. Any other thoughts?
> > > 
> > > Another way, as Jan suggested, is to pass the function as a 'fake'
> > > (unused) input.
> > > I 'm suspecting something like the following could work
> > > asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) :
> > > "memory")
> > > What do you think?
> > 
> > Well, yes, X should always be a fallback option. But I said already when
> > you suggested S that I can't judge about its use, so I guess I'm the
> > wrong one to ask. Even more so that you only say "does not work", without
> > any details ...
> > 
> 
> The question is addressed to anyone familiar with arm inline assembly.
> I added the arm maintainers as primary recipients to this email to make this
> perfectly clear.
> 
> When cross-compiling Xen on x86 for arm32 with
> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );
> compilation fails with the error: impossible constraint in ‘asm'

Unfortunately looking at the GCC manual pages [1], it doesn't seem to be
possible. The problem is that the definition of "S" changes between
aarch64 and arm (the 32-bit version).

For aarch64:

S   An absolute symbolic address or a label reference

This is what we want. For arm instead:

S   A symbol in the text segment of the current file

This is not useful for what we need to do here. As far as I can tell,
there is no other way in GCC assembly inline for arm to do this.

So we have 2 choices: we use the __used keyword as Xenia did in this
patch. Or we move the implementation of switch_stack_and_jump in
assembly. I attempted a prototype of the latter to see how it would come
out, see below.

I don't like it very much. I prefer the version with __used that Xenia
had in this patch. But I am OK either way.



diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
index 38826142ad..4d28f7e9f7 100644
--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -442,6 +442,10 @@ ENTRY(__context_switch)
         add     r4, r1, #VCPU_arch_saved_context
         ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and return */
 
+ENTRY(__switch_stack_and_jump)
+        mov sp, r0
+        bx r1
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 95f1a92684..5d5d713f80 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -618,6 +618,10 @@ ENTRY(__context_switch)
         mov     sp, x9
         ret
 
+ENTRY(__switch_stack_and_jump)
+        mov sp, x0
+        br x1
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
index 73e81458e5..7696440a57 100644
--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -44,8 +44,12 @@ static inline struct cpu_info *get_cpu_info(void)
 
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
+void return_to_new_vcpu32(void);
+void return_to_new_vcpu64(void);
+void __switch_stack_and_jump(void *p, void *f);
+
 #define switch_stack_and_jump(stack, fn) do {                           \
-    asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" ); \
+    __switch_stack_and_jump(stack, fn);                                 \
     unreachable();                                                      \
 } while ( false )
 


[1] https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html
--8323329-1515025650-1658795618=:4648--

