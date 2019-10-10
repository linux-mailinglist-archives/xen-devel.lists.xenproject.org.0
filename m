Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E871D2D7D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:17:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIa6N-0006Po-4D; Thu, 10 Oct 2019 15:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubId=YD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIa6L-0006P3-O1
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:11:37 +0000
X-Inumbo-ID: 32d2e141-eb70-11e9-931d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32d2e141-eb70-11e9-931d-12813bfff9fa;
 Thu, 10 Oct 2019 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570720275;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=sn0ugxg7w9r0VL1pSZrWuU6Z6uD7Y8SdHivTUIU0twk=;
 b=Lnj6RV9IwdGhiF4mohEtoVImq46kAug7XatijdE/SzjsjWgpsRB9gySl
 dEcF1vVj/3owmRXeKQh25MllzqaPmQaBbq6CuPZXHMbm50ZLax+JqSgqd
 Rfak1JghGUjM7mknnHsFTGcV5BJcMNPgXa8MRHnQEsq5D3KbwvBSgJ9Rm M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V0z/7uepI8zVcSkReeO61Tz7j1n9eMKltEPkHz6qhPjUv6u9sfFranPtr3UcsGRDtDtTNqcxGm
 XQB3w95eG2EeUbg5z7cXDSXNE+jl5N9iERzD3BpanfQoabtTF4kqZrCsTISTHc9b2LDJwDKiYY
 4jULCrki43VltSiEw3csZ64GTxV1wx1fUKEPKSAwOviBjdGLyjHePV5zXCdG5V0VRQ6a2TElLo
 iVESlbuyvWrZtOYAw2ILGBImruS4iP4ynlXytqpzP6l4MJxQb7vWCZhIcCfWDAMS2Yr5nL7ZyU
 s2Y=
X-SBRS: 2.7
X-MesageID: 6988480
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="6988480"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 16:11:02 +0100
Message-ID: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 0/9] libxl memkb & pt defaulting
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB2MiBvZiBteSBzZXJpZXMgdG8gc29ydCBvdXQgdGhlIHNoYWRvdy9pb21tdSBtZW1v
cnkgYW5kIHBjaQpwYXNzdGhyb3VnaCBzaXR1YXRpb24uICBJIHRoaW5rIHRoaXMgc2VyaWVzIHdp
bGwgbWFzayB0aGUgYnVnIHdoaWNoIGlzCmN1cnJlbnRseSBibG9ja2luZyBzdGFnaW5nIHByb3Bh
Z2F0aW5nIHRvIG1hc3Rlci4KCkkgaGFkIHNvbWUgZGlmZmljdWx0eSB0ZXN0aW5nIHRoaXMsIGFz
IHRoZSB0ZXN0IGJveCB1bmRlciBteSBkZXNrCmRvZXNuJ3QgZG8gUFQgYW5kIEkgZGlkbid0IHdh
bnQgdG8gd2FpdCB0byBib29rIG9uZSBvdXQgZnJvbSB0aGUgdGVzdApsYWIuICBTbyBJIGhhdmUg
ZXhlY3V0ZWQgb25seSBzb21lIG9mIHRoZSBuZXcgY29kZSBpbiBsaWJ4bC4KCkkgd291bGQgcmVh
bGx5IGFwcHJlY2lhdGUgcmV2aWV3IGJ5IGEgaHlwZXJ2aXNvciBleHBlcnQgb24gdGhlIG1haW4K
Y2h1bmsgb2YgbmV3IGNvZGUgaW4gbGlieGwgYWRkZWQgaW4gcGF0Y2ggOSwgd2hpY2ggaXMgd2hl
cmUgYWxsIHRoZQpsb2dpYyByZWxhdGVkIHRvIHBhc3N0aHJvdWdoIGVuYWJsaW5nIGFuZCBtb2Rl
IG5vdyByZXNpZGVzLgoKIGFtIDEgbGlieGw6IE9mZmVyIEFQSSB2ZXJzaW9ucyAweDA0MDcwMCBh
bmQgMHgwNDA4MDAKIHIgIDIgeGw6IFBhc3MgbGlieGxfZG9tYWluX2NvbmZpZyB0byBmcmVlbWVt
KCksIGluc3RlYWQgb2YgYl9pbmZvCiByKiAzIGxpYnhsOiBsaWJ4bF9fZG9tYWluX2NvbmZpZ19z
ZXRkZWZhdWx0OiBOZXcgZnVuY3Rpb24KIHIqIDQgbGlieGw6IGxpYnhsX2RvbWFpbl9uZWVkX21l
bW9yeTogTWFrZSBpdCB0YWtlIGEgZG9tYWluX2NvbmZpZwogICogNSBsaWJ4bDogTW92ZSBzaGFk
b3dfbWVta2IgYW5kIGlvbW11X21lbWtiIGRlZmF1bHRpbmcgaW50byBsaWJ4bAogYSAgNiBsaWJ4
bDogUmVtb3ZlL2RlcHJlY2F0ZSBsaWJ4bF9nZXRfcmVxdWlyZWRfKl9tZW1vcnkgZnJvbSB0aGUg
QVBJCiAgKyA3IGxpYnhsOiBjcmVhdGU6IHNldGRlZmF1bHQ6IE1ha2UgbGlieGxfcGh5c2luZm8g
aW5mb1sxXQogICsgOCBsaWJ4bDogY3JlYXRlOiBzZXRkZWZhdWx0OiBNb3ZlIHBoeXNpbmZvIGlu
dG8gY29uZmlnX3NldGRlZmF1bHQKICArIDkgbGlieGwveGw6IE92ZXJoYXVsIHBhc3N0aHJvdWdo
IHNldHRpbmcgbG9naWMKCmE9YWNrZWQ7IHI9cmV2aWV3ZWQ7IG09bWVzc2FnZSBjaGFuZ2VkOyAq
PXBhdGNoIGNoYW5nZWQ7ICs9bmV3IHBhdGNoCgogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAg
ICB8ICAyNCArKysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgfCAxNzQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxf
ZG0uYyAgICAgICB8ICAgNyArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAgICB8ICAgNyAr
LQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAxMyArKystCiB0b29scy9saWJ4bC9s
aWJ4bF9tZW0uYyAgICAgIHwgIDY5ICsrKysrKysrKysrKystLS0tCiB0b29scy9saWJ4bC9saWJ4
bF90eXBlcy5pZGwgIHwgICA1ICstCiB0b29scy9saWJ4bC9saWJ4bF91dGlscy5jICAgIHwgIDE1
IC0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmggICAgfCAgIDIgKy0KIHRvb2xzL3hsL3hs
X3BhcnNlLmMgICAgICAgICAgfCAgODIgKystLS0tLS0tLS0tLS0tLS0tLS0KIHRvb2xzL3hsL3hs
X3ZtY29udHJvbC5jICAgICAgfCAgIDYgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDI1NCBpbnNlcnRp
b25zKCspLCAxNTAgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
