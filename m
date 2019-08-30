Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C5A3625
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 14:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3fWQ-0005rF-Gb; Fri, 30 Aug 2019 11:56:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iSDb=W2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i3fWP-0005rA-3k
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 11:56:53 +0000
X-Inumbo-ID: 40cd7b02-cb1d-11e9-8980-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40cd7b02-cb1d-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 11:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567166211;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=hzn+fYFsxbSO2UZdkLCQFVdU3e/oHK01lN/gfNtRyXI=;
 b=RiRPq6mVdaWxDep7NLO4azLhNxqJUnTYnTc/XCeXs4RAPlrr7aGIYf71
 B3NlAfFfFvUP4eVznTc5SR1yiUVdBbqsl0BeWipUpUH+oEZgxSzAsuXlL
 XWIq1FFUWFGNyV6lBdjJHMYw/gR6x21g57YNrLfBKIgUetQ0mdqG4zCZL k=;
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
IronPort-SDR: l95+oPIHFoTN9zC850DqoRDeT/ZRiEMo25H6SvckxjynC8RI12/2Zw5Sw8WmPACvkIJZw8OBww
 5Kyzybjq6+7yrgp+JZi7r+Op/vxegs8PfWxLzqLny9Hx5BkFsEhPAh7Npoxs1Gct9vd+mp52UI
 h5nY3ln81SmCFsqqlWDrxp4xYo8iyZ31p5Tq0R9sNIBEANje3reDS+tMcLYh1FCWKzBWFyWc97
 RbowJUzKnhBeODAPEF3NGRWerLDNersWZ80gAgGV+buhm7wG22xrndXVV5SlLBhCBnfUt3KwKc
 SB0=
X-SBRS: 2.7
X-MesageID: 5199533
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,447,1559534400"; 
   d="scan'208";a="5199533"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 30 Aug 2019 12:56:46 +0100
Message-ID: <1567166206-13872-1-git-send-email-igor.druzhinin@citrix.com>
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
aG91bGQgYmUgcmVzdGFydGVkLgoKVGhlIG9yaWdpbmFsIGNvZGUgd2FzIGludHJvZHVjZWQgaW4g
MzIzNWNiZmUgKCJhcmNoLXNwZWNpZmljIGhvb2tzIGZvcgpkb21haW5fc29mdF9yZXNldCgpIikg
bGlrZWx5IGR1ZSB0byB0aGUgZmFjdCAnZGVmYXVsdCcgSU9SRVEgc2VydmVyCmV4aXN0ZWQgaW4g
WGVuIGF0IHRoZSB0aW1lIGFuZCB1c2VkIGJ5IFFFTVUgZGlkbid0IGhhdmUgYW4gQVBJIGNhbGwg
dG8KZGVzdHJveS4gU2luY2UgdGhlIHJlbW92YWwgb2YgJ2RlZmF1bHQnIElPUkVRIHNlcnZlciBm
cm9tIFhlbiB0aGlzCnJlYXNvbiBoYXMgZ29uZSBhd2F5LgoKU2luY2UgY29tbWl0IGJhN2ZkZDY0
YiAoInhlbjogY2xlYW51cCBJT1JFUSBzZXJ2ZXIgb24gZXhpdCIpIFFFTVUgbm93CmRlc3Ryb3lz
IElPUkVRIHNlcnZlciBmb3IgaXRzZWxmIGFzIGV2ZXJ5IG90aGVyIGRldmljZSBlbXVsYXRvcgpp
cyBzdXBwb3NlZCB0byBkby4gSXQncyBub3cgc2FmZSB0byByZW1vdmUgdGhpcyBjb2RlIGZyb20g
c29mdCByZXNldApwYXRoIC0gZXhpc3Rpbmcgc3lzdGVtcyB3aXRoIG9sZCBRRU1VIHNob3VsZCBi
ZSBhYmxlIHRvIHdvcmsgYXMKZXZlbiBpZiB0aGVyZSBhcmUgSU9SRVEgc2VydmVycyBsZWZ0IGJl
aGluZCwgYSBuZXcgUUVNVSBpbnN0YW5jZSB3aWxsCm92ZXJyaWRlIGl0cyByYW5nZXMgYW55d2F5
LgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5j
b20+Ci0tLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgfCAyIC0tCiB4ZW4vYXJjaC94
ODYvaHZtL2h2bS5jICAgICAgICB8IDUgLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2
bS5oIHwgMSAtCiAzIGZpbGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IDJkZjMx
MjMuLjk1N2YwNTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4v
YXJjaC94ODYvZG9tYWluLmMKQEAgLTcxMyw4ICs3MTMsNiBAQCBpbnQgYXJjaF9kb21haW5fc29m
dF9yZXNldChzdHJ1Y3QgZG9tYWluICpkKQogICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgKQog
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAotICAgIGh2bV9kb21haW5fc29mdF9yZXNldChkKTsK
LQogICAgIHNwaW5fbG9jaygmZC0+ZXZlbnRfbG9jayk7CiAgICAgZm9yICggaSA9IDA7IGkgPCBk
LT5ucl9waXJxcyA7IGkrKyApCiAgICAgewpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9o
dm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggMDI5ZWVhMy4uMmI4MTg5OSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2
bS5jCkBAIC01MDQ1LDExICs1MDQ1LDYgQEAgdm9pZCBodm1fdG9nZ2xlX3NpbmdsZXN0ZXAoc3Ry
dWN0IHZjcHUgKnYpCiAgICAgdi0+YXJjaC5odm0uc2luZ2xlX3N0ZXAgPSAhdi0+YXJjaC5odm0u
c2luZ2xlX3N0ZXA7CiB9CiAKLXZvaWQgaHZtX2RvbWFpbl9zb2Z0X3Jlc2V0KHN0cnVjdCBkb21h
aW4gKmQpCi17Ci0gICAgaHZtX2Rlc3Ryb3lfYWxsX2lvcmVxX3NlcnZlcnMoZCk7Ci19Ci0KIC8q
CiAgKiBTZWdtZW50IGNhY2hlcyBpbiBWTUNCL1ZNQ1MgYXJlIGluY29uc2lzdGVudCBhYm91dCB3
aGljaCBiaXRzIGFyZSBjaGVja2VkLAogICogaW1wb3J0YW50LCBhbmQgcHJlc2VydmVkIGFjcm9z
cyB2bWVudHJ5L2V4aXQuICBDb29rIHRoZSB2YWx1ZXMgdG8gbWFrZSB0aGVtCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZt
L2h2bS5oCmluZGV4IGIzMjdiZDIuLjRlNzJkMDcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL2h2bS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCkBAIC0y
NDAsNyArMjQwLDYgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgKnN0
YXJ0X3ZteCh2b2lkKTsKIGludCBodm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAq
ZCk7CiB2b2lkIGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAq
ZCk7CiB2b2lkIGh2bV9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKTsKLXZvaWQgaHZt
X2RvbWFpbl9zb2Z0X3Jlc2V0KHN0cnVjdCBkb21haW4gKmQpOwogCiBpbnQgaHZtX3ZjcHVfaW5p
dGlhbGlzZShzdHJ1Y3QgdmNwdSAqdik7CiB2b2lkIGh2bV92Y3B1X2Rlc3Ryb3koc3RydWN0IHZj
cHUgKnYpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
