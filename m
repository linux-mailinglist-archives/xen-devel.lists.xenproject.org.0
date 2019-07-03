Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2E5E2DD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:36:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hidWN-0004V7-A0; Wed, 03 Jul 2019 11:33:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yqyy=VA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hidWL-0004Ux-J5
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 11:33:53 +0000
X-Inumbo-ID: 6e646504-9d86-11e9-8cd7-bf073077d379
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e646504-9d86-11e9-8cd7-bf073077d379;
 Wed, 03 Jul 2019 11:33:52 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 29wQgf3/gOW/m6CSt0hTXNcaOrDfQOCLEBzUvnp3IPcVBiwPVi1PsdGsPuOaqiOjq4xH0dRcKU
 67z1UXmUaRuQxV+3awv4XvyG6KE/47Xk3yyA8jvCFWH7uqQJ6qPddTP2nciMj6qTqj32rQC1Bf
 NVWvZJrbF34njGuyokAUJzhpcd7HDgxZqwYjeKF7UjZyh/Mp1wdtBm4dYgagDdSecqMqpaDffH
 ujMAp2cbR5h5qZmvOfEvIyG/M+aqMCBKB4bNfv09XLboLrcZVjmd3S/R3B8Ougm3K1/VLfKNX7
 D9A=
X-SBRS: 2.7
X-MesageID: 2567772
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2567772"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 3 Jul 2019 13:33:26 +0200
Message-ID: <20190703113326.2344-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/ept: pass correct level to
 p2m_entry_modify
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
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RVBUIGRpZmZlcnMgZnJvbSBOUFQgYW5kIHNoYWRvdyB3aGVuIHRyYW5zbGF0aW5nIHBhZ2Ugb3Jk
ZXJzIHRvIGxldmVscwppbiB0aGUgcGh5c21hcCBwYWdlIHRhYmxlcy4gRVBUIHBhZ2UgdGFibGVz
IGxldmVsIGZvciBvcmRlciAwIHBhZ2VzIGlzCjAsIHdoaWxlIE5QVCBhbmQgc2hhZG93IGluc3Rl
YWQgdXNlIDEsIGllOiBFUFQgcGFnZSB0YWJsZXMgbGV2ZWxzCnN0YXJ0cyBhdCAwIHdoaWxlIE5Q
VCBhbmQgc2hhZG93IHN0YXJ0cyBhdCAxLgoKRml4IHRoZSBwMm1fZW50cnlfbW9kaWZ5IGNhbGwg
aW4gYXRvbWljX3dyaXRlX2VwdF9lbnRyeSB0byBhbHdheXMgYWRkCm9uZSB0byB0aGUgbGV2ZWws
IGluIG9yZGVyIHRvIG1hdGNoIE5QVCBhbmQgc2hhZG93IHVzYWdlLgoKV2hpbGUgdGhlcmUgYWxz
byBhZGQgYSBjaGVjayB0byBlbnN1cmUgcDJtX2VudHJ5X21vZGlmeSBpcyBuZXZlcgpjYWxsZWQg
d2l0aCBsZXZlbCA9PSAwLiBUaGF0IHNob3VsZCBhbGxvdyB0byBjYXRjaCBmdXR1cmUgZXJyb3Jz
CnJlbGF0ZWQgdG8gdGhlIGxldmVsIHBhcmFtZXRlci4KCkZpeGVzOiBjN2E0YzA4OGFkMWMgKCd4
ODYvbW06IHNwbGl0IHAybSBpb3JlcSBzZXJ2ZXIgcGFnZXMgc3BlY2lhbCBoYW5kbGluZyBpbnRv
IGhlbHBlcicpClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ2M6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgpDYzogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBDaGVjayBsZXZlbCBp
cyAhPSAwIGluIHAybV9lbnRyeV9tb2RpZnkuCiAtIEV4cGFuZCBkaWdpdHMgb2YgaGFzaCBpZC4K
LS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIHwgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9wMm0uaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIGIveGVuL2FyY2gv
eDg2L21tL3AybS1lcHQuYwppbmRleCBlMzA0NGJlZTJlLi42Yjg0NjhjNzkzIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0
LmMKQEAgLTUxLDcgKzUxLDcgQEAgc3RhdGljIGludCBhdG9taWNfd3JpdGVfZXB0X2VudHJ5KHN0
cnVjdCBwMm1fZG9tYWluICpwMm0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IGxldmVsKQogewogICAgIGludCByYyA9IHAybV9lbnRyeV9tb2RpZnkocDJtLCBuZXcuc2Ff
cDJtdCwgZW50cnlwdHItPnNhX3AybXQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBf
bWZuKG5ldy5tZm4pLCBfbWZuKGVudHJ5cHRyLT5tZm4pLCBsZXZlbCk7CisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBfbWZuKG5ldy5tZm4pLCBfbWZuKGVudHJ5cHRyLT5tZm4pLCBsZXZl
bCArIDEpOwogCiAgICAgaWYgKCByYyApCiAgICAgICAgIHJldHVybiByYzsKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCmlu
ZGV4IDA5ZWY3ZTAyZmQuLmFmZjM0ZTNhZGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvcDJtLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaApAQCAtOTQ2LDYgKzk0Niw3
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHAybV9lbnRyeV9tb2RpZnkoc3RydWN0IHAybV9kb21haW4g
KnAybSwgcDJtX3R5cGVfdCBudCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cDJtX3R5cGVfdCBvdCwgbWZuX3QgbmZuLCBtZm5fdCBvZm4sCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZXZlbCkKIHsKKyAgICBCVUdfT04oIWxldmVs
KTsKICAgICBCVUdfT04obGV2ZWwgPiAxICYmIChudCA9PSBwMm1faW9yZXFfc2VydmVyIHx8IG50
ID09IHAybV9tYXBfZm9yZWlnbikpOwogCiAgICAgaWYgKCBsZXZlbCAhPSAxIHx8IChudCA9PSBv
dCAmJiBtZm5fZXEobmZuLCBvZm4pKSApCi0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
