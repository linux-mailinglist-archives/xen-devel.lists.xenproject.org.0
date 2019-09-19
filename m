Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEB5B8047
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:44:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0Qw-0004uo-1b; Thu, 19 Sep 2019 17:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0Qu-0004sW-1c
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:32 +0000
X-Inumbo-ID: b1045cf0-db04-11e9-966e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1045cf0-db04-11e9-966e-12813bfff9fa;
 Thu, 19 Sep 2019 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lfU5Lz9mC5Tpd9BlxCQdv6MV7HYJTHP2JVQj7+pdKFg=;
 b=FSZrTQRB33AYJ01cegQ/bfAw2N17sx08luAWBpWtcKDXrdbrfxVBGwMz
 EA9OflHEVUL3aFy9bqR2hbgsbyZC74o+l8e5KfCIYR5jsXer+hTQk4vtg
 EHNosuQMCvO539pcSKoDSJbHDkoOt0tbytHceL8dsNN+ChZrPMZ2QIqFO s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /in4ZC5diqKIdnFufZDqeyk9EiNtkTXWxCwsYpCwOtwcf7lKbAX0WIpSaBU/x7Hdn22MgT4Ds2
 yU9B3BB+lEUUlXTwO6focBnVHLO1fH6pPdsI2Ry5w/qMuUfTLkmz3UC6LQWNj8JZr1FopNAqoI
 T2ww3iKm8pt22i8OSuZII3b6SpaYcLkmDj58Aej7wzUQEKZmTVwTEho4dT8hJcY8m1o4UtZZbN
 eeGlG2cG3dOMfyhZAPJ/fcMs70tMduF8+TnXNoKI5XaiEFA7wNdTf/H/Tg2H3Ls1U1EhjQ6klq
 nnE=
