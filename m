Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96504B22A6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:53:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8mul-0005SL-Ru; Fri, 13 Sep 2019 14:51:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8muk-0005S7-Dy
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:51:10 +0000
X-Inumbo-ID: e99354f0-d635-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e99354f0-d635-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568386265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8kxur/mrODtHigFPsFoV90xNxdXr64amXia1NhFTkes=;
 b=N0b4e/W5dW6nfvwep+5p1iF2qPT1FEbXhArZAzuznhziwVdVTG9M6RD7
 mfghzSKqendhLDteUvq3Xomr58ZoOnVvczjTUd5GqM4tHeTC0v7kb/2Z2
 KJwaAn3yCP+GZoD3le5iYVyqxtcb8grV2IooSbzVqW6FkZgDwvdkgrnYl I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gA8UT5Ch/OGw3w+nTY3r6fio4u+BqYgSmlqKBXYupu999GYVV1zWWNJMsTOlVTQEyEErzLtXLU
 mLzxzSmCiCVgWqDW53Y+5bwfcIU0U1BqnnpheC4Wtt2VxFFnCTWffh7V5aBu5dxIeJFFsPJ27Z
 yYf4HTPPw1syuAYKXHZgzu8X6tmAR1FOwsdtomnRs0imfr+As4/BQ3io9d7+fBB8zNKurs0nav
 FTZoL0DNZfnYVjdaXjLfggT7kUxErUZCtbJKqf5lvKvGvzCiKL6wJO7HO+617LRq6MYVETNG+0
 3mA=
X-SBRS: 2.7
X-MesageID: 5595140
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5595140"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Fri, 13 Sep 2019 15:50:53 +0100
Message-ID: <20190913145100.303433-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913145100.303433-1-anthony.perard@citrix.com>
References: <20190913145100.303433-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 04/11] OvmfPkg/XenBusDxe: Avoid Allocate in
 XenStoreVSPrint
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
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byB1c2UgWGVuU3RvcmVWU1ByaW50IGR1cmluZyB0aGUKRXhp
dEJvb3RTZXJ2aWNlcywgd2UgcmVtb3ZlIHRoZSBhbGxvY2F0aW9uIGRvbmUgYnkgdGhlIGZ1bmN0
aW9uIGFuZAp1c2UgdGhlIHN0YWNrIGluc3RlYWQuCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlh
bm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE5MApTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBPdm1mUGtnL1hlbkJ1c0R4ZS9Y
ZW5TdG9yZS5jIHwgMjEgKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1
c0R4ZS9YZW5TdG9yZS5jIGIvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYwppbmRleCA1Y2M5
MDAxOTBhLi43YjcxZGMxNTZkIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5TdG9y
ZS5jCisrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMKQEAgLTEyNTksMjAgKzEyNTks
MTcgQEAgWGVuU3RvcmVWU1ByaW50ICgKICAgSU4gVkFfTElTVCAgICAgICAgICAgICAgIE1hcmtl
cg0KICAgKQ0KIHsNCi0gIENIQVI4ICpCdWY7DQotICBYRU5TVE9SRV9TVEFUVVMgU3RhdHVzOw0K
LSAgVUlOVE4gQnVmU2l6ZTsNCi0gIFZBX0xJU1QgTWFya2VyMjsNCisgIENIQVI4ICAgICAgICAg
ICBCdWZbWEVOU1RPUkVfUEFZTE9BRF9NQVhdOw0KKyAgVUlOVE4gICAgICAgICAgIENvdW50Ow0K
IA0KLSAgVkFfQ09QWSAoTWFya2VyMiwgTWFya2VyKTsNCi0gIEJ1ZlNpemUgPSBTUHJpbnRMZW5n
dGhBc2NpaUZvcm1hdCAoRm9ybWF0U3RyaW5nLCBNYXJrZXIyKSArIDE7DQotICBWQV9FTkQgKE1h
cmtlcjIpOw0KLSAgQnVmID0gQWxsb2NhdGVaZXJvUG9vbCAoQnVmU2l6ZSk7DQotICBBc2NpaVZT
UHJpbnQgKEJ1ZiwgQnVmU2l6ZSwgRm9ybWF0U3RyaW5nLCBNYXJrZXIpOw0KLSAgU3RhdHVzID0g
WGVuU3RvcmVXcml0ZSAoVHJhbnNhY3Rpb24sIERpcmVjdG9yeVBhdGgsIE5vZGUsIEJ1Zik7DQot
ICBGcmVlUG9vbCAoQnVmKTsNCisgIENvdW50ID0gQXNjaWlWU1ByaW50IChCdWYsIHNpemVvZiAo
QnVmKSwgRm9ybWF0U3RyaW5nLCBNYXJrZXIpOw0KKyAgQVNTRVJUIChDb3VudCA+IDApOw0KKyAg
QVNTRVJUIChDb3VudCA8IHNpemVvZiAoQnVmKSk7DQorICBpZiAoKENvdW50ID09IDApIHx8IChD
b3VudCA+PSBzaXplb2YgKEJ1ZikpKSB7DQorICAgIHJldHVybiBYRU5TVE9SRV9TVEFUVVNfRUlO
VkFMOw0KKyAgfQ0KIA0KLSAgcmV0dXJuIFN0YXR1czsNCisgIHJldHVybiBYZW5TdG9yZVdyaXRl
IChUcmFuc2FjdGlvbiwgRGlyZWN0b3J5UGF0aCwgTm9kZSwgQnVmKTsNCiB9DQogDQogWEVOU1RP
UkVfU1RBVFVTDQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
