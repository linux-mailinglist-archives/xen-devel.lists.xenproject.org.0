Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9068A4AD6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 10:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705934.1102880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwI2J-0001rr-K2; Mon, 15 Apr 2024 08:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705934.1102880; Mon, 15 Apr 2024 08:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwI2J-0001pj-H5; Mon, 15 Apr 2024 08:49:59 +0000
Received: by outflank-mailman (input) for mailman id 705934;
 Mon, 15 Apr 2024 08:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/mT=LU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rwI2I-0001pd-QF
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 08:49:58 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 223c1cd1-fb05-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 10:49:56 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-78d620408f8so247759985a.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 01:49:56 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05620a240600b0078d735ca917sm6068809qkn.123.2024.04.15.01.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 01:49:55 -0700 (PDT)
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
X-Inumbo-ID: 223c1cd1-fb05-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713170996; x=1713775796; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=57U9yTlAKpJzzt+SsYPGXcbCpqBDhXXulTu0h+EOhd0=;
        b=WT6HB4P2dqTxkS2dAC4jmXU5G/3MRXeD6PeQddT7pmEp86p3/FKYF0+e6ZR3XyYRrY
         0gVB3v9SLGniHOBfDFHwJjJnjQrAbmTM9y9miQcMB/DGpoDbm00IsCK40z9s920N9ORM
         fkdABR8n43k5ceXJOKoxJgei/JQrRzvUhH4oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713170996; x=1713775796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57U9yTlAKpJzzt+SsYPGXcbCpqBDhXXulTu0h+EOhd0=;
        b=iD0hBWhYop81fGaIIrFbQBKzeXa5mvGLNotShyS1oQ/laZU/nMTKNCXy1BUPSdQcvT
         lxH4MojfBo9zxJIkDtz6M7xYuqRD7VDX2uOQj3Iy2IVJuoH/QcavWc440CKzaqSa7j09
         F2nyqy5Eq+orsHCNELBlSshsPXxR+cdBqa66UopyyL8jis3eXVc+X+/If6mcTBRuuOSC
         tkX8nBdyDYxPwP1wngJy6Yoib75ngi8Xb1ZhbWYBn8tHBIlu8EmSmIUPERCmKPmm6Kzf
         8ivYg59lqIGWtr00HRv08DoXmDkNrdvgJtSifJSPyEc2HYR7hqrxgT6F/WxDTDX/mqnI
         WG2A==
X-Gm-Message-State: AOJu0Ywr7sydeyrWDJ1pvRk7+dnWfq/ZB8uRU3cBekv/G7aa5pZ1H6U/
	s4E3vaUblrRauv7GHhEIehzhaSZvwqsGmPIqVXE7Xc+BJkz4pekQC2tU0dwhl/94qHBx7wVXEvj
	y
X-Google-Smtp-Source: AGHT+IF57Lc6Y/Yh+cuG/XGOz4FQnuH/kvkHq2PTUjEpb1Vpw8wOmfOMiHznV7QFkY1bJTv2ShjsUw==
X-Received: by 2002:a05:620a:8510:b0:78b:e7ec:99a with SMTP id pe16-20020a05620a851000b0078be7ec099amr9412831qkn.10.1713170995759;
        Mon, 15 Apr 2024 01:49:55 -0700 (PDT)
Date: Mon, 15 Apr 2024 10:49:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH] production-config: override mirror url for
 buster, use archive
Message-ID: <ZhzqMYVgighuBv-k@macbook>
References: <20240415081708.32671-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240415081708.32671-1-anthony.perard@citrix.com>

On Mon, Apr 15, 2024 at 09:17:08AM +0100, Anthony PERARD wrote:
> buster-backport isn't available on the main mirror anymore.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Please push ASAP.

Thanks, Roger.

