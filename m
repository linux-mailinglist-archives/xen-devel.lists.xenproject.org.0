Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6453E8B7C8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVRj-0001jX-Hh; Tue, 13 Aug 2019 11:58:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVRh-0001fS-64
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:58:33 +0000
X-Inumbo-ID: ab8d3a22-bdc1-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab8d3a22-bdc1-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=792SomevRukumXZQXvfDZzk86JBybb1Rx4DeeovhSsE=;
 b=UeCMSUKjI+zYRpCJvpGbDHMhM86Kiskr9AXBsi0Qt6rdkFHTlKCQ1Usu
 y6raj+l1egzq7y8jCITw7a/KtO7IbGQb6biarUGBV/5LrAb3CbUag+eK4
 aiu0PJPnyq2dT70ogL7tRlDZT42Gw9dmdo8yjkY0w8cFqTDrgp2PtuJkR M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: p9p0LnWBoAgODO0cxwFEMiklYQURe8f5Wmfyxxg/Pipp9LNrW864t7Y4R6P1GraBpQ3zaL0UGP
 h1J0Y0LFO+hLDPxBtgZL5006w8l1d1Zz6dwB8aZEHMzPhxy1hNCTRQ8Ht0nxuQe9eIGiIRqkSI
 98PUsjB6/u+R9UVoDb8sC+WixZ/lNMFjGzJy3+TgCCR7Wo0z1srRbJL2dusF23fHpI1ppymCls
 tZOqZ3TplQYuvtyVKA8TPxi2Ll7cJ4wof1pC5N0X6IJYgQOar1qmEPeoLywM5RK6npb0WkbdRB
 rwc=
X-SBRS: 2.7
X-MesageID: 4210855
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4210855"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:04 +0100
Message-ID: <20190813113119.14804-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 20/35] OvmfPkg/XenPlatformPei: Introduce
 XenPvhDetected
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

WGVuUHZoRGV0ZWN0ZWQoKSBjYW4gYmUgdXNlZCB0byBmaWd1cmUgb3V0IGlmIE9WTUYgaGFzIHN0
YXJ0ZWQgdmlhIHRoZQpYZW4gUFZIIGVudHJ5IHBvaW50LgoKUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBMYXN6bG8gRXJz
ZWsgPGxlcnNla0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgogICAgdjU6CiAgICAtIGluIFhlblB2
aERldGVjdGVkLCBjaGVjayBtWGVuSW5mby5IeXBlclBhZ2VzIGluc3RlYWQgb2YgLlZlcnNpb25N
YWpvcgoKIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaCB8ICA1ICsrKysrCiBPdm1m
UGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jICAgICAgfCAxMyArKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1BsYXRmb3JtLmggYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgKaW5k
ZXggNGE4MDA1N2JkYy4uZGI5YTYyNTcyZiAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9QbGF0Zm9ybS5oCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaApA
QCAtOTksNiArOTksMTEgQEAgWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKAogICBWT0lEDQogICApOw0K
IA0KK0JPT0xFQU4NCitYZW5QdmhEZXRlY3RlZCAoDQorICBWT0lEDQorICApOw0KKw0KIFZPSUQN
CiBBbWRTZXZJbml0aWFsaXplICgNCiAgIFZPSUQNCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCAyOWI0
MmI3NDZjLi5mMjZmMGU1NmRkIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKQEAgLTIxNCw2ICsyMTQsMTkg
QEAgWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKAogICByZXR1cm4gKG1YZW5Idm1sb2FkZXJJbmZvICE9
IE5VTEwpOw0KIH0NCiANCitCT09MRUFODQorWGVuUHZoRGV0ZWN0ZWQgKA0KKyAgVk9JRA0KKyAg
KQ0KK3sNCisgIC8vDQorICAvLyBUaGlzIGZ1bmN0aW9uIHNob3VsZCBvbmx5IGJlIHVzZWQgYWZ0
ZXIgWGVuQ29ubmVjdA0KKyAgLy8NCisgIEFTU0VSVCAobVhlbkluZm8uSHlwZXJQYWdlcyAhPSBO
VUxMKTsNCisNCisgIHJldHVybiBtWGVuSHZtbG9hZGVySW5mbyA9PSBOVUxMOw0KK30NCisNCiBW
T0lEDQogWGVuUHVibGlzaFJhbVJlZ2lvbnMgKA0KICAgVk9JRA0KLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
