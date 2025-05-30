Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A428AAC8C88
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 12:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000679.1380879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKxQR-000754-9X; Fri, 30 May 2025 10:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000679.1380879; Fri, 30 May 2025 10:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKxQR-00073b-5o; Fri, 30 May 2025 10:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1000679;
 Fri, 30 May 2025 10:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJNC=YO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uKxQP-00073V-Rd
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 10:57:21 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbbffcb7-3d44-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 12:57:20 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so1048657f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 03:57:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4f009fb0bsm4413236f8f.87.2025.05.30.03.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 03:57:19 -0700 (PDT)
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
X-Inumbo-ID: dbbffcb7-3d44-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748602640; x=1749207440; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gzN+d5AU9IFXMQNv/t5MKT0mQGD5TeEy64oR1pM3fgw=;
        b=Cmo789i2WGZYzMuUIVzEwbsxKxXm76p3cNrlFlUi8Uc3SL8jNXEbjO04ldT5tDslnm
         Y0WMvtq3BB73iLnUlKZ0lr166/ew+pGs0phesdUSLp0hFFpmSBvWbM4KLzLX+zqsR+wl
         A4/NPb8zrd25jlPh7RQ4cLUbxU91JsgNdrMYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602640; x=1749207440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzN+d5AU9IFXMQNv/t5MKT0mQGD5TeEy64oR1pM3fgw=;
        b=muP/bVrv9inPSElkk6fa0BBloBa5709z42LcEVghKxBQDDN+eCxZnSqEV6x9XjzuQR
         s7FX/DfrcS5oeCxmy0039IrhUfEsHPpgAkERyzkR2m0l72+2WQufTGXB/CIoKirBxtQ8
         Qc1Pa8FhaNoko0HnLRnA66i8ImLVnbQaulDngG0B4pxVwUBjdhCNwmdmloclh7SYygcE
         VqIvYCwkxoi9dlqKkzKhGQ92h9+8fE/WiJAtTBVwpaSz3vNZLVliUclZANDIvd6Ue0lZ
         kJblER3afNzuQxWIFlN64CMBG7Q+kELXnH+8cyqfs/bYirvnTbPYb8w28RJgnRa9zhEg
         WKww==
X-Gm-Message-State: AOJu0Yx/nIl+fV38h/kn0poO9tTCa3rde45+Dz0oJtcj0HQf+GEVjEGE
	ZnOrt7/qDZDwPiOEiCjcNkzV8luLOcgQq/gGgXO6j480vbB+yZJmXkkQA5OcHDX8xAgMvqxlG33
	vyumk
X-Gm-Gg: ASbGncue2obuzasMAHxZbLOEkKtk1pw/v48JZ+ZCXhrfevadRVvRxF16Xt0WqWKyjFF
	Sj49MkT2tCKFGM7KxQqjq24vTHv18dRAXCIVAiJ8bBZ5eYARdSf5mYFg+PlDNCNNLhlYJeiVBpD
	+VzRcM9e60fxoYBYIXWxnHaiQc32v7uvyzqn0ejlHefeyrXKoIMrjBkjM+gJgBbSW1/LxmQ6kCe
	Y9Gkvh4TRTxcI/9gs2ykZbQAxnO6jf2XlISaxgaEj0cbjrAfrzV7KsiQ0E0Mc2Vb4kZainroAD/
	JazeDhtX0c5zw0seQW0+GVUoQIxTwUK6FDub48n10Ghv+Sl4Fv+m5bQ/eGmqaWiipEJz0+tUpdo
	HXqJq32ycxyJy8AMze6e1mfgD
X-Google-Smtp-Source: AGHT+IGqSNWBsnNZ3udp21KJx5cyEybnV4xZBXKiF2m72zkF9RHvPhyeEEjR36+d6qT8tXq4APJ7bw==
X-Received: by 2002:a05:6000:2c12:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3a4f7a1ccb3mr2244494f8f.23.1748602639725;
        Fri, 30 May 2025 03:57:19 -0700 (PDT)
Date: Fri, 30 May 2025 12:57:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/tests: Add install target for vPCI
Message-ID: <aDmPDlE2ZWDYg2wm@macbook.local>
References: <20250530104307.2550886-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530104307.2550886-1-andrew.cooper3@citrix.com>

On Fri, May 30, 2025 at 11:43:07AM +0100, Andrew Cooper wrote:
> This lets it run automagically in CI.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I had sent something similar long time ago:

https://lore.kernel.org/xen-devel/20230313121226.86557-1-roger.pau@citrix.com/

But got no reviews.

Thanks, Roger.

