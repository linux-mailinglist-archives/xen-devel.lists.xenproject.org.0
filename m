Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F20E1BAD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGFf-0005we-Bn; Wed, 23 Oct 2019 13:00:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGFd-0005vs-UO
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:33 +0000
X-Inumbo-ID: 13a61241-f595-11e9-947c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13a61241-f595-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=1jKUJSikxB9yiqNmqcnpVueJx6HmmRvphhPyUj0dFVU=;
 b=UMCGP2bhC1hOhsYVoelxkB0JKBvtA4WAvAeabqV7auq2D1xC6WcFEYr1
 sdV6+L0yG0eqhc2b1TqlzfTxb1go7gwI+RjfCWu5T5ZutzjT9r91xjxkr
 SAFPr4XMA7G51Bhb6KTBDjVRZ/IM7Ieh3NgNiZQqAe1V7iZHmVwptSS6a I=;
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
IronPort-SDR: 5CyYoNtYd9dv4MmUqEK+/vD1N3/fA/PENCNlby8YJnbw0vK97hL3WkRxo+utWdJWsjD5wSL/yu
 PmqxuvCwXR5hFX9xxt3mDUVSKoewztwskzzBlVK0cOAasdU0RMj9tX8zAosg2wwRneM3YxT+uS
 N6yLM+4f9nb9YV+ICCSjFh+3NNEjkan7VpwewL7EuK9sv59ARhNOoTUpEpRfiegFbAslugZrcl
 6IIgjfvXXQ2nQoMUdT/TSw9Y41+Jx10/dW4pX65JkRlFfQd/f2GEYQ8qVabc5MVYdf/kyhQ6E0
 Fzg=
