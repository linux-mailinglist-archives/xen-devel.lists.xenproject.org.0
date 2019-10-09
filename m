Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B45D178B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 20:26:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIGaO-0004nB-RI; Wed, 09 Oct 2019 18:21:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jvK1=YC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iIGaN-0004n6-01
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 18:21:19 +0000
X-Inumbo-ID: 95b5d2fe-eac1-11e9-8c93-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95b5d2fe-eac1-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570645277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ldl6YHcJrVzRUQIzaQ3nEPvYcf1wT9Dp6gt6RGGOclA=;
 b=UaNnOFebDbp1ibJ4aoA2eJMb51tmJnb11zYxkOLWdMWyRYtafzas+BgJ
 lUj47P9FpRBmH0DSxqmfcdJ8h0rMmTMNf+/dSNa21GfL5RlvwglQOcytR
 AzpZJ8pYHzAYz6OQAH5eElAqKzxqHofWiuDTHCe0O2TfsLvGx9XLu/Z1j U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7cqhtTykc0ySA7acD+2I53JM1QLKS+70yzFNZdC0JTOmVdf6aJ+4Ay7dNQ3abRP0eJ6VSCvtbr
 blBuLyEFCJnB1RFwR/Pm6CsV+Eb9gQS9khwsnioFiTerrgj3bsaWcChd3pvHvK7nH5Tqu8Dwhp
 VHirvoJK4+/4fAxf0G1Rs011ajsVcC85u5RfXBGnE6LjLcoHl3vWNY5WGj82XA47BlnM902WEo
 q3NjkdBbYVfIxuJ+C3wsFOqF98uYHqpxMgil10XIv3zl8xVsKcES0uovQNQQLvset7FwASDh6J
 f0g=
X-SBRS: 2.7
X-MesageID: 6941273
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,277,1566878400"; 
   d="scan'208";a="6941273"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 9 Oct 2019 19:21:14 +0100
Message-ID: <20191009182114.9376-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/hvm: Fix the use of "hap=0" following c/s
 c0902a9a143a
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIGMwOTAyYTlhMTQzYSByZWZhY3RvcmVkIGh2bV9lbmFibGUoKSBhIGxpdHRsZSwgYnV0IGRy
b3BwZWQgdGhlIGxvZ2ljIHdoaWNoCmNsZWFyZWQgaGFwX3N1cHBvcnRlZCBpbiB0aGUgY2FzZSB0
aGF0IHRoZSB1c2VyIGhhZCBhc2tlZCBmb3IgaXQgb2ZmLgoKVGhpcyByZXN1bHRzIGluIFhlbiBi
b290aW5nIHVwLCBjbGFpbWluZzoKCiAgKFhFTikgSFZNOiBIYXJkd2FyZSBBc3Npc3RlZCBQYWdp
bmcgKEhBUCkgZGV0ZWN0ZWQgYnV0IGRpc2FibGVkCgpidXQgd2l0aCBIQVAgYWR2ZXJ0aXNlZCB2
aWEgc3lzY3RsLCBhbmQgWEVOX0RPTUNUTF9DREZfaGFwIGJlaW5nIGFjY2VwdGVkIGluCmRvbWFp
bl9jcmVhdGUoKS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgpDQzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CkNDOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgpUaGlzIGlzIGEgcmVncmVzc2lvbiBmcm9tIDQuMTIsIHNvIHNo
b3VsZCBiZSBmaXhlZCBiZWZvcmUgNC4xMyBzaGlwcy4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2
bS5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2
L2h2bS9odm0uYwppbmRleCBjMjJjYjM5Y2YzLi45YWNkMzU5Yzk5IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTE0Miw3
ICsxNDIsNyBAQCBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGNwdV9uZmIgPSB7CiAgICAg
Lm5vdGlmaWVyX2NhbGwgPSBjcHVfY2FsbGJhY2sKIH07CiAKLXN0YXRpYyBib29sIF9faW5pdCBo
YXBfc3VwcG9ydGVkKGNvbnN0IHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgKmZucykKK3N0YXRp
YyBib29sIF9faW5pdCBoYXBfc3VwcG9ydGVkKHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgKmZu
cykKIHsKICAgICBpZiAoICFmbnMtPmhhcF9zdXBwb3J0ZWQgKQogICAgIHsKQEAgLTE1Miw2ICsx
NTIsNyBAQCBzdGF0aWMgYm9vbCBfX2luaXQgaGFwX3N1cHBvcnRlZChjb25zdCBzdHJ1Y3QgaHZt
X2Z1bmN0aW9uX3RhYmxlICpmbnMpCiAKICAgICBpZiAoICFvcHRfaGFwX2VuYWJsZWQgKQogICAg
IHsKKyAgICAgICAgZm5zLT5oYXBfc3VwcG9ydGVkID0gMDsKICAgICAgICAgcHJpbnRrKCJIVk06
IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSBkZXRlY3RlZCBidXQgZGlzYWJsZWRcbiIp
OwogICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgfQpAQCAtMTc1LDcgKzE3Niw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IGh2bV9lbmFibGUodm9pZCkKICAgICBodm1fZW5hYmxlZCA9IDE7CiAKICAg
ICBwcmludGsoIkhWTTogJXMgZW5hYmxlZFxuIiwgZm5zLT5uYW1lKTsKLSAgICBpZiAoICFoYXBf
c3VwcG9ydGVkKGZucykgKQorICAgIGlmICggIWhhcF9zdXBwb3J0ZWQoJmh2bV9mdW5jcykgKQog
ICAgICAgICBjbGVhcl9pb21tdV9oYXBfcHRfc2hhcmUoKTsKICAgICBlbHNlCiAgICAgewotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
