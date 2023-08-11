Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE587787FE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582275.911934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMQN-0003Cn-D3; Fri, 11 Aug 2023 07:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582275.911934; Fri, 11 Aug 2023 07:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMQN-00039z-AL; Fri, 11 Aug 2023 07:19:07 +0000
Received: by outflank-mailman (input) for mailman id 582275;
 Fri, 11 Aug 2023 07:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKPh=D4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qUMQL-00039t-L1
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 589d9e6d-3817-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 09:19:02 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BN9PR12MB5275.namprd12.prod.outlook.com (2603:10b6:408:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 07:18:59 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::c838:299:8697:dd70]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::c838:299:8697:dd70%5]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 07:18:58 +0000
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
X-Inumbo-ID: 589d9e6d-3817-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKoVuY5xjgBEkcEz98reS+T0cRz5opLteF2+gkqYAHXTqW58pv/kwWjWAGsYi0MWUVLEdqT6M3MhqY+P68KjFJE9cr4LXTf0Wj32wV5LkOzaXk2VtNBlDomgu6wZ+f/bwSJ+KvzUIGJ6pfeE7ITycZYG6YTsa1ODQPv5QC7EoiUlnloN0vutcPzzfDrnpMap2VzTVGfwbIJyJhVjcu49loVaWPZa++zT2FrirSng8KoUp6x24Jw1JuTvAaLIYfhP786J7P+jYFT9wlPF9DZOHxx2nesHyUtwW4S8zj1xBEg6ap0EpFppGoNjw19pWUnBPKsoRyJ2LOoYVUFTpzbUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LQih2CHe0SY021lo2qYbsq9fAdP21DDwWynDZMOtY4=;
 b=FoIVQZZdqCDUXavnPvY4SQaEsOFbF/rEmr6vl1Eb/dvKDg85X8yA516zIAeMvJlGi5v+3To6irBA+EWD7ZMdj+Piv4lR+xGEKYNEyFP+DX+abcSYzUKVN/Gf83qhbO5w5w2Z7q1/bJXclzA34o64SXMzhlVY59reMeMKO90vk1gAukZ0sDq9mkcm5EP1oYXWjqkaDCfCaOXkXzbqyZY95yvIJ55Gpky2I6O+uSl+ken46GAOlt1qfysfOvLLf6YUHJjvbETDIJtd5xV2pyQW749+THk5k/ToHcdJoZSKcr6h97bsi5L4RQf+qXrCyFk14ALVKD0MlyI4iZ7hjCiyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LQih2CHe0SY021lo2qYbsq9fAdP21DDwWynDZMOtY4=;
 b=Z8ypf4lHxhPcupn6qpMpJr1bjJTAD3hh0H8Cm3a3dzDJUFK9+hTr5iaCtP8DAVWeigXy3nSw2DGvSNOPDnNBW7ltzrC+diUFEn5m9rOH0GlDlErjiUho2uW4cdbQSwg9yFZFX41io8Mfve77j1pb6Z+BSW0sXmM2qbNC+adAxmo=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
	=?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
	<Christian.Koenig@amd.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia"
	<Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH v4 0/1] S3 support
Thread-Topic: [QEMU PATCH v4 0/1] S3 support
Thread-Index: AQHZuwLsbW42un3+5UCTG4JhRKUU2a/lVBMA
Date: Fri, 11 Aug 2023 07:18:58 +0000
Message-ID:
 <BL1PR12MB5849DDF4A6734E5FEB4FB9B1E710A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20230720120816.8751-1-Jiqian.Chen@amd.com>
