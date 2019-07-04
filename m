Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E911C5FA71
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3CB-0006lJ-Sm; Thu, 04 Jul 2019 14:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3C9-0006iP-Sc
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:45 +0000
X-Inumbo-ID: 367a7e4e-9e6c-11e9-b51b-97b70c203816
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 367a7e4e-9e6c-11e9-b51b-97b70c203816;
 Thu, 04 Jul 2019 14:58:42 +0000 (UTC)
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
IronPort-SDR: r9FwiRVwyiNuVwGckpLDiYkRTu+u8eVktrQjLscGfacuQVqlny5F60pJrvtzSKklIf2qrBCabj
 dLETNo5//5FuSuHA/RhyKoEzmVhIJ3D6mLPEBh876PP/UAISbHHH4ZNtw26WXOnP5h6qC69YvI
 eM8Ck5I8y1qPsgSsBm9PJw61pfP+Q2VZLTaBKGkG9dBaVI9Hf78A09b54ytMgFCod5EFAuGsxb
 pa8q23Wf5V0i8s9jRW5cjtal3PuUJcUbYAjADrRLFQ3+igTA1vMlr42OG+ywJI1wPY9mFywNvI
 OSo=
X-SBRS: 2.7
X-MesageID: 2602754
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2602754"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:23 +0100
Message-ID: <20190704144233.27968-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 25/35] OvmfPkg/XenPlatformPei: Reserve VGA
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
YXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCA2MmEy
YzNlZDkzLi45ODY2YjdjMjEyIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKQEAgLTI5MSw2ICsyOTEsMTIg
QEAgWGVuUHVibGlzaFJhbVJlZ2lvbnMgKAogICBTdGF0dXMgPSBYZW5HZXRFODIwTWFwICgmRTgy
ME1hcCwgJkU4MjBFbnRyaWVzQ291bnQpOw0KICAgQVNTRVJUX0VGSV9FUlJPUiAoU3RhdHVzKTsN
CiANCisgIEFkZE1lbW9yeUJhc2VTaXplSG9iICgwLCAweEEwMDAwKTsNCisgIC8vDQorICAvLyBW
aWRlbyBtZW1vcnkgKyBMZWdhY3kgQklPUyByZWdpb24sIHRvIGFsbG93IExpbnV4IHRvIGJvb3Qu
DQorICAvLw0KKyAgQWRkUmVzZXJ2ZWRNZW1vcnlCYXNlU2l6ZUhvYiAoMHhBMDAwMCwgQkFTRV8x
TUIgLSAweEEwMDAwLCBUUlVFKTsNCisNCiAgIGZvciAoSW5kZXggPSAwOyBJbmRleCA8IEU4MjBF
bnRyaWVzQ291bnQ7IEluZGV4KyspIHsNCiAgICAgVUlOVDY0IEJhc2U7DQogICAgIFVJTlQ2NCBF
bmQ7DQpAQCAtMzA0LDYgKzMxMCwxNiBAQCBYZW5QdWJsaXNoUmFtUmVnaW9ucyAoCiAgICAgQmFz
ZSA9IEFMSUdOX1ZBTFVFIChFbnRyeS0+QmFzZUFkZHIsIChVSU5UNjQpRUZJX1BBR0VfU0laRSk7
DQogICAgIEVuZCA9IChFbnRyeS0+QmFzZUFkZHIgKyBFbnRyeS0+TGVuZ3RoKSAmIH4oVUlOVDY0
KUVGSV9QQUdFX01BU0s7DQogDQorICAgIC8vDQorICAgIC8vIElnbm9yZSB0aGUgZmlyc3QgMU1C
LCB0aGlzIGlzIGhhbmRsZWQgYmVmb3JlIHRoZSBsb29wLg0KKyAgICAvLw0KKyAgICBpZiAoQmFz
ZSA8IEJBU0VfMU1CKSB7DQorICAgICAgQmFzZSA9IEJBU0VfMU1COw0KKyAgICB9DQorICAgIGlm
IChCYXNlID49IEVuZCkgew0KKyAgICAgIGNvbnRpbnVlOw0KKyAgICB9DQorDQogICAgIHN3aXRj
aCAoRW50cnktPlR5cGUpIHsNCiAgICAgY2FzZSBFZmlBY3BpQWRkcmVzc1JhbmdlTWVtb3J5Og0K
ICAgICAgIEFkZE1lbW9yeVJhbmdlSG9iIChCYXNlLCBFbmQpOw0KLS0gCkFudGhvbnkgUEVSQVJE
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
