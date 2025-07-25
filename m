Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC7B11CEC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 12:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057681.1425465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufG6G-0003Xo-62; Fri, 25 Jul 2025 10:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057681.1425465; Fri, 25 Jul 2025 10:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufG6G-0003WN-3M; Fri, 25 Jul 2025 10:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1057681;
 Fri, 25 Jul 2025 10:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfLl=2G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ufG6E-0003WH-Mi
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 10:56:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffc808b2-6945-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 12:56:21 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b775b04b63so534653f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 03:56:21 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45870568fb1sm49842505e9.27.2025.07.25.03.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 03:56:20 -0700 (PDT)
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
X-Inumbo-ID: ffc808b2-6945-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753440981; x=1754045781; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CivgYyV+hO+xwyf/2zniCYGDAOj+U6w1pzJKINHgqFk=;
        b=P47md1nIacuNNNGjqiyNuyKjBa6brUVLf+JPt64a+/guBVIvP+Qx6U5bPXpwHzsTm/
         kNfLNFWX4xM44RkYPnRtNvY61cQuU4ugSEhL3a4LWEgu3DsJ8Lh64ei7cK6VAtq77HbP
         Ui0mkGx62dix7zqOQrE0vh03FjkL4gJPEJE98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753440981; x=1754045781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CivgYyV+hO+xwyf/2zniCYGDAOj+U6w1pzJKINHgqFk=;
        b=c1h6MNj2IhY5QRthAKQDvSS+VFem7hbgXQ8scj7kT5sjX66cP17kvUrC4m+gAuWZgN
         yeg/PdHLvBRPgyODfHieRYApdiJR4/W9PtOErRsuwM37yH0PERgYOUBgdP5g1flJwU8W
         QT0oGmqs5jTFVHwRaoXSTeQJJuoQp0gpAyoOBOB7WnYEQuAqFkiED28Li87fxk5SWdRv
         dj7DN3R5TC+u4Ah2xWO5CuCzsH06d/kCTtZGNybQQe9eLnJoFPvzS2LbbxBcmlvu1T/d
         zLvfHYRlOh/eljSo8Ivg5HKzy3fWwa2JqzT8i34E0vLBRZ8hRfGiR/vPcEzq6v7s5GgC
         /3Lw==
X-Gm-Message-State: AOJu0YwAE38T1RZf0E8/vYu+IuMiZ4aXUpYoNpmcNdP5vMFG5FVvuCL4
	x7oGXv2JeM9looQt/IxOoZJ6ZaxQOs73abrD/UvN7aihxQ9s1hWbRwMfaKV9uzpEsvY=
X-Gm-Gg: ASbGncv4vcefcTPNhYlM/WLGJ1pvT2RQW67FitEiOztKDfjTvHgnKhuzU0DUnKeBTSe
	+D+N38LxUkGcZUCEEoocG9tB5TFf0diExGtK1gycXR1IhbSmsxB4rMHuerl5AvEzCrpMbMkQOpy
	/JFGfc51Imgik+ulAYzIFVXB8hMT5jsFMGCFtNd3meyknwgs4DqJFehMRKVPcpusFTkrAAZiISB
	CklCf3IXiUOq4JCyzgV6yrKtWom1j/0lrT4NYhfzL8XEQWlU8yFHIzH8T5L7sqW4oAJ12+oMRmo
	gAyxssDBSl4T1iTx7u2R8Mb0E+fWSHn4MEYMXaRnewEPTfUnmCRynXhvew5VPi8pyx1+JQee/2d
	HpnWDzgyhC+RDtEXunPGwDKDi9scWiB1B8FxpVc7dx+TJQYuvr8xcOIYw/iOmgzxHLQ==
X-Google-Smtp-Source: AGHT+IGrP+HbIQ1bepLrJUR1A6221tPSdKKzr0VK8JzPujs6HU4qZWWzouGXSW9WS9QjxEmVvO3+VA==
X-Received: by 2002:a05:6000:2505:b0:3b6:1d3:f7e2 with SMTP id ffacd0b85a97d-3b776726977mr1344042f8f.8.1753440980785;
        Fri, 25 Jul 2025 03:56:20 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:56:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
Message-ID: <aINi024baOV5LQgn@macbook.local>
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
 <aICM2hqQoloEahgD@macbook.local>
 <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>

On Fri, Jul 25, 2025 at 12:02:18PM +0200, Alejandro Vallejo wrote:
> On Wed Jul 23, 2025 at 9:18 AM CEST, Roger Pau Monné wrote:
> > On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
> >> Later patches will keep refactoring create_dom0()
> >> until it can create arbitrary domains. This is one
> >> small step in that direction.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> ---
> >>  xen/arch/x86/setup.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> >> index c6890669b9..6943ffba79 100644
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
> >>      if ( IS_ERR(d) )
> >>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
> >>  
> >> -    init_dom0_cpuid_policy(d);
> >> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
> >
> > You possibly want this to be:
> >
> > (d->cdf & (CDF_privileged | CDF_hardware)) == (CDF_privileged | CDF_hardware)
> >
> > To ensure the contents of dom0_cpuid_cmdline is only applied to dom0,
> > and not to the hardware or control domains.  I assume it should be
> > possible to pass a different set of cpuid options for the hardware vs
> > the control domains.
> >
> > Thanks, Roger.
> 
> Why only a hwdom+ctldom, surely a single hwdom should get it too.

hm, not really I think: a late hardware domain would get any custom
cpuid options from the toolstack that created it, or in the
hyperlaunch case from the provided configuration, but not from the
dom0-cpuid command line option I would expect.  Otherwise you have two
different sources of cpuid options, the inheritance from dom0-cpuid,
plus whatever is provided from the hardware domain configuration.

> I can see
> the argument for a ctldom not getting it. For our use case having dom0
> disaggregated is of the essence, so what happens with a hwdom that is not a
> ctldom is fairly important.
> 
> That said, I'm thinking moving in a different direction and have a generic
> init_cpuid_policy() that internally checks for hw or control, or leave the
> default policy or something else.

Right, so instead of introducing init_{hwdom,ctrldom}_cpuid_policy()
equivalents you would rather generalize init_dom0_cpuid_policy() so
it's used by all domains.

> This would remove the conditional and allow much finer selection. e.g: a domain
> brought up through a "nomigrate" DTB node (TBD: nonexisting binding atm) would
> get itsc reported, just as dom0 does today.

We might want to enforce such no migration attribute at the hypervisor
level (by adding a new domain field to signal it possibly?), as this
is all toolstack knowledge ATM.

On a related tangent: domains brought up using hyperlaunch will have a
config file, capable of expressing options like cpuid features I
expect, at which point ITSC could be set in the config file and Xen
won't need to do any guessing?

Thanks, Roger.

