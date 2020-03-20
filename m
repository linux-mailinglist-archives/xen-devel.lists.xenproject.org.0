Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C254F18D823
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 20:11:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFN0H-0000Ua-PL; Fri, 20 Mar 2020 19:08:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFN0G-0000UH-CW
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 19:08:20 +0000
X-Inumbo-ID: 24fc0be4-6ade-11ea-b34e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24fc0be4-6ade-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 19:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584731292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8QDjjrWEgy9SU03s7eC+s3JX/ZzOX/m1h5qAZAUqK44=;
 b=Qegri3+J+dacIgM/w4Qcmt0IB2Vehi5VykyaPAqWVEbQYD1LFa79vE78
 dp6yapph73LmFrw2fPFXe5gd/EGeQfzPy1n+7SOVLYbnMXno2Apdp6115
 EqvYiWSd4YQdJFVyTUzJpyzvRuS4G5b7Sas3exwLf+U/XxUQ4RUC/zoCO U=;
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
IronPort-SDR: pzf3WItOrVYWiQT41cnOg2kLdT9S61GmKbgIs2KSP0CPNmXKMu07kXJaa/DhDs4JVba4U97bsG
 sPZAt8hWJsKHeOlK7/ZicAJKQExIWZjaAxNfZ0jY5fZJq1kH9sVcij64OpwkftUq/xgNzZX55o
 u4g0eAtRp7FWCID197c7pY+I1Hkf7EFhQW8dM0LBaJSYD781Px+duizO2eg75M0xoNuPyUWquM
 M/ZKhioORz5jcz3o+oncoiDqnYTLNvsfsQIU6W6hlm7bJb8EJlaVyshwDoK47d6Ea6zzDDvmE3
 zxE=
