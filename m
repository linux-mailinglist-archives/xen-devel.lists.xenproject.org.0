Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3731C1F31
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt20-0000ZU-CQ; Mon, 30 Sep 2019 10:35:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEt1y-0000W8-05
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:50 +0000
X-Inumbo-ID: 0f7127e8-e36e-11e9-96cd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 0f7127e8-e36e-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569839746;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TPMljRe65xzvwiXY0ZUo9Up/99z2j49n4E2+OdS/NVU=;
 b=b4OeLlqKc13Y/yWSIl9PNqUUC9+o7Usad0HGTnfbwFDQfdjUdyFTim7o
 NA0n5k4bsEXkEL2/umd3EHR/pBIOh4u+hJP3wcIYkUdPg5F98ZwecOc/w
 ui3eQVP/JtYDM1w0ceyOQjVkw/ru6hWkFKf6/Y7PiuLWlxxnbrruka0pr M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Pwsnn2BuHXsz2xPeBXa37vUP4qJDe7/hQnj975AHcbXuqsYpPCUUGaUDCMpUulBGUEdj9nCpWv
 22pPYXYBhUh8H3pOFX/mQm6akUJFgf4BLZ+EpPpTz4boDvJ5HFqJvl0tMa+uJ5mh5KfbUV3Hri
 Z7cKCtq+G/ZNNztCHKwI2yRHlZLMv/sE94rfv81pNz5xUtuqObNLnJXSRhn0lch1sFbYhv+U/s
 EF/9RWC4D3tvN7p+o21ZIMaoYVcac6KBXxziAZ9/xi35vP5mkPzycAhMCAacU9zy52bi37LeiL
 9NM=
X-SBRS: 2.7
X-MesageID: 6313995
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6313995"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Oleksandr Tyshchenko' <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH for Xen 4.13] iommu/arm: Remove
 arch_iommu_populate_page_table() completely
Thread-Index: AQHVd3quD3UEBspsC0+ZJSGKRdeoL6dEBn5g
Date: Mon, 30 Sep 2019 10:35:41 +0000
Message-ID: <dbe10a2156ee45e0b7d317c593b75039@AMSPEX02CL03.citrite.net>
References: <1569839671-772-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1569839671-772-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] iommu/arm: Remove
 arch_iommu_populate_page_table() completely
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
Cc: "jgross@suse.com" <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "volodymyr_babchuk@epam.com" <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtv
IDxvbGVrc3R5c2hAZ21haWwuY29tPgo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDExOjM1Cj4g
VG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBqdWxpZW4uZ3JhbGxAYXJt
LmNvbTsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgdm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb207
IGpncm9zc0BzdXNlLmNvbTsgUGF1bAo+IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
PjsgT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+
IFN1YmplY3Q6IFtQQVRDSCBmb3IgWGVuIDQuMTNdIGlvbW11L2FybTogUmVtb3ZlIGFyY2hfaW9t
bXVfcG9wdWxhdGVfcGFnZV90YWJsZSgpIGNvbXBsZXRlbHkKPiAKPiBGcm9tOiBPbGVrc2FuZHIg
VHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gCj4gVGhlIEFybSBy
ZWFsaXphdGlvbiBzaG91bGQgaGF2ZSBiZWVuIHJlbW92ZWQgaW4gdGhlIGZvbGxvd2luZyBjb21t
aXQKPiBhcyByZWR1bmRhbnQ6Cj4gZjg5ZjU1NSByZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBjb25z
dHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMKPiAKPiBTbywgcmVtb3ZlIHVudXNlZCBmdW5j
dGlvbiBjb21wbGV0ZWx5LgoKR29vZCBjYXRjaC4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz4KCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28g
PG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+IC0tLQo+ICB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hcm0vaW9tbXUuYyB8IDYgLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9t
bXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4gaW5kZXggNzZlMTE1
Mi4uZGIzYjA3YSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9t
bXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4gQEAgLTEz
MiwxMiArMTMyLDYgQEAgdm9pZCBhcmNoX2lvbW11X2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21h
aW4gKmQpCj4gIHsKPiAgfQo+IAo+IC1pbnQgYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxl
KHN0cnVjdCBkb21haW4gKmQpCj4gLXsKPiAtICAgIC8qIFRoZSBJT01NVSBzaGFyZXMgdGhlIHAy
bSB3aXRoIHRoZSBDUFUgKi8KPiAtICAgIHJldHVybiAtRU5PU1lTOwo+IC19Cj4gLQo+ICB2b2lk
IF9faHdkb21faW5pdCBhcmNoX2lvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPiAg
ewo+ICB9Cj4gLS0KPiAyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
