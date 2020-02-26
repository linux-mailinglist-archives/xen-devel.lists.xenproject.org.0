Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182F616FDE1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:36:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uxa-0001Qp-JE; Wed, 26 Feb 2020 11:34:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6uxZ-0001Pg-0I
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:37 +0000
X-Inumbo-ID: e4d5f638-588b-11ea-93fd-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4d5f638-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KWtS4gjAy/REs2CdIOW7hoB+6OIzaJdNXKHYDGbqYWE=;
 b=YnFzxnqKdeRAgsIN9tSqlE6ZwdBwfG2d4J4sJlFbdEWp5SiCftxpLaNY
 fN2lVu0z6sCJwzBISrQFyUWdFxuWEFvR79by/392iuP3qKVZN9dh6I7DU
 vcWW1Bzi/EM/bsrvnY2xQZoQt314ee1W3fp+QoOiNXMRDzwdkIB+s6bqS U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ksSdPxKXO4HqSl6eSlqD+/HKjXtOnP2uRwpViptKgg5dg5+EKXed881rNmA3f2vt9XQ1F24Gdn
 MDcmzGk68yKjonCkcjMGRc5NzkKhejZ9GEQu4IVUFv89tsZ3eH/3n/Nma6eDM1lLx90yprt7jw
 VmBPOxgKVRWyotGr/A++BhdZZXqx/a/NbhpI4VD8YrfDfF5AIr0VCeOlCYHbNzpOhEmO7jlHMN
 gmkIdQtmFmQVd9zfi920L57Z9BmySkGVegkapI775zCUQDRloYwrhTYGUpGIFyuzfriWYd9kYS
 Yfk=
X-SBRS: 2.7
X-MesageID: 13038218
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13038218"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:38 +0000
Message-ID: <20200226113355.2532224-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 06/23] xen/build: Fix section-renaming of
 libfdt and libelf
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY29tbW9uL2xpYmVsZi9NYWtlZmlsZSwgd2hlbiBTRUNUSU9OUyBnZXRzIGRlZmluZWQKU1BF
Q0lBTF9EQVRBX1NFQ1RJT05TIGRvZXNuJ3QgZXhpc3QsIHNvIG9ubHkgInRleHQgZGF0YSIgc2Vj
dGlvbnMgYXJlCmJlZW4gcmVuYW1lZC4gVGhpcyB3YXMgZGlmZmVyZW50IGJlZm9yZSA0ODExNWQx
NDc0M2UgKCJNb3ZlIG1vcmUKa2VybmVsIGRlY29tcHJlc3Npb24gYml0cyB0byAuaW5pdC4qIHNl
Y3Rpb25zIikuCgpNb3ZlIFNQRUNJQUxfREFUQV9TRUNUSU9OUyBpbiBSdWxlcy5tayBiZWZvcmUg
aW5jbHVkaW5nICJNYWtlZmlsZSIgdG8KZml4IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vUnVsZXMubWsgfCAx
MiArKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL1J1bGVzLm1rIGIveGVuL1J1bGVzLm1rCmluZGV4IDE1
NDI2OWJmZDk2Yy4uYzdhMDY3ZDI1NDA5IDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIv
eGVuL1J1bGVzLm1rCkBAIC05Miw2ICs5MiwxMiBAQCBMREZMQUdTICs9ICQoTERGTEFHU19ESVJF
Q1QpCiAKIExERkxBR1MgKz0gJChMREZMQUdTLXkpCiAKK1NQRUNJQUxfREFUQV9TRUNUSU9OUyA6
PSByb2RhdGEgJChmb3JlYWNoIGEsMSAyIDQgOCAxNiwgXAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAkKGZvcmVhY2ggdywxIDIgNCwgXAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByb2RhdGEuc3RyJCh3
KS4kKGEpKSBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJv
ZGF0YS5jc3QkKGEpKSBcCisgICAgICAgICAgICAgICAgICAgICAgICAgJChmb3JlYWNoIHIscmVs
IHJlbC5ybyxkYXRhLiQocikubG9jYWwpCisKIGluY2x1ZGUgJChCQVNFRElSKS9hcmNoLyQoVEFS
R0VUX0FSQ0gpL1J1bGVzLm1rCiAKIERFUFMgPSAuKi5kCkBAIC0yMDYsMTIgKzIxMiw2IEBAIGVu
ZGlmCiAlLm86ICUuUyBNYWtlZmlsZQogCSQoQ0MpICQoQUZMQUdTKSAtYyAkPCAtbyAkQAogCi1T
UEVDSUFMX0RBVEFfU0VDVElPTlMgOj0gcm9kYXRhICQoZm9yZWFjaCBhLDEgMiA0IDggMTYsIFwK
LQkJCQkJICAgICQoZm9yZWFjaCB3LDEgMiA0LCBcCi0JCQkJCQkJcm9kYXRhLnN0ciQodykuJChh
KSkgXAotCQkJCQkgICAgcm9kYXRhLmNzdCQoYSkpIFwKLQkJCSAkKGZvcmVhY2ggcixyZWwgcmVs
LnJvLGRhdGEuJChyKS5sb2NhbCkKLQogJChmaWx0ZXIgJS5pbml0Lm8sJChvYmoteSkgJChvYmot
YmluLXkpICQoZXh0cmEteSkpOiAlLmluaXQubzogJS5vIE1ha2VmaWxlCiAJJChPQkpEVU1QKSAt
aCAkPCB8IHNlZCAtbiAnL1swLTldL3tzLDAwKiwwLGc7cDt9JyB8IHdoaWxlIHJlYWQgaWR4IG5h
bWUgc3ogcmVzdDsgZG8gXAogCQljYXNlICIkJG5hbWUiIGluIFwKLS0gCkFudGhvbnkgUEVSQVJE
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
