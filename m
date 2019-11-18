Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1EE100A0C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:16:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWkaS-0005yA-RA; Mon, 18 Nov 2019 17:13:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vqm6=ZK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iWkaR-0005xy-Se
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:13:15 +0000
X-Inumbo-ID: b4910016-0a26-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4910016-0a26-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574097194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IezcV3OJSFGZi20L2tYeZ4LxjrHT99EIg0NiUFyKlQ0=;
 b=CkkVuxQcUc/bVlY4CoM/k5f25n1fCaYfd0B0aM4z0V1xSMAryTXrtOpE
 MrtXi4zodmWZQDUwl2zaf4zkr4Ush+6jr0F6zlzLKSeIWcMkyy9lE52+2
 iHEv44n0eWhzHT+SfLSpe8mlOw5TAEk/lVyVz6mJpPbZBZFlbh6elLOsl I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gzLagkkO8v2PGHHyzyOULCRyBkOC5X7+uJXQfGHcZMkvRTVxPkwGQHFD5A+mD61MxuAtilGaVN
 47L/qw51nJ4oX2oR1nUfNnWtJ2RgjZot/dTZy2SN/ONImYRGCcncJSpuhZFlXhgtIO39iSMNdX
 yELsMXSb0JtRBgaHR6XAtXrjx2PuhhJU8ZoIbEKHS8txtk6fv5nJ1IGucXabW7whv8c7KW/G40
 pWAsrYoTgZiIemzN6EqfVu3VuwfYpPGwwENWCZIZ88p9Pv5lObCdnHrVxffJuHtyJ304lb2rLP
 nBs=
X-SBRS: 2.7
X-MesageID: 8833206
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8833206"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 18 Nov 2019 17:13:05 +0000
Message-ID: <20191118171309.1459302-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118171309.1459302-1-anthony.perard@citrix.com>
References: <20191118171309.1459302-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v3 4/7] libxl: Introduce
 libxl__ev_slowlock_dispose
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpY2ggYWxsb3cgdG8gY2FuY2VsIHRoZSBsb2NrIG9wZXJhdGlvbiB3aGlsZSBpdCBpcyBpbiBB
Y3RpdmUgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgotLS0KCk5vdGVzOgogICAgdjI6CiAgICAtIFJlbmFtZWQgbGlieGxfX2V2X3FtcGxv
Y2tfZGlzcG9zZSB0byBsaWJ4bF9fZXZfc2xvd2xvY2tfZGlzcG9zZQogICAgLSBUaGlzIG5ldyBB
UEkgd2FzIHBhcnQgb2YgdGhlIHBhdGNoICJJbnRyb2R1Y2UgbGlieGxfX2V2X3FtcGxvY2siIGlu
IHYxLgoKIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgfCA2ICsrKysrKwogdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuaCB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgYi90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5jCmluZGV4IDk1MjBhYzM2MTQ5ZS4uYjIwODQxNTdlNGNkIDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jCisrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmMKQEAgLTc2NSw2ICs3NjUsMTIgQEAgdm9pZCBsaWJ4bF9fZXZfc2xv
d2xvY2tfdW5sb2NrKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19ldl9zbG93bG9jayAqbG9jaykKICAg
ICBldl9zbG93bG9ja19pbml0X2ludGVybmFsKGxvY2ssIGxvY2stPnVzZXJkYXRhX3VzZXJpZCk7
CiB9CiAKK3ZvaWQgbGlieGxfX2V2X3Nsb3dsb2NrX2Rpc3Bvc2UobGlieGxfX2djICpnYywgbGli
eGxfX2V2X3Nsb3dsb2NrICpsb2NrKQoreworICAgIGxpYnhsX19ldl9jaGlsZF9raWxsX2RlcmVn
aXN0ZXIobG9jay0+YW8sICZsb2NrLT5jaGlsZCwgU0lHS0lMTCk7CisgICAgbGlieGxfX2V2X3Ns
b3dsb2NrX3VubG9jayhnYywgbG9jayk7Cit9CisKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAg
KiBtb2RlOiBDCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBhMGY5OTI1MmMzOWMuLjliODRkZGRkM2I3
ZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0zOTMsNiArMzkzLDggQEAgc3RydWN0IGxpYnhsX19l
dl9jaGlsZCB7CiAgKiAgbGlieGxfX2V2X3Nsb3dsb2NrX2xvY2s6IElkbGUgLT4gQWN0aXZlCiAg
KiAgICBNYXkgY2FsbCBjYWxsYmFjayBzeW5jaHJvbm91c2x5LgogICogIGxpYnhsX19ldl9zbG93
bG9ja191bmxvY2s6IExvY2tBY3F1aXJlZC9JZGxlIC0+IElkbGUKKyAqICBsaWJ4bF9fZXZfc2xv
d2xvY2tfZGlzcG9zZTogSWRsZS9BY3RpdmUvTG9ja0FjcXVpcmVkIC0+IElkbGUKKyAqICAgIFRo
ZSBjYWxsYmFjayB3aWxsIG5vdCBiZSBjYWxsZWQgYW55bW9yZS4KICAqICBjYWxsYmFjazogICAg
IFdoZW4gY2FsbGVkOiBBY3RpdmUgLT4gTG9ja0FjcXVpcmVkIChvbiBlcnJvcjogSWRsZSkKICAq
ICAgIFRoZSBjYWxsYmFjayBpcyBvbmx5IGNhbGxlZCBvbmNlLgogICovCkBAIC00MTEsNiArNDEz
LDcgQEAgc3RydWN0IGxpYnhsX19ldl9zbG93bG9jayB7CiBfaGlkZGVuIHZvaWQgbGlieGxfX2V2
X2RldmxvY2tfaW5pdChsaWJ4bF9fZXZfc2xvd2xvY2sgKik7CiBfaGlkZGVuIHZvaWQgbGlieGxf
X2V2X3Nsb3dsb2NrX2xvY2sobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfc2xvd2xvY2sgKik7CiBf
aGlkZGVuIHZvaWQgbGlieGxfX2V2X3Nsb3dsb2NrX3VubG9jayhsaWJ4bF9fZ2MgKiwgbGlieGxf
X2V2X3Nsb3dsb2NrICopOworX2hpZGRlbiB2b2lkIGxpYnhsX19ldl9zbG93bG9ja19kaXNwb3Nl
KGxpYnhsX19nYyAqLCBsaWJ4bF9fZXZfc2xvd2xvY2sgKik7CiAKIC8qCiAgKiBRTVAgYXN5bmNo
cm9ub3VzIGNhbGxzCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
