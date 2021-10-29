Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69F43F92B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 10:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218450.378887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgNVP-0002ak-2p; Fri, 29 Oct 2021 08:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218450.378887; Fri, 29 Oct 2021 08:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgNVO-0002Y0-VO; Fri, 29 Oct 2021 08:44:54 +0000
Received: by outflank-mailman (input) for mailman id 218450;
 Fri, 29 Oct 2021 08:44:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H5Tp=PR=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mgNVN-0002Xs-06
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 08:44:53 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f194239-45ff-4347-8c8a-c17244b63f95;
 Fri, 29 Oct 2021 08:44:47 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:44:46 -0700
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 29 Oct 2021 01:44:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 29 Oct 2021 01:44:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 29 Oct 2021 01:44:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 29 Oct 2021 01:44:40 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN7PR11MB2563.namprd11.prod.outlook.com (2603:10b6:406:b0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 08:44:38 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%7]) with mapi id 15.20.4649.014; Fri, 29 Oct 2021
 08:44:38 +0000
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
X-Inumbo-ID: 0f194239-45ff-4347-8c8a-c17244b63f95
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230482638"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; 
   d="scan'208";a="230482638"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; 
   d="scan'208";a="538663352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvWhFLgEs0h6qYxJQr52jKq4Axbom/nCT1S+i9JxqpAzuA0ul5rDiv5BSNeypl4seQU5oG9lhvIyNVq9sp65ILKm7Wdm16cpzSwTQ0UDY5nVGh5iMMcNnqN/SlMDPQOseD32qstifzfDqnhjb0kNZZrVo5fYeSaZLDH1TSD9WCGk2Y8lKf2CWEnv6MM7nCscLujA0USbBCt6o2Sxm0uVRHK8pAdLYyGlFXxCjf1VsbC4OM/O8gFJANvzDwSXtp94Fxx/MuXeM/KESbDMqAH3g7GU6GWegbktJLlHAN1sQHF87ehTqgGxR0w0N5BT6Vru5Lzf5y2AKiffICL8BUIMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSYA/iS4g4dvAdWlB/IxW3i1t49wb+LtWl8hPvbpU6o=;
 b=LHaee6BwwDG/ZMeH6Uyy5nOoEZ9jL0bk0ueqL7CSnwbSeCwEu8cgaYYGJkkXRR+7mr7H3BkooWIt1LSR2H8k7iftfpPeSsFp0hJeZTeIxSYXXB1+WNyizXd0JvYjYFUd19NFD9DJJt0/1L/fEXt5zmGDO7iIi8NwTpIVogTPnECUbQ4Ee+wLk6mbzfwX8H4+Wf8J4c3sp6RU1+30e2+xNq0DbBngN3moivhDzD38eFM4cNnT7RAOSqaVqj5Og6TLhjgHLlaNADUfqHd7IDnvRKGYdGOxacKKiOUadg1HNInvvmjmdtdDvY4+V+yVXxQwD+A3S4RpApQwfbJ3lcmdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSYA/iS4g4dvAdWlB/IxW3i1t49wb+LtWl8hPvbpU6o=;
 b=hn9U/viY9Qx6EBaHDsdtMJdgPvA0IghLjwMs4rYX5VEiriOHRyDGR379ejuirZtZ+0c0l4zQGZN2Pblmixacs3oJk2HfuSWsAlfd1IaPrpn4K/dvHhQTON10w7B3vq5vgAWHlY4/sv/n/F12JQx6hVyU63nbkLW/6VtqK1iIlkU=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: RE: [PATCH v2 1/3] x86/IOMMU: mark IOMMU / intremap not in use when
 ACPI tables are missing
Thread-Topic: [PATCH v2 1/3] x86/IOMMU: mark IOMMU / intremap not in use when
 ACPI tables are missing
Thread-Index: AQHXxmJDj1yUJeGSDkOPNy18ywaldKvehyQAgAsuYGA=
Date: Fri, 29 Oct 2021 08:44:38 +0000
Message-ID: <BN9PR11MB5433E504303B916154265E678C879@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
 <ffe7f130-9034-50d0-ab0a-06933dde88d8@suse.com>
