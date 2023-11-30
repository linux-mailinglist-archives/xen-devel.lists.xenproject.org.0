Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637347FE925
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 07:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644409.1005358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8aao-0008DF-Hu; Thu, 30 Nov 2023 06:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644409.1005358; Thu, 30 Nov 2023 06:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8aao-0008AS-Do; Thu, 30 Nov 2023 06:32:10 +0000
Received: by outflank-mailman (input) for mailman id 644409;
 Thu, 30 Nov 2023 06:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8aam-0008AM-BJ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 06:32:08 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eab::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e120763-8f4a-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 07:32:07 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 06:32:01 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 06:32:00 +0000
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
X-Inumbo-ID: 2e120763-8f4a-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FysdsCEBIAF8+thZtM++R0Hr/LqDYW9Tjm3YRuvzzlYbSDgGJYq6Z8TDGni5tlIGcGZW44eWshOLFqO6f14xkBljLAYOgdAsOIlwWtmBzg3n8x0tNq8id03E8B3M7w1Lih96Z49mvFiPxtOm3tAv4q1UE9R1GOT4m+q/wcL+3JoPqA9wSdkHZYm59wSzAMb4LuRcq7mUw2Mkbcp2eZvzBpZptJW25D86NJFNVjS/kE+sxS45hem4MgKi73gsc5K2/BtMbiDfZ5YcQ1T46GEcn6OYuHx8hIWIy4lxliTY/fpJWp+m/+j5O2x46UEWVW4tC67662lUXJ/Oc2OmpM/OsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APYI3t14YeJvsWc0EnnFBmUDiBFpb6HpHejzf1t2Zj0=;
 b=U34S9Ev4s/B/BzGQIkNOcC7lT0IMjqJU4Ws38GZq3Dwk9MgDC+2CHGszRlj6TgoG8wOv7b8bqg8Y2g4rES0pHJDVcmcjxOkrf4+d0mZvVlrbMg2MouaFiDML05XrJv4gBxg3jOgpjbRbTaBoio7sJu/MTXs4n1ibJqrGvZ1pXVEOfi8QukBXuEA7T4ILZteE+ltT3/kWeALyqr6nKahVfoSfQC/iJtClOJMzT1WiSr3pp98dwnEWXxt7l8tWXsaDd04ZprXBaGmV71HKQQzgCbKAa9HPQn0HNLalsLwjlV0KloN+wRwLyjPJ1aPv9IzUyEXoSuxHfn2mBeANfrg7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APYI3t14YeJvsWc0EnnFBmUDiBFpb6HpHejzf1t2Zj0=;
 b=NnfnS8oj5GCd7MWT7tTnT2k4AyZRP3/2X/Sfh5H2k4ht8RnwQ5V4o7LCbmcvT0lYVaxzHXBLD6WAAjq4MaO0JytV9dKNSUwIQ//RXqL7UtPnrhWXfi+hm8wex8LWEOXC8NpoV4mZZc9zA0W/E6l3kuzkahRvomWMYeQu/muE7Yg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Topic: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Index: AQHaHsLnjKJ102tGrkSg9na/6oLNI7CPzbCAgAMmdYA=
Date: Thu, 30 Nov 2023 06:32:00 +0000
Message-ID:
 <BL1PR12MB5849A2AB56BAC75D4558F873E782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com> <ZWX2c7oQfeZxrpEF@macbook>
