Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1DE1BB5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:04:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGFa-0005uK-HM; Wed, 23 Oct 2019 13:00:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGFY-0005tu-U2
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:28 +0000
X-Inumbo-ID: 1274ee78-f595-11e9-947c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1274ee78-f595-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835622;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=pxm+KtmOmPpj5rMxf2t47ahTxsRfV7Ti1lbE1kx+j/4=;
 b=AFRUKjtrqp2eVqeS4uLkJ14QuKWl6QNTbXSnbEMMJdDNWyAfGuu4ZuWK
 sHr7pcfitQSgenYjOVa1cxEo6mGYso71Yx120bTtDmXSjM8Y+K8FyDGFn
 CZBYshkD4VWQczpydu5SocnzXIi+xOE2AKWFAXfSp+ZRfYOnM7TCilkUX M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: x2MiVNpHNrUO9edxDymFBKpFBGE8vBwN2aYecz0FoS9ptWObYOGH4egqS0bE3qhDe/x1Q+u8px
 hSI14fOt20nv6I6iqBtAPRKyhIi92vra6GRI0GVSQZTGmmrzQ3k1FAPeHU2GXDJphejVdoGcKT
 iAa4LKMZKvVXGrQvbzQ/SPl/xocez+gp5TU34imB9vmN3KKoZVbd0sOjNMl0i0lYmX/macwJOJ
 gFq1S9CznL+fUY9n3fxeRhk1FdjXv+GOXSV4JXmEAIAsJLehCu7e8xdaKhzQ98Cr0QOrnmHuzE
 FXo=
X-SBRS: 2.7
X-MesageID: 7754866
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7754866"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:02 +0100
Message-ID: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 00/11] libxl memkb & pt
 defaulting
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony
 PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSAqc3RpbGwqIHdhbnQgdG8gc29ydCBvdXQgdGhlIHNoYWRvdy9pb21tdSBtZW1vcnkgYW5kIHBj
aSBwYXNzdGhyb3VnaApzaXR1YXRpb24gaW4gNC4xMywgdG8gYXZvaWQgcHJvbXVsZ2F0aW5nIGEg
d3JvbmcgbGlieGwgQVBJIGluIGEgc3RhYmxlCnJlbGVhc2UuCgpUaGUgb25seSBjaGFuZ2VzIHNp
bmNlIHY0IGFyZSBjaGFuZ2UgdGhlIGRlZmF1bHQgdmFsdWUgbmFtZSBmb3IgdGhlCiJwYXNzdGhy
b3VnaCIgY29uZmlnIHNldHRpbmcgdG8gImRlZmF1bHQiLCBhcHJvcG9zIG9mIHRoZSBkaXNjdXNz
aW9uLAphbmQgdG8gYWRkIGEgbmV3IHBhdGNoIHRvIGNoYW5nZSB0aGUgd2F5IHRoZSBBUk0gY29k
ZSB3aWxsIGRlYWwgd2l0aApuZXcgcGFzc3Rocm91Z2ggbW9kZXMgYWRkZWQgaW4gdGhlIGZ1dHVy
ZS4KClRob3NlIGFyZSBhbHNvIHRoZSBvbmx5IHBhdGNoZXMgd2l0aG91dCBhbiBhcHByb3ByaWF0
ZSBhY2svcmV2aWV3LgpQaW5nLCBmZWxsb3cgdG9vbHMgbWFpbnRhaW5lcnM/CgpJYW4gSmFja3Nv
biAoMTEpOgpJYW4gSmFja3NvbiAoMTApOgogIGEgIDAxIGxpYnhsOiBPZmZlciBBUEkgdmVyc2lv
bnMgMHgwNDA3MDAgYW5kIDB4MDQwODAwCiAgciAgMDIgeGw6IFBhc3MgbGlieGxfZG9tYWluX2Nv
bmZpZyB0byBmcmVlbWVtKCksIGluc3RlYWQgb2YgYl9pbmZvCiAgciAgMDMgbGlieGw6IGxpYnhs
X19kb21haW5fY29uZmlnX3NldGRlZmF1bHQ6IE5ldyBmdW5jdGlvbgogIHIgIDA0IGxpYnhsOiBs
aWJ4bF9kb21haW5fbmVlZF9tZW1vcnk6IE1ha2UgaXQgdGFrZSBhIGRvbWFpbl9jb25maWcKICBy
ICAwNSBsaWJ4bDogTW92ZSBzaGFkb3dfbWVta2IgYW5kIGlvbW11X21lbWtiIGRlZmF1bHRpbmcg
aW50byBsaWJ4bAogIGEgIDA2IGxpYnhsOiBSZW1vdmUvZGVwcmVjYXRlIGxpYnhsX2dldF9yZXF1
aXJlZF8qX21lbW9yeSBmcm9tIHRoZSBBUEkKICBhICAwNyBsaWJ4bDogY3JlYXRlOiBzZXRkZWZh
dWx0OiBNYWtlIGxpYnhsX3BoeXNpbmZvIGluZm9bMV0KICBhICAwOCBsaWJ4bDogY3JlYXRlOiBz
ZXRkZWZhdWx0OiBNb3ZlIHBoeXNpbmZvIGludG8gY29uZmlnX3NldGRlZmF1bHQKICBhICAwOSBs
aWJ4bDogTW92ZSBkb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdCBlYXJsaWVyCiAgICAgMTAg
bGlieGwveGw6IE92ZXJoYXVsIHBhc3N0aHJvdWdoIHNldHRpbmcgbG9naWMKICAgKyAxMSBsaWJ4
bDogT24gQVJNLCByZWplY3QgZnV0dXJlIG5ldyBwYXNzdGhyb3VnaCBtb2RlcyB0b28KCmE9YWNr
ZWQ7IHI9cmV2aWV3ZWQ7ICo9cGF0Y2ggY2hhbmdlZDsgKz1uZXcgcGF0Y2gKCiBkb2NzL21hbi94
bC5jZmcuNS5wb2QuaW4gICAgIHwgICA2ICsrCiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAg
IHwgIDI0ICsrKysrLQogdG9vbHMvbGlieGwvbGlieGxfYXJjaC5oICAgICB8ICAgNiArKwogdG9v
bHMvbGlieGwvbGlieGxfYXJtLmMgICAgICB8ICAzMCArKysrKysrKwogdG9vbHMvbGlieGwvbGli
eGxfY3JlYXRlLmMgICB8IDE3MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5jICAgICAgIHwgICA3ICstCiB0b29scy9saWJ4
bC9saWJ4bF9kb20uYyAgICAgIHwgICA3ICstCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
IHwgIDEzICsrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX21lbS5jICAgICAgfCAgNjkgKysrKysrKysr
KysrKy0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCAgfCAgIDcgKy0KIHRvb2xzL2xp
YnhsL2xpYnhsX3V0aWxzLmMgICAgfCAgMTUgLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdXRpbHMu
aCAgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfeDg2LmMgICAgICB8ICA0MSArKysrKysr
KysrKwogdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgICB8ICA4MiArKy0tLS0tLS0tLS0tLS0t
LS0tLS0KIHRvb2xzL3hsL3hsX3ZtY29udHJvbC5jICAgICAgfCAgIDYgKy0KIDE1IGZpbGVzIGNo
YW5nZWQsIDMzMSBpbnNlcnRpb25zKCspLCAxNTYgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
