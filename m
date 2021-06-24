Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA543B26D8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 07:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146393.269356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHz9-0002qj-OV; Thu, 24 Jun 2021 05:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146393.269356; Thu, 24 Jun 2021 05:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHz9-0002ns-K0; Thu, 24 Jun 2021 05:33:07 +0000
Received: by outflank-mailman (input) for mailman id 146393;
 Thu, 24 Jun 2021 05:33:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXyq=LS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lwHz8-0002nm-Cb
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 05:33:06 +0000
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76e5b4da-2205-4979-bcbd-4c0a97999940;
 Thu, 24 Jun 2021 05:33:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 22:33:02 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2021 22:33:02 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 22:33:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 22:33:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 22:33:01 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 05:32:59 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4242.024; Thu, 24 Jun
 2021 05:32:59 +0000
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
X-Inumbo-ID: 76e5b4da-2205-4979-bcbd-4c0a97999940
IronPort-SDR: GuaJRPhzTWYx4NPFvmHhLueFw2/4QU6PBf4piEy/Xaw8IV/zH3Rkao+7VrudnfkGFHZthRADmY
 9BDv2vpX1/nw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="205571567"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="205571567"
IronPort-SDR: WPVElbVZJCb4BL8g/ERAByaZMTUQDhX2gUjLBsX4tFBRZIDDmMNQ5aoWSMenPtmg1pIwexyLSr
 Ip41sTGYDXLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="557209273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHXgRsqvPQNR7iEEBqRkh2xZXYNiSmpTDjdEYXyPezfdxJQiZkXLA2IakZ4vdCcq9y82wtwIpkGucM1L/ul3XAbXfhqS93L0bAwZqV18mIeLwegW10MHZ2FIu0UhcwA/j9cks1dLTvf2JMXGiruZmyw5xfbMJ/2lEUxdcGIgxWm9Nws6O3dbvRqPef3O8Xx4RkYf8VKfIo79v2C62hMQxi17XRBSCKbRx/52NnF117OX81YYUlefsYlTNcAJXLmsV7Eg10KI4bmw6r/HC0cwxgzYJEbBRcQXwJ6awWt3RRPJ+JsIlTnwaI1MSx8KvAp5zsdyc6Ur2YEqNCk8ho7TxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAHwpg3SPwpJZ2ELFH4f7dRyPctI5pNwFqhD7Ku9vmg=;
 b=agnPgC42GMiegi4nQ6/njeYtqZ8A/gSNZbVI6dLFZ6Z6elKWcX9eARyvq1dntenM0dxHQKEue7k/nS1REF/TK6y+uxQY66P/DvumB2KUTvyHhN2hJr2j9Yv1I7zaDGAW32Ll6faVfBJHjfiASSdyqSIxuh4oplzfMna4WyBvDooCysEeRbPXIrHlekNjm+VnDRqz3XEPtNtTlXrAbJ48h/GNFZxS4StR3f2lOlCjbARyLLrmtAMY6OpgFqZW3shgO88CfAl1Ot5bijB59FyfqE1z5Ih44/WYlEMritioAD1OBH0GDZYy9xusb35yKAZ3OG9T+9x5/eMynrjxjgeC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAHwpg3SPwpJZ2ELFH4f7dRyPctI5pNwFqhD7Ku9vmg=;
 b=qCVFK5mE7OHpiqJdICjAN55WNxmWzTQx2ZeJOZrjAdG4EMY8nXbddiMRv6qWvl2xop12myD68ZCQ/VtNbS3RREGavbufVFE8IE6EYW6/ApxHOFubDjeIWZrtyWJpj0WXGxDsADj60glbxvpCtDMR2qSyUQbTq3T+TlrN4rqjxPw=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH 8/9] VT-d: drop/move a few QI related constants
