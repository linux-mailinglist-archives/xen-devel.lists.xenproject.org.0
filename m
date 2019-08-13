Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9018B7CF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVR3-0000sU-VK; Tue, 13 Aug 2019 11:57:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVR2-0000sI-PT
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:57:52 +0000
X-Inumbo-ID: 937c3e18-bdc1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 937c3e18-bdc1-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7l12ElqY2vgvbH4tbufHnMr8dyi9K16XNq6wO/NFnWo=;
 b=c3kYi+kEBBoHDAEWZRdh5CO/uufRH6yDqTT18JlauUEZg+ukbJMITupO
 pB2FG8aGG5687nGVppft+yFasrUTElhsdfj1dBo+zazvhUdnDNsFxu2MC
 21lmE1bxDGFyZT+Clt4yxlI5X+cOlxko8eM9uDHnwZ71jjm0mSNkzcZxy E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tshFiBo75oKp6/rg1WM7Wix4AFcyxcizAtrq2i/DwpcajnSO3hYWKq3U1m+BYFL6B/zh9Euxry
 S3HNTDs9qjr+8vulASqOjH+pdaGVLJAEcwChjKfxWs7K46k4MLlg04ue6ObnLnTtlZidvEqMjJ
 KlmocxMGZ+bJPH7FN8QGvamY9fhbYsp22L9iMS/lHOv2P6oxVuzR2w+ur/xrkK/lQVV9+nj9iF
 hO4S9nysxmFP6Y1UN4lJ40i6mPKN4xfvgVTyje9zxZmXEji4dCtca9DE4pBfwRApLAtcwShXU2
 mSI=
X-SBRS: 2.7
X-MesageID: 4198435
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4198435"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:08 +0100
Message-ID: <20190813113119.14804-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 24/35] OvmfPkg/XenPlatformPei: Reserve VGA
 memory region, to boot Linux
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

TGludXggcGFuaWMgaWYgdGhlIFZHQSByZWdpb24gaXNuJ3QgcmVzZXJ2ZWQuCgpXaGVuIExpbnV4
IGlzIGJvb3RlZCBvbiBFRkkgc3lzdGVtLCBpdCBleHBlY3RzIHRoZSBtZW1vcnkgYXQgMHhhMDAw
MCB0bwpfbm90XyBiZSBjb252ZW50aW9uYWwgbWVtb3J5LiBPdGhlcndpc2UgYSB2YXJpYWJsZSBp
c24ndCBpbml0aWFsaXNlZApwcm9wZXJseSBhbmQgTGludXggcGFuaWMgd2hlbiBhIHZpcnR1YWwg
Y29uc29sZS90ZXJtaW5hbCBpcyBhc2tlZCB0byBiZQpjcmVhdGVkLgoKU2VlIGZvciBtb3JlIGRl
dGFpbDoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE5LTAzL21zZzAyMTM5Lmh0bWwKClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUu
b3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtA
cmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHYzOgogICAgLSBmaXggY29tbWl0IG1lc3NhZ2UK
CiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIHwgMTYgKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCBjNDUw
NmRlZjlhLi5jNDFmZWNkYzQ4IDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKQEAgLTI5NCw2ICsyOTQsMTIg
QEAgWGVuUHVibGlzaFJhbVJlZ2lvbnMgKAogICBTdGF0dXMgPSBYZW5HZXRFODIwTWFwICgmRTgy
ME1hcCwgJkU4MjBFbnRyaWVzQ291bnQpOw0KICAgQVNTRVJUX0VGSV9FUlJPUiAoU3RhdHVzKTsN
CiANCisgIEFkZE1lbW9yeUJhc2VTaXplSG9iICgwLCAweEEwMDAwKTsNCisgIC8vDQorICAvLyBW
aWRlbyBtZW1vcnkgKyBMZWdhY3kgQklPUyByZWdpb24sIHRvIGFsbG93IExpbnV4IHRvIGJvb3Qu
DQorICAvLw0KKyAgQWRkUmVzZXJ2ZWRNZW1vcnlCYXNlU2l6ZUhvYiAoMHhBMDAwMCwgQkFTRV8x
TUIgLSAweEEwMDAwLCBUUlVFKTsNCisNCiAgIExhcGljQmFzZSA9IFBjZEdldDMyIChQY2RDcHVM
b2NhbEFwaWNCYXNlQWRkcmVzcyk7DQogICBMYXBpY0VuZCA9IExhcGljQmFzZSArIFNJWkVfMU1C
Ow0KICAgQWRkSW9NZW1vcnlSYW5nZUhvYiAoTGFwaWNCYXNlLCBMYXBpY0VuZCk7DQpAQCAtMzEy
LDYgKzMxOCwxNiBAQCBYZW5QdWJsaXNoUmFtUmVnaW9ucyAoCiAgICAgQmFzZSA9IEFMSUdOX1ZB
TFVFIChFbnRyeS0+QmFzZUFkZHIsIChVSU5UNjQpRUZJX1BBR0VfU0laRSk7DQogICAgIEVuZCA9
IChFbnRyeS0+QmFzZUFkZHIgKyBFbnRyeS0+TGVuZ3RoKSAmIH4oVUlOVDY0KUVGSV9QQUdFX01B
U0s7DQogDQorICAgIC8vDQorICAgIC8vIElnbm9yZSB0aGUgZmlyc3QgMU1CLCB0aGlzIGlzIGhh
bmRsZWQgYmVmb3JlIHRoZSBsb29wLg0KKyAgICAvLw0KKyAgICBpZiAoQmFzZSA8IEJBU0VfMU1C
KSB7DQorICAgICAgQmFzZSA9IEJBU0VfMU1COw0KKyAgICB9DQorICAgIGlmIChCYXNlID49IEVu
ZCkgew0KKyAgICAgIGNvbnRpbnVlOw0KKyAgICB9DQorDQogICAgIHN3aXRjaCAoRW50cnktPlR5
cGUpIHsNCiAgICAgY2FzZSBFZmlBY3BpQWRkcmVzc1JhbmdlTWVtb3J5Og0KICAgICAgIEFkZE1l
bW9yeVJhbmdlSG9iIChCYXNlLCBFbmQpOw0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
