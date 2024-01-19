Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B210E832C66
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 16:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669093.1041712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQqrY-00024W-8F; Fri, 19 Jan 2024 15:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669093.1041712; Fri, 19 Jan 2024 15:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQqrY-00021k-55; Fri, 19 Jan 2024 15:32:56 +0000
Received: by outflank-mailman (input) for mailman id 669093;
 Fri, 19 Jan 2024 15:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sEER=I5=amd.com=Alexander.Deucher@srs-se1.protection.inumbo.net>)
 id 1rQqrW-00020E-5N
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 15:32:54 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 014c24f5-b6e0-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 16:32:52 +0100 (CET)
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 15:32:47 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a952:d50:fdc8:fc95]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a952:d50:fdc8:fc95%7]) with mapi id 15.20.7202.026; Fri, 19 Jan 2024
 15:32:47 +0000
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
X-Inumbo-ID: 014c24f5-b6e0-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOIFn0yaO4gi00LF3nM//K6G3C8miP8XQCFu0NAZL7q6RixT+Q7FeKUrqDwAIQB6Y4RatJ7AVmlbn8/bBLJftg4DtNn+xm/xtnuzLaT1uJ4uoTuC1tHoXGgLw9unOfwzfRbs1n+TXR50/si7+1RQjy9rNRWz4tg/TKmvxC1LEe4be9lTFqWCoo2PasO9WdUJUchwCcU58S7Pgyczna7Bp7mDVNERMagfIVKQG9MOCU73FLOmYUwvgo8P/rhmlTL/Ajqf1ZejOtKDLc2jfApIfnUXWSgWcftxFKGoT+MYntfMJavKtbHmIF854pwOjUusCZWHVPEBROSXKOolJ11N1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYbkQ6Yk9IU2wc6hyxafh/dmr2i/NE1KhKtje5XXkNo=;
 b=VziPHhx2/s3ETF1RBr5ROG61EtRW41ojOgUu2MbwDo5toH1aPcZJGhpJMZn2q+VtRRPPV9Jb4AWem22VYHQduchmdplPQtkvkCl6Vp/2Hpa0ccDIRqT6HY3AERbb/v4fXkKEMcibz4aTrx2BO5WkCjF+qKzwms34eDr+TBaNvwUr41ZCkwT2GR0YNEymLQ1/9yBvBDpp2E6neVyKljlqT2VaeyqAq7AxyEiSI7NdCVjjxr/97pGJlsyNnXe8yOHiLKB77VByqLxx20CdLps9sg8a9InptEfdat8dVxd4qgIHWzRugmeysxcGcVVwzIjlao3aoDTZQXUj3dvVsR6qMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYbkQ6Yk9IU2wc6hyxafh/dmr2i/NE1KhKtje5XXkNo=;
 b=jaCfe++9uIO/TF11JR8NS202BePMsyaehEAzrdA4QV523AMIu+DYStPw2HtrNLFPhzZFdm5y3rLGeMyPgteDZH/licESkz0bpnOM/edbWtkAXi6XWWNQXJjXtoZijmmnSad++w0mNk81gkhtBcAtWBoAt8G1DgptpUidiuZCAjI=
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, Patrick Plenefisch <simonpatp@gmail.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: RE: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
Thread-Topic: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
Thread-Index: AQHaSr2NGOx+NLsdjUOezFAwCR0jIrDhQrdg
Date: Fri, 19 Jan 2024 15:32:46 +0000
Message-ID:
 <BL1PR12MB5144A6C412C9A9281A575AB6F7702@BL1PR12MB5144.namprd12.prod.outlook.com>
References:
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook>
 <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook> <ZakcdfS3UwEb0oh2@macbook>
 <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>
 <ZapG1weSIJWOkT8m@amd.com>
