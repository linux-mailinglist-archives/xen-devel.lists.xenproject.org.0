Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A374360F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 09:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557342.870608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8p4-0000ZS-3H; Fri, 30 Jun 2023 07:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557342.870608; Fri, 30 Jun 2023 07:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8p4-0000XH-0a; Fri, 30 Jun 2023 07:45:42 +0000
Received: by outflank-mailman (input) for mailman id 557342;
 Fri, 30 Jun 2023 07:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DkL4=CS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qF8p2-0000X8-AZ
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 07:45:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a166b74-171a-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 09:45:38 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 07:45:34 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989%4]) with mapi id 15.20.6521.023; Fri, 30 Jun 2023
 07:45:33 +0000
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
X-Inumbo-ID: 1a166b74-171a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBWd/iGfDuQ1vCALf2nrRXKUoQsUMIjB+jgQnQFy6VzLz/TJYYRpVIPNnW8EE+9tYse5RcW30llxU5iRedj4E2++r+i6ivreWpIWhXcSsuqeErZQQhvIP1HQm4V5Hgpub+ycRtnKgaNIclCmpDxx3x5oRRPAjRgBRbmMPyMPyelsQsIOJCk+EvsqB43lafNfdP4efnOPRFQKt8MVAOKDNj4TVQ9lcBeJ9z6524v4v4T01ur9A0LspsrIY0qYwJyhUnclgKcG+LpT9sYY6WNgwwqt3x4xODHuAFYtfu5QYrhnB4CTBXidfRyLuxJephGSaE4qsLqMZKWQL5rjydmSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5XBJlMh0mer4m//UExG/U+rMPTsoz1kV1NBeRFIpME=;
 b=GaDWTGgaCDM7VVMf5/HDRXMOsw3mS8XjXBcHhJ7DraeMstp86xDrV8dN6n3om0H4YyofVgYHgfq1qhGS+YN37VD5mZ4NdiaEz5O7ZHxMEDwBLxabMn03Of2xaEAQAgxufbr7RTbvdMJ3/zoDemfVla1xp/4dL5e1bfmR7NrW1B/tRibupe5dtpoEJDXHGS1iOeaRo8EGpMIfjuhz/30RX/T4U9CogoUsmNqQ9z2OLYfTHbvqPAscrYSjXutPjHPxuBNIlH6S8y6HN7GaPUbBjS6M+WvZ5Y/L7BOk5WzeYNRfSDph43CdKjJYtQbcSyuwceRunz5/WHJK/vfiPByG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5XBJlMh0mer4m//UExG/U+rMPTsoz1kV1NBeRFIpME=;
 b=IU0KTwymoZiQUjcI/5/cbErH2VvqLpvV8y1WE4YX2rK5UOqdHHhwxjFfEvX/fYEMY00WJwqcb9+8aVgQNo3jY0vR4UxLQOS3Wr2uRxS7NYMLfIZ95+Be3H61jtySgjSZml2ol52e3eL+xcy9yfAsRGswh450yeBocHLpiWSEJqc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?=
	<marcandre.lureau@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
	<Christian.Koenig@amd.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia"
	<Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v2 0/1] S3 support
Thread-Topic: [QEMU PATCH v2 0/1] S3 support
Thread-Index: AQHZqyDdy1wUVG6tEUGOPQRLuORcNq+jfWEA
Date: Fri, 30 Jun 2023 07:45:33 +0000
Message-ID:
 <BL1PR12MB5849EDF905908165A4C9E57CE72AA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20230630070016.841459-1-Jiqian.Chen@amd.com>
In-Reply-To: <20230630070016.841459-1-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN2PR12MB3037.namprd12.prod.outlook.com
 (15.20.6544.003)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB6309:EE_
