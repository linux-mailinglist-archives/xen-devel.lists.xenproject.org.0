Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987957FDB9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:39:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZbK-00033Q-Dy; Fri, 02 Aug 2019 15:36:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZbI-00032e-KS
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:36:12 +0000
X-Inumbo-ID: 412ba0c8-b53b-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 412ba0c8-b53b-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:36:11 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Cs7Bp/KqHvffa+x9gtcZC2dDpcK2DMruxNhgQir7MNItRPU0foxlkerZ6DcIgmvukBNCIYBBLB
 lIFQqz/c0TCDwUD/NSeqN46Vg/Z01Tgjrha3ToMzRI0/qBi98LZGAPAtPi4eiP2mSATssKLZnF
 gmyQWQhv5thpkJlDJU1idkgWCq9MC91d6zZLqIhB4alBb8RHTA0FulYDAXYaPxaeFbRaAkc7wF
 JagG8DJUfAS0vDGOG+6MT2RJpnXzS8COUmXEaCq8EsGX73UlfM1lWNSjjmjUtcOKgIkoDvrCx/
 /YM=
X-SBRS: 2.7
X-MesageID: 3825670
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3825670"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:36 +0100
Message-ID: <20190802153606.32061-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 05/35] libxl: Make libxl_qemu_monitor_command
 async
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYmVjYXVzZSBpdCBtYWtlcyBRTVAgY2FsbHMgd2hpY2ggYXJlIGdvaW5nIHRvIGJlIGFzeW5j
LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgfCAxMyArKysrKysrKysrKystCiB0b29s
cy9saWJ4bC9saWJ4bF9xbXAuYyB8ICA5ICsrKysrLS0tLQogdG9vbHMveGwveGxfbWlzYy5jICAg
ICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4
bC5oCmluZGV4IDk2NDg5YTc0Y2EuLmQwMDFmZmM3NWUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGwuaApAQCAtMjUzOCw3ICsyNTM4LDE4IEBA
IGludCBsaWJ4bF9mZF9zZXRfbm9uYmxvY2sobGlieGxfY3R4ICpjdHgsIGludCBmZCwgaW50IG5v
bmJsb2NrKTsKICAqIHZpYSBvdXRwdXQuCiAgKi8KIGludCBsaWJ4bF9xZW11X21vbml0b3JfY29t
bWFuZChsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqY29tbWFuZF9saW5lLCBjaGFyICoqb3V0cHV0KTsKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpjb21tYW5kX2xpbmUsIGNo
YXIgKipvdXRwdXQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxf
YXN5bmNvcF9ob3cgKmFvX2hvdykKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBMSUJY
TF9FWFRFUk5BTF9DQUxMRVJTX09OTFk7CisjaWYgZGVmaW5lZChMSUJYTF9BUElfVkVSU0lPTikg
JiYgTElCWExfQVBJX1ZFUlNJT04gPCAweDA0MTMwMAorc3RhdGljIGlubGluZSBpbnQgbGlieGxf
cWVtdV9tb25pdG9yX2NvbW1hbmRfMHgwNDEyMDAobGlieGxfY3R4ICpjdHgsCisgICAgdWludDMy
X3QgZG9taWQsIGNvbnN0IGNoYXIgKmNvbW1hbmRfbGluZSwgY2hhciAqKm91dHB1dCkKK3sKKyAg
ICByZXR1cm4gbGlieGxfcWVtdV9tb25pdG9yX2NvbW1hbmQoY3R4LCBkb21pZCwgY29tbWFuZF9s
aW5lLCBvdXRwdXQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwp
OworfQorI2RlZmluZSBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZCBsaWJ4bF9xZW11X21vbml0
b3JfY29tbWFuZF8weDA0MTIwMAorI2VuZGlmCiAKICNpbmNsdWRlIDxsaWJ4bF9ldmVudC5oPgog
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X3FtcC5jCmluZGV4IDIwZDllZWQ4ZGQuLjUwNWUwZTU0NjkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3FtcC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCkBAIC0xMjkxLDE1
ICsxMjkxLDE2IEBAIGludCBsaWJ4bF9fcW1wX2htcChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQs
IGNvbnN0IGNoYXIgKmNvbW1hbmRfbGluZSwKIH0KIAogaW50IGxpYnhsX3FlbXVfbW9uaXRvcl9j
b21tYW5kKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBjaGFyICpjb21tYW5kX2xpbmUsIGNoYXIgKipvdXRwdXQpCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqY29tbWFuZF9saW5lLCBj
aGFyICoqb3V0cHV0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhs
X2FzeW5jb3BfaG93ICphb19ob3cpCiB7Ci0gICAgR0NfSU5JVChjdHgpOworICAgIEFPX0NSRUFU
RShjdHgsIGRvbWlkLCBhb19ob3cpOwogICAgIGludCByYzsKIAogICAgIHJjID0gbGlieGxfX3Ft
cF9obXAoZ2MsIGRvbWlkLCBjb21tYW5kX2xpbmUsIG91dHB1dCk7CiAKLSAgICBHQ19GUkVFOwot
ICAgIHJldHVybiByYzsKKyAgICBsaWJ4bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOworICAg
IHJldHVybiBBT19JTlBST0dSRVNTOwogfQogCiBpbnQgbGlieGxfX3FtcF9pbml0aWFsaXphdGlv
bnMobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCmRpZmYgLS1naXQgYS90b29scy94bC94
bF9taXNjLmMgYi90b29scy94bC94bF9taXNjLmMKaW5kZXggNTBjODQzNjMzNy4uMjBlZDYwNWY0
ZiAxMDA2NDQKLS0tIGEvdG9vbHMveGwveGxfbWlzYy5jCisrKyBiL3Rvb2xzL3hsL3hsX21pc2Mu
YwpAQCAtMjI4LDcgKzIyOCw3IEBAIGludCBtYWluX3FlbXVfbW9uaXRvcl9jb21tYW5kKGludCBh
cmdjLCBjaGFyICoqYXJndikKICAgICAgICAgcmV0dXJuIEVYSVRfRkFJTFVSRTsKICAgICB9CiAK
LSAgICByZXQgPSBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZChjdHgsIGRvbWlkLCBjbWQsICZv
dXRwdXQpOworICAgIHJldCA9IGxpYnhsX3FlbXVfbW9uaXRvcl9jb21tYW5kKGN0eCwgZG9taWQs
IGNtZCwgJm91dHB1dCwgTlVMTCk7CiAgICAgaWYgKCFyZXQgJiYgb3V0cHV0KSB7CiAgICAgICAg
IHByaW50ZigiJXNcbiIsIG91dHB1dCk7CiAgICAgICAgIGZyZWUob3V0cHV0KTsKLS0gCkFudGhv
bnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
