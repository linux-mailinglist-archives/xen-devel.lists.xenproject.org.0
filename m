Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909638009F4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 12:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645477.1007659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91ji-0007ww-Ec; Fri, 01 Dec 2023 11:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645477.1007659; Fri, 01 Dec 2023 11:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91ji-0007uj-Bh; Fri, 01 Dec 2023 11:31:10 +0000
Received: by outflank-mailman (input) for mailman id 645477;
 Fri, 01 Dec 2023 11:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r91jg-0007ud-Fw
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 11:31:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e2e2d6d-903d-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 12:31:07 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3333074512bso341479f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 03:31:07 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b0040b501ddd34sm8787604wmq.48.2023.12.01.03.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 03:31:06 -0800 (PST)
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
X-Inumbo-ID: 1e2e2d6d-903d-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701430266; x=1702035066; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=szaZ5bgPR9xle1FvpT8uC3gS6BUCpjJitI+xr1TwCAk=;
        b=aaThJueNo7COkhZo5aZ5LgUmEDMX5eOl+etWeHUv6k2CgAIzA5UbJEL3WppeWIlCJY
         s4cBPNIl98n14kYyAPEloW4zEU0BO71NaEYpqsHb6/C/ZejxKhbQOHn3asYpL3n8cC1j
         VcVb/rON0q98PYBAfuvc4mlfj069cH5fUrt34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701430266; x=1702035066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szaZ5bgPR9xle1FvpT8uC3gS6BUCpjJitI+xr1TwCAk=;
        b=I5vFcFN+G9GQwv7f2Zwii340qLSqZJJF4UevODMQd72gtyrFYcb7XRFIi8CdZMgMtp
         gRGBZWR3DJigFpSl2aTSDZ2JtLE1jDz+YcYZs3Bzrq/WrrNWt/AhIbOgGYr1EzvRCb6Z
         9bgfhi63GRjQCQ3fD7ZHg4CjSvi+LeNm6Dj2NzLBLQWQhtl+ul7GPRRnNT/tsBFcQyng
         mFoF0SBjEszWbXjNXl+ASVoFJ9r0oybH3Yxr+T++TfrJZXz05V0+B7NEIPHqcUL80X0m
         m4Ubwn9pCa7BWoGl1m1YxrzxVWpPpZDEZ2BpXXnNtUUA3HRiS8yFMzWr1S4L0AWY/c4V
         GuUw==
X-Gm-Message-State: AOJu0YwwWJ0+mhDUTlY2zS79H6wI3ZRcjjY/d76XSbzBXQNOyOcuonVQ
	c64TcUNEDSHmZV3gB429bGp08Q==
X-Google-Smtp-Source: AGHT+IF9OzgfeZ+9vDlbOLXYbiYip9h4G9PDY7LNak/0XRGXktLIxP7ZalV0C+cshA0UO4u5oKLm8A==
X-Received: by 2002:a1c:4c01:0:b0:40b:5e4a:2379 with SMTP id z1-20020a1c4c01000000b0040b5e4a2379mr624613wmf.123.1701430266427;
        Fri, 01 Dec 2023 03:31:06 -0800 (PST)
Date: Fri, 1 Dec 2023 12:31:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Message-ID: <ZWnD-a3KcWS83wXd@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com>
 <ZWjIX0Jo5gW5SEDr@macbook>
 <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com>
 <ZWmeV-y5RpGAG5cS@macbook>
 <0d9bc0cd-3719-4961-ae7d-3e27508000a2@suse.com>
 <ZWmzo68abRmRtfwN@macbook>
 <15fb0b37-da9d-410c-ae02-872dd45cd327@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15fb0b37-da9d-410c-ae02-872dd45cd327@suse.com>

