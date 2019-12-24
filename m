Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9880112A1BE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 14:29:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijkD5-0007cJ-8u; Tue, 24 Dec 2019 13:26:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijkD4-0007c7-2M
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 13:26:50 +0000
X-Inumbo-ID: 09474ce6-2651-11ea-97c0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09474ce6-2651-11ea-97c0-12813bfff9fa;
 Tue, 24 Dec 2019 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577194009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ICSVxRlJuO1oJkbo5+46yIpxwXSyE7neSx5HbBCtE0M=;
 b=HGFqYMRshsa93Pdo+orv7qDw2XjTGxyMtKf8tDD1W+0ODY+0KbhmROra
 V+LH5HamguQihk+A2TL5z9Io1GlXT+TQ6Y+zte6rn608WDaFzM9ABeQvi
 TxYlTqYYnQyViwJ00iYb3uykqAjdo0Ce41OOZZMbSjxu76kqqE7znBdMC U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8IC11BcHavp+duOeqZGHkwrIFkfknOI3tEbPk1D9HN58GdGLqaJ1GsVmTmGmHs05whJ/HyUj2z
 ugoOkCVvwoEmvNj7STisJY/I4TBXSR3H1YBrspL4Gs+aiUgPNat5NEAjNaKrsJJS5YitgFTmbY
 hENcBVOPutrqHoD1b8cm9APGO1+kPJdt5XRnodpGeXQZigIbuomA1EK6RXdtQRiRj8BvHkEUbg
 WWuW9/nkmdPTqMwFqHfYICLeA0hPr868TMkt8b+dSYakGdMkBRRyYG0foBwXQocw4DA1DJhlJZ
 f5Y=