X-SBRS: 2.7
X-MesageID: 14374458
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,285,1580792400"; d="scan'208";a="14374458"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 20:07:37 +0100
Message-ID: <20200320190737.42110-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200320190737.42110-1-roger.pau@citrix.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] x86/nvmx: update exit bitmap on vmexit
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBjb2RlIGluIG52bXhfdXBkYXRlX2FwaWN2IHNldCB0aGUgZ3Vlc3QgaW50ZXJydXB0
IHN0YXR1cyBmaWVsZApidXQgZG9lc24ndCB1cGRhdGUgdGhlIGV4aXQgYml0bWFwLCB3aGljaCBj
YW4gY2F1c2UgaXNzdWVzIG9mIGxvc3QKaW50ZXJydXB0cyBvbiB0aGUgTDEgaHlwZXJ2aXNvciBp
ZiB2bXhfaW50cl9hc3Npc3QgZ2V0cwpzaG9ydC1jaXJjdWl0ZWQgYnkgbnZteF9pbnRyX2ludGVy
Y2VwdCByZXR1cm5pbmcgdHJ1ZS4KCkV4dHJhY3QgdGhlIGNvZGUgdG8gdXBkYXRlIHRoZSBleGl0
IGJpdG1hcCBmcm9tIHZteF9pbnRyX2Fzc2lzdCBpbnRvIGEKaGVscGVyIGFuZCB1c2UgaXQgaW4g
bnZteF91cGRhdGVfYXBpY3Ygd2hlbiB1cGRhdGluZyB0aGUgZ3Vlc3QKaW50ZXJydXB0IHN0YXR1
cyBmaWVsZC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYyAgICAgICB8IDIxICsrKysr
KysrKysrKystLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jICAgICAgIHwgIDEg
KwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZteC5oIHwgIDIgKysKIDMgZmlsZXMgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvaHZtL3ZteC9pbnRyLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMKaW5k
ZXggNDlhMTI5NWYwOS4uMDAwZTE0YWY0OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92
bXgvaW50ci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYwpAQCAtMjI0LDYgKzIy
NCwxOCBAQCBzdGF0aWMgaW50IG52bXhfaW50cl9pbnRlcmNlcHQoc3RydWN0IHZjcHUgKnYsIHN0
cnVjdCBodm1faW50YWNrIGludGFjaykKICAgICByZXR1cm4gMDsKIH0KIAordm9pZCB2bXhfc3lu
Y19leGl0X2JpdG1hcChzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICBjb25zdCB1bnNpZ25lZCBpbnQg
biA9IEFSUkFZX1NJWkUodi0+YXJjaC5odm0udm14LmVvaV9leGl0X2JpdG1hcCk7CisgICAgdW5z
aWduZWQgaW50IGk7CisKKyAgICB3aGlsZSAoIChpID0gZmluZF9maXJzdF9iaXQoJnYtPmFyY2gu
aHZtLnZteC5lb2lfZXhpdG1hcF9jaGFuZ2VkLCBuKSkgPCBuICkKKyAgICB7CisgICAgICAgIGNs
ZWFyX2JpdChpLCAmdi0+YXJjaC5odm0udm14LmVvaV9leGl0bWFwX2NoYW5nZWQpOworICAgICAg
ICBfX3Ztd3JpdGUoRU9JX0VYSVRfQklUTUFQKGkpLCB2LT5hcmNoLmh2bS52bXguZW9pX2V4aXRf
Yml0bWFwW2ldKTsKKyAgICB9Cit9CisKIHZvaWQgdm14X2ludHJfYXNzaXN0KHZvaWQpCiB7CiAg
ICAgc3RydWN0IGh2bV9pbnRhY2sgaW50YWNrOwpAQCAtMzE4LDcgKzMzMCw2IEBAIHZvaWQgdm14
X2ludHJfYXNzaXN0KHZvaWQpCiAgICAgICAgICAgICAgIGludGFjay5zb3VyY2UgIT0gaHZtX2lu
dHNyY192ZWN0b3IgKQogICAgIHsKICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7Ci0gICAg
ICAgIHVuc2lnbmVkIGludCBpLCBuOwogCiAgICAgICAgLyoKICAgICAgICAgKiBpbnRhY2sudmVj
dG9yIGlzIHRoZSBoaWdoZXN0IHByaW9yaXR5IHZlY3Rvci4gU28gd2Ugc2V0IGVvaV9leGl0X2Jp
dG1hcApAQCAtMzc5LDEzICszOTAsNyBAQCB2b2lkIHZteF9pbnRyX2Fzc2lzdCh2b2lkKQogICAg
ICAgICAgICAgICAgICAgICBpbnRhY2sudmVjdG9yOwogICAgICAgICBfX3Ztd3JpdGUoR1VFU1Rf
SU5UUl9TVEFUVVMsIHN0YXR1cyk7CiAKLSAgICAgICAgbiA9IEFSUkFZX1NJWkUodi0+YXJjaC5o
dm0udm14LmVvaV9leGl0X2JpdG1hcCk7Ci0gICAgICAgIHdoaWxlICggKGkgPSBmaW5kX2ZpcnN0
X2JpdCgmdi0+YXJjaC5odm0udm14LmVvaV9leGl0bWFwX2NoYW5nZWQsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBuKSkgPCBuICkKLSAgICAgICAgewotICAgICAgICAgICAg
Y2xlYXJfYml0KGksICZ2LT5hcmNoLmh2bS52bXguZW9pX2V4aXRtYXBfY2hhbmdlZCk7Ci0gICAg
ICAgICAgICBfX3Ztd3JpdGUoRU9JX0VYSVRfQklUTUFQKGkpLCB2LT5hcmNoLmh2bS52bXguZW9p
X2V4aXRfYml0bWFwW2ldKTsKLSAgICAgICAgfQorICAgICAgICB2bXhfc3luY19leGl0X2JpdG1h
cCh2KTsKIAogICAgICAgICBwdF9pbnRyX3Bvc3QodiwgaW50YWNrKTsKICAgICB9CmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
dm14LmMKaW5kZXggMTgwZDAxZTM4NS4uZTA0MWVjYzExNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdnZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwpAQCAt
MTQxNCw2ICsxNDE0LDcgQEAgc3RhdGljIHZvaWQgbnZteF91cGRhdGVfYXBpY3Yoc3RydWN0IHZj
cHUgKnYpCiAgICAgICAgICAgICBzdGF0dXMgfD0gcnZpICYgVk1YX0dVRVNUX0lOVFJfU1RBVFVT
X1NVQkZJRUxEX0JJVE1BU0s7CiAKICAgICAgICAgX192bXdyaXRlKEdVRVNUX0lOVFJfU1RBVFVT
LCBzdGF0dXMpOworICAgICAgICB2bXhfc3luY19leGl0X2JpdG1hcCh2KTsKICAgICB9CiB9CiAK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bXguaCBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3ZteC92bXguaAppbmRleCBiMzM0ZTFlYzk0Li4xMTFjY2Q3ZTYxIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm14LmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZteC5oCkBAIC02MTAsNiArNjEwLDggQEAgdm9pZCB1cGRh
dGVfZ3Vlc3RfZWlwKHZvaWQpOwogdm9pZCB2bXhfcGlfcGVyX2NwdV9pbml0KHVuc2lnbmVkIGlu
dCBjcHUpOwogdm9pZCB2bXhfcGlfZGVzY19maXh1cCh1bnNpZ25lZCBpbnQgY3B1KTsKIAordm9p
ZCB2bXhfc3luY19leGl0X2JpdG1hcChzdHJ1Y3QgdmNwdSAqdik7CisKICNpZmRlZiBDT05GSUdf
SFZNCiB2b2lkIHZteF9waV9ob29rc19hc3NpZ24oc3RydWN0IGRvbWFpbiAqZCk7CiB2b2lkIHZt
eF9waV9ob29rc19kZWFzc2lnbihzdHJ1Y3QgZG9tYWluICpkKTsKLS0gCjIuMjUuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
