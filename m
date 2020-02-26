Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048916FDE9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:37:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uxA-000189-No; Wed, 26 Feb 2020 11:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6ux9-00017s-Va
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:12 +0000
X-Inumbo-ID: e2ddc95b-588b-11ea-93fd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2ddc95b-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fmgWIdjipiwuK2QR7dZ5Eh7l3cqFUNollWIfYkP9fcM=;
 b=UbP/EKnO7jfPrpCWOz/xMdN8YY7Q8PushuNIrHjBnhXYO/2Eh1CSS6na
 PPXCNh4N7A2z0wZ/BxyNLkDsRahhyIsEJ3OwzyrM4mfUXnV4Mcv3XckeP
 dHAHJTGtfZbbYlXvPVBgbnTrOJZWvGSgbrzZwRmTfVb0hGjIC//6boTu2 4=;
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
IronPort-SDR: yi5GqRzYnddZot95xlF5smO8eI3J92QrdS8UCK8WmMKHkT/xm2tl9NjLJvOyu69yxZQTiYTUoN
 gFUVFO/xDF4CRIVmAP6mhlxEyCO3ypgJCvjddhY95q7rTkemHAbIWUtV8zcdK0oCVx35dR6N0p
 l9syOqAID8ZiRxjWq5qmgIEDcWnRDhNqY+Rig5qPeyP7Oi5iewBkaHkbRpOdXqJuUoyjo1PvlZ
 uaka6Rp7bFt0rsgReicq6yuuzBu8ecduzHjy2Yy9I4k/kbCjV4Ocuf2DNK0b4BN5YPeTmDljiW
 KoY=
X-SBRS: 2.7
X-MesageID: 13211002
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13211002"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:34 +0000
Message-ID: <20200226113355.2532224-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 02/23] Makefile: Fix install-tests
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

VGhlIHRvcC1sZXZlbCBtYWtlZmlsZSBtYWtlIHVzZXMgb2YgaW50ZXJuYWwgaW1wbGVtZW50YXRp
b24gZGV0YWlsIG9mCnRoZSB4ZW4gYnVpbGQgc3lzdGVtLiBBdm9pZCB0aGF0IGJ5IGNyZWF0aW5n
IGEgbmV3IHRhcmdldAoiaW5zdGFsbC10ZXN0cyIgaW4geGVuL01ha2VmaWxlLCBhbmQgYnkgZml4
aW5nIHRoZSB0b3AtbGV2ZWwgTWFrZWZpbGUKdG8gbm90IGNhbGwgeGVuL1J1bGVzLm1rIGFueW1v
cmUuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCgpO
b3RlczoKICAgIHYyLjE6CiAgICAtIG5ldyBwYXRjaCwgZml4IGBtYWtlIGRpc3QtdGVzdHNgIGlu
IG9zc3Rlc3QuCgogTWFrZWZpbGUgICAgIHwgNiArKy0tLS0KIHhlbi9NYWtlZmlsZSB8IDMgKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDUxMmQ2YjczYzg5OC4uOWFkMjYwMmY2
M2YwIDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtMTU1LDEzICsxNTUs
MTEgQEAgaW5zdGFsbC1kb2NzOgogIyBXZSBvbmx5IGhhdmUgYnVpbGQtdGVzdHMgaW5zdGFsbC10
ZXN0cywgbm90IHVuaW5zdGFsbC10ZXN0cyBldGMuCiAuUEhPTlk6IGJ1aWxkLXRlc3RzCiBidWls
ZC10ZXN0czogYnVpbGQteGVuCi0JZXhwb3J0IEJBU0VESVI9JChYRU5fUk9PVCkveGVuOyBcCi0J
JChNQUtFKSAtZiAkJEJBU0VESVIvUnVsZXMubWsgLUMgeGVuL3Rlc3QgYnVpbGQKKwkkKE1BS0Up
IC1DIHhlbiB0ZXN0cwogCiAuUEhPTlk6IGluc3RhbGwtdGVzdHMKIGluc3RhbGwtdGVzdHM6IGlu
c3RhbGwteGVuCi0JZXhwb3J0IEJBU0VESVI9JChYRU5fUk9PVCkveGVuOyBcCi0JJChNQUtFKSAt
ZiAkJEJBU0VESVIvUnVsZXMubWsgLUMgeGVuL3Rlc3QgaW5zdGFsbAorCSQoTUFLRSkgLUMgeGVu
ICRACiAKICMgYnVpbGQgeGVuIGFuZCB0aGUgdG9vbHMgYW5kIHBsYWNlIHRoZW0gaW4gdGhlIGlu
c3RhbGwKICMgZGlyZWN0b3J5LiAnbWFrZSBpbnN0YWxsJyBzaG91bGQgdGhlbiBjb3B5IHRoZW0g
dG8gdGhlIG5vcm1hbCBzeXN0ZW0KZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtl
ZmlsZQppbmRleCBjMzI2ZmVlNTg4MGUuLjcyYmM4OTkyNDYyMiAxMDA2NDQKLS0tIGEveGVuL01h
a2VmaWxlCisrKyBiL3hlbi9NYWtlZmlsZQpAQCAtOTAsNiArOTAsOSBAQCBfaW5zdGFsbDogJChU
QVJHRVQpJChDT05GSUdfWEVOX0lOU1RBTExfU1VGRklYKQogLlBIT05ZOiBfdGVzdHMKIF90ZXN0
czoKIAkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgdGVzdCB0ZXN0cworLlBIT05Z
OiBpbnN0YWxsLXRlc3RzCitpbnN0YWxsLXRlc3RzOgorCSQoTUFLRSkgLWYgJChCQVNFRElSKS9S
dWxlcy5tayAtQyB0ZXN0IGluc3RhbGwKIAogLlBIT05ZOiBfdW5pbnN0YWxsCiBfdW5pbnN0YWxs
OiBEPSQoREVTVERJUikKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