On Fri, Dec 01, 2023 at 11:59:09AM +0100, Jan Beulich wrote:
> On 01.12.2023 11:21, Roger Pau Monné wrote:
> > On Fri, Dec 01, 2023 at 10:41:45AM +0100, Jan Beulich wrote:
> >> On 01.12.2023 09:50, Roger Pau Monné wrote:
> >>> On Fri, Dec 01, 2023 at 07:53:29AM +0100, Jan Beulich wrote:
> >>>> On 30.11.2023 18:37, Roger Pau Monné wrote:
> >>>>> On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
> >>>>>> On 28.11.2023 11:03, Roger Pau Monne wrote:
> >>>>>>> The minimal function size requirements for livepatch are either 5 bytes (for
> >>>>>>> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
> >>>>>>> that size by requesting the compiled to align the functions to 8 or 16 bytes,
> >>>>>>> depending on whether Xen is build with IBT support.
> >>>>>>
> >>>>>> How is alignment going to enforce minimum function size? If a function is
> >>>>>> last in a section, there may not be any padding added (ahead of linking at
> >>>>>> least). The trailing padding also isn't part of the function.
> >>>>>
> >>>>> If each function lives in it's own section (by using
> >>>>> -ffunction-sections), and each section is aligned, then I think we can
> >>>>> guarantee that there will always be enough padding space?
> >>>>>
> >>>>> Even the last function/section on the .text block would still be
> >>>>> aligned, and as long as the function alignment <= SECTION_ALIGN
> >>>>> there will be enough padding left.  I should add some build time
> >>>>> assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.
> >>>>
> >>>> I'm not sure of there being a requirement for a section to be padded to
> >>>> its alignment. If the following section has smaller alignment, it could
> >>>> be made start earlier. Of course our linker scripts might guarantee
> >>>> this ...
> >>>
> >>> I do think so, given our linker script arrangements for the .text
> >>> section:
> >>>
> >>> DECL_SECTION(.text) {
> >>>     [...]
> >>> } PHDR(text) = 0x9090
> >>>
> >>> . = ALIGN(SECTION_ALIGN);
> >>>
> >>> The end of the text section is aligned to SECTION_ALIGN, so as long as
> >>> SECTION_ALIGN >= CONFIG_CC_FUNCTION_ALIGNMENT the alignment should
> >>> guarantee a minimal function size.
> >>>
> >>> Do you think it would be clearer if I add the following paragraph:
> >>>
> >>> "Given the Xen linker script arrangement of the .text section, we can
> >>> ensure that when all functions are aligned to the given boundary the
> >>> function size will always be a multiple of such alignment, even for
> >>> the last function in .text, as the linker script aligns the end of the
> >>> section to SECTION_ALIGN."
> >>
> >> I think this would be useful to have there. Beyond that, assembly code
> >> also needs considering btw.
> > 
> > Assembly will get dealt with once we start to also have separate
> > sections for each assembly function.  We cannot patch assembly code at
> > the moment anyway, due to lack of debug symbols.
> 
> Well, yes, that's one part of it. The other is that some .text coming
> from an assembly source may follow one coming from some C source, and
> if the assembly one then isn't properly aligned, padding space again
> wouldn't necessarily be large enough. This may be alright now (where
> .text is the only thing that can come from .S and would be linked
> ahead of all .text.*, being the only thing that can come from .c),

What about adding:

#ifdef CONFIG_CC_SPLIT_SECTIONS
       *(.text.*)
#endif
#ifdef CONFIG_CC_FUNCTION_ALIGNMENT
       /* Ensure enough padding regardless of next section alignment. */
       . = ALIGN(CONFIG_CC_FUNCTION_ALIGNMENT)
#endif

In order to assert that the end of .text.* is also aligned?

> but
> it might subtly when assembly code is also switched to per-function
> sections (you may recall that a patch to this effect is already
> pending: "common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly
> functions").

Yes, I think such patch should also honor the required alignment
specified in CONFIG_CC_FUNCTION_ALIGNMENT.

Thanks, Roger.

