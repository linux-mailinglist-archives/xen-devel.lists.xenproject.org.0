Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527159256A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzhvQ-00039z-I4; Mon, 19 Aug 2019 13:42:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzhvO-00039p-Be
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:42:18 +0000
X-Inumbo-ID: 28a204b0-c287-11e9-a661-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28a204b0-c287-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566222137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ydom+7nnL/Zl4SZxIYEGBKhcRMuqZsNR5QRGwLitc5o=;
 b=gY1mp60vmNnWxJJMszhdeaZsVB/D9Nwt9qgmdUoSKOUczMrCsONLD474
 WJbMFUDH3B7gGlsFfVLPGRvOgBDjQDEfrsHNckpY84T8nZY/keUQORQP5
 73TyRRyCHxcqRopHSBypyXBW/jYkXCGlJO+W2Qxmo4kd5co8Pc2+X88UF o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fPLeePxTFRZYa8M6LPm2P6yZHfK3FMQUQnpR874/SCc05IBGVUTzfEhn82SVMQ/iImqQPPYjN/
 DyKElLcL7NKVNTQO8HQ3UrZpHB1PGqYcY3wKw0edwxzfn6PcpdtjMYnNN1RURELlPUZqO3saA7
 07kBLdELf7n7okJKLTGUmTIltl0ikUCQbzdGxEMrx2iWCGeoS6bNLAAsVhIZDil++rUQUNoIiE
 kTG1xQRWtSZvlvU2u/kaIrserCNNzOT9g8fqgD9oUYjZWC4xqozqw9hq23G7dYw6ivF3SHQmf9
 SAQ=
X-SBRS: 2.7
X-MesageID: 4595980
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4595980"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 19 Aug 2019 14:42:10 +0100
Message-ID: <20190819134213.1628-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Various bits of trampoline cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciAoMyk6CiAgeDg2L2Jvb3Q6IEZ1cnRoZXIgbWlub3IgR0RUIGNvcnJlY3Rp
b25zCiAgeDg2L2Jvb3Q6IFJlcG9zaXRpb24gdHJhbXBvbGluZSBkYXRhCiAgeDg2L2Jvb3Q6IERy
b3AgYWxsIHVzZSBvZiBsbXN3CgogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgICAgICAgIHwg
IDIgKy0KIHhlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUyAgICB8IDc4ICsrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMg
ICAgICAgIHwgIDUgKystCiB4ZW4vYXJjaC94ODYveDg2XzY0L2tleGVjX3JlbG9jLlMgfCAgNCAr
LQogNCBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
