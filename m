Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEAA819A8C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657429.1026242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFs0K-00068y-Cr; Wed, 20 Dec 2023 08:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657429.1026242; Wed, 20 Dec 2023 08:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFs0K-00066F-9C; Wed, 20 Dec 2023 08:32:36 +0000
Received: by outflank-mailman (input) for mailman id 657429;
 Wed, 20 Dec 2023 08:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFs0I-000667-Nk
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:32:34 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52361d1f-9f12-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 09:32:33 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c69403b3eso54274435e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 00:32:33 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b0040b30be6244sm6504565wmq.24.2023.12.20.00.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 00:32:32 -0800 (PST)
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
X-Inumbo-ID: 52361d1f-9f12-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703061153; x=1703665953; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKmh1INZfKUACcuBbyrdc6mJ4hc4DA0TnGmi+6UpUZY=;
        b=Fzvq2Jeptcgef7KEXXjbevJFUNzpn3E1KycNe5F/jbmPRwp5rZwxtc+T9+vmxFre88
         imN4ZKcC6yhFzRXwpSNCdmG+ncynaLd3TYoLMTTl1/GKsA7Csc3i5yy+jG1osT5GMBQS
         vjLhFIZPR3cYhoK54ihsUdsTBF/QNxyISMjvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703061153; x=1703665953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKmh1INZfKUACcuBbyrdc6mJ4hc4DA0TnGmi+6UpUZY=;
        b=R4V30SVpgyymxXGAmTcnOCnCb+Fr5vefyBW/cU4xx39s4S1jiSuu296bN9NVt7QRCO
         0qvYNCXTJja7heFYKJogDlJW0Ga1VI46lE47sRAcTqtF8DWqsR4as8D8fL3+p04juAyt
         Cw/LNWv3e8we/cK5oS/JBYLrbcWW2coO9NOAy4dkH2jRVW43biiI1Ua4SWPd8oldR/7h
         LLStVoJo0tLZtBYRM8dIdDzzw9Ws9P3s4P0vOBU9DurmFydNnoMCGkXvncnLD8aolACh
         qaCIWC2HgtJgWngcpZKPCbWOm0CfaOeG+iLLbCi4GDLFma8+GiIsTs1ap+gfLPmECx6j
         epeA==
X-Gm-Message-State: AOJu0YwUeU85TMYfgDFwAZvtqGFqo6znsDNH5kAP2x703h6aFBPYMd6H
	EKAqXCRjdODESj+XJ6l6BkLXmA==
X-Google-Smtp-Source: AGHT+IE6fmPR58OqtyhWZ5hipLtSfYxJl+ZHlLUGkBC6MARRpsUbc9LbuyLXrKgaC+8njN2+ETpMKQ==
X-Received: by 2002:a05:600c:45cc:b0:40c:48d6:64cb with SMTP id s12-20020a05600c45cc00b0040c48d664cbmr8311548wmo.134.1703061152830;
        Wed, 20 Dec 2023 00:32:32 -0800 (PST)
Date: Wed, 20 Dec 2023 09:32:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Message-ID: <ZYKmn-lvKQpauL6Z@macbook>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-2-roger.pau@citrix.com>
 <bc08ed7e-766d-4f0e-a7ef-994d09d1dbe2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc08ed7e-766d-4f0e-a7ef-994d09d1dbe2@citrix.com>

