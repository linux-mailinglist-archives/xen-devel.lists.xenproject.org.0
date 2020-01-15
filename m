Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B194113C505
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 15:12:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irjLb-00089w-LG; Wed, 15 Jan 2020 14:08:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irjLa-00089o-51
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 14:08:38 +0000
X-Inumbo-ID: 80ecd2b0-37a0-11ea-a985-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80ecd2b0-37a0-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579097309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hbq8BHfgdtDGtf86seymLljKshy7O24Ai0a+x1oKtrM=;
 b=S+s8XAoAKXB3NK44MjRcn8OnJ41YG4p9rwKD5vjxLVOUV3osGONJJKi1
 8Br+7b3f3iG6mKt+CqA8z8XzLzccklEYAEe+FtqSVZI7DqRvn7IDmNKNx
 1mZvzdr9JzIHZellO4J6AH34+MPyUE+ywgoDWB0TkNkmfGMnUgK1dI6Gu o=;
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
IronPort-SDR: N2bQjM6ClfgHvJzQroBknt4fuRoLdPQB9XiYJXHeCrsggIBBXuhZQTWy7gu4kLqf0oDhFCwvov
 pYMGNiaEBjDnW3LVs9NRhOqtBhU2rMgZl9LOpP91RZE7afYrvwQULsaIH6+OkSOrWg9tyX/hO3
 2GeE1MHIvA5n0oh8/mKdCkT+4hOBdQk/3kzI3CR+11tLGxpW+0bMEdupeTdYJXasN1utyWG0N6
 DS0ItoAyjFgwxLFUAh+KtN+qye1y9ZDBusCjDyzbATqmnraYp8wurAGF2n0bbxMY6eZrn3ugqk
 wdY=
X-SBRS: 2.7
X-MesageID: 11374950
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11374950"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 15 Jan 2020 14:08:01 +0000
Message-ID: <20200115140801.29321-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113175020.32730-4-andrew.cooper3@citrix.com>
References: <20200113175020.32730-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/4] x86/page: Remove bifurcated
 PAGE_HYPERVISOR constant
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