X-SBRS: 2.7
X-MesageID: 7754872
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7754872"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:05 +0100
Message-ID: <20191023130013.32382-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 03/11] libxl:
 libxl__domain_config_setdefault: New function
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QnJlYWsgb3V0IHRoaXMgaW50byBhIG5ldyBmdW5jdGlvbi4gIFdlIGFyZSBnb2luZyB0byB3YW50
IHRvIGNhbGwgaXQKZnJvbSBhIG5ldyBjYWxsIHNpdGUuCgpVbmZvcnR1bmF0ZWx5IG5vdCBhbGwg
b2YgdGhlIGRlZmF1bHRzIGNhbiBiZSBtb3ZlZCBpbnRvIHRoZSBuZXcKZnVuY3Rpb24gd2l0aG91
dCBjaGFuZ2luZyB0aGUgb3JkZXIgaW4gd2hpY2ggdGhpbmdzIGFyZSBkb25lLiAgVGhhdApkb2Vz
IG5vdCBzZWVtIHdpc2UgYXQgdGhpcyBzdGFnZSBvZiB0aGUgcmVsZWFzZS4gIFRoZSBlZmZlY3Qg
aXMgdGhhdAphZGRpdGlvbmFsIGNhbGxzIHRvIGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1
bHQgKHdoaWNoIGFyZSBnb2luZwp0byBiZSBpbnRyb2R1Y2VkKSBkbyBub3QgcXVpdGUgc2V0IGV2
ZXJ5dGhpbmcuICBCdXQgdGhleSB3aWxsIGRvIHdoYXQKaXMgbmVlZGVkLiAgQWZ0ZXIgWGVuIDQu
MTMgaXMgZG9uZSwgd2Ugc2hvdWxkIG1vdmUgdGhvc2Ugc2V0dGluZ3MgaW50bwp0aGUgcmlnaHQg
b3JkZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQp2MjogQWRkIG1pc3NpbmcgZXJyb3IgY2hl
Y2sKLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgIHwgNDEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgg
fCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4
bC9saWJ4bF9jcmVhdGUuYwppbmRleCAwOTk3NjFhMmQ3Li5mZDhiYjIyYmU5IDEwMDY0NAotLS0g
YS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVh
dGUuYwpAQCAtODYyLDIyICs4NjIsMTQgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2Rlc3RydWN0
aW9uX2NiKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsaWJ4bF9fZG9tYWluX2Rlc3Ryb3lfc3RhdGUgKmRkcywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnQgcmMpOwogCi1zdGF0aWMgdm9pZCBpbml0aWF0ZV9kb21h
aW5fY3JlYXRlKGxpYnhsX19lZ2MgKmVnYywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbGlieGxfX2RvbWFpbl9jcmVhdGVfc3RhdGUgKmRjcykKK2ludCBsaWJ4bF9fZG9tYWlu
X2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkKQogewotICAgIFNUQVRFX0FP
X0dDKGRjcy0+YW8pOwogICAgIGxpYnhsX2N0eCAqY3R4ID0gbGlieGxfX2djX293bmVyKGdjKTsK
LSAgICB1aW50MzJfdCBkb21pZDsKLSAgICBpbnQgaSwgcmV0OworICAgIGludCByZXQ7CiAgICAg
Ym9vbCBwb2RfZW5hYmxlZCA9IGZhbHNlOwogCi0gICAgLyogY29udmVuaWVuY2UgYWxpYXNlcyAq
LwotICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmNvbnN0IGRfY29uZmlnID0gZGNzLT5ndWVzdF9j
b25maWc7Ci0gICAgY29uc3QgaW50IHJlc3RvcmVfZmQgPSBkY3MtPnJlc3RvcmVfZmQ7Ci0KLSAg
ICBkb21pZCA9IGRjcy0+ZG9taWRfc29mdF9yZXNldDsKLSAgICBsaWJ4bF9fZG9tYWluX2J1aWxk
X3N0YXRlX2luaXQoJmRjcy0+YnVpbGRfc3RhdGUpOwotCiAgICAgaWYgKGRfY29uZmlnLT5jX2lu
Zm8uc3NpZF9sYWJlbCkgewogICAgICAgICBjaGFyICpzID0gZF9jb25maWctPmNfaW5mby5zc2lk
X2xhYmVsOwogICAgICAgICByZXQgPSBsaWJ4bF9mbGFza19jb250ZXh0X3RvX3NpZChjdHgsIHMs
IHN0cmxlbihzKSwKQEAgLTEwMDgsNiArMTAwMCwyOCBAQCBzdGF0aWMgdm9pZCBpbml0aWF0ZV9k
b21haW5fY3JlYXRlKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAg
ICAgfQogCisgICAgcmV0ID0gMDsKKyBlcnJvcl9vdXQ6CisgICAgcmV0dXJuIHJldDsKK30KKwor
c3RhdGljIHZvaWQgaW5pdGlhdGVfZG9tYWluX2NyZWF0ZShsaWJ4bF9fZWdjICplZ2MsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kb21haW5fY3JlYXRlX3N0YXRl
ICpkY3MpCit7CisgICAgU1RBVEVfQU9fR0MoZGNzLT5hbyk7CisgICAgdWludDMyX3QgZG9taWQ7
CisgICAgaW50IGksIHJldDsKKworICAgIC8qIGNvbnZlbmllbmNlIGFsaWFzZXMgKi8KKyAgICBs
aWJ4bF9kb21haW5fY29uZmlnICpjb25zdCBkX2NvbmZpZyA9IGRjcy0+Z3Vlc3RfY29uZmlnOwor
ICAgIGNvbnN0IGludCByZXN0b3JlX2ZkID0gZGNzLT5yZXN0b3JlX2ZkOworCisgICAgZG9taWQg
PSBkY3MtPmRvbWlkX3NvZnRfcmVzZXQ7CisgICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZV9p
bml0KCZkY3MtPmJ1aWxkX3N0YXRlKTsKKworICAgIHJldCA9IGxpYnhsX19kb21haW5fY29uZmln
X3NldGRlZmF1bHQoZ2MsZF9jb25maWcsZG9taWQpOworICAgIGlmIChyZXQpIGdvdG8gZXJyb3Jf
b3V0OworCiAgICAgcmV0ID0gbGlieGxfX2RvbWFpbl9tYWtlKGdjLCBkX2NvbmZpZywgJmRjcy0+
YnVpbGRfc3RhdGUsICZkb21pZCk7CiAgICAgaWYgKHJldCkgewogICAgICAgICBMT0dEKEVSUk9S
LCBkb21pZCwgImNhbm5vdCBtYWtlIGRvbWFpbjogJWQiLCByZXQpOwpAQCAtMTAxOSw2ICsxMDMz
LDkgQEAgc3RhdGljIHZvaWQgaW5pdGlhdGVfZG9tYWluX2NyZWF0ZShsaWJ4bF9fZWdjICplZ2Ms
CiAgICAgZGNzLT5ndWVzdF9kb21pZCA9IGRvbWlkOwogICAgIGRjcy0+c2Rzcy5kbS5ndWVzdF9k
b21pZCA9IDA7IC8qIG1lYW5zIHdlIGhhdmVuJ3Qgc3Bhd25lZCAqLwogCisgICAgLyogcG9zdC00
LjEzIHRvZG86IG1vdmUgdGhlc2UgbmV4dCBiaXRzIG9mIGRlZmF1bHRpbmcgdG8KKyAgICAgKiBs
aWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0ICovCisKICAgICAvKgogICAgICAqIFNldCB0
aGUgZG0gdmVyc2lvbiBxdWl0ZSBlYXJseSBzbyB0aGF0IGxpYnhsIGRvZXNuJ3QgaGF2ZSB0byBw
YXNzIHRoZQogICAgICAqIGJ1aWxkIGluZm8gYXJvdW5kIGp1c3QgdG8ga25vdyBpZiB0aGUgZG9t
YWluIGhhcyBhIGRldmljZSBtb2RlbCBvciBub3QuCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBkMmQ1
YWY3NDZiLi41MGFjN2I2NGVkIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTE0NDAsNiArMTQ0MCw5
IEBAIF9oaWRkZW4gaW50IGxpYnhsX19yZXNvbHZlX2RvbWlkKGxpYnhsX19nYyAqZ2MsIGNvbnN0
IGNoYXIgKm5hbWUsCiAgKiAgICAgQWxsIGxpYnhsIEFQSSBmdW5jdGlvbnMgYXJlIGV4cGVjdGVk
IHRvIGhhdmUgYXJyYW5nZWQgZm9yIHRoaXMKICAqICAgICB0byBiZSBjYWxsZWQgYmVmb3JlIHVz
aW5nIGFueSB2YWx1ZXMgd2l0aGluIHRoZXNlIHN0cnVjdHVyZXMuCiAgKi8KK19oaWRkZW4gaW50
IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAq
ZF9jb25maWcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IGRvbWlkIC8qIGxvZ2dpbmcgb25seSAqLyk7CiBfaGlkZGVuIGludCBsaWJ4bF9fZG9t
YWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gKmNfaW5m
byk7CiBfaGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChsaWJ4
bF9fZ2MgKmdjLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
