Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5EC5FA66
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:59:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3BO-0005sD-4U; Thu, 04 Jul 2019 14:57:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3BM-0005rT-F2
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:57:56 +0000
X-Inumbo-ID: 1a6effb2-9e6c-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a6effb2-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:57:55 +0000 (UTC)
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
IronPort-SDR: bGl2g2/LnPYxuhitUltEP5pCORMt01rSWJVaG+Iu+B14JKN+XYH2LNJpS9ZXStgv6fZWMeoOqG
 W2Ib+d+g89IWlnK5+8tmHnF1PhA+XTxpQk98RqnQjqsKvgnvfi8sTs6+vMiaVcGkjgf2iq0lvX
 UvshaRfa2HNAeaq1CnQK74Z0d0DLMYz5MkkGF3eE2oyD3O7nGB8U87LPK8BPsSxz9eQSg88Pa/
 V+WYtEk3k/jkIfumEEzBnm/9r4rIqzobW0WUKLwoom+62JXW7djaQEaJObyTyQTfdt5lqiiHPt
 BjI=
X-SBRS: 2.7
X-MesageID: 2602727
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2602727"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:13 +0100
Message-ID: <20190704144233.27968-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 15/35] OvmfPkg/AcpiPlatformDxe: Use Xen PVH
 RSDP if it exist
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

SWYgdGhlIGZpcm13YXJlIGhhdmUgYmVlbiBzdGFydGVkIHZpYSB0aGUgWGVuIFBWSCBlbnRyeSBw
b2ludCwgYSBSU0RQCnBvaW50ZXIgd291bGQgaGF2ZSBiZWVuIHByb3ZpZGVkLiBVc2UgaXQuCgpS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
LS0tCgpOb3RlczoKICAgIHYzOgogICAgLSBwYXRjaCBzcGxpdGVkIGZyb20gdGhlIHByZXZpb3Vz
IG9uZQogICAgLSBGaXggREVCVUcgZm9ybWF0IHN0cmluZywgdXNlICVwIGZvciBwb2ludGVycy4K
ICAgICAgYW5kIHVzZSBnRWZpQ2FsbGVyQmFzZU5hbWUgdG8gcHJpbnQgbW9kdWxlIG5hbWUKCiBP
dm1mUGtnL0FjcGlQbGF0Zm9ybUR4ZS9YZW4uYyB8IDE3ICsrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvQWNwaVBs
YXRmb3JtRHhlL1hlbi5jIGIvT3ZtZlBrZy9BY3BpUGxhdGZvcm1EeGUvWGVuLmMKaW5kZXggODI3
OTRiOTMzZS4uMzc2YTZiZDNjYiAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9BY3BpUGxhdGZvcm1EeGUv
WGVuLmMKKysrIGIvT3ZtZlBrZy9BY3BpUGxhdGZvcm1EeGUvWGVuLmMKQEAgLTM2LDEwICszNiwy
NyBAQCBHZXRYZW5BY3BpUnNkcCAoCiAgIEVGSV9BQ1BJXzJfMF9ST09UX1NZU1RFTV9ERVNDUklQ
VElPTl9QT0lOVEVSICAgKlJzZHBTdHJ1Y3R1cmVQdHI7DQogICBVSU5UOCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICpYZW5BY3BpUHRyOw0KICAgVUlOVDggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTdW07DQorICBFRklfWEVOX0lORk8g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICpYZW5JbmZvOw0KIA0KICAgLy8NCiAg
IC8vIERldGVjdCB0aGUgUlNEUCBzdHJ1Y3R1cmUNCiAgIC8vDQorDQorICAvLw0KKyAgLy8gRmly
c3QgbG9vayBmb3IgUFZIIG9uZQ0KKyAgLy8NCisgIFhlbkluZm8gPSBYZW5HZXRJbmZvSE9CICgp
Ow0KKyAgQVNTRVJUIChYZW5JbmZvICE9IE5VTEwpOw0KKyAgaWYgKFhlbkluZm8tPlJzZHBQdmgg
IT0gTlVMTCkgew0KKyAgICBERUJVRyAoKERFQlVHX0lORk8sICIlYTogVXNlIEFDUEkgUlNEUCB0
YWJsZSBhdCAweCVwXG4iLA0KKyAgICAgICAgICAgIGdFZmlDYWxsZXJCYXNlTmFtZSwgWGVuSW5m
by0+UnNkcFB2aCkpOw0KKyAgICAqUnNkcFB0ciA9IFhlbkluZm8tPlJzZHBQdmg7DQorICAgIHJl
dHVybiBFRklfU1VDQ0VTUzsNCisgIH0NCisNCisgIC8vDQorICAvLyBPdGhlcndpc2UsIGxvb2sg
Zm9yIHRoZSBIVk0gb25lDQorICAvLw0KICAgZm9yIChYZW5BY3BpUHRyID0gKFVJTlQ4KikoVUlO
VE4pIFhFTl9BQ1BJX1BIWVNJQ0FMX0FERFJFU1M7DQogICAgICAgIFhlbkFjcGlQdHIgPCAoVUlO
VDgqKShVSU5UTikgWEVOX0JJT1NfUEhZU0lDQUxfRU5EOw0KICAgICAgICBYZW5BY3BpUHRyICs9
IDB4MTApIHsNCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
