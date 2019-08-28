Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA033A0BB7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 22:42:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i34jb-000566-Bz; Wed, 28 Aug 2019 20:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jN/K=WY=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i34jZ-0004wP-JG
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 20:40:01 +0000
X-Inumbo-ID: 01398994-c9d4-11e9-b95f-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01398994-c9d4-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 20:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567024800;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=kgYWLCT0BOAOjNd1aDk6CwFPMkMqIEMwqZ1/S2jpqwE=;
 b=NlCcDDwESmf1ZPWJ8umhkvg/HJOQ+41FHfJiLbjxNBv89rbteR/+AOL+
 /Bxf07hz1NaOgHJdzDikuZc/XYphhOVvk4JNFQ3/WCMH7Ioi4sF4WC9AM
 npuVhiVvudzgSaaXq4G8DGGvoMi8tcYQsGLIhVM4/kOo/8e1dsijlWh5c c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0qM69n3yKD0hTe27CF9djp1aLTRc5oRzHVMV5+PnG2f6AKPclNYdnjG+Jz3rOWqD68nH7l31/x
 OZaF3zGLpjZZDlYqLO8E3VHUXd+eUaX/Frc39/PelUhukKZVkAaUS8/g0WHJJ6ic8yPcITzJF8
 eMw4vK8Z99lsCXLQnCP/7PftAl9j2HKsuafKe3xPw7Bkg+4wpr4d0kUXc0AvMQjKFkYLoFH7Qp
 DhZPmeznicf2T5uJCV1InTB6z1nFjnXaWPpaZwA2eQvajCYlDfa+he9jr2FQBqoCtr1O0I3asc
 GgA=
X-SBRS: 2.7
X-MesageID: 5115327
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5115327"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 28 Aug 2019 21:39:56 +0100
Message-ID: <1567024796-13463-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/domain: don't destroy IOREQ servers on soft
 reset
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
Cc: Igor
 Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org, andrew.cooper3@citrix.com,
 paul.durrant@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGVyZm9ybWluZyBzb2Z0IHJlc2V0IHNob3VsZCBub3Qgb3Bwb3J0dW5pc3RpY2FsbHkga2lsbCBJ
T1JFUSBzZXJ2ZXJzCmZvciBkZXZpY2UgZW11bGF0b3JzIHRoYXQgbWlnaHQgYmUgY3VycmVudGx5
IHJ1bm5pbmcgZm9yIGEgZG9tYWluLgpFdmVyeSBlbXVsYXRvciBpcyBzdXBwb3NlZCB0byBjbGVh
biB1cCBJT1JFUSBzZXJ2ZXJzIGZvciBpdHNlbGYgb24gZXhpdC4KVGhpcyBhbGxvd3MgYSB0b29s
c3RhY2sgdG8gZWxlY3Qgd2hldGhlciBvciBub3QgYSBwYXJ0aWN1bGFyIGRldmljZQptb2RlbCBz
aG91bGQgYmUgcmVzdGFydGVkLgoKU2luY2UgY29tbWl0IGJhN2ZkZDY0YiAoInhlbjogY2xlYW51
cCBJT1JFUSBzZXJ2ZXIgb24gZXhpdCIpIFFFTVUgbm93CmRlc3Ryb3lzIElPUkVRIHNlcnZlciBm
b3IgaXRzZWxmIGFzIGV2ZXJ5IG90aGVyIGRldmljZSBlbXVsYXRvcgppcyBzdXBwb3NlZCB0byBk
by4gSXQncyBub3cgc2FmZSB0byByZW1vdmUgdGhpcyBjb2RlIGZyb20gc29mdCByZXNldApwYXRo
IC0gZXhpc3Rpbmcgc3lzdGVtcyB3aXRoIG9sZCBRRU1VIHNob3VsZCBiZSBhYmxlIHRvIHdvcmsg
YXMKZXZlbiBpZiB0aGVyZSBhcmUgSU9SRVEgc2VydmVycyBsZWZ0IGJlaGluZCwgYSBuZXcgUUVN
VSBpbnN0YW5jZSB3aWxsCm92ZXJyaWRlIGl0cyByYW5nZXMgYW55d2F5LgoKU2lnbmVkLW9mZi1i
eTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQogeGVuL2Fy
Y2gveDg2L2RvbWFpbi5jICAgICAgICAgfCAyIC0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAg
ICAgICB8IDUgLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oIHwgMSAtCiAzIGZp
bGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Rv
bWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IDJkZjMxMjMuLjk1N2YwNTkgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWlu
LmMKQEAgLTcxMyw4ICs3MTMsNiBAQCBpbnQgYXJjaF9kb21haW5fc29mdF9yZXNldChzdHJ1Y3Qg
ZG9tYWluICpkKQogICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgKQogICAgICAgICByZXR1cm4g
LUVJTlZBTDsKIAotICAgIGh2bV9kb21haW5fc29mdF9yZXNldChkKTsKLQogICAgIHNwaW5fbG9j
aygmZC0+ZXZlbnRfbG9jayk7CiAgICAgZm9yICggaSA9IDA7IGkgPCBkLT5ucl9waXJxcyA7IGkr
KyApCiAgICAgewpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKaW5kZXggMDI5ZWVhMy4uMmI4MTg5OSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC01MDQ1LDEx
ICs1MDQ1LDYgQEAgdm9pZCBodm1fdG9nZ2xlX3NpbmdsZXN0ZXAoc3RydWN0IHZjcHUgKnYpCiAg
ICAgdi0+YXJjaC5odm0uc2luZ2xlX3N0ZXAgPSAhdi0+YXJjaC5odm0uc2luZ2xlX3N0ZXA7CiB9
CiAKLXZvaWQgaHZtX2RvbWFpbl9zb2Z0X3Jlc2V0KHN0cnVjdCBkb21haW4gKmQpCi17Ci0gICAg
aHZtX2Rlc3Ryb3lfYWxsX2lvcmVxX3NlcnZlcnMoZCk7Ci19Ci0KIC8qCiAgKiBTZWdtZW50IGNh
Y2hlcyBpbiBWTUNCL1ZNQ1MgYXJlIGluY29uc2lzdGVudCBhYm91dCB3aGljaCBiaXRzIGFyZSBj
aGVja2VkLAogICogaW1wb3J0YW50LCBhbmQgcHJlc2VydmVkIGFjcm9zcyB2bWVudHJ5L2V4aXQu
ICBDb29rIHRoZSB2YWx1ZXMgdG8gbWFrZSB0aGVtCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9odm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCmluZGV4IGIz
MjdiZDIuLjRlNzJkMDcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCkBAIC0yNDAsNyArMjQwLDYgQEAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgKnN0YXJ0X3ZteCh2b2lkKTsK
IGludCBodm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCk7CiB2b2lkIGh2bV9k
b21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCk7CiB2b2lkIGh2bV9k
b21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKTsKLXZvaWQgaHZtX2RvbWFpbl9zb2Z0X3Jl
c2V0KHN0cnVjdCBkb21haW4gKmQpOwogCiBpbnQgaHZtX3ZjcHVfaW5pdGlhbGlzZShzdHJ1Y3Qg
dmNwdSAqdik7CiB2b2lkIGh2bV92Y3B1X2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpOwotLSAKMi43
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
