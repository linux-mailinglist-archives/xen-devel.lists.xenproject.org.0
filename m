Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB11810862
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 03:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653698.1020138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDFHR-00061e-N9; Wed, 13 Dec 2023 02:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653698.1020138; Wed, 13 Dec 2023 02:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDFHR-0005zN-KC; Wed, 13 Dec 2023 02:47:25 +0000
Received: by outflank-mailman (input) for mailman id 653698;
 Wed, 13 Dec 2023 02:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kw6B=HY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rDFHQ-0005zH-NI
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 02:47:24 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e88::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f025b6ed-9961-11ee-98e8-6d05b1d4d9a1;
 Wed, 13 Dec 2023 03:47:22 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.36; Wed, 13 Dec
 2023 02:47:19 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 02:47:19 +0000
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
X-Inumbo-ID: f025b6ed-9961-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLAtuwND6IiIeEPX8o1GKLq59LJ3uqH9kXXqk1lXxt2sf0Y34htVI/sYwZxtWkQWYUc7kl9iNfltiObhhyGD0c8vD67lg0LIZiiWzWsvDxKdNsoutqm7jz49UlWltYnnQO1kryZukM6vnF9DX7DIG93cKTiaJo/0gEYtAIuCvFTHo+qxILIbOY8cygNOD8HS3TEFJ7m/XmjUohCHqUGs81Hb7m++UyqG0Y0vV4tHZaQB/U2auz0S0NTil8Jtm5dRaggjUX8Y5n15b5y9HAjHdRmT/KMvie0sp5rdrUwRkJ5WGpNHYNaxpKTUVAHZONb+81zDbSyeFjdx98Kk/VmHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nPLFwk9mtpN3JdlrGA0jQbp4AS228Zi0u1ktmTPUVg=;
 b=lxhgA+TbT/ht6hUm+Pq5v8Ljoy/d/xujzwEVfbO9/9+e7NvjDH7p2SvROmmCyhrfFV5/FU7i1zg7y9F/00Clj2psgIPx09k2Bte1bqlGO470OiVWuhT0kje1OWjNCqQWqYjSzC5BNxz0h/8nQK69hbMjmp1JSLGopDkHTdlauAyAVt+YA1QW5MVcsulH8JXvTEfkVZbQ3yfYec7+QBRgNm/DDK8Mc9uIjpcvhtT0ZLUstv5EgbIDYgB0YhBIQuJFfm+eMNrLhJoEAY/R6mxMxesHStdXkbHh2RSjyljPsJII4RwAHLEKJX9qVPDNb0W4lTZc4g1U0Q9v6d5ijCEgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nPLFwk9mtpN3JdlrGA0jQbp4AS228Zi0u1ktmTPUVg=;
 b=QO+lMOlOlIncIlyysOTKMGV4AWdv9I4mvp3NmFhmi6AFwXHJIXbfKtMPyLT/2vEzjWv7t2ha/Ohme7QzAGH4yR541X8pbV5Xw4dhdtvRnrEPlTE17CU39aSfcXEc4ZJsXUl26s62XjrmZbxdybe6tadbmJH6l4+vyEp94pOK09o=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Topic: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Index: AQHaK4ebBv/EWT+No0GAUR8lU4172LCkNzqAgAGFPID//6gjAIABpqIA
