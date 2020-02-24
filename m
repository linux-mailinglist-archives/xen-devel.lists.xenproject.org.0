Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E1016A059
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 09:48:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j69Lv-0001jL-LA; Mon, 24 Feb 2020 08:44:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j69Lu-0001jG-3l
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 08:44:34 +0000
X-Inumbo-ID: e050d085-56e1-11ea-8ad0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e050d085-56e1-11ea-8ad0-12813bfff9fa;
 Mon, 24 Feb 2020 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582533874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JuCCVVgnrWXVejqbrIVufrfhXTXZmdgSEZneJfJ98sA=;
 b=FSqjb6iEHCsY/FlTwkRYby+eJLBqLbte/i5Iaw1/PQalYPWRIpeI6bcj
 lqkGuoww57FMPCVorpxj42MxHNefe/m2L5fMaiARPuJd42dpTUR5fJCix
 Q+i2apJOkmpMNfwMOCNBy4TVFQvQaDzerkxbC8XRgV5pLN/4ZVVF+JZ/e o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bLYs9s+YeAsJCws5fzTCtkwhs+qBn8mRlTacvxg+YUapMI/Zf4ZWXAUpStQT1vlculel9ll/xy
 GmynDeH1T0zvyyJaplu973oZssfvUrnJZzc9ycRUbopEFHlayAJG5He8kH9JfwXsbEq0cWJ+yU
 nje6VFGa5WcOMHnEXwFayEOoqZnT/kZqjZf+0FQEjA8rLSu/zhJzvnO9yOyVepONnqshe5jxqt
 N4xomrT3m0a6unp2A/hE84+jNK2bJ8kAD18SJQHetxZ3AlubTKSrYGbS3ilLUL83nENpj1FiIy
 GAk=
X-SBRS: 2.7
X-MesageID: 13072148
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13072148"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 09:43:58 +0100
Message-ID: <20200224084400.94482-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] rwlock: allow recursive read locking
 when already locked in write mode
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgcmVhZC1s
b2NraW5nIGEgbG9jayBhbHJlYWR5CnRha2VuIGluIHdyaXRlIG1vZGUgYnkgdGhlIHNhbWUgQ1BV
LiBQYXRjaCAjMSBhZGQgYW4gYXRvbWljX2FuZApvcGVyYXRpb24gdG8gYmUgdXNlZCBieSBwYXRj
aCAjMiB3aGljaCBpbXBsZW1lbnRzIHRoZSBtZW50aW9uZWQKYmVoYXZpb3IuCgpUaGUgc2VyaWVz
IGhhcyBiZWVuIGJ1aWxkIHRlc3RlZCBvbiBBcm0gYnkgZ2l0bGFiOgoKaHR0cHM6Ly9naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L3Blb3BsZS9yb3lnZXIveGVuL3BpcGVsaW5lcy8xMjAxNDQ5MDEKClRo
YW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIGF0b21pYzogYWRkIGF0b21pY19h
bmQgb3BlcmF0aW9ucwogIHJ3bG9jazogYWxsb3cgcmVjdXJzaXZlIHJlYWQgbG9ja2luZyB3aGVu
IGFscmVhZHkgbG9ja2VkIGluIHdyaXRlIG1vZGUKCiB4ZW4vY29tbW9uL3J3bG9jay5jICAgICAg
ICAgICAgICAgIHwgIDQgKy0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oIHwg
MTcgKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9hdG9taWMuaCB8IDE0ICsr
KysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2F0b21pYy5oICAgICAgIHwgIDggKysrKysKIHhl
bi9pbmNsdWRlL3hlbi9yd2xvY2suaCAgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRp
b25zKC0pCgotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
