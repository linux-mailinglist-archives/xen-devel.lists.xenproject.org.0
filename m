Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00B10B2BB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:52:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzYd-0001rb-0b; Wed, 27 Nov 2019 15:48:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZzYb-0001rW-C4
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:48:45 +0000
X-Inumbo-ID: 5e372f84-112d-11ea-a3b8-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e372f84-112d-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574869714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kVDypD4sPqXKLmr73CcGJEkBmUwhcwzXp4DfqPPHFww=;
 b=PhKi2d3Isb7x/7qHUXzkChx04gN6DZ9+U6+XaUE3Hiz/YPGu2a31THBc
 CXEdnPUF273YF5YlsdX1HT3bV0MM46vVLtgoGmnYZ7uCm2L9OZirHYLSL
 RGLYBHqWDmQqCIvVwFU8biBSXeARRLM3IQQfbU1iGRdMAAkshdb8NL576 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3EVHjUxFnSwhp1DcWDXhZ715COB8D44yhoqPD94ufoXMyjvUEtWu3gD66XZvCUZ0ngbzHTf2U7
 VyRe1AOgxSLZFRhXUUMPosI8S2UtPMRVp5CH5KkNaucCFReRMDy3hZlofaY4YybVdwDBHOnBWj
 CDSBkdAsnLn0zNpWpR2zytVaThl2V6rOu4G7NGwhpyUuB/KDCal3ehcxp/4WtuJenQ8a+W00cR
 RtBSUaDtgFW64laX+UA1aRO8KZ3Vh8szG47jRYEdUdZYWcPev7O2v8lIQhaVEmPODhC7FRGP0N
 Yzg=
X-SBRS: 2.7
X-MesageID: 9460162
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,250,1571716800"; 
   d="scan'208";a="9460162"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 27 Nov 2019 16:48:17 +0100
