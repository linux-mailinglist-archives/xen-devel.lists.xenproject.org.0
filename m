Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5154EA85
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:26:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKSs-0008L8-D9; Fri, 21 Jun 2019 14:24:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rzm=UU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1heKSr-0008Ku-8c
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:24:29 +0000
X-Inumbo-ID: 45a54cf0-9430-11e9-9dd7-7fc46bdb1239
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45a54cf0-9430-11e9-9dd7-7fc46bdb1239;
 Fri, 21 Jun 2019 14:24:26 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /XUA8yR72MDnMnMtbbiYgcNcDJAXjLqiqKYBoXUFRnXq1wIomde4g36Jgf9qqGGbcrvb075WRq
 2/dbXZ1pvNMWIesaRJmt1NiQ7pg2toUx4UPethMyQ1m3HwWneuehMq6q6Cdo2AT2giig9scv9T
 rJXqPT499J4M+f4zjMVhetADPI/5X0OBhCKYLjS+gk5FdNHaLr2BGu2fA9/SImDit+pW+FqLvM
 GJthy/5gaxi2vepiII+YymzgvoHniri99QV1QRR2p9ew+6Z4vnypGMnNDoatIuu4M8nXNp9fQr
 ZQY=
X-SBRS: 2.7
X-MesageID: 2052935
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2052935"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 15:22:53 +0100
Message-ID: <20190621142258.1543-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
References: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 3/8] mg-repro-setup: Do all builds in
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