x-ms-office365-filtering-correlation-id: b4a9ef2f-8f28-4bf3-7a35-08db793dfc79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DjVYzQ27hbDyi98RkqTGsS5ckKSSYmQDSS/hSrgMX209WJLeHbE+yhheeKNRW6RcZrHeLAyndr87So9EDzIgqatrJ87JIDDBJEkvGfb4IffIHyD0E4xElDjoIMCcZi/9mLcWJk8Ba5kDKbTRERb5wcSYfHj//OP2Pte3BC9jYY8zjQBraAdLJ9+4XQmJaxzNpyreFuGPUDuRwRMilQPgme+/AANVriTGYh8PozfblM8VcuFwvbHqPxVsji4SsREZCVrBoRkspGoPs8IwShgJyD3InPJGwFe7PdLXK5QpCypJt+GFVF2nS7Et37ETIGtyxIzOvTMAtFR5M35nu+SkYeVlukAwUVR+QJ6flNX6bpDezTuR/njEvnvDMf7+5o0/xctmjgV3QukYBWET7KjvnMI/1wLWD5RWRmsWnbOk/up13KSSZVRvlbp3nA4Hw7lVpg+2iuIEtK4IAFxluflLyfhW831vHlDutNVJfrA/2abQalAgsE9oc+LyKw5+sHvyBzPjoZYtH3cAyd+eQqSVLT34MKHnTBVtyqEhQty6piyRDlwP78CH6Fgu+R/ewNcxELRqC/sTsDb+PykseFxhNH8BSRv6au6aufgEQvYZydVw5MURtmfGR9i+aRUbrXYl4XaVPvbsU/xZzEYFYDvYoGrRJlsB9opWGyhJX+FBbZw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(83380400001)(38070700005)(2906002)(122000001)(38100700002)(921005)(55016003)(8936002)(8676002)(110136005)(5660300002)(52536014)(71200400001)(54906003)(966005)(41300700001)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(76116006)(316002)(7696005)(33656002)(478600001)(186003)(53546011)(9686003)(6506007)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnFsWFFkd1VuQUtnMW1VamVEODU0Snd1Lzc4aVNENXpaeU9ndmFPaDlVakVv?=
 =?utf-8?B?NGRCNnJ5elRaUzFZUDZibEcxRDVMM2cxRnpCVXVRM2pwS3o2NGhVTG9jUnBL?=
 =?utf-8?B?TThxNTZVZWtubS9ubFVNNU9mVm82YWdFL0YreWsvVkwxdjVsdDcrZ3hpcmJC?=
 =?utf-8?B?RnEvbnhhRjc1Ny9VTzNnclZzMEpzMVpEblplK250MHVxaXlvNzlYSUN1dDRW?=
 =?utf-8?B?Z0h6aE5vMFRsUndId2RVTmZPSmNuMUw4S3dyckNYM0Z5Y0dXSG0yNTZFUHFt?=
 =?utf-8?B?YUlHL29UdkljeGlyUkN4RG84VTZSOWpiRkVFREFQeXFIK1FOdWJGa1o1YjNY?=
 =?utf-8?B?NzNYM1dsZXBuTkFkTFpuVDVLZUhhTTR6MlFLZTJhbkJZNGpqYTd5SVB6OGVF?=
 =?utf-8?B?K2FlMndkNVplOU9aRDZ5Sy9xQmtQVkM0TVdscEJpS1dSYysrVnpLRFNlNlZ5?=
 =?utf-8?B?a1pTSFVJYzF1QjFZamZsdk5HR1U1bTAxQUxFMGpFb241L2R4L2ZhUUlLeXFF?=
 =?utf-8?B?VWdXZThZSmh2NW9GK0F0eVJQYStSY3dJNjVFN0dTaHVZR0VFUjNxWGV5M0l2?=
 =?utf-8?B?cHNtR2dZUkFKalBJZlRjOVFBTlNscGNYT0pFVjh1cndrMEEzcE9pWVdvSkYy?=
 =?utf-8?B?MnBZWFRWV1FxemduYVFZMENYaTRGTWtobWdUVjAwcFREdHV2RmJPWTFYRmM2?=
 =?utf-8?B?NG1vMWx5L3htZnpHZE5zeGI5Zzd1Uk5WSnlvS3R1MkhpSXhxMzdSSWJ6UCtB?=
 =?utf-8?B?V3dlMnMza1c2cCtyREtWVzhoeHR2ZmpnTktzQXEwVmw5a0VjeHk1VjMxQ2ZR?=
 =?utf-8?B?RHRhNzhoaUFsbDlDUVk3WDdoL0czK016bjlKMk10Q0xUNGlFbWNMQnd4UG5B?=
 =?utf-8?B?VTY5MkUvbXdZSUV1VzN0MENPM0tsTDBrZlA2YTlRNEFOT0IxRzRFTWM2RFV6?=
 =?utf-8?B?bWxaM0NwNk00OG84ZmV4YjdPOTZjNC9vbkhSMGZZcVUzZWgxdG5uUkNoTy8w?=
 =?utf-8?B?Rzc1ekRQVjBhRjlpQ0x5SHFOQS9ROEc1aTlzS0NPU0tJVHFQS1BuRU1CK0hD?=
 =?utf-8?B?dzRWSTBpNTNsVktQdURoUzd3d05LNldtY21pdk1aQzNSaENMT3NSMGY2bTUy?=
 =?utf-8?B?SWRoYnZzOEMyN1h0S3FqdEFiazhBMk0ya1hKRVN0YXFyYzFCUFQ0NXA3dVIx?=
 =?utf-8?B?cnBiRlU4bDllTkJTOERsU0tGK1c3NkxTVUU4dWR2aVU2aEVieXd0dkx4NlRO?=
 =?utf-8?B?VW9oL0UyTmg0b21KNlRxLzF0b29uUW5FYitxeFMwc1lEeG55ckdwUjc0NUVL?=
 =?utf-8?B?S0V0MXZVRUo5N2RudGEyNVFUMnZROGgzOHFRcVJSUjU4dWVOL01qRkl2bVhB?=
 =?utf-8?B?TVB1Q2h1UW1iNlMzRVBHQlQ1OC9LdnBWKzc2bjhRYWRFMzZiTG9pZUVjcnRp?=
 =?utf-8?B?ekF4QjdOcFNpVVZWaGhuL0tIN255b2ViK0c0SmVrbVNHR0FMRmhjdU9ZT2Zq?=
 =?utf-8?B?WGpheXR4b1dOTlpRZXk1akpqVlE5MTVyVVRXS21OVlRNMVdTN3B6YkVEZDEr?=
 =?utf-8?B?WWpLdFh4WkF6UzlpVGVpRTFncEM5TU5VdS9kM0NEWTUrcHIxWGtFelRhRFFy?=
 =?utf-8?B?bWtTWDRZZ3dFcTRBWEJPbGdNME1yY3dHY3FXQkxzMWU3MUF1UnZlbjBET2FL?=
 =?utf-8?B?Q1FMMHlrczRJa1BqczRZZjA0cUNyVWs4MncxZDVHOWFtdFA1NXJqVXpLYXVa?=
 =?utf-8?B?QWZWK2x2OHF1a3dpM1RxN3FSOWVhTUxoM3VZME9SSjNJR2hZRG1JS3RqQzBh?=
 =?utf-8?B?NDV6eHVBUFhDYkU1Vmw3UVhtRDh3cTRXQnBMa2s0WEUwQytpN1FhNUR6elpY?=
 =?utf-8?B?aGRDUWpFUzRRQTlhTXhHNjdKYUUxUWtjL3BheUlWVnB6a0RTZ2ZTK2JHR2p0?=
 =?utf-8?B?YWlzaEJZZkkvOEN0SENUcHdyK1ozVFZYMEY0Um5hZisySzdmSi82MTlMU0FR?=
 =?utf-8?B?YWVJRFFjNE9XR0NpNnRSelc4eU44V3Q0QURQZHNjaHEybC9ER2szMVNYckds?=
 =?utf-8?B?R0djQm0zNWpFWlkxOG1KRzR1REdrS1VzV29RQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4ED027EC8635C545AE1071E30B736088@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a9ef2f-8f28-4bf3-7a35-08db793dfc79
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 07:45:33.8464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2vLKsq4vwhPf7/C2ektStC/poEdYLkARXe5il35+IM7PLjKEivFnbapD5gir1Btf1u2hmMLhBD/D7Y2ZPMWDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

