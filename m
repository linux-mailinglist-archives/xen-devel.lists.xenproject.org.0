Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63F917B02
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748493.1156218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMO3W-0005JO-UP; Wed, 26 Jun 2024 08:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748493.1156218; Wed, 26 Jun 2024 08:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMO3W-0005GT-Rn; Wed, 26 Jun 2024 08:31:06 +0000
Received: by outflank-mailman (input) for mailman id 748493;
 Wed, 26 Jun 2024 08:31:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMO3V-0005GN-UM
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:31:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d448709-3396-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 10:31:04 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id F31144EE0738;
 Wed, 26 Jun 2024 10:31:03 +0200 (CEST)
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
X-Inumbo-ID: 6d448709-3396-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Wed, 26 Jun 2024 10:31:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 05/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <25371d03-1c33-41dd-9cdb-12d74fe38d42@suse.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
 <dce6c44d-94b7-43bd-858a-9337336a79cf@suse.com>
 <ef623bad297d016438b35bedc80f091d@bugseng.com>
 <25371d03-1c33-41dd-9cdb-12d74fe38d42@suse.com>
Message-ID: <bc5aaa79db259d2f8e405a74ed5c9947@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-26 10:20, Jan Beulich wrote:
> On 25.06.2024 21:31, Nicola Vetrini wrote:
>> On 2024-03-12 09:16, Jan Beulich wrote:
>>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
>>>>  $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i
>>>> $(src)/Makefile
>>>>  	$(call filechk,asm-macros.h)
>>>> 
>>>> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
>>> 
>>> This wants to use :=, I think - there's no reason to invoke the shell
>>> ...
>> 
>> I agree on this
>> 
>>> 
>>>>  define filechk_asm-macros.h
>>>> +    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>>>> +    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>>>>      echo '#if 0'; \
>>>>      echo '.if 0'; \
>>>>      echo '#endif'; \
>>>> -    echo '#ifndef __ASM_MACROS_H__'; \
>>>> -    echo '#define __ASM_MACROS_H__'; \
>>>>      echo 'asm ( ".include \"$@\"" );'; \
>>>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>>>>      echo '#if 0'; \
>>>>      echo '.endif'; \
>>>>      cat $<; \
>>>> -    echo '#endif'
>>>> +    echo '#endif'; \
>>>> +    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
>>>>  endef
>>> 
>>> ... three times while expanding this macro. Alternatively (to avoid
>>> an unnecessary shell invocation when this macro is never expanded at
>>> all) a shell variable inside the "define" above would want 
>>> introducing.
>>> Whether this 2nd approach is better depends on whether we anticipate
>>> further uses of ARCHDIR.
>> 
>> However here I'm not entirely sure about the meaning of this latter
>> proposal.
>> My proposal is the following:
>> 
>> ARCHDIR := $(shell echo $(SRCARCH) | tr a-z A-Z)
>> 
>> in a suitably generic place (such as Kbuild.include or maybe
>> xen/Makefile) as you suggested in subsequent patches that reused this
>> pattern.
>> 
>>> 
>>>> --- a/xen/arch/x86/cpu/cpu.h
>>>> +++ b/xen/arch/x86/cpu/cpu.h
>>>> @@ -1,3 +1,6 @@
>>>> +#ifndef XEN_ARCH_X86_CPU_CPU_H
>>>> +#define XEN_ARCH_X86_CPU_CPU_H
>>>> +
>>>>  /* attempt to consolidate cpu attributes */
>>>>  struct cpu_dev {
>>>>  	void		(*c_early_init)(struct cpuinfo_x86 *c);
>>>> @@ -24,3 +27,5 @@ void amd_init_lfence(struct cpuinfo_x86 *c);
>>>>  void amd_init_ssbd(const struct cpuinfo_x86 *c);
>>>>  void amd_init_spectral_chicken(void);
>>>>  void detect_zen2_null_seg_behaviour(void);
>>>> +
>>>> +#endif /* XEN_ARCH_X86_CPU_CPU_H */
>>> 
>>> Leaving aside the earlier voiced request to get rid of the XEN_
>>> prefixes
>>> here, ...
>>> 
>>>> --- a/xen/arch/x86/x86_64/mmconfig.h
>>>> +++ b/xen/arch/x86/x86_64/mmconfig.h
>>>> @@ -5,6 +5,9 @@
>>>>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>>>>   */
>>>> 
>>>> +#ifndef XEN_ARCH_X86_X86_64_MMCONFIG_H
>>>> +#define XEN_ARCH_X86_X86_64_MMCONFIG_H
>>>> +
>>>>  #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
>>>>  #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
>>>> 
>>>> @@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned
>>>> int segment,
>>>>  int pci_mmcfg_arch_init(void);
>>>>  int pci_mmcfg_arch_enable(unsigned int idx);
>>>>  void pci_mmcfg_arch_disable(unsigned int idx);
>>>> +
>>>> +#endif /* XEN_ARCH_X86_X86_64_MMCONFIG_H */
>>> 
>>> ... in a case like this and maybe even ...
>>> 
>>>> --- a/xen/arch/x86/x86_emulate/private.h
>>>> +++ b/xen/arch/x86/x86_emulate/private.h
>>>> @@ -6,6 +6,9 @@
>>>>   * Copyright (c) 2005-2007 XenSource Inc.
>>>>   */
>>>> 
>>>> +#ifndef XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
>>>> +#define XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
>>>> +
>>>>  #ifdef __XEN__
>>>> 
>>>>  # include <xen/bug.h>
>>>> @@ -836,3 +839,5 @@ static inline int read_ulong(enum x86_segment 
>>>> seg,
>>>>      *val = 0;
>>>>      return ops->read(seg, offset, val, bytes, ctxt);
>>>>  }
>>>> +
>>>> +#endif /* XEN_ARCH_X86_X86_EMULATE_PRIVATE_H */
>>> 
>>> ... this I wonder whether they are too strictly sticking to the base
>>> scheme (or whether the base scheme itself isn't flexible enough): I'm
>>> not overly happy with the "_X86_X86_" in there. Especially in the
>>> former case, where it's the sub-arch path, like for arm/arm<NN> I'd
>>> like to see that folded to just "_X86_64_" here as well.
>>> 
>> 
>> I do agree we should make an exception here: e.g.
>> XEN_X86_64_EMULATE_PRIVATE_H
>> 
>> I'm ambivalent about the XEN_ prefix: I can't immediately see an issue
>> with dropping it, but on the other hand there are several headers that
>> already use it (either it or the __XEN prefix) as far as I can tell
>> (e.g. x86/cpu/cpu.h), so dropping it from the naming convention would
>> imply that a fair amount of additional churn may be needed to have an
>> uniform naming scheme in all the xen/ directory. I'll leave the 
>> decision
>> to the maintainers.
> 
> Hmm, I'm puzzled: The example you point at presently has no guard at 
> all,
> afaics. There'll need to be churn there anyway. If you picked an 
> example,
> I would have expected that to be one where the guard already fully
> matches the proposed scheme. To be honest I'd be surprised if we had 
> many
> files fulfilling this criteria.
> 

Ah, yes. I was looking at the state of the tree after some patches 
applied. On staging, most examples are in asm directories, such as 
xen/arch/x86/include/asm/endbr.h, but that would be modified anyway by 
dropping rule #3:
arch/<architecture>/include/asm/<subdir>/<filename>.h -> 
ASM_<architecture>_<subdir>_<filename>_H

With this, unless I find some other obstacle or issue from other 
maintainers, the XEN_ prefix can be dropped.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

