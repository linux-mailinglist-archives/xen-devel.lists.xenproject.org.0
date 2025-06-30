Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95E3AEE1C9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029192.1402950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWG1p-0006X4-Ps; Mon, 30 Jun 2025 15:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029192.1402950; Mon, 30 Jun 2025 15:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWG1p-0006Vf-NF; Mon, 30 Jun 2025 15:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1029192;
 Mon, 30 Jun 2025 15:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gInu=ZN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uWG1p-0006VZ-4F
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:02:41 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4426c90e-55c3-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 17:02:39 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-553e5df44f8so1860368e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:02:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453823c3a96sm167963555e9.35.2025.06.30.08.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:02:37 -0700 (PDT)
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
X-Inumbo-ID: 4426c90e-55c3-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751295759; x=1751900559; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7YoGUf03nNHc23pGqIpN0E8oGD/61oc/rFi2yceFM4=;
        b=vWIETvTvB6WlWeuG+WNZ5AaReAoTQVY/zV/IcSHyzCCaVowj+mDO61sj9oqCccm3a2
         Bljrpn5Nbzj2ZZ0Swr2JAdaM8X8oc8FrhLbbNYCEjsWMThE+TuRLE+9KtG1kVRrpzY8e
         paMrT92TzmICO/z1FnB0SAH5DzEUqNALT+HSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295759; x=1751900559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7YoGUf03nNHc23pGqIpN0E8oGD/61oc/rFi2yceFM4=;
        b=XjNGelE0yyn3jTMpkJsz97zevv7FNo5HldnVPe2+cgwF4YUTrM2Magt+K6IZIcZfLx
         aXZDsuUWFVe90Jqmui0r69HU4tsyXbYU1jw5CvHhw3au2R/Zi+lLzvUCXWLF3Z5avqLH
         59/jskirbe+Q9LUbfn5au+FnyvPJQBmkWQ+XFrPDrChuF+JEgORxxitVeaa40yySYq/N
         nVYQ/5fdCIuEW4AoHm3IvtJOOACUsihVcP+AcT9RGflbvsIxyKCnrgE87p/XQNxBhq7D
         05wEuCV6+fUZOuHzD2dVcsjC2uCL6ZeoNFAHRJZUJogFuMuYNwKTtorJAID8Vc644l56
         xDow==
X-Gm-Message-State: AOJu0YyU/wJh7nYyv6NJcUsJwg7Dm8By/VsE0qTROPEqw8qaZqt50ZDZ
	9AWmzCCKWZtimqFgfL6QXm8DjqrOyl5kAZBpgBXalvEYG+arn0BLnF9yKOwjdw6+VZk=
X-Gm-Gg: ASbGnctXq6ggyqZ1LdVs2ipU6MxHQf6NDgRl6ha20n3OGOwGiM9SymR4b1DP0RiUrh+
	qBC44MuR7NqFZ5SWDLWsiHO0M3ilHYvKX91PxKgcYd8/VxwoyCuwmbERTYPLmQXP182ktQrLEhH
	58d/W+i639541oa9tTNplnjJ+Z7j7CLUWMv1trWhhSG7cwnLLSnaFvPe2dJdfGY/g5pOYq2crhL
	MEejkI6aWpeVtFIeohrDncQP7vtLCoIZEAO7W6GQMboFUnxG5mgFNPaa5E+222Ygg4G4WkLtsBZ
	SiqAoWNe/KSkSHTxlaloSnbW2SeWv2QcABZJadIH4Ogbnfu6I3tamMgsY0lCBwSe5mGnWvxymkD
	HeBa5GjT1Vs98tc+VXl/UDcAGwZceyA==
X-Google-Smtp-Source: AGHT+IE6PyEu0Gpdyx7EYWpT7BLmEUCICztHujwP+jgLOIL2s9BPdMnpmd1HQR6jANUNchcOgiQ+EA==
X-Received: by 2002:a05:6512:ba1:b0:553:3028:75bd with SMTP id 2adb3069b0e04-5550b8d01edmr4031983e87.49.1751295758256;
        Mon, 30 Jun 2025 08:02:38 -0700 (PDT)
Date: Mon, 30 Jun 2025 17:02:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
Message-ID: <aGKnDHtRD5OLGaYj@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>

On Fri, Jun 27, 2025 at 07:08:29PM -0700, Stefano Stabellini wrote:
> Hi Roger,
> 
> We have an ARM board with the following memory layout:
> 
> 0x0-0x80000000, 0, 2G
> 0x800000000,0x880000000, 32GB, 2G
> 0x50000000000-0x50080000000 5T, 2GB 
> 0x60000000000-0x60080000000 6T, 2GB 
> 0x70000000000-0x70080000000 7T, 2GB 

With the current PDX mask compression you could compress 4bits AFAICT.

> It looks like your PDX series is exactly what we need.  However, I tried
> to use it and it doesn't seem to be hooked properly on ARM yet. I spent
> some time trying to fix it but I was unsuccessful.

Hm, weird.  It shouldn't need any special hooking, unless assumptions
about the existing PDX mask compression have leaked into ARM code.

> As far as I can tell the following functions need to be adjusted but I
> am not sure the list is comprehensive:
> 
> xen/arch/arm/include/asm/mmu/mm.h:maddr_to_virt

At least for CONFIG_ARM_64 this seems to be implemented correctly, as
it's using maddr_to_directmapoff() which should have the correct
translation between paddr -> directmap virt.

Also given the memory map above the adjustments done in ARM to remove
any initial memory map offset should be no-ops, since I expect
base_mfn == 0 in setup_directmap_mappings() in that particular case,
and then directmap_mfn_start = directmap_base_pdx = 0 and
directmap_virt_start = DIRECTMAP_VIRT_START.  FWIW, if ARM uses offset
compression the special casing about removing the initial gap can be
removed, as the compression should already take care of that.

> xen/arch/arm/mmu/mm.c:setup_frametable_mappings
> xen/arch/arm/setup.c:init_pdx

I've attempted to adjust init_pdx() myself so it works with the new
generic PDX compression setup, it seemed to work fine on the CI, but I
don't have any real ARM machines to test myself.

Is there a way I could reproduce the issue(s) you are seeing with
QEMU?

I'm already working on v3, as this version implementation of
mfn_valid() is buggy.  Maybe that's what you are hitting?

Regards, Roger.

