Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE76AF9A22
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 19:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033600.1406937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXkZg-0002KG-JI; Fri, 04 Jul 2025 17:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033600.1406937; Fri, 04 Jul 2025 17:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXkZg-0002Ip-GU; Fri, 04 Jul 2025 17:51:48 +0000
Received: by outflank-mailman (input) for mailman id 1033600;
 Fri, 04 Jul 2025 17:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9FN=ZR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXkZe-0002Ij-Mo
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 17:51:46 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bc68b03-58ff-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 19:51:43 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-453066fad06so8222085e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 10:51:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b47225a4e1sm3017984f8f.74.2025.07.04.10.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 10:51:42 -0700 (PDT)
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
X-Inumbo-ID: 8bc68b03-58ff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751651503; x=1752256303; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W77tNreRPJQBVuNBI6j0n52aIgFeC0bceW25Zn1SucQ=;
        b=KlF/9rIAyailHiOfvYpF3ENEoXCuVsr2Pi4VmNobXwiI96IbvmKkEPJlICkK9bYj4d
         e13dTEIVfje2z/X1eOyumJ+lPaSBjH87FdfVHHuRMzhcdJlH8m3onVLCJYH0AvgK50pQ
         rDihChBHwJLgtjcpPqJ6Z8f/lam2CFrk+Mf9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651503; x=1752256303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W77tNreRPJQBVuNBI6j0n52aIgFeC0bceW25Zn1SucQ=;
        b=dQQmILwFclu4NZB8jjQmZDV0ZXLK1H4yvAts1Wtdde4TCgnpdSiDw9cKmBRKosZxMz
         m95Js/jBv+yFkYPtnHYO4Ka4G9OI4xaKjMDIJKWjQFD9fIwUVphW0wgiqCdR46M2crX2
         CE+Jmcr9SnvdDZT0WxkgdXoqqMCz1Dtq9AM4+v+B/dBPCtqLbGU2wlQ3F+2yH0w2eFLC
         XtKoQuYipOPvxxOHPiRnhlFOyIYMT/f5OM4xSGCiuxR3vQc6veeeaT8739iceGlv7bs2
         bzZw2SR3RvacTK1JWKTL1o1DzDhi+ImAEFYsaOj/2gOibx11HS8HF0N8Cpz8H2BH+mz1
         sdmA==
X-Gm-Message-State: AOJu0YzuVIvycwxGZdOYYHvDDyR8nI4Jn+vL+SbfbdU8jS7yrTPSjuIZ
	D7CAaSB7TmDgPOUqikZd+WdaMwoGj0tazvdZWMk9bMjZQ0YZvAF8HgVYX7HS+Q0OfWE=
X-Gm-Gg: ASbGncvi2+acjcB33nHeM5i/sA+OWQ8s82ERB07wg7gybo3wu6gTNMi8YEtQyZ5JnqI
	siYskyzRET0RKwblnY+QZMy22UtPfATFoABHC4SVtMEI2zup9uGrWqa72EMWzz/ILF5Al64pjPw
	jZLhj7YDZZLf9hMxo3eFf+Vdure2zFaxGDN9VW9X78g9qo61s9e+e2Bu+vH6AgM6Bh0hDdLzbG1
	7VbtLzgErsGACzNJun/GuSSrZWv5v6MDI0sfXwn/+4xP6nuiNHu69/m0EeGlmyv/PRIWrrVKuQ3
	WDiHt8aFQyc3uWOeHlJvnBqezlgbcbxDB59wsAxyHSHUbnacrRG9jpIx9UcvHV1RsJJ1T3cQlPX
	Y+SO1RzyiQ37oBXmFpfHReyzK2EX8OA==
X-Google-Smtp-Source: AGHT+IEJVFYF9P1Q0b5M1kyrSeKQ7g4cBHrY7/LMQDC0f4BWGljSFOjPG7mp+HSRafCr+M9x04uI4w==
X-Received: by 2002:a05:6000:3ce:b0:3b2:ef53:5818 with SMTP id ffacd0b85a97d-3b4964eb1dfmr2853397f8f.5.1751651502845;
        Fri, 04 Jul 2025 10:51:42 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:51:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/6] x86/idle: Drop incorrect smp_mb() in
 mwait_idle_with_hints()
Message-ID: <aGgUrdg4xAzMXum7@macbook.local>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
 <20250704163410.1412367-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704163410.1412367-3-andrew.cooper3@citrix.com>

On Fri, Jul 04, 2025 at 05:34:06PM +0100, Andrew Cooper wrote:
> With the recent simplifications, it becomes obvious that smp_mb() isn't the
> right barrier.  Strictly speaking, MONITOR is ordered as a load, but smp_rmb()
> isn't correct either, as this only pertains to local ordering.  All we need is
> a compiler barrier().
> 
> Merge the barier() into the monitor() itself, along with an explantion.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

