Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D470E02B
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 17:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538512.838488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Tjy-0001tk-DO; Tue, 23 May 2023 15:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538512.838488; Tue, 23 May 2023 15:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Tjy-0001qj-A7; Tue, 23 May 2023 15:15:58 +0000
Received: by outflank-mailman (input) for mailman id 538512;
 Tue, 23 May 2023 15:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcTw=BM=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1q1Tjw-0001qd-N3
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 15:15:56 +0000
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b592934d-f97c-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 17:15:54 +0200 (CEST)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ae4c5e1388so71464705ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 May 2023 08:15:54 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b001ac40488620sm6955882plb.92.2023.05.23.08.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 08:15:52 -0700 (PDT)
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
X-Inumbo-ID: b592934d-f97c-11ed-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684854953; x=1687446953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJeGQEMrpM8eeqfU3xH3VNZZx7eme2tUb730Gdj7mkI=;
        b=OSNn9pHvfuvI8n53+a6KiMU+k0FeKwkbYJ/ciqdjQYnvvQ33IC6SxVdP73xYgIe7rd
         5/9Zdl1XPf+DEIbq/MngQykqeFFHinkSsW7TStGmFDXGB2qVmhq9hW2cmWEVSN8XUtS7
         Hvd6EzSLbNlKW+o48gx6pAkJN38yKBxytsaUdFVNL+NQzokzEIDSGVTyempLYEg4P4yD
         NzTuTAN9DH37a7KZMcK58obx65D11rTFzQFAoNaXbJ+q+qrYyL80EkOszg7hii5dJB0L
         0AQvaeGbYhWqPyAPq7hauJdRuBpnS5zOYGVvhxKtM2U28oiJyCGCBFO8DDxiveMJ+cKs
         rvCg==
X-Gm-Message-State: AC+VfDwdrMUVpkZ0KXjIFPTN1pgbCmbv1AKtzNPyIDd8GyRHQKH3NRno
	/jmI1/AsLdHCdUuM104h6xM=
X-Google-Smtp-Source: ACHHUZ4xFXkiB/BvdLUoKTFRgeVpyuCwCMcGSxWP57ZlD0BqfYdE3+H9GMSiNjXnpz2La8kYeQDaNQ==
X-Received: by 2002:a17:902:7683:b0:1ac:637d:5888 with SMTP id m3-20020a170902768300b001ac637d5888mr13387115pll.43.1684854952831;
        Tue, 23 May 2023 08:15:52 -0700 (PDT)
Date: Tue, 23 May 2023 15:15:50 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Subject: Re: [PATCH] xen/netback: Pass (void *) to virt_to_page()
Message-ID: <ZGzYpm/Vs+TfSBMR@liuwe-devbox-debian-v2>
References: <20230523140342.2672713-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523140342.2672713-1-linus.walleij@linaro.org>

On Tue, May 23, 2023 at 04:03:42PM +0200, Linus Walleij wrote:
> virt_to_page() takes a virtual address as argument but
> the driver passes an unsigned long, which works because
> the target platform(s) uses polymorphic macros to calculate
> the page.
> 
> Since many architectures implement virt_to_pfn() as
> a macro, this function becomes polymorphic and accepts both a
> (unsigned long) and a (void *).
> 
> Fix this up by an explicit (void *) cast.
> 
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Wei Liu <wei.liu@kernel.org>