RGVzcGl0ZSBiZWluZyB2YWd1ZWx5IGF3YXJlLCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIFBBR0Vf
SFlQRVJWSVNPUiBpbiBBU00gYW5kCkMgY29kZSBoYXMgbmV2ZXJ0aGVsZXNzIGNhdXNlZCBzZXZl
cmFsIGJ1Z3MgSSBzaG91bGQgaGF2ZSBrbm93biBiZXR0ZXIgYWJvdXQsCmFuZCBjb250cmlidXRl
ZCB0byByZXZpZXcgY29uZnVzaW9uLgoKVGhlcmUgYXJlIGV4YWN0bHkgNCB1c2VzIG9mIHRoZXNl
IGNvbnN0YW50cyBpbiBhc20gY29kZSAoYW5kIG9uZSBpcyBzaG9ydGx5CmdvaW5nIHRvIGRpc2Fw
cGVhcikuCgpJbnN0ZWFkIG9mIGNyZWF0aW5nIHRoZSBjb25zdGFudHMgd2hpY2ggYmVoYXZlIGRp
ZmZlcmVudGx5IGJldHdlZW4gQVNNIGFuZCBDCmNvZGUsIGV4cG9zZSBhbGwgdGhlIGNvbnN0YW50
cyBhbmQgdXNlIG5vbi1hbWJpZ3VvdXMgbm9uLU5YIG9uZXMgaW4gQVNNLgpBZGp1c3QgdGhlIGhp
ZGluZyB0byBqdXN0IF9QQUdFX05YLCB3aGljaCBjb250YWlucyBhIEMgdGVybmFyeSBleHByZXNz
aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cgp2MjoKICogSGlkZSBfUEFHRV9OWAotLS0KIHhlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyAgICAg
ICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyAgICAgICAgfCAgNiArKyst
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcGFnZS5oICAgICAgICB8ICA0ICsrKysKIHhlbi9pbmNs
dWRlL2FzbS14ODYveDg2XzY0L3BhZ2UuaCB8IDE3ICsrKysrLS0tLS0tLS0tLS0tCiA0IGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwppbmRl
eCBkMjQ2ZTM3NGYxLi41NjNiYjE5MDU2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9o
ZWFkLlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCkBAIC02NzQsNyArNjc0LDcgQEAg
dHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAgICogdGhlIHRyYW5zaXRpb24gaW50byBsb25nIG1v
ZGUpLCB1c2luZyAyTSBzdXBlcnBhZ2VzLgogICAgICAgICAgKi8KICAgICAgICAgbGVhICAgICBz
eW1fZXNpKHN0YXJ0KSwlZWJ4Ci0gICAgICAgIGxlYSAgICAgKDE8PEwyX1BBR0VUQUJMRV9TSElG
VCkqNysoUEFHRV9IWVBFUlZJU09SfF9QQUdFX1BTRSkoJWVieCksJWVheAorICAgICAgICBsZWEg
ICAgICgxPDxMMl9QQUdFVEFCTEVfU0hJRlQpKjcrKFBBR0VfSFlQRVJWSVNPUl9SV1h8X1BBR0Vf
UFNFKSglZWJ4KSwlZWF4CiAgICAgICAgIHNociAgICAgJChMMl9QQUdFVEFCTEVfU0hJRlQtMyks
JWVieAogICAgICAgICBtb3YgICAgICQ4LCVlY3gKIDE6ICAgICAgbW92ICAgICAlZWF4LHN5bV9m
cyhsMl9ib290bWFwKS04KCVlYngsJWVjeCw4KQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jv
b3QveDg2XzY0LlMgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwppbmRleCBhZjYyODUwNTg5
Li42NjJjOGI3ZWFkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUworKysg
Yi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpAQCAtNTYsOSArNTYsOSBAQCBsMV9pZGVudG1h
cDoKICAgICAgICAgLnJlcHQgTDFfUEFHRVRBQkxFX0VOVFJJRVMKICAgICAgICAgLyogVkdBIGhv
bGUgKDB4YTAwMDAtMHhjMDAwMCkgc2hvdWxkIGJlIG1hcHBlZCBVQy0uICovCiAgICAgICAgIC5p
ZiBwZm4gPj0gMHhhMCAmJiBwZm4gPCAweGMwCi0gICAgICAgIC5xdWFkIChwZm4gPDwgUEFHRV9T
SElGVCkgfCBQQUdFX0hZUEVSVklTT1JfVUNNSU5VUyB8IE1BUF9TTUFMTF9QQUdFUworICAgICAg
ICAucXVhZCAocGZuIDw8IFBBR0VfU0hJRlQpIHwgX19QQUdFX0hZUEVSVklTT1JfVUNNSU5VUyB8
IF9QQUdFX0dMT0JBTCB8IE1BUF9TTUFMTF9QQUdFUwogICAgICAgICAuZWxzZQotICAgICAgICAu
cXVhZCAocGZuIDw8IFBBR0VfU0hJRlQpIHwgUEFHRV9IWVBFUlZJU09SIHwgTUFQX1NNQUxMX1BB
R0VTCisgICAgICAgIC5xdWFkIChwZm4gPDwgUEFHRV9TSElGVCkgfCBQQUdFX0hZUEVSVklTT1Jf
UldYIHwgTUFQX1NNQUxMX1BBR0VTCiAgICAgICAgIC5lbmRpZgogICAgICAgICBwZm4gPSBwZm4g
KyAxCiAgICAgICAgIC5lbmRyCkBAIC04OSw3ICs4OSw3IEBAIEdMT0JBTChsMl94ZW5tYXApCiAg
ICAgICAgIC5xdWFkIDAKICAgICAgICAgaWR4ID0gMQogICAgICAgICAucmVwdCA3Ci0gICAgICAg
IC5xdWFkIHN5bV9vZmZzKF9faW1hZ2VfYmFzZV9fKSArIChpZHggPDwgTDJfUEFHRVRBQkxFX1NI
SUZUKSArIChQQUdFX0hZUEVSVklTT1IgfCBfUEFHRV9QU0UpCisgICAgICAgIC5xdWFkIHN5bV9v
ZmZzKF9faW1hZ2VfYmFzZV9fKSArIChpZHggPDwgTDJfUEFHRVRBQkxFX1NISUZUKSArIChQQUdF
X0hZUEVSVklTT1JfUldYIHwgX1BBR0VfUFNFKQogICAgICAgICBpZHggPSBpZHggKyAxCiAgICAg
ICAgIC5lbmRyCiAgICAgICAgIC5maWxsIEwyX1BBR0VUQUJMRV9FTlRSSUVTIC0gOCwgOCwgMApk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L3BhZ2UuaAppbmRleCAwNWE4YjFlZmE2Li5hM2M3NmE0MDNiIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L3BhZ2UuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaApA
QCAtMzE2LDcgKzMxNiwxMSBAQCB2b2lkIGVmaV91cGRhdGVfbDRfcGd0YWJsZSh1bnNpZ25lZCBp
bnQgbDRpZHgsIGw0X3BnZW50cnlfdCk7CiAjZGVmaW5lIF9QQUdFX0FWQUlMICAgIF9BQygweEUw
MCxVKQogI2RlZmluZSBfUEFHRV9QU0VfUEFUICBfQUMoMHgxMDAwLFUpCiAjZGVmaW5lIF9QQUdF
X0FWQUlMX0hJR0ggKF9BQygweDdmZiwgVSkgPDwgMTIpCisKKyNpZm5kZWYgX19BU1NFTUJMWV9f
CisvKiBEZXBlbmRlbmN5IG9uIE5YIGJlaW5nIGF2YWlsYWJsZSBjYW4ndCBiZSBleHByZXNzZWQu
ICovCiAjZGVmaW5lIF9QQUdFX05YICAgICAgIChjcHVfaGFzX254ID8gX1BBR0VfTlhfQklUIDog
MCkKKyNlbmRpZgogCiAjZGVmaW5lIFBBR0VfQ0FDSEVfQVRUUlMgKF9QQUdFX1BBVCB8IF9QQUdF
X1BDRCB8IF9QQUdFX1BXVCkKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni94ODZf
NjQvcGFnZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni94ODZfNjQvcGFnZS5oCmluZGV4IDRmZTAy
MDU1NTMuLjk4NzY2MzQ4ODEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2XzY0
L3BhZ2UuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3g4Nl82NC9wYWdlLmgKQEAgLTE3Miwx
OCArMTcyLDExIEBAIHN0YXRpYyBpbmxpbmUgaW50cHRlX3QgcHV0X3B0ZV9mbGFncyh1bnNpZ25l
ZCBpbnQgeCkKICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JYICAgICAgKF9fUEFHRV9IWVBFUlZJ
U09SX1JYICAgICAgfCBfUEFHRV9HTE9CQUwpCiAjZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9SV1gg
ICAgIChfX1BBR0VfSFlQRVJWSVNPUiAgICAgICAgIHwgX1BBR0VfR0xPQkFMKQogCi0jaWZkZWYg
X19BU1NFTUJMWV9fCi0vKiBEZXBlbmRlbmN5IG9uIE5YIGJlaW5nIGF2YWlsYWJsZSBjYW4ndCBi
ZSBleHByZXNzZWQuICovCi0jIGRlZmluZSBQQUdFX0hZUEVSVklTT1IgICAgICAgICBQQUdFX0hZ
UEVSVklTT1JfUldYCi0jIGRlZmluZSBQQUdFX0hZUEVSVklTT1JfVUNNSU5VUyAoX19QQUdFX0hZ
UEVSVklTT1JfVUNNSU5VUyB8IF9QQUdFX0dMT0JBTCkKLSMgZGVmaW5lIFBBR0VfSFlQRVJWSVNP
Ul9VQyAgICAgIChfX1BBR0VfSFlQRVJWSVNPUl9VQyAgICAgIHwgX1BBR0VfR0xPQkFMKQotI2Vs
c2UKLSMgZGVmaW5lIFBBR0VfSFlQRVJWSVNPUiAgICAgICAgIFBBR0VfSFlQRVJWSVNPUl9SVwot
IyBkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1VDTUlOVVMgKF9fUEFHRV9IWVBFUlZJU09SX1VDTUlO
VVMgfCBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX1BBR0VfR0xPQkFMIHwg
X1BBR0VfTlgpCi0jIGRlZmluZSBQQUdFX0hZUEVSVklTT1JfVUMgICAgICAoX19QQUdFX0hZUEVS
VklTT1JfVUMgfCBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX1BBR0VfR0xP
QkFMIHwgX1BBR0VfTlgpCi0jZW5kaWYKKyNkZWZpbmUgUEFHRV9IWVBFUlZJU09SICAgICAgICAg
UEFHRV9IWVBFUlZJU09SX1JXCisjZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9VQ01JTlVTIChfX1BB
R0VfSFlQRVJWSVNPUl9VQ01JTlVTIHwgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgX1BBR0VfR0xPQkFMIHwgX1BBR0VfTlgpCisjZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9VQyAg
ICAgIChfX1BBR0VfSFlQRVJWSVNPUl9VQyB8IFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9QQUdFX0dMT0JBTCB8IF9QQUdFX05YKQogCiAjZW5kaWYgLyogX19YODZfNjRfUEFH
RV9IX18gKi8KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
