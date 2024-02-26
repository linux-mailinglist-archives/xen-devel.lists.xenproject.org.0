Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EBB867325
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685481.1066275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZEG-0004A9-A5; Mon, 26 Feb 2024 11:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685481.1066275; Mon, 26 Feb 2024 11:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZEG-00047W-7V; Mon, 26 Feb 2024 11:33:04 +0000
Received: by outflank-mailman (input) for mailman id 685481;
 Mon, 26 Feb 2024 11:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reZEF-00047Q-7K
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:33:03 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc04036d-d49a-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 12:33:00 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512d19e2cb8so4395793e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:33:00 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 f13-20020ac8464d000000b0042e5a324e6dsm2338354qto.76.2024.02.26.03.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:32:59 -0800 (PST)
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
X-Inumbo-ID: cc04036d-d49a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708947180; x=1709551980; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qWRWxbqkGASpuBzi88vpArLnGKEm0KUJs7ZvZBR4hIs=;
        b=tgemmWm999Yshwv6wXy23OuoY0ervubsT1LX5sXb0Y8DlHKHiJVnoEFrkyL+BflFOL
         ieyxJiM0XG66OWJ/F5ao8oeCvVbfuEL9Szsm16K11F89ACkPwB/tjk3P4jJrCBpiKYMW
         7/WFCJzeB+51ZSMvl5wRiuCgfxxiPlhWp1rUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947180; x=1709551980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWRWxbqkGASpuBzi88vpArLnGKEm0KUJs7ZvZBR4hIs=;
        b=hV3EqXRttg46HWMphZRnZenp9vttyZDGZDNgUmkd+EDoiqhERoryYlt6S8eb+t2m6g
         UR1AGQXz7MbQ0HYYP58mBU6dsJvEFyqN8uCDNwDzxKTcVluEzw6tOp/gpeJAIY16jWuT
         chjQOVG8SfemBKaoU8B88rSvjiZQNCgJstVaRT2xmNyAXmgQGCZKhuwBmQk4Zph5zmNJ
         bHL1D2scWxRUsZglCVv0ctFT9+VBNqQyhIZClpomIkEchIgt85+B9vGDuAmEb0oZRliO
         6PUMmRJjhf7NyXsYe1VqGMuxtuKH6dPgHIZ0A2zqyzyBeLXizIj/HCAkq1DkSDFH/4Tr
         d3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfbjezsGvAw9RdqfYauWWGC2FXIYdZvmjl62xzBWfiGLWGZwE6UvKH45hPEIwDvDXTzIK4QhZp4AnsyIX7JuFlzwTmAMSL3y7QaxckZvw=
X-Gm-Message-State: AOJu0YyZEHQ1PoaA8Sr+yS81nKuBNrMYAY6Bhl3/Kl1eeOLd4HUjSXGS
	g8c1ex3oj3ev5Vx36jZMCkH1ZAgu6gHjA/cLUzPdFn/qFYD70r5xI9bVvj7sBOg=
X-Google-Smtp-Source: AGHT+IFz6qRvVq98SDkqeNWpzQY5MFpFKG/zvl850ycjpBpYZQLdZCCHpLWusRd29QdXMQsHKIbXVg==
X-Received: by 2002:a05:6512:3b85:b0:512:eeac:2463 with SMTP id g5-20020a0565123b8500b00512eeac2463mr4315162lfv.14.1708947180336;
        Mon, 26 Feb 2024 03:33:00 -0800 (PST)
Date: Mon, 26 Feb 2024 12:32:56 +0100
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
Message-ID: <Zdx26DwTvcB2zcbw@macbook>
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-4-roger.pau@citrix.com>
 <670e4a5e-4eec-4a2c-9ed1-fcc164b1d76c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <670e4a5e-4eec-4a2c-9ed1-fcc164b1d76c@suse.com>

On Tue, Feb 13, 2024 at 04:58:38PM +0100, Jan Beulich wrote:
> On 07.02.2024 15:55, Roger Pau Monne wrote:
> > The minimal function size requirements for an x86 livepatch are either 5 bytes
> > (for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
> > distance between functions entry points is always at least of the minimal
> > required size for livepatch instruction replacement to be successful.
> > 
> > Add an additional align directive to the linker scripts, in order to ensure that
> > the next section placed after the .text.* (per-function sections) is also
> > aligned to the required boundary, so that the distance of the last function
> > entry point with the next symbol is also of minimal size.
> 
> Perhaps "... minimal required size"?

Yes.

> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -395,8 +395,11 @@ config CRYPTO
> >  config LIVEPATCH
> >  	bool "Live patching support"
> >  	default X86
> > -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> > +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && CC_HAS_FUNCTION_ALIGNMENT
> >  	select CC_SPLIT_SECTIONS
> > +	select FUNCTION_ALIGNMENT_16B if XEN_IBT
> > +	select FUNCTION_ALIGNMENT_8B  if X86
> > +	select FUNCTION_ALIGNMENT_4B  if ARM
> 
> This isn't strictly needed, is it? Would be nice to avoid re-selection
> of what the default for an arch is anyway, as otherwise this will start
> looking clumsy when a couple more architectures are added.

My worry was that the default per-arch could change, ie: for example
x86 moving from 16 to 8 and then it would hamper livepatch support if
IBT is also enabled.  I however think it's very unlikely to reduce the
default alignment, and in any case we would hit a build time assert if
that ever happens.

So yes, I'm fine with dropping those.

> Preferably
> with that dropped (or it being clarified why it's still desirable to
> have):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Roger.

