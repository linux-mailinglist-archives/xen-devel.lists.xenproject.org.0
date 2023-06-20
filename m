Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4E73674F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 11:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551481.861042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBXP7-0008E2-L8; Tue, 20 Jun 2023 09:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551481.861042; Tue, 20 Jun 2023 09:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBXP7-0008Aq-I4; Tue, 20 Jun 2023 09:12:01 +0000
Received: by outflank-mailman (input) for mailman id 551481;
 Tue, 20 Jun 2023 09:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KtNc=CI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qBXP6-0008Ak-7R
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 09:12:00 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe59::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fefb95f-0f4a-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 11:11:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN6PR12MB8592.namprd12.prod.outlook.com (2603:10b6:208:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 09:11:52 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989%4]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 09:11:51 +0000
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
X-Inumbo-ID: 7fefb95f-0f4a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExYa8uybhMekXuxiT9f9xIp32qQwvK6w1eSL8k9wwEbx6jjFXkRbpOpwRdaSUBmcAeUDWOVbLH7W6YwpfojBKPRryVAGhNSpoinxTy9CLtiFnzd9NaNylM9sxcYr3rgWjfWnOofj9w5vGfal2WRM9PE3pWpVv+yFNVQB0PNlGUnFPkjq+kUpM/WiaolwWknQN1d0lSzpsufAKgxIesyYmcTY0lYT4fFxYzkho+qNLdRRB0FZ6fTNjRHYntTGqtsSSO35vnPwCEd1FW4xuXfefEUGvg6bjTYTmwQjQdn9BVOWqYfSI6nhXd6t4QEJnOutiss5c5S7bqWfu5V6J/zCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXCUPVhwbBhr7s2UxEOh6kI/4cG7oRfsZSMfv7HxOc4=;
 b=Spb9BvWDjlsxdcNUbvDBcKiw5jNGtFe469ByzWBfZiDf6/eIzkOk5qHV70gzqSUtQcg2MBXCAF3hFNDVprjyWQc2GSjJU0K6YP2UPmWveOKqCiORtR5pFbDohJegys9BqXPzT5J0JX920rvE8b3mIcUxB+SmqeGfT1SL2ETqMpR2RRZAHcnoLMlOtvC9rOZPMqJw/Yq0YA6tpB1IgxUGiWy9p3CNpqSJuqLwh/DXzWS755AWx2/BZCz4SGt0I3goj5/ydQ3X25LJiYagIcJyC/xNWOunNra066TDRkeIwgLNycT1WyznTCs2ua+jB9b5MSiOcpsQx+4DufJ/u16x1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXCUPVhwbBhr7s2UxEOh6kI/4cG7oRfsZSMfv7HxOc4=;
 b=E1nYqECfQI5NBU+MTMKUGehhJFJudKi+9NdIpUG3miZG/8HR2KBCzBqi65kJz3hw5y7GhwcArYvUMlfT8JXVI9/MO0HHnfessgDUn2bnsWNA5cwnZmcw4VyirvZh7wMMFru1i8lK/lTE+CAEFiY5+KmTuO8+oM1aDCeHMHSpsbs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?=
	<marcandre.lureau@gmail.com>
CC: Damien Hedde <damien.hedde@greensocs.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
	<Christian.Koenig@amd.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia"
	<Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Thread-Topic: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Thread-Index: AQHZmbUjDQZRLEUzRUmYVwd7de4D46+HI2eAgAsCsACAAb/9gA==
Date: Tue, 20 Jun 2023 09:11:51 +0000
Message-ID:
 <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
 <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
In-Reply-To: <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB6553.namprd12.prod.outlook.com
 (15.20.6521.008)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN6PR12MB8592:EE_