Date: Wed, 13 Dec 2023 02:47:18 +0000
Message-ID:
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
In-Reply-To: <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB7663.namprd12.prod.outlook.com
 (15.20.7113.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM6PR12MB4218:EE_
x-ms-office365-filtering-correlation-id: 70acd23b-9c24-4207-10b3-08dbfb85d2bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eQFopefHX1Fd1+9LgXfM00KQm5NRR+51QrfNQ5HAKEx5sheKgGz3QGGrnuyw47mbA/z9MG16RI4iAO6oeEuDFSd/DCLqsA/0eQjLsuv3SHVrtZ0tMpJ2IKY15GqIJcqiJrUCwJ40OSCa/TOGR4rBQNYvWkDrht6OLc4QaraNPs3Mriqijav0abvYc3Uqxd5k7BtL9WRowA4zH184TGH77wviVeqaqW9JZte6U2Bh/Rxiy4f9riWvsgn06s7u8f3dVbLQevaiBmXFnsY/jZb4JkETNsAWFzpp21mUEB4zg4HfnVURpCcZrd+s04pv/rfRs4eLkE67GMz/MszIQaiOtyYZ6klsz0TD0BupBqn+rSx8TaLfBREBlWSQqpAW5e3ew13DGEOcu/ZDoKvmcFJ1Yx2OgasxzuNHOLHl/T6P47rjnw9H/MLQI5VJdyPJZLa9Y4sHqakfTaaRqkQs27jn9oAYNXZDye8DbgJqW2nnhTGiK3sc+tmuDcGXp5kjbBmFyFUVtbxKHND+UmiUOob9OEp2EUhPI2XnRpQsWPFN5nwf9xYHuezInirNHAy+G9lxyzXFOl8i5+LwK2r398rdAD3+9XUMcIW3wZKZlVNCCSgklGp7JAeOOzVnpJUw62WZgJXhCIrn9uOZLgJlRJnEkkV0MTmSD5vklYhY6AdvSnk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(53546011)(7696005)(83380400001)(6506007)(9686003)(122000001)(4326008)(5660300002)(8936002)(52536014)(8676002)(41300700001)(2906002)(478600001)(26005)(71200400001)(38100700002)(316002)(66556008)(66476007)(6916009)(64756008)(54906003)(66946007)(76116006)(33656002)(66446008)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDZvRll3dmxOZEpnRTZZTzhJdlNIcE11ZGJNc2s4ZEhVanpHTlllSzVQVml6?=
 =?utf-8?B?aHFQODJKcGtEbW9kUzJXL3VIZ0dhYkxnNWk3TWdrckZoRngzU2FhTERyVDdu?=
 =?utf-8?B?eFRyUnFRWXFBRjluK2NWSXdpUjBLVDUxRG5RM1ZmVzRvN2x4ZXhmc2tNYUM2?=
 =?utf-8?B?TG9IbGV0ZHVZT3dkb3c5SjZKN241WmFjaE91WWh6dHhNOFRrQXB2UHlGYmVm?=
 =?utf-8?B?dW9DZGhBaXFmMUR3T3RXalNnK1ZWTStnMWV3aFFkZmFIakVudGppNnRNVlFa?=
 =?utf-8?B?Y3ZSUm1sb3FabmZxWGJTTTVxczArWlZEaHRCWmdpbXVpNkJYekNQclhjWU9h?=
 =?utf-8?B?aXFISmZiUDFYYWhZSVpnL290WDFZUS9ZQnZCK3ZRN0FIYkROUTIzZzJ6RjRn?=
 =?utf-8?B?L0p0bzZDclNjc0NOUmc4THVNYmtGVTlhNTZFMlQ3TVcrZ05BZXZWRDlBR0Vl?=
 =?utf-8?B?MUhYanB4NHdvQTBvMitjb1UvdERVM3psdVc5SHNQdlhsR1g5RDdpOC9BNmRj?=
 =?utf-8?B?T3hrZkE4ODRaUm9pZ1NBWVBSTXoxaDBpajBEWkY4QnRESitSZysyb2pvazBP?=
 =?utf-8?B?Q2hGbVNMLzk0dGI1Q0hmREJ3US80ZzRGdGVXSFRsbTVzUjBWVTRON2Nab3VM?=
 =?utf-8?B?WC9EeHRSSzBNYjFzVDFDaGdhZmt0NDVlbEwwUFRQbnV3dXQrL2srampQYm1P?=
 =?utf-8?B?UHVxQmllN3lHQ3hmZm5mS0NndXZoZnJNWjM1cEZ1dVE1QWdYL044SXV2RW1N?=
 =?utf-8?B?Y25WbzBxZUZNbGtEclgrMXcvWW5aSjNSbUpxVkFSRGpja3V4RVhPVGNOa1Fi?=
 =?utf-8?B?WElaVXg3OERlOFJDc20wN2ljd1dCZFp0Q2RFU2RlNVVScDNsbWdtUzZRbDNY?=
 =?utf-8?B?OGZtOEtBcW1WbkZvK21YdWozNWg4ZkFTbjJJY1BpNFMzM09XamxNSlA4Mkdt?=
 =?utf-8?B?RDE5OGJCM2NtWVpxOCttTDhUWFdENnhYaTB2WnFYOXJwb0VvWlRRU2xUZEhX?=
 =?utf-8?B?YThQWTExMHQ2ZUJjOEM0Y3doa1VncmY4UGNkTmpxby9lTDhaMDROUGZydDFJ?=
 =?utf-8?B?WEFnMTFWeS9MM1duRUdGTXE5ZG94aWpOcVhBMWNDU1EvYXVZLzZ4cDFGeTFv?=
 =?utf-8?B?YWVnU3pKVm1XNXRBRWZvZ2RWMUhGVzE2SEpvQ2l6RSttTHFqSkFueTh1dFRM?=
 =?utf-8?B?RXloMXo0U1FndXZJRDI5T1RabnRISTVXdDNja241ZFNhdmpyUG43cVNVQXEy?=
 =?utf-8?B?TkZxN1lVUFNwZVhkeG5HUFlkYkdzQlRBVkgxUnlaaTE0bGVVNC9Vekg5ek1s?=
 =?utf-8?B?Y1FnODNRNmp6c25NVzZBc1F0Mml6dEN3Ky9CNDBYdkdhUEpoVmR6dGkwY2lD?=
 =?utf-8?B?eWg1Nk9xYUYyUWVvMjZlNmxYOENBdTdadEpXV05rVWhPN0lWc0pUT1ZmbTlm?=
 =?utf-8?B?ZnhnNnl2UWRYV3g1RGs2YWZxV2ZpZGpyRnlKOVBCUGN2SE5sRDBwVVFSMlpU?=
 =?utf-8?B?bFUya3VLZDhOUFhTZWRGYmxBT1d5Ni8ySGplbWQ0Lzkxb1RHb3lpajAyekk2?=
 =?utf-8?B?aXR0UVBtOUkwSmo3R3RzU3Z6MjVyekh3bXAzMWIyWHp5U09MbWhjeGdqaHJ1?=
 =?utf-8?B?UGl0WTFERjkwblpmNG92SDZVZlZYNWhjMHVyWUlGbW16VHk4TFBLN3FOck1W?=
 =?utf-8?B?eHRzdXJCOEZzWGJ0TE1nTVY5b21ENHQvcEtXSHVaOEQ5ZFVzN2dVcEJNTGdW?=
 =?utf-8?B?OU5GUm5Rci9DM1VReUxrRFRoT0YzK0ZBUE56SEd6cHNMYVpQbFBaQ1B1MFF5?=
 =?utf-8?B?QUtWWEhCaEROaWl6UzZYWjAybVpRWVh2MW5vd28zZWpnTmlHTVF0dkNzUlYy?=
 =?utf-8?B?WDBoL3JvUDVUZkpzbDMwNyt0NUxjOTBrdkoyU2JZWFRCcDR4WFZBWnpXRkQ5?=
 =?utf-8?B?b0huT3QzdHNnRmt4MmV0cHNDbXQ0VVhQaitsNEpTQnV0NEFMS0VyY0Jsc0hh?=
 =?utf-8?B?OGdpejFlaGo5anpqb0l4VVdaTU1aNXVReFlJVkZrV3k5Tjd4Q0t6NUJYMklZ?=
 =?utf-8?B?eDQ3RDJYT2oydWE4NUo1Rm1FYnM4T3pHakNSQ1pVYWRNaGdNU3JqMG43L2Fn?=
 =?utf-8?Q?4Dog=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ED9D4B5BB3E954093BD9184DBD241F7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70acd23b-9c24-4207-10b3-08dbfb85d2bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 02:47:18.7369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMQ19nSjwmuDsonLzRgk62lMF8AKrjD9mKGG+89ap0pENbmRxv56J618QFQfF5fKom3I9qWU4Tuqq6IJv5HeVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218

T24gMjAyMy8xMi8xMiAxNzozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEyLjEyLjIwMjMg
MDc6NDksIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjMvMTIvMTEgMjM6MzEsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMTI6NDA6MDhB
TSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
aHlwZXJjYWxsLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+
PiBAQCAtNzIsOCArNzIsMTEgQEAgbG9uZyBodm1fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+Pj4gIA0KPj4+PiAgICAgIHN3aXRjaCAoIGNt
ZCApDQo+Pj4+ICAgICAgew0KPj4+PiArICAgIGNhc2UgUEhZU0RFVk9QX3NldHVwX2dzaToNCj4+
Pg0KPj4+IEkgdGhpbmsgZ2l2ZW4gdGhlIG5ldyBhcHByb2FjaCBvbiB0aGUgTGludXggc2lkZSBw
YXRjaGVzLCB3aGVyZQ0KPj4+IHBjaWJhY2sgd2lsbCBjb25maWd1cmUgdGhlIGludGVycnVwdCwg
dGhlcmUncyBubyBuZWVkIHRvIGV4cG9zZQ0KPj4+IHNldHVwX2dzaSBhbnltb3JlPw0KPj4gVGhl
IGxhdGVzdCBwYXRjaCh0aGUgc2Vjb25kIHBhdGNoIG9mIHYzIG9uIGtlcm5lbCBzaWRlKSBkb2Vz
IHNldHVwX2dzaSBhbmQgbWFwX3BpcnEgZm9yIHBhc3N0aHJvdWdoIGRldmljZSBpbiBwY2liYWNr
LCBzbyB3ZSBuZWVkIHRoaXMgYW5kIGJlbG93Lg0KPj4NCj4+Pg0KPj4+PiAgICAgIGNhc2UgUEhZ
U0RFVk9QX21hcF9waXJxOg0KPj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3VubWFwX3BpcnE6DQo+
Pj4+ICsgICAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJkKSApDQo+Pj4+ICsgICAg
ICAgICAgICBicmVhazsNCj4+Pg0KPj4+IEFsc28gSmFuIGFscmVhZHkgcG9pbnRlZCB0aGlzIG91
dCBpbiB2MjogdGhpcyBoeXBlcmNhbGwgbmVlZHMgdG8gYmUNCj4+PiBsaW1pdGVkIHNvIGEgUFZI
IGRvbTAgY2Fubm90IGV4ZWN1dGUgaXQgYWdhaW5zdCBpdHNlbGYuICBJT1c6IHJlZnVzZQ0KPj4+
IHRoZSBoeXBlcmNhbGwgaWYgRE9NSURfU0VMRiBvciB0aGUgcGFzc2VkIGRvbWlkIG1hdGNoZXMg
dGhlIGN1cnJlbnQNCj4+PiBkb21haW4gZG9taWQuDQo+PiBZZXMsIEkgcmVtZW1iZXIgSmFuJ3Mg
c3VnZ2VzdGlvbiwgYnV0IHNpbmNlIHRoZSBsYXRlc3QgcGF0Y2godGhlIHNlY29uZCBwYXRjaCBv
ZiB2MyBvbiBrZXJuZWwgc2lkZSkgaGFzIGNoYW5nZSB0aGUgaW1wbGVtZW50YXRpb24sIGl0IGRv
ZXMgc2V0dXBfZ3NpIGFuZCBtYXBfcGlycSBmb3IgZG9tMCBpdHNlbGYsIHNvIEkgZGlkbid0IGFk
ZCB0aGUgRE9NSURfU0VMRiBjaGVjay4NCj4gDQo+IEFuZCB3aHkgZXhhY3RseSB3b3VsZCBpdCBk
byBzcGVjaWZpY2FsbHkgdGhlIG1hcF9waXJxPyAoRXZlbiB0aGUgc2V0dXBfZ3NpDQo+IGxvb2tz
IHF1ZXN0aW9uYWJsZSB0byBtZSwgYnV0IHRoZXJlIG1pZ2h0IGJlIHJlYXNvbnMgdGhlcmUuKQ0K
TWFwX3BpcnEgaXMgdG8gc29sdmUgdGhlIGNoZWNrIGZhaWx1cmUgcHJvYmxlbS4gKHBjaV9hZGRf
ZG1fZG9uZS0+IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbi0+IFhFTl9ET01DVExfaXJxX3Blcm1p
c3Npb24tPiBwaXJxX2FjY2Vzc19wZXJtaXR0ZWQtPmRvbWFpbl9waXJxX3RvX2lycS0+cmV0dXJu
IGlycSBpcyAwKQ0KU2V0dXBfZ3NpIGlzIGJlY2F1c2UgdGhlIGdzaSBpcyBuZXZlciBiZSB1bm1h
c2tlZCwgc28gdGhlIGdzaSBpcyBuZXZlciBiZSByZWdpc3RlcmVkKCB2aW9hcGljX2h3ZG9tX21h
cF9nc2ktPiBtcF9yZWdpc3Rlcl9nc2kgaXMgbmV2ZXIgYmUgY2FsbGVkKS4NCg0KPiANCj4gSmFu
DQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

