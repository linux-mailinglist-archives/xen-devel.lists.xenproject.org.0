Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE3644FE7D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 06:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225658.389711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUwc-00007u-Cf; Mon, 15 Nov 2021 05:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225658.389711; Mon, 15 Nov 2021 05:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUwc-00005R-9C; Mon, 15 Nov 2021 05:54:18 +0000
Received: by outflank-mailman (input) for mailman id 225658;
 Mon, 15 Nov 2021 05:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmUwa-00005H-Fi
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 05:54:16 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74f5176e-45d8-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 06:54:13 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 21:54:11 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2021 21:54:11 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:54:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 21:54:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 21:54:10 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3698.namprd11.prod.outlook.com (2603:10b6:408:8a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Mon, 15 Nov
 2021 05:54:07 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 05:54:07 +0000
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
X-Inumbo-ID: 74f5176e-45d8-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="257118998"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="257118998"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="493874120"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GScx8rPdToPM605djY6x+lOgP7z52LMOpxHbtlN2Y8P5liUGAfzRDJaYC0047EsX9c9jbwrFCiKlU7uYnwFFeXXh5dU+R6IcFR/OdCSCgS/r2X1P7r4rgsaydERSMMV4iB1WFaOxRuEGmQCEONk0C0ScGVEk81Mdj7x8L+MvDxkGFucnYlL5xJGoZ9A04yuP5+lRPFU4sPMLF3Sbj8q0S3YuPdvPrfk1EPDoNs5XYSwXM49BoaEtRsL4MeVTvPvmKGXVBw0qig7DVECpO8Ji8IzWlLejqickwcfx62Qk13ZBAZthgJbe9puG3RJQp/nGw/i9ZWOYiulY3WOwcoZdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVpavmkP0FeBQX2wQMFqmNj+Snyy+1Vblo4nB/C8pcU=;
 b=Cqifue8T0LdscETR5TZU+9VpolRHg3fmqxVUmP6I3KzBoB4aIxJczPzoHfvzbdsk/XHJs9Jp2iVcZkq/iwcXjJw0bQHh/K4hUioH5ROEfeb5+pN11aHeWBB3AoVmyUD8kyqPJNK1ZIk8n4br5hoZ/LPGI01bDoIe8CXzUicWKn6elln8TyngQ0R40NzSWSlM4kfhndA4WeO4k9FlAp6fkspSlAz0/a1sHVIHoIItQUXLuoJbT7L3RY0HMnlipJPaE+mwvMZROB8hh31UT2hIXT7lrAjZkOb6JPIAt1/vxqByehFRPFQGl16jDWklc9GYGEcAJqDptEOBOXZUXnggKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVpavmkP0FeBQX2wQMFqmNj+Snyy+1Vblo4nB/C8pcU=;
 b=xJQw5rpedY7z9vbTYvN1ms9kYzqKBoFVmQGNFngExSIkvJ2Pjm9PQlnGt6lPsa43waR+ytuualmxQf4rL7eTYpbf7An8cq8E6xMazEgBnY/VDkiNMjGwLh5zc0K68EOzQH/RVdmyHp0UzLjS3Fou3oWNq09J9Y8nftLegB3Z9po=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 5/6] VT-d: introduce helper to convert DID to domid_t
