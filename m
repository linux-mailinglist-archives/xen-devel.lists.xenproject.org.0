Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EBE27E8C5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 14:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.656.2205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbUK-0006HU-Vr; Wed, 30 Sep 2020 12:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656.2205; Wed, 30 Sep 2020 12:45:40 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbUK-0006H5-SY; Wed, 30 Sep 2020 12:45:40 +0000
Received: by outflank-mailman (input) for mailman id 656;
 Wed, 30 Sep 2020 12:45:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q19t=DH=intel.com=jonathan.derrick@srs-us1.protection.inumbo.net>)
 id 1kNbUJ-0006H0-Lx
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:45:39 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77447146-1aa6-41a2-acd7-127c0bdad639;
 Wed, 30 Sep 2020 12:45:38 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 05:45:36 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2020 05:45:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 30 Sep 2020 05:45:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 30 Sep 2020 05:45:35 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Wed, 30 Sep 2020 05:45:30 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Q19t=DH=intel.com=jonathan.derrick@srs-us1.protection.inumbo.net>)
	id 1kNbUJ-0006H0-Lx
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:45:39 +0000
X-Inumbo-ID: 77447146-1aa6-41a2-acd7-127c0bdad639
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 77447146-1aa6-41a2-acd7-127c0bdad639;
	Wed, 30 Sep 2020 12:45:38 +0000 (UTC)
IronPort-SDR: AI6uHdim06ZBOqVi/v0YOC5fLbsvedbNOt2UdM0nnG20g31vIPm+Bru5xhnLxKtd2M5nsyWdy7
 sXgPVZI+ammQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159774896"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="159774896"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 05:45:36 -0700
IronPort-SDR: eCF4X5a/gfpkch1z+Gghm8I69LMoYqlXRHSy3U79/H0p9P+ssLwnq/P9qK4gAmUKusgR7QnBwT
 59rJ3VZLCcBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="294597999"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2020 05:45:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 30 Sep 2020 05:45:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 30 Sep 2020 05:45:35 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Wed, 30 Sep 2020 05:45:30 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "jgg@nvidia.com"
	<jgg@nvidia.com>
CC: "Williams, Dan J" <dan.j.williams@intel.com>, "sivanich@hpe.com"
	<sivanich@hpe.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>, "Dey, Megha"
	<megha.dey@intel.com>, "Lu, Baolu" <baolu.lu@intel.com>, "Jiang, Dave"
	<dave.jiang@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
	"jgross@suse.com" <jgross@suse.com>, "kys@microsoft.com" <kys@microsoft.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"maz@kernel.org" <maz@kernel.org>, "bhelgaas@google.com"
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
Subject: Re: [patch V2 24/46] PCI: vmd: Mark VMD irqdomain with
 DOMAIN_BUS_VMD_MSI
Thread-Topic: [patch V2 24/46] PCI: vmd: Mark VMD irqdomain with
 DOMAIN_BUS_VMD_MSI
Thread-Index: AQHWe6Ci+RtSrJb+okaPJR2eu/FJZalSxzQAgC8GCIA=
Date: Wed, 30 Sep 2020 12:45:30 +0000
Message-ID: <1d284a478d4e5bf4a247ee83afa1b8b45f9e1b3f.camel@intel.com>
References: <20200826111628.794979401@linutronix.de>
	 <20200826112333.047315047@linutronix.de>
	 <20200831143940.GA1152540@nvidia.com>
