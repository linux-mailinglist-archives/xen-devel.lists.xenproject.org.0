Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B4379027
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:01:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82b-0003Bs-KQ; Mon, 29 Jul 2019 15:58:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82a-0003AZ-6W
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:24 +0000
X-Inumbo-ID: b12cf2f6-b219-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b12cf2f6-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:58:23 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NCd2dnuCZnbupkJa/NL3zKbwtXnos7N/K1QJtlvValOIFYqrnnggcLDJq2fvzdSk2WEXvOyhMP
 JDjVcbxASP7pbGafr1IHBOH4/QXujHyshMlnloQAJp6OqiGYmsg4KK5JwYpQHvly9Mcw5jU5Ux
 Y1LxwV1R+c9zIHVDqM8IMHhYmND9ekLLXbbZ0/stkPdQOqzjvEXZSTsmyE6I3Fm66k9ixV7swI
 7HSsaJNMT+cKXbWh3/nHQy1kGGLzVBWJKgzaTytSW/H950FpPSEgpLhuDWlSsm2qfMovxEtIDC
 F44=
X-SBRS: 2.7
X-MesageID: 3689448
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3689448"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:37 +0100
Message-ID: <20190729153944.24239-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 28/35] OvmfPkg/PlatformBootManagerLib: Handle
 the absence of PCI bus on Xen PVH
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

V2hlbiBydW5uaW5nIGluIGEgWGVuIFBWSCBndWVzdCwgdGhlcmUncyBub3RoaW5nIHRvIGRvIGlu
ClBjaUFjcGlJbml0aWFsaXphdGlvbigpIGJlY2F1c2UgdGhlcmUgaXNuJ3QgYW55IFBDSSBidXMu
IFdoZW4gdGhlIEhvc3QKQnJpZGdlIERJRCBpc24ndCByZWNvZ25pc2VkLCBzaW1wbHkgY29udGlu
dWUuIChUaGUgdmFsdWUgb2YKUGNkT3ZtZkhvc3RCcmlkZ2VQY2lEZXZJZCB3b3VsZCBiZSAwIGJl
Y2F1c2UgaXQgaXNuJ3Qgc2V0LikKClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtA
cmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHYzOgogICAgLSBJbnN0ZWFkIG9mIGNoZWNraW5n
IGZvciBhIGZhbHNlIHZhbHVlLAogICAgICBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0Vf
SUQsIHNpbXBseSBjaGVjayBpZiB3ZSBhcmUgcnVubmluZyB4ZW4KICAgICAgd2hlbiB0aGUgSG9z
dEJyaWRnZSBkZXZpY2UgSUQgaXNuJ3QgcmVjb2duaXNlZC4KCiBPdm1mUGtnL0xpYnJhcnkvUGxh
dGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZv
cm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3Jt
Qm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYwppbmRleCBkNWQ1ZDIwZmQ4Li4xZWJhMzA0ZjA5
IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQ
bGF0Zm9ybS5jCisrKyBiL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jk
c1BsYXRmb3JtLmMKQEAgLTEyMDgsNiArMTIwOCwxMiBAQCBQY2lBY3BpSW5pdGlhbGl6YXRpb24g
KAogICAgICAgUGNpV3JpdGU4IChQQ0lfTElCX0FERFJFU1MgKDAsIDB4MWYsIDAsIDB4NmIpLCAw
eDBiKTsgLy8gSA0KICAgICAgIGJyZWFrOw0KICAgICBkZWZhdWx0Og0KKyAgICAgIGlmIChYZW5E
ZXRlY3RlZCAoKSkgew0KKyAgICAgICAgLy8NCisgICAgICAgIC8vIFRoZXJlIGlzIG5vIFBDSSBi
dXMgaW4gdGhpcyBjYXNlLg0KKyAgICAgICAgLy8NCisgICAgICAgIHJldHVybjsNCisgICAgICB9
DQogICAgICAgREVCVUcgKChFRklfRF9FUlJPUiwgIiVhOiBVbmtub3duIEhvc3QgQnJpZGdlIERl
dmljZSBJRDogMHglMDR4XG4iLA0KICAgICAgICAgX19GVU5DVElPTl9fLCBtSG9zdEJyaWRnZURl
dklkKSk7DQogICAgICAgQVNTRVJUIChGQUxTRSk7DQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
