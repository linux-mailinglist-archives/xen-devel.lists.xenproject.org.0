Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B41820F6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 19:38:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC6C9-00023m-Ba; Wed, 11 Mar 2020 18:35:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lh2M=44=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jC6C7-00023h-QW
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 18:35:03 +0000
X-Inumbo-ID: 035a2cab-63c7-11ea-b048-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 035a2cab-63c7-11ea-b048-12813bfff9fa;
 Wed, 11 Mar 2020 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583951700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vN3MrrVLsdG0ZXZ0Rb8ZSmg8dcJzfgGu3sWyXZg2pG8=;
 b=NznS6QNE0PLET+R7MFJhOZcT++R4l729NECa3V4H7zoV1B4axLSCRWcm
 ET2NHztSy3H+AIPrTadwobfBdXwL/PXeiz4VyJ3Hg+d6T0H9XZvcgQYV8
 QUj0SLaqpcof3OlpC2IVcZlw34SSxYlxCP0B2NYgzcPrTgdtfXOgmfl5I A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IyzGp3cfeIZFUNXD+cf2kmPk/xs0P+vUSoU+S09aNcidd3R4Y/4AKOQa1dUeOXZtCVSPJ7K+2b
 r4vBP1GG394rhZjmy9eS4ero6fkA009ohWYlspM25UKSFNaOLXwSYEClnh99PuSbNyRsVkuJHp
 kFpC5BmqQGQvjmtU9JECBu2OveoS6pc8gOpBsL1qRvJBZFclmwMJ4Xiy0Cw3VqlAblp7g9BfIF
 veRRmB+PaK7QRAPgm7r/T3KtOT7myYYOgpd3/wHs94NsSluGyx9hb8CGnsGJiHddKBabF6ktG3
 QsE=
