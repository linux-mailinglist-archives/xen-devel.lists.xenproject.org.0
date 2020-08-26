Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F88A253C71
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 06:07:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB9C2-0001fq-Vq; Thu, 27 Aug 2020 04:07:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTD5=CE=intel.com=jonathan.derrick@srs-us1.protection.inumbo.net>)
 id 1kB2UJ-00011c-07
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 20:57:43 +0000
X-Inumbo-ID: 95600740-eab5-4e53-9934-762efd2a437f
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95600740-eab5-4e53-9934-762efd2a437f;
 Wed, 26 Aug 2020 20:57:40 +0000 (UTC)
IronPort-SDR: HLnbnJs5kkVLvZ2sxDPITCPDqZ1ln7Mr20gWKuHBCdV2WDr9pOwt+1EWeBmlyzNqsNC3cWSpg+
 e3T+Ut5dz3Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="144059165"
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; d="scan'208";a="144059165"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 13:57:39 -0700
IronPort-SDR: uWEevjo2fcSLS632lk5XvO4XX4B7UKiqIdkS0Y90NWd9XPgDl0SbIVpxAt9IDuzj/jQabTIcbh
 D+Zjh/W/gpjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,357,1592895600"; d="scan'208";a="323341367"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2020 13:57:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Aug 2020 13:57:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Aug 2020 13:57:37 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Wed, 26 Aug 2020 13:57:37 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "maz@kernel.org" <maz@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>
CC: "Williams, Dan J" <dan.j.williams@intel.com>, "sivanich@hpe.com"
 <sivanich@hpe.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>, "Dey, Megha"
 <megha.dey@intel.com>, "Lu, Baolu" <baolu.lu@intel.com>, "Jiang, Dave"
 <dave.jiang@intel.com>, "kys@microsoft.com" <kys@microsoft.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "jgross@suse.com" <jgross@suse.com>,
 "jgg@mellanox.com" <jgg@mellanox.com>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "konrad.wilk@oracle.com"
 <konrad.wilk@oracle.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "steve.wahl@hpe.com" <steve.wahl@hpe.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rja@hpe.com"
 <rja@hpe.com>, "joro@8bytes.org" <joro@8bytes.org>, "sthemmin@microsoft.com"
 <sthemmin@microsoft.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Subject: Re: [patch V2 23/46] irqdomain/msi: Provide DOMAIN_BUS_VMD_MSI
Thread-Topic: [patch V2 23/46] irqdomain/msi: Provide DOMAIN_BUS_VMD_MSI
Thread-Index: AQHWe6ChLzvzi3ZHs0+G2tRNy2Bxi6lLUO2AgAACG4A=
Date: Wed, 26 Aug 2020 20:57:37 +0000
Message-ID: <0d68de22e417e73b17410172fae9414bf9ac455b.camel@intel.com>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.954409970@linutronix.de> <875z952l6w.wl-maz@kernel.org>
In-Reply-To: <875z952l6w.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.212.222.2]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8982C94C84D0124FB278E32A1F74E921@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 04:07:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDIwLTA4LTI2IGF0IDIxOjQyICswMTAwLCBNYXJjIFp5bmdpZXIgd3JvdGU6DQo+
IE9uIFdlZCwgMjYgQXVnIDIwMjAgMTI6MTY6NTEgKzAxMDAsDQo+IFRob21hcyBHbGVpeG5lciA8
dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToNCj4gPiBGcm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAbGludXRyb25peC5kZT4NCj4gPiANCj4gPiBQQ0kgZGV2aWNlcyBiZWhpbmQgYSBWTUQgYnVz
IGFyZSBub3Qgc3ViamVjdCB0byBpbnRlcnJ1cHQgcmVtYXBwaW5nLCBidXQNCj4gPiB0aGUgaXJx
IGRvbWFpbiBmb3IgVk1EIE1TSSBjYW5ub3QgYmUgZGlzdGluZ3Vpc2hlZCBmcm9tIGEgcmVndWxh
ciBQQ0kvTVNJDQo+ID4gaXJxIGRvbWFpbi4NCj4gPiANCj4gPiBBZGQgYSBuZXcgZG9tYWluIGJ1
cyB0b2tlbiBhbmQgYWxsb3cgaXQgaW4gdGhlIGJ1cyB0b2tlbiBjaGVjayBpbg0KPiA+IG1zaV9j
aGVja19yZXNlcnZhdGlvbl9tb2RlKCkgdG8ga2VlcCB0aGUgZnVuY3Rpb25hbGl0eSB0aGUgc2Ft
ZSBvbmNlIFZNRA0KPiA+IHVzZXMgdGhpcyB0b2tlbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4NCj4gPiANCj4gPiAtLS0NCj4g
PiAgaW5jbHVkZS9saW51eC9pcnFkb21haW4uaCB8ICAgIDEgKw0KPiA+ICBrZXJuZWwvaXJxL21z
aS5jICAgICAgICAgIHwgICAgNyArKysrKystDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9p
cnFkb21haW4uaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaXJxZG9tYWluLmgNCj4gPiBAQCAt
ODQsNiArODQsNyBAQCBlbnVtIGlycV9kb21haW5fYnVzX3Rva2VuIHsNCj4gPiAgCURPTUFJTl9C
VVNfRlNMX01DX01TSSwNCj4gPiAgCURPTUFJTl9CVVNfVElfU0NJX0lOVEFfTVNJLA0KPiA+ICAJ
RE9NQUlOX0JVU19XQUtFVVAsDQo+ID4gKwlET01BSU5fQlVTX1ZNRF9NU0ksDQo+ID4gIH07DQo+
ID4gIA0KPiA+ICAvKioNCj4gPiAtLS0gYS9rZXJuZWwvaXJxL21zaS5jDQo+ID4gKysrIGIva2Vy
bmVsL2lycS9tc2kuYw0KPiA+IEBAIC0zNzAsOCArMzcwLDEzIEBAIHN0YXRpYyBib29sIG1zaV9j
aGVja19yZXNlcnZhdGlvbl9tb2RlKHMNCj4gPiAgew0KPiA+ICAJc3RydWN0IG1zaV9kZXNjICpk
ZXNjOw0KPiA+ICANCj4gPiAtCWlmIChkb21haW4tPmJ1c190b2tlbiAhPSBET01BSU5fQlVTX1BD
SV9NU0kpDQo+ID4gKwlzd2l0Y2goZG9tYWluLT5idXNfdG9rZW4pIHsNCj4gPiArCWNhc2UgRE9N
QUlOX0JVU19QQ0lfTVNJOg0KPiA+ICsJY2FzZSBET01BSU5fQlVTX1ZNRF9NU0k6DQo+ID4gKwkJ
YnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICAJCXJldHVybiBmYWxzZTsNCj4gPiArCX0NCj4g
PiAgDQo+ID4gIAlpZiAoIShpbmZvLT5mbGFncyAmIE1TSV9GTEFHX01VU1RfUkVBQ1RJVkFURSkp
DQo+ID4gIAkJcmV0dXJuIGZhbHNlOw0KPiANCj4gQWNrZWQtYnk6IE1hcmMgWnluZ2llciA8bWF6
QGtlcm5lbC5vcmc+DQo+IA0KPiAJTS4NCj4gDQoNCkFja2VkLWJ5OiBKb24gRGVycmljayA8am9u
YXRoYW4uZGVycmlja0BpbnRlbC5jb20+DQo=

