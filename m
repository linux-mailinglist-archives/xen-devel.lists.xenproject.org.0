Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3BD131583
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:56:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUiX-0003wU-3U; Mon, 06 Jan 2020 15:54:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioUiV-0003vr-Uf
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:54:55 +0000
X-Inumbo-ID: dcdb1204-309c-11ea-b6f1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcdb1204-309c-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578326087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CoPi2cu0FEnqJ+0mJtkSllKmwQGLHCI4qHXbgth2kPo=;
 b=SE6a04X+NUxNuu/GYgbx1pv4GwegiXKUUmtA21KLUmpkOfxnZTzfyb38
 FokwEUgrmHlKFsgLPwV0IWlfjZBx4SXmWbaKiJ2fQ9ZDDdi21UCPrVLbP
 5hskGAvo9YpG7WIKLLH2HWp2P0auhigJMX3MEwvg0rNzbiqDRavGnTg2c U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9sJA1sd1VP/qY3YdTOC3D6h6lSpOWTBuhkStlUMFNMLTc5QO4pLJdxvp1YiJcClOpY71WprMiz
 we8qh7sxEVtPgAyaAfJGkzCITbBFAPqyO6bv5eeNTaS6rHR4jxhppCWGu8+S7hptF+ORXz+hL0
 QuZrv5axtBWDEwV+iBOVLZKPze5LS/ux2Ea4LEtlTL16xs//yxrCUHnEuGEe3aFjquWupV6Tkd
 QwS4rwzlbU/3SeJWsfFfFB2Lr9xifo5Xr0Goiiuk6VRQmhWN+WDV5YxHbZMupy7q1n3HBH+ngw
 txE=
X-SBRS: 2.7
X-MesageID: 10655810
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10655810"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 15:54:21 +0000
Message-ID: <20200106155423.9508-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200106155423.9508-1-andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[] construction
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