Thread-Topic: [PATCH 5/6] VT-d: introduce helper to convert DID to domid_t
Thread-Index: AQHX16qieR9jhpz27Ey6PyooEs35QawEGvOw
Date: Mon, 15 Nov 2021 05:54:07 +0000
Message-ID: <BN9PR11MB54338FBBA9F897FCFCBC6F7B8C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <ff49be66-1d4f-9e1b-95ac-b445eef29d41@suse.com>
In-Reply-To: <ff49be66-1d4f-9e1b-95ac-b445eef29d41@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4da4b653-0403-49dd-6e15-08d9a7fc565e
x-ms-traffictypediagnostic: BN8PR11MB3698:
x-microsoft-antispam-prvs: <BN8PR11MB36988D6CC0DFD59CFC7238EA8C989@BN8PR11MB3698.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: esZMr71ePBEbVL/Vdu93OGINgXlT6yK8a+u3e9IhvvwYbkjbVb2FsSHjBpg7QVskOm31B76K091+2DWqmXFt/fP2/CXL7kNaXFu1ftDvsbCKc7JlH4lddGWYz/TFcrIDCI1juwhng1wIqGTOw0iwlhQQ8Vu07KLo3Pl7AxUzgy0f8i5fwTSqjGipXo3pHnkKkiZPdXiXVo/0qsRnrWxbbU1kreBYom296Ubv9d3Gzm5VAqYrBYdXaE2n+a+UW4T/Wnlpfnn99gq9Q6973lW84V3J7r+o2pG2S8VI+mGXzuozHdtvcnng9MybEHS54uyp0d8ruJyk1KUlueFX3UGy9zQD+670aVHCXJEc1Yj4oyWPqcczkHedfRUPzU/xi5+CiIx/J6KtnFtwfzbl09JBKzfjhmctNswr0GIq+l6cF8x9C1xnMs6MzbVzq45naqL3MgA8wLmLoK5NyzPbzuMFQU6SaonOwkr7ynWwJKXtpjfiYWeAtk/OJxr503w7aMoXh07ltGUqcm/VhsurHUniz705P+h2kWMj8qM7tqCwEa69DYqavf6D6q6n+qgGzUoVwu8GYo6BRhyGtzrCO1glqQB0vZh5ecdOn5i50yRslQlZyBILYvyokpRAKAebyOulQvHhYkYaWEY6ZP+KMFQCMGNDop4dKaqLT/eJUOZjqjCDYAJ+eqYVwAMpHvXHC6izOVZXpRjOScqH4Xli4MRndQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(82960400001)(316002)(26005)(9686003)(5660300002)(86362001)(2906002)(7696005)(38070700005)(8936002)(122000001)(8676002)(76116006)(66476007)(66446008)(186003)(66556008)(64756008)(110136005)(33656002)(508600001)(66946007)(6506007)(83380400001)(52536014)(55016002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFhlalc2Qk52ajNlVDB2Q1BQSEJXaUtyNFBYTGpzOTFuTU1NSzlwMHh3SVNh?=
 =?utf-8?B?Nm1oOFFwUTdwbXNMdUZYbzRkQ1VUZGxFMmlVRDJNZjcrN2hOM0tjeEJSRFlh?=
 =?utf-8?B?ZndFYVlnVlZZTDJhSmEvbFFtS3lTaURaL3pVYmNOUjJlYTdxczJGUUJNeS9W?=
 =?utf-8?B?SmRFbmFMMWV5b01iOFk3M2IwVGFTUG56TVJaQ2FnUGpLQ3pZcGtIdFpPSHUy?=
 =?utf-8?B?b2ljVEZqS0kwaDh1UnlQZThGQ1ZPYVF4RFZLRU1VdHhyWVpjNzJjZ05zeWtO?=
 =?utf-8?B?QjR1TThTSXpYYlBPNC9iUmR3VDdqR0FweElLbjVrRzZpRGtUK09mZUJtV201?=
 =?utf-8?B?UjBZbENzS3FkQUQ1R3pWSy82MTM1TnU0Rlg3WlQzQTZXVG5CL3JyVWNSQTBJ?=
 =?utf-8?B?RmRtNCtHUHlYalc5YWlQNGxiMmxHZm9tNHg5VHlmZkRvR3JTZFB0MFRIMVNj?=
 =?utf-8?B?aGp4a251TzduZVpURms5c2FHdGlQUHpDY1dIdEcrR3ZuMkVvMzBrU1FERitW?=
 =?utf-8?B?Ty9RVEJrcDhod2F4Z1g1Q1VOYmFvVlViSzlmWGt5MG1KYTQ5eGtTdkc1bEF4?=
 =?utf-8?B?b0Z2d01Va0hydUhzenNXVjNsSlV5T0FhN056VEdHQWhnbUF6UkZiODN2UWFZ?=
 =?utf-8?B?TW1qa0NuWGtPa1NubVB3azc3MjBDR3VxKzJhVkp4aVdlWmtyRFljTVhjYjd2?=
 =?utf-8?B?QTN5cVVsY0YrT0hJS2JQZWNsbHEza25EMGIwWVJWa1BxT0JnYXZFZ2dDdHRB?=
 =?utf-8?B?b1pUNFl4RkZZblU5dFZtOUNlbHpYaFMxRkNPUmQ5NXF1YTAxd3QxUGU2cGpX?=
 =?utf-8?B?MHVZWFNIMWhmTU1aQ1F4YWhQSFpnamZPbjhXWS9iYmx3aVluTWYyS3lXVVAv?=
 =?utf-8?B?SEZoY2w2dW8zcTRRblRZUjBqUDFvcEROdit0M0U2K3BYaENNYzRhRUNmZE1u?=
 =?utf-8?B?OXFQL0R2NzNQSHpXM0VXMDVqWkhlWFk3NVh5SlZWQlJXamlkNXV4WjRqKzBO?=
 =?utf-8?B?MHNGQjlMbzliZFkzRFl2Mk15QWRnZEhOMmYrUTFoOFFtSmZ3d2ViRTNhcDkx?=
 =?utf-8?B?eVVyd3VXNVZ1TldwdjdrUmN1a1MrUlBESlltVjJFeXpTSldDQytCbjh0TURO?=
 =?utf-8?B?N2VrOEZSL3I1YWpyVUt6M05XbW9DL0c4MjYzdlhOOFBiMzFidllyRmJIU0ZS?=
 =?utf-8?B?NTNNZmpGQnN6TFVLdXdIeXZLRkFvSEdVQjdGWS8yQzhMQWcydkoya1ZJdzVj?=
 =?utf-8?B?RVNZVmRyZjhtMnhnUGdjQVcyMzRrVk9FV2dNRVlPNFMxbjhHR1JkNlBaY3NM?=
 =?utf-8?B?Q3lmMFRjbHV6MFg3OHU5dmdUSTVHWE1BV0xLYmdVT0ZmbGN6c1BNZUpJOWZh?=
 =?utf-8?B?OGl1WVUwTHdUKzg0d09Ga2JJcWNJcCtuY1NwWU5DYlRMckRobi92RVl3T2cr?=
 =?utf-8?B?U2tkSlFBK05sVGN3R3g0dTFUWW56dzl3eWNtS3AyRnI5blpJelJlZjNuRXVE?=
 =?utf-8?B?Vis0QkNIUFRBUFo2azY1azJoTW44bkdtdkV3cDhiOFJSV21pU2t5ZHZqUEUz?=
 =?utf-8?B?RlM1My9XRDNTS2Z3dWlWVW0yalBDUVl2M1dPUEVyZ0FKYU53VDAzdDh1by82?=
 =?utf-8?B?VmZWejNRYUQ0N1h2VG5tazJ2ZVRrZ2M3WjE3dEIvQVVISW4zMXczZzBOc0VZ?=
 =?utf-8?B?d2IrY3JHazE4OS9IcytWeW9USklvUmc5a3YxVXIxMXA5eStkdFdLNy9YOVlJ?=
 =?utf-8?B?Q3BxVUZETmhwRHBIdFhGc0RLbkVYQWs3VVFsZ1N3ZVVsb3phcVQ3UG80dWFz?=
 =?utf-8?B?QXpyUTRJMTNaODhrU2xLQUNNRytNZ1J2eGtMMlkrWTFRZGFjVDNHd1hnckVP?=
 =?utf-8?B?WDR2QkIzVmhQVWVES3paWEtYZmdzdHM5WTMyNExzS0U4RjEwdk1pTkFLcEty?=
 =?utf-8?B?bFVxRnZpQWgrQy93emFEM2dGT1JYRk1MWEdZQkpNSmZaejVNd1E3Q3Uvb04z?=
 =?utf-8?B?RVN3S1hvNm1kQVd4WW1ubmt3MGZzMWhFWlVWTjd2K3VIMHlDUDE0azFGYURL?=
 =?utf-8?B?b3ROZUVTczlXaS8wNnp2NDM5VU1OSjVLeHh6RU8yVW9ia1hMdC9haGt6MVc1?=
 =?utf-8?B?SVhvenV4TFl3Q3FGZUFESzY2NVNZSFd6bHgrbGdhakZpN1g5K0l0RDV4b2h2?=
 =?utf-8?Q?tfbIUVqwHWkycGv9uUScMC8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da4b653-0403-49dd-6e15-08d9a7fc565e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 05:54:07.1127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64c2kEVfkZWGmK4H21G5K/lUPXVmCC2G5d6BFpkEnhs4H1uic/bsHZzM846fsaD92YPryT5psEyNlhaiBYPQDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3698
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMTIsIDIwMjEgNTo1MCBQTQ0KPiANCj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiBv
ZiBhZGRpbmcgYW5vdGhlciAidHJhbnNsYXRpb24iIG1ldGhvZC4gVGFrZSB0aGUNCj4gY29tYmlu
YXRpb24gb2YgdGhlIGV4dHJhIHZhbGlkYXRpb24gYm90aCBwcmV2aW91c2x5IG9wZW4tY29kZWQg
aGF2ZSBiZWVuDQo+IGRvaW5nOiBCb3VuZHMgY2hlY2sgYW5kIGJpdG1hcCBjaGVjay4gQnV0IGRv
bid0IHByb3BhZ2F0ZSB0aGUgcHJldmlvdXMNCj4gcG9pbnRsZXNzIGNoZWNrIG9mIHdoZXRoZXIg
LT5kb21pZF9tYXBbXSB3YXMgYWN0dWFsbHkgYWxsb2NhdGVkLCBhcw0KPiBmYWlsdXJlIHRoZXJl
IHdvdWxkIGxlYWQgdG8gb3ZlcmFsbCBmYWlsdXJlIG9mIElPTU1VIGluaXRpYWxpemF0aW9uDQo+
IGFueXdheS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K
DQo+IA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZXh0ZXJuLmgNCj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2V4dGVybi5oDQo+IEBAIC00NSw2ICs0NSw4
IEBAIHZvaWQgZGlzYWJsZV9pbnRyZW1hcChzdHJ1Y3QgdnRkX2lvbW11ICoNCj4gIGludCBpb21t
dV9hbGxvYyhzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQgKmRyaGQpOw0KPiAgdm9pZCBpb21tdV9mcmVl
KHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZCk7DQo+IA0KPiArZG9taWRfdCBkaWRfdG9fZG9t
YWluX2lkKGNvbnN0IHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11LCB1bnNpZ25lZCBpbnQNCj4gZGlk
KTsNCj4gKw0KPiAgaW50IGlvbW11X2ZsdXNoX2llY19nbG9iYWwoc3RydWN0IHZ0ZF9pb21tdSAq
aW9tbXUpOw0KPiAgaW50IGlvbW11X2ZsdXNoX2llY19pbmRleChzdHJ1Y3QgdnRkX2lvbW11ICpp
b21tdSwgdTggaW0sIHUxNiBpaWR4KTsNCj4gIHZvaWQgY2xlYXJfZmF1bHRfYml0cyhzdHJ1Y3Qg
dnRkX2lvbW11ICppb21tdSk7DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBA
IC0xMjMsMTUgKzEyMywxNiBAQCBzdGF0aWMgaW50IGNvbnRleHRfZ2V0X2RvbWFpbl9pZChjb25z
dCBzDQo+IA0KPiAgICAgIGlmICggaW9tbXUgJiYgY29udGV4dCApDQo+ICAgICAgew0KPiAtICAg
ICAgICB1bnNpZ25lZCBpbnQgbnJfZG9tID0gY2FwX25kb21zKGlvbW11LT5jYXApOw0KPiAgICAg
ICAgICB1bnNpZ25lZCBpbnQgZG9tX2luZGV4ID0gY29udGV4dF9kb21haW5faWQoKmNvbnRleHQp
Ow0KPiANCj4gLSAgICAgICAgaWYgKCBkb21faW5kZXggPCBucl9kb20gJiYgaW9tbXUtPmRvbWlk
X21hcCApDQo+IC0gICAgICAgICAgICBkb21pZCA9IGlvbW11LT5kb21pZF9tYXBbZG9tX2luZGV4
XTsNCj4gLSAgICAgICAgZWxzZQ0KPiArICAgICAgICBkb21pZCA9IGRpZF90b19kb21haW5faWQo
aW9tbXUsIGRvbV9pbmRleCk7DQo+ICsgICAgICAgIGlmICggZG9taWQgPT0gRE9NSURfSU5WQUxJ
RCApDQo+ICsgICAgICAgIHsNCj4gICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0RFQlVHIFZU
RFBSRUZJWCwNCj4gLSAgICAgICAgICAgICAgICAgICAgImRvbV9pbmRleCAldSBleGNlZWRzIG5y
X2RvbSAldSBvciBpb21tdSBoYXMgbm8NCj4gZG9taWRfbWFwXG4iLA0KPiAtICAgICAgICAgICAg
ICAgICAgICBkb21faW5kZXgsIG5yX2RvbSk7DQo+ICsgICAgICAgICAgICAgICAgICAgICJubyBk
b21pZCBmb3IgZGlkICV1IChucl9kb20gJXUpXG4iLA0KPiArICAgICAgICAgICAgICAgICAgICBk
b21faW5kZXgsIGNhcF9uZG9tcyhpb21tdS0+Y2FwKSk7DQo+ICsgICAgICAgICAgICBkb21pZCA9
IC0xOw0KPiArICAgICAgICB9DQo+ICAgICAgfQ0KPiANCj4gICAgICByZXR1cm4gZG9taWQ7DQo+
IEBAIC0xOTMsNiArMTk0LDE0IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2NsZWFudXBfZG9taWRfbWFw
KHN0cnUNCj4gICAgICB9DQo+ICB9DQo+IA0KPiArZG9taWRfdCBkaWRfdG9fZG9tYWluX2lkKGNv
bnN0IHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11LCB1bnNpZ25lZCBpbnQNCj4gZGlkKQ0KPiArew0K
PiArICAgIGlmICggZGlkID49IGNhcF9uZG9tcyhpb21tdS0+Y2FwKSB8fCAhdGVzdF9iaXQoZGlk
LCBpb21tdS0NCj4gPmRvbWlkX2JpdG1hcCkgKQ0KPiArICAgICAgICByZXR1cm4gRE9NSURfSU5W
QUxJRDsNCj4gKw0KPiArICAgIHJldHVybiBpb21tdS0+ZG9taWRfbWFwW2RpZF07DQo+ICt9DQo+
ICsNCj4gIHN0YXRpYyB2b2lkIHN5bmNfY2FjaGUoY29uc3Qgdm9pZCAqYWRkciwgdW5zaWduZWQg
aW50IHNpemUpDQo+ICB7DQo+ICAgICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgY2xmbHVzaF9zaXpl
ID0gMDsNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3FpbnZhbC5jDQo+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiBAQCAtMjI5LDEwICsy
MjksNyBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBkZXZfaW52YWxpZGF0ZV9zDQo+ICAgICAg
cmMgPSBxdWV1ZV9pbnZhbGlkYXRlX3dhaXQoaW9tbXUsIDAsIDEsIDEsIDEpOw0KPiAgICAgIGlm
ICggcmMgPT0gLUVUSU1FRE9VVCApDQo+ICAgICAgew0KPiAtICAgICAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gTlVMTDsNCj4gLQ0KPiAtICAgICAgICBpZiAoIHRlc3RfYml0KGRpZCwgaW9tbXUtPmRv
bWlkX2JpdG1hcCkgKQ0KPiAtICAgICAgICAgICAgZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChp
b21tdS0+ZG9taWRfbWFwW2RpZF0pOw0KPiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gcmN1
X2xvY2tfZG9tYWluX2J5X2lkKGRpZF90b19kb21haW5faWQoaW9tbXUsDQo+IGRpZCkpOw0KPiAN
Cj4gICAgICAgICAgLyoNCj4gICAgICAgICAgICogSW4gY2FzZSB0aGUgZG9tYWluIGhhcyBiZWVu
IGZyZWVkIG9yIHRoZSBJT01NVSBkb21pZCBiaXRtYXAgaXMNCg0K

