Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7B2CED9D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44668.80054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9gH-0007n9-6H; Fri, 04 Dec 2020 11:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44668.80054; Fri, 04 Dec 2020 11:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9gH-0007mi-1v; Fri, 04 Dec 2020 11:55:21 +0000
Received: by outflank-mailman (input) for mailman id 44668;
 Fri, 04 Dec 2020 11:55:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9gG-0007mb-2I
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:55:20 +0000
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 690f2fef-e13b-49eb-85d6-141d9de4af26;
 Fri, 04 Dec 2020 11:55:18 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l1so5034027wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:55:18 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b11sm2333581wrs.84.2020.12.04.03.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:55:17 -0800 (PST)
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
X-Inumbo-ID: 690f2fef-e13b-49eb-85d6-141d9de4af26
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/mCO50+bvu1CrxUAld/ZO7Qod69A9jWuzr0dqqvMZIg=;
        b=nki+doggtYuY5bTKF3+MvMednsyYyU3LxSazNgvYc8F3CAMRnr5yIPR0/3TvzY6HfB
         pmi7JCdQRgXmEcQb22NMd5+QGecDhw/6vdNqQNYg/YDR2v+sSuf//2JCcIAWAto8JCd9
         glDcW77FLLhDA2QMas61ikklEn0LNS2TmDTGnOMhpiYBWfIOwNhfPqri/6ENtZBllmnB
         oUlLQ1H+fBybx05OR/nVCqPB36n0YqJeNO1PsNIWG0e7On4amQj2xXxgADTvXjz7A3Fq
         2fWIyLI5XrsdBDc+wybSNOY0slbJQTlT4qpwahORXAQsK94kjDxm4vk4XojMo7PLCu9Y
         MVTg==
X-Gm-Message-State: AOAM533B4e9O5CS1pFacRHxFi5cImUMC/oY91dpUkewfZxSFqmA0X3kt
	xr+yvnSIlUgZAlBQb4ryn3A=
X-Google-Smtp-Source: ABdhPJygDxH3tOgP5qiByJCR9IrSYtATVTsns0b2wn/wCWhdiJCfzIyQZFlNFNZLYpC4GcGTjBPwSg==
X-Received: by 2002:adf:dec1:: with SMTP id i1mr4421482wrn.129.1607082918135;
        Fri, 04 Dec 2020 03:55:18 -0800 (PST)
Date: Fri, 4 Dec 2020 11:55:16 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2] tools/hotplug: allow tuning of xenwatchdogd arguments
Message-ID: <20201204115516.m5p3r25erp2fteg3@liuwe-devbox-debian-v2>
References: <20201203063436.4503-1-olaf@aepfle.de>
 <20201204105315.avponbzbotrabf4c@liuwe-devbox-debian-v2>
 <20201204124620.5ed9f6a0.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204124620.5ed9f6a0.olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Fri, Dec 04, 2020 at 12:46:20PM +0100, Olaf Hering wrote:
> Am Fri, 4 Dec 2020 10:53:15 +0000
> schrieb Wei Liu <wl@xen.org>:
> 
> > Did you accidentally swap 15 and 30 in XENWATCHDOGD_ARGS above?
> 
> This is indeed a mistake. Thanks for spotting.

Fixed and pushed. Thanks.

Wei.

