Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A777976AA40
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573748.898745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQk6o-0002VM-Ev; Tue, 01 Aug 2023 07:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573748.898745; Tue, 01 Aug 2023 07:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQk6o-0002Sl-Bm; Tue, 01 Aug 2023 07:47:58 +0000
Received: by outflank-mailman (input) for mailman id 573748;
 Tue, 01 Aug 2023 07:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUf/=DS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qQk6n-0002Pp-Ef
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:47:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b90983b2-303f-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 09:47:54 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB5PR08MB10253.eurprd08.prod.outlook.com (2603:10a6:10:4a9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 07:47:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 07:47:50 +0000
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
X-Inumbo-ID: b90983b2-303f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeirvmZiZ7WDdzazStfc62tJgsvzX7UctzCSxGQTNImyLiDolSiqU5frnPjoSAwz+G7hna4AWmVv4ibBtEgRItS+HujPQiz4DrDC3Hf8H1tQFm2PzVKuUS/9NC/hq7w/pBEuypUHeJXCyRXZgZhKTP4VpSsMp+J/jebcl4gviBmpLjncEPTgglLRGsv8zAvCt9cLZNrY/lMymrzLqRa2rTmcQBkIx34qr/A9YAZfYyxRKRgxhyGqMEzAouZDLXGrANb6KFadwvckvFF4DgTaJaHF0rR+yvaPN5JEeR4tQ/O2FP4SLg3Ljn3nWZ2ixTevweyL4tz7IVyLPz3rQ01sRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNATMOPwtM87R+WyTUp6C3cO2tvf2Vb4CWLLGaaKLWs=;
 b=j9vyPwt5vC8Dp7xYUNPcxptk0irot7tQhOFioYcGzgQitYD7/jIttA68AQ08cWmaaTnDP/md7W7pBSxLT+Fif6lHldcELzuq2DzMPiO2KoJrZBuoA9C1Qy3k2bUexwmYo0dDmlKkq/62Uuq/kpLBFOQkenMHjgs4z+8eKtVDutNAaTGYzKCEA4blcEbZtD+f3u0G2o5qJyF9s9saKUN5WRu9GVLzml+M2QSbc8rIAF9/cB/gEeqkNY5te9b4VkbEs43BOhVuF3jwfbLY8X9pmlhCmKLgcs+TW6SyVklMziL8m6EDBkka0hNiK0IXkk1dSGdqHLswK6W+N+CT8/bqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNATMOPwtM87R+WyTUp6C3cO2tvf2Vb4CWLLGaaKLWs=;
 b=tgQlgZtyCqRsoZeRy1hovUriwHih/Eu/7JX5QNhWvjdc1URKtLwMr+lnFBTSFu+jRrSGKbpSx0lq9AnSgcGkHvO369m37cLAThTVbkUr1sTLlZu4akCZig/AbfitJL2binUgedX0qGTMwccA/n7WPVeJj4SyCzjTE0DJcGXjgUI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Penny Zheng <Penny.Zheng@arm.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v4 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Topic: [PATCH v4 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Index: AQHZxCqigu1wJWpVm0KnP9vpRTw2qK/VD2mAgAAAHvA=
Date: Tue, 1 Aug 2023 07:47:50 +0000
Message-ID:
 <AS8PR08MB7991FD70B76D0D1677163816920AA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-14-Henry.Wang@arm.com>
 <6c8f904c-d7f1-343e-2208-6cf963e1e25c@suse.com>
In-Reply-To: <6c8f904c-d7f1-343e-2208-6cf963e1e25c@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2E810C11A217544F87D6BAE6ABBE4206.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DB5PR08MB10253:EE_
x-ms-office365-filtering-correlation-id: 5edf3944-023a-46e5-086a-08db92639b2a
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qSoqccTYZ1mU53IJYwZR2AEOyUAxHe5uPMpiZj5pCx3Q8WhpuW/jHiHLrbnBO58nOo6rAS8kVERyYDjuxfC4Eze+ojBroZa7AXv3GO219Vo1ezVlCNKhWkYlNVY6lIKzw9DiE5S+8U4lav5c5UpeCKSgM6E9hXXzpeqU3CdqhFkvs4rs9gMROYBqlhrk3rCYNf+Kz8sIFuC4ed7NAiAL+wlXdWwTAnKYheM0udWQexZKh4Z+tpOoFWa3YOkKvJDhVDQJ2ngK7ahDTeJ4ALXYYAYeDl2t+XDxKPKs5meNrUDOvX6D8QFf2M6ImsEvtxlY4S3Vu57jqmPkhWhTe2+///MNz17HGNApei09pYEEvRLu11ryJMdul6b3dFqW+GfAiAXxrXpqTQQpEnalf0lNCokH/DrrGS9aK66tCoflx7t05OBCy3boA1QnsTO2zXgmsCgRz+r3O0zIz26zgHYMwq+3A3FOM9HoKYxmJ2/BvoaqomsdCSENYp3QgWIHxcqXc9PJGGgWvnLqJwmHkjMitjNV8i8yO9BjyJr3pmxFcnRwa+ZkToxShe1+fcm0sEqKek+76MIfGEnEdqqwYS5bBjsbgfsoF9wNgF21ytvHrw075F6S0NjL1ww3MfGTYrQp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(38070700005)(8936002)(8676002)(7696005)(41300700001)(478600001)(2906002)(4744005)(83380400001)(26005)(316002)(186003)(86362001)(6506007)(5660300002)(76116006)(33656002)(38100700002)(122000001)(54906003)(9686003)(52536014)(4326008)(53546011)(6916009)(66476007)(71200400001)(66446008)(64756008)(66556008)(66946007)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wm9ORThPNEYza3dVZ3pvVmJYRTNTK3Bndk1veml2aWtRMVFMWDNiQXdjQW1P?=
 =?utf-8?B?VnlUQ1o3YUx0MUZzK2U2YVpYZUNDMkZ3aWl6SjRUbEtiSFdWNURhZzZ3Mzh5?=
 =?utf-8?B?LzBGc3hVbUVaVFpjV0FjMU16Z1ljZ0JzYnVVenkwODVjejNmR0FSVVlYT3RQ?=
 =?utf-8?B?TUJjdUsyK0VYNW9yMUFPQzZ2RkF3Snlmc0krMW9UNityVXdvM2sxL25hUU8w?=
 =?utf-8?B?VU9WSWVVUjFEdmpSeVlNUkhVVWtLajlySXNUZVhvWE4xV0NaeXBHMlpkKytP?=
 =?utf-8?B?RDFob2ptYUlveS96Vjd0SW9FNExmN2l2dnFkdzg2QVNwYzJ6RHowRGNtRkJX?=
 =?utf-8?B?V2tmL292M1dYdEplbTEyUXFxYTVIcEZWVjlKdHpIVi9kWkZ2aEhYRWZmNXJD?=
 =?utf-8?B?cms4VXI1L3UyK0RMazZBT3JBanNaRVNoMlJlaVJEZzdkWS9UTURSQm9jUUpU?=
 =?utf-8?B?S0pTeTVKT3lHMHVaNTF2NGFhYXd5MWppTEtlZ1FVdGo4VHVyNFhSQnZGT3pl?=
 =?utf-8?B?VjQ2TlA1ZVZpMSsrYTRaVUxmK2M5OXIvNjdmQXpBTThLWS9EdG1EVVVVQXFx?=
 =?utf-8?B?SGxFOHZNazh0bEw4cXhBSFhBZENxTk9CRnhMYndXanZRQnlwSGtwTkxGMGpD?=
 =?utf-8?B?WWc5dUhwcHVpY3dGUHFPdk9VdThERnErVXRERDQ1VEtMYlV4MXQ1RXJMS2x1?=
 =?utf-8?B?Syt2eXYzVnZxWndCcTBHbjBGWUs0bitYSVlHVDBNQ1NBVkdNQjdJN2pKMGhC?=
 =?utf-8?B?eWZsLytqc1Y1SHBlZlNRNWZJS2lrTEJzMVFZV2FiUFpaNG5xMkl6QmV6UFZ1?=
 =?utf-8?B?dW9PQ3ZGeitNUFg5RlhDL1d4R0JBL2MrZ1hTd2hUY3kxcFNDYmZyRW9ZTzYw?=
 =?utf-8?B?ZXVtM2cwRjNaQVBoekF6QmJVZHdicHNwbmtUYkpXcEFsd3VLVjM1QmozbDM2?=
 =?utf-8?B?SXd1c3U2cmtVYmpBUk5ZMnRMWDh4cjlzTjl0Ly9GMGt4SGh6Nkllc0VWMzdp?=
 =?utf-8?B?NWRLek00a3lqL3UyTlVPZW1QUS91RklUUVZpOUErVVpjVnFFL2FFWWgreEx4?=
 =?utf-8?B?WU5kUC85SHVLWEp6aFp4YlpmWmJPcHZwQ3VPMzEvTllHbXd2cW5Td1EwZXdv?=
 =?utf-8?B?OEpqaUF1cGVzSnpBT24rMEk0RHhiUnJBQWQxY1RWVFB6VXgybWdHUFVwdDRD?=
 =?utf-8?B?QU9ZY2l4Sk9oVW02bmxOVGM2SEZUTHBTWThFdEVtRmdCNlpqTC8zR2xPT09x?=
 =?utf-8?B?LzY5djZMY2FFRlQ4SDJVd05pblNiTTlGL0hvQ0h0TFBNWlFVR2JYTFJESklz?=
 =?utf-8?B?NU9OQXhtdGlkZWJaL3pnK2R6dW9zcE5YbFZTcnNRTW4vb2cwcklaUDlvRnFM?=
 =?utf-8?B?NkFYYUFBZmJ4UHgyVExYN2pSeUxKWFB1azlCdG5aNzZ2RFVYRTEyTlpYZ3ZQ?=
 =?utf-8?B?KzVJWjJWcGhnMW1aZFNBOGhrUHdXTDFBY2Y2bVVQUUQrbXVFY21obUN4SFdO?=
 =?utf-8?B?eWhuLzNlYzBlSWZGZzhpSk92YWFMdnJFWXFqK09UdlVqaFRiODh2Vmh3MjVG?=
 =?utf-8?B?NmppbTZoZ0ZJMTVVaXNuTFUzSWR1MStaUUIzeFEra3lRWFBsT3l5a1hCMFdZ?=
 =?utf-8?B?eUtoNnJvNVo2UjFxb3ZQK3NGTWcyTFRjZU1NenFVNUFQWmpRK0dSaWlRY1Z3?=
 =?utf-8?B?M2ZrNjB1b3F0bFRpSW1TeHhRMFFhT2V6TTg0VlNtNmNyTlI1UTkxYWZxRlM5?=
 =?utf-8?B?Y0VkaG9LSXVPTlRhb2trOHpNR2crTVNvVTJRRzJheFltbmxYOHNrYlZaRmFU?=
 =?utf-8?B?T3E2ODRRTS9nOEFOK3NGRXdpNkp6Ukt1OWdCcFZabzdHQkhheDNnZWx5WlhV?=
 =?utf-8?B?SW1BTEROWllmMkh2RHJ2ckUrN1NsR3M1cFRlVlF0UmtLaDZ6S2R2aUMzTDI3?=
 =?utf-8?B?QWFqN3ZpRFdxUXdjSUNhbkdGUEZDR3N4enlhTVJ0Nml5UTVsL1Q1eFl2cU9S?=
 =?utf-8?B?QmduTHJRL3l4T3FxOW9CZGJwcnQwVjhyN3BJQlNmbjVuV2FUek00bWtleldO?=
 =?utf-8?B?WERKMWhvM0kwWEpVRTUzZklBbm40OGJacHl0MThUVU5OQWRXSzdRK3dBblZu?=
 =?utf-8?Q?6N/0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edf3944-023a-46e5-086a-08db92639b2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 07:47:50.5536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0s5nzArrbLjKPyU2lpoG/kwlzbwLbdIIKr5iMRY+00T1kr94U/HwK51yoYJ7KobAXv+PDmXcnpt5GpCjkATzjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10253

KCsgSnVsaWVuLCBTdGVmYW5vLCBCZXJ0cmFuZCkNCg0KSGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTMvMTNdIHhlbi9hcm06
IG1tdTogZW5hYmxlIFNNTVUgc3Vic3lzdGVtIG9ubHkNCj4gaW4gTU1VDQo+IA0KPiBPbiAwMS4w
OC4yMDIzIDA1OjQ0LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IEZyb206IFBlbm55IFpoZW5nIDxQ
ZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiA+DQo+ID4gU01NVSBzdWJzeXN0ZW0gaXMgb25seSBzdXBw
b3J0ZWQgaW4gTU1VIHN5c3RlbSwgc28gd2UgbWFrZSBpdA0KPiBkZXBlbmRlbnQNCj4gPiBvbiBD
T05GSUdfSEFTX01NVS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5u
eS56aGVuZ0Bhcm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBh
cm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNv
bT4NCj4gDQo+IFdoaWxlIGVudGlyZWx5IEFybS1zcGVjaWZpYywgdGhpcyBsb29rcyB0byByZXF1
aXJlIGEgbm9uLUFybSBhY2s6DQoNCkV4YWN0bHksIHRoZSBkZWZhdWx0ICJDYzoiIGxpc3Qgd2Fz
IGZyb20gdGhlIGFkZF9tYWludGFpbmVycy5wbCBhbmQNCkkgbm90aWNlZCB0aGlzIHJpZ2h0IGFm
dGVyIHNlbmRpbmcgdGhlIHBhdGNoIG91dC4gSSB3aWxsIGFkZCB0aGUgQXJtDQptYWludGFpbmVy
cyBpbiB0aGlzIHJlcGx5IChzb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UgY2F1c2VkKS4NCg0K
PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFuayB5b3Ug
dmVyeSBtdWNoIQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

