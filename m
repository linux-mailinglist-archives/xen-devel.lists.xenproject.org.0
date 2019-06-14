Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D545B70
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:30:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkN0-0008Ot-FS; Fri, 14 Jun 2019 11:27:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkMz-0008Oe-FH
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:27:45 +0000
X-Inumbo-ID: 6dc544ba-8e97-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6dc544ba-8e97-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 11:27:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EsWbqUuXwiKTE62cnB2MlQLTVuFOkRKut5yAyHADjC9KfeF60V5mvnV54IWDI35xJtMYiFLy/J
 XVnb9/jnmwwZEQKN4Tt+1BaVb1Jaz4pM6pvg/X9a5W+vTM5P3ymV9E4aC1Qu2h/p95e88s4RIC
 y9+JqkhBx4DJn4ffbwPMIGyStMgvHW7W3Gg5qzc3LYKcy8oZlle//0bxkMwt4z+2qxVkE8x6xi
 SBOGUe+Z4G++/d5QND85Qt3e42VBS3v5k53TkAcn5lfcqB1/uoVX4tlV93UvuwkeKp8aJbANn2
 lZY=
X-SBRS: 2.7
X-MesageID: 1737600
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737600"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:39 +0100
Message-ID: <20190614112444.29980-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 10/15] libxl_usb: Use proper domid value,
 from libxl__device
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YW8tPmRvbWlkIGlzbid0IGEgcmVsaWFibGUgd2F5IG9mIGdldHRpbmcgYSBkb21pZCwgaXQgbWln
aHQgbm90IGJlIHNldAoodGhpcyBpc24ndCB0aGUgY2FzZSBoZXJlKS4gVGhlIHJpZ2h0IGRvbWlk
IHZhbHVlIGNhbiBiZSBmb3VuZCBpbiB0aGUKbGlieGxfX2RldmljZSAod2hpY2ggaXMgdGhlIGRl
dmljZSB3ZSB3YW50IHRvIHJlbW92ZSkgYXR0YWNoZWQgdG8KbGlieGxfX2FvX2RldmljZS4KClNp
Z25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgot
LS0KIHRvb2xzL2xpYnhsL2xpYnhsX3VzYi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxf
dXNiLmMgYi90b29scy9saWJ4bC9saWJ4bF91c2IuYwppbmRleCBhZGIxMjJhYzg1Li4zZDM4OWMw
MTk4IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF91c2IuYworKysgYi90b29scy9saWJ4
bC9saWJ4bF91c2IuYwpAQCAtNTE1LDcgKzUxNSw3IEBAIHZvaWQgbGlieGxfX2luaXRpYXRlX2Rl
dmljZV91c2JjdHJsX3JlbW92ZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgbGlieGxfZGV2aWNlX3Vz
YmRldiAqdXNiZGV2cyA9IE5VTEw7CiAgICAgaW50IG51bV91c2JkZXYgPSAwOwogICAgIGludCBp
LCByYzsKLSAgICB1aW50MzJfdCBkb21pZCA9IGFvLT5kb21pZDsKKyAgICB1aW50MzJfdCBkb21p
ZCA9IGFvZGV2LT5kZXYtPmRvbWlkOwogICAgIGludCB1c2JjdHJsX2RldmlkID0gYW9kZXYtPmRl
di0+ZGV2aWQ7CiAgICAgbGlieGxfZGV2aWNlX3VzYmN0cmwgdXNiY3RybDsKICAgICBsaWJ4bF91
c2JjdHJsaW5mbyB1c2JjdHJsaW5mbzsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
