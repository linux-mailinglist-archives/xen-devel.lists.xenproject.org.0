Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BF170975
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:25:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73Cy-00042X-2G; Wed, 26 Feb 2020 20:23:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73Cx-00042B-0z
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:23:03 +0000
X-Inumbo-ID: b6be91d4-58d5-11ea-94dc-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6be91d4-58d5-11ea-94dc-12813bfff9fa;
 Wed, 26 Feb 2020 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gL2fuzebQK/5SMD2qlY+DazyVmnMtHRGX3F1hLOS3GY=;
 b=N2p6fXnKuJ4ectSC99criJsL5ktsAolLeAeeDGfaBBlciMuYIw42Si0F
 IUtY99MRYWNXjXF96TxeqrezWN6EsS1ECDu06NpcYio17sL6uPhqAC0SL
 RHFkrSLD1BmTmtbXgsIzhLLw0WQD1JnyylLe3pyEbMROFbdKBt97lX6rj Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7hH9lOIIqN7dtDPVh38U6UFpT3sEHN1oqnSAnvC0nqx6xMj5flNIfhELmRZ3QRp2uEgZvpAIuq
 lKevgTQW6dmEBtwn2REHK75BihotGcgBFgYQtHcc/CefYN39cdOaLbU8fhuktaxmTsTQf6wgqp
 2/PrVXNyWWdqXJwzqDAEfP5+NXgyOc2JrzJKIqZ2nYxDvsoRkFphEJP7QZU2WyEqHg2Y2KAlps
 WYFi7NN6d6x6H3ufNprtvpp2ivgeE2FP7vqSdbzvCORMr1QbDdZtitBoNoOlzYPSHWnkUQh5ma
 L6s=
X-SBRS: 2.7
X-MesageID: 13047650
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13047650"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:11 +0000
Message-ID: <20200226202221.6555-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 00/10] x86: Default vs Max policies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgYnVpbGRzIG9uIHNldmVyYWwgeWVhcnMgd29ydGggb2YgYnVpbGRpbmcgYmxv
Y2tzIHRvIGZpbmFsbHkgY3JlYXRlCmEgcmVhbCBkaXN0aW5jdGlvbiBiZXR3ZWVuIGRlZmF1bHQg
YW5kIG1heCBwb2xpY2llcy4KClNlZSB0aGUgZmluYWwgcGF0Y2ggZm9yIGEgY29uY3JldGUgZXhh
bXBsZS4KCkV2ZXJ5dGhpbmcgYnV0IHRoZSBmaW5hbCBwYXRjaCBpcyByZWFkeSB0byBnbyBpbiBu
b3cuICBUaGUgZmluYWwgcGF0Y2ggZGVwZW5kcwpvbiB0aGUgc3RpbGwtaW4tcmV2aWV3IG1pZ3Jh
dGlvbiBzZXJpZXMsIHRvIHByb3ZpZGUgc3VpdGFibGUgYmFja3dhcmRzCmNvbXBhdGlsYml0eSBm
b3IgVk1zIGNvbWluZyBmcm9tIG9sZGVyIHZlcnNpb25zIG9mIFhlbi4KCkFuZHJldyBDb29wZXIg
KDEwKToKICB4ODYvc3lzY3RsOiBEb24ndCByZXR1cm4gY3B1IHBvbGljeSBkYXRhIGZvciBjb21w
aWxlZC1vdXQgc3VwcG9ydCAoMikKICB0b29scy9saWJ4YzogU2ltcGxpZnkgeGNfZ2V0X3N0YXRp
Y19jcHVfZmVhdHVyZW1hc2soKQogIHg4Ni9nZW4tY3B1aWQ6IFJld29yayBpbnRlcm5hbCBsb2dp
YyB0byBlYXNlIGZ1dHVyZSBjaGFuZ2VzCiAgeDg2L2dlbi1jcHVpZDogQ3JlYXRlIG1heCBhbmQg
ZGVmYXVsdCB2YXJpYXRpb25zIG9mIElOSVRfKl9GRUFUVVJFUwogIHg4Ni9tc3I6IENvbXBpbGUg
b3V0IHVudXNlZCBsb2dpYy9vYmplY3RzCiAgeDg2L21zcjogSW50cm9kdWNlIGFuZCB1c2UgZGVm
YXVsdCBNU1IgcG9saWNpZXMKICB4ODYvY3B1aWQ6IENvbXBpbGUgb3V0IHVudXNlZCBsb2dpYy9v
YmplY3RzCiAgeDg2L2NwdWlkOiBJbnRyb2R1Y2UgYW5kIHVzZSBkZWZhdWx0IENQVUlEIHBvbGlj
aWVzCiAgeDg2L2dlbi1jcHVpZDogRGlzdGluZ3Vpc2ggZGVmYXVsdCB2cyBtYXggaW4gZmVhdHVy
ZSBhbm5vdGF0aW9ucwogIHg4Ni9odm06IERvIG5vdCBlbmFibGUgTVBYIGJ5IGRlZmF1bHQKCiB0
b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgICAgICAgICAgIHwgIDEwICsrLQogdG9v
bHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAgICAgICAgICAgICAgICB8ICA1NSArKysrKy0tLS0t
LS0tCiB0b29scy9taXNjL3hlbi1jcHVpZC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDM1ICsr
KysrKy0tLQogeGVuL2FyY2gveDg2L2NwdWlkLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEx
OCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiB4ZW4vYXJjaC94ODYvbXNyLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDYyICsrKysrKysrKysrLS0tLQogeGVuL2FyY2gveDg2L3N5
c2N0bC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyNSArKysrLS0KIHhlbi9pbmNsdWRlL2Fz
bS14ODYvY3B1aWQuaCAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIHhlbi9pbmNsdWRlL2FzbS14
ODYvbXNyLmggICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9h
cmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmggfCAgIDQgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNj
dGwuaCAgICAgICAgICAgICAgICAgfCAgIDIgKwogeGVuL3Rvb2xzL2dlbi1jcHVpZC5weSAgICAg
ICAgICAgICAgICAgICAgICB8IDEwMCArKysrKysrKysrKystLS0tLS0tLS0tLQogMTEgZmlsZXMg
Y2hhbmdlZCwgMjY4IGluc2VydGlvbnMoKyksIDE1MCBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
