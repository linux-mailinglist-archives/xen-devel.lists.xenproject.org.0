Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C3AFBDE2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035858.1408245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtnO-0005m2-51; Mon, 07 Jul 2025 21:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035858.1408245; Mon, 07 Jul 2025 21:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtnO-0005kY-2N; Mon, 07 Jul 2025 21:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1035858;
 Mon, 07 Jul 2025 21:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOF2=ZU=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYtnM-0005kP-9t
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:54:41 +0000
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net
 [46.105.60.232]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa655394-5b7c-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 23:54:38 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.54.103])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4bbdLk0lqlz5xL9
 for <xen-devel@lists.xenproject.org>; Mon,  7 Jul 2025 21:54:38 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-j66bp (unknown [10.110.168.250])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1A24DC02C4;
 Mon,  7 Jul 2025 21:54:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-j66bp with ESMTPSA
 id 7BfiNxxCbGiV1wsAUTtfiA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 07 Jul 2025 21:54:37 +0000
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
X-Inumbo-ID: fa655394-5b7c-11f0-a316-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-98R002fd75d190-758f-44a9-8018-fd1b0d866026,
                    C93F419E6CD780C6B50CBD56D1356C63B9E8D154) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 8 Jul 2025 00:54:28 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 03/22] x86/boot: add MLE header and Secure Launch
 entry point
Message-ID: <aGxCFFEU9BzLx96O@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <916c87847457552583f1defb1aced37ea3ff58df.1748611041.git.sergii.dmytruk@3mdeb.com>
 <d9ab3803-c7e0-4a67-93e2-4f32bf9b3ad5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9ab3803-c7e0-4a67-93e2-4f32bf9b3ad5@suse.com>
X-Ovh-Tracer-Id: 4764245459141178457
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepudfffeevveefhfdvhffhlefgveejtdevtddugffgjeffhfduudefveettefgtdejnecuffhomhgrihhnpehhvggrugdrshgsnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehhedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=udyNf99jBB+RS0+TB9zIhkt1Y+ie3CKYn74tsZZ5QGE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751925278; v=1;
 b=aO/mFvR5wiWe4LB5G1ocJ6rxhVtiYRgIbAqeRJW9VECru65QBS+1b6UM6nJCZ/ApP807R9nM
 akHOn6Q7D2zaTIgynE2l+KLimQCdj6xuurHBbzxWc4NEALjpztfwWwkvhfYaIyWb/DjKzb+KBhQ
 S6GscnYOQU4W9gwkPn6Tk91QqbD27Ph/AyLSg+sWhawqMVG7Zr82NOEW3fobutCsX53aEsk7VwH
 /MayZuMHOQx1d+kVUv0rU9rjV+gY7U84o58urqjDQ8ySBEMPnJRDrtMAId0nMtyXpEp2qMVH3Jy
 c+4Q+SM/eFIUrxyMNUtoHJtUQboM1QNWS5g3YKVTxl4LA==

