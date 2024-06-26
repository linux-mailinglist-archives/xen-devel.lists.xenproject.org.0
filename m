Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F59182B4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748913.1156873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSqw-0000qe-Dr; Wed, 26 Jun 2024 13:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748913.1156873; Wed, 26 Jun 2024 13:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSqw-0000no-BG; Wed, 26 Jun 2024 13:38:26 +0000
Received: by outflank-mailman (input) for mailman id 748913;
 Wed, 26 Jun 2024 13:38:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53QU=N4=bounce.vates.tech=bounce-md_30504962.667c19cb.v1-e4b15c1a44e74e1db5c63fec0713e397@srs-se1.protection.inumbo.net>)
 id 1sMSqu-0000ni-MF
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:38:24 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5acf1f75-33c1-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:38:22 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W8N7b4prMzDRHyBB
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 13:38:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e4b15c1a44e74e1db5c63fec0713e397; Wed, 26 Jun 2024 13:38:19 +0000
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
X-Inumbo-ID: 5acf1f75-33c1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719409099; x=1719669599;
	bh=4FcE7J3ihYLd+CzOxH5Il3z7tA9oho9OfuXYk/DRLv8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Iwol2YwzYPcT7aIG29tj5xuqDOZ4Wh0EljjHmHqeMycGqK+bWh/7rP22JVjGH3xuv
	 p4v0dpw0ilhU0UkjAjf4NC8XRrkZqRCTZAVVCVEFA/6G5SVw0wAwawbG+WgIIJ0s+7
	 +y4o8A2L4vkxZIjpF/EZsfR75xZ0kWimgtWjiL2RA2r5Vl/S7vajauLDMODGZNgyBA
	 0stCEw/0NPUhJdLUNupNN2yeDWGL+sAGY2+rXcgkPZ+e6gEnJfy5efxc/7FfrFABCj
	 1Fxt4Hpmf2aJSzIhMHSHsf0hF9duraDXk6/SxeiSrNWZINPEIVX4jHt12+YZfvYAHE
	 uI4Xj++nOc7aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719409099; x=1719669599; i=anthony.perard@vates.tech;
	bh=4FcE7J3ihYLd+CzOxH5Il3z7tA9oho9OfuXYk/DRLv8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Y9+LpTszkCtKXxfLEwQEGjzxCMrAIYBL421mt99gteUtyn3Lq/gvTHa4H/R+qeHYT
	 DIpu21Sv6fnbDVZFPYB6+ASY02JJb/nyHNvemM/b1y8Bm6uBMEZe0+5+E4DH4zmX8c
	 NOe2qq2brFS3wCy7u8nFHMp3bHnnALxO5Y1koHZ9E1EFD8arW5HbJTpd7Q+C4fmuwQ
	 OtV0KgNEB0s+ewKE2Tmrcp3pmN12d0+8TGqWj2Oxi8y/F90K1OytTut7RgA0wkEfLG
	 NUcrTB5sQSM4poOCVEBv3oynw8yB5/3g/x1SlL87icT8FRopY8KQQJbpIOlEaRzqE0
	 JGBMx9nDMS/vg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v3=2005/16]=20xen/x86:=20address=20violations=20of=20MISRA=20C:2012=20Directive=204.10?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719409098033
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-Id: <ZnwZycQ3mU21cSpd@l14>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com> <dce6c44d-94b7-43bd-858a-9337336a79cf@suse.com> <ef623bad297d016438b35bedc80f091d@bugseng.com> <ec92611e-6762-4b6c-af3e-999b748d1f1b@suse.com> <797b00049612507d273facc581b2c2c5@bugseng.com> <a5009c3e-cba6-4737-aaff-c3b79a11169c@suse.com> <e3ae670923fd061986e27b3f95833b88@bugseng.com> <0c88d86e-f226-4225-b723-a6662fcd5bef@suse.com>
In-Reply-To: <0c88d86e-f226-4225-b723-a6662fcd5bef@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e4b15c1a44e74e1db5c63fec0713e397?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240626:md
Date: Wed, 26 Jun 2024 13:38:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jun 26, 2024 at 12:31:42PM +0200, Jan Beulich wrote:
> On 26.06.2024 12:25, Nicola Vetrini wrote:
> > On 2024-06-26 11:26, Jan Beulich wrote:
> >> On 26.06.2024 11:20, Nicola Vetrini wrote:
> >>> On 2024-06-26 11:06, Jan Beulich wrote:
> >>>> On 25.06.2024 21:31, Nicola Vetrini wrote:
> >>>>> On 2024-03-12 09:16, Jan Beulich wrote:
> >>>>>> On 11.03.2024 09:59, Simone Ballarin wrote:
> >>>>>>> --- a/xen/arch/x86/Makefile
> >>>>>>> +++ b/xen/arch/x86/Makefile
> >>>>>>> @@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
> >>>>>>>  $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i
> >>>>>>> $(src)/Makefile
> >>>>>>>  	$(call filechk,asm-macros.h)
> >>>>>>>
> >>>>>>> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
> >>>>>>
> >>>>>> This wants to use :=, I think - there's no reason to invoke the 
> >>>>>> shell
> >>>>>> ...
> >>>>>
> >>>>> I agree on this
> >>>>>
> >>>>>>
> >>>>>>>  define filechk_asm-macros.h
> >>>>>>> +    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
> >>>>>>> +    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
> >>>>>>>      echo '#if 0'; \
> >>>>>>>      echo '.if 0'; \
> >>>>>>>      echo '#endif'; \
> >>>>>>> -    echo '#ifndef __ASM_MACROS_H__'; \
> >>>>>>> -    echo '#define __ASM_MACROS_H__'; \
> >>>>>>>      echo 'asm ( ".include \"$@\"" );'; \
> >>>>>>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
> >>>>>>>      echo '#if 0'; \
> >>>>>>>      echo '.endif'; \
> >>>>>>>      cat $<; \
> >>>>>>> -    echo '#endif'
> >>>>>>> +    echo '#endif'; \
> >>>>>>> +    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
> >>>>>>>  endef
> >>>>>>
> >>>>>> ... three times while expanding this macro. Alternatively (to avoid
> >>>>>> an unnecessary shell invocation when this macro is never expanded 
> >>>>>> at
> >>>>>> all) a shell variable inside the "define" above would want
> >>>>>> introducing.
> >>>>>> Whether this 2nd approach is better depends on whether we 
> >>>>>> anticipate
> >>>>>> further uses of ARCHDIR.
> >>>>>
> >>>>> However here I'm not entirely sure about the meaning of this latter
> >>>>> proposal.
> >>>>> My proposal is the following:
> >>>>>
> >>>>> ARCHDIR := $(shell echo $(SRCARCH) | tr a-z A-Z)
> >>>>>
> >>>>> in a suitably generic place (such as Kbuild.include or maybe
> >>>>> xen/Makefile) as you suggested in subsequent patches that reused 
> >>>>> this
> >>>>> pattern.
> >>>>
> >>>> If $(ARCHDIR) is going to be used elsewhere, then what you suggest is
> >>>> fine.
> >>>> My "whether" in the earlier reply specifically left open for
> >>>> clarification
> >>>> what the intentions with the variable are. The alternative I had
> >>>> described
> >>>> makes sense only when $(ARCHDIR) would only ever be used inside the
> >>>> filechk_asm-macros.h macro.
> >>>
> >>> Yes, the intention is to reuse $(ARCHDIR) in the formation of other
> >>> places, as you can tell from the fact that subsequent patches 
> >>> replicate
> >>> the same pattern. This is going to save some duplication.
> >>> The only matter left then is whether xen/Makefile (around line 250, 
> >>> just
> >>> after setting SRCARCH) would be better, or Kbuild.include. To me the
> >>> former place seems more natural, but I'm not totally sure.
> >>
> >> Depends on where all the intended uses are. If they're all in 
> >> xen/Makefile,
> >> then having the macro just there is of course sufficient. Whereas when 
> >> it's
> >> needed elsewhere, instead of exporting putting it in Kbuild.include 
> >> would
> >> seem more natural / desirable to me.
> >>
> > 
> > The places where this would be used are these:
> > file: target (or define)
> > xen/build.mk: arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
> > xen/include/Makefile: define cmd_xlat_h
> > xen/arch/x86/Makefile: define filechk_asm-macros.h
> > 
> > The only issue that comes to my mind (it may not be one at all) is that 
> > SRCARCH is defined and exported in xen/Makefile after including 
> > Kbuild.include, so it would need to be defined after SRCARCH is 
> > assigned:
> > 
> > include scripts/Kbuild.include
> > 
> > # Don't break if the build process wasn't called from the top level
> > # we need XEN_TARGET_ARCH to generate the proper config
> > include $(XEN_ROOT)/Config.mk
> > 
> > # Set ARCH/SRCARCH appropriately.
> > 
> > ARCH := $(XEN_TARGET_ARCH)
> > SRCARCH := $(shell echo $(ARCH) | \
> >      sed -e 's/x86.*/x86/' -e 's/arm\(32\|64\)/arm/g' \
> >          -e 's/riscv.*/riscv/g' -e 's/ppc.*/ppc/g')
> > export ARCH SRCARCH
> > 
> > Am I missing something?
> 
> In that case the alternatives are exporting or using = rather than := in
> Kbuild.include, i.e. other than initially requested. Personally I dislike
> exporting to a fair degree, but I'm not sure which one's better in this
> case. Cc-ing Anthony for possible input.

None. The name is missleading anyway, it would suggest to me that it
contain a directory, but that's wrong.

Another thing that suboptimal, use make to call a shell to generate a
string that is going to be later use in shell context. How about just
doing the work in that later shell context?

Something like:

 define filechk_asm-macros.h
+    guard=$$(echo ASM_${SRCARCH}_ASM_MACROS_H | tr a-z A-Z); \
+    echo "#ifndef $$guard"; \
+    echo "#define $$guard"; \
     echo '#if 0'; \
     echo '.if 0'; \

Or, instead of having to write the name of the file down, we could
use a name that is already registered in a variable:

 define filechk_asm-macros.h
+    guard=$$(echo $@ | tr a-z/.- A-Z_); \
+    echo "#ifndef $$guard"; \
+    echo "#define $$guard"; \
     echo '#if 0'; \
     echo '.if 0'; \

This produces:
    #ifndef ARCH_X86_INCLUDE_ASM_ASM_MACROS_H
    #define ARCH_X86_INCLUDE_ASM_ASM_MACROS_H
    #if 0
    .if 0

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

