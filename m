Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1602A6022
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18911.44040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEka-0006AL-QN; Wed, 04 Nov 2020 09:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18911.44040; Wed, 04 Nov 2020 09:06:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEka-00069W-Mr; Wed, 04 Nov 2020 09:06:40 +0000
Received: by outflank-mailman (input) for mailman id 18911;
 Wed, 04 Nov 2020 09:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okXs=EK=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1kaEkZ-00060O-Qw
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:06:39 +0000
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf22235b-69f8-49d6-8865-f0aaba7ab350;
 Wed, 04 Nov 2020 09:06:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 13so1627471wmf.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:06:34 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:06:33 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=okXs=EK=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
	id 1kaEkZ-00060O-Qw
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:06:39 +0000
X-Inumbo-ID: bf22235b-69f8-49d6-8865-f0aaba7ab350
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bf22235b-69f8-49d6-8865-f0aaba7ab350;
	Wed, 04 Nov 2020 09:06:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 13so1627471wmf.0
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kRmJDRZK6hYnZwsJWtSyII6GRFG28FGG7WVn2jtoat0=;
        b=Vy0ifnFNZsdam2EYQqrtqEkqnpo+nDE+vtZ1Exog/zDTxcDNqjIjGsjIU1pi4kN3El
         WJb+mUgrcdzGRp3ibB8ikQUE/nHlWxpqRKWFVzAojniHotRo1+HOdbKPDVdxQrzIx6sR
         o5bH/KMSqaIrUmQaZkvfPrv1gFxI//c+XLeUSm9xVA3kwk7Z26qKNIX1zX0RkPnJ08Uu
         3N/AsWZ+Jl5bU+SZ4vt/SsxAgf4VmWQbEcGIUXSUX2VSwqItVn590AY7hkgF110FhA9z
         j+QBoryGrshn3GGWS2c27qqPt497aXTtIabvKKAeyhw/gsk+3P4aFPmg5/JE0C/2HE/p
         rbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRmJDRZK6hYnZwsJWtSyII6GRFG28FGG7WVn2jtoat0=;
        b=TxOpx8nGQPg3i9XE4R4Njwwol0rz66uGwQ38vi3jhfV4YmPvnsrHviVQLdW3LDsNqM
         jVblj0y1MxiRzqvjjs9tM5GGytrkcr5PUASro1aRmMe9DhWFtiQp31Vq7dJmxpFxjmC1
         kTUUdwN4Sw7JTbJvyli0BYqpma3Aqed8oIm0JC6TeGRYxMofwqlpzSolf9H4G1sEUWZh
         Yq82Rk7Msou0dHffQgjjfwzUCetKiDYgAqM3gwNW8KYBPEczxzFgswIzB+C1aN/0ElCX
         nHR7oCGfn/GlIjSnkB1N/X/OBy4DsKJgrGAa67oTj1o3G0wnOPuH23UGVBHsPYgN5pE9
         dkZQ==
X-Gm-Message-State: AOAM5309+Dl7AA+g55cNfb0HzGvBduHK0bPuvy/2+wIFmW4F3UmFBk/Y
	5NSf47DIASmhJAzwH6T//TgvBQ==
X-Google-Smtp-Source: ABdhPJwqi0yB/+B9/s0ULCABSavH/6P6SV0tchgnVRlqqMJnN0CKjV/Hb1Yj3pHPlBIYEvJ5zSVeQA==
X-Received: by 2002:a1c:1dc1:: with SMTP id d184mr3360241wmd.169.1604480793874;
        Wed, 04 Nov 2020 01:06:33 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 01:06:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	KP Singh <kpsingh@chromium.org>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 08/12] net: xen-netfront: Demote non-kernel-doc headers to standard comment blocks
Date: Wed,  4 Nov 2020 09:06:06 +0000
Message-Id: <20201104090610.1446616-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104090610.1446616-1-lee.jones@linaro.org>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/net/xen-netfront.c: In function ‘store_rxbuf’:
 drivers/net/xen-netfront.c:2416:16: warning: variable ‘target’ set but not used [-Wunused-but-set-variable]
 drivers/net/xen-netfront.c:1592: warning: Function parameter or member 'dev' not described in 'netfront_probe'
 drivers/net/xen-netfront.c:1592: warning: Function parameter or member 'id' not described in 'netfront_probe'
 drivers/net/xen-netfront.c:1669: warning: Function parameter or member 'dev' not described in 'netfront_resume'
 drivers/net/xen-netfront.c:2313: warning: Function parameter or member 'dev' not described in 'netback_changed'
 drivers/net/xen-netfront.c:2313: warning: Function parameter or member 'backend_state' not described in 'netback_changed'

Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Martin KaFai Lau <kafai@fb.com>
Cc: Song Liu <songliubraving@fb.com>
Cc: Yonghong Song <yhs@fb.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: KP Singh <kpsingh@chromium.org>
Cc: xen-devel@lists.xenproject.org
Cc: netdev@vger.kernel.org
Cc: bpf@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/xen-netfront.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 920cac4385bf7..93740ef4cf1b4 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1582,7 +1582,7 @@ static struct net_device *xennet_create_dev(struct xenbus_device *dev)
 	return ERR_PTR(err);
 }
 
-/**
+/*
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and the ring buffers for communication with the backend, and
  * inform the backend of the appropriate details for those.
@@ -1659,7 +1659,7 @@ static void xennet_disconnect_backend(struct netfront_info *info)
 	}
 }
 
-/**
+/*
  * We are reconnecting to the backend, due to a suspend/resume, or a backend
  * driver restart.  We tear down our netif structure and recreate it, but
  * leave the device-layer structures intact so that this is transparent to the
@@ -2305,7 +2305,7 @@ static int xennet_connect(struct net_device *dev)
 	return 0;
 }
 
-/**
+/*
  * Callback received when the backend's state changes.
  */
 static void netback_changed(struct xenbus_device *dev,
-- 
2.25.1


