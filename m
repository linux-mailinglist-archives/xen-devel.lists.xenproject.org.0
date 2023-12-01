Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D0D800633
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 09:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645361.1007499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zEL-0008AZ-EF; Fri, 01 Dec 2023 08:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645361.1007499; Fri, 01 Dec 2023 08:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zEL-00088i-B5; Fri, 01 Dec 2023 08:50:37 +0000
Received: by outflank-mailman (input) for mailman id 645361;
 Fri, 01 Dec 2023 08:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8zEJ-00088a-Oa
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 08:50:35 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b055af97-9026-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 09:50:33 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b4744d603so18687445e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 00:50:33 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b0040b3d8907fesm4669413wmo.29.2023.12.01.00.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 00:50:33 -0800 (PST)
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
X-Inumbo-ID: b055af97-9026-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701420633; x=1702025433; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eiH7R8djfQ+T8rS10Cd/5COkzZI3aGHC5G1ysw/b2yg=;
        b=moBmbqs7q0l3lYaDaYns9ZMKRi7poIcqCX9gG5lIWu7EvISUw5f9onAxkaEGYhnhO7
         CucVn1uHhmlySFC/eUGSnn0nm95vTAoHEDYAoOL32TA84tesJQmoCzTeZ1fj6KOfTTa5
         KFGLX6T25mgpRfmCETd6/3VB0+V2FfMEB0btY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701420633; x=1702025433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiH7R8djfQ+T8rS10Cd/5COkzZI3aGHC5G1ysw/b2yg=;
        b=UOfEl8RUa8cR7Lge0L9IUfwOeBnxF3i5MzmVmc/m2RJRUfqOHZSFKJ4Scw9qZYdy8w
         rLvMBQuWmfFxfjaifJYufzDlemSlTRQZ1XZmcqqbB0k3qBSeb5xnF1WXDbT3shlyzBWz
         AkkcBLpekbFJ5L7DEY3DiLe4ZrwqNlyfr7si1pFLUZoeIJ2zfWVHR0i40inhWYvv7wv0
         uFeIWojNzviPJJ+NoCmjd5I/R2ZsPJNG3Y11puFqHqbDirt6jRPfdCkMNV0GEY91FHgs
         /Q8nOIlE67sp6vSr7/aU4g8v8bkzQHnDZe29oi9is0+awMzJUvLJ/FMOczSFAwMJD7qg
         bx5Q==
X-Gm-Message-State: AOJu0YzzYpHX+oDxrs+p/721lWjNshXGD4KEPsv0cEbKQhPUXz7MOxVh
	cBb6TkPN353bHw1vD9IycOs8Xw==
X-Google-Smtp-Source: AGHT+IFau9W2vT0gTHAbjsi10NlLDnqraOjenKtaxTYP9SuUzzf+iikxqAXuVp/+gbsaGNyEoSQOYw==
X-Received: by 2002:a7b:c4d1:0:b0:40b:5e1c:2fa8 with SMTP id g17-20020a7bc4d1000000b0040b5e1c2fa8mr182968wmk.56.1701420633286;
        Fri, 01 Dec 2023 00:50:33 -0800 (PST)
Date: Fri, 1 Dec 2023 09:50:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Message-ID: <ZWmeV-y5RpGAG5cS@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com>
 <ZWjIX0Jo5gW5SEDr@macbook>
 <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com>

On Fri, Dec 01, 2023 at 07:53:29AM +0100, Jan Beulich wrote:
> On 30.11.2023 18:37, Roger Pau Monné wrote:
> > On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
> >> On 28.11.2023 11:03, Roger Pau Monne wrote:
> >>> The minimal function size requirements for livepatch are either 5 bytes (for
> >>> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
> >>> that size by requesting the compiled to align the functions to 8 or 16 bytes,
> >>> depending on whether Xen is build with IBT support.
> >>
> >> How is alignment going to enforce minimum function size? If a function is
> >> last in a section, there may not be any padding added (ahead of linking at
> >> least). The trailing padding also isn't part of the function.
> > 
> > If each function lives in it's own section (by using
> > -ffunction-sections), and each section is aligned, then I think we can
> > guarantee that there will always be enough padding space?
> > 
> > Even the last function/section on the .text block would still be
> > aligned, and as long as the function alignment <= SECTION_ALIGN
> > there will be enough padding left.  I should add some build time
> > assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.
> 
> I'm not sure of there being a requirement for a section to be padded to
> its alignment. If the following section has smaller alignment, it could
> be made start earlier. Of course our linker scripts might guarantee
> this ...

I do think so, given our linker script arrangements for the .text
section:

DECL_SECTION(.text) {
    [...]
} PHDR(text) = 0x9090

. = ALIGN(SECTION_ALIGN);

The end of the text section is aligned to SECTION_ALIGN, so as long as
SECTION_ALIGN >= CONFIG_CC_FUNCTION_ALIGNMENT the alignment should
guarantee a minimal function size.

Do you think it would be clearer if I add the following paragraph:

"Given the Xen linker script arrangement of the .text section, we can
ensure that when all functions are aligned to the given boundary the
function size will always be a multiple of such alignment, even for
the last function in .text, as the linker script aligns the end of the
section to SECTION_ALIGN."

Thanks, Roger.

