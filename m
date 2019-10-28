Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A482CE7534
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:33:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6xx-0000kQ-Ll; Mon, 28 Oct 2019 15:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP6xw-0000kK-Ar
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:29:56 +0000
X-Inumbo-ID: ca30ae0e-f997-11e9-94fa-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca30ae0e-f997-11e9-94fa-12813bfff9fa;
 Mon, 28 Oct 2019 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572276596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SRmnlv/GOIehsvLUqGfZDvhGKxuIqlOoy08xuc7OK9E=;
 b=bGOiRk4mjhk0Xo2NhyYGiQ1FrEGspgp5NvcfOms1KmgjYAjVLGVzfsdO
 G7ZILKK5YFIOmIs365HtuDEsjjJ0b9ca/Yv3CygWKI/AfYF+pKzQjtj5L
 sVnA/TUNynUZOs358Bz6gxen9b/P8IAfhLL/P19Kg5Jh1GG9sa3fse5Ja U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ug2KtFi/WCWz/oQI6auIjaNAnm8tyHt/qoX96cRMJlSDPo8hDXZbbx6hItcNFLC/Z7RJzsS0k+
 HL2rsiM9nP2V4NE/JTy2EF5Yk0js00j51PdXpyJ/04aJnSpiPE9LnHlJTSFaPIlluSiSiMJP2e
 HL+TG2S/qCjfYe2U38BFuluiNhSJ9FAuHLKOihcKpv68lw2wSonR8QFStwgvhs14rPkLbTJylv
 Ji/D6IqujP1gUEZI2ZR+LKDHvNusuucd6dR/dMXdt1CpGzZrDmrzbytH/jc+Djr4GmdGkzt5po
 xxI=
X-SBRS: 2.7
X-MesageID: 7508827
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7508827"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 28 Oct 2019 15:29:45 +0000
Message-ID: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 0/3] Fix stub dm since pci pt
 overhaul
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgZml4ZXMgZ3Vlc3QgY3JlYXRpb24gd2l0aCBzdHViIGRldmljZSBtb2RlbHMs
IHdoaWNoIHdhcwpicm9rZW4gYnkgYWQwMTFhZDA4ODQzICJsaWJ4bC94bDogT3ZlcmhhdWwgcGFz
c3Rocm91Z2ggc2V0dGluZyBsb2dpYyIuCgpJIGhhdmUgdGVzdGVkIHRoaXMgd2l0aCBhbGwgdGhy
ZWUgcGF0Y2hlcyBhbmQgaXQgZml4ZXMgdGhlIHJlZ3Jlc3Npb24uCkknbSBub3Qgc3VyZSBhYm91
dCB0aGUgM3JkIGFuZCB3b3VsZCBsaWtlIGFuIG9waW5pb24gZnJvbSB4ODYgZm9sa3MsCmZvciB0
aGUgcmVhc29ucyBleHBsYWluZWQgaW4gaXRzIGNvbW1pdCBtZXNzYWdlLgoKSWFuIEphY2tzb24g
KDMpOgogIGxpYnhsOiBkb21haW5fY29uZmlnX3NldGRlZmF1bHQ6IERvY3VtZW50IHVzZSBvZiBk
b21pZAogIGxpYnhsOiBsaWJ4bF9fc3Bhd25fc3R1Yl9kbTogQ2FsbCBkb21haW5fY29uZmlnX3Nl
dGRlZmF1bHQKICBsaWJ4bDogU2V0IHNoYWRvd19tZW1rYiBmb3Igc3R1YiBkZXZpY2UgbW9kZWwg
ZG9tYWlucwoKIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgMiArLQogdG9vbHMvbGlieGwv
bGlieGxfZG0uYyAgICAgfCA5ICstLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
