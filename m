Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AF141270
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:45:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isYRs-0004vO-8b; Fri, 17 Jan 2020 20:42:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J6zi=3G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isYRq-0004uz-0X
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:42:30 +0000
X-Inumbo-ID: dfbc0c14-3969-11ea-b618-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfbc0c14-3969-11ea-b618-12813bfff9fa;
 Fri, 17 Jan 2020 20:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579293748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fpCO0ehVSAQgDjvhHyCszFmIE7gcwm29q8mHr7AMMDk=;
 b=bUjK78HD2UHlkh0o5dNI4+bJKXHoi+ugJVAFTiEBZxXXH3qgV/fgB0Yr
 D+DwbkXd+7yy9Aba2V24QD8lr2VSlFOiagJp+DDhfYeZcUWzxU65SDq0w
 RO99qqGf2cYaS3x6EHGj4n39DbgWXqbkleapOwHVAnlAj1Lv6tpKT7PuR Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7gCKtV2y8COdvzMRWJ2BKsyxla/KMiosFxoQp+NXQw1ri7I3yKjYD4fWqjRmgCDcHFMxbNn9G2
 Dh2npbjnT7ybROGhee6TXXs3CBju0VGzDFCXxnyw9SXROZqMBBTvfF7fcxt6EMc6PB33blHy5I
 xwolFk8pUByaXTrheWiE/dZoDDfidMLiLmmjjnXbI7gN1y5pnu/rzkhBGIUFk90Wxe9Hfihn5+
 vyIZAmRq/DZPlEgDBPbmS18AC3H8C/3oYRPdSJtyT60ffWFmn8re+W8mxif8tg0wAs3d721vTm
 1I0=
X-SBRS: 2.7
X-MesageID: 11688713
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11688713"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 20:42:20 +0000
Message-ID: <20200117204223.30076-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117204223.30076-1-andrew.cooper3@citrix.com>
References: <20200117204223.30076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/5] x86/boot: Size the boot/directmap
 mappings dynamically
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