x-ms-office365-filtering-correlation-id: 6e21960b-bc02-4b19-1f9c-08db716e62ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3mUpI309Z1YRyYpvBrs8SQtTC4OnFnbhZGPg768g4zcsAIITd5b4rjHixtNssalcMduBEEukA/QfajosL47uU3PzVigB4NI/x+XXFCe2o8W2MVrmjIxDBhM2gtuaaW9N3LbuIgEvEyjr+KB9BbS55MJq4PeOx6nl8QQ65D5pAOUASnWrFaMe8E31+r64f7OdjF3WF4u4dS1yw45OYKLogVOJhem7wySSE3VwT47ZL0Kc3BH0TpsvYOd0SkZvmkuDT/RMvZqj8DB1uuQbgACE4wylpfG8osUcyVjdFFhWpylH1NY0cWaDhKbkV8WCcIZSP78jHNXpIQBsqV2uvYWDR7Tp3e3As8kweTVU4FHtJf5aYZQOqk0wmuMjmgd2JUi4rDqq0yAB9qvDeBfdV/Za+hMDRYCYH2q+fg+6fhJ9iBMLLd4nWUDVbvpWYYCg6civ+/nQxNQUqc5vbPUKWLJb2qQt1NPMHHWerUTz353P9hb6iyk80PG+/7XN7ARYxUpInZFc8fbI3/Dhkrc1EX4m54xS5GvxNWVJf9COdquHjg8D2i9l8uJcqPxOgftPo5oIEuwuxvnCzRUR18QrS6Lf1/WvSU4ahKSDpnfkoT4zes8ZRkQJCy/2UMhiW+TYkeBv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(54906003)(110136005)(9686003)(6506007)(186003)(26005)(7696005)(41300700001)(478600001)(76116006)(66946007)(66476007)(66446008)(66556008)(64756008)(55016003)(4326008)(316002)(53546011)(38100700002)(71200400001)(5660300002)(8676002)(8936002)(52536014)(7416002)(2906002)(83380400001)(38070700005)(15650500001)(33656002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1hhT01JWGluWEp0b21Rbi9KbE9HUVRPZlEzY1EzS1paQWZ2dmFxWmRPdzUx?=
 =?utf-8?B?VHkrUGZzOXIyM1ovY0N4KytmOUJjV1RHWnRndWh1WGFxNWVqZkozb21lMWpa?=
 =?utf-8?B?MkpQdVVxdEpsakg3V3VoNVV5OWJlakhLRUVwNTFkN0Z3VXJ0OGJKTGxlcGNr?=
 =?utf-8?B?UlQ3OEZGb3MwZ0VLeTZjMHprZ0pMRFp2bXY5NkptcXc3VlFzeGRKT3FWTThK?=
 =?utf-8?B?Tm01UXl6RUdZcXNVWGxRNzFTNVFFRG9zT1VuREFoSFdxakw2OWVuRCtpWHo0?=
 =?utf-8?B?alJ0MzBQQ2pFa2o5c1pNUHArQmlGeXhEVmNUK213c2hBWElhS3RrUkdVbDl4?=
 =?utf-8?B?UklKaVBkYmJObTNlUlhJOTFuTEZ4Sm9mYU12MlNXVGh6VmtIU3ZhT3owZGF4?=
 =?utf-8?B?Q2lPd3krR0xnUzQzN0RFOWFCMXBySkRmOW81eUJEOWR3RDVLVjlQclBNWnRo?=
 =?utf-8?B?cnl6MHIrNmRSZVpNSXBLRkRMOXZ6empRWjcvQlJxamNKT0pEeTVXS2ZhTGpH?=
 =?utf-8?B?aVFBVkJ6dE1HczdSdE5ON0VVV2plN3gzeTdIc0tGWHR4L252R0ZNYWxaVEJq?=
 =?utf-8?B?K2R3LzVmWDdyeXJZY0FoNlRtbk9WWjNMSjR0TzhUSmp0U0RtQVFab1JkaFlH?=
 =?utf-8?B?dVEzMXZDUVdoL2ZrRC9UbGRqVTdrWWxHcHFwL0paVVNUNWlSMzd6dTdEeFY1?=
 =?utf-8?B?RGtoUFNIcWJZcU9iNDhTZ21yTjhDM1JXOXBXeWYyUDdrVWNUTSt0UFVrNC94?=
 =?utf-8?B?eUpsUlUrRk04QTVXNzZkb2JSbVdJUlNHVFBqSEp1UnJmZ0lwbW1LNkFVZUJp?=
 =?utf-8?B?dnh1eDRxYnFsSXRoMVJhcTFhQ25xeEZjU05iM0x0OEZwWXFLbWtwdW1yMnJO?=
 =?utf-8?B?dk1UNFhUNHB4RHdFMGo2K3hzc3FvRkVWT2xMdVF5NitJWFd0RURZQ0ZvaGt5?=
 =?utf-8?B?b3Uwc29kaUtBMk5QVWpqOFFiYkpJNVNRZlQyZHRQSUY0djQwdG0vQ25sem9s?=
 =?utf-8?B?dUNBR2Z3VWllQ2xsYWFsQjVDNFQrT2lMQ0tENDlNaFBZV2ZXQlJVeEN6V01B?=
 =?utf-8?B?bm1nUTladk03dDUwNTJwcjNmNXdOQkx6STZ5VWJaMUVCU21EcHQrSmR2Z1lq?=
 =?utf-8?B?S1NVVVA3Smxlcm9ad2dPbnhsZVA1cU0yeWdPRllwNFFlR2lUS3hYYXJJWW0y?=
 =?utf-8?B?QmphYzd2U1p4S1VJci9OUzA3Q3dXWFRlQ0kwbCtTZVh0WnBZOG8xWGxIVzNH?=
 =?utf-8?B?VzhhQTJUYVBhLzdaQnJlS3RCUDVQSi82YmlibzZKMUVqQjk3UVBkWVFqSWo3?=
 =?utf-8?B?Tlk5ejI3dTlRUlZSbnVvalpaYzVhVExLV1RTVjhyUExBSE10ZmxYd2Y0TFU5?=
 =?utf-8?B?Z0l5RVVOWFJpMGxOeFVicXkvSlFYaVlzQkdMTHE3bUkwY3FIbzNBR3lTNTU5?=
 =?utf-8?B?T3RuWSt2b3kwTUhrU0c3TnJUbDcvZVBXZHNXTWcrOC9YaXZ3WmhmSkNXTVJQ?=
 =?utf-8?B?RERzdlZSN0VMTHVsby9XdXBxbnNuQm15bCtubi9ZQVgxcytpVkExRDFDRWpa?=
 =?utf-8?B?UFgzS2Y2NzRLSFc5NDQwWDVlZkx1Y040UG5iaTZzRWUweGw5d280YTJhQWhY?=
 =?utf-8?B?aWFYRUorbFk0anVTL0h1OU53Ylc4djd4Nm9zUVRXekhkSlF4WWp3eTcyMlpr?=
 =?utf-8?B?QXFpSEJTMlRKb1JSc0g3UG1GWkhDUWJkMWV2akZVeHN3QjVMMkZyTzlwYnZt?=
 =?utf-8?B?b1lyZFdKQ3FlRFJ4RXZvaW51NmpPWXpES0E0eWFDWmFpeFpWdkhGRXgwSDd1?=
 =?utf-8?B?TjdIZTczN1B1bUNLaWdwQlhqa1RFVHFBOHFNc200T3JVUWQ4RVhlaU5sOXla?=
 =?utf-8?B?WDRuWEpPVksrK1B2K1pjdFhZOCtQSmRPdnNZUEtVQzM2RmRaNHh4TU9LSmN4?=
 =?utf-8?B?eXRUTkh2Y0p2Tk9SL1hNc3N6VW9keHdSSkUwd1ZWYjNjb3I4RTlYZ1JtV21D?=
 =?utf-8?B?eDZlcDRjZ01XSFBqM0tYN1lQOUIvWFY3VVFUT3Qwb1JveXRpcTdTTHRjZXBK?=
 =?utf-8?B?bUFDY3dWNzFJUWJod0ZpUEJpY3NvUG1NNGVCK3V4OUFqSk9UbXlUZ3lBV1Jw?=
 =?utf-8?Q?eOk0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7209F384005F3140AFCA65FDE8AB3F16@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e21960b-bc02-4b19-1f9c-08db716e62ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 09:11:51.8724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfOKyGmAXSqvRc5iZVXUKW/A4Ex1MCN0xNiS2f5f9THZhITpvOCdDgp+ksFzcl34IDBOPXBCRdIL5ErU7W6kPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592

SGkgR2VyZCBIb2ZmbWFubg0KDQpPbiAyMDIzLzYvMTkgMjA6NTEsIEdlcmQgSG9mZm1hbm4gd3Jv
dGU6DQo+ICAgSGksIA0KPj4gQWRkaW5nIGEgbmV3IGNvbW1hbmQgcmVxdWlyZXMgbmV3IGZlYXR1
cmUgZmxhZyAoYW5kIG1heWJlIGl0IHNob3VsZCBiZSBpbg0KPj4gdGhlIDwweDEwMDAgcmFuZ2Ug
aW5zdGVhZCkNCj4+DQo+PiBCdXQgSSBhbSBub3Qgc3VyZSB3ZSBuZWVkIGEgbmV3IG1lc3NhZ2Ug
YXQgdGhlIHZpcnRpby1ncHUgbGV2ZWwuIEdlcmQsIHdkeXQ/DQo+Pg0KPj4gTWF5YmUgaXQncyBu
b3QgYSBnb29kIHBsYWNlIHRvIHJlc2V0IGFsbCBHUFUgcmVzb3VyY2VzIGR1cmluZyBRRU1VIHJl
c2V0KCkNCj4+IGFmdGVyIGFsbCwgaWYgaXQncyBjYWxsZWQgZHVyaW5nIHMzIGFuZCB0aGVyZSBp
cyBubyBtZWNoYW5pc20gdG8gcmVzdG9yZQ0KPj4gaXQuIERhbWllbj8NCj4gDQo+IFRoZSBndWVz
dCBkcml2ZXIgc2hvdWxkIGJlIGFibGUgdG8gcmVzdG9yZSByZXNvdXJjZXMgYWZ0ZXIgcmVzdW1l
Lg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbiENCkFzIGZhciBhcyBJIGtub3csIHJl
c291cmNlcyBhcmUgY3JlYXRlZCBvbiBob3N0IHNpZGUgYW5kIGd1ZXN0IGhhcyBubyBiYWNrdXAs
IGlmIHJlc291cmNlcyBhcmUgZGVzdHJveWVkLCBndWVzdCBjYW4ndCByZXN0b3JlIHRoZW0uDQpP
ciBkbyB5b3UgbWVhbiBndWVzdCBkcml2ZXIgbmVlZCB0byBzZW5kIGNvbW1hbmRzIHRvIHJlLWNy
ZWF0ZSByZXNvdXJjZXMgYWZ0ZXIgcmVzdW1lPw0KSWYgc28sIEkgaGF2ZSBzb21lIHF1ZXN0aW9u
cy4gQ2FuIGd1ZXN0IHJlLWNyZWF0ZSByZXNvdXJjZXMgYnkgdXNpbmcgb2JqZWN0KHZpcnRpb192
cHVfb2JqZWN0KSBvciBvdGhlcnM/IENhbiB0aGUgbmV3IHJlc291cmNlcyByZXBsYWNlIHRoZSBk
ZXN0cm95ZWQgcmVzb3VyY2VzIHRvIGNvbnRpbnVlIHRoZSBzdXNwZW5kZWQgZGlzcGxheSB0YXNr
cyBhZnRlciByZXN1bWU/IEkgdGhpbmsgdGhvc2Ugd2lsbCBoZWxwIG1lIGltcHJvdmUgbXkgaW1w
bGVtZW50YXRpb24sIHRoYW5rIHlvdSENCg0KPiANCj4gdGFrZSBjYXJlLA0KPiAgIEdlcmQNCj4g
DQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

