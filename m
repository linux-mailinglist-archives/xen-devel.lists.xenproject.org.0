Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0685F1A2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 07:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684198.1063909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd2t5-00047Z-Nd; Thu, 22 Feb 2024 06:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684198.1063909; Thu, 22 Feb 2024 06:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd2t5-00045Y-Kq; Thu, 22 Feb 2024 06:48:55 +0000
Received: by outflank-mailman (input) for mailman id 684198;
 Thu, 22 Feb 2024 06:48:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9EN=J7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rd2t4-00045S-B2
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 06:48:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fae7a68-d14e-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 07:48:52 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 06:48:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa%5]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 06:48:47 +0000
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
X-Inumbo-ID: 6fae7a68-d14e-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiqJcXYUmILCMol7m5G5CXvKI4Txm5VVPmAailYx2C/QmhehQB2p3i0pmJEWN2MfczEyzzr6Mm2Tcz0uQfaYMsCsb9rfeYnKVz6JX4PSQW1/TxbHqzCrADsAZ04EFEnHmFNcfYKCWU/8zXJYn94ICxNXxa+I+wldn/dGD8dwD56BO7Uzd9/RMRVdgOmHcS4oc6NWUyCongdJaPYAenRepYOmGtkjrPus2eNKTgo7Qg60CLH6eT4Yxsj12fqhcYDDbCH/QxLjXqa1bTyEWkcm6dEj75QYdD+TMhEISLzr0wqOh1TT836OUpZT4EtvliMb82Y9i0UYJ8/7jvrdL6ekPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Nfz7P6UJHvUs6YcEs4ycdOvGyo632KuQH4oNfnI+78=;
 b=Q37wswcbCTUs7+BFvvJR2rPo4MT4e2Ji7b1ROqcnU6aTGPp0S++F0JjZwIi6XwKOYHr4YE6e9qXyN3fkKKFjMPIx4hToRfd3w/PVHcqLg/9EKZgIxrK7dREPuaZFPjANXR+KN/wHZrRPS9QnWvb7YlT8QpNC/6c/6pSRC7Sh5zZWctbTMUq+2dzDdHDE548ezzw87WOMoNHycYzEO6MSLzElxcNePKe6CRDfm4vq37KbPcZ8kLRtsQMhM7CbH5GRbI5IdhnJngiOF/d/UE0Y6q54wCuFyPEy4dHchGLFY2jkq3jG5W+DDE1J/6mIwvalegoRqathq73AUK8sfs2xvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Nfz7P6UJHvUs6YcEs4ycdOvGyo632KuQH4oNfnI+78=;
 b=B6KIOOwmUHByXCbq7fNyCO6z6Wi7IK2BVa/l26eLOzngIPs/0DKssUiWwYkfSinOdoojLu4WibEBYjFzhv4DFvEsSPP9ruf8fy9llWGy+WW3KS4PzeCZTCRAjMm2NXnCd5LN1pf/WWTzCcPC5veOWIft8HCMMEU0eYzr88e360A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony.perard@cloud.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v5 4/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Topic: [RFC XEN PATCH v5 4/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Index: AQHaRR630AyI7Bl4yEKb4z8ADq0CA7EVDEGAgAGgyAA=
Date: Thu, 22 Feb 2024 06:48:47 +0000
Message-ID:
 <BL1PR12MB584975750099A63AA77CA013E7562@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-5-Jiqian.Chen@amd.com>
 <cf52f61b-1cf2-48e6-a3ba-7cdb12adacfa@perard>
In-Reply-To: <cf52f61b-1cf2-48e6-a3ba-7cdb12adacfa@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL0PR12MB5539.namprd12.prod.outlook.com
 (15.20.7292.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW6PR12MB8913:EE_
x-ms-office365-filtering-correlation-id: 2e2a663a-8840-42ba-aefc-08dc33725221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lhXO0ygu3cWRMc87m8iJqskO4/I7/3gtNXr8rnueqy+urjjlw01bw2eesS4aSLhBbWUSCMC/cymH6SDvnG0iGbt2ZQg0KmluZ9yLqyw2QgPWIsWVp30Jd2GDeSPngicLwL/JN/4Hz3XpAYXkgdi9fcnojPDe1em/wGpKndZUsCRuuKqmzsIg5BSjvE+k75Iq8cIfb4WAFI70duzFKjODW0e2BLPfyDLfuf8Q9+JxcM8PpQmBX7lQGHLiEWBEzRqSGl9WY3baThsyimyy6tM1eSr5FEikQBaThHqGDGZeSXihsbc+QCHd9cNTpdjtzgK6uusNeLwiHj9qtYdK6M6vVlNkEBoaJXQoDRtcjguwsjNfz1DdE6U6pCXJaVzpoPi4Q76/vPLqt7kAL7N+CLTEeOGQFnmIEPBOBe6sPkZR+K5SuG3bMtUh3PYAR/XRpyxwhGTC3rkFzyN1pzDCs20vFE/0XOaSjncaY0Ix849AeOSzAi/PIznvf7s3m9B6OttD1OTGjOB0iR647RfR3OHvPXjCnNidqCU4b1jUBdaWj04FkzSFcmvuJ6Njf7tAU1BGtnCznM37HWREAGcd4OUwiu3jVQwpFMcKbA4UrkrYa0xSSTnN+2YalOMtfQVp4G12
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUlOa1ArY0xNbDNFVEUrajFpN0JZZU1RL1NCVVVKRTNjd1ZNTWpkRXRWU0dT?=
 =?utf-8?B?U1dIb3RINzBWK0Q2dVFhK3Q0QVYwNHZ0b1d0NlRKQTBOejZCOU9idTZPZHp4?=
 =?utf-8?B?RkNhclBVRjN4WUZLMmFycFh5STN5V3dDNVpxeVBmUjFVOWtCY0J4cnExSVZM?=
 =?utf-8?B?QVRJM1I5Ty93TGs0ZTFadlhMVmJWbmdBUWxhbmNneG5UbjJaeUZZYUdmQkx3?=
 =?utf-8?B?V2t4YkpYcUtZdUtiT0FsRXpOeWtiQldoTnZNRTVRQ1pDUTVtSG8zM1hPY0ZG?=
 =?utf-8?B?NWJrTXNVZW5hbzFWbDU1TmxoTlJGa2I1ejRZbDZJMW9tdXFvakFvVGhrMHpW?=
 =?utf-8?B?S0lHU3BYN005VjRiUmp2elU0bnVtZWtzMFA1cGJIZHd6aDZabHFSb2JxK2E3?=
 =?utf-8?B?YXlxRWlQRUpicFNTbGRuUjlxbVZMNFhLY1A5SFV2UG5KcTRMVXVlQktZYVZC?=
 =?utf-8?B?OGVyTEdSRXZEL2JlM3FFaXRSOHhBWVFJd3ZFZ3BDZWxlbllCaU1tVzVjR1Bx?=
 =?utf-8?B?YVJ2T1ZxVk10b2d6VndjeTZ4dHByVVc0SUt4THpGOXMzbGM5T3JqckJlLzlS?=
 =?utf-8?B?UXBVT3d1VW91dWhhTGxxUkhGSWN1dEk0U3BrM0VudEtwaENhbWs5TWJ2dDdV?=
 =?utf-8?B?Q1Zoa0JxTjFaYnlwR0ZUOFNkK0VXeCtNa0ZuZHhRMXFkdVM2QncxMDlZem52?=
 =?utf-8?B?VHBYSktDN3dNbmJodkMyWEFIaENZUVFzbC9BeTMxOHI1dnEvVERwQ2ZhYisx?=
 =?utf-8?B?WTMwRWJCbmNvZFZ4RVhzWU8vdEtmWFBvQks3Rm5OUDZCbHBIRXM1QzY1bStm?=
 =?utf-8?B?YXUyS3Fla004RWdCL2lGdzRrVzk1eDBRcHJYODF6ckNxamxPckxtaUlmVlpZ?=
 =?utf-8?B?Y2pncTlpb2k5TWVOTWZyUzI1ZU0zQ0dCeUt1TnJLdmo0SE0xcmp0NlZIOGVw?=
 =?utf-8?B?YmJPay90WXlsWWtCUUNkZlFiVDczbnA1NVR4RnZmWW5oOXMwNk1BRDhOL3VB?=
 =?utf-8?B?QllIay9lL3RhVUF6Q1ltbDdOQUx2cGtzWTNrdVpoWmt2cDUxUXRDcmpxUXpI?=
 =?utf-8?B?SHlmRVZKQ25HL2ZwenhsbDBaZzVkYm5mNm0zSHhBa1VUdFpRVGNUYzFWOWFm?=
 =?utf-8?B?NnFPd1ErUjd3Q2tiZUpOMGJkZ2xDTVZ2WXRVZm1RZWhVZnh0dDYwb1FzdmRv?=
 =?utf-8?B?RngwY2c5YWNuUUwxUEhobW1adWlKelE3RVkwYjBUMDdxMzNVVVhVK2NWa2lk?=
 =?utf-8?B?Q3d0SzFSNWVtOXkrRDhTVGhnQmxnNGFmN05ndE81bVRmcXVVbXk5emF2NlFC?=
 =?utf-8?B?aEwwNFZtRXd4RlMzNU04a1FGTk9SdUp4WW5mSkk1U3ZEd0I4SzROWmxobEhj?=
 =?utf-8?B?UlhXdHI4aEN0ZjBpZnVvTlpadGxjVEg0OVZBYmNpelpEOHhDaDR5c0tUQ2dV?=
 =?utf-8?B?ZWJsT2NjR3lvamxSUmtpSlFwWFZEdUZ0WWhUSEI1YjVobDR3WnNsUUJjTzNz?=
 =?utf-8?B?dnIvUlozR1BGalBwWjZSWGVyeURaR1FsSUNjdTh1THVXQWVzZTRpLzU3bFNP?=
 =?utf-8?B?OTNReWQ2RUpZMzl5WEQydE42dkU0SEtyMCtNM3hlejlCaWRtNG9ZbXBJTE9B?=
 =?utf-8?B?UE9jZlBDVkV5L012cWU2TFlPT3A3SFZTVlk2cWJuam5tVFBUQTBIUkczNDJ2?=
 =?utf-8?B?c0tKaHJYbG9kSTg1NDRYT05rSkhvUm12cDFJS1NVK1RXYU9SOGt3a3cxUUo3?=
 =?utf-8?B?N1FubDNRSGhoeStTVXNpZ0ZaYXFlcXdnSEZiYnhKNjN4R201Y1VuSUUwNTRt?=
 =?utf-8?B?N0F0TWVJUHJ4RU9wYnJpTmN4OU5GVnkvdElMR1RSSEpDNmRnUnNBZ212dXBC?=
 =?utf-8?B?VFJ0UHJteUsvckIyS0NkRnF3OWYzaDN4emdScCtpbWx5c2FpME5GcDZsYjls?=
 =?utf-8?B?Z0JnQm03RlNGMVdMY3ROQUltQ1pVcDVTOHpURFdCeG1mL29sOHNtbklqc29m?=
 =?utf-8?B?SGRScVZ1eWNKV0VZR3lyQU5td0lndHJhYnBFYTlTK1hrK2d6dWM1cEtrTXZV?=
 =?utf-8?B?dTd0UHZ1YUdDeVR2T1VNWWxlanIvTkwzM0QwaXlVM2kvNUIxQXVuWS81Q05q?=
 =?utf-8?Q?MB1M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03CC3E8A67D46748B45C761E56D658F4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2a663a-8840-42ba-aefc-08dc33725221
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 06:48:47.6517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uGdlNRJChCO6+7ilYdirkuMt5kMZwi7OKXpA9IkPBQMFrHDHbXCWMQ8snaX6j9b4AshG1/SPnAA2XbbkwDBXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913

SGkgQW50aG9ueSwNCg0KT24gMjAyNC8yLzIxIDIxOjM4LCBBbnRob255IFBFUkFSRCB3cm90ZToN
Cj4gSGkgSmlxaWFuLA0KPiANCj4gT24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgMDI6MTM6MTZQTSAr
MDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJbiBQVkggZG9tMCwgaXQgdXNlcyB0aGUgbGlu
dXggbG9jYWwgaW50ZXJydXB0IG1lY2hhbmlzbSwNCj4+IHdoZW4gaXQgYWxsb2NzIGlycSBmb3Ig
YSBnc2ksIGl0IGlzIGR5bmFtaWMsIGFuZCBmb2xsb3cNCj4+IHRoZSBwcmluY2lwbGUgb2YgYXBw
bHlpbmcgZmlyc3QsIGRpc3RyaWJ1dGluZyBmaXJzdC4gQW5kDQo+PiB0aGUgaXJxIG51bWJlciBp
cyBhbGxvY2VkIGZyb20gc21hbGwgdG8gbGFyZ2UsIGJ1dCB0aGUNCj4+IGFwcGx5aW5nIGdzaSBu
dW1iZXIgaXMgbm90LCBtYXkgZ3NpIDM4IGNvbWVzIGJlZm9yZSBnc2kNCj4+IDI4LCB0aGF0IGNh
dXNlcyB0aGUgaXJxIG51bWJlciBpcyBub3QgZXF1YWwgd2l0aCB0aGUgZ3NpDQo+PiBudW1iZXIu
IEFuZCB3aGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNlLCB4bCB3YW50cyB0byB1c2UNCj4+IGdzaSB0
byBtYXAgcGlycSwgc2VlIHBjaV9hZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycSwNCj4+
IGJ1dCB0aGUgZ3NpIG51bWJlciBpcyBnb3QgZnJvbSBmaWxlDQo+PiAvc3lzL2J1cy9wY2kvZGV2
aWNlcy88c2JkZj4vaXJxIGluIGN1cnJlbnQgY29kZSwgc28gaXQNCj4+IHdpbGwgZmFpbCB3aGVu
IG1hcHBpbmcuDQo+Pg0KPj4gU28sIHVzZSByZWFsIGdzaSBudW1iZXIgcmVhZCBmcm9tIGdzaSBz
eXNmcy4NCj4+DQo+PiBDby1kZXZlbG9wZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5j
b20+DQo+IA0KPiBUaGUgIkNvLWRldmVsb3BlZC1ieSIgdGFnIGlzbid0IHJlYWxseSBkZWZpbmVk
IGluIFhlbiwgaXQncyBmaW5lIHRvIGtlZXANCj4gSSBndWVzcywgYnV0IGl0IG1lYW4gdGhhdCBh
bm90aGVyIHRhZyBpcyBtaXNzaW5nLCBJJ20gcHJldHR5IHN1cmUgeW91DQo+IG5lZWQgdG8gYWRk
ICJTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPiINCk9rLCB3aWxs
IGFkZCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gQmV5b25kIHRoYXQsIHRoZSBwYXRj
aCBsb29rcyBnb29kLCBJJ3ZlIG9ubHkgY29kaW5nIHN0eWxlIGlzc3Vlcy4NClRoZXJlIGFyZSB0
d28gZW5jb2Rpbmcgc3R5bGVzIGluIHRoZSBjdXJyZW50IGZpbGUsIGFuZCBJIHdhcyBhbHNvIHN0
cnVnZ2xpbmcgd2l0aCB3aGljaCBvbmUgdG8gZm9sbG93IHdoZW4gSSB3cml0ZSBteSBjb2RlLCBp
dCBzZWVtcyB0aGF0IEkgbWFkZSB0aGUgd3JvbmcgY2hvaWNlLg0KVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgeW91ciBzdWdnZXN0aW9ucy4gSSB3aWxsIGZpeCBhbGwgY29kaW5nIHN0eWxlIGlzc3Vl
cyB0aGF0IHlvdSBwb2ludGVkIG91dCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+PiBTaWduZWQt
b2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IFJldmlld2VkLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+PiAtLS0NCj4+
ICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysr
KystLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIGIvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4gaW5kZXggOTZjYjRkYTA3OTRlLi5hMWM2ZTgy
NjMxZTkgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiAr
KysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiBAQCAtMTQ3OCw4ICsxNDc4LDE5
IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAg
IGZjbG9zZShmKTsNCj4+ICAgICAgaWYgKCFwY2lfc3VwcF9sZWdhY3lfaXJxKCkpDQo+PiAgICAg
ICAgICBnb3RvIG91dF9ub19pcnE7DQo+PiAtICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lT
RlNfUENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWluLA0KPj4gKyAgICBzeXNmc19w
YXRoID0gR0NTUFJJTlRGKFNZU0ZTX1BDSV9ERVYiLyJQQ0lfQkRGIi9nc2kiLCBwY2ktPmRvbWFp
biwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRl
diwgcGNpLT5mdW5jKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBhY2Nlc3Moc3lzZnNfcGF0aCwgRl9P
SykgIT0gMCApIHsNCj4gDQo+IFNvLCB0aGUgY29kaW5nIHN0eWxlIGluIGxpYnhsIGlzIGEgYml0
IGRpZmZlcmVudCwgZmlyc3QgY291bGQgeW91IHN0b3JlDQo+IHRoZSByZXR1cm4gdmFsdWUgb2Yg
YWNjZXNzKCkgaW4gJ3InLCB0aGVuIGNoZWNrIHRoYXQgdmFsdWU/IFRoZW4NCj4gImlmIChyKSIg
d2lsbCBiZSBlbm91Z2gsIG5vIG5lZWQgZm9yICIhPSAwIi4NCj4gDQo+IFNlY29uZCwgdGhlcmUn
cyBubyBhcm91bmQgc3BhY2UgdGhlIGNvbmRpdGlvbiBpbiB0aGUgaWYgc3RhdGVtZW50LCBzbw0K
PiBqdXN0ICJpZiAocikiLg0KPiANCj4+ICsgICAgICAgIGlmICggZXJybm8gPT0gRU5PRU5UICkN
Cj4+ICsgICAgICAgICAgICBzeXNmc19wYXRoID0gR0NTUFJJTlRGKFNZU0ZTX1BDSV9ERVYiLyJQ
Q0lfQkRGIi9pcnEiLCBwY2ktPmRvbWFpbiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5jKTsNCj4gDQo+IEhhcyB0aGUgZWxz
ZSBwYXJ0IG9mIHRoaXMgaWYuLmVsc2UgaXMgaW4gYSB7fS1ibG9jaywgY291bGQgeW91IGFkZCB7
IH0NCj4gaGVyZSwgZm9yIHRoZSBpZiBwYXJ0PyBUbyBxdW90ZSB0aGUgQ09ESU5HX1NUWUxFIGxp
YnhsIGRvY3VtZW50OiAiVG8NCj4gYXZvaWQgY29uZnVzaW9uLCBlaXRoZXIgYWxsIHRoZSBibG9j
a3MgaW4gYW4gaWYuLi5lbHNlIGNoYWluIGhhdmUNCj4gYnJhY2VzLCBvciBub25lIG9mIHRoZW0g
ZG8uDQo+IA0KPj4gKyAgICAgICAgZWxzZSB7DQo+PiArICAgICAgICAgICAgTE9HRUQoRVJST1Is
IGRvbWFpbmlkLCAiQ2FuJ3QgYWNjZXNzICVzIiwgc3lzZnNfcGF0aCk7DQo+IA0KPiBUaGlzIGVy
cm9yIG1lc3NhZ2UgaXMga2luZCBvZiByZWR1bmRhbnQsIHdlIGNvdWxkIGNvdWxkIHNpbXBseSBs
ZXQgdGhlIGNvZGUNCj4gdHJ5IGZvcGVuKCkgb24gdGhpcyAiL2dzaSIgcGF0aCwgZXZlbiBpZiB3
ZSBrbm93IHRoYXQgaXQncyBub3QgZ29pbmcgdG8NCj4gd29yaywgYXMgdGhlIGVycm9yIGNoZWNr
IG9uIGZvcGVuKCkgd2lsbCBwcm9kdWNlIHRoZSBzYW1lIGVycm9yIG1lc3NhZ2UuDQo+IDstKQ0K
PiANCj4gQW5kIHdpdGhvdXQgdGhhdCBlbHNlIHBhcnQsIHRoZSBjb2RlIGNvdWxkIGJlIHNpbXBs
aWZpZWQgdG86DQo+IA0KPiAgICAgLyogSWYgL2dzaSBwYXRoIGRvZXNuJ3QgZXhpc3QsIGZhbGxi
YWNrIHRvIC9pcnEgKi8NCj4gICAgIGlmIChyICYmIGVycm5vID09IEVOT0VOVCkNCj4gICAgICAg
ICBzeXNmc19wYXRoID0gIi4uLi4vaXJxIjsNCj4gDQo+IA0KPiANCj4gQW5kIHRob3NlIGNvbW1l
bnRzIGFsc28gYXBwbHkgdG8gdGhlIGNoYW5nZXMgaW4gcGNpX3JlbW92ZV9kZXRhY2hlZCgpLg0K
PiANCj4gVGhhbmtzLA0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

