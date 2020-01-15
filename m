Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B1513CA30
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 18:03:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irm21-0008In-G8; Wed, 15 Jan 2020 17:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UrDx=3E=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1irm1z-0008II-7B
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 17:00:35 +0000
X-Inumbo-ID: 83ba5dcf-37b8-11ea-85c2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83ba5dcf-37b8-11ea-85c2-12813bfff9fa;
 Wed, 15 Jan 2020 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579107623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YPPcEcLWqAV5YjOxvfjsuf6L90e40FW3jrZNsDBiatI=;
 b=EnVZ2xV1Y1f9RM2AoGgoV8uDvZTu5biEMW4Hft51CFMpqyrwUPQmgtSy
 3Deh4Fi0EdARE6Mn3toN89x+1sQgD8IC2gMxvO0hHNJxZ4+xgM8gQRIsr
 NO4kihZXm8ZhKWwi+y1z+73hnvufEInv//MWV5SukNyI9JfGgVaqYaBms U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eGv1VLa4Dg2lfnVm5d8CdymZSfQwpCxQvX6EfPQ9Gvjf85+Gaz4GYORniXFeVTo5uai77nZjSM
 n8bO+B2l60rAjUPfIp/JJqWzIidE8ndvsBxDP+fSV5NZlnPFDkhh4GxaTuuu1vquB/9tUg/7Tj
 FjvVZt1+QmbMmKPjLWmonKFrWwyHR9Mo5fUnocENMxMIvC2V+HTgtBHXy7XFyH9uREK3j/7xGl
 e4K9VTanex5ueIe+yXUvJ2qTp1kmQI8QPIubnV5R9kY2WnRONx/5F21lpbVBOOh9aGIlD+VgAU
 goM=
X-SBRS: 2.7
X-MesageID: 10973259
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="10973259"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 15 Jan 2020 17:00:13 +0000
Message-ID: <20200115170015.249667-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115170015.249667-1-anthony.perard@citrix.com>
References: <20200115170015.249667-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 4/6] xen: Move CONFIG_INDIRECT_THUNK to
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
bi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcKaW5kZXggZjg1M2MwNDU2
NDA0Li44MTQ5MzYyYmRlZjMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCisrKyBi
L3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0zMSw2ICszMSw5IEBAIGNvbmZpZyBBUkNIX0RFRkNP
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