In-Reply-To: <ffe7f130-9034-50d0-ab0a-06933dde88d8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31f03bc0-14ed-414e-e38a-08d99ab857ab
x-ms-traffictypediagnostic: BN7PR11MB2563:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB2563E631B2B2CDB887D65D2D8C879@BN7PR11MB2563.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xiLNjCc93H8SyRyT4NQriPa2WBkNtBwEX0NMFKmkzfCQCjrSC4rVgieToTMtKSlFb+8JGjXoTwa+k97brOJs6H/k5mE2AIIxtLMXDK0zKttwRvISzfY79602NWwIjE1lFxCb2lbOe5A/Aj+MS0sN9dIAYnnb/mJqaZ2ZQNo5TPKmLCcRNaAtvfizNuWL8xjvW+ARuauyo7xMOpkU0eqv1YFgLpy0RSWlWHZyqdMbGYHuf3X1hxpsGiAUwsvQxN3InCH5UIuUDpMhSq+7hxRdJ3m+ohHm0wnaLgti2ApS8ho8xzMgJRSua1qB+5lDehiy0XNlw9plXjz6NVyjtvMhnIKuJDBXS3mHZhV3i4/HFpY9gmvSPz0B6EgKoVDTL7N3gEZP8Bnkxtl0V1H6QmGiwEF5HAplfBidjgt7WdLFa2D/XegcCXGSRPYkhXe/WWwvsU9ulljmvumGZN2Qi+2+DGWgiY2tYgYzT2WOxh6keGg3aoc9JWcmkFVhdA5mlVUb05p1l+aqf5Qvb3juW1vIJUc4w5YrZ9m4Os5PlxSCY7TNPdsJiLnPpCLBuDS4vFksYL4tm63m/o4XqI8M0mNnRbisRYzA+PMjpTX296ILEw7Fp1U9uf2Ftl+rACTxRsv0sdCzkfinX1hgKzNLSO2puVRxoGTqzFqhIKiowO9sh94tP6cEJxmdBQNUeA4we7VGQau39UpLK842rxtLgrFxdA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(508600001)(8936002)(52536014)(33656002)(4326008)(8676002)(122000001)(38100700002)(76116006)(66946007)(110136005)(55016002)(54906003)(7696005)(9686003)(86362001)(64756008)(66556008)(53546011)(2906002)(316002)(186003)(26005)(71200400001)(5660300002)(66476007)(66446008)(82960400001)(38070700005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0VjYlRxUUpuZmNJOGplNW5GUHJBVmVleC9oOW5zazRjYmJVRGFnY3RsWmQ1?=
 =?utf-8?B?UjYrYUtPSnBoblpQWVI3cDhrTGNoSVpRbEhFdnF0TWF6RkdpekFVcHRnZWNj?=
 =?utf-8?B?Y1IzL01yTXZhaEduZXNkY1VPN0Z1dVZaM1pBclVHTkVPajV5cngzRzBCMDVz?=
 =?utf-8?B?bU1uSmp3eGwvUVZsV0FUbHZYMFdNNnIvV2tRMUhBK1JSWVRnZW1zVmZ6anZs?=
 =?utf-8?B?VjdYNlZWT3lNakJObFFEdFQ0SzZNb2RhNVB3Tk5BUkUzUWszaEg5MlZKOTdq?=
 =?utf-8?B?SW83TUtEdnV5K1ZpczlaZTdtdDB5NmY5OUNLUGczTjJHWFEwbkFWRXZWYm5w?=
 =?utf-8?B?bmpUNUhZUTcySnovQWtNMlhrUjRNNFI0R1QxN3NGS3hDbUpOZThzclBWOHNZ?=
 =?utf-8?B?LzZrem0xQjI0c3NwbUNtR1gxS2RnVUE0NWVWbTMvdVlLbmZtb1VmMFZDNmpv?=
 =?utf-8?B?Y3ZCL1dvQzFkQ2RUdmFnNENUZnUva1V5U3F1NTR0YzM0Uzh1NjlmcW9GOEVS?=
 =?utf-8?B?TDNVSmEwdU1JWURlV0NLbmR6cXdxSmtUMllyYTIyTUFBaGM4UlNhSGlzTm55?=
 =?utf-8?B?VS8rYWh1TjlFWHNMUzJ4WkNNUUtma0ZCV2paWHlKaFMvY1pOTXJFVm1KNUtX?=
 =?utf-8?B?QldaZ3NkNkw0di9KQzVWRGp3Ym16K2ZEL01scjJWR2RoeXJLdlNLemxtb2RI?=
 =?utf-8?B?M2ZvdFVabTg3VHVDbGlmSFVlM1crclVpTDFLdWI5cWUvK0lGeC9pbkMrSkV5?=
 =?utf-8?B?eU1BYXZhMXNVdlFQS3dzNXF3NktwMHREaVpLZVg5QjBLVjRob01mbDJ4T3Av?=
 =?utf-8?B?dXRxcWduanp0NXVvK1ZxVVhCZWFPTThjRGlpb2Z5S1pjTGpGR242eEtQWUtt?=
 =?utf-8?B?dm00Qm85MGRyM2NORXBzbk5YbmRtaVZwL1hzSVU2WFZybE9Ecm5OQm4yT0dl?=
 =?utf-8?B?cDVMNmpPaVdaMldicmVvZUlsWDl1Z01JQW52bmFLbktNMk53R28yVTVVT1Vo?=
 =?utf-8?B?K2pnVjhVcmpRSTd4UFJnT2pkUDhYZ1FHenhjTGRyS1RoTlNXMXc1UU9mMUZ5?=
 =?utf-8?B?U1lkOXN4YWZHemlqbzk0WkRuaGRwY2tST2FGQzgrQWh6bVBldU8zL2ZYWk14?=
 =?utf-8?B?ZXV0S0s1RWxWRVNYSGVEUUhqb3FrKzBDZmpIVzlpbG1SWnpNRjZRZ0hodHVw?=
 =?utf-8?B?U1BvUHV5d1RPSEkzeVpxZjhqUlF6QXROaytvTU5PODdvVXM5WWptaUNJUVMw?=
 =?utf-8?B?OWF1eVBSaWwyN3Z1ZkdHS016VnJaQlZXUWlidXQwYlpGKzFyUjZYOElsTXdk?=
 =?utf-8?B?L053UFF1NnJocGl3TktPbDN5SUFZTHpDSmFHamY0ei9GYVMrQUhFREE4czRU?=
 =?utf-8?B?SHg1dXB1dGtuRm5CeU1EUnVNOWt4SWMxcXpxTXdUVUFxdlhHWTlBcmdEUTJr?=
 =?utf-8?B?NkhFeU02eDA3ME5PNUVpWllhaFk3ZW5hVGtNYkJvWjI4ZjNIVzB6VDhFanJJ?=
 =?utf-8?B?RmZZVUh4MnN2Ly90OWp3U1NORTQwTzJyNWpVMTlveit0S05LSUFLQ0txNzI4?=
 =?utf-8?B?UFQwN1VYRmlwY2EvNWdkc3FJY3JzV0wzd0dNdFlLU2Npa0VmaHU4UHBaZzJS?=
 =?utf-8?B?REdPNGs2cDlDSVcvaFQ0ekNIOG1LaHhvYVVWVTV5dWpYV1UxQlk2VGpVSnFO?=
 =?utf-8?B?akFqR3AvK2pQUU5HMHBZSWJtUmhQcGpUQm5RTll6VXVWaEJXUEpaR25QcXlG?=
 =?utf-8?B?bzVudTliTjlCbHl4QlhSd2VwNnVlTkV6WENPZ2x1VldadmQ4S1lHVDJtYU4x?=
 =?utf-8?B?SmJrODBQUG9oM0UzVzVnMGZwTE8wcExhUTdKWXJKdWJnZ1dlVGZZVHkvWGxD?=
 =?utf-8?B?cGxBamtDVmJzeld5ZGh5Tkt1WHZkc0luTWlYQkdUUW5wQmM5aytFQzJTa3ZP?=
 =?utf-8?B?K1pnbUg2TWd6QkxhTXplRVFRUUVzbzQvOTI2aGQ5YzV6aERrZGRYRlJEUndN?=
 =?utf-8?B?cWNKNVZOOW5lUGdrTHM2VXFvQWs2am9WSXp5a2tLcjQ2RGJqNkZyK1ZNK2t0?=
 =?utf-8?B?Y0FxZ3RtUzJFb2o4MDdEenJ3UDI5MDlnYkphNDF4THlEZHZkV0lvTktCTEFp?=
 =?utf-8?B?dm9QUUE5eDh1WWRkMTJDdzdrd0lQNjcxMko3ekxqenJWdjNSWUxSMTRNbXFC?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f03bc0-14ed-414e-e38a-08d99ab857ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 08:44:38.4571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOqwnQQmM1yAs2cf0SRALpDkaBDIKi/wfwNiVfKVKAZFw3xjvbkzw2Z8tJK1Vteq3g27VHXe3d4YitAXgJ+Bwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2563
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
T2N0b2JlciAyMiwgMjAyMSAxOjU5IFBNDQo+IA0KPiBPbiAyMS4xMC4yMDIxIDExOjU4LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4gPiB4MmFwaWNfYnNwX3NldHVwKCkgZ2V0cyBjYWxsZWQgYWhlYWQg
b2YgaW9tbXVfc2V0dXAoKSwgYW5kIHNpbmNlIHgyQVBJQw0KPiA+IG1vZGUgKHBoeXNpY2FsIHZz
IGNsdXN0ZXJlZCkgZGVwZW5kcyBvbiBpb21tdV9pbnRyZW1hcCwgdGhhdCB2YXJpYWJsZQ0KPiA+
IG5lZWRzIHRvIGJlIHNldCB0byBvZmYgYXMgc29vbiBhcyB3ZSBrbm93IHdlIGNhbid0IC8gd29u
J3QgZW5hYmxlDQo+ID4gaW50ZXJydXB0IHJlbWFwcGluZywgaS5lLiBpbiBwYXJ0aWN1bGFyIHdo
ZW4gcGFyc2luZyBvZiB0aGUgcmVzcGVjdGl2ZQ0KPiA+IEFDUEkgdGFibGVzIGZhaWxlZC4gTW92
ZSB0aGUgdHVybmluZyBvZmYgb2YgaW9tbXVfaW50cmVtYXAgZnJvbSBBTUQNCj4gPiBzcGVjaWZp
YyBjb2RlIGludG8gYWNwaV9pb21tdV9pbml0KCksIGFjY29tcGFueWluZyBpdCBieSBjbGVhcmlu
ZyBvZg0KPiA+IGlvbW11X2VuYWJsZS4NCj4gPg0KPiA+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFu
ZCBhbHNvIGZ1bGx5IHNraXAgQUNQSSB0YWJsZSBwYXJzaW5nIGxvZ2ljIG9uDQo+ID4gVlQtZCB3
aGVuIGJvdGggImlvbW11PW9mZiIgYW5kICJpb21tdT1uby1pbnRyZW1hcCIgYXJlIGluIGVmZmVj
dA0KPiBhbnl3YXksDQo+ID4gbGlrZSB3YXMgYWxyZWFkeSB0aGUgY2FzZSBmb3IgQU1ELg0KPiA+
DQo+ID4gVGhlIHRhZyBiZWxvdyBvbmx5IHJlZmVyZW5jZXMgdGhlIGNvbW1pdCB1bmNvdmVyaW5n
IGEgcHJlLWV4aXN0aW5nDQo+ID4gYW5vbWFseS4NCj4gPg0KPiA+IEZpeGVzOiBkOGJkODIzMjdi
MGYgKCJBTUQvSU9NTVU6IG9idGFpbiBJVkhEIHR5cGUgdG8gdXNlIGVhcmxpZXIiKQ0KPiA+IFJl
cG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IE91
Y2gsIGZvcmdvdCB0byBDYyBLZXZpbjsgbm93IGFkZGVkLg0KDQpSZXZpZXdlZC1ieTogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+IEphbg0KPiANCj4gPiAtLS0NCj4g
PiBXaGlsZSB0aGUgY2hhbmdlIGhlcmUgZGVhbHMgd2l0aCBhcGljX3gyYXBpY19wcm9iZSgpIGFz
IGNhbGxlZCBmcm9tDQo+ID4geDJhcGljX2JzcF9zZXR1cCgpLCB0aGUgY2hlY2tfeDJhcGljX3By
ZWVuYWJsZWQoKSBwYXRoIGxvb2tzIHRvIGJlDQo+ID4gc2ltaWxhcmx5IGFmZmVjdGVkLiBUaGF0
IGNhbGwgb2NjdXJzIGJlZm9yZSBhY3BpX2Jvb3RfaW5pdCgpLCB3aGljaCBpcw0KPiA+IHdoYXQg
Y2FsbHMgYWNwaV9pb21tdV9pbml0KCkuIFRoZSBvcmRlcmluZyBpbiBzZXR1cC5jIGlzIGluIHBh
cnQNCj4gPiByZWxhdGl2ZWx5IGZyYWdpbGUsIHdoaWNoIGlzIHdoeSBmb3IgdGhlIG1vbWVudCBJ
J20gc3RpbGwgaGVzaXRhbnQgdG8NCj4gPiBtb3ZlIHRoZSBnZW5lcmljX2FwaWNfcHJvYmUoKSBj
YWxsIGRvd24uIFBsdXMgSSBkb24ndCBoYXZlIGVhc3kgYWNjZXNzDQo+ID4gdG8gYSBzdWl0YWJs
ZSBzeXN0ZW0gdG8gdGVzdCB0aGlzIGNhc2UuIFRob3VnaHRzPw0KPiA+IC0tLQ0KPiA+IHYyOiBU
cmVhdCBpb21tdV9lbmFibGUgYW5kIGlvbW11X2ludHJlbWFwIGFzIHNlcGFyYXRlIG9wdGlvbnMu
DQo+ID4NCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21t
dS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUu
Yw0KPiA+IEBAIC0xODMsOSArMTgzLDYgQEAgaW50IF9faW5pdCBhY3BpX2l2cnNfaW5pdCh2b2lk
KQ0KPiA+ICB7DQo+ID4gICAgICBpbnQgcmM7DQo+ID4NCj4gPiAtICAgIGlmICggIWlvbW11X2Vu
YWJsZSAmJiAhaW9tbXVfaW50cmVtYXAgKQ0KPiA+IC0gICAgICAgIHJldHVybiAwOw0KPiA+IC0N
Cj4gPiAgICAgIHJjID0gYW1kX2lvbW11X2dldF9zdXBwb3J0ZWRfaXZoZF90eXBlKCk7DQo+ID4g
ICAgICBpZiAoIHJjIDwgMCApDQo+ID4gICAgICAgICAgcmV0dXJuIHJjOw0KPiA+IEBAIC0xOTMs
MTAgKzE5MCw3IEBAIGludCBfX2luaXQgYWNwaV9pdnJzX2luaXQodm9pZCkNCj4gPiAgICAgIGl2
aGRfdHlwZSA9IHJjOw0KPiA+DQo+ID4gICAgICBpZiAoIChhbWRfaW9tbXVfZGV0ZWN0X2FjcGko
KSAhPTApIHx8IChpb21tdV9mb3VuZCgpID09IDApICkNCj4gPiAtICAgIHsNCj4gPiAtICAgICAg
ICBpb21tdV9pbnRyZW1hcCA9IGlvbW11X2ludHJlbWFwX29mZjsNCj4gPiAgICAgICAgICByZXR1
cm4gLUVOT0RFVjsNCj4gPiAtICAgIH0NCj4gPg0KPiA+ICAgICAgaW9tbXVfaW5pdF9vcHMgPSAm
X2lvbW11X2luaXRfb3BzOw0KPiA+DQo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
dnRkL2RtYXIuYw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMN
Cj4gPiBAQCAtNzc3LDExICs3NzcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX2Rt
YXIoc3RydWN0DQo+ID4gICAgICBkbWFyID0gKHN0cnVjdCBhY3BpX3RhYmxlX2RtYXIgKil0YWJs
ZTsNCj4gPiAgICAgIGRtYXJfZmxhZ3MgPSBkbWFyLT5mbGFnczsNCj4gPg0KPiA+IC0gICAgaWYg
KCAhaW9tbXVfZW5hYmxlICYmICFpb21tdV9pbnRyZW1hcCApDQo+ID4gLSAgICB7DQo+ID4gLSAg
ICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gPiAtICAgICAgICBnb3RvIG91dDsNCj4gPiAtICAgIH0N
Cj4gPiArICAgIEFTU0VSVChpb21tdV9lbmFibGUgfHwgaW9tbXVfaW50cmVtYXApOw0KPiA+DQo+
ID4gICAgICBpZiAoICFkbWFyLT53aWR0aCApDQo+ID4gICAgICB7DQo+ID4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC94ODYvaW9tbXUuYw0KPiA+IEBAIC00MSw2ICs0MSwyNCBAQCBlbnVtIGlvbW11X2lu
dHJlbWFwIF9fcmVhZF9tb3N0bHkgaW9tbXVfDQo+ID4gIGJvb2wgX19yZWFkX21vc3RseSBpb21t
dV9pbnRwb3N0Ow0KPiA+ICAjZW5kaWYNCj4gPg0KPiA+ICt2b2lkIF9faW5pdCBhY3BpX2lvbW11
X2luaXQodm9pZCkNCj4gPiArew0KPiA+ICsgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICBp
ZiAoICFpb21tdV9lbmFibGUgJiYgIWlvbW11X2ludHJlbWFwICkNCj4gPiArICAgICAgICByZXR1
cm47DQo+ID4gKw0KPiA+ICsgICAgcmV0ID0gYWNwaV9kbWFyX2luaXQoKTsNCj4gPiArICAgIGlm
ICggcmV0ID09IC1FTk9ERVYgKQ0KPiA+ICsgICAgICAgIHJldCA9IGFjcGlfaXZyc19pbml0KCk7
DQo+ID4gKw0KPiA+ICsgICAgaWYgKCByZXQgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGlv
bW11X2VuYWJsZSA9IGZhbHNlOw0KPiA+ICsgICAgICAgIGlvbW11X2ludHJlbWFwID0gaW9tbXVf
aW50cmVtYXBfb2ZmOw0KPiA+ICsgICAgfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICBpbnQgX19pbml0
IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpDQo+ID4gIHsNCj4gPiAgICAgIHN0cnVjdCBJT19B
UElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMgPSBOVUxMOw0KPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvYWNwaS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hY3Bp
LmgNCj4gPiBAQCAtMTQxLDE2ICsxNDEsMTAgQEAgZXh0ZXJuIHUzMiB4ODZfYWNwaWlkX3RvX2Fw
aWNpZFtdOw0KPiA+ICBleHRlcm4gdTMyIHBtdG1yX2lvcG9ydDsNCj4gPiAgZXh0ZXJuIHVuc2ln
bmVkIGludCBwbXRtcl93aWR0aDsNCj4gPg0KPiA+ICt2b2lkIGFjcGlfaW9tbXVfaW5pdCh2b2lk
KTsNCj4gPiAgaW50IGFjcGlfZG1hcl9pbml0KHZvaWQpOw0KPiA+ICBpbnQgYWNwaV9pdnJzX2lu
aXQodm9pZCk7DQo+ID4NCj4gPiAtc3RhdGljIGlubGluZSBpbnQgYWNwaV9pb21tdV9pbml0KHZv
aWQpDQo+ID4gLXsNCj4gPiAtICAgIGludCByZXQgPSBhY3BpX2RtYXJfaW5pdCgpOw0KPiA+IC0N
Cj4gPiAtICAgIHJldHVybiByZXQgPT0gLUVOT0RFViA/IGFjcGlfaXZyc19pbml0KCkgOiByZXQ7
DQo+ID4gLX0NCj4gPiAtDQo+ID4gIHZvaWQgYWNwaV9tbWNmZ19pbml0KHZvaWQpOw0KPiA+DQo+
ID4gIC8qIEluY3JlbWVudGVkIHdoZW5ldmVyIHdlIHRyYW5zaXRpb24gdGhyb3VnaCBTMy4gVmFs
dWUgaXMgMSBkdXJpbmcgYm9vdC4NCj4gKi8NCj4gPg0KPiA+DQoNCg==

