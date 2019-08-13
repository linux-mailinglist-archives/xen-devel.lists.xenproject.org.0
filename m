Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796968B7D0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVRi-0001gd-3G; Tue, 13 Aug 2019 11:58:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVRf-0001dC-Uc
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:58:31 +0000
X-Inumbo-ID: a9f8c8f2-bdc1-11e9-bcf7-6ff3fc612c7a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9f8c8f2-bdc1-11e9-bcf7-6ff3fc612c7a;
 Tue, 13 Aug 2019 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gxsbtR0AYKCxM1raqW40e4uHv1mrRKkWAXEV38lfF1o=;
 b=GzOeHTlZaS1TsEdQc3CCUQnX9uY1VURcYC1zoDnIN4HSPLpbE5BRHN21
 iSdzncj+GTgy6W+ib2f4XZ7hA/Vm+6X81DW5tRAfkrBn32UZ0fwMU75tY
 vdbXTidlg0T70b6nOsuXnbo9Qfsw5ZzgJFUlwyWBu3cc3RRtGsHyCZwrK s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c9dKx3rlE0ig9P9rBp9ypO7aAfDLnkrtR1mabr16OHaDweclFuvWSzSyyqwgSFaVWM9ybkyw3Q
 FHoZnvwo94aVT2k4wGDVU50gQzVeLBxK3fgQLpDsa6r+4kpUCe/77A4Wp2xKkVMZsjAXvKTKjV
 gkHIAFXuLaGG4lK1vh2zwK3hgU4iI7mEVoC8bm0/Fcslj6ZIy0LXmOwG5w953GQzNT16AkzDYm
 YuDOxxxjYlpTaBIiRnQzAGVdvi0AGLGdjBEh3gUekTSQVSwX+xmJHBtaCtiy4pvry78B5mN9wp
 IU0=
X-SBRS: 2.7
X-MesageID: 4402045
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4402045"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:01 +0100
Message-ID: <20190813113119.14804-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 17/35] OvmfPkg/XenPlatformPei: Reinit
 XenHypercallLib
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFhlblBsYXRmb3JtUGVpIG5lZWRzIHRvIG1ha2UgaHlwZXJjYWxscywgYnV0IHRoZSBYZW5I
eXBlcmNhbGxMaWIgd2FzCmluaXRpYWxpc2VkIGJlZm9yZSB0aGUgSHlwZXJQYWdlIHdhcyByZWFk
eS4gTm93IHRoYXQgWGVuUGxhdGZvcm1QZWkgaGFzCmluaXRpYWxpc2VkIHRoZSBIeXBlclBhZ2Us
IHJlaW5pdGlhbGlzZSB0aGUgWGVuSHlwZXJjYWxsTGliLgoKUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgogICAgdjM6CiAgICAtIG5ldyBw
YXRjaCBzcGxpdCBmcm9tIFhlbkh5cGVyY2FsbExpYjogRW5hYmxlIGl0IGluIFBFSU0uCiAgICAt
IGNoZWNrIGZvciBMaWIgaW5pdGlhbGlzYXRpb24gZmFpbHVyZS4KCiBPdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZiB8IDEgKwogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Y
ZW4uYyAgICAgICAgICAgICAgfCA5ICsrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW5QbGF0Zm9y
bVBlaS5pbmYgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZgppbmRl
eCA0ZDAwMjA2ZDA5Li4wZWY3N2RiOTJjIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1hlblBsYXRmb3JtUGVpLmluZgorKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBs
YXRmb3JtUGVpLmluZgpAQCAtNTksNiArNTksNyBAQCBbTGlicmFyeUNsYXNzZXNdCiAgIE10cnJM
aWINCiAgIE1lbUVuY3J5cHRTZXZMaWINCiAgIFBjZExpYg0KKyAgWGVuSHlwZXJjYWxsTGliDQog
DQogW1BjZF0NCiAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZQZWlNZW1GdkJh
c2UNCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9Y
ZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCBiMzY2MTM5YTBhLi5jNjdmNGM5Njk3IDEwMDY0NAot
LS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZv
cm1QZWkvWGVuLmMKQEAgLTI2LDYgKzI2LDcgQEAKICNpbmNsdWRlIDxMaWJyYXJ5L1Jlc291cmNl
UHVibGljYXRpb25MaWIuaD4NCiAjaW5jbHVkZSA8TGlicmFyeS9NdHJyTGliLmg+DQogI2luY2x1
ZGUgPEluZHVzdHJ5U3RhbmRhcmQvWGVuL2FyY2gteDg2L2h2bS9zdGFydF9pbmZvLmg+DQorI2lu
Y2x1ZGUgPExpYnJhcnkvWGVuSHlwZXJjYWxsTGliLmg+DQogDQogI2luY2x1ZGUgIlBsYXRmb3Jt
LmgiDQogI2luY2x1ZGUgIlhlbi5oIg0KQEAgLTg4LDYgKzg5LDcgQEAgWGVuQ29ubmVjdCAoCiAg
IEVGSV9YRU5fT1ZNRl9JTkZPICpJbmZvOw0KICAgQ0hBUjggU2lnW3NpemVvZiAoSW5mby0+U2ln
bmF0dXJlKSArIDFdOw0KICAgVUlOVDMyICpQVkhSZXNldFZlY3RvckRhdGE7DQorICBSRVRVUk5f
U1RBVFVTIFN0YXR1czsNCiANCiAgIEFzbUNwdWlkIChYZW5MZWFmICsgMiwgJlRyYW5zZmVyUGFn
ZXMsICZUcmFuc2ZlclJlZywgTlVMTCwgTlVMTCk7DQogICBtWGVuSW5mby5IeXBlclBhZ2VzID0g
QWxsb2NhdGVQYWdlcyAoVHJhbnNmZXJQYWdlcyk7DQpAQCAtMTUyLDYgKzE1NCwxMyBAQCBYZW5D
b25uZWN0ICgKICAgICBzaXplb2YobVhlbkluZm8pDQogICAgICk7DQogDQorICAvLw0KKyAgLy8g
SW5pdGlhbGl6ZSB0aGUgWGVuSHlwZXJjYWxsIGxpYnJhcnksIG5vdyB0aGF0IHRoZSBYZW5JbmZv
IEhPQiBpcw0KKyAgLy8gYXZhaWxhYmxlDQorICAvLw0KKyAgU3RhdHVzID0gWGVuSHlwZXJjYWxs
TGliSW5pdCAoKTsNCisgIEFTU0VSVF9SRVRVUk5fRVJST1IgKFN0YXR1cyk7DQorDQogICByZXR1
cm4gRUZJX1NVQ0NFU1M7DQogfQ0KIA0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
