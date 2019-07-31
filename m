Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C37B863
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 06:05:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsfop-0002Z4-5L; Wed, 31 Jul 2019 04:02:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gywh=V4=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1hscFk-0004kd-Ct
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 00:14:00 +0000
X-Inumbo-ID: 17a9a146-b328-11e9-8980-bc764e045a96
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::72f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 17a9a146-b328-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 00:13:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaK//ynzrov6VJEPzNcUs4KyjELk1JNEH7PVN+FgTVnc84IwUMQjnVLNjrfr6D4z6FRGtf+onXgeATNsaDYaJHiu77E1BH7vIUUoxOey3wXFnISviN+DeLLdFjNtqtlV+M470Hm5H20LnD8OKCKQzl374Ugsox7cLTx4/NyrGmxXmJ65Hdzi1ufHaJEd+0+hXvnLpW22UI68W9FfRQiHM3Bv8f+V5boXA3kCK8g7p4EW9dOkYLnaEIlQQHbrDP8kjeHThmYrB53cqYOLncYJHW0feOSNQt7EoeMvdCSGtHRTlVPnuR2AR+PAynIZElej8qGBD0tGX58soMS2PEEYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+qkt2g1PB4yERKLvl3kj4w8iAPpQ6pFCDJAgd1iDx8=;
 b=h55tKpqQSKPz4zX9L4WWqTWLagEEFHcVeL3loQMWvEY46z+bQ/f0wdFs/QzoTG7khWvzpni3LXLldU1qRA+yNfpxgLAr5IlLfn2IZzMAeCYKG8CvcIcAfiWXeS5mjbbZC9WiCAAGLALpRUQHPxt9OX+OqxDJ24zhpPP57HLBaHH3M5uHSRxoawje18naTLbobEFIUVzb/OMVdCniDsrFIEFEvwC1P6+8XtOrKo2wOfzNrV+ci/nkj41Kj/OTbCiP06HQU6OAIAC1kSbe3FOCfa80X2mxqzDDng+/YwNZUlW5MDkqXlPXiD88Xe05WHXNLeT/ZdBnim9g92JORDlnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+qkt2g1PB4yERKLvl3kj4w8iAPpQ6pFCDJAgd1iDx8=;
 b=l2L/PE7xCtrKV4xHoOP70MrJo0sAxlPV6A+748sijZcttPRlbN0Vvt3JhUV07uYmIznlzsE7m7r05xz2U87a+DYtt+NS4IiXeO4DR79dJh+O3TrPFey9B9yD+tPWark8gZQoHMt47lsCWYD6osWhltXJWR6pOp0imCdmQz3NPw4=
