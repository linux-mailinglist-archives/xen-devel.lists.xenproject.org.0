Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5968B03E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQg0-0001p1-Ax; Tue, 13 Aug 2019 06:53:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxQfy-0001oO-Bz
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:52:58 +0000
X-Inumbo-ID: 00d605ca-bd2e-11e9-a4bd-4f04aca9e9dc
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00d605ca-bd2e-11e9-a4bd-4f04aca9e9dc;
 Mon, 12 Aug 2019 18:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565634090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=InI86ARDp05rfgUT6XN4llH4qPv71cEWM6vgKIKC5FE=;
 b=Kh22vbo1QcZI1d2vENVkvBxFsp9iIJnOZWYW9hE5vpApltBLFXlQ0j8j
 SfoHBzbpvWbX56pYEF7YXYoKK2NUxYuSBY66TcqSCrWh/LlLgeY2bGPP4
 KG0BRlaLeqCYC8D8EptqAXyw1IKLjLo1X2pROZhgPDzYDF8YRm4/MltjU M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VB5UtwPqpcQUD+JyVbb8LpZ1ErfWXoAUQHS5B3npvX0YC/f1l4/bsocYzcYc6Y9tPQ+4z+mRGb
 yXyFNo37/834NIErHd2t02G1hVDw1zyBQLGZX71SyFl33vkBGEuL0PsP/1b1Vw23ehmbFcvTXJ
 v2EyT92u8rXSI9q/wvR3vBbDOsZnv7Zj77Gs0lPDBJZE9N6HwWx7pHioA060NALybN64Kvd0vu
 9F8KPHYu1DYWFX4x7HKZhK7QqSsLuyMiFwpFU64BGPIQTnOIOKnvbor/2qrdNDuvA1FYXbMB9r
 7mI=
X-SBRS: 2.7
X-MesageID: 4170047
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,378,1559534400"; 
   d="scan'208";a="4170047"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 12 Aug 2019 19:21:23 +0100
Message-ID: <20190812182125.18094-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812182125.18094-1-andrew.cooper3@citrix.com>
References: <20190812182125.18094-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/suspend: Sanity check more properties in
 enter_state()
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

VGhlIGxvZ2ljIGRlcGVuZHMgb24gYmVpbmcgcnVuIG9uIENQVTAsIGFuZCBpbiBJRExFIGNvbnRl
eHQuICBIYXZpbmcgdGhpcwpleHBsaWNpdGx5IGlkZW50aWZpZWQgYWxsb3dzIGZvciBzaW1wbGlm
aWNhdGlvbiBvZiB0aGUgd2hvbGUgUzMgcGF0aC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2FjcGkvcG93ZXIuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKaW5kZXgg
YWVjYzc1NGZkYi4uZDgzZThjZGQ1MiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCkBAIC0xNzQsNiArMTc0LDggQEAg
c3RhdGljIGludCBlbnRlcl9zdGF0ZSh1MzIgc3RhdGUpCiAgICAgICAgIHJldHVybiAtRUJVU1k7
CiAKICAgICBCVUdfT04oc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9hY3RpdmUpOworICAgIEJV
R19PTighaXNfaWRsZV92Y3B1KGN1cnJlbnQpKTsKKyAgICBCVUdfT04oc21wX3Byb2Nlc3Nvcl9p
ZCgpICE9IDApOwogICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9zdXNwZW5kOwogCiAgICAg
cHJpbnRrKFhFTkxPR19JTkZPICJQcmVwYXJpbmcgc3lzdGVtIGZvciBBQ1BJIFMlZCBzdGF0ZS5c
biIsIHN0YXRlKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
