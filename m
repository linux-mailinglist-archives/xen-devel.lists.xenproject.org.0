Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72F344E3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 12:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY75R-0008Um-VJ; Tue, 04 Jun 2019 10:54:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Qb1=UD=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hY75P-0008Uh-VR
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 10:54:36 +0000
X-Inumbo-ID: 23125fe6-86b7-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23125fe6-86b7-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 10:54:34 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: XuiI/0E4Sk916lyiZLR8GPgf/4jW7PgAyVK9YST6LQvIMyXNoG49aw544rY1tB81VRsm549uEk
 4fxK21Q/diV6P5ePrQYkoK8wweRQvwTQo9w+5LUFVagaEnohCuxkKc7Z8L3H/D71tn7oWUvg1E
 SuSqr8RhsKuTQvJFLoX3N7NgJgyexINIFO+xVXCAN5jJr/5Zo+xLMjsdZ/ZFsehVuWAjrZn/yF
 EsWhMDjw6lX1u75a08BVFPICeDzXO/vJAxx/FmHhUFcp3UMZMoDm30nPlAMTg8Yrl3hqsZatCa
 b6A=
X-SBRS: 2.7
X-MesageID: 1290709
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1290709"
Date: Tue, 4 Jun 2019 11:54:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190604105431.GG2126@perard.uk.xensource.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409164542.30274-1-anthony.perard@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: [Xen-devel] Ping: [PATCH 0/9] libxl: New slow lock + fix
 libxl_cdrom_insert with QEMU depriv
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8KCk9uIFR1ZSwgQXByIDA5LCAyMDE5IGF0IDA1OjQ1OjMzUE0gKzAxMDAsIEFudGhvbnkg
UEVSQVJEIHdyb3RlOgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGZpeCBsaWJ4bF9jZHJvbV9pbnNlcnQg
dG8gd29yayB3aXRoIGEgZGVwcml2aWxlZGdlIFFFTVUuIEZvcgo+IHRoYXQsIHdlIG5lZWQgdG8g
dXNlIGxpYnhsX19ldl9xbXAuICBGb3IgdGhhdCwgd2UgbmVlZCBhIG5ldyBsb2NrIGJlY2F1c2UK
PiB1c2VyZGF0YV9sb2NrIGNhbid0IGJlIHVzZWQgYW55bW9yZS4KPiAKPiBQYXRjaCBzZXJpZXMg
YXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoKPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9n
aXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmxpYnhsLXNsb3ctbG9j
ay12MQo+IAo+IEFudGhvbnkgUEVSQVJEICg5KToKPiAgIGxpYnhsX2ludGVybmFsOiBSZW1vdmUg
bG9zdCBjb21tZW50Cj4gICBsaWJ4bDogUG9pbnRlciBvbiB1c2FnZSBvZiBsaWJ4bF9fZG9tYWlu
X3VzZXJkYXRhX2xvY2sKPiAgIGxpYnhsX2ludGVybmFsOiBTcGxpdCBvdXQgdXNlcmRhdGEgbG9j
ayBmdW5jdGlvbgo+ICAgbGlieGxfaW50ZXJuYWw6IENyZWF0ZSBuZXcgbG9jayBmb3IgZGV2aWNl
cyBob3RwbHVnIHZpYSBRTVAKPiAgIGxpYnhsX2Rpc2s6IFJlb3JnYW5pc2UgbGlieGxfY2Ryb21f
aW5zZXJ0Cj4gICBsaWJ4bF9kaXNrOiBDdXQgbGlieGxfY2Ryb21faW5zZXJ0IGludG8gc3RlcHMg
Li4KPiAgIGxpYnhsOiBNb3ZlIHFtcF9wYXJhbWV0ZXJzXyogcHJvdG90eXBlcyB0byBsaWJ4bF9p
bnRlcm5hbC5oCj4gICBsaWJ4bF9kaXNrOiBVc2UgZXZfcW1wIGluIGxpYnhsX2Nkcm9tX2luc2Vy
dAo+ICAgbGlieGxfZGlzazogSW1wbGVtZW50IG1pc3NpbmcgdGltZW91dCBmb3IgbGlieGxfY2Ry
b21faW5zZXJ0Cj4gCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAgICAgfCAzMzAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuYyB8ICA3NyArKysrKysrLQo+ICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDcz
ICsrKysrKy0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAgfCAgODkgKysrKy0tLS0t
LQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQyNiBpbnNlcnRpb25zKCspLCAxNDMgZGVsZXRpb25zKC0p
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
