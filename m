Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFEF14D1D9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtpI-0006U2-9V; Wed, 29 Jan 2020 20:20:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtpH-0006Tx-1Q
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:20:39 +0000
X-Inumbo-ID: d00b1a20-42d4-11ea-ad98-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d00b1a20-42d4-11ea-ad98-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b17so1468898wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S9MG8hA2APKZ2gqKwyabt63jSXVsq7NUUHF5gjRTKAE=;
 b=GQU0yyFijbeX920Vi8021DppGbfQ+UOTSE6wBKmprIHPTYC71Z20qFsQQq3h80p1JX
 aqoNcJ7zZvXhjxpD4559mN+8cQdKA72y/peGABHOM+yfKoZvW/auTFfQHT2/XCyjIAi+
 D7j5/EKCwCeMOgrUZrjRltidvSoDOfVt83fBbS80PfhnDaJc1BDcYYuvu5OIDKIw41Xd
 spOz+3p4z2dH/Fy240BdqJ2q/Zj786S1SSJUmb17hcThpdT5GiDcQgd9rFfWNnp4cKRe
 ZM6XPJZ+r9phXG0pxir+4JNz66N7h1Xq3QIWk3TfvCSLJRSSgj/fNkPq1d2Qv+TyBaVO
 5+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=S9MG8hA2APKZ2gqKwyabt63jSXVsq7NUUHF5gjRTKAE=;
 b=MANfB5fYzeSJ3AXD4fjh3FgHy81tJgVnS+KPnr4XA9YSUNXpU1VQ9IxH1HLGfCHutp
 IXXf2Qpw3Zr8C1E+yY2TWAhbkXCoaS/1SqKB6uGIZt7qSzoaWAG4Whyac3OCcAxJGIy9
 YjR6Egkew6jg5BhSic7Ko1J1E2j0oqaZ6iOwLstwR8n+PDHswatzTkxIgcMHuf3BqEWz
 yJouUMblPMtPMXUjUcgW2Ku7eSUUOLZKIGT261jXZU1uipzSQ2ejsvnKD3FHtREbQXrP
 NoxBW54VCdFgR5Tbt8BCLiDNIJExmxYO7s47mFnN6+E/ycTmu0EXhH44W9w6fD4179kr
 oDXQ==
X-Gm-Message-State: APjAAAXkvXZC1px3/rgSXYWDqlSSnmu15MpqMTQigRiblk/GQ1zpPrS4
 ydH4QUtEyp36dfFjidVhIbRDlJ706co=
X-Google-Smtp-Source: APXvYqxd9UEG15krYRRyN2JXpVZjNj/qXDPfMDJ8kInKJT6ELbPR5N2Mdy+NBznZ7OwkLB/Ml7PpjA==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr899145wme.125.1580329237455; 
 Wed, 29 Jan 2020 12:20:37 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:36 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:22 +0000
Message-Id: <20200129202034.15052-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 00/12] More Hyper-V infrastructures
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJlaXMgaW1wbGVtZW50cyBzZXZlcmFsIGltcG9ydGFudCBmdW5jdGlvbmFs
aXRpZXMgdG8gcnVuClhlbiBvbiB0b3Agb2YgSHlwZXItVi4KClNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMgZm9yIG1vcmUgZGV0YWlscy4gRmlyc3QgZmV3IHBhdGNoZXMgYXJlIGdlbmVyaWMKeDg2IGNo
YW5nZXMuIFRoZSByZXN0IGlzIEh5cGVyLVYgc3BlY2lmaWMuCgpJJ3ZlIGNoZWNrZWQgdGhlIGFz
c2VtYmx5IGNvZGUgYXMgd2VsbCBhcyBwdXR0aW5nIGluIGEgdGVzdCBwYXRjaCB0bwptYWtlIHN1
cmUgdGhlIGh5cGVyY2FsbCBpbnRlcmZhY2UgaXMgaW1wbGVtZW50ZWQgY29ycmVjdGx5LgoKV2Vp
LgoKQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBNaWNoYWVsIEtlbGxl
eSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KCldlaSBMaXUgKDEyKToKICBNQUlOVEFJTkVSUzogcHV0IEh5cGVyLVYgY29kZSB1
bmRlciBWaXJpZGlhbiBtYWludGFpbmVyc2hpcAogIHg4Ni9oeXBlcnZpc29yOiBtYWtlIGh5cGVy
dmlzb3JfYXBfc2V0dXAgcmV0dXJuIGFuIGVycm9yIGNvZGUKICB4ODYvc21wOiBkb24ndCBvbmxp
bmUgY3B1IGlmIGh5cGVydmlzb3JfYXBfc2V0dXAgZmFpbHMKICB4ODY6IG1ha2UgcGFkZHJfYml0
cyBhdmFpbGFibGUgZWFybGllcgogIHg4NjogcHJvdmlkZSBleGVjdXRhYmxlIGZpeG1hcCBmYWNp
bGl0eQogIHg4Ni9oeXBlcnZpc29yOiBwcm92aWRlIGh5cGVydmlzb3JfcmVzZXJ2ZV90b3BfcGFn
ZXMKICB4ODYvaHlwZXJ2OiBzZXR1cCBoeXBlcmNhbGwgcGFnZQogIHg4Ni9oeXBlcnY6IHByb3Zp
ZGUgSHlwZXItViBoeXBlcmNhbGwgZnVuY3Rpb25zCiAgRE8gTk9UIEFQUExZOiB4ODYvaHlwZXJ2
OiBpc3N1ZSBhbiBoeXBlcmNhbGwKICB4ODYvaHlwZXJ2OiBwcm92aWRlIHBlcmNwdSBoeXBlcmNh
bGwgaW5wdXQgcGFnZQogIHg4Ni9oeXBlcnY6IHJldHJpZXZlIHZwX2luZGV4IGZyb20gSHlwZXIt
VgogIHg4Ni9oeXBlcnY6IHNldHVwIFZQIGFzc2lzdCBwYWdlCgogTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0
LlMgICAgICAgICAgICAgICB8ICAxNSArKy0KIHhlbi9hcmNoL3g4Ni9lODIwLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTkgKystCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
ICAgICAgIHwgMTU1ICsrKysrKysrKysrKysrKysrKysrKystCiB4ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L3ByaXZhdGUuaCAgICAgIHwgIDMxICsrKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2aXNvci5jICAgICAgICAgIHwgIDE0ICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5j
ICAgICAgICAgICAgIHwgIDExICstCiB4ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMgICAgICAgICAg
ICAgICAgIHwgICAzICstCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDE1ICsrLQogeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgICAgICAgICB8ICAg
NSArLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICAgICAgICAgICAgICAgICB8ICAxMiArLQog
eGVuL2FyY2gveDg2L3hlbi5sZHMuUyAgICAgICAgICAgICAgICAgICB8ICAgNyArCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2NvbmZpZy5oICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2ZpeG1hcC5oICAgICAgICAgICAgIHwgIDI0ICsrKysKIHhlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmggfCAgOTYgKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICAgfCAgIDMgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVz
dC9oeXBlcnZpc29yLmggICB8ICAxMCArLQogMTggZmlsZXMgY2hhbmdlZCwgMzk4IGluc2VydGlv
bnMoKyksIDM1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvcHJpdmF0ZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcnYtaGNhbGwuaAoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
