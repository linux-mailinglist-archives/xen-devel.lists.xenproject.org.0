Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B319A60CC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 11:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823284.1237264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2p95-0004rD-Nc; Mon, 21 Oct 2024 09:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823284.1237264; Mon, 21 Oct 2024 09:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2p95-0004oq-Kb; Mon, 21 Oct 2024 09:56:15 +0000
Received: by outflank-mailman (input) for mailman id 823284;
 Mon, 21 Oct 2024 09:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2p95-0004Qi-3G
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 09:56:15 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e73696-8f92-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 11:56:13 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso38119375e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 02:56:13 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc563sm51521805e9.44.2024.10.21.02.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:56:12 -0700 (PDT)
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
X-Inumbo-ID: b4e73696-8f92-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729504573; x=1730109373; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=V4VI3tT0S+nuvwCqLFA1wTyiauyteW+4qw32supwjZxb+S+sdffTe2ekLDWMr+ZuSc
         QwOBNsDSE8y1KjJXaIbvdVESO238QQ/8tR/eprNso70DALPY/XCewwYUvN0E3XYpz3Er
         BdpfVimIxULyoZMFSR50N7guuWl/hQ66xAxK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729504573; x=1730109373;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=F9uiYx3D/tOnewcxRmiTGNc+WV0WKL1x8IpKUhfa0CbLJqoVF55Vaa032S0u5zQzJx
         ePiCIRuAwqxs2uRZqXX/kPOb9+hhG6ynXxSWa/JiEVwv7DG1dNwHBE5kMYbahFmbH1Bi
         cBkVru05sPnkRC+NxoTZVLHKBT+lIZxsKrFULNPyfiC5slgN83ovNpEa19rv2GLSanRA
         1TJ2qfz+nm8lejkmbgpWPQI6gAQC+4Srhz+/SjPJWRWiJNrzRwY8hIMNFLKhAF8d5wnu
         l44uFSQ+TMvwwsMx0GLkURT+ImHWAe3zQ+MYbl1fIysi5rPLzw6ThOjWaGZiadsw+rlh
         E5kA==
X-Forwarded-Encrypted: i=1; AJvYcCVevuWeoTHAShF1N9Tq27B5YcsWS41ZxbDCSJjNgHY7XUeFjuH0U3np9Hl76+Z4/9cYl1PYAhAErng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOam17dQqxO27wcO7l6hB//aZsc/Ny6z0+DQD18dIexzbdS0bK
	+AJDcYC4DsHQ38Ajz4zPHV83AFz45pLxxY7kjhUsvzhHbseI3ShlzDpDCm4oIbY=
X-Google-Smtp-Source: AGHT+IEPgdcTLX0fXfu9QxeIWkOZb2SN8Qv17Wv6aZpctdDSRc38nNjSo2RdpBK2zBai1rqwBsuo+A==
X-Received: by 2002:a05:600c:3b9b:b0:431:562a:54be with SMTP id 5b1f17b1804b1-43161627c0dmr127966805e9.9.1729504573168;
        Mon, 21 Oct 2024 02:56:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 10:56:08 +0100
Message-Id: <D51E7A643B2K.2D2HZ59U4S2K5@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Willi Junga" <xenproject@ymy.be>, "David
 Woodhouse" <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
X-Mailer: aerc 0.18.2
References: <20241018080813.45759-1-roger.pau@citrix.com>
In-Reply-To: <20241018080813.45759-1-roger.pau@citrix.com>


