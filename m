Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039C136E1C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 14:32:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipuLm-0001zj-VW; Fri, 10 Jan 2020 13:29:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipuLl-0001zU-U6
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 13:29:17 +0000
X-Inumbo-ID: 2e49e148-33ad-11ea-a2eb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e49e148-33ad-11ea-a2eb-bc764e2007e4;
 Fri, 10 Jan 2020 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578662949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/5wulVWsdwFhm+h/O97CX626cu5GEU2I6i0AP03/ttE=;
 b=YlMoGHfCWl2o9lCZ9FBlLBZ23mLtrcBFcWfHFuJLMiG8e/hjrKttOr3y
 +ke6apri8SJq8+LJu9fILO/jtz4rXtmTikfhdxKlULO8XDjZIjHFJwQZh
 T65dsQBYA4c12nxPOerb/k+PiO5sbsYapcW2XjcQUyWNaOYkuzEKCdOk/ s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IKy6Nyk/8Fx+S2F7zYzFqRDH7h+GE9KehlE3Wvl8ePE41polCiXy6loGRnYu7jsMlk336e+tsO
 pY1SE6KEU0+tL8CR7gatkSo8ic1RYj7PjKnGzv5IEnwgIRNJVXmTvUuIEoK4OwZt9RS0W4VgEW
 QjxgefYBTu/6DS0n8aO/nLAljSv2wjyg4F9KsxOtS4MeV5Y1tCnIVO5KZDfJ4KD4pSlOKetWmb
 gEYD/ubeOwZ9ldp/011w99+lHqQXOilV/jsI0556Fdpy0/ZyhKfT8hKk4BapVf94jVqHMKOl6e
 ZLs=