X-SBRS: 2.7
X-MesageID: 14211912
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14211912"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 18:34:55 +0000
Message-ID: <20200311183455.23729-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap merging
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
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIGM0Nzk4NGFhYmVhZCAibnZteDogaW1wbGVtZW50IHN1cHBvcnQgZm9yIE1TUiBiaXRtYXBz
IiBpbnRyb2R1Y2VkIGEgdXNlIG9mCm1hcF9kb21haW5fcGFnZSgpIHdoaWNoIG1heSBnZXQgdXNl
ZCBpbiB0aGUgbWlkZGxlIG9mIGNvbnRleHQgc3dpdGNoLgoKVGhpcyBpcyBub3Qgc2FmZSwgYW5k
IGNhdXNlcyBYZW4gdG8gZGVhZGxvY2sgb24gdGhlIG1hcGNhY2hlIGxvY2s6CgogIChYRU4pIFhl
biBjYWxsIHRyYWNlOgogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIyZDZhZT5dIFIgX3NwaW5fbG9j
aysweDM0LzB4NWUKICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMjE5ZDc+XSBGIG1hcF9kb21haW5f
cGFnZSsweDI1MC8weDUyNwogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDM1NjMzMj5dIEYgZG9fcGFn
ZV9mYXVsdCsweDQyMC8weDc4MAogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDM4ZGEzZD5dIEYgeDg2
XzY0L2VudHJ5LlMjaGFuZGxlX2V4Y2VwdGlvbl9zYXZlZCsweDY4LzB4OTQKICAoWEVOKSAgICBb
PGZmZmY4MmQwODAzMTcyOWY+XSBGIF9fZmluZF9uZXh0X3plcm9fYml0KzB4MjgvMHg2OQogIChY
RU4pICAgIFs8ZmZmZjgyZDA4MDMyMWE0ZD5dIEYgbWFwX2RvbWFpbl9wYWdlKzB4MmM2LzB4NTI3
CiAgKFhFTikgICAgWzxmZmZmODJkMDgwMjllZWIyPl0gRiBudm14X3VwZGF0ZV9leGVjX2NvbnRy
b2wrMHgxZDcvMHgzMjMKICAoWEVOKSAgICBbPGZmZmY4MmQwODAyOTlmNWE+XSBGIHZteF91cGRh
dGVfY3B1X2V4ZWNfY29udHJvbCsweDIzLzB4NDAKICAoWEVOKSAgICBbPGZmZmY4MmQwODAyOWEz
Zjc+XSBGIGFyY2gveDg2L2h2bS92bXgvdm14LmMjdm14X2N0eHRfc3dpdGNoX2Zyb20rMHhiNy8w
eDEyMQogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMxZDc5Nj5dIEYgYXJjaC94ODYvZG9tYWluLmMj
X19jb250ZXh0X3N3aXRjaCsweDEyNC8weDRhOQogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMyMDky
NT5dIEYgY29udGV4dF9zd2l0Y2grMHgxNTQvMHg2MmMKICAoWEVOKSAgICBbPGZmZmY4MmQwODAy
NTJmM2U+XSBGIGNvbW1vbi9zY2hlZC9jb3JlLmMjc2NoZWRfY29udGV4dF9zd2l0Y2grMHgxNmEv
MHgxNzUKICAoWEVOKSAgICBbPGZmZmY4MmQwODAyNTM4Nzc+XSBGIGNvbW1vbi9zY2hlZC9jb3Jl
LmMjc2NoZWR1bGUrMHgyYWQvMHgyYmMKICAoWEVOKSAgICBbPGZmZmY4MmQwODAyMmNjOTc+XSBG
IGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4YjcvMHhjOAogIChYRU4pICAgIFs8ZmZm
ZjgyZDA4MDIyY2QzOD5dIEYgZG9fc29mdGlycSsweDE4LzB4MWEKICAoWEVOKSAgICBbPGZmZmY4
MmQwODAyYTJmYmI+XSBGIHZteF9hc21fZG9fdm1lbnRyeSsweDJiLzB4MzAKCkNvbnZlcnQgdGhl
IGRvbWhlYXAgcGFnZSBpbnRvIGJlaW5nIGEgeGVuaGVhcCBwYWdlLgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KCkkgc3VzcGVjdCB0aGlzIGlzIHRoZSBub3QtcXVpdGUtY29uc2lz
dGVudC1lbm91Z2gtdG8tYmlzZWN0IGlzc3VlIHdoaWNoCk9TU1Rlc3QgaXMgaGl0dGluZyBhbmQg
aW50ZXJmZXJpbmcgd2l0aCBwdXNoZXMgdG8gbWFzdGVyLgotLS0KIHhlbi9hcmNoL3g4Ni9odm0v
dm14L3Z2bXguYyAgICAgICAgfCAxOSArKysrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS92bXgvdnZteC5oIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKaW5kZXggOTI2YTExYzE1Zi4u
ZjA0OTkyMDE5NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwpAQCAtMTMwLDEyICsxMzAsOSBAQCBpbnQgbnZt
eF92Y3B1X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCiAKICAgICBpZiAoIGNwdV9oYXNfdm14
X21zcl9iaXRtYXAgKQogICAgIHsKLSAgICAgICAgbnZteC0+bXNyX21lcmdlZCA9IGFsbG9jX2Rv
bWhlYXBfcGFnZShkLCBNRU1GX25vX293bmVyKTsKKyAgICAgICAgbnZteC0+bXNyX21lcmdlZCA9
IGFsbG9jX3hlbmhlYXBfcGFnZSgpOwogICAgICAgICBpZiAoICFudm14LT5tc3JfbWVyZ2VkICkK
LSAgICAgICAgewotICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIm5lc3Q6IGFsbG9j
YXRpb24gZm9yIE1TUiBiaXRtYXAgZmFpbGVkXG4iKTsKICAgICAgICAgICAgIHJldHVybiAtRU5P
TUVNOwotICAgICAgICB9CiAgICAgfQogCiAgICAgbnZteC0+ZXB0LmVuYWJsZWQgPSAwOwpAQCAt
MTk4LDExICsxOTUsNyBAQCBzdGF0aWMgdm9pZCB2Y3B1X3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0
cnVjdCB2Y3B1ICp2KQogewogICAgIHN0cnVjdCBuZXN0ZWR2bXggKm52bXggPSAmdmNwdV8yX252
bXgodik7CiAKLSAgICBpZiAoIG52bXgtPm1zcl9tZXJnZWQgKQotICAgIHsKLSAgICAgICAgZnJl
ZV9kb21oZWFwX3BhZ2UobnZteC0+bXNyX21lcmdlZCk7Ci0gICAgICAgIG52bXgtPm1zcl9tZXJn
ZWQgPSBOVUxMOwotICAgIH0KKyAgICBGUkVFX1hFTkhFQVBfUEFHRShudm14LT5tc3JfbWVyZ2Vk
KTsKIH0KIAogdm9pZCBudm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3QgZG9t
YWluICpkKQpAQCAtNTc1LDE0ICs1NjgsMTIgQEAgdW5zaWduZWQgbG9uZyAqX3NoYWRvd19pb19i
aXRtYXAoc3RydWN0IHZjcHUgKnYpCiBzdGF0aWMgdm9pZCB1cGRhdGVfbXNyYml0bWFwKHN0cnVj
dCB2Y3B1ICp2LCB1aW50MzJfdCBzaGFkb3dfY3RybCkKIHsKICAgICBzdHJ1Y3QgbmVzdGVkdm14
ICpudm14ID0gJnZjcHVfMl9udm14KHYpOwotICAgIHN0cnVjdCB2bXhfbXNyX2JpdG1hcCAqbXNy
X2JpdG1hcDsKKyAgICBzdHJ1Y3Qgdm14X21zcl9iaXRtYXAgKm1zcl9iaXRtYXAgPSBudm14LT5t
c3JfbWVyZ2VkOwogCiAgICAgaWYgKCAhKHNoYWRvd19jdHJsICYgQ1BVX0JBU0VEX0FDVElWQVRF
X01TUl9CSVRNQVApIHx8CiAgICAgICAgICAhbnZteC0+bXNyYml0bWFwICkKICAgICAgICByZXR1
cm47CiAKLSAgICBtc3JfYml0bWFwID0gX19tYXBfZG9tYWluX3BhZ2UobnZteC0+bXNyX21lcmdl
ZCk7Ci0KICAgICBiaXRtYXBfb3IobXNyX2JpdG1hcC0+cmVhZF9sb3csIG52bXgtPm1zcmJpdG1h
cC0+cmVhZF9sb3csCiAgICAgICAgICAgICAgIHYtPmFyY2guaHZtLnZteC5tc3JfYml0bWFwLT5y
ZWFkX2xvdywKICAgICAgICAgICAgICAgc2l6ZW9mKG1zcl9iaXRtYXAtPnJlYWRfbG93KSAqIDgp
OwpAQCAtNjAzLDkgKzU5NCw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9tc3JiaXRtYXAoc3RydWN0
IHZjcHUgKnYsIHVpbnQzMl90IHNoYWRvd19jdHJsKQogICAgIGJpdG1hcF9zZXQobXNyX2JpdG1h
cC0+cmVhZF9sb3csIE1TUl9YMkFQSUNfRklSU1QsIDB4MTAwKTsKICAgICBiaXRtYXBfc2V0KG1z
cl9iaXRtYXAtPndyaXRlX2xvdywgTVNSX1gyQVBJQ19GSVJTVCwgMHgxMDApOwogCi0gICAgdW5t
YXBfZG9tYWluX3BhZ2UobXNyX2JpdG1hcCk7Ci0KLSAgICBfX3Ztd3JpdGUoTVNSX0JJVE1BUCwg
cGFnZV90b19tYWRkcihudm14LT5tc3JfbWVyZ2VkKSk7CisgICAgX192bXdyaXRlKE1TUl9CSVRN
QVAsIHZpcnRfdG9fbWFkZHIobnZteC0+bXNyX21lcmdlZCkpOwogfQogCiB2b2lkIG52bXhfdXBk
YXRlX2V4ZWNfY29udHJvbChzdHJ1Y3QgdmNwdSAqdiwgdTMyIGhvc3RfY250cmwpCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdnZteC5oIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vdm14L3Z2bXguaAppbmRleCBjNDFmMDg5OTM5Li5kNWY2OGYzMGIxIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdnZteC5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3ZteC92dm14LmgKQEAgLTM4LDcgKzM4LDcgQEAgc3RydWN0IG5lc3RlZHZt
eCB7CiAgICAgcGFkZHJfdCAgICB2bXhvbl9yZWdpb25fcGE7CiAgICAgdm9pZCAgICAgICAqaW9i
aXRtYXBbMl07CQkvKiBtYXAgKHZhKSBvZiBMMSBndWVzdCBJL08gYml0bWFwICovCiAgICAgc3Ry
dWN0IHZteF9tc3JfYml0bWFwICptc3JiaXRtYXA7CS8qIG1hcCAodmEpIG9mIEwxIGd1ZXN0IE1T
UiBiaXRtYXAgKi8KLSAgICBzdHJ1Y3QgcGFnZV9pbmZvICptc3JfbWVyZ2VkOwkvKiBtZXJnZWQg
TDEgYW5kIEwyIE1TUiBiaXRtYXAgKi8KKyAgICBzdHJ1Y3Qgdm14X21zcl9iaXRtYXAgKm1zcl9t
ZXJnZWQ7CS8qIG1lcmdlZCBMMSBhbmQgTDIgTVNSIGJpdG1hcCAqLwogICAgIC8qIGRlZmVycmVk
IG5lc3RlZCBpbnRlcnJ1cHQgKi8KICAgICBzdHJ1Y3QgewogICAgICAgICB1bnNpZ25lZCBsb25n
IGludHJfaW5mbzsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
