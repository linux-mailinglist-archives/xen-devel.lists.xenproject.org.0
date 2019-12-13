Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7C11EAF3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 20:08:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifqF2-00006S-F7; Fri, 13 Dec 2019 19:04:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifqF0-00006L-HC
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 19:04:42 +0000
X-Inumbo-ID: 6a3451c6-1ddb-11ea-8fd3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a3451c6-1ddb-11ea-8fd3-12813bfff9fa;
 Fri, 13 Dec 2019 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576263880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kkdyjqEQIKngGZrUY/lrgfAkphPxDLTZa+C4kA0a4kc=;
 b=Z2gC+5zkswaTQLhr0dn85o5qASv9RgjiECHpPsLYZ3e5aQUq0GlqiWR0
 LMcRNEOi/4offhKfe97QmxRJyD0lL/6eIyIF1s/U+NXMUN2hBoMH0uecT
 2f3V7G8clWJB5Bt/jWe4sdkzwf4eGfFkGRrLRwVHOjG/nW17yN/ZQkbBJ k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Xpn96kkURPnld+9bf+1BIpe2ikmFSdw7H6K4tYNYwo5NwC7jT2HMnxImTYIj7+CrLHWR+7eWTL
 F/Q+5dL/IhaM+/0c/1FH4qCijJ5l9AmG3skIRCgTunTI5bUf3Q4QAGZbUWQGXwq/zXl0GTETJK
 iurjTi8ASYxF0ry0p3aqsbwAQAQ0jpWgeYQ0ju6/ZA6KXcM0Et+HFNq2bNIcwdBm9ElefWQOIz
 +QcghG+Ixne6NZb27UIoOWNVSq+RQ+zBzhNl5dHmhmqC+6BYT6HB/h3vQNlSYNqasVdlV4hGBS
 OVQ=
X-SBRS: 2.7
X-MesageID: 10233134
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10233134"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 19:04:30 +0000
Message-ID: <20191213190436.24475-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/6] x86/suspend: State cleanup
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

QW5kcmV3IENvb3BlciAoNik6CiAgeDg2L3N1c3BlbmQ6IENsYXJpZnkgYW5kIGltcHJvdmUgdGhl
IGJlaGF2aW91ciBvZiBkb19zdXNwZW5kX2xvd2xldmVsKCkKICB4ODYvc3VzcGVuZDogRG9uJ3Qg
Ym90aGVyIHNhdmluZyAlY3IzLCAlc3Mgb3IgZmxhZ3MKICB4ODYvc3VzcGVuZDogRG9uJ3Qgc2F2
ZSB1bm5lY2Vzc2FyeSBHUFJzCiAgeDg2L3N1c3BlbmQ6IFJlc3RvcmUgY3I0IGxhdGVyIGR1cmlu
ZyByZXN1bWUKICB4ODYvc3VzcGVuZDogRXhwYW5kIG1hY3JvcyBpbiB3YWtldXBfcHJvdC5TCiAg
eDg2L3N1c3BlbmQ6IERyb3Agc2F2ZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSgpIGNvbXBsZXRlbHkK
CiB4ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5kLmMgICAgIHwgIDU1ICsrLS0tLS0tLS0tLS0tLS0K
IHhlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgfCAxMzYgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMgICAgICB8
ICAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxNDcgZGVsZXRpb25z
KC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
