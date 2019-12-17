Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A6122978
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 12:04:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihAZS-00088b-5W; Tue, 17 Dec 2019 10:59:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9l2e=2H=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihAZR-00088O-Bc
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 10:59:17 +0000
X-Inumbo-ID: 3ef8eb5a-20bc-11ea-8e9d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ef8eb5a-20bc-11ea-8e9d-12813bfff9fa;
 Tue, 17 Dec 2019 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576580347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFkrxJQVV/HExSMHxxCvCoHwqPHb9c3soladj2CHefk=;
 b=Cnh5XrUVB3Npi2sACSU3eCHjZ2cSd0uQBFCZwfQOXCBUwNK+Cuj/DjHy
 sSOlgdJTzkJTTh9XXCWh64ZBVmTqriEDM42269YxhwWTe3IGuPn4u8m3k
 G84nvaIRixgQumTdoNUToREz8zUiKslsY5CruJb9wgM19fGkmontzheMa 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EHYoW4qtHGImR0IxSSTkejQI80CZhJdUw6RpK6WHv8O4EtcqWttqaz0q0IXOT3mg2nx2ZbKlWg
 hbaEIBzokVnpUjI9d/wlQLSoexROp2oIhkXlnKzzUUDYl47VL0GfHKE11wf9z+V2AZ8885Kn5z
 /uewGS2Pb/rkioAmBlKlwIUsiuXODoUrza8IABPvmVPA32mmTxCqayGK7kOAVOLc+vhWOFirYq
 ivVyFKGEf8rWCb04O4oele+7pAyVIaOmv8l2VXx5wCZf9Q58M4WOz+3+i9MpHZIh2ncDz8bmXl
 qYs=
X-SBRS: 2.7
X-MesageID: 10211657
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10211657"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 10:58:59 +0000
Message-ID: <20191217105901.68158-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191217105901.68158-1-anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 4/6] xen: Move CONFIG_INDIRECT_THUNK to
 Kconfig
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm93IHRoYXQgS2NvbmZpZyBoYXMgdGhlIGNhcGFiaWxpdHkgdG8gcnVuIHNoZWxsIGNvbW1hbmQg
d2hlbgpnZW5lcmF0aW5nIENPTkZJR18qIHdlIGNhbiB1c2UgaXQgaW4gc29tZSBjYXNlcyB0byB0
ZXN0IENGTEFHUy4KCkNPTkZJR19JTkRJUkVDVF9USFVOSyBpcyBhIGdvb2QgZXhhbXBsZSB0aGF0
IHdhbnRzIHRvIGV4aXN0IGJvdGggaW4KTWFrZWZpbGUgYW5kIGFzIGEgQyBtYWNybywgd2hpY2gg
S2NvbmZpZyBkby4gU28gdXNlIEtjb25maWcgdG8KZ2VuZXJhdGUgQ09ORklHX0lORElSRUNUX1RI
VU5LIGFuZCBoYXZlIHRoZSBDRkxBR1MgZGVwZW5kcyBvbiB0aGF0LgoKU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9L
Y29uZmlnICB8IDMgKysrCiB4ZW4vYXJjaC94ODYvUnVsZXMubWsgfCA0ICstLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcKaW5kZXggMDJiYjA1ZjQy
ZWYxLi5hYzBmYmUzZTFhYTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCisrKyBi
L3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0zMiw2ICszMiw5IEBAIGNvbmZpZyBBUkNIX0RFRkNP
TkZJRwogCXN0cmluZwogCWRlZmF1bHQgImFyY2gveDg2L2NvbmZpZ3MveDg2XzY0X2RlZmNvbmZp
ZyIKIAorY29uZmlnIElORElSRUNUX1RIVU5LCisJZGVmX2Jvb2wgJChjYy1vcHRpb24sLW1pbmRp
cmVjdC1icmFuY2gtcmVnaXN0ZXIpCisKIG1lbnUgIkFyY2hpdGVjdHVyZSBGZWF0dXJlcyIKIAog
c291cmNlICJhcmNoL0tjb25maWciCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvUnVsZXMubWsg
Yi94ZW4vYXJjaC94ODYvUnVsZXMubWsKaW5kZXggOTJmZGJlOWQ2ODIyLi5hMmMyNTdmYjk1YjIg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5taworKysgYi94ZW4vYXJjaC94ODYvUnVs
ZXMubWsKQEAgLTcxLDExICs3MSw5IEBAIENGTEFHUyArPSAtREdDQ19IQVNfVklTSUJJTElUWV9B
VFRSSUJVVEUKIGVuZGlmCiAKICMgQ29tcGlsZSB3aXRoIHRodW5rLWV4dGVybiwgaW5kaXJlY3Qt
YnJhbmNoLXJlZ2lzdGVyIGlmIGF2YWlhYmxlLgotaWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sJChD
QyksLW1pbmRpcmVjdC1icmFuY2gtcmVnaXN0ZXIsbiksbikKK2lmZXEgKCQoQ09ORklHX0lORElS
RUNUX1RIVU5LKSx5KQogQ0ZMQUdTICs9IC1taW5kaXJlY3QtYnJhbmNoPXRodW5rLWV4dGVybiAt
bWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlcgotQ0ZMQUdTICs9IC1EQ09ORklHX0lORElSRUNUX1RI
VU5LCiBDRkxBR1MgKz0gLWZuby1qdW1wLXRhYmxlcwotZXhwb3J0IENPTkZJR19JTkRJUkVDVF9U
SFVOSz15CiBlbmRpZgogCiAjIElmIHN1cHBvcnRlZCBieSB0aGUgY29tcGlsZXIsIHJlZHVjZSBz
dGFjayBhbGlnbm1lbnQgdG8gOCBieXRlcy4gQnV0IGFsbG93Ci0tIApBbnRob255IFBFUkFSRAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
