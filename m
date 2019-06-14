Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6945A9D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 12:40:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbjay-0002jQ-9L; Fri, 14 Jun 2019 10:38:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbjaw-0002j4-Lo
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 10:38:06 +0000
X-Inumbo-ID: 7db7f8c5-8e90-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7db7f8c5-8e90-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 10:38:05 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G2+8im8D8GLUh+HlmedeiSbvtjFLzF55ecpzCFXra/mnNfU4QcuNDQLtt4NdyxU5Ccfk2mAyAe
 sCrr4pzQTaIoosZQK4EZClRmrb95XTDXlMhr5E/Fs7NIv/pzh92xiXAdwP6owtoIcBvPbBhZcn
 q4Wf35vOA6x6t2j6L2ratY2HYX7wr8Z326AwOX0jriwFdEb4o1PHeZAUBMtrGVE7YDTejWAcJu
 ZuDe/dABGktSx2riw10wFKSs698VpECmgztvQ+2M+t+SMyepGBR3uKjGd/heP4V7JBIOBdO8xV
 cbg=
X-SBRS: 2.7
X-MesageID: 1749154
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1749154"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 11:37:54 +0100
Message-ID: <20190614103801.22619-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614103801.22619-1-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/9] libxl: Pointer on usage of
 libxl__domain_userdata_lock
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgY3VycmVudGx5IGRpZmZpY3VsdCB0byBrbm93IGhvdy93aGVuL3doeSB0aGUgdXNlcmRh
dGEgbG9jayBpcwpzdXBwb3NlZCB0byBiZSB1c2VkLiBBZGQgc29tZSBwb2ludGVycyB0byB0aGUg
aG90cGx1ZyBjb21tZW50cy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDYgKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXgg
NWY5MGMyMTBhZi4uY2E3MjA2YWFhYyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50
ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC00NDc0LDYgKzQ0
NzQsMTIgQEAgdm9pZCBsaWJ4bF9fdW5sb2NrX2RvbWFpbl91c2VyZGF0YShsaWJ4bF9fZG9tYWlu
X3VzZXJkYXRhX2xvY2sgKmxvY2spOwogICogZGF0YSBzdG9yZS4gVGhlIHJlZ2lzdHJ5IGVudHJ5
IGluIGxpYnhsIHByaXZhdGUgZGF0YSBzdG9yZQogICogaXMgImxpYnhsLWpzb24iLgogICogQ2Fs
bGVyIG11c3QgaG9sZCB1c2VyIGRhdGEgbG9jay4KKyAqCisgKiBPdGhlciBuYW1lcyB1c2VkIGZv
ciB0aGlzIGxvY2sgdGhyb3VnaG91dCB0aGUgbGlieGwgY29kZSBhcmUganNvbl9sb2NrLAorICog
bGlieGxfX2RvbWFpbl91c2VyZGF0YV9sb2NrLCAibGlieGwtanNvbiIsIGRhdGEgc3RvcmUgbG9j
ay4KKyAqCisgKiBTZWUgdGhlIGNvbW1lbnQgZm9yIGxpYnhsX19hb19kZXZpY2UsIGFuZCAiQWxn
b3JpdGhtIGZvciBoYW5kbGluZyBkZXZpY2UKKyAqIHJlbW92YWwiLCBmb3IgaW5mb3JtYXRpb24g
YWJvdXQgdXNpbmcgdGhlIGxpYnhsLWpzb24gbG9jayAvIGpzb25fbG9jay4KICAqLwogaW50IGxp
YnhsX19nZXRfZG9tYWluX2NvbmZpZ3VyYXRpb24obGlieGxfX2djICpnYywgdWludDMyX3QgZG9t
aWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY29u
ZmlnICpkX2NvbmZpZyk7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
