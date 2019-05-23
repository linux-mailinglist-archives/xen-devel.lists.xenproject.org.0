Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22527A4D
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:22:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkpp-0003yx-Kn; Thu, 23 May 2019 10:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTkpn-0003yd-D0
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:20:27 +0000
X-Inumbo-ID: 60e1019c-7d44-11e9-a671-131b1767dec5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60e1019c-7d44-11e9-a671-131b1767dec5;
 Thu, 23 May 2019 10:20:25 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: rlRlaGXWFFEdHQkwGdGuD1XF+ZicJXy+Is6vdqfcjxFXOr+W+Q1wt+uM5YBUgGnJ5Rq16mr3IK
 uwxmW7lNRuAv8S4HzxsUx3oX6YAu1YQEDNR5iJ/UWGaKNFOogl8VyYNTHb/cuH41duSyLqKBeK
 1y6pKkKIefeJtR5nTOn9mes3ho1ujuEAXK9Wqz3V6fgQ83Q9H0xpIa6AfxNJ5W2LQwSCMRGq38
 wn9pesDxNBO2Mv1MDUF3oouwkfSC1RpoFwx2wj8f41nTgpD4XxZ8+mZ5FLYSqlSJllFE9hI5hx
 OeA=
X-SBRS: 2.7
X-MesageID: 818749
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="818749"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 23 May 2019 11:20:14 +0100
Message-ID: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] Hypercall page docs and code cleanup
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIHRoZSByZW5kZXJlZCByZXN1bHQgKGFsb25nIHdpdGggc29tZSBvdGhlciBpbi1wcm9ncmVz
cyBkb2N1bWVudGF0aW9uKSwKc2VlOgoKaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFkdGhlZG9j
cy5pby9lbi9kb2NzLWRldmVsL2d1ZXN0LWd1aWRlL2h5cGVyY2FsbC1hYmkuaHRtbAoKQW5kcmV3
IENvb3BlciAoMik6CiAgeDg2OiBpbml0X2h5cGVyY2FsbF9wYWdlKCkgY2xlYW51cAogIGRvY3M6
IEludHJvZHVjZSBzb21lIGh5cGVyY2FsbCBwYWdlIGRvY3VtZW50YXRpb24KCiBkb2NzL2d1ZXN0
LWd1aWRlL2h5cGVyY2FsbC1hYmkucnN0IHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGRvY3MvZ3Vlc3QtZ3VpZGUvaW5kZXgucnN0ICAgICAgICAgfCAgMTAgKysr
CiBkb2NzL2luZGV4LnJzdCAgICAgICAgICAgICAgICAgICAgIHwgIDEzICsrKysKIHhlbi9hcmNo
L3g4Ni9kb21haW4uYyAgICAgICAgICAgICAgfCAgMTQgKysrKwogeGVuL2FyY2gveDg2L2RvbWN0
bC5jICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAg
ICAgICB8ICAgOCArLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jICAgICAgICAgfCAgMTgg
KysrLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgICAgIHwgIDE4ICsrKy0tLQog
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICAgICB8ICAgMyArLQogeGVuL2FyY2gveDg2
L3B2L2h5cGVyY2FsbC5jICAgICAgICB8ICA2MyArKysrKysrKystLS0tLS0tLS0KIHhlbi9hcmNo
L3g4Ni90cmFwcy5jICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQv
dHJhcHMuYyAgICAgICAgfCAgMTMgLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCAg
ICAgICB8ICAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggICAgICB8ICAgNCAr
LQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9oeXBlcmNhbGwuaCAgICB8ICAgNCArLQogMTUgZmlsZXMg
Y2hhbmdlZCwgMjIzIGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRvY3MvZ3Vlc3QtZ3VpZGUvaHlwZXJjYWxsLWFiaS5yc3QKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkb2NzL2d1ZXN0LWd1aWRlL2luZGV4LnJzdAoKLS0gCjIuMS40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