X-SBRS: 2.7
X-MesageID: 10124154
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10124154"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 14:26:16 +0100
Message-ID: <20191224132616.47441-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224132616.47441-1-roger.pau@citrix.com>
References: <20191224132616.47441-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/tlb: use Xen L0 assisted TLB flush when
 available
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIFhlbidzIEwwIEhWTU9QX2ZsdXNoX3RsYnMgaHlwZXJjYWxsIHdoZW4gYXZhaWxhYmxlIGlu
IG9yZGVyIHRvCnBlcmZvcm0gZmx1c2hlcy4gVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVy
Zm9ybWFuY2Ugb2YgdGxiIGZsdXNoZXMKd2hlbiBydW5uaW5nIHdpdGggYSBoaWdoIGFtb3VudCBv
ZiB2Q1BVcyBhcyBhIFhlbiBndWVzdCwgYW5kIGlzCnNwZWNpYWxseSBpbXBvcnRhbnQgd2hlbiBy
dW5uaW5nIGluIHNoaW0gbW9kZS4KClRoZSBmb2xsb3dpbmcgZmlndXJlcyBhcmUgZnJvbSBhIFBW
IGd1ZXN0IHJ1bm5pbmcgYG1ha2UgLWozNDIgeGVuYCBpbgpzaGltIG1vZGUgd2l0aCAzMiB2Q1BV
cy4KClVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNob3J0aGFuZDoKcmVhbAk0bTM1Ljk3M3MKdXNl
cgk0bTM1LjExMHMKc3lzCTM2bTI0LjExN3MKClVzaW5nIEwwIGFzc2lzdGVkIGZsdXNoOgpyZWFs
CTFtMTcuMzkxcwp1c2VyCTRtNDIuNDEzcwpzeXMJNm0yMC43NzNzCgpTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYv
Z3Vlc3QveGVuL3hlbi5jICAgIHwgMTEgKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9zbXAuYyAg
ICAgICAgICAgICAgfCAgNiArKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgg
fCAgNyArKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hl
bi94ZW4uYwppbmRleCA2ZGJjNWY5NTNmLi5lNjQ5M2NhZWNmIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvZ3Vlc3QveGVuL3hlbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMK
QEAgLTI4MSw2ICsyODEsMTcgQEAgaW50IHhnX2ZyZWVfdW51c2VkX3BhZ2UobWZuX3QgbWZuKQog
ICAgIHJldHVybiByYW5nZXNldF9yZW1vdmVfcmFuZ2UobWVtLCBtZm5feChtZm4pLCBtZm5feCht
Zm4pKTsKIH0KIAoraW50IHhnX2ZsdXNoX3RsYnModm9pZCkKK3sKKyAgICBpbnQgcmM7CisKKyAg
ICBkbyB7CisgICAgICAgIHJjID0geGVuX2h5cGVyY2FsbF9odm1fb3AoSFZNT1BfZmx1c2hfdGxi
cywgTlVMTCk7CisgICAgfSB3aGlsZSAoIHJjID09IC1FUkVTVEFSVCApOworCisgICAgcmV0dXJu
IHJjOworfQorCiBzdGF0aWMgdm9pZCBhcF9yZXN1bWUodm9pZCAqdW51c2VkKQogewogICAgIG1h
cF92Y3B1aW5mbygpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2FyY2gv
eDg2L3NtcC5jCmluZGV4IDQyN2MzM2RiOWQuLmE4OTJkYjI4YzEgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9zbXAuYworKysgYi94ZW4vYXJjaC94ODYvc21wLmMKQEAgLTE1LDYgKzE1LDcgQEAK
ICNpbmNsdWRlIDx4ZW4vcGVyZmMuaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KICNpbmNs
dWRlIDxhc20vY3VycmVudC5oPgorI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgogI2luY2x1ZGUgPGFz
bS9zbXAuaD4KICNpbmNsdWRlIDxhc20vbWMxNDY4MThydGMuaD4KICNpbmNsdWRlIDxhc20vZmx1
c2h0bGIuaD4KQEAgLTIzNSw2ICsyMzYsMTEgQEAgdm9pZCBmbHVzaF9hcmVhX21hc2soY29uc3Qg
Y3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSwgdW5zaWduZWQgaW50IGZsYWdzKQogICAg
IHsKICAgICAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwogCisgICAgICAgIGlmICggeGVu
X2d1ZXN0ICYmCisgICAgICAgICAgICAgIShmbGFncyAmIH4oRkxVU0hfVExCIHwgRkxVU0hfVExC
X0dMT0JBTCB8IEZMVVNIX1ZBX1ZBTElEKSkgJiYKKyAgICAgICAgICAgICAheGdfZmx1c2hfdGxi
cygpICkKKyAgICAgICAgICAgIHJldHVybjsKKwogICAgICAgICBzcGluX2xvY2soJmZsdXNoX2xv
Y2spOwogICAgICAgICBjcHVtYXNrX2FuZCgmZmx1c2hfY3B1bWFzaywgbWFzaywgJmNwdV9vbmxp
bmVfbWFwKTsKICAgICAgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmZmx1c2hfY3B1bWFzayk7
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAppbmRleCAyMDQyYTlhMGMyLi5mMGRlOWU0ZDcxIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QveGVuLmgKQEAgLTM2LDYgKzM2LDcgQEAgZXh0ZXJuIHVpbnQzMl90IHhl
bl9jcHVpZF9iYXNlOwogY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICp4Z19wcm9iZSh2b2lk
KTsKIGludCB4Z19hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKTsKIGludCB4Z19mcmVlX3Vu
dXNlZF9wYWdlKG1mbl90IG1mbik7CitpbnQgeGdfZmx1c2hfdGxicyh2b2lkKTsKIAogREVDTEFS
RV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgdmNwdV9pZCk7CiBERUNMQVJFX1BFUl9DUFUoc3RydWN0
IHZjcHVfaW5mbyAqLCB2Y3B1X2luZm8pOwpAQCAtNDcsNiArNDgsMTIgQEAgREVDTEFSRV9QRVJf
Q1BVKHN0cnVjdCB2Y3B1X2luZm8gKiwgdmNwdV9pbmZvKTsKIAogc3RhdGljIGlubGluZSBjb25z
dCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKnhnX3Byb2JlKHZvaWQpIHsgcmV0dXJuIE5VTEw7IH0K
IAorc3RhdGljIGlubGluZSBpbnQgeGdfZmx1c2hfdGxicyh2b2lkKQoreworICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOworICAgIHJldHVybiAtRU5PU1lTOworfQorCiAjZW5kaWYgLyogQ09ORklH
X1hFTl9HVUVTVCAqLwogI2VuZGlmIC8qIF9fWDg2X0dVRVNUX1hFTl9IX18gKi8KIAotLSAKMi4y
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
