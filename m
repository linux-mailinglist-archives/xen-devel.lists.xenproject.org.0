Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46EEA6DE1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 18:18:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5BS7-0001rB-JT; Tue, 03 Sep 2019 16:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5BS5-0001qu-4b
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 16:14:41 +0000
X-Inumbo-ID: ee18a6c4-ce65-11e9-ab97-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee18a6c4-ce65-11e9-ab97-12813bfff9fa;
 Tue, 03 Sep 2019 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567527280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0eni99MPQmJJMYfH5QGPQyVoCanHcUMXSTNEATGMuqU=;
 b=PQj+MkQ0eOSgmaBzdo6nik/ohRV1UbUtfao1f1LTBRpM+YCcYuqegcLC
 EMygTsOpzTEFgGyCe0rKKXYgjuOwgDNvcEPSTVClgiKADfvncBj8EKGQO
 R0sMEWi78OP25CHKSg6AFkPqq5Ynvoxnv14y+7PMX9LAeEHNnQPfw/NwW g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NrsleqQ6yeIswxATxZooaXrzMu20v3NFsydr3s6xhvD5aeiWdYKeX+MT3nAVFPEWAx6oeLPoaF
 3UYSZSfYcq+MM9aSMqaD2wNNsOkJS9FE141qN7mf40rUdBiaY9yvXfuguKCBVuoGjlMFVpt3Jt
 YKvdAt4Iyw2z2Ih9Mkny7epf4H4buCp3WuoYGkG0MKKAknmIFbH0+jcM5q65ixVi4U4rNwLpHY
 MUKL4WD3mwUIR0XyXavx7wHkFzvfMDhnUlqYzQpimTgbos+PZUVYWVWzc+nY31OQntJ9qm4RYQ
 cvI=
X-SBRS: 2.7
X-MesageID: 5068879
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5068879"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Sep 2019 18:14:17 +0200
Message-ID: <20190903161428.7159-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 00/11] ioreq: add support for internal servers
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

U3VjaCBpbnRlcm5hbCBzZXJ2ZXJzIGFyZSBpbXBsZW1lbnRlZCBieSBhIHNpbmdsZSBmdW5jdGlv
biB0aGF0IGhhbmRsZXMKaW9yZXFzIGluc2lkZSB0aGUgaHlwZXJ2aXNvci4KClRoZSBtb3RpdmF0
aW9uIGJlaGluZCB0aGlzIGNoYW5nZSBpcyB0byBzd2l0Y2ggdlBDSSB0byBiZWNvbWUgYW4KaW50
ZXJuYWwgaW9yZXEgc2VydmVyLCBzbyB0aGF0IGFjY2Vzc2VzIHRvIHRoZSBQQ0kgY29uZmlnIHNw
YWNlIGNhbiBiZQptdWx0aXBsZXhlZCBiZXR3ZWVuIGRldmljZXMgaGFuZGxlZCBieSB2UENJIGFu
ZCBkZXZpY2VzIGhhbmRsZWQgYnkgb3RoZXIKaW9yZXEgc2VydmVycy4KClRoZSBpbXBsZW1lbnRh
dGlvbiBpcyBmYWlybHkgc2ltcGxlIGFuZCBsaW1pdGVkIHRvIHdoYXQncyBuZWVkZWQgYnkKdlBD
SSwgYnV0IGNhbiBiZSBleHBhbmRlZCBpbiB0aGUgZnV0dXJlIGlmIG90aGVyIG1vcmUgY29tcGxl
eCB1c2VycwphcHBlYXIuCgpUaGUgc2VyaWVzIGNhbiBhbHNvIGJlIGZvdW5kIGF0OgoKZ2l0Oi8v
eGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdpdCBpb3JlcV92cGNpX3YyCgpUaGFu
a3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgxMSk6CiAgaW9yZXE6IGZpeCBodm1fYWxsX2lv
cmVxX3NlcnZlcnNfYWRkX3ZjcHUgZmFpbCBwYXRoIGNsZWFudXAKICBpb3JlcTogdGVybWluYXRl
IGNmOCBoYW5kbGluZyBhdCBoeXBlcnZpc29yIGxldmVsCiAgaW9yZXE6IHN3aXRjaCBzZWxlY3Rp
b24gYW5kIGZvcndhcmRpbmcgdG8gdXNlIGlvc2VydmlkX3QKICBpb3JlcTogYWRkIGZpZWxkcyB0
byBhbGxvdyBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzCiAgaW9yZXE6IGFkZCBpbnRlcm5hbCBpb3Jl
cSBpbml0aWFsaXphdGlvbiBzdXBwb3J0CiAgaW9yZXE6IGFsbG93IGRpc3BhdGNoaW5nIGlvcmVx
cyB0byBpbnRlcm5hbCBzZXJ2ZXJzCiAgaW9yZXE6IGFsbG93IHJlZ2lzdGVyaW5nIGludGVybmFs
IGlvcmVxIHNlcnZlciBoYW5kbGVyCiAgaW9yZXE6IGFsbG93IGRlY29kaW5nIGFjY2Vzc2VzIHRv
IE1NQ0ZHIHJlZ2lvbnMKICB2cGNpOiByZWdpc3RlciBhcyBhbiBpbnRlcm5hbCBpb3JlcSBzZXJ2
ZXIKICBpb3JlcTogc3BsaXQgdGhlIGNvZGUgdG8gZGV0ZWN0IFBDSSBjb25maWcgc3BhY2UgYWNj
ZXNzZXMKICBpb3JlcTogcHJvdmlkZSBzdXBwb3J0IGZvciBsb25nLXJ1bm5pbmcgb3BlcmF0aW9u
cy4uLgoKIHRvb2xzL3Rlc3RzL3ZwY2kvTWFrZWZpbGUgICAgICAgICAgIHwgICA1ICstCiB0b29s
cy90ZXN0cy92cGNpL2VtdWwuaCAgICAgICAgICAgICB8ICAgNCArCiB4ZW4vYXJjaC94ODYvaHZt
L2RtLmMgICAgICAgICAgICAgICB8ICAxOSArLQogeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxk
LmMgICAgICAgfCAgIDkgKy0KIHhlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jICAgICAgICAgIHwg
IDE0ICstCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICAgICB8ICAgNyArLQogeGVu
L2FyY2gveDg2L2h2bS9pby5jICAgICAgICAgICAgICAgfCAyNDggKystLS0tLS0tLS0tLS0tLQog
eGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jICAgICAgICAgICAgfCA0MzQgKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS9zdGR2Z2EuYyAgICAgICAgICAgfCAgIDgg
Ky0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgICAgIHwgIDIwICstCiB4ZW4vYXJj
aC94ODYvcGh5c2Rldi5jICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gveDg2L2lvbW11LmMgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgICAg
ICAgICAgIHwgIDYxICsrLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgICAgICAgIHwg
IDc1ICsrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCAgICB8ICAzNSArKy0K
IHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvLmggICAgICAgIHwgIDI5ICstCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS9pb3JlcS5oICAgICB8ICAxNyArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vdmNwdS5oICAgICAgfCAgIDMgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmggICAgICAg
ICAgIHwgICA5ICstCiB4ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2RtX29wLmggICAgICB8ICAgMSAr
CiB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgICAgICAgICAgICB8ICAyOCArLQogMjEgZmlsZXMg
Y2hhbmdlZCwgNTU5IGluc2VydGlvbnMoKyksIDQ3NSBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
