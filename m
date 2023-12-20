Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A852819B3D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657499.1026374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsjp-00047I-0l; Wed, 20 Dec 2023 09:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657499.1026374; Wed, 20 Dec 2023 09:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsjo-00044y-UP; Wed, 20 Dec 2023 09:19:36 +0000
Received: by outflank-mailman (input) for mailman id 657499;
 Wed, 20 Dec 2023 09:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFsjn-0003PP-GI
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:19:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3343231-9f18-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:19:33 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so59296915e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:19:33 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 bd8-20020a05600c1f0800b0040c44b4a282sm6601137wmb.43.2023.12.20.01.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 01:19:32 -0800 (PST)
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
X-Inumbo-ID: e3343231-9f18-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703063973; x=1703668773; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/Laim6OxH3l6g9LnE7PaxHVhjpomMuhc0L9ZfiA7Q4=;
        b=ZaX1C+OPMTLzviHB6wgLaZmKocfIahA2SSqGfCbIR4mhRh3kPXXmFQwcfqmdHruCJ5
         ubphsNyGLWtOZUb57jVcbVBbe6nWUARQZtKFDd4q7nugT/gyf8ktl7vo3H8ZW0J3qQjC
         fW5F4VxQT3iOJ0u9Snx2l3ht5DBdodWHpUJec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703063973; x=1703668773;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/Laim6OxH3l6g9LnE7PaxHVhjpomMuhc0L9ZfiA7Q4=;
        b=AFcCJEX6VN5+GZ9VrcMVCERt/DqoG48mQ3c7o7c0RZCZoYMusmmtlYAS9FAxGr+RHV
         mwb3DC3ufZoNOJPgrdbGf8flxEFle6pFPPnBpKcCb+KGqo4qmiP38GxQIxj09YprBrTM
         EydTwPFT7V8CJPLJ3bThJO/vUOFdM96ys5qH92HihHGqMJRioKDqrE7Ocu6TgZA+tU46
         myAnZgTWk+OGddGJKnzRRq+N8Ejc3Dru2rUn4RGyZMCGxKm2FXlohi24UWtgVYpJ1YIv
         F7zj8R+5B6JddPrPxosQ2z/vjuZ5TBb5hJSbOlBoPgivvd0lNAMTB2FuAAZaOJdgATPf
         gDLQ==
X-Gm-Message-State: AOJu0YzN0GeRDnVrXtXoNWAqRkr1MdFd/QVbmKLoHuEMGly9tqjIvgyd
	N1xSn/oDDQVyKxj/HRxXiBr2mQ==
X-Google-Smtp-Source: AGHT+IGk3+M85VTK2ERaNenJ8Q64Jyve113QG/m7lMtzWkcVtJakwbhUlAZZe4wPMM6ENkQFi+SmfA==
X-Received: by 2002:a7b:cb92:0:b0:40c:3308:3b02 with SMTP id m18-20020a7bcb92000000b0040c33083b02mr10649170wmi.99.1703063973107;
        Wed, 20 Dec 2023 01:19:33 -0800 (PST)
Date: Wed, 20 Dec 2023 10:19:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Message-ID: <ZYKxpFugdO-CUZam@macbook>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-2-roger.pau@citrix.com>
 <bc08ed7e-766d-4f0e-a7ef-994d09d1dbe2@citrix.com>
 <ZYKmn-lvKQpauL6Z@macbook>
 <87e185ab-6129-41ea-8424-9484659840d1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87e185ab-6129-41ea-8424-9484659840d1@suse.com>

On Wed, Dec 20, 2023 at 10:03:51AM +0100, Jan Beulich wrote:
> On 20.12.2023 09:32, Roger Pau Monné wrote:
> > On Tue, Dec 19, 2023 at 07:46:11PM +0000, Andrew Cooper wrote:
> >> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
> >>> The minimal function size requirements for livepatch are either 5 bytes (for
> >>
> >> "for an x86 livepatch", seeing as we're touching multiple architectures
> >> worth of files.
> >>
> >> I know it's at the end of the sentence, but it wants to be earlier to be
> >> clearer.
> >>
> >>> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
> >>> that distance between functions entry points is always at least of the minimal
> >>> required size for livepatch instruction replacement to be successful.
> >>>
> >>> Add an additional align directive to the linker script, in order to ensure that
> >>> the next section placed after the .text.* (per-function sections) is also
> >>> aligned to the required boundary, so that the distance of the last function
> >>> entry point with the next symbol is also of minimal size.
> >>>
> >>> Note that it's possible for the compiler to end up using a higher function
> >>> alignment regardless of the passed value, so this change just make sure that
> >>> the minimum required for livepatch to work is present.  Different compilers
> >>> handle the option differently, as clang will ignore -falign-functions value
> >>> if it's smaller than the one that would be set by the optimization level, while
> >>> gcc seems to always honor the function alignment passed in -falign-functions.
> >>> In order to cope with this behavior and avoid that setting -falign-functions
> >>> results in an alignment inferior to what the optimization level would have
> >>> selected force x86 release builds to use a function alignment of 16 bytes.
> >>
> >> Yuck :(
> >>
> >> The same will be true for all other architectures too?
> > 
> > I would expect that for gcc I guess.
> > 
> >> What happens on ARM, which also picks up an explicit choice in livepatch
> >> builds?
> > 
> > Arm AFAICT seems to use a 4 byte function alignment with -O2 (both gcc
> > and clang), so that matches what we need to enforce for livepatch.  If
> > we ever need a higher alignment for livepatch reasons it would be a
> > multiple of the minimum one set by the compiler, so that should be
> > fine.
> 
> Thinking of it: The forcing of 16-byte alignment in release builds of x86
> is based on observations with certain compiler versions, iirc. What if
> future versions decide to go lower/higher for, perhaps, very good reasons?
> We don't really mean to override the compiler's choice, so maybe further
> probing is actually necessary?

We do override the default (on gcc) when using livepatch anyway, so we
might as well be consistent and attempt to provide a value that's
reasonable?

Linux currently uses 16-byte also on x86 and set in Kconfig, and all
compiler versions I've tested use 16-bytes with -O2, so I think it's
unlikely to change overnight (and a lot of software will still use 16
anyway).

If a more suitable value is needed in the future we can always adjust,
that's the whole point of having it in Kconfig.  We can also select a
better value even in compilers that might not know about it.

Thanks, Roger.

