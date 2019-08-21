Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482E97DFC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:02:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0S5b-0000D0-D4; Wed, 21 Aug 2019 14:59:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZvr=WR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0S5Z-0000BY-Jq
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 14:59:53 +0000
X-Inumbo-ID: 53e413b0-c424-11e9-adc7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53e413b0-c424-11e9-adc7-12813bfff9fa;
 Wed, 21 Aug 2019 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566399593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R2CKAGsb2RND/Knz+9b3zSn3LkXlYB+nbyj3ICh1Xi8=;
 b=FdZGet6UfGrmSXvq5B+o+lWyS0CHoM+pLQ7p93jRcQMRS/zrAVsfR9I3
 ZKspYZvnEC8amvOY6RTcWefCa01wKByKQM6l7R0BnqJ9LBKwFZ0pOLMEB
 iUdWkHUvrLyRF7njbohBEUPd1+UCKSLYcoSKAWrbrSSZiQ1d152WufDP6 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: djF5HpQgTe+j60NbmT3TXg5eBKEoot7a/Xa9zuEgV70tZYWLxhyze5S0MTafDIXitk7E6BNdlc
 DVRFkG8MYZqgsBTn8F6XkyMsmw0i0iZAUxjuw2KlWP0lK7qEBZ3XOzbVB4LLLgDJ6nNPOKQ9Cu
 rvSKbAgzBGJ2E5PkIDv7AmoHM1pDyLiAJe/nz7BBMbZW7l8CWnqRYIJMvtNHJ/q6MV+G5Kuo+7
 3C9/Tr8LjtPskEmko3S+wMdgR19jxdXDE9cpsXHS7Xu1yaCPFwYb++qOpD2KQAqrl2Gp6IT6fS
 v90=
X-SBRS: 2.7
X-MesageID: 4549117
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4549117"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 16:59:03 +0200
Message-ID: <20190821145903.45934-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821145903.45934-1-roger.pau@citrix.com>
References: <20190821145903.45934-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 7/7] ioreq: provide support for long-running
 operations...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uYW5kIHN3aXRjaCB2UENJIHRvIHVzZSB0aGlzIGluZnJhc3RydWN0dXJlIGZvciBsb25nIHJ1
