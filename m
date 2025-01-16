Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F54BA13BEA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 15:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873623.1284632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQd5-0003H2-9b; Thu, 16 Jan 2025 14:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873623.1284632; Thu, 16 Jan 2025 14:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQd5-0003El-6s; Thu, 16 Jan 2025 14:13:51 +0000
Received: by outflank-mailman (input) for mailman id 873623;
 Thu, 16 Jan 2025 14:13:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYQd3-0003Ef-GP
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 14:13:49 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1968452e-d414-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 15:13:46 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso1381866a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 06:13:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce1777sm206966b.56.2025.01.16.06.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 06:13:45 -0800 (PST)
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
X-Inumbo-ID: 1968452e-d414-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737036826; x=1737641626; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlfQH2akjNZXtvLQjhwM/MLBUNqHYF0JmuKFBUgzlu4=;
        b=ABCEpD+f4WC+iAYWbqVdCGcji8tM218oUK/TLm5xSLRYPetBchSX7pwY3Do7fFCQ2Q
         hjgW8xTZBTu+GtJt6rof3H7ZoSMrnHHyZ3dc5bMgvkoCDuBGjq7054Z8G3UNLketcZV/
         p263/sLONdwpKZkKoTiMG3zhUhP2koqGChm+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036826; x=1737641626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlfQH2akjNZXtvLQjhwM/MLBUNqHYF0JmuKFBUgzlu4=;
        b=DTsY9zeha3qKpwRXDEkTKr9kcbEy5/tszBdqXimovK6KbQrdlgjCFO24NS71jbRYye
         aj8iyC3s0CwftjbhbASuPEu1zEhxB4qwsjfaEt+sdj7WMRZRmhnpEfAfT9jcK5c5HR7a
         wbDQ3gPuyxENDhUYUjN68Ziw7evqaoDizWEldONZ/pdNMGCTlCCt1Xab73SE/Z0T84Xq
         qBEpPOBb8Bkl+6QoqMUmDJ9qc1Zx+QdF7WNtqD3BFdNdk10lUeUv48tG22x5u1eBeFHo
         TGBOOzr2Fr9O8IuOKVwBQ8FZ3JY7xSI/GbsP0MOMS/6/kvZliJ6X96TVl43VHE862bWz
         7Dlw==
X-Gm-Message-State: AOJu0Yy+/F9H1gm+iD6/RUzFxN+7lgfrN8il/fXVXy4A6NpatxNxjfXb
	xluPv15E3DSXtrKt4eT5EjGeHEwmzAN6+/tr4bZclMIfmyygxxB0xH46/OAS4wA=
X-Gm-Gg: ASbGncu16xCOOUteLqcrJ4NU0L8qoSru0CLb2Hky63Mq1BjigfUvdo6BGc7xT+DDZoc
	p2LLB+Fpl7ubfm2geny0YlYvE1luMB/aK3/HKvdnXj0Vglh9l2z95IfpWCrpI2sTTyly0ua9LiE
	ZcGUhcZ4oFn/xoOxjC1HTnosdJV6bbH4+NmFOTKA5SW/2pKr0epjgUKVFAZuKzEY57kyHoGS8Y3
	0NznUPgyV/+He+dIkJwUlRFSfDKGMEIU4rW9OM9WDKViMioYpHCI0SPNlz4Hg==
X-Google-Smtp-Source: AGHT+IH4UX0YqKXfX/bYeZglj5ja6xd6GOHzA99uvIqJ/IAVML+ilw7TqIB2HW16exRLhPb9QNrWuQ==
X-Received: by 2002:a17:907:d1b:b0:aac:23f4:f971 with SMTP id a640c23a62f3a-ab2ab70a173mr3491363466b.33.1737036825826;
        Thu, 16 Jan 2025 06:13:45 -0800 (PST)
Date: Thu, 16 Jan 2025 15:13:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.20 v2 2/2] automation/cirrus-ci: introduce FreeBSD
 randconfig builds
Message-ID: <Z4kUGFKFHFBExvBl@macbook.local>
References: <Z4j4s-1iK2CH4ssK@macbook.local>
 <20250116135957.80826-1-roger.pau@citrix.com>
 <94bbb56e-4a44-4981-a617-cdc541ea5308@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94bbb56e-4a44-4981-a617-cdc541ea5308@citrix.com>

On Thu, Jan 16, 2025 at 02:02:38PM +0000, Andrew Cooper wrote:
> On 16/01/2025 1:59 pm, Roger Pau Monne wrote:
> > Add a new randconfig job for each FreeBSD version.  This requires some
> > rework of the template so common parts can be shared between the full and
> > the randconfig builds.  Such randconfig builds are relevant because FreeBSD
> > is the only tested system that has a full non-GNU toolchain.
> >
> > While there replace the usage of the python311 package with python3, which is
> > already using 3.11, and remove the install of the plain python package for full
> > builds.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> That looks cleaner, and likely to have better longevity.  Thanks.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Forgot to Cc Oleksii on the patches, as I would like a Release-Ack.

Thanks, Roger.

