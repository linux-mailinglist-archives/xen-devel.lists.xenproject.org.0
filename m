Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0871C33
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpx2C-0007G5-63; Tue, 23 Jul 2019 15:49:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=079Z=VU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpx2A-0007Fp-4P
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:48:58 +0000
X-Inumbo-ID: 5fb9ebf6-ad61-11e9-9e9d-6bf83998d190
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fb9ebf6-ad61-11e9-9e9d-6bf83998d190;
 Tue, 23 Jul 2019 15:48:54 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0viUyEQZ94k6Fc5EubiR5kp4P32gAhJWa8927YWaK3Wzmzvo+q/ZXGWn8m/6Iz4UMXsaPY3ePS
 fuPAv2sTDaU5zeyey9UOHrD4yfZh2ayTZvzRzxNSP2Gt9/6LWNhvZhCF9N+eQq2EpfOzz+UQX4
 8wmP+m/TWQPBm1quZ6qRsi/jPqhk94nG4rycpa+BR6ZCKeUlgyIMYHnjDUMFmEmAqMDzQf1wLH
 ubAyBJwkxe6MIxvsqEZRd7DzMNQwXJOHOvpok5enZPranRiaEVvPabtiS3uT5DQSVmTMNR3zYE
 K9E=
X-SBRS: 2.7
X-MesageID: 3321385
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3321385"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:48:49 +0200
Message-ID: <20190723154851.77627-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] x86/iommu: fixes to hwdom_iommu_map
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
Cc: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWlucyB0d28gc21hbGwgZml4ZXMgdG8g
aHdkb21faW9tbXVfbWFwIGluCm9yZGVyIHRvIGV4cGFuZCB0aGUgZm9yYmlkZGVuIHJhbmdlcyB0
byBjb3ZlciB0aGUgZnVsbCBJbnRlcnJ1cHQgQWRkcmVzcwpSYW5nZSBhbmQgdGhlIEFQSUMgQ29u
ZmlndXJhdGlvbiBTcGFjZS4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgog
IHg4Ni9pb21tdTogYXZvaWQgbWFwcGluZyB0aGUgaW50ZXJydXB0IGFkZHJlc3MgcmFuZ2UgZm9y
IGh3ZG9tCiAgeDg2L2lvbW11OiBhdm9pZCBtYXBwaW5nIHRoZSBBUElDIGNvbmZpZ3VyYXRpb24g
c3BhY2UgZm9yIGh3ZG9tCgogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgfCAy
NSArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
