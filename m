Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A07FEC12
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644509.1005607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dZx-0004eA-VP; Thu, 30 Nov 2023 09:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644509.1005607; Thu, 30 Nov 2023 09:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dZx-0004bt-Sh; Thu, 30 Nov 2023 09:43:29 +0000
Received: by outflank-mailman (input) for mailman id 644509;
 Thu, 30 Nov 2023 09:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8dZw-0004bn-KH
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:43:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6ecb45b-8f64-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 10:43:24 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 09:43:19 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 09:43:19 +0000
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
X-Inumbo-ID: e6ecb45b-8f64-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+qTP9dSHl/2J7v7CQa3Drg24KbOvuUO8Qv5LOXIDu7yuQa23q7KwhQQqecHCXMIWAB4ogsKVbKboMN/GMDrNoUcQmmbv7uRmP8YkEMsVoho1WFpNXOyNaxBEUiGY2pbtWxZHHJidGRoDkYpqh+mm8wlmvJ20gSJdnnVn+TpM3xY8/N5gl86vpOmgwmo5WlwNVxfwy2mBSYrNwI0KlwzgN/yCKaY5B610551QskhYFEx8PkVRwIu/hDfENMNP/NGrcl5/rOJVuLA6r3v3gb+BURxbhyibY/Wex/12ziG/X3ss5VsTjqtJRC+/9YCjJ5RN5xISNDSdXXq3EOEjR6izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe4tqENU5MzyCC9x8UtifJ2XU21dom8gwnSeuZzyD8Q=;
 b=igSQQFN1QYiR/W3B7pnLlURiYQeyaxtMFlDrmiG4mzJ3/bRe7GZh5qMWdn1uF+SdPXvAG5tVxp66J9Yk5BSbk8hn3ZV+etKfB0shqt/LDgn2d07n/yhR8MJXHRc3P+X2SBJy0py2FQq3MzOTCE3iAjAm9IpnSpfcAy+xHd6GV6Il+D+xUZNzvMvtrpTTjzbmr2N0gJo+IZWssLsxXPGE+m2bP3JNfoKn0YbwJZOOG2FBuo+e4KPxWAQzYfMCpQ0XsmzCkA5MYRClfhqJoU91peqWqMlfelrZuQI+NCHkkI5PjTYpNdJEg4hvJ1bC1586gaTBr5dI0TRL67Ue1HTIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe4tqENU5MzyCC9x8UtifJ2XU21dom8gwnSeuZzyD8Q=;
 b=MlxYLrblnyRepJaHfmJHLbqQNGjDZhg+9Ti1mRwmxtRmG7y4zM4Qi0IDtByieQw3kCBxDZTBu4xsxRRbC9CsA5DElPrKTjd3SExXcnRAiwzoT+Y/S2wmhU/Ix1svqY06fo5CJ5PHlGj3X2F69icvuZVHYjVonhoUPeHr9SEqjII=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Topic: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Index: AQHaHsLnjKJ102tGrkSg9na/6oLNI7CP3bYAgAMYyID//6NpgIAAkSeA
Date: Thu, 30 Nov 2023 09:43:19 +0000
Message-ID:
 <BL1PR12MB5849197041595EFD70AE2E4DE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com>
 <fe8ee91c-7272-4cb9-b7a6-cb6ec7945bc1@suse.com>
 <BL1PR12MB5849B37472F195417B301A1EE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5d54a9e2-5363-4b7c-9902-d5523b3c54c7@suse.com>
