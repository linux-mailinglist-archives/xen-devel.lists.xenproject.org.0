Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F68B7DF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:02:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVRg-0001dk-Jf; Tue, 13 Aug 2019 11:58:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVRf-0001ci-MJ
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:58:31 +0000
X-Inumbo-ID: aac5468e-bdc1-11e9-9bcc-bb204a63cfb5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aac5468e-bdc1-11e9-9bcc-bb204a63cfb5;
 Tue, 13 Aug 2019 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qg9Yq51l5wn56unEaj7nOAd0gnjbI0JIJ3m18rOPtKk=;
 b=SzPnEbiUHfIZdQrJVRnYLkBJ6fqQCtXnvmuuVaZsM28TRiet2VTDmdZQ
 dvP7gbE35thlLKx0bbkHvraNHPbXwZ9c0q3sloyafTC3G7pD3keuVlwOJ
 KnTirhYia5gBjcwxZynQqgXzFOACROqGQ6nVYPiiabjqxFjIvbmvSlVWR c=;
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
IronPort-SDR: keGfDCmOa8D92M74fhwRqEgvCzuMVfRT0xWYqnhV9WGp9g7eFMNchreSWvwZKJO6AOQAjH3XPG
 aiTIcWzw55cdmAOb3ju+nK3AY0PHBbMamqPG0uz883u0JETHOYCkM/RwwoXQkvhartsNLEMJbs
 rF66WepkwKBdcnh5JexObm2X2XkyZWr+Q98yjsrFRL+VuhUBLd0h4nvYaVxGExv9uqlde3ht5P
 JHgCt3gdxWXqGRFIhmPdyv0HiojCZ6CPloVw2OEi5tmnjr2NUorvONtA1IXME8G2fNaltNbE4m
 a+k=
X-SBRS: 2.7
X-MesageID: 4242263
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4242263"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:12 +0100
Message-ID: <20190813113119.14804-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 28/35] OvmfPkg/PlatformBootManagerLib: Handle
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
