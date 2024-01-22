Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52807836D48
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 18:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670038.1042621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRy4l-0000xp-4Z; Mon, 22 Jan 2024 17:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670038.1042621; Mon, 22 Jan 2024 17:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRy4l-0000vI-1E; Mon, 22 Jan 2024 17:27:11 +0000
Received: by outflank-mailman (input) for mailman id 670038;
 Mon, 22 Jan 2024 17:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2apV=JA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rRy4j-0000v9-8I
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 17:27:09 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 770322a0-b94b-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 18:27:06 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so1720685f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 09:27:06 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b0040e7306f655sm29398076wmo.22.2024.01.22.09.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 09:27:05 -0800 (PST)
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
X-Inumbo-ID: 770322a0-b94b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705944426; x=1706549226; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LTFEoQob7C7DgdyXMK0j9H5umgBs6NoqjIQ3+uezxIE=;
        b=YWDoC5dyGh5bxoVg2DaJGfUIq+7Bsc1FCXOhZbITIn9C6S2LrSyi+/jYz2qeh5OINQ
         0w6hLaP9cxoxOI1b3/iobka/V4XSNIuDEDEQOS1pHoRYF9PwHayv41bCn5DoSyY52eau
         H9/soQ2GRakOtTVQjN/JgvA+8R3XWtsiBdfT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944426; x=1706549226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTFEoQob7C7DgdyXMK0j9H5umgBs6NoqjIQ3+uezxIE=;
        b=W/dQaA5fciNkBWFlgaHF5GLiTdi9FqAZ/zrxCshd1Uf6EwdGhDST5xe3OWKS7IexnN
         aAi4P5G0AMtWQKNikUYoIi378aOfml7KAi66JFMeQM7JknxwKnE3DenBiQZ3hgFwRdug
         DgnajG1pCkManKJkHQu+9i3HKRPYctoc5VIZ4x3/GOLkfSYZHxsIJEDAV1BYPfEpEAed
         H0t5EAtEXDtIcr3PTayIyEKD6fddkCZwfca8DiDtBR7c3a5655gplT+dyUDuySpNdSYR
         8OFNSkuj3AmlMnQGL34fFLHcwW7ri4vL3DsPq+juYDxKi9p63oZtQRouaSBa34umVKDU
         SXJA==
X-Gm-Message-State: AOJu0Yy+wuYSUxytTHQVQpo6IQxkCgfYeZMitj2kwoN/VrCUZ23CO5zL
	Ylj08BITyF3+fZ8xYmOaTTDMXdbB1fnVaMZ8Wz6hicohbOTDu0BuNzAj9YBPNoY=
X-Google-Smtp-Source: AGHT+IGXoBAR5vVqLwhuzcFYFZFC583w369vWyfTDVE4jTap6v/6laWtleV6kM8i/PhozUSIC4uKvA==
X-Received: by 2002:a05:600c:211a:b0:40e:7002:6e6f with SMTP id u26-20020a05600c211a00b0040e70026e6fmr2500961wml.47.1705944426120;
        Mon, 22 Jan 2024 09:27:06 -0800 (PST)
Date: Mon, 22 Jan 2024 18:27:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] x86/livepatch: align functions to ensure minimal
 distance between entry points
Message-ID: <Za6laZtVdQtFP4F5@macbook>
References: <20240122110244.14091-1-roger.pau@citrix.com>
 <013210fd-6ea3-4719-afcd-1da97d9cd17f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <013210fd-6ea3-4719-afcd-1da97d9cd17f@suse.com>

On Mon, Jan 22, 2024 at 12:21:47PM +0100, Jan Beulich wrote:
> On 22.01.2024 12:02, Roger Pau Monne wrote:
> > The minimal function size requirements for an x86 livepatch are either 5 bytes
> > (for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
> > distance between functions entry points is always at least of the minimal
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
> Nit: A comma after "selected" may help readability.
> 
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -37,6 +37,27 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
> >  config CC_SPLIT_SECTIONS
> >  	bool
> >  
> > +# Set function alignment.
> > +#
> > +# Allow setting on a boolean basis, and then convert such selection to an
> > +# integer for the build system and code to consume more easily.
> > +#
> > +# Requires clang >= 7.0.0
> > +config CC_HAS_FUNCTION_ALIGNMENT
> > +	def_bool $(cc-option,-falign-functions)
> 
> Nit: Maybe better have a blank line here?
> 
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
> > +
> >  source "arch/$(SRCARCH)/Kconfig"
> >  
> >  config DEFCONFIG_LIST
> >[...]
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -99,6 +99,10 @@ SECTIONS
> >         *(.text)
> >  #ifdef CONFIG_CC_SPLIT_SECTIONS
> >         *(.text.*)
> > +#endif
> > +#ifdef CONFIG_FUNCTION_ALIGNMENT
> > +       /* Ensure enough distance with the next placed section. */
> > +       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
> >  #endif
> >         *(.text.__x86_indirect_thunk_*)
> 
> I continue to fail to see how an alignment directive can guarantee minimum
> distance. In the worst case such a directive inserts nothing at all.

I'm confused, you did provide a RB for this in v4:

https://lore.kernel.org/xen-devel/4cad003f-dda0-4e22-a770-5a5ff56f4d35@suse.com/

Which is basically the same code with a few comments and wording
adjustments.

> IOW
> at the very least there's a non-spelled-out assumption here about the last
> item in the earlier section having suitable alignment and thus, if small
> in size, being suitably padded.

Please bear with me, but I'm afraid I don't understand your concerns.

For livepatch build tools (which is the only consumer of such
alignments) we already have the requirement that a function in order
to be suitable for being live patched must reside in it's own
section.

We do want to aim for functions (even assembly ones) to live in their
own sections in order to be live patched, and to be properly aligned.
However it's also fine for functions to use a different (smaller)
alignment, the livepatch build tools will detect this and use the
alignment reported.

While we want to get to a point where everything that we care to patch
lives in it's own section, and is properly padded to ensure minimal
required space, I don't see why the proposed approach here should be
blocked, as it's a step in the right direction of achieving the
goal.

Granted, there's still assembly code that won't be suitably padded,
but the livepatch build tools won't assume it to be padded.  After
your series to enable assembly annotations we can also make sure the
assembly annotated functions live in separate sections and are
suitably aligned.

> Personally I don't think merely spelling
> out such a requirement would help - it would end up being a trap for
> someone to fall into.

> I'm further curious why .text.__x86_indirect_thunk_* is left past the
> inserted alignment. While pretty unlikely, isn't it in principle possible
> for the thunks there to also need patching? Aren't we instead requiring
> then that assembly functions (and thunks) all be suitably aligned as well?

Those are defined in assembly, so requires CONFIG_FUNCTION_ALIGNMENT
to also be applied to the function entry points in assembly files.

Thanks, Roger.