In-Reply-To: <5d54a9e2-5363-4b7c-9902-d5523b3c54c7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB7565.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB5659:EE_
x-ms-office365-filtering-correlation-id: 4db5290a-6a54-4cd2-1d37-08dbf188c8ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fsk6M5ESnBr11xxJv1uTaSUpsjrBQAy5HP7bh+zpaFWGOw5bscivjweH6LBko9vQT5tu/n99BvfDM82RoHb+V5/KZSO3XHmIy/R4j58fv/+dTULagmLSHw512CJhXFvFBSvEOi8709UfBJ4xtgIL4Jhq5m5/B60rpSbVshOpVjAvSFLsAJeSIjuVxFdZwe3DVu/YDGYiECw0UDVfMoBHXdD0MKuzc2w/vJSnFzJVTG3IFhO0DtuEQfLzyjzLzbIHPPLS0Lgj0VpLmJEKzQ7510f7DQB3CTQDRuvjYU9f4B8ADkEOtvxCocbI+k8RnBCRW1jLG6oZ2WsbYad/37ndGkO1ixTqAm9t9YfUozmxBEBw1+Vqi4bDbZt//Pg0ogz0TElt19rIHW7Z8uyToKY7gQ6Ej+JPEhaRF1zkbPJmaGYXG/Wq9mFXjnpIkEpwW5wRTXFhfioRC051CTkdA05p+9aoVn12ak8mqTQdPHtZqzZ0maOVKN9vTCadn7T7LZbBwhs/dBYCEACE4XmapzgCK4HeTxq7UagbZQywMzJ7PVoE+mBxQgIuS9zO3aoqzOWkz8jo1MeoJ9BZ2tnZm4qvzowss9F8RhFEfq1XlEVCXBtgAJ5OG9IlKADezwmk+Q0v3/hmkX0PAKSvxpdhVPXrNzx0ZBa17p0aUCn4z31OU2OxweleN9IIODB8eLPD5ChI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38070700009)(6506007)(7696005)(53546011)(9686003)(26005)(71200400001)(83380400001)(202311291699003)(66476007)(66556008)(66446008)(4326008)(54906003)(316002)(55016003)(64756008)(6916009)(76116006)(66946007)(122000001)(38100700002)(5660300002)(33656002)(8676002)(8936002)(52536014)(478600001)(2906002)(41300700001)(340984004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFhzSWs3UnZYYW9tYmZScGF5Y01SOTJPR0g1czBZNTJxOXdhUWZaa29UVWsr?=
 =?utf-8?B?b3B0cUVZWFVpek95SXNYazBHelNuem0yLzNtY0VJS3FDdDl4YmRnN2VDeE9M?=
 =?utf-8?B?OUhRVjlxc045ZDQvOThTdlhmOXpidEFWdHhVSWlnUFZ5M2hyRlRib3dEa0lD?=
 =?utf-8?B?amRicUpLWU8yU1FSK2xQdzc5eVhoYnVseVJzQy9FaXp5NzA3d2hkc010dTQy?=
 =?utf-8?B?WVJ4US9wUGNaVjBSWG9oM09iYjZjUS9DRzBwQlBWbGM3cEZXQmY3a1B5V2NE?=
 =?utf-8?B?VlRPcHBSMEdyczlHV0VrYmdxYUgrbVo5M1dhM3l2bTdjVE54Y01sRURvbWd5?=
 =?utf-8?B?VlpqWVU0UWRWcjJ4ZFVCczFUNkxwckd5OVEwRm5GaEU3MnlZVjVBTEhQUzFO?=
 =?utf-8?B?OW9ScWtaSVEvUkxDcmVIblJ0ajJoY0dBSHdiNTVQYlZrZ2laTktERDRpK0hs?=
 =?utf-8?B?UXpzMUN4Umh0Y09aZXloNHM5SUw0NkROOFduYkoyaTVLWlZQSW5QVVpyY3lY?=
 =?utf-8?B?K3lLeFBqcnlWUndZcGJyWDd3cndHYlpNalQ4S3dXNEwyeHlsWDJuUlpTTFpF?=
 =?utf-8?B?ZUh6M3RUMHFKL3QwOXE1azBjSzhRRjcwWE8xNHVCQmFoUVdwSW9IWWExclNF?=
 =?utf-8?B?R0ZmMkYrV0lyalM3SE9HTXpaWTllcWNvZjY1Ty9IVjU1Q0RUOG1jcFFXMExz?=
 =?utf-8?B?RnFOZ1N3UEdwQmV0UitydGEvdTZqZW96WFBTOWxpY1Q3ZmpQYytCM3Q0MDNU?=
 =?utf-8?B?NXVUbWhXQ1dzdFhoZFd2REtRbitYeVBZVEM1eXB4UlMralJQTzc1VFI4S2Vy?=
 =?utf-8?B?R2RHREs2TnYxb2QzTTFJeFBsTWQ0cVVhQVUyYzlHaUlPeHh4YSswWGsxU1hO?=
 =?utf-8?B?T21HM0gwdG9oSU4zVzVKeThtZlpzb2kwSzU1UWdqSE1QTXgyNnhDaEROOW5x?=
 =?utf-8?B?NXA0UStHZitOcDI2V3o3NWM4RzJIMGJDU2RhUENzL1RKcHlHc2hZV1dxZld4?=
 =?utf-8?B?Q2lwTENNeE1pemJCUFlQSm1sZXNCVzA1WXE2azZBNVg0Y205bmMzSXVNbjQz?=
 =?utf-8?B?aUJUSFJkejVLSWRLS0dnR1BQamlxT3ZYcFJDWHhpR2tPdnJQWWpLalNRVHBj?=
 =?utf-8?B?bkxxRkVEU2I5UUhyb3FQTkNzSDRSVTdOVUswT054eUZQR3FRSE5lMHg1Yk1J?=
 =?utf-8?B?cEROdUZ0NjgwN1gwSDdxWjBsUWZtSEdhaW1xbHF3RHpHOWVhTFZuU3NGc3lE?=
 =?utf-8?B?MmZyMkhqSnE0LzN6ajR5dWVZZmJ6bXVwL2NKbU5EVkU5aVpDVzYyeXZLaFFk?=
 =?utf-8?B?REV5Yzk4M0hXVk5YU2pXa0NWdXA4SWorb1FyQU5FbWlDL0w4L2swUzA4YXlo?=
 =?utf-8?B?c01ZcEIvSk1lbm9NNFpNdW5PbzdsV2NLWUVLVFVYMWkrdTBWMmp5VXcxSlJu?=
 =?utf-8?B?Y09NeXRLbHZvTXM5QkJjdTlFTURzZ1FSSHhLS005VTg0a2NhcjZYL1FDbDhJ?=
 =?utf-8?B?WVd1emc4NlJMY0J1L2djSmpGU09jOHpKNHJmR21haXlhYXV1SE0vYzR5RWpH?=
 =?utf-8?B?UnpRdEtML295KzQ3K1U2bjJBUk5KcmNkWlRWbXhZVnVMZ1hubjZGTUE4dmpa?=
 =?utf-8?B?S0lhblRSOXZDU25pQUF3djY0d1pWZkF6TDdhZmFmWlFxYUdpcjV4WUoyTUU1?=
 =?utf-8?B?N05UYkUzVlVweHVMN1dvUlh2SFlKTFNwZ1F0VDN4ckYrcnhsdGJSL0FkSGMw?=
 =?utf-8?B?WnZqbGd4TGhFVmF6aldBL3hRdjRnRzlqZ0ZiTERqTWg4Ulk5MkNQanpwOXl5?=
 =?utf-8?B?V1RXcVBzbWlzTUpnZm9vTU5Ba1JtRzNrVEZPc295V0xpbzlWOFlwU2ExS25X?=
 =?utf-8?B?cWtwT1gvZzJYZWY5UUpvMHl4TDV1RlRMbUhQYlgzbEw3NlRuTytkYjg2WGU0?=
 =?utf-8?B?ZzBSaVlWZ1NZRVdGZlZjT1pjSWVtRkU3SDhhL29ZRElxNlJ3MUREM3dseWdr?=
 =?utf-8?B?QnkzUnpPa3RWWGhkenNqeGpIWXp0S3p1U0R2cGxJMzVic1FZQ3c4WWxNZVVJ?=
 =?utf-8?B?ZWtZcWJWeVdOR1dVRUF5WXZGWGFXVXY1VW5GSTlVcld5cDJqLzJnWG14amtU?=
 =?utf-8?Q?GY1w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <057583657491984799AD70F806EB4D81@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db5290a-6a54-4cd2-1d37-08dbf188c8ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 09:43:19.1783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctqkiR0Smc9GTXdGzKB5WEZfAXnl62jgGHZSiR56VyZRBySw+UifMRkNjOVrEh/GjBR6tauqyHR/hMf4UHJ2oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659

