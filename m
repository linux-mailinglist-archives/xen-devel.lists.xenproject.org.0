Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E79183E8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 16:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749116.1157138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTZD-0000Dx-G6; Wed, 26 Jun 2024 14:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749116.1157138; Wed, 26 Jun 2024 14:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTZD-0000Bd-Cs; Wed, 26 Jun 2024 14:24:11 +0000
Received: by outflank-mailman (input) for mailman id 749116;
 Wed, 26 Jun 2024 14:24:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMTZC-0000BX-H0
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 14:24:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c059de78-33c7-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 16:24:09 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B565A4EE073D;
 Wed, 26 Jun 2024 16:24:08 +0200 (CEST)
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
X-Inumbo-ID: c059de78-33c7-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Wed, 26 Jun 2024 16:24:08 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, Simone Ballarin
 <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 05/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <ZnwZycQ3mU21cSpd@l14>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
 <dce6c44d-94b7-43bd-858a-9337336a79cf@suse.com>
 <ef623bad297d016438b35bedc80f091d@bugseng.com>
 <ec92611e-6762-4b6c-af3e-999b748d1f1b@suse.com>
 <797b00049612507d273facc581b2c2c5@bugseng.com>
 <a5009c3e-cba6-4737-aaff-c3b79a11169c@suse.com>
 <e3ae670923fd061986e27b3f95833b88@bugseng.com>
 <0c88d86e-f226-4225-b723-a6662fcd5bef@suse.com> <ZnwZycQ3mU21cSpd@l14>
