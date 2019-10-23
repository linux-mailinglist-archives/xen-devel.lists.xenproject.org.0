Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4EE20F4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJoX-0007Ol-8O; Wed, 23 Oct 2019 16:48:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNJoV-0007OB-G7
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:48:47 +0000
X-Inumbo-ID: f7e0cd28-f5b4-11e9-9487-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7e0cd28-f5b4-11e9-9487-12813bfff9fa;
 Wed, 23 Oct 2019 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571849322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BeBV/g3lYfIpcMCzp5832SDhesBmIfhSkaYu+f4vgr0=;
 b=RWTQrWOs1WAMECyq9+TnF3/53cHWQHfQXYKIfXF8JZeo4kUuZbS6Xqmy
 HyDESS3i1ergGfZ3xNOt8IZ2gUHubypejxLdrjsgJCdaPIh+DubaI3BDR
 GbVwhl2v37IkEHyzLECEHQcWJR1nIXIlD/4QKWiu1JOaB+MV4ut3naFot U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GngGbaPcj5SXYtFeNerT4M9y1Lg1j0NwomcrN4zhIzBYQZOgePDPs3UbDOjW4Ksjcy2PySZcU6
 KYc9hJpWbogDwyX1hSqW60S4MniicA8DT2lppFGSmrcYx17evuv5orhHBU9HgoDIlIM3cMJqrk
 xZkO+F9o3MEdEUckQmInbPP4Fpo4xxg8CO2Gi0JGt1cGMqlbip3IKN/gNONNDlUzp38EwMQCgl
 Bu1of3chFVzg5iXHyaQ0jfoga3C1xJI+/7PZzkDzko8HnNbGmdNLWYkKXmQ41WIEWrMqBj1RpS
 AyI=
X-SBRS: 2.7
X-MesageID: 7427937
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7427937"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:15 +0100
Message-ID: <20191023164837.2700240-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 01/23] xen: Fix strange byte in
 common/Kconfig
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/mixed; boundary="===============2818683688371824634=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2818683688371824634==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

Q3VycmVudCBkZXNjcmlwdGlvbiBvZiB0aGUgZmlsZSBieSBgZmlsZWA6CiAgICBjb21tb24vS2Nv
bmZpZzogTm9uLUlTTyBleHRlbmRlZC1BU0NJSSB0ZXh0CgpDaGFuZ2UgdGhhdCBieXRlIHRvIGFu
IGFzY2lpIHF1b3RlIHNvIHRoZSBmaWxlIGNhbiBiZWNvbWUgcHJvcGVybHkKZW5jb2RlZCwgYW5k
IGFsbCBBU0NJSS4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgotLS0KIHhlbi9jb21tb24vS2NvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZwppbmRleCA3YjVkZDlkNDk1OTYuLjVjMGY4
ZDMwYzcwOSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCisrKyBiL3hlbi9jb21tb24v
S2NvbmZpZwpAQCAtMzg2LDcgKzM4Niw3IEBAIGNvbmZpZyBUUkFDRUJVRkZFUgogCWRlZmF1bHQg
eQogCS0tLWhlbHAtLS0KIAkgIEVuYWJsZSB0cmFjaW5nIGluZnJhc3RydWN0dXJlIGFuZCBwcmUt
ZGVmaW5lZCB0cmFjZXBvaW50cyB3aXRoaW4gWGVuLgotCSAgVGhpcyB3aWxsIGFsbG93IGxpdmUg
aW5mb3JtYXRpb24gYWJvdXQgWGVuknMgZXhlY3V0aW9uIGFuZCBwZXJmb3JtYW5jZQorCSAgVGhp
cyB3aWxsIGFsbG93IGxpdmUgaW5mb3JtYXRpb24gYWJvdXQgWGVuJ3MgZXhlY3V0aW9uIGFuZCBw
ZXJmb3JtYW5jZQogCSAgdG8gYmUgY29sbGVjdGVkIGF0IHJ1biB0aW1lIGZvciBkZWJ1Z2dpbmcg
b3IgcGVyZm9ybWFuY2UgYW5hbHlzaXMuCiAJICBNZW1vcnkgYW5kIGV4ZWN1dGlvbiBvdmVyaGVh
ZCB3aGVuIG5vdCBhY3RpdmUgaXMgbWluaW1hbC4KIAotLSAKQW50aG9ueSBQRVJBUkQKCg==


--===============2818683688371824634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2818683688371824634==--
