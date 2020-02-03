Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A7150EC8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:40:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyffT-0007Qx-Kx; Mon, 03 Feb 2020 17:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyffR-0007Qk-86
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:37:49 +0000
X-Inumbo-ID: e49f6e48-46ab-11ea-8e7c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e49f6e48-46ab-11ea-8e7c-12813bfff9fa;
 Mon, 03 Feb 2020 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580751469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1uAvnWMOArEwHihLbC0v59fYzSYq7L28U8c1Ce8mJRc=;
 b=QF2biqZZ00zT0rpiRv1DE3iE0U0OiWy4ljNVbZR0Z4SnuSaThyKvHu1c
 MSAwnXfnTFVVHbf8Fcb2uFDky6XHwTRHA0aUddRK9YK7Yb/KFQ3zyzIrf
 eBmCh3bcfMaI0jNti/8J9lTeEAoJWWjGfZ2XoSCHiij75wIi6blitf/b9 E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: e6gVsbIEL0exhSZgrhAbt1s1kTTrJ5XgnbA3NBwWc8Nm8LCScwIUlVTNwxRlz+ge8r6bC0T/Tk
 OYUOz5IfB4FHID02sUEqvUtB2H/CJ76YI5bNRpYZRwNLxliNOsmp/1d04scYlyky9wZmm50UuV
 WhX20dFPOAdPNzi2XaIBvdqMgbtYSzjqKBor9HfxyYvxyBJfp5wdbqA1D89EJx7n6O8EwF/i4g
 JyOVgjF5i/rjC0R1Wk3EJq90unOXHgB1/94rJFToZ4Qc8Q+L1kxhOWmtCm1PT+79fUHVUqlEaY
 PXI=
X-SBRS: 2.7
X-MesageID: 12036616
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12036616"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 18:37:26 +0100
Message-ID: <20200203173728.18135-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] nvmx: implement support for MSR bitmaps
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
TVNScwoKIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyAgICAgICAgfCA3MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92dm14Lmgg
fCAgMyArLQogMiBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
