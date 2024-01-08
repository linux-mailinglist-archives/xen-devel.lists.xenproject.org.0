Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E098267DB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 07:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663178.1033000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMij5-0003AX-MR; Mon, 08 Jan 2024 06:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663178.1033000; Mon, 08 Jan 2024 06:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMij5-000382-J7; Mon, 08 Jan 2024 06:03:07 +0000
Received: by outflank-mailman (input) for mailman id 663178;
 Mon, 08 Jan 2024 06:03:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xshC=IS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rMij3-00037w-Fx
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 06:03:05 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93cd655d-adeb-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 07:03:02 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 06:02:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 06:02:55 +0000
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
X-Inumbo-ID: 93cd655d-adeb-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyzBZMk/43H8gPZPVsR3UbAV1Ng2Q1edkQu6AeAdScxjI4wR98xSPnOGne8Wp2kEuvNDGqcOWLYxvKPzydJHfbhgVIbwIKZiInm53Z6Mb0AcUoSKr8qGHyhMzrLyeRMN/CSqJRcYi2h2ebpLiYtQISAlMl5vug7zXfsrQSXA1Yc+lePZ9m1Nf0NgTbAwmRtGNjzruJiLpxXQG4taUdE5G6WVnpK2Y0nnFuDl2baEBXWETUM59/J+6ovUxfaNKPpr1IrhFIU3a+aHqWgG90lC2qyPSDrvi55+j7jY8v40RQ+bm2ACY3LZioTeI29PtwOHvZVcIAJ3IIQDtPddaiGJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SZnQhqlVHJys+CNWBd65TgWNzYoC5ZjT49rCV1ZqCU=;
 b=SztOt970gA+l9j31sRc3i2EeXTe8QUTUb9KBkxZij6CzYCb3ffI+4nR9Sbsaekh1WtKUMiXiJcYRnl50c3IjJQSX2m41UwWakPf81ACVV+yADllW6JZGJqKKk0ePWDpHrHtSylM8nin21EdHJypkCD7K9t0ih35OlY041zQE+jPk1ino7/pqhmf6xv+YCv0zwDysJbpMmtyiI1lIVCt9+p7sQzYAlrxESkA1CtV22GZ/FW6EZq/lMLSDZeJxfwGS5YF1k3Ji8CFh4Brlksre+kViTt5jqavm1WE9lQg2MPVKp5HUX75gfNzCN+rZhTFW0RwrKhEFGhytqtGcWZ8fGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SZnQhqlVHJys+CNWBd65TgWNzYoC5ZjT49rCV1ZqCU=;
 b=cMDAZCEdobL9n3qV9Orq2NfnhYkX8WBNWoBB7x6rHamLmaHlw9XQJeRec2qeETjuA5Stgpv9cgCduWmG35uTq1qiCea0SC1SSSCjH0+nO5phZj/w4WSp+VG3uTxRdU+PxDJ8znb9uc9kc6x3f3XvZLn/nvTxAMps795K74rDRWY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 5/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Topic: [RFC XEN PATCH v4 5/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Index: AQHaP6Y3HXW6ZoMbT0+Rfz8pptyOwLDL+zqAgAP6aAA=
Date: Mon, 8 Jan 2024 06:02:55 +0000
Message-ID:
 <BL1PR12MB58491AA2827EC47EA652A0F0E76B2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-6-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051711160.3675@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2401051711160.3675@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB8237.namprd12.prod.outlook.com
 (15.20.7181.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SN7PR12MB8435:EE_
x-ms-office365-filtering-correlation-id: 76864d1e-fda7-43e7-cdf4-08dc100f753c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NdyFwKsddt3feLN7uSzRPT4uksUHlI+xNT9/B8BIFVifAl8QgjNQZPK5Tpjp27xDQKoVvnHrS2t6+kN3p2y3SDnE/47iqYXekraH8TRO/1LdtDy6fRi/r+DtFuh/m4UneQXf5+sV2iUZ8Uj0HRj/dty1OjyDd92FnQcBAzginupPU6hyLUWomuOt6kyWlzaJlOPz87ki7s/3z80jESqvQ0CJAoRZhPTkVgBUcvIUhG+gCiw+rRFt52kR2lR0cSIP0vMOJecXtPBzVVCo4iFFy4H33D48EsAAs1ZHyqcRBcWV44XExk+X3iJv4e1IBb3ZIHI+fYVhD9LLmmXfcVWDyPDTCnbhzSzRIZtECJLeX0Bb2RcqjVJYs3XMdYu35pmAOHhIWvVn716+q/AZwyabWuVW8oqn4liDOuMDY0yeQh0w5yz9qpiXF5tPYMVboJwykz65v6CIv9/WhW/CwaovI9A1NftNDOp+til4dgBevMFmQO0ysejS2bmHZfIjiYINUQMuAcSesQOMek6GZ/MFQw9qkr5R3buTWJIqy8po3dfwY9z/V0GlfBLrXn69MZdxHg4D6JC2jy9D1T4E4FueUZagn7TgRIREwfbHJSQDf6gu84PGSTSX9JmAMwY2BNSE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(53546011)(26005)(9686003)(478600001)(71200400001)(6506007)(7696005)(5660300002)(2906002)(7416002)(41300700001)(66446008)(66476007)(66556008)(66946007)(64756008)(54906003)(76116006)(6916009)(316002)(4326008)(8936002)(52536014)(8676002)(38070700009)(38100700002)(122000001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFROaGFVT3hQcnJxZ0xOSDFGelZtODZmRVVuM3ZqQjNrbnN5YmlRZVdQbTNX?=
 =?utf-8?B?bGNvQTlmU0U5aERzVHN0OGNWQ0MySWR0OVFPd2w1VFdBOXJwcVBpQTFpUHFS?=
 =?utf-8?B?aE81dHcvV3RSblMvdERjTFIybEgveGtZamd3QWFJM0pCbmM4VTErTENUWmhm?=
 =?utf-8?B?amFBbHV2T3VETTkxQzgxM1Zzb3VlSDZLY3pkUGZMdXg5WDNkM3p4eVljb1JF?=
 =?utf-8?B?ZFhmN2J4NTI0VERxQW5jMW8rcThnNjVTak1HekhGR2xEdWxURmtmTS9CS3BP?=
 =?utf-8?B?dXRPWS9CYVZCcXVnNlNTaUhPUUNzNytjUTFCRlpvOUJOSGwzbXUrTkR4ckxp?=
 =?utf-8?B?M1VFRHpKbE5jWDd0ZmVxd2VmZmN2aHhJbGREbWpTZmJjdVRENUhrOWFXbW0y?=
 =?utf-8?B?VFh3VW5TQmt1akNtM0FYWitYNUNLTXNjSzRMNEpxRFBlcTNkbW1tQ3UvQkxy?=
 =?utf-8?B?clBvMDB5N2pQQ0QyZU9YcVVzUlM5SGFDZFBaOGNrMFl2am9tYXBxdzJHb2Na?=
 =?utf-8?B?S1RlZmdTMCt2T29IMjNCWjQrcXl5SklxK0FGSVJ0NmJjY2JBdk8zaS9BWUpq?=
 =?utf-8?B?b2JwZXF1T1pPSmI4STNNQ3NneHZLSUVXLzYrMVExVmR3Q01rNmJUcE90aGNR?=
 =?utf-8?B?SkFzT2NZbjlremVmemlSVXVhamc5a2Z3VXRENVpLTGVkL0ZSQ2RGa1dsYnN0?=
 =?utf-8?B?NEw5T04xeFlNTXV1WktGQkFCWVZ3eDRwTG5BSThiRDIxR3drK0RtRUZaM0xX?=
 =?utf-8?B?VWZwSHJaQmJmQ2trWVZmemVhQmhhUlVXdlJKU2RIeXVvbElMdWRrYmVzNGNG?=
 =?utf-8?B?eDR3Q1ZqVmlnaHZ0SG5tWU9UZXFaK2x0OHpzdVZrSHdqaGJzOVEyTC9tdGJ3?=
 =?utf-8?B?d0N1RnQyM05MSER2STJiTE5MVDlxc0t0emNKWm9YTW0rMzkza1BkU3M0N2NQ?=
 =?utf-8?B?aXEycElFTDh2TnRQc2o5Vlp6OHRsWSs3VXZDQUJEbllWWHJNVUhJQTdoYm9n?=
 =?utf-8?B?aHkyUHJKK2MyS2dHdkh6RnVLdkczMVVFS09iUEcvUThObUxWLzlXRG1TaFhi?=
 =?utf-8?B?ZkFubDFVanREcThxUWE2R2dCa0FJWTRRUmJxenpvRzhiVDVzRHYzWFRMblhn?=
 =?utf-8?B?bE9XcHBDSDNDOGJKN25JcWxBeCtqV3JGNXRmdllCSnNMNmkwWisxNit6cXJC?=
 =?utf-8?B?M3J1MGZmT0doWnZOT21ydDEyeFc1Rm5IQU9tL1lwQlZDb3JrdXQ3eWIyaTBx?=
 =?utf-8?B?cVdVVmlPTXI0QXFzYlkralNRcERDSWM5UGl5SEQ3UjFtOWhaVmhaRXEzYkdB?=
 =?utf-8?B?RVhycmJDTHgwWVdXTUl2cVVqZkp0VGNoQ09TcU10bTlKOGlUU1RnN21OUWhi?=
 =?utf-8?B?ZlBZTlZOV1Jrcmk4eVZUdkx5d0tmaGdUT05zb2UvTHRQbjdtMS9yVkJRWEU4?=
 =?utf-8?B?MUdETDdzK2ZnTDRXUWYrQXFQbHUyenpsWVorTHVnRlhKZkRjOXkxQ0VMRzhE?=
 =?utf-8?B?V1dtY1VPakZ3a3dvYWt6cWd5VndWalRGUWxKdUo4b0w3dW8xT3ZLZ0kvR3Rx?=
 =?utf-8?B?ZU5jaldINWVBQW90R0tOVXQybXdVNURhcng4NGhDSUEzYkZpYW5xWVc2Y2tR?=
 =?utf-8?B?WWx5WXlmNVh2VVViMVhiSUJRUlNwNlY3RWpCQkpjMW5zQkcvNjlRMDBBeVRR?=
 =?utf-8?B?VjVLNDE5SlpPVDdNRnVQcDhFSTE5NnpLMkxjOHdGbkZhbituYVptNUMwOXZC?=
 =?utf-8?B?SHdzR0FkY1lmcTB1TU9SYmNndUc5REdXUGpxMzJFS293aGZWVG14dEh5OU1F?=
 =?utf-8?B?MXFWaFlvL0I4NHd1bXEwbG1Ga09WajlUU1Zzc1lBQW5oRkNjUzg0OXdtaXR2?=
 =?utf-8?B?cHNqOE5Jd0N5M211ODNDOWtBS25FVVg2bDNYb1FjK1NwMHE1Yi9OQmYvR0h5?=
 =?utf-8?B?dmFiRXVVdTJlR244TC9aUFJ6dzNWbkNUN2crK0NoQm1lT01XSFZ3ZEhJejhK?=
 =?utf-8?B?aVdzTWh5Z1ZadGV5RkdqOGpUWVdZT2NjQzhMM2FXTjFoMDlYZ05uY1BqS2ZQ?=
 =?utf-8?B?WlBrVEhYSHA5V1BTWXVGVS9OTmxoak4zakQ3Wm83TlNFSnlKc3Vtc1hTRnV3?=
 =?utf-8?Q?vnVo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A04D207E2B5E0545A0D7E1E499F8E938@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76864d1e-fda7-43e7-cdf4-08dc100f753c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 06:02:55.7075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFG6Sq96oGz2Wb34D+G/Zmqi+nF6JaJkhbJJiPxWrB28VYjdxQAqaolm/nctO0yczfsLQ0IGlmNrUYzHNRc/bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435

T24gMjAyNC8xLzYgMDk6MTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gRnJpLCA1
IEphbiAyMDI0LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEluIFBWSCBkb20wLCBpdCB1c2VzIHRo
ZSBsaW51eCBsb2NhbCBpbnRlcnJ1cHQgbWVjaGFuaXNtLA0KPj4gd2hlbiBpdCBhbGxvY3MgaXJx
IGZvciBhIGdzaSwgaXQgaXMgZHluYW1pYywgYW5kIGZvbGxvdw0KPj4gdGhlIHByaW5jaXBsZSBv
ZiBhcHBseWluZyBmaXJzdCwgZGlzdHJpYnV0aW5nIGZpcnN0LiBBbmQNCj4+IHRoZSBpcnEgbnVt
YmVyIGlzIGFsbG9jZWQgZnJvbSBzbWFsbCB0byBsYXJnZSwgYnV0IHRoZQ0KPj4gYXBwbHlpbmcg
Z3NpIG51bWJlciBpcyBub3QsIG1heSBnc2kgMzggY29tZXMgYmVmb3JlIGdzaQ0KPj4gMjgsIHRo
YXQgY2F1c2VzIHRoZSBpcnEgbnVtYmVyIGlzIG5vdCBlcXVhbCB3aXRoIHRoZSBnc2kNCj4+IG51
bWJlci4gQW5kIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UsIHhsIHdhbnRzIHRvIHVzZQ0KPj4g
Z3NpIHRvIG1hcCBwaXJxLCBzZWUgcGNpX2FkZF9kbV9kb25lLT54Y19waHlzZGV2X21hcF9waXJx
LA0KPj4gYnV0IHRoZSBnc2kgbnVtYmVyIGlzIGdvdCBmcm9tIGZpbGUNCj4+IC9zeXMvYnVzL3Bj
aS9kZXZpY2VzLzxzYmRmPi9pcnEgaW4gY3VycmVudCBjb2RlLCBzbyBpdA0KPj4gd2lsbCBmYWls
IHdoZW4gbWFwcGluZy4NCj4+DQo+PiBTbywgdXNlIHJlYWwgZ3NpIG51bWJlciByZWFkIGZyb20g
Z3NpIHN5c2ZzLg0KPj4NCj4+IENvLWRldmVsb3BlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdA
YW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQu
Y29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4NClRoYW5rIHlvdSB2ZXJ5IG11Y2ghIEkgd2lsbCBhZGQgdGhpcyBpbiBuZXh0
IHZlcnNpb24uDQpBbmQgdGhpcyBpbXBsZW1lbnRhdGlvbiBkZXBlbmRzIG9uIHRoZSB0aGlyZCBw
YXRjaCBvbiBrZXJuZWwgc2lkZSwgaWYgdGhlIG1haW50YWluZXIgZG9lc24ndCBsaWtlIHRvIGFk
ZCBhIGdzaSBzeXNmcywgdGhpcyBpbXBsZW1lbnRhdGlvbiBtYXkgYmUgY2hhbmdlZCBpbiB0aGUg
ZnV0dXJlLCBpZiBzbywgSSB3aWxsIGxldCB5b3Uga25vdy4NCg0KPiANCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

