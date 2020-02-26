Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AF16FE14
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:44:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v4H-0003Gt-C1; Wed, 26 Feb 2020 11:41:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v4F-0003FY-Sg
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:31 +0000
X-Inumbo-ID: ec8bb9a2-588c-11ea-a490-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec8bb9a2-588c-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=odP+2+4s5ItcxBpgk9Rcfi1qr590Uq9ubJZSXq4LO5Y=;
 b=h3eCppYN0UgpnebcHzoeRh2kRokpcaXrPrfokP+NFO4jGOu5qtJo4a8S
 oTgbySILr7sILw6CaKb7PyXdD+4v3Paw2wMyX7x3rh2Mb14q8CRmgW95E
 rsIMwGYf67RixWWkbhn0j66Mo8hJQe5lJnMnV8N8qwz5D7t9vuklR3vKV k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tXCyrG59cVrZXeL/nWxJqmn1FP0hWqAAlnI/09+yA/V+Y3Mficu16aLZawdJJe0D5DBsp2n8g4
 ktX8btYMjKg8OzqC98lmKxOqZsF65q6dHWzgHjnSt+DDMHUNJbDLKkmkVw5fIQu2Aq6+G5Qkcy
 f7Bp4VXY/70KHUiIC65eAxzK4ceb9pEyNOSd5RdletWW5XGoYFhMRu3qg/trkEs8wOG0Qqwqhn
 SFbu0tcegg0P+rZPYs2Ee5f+LypPnFEO0fYaW1e6nEIl2hBAgFT01r9kgEg5LLGY3yP1+CJ5/b
 A4Q=
X-SBRS: 2.7
X-MesageID: 13462023
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13462023"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:53 +0000
Message-ID: <20200226113355.2532224-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 21/23] xen/build: Use if_changed for
 prelink*.o
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgY2hhbmdlIHRoZSBkZXBlbmRlbmNpZXMgb2YgcHJlbGluay1lZmkubyBzbyB0aGF0IHdlIGNh
biB1c2UgdGhlCnNhbWUgY29tbWFuZCBsaW5lLiBUaGUgZGVwZW5kZW5jeSBvbiBlZmkvYnVpbHRf
aW4ubyBpc24ndCBuZWVkZWQKYmVjYXVzZSwgd2UgYWxyZWFkeSBoYXZlOgogICAgZWZpLyoubzog
ZWZpL2J1aWx0X2luLm8KdG8gYnVpbGQgZWZpLyoubyBmaWxlcyB0aGF0IHByZWxpbmstZWZpLm8g
bmVlZHMuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgfCA4ICsrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQppbmRleCAxYmU5NDg0
NmUxMWYuLjU1YzZhZThjZTBkMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCisr
KyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMTMxLDExICsxMzEsMTEgQEAgcHJlbGluay5v
OiAkKHBhdHN1YnN0ICUvYnVpbHRfaW4ubywlL2J1aWx0X2luX2Jpbi5vLCQoQUxMX09CSlMpKSBw
cmVsaW5rX2x0by5vCiBwcmVsaW5rLWVmaS5vOiAkKHBhdHN1YnN0ICUvYnVpbHRfaW4ubywlL2J1
aWx0X2luX2Jpbi5vLCQoQUxMX09CSlMpKSBwcmVsaW5rLWVmaV9sdG8ubyBlZmkvYm9vdC5pbml0
Lm8KIAkkKExEKSAkKFhFTl9MREZMQUdTKSAtciAtbyAkQCAkXgogZWxzZQotcHJlbGluay5vOiAk
KEFMTF9PQkpTKQotCSQoTEQpICQoWEVOX0xERkxBR1MpIC1yIC1vICRAICReCitwcmVsaW5rLm86
ICQoQUxMX09CSlMpIEZPUkNFCisJJChjYWxsIGlmX2NoYW5nZWQsbGQpCiAKLXByZWxpbmstZWZp
Lm86ICQoQUxMX09CSlMpIGVmaS9ib290LmluaXQubyBlZmkvcnVudGltZS5vIGVmaS9jb21wYXQu
bwotCSQoTEQpICQoWEVOX0xERkxBR1MpIC1yIC1vICRAICQoZmlsdGVyLW91dCAlL2VmaS9idWls
dF9pbi5vLCReKQorcHJlbGluay1lZmkubzogJChmaWx0ZXItb3V0ICUvZWZpL2J1aWx0X2luLm8s
JChBTExfT0JKUykpIGVmaS9ib290LmluaXQubyBlZmkvcnVudGltZS5vIGVmaS9jb21wYXQubyBG
T1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkLGxkKQogZW5kaWYKIAogJChUQVJHRVQpLXN5bXM6IHBy
ZWxpbmsubyB4ZW4ubGRzCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
