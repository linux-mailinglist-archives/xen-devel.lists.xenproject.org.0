Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9DAD724
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7H9Z-00054e-6S; Mon, 09 Sep 2019 10:44:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7H9X-00054U-KY
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:44:11 +0000
X-Inumbo-ID: c1a85386-d2ee-11e9-b76c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1a85386-d2ee-11e9-b76c-bc764e2007e4;
 Mon, 09 Sep 2019 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568025851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pbzWSKaX+Wm3RY+4CLESZ4ZMerCguRXM3oPuyvc0cdM=;
 b=Owh/Tp700t+/ju2tkjFSLU+q5p7zqPxupm7Y8WH/ckr8fZ4yhoCBpUGC
 TwFgov6RwznJtZ7g8Lo4FIcQkHvxnPITM44FLzX+TnjDliw/I8f/GGx3k
 M3x5q1wi2gtH+DGMUo5o5qbU5N4pbxLzruAmlZzwBwVWfJkvcOaV85Nnf c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jSImWnGeiga63TUO9HlVbQ7MTI83V3aEEWY5U465QQk9RvvW/JDZWFNZcXMVNrysM87M9bLWl2
 5bhmFOWoUWiDaERtk6XAgr0l6pzJf0Tv14FEr1aK9tZuQ6V87+K9O3tZPfAYSDc0dGAOKbeAxl
 Yprs5w8oeOHV+bLjfDnTFGDN/ta6Gq1ljH/HZviE7+LDDujzzl6/pWqgohM1y/rSaXUK4edKzN
 6qfONE2axwJKfnQK2FfR7WOxZxxWmFaPN2wMS+9B1vqcea4mdfC1cPNH6aiKtvCdCqvzOUkFSU
 9OQ=