Message-ID: <20191127154817.12103-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v4] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB1c2luZyBwb3N0ZWQgaW50ZXJydXB0cyBvbiBJbnRlbCBoYXJkd2FyZSBpdCdzIHBvc3Np
YmxlIHRoYXQgdGhlCnZDUFUgcmVzdW1lcyBleGVjdXRpb24gd2l0aCBhIHN0YWxlIGxvY2FsIEFQ
SUMgSVJSIHJlZ2lzdGVyIGJlY2F1c2UKZGVwZW5kaW5nIG9uIHRoZSBpbnRlcnJ1cHRzIHRvIGJl
IGluamVjdGVkIHZsYXBpY19oYXNfcGVuZGluZ19pcnEKbWlnaHQgbm90IGJlIGNhbGxlZCwgYW5k
IHRodXMgUElSIHdvbid0IGJlIHN5bmNlZCBpbnRvIElSUi4KCkZpeCB0aGlzIGJ5IG1ha2luZyBz
dXJlIFBJUiBpcyBhbHdheXMgc3luY2VkIHRvIElSUiBpbgpodm1fdmNwdV9oYXNfcGVuZGluZ19p
cnEgcmVnYXJkbGVzcyBvZiB3aGF0IGludGVycnVwdHMgYXJlIHBlbmRpbmcuCgpSZXBvcnRlZC1i
eTogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYzOgogLSBJbnRyb2R1Y2UgYW5kIHVzZSB2
bGFwaWNfc3luY19waXJfdG9faXJyIGluIG9yZGVyIHRvIHN5bmMgUElSIHdpdGgKICAgSVJSLgog
LSBEbyBub3QgbW92ZSB0aGUgY2FsbCB0byB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxIGluCiAgIGh2
bV92Y3B1X2hhc19wZW5kaW5nX2lycS4KIC0gUmVtb3ZlIHRoZSBjaGFuZ2VzIGRvbmUgdG8gX192
bXhfZGVsaXZlcl9wb3N0ZWRfaW50ZXJydXB0LgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gUmFpc2Ug
YSBzb2Z0aXJxIGlmIGluIGludGVycnVwdCBjb250ZXh0IGFuZCB0aGUgdkNQVSBpcyB0aGUgY3Vy
cmVudAogICBvbmUuCiAtIFVzZSBpc19ydW5uaW5nIGluc3RlYWQgb2YgcnVubmFibGUuCiAtIFJl
bW92ZSB0aGUgY2FsbCB0byB2bXhfc3luY19waXJfdG9faXJyIGluIHZteF9pbnRyX2Fzc2lzdCBh
bmQKICAgaW5zdGVhZCBhbHdheXMgY2FsbCB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxIGluCiAgIGh2
bV92Y3B1X2hhc19wZW5kaW5nX2lycS4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2lycS5jICAgICAg
ICAgICB8ICA5ICsrKysrKysrKwogeGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYyAgICAgICAgfCAx
MCArKy0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bGFwaWMuaCB8ICA2ICsrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaXJxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lycS5j
CmluZGV4IGUwM2E4N2FkNTAuLmM2ODQ0MjJiMjQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9pcnEuYwpAQCAtNTE3LDYgKzUxNywxNSBA
QCBzdHJ1Y3QgaHZtX2ludGFjayBodm1fdmNwdV9oYXNfcGVuZGluZ19pcnEoc3RydWN0IHZjcHUg
KnYpCiAgICAgc3RydWN0IGh2bV9kb21haW4gKnBsYXQgPSAmdi0+ZG9tYWluLT5hcmNoLmh2bTsK
ICAgICBpbnQgdmVjdG9yOwogCisgICAgLyoKKyAgICAgKiBBbHdheXMgY2FsbCB2bGFwaWNfc3lu
Y19waXJfdG9faXJyIHNvIHRoYXQgUElSIGlzIHN5bmNlZCBpbnRvIElSUiB3aGVuCisgICAgICog
dXNpbmcgcG9zdGVkIGludGVycnVwdHMuIE5vdGUgdGhpcyBpcyBhbHNvIGRvbmUgYnkKKyAgICAg
KiB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxIGJ1dCBkZXBlbmRpbmcgb24gd2hpY2ggaW50ZXJydXB0
cyBhcmUgcGVuZGluZworICAgICAqIGh2bV92Y3B1X2hhc19wZW5kaW5nX2lycSB3aWxsIHJldHVy
biBlYXJseSB3aXRob3V0IGNhbGxpbmcKKyAgICAgKiB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxLgor
ICAgICAqLworICAgIHZsYXBpY19zeW5jX3Bpcl90b19pcnIodik7CisKICAgICBpZiAoIHVubGlr
ZWx5KHYtPm5taV9wZW5kaW5nKSApCiAgICAgICAgIHJldHVybiBodm1faW50YWNrX25taTsKIApk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYyBiL3hlbi9hcmNoL3g4Ni9odm0v
dmxhcGljLmMKaW5kZXggOTQ2NjI1OGQ2Zi4uNmZjY2U5NTcxMyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS92bGFwaWMuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jCkBAIC0x
MDYsMTUgKzEwNiw5IEBAIHN0YXRpYyB2b2lkIHZsYXBpY19jbGVhcl9pcnIoaW50IHZlY3Rvciwg
c3RydWN0IHZsYXBpYyAqdmxhcGljKQogICAgIHZsYXBpY19jbGVhcl92ZWN0b3IodmVjdG9yLCAm
dmxhcGljLT5yZWdzLT5kYXRhW0FQSUNfSVJSXSk7CiB9CiAKLXN0YXRpYyB2b2lkIHN5bmNfcGly
X3RvX2lycihzdHJ1Y3QgdmNwdSAqdikKLXsKLSAgICBpZiAoIGh2bV9mdW5jcy5zeW5jX3Bpcl90
b19pcnIgKQotICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3Muc3luY19waXJfdG9f
aXJyLCB2KTsKLX0KLQogc3RhdGljIGludCB2bGFwaWNfZmluZF9oaWdoZXN0X2lycihzdHJ1Y3Qg
dmxhcGljICp2bGFwaWMpCiB7Ci0gICAgc3luY19waXJfdG9faXJyKHZsYXBpY192Y3B1KHZsYXBp
YykpOworICAgIHZsYXBpY19zeW5jX3Bpcl90b19pcnIodmxhcGljX3ZjcHUodmxhcGljKSk7CiAK
ICAgICByZXR1cm4gdmxhcGljX2ZpbmRfaGlnaGVzdF92ZWN0b3IoJnZsYXBpYy0+cmVncy0+ZGF0
YVtBUElDX0lSUl0pOwogfQpAQCAtMTQ5Myw3ICsxNDg3LDcgQEAgc3RhdGljIGludCBsYXBpY19z
YXZlX3JlZ3Moc3RydWN0IHZjcHUgKnYsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQogICAgIGlm
ICggIWhhc192bGFwaWModi0+ZG9tYWluKSApCiAgICAgICAgIHJldHVybiAwOwogCi0gICAgc3lu
Y19waXJfdG9faXJyKHYpOworICAgIHZsYXBpY19zeW5jX3Bpcl90b19pcnIodik7CiAKICAgICBy
ZXR1cm4gaHZtX3NhdmVfZW50cnkoTEFQSUNfUkVHUywgdi0+dmNwdV9pZCwgaCwgdmNwdV92bGFw
aWModiktPnJlZ3MpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmxh
cGljLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bGFwaWMuaAppbmRleCBkZGU2NmI0ZjBm
Li5mMGQ1ZTNmYmM5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bGFwaWMu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bGFwaWMuaApAQCAtMTUwLDQgKzE1MCwx
MCBAQCBib29sX3QgdmxhcGljX21hdGNoX2Rlc3QoCiAgICAgY29uc3Qgc3RydWN0IHZsYXBpYyAq
dGFyZ2V0LCBjb25zdCBzdHJ1Y3QgdmxhcGljICpzb3VyY2UsCiAgICAgaW50IHNob3J0X2hhbmQs
IHVpbnQzMl90IGRlc3QsIGJvb2xfdCBkZXN0X21vZGUpOwogCitzdGF0aWMgaW5saW5lIHZvaWQg
dmxhcGljX3N5bmNfcGlyX3RvX2lycihzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICBpZiAoIGh2bV9m
dW5jcy5zeW5jX3Bpcl90b19pcnIgKQorICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVu
Y3Muc3luY19waXJfdG9faXJyLCB2KTsKK30KKwogI2VuZGlmIC8qIF9fQVNNX1g4Nl9IVk1fVkxB
UElDX0hfXyAqLwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
