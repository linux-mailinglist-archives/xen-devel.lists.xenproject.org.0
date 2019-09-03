Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451CA6DD3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 18:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5BSL-0001v1-3H; Tue, 03 Sep 2019 16:14:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5BSJ-0001uZ-Hj
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 16:14:55 +0000
X-Inumbo-ID: f6fca06a-ce65-11e9-a337-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6fca06a-ce65-11e9-a337-bc764e2007e4;
 Tue, 03 Sep 2019 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567527294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sGWHsODmz5HRsaIZLq0yTlfIFnFXOWqxIMS0UCDdFG4=;
 b=ahs4IS+3cXNl/Q4ZhQghXznhZGbOQF34hikLbJqFnZD79VTuLsuTIUMf
 quCXLT2RlbOZm65x/NOYD5IrDe6NaylE4pfWLij+J1wsVzU+lNlWePIcG
 nxo/OM22Dcw1GtFOf7lVMyYbOzIxO7WH04lXzwXRVVbjDn/E69r/lhB5m Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pDra+XwseDlbWTYUU93mGwurT9APyJ1zkAriSYyDJlCzhg2R2A7TMW8oELpd6ptpH17OyWUoM9
 C2Z5BAeUL2Do+7V4qoEo4YUDBWEA4wy8j+fHMXrdFaiKKT5UUD+Gla6m2TqNvDKSO2wjxqSJH+
 gk6wml/ycczZrl8IBLo+GdZNjRW0EOJffXoeAyLciA42Iv4+jvnfCsLRB0wlg+YlDXe1HMz3mm
 jFvT+Nnnt+i7f13jb/uwqJ5uySFdKtIrfwjqU5HSWg4Nsrm7YqzlXZvIZvNAnPnbWt7b+aWU0k
 WtQ=
X-SBRS: 2.7
X-MesageID: 5292987
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5292987"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Sep 2019 18:14:24 +0200
Message-ID: <20190903161428.7159-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190903161428.7159-1-roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 07/11] ioreq: allow registering internal
 ioreq server handler
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvdmlkZSBhIHJvdXRpbmUgdG8gcmVnaXN0ZXIgdGhlIGhhbmRsZXIgZm9yIGFuIGludGVybmFs
IGlvcmVxCnNlcnZlci4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gQWxsb3cgdG8gcHJvdmlkZSBh
biBvcGFxdWUgZGF0YSBwYXJhbWV0ZXIgdG8gcGFzcyB0byB0aGUgaGFuZGxlci4KIC0gQWxsb3cg
Y2hhbmdpbmcgdGhlIGhhbmRsZXIgYXMgbG9uZyBhcyB0aGUgc2VydmVyIGlzIG5vdCBlbmFibGVk
LgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAgICAgICAgfCAzNSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvcmVxLmggfCAg
NCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKaW5kZXgg
ODMzMWE4OWVhZS4uNjMzOWU1Zjg4NCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3Jl
cS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtNDg1LDYgKzQ4NSw0MSBAQCBz
dGF0aWMgaW50IGh2bV9hZGRfaW9yZXFfZ2ZuKHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzLCBi
b29sIGJ1ZikKICAgICByZXR1cm4gcmM7CiB9CiAKK2ludCBodm1fYWRkX2lvcmVxX2hhbmRsZXIo
c3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ICgqaGFuZGxlcikoc3RydWN0IHZjcHUgKnYsIGlvcmVxX3QgKiwgdm9pZCAqKSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkKK3sKKyAgICBzdHJ1Y3QgaHZtX2lv
cmVxX3NlcnZlciAqczsKKyAgICBpbnQgcmMgPSAwOworCisgICAgaWYgKCAhaHZtX2lvcmVxX2lz
X2ludGVybmFsKGlkKSApCisgICAgeworICAgICAgICByYyA9IC1FSU5WQUw7CisgICAgICAgIGdv
dG8gb3V0OworICAgIH0KKworICAgIHNwaW5fbG9ja19yZWN1cnNpdmUoJmQtPmFyY2guaHZtLmlv
cmVxX3NlcnZlci5sb2NrKTsKKyAgICBzID0gZ2V0X2lvcmVxX3NlcnZlcihkLCBpZCk7CisgICAg
aWYgKCAhcyApCisgICAgeworICAgICAgICByYyA9IC1FTk9FTlQ7CisgICAgICAgIGdvdG8gb3V0
OworICAgIH0KKyAgICBpZiAoIHMtPmVuYWJsZWQgKQorICAgIHsKKyAgICAgICAgcmMgPSAtRUJV
U1k7CisgICAgICAgIGdvdG8gb3V0OworICAgIH0KKworICAgIHMtPmhhbmRsZXIgPSBoYW5kbGVy
OworICAgIHMtPmRhdGEgPSBkYXRhOworCisgb3V0OgorICAgIHNwaW5fdW5sb2NrX3JlY3Vyc2l2
ZSgmZC0+YXJjaC5odm0uaW9yZXFfc2VydmVyLmxvY2spOworCisgICAgcmV0dXJuIHJjOworfQor
CiBzdGF0aWMgdm9pZCBodm1fdXBkYXRlX2lvcmVxX2V2dGNobihzdHJ1Y3QgaHZtX2lvcmVxX3Nl
cnZlciAqcywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBodm1f
aW9yZXFfdmNwdSAqc3YpCiB7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9p
b3JlcS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaAppbmRleCBjMzkxN2FhNzRk
Li45MGNjMmFhOTM4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvcmVxLmgKQEAgLTU0LDYgKzU0LDEwIEBA
IHVuc2lnbmVkIGludCBodm1fYnJvYWRjYXN0X2lvcmVxKGlvcmVxX3QgKnAsIGJvb2wgYnVmZmVy
ZWQpOwogCiB2b2lkIGh2bV9pb3JlcV9pbml0KHN0cnVjdCBkb21haW4gKmQpOwogCitpbnQgaHZt
X2FkZF9pb3JlcV9oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCAoKmhhbmRsZXIpKHN0cnVjdCB2Y3B1ICp2LCBpb3Jl
cV90ICosIHZvaWQgKiksCisgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpOwor
CiBzdGF0aWMgaW5saW5lIGJvb2wgaHZtX2lvcmVxX2lzX2ludGVybmFsKHVuc2lnbmVkIGludCBp
ZCkKIHsKICAgICBBU1NFUlQoaWQgPCBNQVhfTlJfSU9SRVFfU0VSVkVSUyk7Ci0tIAoyLjIyLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