In-Reply-To: <20200831143940.GA1152540@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <90C7529B4211014189DA743BA8288574@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgSmFzb24NCg0KT24gTW9uLCAyMDIwLTA4LTMxIGF0IDExOjM5IC0wMzAwLCBKYXNvbiBHdW50
aG9ycGUgd3JvdGU6DQo+IE9uIFdlZCwgQXVnIDI2LCAyMDIwIGF0IDAxOjE2OjUyUE0gKzAyMDAs
IFRob21hcyBHbGVpeG5lciB3cm90ZToNCj4gPiBGcm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4NCj4gPiANCj4gPiBEZXZpY2VzIG9uIHRoZSBWTUQgYnVzIHVzZSB0aGVp
ciBvd24gTVNJIGlycSBkb21haW4sIGJ1dCBpdCBpcyBub3QNCj4gPiBkaXN0aW5ndWlzaGFibGUg
ZnJvbSByZWd1bGFyIFBDSS9NU0kgaXJxIGRvbWFpbnMuIFRoaXMgaXMgcmVxdWlyZWQNCj4gPiB0
byBleGNsdWRlIFZNRCBkZXZpY2VzIGZyb20gZ2V0dGluZyB0aGUgaXJxIGRvbWFpbiBwb2ludGVy
IHNldCBieQ0KPiA+IGludGVycnVwdCByZW1hcHBpbmcuDQo+ID4gDQo+ID4gT3ZlcnJpZGUgdGhl
IGRlZmF1bHQgYnVzIHRva2VuLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0KPiA+IEFja2VkLWJ5OiBCam9ybiBIZWxnYWFzIDxi
aGVsZ2Fhc0Bnb29nbGUuY29tPg0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3ZtZC5jIHwg
ICAgNiArKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+IA0K
PiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvdm1kLmMNCj4gPiBAQCAtNTc5LDYgKzU3
OSwxMiBAQCBzdGF0aWMgaW50IHZtZF9lbmFibGVfZG9tYWluKHN0cnVjdCB2bWRfDQo+ID4gIAkJ
cmV0dXJuIC1FTk9ERVY7DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICsJLyoNCj4gPiArCSAqIE92ZXJy
aWRlIHRoZSBpcnEgZG9tYWluIGJ1cyB0b2tlbiBzbyB0aGUgZG9tYWluIGNhbiBiZSBkaXN0aW5n
dWlzaGVkDQo+ID4gKwkgKiBmcm9tIGEgcmVndWxhciBQQ0kvTVNJIGRvbWFpbi4NCj4gPiArCSAq
Lw0KPiA+ICsJaXJxX2RvbWFpbl91cGRhdGVfYnVzX3Rva2VuKHZtZC0+aXJxX2RvbWFpbiwgRE9N
QUlOX0JVU19WTURfTVNJKTsNCj4gPiArDQo+IA0KPiBIYXZpbmcgdGhlIG5vbi10cmFuc3BhcmVu
dC1icmlkZ2UgaG9sZCBhIE1TSSB0YWJsZSBhbmQNCj4gbXVsdGlwbGV4L2RlLW11bHRpcGxleCBJ
UlFzIGxvb2tzIGxpa2UgYW5vdGhlciBnb29kIHVzZSBjYXNlIGZvcg0KPiBzb21ldGhpbmcgY2xv
c2UgdG8gcGNpX3N1YmRldmljZV9tc2lfY3JlYXRlX2lycV9kb21haW4oKT8NCj4gDQo+IElmIGVh
Y2ggZGV2aWNlIGNvdWxkIGhhdmUgaXRzIG93biBpbnRlcm5hbCBNU0ktWCB0YWJsZSBwcm9ncmFt
bWVkDQo+IHByb3Blcmx5IHRoaW5ncyB3b3VsZCB3b3JrIGFsb3QgYmV0dGVyLiBEaXNhYmxlIGNh
cHR1cmUvcmVtYXAgb2YgdGhlDQo+IE1TSSByYW5nZSBpbiB0aGUgTlRCLg0KV2UgY2FuIGRpc2Fi
bGUgdGhlIGNhcHR1cmUgYW5kIHJlbWFwIGluIG5ld2VyIGRldmljZXMgc28gd2UgZG9uJ3QgZXZl
bg0KbmVlZCB0aGUgaXJxIGRvbWFpbi4gTGVnYWN5IFZNRCB3aWxsIGF1dG9tYXRpY2FsbHkgcmVt
YXAgYmFzZWQgb24gdGhlDQpBUElDIGRlc3QgYml0cyBpbiB0aGUgTVNJIGFkZHJlc3MuDQoNCkkg
d291bGQgaG93ZXZlciBsaWtlIHRvIGRldGVybWluZSBpZiB0aGUgTVNJIGRhdGEgYml0cyBjb3Vs
ZCBiZSB1c2VkDQpmb3IgaW5kaXZpZHVhbCBkZXZpY2VzIHRvIGhhdmUgdGhlIElSUSBkb21haW4g
c3Vic3lzdGVtIGRlbXVsdGlwbGV4IHRoZQ0KdmlycSBmcm9tIHRoYXQgYW5kIGVsaW1pbmF0ZSB0
aGUgSVJRIGxpc3QgaXRlcmF0aW9uLg0KDQpBIGNvbmNlcm4gSSBoYXZlIGFib3V0IHRoYXQgc2No
ZW1lIGlzIHZpcnR1YWxpemF0aW9uIGFzIEkgdGhpbmsgdGhvc2UNCmJpdHMgYXJlIHVzZWQgdG8g
cm91dGUgdG8gdGhlIHZpcnR1YWwgdmVjdG9yLg0KDQo+IA0KPiBUaGVuIGVhY2ggZGV2aWNlIGNv
dWxkIGhhdmUgYSBwcm9wZXIgbm9uLW11bHRpcGxleGVkIGludGVycnVwdA0KPiBkZWxpdmVyZWQg
dG8gdGhlIENQVS4uIEFmZmluaXR5IHdvdWxkIHdvcmsgcHJvcGVybHksIG5vIG5lZWQgdG8gc2hh
cmUNCj4gSVJRcyAoZWcgdm1kX2lycSgpIGdvZXMgYXdheSkvZXRjLg0KPiANCj4gU29tZXRoaW5n
IGZvciB0aGUgVk1EIG1haW50YWluZXJzIHRvIHRoaW5rIGFib3V0IGF0IGxlYXN0Lg0KPiANCj4g
QXMgSSBoZWFyIG1vcmUgYWJvdXQgTlRCIHRoZXNlIGRheXMgYSBmdWxsIE1TSSBzY2hlbWUgZm9y
IE5UQiBzZWVtcw0KPiBpbnRlcmVzdGluZyB0byBoYXZlIGluIHRoZSBQQ0ktRSBjb3JlIGNvZGUu
Lg0KPiANCj4gSmFzb24NCg0KDQo=

