Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731EA100A0E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:16:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWkav-0006Cu-Bc; Mon, 18 Nov 2019 17:13:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vqm6=ZK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iWkat-0006Bj-EL
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:13:43 +0000
X-Inumbo-ID: b5ab0ba5-0a26-11ea-a2db-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5ab0ba5-0a26-11ea-a2db-12813bfff9fa;
 Mon, 18 Nov 2019 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574097197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rew1fL2ZdPHuVA+KWJcp9mwcRFPGnMJ7PLoGwDkSx0g=;
 b=I4wW6oDVt4h7o84rAh7afF58uZC7rUTuWcBhGLgtpSkDbpJz4wkH5bPn
 bx587IdD/RIqNQpZhPVWGJsXHVAUcx72quhEqjpVkEGOR63Ayfp4Yyi9v
 g+SAdd13mE3Xufo97nqOG96YMjYrZiLfsymCRz8LQZ4FYkC15FOVuYYG6 Y=;
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
IronPort-SDR: MNQ4lAN1AbRHEc8R9Ao9LGhFcyU4pIiVtqkFu1z93HTfbKJM8pBZTgE2i2NtgCTxfk/LA8wq48
 PIh5lNWfgju/1iT/o1qZatmd88UOE6NI3Q0yaMI1GPMvOTK3FJ5vG5vbRkNPbWmTMdwJZ9shov
 /YXDIQkxtCd0t2hUr5kANvkqHerf1St/LujNMJEspFmsxaTsu19Ba7VpDllywfj3PqMg0KD32c
 6HeC6suwQ2Cr/1JcjFcSkp34xkaiG8XiXavH/myYA+He5iEP/6ve+aDB7EuKEccWnJcouOiOLH
 ty8=
X-SBRS: 2.7
X-MesageID: 8833209
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8833209"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 18 Nov 2019 17:13:07 +0000
Message-ID: <20191118171309.1459302-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118171309.1459302-1-anthony.perard@citrix.com>
References: <20191118171309.1459302-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v3 6/7] libxl: Introduce
 libxl__ev_immediate
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