Li4uIHJhdGhlciB0aGFuIHByZXN1bWluZyB0aGF0IDE2TSB3aWxsIGRvLiAgT24gdGhlIEVGSSBz
aWRlLCB1c2UKbDJlX2FkZF9mbGFncygpIHRvIHJlZHVjZSB0aGUgY29kZS1nZW5lcmF0aW9uIG92
ZXJoZWFkIG9mIHVzaW5nCmwyZV9mcm9tX3BhZGRyKCkgdHdpY2UuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCnYyOgogKiBEcm9wIGFkanVzdG1l
bnQgdG8gdGhlIGxpbmtlciBzY3JpcHQuICBUaGVyZSBhcmUgbW9yZSAxNk0gaXNzdWVzIHRvIGZp
bmQuCi0tLQogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgIHwgMjEgKysrKysrKysrKysrKy0t
LS0tLS0tCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggfCAyMyArKysrKysrKysrKysrKysr
KystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYv
Ym9vdC9oZWFkLlMKaW5kZXggZWY5ZjU2MjUwNS4uMDEzN2VlOTlhNCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwpAQCAt
Njg3LDE0ICs2ODcsMTkgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAgICogaGFuZGxpbmcv
d2Fsa2luZyksIGFuZCBpZGVudGl0eSBtYXAgWGVuIGludG8gYm9vdG1hcCAobmVlZGVkIGZvcgog
ICAgICAgICAgKiB0aGUgdHJhbnNpdGlvbiBpbnRvIGxvbmcgbW9kZSksIHVzaW5nIDJNIHN1cGVy
cGFnZXMuCiAgICAgICAgICAqLwotICAgICAgICBsZWEgICAgIHN5bV9lc2koc3RhcnQpLCVlYngK
LSAgICAgICAgbGVhICAgICAoMTw8TDJfUEFHRVRBQkxFX1NISUZUKSo3KyhQQUdFX0hZUEVSVklT
T1JfUldYfF9QQUdFX1BTRSkoJWVieCksJWVheAotICAgICAgICBzaHIgICAgICQoTDJfUEFHRVRB
QkxFX1NISUZULTMpLCVlYngKLSAgICAgICAgbW92ICAgICAkOCwlZWN4Ci0xOiAgICAgIG1vdiAg
ICAgJWVheCxzeW1fZnMobDJfYm9vdG1hcCktOCglZWJ4LCVlY3gsOCkKLSAgICAgICAgbW92ICAg
ICAlZWF4LHN5bV9mcyhsMl9kaXJlY3RtYXApLTgoJWVieCwlZWN4LDgpCi0gICAgICAgIHN1YiAg
ICAgJCgxPDxMMl9QQUdFVEFCTEVfU0hJRlQpLCVlYXgKLSAgICAgICAgbG9vcCAgICAxYgorICAg
ICAgICBsZWEgICAgIHN5bV9lc2koX3N0YXJ0KSwgJWVjeAorICAgICAgICBsZWEgICAgIC0xICsg
c3ltX2VzaShfZW5kKSwgJWVkeAorICAgICAgICBsZWEgICAgIF9QQUdFX1BTRSArIFBBR0VfSFlQ
RVJWSVNPUl9SV1goJWVjeCksICVlYXggLyogUFRFIHRvIHdyaXRlLiAqLworICAgICAgICBzaHIg
ICAgICRMMl9QQUdFVEFCTEVfU0hJRlQsICVlY3ggICAgICAgICAgICAgICAgICAgLyogRmlyc3Qg
c2xvdCB0byB3cml0ZS4gKi8KKyAgICAgICAgc2hyICAgICAkTDJfUEFHRVRBQkxFX1NISUZULCAl
ZWR4ICAgICAgICAgICAgICAgICAgIC8qIEZpbmFsIHNsb3QgdG8gd3JpdGUuICovCisKKzE6ICAg
ICAgbW92ICAgICAlZWF4LCBzeW1fb2ZmcyhsMl9ib290bWFwKSAgKCVlc2ksICVlY3gsIDgpCisg
ICAgICAgIG1vdiAgICAgJWVheCwgc3ltX29mZnMobDJfZGlyZWN0bWFwKSglZXNpLCAlZWN4LCA4
KQorICAgICAgICBhZGQgICAgICQxLCAlZWN4CisgICAgICAgIGFkZCAgICAgJDEgPDwgTDJfUEFH
RVRBQkxFX1NISUZULCAlZWF4CisKKyAgICAgICAgY21wICAgICAlZWR4LCAlZWN4CisgICAgICAg
IGpiZSAgICAgMWIKIAogICAgICAgICAvKiBJbml0aWFsaXplIEwzIGJvb3QtbWFwIHBhZ2UgZGly
ZWN0b3J5IGVudHJpZXMuICovCiAgICAgICAgIGxlYSAgICAgX19QQUdFX0hZUEVSVklTT1IrKEwy
X1BBR0VUQUJMRV9FTlRSSUVTKjgpKjMrc3ltX2VzaShsMl9ib290bWFwKSwlZWF4CmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1i
b290LmgKaW5kZXggY2UwN2FlZGY0NS4uYmY3YjBhNjFkYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2VmaS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAt
NjExLDE1ICs2MTEsMjggQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX21lbW9yeV9zZXR1
cCh2b2lkKQogICAgICAqIE1hcCBYZW4gaW50byB0aGUgZGlyZWN0bWFwIChuZWVkZWQgZm9yIGVh
cmx5LWJvb3QgcGFnZXRhYmxlCiAgICAgICogaGFuZGxpbmcvd2Fsa2luZyksIGFuZCBpZGVudGl0
eSBtYXAgWGVuIGludG8gYm9vdG1hcCAobmVlZGVkIGZvciB0aGUKICAgICAgKiB0cmFuc2l0aW9u
IGZyb20gdGhlIEVGSSBwYWdldGFibGVzIHRvIFhlbiksIHVzaW5nIDJNIHN1cGVycGFnZXMuCisg
ICAgICoKKyAgICAgKiBOQjogV2UgYXJlIGN1cnJlbnRseSBpbiBwaHlzaWNhbCBtb2RlLCBzbyBh
IFJJUC1yZWxhdGl2ZSByZWxvY2F0aW9uCisgICAgICogYWdhaW5zdCBfc3RhcnQvX2VuZCBnZXRz
IHRoZWlyIHJlYWwgcG9zaXRpb24gaW4gbWVtb3J5LCB3aGljaCBhcmUgdGhlCisgICAgICogYXBw
cm9wcmlhdGUgbDIgc2xvdHMgdG8gbWFwLgogICAgICAqLwotICAgIGZvciAoIGkgPSAwOyBpIDwg
ODsgKytpICkKKyNkZWZpbmUgbDJfNEdfb2Zmc2V0KGEpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAoKChVSU5UTikoYSkgPj4gTDJfUEFHRVRB
QkxFX1NISUZUKSAmICg0ICogTDJfUEFHRVRBQkxFX0VOVFJJRVMgLSAxKSkKKworICAgIGZvciAo
IGkgID0gbDJfNEdfb2Zmc2V0KF9zdGFydCk7CisgICAgICAgICAgaSA8PSBsMl80R19vZmZzZXQo
X2VuZCAtIDEpOyArK2kgKQogICAgIHsKLSAgICAgICAgdW5zaWduZWQgaW50IHNsb3QgPSAoeGVu
X3BoeXNfc3RhcnQgPj4gTDJfUEFHRVRBQkxFX1NISUZUKSArIGk7Ci0gICAgICAgIHBhZGRyX3Qg
YWRkciA9IHNsb3QgPDwgTDJfUEFHRVRBQkxFX1NISUZUOworICAgICAgICBsMl9wZ2VudHJ5X3Qg
cHRlID0gbDJlX2Zyb21fcGFkZHIoaSA8PCBMMl9QQUdFVEFCTEVfU0hJRlQsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUiB8IF9QQUdF
X1BTRSk7CisKKyAgICAgICAgbDJfYm9vdG1hcFtpXSA9IHB0ZTsKKworICAgICAgICAvKiBCb290
bWFwIFJXWC9Ob24tZ2xvYmFsLiAgRGlyZWN0bWFwIFJXL0dsb2JhbC4gKi8KKyAgICAgICAgbDJl
X2FkZF9mbGFncyhwdGUsIFBBR0VfSFlQRVJWSVNPUik7CiAKLSAgICAgICAgbDJfZGlyZWN0bWFw
W3Nsb3RdID0gbDJlX2Zyb21fcGFkZHIoYWRkciwgUEFHRV9IWVBFUlZJU09SfF9QQUdFX1BTRSk7
Ci0gICAgICAgIGwyX2Jvb3RtYXBbc2xvdF0gPSBsMmVfZnJvbV9wYWRkcihhZGRyLCBfX1BBR0Vf
SFlQRVJWSVNPUnxfUEFHRV9QU0UpOworICAgICAgICBsMl9kaXJlY3RtYXBbaV0gPSBwdGU7CiAg
ICAgfQorI3VuZGVmIGwyXzRHX29mZnNldAogfQogCiBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2Fy
Y2hfaGFuZGxlX21vZHVsZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgQ0hBUjE2ICpuYW1lLAot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
