Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A08E1BAE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:03:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGG2-0006FY-M8; Wed, 23 Oct 2019 13:00:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGG2-0006F5-09
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:58 +0000
X-Inumbo-ID: 150ed3e2-f595-11e9-a531-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 150ed3e2-f595-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hc7BW0gamVDxfQE27Bbza9HoJMjjSPTEL8Iub+Ut1+A=;
 b=eE1ldlbL7uNOGNFC4qShmejKUHwTiXC5afkw77jqZ0BplfPHGqz0VFIF
 hk8PS+86T659xPXRSY1zfkuhY3wprr0KTfZgNTmKTALrWpqXqUNvUkM4/
 gX4JGwCJQnMnvLoywfz3L39bqGcVoahWPO4LWkIa+RaP5BeNHOs0UzU2z M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jgojwduv6wyatx1NFrB0Ex2Ujm9IBmZHQYUkmzCXN/anb9qCKxNZALLvHWrJ8820piJcTwbx3x
 usgWc3qiT4gEjIHJkb+INiZkRsTM7WS/EKBkWCfo4quYi1qIyExvZGeFH9nKjc3NHAt05PY5X0
 sQd2a/mpVBu+esbQ4kxqPDMlayjZf0W17pFOCrqliozN98AIRDTmfokF/gSXEBg7JQ5s/fATs2
 ZxR66Q6npiBAxe9+EOQkN9YRdqKVENX8omfifMuNELNQ2Oy/A0kOLvcjDcwGdU7WcN5cgCNk6c
 N2M=
X-SBRS: 2.7
X-MesageID: 7411235
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7411235"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:13 +0100
Message-ID: <20191023130013.32382-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 11/11] libxl: On ARM,
 reject future new passthrough modes too
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Anthony
 PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBtb3N0IHBsZWFzYW50bHkgZG9uZSBieSBhbHNvIGNoYW5naW5nIHRoZSBpZiB0byBh
IHN3aXRjaC4KClN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ0M6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgoKLS0tCnY3OiBOZXcgcGF0Y2ggaW4gdGhpcyB2ZXJzaW9uIG9m
IHRoZSBzZXJpZXMuCi0tLQogdG9vbHMvbGlieGwvbGlieGxfYXJtLmMgfCAxMCArKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMK
aW5kZXggMmYxY2E2OTQzMS4uMGIzMDI1YTllZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfYXJtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMKQEAgLTEyMDMsOSArMTIwMywx
NSBAQCBpbnQgbGlieGxfX2FyY2hfcGFzc3Rocm91Z2hfbW9kZV9zZXRkZWZhdWx0KGxpYnhsX19n
YyAqZ2MsCiAgICAgICAgIGNfaW5mby0+cGFzc3Rocm91Z2ggPSBMSUJYTF9QQVNTVEhST1VHSF9T
SEFSRV9QVDsKICAgICB9CiAKLSAgICBpZiAoY19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJYTF9Q
QVNTVEhST1VHSF9TWU5DX1BUKSB7CisgICAgc3dpdGNoIChjX2luZm8tPnBhc3N0aHJvdWdoKSB7
CisgICAgY2FzZSBMSUJYTF9QQVNTVEhST1VHSF9ESVNBQkxFRDsKKyAgICBjYXNlIExJQlhMX1BB
U1NUSFJPVUdIX1NIQVJFX1BUOgorICAgICAgICBicmVhazsKKworICAgIGRlZmF1bHQ6CiAgICAg
ICAgIExPR0QoRVJST1IsIGRvbWlkLAotICAgICAgICAgICAgICJwYXNzdGhyb3VnaD1cInN5bmNf
cHRcIiBub3Qgc3VwcG9ydGVkIG9uIEFSTVxuIik7CisgICAgICAgICAgICAgInBhc3N0aHJvdWdo
PVwiJXNcIiBub3Qgc3VwcG9ydGVkIG9uIEFSTVxuIiwKKyAgICAgICAgICAgICBsaWJ4bF9fcGFz
c3Rocm91Z2hfbW9kZV90b19zdHJpbmcoY19pbmZvLT5wYXNzdGhyb3VnaCk7CiAgICAgICAgIHJj
ID0gRVJST1JfSU5WQUw7CiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