VGhlIG5lZWQgZm9yIFhlbiB0byBiZSBpZGVudGl0eSBtYXBwZWQgaW50byB0aGUgYm9vdG1hcCBp
cyBub3Qgb2J2aW91cywgYW5kCmRpZmZlcnMgYmV0d2VlbiB0aGUgTUIgYW5kIEVGSSBib290IHBh
dGhzLiAgRnVydGhlcm1vcmUsIHRoZSBFRkkgc2lkZSBpcwpmdXJ0aGVyIGNvbXBsaWNhdGVkIGJ5
IHNwcmF5aW5nIG5vbi1pZGVudGl0eSBhbGlhc2VzIGludG8gdGhlIG1peC4KClNpbXBsaWZ5IHRo
ZSBFRkkgYm9vdG1hcCBjb25zdHJ1Y3Rpb24gY29kZSB0byBtYWtlIGV4YWN0bHkgb25lIGlkZW50
aXR5LW1hcCBvZgpYZW4sIHdoaWNoIG5vdyBtYXRjaGVzIHRoZSBNQiBwYXRoLiAgQ29tbWVudCBi
b3RoIHBpZWNlcyBvZiBsb2dpYywgZXhwbGFpbmluZwp3aGF0IHRoZSBtYXBwaW5ncyBhcmUgbmVl
ZGVkIGZvci4KCkZpbmFsbHksIGxlYXZlIGEgbGlua2VyIGFzc2VydCBjb3ZlcmluZyB0aGUgZmFj
dCB0aGF0IHBsZW50eSBvZiBjb2RlIGJsaW5kbHkKYXNzdW1lcyB0aGF0IFhlbiBpcyBsZXNzIHRo
YXQgMTZNLiAgVGhpcyB3YW50cyBmaXhpbmcgaW4gZHVlIGNvdXJzZS4KClNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhlIE1CIHBhdGgncyBkZXBl
bmRlbmN5IG9uIFhlbidzIGlkZW50aXR5IG1hcHBpbmcgY2FuIGJlIGJyb2tlbiBieSBoYXZpbmcK
dHJhbXBvbGluZV9ib290X2NwdV9lbnRyeSBzd2l0Y2ggdGhlIGFsaWFzIG9mIGdkdF80OCBpdCB1
c2VzLgoKSSB0b29rIHRoaXMgYXBwcm9hY2ggZmlyc3QgaW4gYW4gYXR0ZW1wdCB0byBkcm9wIHRo
ZSBib290bWFwIGVudGlyZWx5LCBidXQgaXQKaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIEVGSSBw
YXRoLCBhbmQgd291bGQgYWxzbyB3b3JrIGFnYWluc3Qgb3RoZXIgcGxhbnMgdG8KYXZvaWQgdXNp
bmcgdGhlIHRyYW1wb2xpbmUgZHVyaW5nIGVhcmx5IGJvb3QuCi0tLQogeGVuL2FyY2gveDg2L2Jv
b3QvaGVhZC5TICAgIHwgIDggKysrKysrLS0KIHhlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCB8
IDE3ICsrKysrKysrKystLS0tLS0tCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgfCAgMyAr
KysKIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYvYm9vdC9o
ZWFkLlMKaW5kZXggN2VlNDUxMWUyNi4uZjdkMjczY2EzNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwpAQCAtNjY4LDcg
KzY2OCwxMSBAQCB0cmFtcG9saW5lX3NldHVwOgogICAgICAgICBhZGQgICAgICVlc2ksc3ltX2Zz
KF9fcGFnZV90YWJsZXNfc3RhcnQpLTgoLCVlY3gsOCkKIDI6ICAgICAgbG9vcCAgICAxYgogCi0g
ICAgICAgIC8qIEluaXRpYWxpemUgTDIgYm9vdC1tYXAvZGlyZWN0IG1hcCBwYWdlIHRhYmxlIGVu
dHJpZXMgKDE2TUIpLiAqLworICAgICAgICAvKgorICAgICAgICAgKiBNYXAgWGVuIGludG8gdGhl
IGRpcmVjdG1hcCAobmVlZGVkIGZvciBlYXJseS1ib290IHBhZ2V0YWJsZQorICAgICAgICAgKiBo
YW5kbGluZy93YWxraW5nKSwgYW5kIGlkZW50aXR5IG1hcCBYZW4gaW50byBib290bWFwIChuZWVk
ZWQgZm9yCisgICAgICAgICAqIHRoZSB0cmFuc2l0aW9uIGludG8gbG9uZyBtb2RlKSwgdXNpbmcg
Mk0gc3VwZXJwYWdlcy4KKyAgICAgICAgICovCiAgICAgICAgIGxlYSAgICAgc3ltX2VzaShzdGFy
dCksJWVieAogICAgICAgICBsZWEgICAgICgxPDxMMl9QQUdFVEFCTEVfU0hJRlQpKjcrKFBBR0Vf
SFlQRVJWSVNPUnxfUEFHRV9QU0UpKCVlYngpLCVlYXgKICAgICAgICAgc2hyICAgICAkKEwyX1BB
R0VUQUJMRV9TSElGVC0zKSwlZWJ4CkBAIC02NzgsNyArNjgyLDcgQEAgdHJhbXBvbGluZV9zZXR1
cDoKICAgICAgICAgc3ViICAgICAkKDE8PEwyX1BBR0VUQUJMRV9TSElGVCksJWVheAogICAgICAg
ICBsb29wICAgIDFiCiAKLSAgICAgICAgLyogSW5pdGlhbGl6ZSBMMyBib290LW1hcCBwYWdlIGRp
cmVjdG9yeSBlbnRyeS4gKi8KKyAgICAgICAgLyogSW5pdGlhbGl6ZSBMMyBib290LW1hcCBwYWdl
IGRpcmVjdG9yeSBlbnRyaWVzLiAqLwogICAgICAgICBsZWEgICAgIF9fUEFHRV9IWVBFUlZJU09S
KyhMMl9QQUdFVEFCTEVfRU5UUklFUyo4KSozK3N5bV9lc2kobDJfYm9vdG1hcCksJWVheAogICAg
ICAgICBtb3YgICAgICQ0LCVlY3gKIDE6ICAgICAgbW92ICAgICAlZWF4LHN5bV9mcyhsM19ib290
bWFwKS04KCwlZWN4LDgpCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290Lmgg
Yi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKaW5kZXggNjc2ZDYxNmZmOC4uOWMzMTRlNDAz
YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNo
L3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAtNTg0LDIxICs1ODQsMjQgQEAgc3RhdGljIHZvaWQgX19p
bml0IGVmaV9hcmNoX21lbW9yeV9zZXR1cCh2b2lkKQogICAgIGlmICggIWVmaV9lbmFibGVkKEVG
SV9MT0FERVIpICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgLyogSW5pdGlhbGlzZSBMMiBpZGVu
dGl0eS1tYXAgYW5kIGJvb3QtbWFwIHBhZ2UgdGFibGUgZW50cmllcyAoMTZNQikuICovCisgICAg
LyoKKyAgICAgKiBNYXAgWGVuIGludG8gdGhlIGRpcmVjdG1hcCAoTlgsIG5lZWRlZCBmb3IgZWFy
bHktYm9vdCBwYWdldGFibGUKKyAgICAgKiBoYW5kbGluZy93YWxraW5nKSwgYW5kIGlkZW50aXR5
IG1hcCBYZW4gaW50byBib290bWFwIChYLCBuZWVkZWQgZm9yIHRoZQorICAgICAqIHRyYW5zaXRp
b24gZnJvbSB0aGUgRUZJIHBhZ2V0YWJsZXMgdG8gWGVuKSwgdXNpbmcgMk0gc3VwZXJwYWdlcy4K
KyAgICAgKi8KICAgICBmb3IgKCBpID0gMDsgaSA8IDg7ICsraSApCiAgICAgewogICAgICAgICB1
bnNpZ25lZCBpbnQgc2xvdCA9ICh4ZW5fcGh5c19zdGFydCA+PiBMMl9QQUdFVEFCTEVfU0hJRlQp
ICsgaTsKICAgICAgICAgcGFkZHJfdCBhZGRyID0gc2xvdCA8PCBMMl9QQUdFVEFCTEVfU0hJRlQ7
CiAKICAgICAgICAgbDJfaWRlbnRtYXBbc2xvdF0gPSBsMmVfZnJvbV9wYWRkcihhZGRyLCBQQUdF
X0hZUEVSVklTT1J8X1BBR0VfUFNFKTsKLSAgICAgICAgc2xvdCAmPSBMMl9QQUdFVEFCTEVfRU5U
UklFUyAtIDE7CiAgICAgICAgIGwyX2Jvb3RtYXBbc2xvdF0gPSBsMmVfZnJvbV9wYWRkcihhZGRy
LCBfX1BBR0VfSFlQRVJWSVNPUnxfUEFHRV9QU0UpOwogICAgIH0KLSAgICAvKiBJbml0aWFsaXNl
IEwzIGJvb3QtbWFwIHBhZ2UgZGlyZWN0b3J5IGVudHJpZXMuICovCi0gICAgbDNfYm9vdG1hcFts
M190YWJsZV9vZmZzZXQoeGVuX3BoeXNfc3RhcnQpXSA9Ci0gICAgICAgIGwzZV9mcm9tX3BhZGRy
KChVSU5UTilsMl9ib290bWFwLCBfX1BBR0VfSFlQRVJWSVNPUik7Ci0gICAgbDNfYm9vdG1hcFts
M190YWJsZV9vZmZzZXQoeGVuX3BoeXNfc3RhcnQgKyAoOCA8PCBMMl9QQUdFVEFCTEVfU0hJRlQp
IC0gMSldID0KLSAgICAgICAgbDNlX2Zyb21fcGFkZHIoKFVJTlROKWwyX2Jvb3RtYXAsIF9fUEFH
RV9IWVBFUlZJU09SKTsKKworICAgIC8qIEluaXRpYWxpemUgTDMgYm9vdC1tYXAgcGFnZSBkaXJl
Y3RvcnkgZW50cmllcy4gKi8KKyAgICBmb3IgKCBpID0gMDsgaSA8IDQ7ICsraSApCisgICAgICAg
IGwzX2Jvb3RtYXBbaV0gPSBsM2VfZnJvbV9wYWRkcigoVUlOVE4pbDJfYm9vdG1hcCArIGkgKiBQ
QUdFX1NJWkUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0Vf
SFlQRVJWSVNPUik7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9oYW5kbGVfbW9k
dWxlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBDSEFSMTYgKm5hbWUsCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCAxMTFl
ZGI1MzYwLi43ZjgyZjY0MDc4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisr
KyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKQEAgLTM4MSwzICszODEsNiBAQCBBU1NFUlQoKHRy
YW1wb2xpbmVfZW5kIC0gdHJhbXBvbGluZV9zdGFydCkgPCBUUkFNUE9MSU5FX1NQQUNFIC0gTUJJ
X1NQQUNFX01JTiwKICAgICAibm90IGVub3VnaCByb29tIGZvciB0cmFtcG9saW5lIGFuZCBtYmkg
ZGF0YSIpCiBBU1NFUlQoKHdha2V1cF9zdGFjayAtIHdha2V1cF9zdGFja19zdGFydCkgPj0gV0FL
RVVQX1NUQUNLX01JTiwKICAgICAid2FrZXVwIHN0YWNrIHRvbyBzbWFsbCIpCisKKy8qIFBsZW50
eSBvZiBib290IGNvZGUgYXNzdW1lcyB0aGF0IFhlbiBpc24ndCBsYXJnZXIgdGhhbiAxNk0uICov
CitBU1NFUlQoX2VuZCAtIF9zdGFydCA8PSBNQigxNiksICJYZW4gdG9vIGxhcmdlIGZvciBlYXJs
eS1ib290IGFzc3VtcHRpb25zIikKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
