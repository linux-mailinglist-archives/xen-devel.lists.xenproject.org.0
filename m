Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCCE130939
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:50:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io94b-0003l6-8X; Sun, 05 Jan 2020 16:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io94Z-0003l1-Hn
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:48:15 +0000
X-Inumbo-ID: 2a6784f2-2fdb-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a6784f2-2fdb-11ea-88e7-bc764e2007e4;
 Sun, 05 Jan 2020 16:48:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id c127so10348728wme.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YqWITmzKgwnNwM50EQzuJznaOCRNGNUNDUf+dJX4XnU=;
 b=W2NQYpfClTnlTaNhj9lyPnPoZl6GafodAOLU4Sm1M/kRHHT6P2OG8VjQLOmBXBFPkC
 +0gxToPBU3F6Jb1y9ZfMEwEa8s6nym+RiEeim3qOiVH/4ZdDjpdquXLG3QFg3B7bpc3q
 LUYZAJWeZH8ErUd+XF6OwmSQ4Bij1a8a9b6P06grGX6IZ68hFB/ydS5qEVReB/6FwAX4
 t0qvya8VPidxf7fU65nm48eh5JRfpLCMEU5keQMy9DDh/1bX3yTaKSUSlJOajZq5dfSE
 Y+TLI0RsivLvj5O+zuTw1kzc4cYB8mhguDlspFbxRs/sVcp2UlzWlCbSicKt1bNqgRIt
 dJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YqWITmzKgwnNwM50EQzuJznaOCRNGNUNDUf+dJX4XnU=;
 b=Buq1hsT1qF7I47QhAjLEEZ6OMOuEY3WG4+Qt/zY4iYawCFXXpfMFRjRBUiy92cbFSp
 n0CeH5FQoNyCWxRN5gxGt1EN5fsD/fqzSQLeMjpbNarjQ1lZgZK+ukaK4FGPxUD+Yf55
 gILYdbL9W98m/7MwHJ5IcUR4NBbiQTPGDD8BxAC5F4KP3stvEmMfmNFYS/zpgy6tGi5n
 OT7i9SVqLHdBN7QnnxrSSRl7oyvLIDIXeJLmkJYx/corBhCTrqTBgMbooIZp3WR6mH5l
 sa8LHH8blsSXJA6nVdKur9iRB5hOTha7Y3b7z5S5FFjURUYgQhNoYxlS7wSp9XxFgHFK
 psWQ==
X-Gm-Message-State: APjAAAXVd3Nq24AFlxeWuY1S0DXhKPL2rli/anv1zKsVpIFbQOJmzAJz
 VW9TWCTbjRNq6FF3tK2W85GvIMeiLd8=
X-Google-Smtp-Source: APXvYqygLn52dbITqgcImJeKD6GGqlefJo0eoakjSOTF/LPLV3/7/8eCCZ8koDq6E0Bclon6WWLXxA==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr31207878wma.103.1578242893950; 
 Sun, 05 Jan 2020 08:48:13 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y139sm20834028wmd.24.2020.01.05.08.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:48:13 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun,  5 Jan 2020 16:47:56 +0000
Message-Id: <20200105164801.26278-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/5] More Hyper-V infrastructure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJlaXMgaW1wbGVtZW50cyBzZXZlcmFsIGltcG9ydGFudCBmdW5jdGlvbmFs
aXRpZXMgdG8gcnVuClhlbiBvbiB0b3Agb2YgSHlwZXItVi4KClNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMgZm9yIG1vcmUgZGV0YWlscy4KCldlaS4KCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgpDYzogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+CkNjOiBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KCldlaSBMaXUgKDUpOgogIHg4Ni9oeXBlcnY6IHNl
dHVwIGh5cGVyY2FsbCBwYWdlCiAgeDg2L2h5cGVydjogcHJvdmlkZSBIeXBlci1WIGh5cGVyY2Fs
bCBmdW5jdGlvbnMKICB4ODYvaHlwZXJ2OiBwcm92aWRlIHBlcmNwdSBoeXBlcmNhbGwgaW5wdXQg
cGFnZQogIHg4Ni9oeXBlcnY6IHJldHJpZXZlIHZwX2luZGV4IGZyb20gSHlwZXItVgogIHg4Ni9o
eXBlcnY6IHNldHVwIFZQIGFzc2lzdCBwYWdlCgogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9N
YWtlZmlsZSAgICAgICAgIHwgIDEgKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcmNh
bGxfcGFnZS5TIHwgMjEgKysrKysKIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMg
ICAgICAgICB8IDczICsrKysrKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydi1oY2FsbC5oICAgfCA5NSArKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oICAgICAgICAgfCAgNiArKwogNSBmaWxlcyBjaGFuZ2Vk
LCAxOTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVyY2FsbF9wYWdlLlMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oY2FsbC5oCgotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
