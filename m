Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1258A59C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 20:24:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxEwl-0004e8-SR; Mon, 12 Aug 2019 18:21:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gta3=WI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxEwk-0004e3-98
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 18:21:30 +0000
X-Inumbo-ID: 0071555e-bd2e-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0071555e-bd2e-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565634088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NDKcjhhqOGyt1vwGvAr5DTEbv0akz0mhQZri0YaHBUg=;
 b=S7I3JyIMEkIt55abPhyzpDuBDsLapWohicoKKOFarIdYv5wLe0A/BA2m
 dF4mIRk9ACzwqsJlS9QWUjkTYye7a9/9lLptJwkmO4h92OiMHRPPv2D9V
 rkhSnjdRENtxflXMHQJ8wYMylGuvGmLP21ykUcl6RkkLO5sRE/MR/Vt2u k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Vp5V/5qRg7DeGwyHy1koIXbe3NJGwM0IrPnZq5vjdEtPVtzY2D+WPgXfN0FsufdkT9QPIcWWQw
 caCqsUFnzWPlVDvgz+JFQwtf/i4/ygsTI6B+TPyBA2s2Epvx1Z/NelcqPW6EM6XbmO7A9N0sOt
 EeT6Qdp7p/UNRUunxZ1QXSu61Z/Df/La4LNDSjwqLnYZgsRHm8wr4krlriNWQfC5W9vi0IaGwQ
 adt5MLNcCryzMFz8OPeEMfxaw1uxWotpIXcMa87qeRlse/x5+xPr4J2YizvezZ7kfMACRNuULG
 2Jo=
X-SBRS: 2.7
X-MesageID: 4344017
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,378,1559534400"; 
   d="scan'208";a="4344017"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 12 Aug 2019 19:21:22 +0100
Message-ID: <20190812182125.18094-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/suspend: Simplify resume path
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

VGhpcyBzdGFydGVkIG9mZiBhcyAiZ2V0IHJpZCBvZiBsb2FkX1RSKCkiIGFzIGlkZW50aWZpZWQg
aW4gdGhlIFRTUyBjbGVhbnVwCnNlcmllcywgYW5kIG1vcnBoZWQgc2xpZ2h0bHkuCgpBbmRyZXcg
Q29vcGVyICgzKToKICB4ODYvc3VzcGVuZDogU2FuaXR5IGNoZWNrIG1vcmUgcHJvcGVydGllcyBp
biBlbnRlcl9zdGF0ZSgpCiAgeDg2L2Rlc2M6IE1vdmUgYm9vdF9nZHRyIGludG8gLnJvZGF0YQog
IHg4Ni9zdXNwZW5kOiBTaW1wbGlmeSBzeXN0ZW0gdGFibGUgaGFuZGxpbmcgb24gcmVzdW1lCgog
eGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyAgICAgICB8ICAyICsrCiB4ZW4vYXJjaC94ODYvYWNw
aS9zdXNwZW5kLmMgICAgIHwgMTQgKysrKysrKysrKysrKy0KIHhlbi9hcmNoL3g4Ni9hY3BpL3dh
a2V1cF9wcm90LlMgfCAxMyArLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvZGVzYy5jICAgICAg
ICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgfCAyMSAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZGVzYy5oICAgICAgfCAgMiAt
LQogNiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
