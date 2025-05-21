Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B0ABEDE3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 10:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991605.1375450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHepP-0006q6-Qj; Wed, 21 May 2025 08:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991605.1375450; Wed, 21 May 2025 08:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHepP-0006nH-NZ; Wed, 21 May 2025 08:29:31 +0000
Received: by outflank-mailman (input) for mailman id 991605;
 Wed, 21 May 2025 08:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHepN-0006nB-HA
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 08:29:29 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ca6e19-361d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 10:29:28 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad545e74f60so744631866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 01:29:28 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cc7a8sm872832366b.171.2025.05.21.01.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 01:29:27 -0700 (PDT)
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
X-Inumbo-ID: b5ca6e19-361d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747816168; x=1748420968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uw9vCptajLCeHOpMP1Xf2Y0cZdP7pIFtckH6kWEL4bg=;
        b=cFY8ELdNgR2e+ZJdIheM5Yv7m3U8fPnR3WDYPs1ivq0dGpiwb8dXnPvkjc2wdrdIDS
         W2G5FVHGS7hvgnnSFq8WDsDy2C3WUWR1G5dUFFwOTfm1fBdFI+KCzr30THpYjS5zrbvB
         gTb1ubwyeNtzLvROOgCGF25qfN9SXk0PynM4K7PleZFPlHYmafHOZiXrdhxBHfWxYJJz
         YHwMCTg0WlAiEcvFagz7F5dNjfO3V8OyWQJLEROje6V7KM+udnWHOsbRyXtr8cIqc0iH
         /CihrVx7I15y+LdED9jxBpToPyKTKQj8MkhhIdAkK0kcgpmN7CvK4qZOVlwJjCZc6HTT
         emxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816168; x=1748420968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw9vCptajLCeHOpMP1Xf2Y0cZdP7pIFtckH6kWEL4bg=;
        b=NQDktDLv7yamw0OI3cUSgh2BRBAz9dcMibJzw6jSSmXP1ckBS5X6yNCnqXSxVxzd74
         D4d2Y3tn3FtcOJ/y24zmHiaCTnsbtOawcbO/Te8wM5wkVTmLNVchAmzT5+EpAHyC9E7O
         Z/zTJ/utCbdeWmc/7mw2PTNdODaEag0hBolmFxH08Kg6OTfdG9HHnndUg7nSupj//qE+
         GOTZFYqxqOSNHG8eRCAFGPcx0d6nwPIMdg5HR1gygmubDHTO/ZxhwI5EzNCrRKwgqeWk
         j63+CcXrZt+Gr3SEsGj3zWjhuU5/U0wAvm6fRZXWRAWTuL9KZEyqKjdSc854SCSD1Tiw
         mvng==
X-Forwarded-Encrypted: i=1; AJvYcCX4GOXpoI4JPCSJb+USv+rVgqOT/55ajvKK6wV34+9CpI+Pl1jmeNf3eT/gap29RK6LaSjl4pApWno=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWdX5tokuy78ovxYu8WL4cDbj9lmrShMDFXQVQjReqprXYAbDw
	cKkeLqzqJ/rDLy5g1xqf+Pf3avBxDeZmkyMT8xVQUA47LY4r4PsbeBMgIeFJd7sptQ==
X-Gm-Gg: ASbGncvo+4knJmHsIiXrJL8eP6uCe4XPVu9zNV/ms3I/VcC0eUFRI3HHl8miDlZ5l6O
	XDbpF8rGBW5AGVu21fd9z5K57WWC/QXygBIb2tOB8qbwKZsA/ihyRlAQfb5tkw/o9sy+hn6N6eR
	Whmxozr0neFJyCtxvts2vxTAzNPd1aLEU0GUfWatu2l+kV6XuyVLBs388OfbKGqzCx2onPoa9AX
	eGWdiy5gRTCs5eg+qPmx4yebgb6f7pgiR/TAqY6Efs32/oF0CrLanss4wsAuKqrcryX1FcRCI4+
	qidk/btw/Wgj8XEQVk7CEwOFg+l9Lr/vJ8Mw+BnVqq+P14We3uNjdmXe4cK18Q==
X-Google-Smtp-Source: AGHT+IEc3+z6LT0G8rfYrS4kGKYLWQvqnYNR3TM89Y0NWuqJ9gZJIvznzeXOgqVuEuOZmw/EhUHffQ==
X-Received: by 2002:a17:907:9805:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ad52d42c08emr1938156766b.3.1747816167942;
        Wed, 21 May 2025 01:29:27 -0700 (PDT)
Message-ID: <7bbc1569-672e-42a7-a5b8-4187282fcb18@suse.com>
Date: Wed, 21 May 2025 10:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Victor M Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org
References: <20250516083159.61945-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516083159.61945-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 10:31, Roger Pau Monne wrote:
> For once the message printed when a BAR overlaps with a non-hole regions is
> not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
> is quite likely overlapping with a reserved region in the memory map, and
> already mapped as by default all reserved regions are identity mapped in
> the p2m.  Fix the message so it just warns about the overlap, without
> mentioning that the BAR won't be mapped, as this has caused confusion in
> the past.

I was trying to get back to this, but my attempt to use this "fixed
message" as an anchor failed: You don't modify any existing message, and
hence I was unable to determine which other message you refer to here.
None of the ones I looked at appear to fit this description.

Jan

