Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0923C7C
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:45:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkR1-0006he-Kh; Mon, 20 May 2019 15:42:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSkR0-0006hV-Mr
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:42:42 +0000
X-Inumbo-ID: e6ebc840-7b15-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6ebc840-7b15-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 15:42:41 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: KZ+/YKqg8HAisFaeIeJKB5u88sVLLQrkndxo1mdkez73WJAAsqBwXV7qrxl0vi8+VW20Ttv/UA
 B9Dsn+jTZGdpYVY6U04+AKANEJlz5XxE+r6qTjGpAgmEB1HsfPyp+5i1cDkNutpFXxZJ1fEkcN
 mlKTvV6vSIhh3LXNDfkcda1tfTPY6pAotOJF7Jbp767Zs4eqt/WChOw1lGKdjGo1iwjkTQdRcf
 Cr98fFJHFC4Z6QleZUZceMxT/OcJz/Qd+c2MkEddV+QT+AnH5IwFpRYRah2dvgJHoLZwZjkm/3
 yOU=
X-SBRS: 2.7
X-MesageID: 647627
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="647627"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 16:41:44 +0100
Message-ID: <20190520154147.30675-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
References: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/4] mg-repro-setup: Do all builds in
 their own tasks, regardless
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY2FzZSBPU1NURVNUX1RBU0sgd2FzIHNldCBieSB0aGUgY2FsbGVyLCB1bnNldCBpdC4gIFVu
c2V0dGluZyBpdAp3aWxsIGNhdXNlIGVhY2ggc2ctcnVuLWpvYiAoaW5zaWRlIG1nLWV4ZWN1dGUt
dGFzaykgdG8gYmVjb21lIGl0cyBvd24KdGFzay4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1nLXJlcHJvLXNldHVwIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNldHVwCmluZGV4IGRjNmM1Y2JiLi41YTUy
ZTYxNyAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAKKysrIGIvbWctcmVwcm8tc2V0dXAKQEAg
LTI0Nyw3ICsyNDcsOCBAQCBwcm9ncmVzcyAibmV3IGZsaWdodCBpcyAkZmxpZ2h0IgogCiBpZiBb
ICJ4JHJlYnVpbGRzX2ZsaWdodCIgIT0geCBdOyB0aGVuCiAJcHJvZ3Jlc3MgInJ1bm5pbmcgYnVp
bGQocykgJHJlYnVpbGRzX2ZsaWdodCIKLQkuL21nLWV4ZWN1dGUtZmxpZ2h0IC1CJHJlYnVpbGRz
X2JsZXNzaW5nIC0tcHJvZ3Jlc3MtZmQ9MiBcCisJZW52IC11IE9TU1RFU1RfVEFTSyBcCisgICAg
ICAgICAgICAgICAgLi9tZy1leGVjdXRlLWZsaWdodCAtQiRyZWJ1aWxkc19ibGVzc2luZyAtLXBy
b2dyZXNzLWZkPTIgXAogCQkiJHttZ2V4ZWNmbGFnc1tAXX0iICRyZWJ1aWxkc19mbGlnaHQKIAog
CW1ybz10bXAvJHJlYnVpbGRzX2ZsaWdodC5tcm8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
