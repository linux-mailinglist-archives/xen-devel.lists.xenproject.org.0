Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA4E1D8D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:01:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNH9a-0004gd-Hx; Wed, 23 Oct 2019 13:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xo40=YQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNH9Z-0004gO-1S
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:58:21 +0000
X-Inumbo-ID: 2b5a2162-f59d-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b5a2162-f59d-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571839100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NjtVJxZrMEM2nPKnjjLMnoA7KiIfqyigxYdKXulChY=;
 b=QdY5FP1PnKbqZstpc/byHVZ1FeOP7QHstnjo+ortYQ+pzrwTTs9cAS6g
 Ngw9bCTvnsNCMmAF2p1iY615OGfaQ18WKZbRZviQKLEzdfgV7qwjQrLSD
 i8u6GFfujoa6mDQSbyyNmnYv5o3tyS8/eMwKfeddl0NXWp/a4REgF6aDr M=;
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
IronPort-SDR: XHU72YJIJSZaYJiyl/vTIGMtuAX4NaGZXlCp1B2hLn+jDKV8492sZwtAm1wJAxhJZGs4od0FiM
 OldIJcTv8h6sjSmgf6Isg9dd2skXXs/DBOZ0JLthTnga7f52kqvuAXsGK8jhqaFXeXEEbfzrgA
 RDd7BUkrDpryDqV5iJPF0Aj2IG/YzfUVTfrwHibxpujcSIvqwWjJ9W9njZB96iy1/AnvQUMrgp
 rDji37xxDXSn4QbmoHkzQNhi7AVlpOE+PUICi8jK0KHFLNgRBrXFpn6d8PyCofbVvP09NxPV9E
 LKw=
