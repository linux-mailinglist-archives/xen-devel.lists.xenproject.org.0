Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D4CB18E2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182445.1505317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8WK-0004m3-Io; Wed, 10 Dec 2025 00:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182445.1505317; Wed, 10 Dec 2025 00:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8WK-0004jP-G8; Wed, 10 Dec 2025 00:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1182445;
 Wed, 10 Dec 2025 00:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT8WJ-0004jJ-Kv
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:57:31 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3381483b-d563-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:57:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 49F2160129;
 Wed, 10 Dec 2025 00:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5239DC4CEF5;
 Wed, 10 Dec 2025 00:57:26 +0000 (UTC)
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
X-Inumbo-ID: 3381483b-d563-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765328247;
	bh=rS4zuLA1PHp1Nv0EUboDObLYpbhuiN+6dN9/VLMqJ18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WHluswvkiOuy7S1KK3Oe52BPGdrUO67NosAPs1K5ZnPmMso076t4KYUSv8eUFTHGw
	 XmBGsPo28f1bhWwX53E6CI7m2P4rqRdqDpTzbSUjrDETc1TbUAteb34CHtAaEoXtQi
	 +/SeLBzlywXjfJ1NGusgQS6sIPJohCy1JV2GYvc/7sWyNGS5fdK+nggxhMLZVkJjy6
	 MNUD/ccPE+9kvmzpuh2b9qk6MrLslEKVQ5nRBgroHAJYp6x7c0VkCg8FV1MPuc5A7Y
	 Vr/oVhJiHjrVCXqkOUzaFGmGfSCoigSD/PW5Kjgwd4lxAmz8SZBAG1JvHhzRxiqtk5
	 dnuPr8ADc2//g==
Date: Tue, 9 Dec 2025 16:57:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] misra: consider conversion from UL or (void*) to
 function pointer as safe
