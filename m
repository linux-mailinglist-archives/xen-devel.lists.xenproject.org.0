Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E91FB483
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 17:02:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUv3v-0000ns-Vh; Wed, 13 Nov 2019 16:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3XMH=ZF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iUv3u-0000fG-Qv
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:00:06 +0000
X-Inumbo-ID: a89e677c-062e-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a89e677c-062e-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573660806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W1q6MPBTvw8gTbLpGnDdKlKjlT/tkizJehDwxhmmQ7Q=;
 b=ZKaY6peaQmRVE/DHK/GzegBbAOz0j5ePWq95FEZLbhg+vXC3vWhjGXdG
 qgViu8I+Daf/iK/AH6R4DAofPEqlR42JrrtNawAUwCO0OEHftqhEAmXVr
 PKdrnwl/QGP833mN9WuQcurQhu/wir6kt3/EH2WuKWpgXRTfRx3ErrO5/ s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3OjtuRnKjZQ4YN+O0aZjLSoAlcxCE+m8KxZoDXICOFvkoV+3lu+tZVLoUxNgShcEOkd47zHFHz
 89MHJbBT4zVwOFHmhvBI9bpd7JqZyFSzp9cDANwtX0X7QyWxiewhGs24lvs2nRyo9MZIfAjgqc
 YN6tfjf8g/uGZUGfqRIOh/AAkkdAziTNLmSWg9HGBJyW2fEtNxNZNM9njUuyrqMmVS+GpkAb1z
 9kf4MIRfBuN/odwYZf5kLmnaNRBkCG/HO4OuJqpHUH/UaO2ndqRd0SFBEoE2GELNPCArDBrlZz
 sXg=