VGhpcyBuZXcgZXYgYWxsb3dzIHRvIGFycmFuZ2UgYSBub24tcmVlbnRyYW50IGNhbGxiYWNrIHRv
IGJlIGNhbGxlZC4KVGhpcyBoYXBwZW4gaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGN1cnJlbnQgZXZl
bnQgaXMgcHJvY2Vzc2VkIGFuZCBhZnRlcgpvdGhlciBldl9pbW1lZGlhdGVzIHRoYXQgd291bGQg
aGF2ZSBhbHJlYWR5IGJlZW4gcmVnaXN0ZXJlZC4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5vdGVzOgogICAgdjM6CiAgICAt
IG5ldyBwYXRjaAoKIHRvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgICAgfCAxOSArKysrKysrKysr
KysrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMTcgKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgYi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCmluZGV4
IDQzMTU1MzY4ZGU3Ni4uY2ViNzc1ZDhjYTNmIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bF9ldmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKQEAgLTkxNCw2ICs5MTQs
MTUgQEAgaW50IGxpYnhsX19ldl9kZXZzdGF0ZV93YWl0KGxpYnhsX19hbyAqYW8sIGxpYnhsX19l
dl9kZXZzdGF0ZSAqZHMsCiAgICAgcmV0dXJuIHJjOwogfQogCisvKgorICogaW1tZWRpYXRlIG5v
bi1yZWVudHJhbnQgY2FsbGJhY2sKKyAqLworCit2b2lkIGxpYnhsX19ldl9pbW1lZGlhdGVfcmVn
aXN0ZXIobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfaW1tZWRpYXRlICplaSkKK3sKKyAgICBM
SUJYTF9UQUlMUV9JTlNFUlRfVEFJTCgmZWdjLT5ldl9pbW1lZGlhdGVzLCBlaSwgZW50cnkpOwor
fQorCiAvKgogICogZG9tYWluIGRlYXRoL2Rlc3RydWN0aW9uCiAgKi8KQEAgLTEzOTUsNiArMTQw
NCwxNiBAQCBzdGF0aWMgdm9pZCBlZ2NfcnVuX2NhbGxiYWNrcyhsaWJ4bF9fZWdjICplZ2MpCiAg
ICAgRUdDX0dDOwogICAgIGxpYnhsX2V2ZW50ICpldiwgKmV2X3RtcDsKICAgICBsaWJ4bF9fYW9w
X29jY3VycmVkICphb3AsICphb3BfdG1wOworICAgIGxpYnhsX19ldl9pbW1lZGlhdGUgKmVpLCAq
ZWlfdG1wOworCisgICAgTElCWExfVEFJTFFfRk9SRUFDSF9TQUZFKGVpLCAmZWdjLT5ldl9pbW1l
ZGlhdGVzLCBlbnRyeSwgZWlfdG1wKSB7CisgICAgICAgIExJQlhMX1RBSUxRX1JFTU9WRSgmZWdj
LT5ldl9pbW1lZGlhdGVzLCBlaSwgZW50cnkpOworICAgICAgICBDVFhfTE9DSzsKKyAgICAgICAg
LyogVGhpcyBjYWxsYmFjayBpcyBpbnRlcm5hbCB0byBsaWJ4bCBhbmQgZXhwZWN0cyBDVFggdG8g
YmUKKyAgICAgICAgICogbG9ja2VkLiAqLworICAgICAgICBlaS0+Y2FsbGJhY2soZWdjLCBlaSk7
CisgICAgICAgIENUWF9VTkxPQ0s7CisgICAgfQogCiAgICAgTElCWExfVEFJTFFfRk9SRUFDSF9T
QUZFKGV2LCAmZWdjLT5vY2N1cnJlZF9mb3JfY2FsbGJhY2ssIGxpbmssIGV2X3RtcCkgewogICAg
ICAgICBMSUJYTF9UQUlMUV9SRU1PVkUoJmVnYy0+b2NjdXJyZWRfZm9yX2NhbGxiYWNrLCBldiwg
bGluayk7CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMv
bGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBmOTU4OTVlYWUxN2QuLjQwMDc1MmE3ZjhmZSAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0yMDAsNiArMjAwLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgbGli
eGxfX2V2X3Nsb3dsb2NrIGxpYnhsX19ldl9zbG93bG9jazsKIHR5cGVkZWYgc3RydWN0IGxpYnhs
X19kbV9yZXN1bWVfc3RhdGUgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZTsKIHR5cGVkZWYgc3RydWN0
IGxpYnhsX19hb19kZXZpY2UgbGlieGxfX2FvX2RldmljZTsKIHR5cGVkZWYgc3RydWN0IGxpYnhs
X19tdWx0aWRldiBsaWJ4bF9fbXVsdGlkZXY7Cit0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fZXZfaW1t
ZWRpYXRlIGxpYnhsX19ldl9pbW1lZGlhdGU7CiAKIHR5cGVkZWYgc3RydWN0IGxpYnhsX19kb21h
aW5fY3JlYXRlX3N0YXRlIGxpYnhsX19kb21haW5fY3JlYXRlX3N0YXRlOwogdHlwZWRlZiB2b2lk
IGxpYnhsX19kb21haW5fY3JlYXRlX2NiKHN0cnVjdCBsaWJ4bF9fZWdjICplZ2MsCkBAIC0zNjMs
NiArMzY0LDIwIEBAIHN0cnVjdCBsaWJ4bF9fZXZfY2hpbGQgewogICAgIExJQlhMX0xJU1RfRU5U
Ulkoc3RydWN0IGxpYnhsX19ldl9jaGlsZCkgZW50cnk7CiB9OwogCisvKiBsaWJ4bF9fZXZfaW1t
ZWRpYXRlCisgKgorICogQWxsb3cgdG8gY2FsbCBhIG5vbi1yZWVudHJhbnQgY2FsbGJhY2suCisg
KgorICogYGNhbGxiYWNrJyB3aWxsIGJlIGNhbGxlZCBpbW1lZGlhdGVseSBhcyBhIG5ldyBldmVu
dC4KKyAqLworc3RydWN0IGxpYnhsX19ldl9pbW1lZGlhdGUgeworICAgIC8qIGZpbGxlZCBieSB1
c2VyICovCisgICAgdm9pZCAoKmNhbGxiYWNrKShsaWJ4bF9fZWdjICosIGxpYnhsX19ldl9pbW1l
ZGlhdGUgKik7CisgICAgLyogcHJpdmF0ZSB0byBsaWJ4bF9fZXZfaW1tZWRpYXRlICovCisgICAg
TElCWExfVEFJTFFfRU5UUlkobGlieGxfX2V2X2ltbWVkaWF0ZSkgZW50cnk7Cit9Owordm9pZCBs
aWJ4bF9fZXZfaW1tZWRpYXRlX3JlZ2lzdGVyKGxpYnhsX19lZ2MgKiwgbGlieGxfX2V2X2ltbWVk
aWF0ZSAqKTsKKwogLyoKICAqIExvY2sgZm9yIGRldmljZSBob3RwbHVnLCBxbXBfbG9jay4KICAq
CkBAIC03MzMsNiArNzQ4LDcgQEAgc3RydWN0IGxpYnhsX19lZ2MgewogICAgIHN0cnVjdCBsaWJ4
bF9fZXZlbnRfbGlzdCBvY2N1cnJlZF9mb3JfY2FsbGJhY2s7CiAgICAgTElCWExfVEFJTFFfSEVB
RCgsIGxpYnhsX19hbykgYW9zX2Zvcl9jYWxsYmFjazsKICAgICBMSUJYTF9UQUlMUV9IRUFEKCwg
bGlieGxfX2FvcF9vY2N1cnJlZCkgYW9wc19mb3JfY2FsbGJhY2s7CisgICAgTElCWExfVEFJTFFf
SEVBRCgsIGxpYnhsX19ldl9pbW1lZGlhdGUpIGV2X2ltbWVkaWF0ZXM7CiB9OwogCiBzdHJ1Y3Qg
bGlieGxfX2FvcF9vY2N1cnJlZCB7CkBAIC0yMzIyLDYgKzIzMzgsNyBAQCBfaGlkZGVuIGxpYnhs
X2RldmljZV9tb2RlbF92ZXJzaW9uIGxpYnhsX19kZWZhdWx0X2RldmljZV9tb2RlbChsaWJ4bF9f
Z2MgKmdjKTsKICAgICAgICAgTElCWExfVEFJTFFfSU5JVCgmKGVnYykub2NjdXJyZWRfZm9yX2Nh
bGxiYWNrKTsgXAogICAgICAgICBMSUJYTF9UQUlMUV9JTklUKCYoZWdjKS5hb3NfZm9yX2NhbGxi
YWNrKTsgICAgICBcCiAgICAgICAgIExJQlhMX1RBSUxRX0lOSVQoJihlZ2MpLmFvcHNfZm9yX2Nh
bGxiYWNrKTsgICAgIFwKKyAgICAgICAgTElCWExfVEFJTFFfSU5JVCgmKGVnYykuZXZfaW1tZWRp
YXRlcyk7ICAgICAgICAgXAogICAgIH0gd2hpbGUoMCkKIAogX2hpZGRlbiB2b2lkIGxpYnhsX19l
Z2NfY2xlYW51cChsaWJ4bF9fZWdjICplZ2MpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