Received: from MWHPR21MB0784.namprd21.prod.outlook.com (10.173.51.150) by
 MWHPR21MB0288.namprd21.prod.outlook.com (10.173.53.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.2; Wed, 31 Jul 2019 00:13:57 +0000
Received: from MWHPR21MB0784.namprd21.prod.outlook.com
 ([fe80::7de1:e6c1:296:4e82]) by MWHPR21MB0784.namprd21.prod.outlook.com
 ([fe80::7de1:e6c1:296:4e82%5]) with mapi id 15.20.2157.001; Wed, 31 Jul 2019
 00:13:57 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Nadav Amit <namit@vmware.com>, Andy Lutomirski <luto@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>
Thread-Topic: [PATCH v3 4/9] x86/mm/tlb: Flush remote and local TLBs
 concurrently
Thread-Index: AQHVPc0tyN8NiFudS0OHFO0tHQVBDqbj7WKw
Date: Wed, 31 Jul 2019 00:13:57 +0000
Message-ID: <MWHPR21MB07849B8AE6D1C4943B6F06F7D7DF0@MWHPR21MB0784.namprd21.prod.outlook.com>
References: <20190719005837.4150-1-namit@vmware.com>
 <20190719005837.4150-5-namit@vmware.com>
In-Reply-To: <20190719005837.4150-5-namit@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-07-31T00:13:55.8711110Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=18386b13-1653-4a41-8c42-2a8ca745b308;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4136bceb-ab23-4308-66e5-08d7154bfb15
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR21MB0288; 
x-ms-traffictypediagnostic: MWHPR21MB0288:|MWHPR21MB0288:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR21MB028844C36D7FAD0B1375BD8BD7DF0@MWHPR21MB0288.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(199004)(189003)(256004)(22452003)(71190400001)(71200400001)(316002)(66066001)(66556008)(9686003)(53936002)(14444005)(6436002)(7696005)(110136005)(476003)(486006)(478600001)(66446008)(68736007)(76116006)(229853002)(11346002)(76176011)(54906003)(66946007)(66476007)(446003)(33656002)(55016002)(64756008)(10290500003)(186003)(52536014)(102836004)(6116002)(7416002)(3846002)(305945005)(99286004)(7736002)(26005)(4326008)(2906002)(5660300002)(10090500001)(6246003)(8990500004)(6506007)(86362001)(14454004)(8676002)(25786009)(81156014)(74316002)(81166006)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0288;
 H:MWHPR21MB0784.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7pM4N/3Ak2c/DZOAGoI2OlGmJPZe1oSdhoZpBXNisjOTgAcGdF3O8e+eIhajqjhsE0NY9KUfx5W/iVI49EwHSuqABhxWDG1Kr9bZqXkB2+JCITHuZ+fNuMZ25cIEZHbe0jyVQGn9/V9EF/qQitQlBdtzaOO0BoXcHT+BXhLJs3pyqcCGcnTJxpCdfIEg8rtJvBnEUJqqQtlAhs8Li/5HmRaCt35oCSgY9aGfvck212X1Zur05OVSMLKe7dvfPunMW2kfc+cwhwba9kfGydo2u5Ah+l7KwC7pP4JmKRcmwhFoH3RULLT5v5FpOxreJZLMtBC87MuOUl0QcqDRYY7Rb8yhO+eDY7953WqIP/bO2EIJxeXeTkCx5Iipg38yOlTEXHw3h41sEAX9fYaFBnPsYXcxnrRYpnP7mGHvNOBN+k8=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4136bceb-ab23-4308-66e5-08d7154bfb15
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 00:13:57.4299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUl+NcMFyy3iOycg7CU2I+3933Yo3iaMJO735J1Vj5VxvRlEmuMyfMxQLd8hgncrZsmrilYj3DL5D2ehRvAWkYnS6LwZwCFdREsqx/h3AlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0288
X-Mailman-Approved-At: Wed, 31 Jul 2019 04:02:25 +0000
Subject: Re: [Xen-devel] [PATCH v3 4/9] x86/mm/tlb: Flush remote and local
 TLBs concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 KY Srinivasan <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4gU2VudDogVGh1cnNkYXksIEp1bHkg
MTgsIDIwMTkgNTo1OSBQTQo+IAo+IFRvIGltcHJvdmUgVExCIHNob290ZG93biBwZXJmb3JtYW5j
ZSwgZmx1c2ggdGhlIHJlbW90ZSBhbmQgbG9jYWwgVExCcwo+IGNvbmN1cnJlbnRseS4gSW50cm9k
dWNlIGZsdXNoX3RsYl9tdWx0aSgpIHRoYXQgZG9lcyBzby4gSW50cm9kdWNlCj4gcGFyYXZpcnR1
YWwgdmVyc2lvbnMgb2YgZmx1c2hfdGxiX211bHRpKCkgZm9yIEtWTSwgWGVuIGFuZCBoeXBlci12
IChYZW4KPiBhbmQgaHlwZXItdiBhcmUgb25seSBjb21waWxlLXRlc3RlZCkuCj4gCj4gV2hpbGUg
dGhlIHVwZGF0ZWQgc21wIGluZnJhc3RydWN0dXJlIGlzIGNhcGFibGUgb2YgcnVubmluZyBhIGZ1
bmN0aW9uIG9uCj4gYSBzaW5nbGUgbG9jYWwgY29yZSwgaXQgaXMgbm90IG9wdGltaXplZCBmb3Ig
dGhpcyBjYXNlLiBUaGUgbXVsdGlwbGUKPiBmdW5jdGlvbiBjYWxscyBhbmQgdGhlIGluZGlyZWN0
IGJyYW5jaCBpbnRyb2R1Y2Ugc29tZSBvdmVyaGVhZCwgYW5kCj4gbWlnaHQgbWFrZSBsb2NhbCBU
TEIgZmx1c2hlcyBzbG93ZXIgdGhhbiB0aGV5IHdlcmUgYmVmb3JlIHRoZSByZWNlbnQKPiBjaGFu
Z2VzLgo+IAo+IEJlZm9yZSBjYWxsaW5nIHRoZSBTTVAgaW5mcmFzdHJ1Y3R1cmUsIGNoZWNrIGlm
IG9ubHkgYSBsb2NhbCBUTEIgZmx1c2gKPiBpcyBuZWVkZWQgdG8gcmVzdG9yZSB0aGUgbG9zdCBw
ZXJmb3JtYW5jZSBpbiB0aGlzIGNvbW1vbiBjYXNlLiBUaGlzCj4gcmVxdWlyZXMgdG8gY2hlY2sg
bW1fY3B1bWFzaygpIG9uZSBtb3JlIHRpbWUsIGJ1dCB1bmxlc3MgdGhpcyBtYXNrIGlzCj4gdXBk
YXRlZCB2ZXJ5IGZyZXF1ZW50bHksIHRoaXMgc2hvdWxkIGltcGFjdCBwZXJmb3JtYW5jZSBuZWdh
dGl2ZWx5Lgo+IAo+IENjOiAiSy4gWS4gU3Jpbml2YXNhbiIgPGt5c0BtaWNyb3NvZnQuY29tPgo+
IENjOiBIYWl5YW5nIFpoYW5nIDxoYWl5YW5nekBtaWNyb3NvZnQuY29tPgo+IENjOiBTdGVwaGVu
IEhlbW1pbmdlciA8c3RoZW1taW5AbWljcm9zb2Z0LmNvbT4KPiBDYzogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4KPiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4gQ2M6IEJvcmlzbGF2IFBl
dGtvdiA8YnBAYWxpZW44LmRlPgo+IENjOiB4ODZAa2VybmVsLm9yZwo+IENjOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+Cj4gQ2M6IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+Cj4g
Q2M6IEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPgo+IENjOiBQZXRlciBaaWpsc3Ry
YSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+Cj4gQ2M6IGxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiB2aXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+IENjOiBrdm1Admdlci5rZXJuZWwub3JnCj4gQ2M6IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IE5hZGF2IEFtaXQg
PG5hbWl0QHZtd2FyZS5jb20+Cj4gLS0tCj4gIGFyY2gveDg2L2h5cGVydi9tbXUuYyAgICAgICAg
ICAgICAgICAgfCAxMCArKystLS0KPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaCAg
ICAgICB8ICA2ICsrLS0KPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaCB8
ICA0ICstLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oICAgICAgIHwgIDggKyst
LS0KPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vdHJhY2UvaHlwZXJ2LmggICB8ICAyICstCj4gIGFy
Y2gveDg2L2tlcm5lbC9rdm0uYyAgICAgICAgICAgICAgICAgfCAxMSArKysrKy0tCj4gIGFyY2gv
eDg2L2tlcm5lbC9wYXJhdmlydC5jICAgICAgICAgICAgfCAgMiArLQo+ICBhcmNoL3g4Ni9tbS90
bGIuYyAgICAgICAgICAgICAgICAgICAgIHwgNDcgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
Cj4gIGFyY2gveDg2L3hlbi9tbXVfcHYuYyAgICAgICAgICAgICAgICAgfCAxMSArKystLS0tCj4g
IGluY2x1ZGUvdHJhY2UvZXZlbnRzL3hlbi5oICAgICAgICAgICAgfCAgMiArLQo+ICAxMCBmaWxl
cyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKPiAKCkZvciB0aGUg
SHlwZXItViBwYXJ0cyAtLQpSZXZpZXdlZC1ieTogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1p
Y3Jvc29mdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
