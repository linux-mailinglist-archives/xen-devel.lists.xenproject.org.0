Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE3B1994
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 10:25:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8gqJ-0003QF-6i; Fri, 13 Sep 2019 08:22:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8gqI-0003Q4-4k
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 08:22:10 +0000
X-Inumbo-ID: 92f572f8-d5ff-11e9-95aa-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92f572f8-d5ff-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568362928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ObFgUX3jPgasy9ajYbOm2FMaRHg+XjQQqmPWU420IM=;
 b=ZWj7gczQACu5nmkKN+Sq+LLuWxkuKSrPFq6ForXoXnf0swYz0UnT/MCx
 ISwt0yRjPVPZIOg/rz6meugYrTNuRoOcjqosgd1MZ8shOlxR0Sa5jyZcG
 ZYfhgosqyKnvQycfq7jZsz6RuWzIct5kUHaoXZ5UJpnD1CIVRLwlugyeV g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nFiC1wyco7LKY28TNn6NTydJcCYrUiwRQUBh2NKtIcYXBkZUgbKk2FU9HeK0BuAyqur73keXtu
 U25OcFxbFH9MufBpfaCrJw842bp33DsFyLor4JYdBIzT5uPRanoPS3TqOklkWGx11sO57BQfeh
 MhOhw2qA5eyLbFUlIz9EUBhJEzofcuReQFgwhC+bI73PPbxzeNWPCVhHIcRXe6hClgYGXJJA28
 PIxv4nm+tqvpfVJlIUD7TnbLz611T2mgduUKOJonXQ3MCJ4zgcI74td4a9I/NBMNFqMk7e6GJN
 ADY=
X-SBRS: 2.7
X-MesageID: 5578877
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5578877"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 09:21:55 +0100
Message-ID: <20190913082159.31338-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/3] xen: fix a potential crash in xen-bus
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgZml4ZXMgYSBwb3RlbnRpYWwgc2VnZmF1bHQgY2F1c2VkIGJ5IE5vdGlmaWVy
TGlzdCBjb3JydXB0aW9uCmluIHhlbi1idXMuIFRoZSBmaXJzdCB0d28gcGF0Y2hlcyBsYXkgdGhl
IGdyb3VuZHdvcmsgYW5kIHRoZSB0aGlyZAphY3R1YWxseSBmaXhlcyB0aGUgcHJvYmxlbS4KClBh
dWwgRHVycmFudCAoMyk6CiAgeGVuIC8gbm90aWZ5OiBpbnRyb2R1Y2UgYSBuZXcgWGVuV2F0Y2hM
aXN0IGFic3RyYWN0aW9uCiAgeGVuOiBpbnRyb2R1Y2Ugc2VwYXJhdGUgWGVuV2F0Y2hMaXN0IGZv
ciBYZW5EZXZpY2Ugb2JqZWN0cwogIHhlbjogcGVyZm9ybSBYZW5EZXZpY2UgY2xlYW4tdXAgaW4g
WGVuQnVzIHdhdGNoIGhhbmRsZXIKCiBody94ZW4vdHJhY2UtZXZlbnRzICAgICAgfCAgIDkgKy0K
IGh3L3hlbi94ZW4tYnVzLmMgICAgICAgICB8IDI3NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0KIGluY2x1ZGUvaHcveGVuL3hlbi1idXMuaCB8ICAgOCArLQogaW5jbHVk
ZS9xZW11L25vdGlmeS5oICAgIHwgICAyICsKIHV0aWwvbm90aWZ5LmMgICAgICAgICAgICB8ICAg
NSArCiA1IGZpbGVzIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspLCA4MSBkZWxldGlvbnMoLSkK
LS0tCkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0gCjIuMjAuMS4yLmdi
MjFlYmI2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
