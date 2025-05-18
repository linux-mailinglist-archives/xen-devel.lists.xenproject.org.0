Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE74ABAED5
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 10:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988885.1373292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZkz-0003kN-Uv; Sun, 18 May 2025 08:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988885.1373292; Sun, 18 May 2025 08:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZkz-0003hW-Rg; Sun, 18 May 2025 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 988885;
 Sun, 18 May 2025 08:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGZkz-0003hP-9O
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 08:52:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6caa409a-33c5-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 10:52:27 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-441d1ed82dbso34014495e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 01:52:27 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-24.ptr.icomera.net.
 [185.104.138.24]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a03fsm8654536f8f.22.2025.05.18.01.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 01:52:26 -0700 (PDT)
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
X-Inumbo-ID: 6caa409a-33c5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747558347; x=1748163147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hQPszjAy/1n+/eu+fcw3zTmBHelRbdxongLDQosijs=;
        b=TnvugMPIPkAPKlDDk6Jj0lPnKfzyhUaWVdTW+2t9r/LqZ+8tn7C/lgNuyvre1O9x6T
         bqNFYQ5UrBQnPj4xMJk7QvroeD44nTcL/dvraXm+8V3iKniuR3xuONuZMWZY09bjtBPI
         aL7siWeHdGpKD8tDGcTK3RJWiqFtekHGe+Sp+zUL3ZcV5fVZZal13jNit8+Gq3GSEWv0
         iiJSbuCK+3fZhuOGoqcaUporsjIUvB8KYFAHqSpVgxM9vkP7C1aWErM2+nHECs3Ypxdg
         lVLyRtesNy/6NaCuPRH2KA1ZUNJ0xN+YyAgdQ2PPR39gIR/lASseix2RpXBDfkL1i4k1
         WDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747558347; x=1748163147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hQPszjAy/1n+/eu+fcw3zTmBHelRbdxongLDQosijs=;
        b=WKyj511ex1dQ7YtzmLW+k6PNewFeHfXna3DvktBfrIYiOmm+E0+0y2gFppOWvRWdKo
         FAI2BQaBeuHpDMWvNwS62CiNdBzZv0mjUU2sel7RGzxY2y9DnoQ5ARX+Z3ym6jXTr0wR
         LDj6wkTNVuPZdWz2e2hNZjTq7WCzGAC6HrgrqveFHgdDvjRfmAmzo54+lbaRQhH/mMj3
         8UKijPGix+mGhR8yJFWmTfKlvryYk7qchVhjoQKb8FsvDfh/R7e1cFm53U4AWorb7Qor
         aGTShTIysZmXdnwLjD3Fe5sloCP3HSJOgS5DOzhrbvDz1vYshnHTtqyFx42F18JCU7KX
         k6aw==
X-Forwarded-Encrypted: i=1; AJvYcCVqoDeVDCFaIVqh/p/1Ydhbxb0YiKGpM+JyBqyxuWQphFoKQt88Cq4J/9zgaNxKHWwD7wqW/XxI/wQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr8ASGDxdaZ+FVm8T1oUzUJkrk8MM8tkrwfKptwAA4L3B+FY0M
	wGg0GQQtwmu0y0vQihgcO7/IIq7mFGunE2uE5NMISatcfD5lCE9kxppYC4ZG2DSbSg==
X-Gm-Gg: ASbGnct6AGcmaasMGZtGlX3ZhrQloj0b0Us6VEIZN3oOFnwHDWDFYoCfd11+Lj20lw+
	G5YZasRv8Tllh3E5+/hRIoTYOd6WV7n6JzZ4qrSAZj6zpRYFdCiYY/Wxywbn5xdWRhCo3Xu1Imt
	prwr9oUqNd3numN0KoekAiZfsaWPSs69rUnLdrxwYR+egGjo0psF8SIJTSSQsFW0dnTo22aofLn
	5sJR3iYPxyl/hErbERw5cIWaaf3clo7BypZKGS6U72Bx7yfT+hqHqPSmCC8tGXyZkzEQ24fayG1
	Fxx/9oqbUuYmfSdgktZXxTsCKGpfOCAfA6yRlMzb0r0reCiXA1BMILIHV9c1P/d+S2s2g9x1yH/
	UrF2KNTgEjYD70QYv6Q7IepFBIst6teHpA70=
X-Google-Smtp-Source: AGHT+IGJHM3j1OoqHds2WTop51IEzxWY5/3TYMvbvkv/05LPVVv5adxHDtQ8ALQp90zdkJzj1VAibw==
X-Received: by 2002:a05:6000:2289:b0:3a3:6a2b:ab25 with SMTP id ffacd0b85a97d-3a36a2bac49mr2005435f8f.45.1747558346848;
        Sun, 18 May 2025 01:52:26 -0700 (PDT)
Message-ID: <98c10f03-c5f9-4e89-9aed-596b5cc3f8fd@suse.com>
Date: Sun, 18 May 2025 10:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250516020434.1145337-1-dmukhin@ford.com>
 <20250516020434.1145337-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516020434.1145337-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 04:04, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Currently, hypervisor code has two different non-system domain ID allocation
> implementations:
> 
>   (a) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
> 
>   (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>       max_init_domid (both Arm and x86).
> 
> It makes sense to have a common helper code for such task across architectures
> (Arm and x86) and between dom0less / toolstack domU allocation.
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> common/domain.c based on rangeset.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and
>   use it if ID is not used;
> - Otherwise, perform an exhaustive search starting from the end of the used
>   domain ID range. domid_alloc() guarantees that two subsequent calls will
>   result in different IDs allocation.
While you properly retain original logic now, the above is not an accurate
description thereof, imo. To search "from the end" usually is understood as
a backwards search. Whereas what you mean is that the search starts off where
the last one finished, wrapping around when hitting the end of the valid
range.

Jan

