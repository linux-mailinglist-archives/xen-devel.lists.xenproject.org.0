Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559213981D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:53:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3rH-0004k8-87; Mon, 13 Jan 2020 17:50:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A39C=3C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ir3rG-0004jo-8z
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:50:34 +0000
X-Inumbo-ID: 2dff957a-362d-11ea-82bc-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dff957a-362d-11ea-82bc-12813bfff9fa;
 Mon, 13 Jan 2020 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578937827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blPvpV4Vdhr1Ml+c0tj+WRYdVJH/SlanDf9zB304Cr0=;
 b=PyaonYw841JkRisfDlKX0r4v8FOP2l7WZyqASw2b4m0npCwSmKISIqk/
 tUR6X1MkHfuPL75Gb487Wk061DzGJ/2EMBrqnyDTA/WovMqVtxmNDm5w6
 FZz1Okx8OmfujskK8uYFIsgWfZ6qewybR1yyCIm6zAe+Vjf4YCceJEsHX 4=;
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
IronPort-SDR: dEOIVgsMGXwDsFMlshuJ+GkwkUIrqqn7JqLBaDK9VMvfsCCkKOPKreqvGvxCDBGF/dHd2m14OU
 haMUwuxfXdahumRLvnEQAVcmC7h3MlM8kTJGPI0ZKCdCdpgkAS6566Yu7xxa+KRTQ3g/AumxW6
 Ksj3+o5Xjc7cYqY8MG5Mcf0xa190JKMArCY6gCnc9KMRw6JNqAi8WdQbptmD0u1ngGBT21+lC+
 k8d1g3f4xWfRAgXw2Tb2uDeZllZtMSUqkkTm8Rc6XFA5ISePVOZQgeHqnckdWvwep2NuJU0+Nu
 cBo=
X-SBRS: 2.7
X-MesageID: 10841135
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="10841135"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:50:20 +0000
Message-ID: <20200113175020.32730-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113175020.32730-1-andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] x86/boot: Size the boot/directmap mappings
 dynamically
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

