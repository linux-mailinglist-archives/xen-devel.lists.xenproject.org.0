Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C0AF6D43
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 10:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031836.1405580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFWS-0001cS-0S; Thu, 03 Jul 2025 08:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031836.1405580; Thu, 03 Jul 2025 08:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFWR-0001a0-T9; Thu, 03 Jul 2025 08:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1031836;
 Thu, 03 Jul 2025 08:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MTI=ZQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXFWQ-0001Zu-TZ
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 08:42:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d2ff7e7-57e9-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 10:42:12 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso3556292f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 01:42:12 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a88c7e7814sm17753738f8f.8.2025.07.03.01.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 01:42:11 -0700 (PDT)
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
X-Inumbo-ID: 9d2ff7e7-57e9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751532132; x=1752136932; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CrN6jCnQ5V+zAt2E0+O7BUqhcjrsOrdkLUhU+eMK90=;
        b=dJoPiLu/eHMUYjwreFde+VnvhRQdHfZ72XABS5u7BNB6HMab9LQMP5IuRXCCVOuzfd
         MLneS7FEqo1AnkoaDsw8OodkIl5/YBOfejlFu0wndiHEZftS3g5CrrkvQWbqc+60yTve
         kUs3SppKDLSRAGjByLjMalfwXGemm+EVjkbmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532132; x=1752136932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CrN6jCnQ5V+zAt2E0+O7BUqhcjrsOrdkLUhU+eMK90=;
        b=XgU1Eq4ata8rSqymzy/9Oam1z9Wd+TG0M4fzTLMLPo7eBfztYp2kh5E6hbTrKUGRUS
         02eKYFO+lZkBh651Yh2OGyOEmwc4TIZO050jkDW7vo6TblrsRFamE3MmnodBRT1dBhyg
         x3fhiGpgiHH/qV++jQTKiAxVuEANrKEmRm9nPi9hjhgw6swCp3Do9rTVBQojtIw4zmWL
         lmLqUD94JCXqOcrJZkD1a7Y8PGjeWL1FBT8B0NqDwZes6qr0gczy4l0Pz/6s2kun03sS
         Az2DRqL22h2jFbAYngotl3tFxGcQKS5IlWaxtVwfQ+a5+Oy2g6KanaeWuBTOUH1N9LSQ
         05eA==
X-Gm-Message-State: AOJu0Yx8o6/IkpyN81gBzky1peq940uhlGCpNq4HVX9xKM5TU8LL+EPV
	K0GDMCkTsOv0mo13rEwvDqCy4RS16fuG5r59BuXM2M/uqCMionWqXk0790w3oplJM2M=
X-Gm-Gg: ASbGncs9+xeu6flOsp1abST6VWuqgGZ9Zcfy1XKIqtdcPATY1Vw0naOAhmOi5DBIsNQ
	CABnKNKdQPb6oeASkol8rLisXRTKrBCIg/8yClbp/+RAhIqMtisHkA4UpCndthQjMpwTfVGN4BX
	E/hWNwA3GixNPcnl+NrWkn0q5doz184w7zUfC1JVkxk8fYYGoJ230HE+3xZ+jvFlnaFN/UPQJSO
	rWGh4Oqz+RgXjCZ9h4y7P30EeQigKp3YaYeIqgle+ff3kW7sg6P8spmtAOd4RZfg81n2ZbQVp3o
	8xvr98fJ9plIPTOdS2x/wXtVM8fA8GfX8eo46pondqs5DRqZz92KWXmNf2APvTsKDnB1ityLuxq
	bhrEAr46ruyyV9F3AWDy7McX5up2pIA==
X-Google-Smtp-Source: AGHT+IEFytp9Y53j6uGHWReMEcquMe3gEMxjDJ3GFMWvaJGb3Qftmc2voeXg7VMzHKl9GU7jwhMVxw==
X-Received: by 2002:a05:6000:248a:b0:3a5:2ec5:35ba with SMTP id ffacd0b85a97d-3b1ff9f59a3mr4615473f8f.30.1751532132023;
        Thu, 03 Jul 2025 01:42:12 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:42:10 +0200
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
Message-ID: <aGZCYvaH6j80cmAO@macbook.local>
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

I would like to add this memory map to the PDX unit testing, do you
have a name I could use as a reference?  For example for the Intel
sparse map I'm using: "Real memory map from a 4s Intel GNR.".  I
currently have yours listed as: "Stefano's ARM board.", but that's not
a very descriptive naming :).

Thanks, Roger.