X-SBRS: 2.7
X-MesageID: 8629980
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8629980"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 16:59:40 +0100
Message-ID: <20191113155940.81837-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113155940.81837-1-roger.pau@citrix.com>
References: <20191113155940.81837-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v4 3/3] x86/vioapic: sync PIR to IRR
 when modifying entries
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgcG9zdGVkIGludGVycnV0cHMgYXJlIGJlaW5nIHVzZWQgc3luYyBQSVIgdG8gSVJSIHdoZW4g
YW4gdW5tYXNrZWQKdklPLUFQSUMgZW50cnkgaXMgbW9kaWZpZWQuIERvIHRoaXMgaW4gb3JkZXIg
dG8gcHJldmVudCB2ZWN0b3JzIGluIHRoZQpJUlIgYmVpbmcgc2V0IGFmdGVyIGEgY2hhbmdlIHRv
IGEgdklPLUFQSUMgZW50cnkgaGFzIGJlZW4gcGVyZm9ybWVkLgoKU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdmlvYXBpYy5jIHwgNDYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
MSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9odm0vdmlvYXBpYy5jIGIveGVuL2FyY2gveDg2L2h2bS92aW9hcGljLmMKaW5kZXggOWFlZWYz
MmExNC4uOTBlNmQxYzRlNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aW9hcGljLmMK
KysrIGIveGVuL2FyY2gveDg2L2h2bS92aW9hcGljLmMKQEAgLTIxMiw2ICsyMTIsNDQgQEAgc3Rh
dGljIGludCB2aW9hcGljX2h3ZG9tX21hcF9nc2kodW5zaWduZWQgaW50IGdzaSwgdW5zaWduZWQg
aW50IHRyaWcsCiAgICAgcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGlubGluZSBpbnQgcGl0X2No
YW5uZWwwX2VuYWJsZWQodm9pZCkKK3sKKyAgICByZXR1cm4gcHRfYWN0aXZlKCZjdXJyZW50LT5k
b21haW4tPmFyY2gudnBpdC5wdDApOworfQorCitzdGF0aWMgdm9pZCBzeW5jX3ZjcHVzX3Bpcihz
dHJ1Y3QgZG9tYWluICpkLCB1bmlvbiB2aW9hcGljX3JlZGlyX2VudHJ5ICplbnQsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaXJxKQoreworICAgIERFQ0xBUkVfQklU
TUFQKHZjcHVzLCBNQVhfVklSVF9DUFVTKSA9IHsgfTsKKworICAgIHN3aXRjaCAoIGVudC0+Zmll
bGRzLmRlbGl2ZXJ5X21vZGUgKQorICAgIHsKKyAgICBjYXNlIGRlc3RfTG93ZXN0UHJpbzoKKyAg
ICBjYXNlIGRlc3RfRml4ZWQ6CisjaWZkZWYgSVJRMF9TUEVDSUFMX1JPVVRJTkcKKyAgICAgICAg
aWYgKCAoaXJxID09IGh2bV9pc2FfaXJxX3RvX2dzaSgwKSkgJiYgcGl0X2NoYW5uZWwwX2VuYWJs
ZWQoKSApCisgICAgICAgIHsKKyAgICAgICAgICAgIF9fc2V0X2JpdCgwLCB2Y3B1cyk7CisgICAg
ICAgICAgICBicmVhazsKKyAgICAgICAgfQorI2VuZGlmCisgICAgICAgIGh2bV9pbnRyX2dldF9k
ZXN0cyhkLCBlbnQtPmZpZWxkcy5kZXN0X2lkLCBlbnQtPmZpZWxkcy5kZXN0X21vZGUsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICBlbnQtPmZpZWxkcy5kZWxpdmVyeV9tb2RlLCB2Y3B1cyk7
CisgICAgICAgIGJyZWFrOworCisgICAgY2FzZSBkZXN0X05NSToKKyAgICAgICAgLyogTm90aGlu
ZyB0byBkbywgTk1JcyBhcmUgbm90IHNpZ25hbGVkIG9uIHRoZSBQSVIuICovCisgICAgICAgIGJy
ZWFrOworCisgICAgZGVmYXVsdDoKKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICJ1
bnN1cHBvcnRlZCBkZWxpdmVyeSBtb2RlICUwMnVcbiIsCisgICAgICAgICAgICAgICAgIGVudC0+
ZmllbGRzLmRlbGl2ZXJ5X21vZGUpOworICAgICAgICBicmVhazsKKyAgICB9CisKKyAgICBkb21h
aW5fc3luY192bGFwaWNfcGlyKGQsIHZjcHVzKTsKK30KKwogc3RhdGljIHZvaWQgdmlvYXBpY193
cml0ZV9yZWRpcmVudCgKICAgICBzdHJ1Y3QgaHZtX3Zpb2FwaWMgKnZpb2FwaWMsIHVuc2lnbmVk
IGludCBpZHgsCiAgICAgaW50IHRvcF93b3JkLCB1aW50MzJfdCB2YWwpCkBAIC0yMzUsNiArMjcz
LDkgQEAgc3RhdGljIHZvaWQgdmlvYXBpY193cml0ZV9yZWRpcmVudCgKICAgICBwZW50ID0gJnZp
b2FwaWMtPnJlZGlydGJsW2lkeF07CiAgICAgZW50ICA9ICpwZW50OwogCisgICAgaWYgKCAhZW50
LmZpZWxkcy5tYXNrICYmIGh2bV9mdW5jcy5kZWxpdmVyX3Bvc3RlZF9pbnRyICkKKyAgICAgICAg
c3luY192Y3B1c19waXIoZCwgcGVudCwgdmlvYXBpYy0+YmFzZV9nc2kgKyBpZHgpOworCiAgICAg
aWYgKCB0b3Bfd29yZCApCiAgICAgewogICAgICAgICAvKiBDb250YWlucyBvbmx5IHRoZSBkZXN0
X2lkLiAqLwpAQCAtMzkxLDExICs0MzIsNiBAQCBzdGF0aWMgdm9pZCBpb2FwaWNfaW5qX2lycSgK
ICAgICB2bGFwaWNfc2V0X2lycSh0YXJnZXQsIHZlY3RvciwgdHJpZ19tb2RlKTsKIH0KIAotc3Rh
dGljIGlubGluZSBpbnQgcGl0X2NoYW5uZWwwX2VuYWJsZWQodm9pZCkKLXsKLSAgICByZXR1cm4g
cHRfYWN0aXZlKCZjdXJyZW50LT5kb21haW4tPmFyY2gudnBpdC5wdDApOwotfQotCiBzdGF0aWMg
dm9pZCB2aW9hcGljX2RlbGl2ZXIoc3RydWN0IGh2bV92aW9hcGljICp2aW9hcGljLCB1bnNpZ25l
ZCBpbnQgcGluKQogewogICAgIHVpbnQxNl90IGRlc3QgPSB2aW9hcGljLT5yZWRpcnRibFtwaW5d
LmZpZWxkcy5kZXN0X2lkOwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