In-Reply-To: <ZWX2c7oQfeZxrpEF@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA0PR12MB8351.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7869:EE_
x-ms-office365-filtering-correlation-id: 7904fbe4-382e-4b9d-0c29-08dbf16e0f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1APW1gb7U/jwPHYBt3cX5t5TKzeMNxz4JjVv2HEMoDj+1cCYqnOgx5nsmxJdF2GWwN9yzKs4Fpi4x4DkclGPGCYS4FnEwag1MhSwx7bs0vOBMINYrKCXqMtDHMj2kiiiR5mHDH9FRGJmsO8fo2nbK34FxAtJZK8T70vGxKmHR5inmuXGSVzfER8eiHEqiEa7kKWaLoVsqVDj7ELNKDA/ackqb6ynybUIMSRYAun62YCY1Qu7XYwfuofZ7HOwfdJMkEi2mM4Pmb7V/ojDCorMr/2TQHGZl1nCoglKVYvguLDxfc8ZuIKoefNGxQYre3EkxqoV+ZPILSeVK8CuxuTKQI/TtNlSEZiTgTgvcUK0f3xB7brngBqDsnK7DXZEQg9k+qif+6XS7biES4zT98nFy+gQ08GGNtzWTLLbq6xwq50h/qlnBJkBVGAvqf76QRfAQLazIAyQOR7B+xuzt7bpMd1p5YJSERMhmMIwBmtMIgZbTeYdTnT/LW4W0YeZ4P5yhGVPQcdVjZK+sDKMx7s3kmU+uQdvBKuvxT65jUdmVyPoVVKPTEEAxhGdzGnwxu7j22E8TdGmHMvXM6/a4gN6H4flIWJP0lf2yS3QmhCLmdfDYzQ4mI9I+5JdJInLUlMa2iJjvWdj3DsqmuKrAKBsxQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(33656002)(38070700009)(122000001)(202311291699003)(41300700001)(64756008)(66446008)(316002)(66476007)(6916009)(8676002)(54906003)(8936002)(55016003)(76116006)(9686003)(7696005)(66556008)(66946007)(6506007)(53546011)(478600001)(5660300002)(71200400001)(4326008)(2906002)(52536014)(83380400001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXpieFZRNUtmbzNScERXS0tHbGlwelAzNGw4QkRQL2tSbmdld0ZjOEk3MnU2?=
 =?utf-8?B?VUg0VUtxN2FMay9zQ0tBYWRxNC9Tby9zR2Y2NG1xV0hFaWJOSmxabmM0cFB4?=
 =?utf-8?B?bVZ0RllDQS9tRi9iVHdhejlRMXl1WG8wWUlhTm02ZVBaWnhEV1k4cno5RnRM?=
 =?utf-8?B?UE1KUnFuVHFxejAyTkdhay9lNjRqYWNvNXRVVitjVm1CREFtL0xnY000VFNs?=
 =?utf-8?B?LytWM2NJVGdyNE1iMWt4d3o2VGRDNXVTL045U2huM1BTL2N6cWVNcWE5TVVz?=
 =?utf-8?B?VDUzSnFETk1VRk1haGE2VGY3OVM1SXg5cXdodXRqSEkrMXNvK3VZc3JwUGJF?=
 =?utf-8?B?eE5mb3RyMmFEVmJ0VHdJTWpkMkpDVDRoQ1lwdFRjUW9kVzhUeUlNTW9NbC96?=
 =?utf-8?B?eXEzdWM5SVlXMmgrb0FZckN4M0JWRFZMYk1XZFpYTmhaRVZrbzdsSUx3aDhC?=
 =?utf-8?B?bENSTGxnb2tUUG1CakRhbUdoYnJIMjNTbkFIcWhxdlRNV1l1MkIzZDRFUUJD?=
 =?utf-8?B?WUVDS05DNmZmVFl6Z2UrbTdIV1p6VUsrOUpRcG4rek1NWjZyaGxGZ3dtU3Jx?=
 =?utf-8?B?V1lEb2YxYk5Jak9IVVVOK1Focmc5L256b1RvYnlVWkN0SjE0WEp6cU1TT2Uw?=
 =?utf-8?B?VnlyNTg3UXgwVXdJd3J5MHREbC9CbkV4VVJUeUg3cWpzSjk5V0Rrb1dGVFdB?=
 =?utf-8?B?dWZCTy8wWUlYQVdtWTl1bzd2NXlnMmIxYnZFOFlmMU90a0EzSjFndnVhYzhG?=
 =?utf-8?B?clRadkw1WG13VlprTWhDYm9yREl5MVZ4UlBIaGVPSDJzS2t3L2FIbVdqVnZU?=
 =?utf-8?B?K0VlM3Nqd1dVT2M3eXE3U2NRVTdvdGk1ck5oNi9pdjF2UVlQMzBBQk56QVgz?=
 =?utf-8?B?UkY1UkdlMDdDL1VFb0JlZkJBVlU0MjhFalluM09oRE1JcUs5cVN1THpLN2Vt?=
 =?utf-8?B?SjBqMVdCVEpXVU1KZWJ6U3ZGS3hwV3dRV0ZwQzNyanE0NkhRTGZoM0NtU0xW?=
 =?utf-8?B?eCtzeVdkdTR0VzRwbVNhays3dExiNTMxNVl6Mlg1UGdyajBxTmJLOTIyS0to?=
 =?utf-8?B?eXFtRW5yMSt6djVsNlpnbFpwVU5Dc21SRlhrcVRGZ05QUlYrVFl5YlJUckp3?=
 =?utf-8?B?N0FuZGJ2NjAxL05PZjdSQ0VRZDVPdWpkV2pGUGdlZS9IcmNIMFRGSnMwRTE1?=
 =?utf-8?B?TjdjLzNndVNsVDBZc3J0TGR0K0daTkxGeUNyMlRSTHAxNkFhTmNDNS9XV3dh?=
 =?utf-8?B?bE5CYnE5WjdMRmJ1bmFaWktUNmxmbzNVNVV2a3QwSXNVRitNZUxQbldrREJm?=
 =?utf-8?B?eldpQW9QMnlwdDlpNXpzQ1RTUGpPYXBqRHRVZWlHWWYzR2hOSW9XSHR1Qm9z?=
 =?utf-8?B?ZzdmNlB4cDZtTHVGVE80MDJWMlBCMFVVcFVvWXhnOWNXUXZQa3QzdHc4QTJ0?=
 =?utf-8?B?d2NkUUtlYnlaSnJPTlJYcENXTjV2WDAzVThvamRyTjJZbVVibXhSZzNIY0V3?=
 =?utf-8?B?d29Vc2hjZms1RkNMVVNWcUtQNGlNQm5RWnhpTEpkbEsyOGJGUjcxVVduZmt4?=
 =?utf-8?B?NFV6L2FZRXVyTE1TR1hzWVBpbWJZNlNtWmwvQlYrajNEQURpTWhyTWN3ZFFx?=
 =?utf-8?B?aXQydHNiTzR5T1hiOEpFcGtBUEJYS3oyalIySmozcmcxUTQvMi80RDl4b3ZN?=
 =?utf-8?B?MmpaSXNCSWVOQUtMWUwzSlovYkJRQkI1U3U4RGs3QWwyZ3JEVDliSFNQeWdo?=
 =?utf-8?B?NjlPVFFlQTdjMWY0WHZTYmtiZ3dyY0NKejFtWFlTR2dGK3ZRWG1FbDAvTi92?=
 =?utf-8?B?R1pJNm1vNWlkd1JaQ0Zrd1VtU3RhUUpFd1NFOUw4Y1pEcDBxVmVHcjF0NzFH?=
 =?utf-8?B?NnJNN1pGUUU1TW5GOU5CTk5yRW5xZU04N0ZocmRnTWZ5UEFXdmN2ZUxNTC80?=
 =?utf-8?B?ajBjWXp6YzhjaG9zWUkrNHQwSkhKMDVwdVJnQVR4MmtyUkkwRkRLTjFCa3ly?=
 =?utf-8?B?cTRqWUdQL3M5MGJPaG16QlRjbXQrWHREWlpCSVNtS1pKdEhLS2wzVi9xTjI5?=
 =?utf-8?B?WWpzbnlNZi8vMEVEdGxTRGdyZURJN0xDVzlJQlBENWtjcEg1c0NvNEIvb3lH?=
 =?utf-8?Q?4j8c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42BF8566F0CA3441B934FC9D88CC92A8@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7904fbe4-382e-4b9d-0c29-08dbf16e0f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:32:00.7674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEPcLFu3kDNboyb9nCLqDzyIfjUGQ9ZY36Wi1uc6WFmrEvuqdf8gQwjROu+bL63t195DyGssPbQqXGXFiE3KTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869

DQpPbiAyMDIzLzExLzI4IDIyOjE3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmks
IE5vdiAyNCwgMjAyMyBhdCAwNjo0MTozNVBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+
IElmIHdlIHJ1biBYZW4gd2l0aCBQVkggZG9tMCBhbmQgaHZtIGRvbVUsIGh2bSB3aWxsIG1hcCBh
IHBpcnEgZm9yDQo+PiBhIHBhc3N0aHJvdWdoIGRldmljZSBieSB1c2luZyBnc2ksIHNlZSB4ZW5f
cHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGlycQ0KPj4gYW5kIHBjaV9hZGRfZG1fZG9uZS0+
eGNfcGh5c2Rldl9tYXBfcGlycS4gVGhlbiB4Y19waHlzZGV2X21hcF9waXJxIHdpbGwNCj4+IGNh
bGwgaW50byBYZW4sIGJ1dCBpbiBodm1fcGh5c2Rldl9vcCwgUEhZU0RFVk9QX21hcF9waXJxIGlz
IG5vdCBhbGxvd2VkDQo+PiBiZWNhdXNlIGN1cnJkIGlzIFBWSCBkb20wIGFuZCBQVkggaGFzIG5v
IFg4Nl9FTVVfVVNFX1BJUlEgZmxhZywgaXQgd2lsbA0KPj4gZmFpbCBhdCBoYXNfcGlycSBjaGVj
ay4NCj4+DQo+PiBTbywgSSB0aGluayB3ZSBtYXkgbmVlZCB0byBhbGxvdyBQSFlTREVWT1BfbWFw
X3BpcnEgd2hlbiBjdXJyZCBpcyBkb20wIChhdA0KPiANCj4gQW5kIFBIWVNERVZPUF91bm1hcF9w
aXJxIGFsc28/DQpZZXMsIGluIHRoZSBmYWlsZWQgcGF0aCwgUEhZU0RFVk9QX3VubWFwX3BpcnEg
d2lsbCBiZSBjYWxsZWQuIEkgd2lsbCBhZGQgc29tZSBkZXNjcmlwdGlvbnMgYWJvdXQgaXQgaW50
byB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCj4gDQo+PiBwcmVzZW50IGRvbTAgaXMgUFZIKS4NCj4g
DQo+IElNTyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaW1wbGVtZW50IGEgbmV3IHNldCBvZiBETU9Q
IGh5cGVyY2FsbHMgdGhhdA0KPiBoYW5kbGUgdGhlIHNldHVwIG9mIGludGVycnVwdHMgZnJvbSBw
aHlzaWNhbCBkZXZpY2VzIHRoYXQgYXJlIGFzc2lnbmVkDQo+IHRvIGEgZ3Vlc3QuICBUaGF0IHNo
b3VsZCBhbGxvdyB1cyB0byBnZXQgcmlkIG9mIHRoZSBhd2t3YXJkIFBIWVNERVZPUA0KPiArIFhF
Tl9ET01DVExfeyx1bn1iaW5kX3B0X2lycSBoeXBlcmNhbGwgaW50ZXJmYWNlLCB3aGljaCBjdXJy
ZW50bHkNCj4gcHJldmVudHMgUUVNVSBmcm9tIGJlaW5nIGh5cGVydmlzb3IgdmVyc2lvbiBhZ25v
c3RpYyAoc2luY2UgdGhlIGRvbWN0bA0KPiBpbnRlcmZhY2UgaXMgbm90IHN0YWJsZSkuDQo+IA0K
PiBJIHVuZGVyc3RhbmQgdGhpcyBtaWdodCBiZSB0b28gbXVjaCB0byBhc2sgZm9yLCBidXQgc29t
ZXRoaW5nIHRvIHRha2UNCj4gaW50byBhY2NvdW50Lg0KWWVzLCB0aGF0IHdpbGwgYmUgYSBjb21w
bGV4IHByb2plY3QuIEkgdGhpbmsgY3VycmVudCBjaGFuZ2UgY2FuIG1lZXQgdGhlIG5lZWRzLiBX
ZSBjYW4gdGFrZSBETU9QIGludG8gYWNjb3VudCBpbiB0aGUgZnV0dXJlLiBUaGFuayB5b3UuDQoN
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

