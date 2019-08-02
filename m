Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F07FDF6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:00:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwP-0005rK-SP; Fri, 02 Aug 2019 15:58:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwP-0005qv-37
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:01 +0000
X-Inumbo-ID: 4c0f9440-b53e-11e9-93aa-3b465ba5a6ef
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c0f9440-b53e-11e9-93aa-3b465ba5a6ef;
 Fri, 02 Aug 2019 15:57:58 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qYRdTk2KQiWh5YL8vxxW8ipoOFKvX4nFjZGSIMmptrG5pjopCSJ8uxoDPp0KMM8/TtML4bzq74
 9IFvxpiOqwAHT12Sp7AQp3yJGuwzUFrfIVXJDrE6AkVpETbl+t+S3knwMDuXUHUrTgcn3IJJdF
 LHRllUv4kNha9iMvSc9ZAjDvWq+ieP5m/5fpwSJueJ1srVebbU5Vplm87UnNBXP7ZOgZyNLuev
 DPvn3ubJ/w9zBS/LI2lK27/8WHo+zMQtuxLC7enDIVQIIfBtR8eEE/qFBNRhwfu2gwyWx83Sos
 Jkk=
X-SBRS: 2.7
X-MesageID: 3951217
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3951217"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:47 +0100
Message-ID: <20190802153606.32061-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 16/35] libxl: Inline do_usbdev_remove into
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGF2aW5nIHRoZSBmdW5jdGlvbiBkb191c2JkZXZfcmVtb3ZlIG1ha2VzIGl0IGhhcmRlciB0byBh
ZGQgYXN5bmNocm9ub3VzCmNhbGxzIGludG8gaXQuIE1vdmUgaXRzIGJvZHkgYmFjayBpbnRvIGxp
YnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZSBhbmQKYWRqdXN0IHRoZSBsYXR0ZXIgYXMgdGhlcmUg
YXJlIG5vIHJlYXNvbiB0byBoYXZlIGEgc2VwYXJhdGVkIGZ1bmN0aW9uLgoKTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfdXNiLmMgfCA2MyArKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhs
X3VzYi5jIGIvdG9vbHMvbGlieGwvbGlieGxfdXNiLmMKaW5kZXggNDNjOGFkM2VlMy4uY2MxNzZm
NmQwMSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdXNiLmMKKysrIGIvdG9vbHMvbGli
eGwvbGlieGxfdXNiLmMKQEAgLTE2NTUsMTcgKzE2NTUsMzggQEAgc3RhdGljIHZvaWQgbGlieGxf
X2RldmljZV91c2JkZXZfYWRkKGxpYnhsX19lZ2MgKmVnYywgdWludDMyX3QgZG9taWQsCiBMSUJY
TF9ERUZJTkVfREVWSUNFX0FERCh1c2JkZXYpCiBzdGF0aWMgTElCWExfREVGSU5FX0RFVklDRVNf
QUREKHVzYmRldikKIAotc3RhdGljIGludCBkb191c2JkZXZfcmVtb3ZlKGxpYnhsX19nYyAqZ2Ms
IHVpbnQzMl90IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2Rldmlj
ZV91c2JkZXYgKnVzYmRldikKKy8qIE9wZXJhdGlvbiB0byByZW1vdmUgdXNiIGRldmljZS4KKyAq
CisgKiBHZW5lcmFsbHksIGl0IGRvZXM6CisgKiAxKSBjaGVjayBpZiB0aGUgdXNiIGRldmljZSBp
cyBhc3NpZ25lZCB0byB0aGUgZG9tYWluCisgKiAyKSByZW1vdmUgdGhlIHVzYiBkZXZpY2UgZnJv
bSB4ZW5zdG9yZSBjb250cm9sbGVyL3BvcnQuCisgKiAzKSB1bmJpbmQgdXNiIGRldmljZSBmcm9t
IHVzYmJhY2sgYW5kIHJlYmluZCB0byBpdHMgb3JpZ2luYWwgZHJpdmVyLgorICogICAgSWYgdXNi
IGRldmljZSBoYXMgbWFueSBpbnRlcmZhY2VzLCBkbyBpdCB0byBlYWNoIGludGVyZmFjZS4KKyAq
Lworc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3VzYmRldl9yZW1vdmUobGlieGxfX2djICpnYywg
dWludDMyX3QgZG9taWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
aWJ4bF9kZXZpY2VfdXNiZGV2ICp1c2JkZXYpCiB7CiAgICAgaW50IHJjOwogICAgIGNoYXIgKmJ1
c2lkOwogICAgIGxpYnhsX2RldmljZV91c2JjdHJsIHVzYmN0cmw7CiAKKyAgICBpZiAodXNiZGV2
LT5jdHJsIDwgMCB8fCB1c2JkZXYtPnBvcnQgPCAxKSB7CisgICAgICAgIExPR0QoRVJST1IsIGRv
bWlkLCAiSW52YWxpZCBVU0IgZGV2aWNlIik7CisgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOwor
ICAgIH0KKwogICAgIGxpYnhsX2RldmljZV91c2JjdHJsX2luaXQoJnVzYmN0cmwpOwogICAgIHJj
ID0gbGlieGxfZGV2aWRfdG9fZGV2aWNlX3VzYmN0cmwoQ1RYLCBkb21pZCwgdXNiZGV2LT5jdHJs
LCAmdXNiY3RybCk7CiAgICAgaWYgKHJjKSBnb3RvIG91dDsKIAorICAgIGlmICh1c2JjdHJsLmJh
Y2tlbmRfZG9taWQgIT0gTElCWExfVE9PTFNUQUNLX0RPTUlEKSB7CisgICAgICAgIExPR0QoRVJS
T1IsIGRvbWlkLAorICAgICAgICAgICAgICJEb24ndCBzdXBwb3J0IHJlbW92aW5nIFVTQiBkZXZp
Y2UgZnJvbSBub24tRG9tMCBiYWNrZW5kIik7CisgICAgICAgIHJjID0gRVJST1JfSU5WQUw7Cisg
ICAgICAgIGdvdG8gb3V0OworICAgIH0KKworICAgIC8qIGRvIGFjdHVhbCByZW1vdmluZyB1c2Ig
ZGV2aWNlIG9wZXJhdGlvbiAqLwogICAgIHN3aXRjaCAodXNiY3RybC50eXBlKSB7CiAgICAgY2Fz
ZSBMSUJYTF9VU0JDVFJMX1RZUEVfUFY6CiAgICAgICAgIGJ1c2lkID0gdXNiZGV2X2J1c2lkX2Zy
b21fY3RybHBvcnQoZ2MsIGRvbWlkLCB1c2JkZXYsIHVzYmN0cmwudHlwZSk7CkBAIC0xNzQzLDQ0
ICsxNzY0LDYgQEAgc3RhdGljIGludCBkb191c2JkZXZfcmVtb3ZlKGxpYnhsX19nYyAqZ2MsIHVp
bnQzMl90IGRvbWlkLAogICAgIHJldHVybiByYzsKIH0KIAotLyogT3BlcmF0aW9uIHRvIHJlbW92
ZSB1c2IgZGV2aWNlLgotICoKLSAqIEdlbmVyYWxseSwgaXQgZG9lczoKLSAqIDEpIGNoZWNrIGlm
IHRoZSB1c2IgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIHRoZSBkb21haW4KLSAqIDIpIHJlbW92ZSB0
aGUgdXNiIGRldmljZSBmcm9tIHhlbnN0b3JlIGNvbnRyb2xsZXIvcG9ydC4KLSAqIDMpIHVuYmlu
ZCB1c2IgZGV2aWNlIGZyb20gdXNiYmFjayBhbmQgcmViaW5kIHRvIGl0cyBvcmlnaW5hbCBkcml2
ZXIuCi0gKiAgICBJZiB1c2IgZGV2aWNlIGhhcyBtYW55IGludGVyZmFjZXMsIGRvIGl0IHRvIGVh
Y2ggaW50ZXJmYWNlLgotICovCi1zdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdXNiZGV2X3JlbW92
ZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxpYnhsX2RldmljZV91c2JkZXYgKnVzYmRldikKLXsKLSAgICBsaWJ4
bF9kZXZpY2VfdXNiY3RybCB1c2JjdHJsOwotICAgIGludCByYzsKLQotICAgIGlmICh1c2JkZXYt
PmN0cmwgPCAwIHx8IHVzYmRldi0+cG9ydCA8IDEpIHsKLSAgICAgICAgTE9HRChFUlJPUiwgZG9t
aWQsICJJbnZhbGlkIFVTQiBkZXZpY2UiKTsKLSAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7Ci0g
ICAgfQotCi0gICAgbGlieGxfZGV2aWNlX3VzYmN0cmxfaW5pdCgmdXNiY3RybCk7Ci0gICAgcmMg
PSBsaWJ4bF9kZXZpZF90b19kZXZpY2VfdXNiY3RybChDVFgsIGRvbWlkLCB1c2JkZXYtPmN0cmws
ICZ1c2JjdHJsKTsKLSAgICBpZiAocmMpIGdvdG8gb3V0OwotCi0gICAgaWYgKHVzYmN0cmwuYmFj
a2VuZF9kb21pZCAhPSBMSUJYTF9UT09MU1RBQ0tfRE9NSUQpIHsKLSAgICAgICAgTE9HRChFUlJP
UiwgZG9taWQsCi0gICAgICAgICAgICAgIkRvbid0IHN1cHBvcnQgcmVtb3ZpbmcgVVNCIGRldmlj
ZSBmcm9tIG5vbi1Eb20wIGJhY2tlbmQiKTsKLSAgICAgICAgcmMgPSBFUlJPUl9JTlZBTDsKLSAg
ICAgICAgZ290byBvdXQ7Ci0gICAgfQotCi0gICAgLyogZG8gYWN0dWFsIHJlbW92aW5nIHVzYiBk
ZXZpY2Ugb3BlcmF0aW9uICovCi0gICAgcmMgPSBkb191c2JkZXZfcmVtb3ZlKGdjLCBkb21pZCwg
dXNiZGV2KTsKLQotb3V0OgotICAgIGxpYnhsX2RldmljZV91c2JjdHJsX2Rpc3Bvc2UoJnVzYmN0
cmwpOwotICAgIHJldHVybiByYzsKLX0KLQogaW50IGxpYnhsX2RldmljZV91c2JkZXZfcmVtb3Zl
KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsaWJ4bF9kZXZpY2VfdXNiZGV2ICp1c2JkZXYsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdykKLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
