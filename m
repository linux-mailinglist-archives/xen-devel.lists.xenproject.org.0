Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94103868C33
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 10:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685923.1067374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1retii-0001En-Qq; Tue, 27 Feb 2024 09:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685923.1067374; Tue, 27 Feb 2024 09:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1retii-0001Bx-OG; Tue, 27 Feb 2024 09:25:52 +0000
Received: by outflank-mailman (input) for mailman id 685923;
 Tue, 27 Feb 2024 09:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1retig-0001Br-KA
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 09:25:50 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31adba96-d552-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 10:25:49 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512b3b04995so4101320e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 01:25:49 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bz8-20020ad44c08000000b0068fa89a5df6sm3945326qvb.124.2024.02.27.01.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 01:25:48 -0800 (PST)
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
X-Inumbo-ID: 31adba96-d552-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709025949; x=1709630749; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pg2sukypEsunK/w9zk0F/rvlrwUsh5HyxJOjDlTANmE=;
        b=Dn+B4LRi/BScYdFydx5HD8SeeGtvACxPNags7iJqwPC7LNtn6xAMTiCGulU9iRQs2G
         1Znz4r+Pm2oftWnu3X4jB3X2c5zZxuB86+Xku2uTL9pqB4Go+R58yP+4VYnV8PcIY8dS
         3hlS1uLrRHl4ntXYTe7vvwhwg+MbIOkebqnjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709025949; x=1709630749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pg2sukypEsunK/w9zk0F/rvlrwUsh5HyxJOjDlTANmE=;
        b=a2p47O0p/zXZ47TP6SBRfoBnccv756tw7E+DNH7LRJ/vnVPZ91v4pB7ii7b9Oe2dNh
         3eeRHE+ZlnyYl/xMWoc6C7VCegPV6U1KnRx1/0oE3fOC4yfJHT0dmNdKlNgdgxBQeCcq
         Ak+YDNWwV7pdBrqx3m3CBiTVRfBjGtH3siH2rnn352rnBrNEfl6JbPtt8ZdpBl4hGAAn
         glbm/FUG3FTC3Voy8VmHIYKPDVDZuT38oRF7nD+B5oNd+FcbxLIKwFOLDSckoOoSbhe+
         6FAsV/wbybUaLi+uFBqL0cIYTmP/bOzDIdN3/lxxwZ+vpYcKMQ9zP8FebEqISi/kFxqX
         FTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZhfWuhrhe1XtbyP6L5Q0mrnKZZcyA88cIsmd2ed5ldH8SXdcuk86xi38uICfhssIWUgwGwWfH2uNjwoZ13E/UBBjBNSMSYbReBQY6uJM=
X-Gm-Message-State: AOJu0Yyu0gs6afrPjkQj9VUDarlTpJBkpEucaxLkC70WtnQlmAr8o/9E
	+AqWWmvCtPzhbrnP5MgY9NGKpCDu8Nb0gAz77jSqJjA/Z3Aah+qThLqdirloWLY=
X-Google-Smtp-Source: AGHT+IFRvMSwlItMxjbfid+D3ha/nqlIya3CneQRT2JRXSk7zhZw1dyZXf7xL9A08dDifuN2Utnsvw==
X-Received: by 2002:a05:6512:3a8f:b0:512:fb30:aade with SMTP id q15-20020a0565123a8f00b00512fb30aademr5099385lfu.3.1709025948747;
        Tue, 27 Feb 2024 01:25:48 -0800 (PST)
Date: Tue, 27 Feb 2024 10:25:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 3/3] xen/livepatch: align functions to ensure minimal
 distance between entry points
Message-ID: <Zd2qmrXTJb9NBdUW@macbook>
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-4-roger.pau@citrix.com>
 <670e4a5e-4eec-4a2c-9ed1-fcc164b1d76c@suse.com>
 <Zdx26DwTvcB2zcbw@macbook>
 <116a9e07-4a6a-4170-bf0f-3a7ccbd68f0e@suse.com>
 <Zd2aH_1yNe8XzlKx@macbook>
 <ce9f469e-50d1-44ab-9914-f3c65ec91f30@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce9f469e-50d1-44ab-9914-f3c65ec91f30@suse.com>

On Tue, Feb 27, 2024 at 09:53:24AM +0100, Jan Beulich wrote:
> On 27.02.2024 09:15, Roger Pau Monné wrote:
> > On Mon, Feb 26, 2024 at 01:36:32PM +0100, Jan Beulich wrote:
> >> On 26.02.2024 12:32, Roger Pau Monné wrote:
> >>> On Tue, Feb 13, 2024 at 04:58:38PM +0100, Jan Beulich wrote:
> >>>> On 07.02.2024 15:55, Roger Pau Monne wrote:
> >>>>> The minimal function size requirements for an x86 livepatch are either 5 bytes
> >>>>> (for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
> >>>>> distance between functions entry points is always at least of the minimal
> >>>>> required size for livepatch instruction replacement to be successful.
> >>>>>
> >>>>> Add an additional align directive to the linker scripts, in order to ensure that
> >>>>> the next section placed after the .text.* (per-function sections) is also
> >>>>> aligned to the required boundary, so that the distance of the last function
> >>>>> entry point with the next symbol is also of minimal size.
> >>>>
> >>>> Perhaps "... minimal required size"?
> >>>
> >>> Yes.
> >>>
> >>>>> --- a/xen/common/Kconfig
> >>>>> +++ b/xen/common/Kconfig
> >>>>> @@ -395,8 +395,11 @@ config CRYPTO
> >>>>>  config LIVEPATCH
> >>>>>  	bool "Live patching support"
> >>>>>  	default X86
> >>>>> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> >>>>> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && CC_HAS_FUNCTION_ALIGNMENT
> >>>>>  	select CC_SPLIT_SECTIONS
> >>>>> +	select FUNCTION_ALIGNMENT_16B if XEN_IBT
> >>>>> +	select FUNCTION_ALIGNMENT_8B  if X86
> >>>>> +	select FUNCTION_ALIGNMENT_4B  if ARM
> >>>>
> >>>> This isn't strictly needed, is it? Would be nice to avoid re-selection
> >>>> of what the default for an arch is anyway, as otherwise this will start
> >>>> looking clumsy when a couple more architectures are added.
> >>>
> >>> My worry was that the default per-arch could change, ie: for example
> >>> x86 moving from 16 to 8 and then it would hamper livepatch support if
> >>> IBT is also enabled.  I however think it's very unlikely to reduce the
> >>> default alignment, and in any case we would hit a build time assert if
> >>> that ever happens.
> >>>
> >>> So yes, I'm fine with dropping those.
> >>
> >> Oh, no - not "those", only "that", i.e. only the last (Arm) one.
> > 
> > Oh, I see what you mean, even x86 selects the default one when IBT is
> > enabled, and when not the requirement for livepatch is < than the
> > default anyway.  That's why I said that we could even drop all of them
> > and just rely on the build time assert to catch any changes here.
> 
> Just to clarify: The default I mean is the architecture imposed one.
> Leaving aside Thumb mode, Arm instructions are all 32-bit words, and
> hence less than 4-byte alignment makes no sense (and may even be
> disallowed by the architecture). Whereas for x86 what you're talking
> about is just a compiler default, which isn't really guaranteed to
> never be lower (with -Os for example I'd expect it to be perhaps as
> low as 1).

Right, it's a compiler default, but in patch 1 we already set the
default alignment for x86 to be 16 bytes.

When in your first comment you mentioned "... default for an arch is
anyway" I assumed you mean the default in the arch Kconfig file, not
what the ISA mandates.

Thanks, Roger.

