Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26E23130
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:20:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfN7-00084b-CO; Mon, 20 May 2019 10:18:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfN6-00084Q-GA
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:18:20 +0000
X-Inumbo-ID: 95c68106-7ae8-11e9-891b-9ba9a91e1bca
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95c68106-7ae8-11e9-891b-9ba9a91e1bca;
 Mon, 20 May 2019 10:18:18 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: OQuBQaRBldQG/AQK55tjB1Okz446fJrbqr1II/tx6IPL+PBqGmzXq2Q7uduVLcu9+DD2xAUlaV
 jezmeNBuKAKfJoUtYZUZbIEKWg4pmMUYgDYdba4GCez5M3uKqMkbPzidKIkZoFyp7yfkwOL0p2
 V3b/oMMWdeHwVxGOREYBC/cgbXSKT+hWiyKJAekNJSRAn5YhCheVDLgwqNpIQheEPYU7z/edl7
 uV9q/GZwVaFXYM/QCRixZ0DN32j5NKJpk7Hq2H3T2/vHu8/xko8U7GI5lV8CCdGgUeqvzDKxY4
 1xk=
X-SBRS: 2.7
X-MesageID: 627450
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="627450"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 11:18:10 +0100
Message-ID: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] x86/boot: Misc improvements to dom0
 construction
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzdGFydGVkIG91dCBhcyBqdXN0IHBhdGNoIDMsIHRyeWluZyB0byBjbGVhbiB1cCB0aGUg
cmVtYWlucyBvZiB0aGUKcHYtbDF0ZiBkZWJ1Z2dpbmcsIGFuZCBleHBhbmRlZCBhIGxpdHRsZSB1
cG9uIHJlYWRpbmcgdGhlIHN1cnJvdW5kaW5nIGNvZGUuCgpBbmRyZXcgQ29vcGVyICg0KToKICB4
ODYvcHY6IEZpeCBlcnJvciBoYW5kbGluZyBpbiBkb20wX2NvbnN0cnVjdF9wdigpCiAgeDg2L2Jv
b3Q6IFJlbmFtZSBkb20wX3twdmgsdmVyYm9zZX0gdmFyaWFibGVzIHRvIGhhdmUgYW4gb3B0XyBw
cmVmaXgKICB4ODYvYm9vdDogV2lyZSB1cCBkb20wPXNoYWRvdyBmb3IgUFYgZG9tMAogIHg4Ni9i
b290OiBMaW5rIG9wdF9kb20wX3ZlcmJvc2UgdG8gQ09ORklHX1ZFUkJPU0VfREVCVUcKCiBkb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAxNyArKysrKysrKysrKy0tLS0tLQogeGVu
L2FyY2gveDg2L2RvbTBfYnVpbGQuYyAgICAgICAgIHwgMjAgKysrKysrLS0tLS0tLS0tLS0tLS0K
IHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYv
cHYvZG9tMF9idWlsZC5jICAgICAgfCAyNiArKysrKysrKysrKysrKystLS0tLS0tLS0tLQogeGVu
L2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14
ODYvc2V0dXAuaCAgICAgICB8ICA0ICsrLS0KIDYgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9u
cygrKSwgMzUgZGVsZXRpb25zKC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