On Thu, Jul 03, 2025 at 12:25:27PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > From: Kacper Stojek <kacper.stojek@3mdeb.com>
> >
> > Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
> > Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> > Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
>
> Such a change can hardly come without any description. As just one aspect,
> neither here nor ...
>
> > --- a/docs/hypervisor-guide/x86/how-xen-boots.rst
> > +++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
> > @@ -55,6 +55,11 @@ If ``CONFIG_PVH_GUEST`` was selected at build time, an Elf note is included
> >  which indicates the ability to use the PVH boot protocol, and registers
> >  ``__pvh_start`` as the entrypoint, entered in 32bit mode.
> >
> > +A combination of Multiboot 2 and MLE headers is used to implement DRTM for
> > +legacy (BIOS) boot. The separate entry point is used mainly to differentiate
>
> ... here the MLE acronym is being deciphered. Same for DRTM here. There's
> also no reference anywhere as to some kind of spec (except in the cover
> letter, but that won't land in the tree).

Will add more details.

> > +from other kinds of boots. It moves a magic number to EAX before jumping into
> > +common startup code.
> > +
> >
> >  xen.gz
> >  ~~~~~~
>
> Any reason the single blank line is converted to a double one? Generally, in
> particular for patch context to be more meaningful, we'd prefer to not have
> double blank lines. In documentation they _sometimes_ may be warranted.

Take a closer look, the patch just preserves double blank lines which
are used consistently to separate sections within this file.

> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -4,6 +4,7 @@
> >  #include <public/xen.h>
> >  #include <asm/asm_defns.h>
> >  #include <asm/fixmap.h>
> > +#include <asm/intel-txt.h>
> >  #include <asm/page.h>
> >  #include <asm/processor.h>
> >  #include <asm/msr-index.h>
> > @@ -126,6 +127,25 @@ multiboot2_header:
> >          .size multiboot2_header, . - multiboot2_header
> >          .type multiboot2_header, @object
> >
> > +        .balign 16
> > +mle_header:
> > +        .long   0x9082ac5a  /* UUID0 */
> > +        .long   0x74a7476f  /* UUID1 */
> > +        .long   0xa2555c0f  /* UUID2 */
> > +        .long   0x42b651cb  /* UUID3 */
> > +        .long   0x00000034  /* MLE header size */
>
> Better use an expression (difference of two labels)?

Won't hurt.

> > +        .long   0x00020002  /* MLE version 2.2 */
> > +        .long   (slaunch_stub_entry - start)  /* Linear entry point of MLE (SINIT virt. address) */
> > +        .long   0x00000000  /* First valid page of MLE */
> > +        .long   0x00000000  /* Offset within binary of first byte of MLE */
> > +        .long   (_end - start)  /* Offset within binary of last byte + 1 of MLE */
>
> Is the data here describing xen.gz or (rather) xen.efi? In the latter case,
> does data past _end (in particular the .reloc section) not matter here?

Eventually, both.  EFI case deals with loaded image which, I believe,
should have all relocations applied at the time of measurement.

> > +        .long   0x00000723  /* Bit vector of MLE-supported capabilities */
> > +        .long   0x00000000  /* Starting linear address of command line (unused) */
> > +        .long   0x00000000  /* Ending linear address of command line (unused) */
> > +
> > +        .size mle_header, .-mle_header
> > +        .type mle_header, @object
>
> Please use what xen/linkage.h provides now.

OK.

> However, the entire additions here and below likely want to go inside some
> #ifdef CONFIG_xyz, just like additions in subsequent patches. Which obviously
> would require a suitable Kconfig option to be introduced up front.

Will add CONFIG_SLAUNCH.

> > @@ -332,6 +352,38 @@ cs32_switch:
> >          /* Jump to earlier loaded address. */
> >          jmp     *%edi
> >
> > +        /*
> > +         * Entry point for TrenchBoot Secure Launch on Intel TXT platforms.
> > +         *
> > +         * CPU is in 32b protected mode with paging disabled. On entry:
> > +         * - %ebx = %eip = MLE entry point,
> > +         * - stack pointer is undefined,
> > +         * - CS is flat 4GB code segment,
> > +         * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
> > +         *   would make it impossible to initialize GDTR, because GDT base must
> > +         *   be relocated in the descriptor, which requires write access that
> > +         *   CS doesn't provide. Instead we have to assume that DS is set by
> > +         *   SINIT ACM as flat 4GB data segment.
>
> Do you really _have to_? At least as plausibly SS might be properly set up,
> while DS might not be.

"have to" is referring to the fact that making this assumption is forced
on the implementation.  LGDT instruction uses DS in the code below,
hence it's DS.

> > +         * Additional restrictions:
> > +         * - some MSRs are partially cleared, among them IA32_MISC_ENABLE, so
> > +         *   some capabilities might be reported as disabled even if they are
> > +         *   supported by CPU
> > +         * - interrupts (including NMIs and SMIs) are disabled and must be
> > +         *   enabled later
> > +         * - trying to enter real mode results in reset
> > +         * - APs must be brought up by MONITOR or GETSEC[WAKEUP], depending on
> > +         *   which is supported by a given SINIT ACM
>
> I'm curious: How would MONITOR allow to bring up an AP? That's not even a
> memory access.

See patch #15.  BSP sets up TXT.MLE.JOIN and writes to an address
monitored by APs, this causes APs to become part of dynamic launch by
continuing execution at TXT-specific entry point.  It's more of a
redirection rather than waking up, just another case of bad terminology.

> > +         */
> > +slaunch_stub_entry:
> > +        /* Calculate the load base address. */
> > +        mov     %ebx, %esi
> > +        sub     $sym_offs(slaunch_stub_entry), %esi
> > +
> > +        /* Mark Secure Launch boot protocol and jump to common entry. */
> > +        mov     $SLAUNCH_BOOTLOADER_MAGIC, %eax
>
> While I understand you can't add real handling of this case just yet, wouldn't
> it be better to at least cover the case by checking for this magic later, and
> in that case enter, say, an infinite loop? You don't want to give the wrong
> impression of this path functioning, do you?
>
> Jan

Good point, I'll add an infinite loop.

Regards