X-SBRS: 2.7
X-MesageID: 7665756
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7665756"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:58:11 +0100
Message-ID: <20191023135812.21348-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023135812.21348-1-andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 6/7] x86/nospec: Move
 array_index_mask_nospec() into nospec.h
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c3lzdGVtLmggaXNuJ3QgYW4gYXBwcm9wcmlhdGUgcGxhY2UgdG8gbGl2ZSwgbm93IHRoYXQgYXNt
L25vc3BlYy5oIGV4aXN0cy4KVGhpcyBzaG91bGQgYXJndWFibHkgaGF2ZSBiZWVuIHBhcnQgb2Yg
Yy9zIGRiNTkxZDZlNzZlCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKVGhpcyBpcyBwcm9iYWJseSBwb3N0LTQuMTMgY29udGVudAotLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmggfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3N5c3RlbS5oIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiB4ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmggICAgIHwgIDMgKystCiAzIGZpbGVzIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvbm9zcGVjLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oCmluZGV4
IGY2ZWI4NGVlZTUuLjAwMzljZDI3MTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
bm9zcGVjLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ub3NwZWMuaApAQCAtNiw2ICs2LDI4
IEBACiAKICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KIAorLyoqCisgKiBhcnJheV9pbmRl
eF9tYXNrX25vc3BlYygpIC0gZ2VuZXJhdGUgYSBtYXNrIHRoYXQgaXMgfjBVTCB3aGVuIHRoZQor
ICogICAgICBib3VuZHMgY2hlY2sgc3VjY2VlZHMgYW5kIDAgb3RoZXJ3aXNlCisgKiBAaW5kZXg6
IGFycmF5IGVsZW1lbnQgaW5kZXgKKyAqIEBzaXplOiBudW1iZXIgb2YgZWxlbWVudHMgaW4gYXJy
YXkKKyAqCisgKiBSZXR1cm5zOgorICogICAgIDAgLSAoaW5kZXggPCBzaXplKQorICovCisjZGVm
aW5lIGFycmF5X2luZGV4X21hc2tfbm9zcGVjIGFycmF5X2luZGV4X21hc2tfbm9zcGVjCitzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlfaW5kZXhfbWFza19ub3NwZWModW5zaWduZWQg
bG9uZyBpbmRleCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUpCit7CisgICAgdW5zaWduZWQgbG9uZyBtYXNrOwor
CisgICAgYXNtIHZvbGF0aWxlICggImNtcCAlW3NpemVdLCAlW2luZGV4XTsgc2JiICVbbWFza10s
ICVbbWFza107IgorICAgICAgICAgICAgICAgICAgIDogW21hc2tdICI9ciIgKG1hc2spCisgICAg
ICAgICAgICAgICAgICAgOiBbc2l6ZV0gImciIChzaXplKSwgW2luZGV4XSAiciIgKGluZGV4KSAp
OworCisgICAgcmV0dXJuIG1hc2s7Cit9CisKIC8qIEFsbG93IHRvIGluc2VydCBhIHJlYWQgbWVt
b3J5IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMgKi8KIHN0YXRpYyBhbHdheXNfaW5saW5lIGJv
b2wgYmFycmllcl9ub3NwZWNfdHJ1ZSh2b2lkKQogewpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9zeXN0ZW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc3lzdGVtLmgKaW5kZXggMDY5
ZjQyMmYwZC4uOWYxYjI5Njg1NSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zeXN0
ZW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3N5c3RlbS5oCkBAIC0yMzMsMzAgKzIzMyw2
IEBAIHN0YXRpYyBhbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgX194YWRkKAogI2RlZmluZSBz
ZXRfbWIodmFyLCB2YWx1ZSkgZG8geyB4Y2hnKCZ2YXIsIHZhbHVlKTsgfSB3aGlsZSAoMCkKICNk
ZWZpbmUgc2V0X3dtYih2YXIsIHZhbHVlKSBkbyB7IHZhciA9IHZhbHVlOyBzbXBfd21iKCk7IH0g
d2hpbGUgKDApCiAKLS8qKgotICogYXJyYXlfaW5kZXhfbWFza19ub3NwZWMoKSAtIGdlbmVyYXRl
IGEgbWFzayB0aGF0IGlzIH4wVUwgd2hlbiB0aGUKLSAqICAgICAgYm91bmRzIGNoZWNrIHN1Y2Nl
ZWRzIGFuZCAwIG90aGVyd2lzZQotICogQGluZGV4OiBhcnJheSBlbGVtZW50IGluZGV4Ci0gKiBA
c2l6ZTogbnVtYmVyIG9mIGVsZW1lbnRzIGluIGFycmF5Ci0gKgotICogUmV0dXJuczoKLSAqICAg
ICAwIC0gKGluZGV4IDwgc2l6ZSkKLSAqLwotc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGFy
cmF5X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxvbmcgaW5kZXgsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzaXpl
KQotewotICAgIHVuc2lnbmVkIGxvbmcgbWFzazsKLQotICAgIGFzbSB2b2xhdGlsZSAoICJjbXAg
JVtzaXplXSwgJVtpbmRleF07IHNiYiAlW21hc2tdLCAlW21hc2tdOyIKLSAgICAgICAgICAgICAg
ICAgICA6IFttYXNrXSAiPXIiIChtYXNrKQotICAgICAgICAgICAgICAgICAgIDogW3NpemVdICJn
IiAoc2l6ZSksIFtpbmRleF0gInIiIChpbmRleCkgKTsKLQotICAgIHJldHVybiBtYXNrOwotfQot
Ci0vKiBPdmVycmlkZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uIGluIG5vc3BlYy5oLiAqLwotI2Rl
ZmluZSBhcnJheV9pbmRleF9tYXNrX25vc3BlYyBhcnJheV9pbmRleF9tYXNrX25vc3BlYwotCiAj
ZGVmaW5lIGxvY2FsX2lycV9kaXNhYmxlKCkgICAgIGFzbSB2b2xhdGlsZSAoICJjbGkiIDogOiA6
ICJtZW1vcnkiICkKICNkZWZpbmUgbG9jYWxfaXJxX2VuYWJsZSgpICAgICAgYXNtIHZvbGF0aWxl
ICggInN0aSIgOiA6IDogIm1lbW9yeSIgKQogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
bm9zcGVjLmggYi94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgKaW5kZXggNzYyNTViYzQ2ZS4uNzU3
ODIxMGYxNiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCisrKyBiL3hlbi9p
bmNsdWRlL3hlbi9ub3NwZWMuaApAQCAtNyw3ICs3LDggQEAKICNpZm5kZWYgWEVOX05PU1BFQ19I
CiAjZGVmaW5lIFhFTl9OT1NQRUNfSAogCi0jaW5jbHVkZSA8YXNtL3N5c3RlbS5oPgorI2luY2x1
ZGUgPHhlbi9jb21waWxlci5oPgorCiAjaW5jbHVkZSA8YXNtL25vc3BlYy5oPgogCiAvKioKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
