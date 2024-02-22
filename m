Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D837185F1D8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 08:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684215.1063930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd3Pw-00017n-Kr; Thu, 22 Feb 2024 07:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684215.1063930; Thu, 22 Feb 2024 07:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd3Pw-000165-H2; Thu, 22 Feb 2024 07:22:52 +0000
Received: by outflank-mailman (input) for mailman id 684215;
 Thu, 22 Feb 2024 07:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9EN=J7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rd3Pv-00015z-2w
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 07:22:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e550cfc-d153-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 08:22:49 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.22; Thu, 22 Feb 2024 07:22:46 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa%5]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 07:22:45 +0000
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
X-Inumbo-ID: 2e550cfc-d153-11ee-8a55-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoJ5NQLRYoR1WXSWOH/LQoy/hWfuGFYKx1hr8Xo5d0G6s65x/WpG5HSYJWMI81wdn87qFlJbaMjUFRIo/JweO/jvp1v7rYFlWlLEQwBto/DIpjKj5R2gny1zpSOF+PXGV1NJaaF9g9sDtg36gzWbDUks1jds0xTnVHxSYIS7oBd3Nx9AR8gPz8qld15keeZ0SUPnDgsDQXrc4eUKeIrnvLDGbSz3qNpG7yS27HwQ+HF1/cED7Gc1JOo8gmvJ3q5MDOW+2ujPEV1SKh8h1ogga+0mmyzJ8TllVdmc8Yd8IXBqzPon8JnK7i3XAimfa0/CugSjmpN2G19y7Z6gw7qnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/loTcbC9TVRCF249PAs5O2zhfdT+KpcAMI8mcyq5pU=;
 b=jbnimwtK1SPxcTJizLTOTCZ1QYjnG2L+2AK3CAOrQ4tBCtsWdfOFrXfsGdTPAazmZCa9FoVrWWZAN6ibWAc80Hn687DqI3fUtJvwcbT5PJW//lmej4bf+/bXiWLBmj2klwSmmCxhus/fwtw5UVADAUfQu6JSv90aldEk9GdywC6ilYLhS0RxQ9NXL3DhIqMFuRWipRZdMOY1gZ+iCD73PXOY0cqkOGNOtPIjhKP/5lDl2P/YjstctrzGyZffUKx0c8Trs4uQaD4rk0gXCTR3SZiTxjAEQjuA8kOuCAYgBCHIaEqhtMpFqM7fPdB3VC8/eCLQ+BU/wQ6VTyDS3R4ZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/loTcbC9TVRCF249PAs5O2zhfdT+KpcAMI8mcyq5pU=;
 b=rzniROR4/lGylXkgxBSEqN1aMl9XRf/R3twjL0cIR0qbJZkbNrjBxZS2YP/RiMxWGv8otB69HOHdSbQ8VJdmzIxG9ttsgcMgzl5lfKj9ZoMpVUQ91ZFoBIN6LPXQqbNMBCMwN+D1HJQsGnw2etVMkGcLaDeLRoWQwpnM4r+pmhM=
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
Subject: Re: [RFC XEN PATCH v5 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v5 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHaRR65Xby346gk7ESzHNZtxrKssbEVI+YAgAGO+4A=
Date: Thu, 22 Feb 2024 07:22:45 +0000
Message-ID:
 <BL1PR12MB5849F3787ED9245E6986872CE7562@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-6-Jiqian.Chen@amd.com>
 <09290ba4-6915-4f0d-8e16-3e14713d02ba@perard>
In-Reply-To: <09290ba4-6915-4f0d-8e16-3e14713d02ba@perard>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6373:EE_
x-ms-office365-filtering-correlation-id: 1e472d82-4344-4afa-b31d-08dc33771104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ixJbzSjFVPiz+7iS6eOCoL3ZxqEvHEUUFnAU5xLwxBNxZRF+tzurGH7c8IP+gda05BEtcRFDGD8//wVbntEATbUQ8GHP6mvVeGYobwKIMa3BwYpaXskegsgYq24ifgGyOThqDuyxyRm+nRGrDc2C0l7cdX0Hg9iIULx5f39hWJ22OVhFvCQ5Jxl0M9gQd5zCcAqo4e9cO0XwjAcZvNRHXRwauAGKMqZtUbSd/WaWQJOoh6egl/J3yt9q/ZJOTPlrRyAk1l0jfU26OpyIHwKJu3XoKeDxsKPdDouosck56MQnh7b4p+lOP+iw1vr+F/bA/hPapw7KiC2n59fQRz47A05T2bRpHgwSm30xbTVcuy3g6drMUdT1jmpZQQaCTkoWIZrjPYMT/SKWVgYqvoRR+RHbHPLAySyOddDswDIoV1/M4vKiBoCFPVTUN0pR75A7OLmqbaUCs8s5+hul+z1+fa+JVgTX7d00S4BVqnXMAjaUPj79+CNJ0Vg4LrK4YR6G8QpXPT3iTZRAuxYKoocjo5JTRkBHXm9rr5o8r4TexCMAip439H+25pLf277B95t9/j4lnKmeniVaW1G/SAn07AF90fCwxZG5IojDPF8PjG0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjNldFlmWnl3UUZIQnZVc2M3MUhVckMrbkxXUlUweUVHS04yblJzakxCaC9j?=
 =?utf-8?B?QWFrMDNXc0x6dFhMcEtIeHQ4ZFlhV25haVI3UGV3RVlNZnl1UHJEUkNFb0U2?=
 =?utf-8?B?YUJkbE1PVjYzbDlUYVNkMFplcCtnaWg5R0tOMmxqdXFhbFlCSVQyLytZQTgx?=
 =?utf-8?B?d2hXZE82RDA5RTg4UEVuUHM5ZHVxMmFza1Vsb3g4Q09BZzMya2NhcDV3R2Rs?=
 =?utf-8?B?YWVHV1R1VVBCeXJ4QWUyZHFTcmZzUDBaaVpMVUMrVitHbVRVNlZuV2FYTDFi?=
 =?utf-8?B?SFJJQlNuQ3VFdzgvVWR1ZHRnb3JZU1NrSlM2YmMzTjYvb2tKTHJyWlQxTzZZ?=
 =?utf-8?B?RU1NMitzWlV3VEloWC9KUmQ0Qm5wZUJMbzYyNXdwb0VCUGJuSlFldVRRL1JO?=
 =?utf-8?B?MENMelBUaC9LRU9YWjlXbXN6V1pvMW9GdGNLbk5sSU9FOUdwcTc3ckpHWTBM?=
 =?utf-8?B?SFpPSmFzUlJiaGVoWEZuSVVMTFZ4SUE2dU53ckV3dDBxbGxDRVliTndnUnAx?=
 =?utf-8?B?NDE5MDBLN0VEQXRHck93QUtWeHJGOWNOZXBnU3BqdDhwa0JMbHo1cFptTjZq?=
 =?utf-8?B?azZ3RXlnZzMzUEt6MFNuQjB1U3ZuaTFjUWxzUDRNQlIxSWlZNnNiSWJBb1Jz?=
 =?utf-8?B?aVU3UVF3Y090T3cyb0JuMElzck93cm8zcjRoWnlQeW92c3E2aXBrc0IwTU1r?=
 =?utf-8?B?dTVFTVFKOWF4VTEvQzNPWTZlQXd4aVFDRmxScTFDKzVLKzVwQUJtYmJDd3Av?=
 =?utf-8?B?bEpDUkprZEJ2cjVUbmJ0eGdiNWx3R3RhbXE0Zi8rYzBrUSszc2tGSTlwb2Fv?=
 =?utf-8?B?QVU2ZTI4ZDBlRC9PUXlreXRpejVoV05uKzlkRDk0eDNHcjRVQ2hPV21EdGpm?=
 =?utf-8?B?dnlzek5JWkdJbEhnZ3F3b2VDdENXU2Q2SzVzUHFHM2lRRjR3Q2YvTVVLMndW?=
 =?utf-8?B?Z2NycEM1TFlkb1JvOG1PbGZDeHc0bUIwSTY0dzlmL1dKd1JDT0RlQUZ5U040?=
 =?utf-8?B?eFMzdE5IRWRhTGRyeEVqbmNUS2VkcnFadnd6V3RJVmVodFdHdkp0ZFEvcWg5?=
 =?utf-8?B?dUpXK0pVMk1RVjdwaU5jZW5YTVhHUmU4UG01VmdCWGRJRFEwSm1tWksyU1JM?=
 =?utf-8?B?am9jdU95R3JubmdoZlZrdVVzUG9lQWZWWHpLL1hwUStvM2s0SkpvOVVZMC9Y?=
 =?utf-8?B?dTJWcXhHNjlZUVZBaFRkNnV5Q2V2eVJPQUR0ZFNreDluWnMyMXBpczIxQU54?=
 =?utf-8?B?b2tFWGNCS1psQlZLRmNsSXVVaEpobUt5cFJMdU1ZWjM0QXYwUnk0T0s5Qk13?=
 =?utf-8?B?aVdwMGpPaGlwYm1ScEpxUGg4bysrMzIvTFFrN3pmWDBLREVzMWt1UzlFNy9a?=
 =?utf-8?B?bjBzc0I1L09GWVpDb0JhQ3BvSS9ucjZVY0FxdzZLc09PTnpOSk1DS0FOMW5s?=
 =?utf-8?B?SHJWUTZWakp2OVljNmNSMnQ0UklOY2diUEFsRm5YUm9tSy9qRU9sdHV6TG1y?=
 =?utf-8?B?M2dGaXNMQUpEZWpDeXdZcXB6SUVRVHRrMkdoN0N6WnhMQ0NDTjVCa1JINDNI?=
 =?utf-8?B?bFdUNnh5VmVBNngwcFhCcnAra2EyaklvQzNycVZxb25LRU15L2hZb1NaU2pj?=
 =?utf-8?B?SHN2MmJzVCtLdHUvdkxWL1pELzRwTGZ2L0NCZVJUV2wyZW1aVUpaU09aYW1H?=
 =?utf-8?B?aFF6LzFSWS83UkkwWHdIcFRzcVRBb1BmTDNYZEJxWVZ5dDdGamp1UzBzN2Rx?=
 =?utf-8?B?bjh3ZU01bFhCUFdvSCtTUzk2eldETTJqSmExVWhxdll4RkZiU29kaksxTnFM?=
 =?utf-8?B?OGNkQ3EvMTRGYXZ2MjVoekdTYjBGUDBNTkc3OVhUSFVEdTVWWW9vSHJNeDNs?=
 =?utf-8?B?K2kzNWVaRGlmNWlTQ1NncHdjdEtZc3UvR0UwbmF3SjZFUlVBM0ptN0ltdXA4?=
 =?utf-8?B?MHdrNmpkL3VtT0pMQVlqc29mSUJ4aFU4dFhqTHh3eGZ5UzN5RHhuRnV3RlFR?=
 =?utf-8?B?YVo2bS9uYXBsV0dXaTVsdG5nMW14Ynhnbm9CV0d6cGJhYW90eXIrNEpLc25l?=
 =?utf-8?B?elZ1aFZYMWhia1p0N3FpN21rRTVod1NZRzZoMDZkVGQxMFpaazJpSitSdE4v?=
 =?utf-8?Q?FTNc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B35BB279D943BD4AA77ACF9A9DF40B06@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e472d82-4344-4afa-b31d-08dc33771104
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 07:22:45.9168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64OAAxnGndNUZnVg/fOX5vRP/GbhN8FuGEXvK0f+Ap4/bzsAmq6LOuZXe7OA6vRPBktZE6TU/woPH1oe0MS5+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373

SGkgQW50aG9ueSwNCg0KT24gMjAyNC8yLzIxIDIzOjAzLCBBbnRob255IFBFUkFSRCB3cm90ZToN
Cj4gT24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgMDI6MTM6MTdQTSArMDgwMCwgSmlxaWFuIENoZW4g
d3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9jdHJsL3hjX2RvbWFpbi5jIGIvdG9v
bHMvbGlicy9jdHJsL3hjX2RvbWFpbi5jDQo+PiBpbmRleCBmMmQ5ZDE0YjRkOWYuLjQ0OGJhMmM1
OWFlMSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvY3RybC94Y19kb21haW4uYw0KPj4gKysr
IGIvdG9vbHMvbGlicy9jdHJsL3hjX2RvbWFpbi5jDQo+PiBAQCAtMTM5NCw2ICsxMzk0LDIxIEBA
IGludCB4Y19kb21haW5faXJxX3Blcm1pc3Npb24oeGNfaW50ZXJmYWNlICp4Y2gsDQo+PiAgICAg
IHJldHVybiBkb19kb21jdGwoeGNoLCAmZG9tY3RsKTsNCj4+ICB9DQo+PiAgDQo+PiAraW50IHhj
X2RvbWFpbl9nc2lfcGVybWlzc2lvbih4Y19pbnRlcmZhY2UgKnhjaCwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgZ3NpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vbCBhbGxvd19hY2Nlc3MpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgeGVuX2RvbWN0bCBk
b21jdGwgPSB7fTsNCj4+ICsNCj4+ICsgICAgZG9tY3RsLmNtZCA9IFhFTl9ET01DVExfZ3NpX3Bl
cm1pc3Npb247DQo+PiArICAgIGRvbWN0bC5kb21haW4gPSBkb21pZDsNCj4+ICsgICAgZG9tY3Rs
LnUuZ3NpX3Blcm1pc3Npb24uZ3NpID0gZ3NpOw0KPj4gKyAgICBkb21jdGwudS5nc2lfcGVybWlz
c2lvbi5hbGxvd19hY2Nlc3MgPSBhbGxvd19hY2Nlc3M7DQo+IA0KPiBUaGlzIGNvdWxkIGJlIHdy
aXR0ZW4gYXM6DQo+ICAgICBzdHJ1Y3QgeGVuX2RvbWN0bCBkb21jdGwgPSB7DQo+ICAgICAgICAg
LmNtZCA9IFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24sDQo+ICAgICAgICAgLmRvbWFpbiA9IGRv
bWlkLA0KPiAgICAgICAgIC51LmdzaV9wZXJtaXNzaW9uLmdzaSA9IGdzaSwNCj4gICAgICAgICAu
dS5nc2lfcGVybWlzc2lvbi5hbGxvd19hY2Nlc3MgPSBhbGxvd19hY2Nlc3MsDQo+ICAgICB9Ow0K
PiANClRoYXQncyBmaW5lLCBJIHdpbGwgY2hhbmdlIHRvIHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0K
DQo+IGJ1dCB5b3VyIGNoYW5nZSBpcyBmaW5lIHRvby4NCj4gDQo+IA0KPj4gKw0KPj4gKyAgICBy
ZXR1cm4gZG9fZG9tY3RsKHhjaCwgJmRvbWN0bCk7DQo+PiArfQ0KPj4gKw0KPj4gIGludCB4Y19k
b21haW5faW9tZW1fcGVybWlzc2lvbih4Y19pbnRlcmZhY2UgKnhjaCwNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQsDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmlyc3RfbWZuLA0KPj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3Bj
aS5jDQo+PiBpbmRleCBhMWM2ZTgyNjMxZTkuLjQxMzZhODYwYTA0OCAxMDA2NDQNCj4+IC0tLSBh
L3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQv
bGlieGxfcGNpLmMNCj4+IEBAIC0xNDIxLDYgKzE0MjEsOCBAQCBzdGF0aWMgdm9pZCBwY2lfYWRk
X2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICB1aW50MzJfdCBmbGFnID0gWEVOX0RP
TUNUTF9ERVZfUkRNX1JFTEFYRUQ7DQo+PiAgICAgIHVpbnQzMl90IGRvbWFpbmlkID0gZG9taWQ7
DQo+PiAgICAgIGJvb2wgaXNzdHViZG9tID0gbGlieGxfaXNfc3R1YmRvbShjdHgsIGRvbWlkLCAm
ZG9tYWluaWQpOw0KPj4gKyAgICBpbnQgZ3NpOw0KPj4gKyAgICBib29sIGhhc19nc2kgPSB0cnVl
Ow0KPiANCj4gV2h5IGlzIHRoaXMgZnVuY3Rpb24gaGFzICJnc2kiIHZhcmlhYmxlLCBhbmQgImdz
aSA9IGlycSIgYnV0IHRoZSBuZXh0DQo+IGZ1bmN0aW9uIHBjaV9yZW1vdmVfZGV0YWNoZWQoKSBk
b2VzIG9ubHkgaGF2ZSAiaXJxIiB2YXJpYWJsZT8NCkJlY2F1c2UgaW4gcGNpX2FkZF9kbV9kb25l
LCBpdCBjYWxscyAiIHIgPSB4Y19waHlzZGV2X21hcF9waXJxKGN0eC0+eGNoLCBkb21pZCwgaXJx
LCAmaXJxKTsgIiwgaXQgcGFzc2VzIHRoZSBwb2ludGVyIG9mIGlycSBpbiwgYW5kIHRoZW4gaXJx
IHdpbGwgYmUgY2hhbmdlZCwgc28gSSBuZWVkIHRvIHVzZSBnc2kgdG8gc2F2ZSB0aGUgb3JpZ2lu
IHZhbHVlLg0KDQo+IA0KPiBTbywgZ3NpIGNhbiBvbmx5IGJlIHBvc2l0aXZlIGludGVnZXIsIHJp
Z2h0PyBDb3VsZCB3ZSBmb3JnbyBgaGFzX2dzaWAgYW5kDQo+IGp1c3Qgc2V0ICJnc2kgPSAtMSIg
d2hlbiB0aGVyZSdzIG5vIGdzaT8NCk5vLCB3ZSBjYW4ndCBmb3JnbyAnaGFzX2dzaScsIGJlY2F1
c2Ugd2UgbmVlZCB0byBzZXQgZ3NpID0gaXJxIHRvIHNhdmUgdGhlIG9yaWdpbmFsIHZhbC4NCg0K
PiANCj4+ICAgICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLw0KPj4gICAgICBib29sIHN0YXJ0
aW5nID0gcGFzLT5zdGFydGluZzsNCj4+IEBAIC0xNDgyLDYgKzE0ODQsNyBAQCBzdGF0aWMgdm9p
ZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGNpLT5idXMsIHBjaS0+ZGV2LCBwY2ktPmZ1bmMpOw0KPj4gIA0KPj4g
ICAgICBpZiAoIGFjY2VzcyhzeXNmc19wYXRoLCBGX09LKSAhPSAwICkgew0KPj4gKyAgICAgICAg
aGFzX2dzaSA9IGZhbHNlOw0KPj4gICAgICAgICAgaWYgKCBlcnJubyA9PSBFTk9FTlQgKQ0KPj4g
ICAgICAgICAgICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9C
REYiL2lycSIsIHBjaS0+ZG9tYWluLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGNpLT5idXMsIHBjaS0+ZGV2LCBwY2ktPmZ1bmMpOw0KPj4gQEAgLTE0OTcsNiArMTUwMCw3
IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAg
ICAgICBnb3RvIG91dF9ub19pcnE7DQo+PiAgICAgIH0NCj4+ICAgICAgaWYgKChmc2NhbmYoZiwg
IiV1IiwgJmlycSkgPT0gMSkgJiYgaXJxKSB7DQo+PiArICAgICAgICBnc2kgPSBpcnE7DQo+IA0K
PiBXaHkgZG8geW91IGRvIHRoaXMsIHRoYXQgdGhhdCBtZWFuIHRoYXQgYGdzaWAgYW5kIGBpcnFg
IGFyZSB0aGUgc2FtZT8gT3INCj4gZG9lcyBgaXJxYCBoYXBwZW4gdG8gc29tZXRpbWUgY29udGFp
biBhIGBnc2lgIHZhbHVlPw0KQWJvdmUgcmVhc29uLg0KDQo+IA0KPj4gICAgICAgICAgciA9IHhj
X3BoeXNkZXZfbWFwX3BpcnEoY3R4LT54Y2gsIGRvbWlkLCBpcnEsICZpcnEpOw0KPj4gICAgICAg
ICAgaWYgKHIgPCAwKSB7DQo+PiAgICAgICAgICAgICAgTE9HRUQoRVJST1IsIGRvbWFpbmlkLCAi
eGNfcGh5c2Rldl9tYXBfcGlycSBpcnE9JWQgKGVycm9yPSVkKSIsDQo+PiBAQCAtMTUwNSw3ICsx
NTA5LDEwIEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+
PiAgICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOw0KPj4gICAgICAgICAgICAgIGdvdG8gb3V0
Ow0KPj4gICAgICAgICAgfQ0KPj4gLSAgICAgICAgciA9IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lv
bihjdHgtPnhjaCwgZG9taWQsIGlycSwgMSk7DQo+PiArICAgICAgICBpZiAoIGhhc19nc2kgKQ0K
Pj4gKyAgICAgICAgICAgIHIgPSB4Y19kb21haW5fZ3NpX3Blcm1pc3Npb24oY3R4LT54Y2gsIGRv
bWlkLCBnc2ksIDEpOw0KPj4gKyAgICAgICAgaWYgKCAhaGFzX2dzaSB8fCByID09IC1FT1BOT1RT
VVBQICkNCj4+ICsgICAgICAgICAgICByID0geGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKGN0eC0+
eGNoLCBkb21pZCwgaXJxLCAxKTsNCj4+ICAgICAgICAgIGlmIChyIDwgMCkgew0KPj4gICAgICAg
ICAgICAgIExPR0VEKEVSUk9SLCBkb21haW5pZCwNCj4+ICAgICAgICAgICAgICAgICAgICAieGNf
ZG9tYWluX2lycV9wZXJtaXNzaW9uIGlycT0lZCAoZXJyb3I9JWQpIiwgaXJxLCByKTsNCj4gDQo+
IExvb2tzIGxpa2UgdGhpcyBlcnJvciBtZXNzYWdlIGNvdWxkIGJlIHdyb25nLCBJIHRoaW5rIHdl
IHdhbnQgdG8ga25vdyBpZg0KPiB3aGljaCBjYWxsIGJldHdlZW4geGNfZG9tYWluX2lycV9wZXJt
aXNzaW9uKCkgYW5kDQo+IHhjX2RvbWFpbl9nc2lfcGVybWlzc2lvbigpIGhhcyBmYWlsZWQuDQpZ
b3UgYXJlIHJpZ2h0LCBJIHdpbGwgc2VwYXJhdGUgdGhlbSBpbiBuZXh0IHZlcnNpb24uDQoNCj4g
DQo+PiBAQCAtMjE4NSw2ICsyMTkyLDcgQEAgc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9kZXRhY2hl
ZChsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAgIEZJTEUgKmY7DQo+PiAgICAgIHVpbnQzMl90IGRv
bWFpbmlkID0gcHJzLT5kb21pZDsNCj4+ICAgICAgYm9vbCBpc3N0dWJkb207DQo+PiArICAgIGJv
b2wgaGFzX2dzaSA9IHRydWU7DQo+PiAgDQo+PiAgICAgIC8qIENvbnZlbmllbmNlIGFsaWFzZXMg
Ki8NCj4+ICAgICAgbGlieGxfZGV2aWNlX3BjaSAqY29uc3QgcGNpID0gJnBycy0+cGNpOw0KPj4g
QEAgLTIyNDQsNiArMjI1Miw3IEBAIHNraXBfYmFyOg0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5jKTsNCj4+ICANCj4+ICAgICAgaWYg
KCBhY2Nlc3Moc3lzZnNfcGF0aCwgRl9PSykgIT0gMCApIHsNCj4+ICsgICAgICAgIGhhc19nc2kg
PSBmYWxzZTsNCj4+ICAgICAgICAgIGlmICggZXJybm8gPT0gRU5PRU5UICkNCj4+ICAgICAgICAg
ICAgICBzeXNmc19wYXRoID0gR0NTUFJJTlRGKFNZU0ZTX1BDSV9ERVYiLyJQQ0lfQkRGIi9pcnEi
LCBwY2ktPmRvbWFpbiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+
YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5jKTsNCj4+IEBAIC0yMjcwLDcgKzIyNzksMTAgQEAgc2tp
cF9iYXI6DQo+PiAgICAgICAgICAgICAgICovDQo+PiAgICAgICAgICAgICAgTE9HRUQoRVJST1Is
IGRvbWlkLCAieGNfcGh5c2Rldl91bm1hcF9waXJxIGlycT0lZCIsIGlycSk7DQo+PiAgICAgICAg
ICB9DQo+PiAtICAgICAgICByYyA9IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbihjdHgtPnhjaCwg
ZG9taWQsIGlycSwgMCk7DQo+PiArICAgICAgICBpZiAoIGhhc19nc2kgKQ0KPj4gKyAgICAgICAg
ICAgIHJjID0geGNfZG9tYWluX2dzaV9wZXJtaXNzaW9uKGN0eC0+eGNoLCBkb21pZCwgaXJxLCAw
KTsNCj4gDQo+IFdoeSBkbyB5b3UgdXNlIHRoZSB4Y19kb21haW5fZ3NpX3Blcm1pc3Npb24oKSB3
aXRoICJpcnEiIGhlcmUsIGJ1dCBub3QNCj4gaW4gcGNpX2FkZF9kbV9kb25lKCkgPw0KQmVjYXVz
ZSB4Y19waHlzZGV2X3VubWFwX3BpcnEgZG9lc24ndCBjaGFuZ2UgdGhlIHZhbHVlIG9mIGlycSwg
YnV0IGluIHBjaV9hZGRfZG1fZG9uZSwgdGhlIHZhbHVlIG9mIGlycSBpcyBjaGFuZ2VkIGJ5IHhj
X3BoeXNkZXZfbWFwX3BpcnEuDQoNCj4gDQo+PiArICAgICAgICBpZiAoICFoYXNfZ3NpIHx8IHJj
ID09IC1FT1BOT1RTVVBQICkNCj4+ICsgICAgICAgICAgICByYyA9IHhjX2RvbWFpbl9pcnFfcGVy
bWlzc2lvbihjdHgtPnhjaCwgZG9taWQsIGlycSwgMCk7DQo+PiAgICAgICAgICBpZiAocmMgPCAw
KSB7DQo+PiAgICAgICAgICAgICAgTE9HRUQoRVJST1IsIGRvbWlkLCAieGNfZG9tYWluX2lycV9w
ZXJtaXNzaW9uIGlycT0lZCIsIGlycSk7DQo+PiAgICAgICAgICB9DQo+IA0KPiANCj4gVGhlc2Ug
Y2hhbmdlcyB0byBsaWJ4bCBhcmUgcXVpdGUgY29uZnVzaW5nLCB0aGVyZSdzIGEgbWl4ZWQgdXAg
YmV0d2Vlbg0KPiAiZ3NpIiBhbmQgImlycSIsIGl0J3MgaGFyZCB0byBmb2xsb3cuDQo+IA0KPiBU
aGFua3MsDQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