Li4uIHJhdGhlciB0aGFuIHByZXN1bWluZyB0aGF0IDE2TSB3aWxsIGRvLiAgV2l0aCB0aGlzIGZp
eGVkLCBYZW4gaXMgbm93CmNhcGFibGUgb2YgYm9vdGluZyBldmVuIHdoZW4gaXRzIGNvbXBpbGVk
IHNpemUgaXMgbGFyZ2VyIHRoYW4gMTZNLgoKT24gdGhlIEVGSSBzaWRlLCB1c2UgbDJlX2FkZF9m
bGFncygpIHRvIHJlZHVjZSB0aGUgY29kZS1nZW5lcmF0aW9uIG92ZXJoZWFkIG9mCnVzaW5nIGwy
ZV9mcm9tX3BhZGRyKCkgdHdpY2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KCkNhbiBiZSB0ZXN0ZWQgYnkgdHJ5aW5nIHRvIGJvb3Qgd2l0aDoK
CiAgZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVw
LmMKICBpbmRleCA3NTk4MjdhMTlhLi5mYTgzYTlhMjhmIDEwMDY0NAogIC0tLSBhL3hlbi9hcmNo
L3g4Ni9zZXR1cC5jCiAgKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKICBAQCAtNTIsNiArNTIs
OCBAQAogICAjaW5jbHVkZSA8YXNtL3NwZWNfY3RybC5oPgogICAjaW5jbHVkZSA8YXNtL2d1ZXN0
Lmg+CgogICtzdGF0aWMgdWludDhfdCBfX3VzZWQgYmlnX2RhdGFbTUIoMTYpXSA9IHsgNDIsIH07
CiAgKwogICAvKiBvcHRfbm9zbXA6IElmIHRydWUsIHNlY29uZGFyeSBwcm9jZXNzb3JzIGFyZSBp
Z25vcmVkLiAqLwogICBzdGF0aWMgYm9vbCBfX2luaXRkYXRhIG9wdF9ub3NtcDsKICAgYm9vbGVh
bl9wYXJhbSgibm9zbXAiLCBvcHRfbm9zbXApOwoKQmVmb3JlIHRoaXMgc2VyaWVzLCBYZW4gd2ls
bCB0cmlwbGUgZmF1bHQgaW4gb25lIG9mIHR3byBwbGFjZXMgKGJvdGggb24gdGhlCnRyYW5zaXRp
b24gdG8gWGVuJ3MgaGlnaCBtYXBwaW5ncyksIGJvdGggdWx0aW1hdGVseSBiZWNhdXNlIG9mIGNw
dTBfc3RhY2tbXQpnZXR0aW5nIHNoaWZ0ZWQgb2ZmIHRoZSB0b3Agb2YgdGhlIG1hcHBpbmdzLgot
LS0KIHhlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyAgICB8IDIxICsrKysrKysrKysrKystLS0tLS0t
LQogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oIHwgMjMgKysrKysrKysrKysrKysrKysrLS0t
LS0KIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAgICB8ICAzIC0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCAzMSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKaW5kZXggOTRiZWQ0
YTJkMy4uZWRhMzE2MWZiMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCisr
KyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwpAQCAtNjg3LDE0ICs2ODcsMTkgQEAgdHJhbXBv
bGluZV9zZXR1cDoKICAgICAgICAgICogaGFuZGxpbmcvd2Fsa2luZyksIGFuZCBpZGVudGl0eSBt
YXAgWGVuIGludG8gYm9vdG1hcCAobmVlZGVkIGZvcgogICAgICAgICAgKiB0aGUgdHJhbnNpdGlv
biBpbnRvIGxvbmcgbW9kZSksIHVzaW5nIDJNIHN1cGVycGFnZXMuCiAgICAgICAgICAqLwotICAg
ICAgICBsZWEgICAgIHN5bV9lc2koc3RhcnQpLCVlYngKLSAgICAgICAgbGVhICAgICAoMTw8TDJf
UEFHRVRBQkxFX1NISUZUKSo3KyhQQUdFX0hZUEVSVklTT1JfUldYfF9QQUdFX1BTRSkoJWVieCks
JWVheAotICAgICAgICBzaHIgICAgICQoTDJfUEFHRVRBQkxFX1NISUZULTMpLCVlYngKLSAgICAg
ICAgbW92ICAgICAkOCwlZWN4Ci0xOiAgICAgIG1vdiAgICAgJWVheCxzeW1fZnMobDJfYm9vdG1h
cCktOCglZWJ4LCVlY3gsOCkKLSAgICAgICAgbW92ICAgICAlZWF4LHN5bV9mcyhsMl9kaXJlY3Rt
YXApLTgoJWVieCwlZWN4LDgpCi0gICAgICAgIHN1YiAgICAgJCgxPDxMMl9QQUdFVEFCTEVfU0hJ
RlQpLCVlYXgKLSAgICAgICAgbG9vcCAgICAxYgorICAgICAgICBsZWEgICAgIHN5bV9lc2koX3N0
YXJ0KSwgJWVjeAorICAgICAgICBsZWEgICAgIC0xICsgc3ltX2VzaShfZW5kKSwgJWVkeAorICAg
ICAgICBsZWEgICAgIF9QQUdFX1BTRSArIFBBR0VfSFlQRVJWSVNPUl9SV1goJWVjeCksICVlYXgg
LyogUFRFIHRvIHdyaXRlLiAqLworICAgICAgICBzaHIgICAgICRMMl9QQUdFVEFCTEVfU0hJRlQs
ICVlY3ggICAgICAgICAgICAgICAgICAgLyogRmlyc3Qgc2xvdCB0byB3cml0ZS4gKi8KKyAgICAg
ICAgc2hyICAgICAkTDJfUEFHRVRBQkxFX1NISUZULCAlZWR4ICAgICAgICAgICAgICAgICAgIC8q
IEZpbmFsIHNsb3QgdG8gd3JpdGUuICovCisKKzE6ICAgICAgbW92ICAgICAlZWF4LCBzeW1fb2Zm
cyhsMl9ib290bWFwKSAgKCVlc2ksICVlY3gsIDgpCisgICAgICAgIG1vdiAgICAgJWVheCwgc3lt
X29mZnMobDJfZGlyZWN0bWFwKSglZXNpLCAlZWN4LCA4KQorICAgICAgICBhZGQgICAgICQxLCAl
ZWN4CisgICAgICAgIGFkZCAgICAgJDEgPDwgTDJfUEFHRVRBQkxFX1NISUZULCAlZWF4CisKKyAg
ICAgICAgY21wICAgICAlZWR4LCAlZWN4CisgICAgICAgIGpiZSAgICAgMWIKIAogICAgICAgICAv
KiBJbml0aWFsaXplIEwzIGJvb3QtbWFwIHBhZ2UgZGlyZWN0b3J5IGVudHJpZXMuICovCiAgICAg
ICAgIGxlYSAgICAgX19QQUdFX0hZUEVSVklTT1IrKEwyX1BBR0VUQUJMRV9FTlRSSUVTKjgpKjMr
c3ltX2VzaShsMl9ib290bWFwKSwlZWF4CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZWZpL2Vm
aS1ib290LmggYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKaW5kZXggZTc1MGRiNmY1Yy4u
MDBkZjE3MzZiZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCisrKyBi
L3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAtNjExLDE1ICs2MTEsMjggQEAgc3RhdGlj
IHZvaWQgX19pbml0IGVmaV9hcmNoX21lbW9yeV9zZXR1cCh2b2lkKQogICAgICAqIE1hcCBYZW4g
aW50byB0aGUgZGlyZWN0bWFwIChuZWVkZWQgZm9yIGVhcmx5LWJvb3QgcGFnZXRhYmxlCiAgICAg
ICogaGFuZGxpbmcvd2Fsa2luZyksIGFuZCBpZGVudGl0eSBtYXAgWGVuIGludG8gYm9vdG1hcCAo
bmVlZGVkIGZvciB0aGUKICAgICAgKiB0cmFuc2l0aW9uIGZyb20gdGhlIEVGSSBwYWdldGFibGVz
IHRvIFhlbiksIHVzaW5nIDJNIHN1cGVycGFnZXMuCisgICAgICoKKyAgICAgKiBOQjogV2UgYXJl
IGN1cnJlbnRseSBpbiBwaHlzaWNhbCBtb2RlLCBzbyBhIFJJUC1yZWxhdGl2ZSByZWxvY2F0aW9u
CisgICAgICogYWdhaW5zdCBfc3RhcnQvX2VuZCBnZXRzIHRoZWlyIHJlYWwgcG9zaXRpb24gaW4g
bWVtb3J5LCB3aGljaCBhcmUgdGhlCisgICAgICogYXBwcm9wcmlhdGUgbDIgc2xvdHMgdG8gbWFw
LgogICAgICAqLwotICAgIGZvciAoIGkgPSAwOyBpIDwgODsgKytpICkKKyNkZWZpbmUgbDJfNEdf
b2Zmc2V0KGEpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKKyAgICAoKChVSU5UTikoYSkgPj4gTDJfUEFHRVRBQkxFX1NISUZUKSAmICg0ICogTDJfUEFH
RVRBQkxFX0VOVFJJRVMgLSAxKSkKKworICAgIGZvciAoIGkgID0gbDJfNEdfb2Zmc2V0KF9zdGFy
dCk7CisgICAgICAgICAgaSA8PSBsMl80R19vZmZzZXQoX2VuZCAtIDEpOyArK2kgKQogICAgIHsK
LSAgICAgICAgdW5zaWduZWQgaW50IHNsb3QgPSAoeGVuX3BoeXNfc3RhcnQgPj4gTDJfUEFHRVRB
QkxFX1NISUZUKSArIGk7Ci0gICAgICAgIHBhZGRyX3QgYWRkciA9IHNsb3QgPDwgTDJfUEFHRVRB
QkxFX1NISUZUOworICAgICAgICBsMl9wZ2VudHJ5X3QgcHRlID0gbDJlX2Zyb21fcGFkZHIoaSA8
PCBMMl9QQUdFVEFCTEVfU0hJRlQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUiB8IF9QQUdFX1BTRSk7CisKKyAgICAgICAgbDJfYm9v
dG1hcFtpXSA9IHB0ZTsKKworICAgICAgICAvKiBCb290bWFwIFJXWC9Ob24tZ2xvYmFsLiAgRGly
ZWN0bWFwIFJXL0dsb2JhbC4gKi8KKyAgICAgICAgbDJlX2FkZF9mbGFncyhwdGUsIFBBR0VfSFlQ
RVJWSVNPUik7CiAKLSAgICAgICAgbDJfZGlyZWN0bWFwW3Nsb3RdID0gbDJlX2Zyb21fcGFkZHIo
YWRkciwgUEFHRV9IWVBFUlZJU09SfF9QQUdFX1BTRSk7Ci0gICAgICAgIGwyX2Jvb3RtYXBbc2xv
dF0gPSBsMmVfZnJvbV9wYWRkcihhZGRyLCBfX1BBR0VfSFlQRVJWSVNPUnxfUEFHRV9QU0UpOwor
ICAgICAgICBsMl9kaXJlY3RtYXBbaV0gPSBwdGU7CiAgICAgfQorI3VuZGVmIGwyXzRHX29mZnNl
dAogfQogCiBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfaGFuZGxlX21vZHVsZShzdHJ1Y3Qg
ZmlsZSAqZmlsZSwgY29uc3QgQ0hBUjE2ICpuYW1lLApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKaW5kZXggN2MzNTFiOWRmMy4uYTcx
ODUzYTg1NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJj
aC94ODYveGVuLmxkcy5TCkBAIC0zODQsNiArMzg0LDMgQEAgQVNTRVJUKCh0cmFtcG9saW5lX2Vu
ZCAtIHRyYW1wb2xpbmVfc3RhcnQpIDwgVFJBTVBPTElORV9TUEFDRSAtIE1CSV9TUEFDRV9NSU4s
CiAgICAgIm5vdCBlbm91Z2ggcm9vbSBmb3IgdHJhbXBvbGluZSBhbmQgbWJpIGRhdGEiKQogQVNT
RVJUKCh3YWtldXBfc3RhY2sgLSB3YWtldXBfc3RhY2tfc3RhcnQpID49IFdBS0VVUF9TVEFDS19N
SU4sCiAgICAgIndha2V1cCBzdGFjayB0b28gc21hbGwiKQotCi0vKiBQbGVudHkgb2YgYm9vdCBj
b2RlIGFzc3VtZXMgdGhhdCBYZW4gaXNuJ3QgbGFyZ2VyIHRoYW4gMTZNLiAqLwotQVNTRVJUKF9l
bmQgLSBfc3RhcnQgPD0gTUIoMTYpLCAiWGVuIHRvbyBsYXJnZSBmb3IgZWFybHktYm9vdCBhc3N1
bXB0aW9ucyIpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
