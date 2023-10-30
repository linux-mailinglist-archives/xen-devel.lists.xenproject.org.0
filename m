Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4347DBC85
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625195.974232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxU6x-0006uu-UO; Mon, 30 Oct 2023 15:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625195.974232; Mon, 30 Oct 2023 15:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxU6x-0006sf-Rp; Mon, 30 Oct 2023 15:23:27 +0000
Received: by outflank-mailman (input) for mailman id 625195;
 Mon, 30 Oct 2023 15:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxU6w-0006sV-I0
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:23:26 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 451be4d7-7738-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:23:25 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9c773ac9b15so689307566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 08:23:25 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 v13-20020a170906564d00b009c74c56d71dsm6190488ejr.13.2023.10.30.08.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 08:23:25 -0700 (PDT)
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
X-Inumbo-ID: 451be4d7-7738-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698679405; x=1699284205; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ZaDyAaxmEd7xtQYCZdb/vfUPBQtnW0nFhGBd9NlsfI=;
        b=Qa8EsISLAjc7mRKMjlCHpAMb8ErIzI2QhylEeiJM8tpqrtMdAQcih8Z10WT76yY1QA
         QwvZWj6UKHQ+VZQ0/VpVPsA7OZ56dLZ2ScW1MfPCfPTRYY6tNHjVryfYqE4LSBnK/w7F
         wm9uJUayJmr717mamw7Fv5yleWShZeA2dFiBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698679405; x=1699284205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZaDyAaxmEd7xtQYCZdb/vfUPBQtnW0nFhGBd9NlsfI=;
        b=a3EzVB7rNDShAbYZI/P/24uXZZs1rUfuBcY2gCR1D0eR3QoDqXOIalKZUaezg847sp
         4d1QA/Kpn/rtHkiqhmcc47v4VmgAgWEtYKSafOTlBA+GsE3uEjI2OlHcsmImf6XoRtNF
         EXA0j5mzKG/ULFAawuv+jlZvOZe2J/5jolydw6B6pFjCG+7fol/EpLyzfCGYdsrgfvLz
         DnYubgRYX3MY+ApBz1Rk0b9euw6kksi8oA3/Ff0sgnkEPD9kYYKKFdH8cUPNJJuK4m4y
         Gv/ixOmdkEKhYegRb7Z80Uc1ncjYD/x3LeM9GHIkn5KPpFhaKaujGj6jTQhD0VAl6f8A
         R2WA==
X-Gm-Message-State: AOJu0YwTCLKMIBrG0VSTvCxGtRM1NAbFNEj3YSQvvf2R5JmPL+BpRjD0
	op4HEWll+uK2qkIF6wYmKaZDkA==
X-Google-Smtp-Source: AGHT+IHEkIQ5PBU2n/s/WapZ/eSj/8DX1Fc0v/DQKGYDb1s4Cv8Cm/GUjBRhQvAY2l2v42L67qk5Og==
X-Received: by 2002:a17:907:3fa4:b0:9be:8ead:54c7 with SMTP id hr36-20020a1709073fa400b009be8ead54c7mr9328758ejc.12.1698679405264;
        Mon, 30 Oct 2023 08:23:25 -0700 (PDT)
Date: Mon, 30 Oct 2023 16:23:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Message-ID: <ZT_KbM0tzrn5cWR6@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com>
 <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com>
 <ZTponIYDYDWRZhzi@macbook>
 <75026813-03fe-3a46-2274-b93e98f62f89@suse.com>
 <ZTqDjNSBmXeblsud@macbook>
 <d3da9300-781f-9abb-158b-0c82d36228f5@suse.com>
 <ZT_IP_-X4oLhmcFT@macbook>
 <e4929b28-5608-bba8-9953-270f408e32eb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4929b28-5608-bba8-9953-270f408e32eb@suse.com>

On Mon, Oct 30, 2023 at 04:19:22PM +0100, Jan Beulich wrote:
> On 30.10.2023 16:14, Roger Pau Monné wrote:
> > On Mon, Oct 30, 2023 at 01:24:52PM +0100, Jan Beulich wrote:
> >> On 26.10.2023 17:19, Roger Pau Monné wrote:
> >>> Maybe the issue is that PV_SHIM_EXCLUSIVE shouldn't have been a
> >>> Kconfig option in the first place, and instead a specific Kconfig
> >>> config file?
> >>>
> >>> Maybe it's not possible to achieve the same using just a Kconfig
> >>> config file.
> >>
> >> I'm afraid I don't understand what you mean by "Kconfig config file". It
> >> can't really be just another .../Kconfig file somewhere in the tree, as
> >> it doesn't really matter where an option like this would be defined.
> > 
> > No, I was thinking of splitting what PV_SHIM_EXCLUSIVE actually
> > implies, for example by adding CONFIG_DOMCTL_HYPERCALLL or
> > CONFIG_PLATFORM_HYPERCALL and re-work the pvshim_defconfig config file
> > based on those, so that we don't end up with negative relations.
> > 
> > Note sure all usages of PV_SHIM_EXCLUSIVE can be split in such a way,
> > maybe we would need some compromise.
> 
> Wouldn't such a CONFIG_DOMCTL_HYPERCALL then still want to depend on
> !PV_SHIM_EXCLUSIVE, which is the kind of dependency we want to avoid?
> Aiui the two (splitting and inverting) are largely orthogonal aspects.

No, CONFIG_DOMCTL_HYPERCALL could be promptless option enabled by
default and disabled by the pvshim_defconfig.

Thanks, Roger.

