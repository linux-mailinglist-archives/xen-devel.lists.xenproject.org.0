Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0749F91ED
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:22:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUX1J-0007iQ-3D; Tue, 12 Nov 2019 14:19:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WaD3=ZE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iUX1H-0007iL-1Q
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:19:47 +0000
X-Inumbo-ID: 7a16c46c-0557-11ea-b678-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a16c46c-0557-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573568386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RQ6xVTrcuGn/rcNfejApRRyGTiSnTM5IdSjFficv0zg=;
 b=PEKRbYalyIhien+uowtjNNLIxOONe7ueAKIh9WsrRgCo+zbCCfJsSUwF
 dEAFwVueN/DntldV3fz+zIAVwS1nTG4yp2Y06oZQiMF2RXqjA4tepb8Kl
 S0fGHu8AW2HE+lr9bnO3Zwv6pRuHMLIsYTIauBRyW7xvK+DHao5x8IgFu c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hdfHUSVDOaEaEL5RCvtrg/3Oe8J+ezq/1R/AWWcGWLSTymYf+dBEsADOQJMmXaX6PBYmljjdAR
 o/5q9FFS3BhMbxxSfle+Ioiq6MtPwJfQeLl4AkUhWqBYz78vXlP+5EMuOruQVCeRyXc3CgGc6M
 LrcS2buybnNhJPIBqIG8kEeUwttIjR7ixo8RByNTUBDCTmo4E4kdic4cXYEjWI5yFJl1H6hzBC
 3IbP5YzWPDcnw1DFZC0gh4uz53b482D9q5LAUSvgnCjAwhvD/V0rDfc9AfMiuGiytg6AsEaixJ
 hgc=
X-SBRS: 2.7
X-MesageID: 8722595
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8722595"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 12 Nov 2019 14:19:43 +0000
Message-ID: <20191112141943.245215-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13] libxl: Fix
 libxl_retrieve_domain_configuration error path
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4KCklmIGFuIGVy
cm9yIHdlcmUgdG8gaGFwcGVuIGJlZm9yZSB0aGUgbGFzdCBzdGVwLCBmb3IgZXhhbXBsZSB0aGUK
ZG9tYWluX2NvbmZpZ3VyYXRpb24gaXMgbWlzc2luZywgdGhlIGVycm9yIHdvdWxkbid0IGJlIGNo
ZWNrIGJ5IHRoZQpfZW5kIGNhbGxiYWNrLgoKRml4IHRoYXQsIGFsc28gaW5pdGlhbGlzZSBgbG9j
aycgdG8gTlVMTCBiZWNhdXNlIHRoZSBleGl0IHBhdGggY2hlY2tzCml0LgoKVGhlIGlzc3VlIHNo
b3dzIHVwIHdoZW4gdGhlcmUncyBhIHN0dWJkb20sIGFuZCBydW5uaW5nIGB4bCBsaXN0IC1sYAph
Ym9ydHMuIEluc3RlYWQsIHdpdGggdGhpcyBwYXRjaCwgYHhsIGxpc3QgLWxgIHdpbGwgbm90IGxp
c3Qgc3R1YmRvbSwKcHJvYmFibHkgbGlrZSBiZWZvcmUuCgpSZXBvcnRlZC1ieTogTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgpGaXhl
czogNjE1NjM0MTkyNTdlZDQwMjc4OTM4ZGIyY2NlN2Q2OTdhZWQ0NGY1ZApTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9kb21haW4uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFp
bi5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKaW5kZXggOWQwZWI1YWVkMTFkLi4zM2Y5
ZDllYWE0ODEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCkBAIC0xOTk4LDEyICsxOTk4LDE0IEBAIHN0YXRpYyB2
b2lkIHJldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uX2VuZChsaWJ4bF9fZWdjICplZ2MsCiAg
ICAgcmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb25fc3RhdGUgKnJkY3MsIGludCByYykKIHsK
ICAgICBTVEFURV9BT19HQyhyZGNzLT5xbXAuYW8pOwotICAgIGxpYnhsX19kb21haW5fdXNlcmRh
dGFfbG9jayAqbG9jazsKKyAgICBsaWJ4bF9fZG9tYWluX3VzZXJkYXRhX2xvY2sgKmxvY2sgPSBO
VUxMOwogCiAgICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLwogICAgIGxpYnhsX2RvbWFpbl9j
b25maWcgKmNvbnN0IGRfY29uZmlnID0gcmRjcy0+ZF9jb25maWc7CiAgICAgbGlieGxfZG9taWQg
ZG9taWQgPSByZGNzLT5xbXAuZG9taWQ7CiAKKyAgICBpZiAocmMpIGdvdG8gb3V0OworCiAgICAg
bG9jayA9IGxpYnhsX19sb2NrX2RvbWFpbl91c2VyZGF0YShnYywgZG9taWQpOwogICAgIGlmICgh
bG9jaykgewogICAgICAgICByYyA9IEVSUk9SX0xPQ0tfRkFJTDsKLS0gCkFudGhvbnkgUEVSQVJE
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
