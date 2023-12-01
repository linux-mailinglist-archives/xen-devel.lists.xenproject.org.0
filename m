Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CADD80081B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 11:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645414.1007598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90eG-0003bg-1P; Fri, 01 Dec 2023 10:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645414.1007598; Fri, 01 Dec 2023 10:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90eF-0003Yz-UU; Fri, 01 Dec 2023 10:21:27 +0000
Received: by outflank-mailman (input) for mailman id 645414;
 Fri, 01 Dec 2023 10:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r90eF-0003Yt-6C
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 10:21:27 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61b529d8-9033-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 11:21:25 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bce40bc4aso2154678e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 02:21:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b004063c9f68f2sm4960019wmo.26.2023.12.01.02.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 02:21:24 -0800 (PST)
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
X-Inumbo-ID: 61b529d8-9033-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701426085; x=1702030885; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEQPU2rhvo5MhW8JkaKGRulutl+AEknQY9vTs48oRYA=;
        b=TjI/IEmA8MLvjULWyjrtmxcLsdx2s2L90aFyx7UNKGvwpwFw0YhKn2S5rgjKBbh06a
         nBapd9iJRzRu+1TpPpvpVqbZt780zTKw7+160BhjhZnuB67/NqKVtk+L32rzWHGFsiu0
         UngcPg9RalcZ5LdS0JuvELKpqEcYXQc+jdNZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426085; x=1702030885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEQPU2rhvo5MhW8JkaKGRulutl+AEknQY9vTs48oRYA=;
        b=s5z0VCk/OwhIHEFLRxmyAKDOmALtKE5GcbDCeE737efftOkXG5WIdsL5/bNAyzwyR6
         vDArxSUfuQHe5DSp41T8kwEBoOYvNiz3wmyK6w8TG63KJXv2j1pXStW5bwOFIaH3+sxf
         NHSkvfTxZfv2NIn0Yen7iuFgjxBxSQnX6xPbWxf3YBv26Bi9EguTv+Y/ujs9QJ6/fA96
         FjwvfRDlfY/hYncBFqcB8MiYC3Dkr0UysLe+J3u+eeBgcXbrj1ZkTjySOX49yhECAab3
         Ix7Y0vv6YXlz6/mHTwG98M5tgSa4aQ59UIm/mugcatOm33spmSOk+FwbA9YDVIwEpGQq
         zo+Q==
X-Gm-Message-State: AOJu0YzjdtEwvuKinb7en8FL1k/rkPEXIa5udlfT+m4sgQmIVpadvkuM
	sUwBJP58KBAbX1K6tNjLlByixg==
X-Google-Smtp-Source: AGHT+IGaXF8PdxB8e8Fn7nEGyovZItPoDZU7zx5DZrDYxfUHOhVHjWk4dEzZI2K6YfxwhI7bdEb/tg==
X-Received: by 2002:a05:6512:33cb:b0:50b:d764:803d with SMTP id d11-20020a05651233cb00b0050bd764803dmr770965lfg.112.1701426084782;
        Fri, 01 Dec 2023 02:21:24 -0800 (PST)
Date: Fri, 1 Dec 2023 11:21:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Message-ID: <ZWmzo68abRmRtfwN@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com>
 <ZWjIX0Jo5gW5SEDr@macbook>
 <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com>
 <ZWmeV-y5RpGAG5cS@macbook>
 <0d9bc0cd-3719-4961-ae7d-3e27508000a2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d9bc0cd-3719-4961-ae7d-3e27508000a2@suse.com>

On Fri, Dec 01, 2023 at 10:41:45AM +0100, Jan Beulich wrote:
> On 01.12.2023 09:50, Roger Pau Monné wrote:
> > On Fri, Dec 01, 2023 at 07:53:29AM +0100, Jan Beulich wrote:
> >> On 30.11.2023 18:37, Roger Pau Monné wrote:
> >>> On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
> >>>> On 28.11.2023 11:03, Roger Pau Monne wrote:
> >>>>> The minimal function size requirements for livepatch are either 5 bytes (for
> >>>>> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
> >>>>> that size by requesting the compiled to align the functions to 8 or 16 bytes,
> >>>>> depending on whether Xen is build with IBT support.
> >>>>
> >>>> How is alignment going to enforce minimum function size? If a function is
> >>>> last in a section, there may not be any padding added (ahead of linking at
> >>>> least). The trailing padding also isn't part of the function.
> >>>
> >>> If each function lives in it's own section (by using
> >>> -ffunction-sections), and each section is aligned, then I think we can
> >>> guarantee that there will always be enough padding space?
> >>>
> >>> Even the last function/section on the .text block would still be
> >>> aligned, and as long as the function alignment <= SECTION_ALIGN
> >>> there will be enough padding left.  I should add some build time
> >>> assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.
> >>
> >> I'm not sure of there being a requirement for a section to be padded to
> >> its alignment. If the following section has smaller alignment, it could
> >> be made start earlier. Of course our linker scripts might guarantee
> >> this ...
> > 
> > I do think so, given our linker script arrangements for the .text
> > section:
> > 
> > DECL_SECTION(.text) {
> >     [...]
> > } PHDR(text) = 0x9090
> > 
> > . = ALIGN(SECTION_ALIGN);
> > 
> > The end of the text section is aligned to SECTION_ALIGN, so as long as
> > SECTION_ALIGN >= CONFIG_CC_FUNCTION_ALIGNMENT the alignment should
> > guarantee a minimal function size.
> > 
> > Do you think it would be clearer if I add the following paragraph:
> > 
> > "Given the Xen linker script arrangement of the .text section, we can
> > ensure that when all functions are aligned to the given boundary the
> > function size will always be a multiple of such alignment, even for
> > the last function in .text, as the linker script aligns the end of the
> > section to SECTION_ALIGN."
> 
> I think this would be useful to have there. Beyond that, assembly code
> also needs considering btw.

Assembly will get dealt with once we start to also have separate
sections for each assembly function.  We cannot patch assembly code at
the moment anyway, due to lack of debug symbols.

Thanks, Roger.

