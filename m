Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D63826A7F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 10:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663270.1033127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMljE-0002Om-DF; Mon, 08 Jan 2024 09:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663270.1033127; Mon, 08 Jan 2024 09:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMljE-0002La-79; Mon, 08 Jan 2024 09:15:28 +0000
Received: by outflank-mailman (input) for mailman id 663270;
 Mon, 08 Jan 2024 09:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xshC=IS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rMljC-0002LU-0C
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 09:15:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e88::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73f2fb6b-ae06-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 10:15:24 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB6946.namprd12.prod.outlook.com (2603:10b6:806:24d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 09:15:20 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 09:15:20 +0000
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
X-Inumbo-ID: 73f2fb6b-ae06-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndoi/fgsdvH8H20o1sJd9mDbchMngAY78SEjfLsqJMfUMimp8mAzxAFsSngQcJd6Ybyb4OXMm6wxBYUhaUV8N5+O5U2wbeA0CrFdlFPMJDsI9u+h03rZH3tds9/jfc9earVGgYEucVHELHzhbokL+bqgxzE5g/84MkbyhGpQup+sov7UJJ3JAZCQ0i2+eH8A0ZhPzIvlvZP2EPSxvyFUX4vIgB5epUClWYZKxjXfZBU0X20ufWWXsQhVbp7LZaueAK8Ok9FRTxgkr3CJ3CjZmMhg4DEBJP7HsuRZ3iwwrx2idbV6tZaff3IxYBBAiJbxQsiwTrENE9SUMknN5CYCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2lDFpIWBiF6MdPFFbAL7eEpdXv/FdOsw6GpGUxmexs=;
 b=lCDuNaktE/1ZG4nQlRogq5CPPAC49Lodh838Wz+J5+8DChlW3o7NpRg2e/NKXLqI5N27Ck9As9SW09AJiYbMZld3dCozoW6q5Pbb4/sgM8s2xqROMViaTjVNttkZeYWYUARUa03focH/MgiR4BE6ZElCDPH/EcjZRsiTDWODqEPpIa7wBckXFz1zuuA9z5ampaDT5vQfjxJJzGufGDwG7mSPbcm2WUIz4CCcft6+9t/eQYajrtGK1bwx7cvZRvRfw54uqY1KwC6Lhtkn+ImHSdcZgSMg8DCe0vzK5YXwIA5fO+rc2SZG2oWBbZKZ/q0+aAgNuHKqHsKQQC5g9sBAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2lDFpIWBiF6MdPFFbAL7eEpdXv/FdOsw6GpGUxmexs=;
 b=DxxqfnfupPIa68bjgeGEEkozzOmCDbnvI4IiqM0yWTr+AB5d8qTW0ZN1Hyqzu+isxq6iU8R9LEMACKViP6cTonJBl1jMZPeBbqQVjjL+k1FXVKggkV7u9klJR4UQgBb1ii8bPKcDcPzrPOMmLNhkkrGVkL90r1veWvE3e23JdgA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller
 isn't DOMID_SELF
Thread-Topic: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller
 isn't DOMID_SELF
Thread-Index: AQHaP6YuSUk29qg8QEWwkYk64ozIULDL9CiAgAOrDICAAImKAA==
Date: Mon, 8 Jan 2024 09:15:20 +0000
Message-ID:
 <BL1PR12MB58495C90CEC83B6EF66651A0E76B2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-3-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051639240.3675@ubuntu-linux-20-04-desktop>
 <242dbf1f-ef3e-42cc-906e-5c5bb01d8e31@suse.com>
In-Reply-To: <242dbf1f-ef3e-42cc-906e-5c5bb01d8e31@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB8494.namprd12.prod.outlook.com
 (15.20.7181.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB6946:EE_
x-ms-office365-filtering-correlation-id: f422dd47-411e-42e1-66f0-08dc102a5644
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cqreTQsgN+GegWDjL4jxVxItwUfI5taBHKPyAf6ScR2iMSPR9rFHh+zzScf4L72r2dozBW2YJUBlbA/jmnbjMcBrFY+Jn13rMyHE6+8NdL0kCDDQGG6bjfoM14RjBIdyr+P/LWh660n89BdDqTAqQiFxTbjqcSYXAJy3/x5QzmTpfOEHHMezfqqqROUiis96tTVlq1YsPD0NFxFF1CBg56dTL7YBdetkjXGb5+Vpq5KLrgWSE70eM9jeZrHaHzVY3Y5BIm9vjy4bul9HdeNU2sPiCLoRZU9rJVyKNsgG0CDGhMP5CCotaw7aLJNzXHs4OeGMIzBw09oZ1FvhWQtgoiTIS5O8HatkCFOBy90x6IhSXl6uonpAwGK9AEDPzv1NwGtIRpSM1JsvFp5GZX5ViaURB7QwPQwJoL2lJPJPZQJ5Jig2Nj/iOJvkZ/tSa437Y7ZuW6MZgMfxZy3cI68Tz0K/fp4d2UKbg8WeC7M5RcsHnl4VECzkvRrw7mUSU96DKLgsv7IfSIQ1IutXomSjYxBHU31Eubi+TOFS58cuDfbMSG4D1QeyT7fHvMpWLLqKbrFGE4cxRBX1+FyHGejyxEj+WT3eIje9EPInX4CG8T3YVjmF9OG5o2kdS5maDcja
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(7416002)(2906002)(26005)(38070700009)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(122000001)(33656002)(55016003)(5660300002)(4326008)(316002)(54906003)(110136005)(83380400001)(52536014)(6506007)(53546011)(9686003)(7696005)(71200400001)(478600001)(8936002)(38100700002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE5mb0pUQzFLK3ZRMVhqNmQwc2QwVHhxNG5qRFhITFhHd29mM0hNVWpGR2xr?=
 =?utf-8?B?MkRtaXdaWDV3RHY2MDh4ZWtxQ2I0S0tKLzIyS3RGelhSVi8vWDR1TWQ5N25N?=
 =?utf-8?B?T1ptMDIzdEZDblZxU09FZ2l4NzBQc3NRb3ljVWZtc0h3RUZCdjZvay9SYVJS?=
 =?utf-8?B?K3JLd2x0d1drQThFdEpHREZ5b0MrWFZQNm94SFI4bUZDcG8vSjB1cksxaXR4?=
 =?utf-8?B?c09yRnFmWTRoTWJ3VFZZSjJiUHpOTmJGWVNHaDZwRFc3NWxzSlJ0amZnRmcw?=
 =?utf-8?B?d1ZyclNEQlozRlRGQ0VRZE0yU1B3MFZRS3JmRkNrLytNemIxejNHQ3hNK3Jt?=
 =?utf-8?B?QzIwTnFSSkkySEgvTC9ab3lpcW9LKzFoakFTRTcvT0x3ZG9DN1F0dG5adzlw?=
 =?utf-8?B?ZWhISFlnV2VjOTlmRlFobS9VckQrdURVOVc1VlZGU3J4N3NQVUQxNnpjZ2Vx?=
 =?utf-8?B?L0pweHdKZ29UaVNEY3VmRXRFLzlDUUFJb1g3V0J2S3JvTGNFU2NIY3RNZDBp?=
 =?utf-8?B?bHhHUnFaano5QzFPaEhFT0tHdUtxL20xa1psMU5mRm5zTloxMnJkS3FpZEJn?=
 =?utf-8?B?VVNhZ3F2TVRReEVXY2RqbjJQOEZacHlBKy9kUFltc2FFUFdkQWxFbEZVNmZR?=
 =?utf-8?B?RmJCNkw5S1c3b3o3Z3FxZTFoZ2laY3RHWkFjRk14SUZ3VFJCeDU1SHFHNk9w?=
 =?utf-8?B?bC81bG9nRmtuNFUxV0tiVkNpaXlnaHorN1NkOERhQmtUL0I5czdUeTZLa3gz?=
 =?utf-8?B?bU5NN0FXeEFOczFXdjdITmYwWmwybUxoN28yVkV1S1J2bGFCMkhIc1hJS2Zh?=
 =?utf-8?B?RUFVUzJDYytMREdscEFSMUtONzhBMlpnd1hzd1p1ajFrQmlKelI5NWJrb01l?=
 =?utf-8?B?YnY4anZYTTFZQ1A3Q3g5N3dzaUwxVlZOYmMvQ3VRWE5FdkZtV2xZbzF2M0VX?=
 =?utf-8?B?dldtY2hMMHJQV3poaHN3UXBpSVNaMHBkZnczaWpIczhQckpZdnZmQTZLaWdT?=
 =?utf-8?B?cW5zYjhKUS9COStmSXpQeFhYZ2tQVTdITFNnLzBCSFBLNHdVM2NOZUJqZC94?=
 =?utf-8?B?WlRYbXMxZ2JxWWJiY2dUOThQYVFIWTlBLytGcmF3NkdwbHNYdFpzMjFoQzB5?=
 =?utf-8?B?ZUlZa2dabXp6OUM2a0xkYzZjVDZEQlVvZUkyQjRsK1VZMVVYTVY2cHN5STlX?=
 =?utf-8?B?R0gxcWwzMDZNWWQ4U2FnZHRWbEhxYXdjaXM5aGhvWStFQ3kydWVzOGJLSkJh?=
 =?utf-8?B?UzE1dWcvc2RGYWhrN2ZMV29GYlM1SzdnejVyeldVVyt6RnhIWGtaODU2cmtm?=
 =?utf-8?B?SXVuMEoyaStNanY5eUo1dCt6cXh0VTRTQlJsaWlHcG0wY1J0UmpiU20wb1I4?=
 =?utf-8?B?alIyTHk5WTZRaGUyczdTWUFUUGw5NDVsdXNKSzVMc1JRN2JUQmZkOGFsSkFo?=
 =?utf-8?B?UkhhRkY1djN4SE9Gb2QwSXVsWHpldVkreU1hbjdPeDFxREEraUhkMzhxWFNB?=
 =?utf-8?B?YWd5NU9uZ0hndFhrWEJNdEtDczIvdHFJZG5BQVhhL1ZXWGw4c3MwN3NEQURR?=
 =?utf-8?B?V3llK0hhMk5NYVBvaGhOK3JJSXU1bmZUM0ptOE5BU3h3VllaRVFxT0NLUEsr?=
 =?utf-8?B?eXpRZ25KTlprb0tEdmN4RnJGUWdCNGNuYVphWm1hQTMwSEVRcDZrTjFDMHZP?=
 =?utf-8?B?Y1ltcGxlcFBYVTk2OWtrK083U09vcE1zb1VEUTNEN0ppZnEwNHZiM3NQdEtn?=
 =?utf-8?B?WlZqN3IzMWZZaWcrQklaazRzWnBJcXhrOU9FS3lKSnNCUmtreXkyV01uZ3lr?=
 =?utf-8?B?ZlY4K3dscTROZHdQVW5UZzZkRFV2ZjF1dGhTcSthdU9NUXNKTjZCeFZUeDRG?=
 =?utf-8?B?UzhnWlgzZGYzd1hObUExcjlSZ0JxdXdCSVNmbFlBUDJJOXZpUUxTbmQwTm1h?=
 =?utf-8?B?Z3pwOVErRVRqMjFwVStsN2RGTWFJaHlLWVVqQ25Ka2lKYUZ4a0NBOGgycTRv?=
 =?utf-8?B?MVh2Rmk4MW4yNU1TQkowSWx1d3JoZzJMU2tkVzR5R3RHUG1Cd3BOdTk3eHF6?=
 =?utf-8?B?NEwrcTlMekwrZGdWdmlUS0ViRmMydXd2elRweG5FeXR6WllyaTdvcm5SSGFJ?=
 =?utf-8?Q?TOJ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B94ACF4B5C44F4428724192B1B62C177@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f422dd47-411e-42e1-66f0-08dc102a5644
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 09:15:20.1484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3eLNfV3uguieDSPMkt7hvTL7KV5o62k+OIbaGKN3J5tTnSd0x5zoVlbakcsI9lod6wp1iuSReFg31/jbXsoqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6946

T24gMjAyNC8xLzggMTY6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMS4yMDI0IDAx
OjQ2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBGcmksIDUgSmFuIDIwMjQsIEpp
cWlhbiBDaGVuIHdyb3RlOg0KPj4+IEBAIC03Miw4ICs3MywzMCBAQCBsb25nIGh2bV9waHlzZGV2
X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4+ICANCj4+
PiAgICAgIHN3aXRjaCAoIGNtZCApDQo+Pj4gICAgICB7DQo+Pj4gLSAgICBjYXNlIFBIWVNERVZP
UF9tYXBfcGlycToNCj4+PiAtICAgIGNhc2UgUEhZU0RFVk9QX3VubWFwX3BpcnE6DQo+Pj4gKyAg
ICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycTogew0KPj4+ICsgICAgICAgIHBoeXNkZXZfbWFwX3Bp
cnFfdCBtYXA7DQo+Pj4gKw0KPj4+ICsgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZtYXAs
IGFyZywgMSkgIT0gMCApDQo+Pj4gKyAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOw0KPj4+ICsN
Cj4+PiArICAgICAgICBpZiAoICFoYXNfcGlycShjdXJyZCkgJiYgbWFwLmRvbWlkID09IERPTUlE
X1NFTEYgKQ0KPj4+ICsgICAgICAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4+DQo+PiBUaGlzIGxv
b2tzIE9LIHRvIG1lIGFsdGhvdWdoIHRoZXJlIGlzIGFscmVhZHkgYW5vdGhlciBjb3B5X2Zyb21f
Z3Vlc3QgaW4NCj4+IGRvX3BoeXNkZXZfb3AsIGJ1dCBJIGRvbid0IHNlZSBhbiBlYXN5IHdheSB0
byBtYWtlIGl0IGJldHRlci4NCj4gDQo+IEhvdyBjYW4gZG91YmxlIHJlYWRzIG9mIGh5cGVyY2Fs
bCBhcmdzIGV2ZXIgYmUgb2theT8gVGhlIG5ldyBjaGVjayBjbGVhcmx5DQo+IG5lZWRzIHRvIGJl
IGluc2VydGVkIGluIHRoZSBjb2RlIHBhdGggd2hlcmUgdGhlIHN0cnVjdHVyZSBpcyBiZWluZyBy
ZWFkDQo+IGFscmVhZHkgYW55d2F5Lg0KSSBhbHNvIHRyaWVkIHRvIGFkZCB0aGlzIGNoZWNrIGlu
IFBIWVNERVZPUF9tYXBfcGlycSBpbiBwaHlzZGV2LmMsIGJ1dCBwdiBoYXMgbm8gZmxhZyBYODZf
RU1VX1VTRV9QSVJRIHRvby4NCklmIHdhbnQgdG8gYWRkIGl0IGludG8gcGh5c2Rldi5jIGFuZCBj
b21iaW5lIFN0ZWZhbm8ncyBvcGluaW9ucywgdGhpcyBjaGVjayBtYXkgYmUgbGlrZToNCg0KZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMgYi94ZW4vYXJjaC94ODYvcGh5c2Rldi5j
DQppbmRleCA0N2M0ZGEwYWY3ZTEuLmMzOGQ0ZDQwNTcyNiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNo
L3g4Ni9waHlzZGV2LmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMNCkBAIC0zMDMsMTEg
KzMwMywxOSBAQCByZXRfdCBkb19waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVf
UEFSQU0odm9pZCkgYXJnKQ0KICAgICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycTogew0KICAgICAg
ICAgcGh5c2Rldl9tYXBfcGlycV90IG1hcDsNCiAgICAgICAgIHN0cnVjdCBtc2lfaW5mbyBtc2k7
DQorICAgICAgICBzdHJ1Y3QgZG9tYWluICpkOw0KDQogICAgICAgICByZXQgPSAtRUZBVUxUOw0K
ICAgICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJm1hcCwgYXJnLCAxKSAhPSAwICkNCiAgICAg
ICAgICAgICBicmVhazsNCg0KKyAgICAgICAgZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQo
bWFwLmRvbWlkKTsNCisgICAgICAgIGlmICggZCA9PSBOVUxMICkNCisgICAgICAgICAgICByZXR1
cm4gLUVTUkNIOw0KKyAgICAgICAgaWYgKCAhaXNfcHZfZG9tYWluKGQpICYmICFoYXNfcGlycShk
KSApDQorICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7DQorICAgICAgICByY3VfdW5sb2NrX2Rv
bWFpbihkKTsNCisNCiAgICAgICAgIHN3aXRjaCAoIG1hcC50eXBlICkNCiAgICAgICAgIHsNCiAg
ICAgICAgIGNhc2UgTUFQX1BJUlFfVFlQRV9NU0lfU0VHOg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpC
ZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