X-SBRS: 2.7
X-MesageID: 5307168
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5307168"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 11:44:07 +0100
Message-ID: <20190909104407.13666-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86: Misc trivial cleanup of bootsym_phys()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gc21wYm9vdCwgdGhlcmUgaXMgbm8gbmVlZCB0byBhYnN0cmFjdCBzZXR1cF90cmFtcG9saW5l
KCkgYXdheS4gIERyb3AgdGhlCmRlZmluZSBhbmQgdXNlIGJvb3RzeW1fcGh5cygpIGRpcmVjdGx5
LgoKSW4gdGJvb3QsIHRoZSAzIHNpemUgY2FsY3VsYXRpb25zIGFyZSBpbnZhcmlhbnQgb2YgdGhl
aXIgYm9vdHN5bV9waHlzKCkvX19wYSgpCnRyYW5zZm9ybWF0aW9ucywgYnV0IHRoZSBjb21waWxl
ciBjYW4ndCB0ZWxsIHRoaXMuICBEcm9wIHRoZSB0cmFuZm9ybWF0aW9ucywKd2hpY2ggc2ltcGxp
ZmllcyB0aGUgY29tcGlsZWQgZnVuY3Rpb24uCgogIGFkZC9yZW1vdmU6IDAvMCBncm93L3Nocmlu
azogMC8xIHVwL2Rvd246IDAvLTEzNCAoLTEzNCkKICBGdW5jdGlvbiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCiAgdGJvb3Rfc2h1dGRvd24g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNjIwICAgICA0ODYgICAgLTEzNAogIFRvdGFs
OiBCZWZvcmU9MzMzNzA0MiwgQWZ0ZXI9MzMzNjkwOCwgY2hnIC0wLjAwJQoKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBMdWthc3ogSGF3cnls
a28gPGx1a2Fzei5oYXdyeWxrb0BsaW51eC5pbnRlbC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3Nt
cGJvb3QuYyB8IDQgKy0tLQogeGVuL2FyY2gveDg2L3Rib290LmMgICB8IDkgKysrLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRl
eCA5MTE0MTZjMWUxLi42OTA0ZWY1NzcxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTQ2LDggKzQ2LDYgQEAKICNpbmNs
dWRlIDxhc20vdGJvb3QuaD4KICNpbmNsdWRlIDxtYWNoX2FwaWMuaD4KIAotI2RlZmluZSBzZXR1
cF90cmFtcG9saW5lKCkgICAgKGJvb3RzeW1fcGh5cyh0cmFtcG9saW5lX3JlYWxtb2RlX2VudHJ5
KSkKLQogdW5zaWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IHRyYW1wb2xpbmVfcGh5czsKIAogLyog
cmVwcmVzZW50aW5nIEhUIHNpYmxpbmdzIG9mIGVhY2ggbG9naWNhbCBDUFUgKi8KQEAgLTU0NSw3
ICs1NDMsNyBAQCBzdGF0aWMgaW50IGRvX2Jvb3RfY3B1KGludCBhcGljaWQsIGludCBjcHUpCiAK
ICAgICBib290aW5nX2NwdSA9IGNwdTsKIAotICAgIHN0YXJ0X2VpcCA9IHNldHVwX3RyYW1wb2xp
bmUoKTsKKyAgICBzdGFydF9laXAgPSBib290c3ltX3BoeXModHJhbXBvbGluZV9yZWFsbW9kZV9l
bnRyeSk7CiAKICAgICAvKiBzdGFydF9laXAgbmVlZHMgYmUgcGFnZSBhbGlnbmVkLCBhbmQgYmVs
b3cgdGhlIDFNIGJvdW5kYXJ5LiAqLwogICAgIGlmICggc3RhcnRfZWlwICYgfjB4ZmYwMDAgKQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3Rib290LmMgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwpp
bmRleCA4MjYzZjI0MDA5Li4zZTgyOGZlMjA0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGJv
b3QuYworKysgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwpAQCAtMzcwLDE2ICszNzAsMTMgQEAgdm9p
ZCB0Ym9vdF9zaHV0ZG93bih1aW50MzJfdCBzaHV0ZG93bl90eXBlKQogICAgICAgICBnX3Rib290
X3NoYXJlZC0+bnVtX21hY19yZWdpb25zID0gMzsKICAgICAgICAgLyogUzMgcmVzdW1lIGNvZGUg
KGFuZCBvdGhlciByZWFsIG1vZGUgdHJhbXBvbGluZSBjb2RlKSAqLwogICAgICAgICBnX3Rib290
X3NoYXJlZC0+bWFjX3JlZ2lvbnNbMF0uc3RhcnQgPSBib290c3ltX3BoeXModHJhbXBvbGluZV9z
dGFydCk7Ci0gICAgICAgIGdfdGJvb3Rfc2hhcmVkLT5tYWNfcmVnaW9uc1swXS5zaXplID0gYm9v
dHN5bV9waHlzKHRyYW1wb2xpbmVfZW5kKSAtCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYm9vdHN5bV9waHlzKHRyYW1wb2xpbmVfc3RhcnQpOworICAgICAg
ICBnX3Rib290X3NoYXJlZC0+bWFjX3JlZ2lvbnNbMF0uc2l6ZSA9IHRyYW1wb2xpbmVfZW5kIC0g
dHJhbXBvbGluZV9zdGFydDsKICAgICAgICAgLyogaHlwZXJ2aXNvciAudGV4dCArIC5yb2RhdGEg
Ki8KICAgICAgICAgZ190Ym9vdF9zaGFyZWQtPm1hY19yZWdpb25zWzFdLnN0YXJ0ID0gKHVpbnQ2
NF90KV9fcGEoJl9zdGV4dCk7Ci0gICAgICAgIGdfdGJvb3Rfc2hhcmVkLT5tYWNfcmVnaW9uc1sx
XS5zaXplID0gX19wYSgmX18yTV9yb2RhdGFfZW5kKSAtCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgX19wYSgmX3N0ZXh0KTsKKyAgICAgICAgZ190Ym9vdF9z
aGFyZWQtPm1hY19yZWdpb25zWzFdLnNpemUgPSBfXzJNX3JvZGF0YV9lbmQgLSBfc3RleHQ7CiAg
ICAgICAgIC8qIGh5cGVydmlzb3IgLmRhdGEgKyAuYnNzICovCiAgICAgICAgIGdfdGJvb3Rfc2hh
cmVkLT5tYWNfcmVnaW9uc1syXS5zdGFydCA9ICh1aW50NjRfdClfX3BhKCZfXzJNX3J3ZGF0YV9z
dGFydCk7Ci0gICAgICAgIGdfdGJvb3Rfc2hhcmVkLT5tYWNfcmVnaW9uc1syXS5zaXplID0gX19w
YSgmX18yTV9yd2RhdGFfZW5kKSAtCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX19wYSgmX18yTV9yd2RhdGFfc3RhcnQpOworICAgICAgICBnX3Rib290X3No
YXJlZC0+bWFjX3JlZ2lvbnNbMl0uc2l6ZSA9IF9fMk1fcndkYXRhX2VuZCAtIF9fMk1fcndkYXRh
X3N0YXJ0OwogCiAgICAgICAgIC8qCiAgICAgICAgICAqIE1BQyBkb21haW5zIGFuZCBvdGhlciBY
ZW4gbWVtb3J5Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
