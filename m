Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED09BCA87
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:46:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm1m-0001fi-Ab; Tue, 24 Sep 2019 14:42:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wx4c=XT=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iCm1l-0001fU-Cd
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:42:53 +0000
X-Inumbo-ID: 965453e6-ded9-11e9-8628-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 965453e6-ded9-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569336172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kNn+0Ak7i07l6bGDqn7KQDVXQzezYkDz81wOZSSbZzI=;
 b=Wfh7XcJqhZhh3HYrwavL+75FLZc2p8/z5u3RHklHL7jvb+OBqZqblUZi
 NWZ6iepqsKbo3GLH3mmXt02oJNfNLPfDet7rzWRUuFLSunF1mmOboK/IF
 N1aD8RvxzJAqcgyCMGSnCxHuc9icvI52HGSmXkxm9BTNGELnJ08Z2DJAg Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kMkwka3Py8+jD+6vayLKlnamHpzlUSTrWz5ZoJzinkEUPqPXCGRRDQc4Eeb/P7x+DvxFrsjuq7
 8idxHBgwvGLRTcsSbUIyKREGIuBQXoYprtLzCkn5GPKXzvmqEUdlrhoFzdQoaNmWldrANZoYhT
 Qh/WKMTv5OqdzEeZJJ00xTEZHp6EXaDkuZE7ypXEkxa50egbl4ikXNEUMNSs38A1f19/d8pdTx
 fgxMvOupSyrOi6aPbxp8Ozt/J48vQ9LXCqnQuJ6xRVc3/A8F0UbXEFZQL21uiN2whrS1LfIpOg
 iuQ=
X-SBRS: 2.7
X-MesageID: 6264132
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6264132"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Sep 2019 15:42:44 +0100
Message-ID: <20190924144244.7940-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190924144244.7940-1-ian.jackson@eu.citrix.com>
References: <20190924144244.7940-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 4/4] ts-kernel-build: Actually disable
 CONFIG_ARCH_QCOM
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
Cc: Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBjL3MgZWZlZGRmN2VjYTg2CiAgdHMta2VybmVsLWJ1aWxkOiBEaXNhYmxlIENPTkZJ
R19BUkNIX1FDT00gaW4gWGVuIFByb2plY3QgQ0kKZGlkIG5vdCB3b3JrIGJlY2F1c2UgaXQgbGFj
a2VkIHRoZSBuZWVkZWQgYHNldG9wdCcuICBPb3BzLgoKQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+ClN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQogdHMta2VybmVsLWJ1aWxkIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMta2VybmVsLWJ1aWxkIGIv
dHMta2VybmVsLWJ1aWxkCmluZGV4IDU2ZmY3OTk0Li5jOTc2Mjg5ZSAxMDA3NTUKLS0tIGEvdHMt
a2VybmVsLWJ1aWxkCisrKyBiL3RzLWtlcm5lbC1idWlsZApAQCAtMjc2LDcgKzI3Niw3IEBAIHNl
dG9wdCBDT05GSUdfU1BJX1RIVU5ERVJYPW0KIAogIyBTb21lIExpbnV4IGJyYW5jaGVzIHdlIGNh
cmUgYWJvdXQsIGluY2x1ZGluZyA0LjE5LCBzdGlsbCBsYWNrCiAjIGZpcm13YXJlOiBxY29tX3Nj
bTogVXNlIHByb3BlciB0eXBlcyBmb3IgZG1hIG1hcHBpbmdzCi1DT05GSUdfQVJDSF9RQ09NPW4K
K3NldG9wdCBDT05GSUdfQVJDSF9RQ09NPW4KIAogIyMjIwogCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
