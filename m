Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4946E17A516
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:17:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9pOi-0005go-Qx; Thu, 05 Mar 2020 12:14:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BTO=4W=amzn.com=prvs=326a7180f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9pOh-0005gi-NP
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:14:39 +0000
X-Inumbo-ID: e31dd7c0-5eda-11ea-b74d-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e31dd7c0-5eda-11ea-b74d-bc764e2007e4;
 Thu, 05 Mar 2020 12:14:39 +0000 (UTC)
IronPort-SDR: 3a3Pq9iUviLMB/ukiy+boSdEBfgVtPUCEbVk13XvwchkuAPVI423fZYZAOGaZOl8XaCY93Rc1o
 qF1hiSn29pCQ==
X-IronPort-AV: E=Sophos;i="5.70,517,1574121600"; d="scan'208";a="20186723"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 05 Mar 2020 12:14:28 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6BD57A220C; Thu,  5 Mar 2020 12:14:24 +0000 (UTC)
Received: from EX13D05UWB002.ant.amazon.com (10.43.161.50) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 12:14:23 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05UWB002.ant.amazon.com (10.43.161.50) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 5 Mar 2020 12:14:23 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Mar 2020 12:14:21 +0000
From: <pdurrant@amzn.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 12:14:15 +0000
Message-ID: <20200305121417.16583-1-pdurrant@amzn.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/2] PV driver compatibility fixes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Paul Durrant <pdurrant@amzn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbXpuLmNvbT4KClBhdWwgRHVycmFudCAoMik6
CiAgbGlieGw6IGNyZWF0ZSBkb21haW4gJ2Vycm9yJyBub2RlIGluIHhlbnN0b3JlCiAgbGlieGw6
IG1ha2UgY3JlYXRpb24gb2YgeGVuc3RvcmUgJ3N1c3BlbmQgZXZlbnQgY2hhbm5lbCcgbm9kZQog
ICAgb3B0aW9uYWwuLi4KCiBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gICAgICAgIHwgIDcgKysr
KysrKwogZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBhbmRvYyB8IDEyICsrKysrKysrKy0tLQog
dG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKy0KIHRvb2xz
L2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgICAgfCAxNyArKysrKysrKysrKysrLS0tLQogdG9vbHMv
bGlieGwvbGlieGxfdHlwZXMuaWRsICAgICB8ICAxICsKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAg
ICAgICAgICAgfCAgMyArKysKIDYgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAKMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