X-SBRS: 2.7
X-MesageID: 11329924
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11329924"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 13:28:56 +0000
Message-ID: <20200110132902.29295-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
References: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/8] libxl: event: Rename ctx.pollers_fd_changed
 to .pollers_active
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHVzZSB0aGlzIGEgYml0IG1vcmUgd2lkZWx5LiAgTWFrZSB0aGUgbmFt
ZSBtb3JlCmdlbmVyYWwuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bC5jICAgICAgICAgIHwgNCArKy0t
CiB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jICAgIHwgOCArKysrLS0tLQogdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaCB8IDYgKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5jIGIv
dG9vbHMvbGlieGwvbGlieGwuYwppbmRleCBhMGQ4NDI4MWQwLi5mNjBmZDNlNGZkIDEwMDY0NAot
LS0gYS90b29scy9saWJ4bC9saWJ4bC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmMKQEAgLTQ4
LDcgKzQ4LDcgQEAgaW50IGxpYnhsX2N0eF9hbGxvYyhsaWJ4bF9jdHggKipwY3R4LCBpbnQgdmVy
c2lvbiwKICAgICBjdHgtPnBvbGxlcl9hcHAgPSAwOwogICAgIExJQlhMX0xJU1RfSU5JVCgmY3R4
LT5wb2xsZXJzX2V2ZW50KTsKICAgICBMSUJYTF9MSVNUX0lOSVQoJmN0eC0+cG9sbGVyc19pZGxl
KTsKLSAgICBMSUJYTF9MSVNUX0lOSVQoJmN0eC0+cG9sbGVyc19mZHNfY2hhbmdlZCk7CisgICAg
TElCWExfTElTVF9JTklUKCZjdHgtPnBvbGxlcnNfYWN0aXZlKTsKIAogICAgIExJQlhMX0xJU1Rf
SU5JVCgmY3R4LT5lZmRzKTsKICAgICBMSUJYTF9UQUlMUV9JTklUKCZjdHgtPmV0aW1lcyk7CkBA
IC0xNzcsNyArMTc3LDcgQEAgaW50IGxpYnhsX2N0eF9mcmVlKGxpYnhsX2N0eCAqY3R4KQogICAg
IGxpYnhsX19wb2xsZXJfcHV0KGN0eCwgY3R4LT5wb2xsZXJfYXBwKTsKICAgICBjdHgtPnBvbGxl
cl9hcHAgPSBOVUxMOwogICAgIGFzc2VydChMSUJYTF9MSVNUX0VNUFRZKCZjdHgtPnBvbGxlcnNf
ZXZlbnQpKTsKLSAgICBhc3NlcnQoTElCWExfTElTVF9FTVBUWSgmY3R4LT5wb2xsZXJzX2Zkc19j
aGFuZ2VkKSk7CisgICAgYXNzZXJ0KExJQlhMX0xJU1RfRU1QVFkoJmN0eC0+cG9sbGVyc19hY3Rp
dmUpKTsKICAgICBsaWJ4bF9fcG9sbGVyICpwb2xsZXIsICpwb2xsZXJfdG1wOwogICAgIExJQlhM
X0xJU1RfRk9SRUFDSF9TQUZFKHBvbGxlciwgJmN0eC0+cG9sbGVyc19pZGxlLCBlbnRyeSwgcG9s
bGVyX3RtcCkgewogICAgICAgICBsaWJ4bF9fcG9sbGVyX2Rpc3Bvc2UocG9sbGVyKTsKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgYi90b29scy9saWJ4bC9saWJ4bF9ldmVu
dC5jCmluZGV4IDEyMTBjMWJmYjMuLjViMTJhNDVlNzAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2V2ZW50LmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwpAQCAtMjM4LDcg
KzIzOCw3IEBAIHZvaWQgbGlieGxfX2V2X2ZkX2RlcmVnaXN0ZXIobGlieGxfX2djICpnYywgbGli
eGxfX2V2X2ZkICpldikKICAgICBMSUJYTF9MSVNUX1JFTU9WRShldiwgZW50cnkpOwogICAgIGV2
LT5mZCA9IC0xOwogCi0gICAgTElCWExfTElTVF9GT1JFQUNIKHBvbGxlciwgJkNUWC0+cG9sbGVy
c19mZHNfY2hhbmdlZCwgZmRzX2NoYW5nZWRfZW50cnkpCisgICAgTElCWExfTElTVF9GT1JFQUNI
KHBvbGxlciwgJkNUWC0+cG9sbGVyc19hY3RpdmUsIGFjdGl2ZV9lbnRyeSkKICAgICAgICAgcG9s
bGVyLT5mZHNfZGVyZWdpc3RlcmVkID0gMTsKIAogIG91dDoKQEAgLTE2NjMsMTUgKzE2NjMsMTUg
QEAgbGlieGxfX3BvbGxlciAqbGlieGxfX3BvbGxlcl9nZXQobGlieGxfX2djICpnYykKICAgICAg
ICAgfQogICAgIH0KIAotICAgIExJQlhMX0xJU1RfSU5TRVJUX0hFQUQoJkNUWC0+cG9sbGVyc19m
ZHNfY2hhbmdlZCwgcCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGZkc19jaGFuZ2VkX2Vu
dHJ5KTsKKyAgICBMSUJYTF9MSVNUX0lOU0VSVF9IRUFEKCZDVFgtPnBvbGxlcnNfYWN0aXZlLCBw
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgYWN0aXZlX2VudHJ5KTsKICAgICByZXR1cm4g
cDsKIH0KIAogdm9pZCBsaWJ4bF9fcG9sbGVyX3B1dChsaWJ4bF9jdHggKmN0eCwgbGlieGxfX3Bv
bGxlciAqcCkKIHsKICAgICBpZiAoIXApIHJldHVybjsKLSAgICBMSUJYTF9MSVNUX1JFTU9WRShw
LCBmZHNfY2hhbmdlZF9lbnRyeSk7CisgICAgTElCWExfTElTVF9SRU1PVkUocCwgYWN0aXZlX2Vu
dHJ5KTsKICAgICBMSUJYTF9MSVNUX0lOU0VSVF9IRUFEKCZjdHgtPnBvbGxlcnNfaWRsZSwgcCwg
ZW50cnkpOwogfQogCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBjNWI3MWQxNWYwLi41ODFkNjRiOTlj
IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTYyOSwxMyArNjI5LDEzIEBAIHN0cnVjdCBsaWJ4bF9f
cG9sbGVyIHsKICAgICAvKgogICAgICAqIFdlIGFsc28gdXNlIHRoZSBwb2xsZXIgdG8gcmVjb3Jk
IHdoZXRoZXIgYW55IGZkcyBoYXZlIGJlZW4KICAgICAgKiBkZXJlZ2lzdGVyZWQgc2luY2Ugd2Ug
ZW50ZXJlZCBwb2xsLiAgRWFjaCBwb2xsZXIgd2hpY2ggaXMgbm90Ci0gICAgICogaWRsZSBpcyBv
biB0aGUgbGlzdCBwb2xsZXJzX2Zkc19jaGFuZ2VkLiAgZmRzX2RlcmVnaXN0ZXJlZCBpcworICAg
ICAqIGlkbGUgaXMgb24gdGhlIGxpc3QgcG9sbGVyc19hY3RpdmUuICBmZHNfZGVyZWdpc3RlcmVk
IGlzCiAgICAgICogY2xlYXJlZCBieSBiZWZvcmVwb2xsLCBhbmQgdGVzdGVkIGJ5IGFmdGVycG9s
bC4gIFdoZW5ldmVyIGFuIGZkCiAgICAgICogZXZlbnQgaXMgZGVyZWdpc3RlcmVkLCB3ZSBzZXQg
dGhlIGZkc19kZXJlZ2lzdGVyZWQgb2YgYWxsIG5vbi1pZGxlCiAgICAgICogcG9sbGVycy4gIFNv
IGFmdGVycG9sbCBjYW4gdGVsbCB3aGV0aGVyIGFueSBQT0xMTlZBTCBpcwogICAgICAqIHBsYXVz
aWJseSBkdWUgdG8gYW4gZmQgYmVpbmcgY2xvc2VkIGFuZCByZW9wZW5lZC4KICAgICAgKi8KLSAg
ICBMSUJYTF9MSVNUX0VOVFJZKGxpYnhsX19wb2xsZXIpIGZkc19jaGFuZ2VkX2VudHJ5OworICAg
IExJQlhMX0xJU1RfRU5UUlkobGlieGxfX3BvbGxlcikgYWN0aXZlX2VudHJ5OwogICAgIGJvb2wg
ZmRzX2RlcmVnaXN0ZXJlZDsKIH07CiAKQEAgLTY3OCw3ICs2NzgsNyBAQCBzdHJ1Y3QgbGlieGxf
X2N0eCB7CiAKICAgICBsaWJ4bF9fcG9sbGVyICpwb2xsZXJfYXBwOyAvKiBsaWJ4bF9vc2V2ZW50
X2JlZm9yZXBvbGwgYW5kIF9hZnRlcnBvbGwgKi8KICAgICBMSUJYTF9MSVNUX0hFQUQoLCBsaWJ4
bF9fcG9sbGVyKSBwb2xsZXJzX2V2ZW50LCBwb2xsZXJzX2lkbGU7Ci0gICAgTElCWExfTElTVF9I
RUFEKCwgbGlieGxfX3BvbGxlcikgcG9sbGVyc19mZHNfY2hhbmdlZDsKKyAgICBMSUJYTF9MSVNU
X0hFQUQoLCBsaWJ4bF9fcG9sbGVyKSBwb2xsZXJzX2FjdGl2ZTsKIAogICAgIExJQlhMX1NMSVNU
X0hFQUQobGlieGxfX29zZXZlbnRfaG9va19uZXhpLCBsaWJ4bF9fb3NldmVudF9ob29rX25leHVz
KQogICAgICAgICBob29rX2ZkX25leGlfaWRsZSwgaG9va190aW1lb3V0X25leGlfaWRsZTsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