T24gMjAyMy8xMS8zMCAxNzowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDMwLjExLjIwMjMg
MDc6NDQsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjMvMTEvMjggMjM6MTQsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI0LjExLjIwMjMgMTE6NDEsIEppcWlhbiBDaGVuIHdyb3Rl
Og0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+Pj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4gQEAgLTc0LDYgKzc0LDggQEAgbG9uZyBo
dm1fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykN
Cj4+Pj4gICAgICB7DQo+Pj4+ICAgICAgY2FzZSBQSFlTREVWT1BfbWFwX3BpcnE6DQo+Pj4+ICAg
ICAgY2FzZSBQSFlTREVWT1BfdW5tYXBfcGlycToNCj4+Pj4gKyAgICAgICAgaWYgKGlzX2hhcmR3
YXJlX2RvbWFpbihjdXJyZCkpDQo+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4gICAgICBj
YXNlIFBIWVNERVZPUF9lb2k6DQo+Pj4+ICAgICAgY2FzZSBQSFlTREVWT1BfaXJxX3N0YXR1c19x
dWVyeToNCj4+Pj4gICAgICBjYXNlIFBIWVNERVZPUF9nZXRfZnJlZV9waXJxOg0KPj4+DQo+Pj4g
SWYgeW91IHdvdWxkbid0IGdvIHRoZSByb3V0ZSBzdWdnZXN0ZWQgYnkgUm9nZXIsIEkgdGhpbmsg
eW91IHdpbGwgbmVlZA0KPj4+IHRvIGRlbnkgc2VsZi1tYXBwaW5nIHJlcXVlc3RzIGhlcmUuDQo+
PiBEbyB5b3UgbWVhbiBiZWxvdz8NCj4+IGlmIChhcmcuZG9taWQgPT0gRE9NSURfU0VMRikNCj4+
IAlyZXR1cm47DQo+IA0KPiBUaGF0J3MgcGFydCBvZiBpdCwgeWVzLiBZb3UnZCBhbHNvIG5lZWQg
dG8gY2hlY2sgZm9yIHRoZSBhY3R1YWwgZG9tYWluIElEIG9mDQo+IHRoZSBjYWxsZXIgZG9tYWlu
Lg0KSSB3aWxsIGFkZCBtb3JlIGNoZWNrIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+PiBBbHNv
IG5vdGUgdGhhdCBib3RoIGhlcmUgYW5kIGluIHBhdGNoIDEgeW91IHdpbGwgd2FudCB0byBhZGp1
c3QgYSBudW1iZXINCj4+PiBvZiBzdHlsZSB2aW9sYXRpb25zLg0KPj4gQ291bGQgeW91IHBsZWFz
ZSBkZXNjcmlwdCBpbiBkZXRhaWw/IFRoaXMgd2lsbCBncmVhdGx5IGFzc2lzdCBtZSBpbiBtYWtp
bmcgbW9kaWZpY2F0aW9ucyBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFuayB5b3UhDQo+IA0KPiBX
ZWxsLCBpbiB0aGUgY29kZSBhYm92ZSB5b3UncmUgbWlzc2luZyBibGFua3MgaW5zaWRlIHRoZSBp
ZigpLiBQbGVhc2Ugc2VlDQo+IC4vQ09ESU5HX1NUWUxFLg0KVGhhbmsgeW91IHZlcnkgbXVjaCEg
SSB3aWxsIGNoZWNrIGFuZCBtb2RpZnkgYWxsIG15IHBhdGNoZXMgdG8gbWVldCB0aGUgWGVuIGNv
ZGUgc3R5bGUgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2Fy
ZHMsDQpKaXFpYW4gQ2hlbi4NCg==

