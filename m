Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E7B2DDAC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 15:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087468.1445507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoimX-0006Oz-42; Wed, 20 Aug 2025 13:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087468.1445507; Wed, 20 Aug 2025 13:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoimX-0006Mi-1P; Wed, 20 Aug 2025 13:23:13 +0000
Received: by outflank-mailman (input) for mailman id 1087468;
 Wed, 20 Aug 2025 13:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0ee=3A=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uoimV-0006Mc-G6
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 13:23:11 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d120d3c4-7dc8-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 15:23:10 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b066b5eso34461365e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Aug 2025 06:23:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b47c29be6sm35098825e9.5.2025.08.20.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 06:23:09 -0700 (PDT)
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
X-Inumbo-ID: d120d3c4-7dc8-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755696190; x=1756300990; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nca8j07YWORlafoQu2r/Sn7ocEyEHy7i27QbrcQ4Xqk=;
        b=Ih0LG7aqphzy/6dKbnIuvpa7ujpWdbnvdjOAGzBqCUCXHM+rHNbnVYMjjtLZhUA/X9
         Uh2LqCPoKqgeJ3HjfoFxeZ1NZYSOYe7/9jyXRJfPYD5dOUbGB+O2CaGJz0xccl5U85rZ
         +oidlSxRR0r2JRo1ZmoKVTDMSTECSRYkJAHho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755696190; x=1756300990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nca8j07YWORlafoQu2r/Sn7ocEyEHy7i27QbrcQ4Xqk=;
        b=j8+H2o3GaJq9Fe+ABtWmP3uWKr+MiM5xhgesZrhxlEzJKFVVAx/zL+jKE1wMAv3iH3
         jkogaWMYb7WT7h+6drSK+nyX6z2PgzrGS7CjanaT+MaP+2hN29gOgsBplDDjLUtq9dKE
         bN9bvAEdP4zMX3UzeXCrAgEotuLFzbc0raOI+3QH0nWWq3jdjNbGoRrtvO4n7uI57vVa
         WyJEvesgWKdZGztjR+GTh7EVzJIMdu9HPjXZa/ZlKxohZCr+ft2VUol/IQxreYdFj9rF
         EeGdtlOFPK50Da7A4qnsJMxdQG39RSvjyCSjTVpCj0d2qpGmiXVAMrqq3BPq4V5T15u/
         r3Wg==
X-Gm-Message-State: AOJu0Yw8pCajiAaG7bXXnLtmeqI3puPrZMKzLx0A+KdaEUy5fdZoks/M
	OvXDzARNGRfdrvOLn17IWgeKdsB7+rqlWTCP16AV2u65imT9KWzzLCRABxhcv/oc+tc=
X-Gm-Gg: ASbGncsQkO0Nf5gczA45/poc8HzAXKyhAotkL23pE7quCn3DmfbsWnhZf8Drj07U2R5
	yeKNH0iUlpYF53IYtPsp/Q9+r4bY1357DvxoWFgmcTEBjkj1knhEcuNO2gg1rwMPKP2/en4KZCL
	bcXspzQtZ9KqdTBQ0LS5YGIAwydYyZQdOaziGn0q3uoqitLWcAv5kIN34dgIdy70jnTlR2fB/WM
	Q7dO0PSeImaF9A4YiKV7rDXQqzNvZHrG7yk19Mxo5+RrW6uQUjH6aPr7KOBo7IAD4xsFBFm8Yb5
	GEDeJO05TW0Cvi80UbsGz5W4WWYTW6LdBfPskQ1xcZyFD0hZ+XkCelcMoWCTFPDFC0DDIZbSixX
	vmuyllS4/3UuBVW4t1geXKlU6Q5vAOSoku69/yrvcDVQjlcAkD50Jfbd0D5chE5kwRA==
X-Google-Smtp-Source: AGHT+IHP+zriFXjutB2mI8oVKEHUc2pA9Hh9UjUikzJzyLg3DTrprEjkuLf6M54PVwfCeJfG7QJNjA==
X-Received: by 2002:a05:600c:354c:b0:459:aa0a:db2d with SMTP id 5b1f17b1804b1-45b47a0ec9bmr21572465e9.28.1755696189621;
        Wed, 20 Aug 2025 06:23:09 -0700 (PDT)
Date: Wed, 20 Aug 2025 15:23:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/iommu: setup MMCFG ahead of IOMMU
Message-ID: <aKXMPFjxuS0bpr8e@macbook.local>
References: <20250819171826.60700-1-roger.pau@citrix.com>
 <6852c430-155c-4530-8aa6-67a6e97ef6b3@citrix.com>
 <aKWykl7UiTZmtGYW@macbook.local>
 <541c8586-b77b-478a-9dae-cde7884ee57d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <541c8586-b77b-478a-9dae-cde7884ee57d@citrix.com>

On Wed, Aug 20, 2025 at 12:37:51PM +0100, Andrew Cooper wrote:
> On 20/08/2025 12:33 pm, Roger Pau Monné wrote:
> > On Tue, Aug 19, 2025 at 07:23:57PM +0100, Andrew Cooper wrote:
> >> On 19/08/2025 6:18 pm, Roger Pau Monne wrote:
> >>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> >>> index 6fb42c5a5f95..bd648323bfed 100644
> >>> --- a/xen/arch/x86/setup.c
> >>> +++ b/xen/arch/x86/setup.c
> >>> @@ -1938,11 +1938,10 @@ void asmlinkage __init noreturn __start_xen(void)
> >>>      setup_system_domains();
> >>>  
> >>>      /*
> >>> -     * Ahead of any ACPI table parsing make sure we have control structures
> >>> -     * for PCI segment 0.
> >>> +     * Initialize PCI (create segment 0, setup MMCFG access) ahead of IOMMU
> >>> +     * setup, as it requires access to the PCI config space.
> >>>       */
> >> Again, this isn't terribly clear IMO.
> >>
> >> "ahead of IOMMU setup, as the IOMMUs might not all live on segment 0." ?
> > It's not just IOMMUs, but for example on VT-d we also need to poke at
> > the config space of bridges, and when such bridges live in segment > 0
> > that results in garbage being returned.
> >
> > I'm not sure acpi_iommu_init() accesses the IOMMU PCI device config
> > space, but it does at least access the config space of bridges in
> > order to detect hierarchy.  See how acpi_parse_dev_scope() performs
> > PCI reads.
> >
> > What about using:
> >
> > /*
> >  * Initialize PCI (create segment 0, setup MMCFG access) ahead of IOMMU
> >  * setup, as devices in segment > 0 must also be discoverable.
> >  */
> 
> Yeah, that works.
> 
> With those comment adjustments, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Forgot to add it, this patch should have:

Fixes: 3950f2485bbc ('x86/x2APIC: defer probe until after IOMMU ACPI table parsing')

In the commit message.

Thanks, Roger.

