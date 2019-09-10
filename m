Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D6EAE9EC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:06:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7erP-0007EX-Km; Tue, 10 Sep 2019 12:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7erO-0007EP-JO
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:03:02 +0000
X-Inumbo-ID: efe4c87c-d3c2-11e9-ac1c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efe4c87c-d3c2-11e9-ac1c-12813bfff9fa;
 Tue, 10 Sep 2019 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568116982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EXel1DzXDHB8JA/12GLSNoD1hJ7rYd/Sz0FRKXlOozE=;
 b=EP4N9pBJPz62SwMUat5KE+lUanyiY+LLNKk3hyc6kFxa/NZOFwJzftQD
 rPIQUpHWIxdxzqQHRzcgRpm0SrqQuknLERipj9kAOzPVb/gdrZNJCL11j
 dq70i8T9rzpBOgb+nW5LSACs/DmLivV6iD7Lw59yF6q4g3U38XBh+Wmz2 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HxbNFOuUpy7cw8yefmRziJlU1fmLqfdGFcSfmZAIqI3adxIFvC4RKZfc0C6ISS8OOfsSYHPrjV
 GWcXKE6NHo4psvQ0w13kJenl6QRtw1kNUD5HYbWEZpu0LpKUNnKA9fqEhYFhkfl6fee0uh4kDd
 nOT3TVjlAbsjAyXVqx1UkY3cTc7kiezRyv+bxrVTUIYEr1nCe14pP5WVzNFbGiZBLKezlZ5k2n
 WdktjmRgg2vZe4KbIt3d/oUc9GmOo9UvTh+EbDkdp0FjssXp+3xUdaLzaXGNh7dnjRicIGaBru
 XAs=
X-SBRS: 2.7
X-MesageID: 5365170
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5365170"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:01:56 +0100
Message-ID: <20190910120207.10358-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 01/12] tools/ocaml: Add missing X86_EMU_VPCI
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3YXMgbWlzc2luZyBmcm9tIHg4Nl9hcmNoX2VtdWxhdGlvbl9mbGFncy4KClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAgfCAxICsKIHRvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybC5tbGkgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sIGIvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsLm1sCmluZGV4IDM1OTU4Yjk0ZDUuLjMwNTYyNWNiNmMgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbAorKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmwubWwKQEAgLTQ2LDYgKzQ2LDcgQEAgdHlwZSB4ODZfYXJjaF9lbXVsYXRpb25fZmxhZ3Mg
PQogCXwgWDg2X0VNVV9JT01NVQogCXwgWDg2X0VNVV9QSVQKIAl8IFg4Nl9FTVVfVVNFX1BJUlEK
Kwl8IFg4Nl9FTVVfVlBDSQogCiB0eXBlIHhlbl94ODZfYXJjaF9kb21haW5jb25maWcgPQogewpk
aWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSBiL3Rvb2xzL29jYW1s
L2xpYnMveGMveGVuY3RybC5tbGkKaW5kZXggNmM0MjY4ZDQ1My4uZGE5MzE2MGVkMyAxMDA2NDQK
LS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQorKysgYi90b29scy9vY2FtbC9s
aWJzL3hjL3hlbmN0cmwubWxpCkBAIC00MCw2ICs0MCw3IEBAIHR5cGUgeDg2X2FyY2hfZW11bGF0
aW9uX2ZsYWdzID0KICAgfCBYODZfRU1VX0lPTU1VCiAgIHwgWDg2X0VNVV9QSVQKICAgfCBYODZf
RU1VX1VTRV9QSVJRCisgIHwgWDg2X0VNVV9WUENJCiAKIHR5cGUgeGVuX3g4Nl9hcmNoX2RvbWFp
bmNvbmZpZyA9IHsKICAgZW11bGF0aW9uX2ZsYWdzOiB4ODZfYXJjaF9lbXVsYXRpb25fZmxhZ3Mg
bGlzdDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
