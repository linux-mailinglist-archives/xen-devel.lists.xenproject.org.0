Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A1414B47E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 13:54:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwQLu-0001bx-7l; Tue, 28 Jan 2020 12:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f0Vb=3R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwQLs-0001bs-Te
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 12:52:20 +0000
X-Inumbo-ID: 04e710c2-41cd-11ea-86b5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04e710c2-41cd-11ea-86b5-12813bfff9fa;
 Tue, 28 Jan 2020 12:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580215940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9e8MGA3QPhlOD4wDtQCnT7xfuSmvzNE6tgP6jdHgSrE=;
 b=VgDrQyBzHc6SI52wAoHKF4hCuJdARsjjvxqHvIyIBFpC8zUyJrFizFSY
 C8UmPyltu8tmC7HRtZHeh8Bdx2xuOAVfnKeOWZbwCY9vBdhBH42O7pUTP
 tP+SQYzqiK3O+pGpsOzA0RwJqEsj0rnV93W5wCOiMVUKv2cM7ucnBM7mP s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U1B0b7/uW4NF+labMYCDXNo52JaU+gSIXivxMpUsqYUEOVHhFP1NGFsaJD4CutNcK9PiJGgoOh
 t+4iG5oeMbXu7v18QxPQjkQNubLbMpHGNaZ5Usz5oVMo7t2RcJBAa4P+DV/AIKiuFxUkIDDqDE
 SBDNfpvjJN78vr11N0NpG+dHp5FApkd2TvIX4KSOmkIhiIQdEbhRtBXIZNcwUJ4Z6bTME2H705
 VMv+9/pcY3E83m4hakKr4ob+rc5NwXwFaNkCTYm1+xIARTJAff3Gm1EjFIBMGF0xFrLWa/IVXl
 23w=
X-SBRS: 2.7
X-MesageID: 11722675
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11722675"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 28 Jan 2020 12:52:16 +0000
Message-ID: <20200128125216.709-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/apic: Improve current_local_apic_mode()
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ym9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1gyQVBJQykgZG9lc24ndCBuZWVkIGNoZWNraW5nIHRv
IGludGVycHJldApBUElDX0JBU0VfRVhURC4KCkFsc28gdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8g
b3B0aW1pc2UgdGhlIGdlbmVyYXRlZCBhc3NlbWJseSBieSBub3QgdXNpbmcKcmRtc3JsKCkuICBH
Q0MgaXNuJ3QgY2xldmVyIGVub3VnaCB0byBzcG90IHRoYXQgaXQgY2FuIGRyb3AgdGhlIHNoaWZ0
IGFuZCBvcgp0byBwdXQgJWVheCBpbiB0aGUgaGlnaGVyIGhhbGYgb2YgbXNyX2NvbnRlbnRzLgoK
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KCldoYXQgY2FuIEkgc2F5IC0gdGhlIG51bXB0eSB3aG8gd3JvdGUg
dGhhdCBjb2RlIHdhcyB5b3VuZyBhbmQgbmFpdmUuLi4KLS0tCiB4ZW4vYXJjaC94ODYvYXBpYy5j
IHwgMTIgKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hcGljLmMgYi94ZW4vYXJjaC94
ODYvYXBpYy5jCmluZGV4IGE2YTc3NTRkNzcuLjA2ODRjNWQ5YzIgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9hcGljLmMKKysrIGIveGVuL2FyY2gveDg2L2FwaWMuYwpAQCAtMTUzNCwxOCArMTUz
NCwxNCBAQCB2b2lkIF9faW5pdCByZWNvcmRfYm9vdF9BUElDX21vZGUodm9pZCkKIC8qIExvb2sg
YXQgdGhlIGJpdHMgaW4gTVNSX0FQSUNfQkFTRSBhbmQgd29yayBvdXQgd2hpY2ggQVBJQyBtb2Rl
IHdlIGFyZSBpbiAqLwogZW51bSBhcGljX21vZGUgY3VycmVudF9sb2NhbF9hcGljX21vZGUodm9p
ZCkKIHsKLSAgICB1NjQgbXNyX2NvbnRlbnRzOworICAgIHVpbnQzMl90IGhpZ2gsIGxvdzsKIAot
ICAgIHJkbXNybChNU1JfQVBJQ19CQVNFLCBtc3JfY29udGVudHMpOworICAgIHJkbXNyKE1TUl9B
UElDX0JBU0UsIGxvdywgaGlnaCk7CiAKLSAgICAvKiBSZWFkaW5nIEVYVEQgYml0IGZyb20gdGhl
IE1TUiBpcyBvbmx5IHZhbGlkIGlmIENQVUlECi0gICAgICogc2F5cyBzbywgZWxzZSByZXNlcnZl
ZCAqLwotICAgIGlmICggYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1gyQVBJQykgJiYgKG1zcl9j
b250ZW50cyAmIEFQSUNfQkFTRV9FWFREKSApCisgICAgaWYgKCBsb3cgJiBBUElDX0JBU0VfRVhU
RCApCiAgICAgICAgIHJldHVybiBBUElDX01PREVfWDJBUElDOwogCi0gICAgLyogRU4gYml0IHNo
b3VsZCBhbHdheXMgYmUgdmFsaWQgYXMgbG9uZyBhcyB3ZSBjYW4gcmVhZCB0aGUgTVNSCi0gICAg
ICovCi0gICAgaWYgKCBtc3JfY29udGVudHMgJiBBUElDX0JBU0VfRU5BQkxFICkKKyAgICBpZiAo
IGxvdyAmIEFQSUNfQkFTRV9FTkFCTEUgKQogICAgICAgICByZXR1cm4gQVBJQ19NT0RFX1hBUElD
OwogCiAgICAgcmV0dXJuIEFQSUNfTU9ERV9ESVNBQkxFRDsKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