Thread-Topic: [PATCH 8/9] VT-d: drop/move a few QI related constants
Thread-Index: AQHXXRIIGHcVQd+MLk6mkVDZqL+U3Ksiuo/g
Date: Thu, 24 Jun 2021 05:32:59 +0000
Message-ID: <MWHPR11MB18861EF0EFA04CAE5A7AC7C88C079@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <1b8558d4-42cc-bd68-e6c8-138f40f81e1c@suse.com>
In-Reply-To: <1b8558d4-42cc-bd68-e6c8-138f40f81e1c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.142.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b050d19-15e7-4376-fe02-08d936d18758
x-ms-traffictypediagnostic: CO1PR11MB4833:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB48338F90D769A317A896F12B8C079@CO1PR11MB4833.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dkiv/cJhEawHcAaBWVPHxdGIbtQ2wJeVNArD3TSYNs2peL7gpWouz8sTFBc14UhCNLd+SCVaC7ady8WXwjbmfJVcHSCjeFg7a2FtZrWZWTOGSxhAziwzhMLOVu2zce9L7FG5zYeh642SRh7mdZJTkiPwqTJcHPTRHQfUKFHfcQ5HhvPKXA5C3mQtKx705nvHYjfoyhaai7GFDkc7PR7S1koh9A+GqXCi4B3HcgSsiUhdTfFxG8PhSzVKGIh9NMI1nFg48KnFuOULOmDFJ3O3atYmT7bvSf+yYYIMJ57Mz7x5XisgSUFA89a/G/6SKqtUuzbzFbyFgd12IHqFL72wTQ2rb0Xo3kwPUWnB2NIL69SZArQ6gnkAc9kOUvYoMyhurVJNQ9Zq2KWVI0b/DkjCQljqwDBIsZ9285XGyvT0rc+Ggxx6+SMh4Xn+46c+NtgCi3JLbkf5uf8L6O5i5AyroESo0l3TSJ6ORx+5OApPhdoNERNa6lMnXzqWwrbAhlkABtAVhnBYe/blWZOoO3smU67UPOXkrxu2WVV6nIQZ7ixcqFFRJEonQyl2YVuZFJpcQJTyANApvbTjglRnQwybdU8fMDPKZrJBIluhoK51b7Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(39860400002)(136003)(86362001)(52536014)(38100700002)(5660300002)(122000001)(316002)(9686003)(8676002)(26005)(55016002)(33656002)(6506007)(7696005)(4326008)(186003)(71200400001)(2906002)(8936002)(76116006)(66946007)(66556008)(54906003)(478600001)(64756008)(66446008)(66476007)(110136005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUh4Vk9vTnhybEJqTEFUWkZ3MndZZWw5ellkZGJBUVJ1VWdqNmtjWVlGNkhy?=
 =?utf-8?B?SlV5NWpKVit0ZEF4NWFvSGdubHhKMmZYNEhyalJWQm5HOFZhQTlhYXNSbEI4?=
 =?utf-8?B?eWtDNUhEVHpMeTRHRG9RWnFRY0dxcTdqMHMrUllUcUlSWXFkNkJVTkhhdmt0?=
 =?utf-8?B?SkI3bnUzVzFHNDJpTDVUaWhuM09mcjNkRk1yMi9IZy9HN0tEU1J5UWRUQzA0?=
 =?utf-8?B?aEdoSDF0bnpPQS96dS9MR1NKMmpQMmRnZm1NMzdQUjdRQ2RrdGJFZzNnWGho?=
 =?utf-8?B?d3dpNEVnUmJXcXNTTnF3RFovSFo5TmY2cVdNZmVLYWlnODhQemlUeEQ4MFdF?=
 =?utf-8?B?OXAzSTkwek5ZNUp6ajF1dDFBRTJpV1RhSDlIT3YvaEwySmZHNzBiKzJNZmJ0?=
 =?utf-8?B?MjBzUDg2aGxLRDBKa3U5ZStTVVY2YndTMWNqaXFsQXcrNGJiMU1iOVFUSEsx?=
 =?utf-8?B?NlNYUVl3dUZqYldzR3hZdnkweEVMRjZxc0puYks3R0prck5JdUlYVS9hRmp5?=
 =?utf-8?B?MkNKaVJONGgrMElDb0J3eDMzRTJteFFjd2xkTHRrMEYrbUNTSGM1dXhjdkFF?=
 =?utf-8?B?c29ZK2hVdmN1VW1KRFcwTlhBS09oL0x1dUo2YkJkSjhnaWN2Q0FuWVVjemZI?=
 =?utf-8?B?MjZqMTFmUDFZMUkrdlZ0d3crQTNMSDBpeEszYVR4UWxuRGwxOHY5TXUyUUxu?=
 =?utf-8?B?elg1dmhGcW9rdEU0bEpOWHpMKzVWNDNmckkwc3A1ZUF4dGl5bGtScUVwT0JG?=
 =?utf-8?B?akU2RTZsUjBWZmYwZnJoN01NS2NBQmZ4blNqNFNwOXRaVFU4NmlIaEhUc2Zn?=
 =?utf-8?B?aDNzZk1udUNOQ3p2NlZybkd6WURCbFg0K1FqWE9HZVNIQmtjTkQzYWg5MUR1?=
 =?utf-8?B?ZTBEM1M3dVpGaG1nZlgrdXQ5KzU0L1lCRVBoLzU1ZjBJcmJVMUZrblFXMGtF?=
 =?utf-8?B?aVRRWFRXSVlkOEZjK1pKRndqUXowYjZJZEpqWk1yTUxoL3lLV25yQTNzMHlB?=
 =?utf-8?B?WVBERmlsVmlzNG4vVjRISVFhbU02aitsRm5NcnZUaUkyVEpmQjZ4ZUI0MGJk?=
 =?utf-8?B?TG9lWFVWL2xJelJTdG1uM2pOQS9IdHlOS1dpWUxvNE1Hb1duQU1Ka3prSjl0?=
 =?utf-8?B?RVFWOVJkbGtSNy93VVFuTlRnN1g5dXFlNHROU09IOWdUdVBhWC9VUEYyMFUv?=
 =?utf-8?B?alNYb2Z3R2NHQjlSTG5xSkdsUzVCS3hiOUl5UmFBa1M0R0Z0Uy9XblNMNlR6?=
 =?utf-8?B?TkpiWkVvcURKTFJZVDRTcVlKaWsyOW4ydHV2VHMrRk96eEdPK2xoTFJ3R0Mv?=
 =?utf-8?B?Tm4yWGV6WFlsVE11NmNKMDNGU0FhZHF1NW9VU1hCSU1LZCtLWlpXYWVlblBS?=
 =?utf-8?B?NjA0TGI2Z2VYcVozSitLdFhvbTB3TnBMa3l0WjEwbXNSSjI2K2J1RnZSbTBU?=
 =?utf-8?B?QlBSeEtCVHZVZitRY0lUMitucFM4OVBJWVVWbTNOQ3NVOTdQaU00RmxvQVA4?=
 =?utf-8?B?OTcyQkw3Zlk5UktwdnVqSjlHWVJRU1JuTEtWUFlKSklIeVk2YTVteDRFNDlK?=
 =?utf-8?B?WkxoSXd4aWkwSllLMlZaR2tGajFXMVRvRzYzN2ViRFNaMW5ZK0YxVXFKdFRp?=
 =?utf-8?B?VnpRdXhJa0JGN0tTcDA5TDJYWlNUQjBxMG1BV1ZXNHRlK0ZqVkIxbUxvdFFl?=
 =?utf-8?B?ajkvazhRTXJTY0sxdWVWcmVZa0dYVDREMGRpK0RTV3FFL1hPYktaalFlY1Rh?=
 =?utf-8?Q?T7IV15+9E7wB5qSvc6VDKpV6L7F/YigZ0OYTTxM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b050d19-15e7-4376-fe02-08d936d18758
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:32:59.5017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwPUxdoPi3GA+jr/Xm/GtXG0W/5gHGbZvW9f7flzo3hD9VsABY7wXkdbMDFJ3qnudGRBrsXIQpqdY1+sJ4DbWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVuZSA5LCAyMDIxIDU6MzAgUE0NCj4gDQo+IFJlcGxhY2UgdXNlcyBvZiBRSU5WQUxfRU5U
UllfT1JERVIgYW5kIFFJTlZBTF9JTkRFWF9TSElGVCwgc3VjaCB0aGF0DQo+IHRoZSBjb25zdGFu
dHMgY2FuIGJlIGRyb3BwZWQuIE1vdmUgdGhlIHJlbWFpbmluZyBRSU5WQUxfKiBvbmVzIHRvIHRo
ZQ0KPiBzaW5nbGUgc291cmNlIGZpbGUgdXNpbmcgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuaA0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
aW9tbXUuaA0KPiBAQCAtNDUxLDE3ICs0NTEsNiBAQCBzdHJ1Y3QgcWludmFsX2VudHJ5IHsNCj4g
ICAgICB9cTsNCj4gIH07DQo+IA0KPiAtLyogRWFjaCBlbnRyeSBpcyAxNiBieXRlcywgc28gMl44
IGVudHJpZXMgcGVyIHBhZ2UgKi8NCj4gLSNkZWZpbmUgUUlOVkFMX0VOVFJZX09SREVSICAoIFBB
R0VfU0hJRlQgLSA0ICkNCj4gLSNkZWZpbmUgUUlOVkFMX01BWF9FTlRSWV9OUiAoMXUgPDwgKDcg
KyBRSU5WQUxfRU5UUllfT1JERVIpKQ0KPiAtDQo+IC0vKiBTdGF0dXMgZGF0YSBmbGFnICovDQo+
IC0jZGVmaW5lIFFJTlZBTF9TVEFUX0lOSVQgIDANCj4gLSNkZWZpbmUgUUlOVkFMX1NUQVRfRE9O
RSAgMQ0KPiAtDQo+IC0vKiBRdWV1ZSBpbnZhbGlkYXRpb24gaGVhZC90YWlsIHNoaWZ0ICovDQo+
IC0jZGVmaW5lIFFJTlZBTF9JTkRFWF9TSElGVCA0DQo+IC0NCj4gICNkZWZpbmUgVFlQRV9JTlZB
TF9DT05URVhUICAgICAgMHgxDQo+ICAjZGVmaW5lIFRZUEVfSU5WQUxfSU9UTEIgICAgICAgIDB4
Mg0KPiAgI2RlZmluZSBUWVBFX0lOVkFMX0RFVklDRV9JT1RMQiAweDMNCj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL3FpbnZhbC5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiBAQCAtMjksNiArMjksMTMgQEANCj4gICNpbmNsdWRlICJl
eHRlcm4uaCINCj4gICNpbmNsdWRlICIuLi9hdHMuaCINCj4gDQo+ICsvKiBFYWNoIGVudHJ5IGlz
IDE2IGJ5dGVzLCBhbmQgdGhlcmUgY2FuIGJlIHVwIHRvIDJeNyBwYWdlcy4gKi8NCj4gKyNkZWZp
bmUgUUlOVkFMX01BWF9FTlRSWV9OUiAoMXUgPDwgKDcgKyBQQUdFX1NISUZUXzRLIC0gNCkpDQo+
ICsNCj4gKy8qIFN0YXR1cyBkYXRhIGZsYWcgKi8NCj4gKyNkZWZpbmUgUUlOVkFMX1NUQVRfSU5J
VCAgMA0KPiArI2RlZmluZSBRSU5WQUxfU1RBVF9ET05FICAxDQo+ICsNCj4gIHN0YXRpYyB1bnNp
Z25lZCBpbnQgX19yZWFkX21vc3RseSBxaV9wZ19vcmRlcjsNCj4gIHN0YXRpYyB1bnNpZ25lZCBp
bnQgX19yZWFkX21vc3RseSBxaV9lbnRyeV9ucjsNCj4gDQo+IEBAIC00NSwxMSArNTIsMTEgQEAg
c3RhdGljIHVuc2lnbmVkIGludCBxaW52YWxfbmV4dF9pbmRleChzdA0KPiAgew0KPiAgICAgIHVu
c2lnbmVkIGludCB0YWlsID0gZG1hcl9yZWFkbChpb21tdS0+cmVnLCBETUFSX0lRVF9SRUcpOw0K
PiANCj4gLSAgICB0YWlsID4+PSBRSU5WQUxfSU5ERVhfU0hJRlQ7DQo+ICsgICAgdGFpbCAvPSBz
aXplb2Yoc3RydWN0IHFpbnZhbF9lbnRyeSk7DQo+IA0KPiAgICAgIC8qICh0YWlsKzEgPT0gaGVh
ZCkgaW5kaWNhdGVzIGEgZnVsbCBxdWV1ZSwgd2FpdCBmb3IgSFcgKi8NCj4gICAgICB3aGlsZSAo
ICgodGFpbCArIDEpICYgKHFpX2VudHJ5X25yIC0gMSkpID09DQo+IC0gICAgICAgICAgICAoZG1h
cl9yZWFkbChpb21tdS0+cmVnLCBETUFSX0lRSF9SRUcpID4+DQo+IFFJTlZBTF9JTkRFWF9TSElG
VCkgKQ0KPiArICAgICAgICAgICAgKGRtYXJfcmVhZGwoaW9tbXUtPnJlZywgRE1BUl9JUUhfUkVH
KSAvIHNpemVvZihzdHJ1Y3QNCj4gcWludmFsX2VudHJ5KSkgKQ0KPiAgICAgIHsNCj4gICAgICAg
ICAgcHJpbnRrX29uY2UoWEVOTE9HX0VSUiBWVERQUkVGSVggIiBJT01NVSMldTogbm8gUUkgc2xv
dA0KPiBhdmFpbGFibGVcbiIsDQo+ICAgICAgICAgICAgICAgICAgICAgIGlvbW11LT5pbmRleCk7
DQo+IEBAIC02Niw3ICs3Myw3IEBAIHN0YXRpYyB2b2lkIHFpbnZhbF91cGRhdGVfcXRhaWwoc3Ry
dWN0IHYNCj4gICAgICAvKiBOZWVkIGhvbGQgcmVnaXN0ZXIgbG9jayB3aGVuIHVwZGF0ZSB0YWls
ICovDQo+ICAgICAgQVNTRVJUKCBzcGluX2lzX2xvY2tlZCgmaW9tbXUtPnJlZ2lzdGVyX2xvY2sp
ICk7DQo+ICAgICAgdmFsID0gKGluZGV4ICsgMSkgJiAocWlfZW50cnlfbnIgLSAxKTsNCj4gLSAg
ICBkbWFyX3dyaXRlbChpb21tdS0+cmVnLCBETUFSX0lRVF9SRUcsIHZhbCA8PCBRSU5WQUxfSU5E
RVhfU0hJRlQpOw0KPiArICAgIGRtYXJfd3JpdGVsKGlvbW11LT5yZWcsIERNQVJfSVFUX1JFRywg
dmFsICogc2l6ZW9mKHN0cnVjdA0KPiBxaW52YWxfZW50cnkpKTsNCj4gIH0NCj4gDQo+ICBzdGF0
aWMgc3RydWN0IHFpbnZhbF9lbnRyeSAqcWlfbWFwX2VudHJ5KGNvbnN0IHN0cnVjdCB2dGRfaW9t
bXUgKmlvbW11LA0KPiBAQCAtNDEzLDE3ICs0MjAsMTggQEAgaW50IGVuYWJsZV9xaW52YWwoc3Ry
dWN0IHZ0ZF9pb21tdSAqaW9tbQ0KPiAgICAgICAgICAgICAgICogb25seSBvbmUgZW50cnkgbGVm
dC4NCj4gICAgICAgICAgICAgICAqLw0KPiAgICAgICAgICAgICAgQlVJTERfQlVHX09OKENPTkZJ
R19OUl9DUFVTICogMiA+PSBRSU5WQUxfTUFYX0VOVFJZX05SKTsNCj4gLSAgICAgICAgICAgIHFp
X3BnX29yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoKG51bV9wcmVzZW50X2NwdXMoKSAqIDIg
KyAxKQ0KPiA8PA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAoUEFHRV9TSElGVCAtDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBRSU5WQUxfRU5UUllfT1JERVIpKTsNCj4gLSAgICAgICAgICAgIHFpX2Vu
dHJ5X25yID0gMXUgPDwgKHFpX3BnX29yZGVyICsgUUlOVkFMX0VOVFJZX09SREVSKTsNCj4gKyAg
ICAgICAgICAgIHFpX3BnX29yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoKG51bV9wcmVzZW50
X2NwdXMoKSAqIDIgKyAxKSAqDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgcWludmFsX2VudHJ5KSk7DQo+ICsgICAgICAgICAg
ICBxaV9lbnRyeV9uciA9IChQQUdFX1NJWkUgPDwgcWlfcGdfb3JkZXIpIC8NCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBxaW52YWxfZW50cnkpOw0KPiANCj4gICAg
ICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8gVlREUFJFRklYLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAiUUk6IHVzaW5nICV1LWVudHJ5IHJpbmcocylcbiIsIHFpX2VudHJ5X25yKTsNCj4g
ICAgICAgICAgfQ0KPiANCj4gICAgICAgICAgaW9tbXUtPnFpbnZhbF9tYWRkciA9DQo+IC0gICAg
ICAgICAgICBhbGxvY19wZ3RhYmxlX21hZGRyKHFpX2VudHJ5X25yID4+IFFJTlZBTF9FTlRSWV9P
UkRFUiwNCj4gKyAgICAgICAgICAgIGFsbG9jX3BndGFibGVfbWFkZHIoUEZOX0RPV04ocWlfZW50
cnlfbnIgKg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
b2Yoc3RydWN0IHFpbnZhbF9lbnRyeSkpLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpb21tdS0+bm9kZSk7DQo+ICAgICAgICAgIGlmICggaW9tbXUtPnFpbnZhbF9tYWRkciA9
PSAwICkNCj4gICAgICAgICAgew0KDQo=

