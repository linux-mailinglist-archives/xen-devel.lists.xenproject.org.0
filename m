Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D113157F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:56:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUiD-0003lY-MY; Mon, 06 Jan 2020 15:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioUiC-0003l9-1D
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:54:36 +0000
X-Inumbo-ID: d1065614-309c-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1065614-309c-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578326068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xYfBLpw32z+8phIUb6UyBrgOMhXwXqKmYQ6j0RSoVgo=;
 b=Q0UyzudmIDlVB3s2laH7j/GhtlfKA4tjdmRC6S7LVFNG2RNVp/K6t0Q1
 DvXeFlu387ucESx/ACxc2W+OdROCr/DF0lRAnNK1u5Gg0fMSzE44HXCZb
 PkQOrJJNuonVPYYMp/UMd6xHF33gwU8Y0lHDyW3KiSGuSp0mWlfkmIwle c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FImzxF74mPcHwTMwNZa34I5ddaRUqEQucfT6klwWMuC6SakfRmfe+1Uw1QKy8i/dCyEGusjF5X
 NKPKL+z6cMO10wejkZ06vcb7tjtV03ZB98WLdm/ueEZBI6BloVxJSVKv2z0WAxvEVYO5Xur5cc
 fUtmEXAr+PRH1WD/dWkzsE4fRsbg9avUdfeElllvgzBjmQdwI5DvHh6rY7PP3hi05eMbeFqYAm
 YtMGULcksm4o1lkPg1q5d/NU05mcL4/mmv7qt/DtfYtTzaI96G+6OBe6dqVTC7R3p5ifCklH01
 u3o=
X-SBRS: 2.7
X-MesageID: 10489150
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10489150"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 15:54:18 +0000
Message-ID: <20200106155423.9508-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200106155423.9508-1-andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/6] x86/boot: Check for E820_RAM earlier when
 searching the E820
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

VGhlcmUgaXMgbm8gcG9pbnQgcGVyZm9ybWluZyB0aGUgbWFza2luZyBjYWxjdWxhdGlvbnMgaWYg
d2UgYXJlIGdvaW5nIHRvCnRocm93IHRoZSByZXN1bHQgYXdheS4KCk5vIGZ1bmN0aW9uYWwgY2hh
bmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L3NldHVwLmMgfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggNTAxZjNmNWU0Yi4uZWQ1
NGY3OWZlYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gv
eDg2L3NldHVwLmMKQEAgLTEwMzMsMTEgKzEwMzMsMTQgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4g
X19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAgICAgdWludDY0X3QgcywgZSwg
bWFzayA9ICgxVUwgPDwgTDJfUEFHRVRBQkxFX1NISUZUKSAtIDE7CiAgICAgICAgIHVpbnQ2NF90
IGVuZCwgbGltaXQgPSBBUlJBWV9TSVpFKGwyX2lkZW50bWFwKSA8PCBMMl9QQUdFVEFCTEVfU0hJ
RlQ7CiAKKyAgICAgICAgaWYgKCBib290X2U4MjAubWFwW2ldLnR5cGUgIT0gRTgyMF9SQU0gKQor
ICAgICAgICAgICAgY29udGludWU7CisKICAgICAgICAgLyogU3VwZXJwYWdlLWFsaWduZWQgY2h1
bmtzIGZyb20gQk9PVFNUUkFQX01BUF9CQVNFLiAqLwogICAgICAgICBzID0gKGJvb3RfZTgyMC5t
YXBbaV0uYWRkciArIG1hc2spICYgfm1hc2s7CiAgICAgICAgIGUgPSAoYm9vdF9lODIwLm1hcFtp
XS5hZGRyICsgYm9vdF9lODIwLm1hcFtpXS5zaXplKSAmIH5tYXNrOwogICAgICAgICBzID0gbWF4
X3QodWludDY0X3QsIHMsIEJPT1RTVFJBUF9NQVBfQkFTRSk7Ci0gICAgICAgIGlmICggKGJvb3Rf
ZTgyMC5tYXBbaV0udHlwZSAhPSBFODIwX1JBTSkgfHwgKHMgPj0gZSkgKQorICAgICAgICBpZiAo
IHMgPj0gZSApCiAgICAgICAgICAgICBjb250aW51ZTsKIAogICAgICAgICBpZiAoIHMgPCBsaW1p
dCApCkBAIC0xMjg2LDExICsxMjg5LDE0IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRf
eGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAgICAgICAgIHVpbnQ2NF90IHMsIGUsIG1hc2sgPSBQ
QUdFX1NJWkUgLSAxOwogICAgICAgICB1aW50NjRfdCBtYXBfcywgbWFwX2U7CiAKKyAgICAgICAg
aWYgKCBib290X2U4MjAubWFwW2ldLnR5cGUgIT0gRTgyMF9SQU0gKQorICAgICAgICAgICAgY29u
dGludWU7CisKICAgICAgICAgLyogT25seSBwYWdlIGFsaWdubWVudCByZXF1aXJlZCBub3cuICov
CiAgICAgICAgIHMgPSAoYm9vdF9lODIwLm1hcFtpXS5hZGRyICsgbWFzaykgJiB+bWFzazsKICAg
ICAgICAgZSA9IChib290X2U4MjAubWFwW2ldLmFkZHIgKyBib290X2U4MjAubWFwW2ldLnNpemUp
ICYgfm1hc2s7CiAgICAgICAgIHMgPSBtYXhfdCh1aW50NjRfdCwgcywgMTw8MjApOwotICAgICAg
ICBpZiAoIChib290X2U4MjAubWFwW2ldLnR5cGUgIT0gRTgyMF9SQU0pIHx8IChzID49IGUpICkK
KyAgICAgICAgaWYgKCBzID49IGUgKQogICAgICAgICAgICAgY29udGludWU7CiAKICAgICAgICAg
aWYgKCAhYWNwaV9ib290X3RhYmxlX2luaXRfZG9uZSAmJgotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