On Tue, Dec 19, 2023 at 07:46:11PM +0000, Andrew Cooper wrote:
> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
> > The minimal function size requirements for livepatch are either 5 bytes (for
> 
> "for an x86 livepatch", seeing as we're touching multiple architectures
> worth of files.
> 
> I know it's at the end of the sentence, but it wants to be earlier to be
> clearer.
> 
> > jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
> > that distance between functions entry points is always at least of the minimal
> > required size for livepatch instruction replacement to be successful.
> >
> > Add an additional align directive to the linker script, in order to ensure that
> > the next section placed after the .text.* (per-function sections) is also
> > aligned to the required boundary, so that the distance of the last function
> > entry point with the next symbol is also of minimal size.
> >
> > Note that it's possible for the compiler to end up using a higher function
> > alignment regardless of the passed value, so this change just make sure that
> > the minimum required for livepatch to work is present.  Different compilers
> > handle the option differently, as clang will ignore -falign-functions value
> > if it's smaller than the one that would be set by the optimization level, while
> > gcc seems to always honor the function alignment passed in -falign-functions.
> > In order to cope with this behavior and avoid that setting -falign-functions
> > results in an alignment inferior to what the optimization level would have
> > selected force x86 release builds to use a function alignment of 16 bytes.
> 
> Yuck :(
> 
> The same will be true for all other architectures too?

I would expect that for gcc I guess.

> What happens on ARM, which also picks up an explicit choice in livepatch
> builds?

Arm AFAICT seems to use a 4 byte function alignment with -O2 (both gcc
and clang), so that matches what we need to enforce for livepatch.  If
we ever need a higher alignment for livepatch reasons it would be a
multiple of the minimum one set by the compiler, so that should be
fine.

> >
> > The compiler option -falign-functions is not available on at least clang 3.8,
> > so introduce a Kconfig check for it and make the livepatch option depend on the
> > compiler supporting the option.
> >
> > The naming of the option(s) CONFIG_FUNCTION_ALIGNMENT is explicitly not
> > mentioning CC in preparation for the option also being used by assembly code.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v3:
> >  - Test for compiler option with -falign-functions.
> >  - Make FUNCTION_ALIGNMENT depend on CC_HAS_FUNCTION_ALIGNMENT.
> >  - Set 16byte function alignment for x86 release builds.
> >
> > Changes since v2:
> >  - Add Arm side.
> >  - Align end of section in the linker script to ensure enough padding for the
> >    last function.
> >  - Expand commit message and subject.
> >  - Rework Kconfig options.
> >  - Check that the compiler supports the option.
> >
> > Changes since v1:
> >  - New in this version.
> > ---
> >  xen/Kconfig              | 19 +++++++++++++++++++
> >  xen/Makefile             |  3 +++
> >  xen/arch/arm/livepatch.c |  2 ++
> >  xen/arch/arm/xen.lds.S   |  4 ++++
> >  xen/arch/x86/Kconfig     |  1 +
> >  xen/arch/x86/livepatch.c |  4 ++++
> >  xen/arch/x86/xen.lds.S   |  4 ++++
> >  xen/common/Kconfig       |  5 ++++-
> >  8 files changed, 41 insertions(+), 1 deletion(-)
> 
> xen$ git ls-files | grep xen.lds.S
> arch/arm/xen.lds.S
> arch/ppc/xen.lds.S
> arch/riscv/xen.lds.S
> arch/x86/xen.lds.S
> 
> RISC-V and PPC have the same pattern that you're patching for x86 and ARM.

I've avoided touching those because there's no livepatch support there
(yet), and I didn't want to give the impression that the option is
supported or tested for those architectures.  I have no idea what
function alignments would be sensible for riscv or ppc.

> > diff --git a/xen/Kconfig b/xen/Kconfig
> > index 134e6e68ad84..c2cc3fe165eb 100644
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -37,6 +37,25 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
> >  config CC_SPLIT_SECTIONS
> >  	bool
> >  
> > +# Set function alignment.
> > +#
> > +# Allow setting on a boolean basis, and then convert such selection to an
> > +# integer for the build system and code to consume more easily.
> 
> # Clang >= 6.0
> 
> > +config CC_HAS_FUNCTION_ALIGNMENT
> > +	def_bool $(cc-option,-falign-functions)
> > +config FUNCTION_ALIGNMENT_4B
> > +	bool
> > +config FUNCTION_ALIGNMENT_8B
> > +	bool
> > +config FUNCTION_ALIGNMENT_16B
> > +	bool
> > +config FUNCTION_ALIGNMENT
> > +	int
> > +	depends on CC_HAS_FUNCTION_ALIGNMENT
> > +	default 16 if FUNCTION_ALIGNMENT_16B
> > +	default  8 if  FUNCTION_ALIGNMENT_8B
> > +	default  4 if  FUNCTION_ALIGNMENT_4B
> 
> What value do we get here for RISCV/PPC?  Do we need another override
> for them?

Hm, I wasn't planning on adding support for PPC/RISCV here, if those
arches want to use a specific function alignment they might need to
adjust the options here, I think that's a reasonable compromise, as I
don't see a need for this to be blocked on also agreeing values for
ppc or riscv.

Thanks, Roger.

