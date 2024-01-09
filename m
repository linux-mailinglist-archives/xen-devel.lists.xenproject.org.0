Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1A828067
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 09:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664325.1034454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN7K5-0007Wi-CS; Tue, 09 Jan 2024 08:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664325.1034454; Tue, 09 Jan 2024 08:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN7K5-0007UX-8U; Tue, 09 Jan 2024 08:18:57 +0000
Received: by outflank-mailman (input) for mailman id 664325;
 Tue, 09 Jan 2024 08:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2W5I=IT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rN7K3-0007Tb-Kk
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 08:18:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b94b8b4e-aec7-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 09:18:53 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7100.namprd12.prod.outlook.com (2603:10b6:930:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 08:18:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 08:18:47 +0000
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
X-Inumbo-ID: b94b8b4e-aec7-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buCjFyre2B++qXOqIyvdQNq75XQ3/YnQTLZcmYerVpextPIupxQHG05Ndoj6M1wDgIJmzErxGeG2iF65+6nkinFukQT98ItJbU60ZEznrhalMAUoHLxpJWMobIIymnXiHSzIsIHukJxuOJwCV+gxGUQtxlZftVUm8VijK4QkUPTbupgXbJdWofDIHBUNmmXdqOlt5wmrlV5sE0+zPBZfd4y4kp/kfsHALnpdVWkyKxtITPkWMfJkrHTRo8oInnIu0scF20kb6JxZ9z+DgqtKx6urYvUXRo3LqrdYd7qNK/rw14EszMqsCCI6jTg6CeOjHgidVpj8is1WJB3pAvkYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni+XVQavD+MVp0vlGpQGnWqbmtMuvHwq6SN/nc0GpoI=;
 b=iB7M+ANuCUnE7oaK3H+dR1PTX9x4vpsn7bdHSz9ZPGPBrfmnOKWuCUOXO5jtLC+LluiYN+rj3rGITPE3GIDG/eKcR1dQ//ccU0fSckTS6D2cwM9CMfzyoXSfs2uz18XnF0nuMKmQsD9sgcrOFL8zq/x3P2ehy6TpA1OSKGbxr7emKsbLHjGZleq5qmMDsbCVil0a7ZSB7NlQnfKw7Wj7bL8QMKgPiUAXDCO9szWHxMQqmTIVV3bI5oNpsNdMq+m26qjFpg/7v71tVTV/QfMgEqcwXfC6fRNADEWnu0qPvajKkR8xuVtAgxS2YL4EVkrpge5tfdt2MTTS8+9JT1p0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni+XVQavD+MVp0vlGpQGnWqbmtMuvHwq6SN/nc0GpoI=;
 b=htMj1koBdzH4C67RzsLad3s14x5NpOB6piP/iL4WvsZ7zNuZmhL4lT7FFBdECLY7RU3cIoh2y+eDALYSlSZGygDBemEUFFg99EPHcu7ISMBZPLSNBmBqbdz6rHaoX2JfEV1eAiSWZTMP45tfcosPBOojTcB6pRflM4U2UmpQAbw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Topic: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Index: AQHaP6Y1pt0ckfKChE+VsjXCWSj8+LDL+oWAgAOnBgCAAGd3gIABof4A
Date: Tue, 9 Jan 2024 08:18:47 +0000
Message-ID:
 <BL1PR12MB58492746170F6BF777901141E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
 <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com> <ZZwPSZoqyY6g9yhi@macbook>
In-Reply-To: <ZZwPSZoqyY6g9yhi@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5045.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7100:EE_
x-ms-office365-filtering-correlation-id: aa9a7967-0692-4b03-e5b6-08dc10eb9a57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TlZ6J7+7436cIaEEhZrvC4q1eWqJikNpn6Nx3s/zpmp1HhDKdl0fjSW6/o+l4UJRmC58CCYlYEmyfWhZ3vXJDDAZZFhqnZTBF2wQfBwmv4QjIiyjdtST2U2G9G230+cBvgdIeRq9rlYqNeIDQ9k0/8Eem70W8q/ZbDjUyZH5vg/B52tYv1qx4M5/PKRj3rTMGpDetq4omWuFsmMx/0npiBYSWsNca0dAH+d1s2FA+1jPBn8jzk5rMw5fXUL61WPtg6ow7QviE77mS/oLwTtSwOuYM5PVxHfYwaHu4SKsq0TC9s5F2xWZBldc0eiQS7OYB/XSIEFxzfOYe3HQJXgn0TOgMvXfthFsIZ0tbPD8itda8Tb5atsoFMONOTtuw/55LNiw4yZbMOoaGHIsiwjhTbWPswnFxmwo5jD/d/t3huwZ1+lBp9+Fw6ck+BlBnnrDrjHleGaEHqPA7eAlcj1FySK2QNBxa1+F/70rrS3hg916xTE9ufZgF5kfS0rxfcLXJxyVUv1uIFJWiElgN1+9eJe02RILJyLIGinV2vCOg5syJ32DQtpaFzhpgnShUIBCmQKbkeZ1ubnGdjjXzg1EeiS7EuhMCApi1KAyphWEqjgmDM+HghfeCDiHDmqr0tZL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(8676002)(316002)(6506007)(110136005)(26005)(9686003)(54906003)(53546011)(83380400001)(66946007)(76116006)(66556008)(66476007)(41300700001)(38070700009)(7696005)(64756008)(478600001)(66446008)(71200400001)(5660300002)(122000001)(38100700002)(7416002)(55016003)(2906002)(52536014)(4326008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDhycHYzaWJhRWhXYUMrRFZabmVXUnZIS1RwaEpGS0hTL09GL1VqQnVsV0dJ?=
 =?utf-8?B?aytROWdGL0FGOCswNUtzQ1MwZTFVY2krNzFjYTE5bkR1M3lXeXFwQzhXRXdJ?=
 =?utf-8?B?K3hqb2xKYkkyVVc3R0l5cGZ0WG5sNWVyZ3Y4VDFvWVQyN2VQVnpZd20xQVNS?=
 =?utf-8?B?UStPaUYxKzBoem8wUVFobzhXVVVtVnRBUTFVcG1VRGVtTTJCL3Rkc2tuWHJh?=
 =?utf-8?B?MW5pYlFtdm4wMC9jc0grQ0NMelVzNkhjV3Z1dXhQKzF2dnAyNEVIZE1qVGt5?=
 =?utf-8?B?MXU4aWY3V2trNnoxaWhoOFpiQ2dmMGl4RkcxL1pFb2ErLzAyWkNIUUpWcjhs?=
 =?utf-8?B?SGxhUmE5K0NIQXJKckE3OC9UL2J4M1V2SjZBQVZWejdwanBXTW5IcFEvblU2?=
 =?utf-8?B?am9Pc0J5NkdvbUtENkFyazJQLzZYNU41VGpzTzNYMUpTdHdDMXFzVndoUUNQ?=
 =?utf-8?B?R0t4cVRKTW9yc0E5RmlDcmY2QUM0MkdQc1o0VXdUUklFNlRHdnZGRW9rckZE?=
 =?utf-8?B?OEhmcVhvZXZYS0NCT3ppVzkwRTJOei9YNVZtb1I0dFF4QklORU9sa3VWVDRH?=
 =?utf-8?B?N1JoREM5SzRKSjNqT2ZqQ05GUVh4czZ3LzFXOCtvUzdLdDZaV1loOFBHNVNH?=
 =?utf-8?B?M1pqRXhteDk1QndBd2pDWXZUY1VNMnQxN09LUU1sSlRXWEtXYWZtOGNPYkw4?=
 =?utf-8?B?STVlR2lVRE5pczFLdmxwTzh4VHc3TEVzaFArMVVVN1pSZHg4N0llQTJ5cnZm?=
 =?utf-8?B?cGpZZlVUYzRZQ1R0eDRMYjE4aURkemZIdFJPUUJ6R2dxMmpwR2RNM2NyMjhB?=
 =?utf-8?B?TEc3QnQyb3ZoVUJQSmlOQ2JlTVhubGdBZGEwYVIzcTVadlRzYThyQU12L25q?=
 =?utf-8?B?Rnk5L092Q2xnbURZajdxd0ZTNSs0MEUraXFiTDNSWjYwZmJrY2tGRjJoNy9s?=
 =?utf-8?B?Rmh0RGh0NXo1SmUyc3VpV2YwL2dGNy9DbnFTZ0pmRXNYbXlGTzZPTDNtbjYv?=
 =?utf-8?B?ZUxxOTFqVGdLSzlRcTdCYXllZXZnL1RRcGhxYkpNUDJ0UG9XQktPNkhEVEto?=
 =?utf-8?B?N1RtK0QxYWkxazBxMUFkMGh4WTR6bDJVUlhYUkc0SUpiYWF2RTIwTGFyekpX?=
 =?utf-8?B?M2FGcjhqb09taHMzMjhUK1MyM25oTE4rUG9jRFRNTDRmbit0dVhqQkhtU3By?=
 =?utf-8?B?WStlWHhlU0U5WlgycnpuZklMVENZTDByYzBIUjNzdFQ4QnZIY0ZtaGpGOGRn?=
 =?utf-8?B?a05mNUFONHowSFRRZS9CQmtya21NK2svVDZKaXliOVZScVE1elFuQ0NxUzJC?=
 =?utf-8?B?Z2M0SHV1S3JUVHVGUEQ3MUJVU2dSWFhESXovZDlUdkRhQkxQYkh6aUhiV3Yr?=
 =?utf-8?B?ZFFXcEMwNUF1a3NuaXJoTlV3QkJqTjA2VmxQaXVNS2FaVXZPUjdlWWVESGh3?=
 =?utf-8?B?ZzhxWW45QStSd1ZmWXQ2NE5WcUZVKzNLeXVZTmp6S0FUOXIyVElvRFI1R05L?=
 =?utf-8?B?QlpLVVprenQ0VTQvSStqaXpkZ3lkRitZakp3OWQzR254T292SDhsMEhXUjBo?=
 =?utf-8?B?cGJLQVNpR0Nob0hrK0VXU1Jld0JQNHhtVGRINExhSWRKZG5HbVpHWEd0RDh6?=
 =?utf-8?B?T3RNZnFYR1YvZHg3eVQ1K0lZWEdKSHZMYnhlZHdyVDU2Y3NxTUg5QlBraitZ?=
 =?utf-8?B?ZmNQYWU1Rmp1bllmYitwcW5CRmpubWswZ2UzRHA2WTcweVo4dFVBZVJDT0pV?=
 =?utf-8?B?MEQvbGhiOFA3N3Y3cXp3VzlSVG55MVYralBwZ2JyNjhuWmlvYWlBNVNCSkE1?=
 =?utf-8?B?My85T0xybE1sMEpKVTBtaGxEd1p5a2RlUlNZSmlSOS9RbmxwT1pRU2lyeWEr?=
 =?utf-8?B?MytQdGZqR2c1bEZZYkVSVnNVNzE1VlJJNzdhZGJHZzA4Q205VWRSa1Qxb0x1?=
 =?utf-8?B?TlhKbS9XQllPckJJdUJpTFRVa1E5VmZiL0hReVVTNEM1em41ZXJBL3ZEWnZs?=
 =?utf-8?B?bGhOdzUrV0FoNGNvQTdEOTViK0FDYzB4aFVTblpNcmJFSUhpNVlJdGU1ekNj?=
 =?utf-8?B?c3VCdmc5RjhwYzFrZVppanlLNzdwQXM3WndrcFp1RHRYZjh5UGMyMndCNjI1?=
 =?utf-8?Q?/9EY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCFCCC6E5410C447BE592D85965D1A12@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9a7967-0692-4b03-e5b6-08dc10eb9a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 08:18:47.2402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NMO3mcJij+An4X9HiMcBQEN/9CbkSb+MG6DdpHMF2WY2Rsv8/DP6H6czC+XQXe7F7KD4ldItL19N1nIsnBzrEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7100

T24gMjAyNC8xLzggMjM6MDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgSmFu
IDA4LCAyMDI0IGF0IDA5OjU1OjI2QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24g
MDYuMDEuMjAyNCAwMjowOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIEZyaSwg
NSBKYW4gMjAyNCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGln
aHQvbGlieGxfcGNpLmMNCj4+Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0K
Pj4+PiBAQCAtMTQxOCw2ICsxNDE4LDcgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9kbV9kb25lKGxp
YnhsX19lZ2MgKmVnYywNCj4+Pj4gICAgICB1bnNpZ25lZCBsb25nIGxvbmcgc3RhcnQsIGVuZCwg
ZmxhZ3MsIHNpemU7DQo+Pj4+ICAgICAgaW50IGlycSwgaTsNCj4+Pj4gICAgICBpbnQgcjsNCj4+
Pj4gKyAgICBpbnQgZ3NpOw0KPj4+PiAgICAgIHVpbnQzMl90IGZsYWcgPSBYRU5fRE9NQ1RMX0RF
Vl9SRE1fUkVMQVhFRDsNCj4+Pj4gICAgICB1aW50MzJfdCBkb21haW5pZCA9IGRvbWlkOw0KPj4+
PiAgICAgIGJvb2wgaXNzdHViZG9tID0gbGlieGxfaXNfc3R1YmRvbShjdHgsIGRvbWlkLCAmZG9t
YWluaWQpOw0KPj4+PiBAQCAtMTQ4Niw2ICsxNDg3LDcgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9k
bV9kb25lKGxpYnhsX19lZ2MgKmVnYywNCj4+Pj4gICAgICAgICAgZ290byBvdXRfbm9faXJxOw0K
Pj4+PiAgICAgIH0NCj4+Pj4gICAgICBpZiAoKGZzY2FuZihmLCAiJXUiLCAmaXJxKSA9PSAxKSAm
JiBpcnEpIHsNCj4+Pj4gKyAgICAgICAgZ3NpID0gaXJxOw0KPj4+DQo+Pj4gQSBxdWVzdGlvbiBm
b3IgUm9nZXIgYW5kIEphbjogYXJlIHdlIGFsd2F5cyBndWFyYW50ZWVkIHRoYXQgZ3NpID09IGly
cQ0KPj4+IChhbHNvIGluIHRoZSBQViBjYXNlKT8NCj4+DQo+PiBJaXJjIGZvciBJTy1BUElDIGJh
c2VkIElSUXMgdGhhdCdzIGFsd2F5cyB0aGUgY2FzZTsNCj4gDQo+IEkgdGhpbmsgdGhhdCdzIGFs
d2F5cyB0aGUgY2FzZSBvbiBMaW51eCwgYmVjYXVzZSBpdCBjYWxscw0KPiBQSFlTREVWT1BfbWFw
X3BpcnEgd2l0aCBpbmRleCA9PSBwaXJxIChzZWUgTGludXgNCj4gcGNpX3hlbl9pbml0aWFsX2Rv
bWFpbigpKS4gIEJ1dCBvdGhlciBPU2VzIGNvdWxkIHBvc3NpYmx5IG1ha2UgdGhlDQo+IGNhbGwg
d2l0aCBwaXJxID09IC0xIGFuZCBnZXQgYSByYW5kb21seSBhbGxvY2F0ZWQgcGlycSBmb3IgR1NJ
cy4NCkkgZG9uJ3QgdGhpbmsgaXQncyBpbXBvcnRhbnQgd2hldGhlciBwaXJxIGlzIHJhbmRvbWx5
IGdlbmVyYXRlZC4gV2hhdCdzIGltcG9ydGFudCBpcyB3aGV0aGVyIGlycSBhbHdheXMgZXF1YWxz
IGdzaSBpbiB4ZW4uDQpJZiBzbywgd2UgY2FuIGRpcmVjdGx5IHBhc3MgaW4gYW5kIGdyYW50IGdz
aS4gSG93ZXZlciwgYWNjb3JkaW5nIHRvIEphbidzIHByZXZpb3VzIGVtYWlsIHJlcGx5LCBpbiB0
aGUgY2FzZSBvZiBNc2ksIGlycSBtYXkgbm90IGJlIGVxdWFsIHRvIGdzaSwgc28gbXkgcGF0Y2gg
Y2Fubm90IG1lZXQgdGhpcyBzaXR1YXRpb24uDQpJIGFtIGNvbmZ1c2luZyBpZiB0aGUgY3VycmVu
dCBkb21haW4gZG9lc24ndCBoYXZlIFBJUlEgZmxhZywgdGhlbiByZWdhcmRpbmcgdG8gWEVOX0RP
TUNUTF9pcnFfcGVybWlzc2lvbiwgd2hpY2gga2luZCBvZiBpcnEgd2Ugc2hvdWxkIGdyYW50IHRv
IGNhbGxlciBkb21haW4/IFRoZSBnc2kgb3Igb3RoZXIgaXJxPw0KT3IgY2FuIHdlIGFkZCBhIGNo
ZWNrIGluIFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24sIGlmIHRoZSBjdXJyZW50IGRvbWFpbiBo
YXMgUFJJUSwgd2UgY2FuIGdldCBpcnEgZnJvbSBwaXJxKGxpa2UgdGhlIG9yaWdpbmFsIGltcGxl
bWVudGF0aW9uKSwgaWYgbm90IHdlIGNhbiBhc3NpZ24gZ3NpIHRvIGlycSwgYW5kIHRoZW4gZ3Jh
bnQgaXJxLiBPZiBjb3Vyc2UsIHRoYXQgbmVlZHMgdG8gcmVxdWlyZSB0aGUgY2FsbGVyIHRvIHBh
c3MgaW4gYm90aCB0aGUgcGlycSBhbmQgZ3NpLg0KDQo+IA0KPiBJT1c6IEkgZG9uJ3QgdGhpbmsg
dGhlIHBpcnEgZmllbGQgaW4geGVuX2RvbWN0bF9pcnFfcGVybWlzc2lvbiBjYW4gYmUNCj4gYWx0
ZXJlZCBsaWtlIHByb3Bvc2VkIGhlcmUgdG8gc3dpdGNoIGZyb20gcGFzc2luZyBhIHBpcnEgdG8g
YSBHU0kuICBBDQo+IG5ldyBoeXBlcmNhbGwgc2hvdWxkIGJlIGludHJvZHVjZWQgdGhhdCBlaXRo
ZXIgaXMgR1NJIHNwZWNpZmljLCBvcg0KPiBjb250YWlucyBhIHR5cGUgZmllbGQgaW4gb3JkZXIg
dG8gc3BlY2lmeSB0aGUgbmFtZXNwYWNlIHRoZSBmaWVsZA0KPiB0YXJnZXRzLg0KQSBuZXcgaHlw
ZXJjYWxsIHVzaW5nIGZvciBncmFudGluZyBnc2k/IElmIHNvLCBob3cgZG9lcyB0aGUgY2FsbGVy
IGtub3cgdG8gY2FsbCB3aGljaCBoeXBlcmNhbGwgdG8gZ3JhbnQgcGVybWlzc2lvbiwgWEVOX0RP
TUNUTF9pcnFfcGVybWlzc2lvbiBvciB0aGF0IG5ldyBoeXBlcmNhbGw/DQpJIG1lYW4gaG93IHRo
ZSBjYWxsZXIga25vdyBpZiB0aGUgY3VycmVudCBkb21haW4gaGFzIFBJUlEgb3Igbm90IGFuZCB3
aGVuIHRvIHBhc3MgaW4gcGlycSBudW1iZXIsIHdoZW4gdG8gcGFzcyBpbiBnc2kgbnVtYmVyLg0K
DQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVu
Lg0K

