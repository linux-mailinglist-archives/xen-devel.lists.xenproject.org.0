Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BF1A4371A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 09:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895480.1304105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmq62-0000ND-F0; Tue, 25 Feb 2025 08:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895480.1304105; Tue, 25 Feb 2025 08:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmq62-0000L1-CW; Tue, 25 Feb 2025 08:15:18 +0000
Received: by outflank-mailman (input) for mailman id 895480;
 Tue, 25 Feb 2025 08:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j7qs=VQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tmq61-0000Kv-IP
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 08:15:17 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2187c02-f350-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 09:15:11 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso763850266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 00:15:11 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e45a8b8c59sm837244a12.27.2025.02.25.00.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 00:15:10 -0800 (PST)
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
X-Inumbo-ID: a2187c02-f350-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740471311; x=1741076111; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGzFp8/9KYYvO6BuHmyKn8vTF/Qoky9vlAvWVMPTQf0=;
        b=JHi3qVsHW0yOi6sBHvoPXg9QXBeSpcHVrFhlLoCSZJoMW0djAEtxV0aPCupilGQdc/
         0b+XdrF/iUF032NOPK9mknoP+ZRoB3xTkcNzbn16NoUSc5vwdimxXlZQCXnkUGBABdi8
         GMYHA/Hncgv8YWbNcU9nTSUxll+JWjHi/OT6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740471311; x=1741076111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGzFp8/9KYYvO6BuHmyKn8vTF/Qoky9vlAvWVMPTQf0=;
        b=PSBZTtdiT+EzoaN4t3r5Nw5XWFBtSME7hisj86IxPiOIPLNBnUBHZidRt1CGyb9qPB
         e+LjnOiegof2Ls6/HApDsR1dtqvcCRmfBgTAbO6GfBhZuAs09oH9zgltncEct4+BLaVa
         S/GpwNTJn1yItZn9JVk047B1B421g62e8LLlP892PVpovXV71EPa2oNAuSlsW8evGCRn
         1QIOsasuFQNNeliGd9Yi6fTwWWu0moxnAJWWpJMjT627FNBBJw02APcusoedJGmEkdzc
         mfNVApQu5LJwFjLp7DilN1qN0thQQzOocvtdC0KpbOvUQwsWiAgwJdS0zsrzNq5UP/bt
         +G9A==
X-Gm-Message-State: AOJu0YzrWdWN4bhFUA5JLT9OhNJBnsNqIWn1bW7V/bTeGyFr90WsRZRz
	fnh9yFhlbFh9oUFElUrpp4wnfwm3H39mnYWDvBhTeguM6gf7J8rMn/sI7KLQPVs=
X-Gm-Gg: ASbGncvhARxOEgEvDr6mlnj+cGbaDtVVtS2Fjevjz0iDeHm/lseyvi+YyCOX4+BG9r8
	pVrV1tu982TTlut2Tlei4lsK4CTpAE25IWU7DmhJTsIhczHnStXDXv0hHM63TmIR5Nol9RlzBRs
	8eQe3GFAxc4mt/xXYNS9OZoUlBDYT1LJ44bZMWgmWj5yDoYGcvsbCPdZJqz0nB1IMCdC6MNPnmH
	4mC6eKFOo1VlOdXj0hCoBbD8/TFW5PHYU0O4hrJS2h3117zferNWuQJrfGc6C5IWtlPcYYjff65
	Kl9IbiAU54VouDwcqprZj68QUE7UBeE=
X-Google-Smtp-Source: AGHT+IGcTND3dTw3PQFDouWjBeXD1cfoieNAuWrxEXurTPpxhR+yXXekFeXNhm7cTxBCLrAjNa5bBA==
X-Received: by 2002:a17:907:7ea0:b0:ab7:e8d6:3b12 with SMTP id a640c23a62f3a-abc099b83e0mr1938962966b.1.1740471311011;
        Tue, 25 Feb 2025 00:15:11 -0800 (PST)
Date: Tue, 25 Feb 2025 09:15:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CirrusCI: Use shallow clone
Message-ID: <Z718DY0Yt3xBx-mc@macbook.local>
References: <20250224154236.1116264-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224154236.1116264-1-andrew.cooper3@citrix.com>

On Mon, Feb 24, 2025 at 03:42:36PM +0000, Andrew Cooper wrote:
> This reduces the Clone step from ~50s to ~3s.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Nice, didn't know that existed.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

