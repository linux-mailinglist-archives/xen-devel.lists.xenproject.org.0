Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860214ABA9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 22:32:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwBwg-0008Po-Sq; Mon, 27 Jan 2020 21:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V40H=3Q=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iwBwf-0008Pj-Cd
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 21:29:21 +0000
X-Inumbo-ID: 13fdf1b0-414c-11ea-b45d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13fdf1b0-414c-11ea-b45d-bc764e2007e4;
 Mon, 27 Jan 2020 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580160560;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=K1A6RhuPaJ7idyjzd4rmn+1KtpWizlKboTNl7NmvBX4=;
 b=PX/YidbxKItxTdjX6OEJY6khb1gjDj1B6BCQgYdGmn4XZOpZrKE/at1x
 eMHtcveMjAlFN+ZZqVDezNnNNxtKwMWbe5xn513vJlDqEG4m4/3r90+XG
 DF6Vz/9aaYS5IeeHa7ZcLtKGtPzcim+Hh7LNrpQlFfqFNFnrNX7mRT7af c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6Y6IAp+aR0ejqMsdWFm12UspUgsmf53UC20fCtnVuyYv9gOihFk7DBcPXxi+SRka4+OmUQXviM
 EuSb1Q8fdEfAZv7Vt3gy/OhNq+XTQExCjoCgvrskE64wiIbmrLgd/wtyc1H1MODcg0RhHqrry9
 Rw1KNb6XF7UI4Tn5xZJHTOGhzSpZc6tk7WOsaREKBFFd+MUwlup60DJq7R/4t9Xn7xS3XR2/Au
 r3oL83Ycf51oajCXnvtyWCgPcCyTvVdBuFiqA0b6QMBZ8yXqoormVXIO5LOkMkgyVGAS79NZv/
 nSs=
X-SBRS: 2.7
X-MesageID: 11534475
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,371,1574139600"; d="scan'208";a="11534475"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 21:29:16 +0000
Message-ID: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/suspend: disable watchdog before calling
 console_start_sync()
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGFuZCBlbmFibGUgaXQgYWZ0ZXIgZXhpdGluZyBTLXN0YXRlLiBPdGhlcndpc2UgYWNjdW11
bGF0ZWQKb3V0cHV0IGluIHNlcmlhbCBidWZmZXIgbWlnaHQgZWFzaWx5IHRyaWdnZXIgdGhlIHdh
dGNoZG9nIGlmIGl0J3MKc3RpbGwgZW5hYmxlZCBhZnRlciBlbnRlcmluZyBzeW5jIHRyYW5zbWlz
c2lvbiBtb2RlLgoKVGhlIGlzc3VlIG9ic2VydmVkIG9uIG1hY2hpbmVzIHdoaWNoLCB1bmZvcnR1
bmF0ZWx5LCBnZW5lcmF0ZSBub24tMApvdXRwdXQgaW4gQ1BVIG9mZmxpbmUgY2FsbGJhY2tzLgoK
U2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyBi
L3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKaW5kZXggODA3ODM1Mi4uNjIzODRhNCAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9w
b3dlci5jCkBAIC0yMyw2ICsyMyw3IEBACiAjaW5jbHVkZSA8eGVuL2RvbWFpbi5oPgogI2luY2x1
ZGUgPHhlbi9jb25zb2xlLmg+CiAjaW5jbHVkZSA8eGVuL2lvbW11Lmg+CisjaW5jbHVkZSA8eGVu
L3dhdGNoZG9nLmg+CiAjaW5jbHVkZSA8eGVuL2NwdS5oPgogI2luY2x1ZGUgPHB1YmxpYy9wbGF0
Zm9ybS5oPgogI2luY2x1ZGUgPGFzbS90Ym9vdC5oPgpAQCAtMjIzLDYgKzIyNCw3IEBAIHN0YXRp
YyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQogCiAgICAgYWNwaV9zbGVlcF9wcmVwYXJlKHN0
YXRlKTsKIAorICAgIHdhdGNoZG9nX2Rpc2FibGUoKTsKICAgICBjb25zb2xlX3N0YXJ0X3N5bmMo
KTsKICAgICBwcmludGsoIkVudGVyaW5nIEFDUEkgUyVkIHN0YXRlLlxuIiwgc3RhdGUpOwogCkBA
IC0yODEsNiArMjgzLDcgQEAgc3RhdGljIGludCBlbnRlcl9zdGF0ZSh1MzIgc3RhdGUpCiAgICAg
ICAgIHRib290X3MzX2Vycm9yKGVycm9yKTsKIAogICAgIGNvbnNvbGVfZW5kX3N5bmMoKTsKKyAg
ICB3YXRjaGRvZ19lbmFibGUoKTsKIAogICAgIG1pY3JvY29kZV91cGRhdGVfb25lKHRydWUpOwog
Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
