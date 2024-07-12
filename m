Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A2C9301F6
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758312.1167741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSORx-0003D6-DU; Fri, 12 Jul 2024 22:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758312.1167741; Fri, 12 Jul 2024 22:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSORx-0003B2-Aa; Fri, 12 Jul 2024 22:09:09 +0000
Received: by outflank-mailman (input) for mailman id 758312;
 Fri, 12 Jul 2024 22:09:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSORw-0003At-2U
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:09:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59844c89-409b-11ef-8776-851b0ebba9a2;
 Sat, 13 Jul 2024 00:09:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3271F61FA9;
 Fri, 12 Jul 2024 22:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA955C32782;
 Fri, 12 Jul 2024 22:09:01 +0000 (UTC)
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
X-Inumbo-ID: 59844c89-409b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720822142;
	bh=+fcrwleOJ6d/D61hAe6bTDOaWfhsCV1Mv85dSl4Yyao=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VZLr/FbB3r/ypO6wSktzhhwtLewHkr7vFXXgfBwpeHdKQHruZU9+FoMO8En7tqTDT
	 yvFf9NkXmYwLif2WoC1/BB6mqBOEJcX6dgvxvI3hOdcIqxr1U93Jj56yRym3s8ltfV
	 ZPci/X5hIvIDU/tHdJYoNY46AfR0xMssPQWxZ8638BPlnPZ4xSP+LMCf70ZDY3DgfR
	 Q5QZ5MRZcuBJWrUqrjhQzCCNYtHvzbklSFVkShV4/ICY2r48EZGi9jkZ6r/qKtVYQ6
	 qAv/u4mM41d8/f6LBgdRp9gvqCkgqALMIABeXeaP+mfg2gaEdb2O/oQVrYGIbDj5hS
	 sbxYG+xun1N+g==
Date: Fri, 12 Jul 2024 15:09:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: alessandro.zucchelli@bugseng.com, nicola.vetrini@bugseng.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 05/17] xen/x86: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <6620954e-b6d3-4073-ae68-0451aea44c52@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407121505330.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <d67d06849732fea11391afd61ff9891ed11795e5.1719829101.git.alessandro.zucchelli@bugseng.com> <09bc4d2e-b4fb-428b-b0e3-266952ebd3c5@suse.com> <20ad12e8beec50aaa58305ee5f376e21@bugseng.com>
 <6620954e-b6d3-4073-ae68-0451aea44c52@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jul 2024, Jan Beulich wrote:
> On 09.07.2024 09:38, Alessandro Zucchelli wrote:
> > On 2024-07-01 16:21, Jan Beulich wrote:
> >> On 01.07.2024 15:36, Alessandro Zucchelli wrote:
> >>> --- a/xen/arch/x86/Makefile
> >>> +++ b/xen/arch/x86/Makefile
> >>> @@ -260,17 +260,18 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: 
> >>> $(obj)/asm-macros.i $(src)/Makefil
> >>>  	$(call filechk,asm-macros.h)
> >>>
> >>>  define filechk_asm-macros.h
> >>> +	guard=$$(echo ASM_${SRCARCH}_ASM_MACROS_H | tr a-z A-Z);  \
> >>
> >> Nit: Hard tab slipped in.
> >>
> >>> +    echo '#ifndef $$guard'; \
> >>> +    echo '#define $$guard'; \
> >>>      echo '#if 0'; \
> >>>      echo '.if 0'; \
> >>>      echo '#endif'; \
> >>> -    echo '#ifndef __ASM_MACROS_H__'; \
> >>> -    echo '#define __ASM_MACROS_H__'; \
> >>>      echo 'asm ( ".include \"$@\"" );'; \
> >>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
> >>>      echo '#if 0'; \
> >>>      echo '.endif'; \
> >>>      cat $<; \
> >>> -    echo '#endif'
> >>> +    echo '#endif'; \
> >>> +    echo '#endif /* $$guard */'
> >>>  endef
> >>>
> >>>  $(obj)/efi.lds: AFLAGS-y += -DEFI
> >>> --- a/xen/arch/x86/cpu/cpu.h
> >>> +++ b/xen/arch/x86/cpu/cpu.h
> >>> @@ -1,3 +1,6 @@
> >>> +#ifndef X86_CPU_CPU_H
> >>> +#define X86_CPU_CPU_H
> >>
> >> This, ...
> >>
> >>> --- a/xen/arch/x86/x86_64/mmconfig.h
> >>> +++ b/xen/arch/x86/x86_64/mmconfig.h
> >>> @@ -5,6 +5,9 @@
> >>>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
> >>>   */
> >>>
> >>> +#ifndef X86_64_MMCONFIG_H
> >>> +#define X86_64_MMCONFIG_H
> >>
> >> ... this, and ...
> >>
> >>> --- a/xen/arch/x86/x86_emulate/private.h
> >>> +++ b/xen/arch/x86/x86_emulate/private.h
> >>> @@ -6,6 +6,9 @@
> >>>   * Copyright (c) 2005-2007 XenSource Inc.
> >>>   */
> >>>
> >>> +#ifndef X86_X86_EMULATE_PRIVATE_H
> >>> +#define X86_X86_EMULATE_PRIVATE_H
> >>
> >> ... this guard can't possibly all follow the same proposed naming 
> >> scheme
> >> (wherever the final version of that is being recorded; I don't recall 
> >> it
> >> having gone in, and I didn't spot anything earlier in the series); at
> >> least one must be wrong.
> > 
> > For x86/x86_64/mmconfig.h has been made an exception as stated in the 
> > commit
> > message:
> > Note that in x86_64/mmconfig.h we slightly deviate from the naming
> > convention in place: instead of having the inclusion guard as
> > X86_X86_64_MMCONFIG_H we shortened the directory prefix as X86_64 for
> > the sake of readability.
> > 
> > If you do not agree with this exception and you prefer to keep the 
> > additional
> > X86_ prefix let me know so as I prepare the patch series V5 I may 
> > reintroduce it.
> 
> What I have an issue with is making an exception in one place when quite
> clearly would as much (or as little) benefit from one. Before there's
> any further back and forth, I'd like to suggest that you wait with
> adjustments here until the base scheme has really been agreed upon,
> including situations where we think we'd like to make exceptions (after
> all we might decide that there simply shouldn't be exceptions, and that
> in order to eliminate such redundancy in guard identifiers we'd rather
> like to rename some of the files).

I don't think it is a good idea to introduce a naming scheme and
immediately add exceptions. I would stick to the naming scheme even if
it doesn't always lead to the best possible name. Also these are header
guards, they are not critical variables for which clarity and shortness
are paramount.

The naming scheme was written in the 0 email and copy/pasted here for
convenience:

- private headers -> <dir>_<filename>_H
- asm-generic headers -> ASM_GENERIC_<filename>_H
- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
- include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
- arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H

So in this patch I would sticked to the naming scheme and used:

X86_CPU_CPU_H
X86_X86_64_MMCONFIG_H
X86_X86_EMULATE_PRIVATE_H

