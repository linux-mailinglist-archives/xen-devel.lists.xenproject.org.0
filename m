Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92FB5FA78
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Bo-0006HR-AF; Thu, 04 Jul 2019 14:58:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Bm-0006G6-P8
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:22 +0000
X-Inumbo-ID: 2a62e088-9e6c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a62e088-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:58:21 +0000 (UTC)
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
IronPort-SDR: lMI6wxCiDVmZoQ6O5nPQGOJUeX5eumXvSFVoOKmDS/H7Te8zDaib07HXtCPeOKzXA79mmpn3wN
 hysFfZlus40ca2GVKQi+LJbRMNrnNPjGdYHMDSRWUumr0mCQ5RGMD4X1SoJjfgk3xnXO3ERNOC
 qKf7BoXe7AsRpa8xEcDuIWdVUIpxIpFw3BJ7TeoVcqLWkyPhafW7PHKIw1deihcFq6QUvNRInb
 r/oBIqHVfsN5NiyUBu9GKoyY6DwQasZVUjLfZTXVM0UUzeMSySJ0qCWxIQFHq0/nLHxhC75dEd
 xAc=
X-SBRS: 2.7
X-MesageID: 2650937
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2650937"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:26 +0100
Message-ID: <20190704144233.27968-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 28/35] OvmfPkg/PlatformBootManagerLib: Use
 XenDetected from XenPlatformLib
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

UmVwbGFjZSB0aGUgWGVuRGV0ZWN0ZWQoKSBpbXBsZW1lbnRhdGlvbiBieSB0aGUgb25lIGZyb20K
WGVuUGxhdGZvcm1MaWIuCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHYzOgogICAgLSBuZXcgcGF0Y2gKCiAu
Li4vUGxhdGZvcm1Cb290TWFuYWdlckxpYi5pbmYgICAgICAgICAgICAgICAgfCAgMSArCiAuLi4v
UGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jICAgICAgfCAzMyArLS0tLS0tLS0t
LS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIv
UGxhdGZvcm1Cb290TWFuYWdlckxpYi5pbmYgYi9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290
TWFuYWdlckxpYi9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliLmluZgppbmRleCAwNjBhM2FiNGM1Li5i
MmQzYjRmYjRkIDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdl
ckxpYi9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliLmluZgorKysgYi9Pdm1mUGtnL0xpYnJhcnkvUGxh
dGZvcm1Cb290TWFuYWdlckxpYi9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliLmluZgpAQCAtNTQsNiAr
NTQsNyBAQCBbTGlicmFyeUNsYXNzZXNdCiAgIFVlZmlMaWINCiAgIFBsYXRmb3JtQm1QcmludFNj
TGliDQogICBUY2cyUGh5c2ljYWxQcmVzZW5jZUxpYg0KKyAgWGVuUGxhdGZvcm1MaWINCiANCiBb
UGNkXQ0KICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkRW11VmFyaWFibGVFdmVudA0K
ZGlmZiAtLWdpdCBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1Bs
YXRmb3JtLmMgYi9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0
Zm9ybS5jCmluZGV4IDc5NzczMWE0MWMuLmUzMjk2OWU2M2UgMTAwNjQ0Ci0tLSBhL092bWZQa2cv
TGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKKysrIGIvT3ZtZlBr
Zy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYwpAQCAtMTIsNiAr
MTIsNyBAQAogI2luY2x1ZGUgPFByb3RvY29sL0Zpcm13YXJlVm9sdW1lMi5oPg0KICNpbmNsdWRl
IDxMaWJyYXJ5L1BsYXRmb3JtQm1QcmludFNjTGliLmg+DQogI2luY2x1ZGUgPExpYnJhcnkvVGNn
MlBoeXNpY2FsUHJlc2VuY2VMaWIuaD4NCisjaW5jbHVkZSA8TGlicmFyeS9YZW5QbGF0Zm9ybUxp
Yi5oPg0KIA0KIA0KIC8vDQpAQCAtMTIyNSwzOCArMTIyNiw2IEBAIFBjaUFjcGlJbml0aWFsaXph
dGlvbiAoCiAgIElvT3IxNiAoKFBjaVJlYWQzMiAoUG1iYSkgJiB+QklUMCkgKyA0LCBCSVQwKTsN
CiB9DQogDQotLyoqDQotICBUaGlzIGZ1bmN0aW9uIGRldGVjdHMgaWYgT1ZNRiBpcyBydW5uaW5n
IG9uIFhlbi4NCi0NCi0qKi8NCi1TVEFUSUMNCi1CT09MRUFODQotWGVuRGV0ZWN0ZWQgKA0KLSAg
Vk9JRA0KLSAgKQ0KLXsNCi0gIEVGSV9IT0JfR1VJRF9UWVBFICAgICAgICAgKkd1aWRIb2I7DQot
ICBTVEFUSUMgSU5UTiAgICAgICAgICAgICAgIEZvdW5kSG9iID0gLTE7DQotDQotICBpZiAoRm91
bmRIb2IgPT0gMCkgew0KLSAgICByZXR1cm4gRkFMU0U7DQotICB9IGVsc2UgaWYgKEZvdW5kSG9i
ID09IDEpIHsNCi0gICAgcmV0dXJuIFRSVUU7DQotICB9DQotDQotICAvLw0KLSAgLy8gU2VlIGlm
IGEgWGVuSW5mbyBIT0IgaXMgYXZhaWxhYmxlDQotICAvLw0KLSAgR3VpZEhvYiA9IEdldEZpcnN0
R3VpZEhvYiAoJmdFZmlYZW5JbmZvR3VpZCk7DQotICBpZiAoR3VpZEhvYiA9PSBOVUxMKSB7DQot
ICAgIEZvdW5kSG9iID0gMDsNCi0gICAgcmV0dXJuIEZBTFNFOw0KLSAgfQ0KLQ0KLSAgRm91bmRI
b2IgPSAxOw0KLSAgcmV0dXJuIFRSVUU7DQotfQ0KLQ0KIEVGSV9TVEFUVVMNCiBFRklBUEkNCiBD
b25uZWN0UmVjdXJzaXZlbHlJZlBjaU1hc3NTdG9yYWdlICgNCi0tIApBbnRob255IFBFUkFSRAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
