Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A611D58F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:30:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTCB-0007Is-TO; Thu, 12 Dec 2019 18:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOos=2C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifTCA-0007IB-GT
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:28:14 +0000
X-Inumbo-ID: 1f287154-1d0d-11ea-b6f1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f287154-1d0d-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576175279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B0wYGrYR8i9f15Zb6dnxRV/7C2x1YhnLJ6NquqpJ9Rk=;
 b=cwEr4Bi2I7ynfAJca31r4wFapjpUiOPcw61nWY6u/L+EbB3IolXtW78P
 QEUDisRbbMLBXi5xkARF9ZUSPsPLJryHGvLLQB7WPc7UNeyAZvqfJ+RzG
 Azg6Q+9KH5Lq9lr3ICZRjrSBfVCQSXZknIUxUPPaz2Ls1H+a0w9KJd/Au I=;
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
IronPort-SDR: hmXPKHKYkuXDs/EeKtpfK1saYy73GFWDj2SfJ5Q6idNuNxix5iXddauiOUAHylZyf/LwFpGuNm
 vDB0aHWUVwP6F1XA4O6vY6+cb9tuZnqhX9Xrnysa6qAz/UM9QU4bE/WHZBImdK1+Y+vldyUmNV
 ICs10nIN2P2M3VmRphsu3AdAqZQS9QHtabHpRlPtuxZiHbHR2oowOVgckehIbAzE9BCgySafjK
 6D91PrnQEcIt2fDfD+iOMCPScuZg3zBfq8EFNHze7xJ9xXEQJg/bDBnfOuhs571Jj6C5oCT/yH
 JYc=
X-SBRS: 2.7
X-MesageID: 9611968
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9611968"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 18:27:33 +0000
Message-ID: <20191212182740.2190199-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212182740.2190199-1-anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 1/8] Config.mk: Remove unused setvar_dir
 macro
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIHJlbW92ZSBhbGwgbWVudGlvbiBvZiBpdCBpbiBkb2NzLiBJdCBoYXNuJ3QgYmVlbiB1c2Vk
IHNpbmNlCjllYWQ5YWZjYjkzNSAoIkFkZCBjb25maWd1cmUgLS13aXRoLXN5c2NvbmZpZy1sZWFm
LWRpcj1TVUJESVIgdG8gc2V0CkNPTkZJR19MRUFGX0RJUiIpLgoKU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogQ29uZmlnLm1rICAg
ICAgICAgICAgICAgICAgICB8IDExIC0tLS0tLS0tLS0tCiBkb2NzL21pc2MvZGlzdHJvX21hcHBp
bmcudHh0IHwgIDUgKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Db25maWcubWsgYi9Db25maWcubWsKaW5kZXggNTRl
NGI3MDkxYmZjLi44NzY4Mzk4ZDVlY2UgMTAwNjQ0Ci0tLSBhL0NvbmZpZy5taworKysgYi9Db25m
aWcubWsKQEAgLTY4LDE3ICs2OCw2IEBAIERFUFNfUk0gPSAkKERFUFMpICQoREVQU19JTkNMVURF
KQogaW5jbHVkZSAkKFhFTl9ST09UKS9jb25maWcvJChYRU5fT1MpLm1rCiBpbmNsdWRlICQoWEVO
X1JPT1QpL2NvbmZpZy8kKFhFTl9UQVJHRVRfQVJDSCkubWsKIAotIyBhcmd1bWVudHM6IHZhcmlh
YmxlLCBjb21tb24gcGF0aCBwYXJ0LCBwYXRoIHRvIHRlc3QsIGlmIHllcywgaWYgbm8KLWRlZmlu
ZSBzZXR2YXJfZGlyCi0gIGlmbmRlZiAkKDEpCi0gICAgaWZuZXEgKCwkKHdpbGRjYXJkICQoMikk
KDMpKSkKLSAgICAgICQoMSkgPz0gJCgyKSQoNCkKLSAgICBlbHNlCi0gICAgICAkKDEpID89ICQo
MikkKDUpCi0gICAgZW5kaWYKLSAgZW5kaWYKLWVuZGVmCi0KIGlmbmVxICgkKEVYVFJBX1BSRUZJ
WCksKQogRVhUUkFfSU5DTFVERVMgKz0gJChFWFRSQV9QUkVGSVgpL2luY2x1ZGUKIEVYVFJBX0xJ
QiArPSAkKEVYVFJBX1BSRUZJWCkvbGliCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvZGlzdHJvX21h
cHBpbmcudHh0IGIvZG9jcy9taXNjL2Rpc3Ryb19tYXBwaW5nLnR4dAppbmRleCAyZTQ2NTkyNzI4
ZTMuLjU5OWI2ZmQxZTkxMiAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL2Rpc3Ryb19tYXBwaW5nLnR4
dAorKysgYi9kb2NzL21pc2MvZGlzdHJvX21hcHBpbmcudHh0CkBAIC05LDkgKzksOCBAQCBJTklU
RF9ESVIgICAgICAgIHwgL2V0Yy9yYy5kL2luaXQuZCB8IC9ldGMvaW5pdC5kICAgfCAvZXRjL2lu
aXQuZCAgICB8CiAtLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0rCiAKIFRoZSBleGlzdGVuY2Ugb2YgdGhlc2UgZGlyZWN0
b3JpZXMgYXJlIHRlc3RlZCBhdCBidWlsZC10aW1lIChvbiB0aGUKLWJ1aWxkIGhvc3QsIHZpYSB0
aGUgInNldHZhcl9kaXIiIG1hY3JvIGluIENvbmZpZy5taykgYW5kIGZvciBzb21lCi1zY3JpcHRz
IGF0IHJ1bi10aW1lLiAgSWYgdGhlIFJlZCBIYXQgZGlyZWN0b3J5IGV4aXN0cywgaXQgaXMgdXNl
ZDsKLW90aGVyd2lzZSB0aGUgRGViaWFuIG9uZSBpcyB1c2VkLgorYnVpbGQgaG9zdCkgYW5kIGZv
ciBzb21lIHNjcmlwdHMgYXQgcnVuLXRpbWUuICBJZiB0aGUgUmVkIEhhdAorZGlyZWN0b3J5IGV4
aXN0cywgaXQgaXMgdXNlZDsgb3RoZXJ3aXNlIHRoZSBEZWJpYW4gb25lIGlzIHVzZWQuCiAKIFRo
ZSBJTklURF9ESVIgcGF0aCBjYW4gYmUgY2hhbmdlZCB3aXRoIGNvbmZpZ3VyZSAtLXdpdGgtaW5p
dGRkaXI9RElSLgogVGhlIENPTkZJR19MRUFGX0RJUiBuYW1lIGNhbiBiZSBjaGFuZ2VkIHdpdGgg
Y29uZmlndXJlCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
