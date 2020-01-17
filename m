Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23B140D07
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:49:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSv1-0003qE-8V; Fri, 17 Jan 2020 14:48:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSuy-0003oi-M2
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:48:12 +0000
X-Inumbo-ID: 51e3bb16-3938-11ea-aecd-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51e3bb16-3938-11ea-aecd-bc764e2007e4;
 Fri, 17 Jan 2020 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=KLm0aIo35TTQJr1dQncUb6V/jnwGznF5/jwuV5rGa18=;
 b=XR8CnbU8u71aUMQAaFUTG/TQ2e7sU2tVF7ojRrNBwIkA51m67kPqcHWI
 heYaXNGjCp6SNWxy+h3MERofw1+5PBmcFQy7R4MebQ3UfXip98B/aG0JS
 V+UcyGbu2lPXYBzPC626CN3se+SS2mGhD3noS7uKFyWh3EbIduRYvGKwL I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O+2kf620fE7MSPrW62pkBOBoch4ravO2POYobYUqmiHg2snjlrGWGzqsMhyp8vHKuWACg8l5Bf
 Ryd+xaMdq9cQsq/gJkmGES0GskbjY/egnnuFCpYZNW9hsQP9DBqDZ1LsrnqbPp6l4jpXKky/51
 1hOFNnvzq7ADFGW70nccGL0QYoJj66BZswJ00W7OoT4z7yFjxkUSHifKlfCg1wa5goeX04Do7R
 JxjKhEw8zNrNfPWi8YppUUnckqg4J0MKycm0hug885gnkNeXu9Ip167LlzR8yRqf2opdFvxZ6b
 lHM=
X-SBRS: 2.7
X-MesageID: 11507692
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11507692"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:24 +0000
Message-ID: <20200117144726.582-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 08/10] libxl: event: Break out baton_wake
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4KVGVzdGVkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Ci0tLQp2MjogTm93IGl0IHRha2VzIGEgZ2MsIG5vdCBhbiBlZ2MuCi0tLQog
dG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMK
aW5kZXggM2U3NmZhNWFmNS4uNDVjYzY3OTQyZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfZXZlbnQuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCkBAIC0xNDAsNiArMTQw
LDE4IEBAIHN0YXRpYyB2b2lkIHBvbGxlcnNfbm90ZV9vc2V2ZW50X2FkZGVkKGxpYnhsX2N0eCAq
Y3R4KSB7CiAgICAgICAgIHBvbGxlci0+b3NldmVudHNfYWRkZWQgPSAxOwogfQogCitzdGF0aWMg
dm9pZCBiYXRvbl93YWtlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19wb2xsZXIgKndha2UpCit7Cisg
ICAgbGlieGxfX3BvbGxlcl93YWtldXAoZ2MsIHdha2UpOworCisgICAgd2FrZS0+b3NldmVudHNf
YWRkZWQgPSAwOworICAgIC8qIFRoaXMgc2VydmVzIHRvIG1ha2UgXzFfYmF0b24gaWRlbXBvdGVu
dC4gIEl0IGlzIE9LIGV2ZW4gdGhvdWdoCisgICAgICogdGhhdCBwb2xsZXIgbWF5IGN1cnJlbnRs
eSBiZSBzbGVlcGluZyBvbiBvbmx5IG9sZCBvc2V2ZW50cywKKyAgICAgKiBiZWNhdXNlIGl0IGlz
IGdvaW5nIHRvIHdha2UgdXAgYmVjYXVzZSB3ZSd2ZSBqdXN0IHByb2RkZWQgaXQsCisgICAgICog
YW5kIGl0IHBpY2sgdXAgbmV3IG9zZXZlbnRzIG9uIGl0cyBuZXh0IGl0ZXJhdGlvbiAob3IgcGFz
cworICAgICAqIG9uIHRoZSBiYXRvbikuICovCit9CisKIHZvaWQgbGlieGxfX2VnY19hb19jbGVh
bnVwXzFfYmF0b24obGlieGxfX2djICpnYykKICAgICAvKiBBbnkgcG9sbGVyIHdlIGhhZCBtdXN0
IGhhdmUgYmVlbiBgcHV0JyBhbHJlYWR5LiAqLwogewpAQCAtMTYwLDE0ICsxNzIsNyBAQCB2b2lk
IGxpYnhsX19lZ2NfYW9fY2xlYW51cF8xX2JhdG9uKGxpYnhsX19nYyAqZ2MpCiAgICAgICAgIC8q
IG5vLW9uZSBpbiBsaWJ4bCB3YWl0aW5nIGZvciBhbnkgZXZlbnRzICovCiAgICAgICAgIHJldHVy
bjsKIAotICAgIGxpYnhsX19wb2xsZXJfd2FrZXVwKGdjLCB3YWtlKTsKLQotICAgIHdha2UtPm9z
ZXZlbnRzX2FkZGVkID0gMDsKLSAgICAvKiBUaGlzIHNlcnZlcyB0byBtYWtlIF8xX2JhdG9uIGlk
ZW1wb3RlbnQuICBJdCBpcyBPSyBldmVuIHRob3VnaAotICAgICAqIHRoYXQgcG9sbGVyIG1heSBj
dXJyZW50bHkgYmUgc2xlZXBpbmcgb24gb25seSBvbGQgb3NldmVudHMsCi0gICAgICogYmVjYXVz
ZSBpdCBpcyBnb2luZyB0byB3YWtlIHVwIGJlY2F1c2Ugd2UndmUganVzdCBwcm9kZGVkIGl0LAot
ICAgICAqIGFuZCBpdCBwaWNrIHVwIG5ldyBvc2V2ZW50cyBvbiBpdHMgbmV4dCBpdGVyYXRpb24g
KG9yIHBhc3MKLSAgICAgKiBvbiB0aGUgYmF0b24pLiAqLworICAgIGJhdG9uX3dha2UoZ2MsIHdh
a2UpOwogfQogCiAvKgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