SGkgYWxsLA0KDQpWMiBwYXRjaCBvZiBrZXJuZWwgaXMgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIzMDYzMDA3MzQ0OC44NDI3NjctMS1KaXFpYW4uQ2hlbkBhbWQuY29tL1QvI3QuDQoN
Ck9uIDIwMjMvNi8zMCAxNTowMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+IHYyOg0KPiANCj4gSGkg
YWxsLA0KPiANCj4gVGhhbmtzIHRvIE1hcmMtQW5kcsOpIEx1cmVhdSwgUm9iZXJ0IEJlY2tldHQg
YW5kIEdlcmQgSG9mZm1hbm4gZm9yDQo+IHRoZWlyIGFkdmljZSBhbmQgZ3VpZGFuY2UuIFYyIG1h
a2VzIGJlbG93IGNoYW5nZXM6DQo+IA0KPiAqIENoYW5nZSBWSVJUSU9fQ1BVX0NNRF9TVEFUVVNf
RlJFRVpJTkcgdG8gMHgwNDAwICg8MHgxMDAwKQ0KPiAqIEFkZCB2aXJ0aW9fZ3B1X2RldmljZV91
bnJlYWxpemUgdG8gZGVzdHJveSByZXNvdXJjZXMgdG8gc29sdmUNCj4gICBwb3RlbnRpYWwgbWVt
b3J5IGxlYWsgcHJvYmxlbS4gVGhpcyBhbHNvIG5lZWRzIGhvdC1wbHVnIHN1cHBvcnQuDQo+ICog
QWRkIGEgbmV3IGZlYXR1cmUgZmxhZyBWSVJUSU9fR1BVX0ZfRlJFRVpJTkcsIHNvIHRoYXQgZ3Vl
c3QgYW5kDQo+ICAgaG9zdCBjYW4gbmVnb3RpYXRlIHdoZW5ldmVyIGZyZWV6aW5nIGlzIHN1cHBv
cnRlZCBvciBub3QuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEppcWlhbiBDaGVuLg0KPiANCj4g
djE6DQo+IA0KPiBsaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjMw
NjA4MDI1NjU1LjE2NzQzNTctMS1KaXFpYW4uQ2hlbkBhbWQuY29tLw0KPiANCj4gSGkgYWxsLA0K
PiANCj4gSSBhbSB3b3JraW5nIHRvIGltcGxlbWVudCB2aXJ0Z3B1IFMzIGZ1bmN0aW9uIG9uIFhl
bi4NCj4gDQo+IEN1cnJlbnRseSBvbiBYZW4sIGlmIHdlIHN0YXJ0IGEgZ3Vlc3Qgd2hvIGVuYWJs
ZXMgdmlydGdwdSwgYW5kIHRoZW4NCj4gcnVuICJlY2hvIG1lbSA+IC9zeXMvcG93ZXIvc3RhdGUi
IHRvIHN1c3BlbmQgZ3Vlc3QuIEFuZCBydW4NCj4gInN1ZG8geGwgdHJpZ2dlciA8Z3Vlc3QgaWQ+
IHMzcmVzdW1lIiB0byByZXN1bWUgZ3Vlc3QuIFdlIGNhbiBmaW5kIHRoYXQNCj4gdGhlIGd1ZXN0
IGtlcm5lbCBjb21lcyBiYWNrLCBidXQgdGhlIGRpc3BsYXkgZG9lc24ndC4gSXQganVzdCBzaG93
biBhDQo+IGJsYWNrIHNjcmVlbi4NCj4gDQo+IFRocm91Z2ggcmVhZGluZyBjb2RlcywgSSBmb3Vu
ZGVkIHRoYXQgd2hlbiBndWVzdCB3YXMgZHVyaW5nIHN1c3BlbmRpbmcsDQo+IGl0IGNhbGxlZCBp
bnRvIFFlbXUgdG8gY2FsbCB2aXJ0aW9fZ3B1X2dsX3Jlc2V0LiBJbiB2aXJ0aW9fZ3B1X2dsX3Jl
c2V0LA0KPiBpdCBkZXN0cm95ZWQgYWxsIHJlc291cmNlcyBhbmQgcmVzZXQgcmVuZGVyZXIuIFRo
aXMgbWFkZSB0aGUgZGlzcGxheQ0KPiBnb25lIGFmdGVyIGd1ZXN0IHJlc3VtZWQuDQo+IA0KPiBJ
IHRoaW5rIHdlIHNob3VsZCBrZWVwIHJlc291cmNlcyBvciBwcmV2ZW50IHRoZXkgYmVpbmcgZGVz
dHJveWVkIHdoZW4NCj4gZ3Vlc3QgaXMgc3VzcGVuZGluZy4gU28sIEkgYWRkIGEgbmV3IHN0YXR1
cyBuYW1lZCBmcmVlemluZyB0byB2aXJ0Z3B1LA0KPiBhbmQgYWRkIGEgbmV3IGN0cmwgbWVzc2Fn
ZSBWSVJUSU9fR1BVX0NNRF9TVEFUVVNfRlJFRVpJTkcgdG8gZ2V0DQo+IG5vdGlmaWNhdGlvbiBm
cm9tIGd1ZXN0LiBJZiBmcmVlemluZyBpcyBzZXQgdG8gdHJ1ZSwgYW5kIHRoZW4gUWVtdSB3aWxs
DQo+IHJlYWxpemUgdGhhdCBndWVzdCBpcyBzdXNwZW5kaW5nLCBpdCB3aWxsIG5vdCBkZXN0cm95
IHJlc291cmNlcyBhbmQgd2lsbA0KPiBub3QgcmVzZXQgcmVuZGVyZXIuIElmIGZyZWV6aW5nIGlz
IHNldCB0byBmYWxzZSwgUWVtdSB3aWxsIGRvIGl0cyBvcmlnaW4NCj4gYWN0aW9ucywgYW5kIGhh
cyBubyBvdGhlciBpbXBhY3Rpb24uDQo+IA0KPiBBbmQgbm93LCBkaXNwbGF5IGNhbiBjb21lIGJh
Y2sgYW5kIGFwcGxpY2F0aW9ucyBjYW4gY29udGludWUgdGhlaXINCj4gc3RhdHVzIGFmdGVyIGd1
ZXN0IHJlc3VtZXMuDQo+IA0KPiBKaXFpYW4gQ2hlbiAoMSk6DQo+ICAgdmlydGdwdTogZG8gbm90
IGRlc3Ryb3kgcmVzb3VyY2VzIHdoZW4gZ3Vlc3Qgc3VzcGVuZA0KPiANCj4gIGh3L2Rpc3BsYXkv
dmlydGlvLWdwdS1iYXNlLmMgICAgICAgICAgICAgICAgfCAgMyArKw0KPiAgaHcvZGlzcGxheS92
aXJ0aW8tZ3B1LWdsLmMgICAgICAgICAgICAgICAgICB8ICA5ICsrKy0NCj4gIGh3L2Rpc3BsYXkv
dmlydGlvLWdwdS12aXJnbC5jICAgICAgICAgICAgICAgfCAgNyArKysNCj4gIGh3L2Rpc3BsYXkv
dmlydGlvLWdwdS5jICAgICAgICAgICAgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysr
Ky0NCj4gIGh3L3ZpcnRpby92aXJ0aW8uYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
Kw0KPiAgaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLWdwdS5oICAgICAgICAgICAgICB8ICA2ICsr
Kw0KPiAgaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3ZpcnRpb19ncHUuaCB8IDE1ICsr
KysrKw0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