Message-ID: <4b9b8c769d65b0f69514ff47fd6a835a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-26 15:38, Anthony PERARD wrote:
> On Wed, Jun 26, 2024 at 12:31:42PM +0200, Jan Beulich wrote:
>> On 26.06.2024 12:25, Nicola Vetrini wrote:
>> > On 2024-06-26 11:26, Jan Beulich wrote:
>> >> On 26.06.2024 11:20, Nicola Vetrini wrote:
>> >>> On 2024-06-26 11:06, Jan Beulich wrote:
>> >>>> On 25.06.2024 21:31, Nicola Vetrini wrote:
>> >>>>> On 2024-03-12 09:16, Jan Beulich wrote:
>> >>>>>> On 11.03.2024 09:59, Simone Ballarin wrote:
>> >>>>>>> --- a/xen/arch/x86/Makefile
>> >>>>>>> +++ b/xen/arch/x86/Makefile
>> >>>>>>> @@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
>> >>>>>>>  $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i
>> >>>>>>> $(src)/Makefile
>> >>>>>>>  	$(call filechk,asm-macros.h)
>> >>>>>>>
>> >>>>>>> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
>> >>>>>>
>> >>>>>> This wants to use :=, I think - there's no reason to invoke the
>> >>>>>> shell
>> >>>>>> ...
>> >>>>>
>> >>>>> I agree on this
>> >>>>>
>> >>>>>>
>> >>>>>>>  define filechk_asm-macros.h
>> >>>>>>> +    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>> >>>>>>> +    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>> >>>>>>>      echo '#if 0'; \
>> >>>>>>>      echo '.if 0'; \
>> >>>>>>>      echo '#endif'; \
>> >>>>>>> -    echo '#ifndef __ASM_MACROS_H__'; \
>> >>>>>>> -    echo '#define __ASM_MACROS_H__'; \
>> >>>>>>>      echo 'asm ( ".include \"$@\"" );'; \
>> >>>>>>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>> >>>>>>>      echo '#if 0'; \
>> >>>>>>>      echo '.endif'; \
>> >>>>>>>      cat $<; \
>> >>>>>>> -    echo '#endif'
>> >>>>>>> +    echo '#endif'; \
>> >>>>>>> +    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
>> >>>>>>>  endef
>> >>>>>>
>> >>>>>> ... three times while expanding this macro. Alternatively (to avoid
>> >>>>>> an unnecessary shell invocation when this macro is never expanded
>> >>>>>> at
>> >>>>>> all) a shell variable inside the "define" above would want
>> >>>>>> introducing.
>> >>>>>> Whether this 2nd approach is better depends on whether we
>> >>>>>> anticipate
>> >>>>>> further uses of ARCHDIR.
>> >>>>>
>> >>>>> However here I'm not entirely sure about the meaning of this latter
>> >>>>> proposal.
>> >>>>> My proposal is the following:
>> >>>>>
>> >>>>> ARCHDIR := $(shell echo $(SRCARCH) | tr a-z A-Z)
>> >>>>>
>> >>>>> in a suitably generic place (such as Kbuild.include or maybe
>> >>>>> xen/Makefile) as you suggested in subsequent patches that reused
>> >>>>> this
>> >>>>> pattern.
>> >>>>
>> >>>> If $(ARCHDIR) is going to be used elsewhere, then what you suggest is
>> >>>> fine.
>> >>>> My "whether" in the earlier reply specifically left open for
>> >>>> clarification
>> >>>> what the intentions with the variable are. The alternative I had
>> >>>> described
>> >>>> makes sense only when $(ARCHDIR) would only ever be used inside the
>> >>>> filechk_asm-macros.h macro.
>> >>>
>> >>> Yes, the intention is to reuse $(ARCHDIR) in the formation of other
>> >>> places, as you can tell from the fact that subsequent patches
>> >>> replicate
>> >>> the same pattern. This is going to save some duplication.
>> >>> The only matter left then is whether xen/Makefile (around line 250,
>> >>> just
>> >>> after setting SRCARCH) would be better, or Kbuild.include. To me the
>> >>> former place seems more natural, but I'm not totally sure.
>> >>
>> >> Depends on where all the intended uses are. If they're all in
>> >> xen/Makefile,
>> >> then having the macro just there is of course sufficient. Whereas when
>> >> it's
>> >> needed elsewhere, instead of exporting putting it in Kbuild.include
>> >> would
>> >> seem more natural / desirable to me.
>> >>
>> >
>> > The places where this would be used are these:
>> > file: target (or define)
>> > xen/build.mk: arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
>> > xen/include/Makefile: define cmd_xlat_h
>> > xen/arch/x86/Makefile: define filechk_asm-macros.h
>> >
>> > The only issue that comes to my mind (it may not be one at all) is that
>> > SRCARCH is defined and exported in xen/Makefile after including
>> > Kbuild.include, so it would need to be defined after SRCARCH is
>> > assigned:
>> >
>> > include scripts/Kbuild.include
>> >
>> > # Don't break if the build process wasn't called from the top level
>> > # we need XEN_TARGET_ARCH to generate the proper config
>> > include $(XEN_ROOT)/Config.mk
>> >
>> > # Set ARCH/SRCARCH appropriately.
>> >
>> > ARCH := $(XEN_TARGET_ARCH)
>> > SRCARCH := $(shell echo $(ARCH) | \
>> >      sed -e 's/x86.*/x86/' -e 's/arm\(32\|64\)/arm/g' \
>> >          -e 's/riscv.*/riscv/g' -e 's/ppc.*/ppc/g')
>> > export ARCH SRCARCH
>> >
>> > Am I missing something?
>> 
>> In that case the alternatives are exporting or using = rather than := 
>> in
>> Kbuild.include, i.e. other than initially requested. Personally I 
>> dislike
>> exporting to a fair degree, but I'm not sure which one's better in 
>> this
>> case. Cc-ing Anthony for possible input.
> 
> None. The name is missleading anyway, it would suggest to me that it
> contain a directory, but that's wrong.
> 
> Another thing that suboptimal, use make to call a shell to generate a
> string that is going to be later use in shell context. How about just
> doing the work in that later shell context?
> 
> Something like:
> 
>  define filechk_asm-macros.h
> +    guard=$$(echo ASM_${SRCARCH}_ASM_MACROS_H | tr a-z A-Z); \
> +    echo "#ifndef $$guard"; \
> +    echo "#define $$guard"; \
>      echo '#if 0'; \
>      echo '.if 0'; \
> 

This approach looks ok to me.

> Or, instead of having to write the name of the file down, we could
> use a name that is already registered in a variable:
> 
>  define filechk_asm-macros.h
> +    guard=$$(echo $@ | tr a-z/.- A-Z_); \
> +    echo "#ifndef $$guard"; \
> +    echo "#define $$guard"; \
>      echo '#if 0'; \
>      echo '.if 0'; \
> 
> This produces:
>     #ifndef ARCH_X86_INCLUDE_ASM_ASM_MACROS_H
>     #define ARCH_X86_INCLUDE_ASM_ASM_MACROS_H
>     #if 0
>     .if 0
> 
> Cheers,

The issue I see here is that it would in some cases lead to long header 
guards, which is somewhat against the overall consensus, given that the 
naming convention should be followed by any file, so it was designed to 
generate shorter guards, rather than just the path.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