In-Reply-To: <73ab67f9-d24f-42c8-a383-4c9db5de5bd4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2512091656400.19429@ubuntu-linux-20-04-desktop>
References: <daa126218e11484c72f3de4b39186b6d9afd26c6.1761589314.git.dmytro_prokopchuk1@epam.com> <73ab67f9-d24f-42c8-a383-4c9db5de5bd4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Oct 2025, Jan Beulich wrote:
> On 27.10.2025 19:51, Dmytro Prokopchuk1 wrote:
> > Rule 11.1 states as following: "Conversions shall not be performed
> > between a pointer to a function and any other type."
> > 
> > This deviation from Rule 11.1 relies on both ABI definitions and compiler
> > implementations supported by Xen. The System V x86_64 ABI and the AArch64
> > ELF ABI define consistent and compatible representations (i.e., having
> > the same size and memory layout) for (void *), unsigned long, and function
> > pointers, enabling safe conversions between these types without data loss
> > or corruption. Additionally, GCC and Clang, faithfully implement the ABI
> > specifications, ensuring that the generated machine code conforms to these
> > guarantees. Developers must note that this behavior is not universal and
> > depends on platform-specific ABIs and compiler implementations.
> > 
> > Configure Eclair to avoid reporting violations for conversions from
> > unsigned long or (void *) to a function pointer.
> > 
> > Add a compile-time assertion into the file 'xen/common/version.c' to
> > confirm this conversion compatibility across X86 and ARM platforms
> > (assuming this file is common for them).
> > 
> > References:
> > - System V x86_64 ABI: https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build
> > - AArch64 ELF ABI: https://github.com/ARM-software/abi-aa/releases
> > - GCC: https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
> > - Clang: https://clang.llvm.org/docs/CrossCompilation.html
> > 
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> > Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > ---
> > Changes in v4:
> > - the build assertions for the X86 and ARM are enabled by default (unconditionally)
> > - re-wrote description for the build_assertions() function
> > - excluded PowerPC architecture (not in scope of certification) from the check and wrote apropriate explanation
> > 
> > Link to v3:
> > https://patchew.org/Xen/0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro._5Fprokopchuk1@epam.com/
> > ---
> >  .../eclair_analysis/ECLAIR/deviations.ecl     |  8 ++++++
> >  docs/misra/deviations.rst                     |  8 +++++-
> >  docs/misra/rules.rst                          |  7 +++++-
> >  xen/common/version.c                          | 25 +++++++++++++++++++
> >  4 files changed, 46 insertions(+), 2 deletions(-)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index 7f3fd35a33..219ba6993b 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -375,6 +375,14 @@ constant expressions are required.\""
> >  }
> >  -doc_end
> >  
> > +-doc_begin="Conversion from unsigned long or (void *) to a function pointer can restore full information, provided that the source type has enough bits to restore it."
> > +-config=MC3A2.R11.1,casts+={safe,
> > +  "from(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
> > +   &&to(type(canonical(__function_pointer_types)))
> > +   &&relation(definitely_preserves_value)"
> > +}
> > +-doc_end
> > +
> >  -doc_begin="The conversion from a function pointer to a boolean has a well-known semantics that do not lead to unexpected behaviour."
> >  -config=MC3A2.R11.1,casts+={safe,
> >    "from(type(canonical(__function_pointer_types)))
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index 3271317206..b3431ef24e 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -366,11 +366,17 @@ Deviations related to MISRA C:2012 Rules:
> >       - Tagged as `safe` for ECLAIR.
> >  
> >     * - R11.1
> > -     - The conversion from a function pointer to unsigned long or (void \*) does
> > +     - The conversion from a function pointer to unsigned long or '(void *)' does
> >         not lose any information, provided that the target type has enough bits
> >         to store it.
> >       - Tagged as `safe` for ECLAIR.
> >  
> > +   * - R11.1
> > +     - Conversion from unsigned long or '(void *)' to a function pointer can
> > +       restore full information, provided that the source type has enough bits
> > +       to restore it.
> > +     - Tagged as `safe` for ECLAIR.
> > +
> >     * - R11.1
> >       - The conversion from a function pointer to a boolean has a well-known
> >         semantics that do not lead to unexpected behaviour.
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 4388010ec9..4e94251887 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -431,7 +431,12 @@ maintainers if you want to suggest a change.
> >       - All conversions to integer types are permitted if the destination
> >         type has enough bits to hold the entire value. Conversions to bool
> >         and void* are permitted. Conversions from 'void noreturn (*)(...)'
> > -       to 'void (*)(...)' are permitted.
> > +       to 'void (*)(...)' are permitted. Conversions from unsigned long or
> > +       '(void *)' to a function pointer are permitted.
> > +       Example::
> > +
> > +           unsigned long func_addr = (unsigned long)&some_function;
> > +           void (*restored_func)(void) = (void (*)(void))func_addr;
> >  
> >     * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_02.c>`_
> >       - Required
> > diff --git a/xen/common/version.c b/xen/common/version.c
> > index 553b97ba9b..674bd72b31 100644
> > --- a/xen/common/version.c
> > +++ b/xen/common/version.c
> > @@ -217,6 +217,31 @@ void __init xen_build_init(void)
> >  #endif /* CONFIG_X86 */
> >  }
> >  #endif /* BUILD_ID */
> > +
> > +/*
> > + * This assertion checks compatibility between 'unsigned long', 'void *',
> > + * and function pointers. This is true for most supported architectures,
> > + * including X86 (x86_64) and ARM (arm, aarch64).
> > + *
> > + * For more context on architecture-specific preprocessor guards, see
> > + * docs/misc/C-language-toolchain.rst.
> > + *
> > + * If porting Xen to a new architecture where this compatibility does not hold,
> > + * exclude that architecture from these checks and provide suitable commentary
> > + * and/or alternative checks as appropriate.
> > + */
> > +static void __init __maybe_unused build_assertions(void)
> > +{
> > +    /*
> > +     * Exclude architectures where function pointers are larger than data pointers:
> > +     * - PowerPC: uses function descriptors (code address + TOC pointer).
> > +     */
> 
> Yes, it uses function descriptors (aiui they consist of three longs, not just
> two though), but "function pointers are larger than data pointers" is still
> wrong there, which is why (as you indicated before) ...
> 
> > +#if !defined(__powerpc__)
> > +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
> > +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
> > +#endif
> 
> ... these checks still will not cause build breakage even if enabled for PPC.
> At least aiui (what is being passed around are pointers to function
> descriptors). IOW I don't view it as justified to exclude PPC here, at least
> not yet.

Could the patch be committed without the #if !defined(__powerpc__) /
#endif chunk considering that according to Dmytro it should pass the
pipeline anyway?