In-Reply-To: <ZapG1weSIJWOkT8m@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=425e5122-542d-4577-94a5-809511e34fa7;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-01-19T15:28:11Z;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CYYPR12MB8732:EE_
x-ms-office365-filtering-correlation-id: 06653dac-c25c-47e9-e053-08dc1903e368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LxnrtjZc1sgz6ct5gl5CglA59M6mmtmnLVTeBrIddhNvFwXabyYRr9swm9C5lEPQ+RIxO9ZnerLkqsJlpG1plvD2QyXJJfsB401+RPFEaoJGa07X/cstkjsHFsLLegu+CYhvjd0WxX3s/pdLFu7Zx+rD6iAICY3orFMSp/eEfBHiQTXsMsuHaqqmWl9YsANst3Jt9E1HUP13M+Y9VBHD15wtsRaGBhbKZi17Ykp1oUvmEX2mWtSf1ebro5+vdWvR3ytvhEwQ0lOJ3vxzeSZJq3Olm8R7+FcZ4Bz9BHFtweykqSzE61azxTKwRBTUhxCGakGabatL2mV+yNf5D+4GhSiJgYI+vfEB3KU1ebDa7DJMu3A6SVCQKgupplIOZxgE6xCZZ+xgixOOk42GB3+qL2nhlHnrxpKADzxMQ445OLjKQojaJBkiCdbKWdm38YUs1PnUJISsldoLoln+kEfUXXN3T95RuKHxPhVc080GtStkUiAgiR5X92W3AShsYPG9XzUgIBr8/MCED6uDBrzeLtxX6YPmkplBOHra4FCfMCebOLupm37tcHPMAoCIU3tsWAFJWEV8nU6IAVlllHofNfCQNaGrA76b8ScZoMqFBzeopt3yGJ9lweQCpepVJX72ev1vt9vvJofdNjo/79X/aZBdUEPr+mC0DJLvLHCL22MSGWn2Kn+j7RaQnL1PFWlc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5144.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38070700009)(55016003)(316002)(6506007)(52536014)(26005)(53546011)(7696005)(83380400001)(64756008)(76116006)(966005)(9686003)(71200400001)(54906003)(8936002)(66476007)(66446008)(110136005)(8676002)(4326008)(66946007)(478600001)(66556008)(122000001)(41300700001)(33656002)(5660300002)(86362001)(38100700002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWxDbWcvbWhmRlNCcWxQT29xM0FLcUx0OWgvUlN1M3JKYUZoYjdCeE53T0NG?=
 =?utf-8?B?RzlzZCswMzdpT2RGK3pLMGhkczV5MkRMY0VDeVlGLzJBbWFVYmV1dGZ5eFNC?=
 =?utf-8?B?dEVPTHZPMnhFOGlidFI4b2p4eWdaemNGSGdSZlhzUU5HSUpkZWZBUEExL2pa?=
 =?utf-8?B?MlBHaER5MnB4eS9yZG9ob0FPcDlJdFZGdi9mYi91eXhBNWNJQ25xTlhSdklz?=
 =?utf-8?B?eHRKeVpmZnB3T256SHJjWnFsOEFiT2tNdzU3MEdnMS9uZTc2Q0dqQWkxNVdz?=
 =?utf-8?B?Z1pPS0c4RzkycXZZcllLdXcxYXlMM3NZak1PWS9GV2tNRG9VdjRpU3lwQ293?=
 =?utf-8?B?MjNpRTN2enZObno5ZHRBTEt6UHkxNmp6L0ZPQW83bkUwQ05CdCs1Ry9wR2VQ?=
 =?utf-8?B?aUk3ZFpaQlNJc3JkeEJoQW9TTGVUS0NWVGxYR2xsaHNJYzJZbDI0cUJNM2hn?=
 =?utf-8?B?MHVNeDlpMCtHRzBRYllESjFkSk1IVUo1VXVlQUc0dGlaVjJ0V21TRjFoV3BR?=
 =?utf-8?B?N1AxdG5iOUdBWndRNmVwRnVteldyZ0VlekxhYVdXU0ptdFlhbEFxeUlDcjNh?=
 =?utf-8?B?cVI5QXJXa0dleURCUlVzdjI0bUtHay9jUTA5dmFVYi92dm5SZ2ZEUERFY1Y1?=
 =?utf-8?B?T04wQ0VIaDVhN3VxaUZZNkFYcURRR2hZOXc1N1VEWVdjVThydklZalJ4MXlF?=
 =?utf-8?B?RGgrMFVSdEtxaGlrR0xtK253dzAvWlVqQndEUWhIci8xTnZxdVZRY2p1TGFp?=
 =?utf-8?B?YVc3Q3NUU1AzMi9Wa0FZb1ptQjd4RzE2R1kvMm1EUzVYMmpKN3UyNXNtL2pO?=
 =?utf-8?B?WTJFS1FLZFdjd3ZhMUlQOVk1QmlqbjJTTzRvcGpUTGk5YWcrekhhK0RtS2JH?=
 =?utf-8?B?LzBiSit6TDArdlNTZVBpb2dXanQybTU5TmUyRDArRTFCQ0RqS2ZNK1UzV3JL?=
 =?utf-8?B?alVNNEJQcnl4eVc5R2FkV3RROGNZdDZpZVg3c3NpRklnM2tmQndVYko1Q2Ru?=
 =?utf-8?B?UDhqYVMzNk9Kc3ZWVUVoUzBiVWgwZDRuNmZlRmtLaUhQUmhkM2hHaXQ5WS9t?=
 =?utf-8?B?dVhmRGNCZ3dOZ0hCS0RjVndNdUVFYllYNkt5dVhjQzNjMlBYQnZKY2FFbC82?=
 =?utf-8?B?RDdUSEI2dU95dzdHdXdhNi94aEtKcnJNLzZBNnJUL3lWZFl5K0xkaEM3WTM4?=
 =?utf-8?B?VSt6emlZcTA0Q2NrK0lhYmdkMitSMmVmb3BhMGlZa0ErcFUwMVpHQTUvMEgx?=
 =?utf-8?B?Mm1URS9qOVczLzF4SFVUTG9PSUpCUVlwOUZFV0lQZ3phTEF0bldQN2pIQTFW?=
 =?utf-8?B?SzVhdCtVM29vbXhVVmxNT0pLZ01XOVBEN3NOVDlnMm50NHFZeXAwUlRyTDdF?=
 =?utf-8?B?RGN0akd0ZTFRakFrUUtOVldKMmwwdTE0M2dpNCsvZVhLRTd6TnNqZjJOUEYy?=
 =?utf-8?B?aU03R3pLd0hQdFhWY2tLczRCN1ZrbmdBL3RsSDArY2JCQW51bTAzT3VndjFo?=
 =?utf-8?B?RkxkQ2hYcmZPNS9venU2VGRrUEJBVXVUeWtSOXhnVGRseWhaTFFON3ErM00x?=
 =?utf-8?B?cWdSUXBoZ3RVNGNjZTNsekc4UmFMVHpPdFNlelF2N2kwOUR0U2x3MVJLZVIw?=
 =?utf-8?B?K3RhZU8xMzZnUXNNU21WUitickFieGdRSnhORklTNThmMFg3NDhzS2RQcGJ3?=
 =?utf-8?B?ejRtMnV3emE5M0d2WWRmMXAzSWRyaUdNNnBqN2oxbEpIUnh3YmNKOHFBaWVC?=
 =?utf-8?B?ckNzVHhXYmlXZWVkM21sSUxDWG1OM2JqUlVyY3JzMjd5SjZYTnBJMk1FZkFS?=
 =?utf-8?B?NTNpam8veXBaODFvb011WHpCMkc5MUdWWEZoR0dZN0FXdnUwUHpUeW92SnZ5?=
 =?utf-8?B?ZnQzbXhqcnFGRkhSSjZzbWVMSFRNY21DWGtoM0dsc3VaaTF1eksrczZUV0xr?=
 =?utf-8?B?Q0lnWEFEMkhQMWpiVFJSSWlXaFZaTjI0eXVhWTRvMWpXSTNNK240alBtZDRv?=
 =?utf-8?B?ZFQ2aTBHUk1iVTRvL2dGSm83MkdNVXN0NGs1RXp6T3JZREhzYTYvVHh4bzg0?=
 =?utf-8?B?MEU0TmNRTGJqREV5a2NBdHlCbGNZS0h3NkxzdkpkcFMydm5XVlpJZFlIUGEr?=
 =?utf-8?Q?QFB8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06653dac-c25c-47e9-e053-08dc1903e368
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 15:32:47.0148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCwgf1NEVZVGKS/OA4ErGHLNZ31D8aqFymNtivKm/IN3uetb51NQF52ic8DclDWWZwOQU1fLnzqaUju5N75yHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIdWFuZywg
UmF5IDxSYXkuSHVhbmdAYW1kLmNvbT4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDE5LCAyMDI0
IDQ6NTUgQU0NCj4gVG86IFBhdHJpY2sgUGxlbmVmaXNjaCA8c2ltb25wYXRwQGdtYWlsLmNvbT4N
Cj4gQ2M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSmFuIEJldWxp
Y2gNCj4gPGpiZXVsaWNoQHN1c2UuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
OyBKdWVyZ2VuIEdyb3NzDQo+IDxqZ3Jvc3NAc3VzZS5jb20+OyBDaGVuLCBKaXFpYW4gPEppcWlh
bi5DaGVuQGFtZC5jb20+OyBEZXVjaGVyLA0KPiBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBBQ1BJIFZGQ1QgdGFibGUgdG9vIHNob3J0IG9uIFBW
SCBkb20wICh3YXM6IFJlOiBFODIwIG1lbW9yeQ0KPiBhbGxvY2F0aW9uIGlzc3VlIG9uIFRocmVh
ZHJpcHBlciBwbGF0Zm9ybXMpDQo+DQo+IE9uIEZyaSwgSmFuIDE5LCAyMDI0IGF0IDAzOjQ0OjM1
UE0gKzA4MDAsIFBhdHJpY2sgUGxlbmVmaXNjaCB3cm90ZToNCj4gPiAgICBPbiBUaHUsIEphbiAx
OCwgMjAyNCBhdCA3OjQx4oCvQU0gUm9nZXIgUGF1IE1vbm7DqQ0KPiA+ICAgIDxbMV1yb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiAgICAgIEZyb20gdGhhdCBlbnZpcm9ubWVu
dCAoUFZIIGRvbTApIGNhbiB5b3Ugc2VlIGlmIHlvdSBjYW4gZHVtcCB0aGUNCj4gPiAgICAgIGNv
bnRlbnRzIG9mIHRoZSBWRkNUIHRhYmxlPyAgSSBkb24ndCBoYXZlIGEgc3lzdGVtIHdpdGggdGhh
dCB0YWJsZSwNCj4gPiAgICAgIHNvDQo+ID4gICAgICBub3Qgc3VyZSBpZiB0aGlzIHdpbGwgd29y
ayAoYmVjYXVzZSBpYXNsIGlzIHVubGlrZWx5IHRvIGtub3cgaG93IHRvDQo+ID4gICAgICBkZWNv
ZGUgaXQpOg0KPiA+ICAgICAgIyBhY3BpZHVtcCAtbiBWRkNUIC1vIHRhYmxlLmR1bXANCj4gPiAg
ICAgICMgYWNwaXh0cmFjdCAtYSB0YWJsZS5kdW1wDQo+ID4gICAgICAjIGlhc2wgLWQgdmZjdC5k
YXQNCj4gPiAgICAgICMgY2F0IHZmY3QuZHNsDQo+ID4gICAgICBXb3VsZCBiZSBnb29kIGlmIHlv
dSBjYW4gY29tcGFyZSB0aGUgb3V0cHV0IGZyb20gd2hhdCB5b3UgZ2V0IG9uIGENCj4gPiAgICAg
IFBWDQo+ID4gICAgICBkb20wIG9yIHdoZW4gcnVubmluZyBuYXRpdmUgTGludXguDQo+ID4gICAg
ICBJJ20gYWxzbyBhZGRpbmcgc29tZSBBTUQgZm9sa3MsIGFzIElJUkMgdGhleSBkaWQgc29tZSBm
aXhlcyB0byBMaW51eA0KPiA+ICAgICAgaW4gb3JkZXIgdG8gZ2V0IHNvbWUgQU1EIGdyYXBoaWNz
IGNhcmRzIHJ1bm5pbmcgb24gYSBQVkggZG9tMCwgbWF5YmUNCj4gPiAgICAgIHRoZXkgY2FuIHBy
b3ZpZGUgc29tZSBhZGRpdGlvbmFsIGlucHV0Lg0KPiA+DQo+ID4gICAgV2VsbCwgdGhpcyBpcyBw
cmV0dHkgd2VpcmQuIEknbGwgZ28gaW50byBtb3JlIGRldGFpbHMgYmVjYXVzZSBpdCBtYXkgYmUN
Cj4gPiAgICByZWxldmFudC4gSSBoYWQgYmVlbiB3b3JraW5nIHdpdGggQVNSb2NrIHN1cHBvcnQg
ZXZlciBzaW5jZSBJIGdvdCBteQ0KPiA+ICAgIGJyYW5kIG5ldyBtb3RoZXJib2FyZCBiZWNhdXNl
IEkgY291bGRuJ3Qgc2VlIHRoZSBCSU9TL1VFRkkgc2NyZWVucy4gSQ0KPiA+ICAgIGNvdWxkIGJv
b3QgdXAsIGFuZCBvbmNlIG5hdGl2ZSBsaW51eCB0b29rIGNvbnRyb2wgYW1kZ3B1IGdvdCB0aGUN
Cj4gPiAgICBzY3JlZW5zL2dwdSB3b3JraW5nIGZpbmUuIEkgZmluYWxseSBtYW5hZ2VkIHRvIGJl
IGFibGUgdG8gc2VlIHRoZQ0KPiA+ICAgIFVFRkkvQklPUyBzZXR1cCBzY3JlZW5zIGJ5IHBhdGNo
aW5nIG15IFZCSU9TOiBJIGV4dHJhY3RlZCB0aGUgVkJJT1MNCj4gPiAgICBpbWFnZSBvZiBhIGNo
ZWFwIFI1IDQzMCBPRU0sIHJhbiBHT1B1cGQgdG8gdXBkYXRlIHRoZSBWQklPUyBVRUZJDQo+ID4g
ICAgY29tcG9uZW50IChHT1ApIGZyb20gdmVyc2lvbiAxLjYwIHRvIDEuNjcuIFRoYXQgYWxsb3dl
ZCB0aGUgVUVGSSB0bw0KPiA+ICAgIGFjdHVhbGx5IGluaXRpYWxpemUgYW5kIHVzZSBhIHNjcmVl
bi4gSG93ZXZlciwgSSBsYXRlciByZWFsaXplZCB0aGF0DQo+ID4gICAgb25seSAxIG1vbml0b3Ig
d2FzIGxpZ2h0aW5nIHVwIGluIHRoZSBiaW9zOiBteSBtb25pdG9yIHBsdWdnZWQgaW50byB0aGUN
Cj4gPiAgICBSYWRlb24gUlggNDgwIHRoYXQgd2FzIHN0aWxsIG9uIFZCSU9TIEdPUCAxLjYwLiBJ
dCBhcHBlYXJzIHRoZSBHT1Agd2FzDQo+ID4gICAgaW5pdGlhbGl6aW5nIHRoZSBSWCA0ODAgdG9v
LCBkZXNwaXRlIG5vdCBiZWluZyBmbGFzaGVkIHdpdGggdGhlIGxhdGVzdA0KPiA+ICAgIGl0c2Vs
Zi4gSSBhbSB3b3JraW5nIG9uIGFuIGVtYWlsIHRvIGFzcm9jayBzdXBwb3J0IGFib3V0IHRoYXQu
IE9uY2UgSQ0KPiA+ICAgIGdldCBpbnRvIGxpbnV4IChuYXRpdmUgb3IgUFYpLCBib3RoIG1vbml0
b3JzIGxpZ2h0IHVwIGFzIGV4cGVjdGVkLg0KPiA+ICAgIEFsc28sIElmIEkgYm9vdCBsaW51eCBQ
VkggZnJvbSBncnViLCB0aGV5IGFsc28gd29yay4gVGhvc2UgdXNhZ2UNCj4gPiAgICBzY2VuYXJp
b3MgaGF2ZSBhY3BpZHVtcCBvdXRwdXQgYXMgaWRlbnRpY2FsLiBCb290aW5nIGxpbnV4IFBWSCBk
aXJlY3RseQ0KPiA+ICAgIGZyb20gVUVGSSAobm8gZ3J1YiksIHRoZSBtb25pdG9ycyBnbyB0byBz
bGVlcCBvbiB0aGUgUlggNDgwLCBhbmQgYW1kZ3B1DQo+ID4gICAgZXJyb3JzIG91dCBhYm91dCBW
RkNULCBidXQgdGhlIFI1IDQzMCBPRU0gZG9lcyBzdGlsbCBoYXZlIG91dHB1dC4NCj4gPiAgICBJ
bnRlcmVzdGluZ2x5LCB0aGVyZSBpcyBhIGRpZmZlcmVudCBzY3JlZW4gbW9kZSBib290aW5nIFVF
RkkrUFZILCB0aGUNCj4gPiAgICBjaGFyYWN0ZXJzIGFyZSBiYXNpY2FsbHkgc3F1YXJlcywgd2l0
aCBtb3JlIHZlcnRpY2FsIGxpbmVzIHRoYW4NCj4gPiAgICAiZGVmYXVsdCIsIG1heWJlIGNsb3Nl
IHRvIG5hdGl2ZSBzY3JlZW4gcmVzb2x1dGlvbiwgYnV0IGhvcml6b250YWxseQ0KPiA+ICAgIGl0
J3Mgc3RpbGwgImRlZmF1bHQiLiBCb290aW5nIGZyb20gZ3J1YiBnaXZlcyBldmVyeXRoaW5nIGlu
IHRoZQ0KPiA+ICAgICJkZWZhdWx0IiByZXNvbHV0aW9uLg0KPiA+ICAgIFNvIHdoYXQgaXMgaW4g
dGhlIFZGQ1QgVGFibGU/IFZGQ1QgY29udGFpbnMgdGhlIG5vbi1HT1AgVklPUyBpbWFnZQ0KPiA+
IG9mDQo+DQo+IFRoYW5rcyBSb2dlciB0byBpbnZvbHZlIHVzLiBUaGUgVkZDVCB0YWJsZSBpcyB0
byBleHBvc2UgdmlkZW8gQklPUyBpbWFnZSBieQ0KPiBBTUQgR1BVcy4gWW91IGNhbiBzZWUgZGV0
YWlscyBoZXJlOg0KPg0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzDQo+IC9ncHUvZHJtL2FtZC9p
bmNsdWRlL2F0b21iaW9zLmgNCj4NCj4gRGlkIHlvdSBhcHBseSB0aGlzIHBhdGNoPw0KPg0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMzAzMTIwNzU0NTUuNDUwMTg3LTIt
DQo+IHJheS5odWFuZ0BhbWQuY29tLw0KPg0KDQpWRkNUIGlzIGdlbmVyYXRlZCBvbiB0aGUgZmx5
IGJ5IHRoZSBzeXN0ZW0gYmlvcyBhdCBib290LiAgVGhlIHN5c3RlbSBiaW9zIGZldGNoZXMgdGhl
IFBDSSByb20gaW1hZ2UgZnJvbSB0aGUgQU1EIGRpc3BsYXkgZGV2aWNlcyBhbmQgdXNlcyB0aGVt
IHRvIHBvcHVsYXRlIHRoZSBWRkNUIHRhYmxlLg0KDQpBbGV4DQoNCg0KPiBUaGFua3MsDQo+IFJh
eQ0KPg0KPiA+ICAgIG15IFJhZGVvbiBSWCA0ODAgR1BVLiBZb3UgY2FuIGNvbXBhcmUgaXQgdG8g
dGhlIFZCSU9TIGhvc3RlZCBhdA0KPiA+ICAgIFsyXWh0dHBzOi8vd3d3LnRlY2hwb3dlcnVwLmNv
bS92Z2FiaW9zLzE4NTc4OS9tc2ktcng0ODAtNDA5Ni0NCj4gMTYwNzIwDQo+ID4gICAgKENvbXBh
cmUgdGhlIGVuZCBhdCBFNjY3IGluIHRoZSBWRkNUIHRhYmxlIHRvIEU1ZmYgaW4gdGhhdCB2Ymlv
cyBsaW5rKS4NCj4gPiAgICBJIGZpbmQgdGhpcyBleHRyYSBzdXNwaWNpb3VzIGR1ZSB0byB0aGUg
YWJvdmUuDQo+ID4gICAgTm93IGZvciB0aGUgZXh0cmEgaG9ycmlibGUgdGhpbmdzOg0KPiA+ICAg
IFVFRkktYm9vdGVkIFBWSCBMaW51eCBkb2Vzbid0IHN1cHBvcnQga2V5Ym9hcmQgZ2V0dHkgaW5w
dXQsIGFuZCBhdA0KPiA+ICAgIGxlYXN0IHNvbWUgb2YgdGhlIFVTQiBkZXZpY2VzIGFyZSBub3Qg
aW4gbHN1c2IuIEl0IGFsc28gZGVjaWRlZCB0bw0KPiA+ICAgIHZhbmlzaCBvbmUgb2YgbXkgSERE
J3MuIFRoZSBgcmVib290YCBjb21tYW5kIGhhbmdzLiBUaGUgUG93ZXIgYnV0dG9uDQo+ID4gICAg
ZG9lc24ndCBkbyBhbnl0aGluZy4gVGhlcmUgYXJlIHNldmVyYWwgc3RhY2sgdHJhY2VzIGluIGRt
ZXNnLiBCdXQNCj4gPiAgICBBbHQtU3lzUnEtQiBkb2VzIHJlYm9vdCEgTHVja2lseSBJIGNvdWxk
IHNzaCBpbiBhbmQgY2FwdHVyZSB0aGUgQUNQSQ0KPiA+ICAgIHRhYmxlcy4gVGhleSBhcmUgbXVj
aCBzbWFsbGVyLCBhbmQgVkZDVCBpcyBlbXB0eS4gIEJvb3RpbmcgYmFjayB0byBvbmUNCj4gPiAg
ICBvZiB0aGUgd29ya2luZyBzY2VuYXJpb3MgKGRpcmVjdCBsaW51eCwgR3J1YiBQViwgR3J1YiBQ
VkgsIFVFRkkgUFYpLA0KPiA+ICAgIGFsbCBvZiB0aGlzIGlzIG5vcm1hbC4NCj4gPiAgICBJJ3Zl
IGF0dGFjaGVkOg0KPiA+ICAgIHhlbmJvb3QubG9nIHdoaWNoIGlzIHRoZSBzZXJpYWwgbG9nIG9m
IHhlbitsaW51eCBib290aW5nIGluIFVFRkkgUFZIDQo+ID4gICAgKGtlcm5lbCBpcyBkZWJpYW4n
cyBjb25maWcsIGJ1dCBwYXRjaGVkIHRvIHN0YXJ0IGF0IDJNaUIpDQo+ID4gICAgZG1lc2cudHh0
IHdoaWNoIGlzIHRoZSBsaW51eCBkbWVzZyB0aGF0IGNvbnRhaW5zIHNvbWUgbmljZSBzdGFjayB0
cmFjZXMNCj4gPiAgICAoa2VybmVsIGlzIGRlYmlhbidzIGNvbmZpZywgYnV0IHBhdGNoZWQgdG8g
c3RhcnQgYXQgMk1pQikNCj4gPiAgICBlZmlwdmgtdGFibGVzLmR1bXAgaXMgQUxMIGFjcGkgdGFi
bGVzIGZyb20gVUVGSStQVkggbW9kZSAoYWNwaWR1bXAgLW8NCj4gPiAgICBlZmlwdmgtdGFibGVz
LmR1bXApDQo+ID4gICAgd29ya2luZy10YWJsZXMuZHVtcCBpcyBBTEwgYWNwaSB0YWJsZXMgZnJv
bSB0aGUgb3RoZXIgbW9kZXMgKGFjcGlkdW1wDQo+ID4gICAgLW8gd29ya2luZy10YWJsZXMuZHVt
cCkNCj4gPiAgICBlZmlwdmgtdmZjdC5kdW1wIGlzIGF0dGFjaGVkIGluIHNwaXJpdCwgYXMgaXQg
aXMgMCBieXRlcyBsb25nIChhY3BpZHVtcA0KPiA+ICAgIC1uIFZGQ1QgLW8gZWZpcHZoLXZmY3Qu
ZHVtcCkNCj4gPiAgICBJIHJhbiBpYXNsLCBidXQgaXQganVzdCBzYWlkICoqKiogVW5rbm93biBB
Q1BJIHRhYmxlIHNpZ25hdHVyZSBbVkZDVF0NCj4gPiAgICBhbmQgc3BhdCBvdXQgdGhlIHJhdyBk
YXRhIHRhYmxlLCBub3RoaW5nIGludGVyZXN0aW5nDQo+ID4gICAgU29tZXRoaW5nIEkgY2FuIHRy
eSwgYnV0IGhhdmUgYmVlbiBuZXJ2b3VzIHRvIHRyeSBkdWUgdG8gR09QdXBkDQo+ID4gICAgd2Fy
bmluZ3MgaXMgdG8gYWxzbyBmbGFzaCB0aGUgMS42NyBHT1AgdG8gdGhlIFZCSU9TIG9uIHRoZSBS
WCA0ODAuIFRoZQ0KPiA+ICAgIFI1IDQzMCBPRU0gaGFkIG5vIHN1Y2ggd2FybmluZ3MuDQo+ID4g
ICAgUGF0cmljaw0KPiA+DQo+ID4gUmVmZXJlbmNlcw0KPiA+DQo+ID4gICAgMS4gbWFpbHRvOnJv
Z2VyLnBhdUBjaXRyaXguY29tDQo+ID4gICAgMi4gaHR0cHM6Ly93d3cudGVjaHBvd2VydXAuY29t
L3ZnYWJpb3MvMTg1Nzg5L21zaS1yeDQ4MC00MDk2LQ0KPiAxNjA3MjANCg0K