X-SBRS: 2.7
X-MesageID: 5864921
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5864921"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:36 +0100
Message-ID: <20190919171656.899649-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 16/35] libxl: Inline do_usbdev_remove into
 libxl__device_usbdev_remove
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGF2aW5nIHRoZSBmdW5jdGlvbiBkb191c2JkZXZfcmVtb3ZlIG1ha2VzIGl0IGhhcmRlciB0byBh
ZGQgYXN5bmNocm9ub3VzCmNhbGxzIGludG8gaXQuIE1vdmUgaXRzIGJvZHkgYmFjayBpbnRvIGxp
YnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZSBhbmQKYWRqdXN0IHRoZSBsYXR0ZXIgYXMgdGhlcmUg
YXJlIG5vIHJlYXNvbiB0byBoYXZlIGEgc2VwYXJhdGVkIGZ1bmN0aW9uLgoKTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyB8IDYzICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KSwgNDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdXNiLmMg
Yi90b29scy9saWJ4bC9saWJ4bF91c2IuYwppbmRleCAwZGE3YTcyNWE3MjAuLmRlODEyMmRjNTdl
OSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdXNiLmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfdXNiLmMKQEAgLTE2NTMsMTcgKzE2NTMsMzggQEAgc3RhdGljIHZvaWQgbGlieGxfX2Rl
dmljZV91c2JkZXZfYWRkKGxpYnhsX19lZ2MgKmVnYywgdWludDMyX3QgZG9taWQsCiBMSUJYTF9E
RUZJTkVfREVWSUNFX0FERCh1c2JkZXYpCiBzdGF0aWMgTElCWExfREVGSU5FX0RFVklDRVNfQURE
KHVzYmRldikKIAotc3RhdGljIGludCBkb191c2JkZXZfcmVtb3ZlKGxpYnhsX19nYyAqZ2MsIHVp
bnQzMl90IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RldmljZV91
c2JkZXYgKnVzYmRldikKKy8qIE9wZXJhdGlvbiB0byByZW1vdmUgdXNiIGRldmljZS4KKyAqCisg
KiBHZW5lcmFsbHksIGl0IGRvZXM6CisgKiAxKSBjaGVjayBpZiB0aGUgdXNiIGRldmljZSBpcyBh
c3NpZ25lZCB0byB0aGUgZG9tYWluCisgKiAyKSByZW1vdmUgdGhlIHVzYiBkZXZpY2UgZnJvbSB4
ZW5zdG9yZSBjb250cm9sbGVyL3BvcnQuCisgKiAzKSB1bmJpbmQgdXNiIGRldmljZSBmcm9tIHVz
YmJhY2sgYW5kIHJlYmluZCB0byBpdHMgb3JpZ2luYWwgZHJpdmVyLgorICogICAgSWYgdXNiIGRl
dmljZSBoYXMgbWFueSBpbnRlcmZhY2VzLCBkbyBpdCB0byBlYWNoIGludGVyZmFjZS4KKyAqLwor
c3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3VzYmRldl9yZW1vdmUobGlieGxfX2djICpnYywgdWlu
dDMyX3QgZG9taWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4
bF9kZXZpY2VfdXNiZGV2ICp1c2JkZXYpCiB7CiAgICAgaW50IHJjOwogICAgIGNoYXIgKmJ1c2lk
OwogICAgIGxpYnhsX2RldmljZV91c2JjdHJsIHVzYmN0cmw7CiAKKyAgICBpZiAodXNiZGV2LT5j
dHJsIDwgMCB8fCB1c2JkZXYtPnBvcnQgPCAxKSB7CisgICAgICAgIExPR0QoRVJST1IsIGRvbWlk
LCAiSW52YWxpZCBVU0IgZGV2aWNlIik7CisgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOworICAg
IH0KKwogICAgIGxpYnhsX2RldmljZV91c2JjdHJsX2luaXQoJnVzYmN0cmwpOwogICAgIHJjID0g
bGlieGxfZGV2aWRfdG9fZGV2aWNlX3VzYmN0cmwoQ1RYLCBkb21pZCwgdXNiZGV2LT5jdHJsLCAm
dXNiY3RybCk7CiAgICAgaWYgKHJjKSBnb3RvIG91dDsKIAorICAgIGlmICh1c2JjdHJsLmJhY2tl
bmRfZG9taWQgIT0gTElCWExfVE9PTFNUQUNLX0RPTUlEKSB7CisgICAgICAgIExPR0QoRVJST1Is
IGRvbWlkLAorICAgICAgICAgICAgICJEb24ndCBzdXBwb3J0IHJlbW92aW5nIFVTQiBkZXZpY2Ug
ZnJvbSBub24tRG9tMCBiYWNrZW5kIik7CisgICAgICAgIHJjID0gRVJST1JfSU5WQUw7CisgICAg
ICAgIGdvdG8gb3V0OworICAgIH0KKworICAgIC8qIGRvIGFjdHVhbCByZW1vdmluZyB1c2IgZGV2
aWNlIG9wZXJhdGlvbiAqLwogICAgIHN3aXRjaCAodXNiY3RybC50eXBlKSB7CiAgICAgY2FzZSBM
SUJYTF9VU0JDVFJMX1RZUEVfUFY6CiAgICAgICAgIGJ1c2lkID0gdXNiZGV2X2J1c2lkX2Zyb21f
Y3RybHBvcnQoZ2MsIGRvbWlkLCB1c2JkZXYsIHVzYmN0cmwudHlwZSk7CkBAIC0xNzQxLDQ0ICsx
NzYyLDYgQEAgc3RhdGljIGludCBkb191c2JkZXZfcmVtb3ZlKGxpYnhsX19nYyAqZ2MsIHVpbnQz
Ml90IGRvbWlkLAogICAgIHJldHVybiByYzsKIH0KIAotLyogT3BlcmF0aW9uIHRvIHJlbW92ZSB1
c2IgZGV2aWNlLgotICoKLSAqIEdlbmVyYWxseSwgaXQgZG9lczoKLSAqIDEpIGNoZWNrIGlmIHRo
ZSB1c2IgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIHRoZSBkb21haW4KLSAqIDIpIHJlbW92ZSB0aGUg
dXNiIGRldmljZSBmcm9tIHhlbnN0b3JlIGNvbnRyb2xsZXIvcG9ydC4KLSAqIDMpIHVuYmluZCB1
c2IgZGV2aWNlIGZyb20gdXNiYmFjayBhbmQgcmViaW5kIHRvIGl0cyBvcmlnaW5hbCBkcml2ZXIu
Ci0gKiAgICBJZiB1c2IgZGV2aWNlIGhhcyBtYW55IGludGVyZmFjZXMsIGRvIGl0IHRvIGVhY2gg
aW50ZXJmYWNlLgotICovCi1zdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZShs
aWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpYnhsX2RldmljZV91c2JkZXYgKnVzYmRldikKLXsKLSAgICBsaWJ4bF9k
ZXZpY2VfdXNiY3RybCB1c2JjdHJsOwotICAgIGludCByYzsKLQotICAgIGlmICh1c2JkZXYtPmN0
cmwgPCAwIHx8IHVzYmRldi0+cG9ydCA8IDEpIHsKLSAgICAgICAgTE9HRChFUlJPUiwgZG9taWQs
ICJJbnZhbGlkIFVTQiBkZXZpY2UiKTsKLSAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7Ci0gICAg
fQotCi0gICAgbGlieGxfZGV2aWNlX3VzYmN0cmxfaW5pdCgmdXNiY3RybCk7Ci0gICAgcmMgPSBs
aWJ4bF9kZXZpZF90b19kZXZpY2VfdXNiY3RybChDVFgsIGRvbWlkLCB1c2JkZXYtPmN0cmwsICZ1
c2JjdHJsKTsKLSAgICBpZiAocmMpIGdvdG8gb3V0OwotCi0gICAgaWYgKHVzYmN0cmwuYmFja2Vu
ZF9kb21pZCAhPSBMSUJYTF9UT09MU1RBQ0tfRE9NSUQpIHsKLSAgICAgICAgTE9HRChFUlJPUiwg
ZG9taWQsCi0gICAgICAgICAgICAgIkRvbid0IHN1cHBvcnQgcmVtb3ZpbmcgVVNCIGRldmljZSBm
cm9tIG5vbi1Eb20wIGJhY2tlbmQiKTsKLSAgICAgICAgcmMgPSBFUlJPUl9JTlZBTDsKLSAgICAg
ICAgZ290byBvdXQ7Ci0gICAgfQotCi0gICAgLyogZG8gYWN0dWFsIHJlbW92aW5nIHVzYiBkZXZp
Y2Ugb3BlcmF0aW9uICovCi0gICAgcmMgPSBkb191c2JkZXZfcmVtb3ZlKGdjLCBkb21pZCwgdXNi
ZGV2KTsKLQotb3V0OgotICAgIGxpYnhsX2RldmljZV91c2JjdHJsX2Rpc3Bvc2UoJnVzYmN0cmwp
OwotICAgIHJldHVybiByYzsKLX0KLQogaW50IGxpYnhsX2RldmljZV91c2JkZXZfcmVtb3ZlKGxp
YnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsaWJ4bF9kZXZpY2VfdXNiZGV2ICp1c2JkZXYsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdykKLS0gCkFudGhvbnkgUEVS
QVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