In-Reply-To: <20230720120816.8751-1-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.6678.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BN9PR12MB5275:EE_
x-ms-office365-filtering-correlation-id: 81742234-6698-4259-5e2e-08db9a3b3ae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 N9OeuV3Mf4KlK2+up39/ejMu0AkUVxQiKplm7kQS7b1njM+HHtrW5P2qYKIbCo4HCZGku7HpEI3Obx8DF0D5L3A03Tig8RMdMSSK6W2YcCrCXv/NUNu7E6Mag0TNIah7Mcs8beWBt8Sa/KQRpTzhewvHEOhcT/GYv2bc4KlNmEeRhohiYuu/RVFAht/j1KvVzGPgUaU1VFLjYT3g5nzOhqXz4PxArLcl4GrWv9ZjtVdM/DprV96Kvekb1OkckJmeZ0Jp22nr6RV43vU7NzEvQLXuYMLvY1xiCcw4it2PBr2KmDKF08Cz/+4mDuNvm8ojGs1DKbC47q9+TnWrKdYNL1t8+P0auxZYcukZ730HdP2acwZ/u37Nrn3Z95ItODvKa0BVM940TTODeUjqq8H0OvFYtyb3oUOG7uohfx5lemPJUZfB3R6w9SFxs22i7GXcrwmFmB+R+Q7SE+pQUJ6nzSQQj3Uc9g5/IprapnVw4oeAfq25ZCk4VJ3HtTw5NAiaKEpfY32mce8KwTEIXmLUyWLaE5NpX50VeudV1p+DRlliSlwhKaGTd2DROpy5sYH9Fbyi8gagJE8BRLY+kZWixEq0KrwDanLNSh5pd9DDDj/eX8lAfEbyq5uqMxKUC0NltfnFLdnTdsGJg9Q18a0Mng==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(346002)(376002)(396003)(186006)(1800799006)(451199021)(9686003)(966005)(33656002)(55016003)(38070700005)(122000001)(38100700002)(6506007)(53546011)(26005)(83380400001)(478600001)(110136005)(54906003)(71200400001)(7696005)(4326008)(316002)(41300700001)(8936002)(8676002)(76116006)(2906002)(7416002)(52536014)(64756008)(66446008)(5660300002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTJic25qVTUzT01tNmE2VlY1UlRXTWl4VE9rbUhsaGE3Z1dNazAzVGZVdGFP?=
 =?utf-8?B?L01Fb1NiblU1VGJ5bmN3bkI3YmVBTG9VZWZobGlHeFdMMlk4Qk1MUEY3Ukky?=
 =?utf-8?B?QUlHU1YrSjBYMzVXaTNxMkdkajlwZHFoRU84L2pDVGRRcCtxSk1RdWlabkdG?=
 =?utf-8?B?OUR3S3hMOVB4Z2xNZUFVTFJGUks2djZxMUJaS1ZuZEV2U3lML2oyY2h1TnJl?=
 =?utf-8?B?dUVZVGtYTXQvTWRDaEcxVnhWQ1hRYlIrL0xzUTRFeW1kOWdSMThtZmpqYnJw?=
 =?utf-8?B?TlZ0QWhpWUlma2IyU1U1bGZsVXROQzlxQlJSL2hVSVl1eHlIZFpjcml2TzRZ?=
 =?utf-8?B?REZscEVqbkZ4YnVSdTRzWGVON3Bra0EvWmpKMVlPbkQxMGw5OFdlalJiSEU4?=
 =?utf-8?B?RTFCS3diRmNkdFJLUGNjMUhYT05xTTc2TnArMnRSeXhWSXpwMHpHS3lsbUdU?=
 =?utf-8?B?RVhSQTdJL3lDTzQwUlNSTVY2Z0pkaXJWRDFSbStyR1pwdHFyZWhVSXlBYzUv?=
 =?utf-8?B?R1hUbkl5QkN4b0JJMmdtMUhjZC9DcStVMWY4eXNjK202UW5NUWFNcGhpcTdH?=
 =?utf-8?B?UnptamJlSFh6dHl3U3FUenpSUFliMTI4N2xkRHpBeUliNE5YRktEd3JLcDR4?=
 =?utf-8?B?UDhuSFRSWEZyVCthU1NBOVFNKzB3SG1RcVRiaC85WDRLREl6Vkd6YWpPUnVP?=
 =?utf-8?B?THRPbXlObHpGcU1VeWpvVFhNS0g1MEF1L2Uyd2R2RDlkMzNnWkFhMFNSK1RG?=
 =?utf-8?B?dEdhZGo1RVJ6K2lhaGw5SmhWempNSkpWbHNaSHZ2WTJnVDJJN1NXbUZ1Y2Y2?=
 =?utf-8?B?T0tBVUg5T1JyQklXUXphZkZmbEtXVHgyY29JeDdjRjdpMkJtdzBDL2grcDlz?=
 =?utf-8?B?d1FhQVpOanB1T2pHKytEWW9vK0pOa1lPdzZFdnZ2dGd1MGxkU3gyQWliRGFG?=
 =?utf-8?B?VEc2WWN1dWljZXZvN2xmd0svcDdGVU1XK2xLNzlxVWFiZC9CeEdQVXkyRncx?=
 =?utf-8?B?WC9nYUNSQXp6K3RxUDZ0SUNPZlRReEVTeFVkTmFsM3Q0UElLMURiNVVBVFRo?=
 =?utf-8?B?Zmlud1RsalZqQkQySHdibkdtL0VPSG41WjQ3a1VuN1BPdGtZMVFTblZXVERp?=
 =?utf-8?B?WDU2anlOZzFRZ2l0R3V3NC81MG9PQlN1angvWUFwQUw0RG5zSkRPN2pmZUk0?=
 =?utf-8?B?OFFQN3BmcFVLaTd0YkhzU0UvTFJIcVFmNXpYaGZNeHhkeCtnelhLbDh2d08v?=
 =?utf-8?B?U2sxY2M3amZ4Q3IyRlFCU0pqNUVNMWpiSkY2cnZsVytSUE1nQmt0enFuTzRI?=
 =?utf-8?B?QVBWYjRjMjRWZlpNdXpRVHJRQ0E5dGJ2S0o3aHo3ZjRoaHUzZE9oK29tZDlp?=
 =?utf-8?B?UW9LZnFhTVNLWjU5UGRlb2o2TDRsSEJnVVF2TkRnelpHamhJeHIxQnVSZnVU?=
 =?utf-8?B?MnVpdm9KNWdOZHd1ek1mSlBmMDJYbGRmMFhyMlE5bW42ZmtIUXo3cTE5aklM?=
 =?utf-8?B?OHdYSnVEM2R0cWJ4SWdvSWlpeGVXdC9XMENhVndtMDB6SmFuWllHSHYrTU9p?=
 =?utf-8?B?dTBCVjNiR2NqR1VEQ1VmcW9ONzVLOUNBVFlFdU1YVVhHbndNTEJJTXZNa1Fi?=
 =?utf-8?B?NEx4Q0N1UGt3MXV3TTFWV0hTZHN0RHYrc2pzRzFqd0JKenFyQkIxZjJ5WWNY?=
 =?utf-8?B?MDlJYTNSQkZidTRSMXplaDZUL3IxUUk3eG8wNERtVDVEK1AwNk4yQ29USlBV?=
 =?utf-8?B?T0YwV2o1K2wwZHkvZXFaVHJPSm5kcjFrbFRLa0NXcEZyYWxkejVzK2J5bU0z?=
 =?utf-8?B?bzNyTHlXTHZIbUhrZ3JHa1dnVHBBTzV2dzcvaVRndm5BODd6Umw3WFRtODVn?=
 =?utf-8?B?VlFGcGZ6RGtXbmdiVThJdzZzZHMyOGxiZDZUeXBlQ29Hak1ucEhqTkYwa1Zy?=
 =?utf-8?B?VnBWOHA1TUtIc0dwUkU2WjFrckxnT3NJanU0ZWVOMDZ0ME9naUFJY2VyeThX?=
 =?utf-8?B?aVN2RkNoSUxKRU9jcVlBU09JWkJwK1BnNXpRRjZGcTBKOEFCQUlvMU5Mdk1y?=
 =?utf-8?B?K3l4TGlDZzVXWTFJN2ZsRHV0VlMyY0g0cHBwdHpyZGhCblV4dmRFd1ZYOExn?=
 =?utf-8?Q?+dqU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AF8FD31EDE7924F81136788368059D2@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81742234-6698-4259-5e2e-08db9a3b3ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 07:18:58.4880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJDnZ36h02beMSJttSLOJtDR7kIEGOzJlXfr+h+LbCLdwegYJgO3PuI8irZiOYx0/SxQyI56eWLAJdPLqPfzjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5275

SGkgYWxsLA0KUGxlYXNlIGZvcmdpdmUgbWUgZm9yIGFza2luZy4gRG8geW91IGhhdmUgYW55IG90
aGVyIGNvbW1lbnRzIG9uIG15IGxhdGVzdCB2ZXJzaW9uIHBhdGNoZXMgYWJvdXQgdmlydGlvLWdw
dSBTMyBvbiBYZW4/IExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHJlcGx5Lg0KDQoNCk9uIDIwMjMv
Ny8yMCAyMDowOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+IHY0Og0KPiANCj4gSGkgYWxsLA0KPiBU
aGFua3MgZm9yIEdlcmQgSG9mZm1hbm4ncyBhZHZpY2UuIFY0IG1ha2VzIGJlbG93IGNoYW5nZXM6
DQo+ICogVXNlIGVudW0gZm9yIGZyZWV6ZSBtb2RlLCBzbyB0aGlzIGNhbiBiZSBleHRlbmRlZCB3
aXRoIG1vcmUNCj4gICBtb2RlcyBpbiB0aGUgZnV0dXJlLg0KPiAqIFJlbmFtZSBmdW5jdGlvbnMg
YW5kIHBhcmF0ZW1lcnMgd2l0aCAiX1MzIiBwb3N0Zml4Lg0KPiBBbmQgbm8gZnVuY3Rpb25hbCBj
aGFuZ2VzLg0KPiANCj4gbGF0ZXN0IHZlcnNpb24gb24ga2VybmVsIHNpZGU6DQo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA3MjAxMTU4MDUuODIwNi0xLUppcWlhbi5DaGVuQGFt
ZC5jb20vVC8jdA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBKaXFpYW4gQ2hlbi4NCj4gDQo+IA0K
PiB2MzoNCj4gbGluaywNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIz
MDcxOTA3NDcyNi4xNjEzMDg4LTEtSmlxaWFuLkNoZW5AYW1kLmNvbS9ULyN0DQo+IA0KPiBIaSBh
bGwsDQo+IFRoYW5rcyBmb3IgTWljaGFlbCBTLiBUc2lya2luJ3MgYWR2aWNlLiBWMyBtYWtlcyBi
ZWxvdyBjaGFuZ2VzOg0KPiAqIFJlbW92ZSBjaGFuZ2VzIGluIGZpbGUgaW5jbHVkZS9zdGFuZGFy
ZC1oZWFkZXJzL2xpbnV4L3ZpcnRpb19ncHUuaA0KPiAgIEkgYW0gbm90IHN1cHBvc2VkIHRvIGVk
aXQgdGhpcyBmaWxlIGFuZCBpdCB3aWxsIGJlIGltcG9ydGVkIGFmdGVyDQo+ICAgdGhlIHBhdGNo
ZXMgb2YgbGludXgga2VybmVsIHdhcyBtZXJnZWQuDQo+IA0KPiANCj4gdjI6DQo+IGxpbmssDQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMzA2MzAwNzAwMTYuODQxNDU5
LTEtSmlxaWFuLkNoZW5AYW1kLmNvbS9ULyN0DQo+IA0KPiBIaSBhbGwsDQo+IFRoYW5rcyB0byBN
YXJjLUFuZHLDqSBMdXJlYXUsIFJvYmVydCBCZWNrZXR0IGFuZCBHZXJkIEhvZmZtYW5uIGZvcg0K
PiB0aGVpciBhZHZpY2UgYW5kIGd1aWRhbmNlLiBWMiBtYWtlcyBiZWxvdyBjaGFuZ2VzOg0KPiAN
Cj4gKiBDaGFuZ2UgVklSVElPX0NQVV9DTURfU1RBVFVTX0ZSRUVaSU5HIHRvIDB4MDQwMCAoPDB4
MTAwMCkNCj4gKiBBZGQgdmlydGlvX2dwdV9kZXZpY2VfdW5yZWFsaXplIHRvIGRlc3Ryb3kgcmVz
b3VyY2VzIHRvIHNvbHZlDQo+ICAgcG90ZW50aWFsIG1lbW9yeSBsZWFrIHByb2JsZW0uIFRoaXMg
YWxzbyBuZWVkcyBob3QtcGx1ZyBzdXBwb3J0Lg0KPiAqIEFkZCBhIG5ldyBmZWF0dXJlIGZsYWcg
VklSVElPX0dQVV9GX0ZSRUVaSU5HLCBzbyB0aGF0IGd1ZXN0IGFuZA0KPiAgIGhvc3QgY2FuIG5l
Z290aWF0ZSB3aGVuZXZlciBmcmVlemluZyBpcyBzdXBwb3J0ZWQgb3Igbm90Lg0KPiANCj4gdjE6
DQo+IGxpbmssDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMzA2MDgw
MjU2NTUuMTY3NDM1Ny0xLUppcWlhbi5DaGVuQGFtZC5jb20vDQo+IA0KPiBIaSBhbGwsDQo+IEkg
YW0gd29ya2luZyB0byBpbXBsZW1lbnQgdmlydGdwdSBTMyBmdW5jdGlvbiBvbiBYZW4uDQo+IA0K
PiBDdXJyZW50bHkgb24gWGVuLCBpZiB3ZSBzdGFydCBhIGd1ZXN0IHdobyBlbmFibGVzIHZpcnRn
cHUsIGFuZCB0aGVuDQo+IHJ1biAiZWNobyBtZW0gPiAvc3lzL3Bvd2VyL3N0YXRlIiB0byBzdXNw
ZW5kIGd1ZXN0LiBBbmQgcnVuDQo+ICJzdWRvIHhsIHRyaWdnZXIgPGd1ZXN0IGlkPiBzM3Jlc3Vt
ZSIgdG8gcmVzdW1lIGd1ZXN0LiBXZSBjYW4gZmluZCB0aGF0DQo+IHRoZSBndWVzdCBrZXJuZWwg
Y29tZXMgYmFjaywgYnV0IHRoZSBkaXNwbGF5IGRvZXNuJ3QuIEl0IGp1c3Qgc2hvd24gYQ0KPiBi
bGFjayBzY3JlZW4uDQo+IA0KPiBUaHJvdWdoIHJlYWRpbmcgY29kZXMsIEkgZm91bmRlZCB0aGF0
IHdoZW4gZ3Vlc3Qgd2FzIGR1cmluZyBzdXNwZW5kaW5nLA0KPiBpdCBjYWxsZWQgaW50byBRZW11
IHRvIGNhbGwgdmlydGlvX2dwdV9nbF9yZXNldC4gSW4gdmlydGlvX2dwdV9nbF9yZXNldCwNCj4g
aXQgZGVzdHJveWVkIGFsbCByZXNvdXJjZXMgYW5kIHJlc2V0IHJlbmRlcmVyLiBUaGlzIG1hZGUg
dGhlIGRpc3BsYXkNCj4gZ29uZSBhZnRlciBndWVzdCByZXN1bWVkLg0KPiANCj4gSSB0aGluayB3
ZSBzaG91bGQga2VlcCByZXNvdXJjZXMgb3IgcHJldmVudCB0aGV5IGJlaW5nIGRlc3Ryb3llZCB3
aGVuDQo+IGd1ZXN0IGlzIHN1c3BlbmRpbmcuIFNvLCBJIGFkZCBhIG5ldyBzdGF0dXMgbmFtZWQg
ZnJlZXppbmcgdG8gdmlydGdwdSwNCj4gYW5kIGFkZCBhIG5ldyBjdHJsIG1lc3NhZ2UgVklSVElP
X0dQVV9DTURfU1RBVFVTX0ZSRUVaSU5HIHRvIGdldA0KPiBub3RpZmljYXRpb24gZnJvbSBndWVz
dC4gSWYgZnJlZXppbmcgaXMgc2V0IHRvIHRydWUsIGFuZCB0aGVuIFFlbXUgd2lsbA0KPiByZWFs
aXplIHRoYXQgZ3Vlc3QgaXMgc3VzcGVuZGluZywgaXQgd2lsbCBub3QgZGVzdHJveSByZXNvdXJj
ZXMgYW5kIHdpbGwNCj4gbm90IHJlc2V0IHJlbmRlcmVyLiBJZiBmcmVlemluZyBpcyBzZXQgdG8g
ZmFsc2UsIFFlbXUgd2lsbCBkbyBpdHMgb3JpZ2luDQo+IGFjdGlvbnMsIGFuZCBoYXMgbm8gb3Ro
ZXIgaW1wYWN0aW9uLg0KPiANCj4gQW5kIG5vdywgZGlzcGxheSBjYW4gY29tZSBiYWNrIGFuZCBh
cHBsaWNhdGlvbnMgY2FuIGNvbnRpbnVlIHRoZWlyDQo+IHN0YXR1cyBhZnRlciBndWVzdCByZXN1
bWVzLg0KPiANCj4gSmlxaWFuIENoZW4gKDEpOg0KPiAgIHZpcnRncHU6IGRvIG5vdCBkZXN0cm95
IHJlc291cmNlcyB3aGVuIGd1ZXN0IHN1c3BlbmQNCj4gDQo+ICBody9kaXNwbGF5L3ZpcnRpby1n
cHUtYmFzZS5jICAgfCAgMyArKw0KPiAgaHcvZGlzcGxheS92aXJ0aW8tZ3B1LWdsLmMgICAgIHwg
MTAgKysrKysrLQ0KPiAgaHcvZGlzcGxheS92aXJ0aW8tZ3B1LXZpcmdsLmMgIHwgIDcgKysrKysN
Cj4gIGh3L2Rpc3BsYXkvdmlydGlvLWdwdS5jICAgICAgICB8IDU1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0NCj4gIGh3L3ZpcnRpby92aXJ0aW8uYyAgICAgICAgICAgICB8ICAz
ICsrDQo+ICBpbmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8tZ3B1LmggfCAgNiArKysrDQo+ICA2IGZp
bGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

