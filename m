Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4B12FA27
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:12:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPVT-0005Qy-8C; Fri, 03 Jan 2020 16:08:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPVR-0005Qt-QM
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:08:57 +0000
X-Inumbo-ID: 5834a5b6-2e43-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5834a5b6-2e43-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 16:08:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c14so42885305wrn.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZrZ5Xyiw9ewHG2Rbqe7yXPegI3D1h/MHHDO8qT/4SSo=;
 b=IXbUakvxbiwkyAkWFtKhHCWHZwTRX++l2fRxwuqWPAup930KiY6KlvpYTMtFBhQj1o
 rhYWKluqttu7Wfyjc7AMU3lHSxGsmjqYXGQj7TeTbrt4gCXJbZtiuQAIg8sll17r1UWx
 L+BBVMK/bKtqMgpeMUgVL853Pp7fpw82XMV/UdQPOwO/mLp4X0UDVRyLaafBSRyAKgwb
 COOHu5uHH22Nks9YwPzgRvGyPotw42HraJWoLp30xglhvncVydPQpFmgOOHsHfv8302R
 ozPGFaZqFsmhTWP7sTSbQ0sioLd6OXQAgtF/qQYjvgHT3O+5lEq2QD64mwSsBm3BUNGy
 fhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZrZ5Xyiw9ewHG2Rbqe7yXPegI3D1h/MHHDO8qT/4SSo=;
 b=mVj5X1+022or+vspyoo/EzPdqp0ZAN/8+GxmmhinTSgsWuky9EfTXt5EwJ/cyYx7mv
 Ivxd8v82z1NfUhmPkH+nX5NX300BYmDec/DhD8ElUnCjo7WpCH+417+G1RSkWG9V+hg3
 unU4Cba94qFLinYl+tr1lYFUpZC5mp3MVjaBzXzxjl9NUMXcX79y0jmnxZJpmaVPmiRp
 tXPNRabeaohbK5uzWZ4DwXRL+uf+dqqcsY2xc+A7Ai+GHtIxW8vkK/ynz7YI96AE8wBf
 Lb9bEYK5Kidgz4EUMAuwAcGM2LVoufoLYFRk+nQbGTNtpkwBpSFVBe4Zwv/wJEP0uqw2
 dkPg==
X-Gm-Message-State: APjAAAXkzTyWzkay/PnBMlNXROa0jVU+wlzRObZRkQVfpP1FgViov4km
 6NpXewUt+yg7z+GMjl6Pqdsr9sCoJxPOHg==
X-Google-Smtp-Source: APXvYqyLUp/gtOLZmzx4Ndr82rrFn+bWU0V58uXN9PpAFdFc029ZDCkJ52skoEl2gIK2H+ENptmMHA==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr90620497wrq.196.1578067736056; 
 Fri, 03 Jan 2020 08:08:56 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:08:55 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:17 +0000
Message-Id: <20200103160825.19377-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/8] More Hyper-V infrastructure
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
ZXMgZm9yIG1vcmUgZGV0YWlscy4KCkkgY2FuIG9ubHkgdGVzdCB0aGVtIGxpZ2h0bHkgYW5kIGxv
b2sgYXQgZGlzYXNzZW1ibHkgb3V0cHV0IHRvIGNoZWNrCmNvcnJlY3RuZXNzIGF0IHRoaXMgc3Rh
Z2UuIEF0IHRoZSB2ZXJ5IGxlYXN0IFhlbiBvbiBIeXBlci1WIGJvb3RzIHVwCm9rYXksIHNvIGl0
IGlzIG5vdCBicmVha2luZyBhbnl0aGluZy4KCldlaS4KCgpDYzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29t
PgpDYzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpXZWkgTGl1ICg4KToKICB4ODY6IGlu
Y2x1ZGUgeGVuL2xpYi5oIGluIGd1ZXN0L3B2aC1ib290LmgKICB4ODYvaHlwZXJ2OiBkZXRlY3Qg
YWJzb2x1dGVseSBuZWNlc3NhcnkgTVNScwogIHg4NjogcmVuYW1lIGd1ZXN0L2h5cGVyY2FsbC5o
IHRvIGd1ZXN0L3hlbi1oeXBlcmNhbGwuaAogIHg4Ni9oeXBlcnY6IHNldHVwIGh5cGVyY2FsbCBw
YWdlCiAgeDg2L2h5cGVydjogcHJvdmlkZSBIeXBlci1WIGh5cGVyY2FsbCBmdW5jdGlvbnMKICB4
ODYvaHlwZXJ2OiBwcm92aWRlIHBlcmNwdSBoeXBlcmNhbGwgaW5wdXQgcGFnZQogIHg4Ni9oeXBl
cnY6IHJldHJpZXZlIHZwX2luZGV4IGZyb20gSHlwZXItVgogIHg4Ni9oeXBlcnY6IHNldHVwIFZQ
IGFzc2lzdCBwYWdlCgogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZSAgICAgICAg
ICAgIHwgICAxICsKIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUyAg
ICB8ICAyMSArKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgICAg
ICAgfCAxMDQgKysrKysrKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0Lmgg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2LWh5cGVyY2FsbC5oICB8ICA5NSArKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi5oICAgICAgICAgICAgfCAgMTAgKysKIHhlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvcHZoLWJvb3QuaCAgICAgICAgICB8ICAgMiArCiAuLi4vZ3Vlc3Qve2h5cGVyY2Fs
bC5oID0+IHhlbi1oeXBlcmNhbGwuaH0gICAgfCAgIDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgMjMy
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcmNhbGxfcGFnZS5TCiBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaHlwZXJjYWxsLmgKIHJlbmFtZSB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L3toeXBlcmNhbGwuaCA9PiB4ZW4taHlwZXJjYWxsLmh9ICg5
OSUpCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