bm5pbmcKcGh5c21hcCBtb2RpZmljYXRpb24gb3BlcmF0aW9ucy4KClRoaXMgYWxsb3dzIHRvIGdl
dCByaWQgb2YgdGhlIHZQQ0kgc3BlY2lmaWMgbW9kaWZpY2F0aW9ucyBkb25lIHRvCmhhbmRsZV9o
dm1faW9fY29tcGxldGlvbiBhbmQgYWxsb3dzIGdlbmVyYWxpemluZyB0aGUgc3VwcG9ydCBmb3IK
bG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMgdG8gb3RoZXIgaW50ZXJuYWwgaW9yZXEgc2VydmVycy4g
U3VjaCBzdXBwb3J0CmlzIGltcGxlbWVudGVkIGFzIGEgc3BlY2lmaWMgaGFuZGxlciB0aGF0IGNh
biBiZSByZWdpc3RlcnMgYnkgaW50ZXJuYWwKaW9yZXEgc2VydmVycyBhbmQgdGhhdCB3aWxsIGJl
IGNhbGxlZCB0byBjaGVjayBmb3IgcGVuZGluZyB3b3JrLgpSZXR1cm5pbmcgdHJ1ZSBmcm9tIHRo
aXMgaGFuZGxlciB3aWxsIHByZXZlbnQgdGhlIHZjcHUgZnJvbSBydW5uaW5nCnVudGlsIHRoZSBo
YW5kbGVyIHJldHVybnMgZmFsc2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgICAgICAg
ICB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiB4ZW4vZHJpdmVycy92cGNp
L3ZwY2kuYyAgICAgICAgICB8ICAzICsrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4u
aCB8ICAxICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvcmVxLmggIHwgIDIgKysKIDQgZmls
ZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKaW5k
ZXggYjI1ODJiZDNhMC4uOGUxNjBhMGExNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9p
b3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtMTg2LDE4ICsxODYsMjkg
QEAgYm9vbCBoYW5kbGVfaHZtX2lvX2NvbXBsZXRpb24oc3RydWN0IHZjcHUgKnYpCiAgICAgZW51
bSBodm1faW9fY29tcGxldGlvbiBpb19jb21wbGV0aW9uOwogICAgIHVuc2lnbmVkIGludCBpZDsK
IAotICAgIGlmICggaGFzX3ZwY2koZCkgJiYgdnBjaV9wcm9jZXNzX3BlbmRpbmcodikgKQotICAg
IHsKLSAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsKLSAgICAgICAgcmV0
dXJuIGZhbHNlOwotICAgIH0KLQogICAgIEZPUl9FQUNIX0lPUkVRX1NFUlZFUihkLCBpZCwgcykK
ICAgICB7CiAgICAgICAgIHN0cnVjdCBodm1faW9yZXFfdmNwdSAqc3Y7CiAKICAgICAgICAgaWYg
KCBzLT5pbnRlcm5hbCApCisgICAgICAgIHsKKyAgICAgICAgICAgIGlmICggcy0+cGVuZGluZyAm
JiBzLT5wZW5kaW5nKHYpICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAvKgorICAg
ICAgICAgICAgICAgICAqIE5lZWQgdG8gcmFpc2UgYSBzY2hlZHVsZXIgaXJxIGluIG9yZGVyIHRv
IHByZXZlbnQgdGhlIGd1ZXN0CisgICAgICAgICAgICAgICAgICogdmNwdSBmcm9tIHJlc3VtaW5n
IGV4ZWN1dGlvbi4KKyAgICAgICAgICAgICAgICAgKgorICAgICAgICAgICAgICAgICAqIE5vdGUg
dGhpcyBpcyBub3QgcmVxdWlyZWQgZm9yIGV4dGVybmFsIGlvcmVxIG9wZXJhdGlvbnMKKyAgICAg
ICAgICAgICAgICAgKiBiZWNhdXNlIGluIHRoYXQgY2FzZSB0aGUgdmNwdSBpcyBtYXJrZWQgYXMg
YmxvY2tlZCwgYnV0IHRoaXMKKyAgICAgICAgICAgICAgICAgKiBjYW5ub3QgYmUgZG9uZSBmb3Ig
bG9uZy1ydW5uaW5nIGludGVybmFsIG9wZXJhdGlvbnMsIHNpbmNlCisgICAgICAgICAgICAgICAg
ICogaXQgd291bGQgcHJldmVudCB0aGUgdmNwdSBmcm9tIGJlaW5nIHNjaGVkdWxlZCBhbmQgdGh1
cyB0aGUKKyAgICAgICAgICAgICAgICAgKiBsb25nIHJ1bm5pbmcgb3BlcmF0aW9uIGZyb20gZmlu
aXNoaW5nLgorICAgICAgICAgICAgICAgICAqLworICAgICAgICAgICAgICAgIHJhaXNlX3NvZnRp
cnEoU0NIRURVTEVfU09GVElSUSk7CisgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOworICAg
ICAgICAgICAgfQogICAgICAgICAgICAgY29udGludWU7CisgICAgICAgIH0KIAogICAgICAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5ICggc3YsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
cy0+aW9yZXFfdmNwdV9saXN0LApAQCAtNTE4LDYgKzUyOSwzOCBAQCBpbnQgaHZtX2FkZF9pb3Jl
cV9oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsCiAgICAgcmV0dXJuIHJj
OwogfQogCitpbnQgaHZtX2FkZF9pb3JlcV9wZW5kaW5nX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAq
ZCwgaW9zZXJ2aWRfdCBpZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29s
ICgqcGVuZGluZykoc3RydWN0IHZjcHUgKnYpKQoreworICAgIHN0cnVjdCBodm1faW9yZXFfc2Vy
dmVyICpzOworICAgIGludCByYyA9IDA7CisKKyAgICBzcGluX2xvY2tfcmVjdXJzaXZlKCZkLT5h
cmNoLmh2bS5pb3JlcV9zZXJ2ZXIubG9jayk7CisgICAgcyA9IGdldF9pb3JlcV9zZXJ2ZXIoZCwg
aWQpOworICAgIGlmICggIXMgKQorICAgIHsKKyAgICAgICAgcmMgPSAtRU5PRU5UOworICAgICAg
ICBnb3RvIG91dDsKKyAgICB9CisgICAgaWYgKCAhcy0+aW50ZXJuYWwgKQorICAgIHsKKyAgICAg
ICAgcmMgPSAtRUlOVkFMOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisgICAgaWYgKCBzLT5w
ZW5kaW5nICE9IE5VTEwgKQorICAgIHsKKyAgICAgICAgcmMgPSAtRUJVU1k7CisgICAgICAgIGdv
dG8gb3V0OworICAgIH0KKworICAgIHMtPnBlbmRpbmcgPSBwZW5kaW5nOworCisgb3V0OgorICAg
IHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgmZC0+YXJjaC5odm0uaW9yZXFfc2VydmVyLmxvY2spOwor
CisgICAgcmV0dXJuIHJjOworfQorCiBzdGF0aWMgdm9pZCBodm1fdXBkYXRlX2lvcmVxX2V2dGNo
bihzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBodm1faW9yZXFfdmNwdSAqc3YpCiB7CmRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCmluZGV4IDUxMGUz
ZWU3NzEuLjU0YjBmMzE2MTIgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCisr
KyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCkBAIC01MDgsNiArNTA4LDkgQEAgaW50IHZwY2lf
cmVnaXN0ZXJfaW9yZXEoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgcmV0dXJuIHJjOwogCiAg
ICAgcmMgPSBodm1fYWRkX2lvcmVxX2hhbmRsZXIoZCwgaWQsIGlvcmVxX2hhbmRsZXIpOworICAg
IGlmICggcmMgKQorICAgICAgICByZXR1cm4gcmM7CisgICAgcmMgPSBodm1fYWRkX2lvcmVxX3Bl
bmRpbmdfaGFuZGxlcihkLCBpZCwgdnBjaV9wcm9jZXNzX3BlbmRpbmcpOwogICAgIGlmICggcmMg
KQogICAgICAgICByZXR1cm4gcmM7CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgKaW5kZXggZjBi
ZTMwMzUxNy4uODBhMzhmZmU0OCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
ZG9tYWluLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgKQEAgLTczLDYg
KzczLDcgQEAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgewogICAgICAgICB9OwogICAgICAgICBz
dHJ1Y3QgewogICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoc3RydWN0IHZjcHUgKnYsIGlvcmVx
X3QgKik7CisgICAgICAgICAgICBib29sICgqcGVuZGluZykoc3RydWN0IHZjcHUgKnYpOwogICAg
ICAgICB9OwogICAgIH07CiB9OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
aW9yZXEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvcmVxLmgKaW5kZXggMTBiOTU4Njg4
NS4uY2MzZTI3ZDA1OSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oCkBAIC01Nyw2ICs1Nyw4IEBA
IHZvaWQgaHZtX2lvcmVxX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7CiAKIGludCBodm1fYWRkX2lv
cmVxX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoc3RydWN0IHZjcHUgKnYsIGlvcmVxX3QgKikp
OworaW50IGh2bV9hZGRfaW9yZXFfcGVuZGluZ19oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsIGlv
c2VydmlkX3QgaWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCAoKnBl
bmRpbmcpKHN0cnVjdCB2Y3B1ICp2KSk7CiAKIGludCBodm1faW9yZXFfcmVnaXN0ZXJfbW1jZmco
c3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBhZGRyLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgc3RhcnRfYnVzLCB1bnNpZ25lZCBpbnQgZW5kX2J1cywKLS0gCjIu
MjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
