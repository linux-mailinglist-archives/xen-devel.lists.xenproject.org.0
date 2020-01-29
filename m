Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7EA14CCB8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:48:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwob2-0007Eu-8b; Wed, 29 Jan 2020 14:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yA0q=3S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwob0-0007Eh-44
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:45:34 +0000
X-Inumbo-ID: 00436096-42a6-11ea-b211-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00436096-42a6-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580309133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUUVFXs300eZPYkIFY4J6xtq3ukAunIJ6SYJ9l5Clps=;
 b=gFksgsPuwv4YeJ1xw7Hcb5XXdvxXwe6pJLN/t8fMOyloSoAe9FdRXQqS
 O2e1KiXGTGSivv+pVhwRD2fB7ypCcnEEhw2LYoNqtL75MRspeOWVRsnTO
 dSDnrK03F8x0ObR8lh5ABMHIBpdrnXCtq8QcFIE40tqWQPlrDA9LkIiMJ Q=;
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
IronPort-SDR: fdrrx310ktFWA5EYz5TuWE7K2munDambpHrwCKGM8KG450tLJzsVHxOXHYA1FVQAPeRESaovqo
 KE1hn1D6Pb0K3n2PiCSmz5+CJ3poiO9Ifp+Rf5EsQh1klZAIlFuNASLPUoN0NTOV+ylLE7pTbg
 X3expc5yYH56N58xxHbnbCxUjp1m9SU3A1PX2+tGfSepmrB9nTMayppUGqbbAV5NQNaWskYSv5
 5/3PL01V0kMR8Hy08jq0TVhA34rBpINx4Wqkl0gouROjZ+rg4Bu4Vvg85WGUSBDvI5tlzs+asz
 Wpc=
X-SBRS: 2.7
X-MesageID: 11633369
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,378,1574139600"; d="scan'208";a="11633369"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 15:45:12 +0100
Message-ID: <20200129144514.96686-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] nvmx: implement support for MSR bitmaps
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDdXJyZW50IG5lc3RlZCBWTVggY29kZSBhZHZlcnRpc2VzIHN1cHBvcnQgZm9yIHRo
ZSBNU1IgYml0bWFwIGZlYXR1cmUsCnlldCB0aGUgaW1wbGVtZW50YXRpb24gaXNuJ3QgZG9uZS4g
UHJldmlvdXMgdG8gdGhpcyBzZXJpZXMgWGVuIGp1c3QgbWFwcwp0aGUgbmVzdGVkIGd1ZXN0IE1T
UiBiaXRtYXAgKGFzIHNldCBieSBMMSkgYW5kIHRoYXQncyBpdCwgdGhlIEwyIGd1ZXN0CmVuZHMg
dXAgdXNpbmcgdGhlIEwxIE1TUiBiaXRtYXAuCgpUaGlzIHNlcmllcyBhZGRzIGhhbmRsaW5nIG9m
IHRoZSBMMiBNU1IgYml0bWFwIGFuZCBtZXJnaW5nIHdpdGggdGhlIEwxCk1TUiBiaXRtYXAgYW5k
IGxvYWRpbmcgaXQgaW50byB0aGUgbmVzdGVkIGd1ZXN0IFZNQ1MuCgpQYXRjaCAjMiBtYWtlcyBz
dXJlIHRoZSB4MkFQSUMgTVNSIHJhbmdlIGlzIGFsd2F5cyB0cmFwcGVkLCBvciBlbHNlIGEKZ3Vl
c3Qgd2l0aCBuZXN0ZWQgdmlydHVhbGl6YXRpb24gZW5hYmxlZCBjb3VsZCBtYW5hZ2UgdG8gYWNj
ZXNzIHNvbWUgb2YKdGhlIHgyQVBJQyBNU1IgcmVnaXN0ZXJzIGZyb20gdGhlIGhvc3QuCgpUaGFu
a3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgyKToKICBudm14OiBpbXBsZW1lbnQgc3VwcG9y
dCBmb3IgTVNSIGJpdG1hcHMKICBudm14OiBhbHdheXMgdHJhcCBhY2Nlc3NlcyB0byB4MkFQSUMg
TVNScwoKIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyAgICAgICAgfCA3MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92dm14Lmgg
fCAgMyArLQogMiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
