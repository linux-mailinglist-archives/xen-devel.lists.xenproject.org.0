Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC611D596
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:31:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTBw-0007Cq-Ui; Thu, 12 Dec 2019 18:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOos=2C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifTBv-0007CS-Gj
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:27:59 +0000
X-Inumbo-ID: 181498de-1d0d-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 181498de-1d0d-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 18:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576175266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W19z0knlI4RQSuZnOaDsWSA7jDnB55TnZ7sQYfdT2uA=;
 b=G+Qf+AcBnembJa2g4NZmVZOzm0AmRNupTDT8iHPD5loWIMIx8CqpgV7i
 1Ivv5zN8CvNKER+GFSjDspjw4ZQEK+RRbSyV189603bv5JP0VjAn5lusx
 wwvnXunnBcRCytq/tCknfQt3Zr8uPsNT5hC+tEvpXHR3XtyLQ3eGGdfyz o=;
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
IronPort-SDR: KgXrhqcxrQ5G4AROH87z4EFkpK3wIaAMJfQmPfm9ydRIxifLyZEXOTUCwoJXX4uW9zUiTZXi4e
 zrs4q85HbSEnWR7oc4l+NMW+7GEdsuFqMyL5/p3Q0CJUfBMM3bwTeeEqrJAiHtVzNRGmd//CnH
 MDvPuv0AgcRmtaoR7Dr+uZKmvmRojju7I8vz3r7Ac3zF7GsuP/PwvaKYNpCXQAZwAPX0HL3AON
 NZDo/R5ZveMcGsb7nepXFvJLnrqN9tkZ69gk6POaDq+0/TBiZaJ04zq4Fg4pGtm+iPrlTnu986
 XwQ=
X-SBRS: 2.7
X-MesageID: 10021229
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; d="scan'208";a="10021229"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 18:27:38 +0000
Message-ID: <20191212182740.2190199-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212182740.2190199-1-anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 6/8] xen: Move CONFIG_INDIRECT_THUNK to
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
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L0tjb25maWcgIHwgMyArKysKIHhlbi9hcmNoL3g4Ni9SdWxlcy5tayB8IDQgKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwppbmRleCAwMmJi
MDVmNDJlZjEuLmFjMGZiZTNlMWFhMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcK
KysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKQEAgLTMyLDYgKzMyLDkgQEAgY29uZmlnIEFSQ0hf
REVGQ09ORklHCiAJc3RyaW5nCiAJZGVmYXVsdCAiYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVm
Y29uZmlnIgogCitjb25maWcgSU5ESVJFQ1RfVEhVTksKKwlkZWZfYm9vbCAkKGNjLW9wdGlvbiwt
bWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlcikKKwogbWVudSAiQXJjaGl0ZWN0dXJlIEZlYXR1cmVz
IgogCiBzb3VyY2UgImFyY2gvS2NvbmZpZyIKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9SdWxl
cy5tayBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawppbmRleCA5MmZkYmU5ZDY4MjIuLmEyYzI1N2Zi
OTViMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L1J1bGVzLm1rCisrKyBiL3hlbi9hcmNoL3g4
Ni9SdWxlcy5tawpAQCAtNzEsMTEgKzcxLDkgQEAgQ0ZMQUdTICs9IC1ER0NDX0hBU19WSVNJQklM
SVRZX0FUVFJJQlVURQogZW5kaWYKIAogIyBDb21waWxlIHdpdGggdGh1bmstZXh0ZXJuLCBpbmRp
cmVjdC1icmFuY2gtcmVnaXN0ZXIgaWYgYXZhaWFibGUuCi1pZm5lcSAoJChjYWxsIGNjLW9wdGlv
biwkKENDKSwtbWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlcixuKSxuKQoraWZlcSAoJChDT05GSUdf
SU5ESVJFQ1RfVEhVTkspLHkpCiBDRkxBR1MgKz0gLW1pbmRpcmVjdC1icmFuY2g9dGh1bmstZXh0
ZXJuIC1taW5kaXJlY3QtYnJhbmNoLXJlZ2lzdGVyCi1DRkxBR1MgKz0gLURDT05GSUdfSU5ESVJF
Q1RfVEhVTksKIENGTEFHUyArPSAtZm5vLWp1bXAtdGFibGVzCi1leHBvcnQgQ09ORklHX0lORElS
RUNUX1RIVU5LPXkKIGVuZGlmCiAKICMgSWYgc3VwcG9ydGVkIGJ5IHRoZSBjb21waWxlciwgcmVk
dWNlIHN0YWNrIGFsaWdubWVudCB0byA4IGJ5dGVzLiBCdXQgYWxsb3cKLS0gCkFudGhvbnkgUEVS
QVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
