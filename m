Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2792CAFE020
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 08:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037726.1410265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZOUv-0006Rf-Jr; Wed, 09 Jul 2025 06:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037726.1410265; Wed, 09 Jul 2025 06:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZOUv-0006Pz-Gw; Wed, 09 Jul 2025 06:41:41 +0000
Received: by outflank-mailman (input) for mailman id 1037726;
 Wed, 09 Jul 2025 06:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uL8=ZW=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uZOUu-0006Pt-OE
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 06:41:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2415::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c25b3974-5c8f-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 08:41:37 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW4PR12MB6922.namprd12.prod.outlook.com (2603:10b6:303:207::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 06:41:32 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 06:41:32 +0000
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
X-Inumbo-ID: c25b3974-5c8f-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs9+qJe9waIl/YYj340ZTy/0jR0ZnXPXrK6cw+RuIcxQyU1CB6G4/LRr61572SrfL5K1XARzn9aT14BFanBZrIcGOEDyzRy7IVUl65AK254GCwA2i/f0q16xAc/BYOONcajfc/sZjdjCenOuwC2z1CNn9tmaIeE7EsimQ2TxyohkRc4d1tStbPrA+2Vx+kasOdtGDhQ23RX/jlMz2f3vOl+fw249N86AEUvI0HfhW7bAJ4G8AA1CrUPEtFit5C0K0AMJwpWLgC2E4be+TgLvxw/7Q0s8uyt572BJZMFbLCO61vVbGmUfGFGTsxfomTGZUu6Fmy29AFTOEiRTsNsyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fwQbgTdKMyFxGyIidfGLtL0D8eq2TMiss7uF64JOAc=;
 b=ogeC7RbZjf2chVYNqJBe1WbfuieAU8h1swpVlGsXoD2mB+jJY2nk7SsWOkwGyuEzir8Imuik0kJyens6cYpiqwkx+fDQ5CJHyg4VvEBWwDWHNNyq7ZxRH2cXNug5xDY6oL5hFWHiOKgIlhgBs1j/3VZDedO/K28gev8+ydobJFti2tdJuMXgfzmKIZ9cdqTlnCL3ikH+3VJtAHbGJGrX7XvBQRrSKSFcwQQVNeDFMf7GcVvj34Ir3BtKsfsH2aRzASg6J++zzZS+pNZxSg4AUbuHuAX7nIUJXBJWSiBe3kYNqBWz+RJutfoZKiRJNtH+qMtgcu9v91Cy4SsOUTWD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fwQbgTdKMyFxGyIidfGLtL0D8eq2TMiss7uF64JOAc=;
 b=iKhns7amx/9vBznLbMVIOaGOZUfzSib8jNvDpJGUW3HmLWaqbTXWKieOBa09nIqsPedcIN0nct2IcLCqLS1YlF3dtTOVU7I5ucMOElnkuyUF1KtY1+cP9IsCQFoYX0N24dGgYg70vHObHTtGaLETBIrAqA9sK56b3svhhDA66iI=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 11/11] xen/sysctl: wrap around sysctl hypercall
Thread-Topic: [PATCH 11/11] xen/sysctl: wrap around sysctl hypercall
Thread-Index: AQHb7u1LtELYXi1wfUWq1y4deurgULQoP9aAgAEbJRA=
Date: Wed, 9 Jul 2025 06:41:31 +0000
Message-ID:
 <DM4PR12MB84517A94D6C0C53ADCAB0931E149A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
 <20250707031346.901567-12-Penny.Zheng@amd.com>
 <6aa4431c-de06-4927-9b29-4347fa801fdd@suse.com>
In-Reply-To: <6aa4431c-de06-4927-9b29-4347fa801fdd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-09T06:41:20.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW4PR12MB6922:EE_
x-ms-office365-filtering-correlation-id: bea4148b-6d21-4d2f-3bdf-08ddbeb3a436
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WkUrYVdwMHlQK1M0NUNpUklZWDBoblRHemZ5UENnOHphS0xyblkwOU1SSmh6?=
 =?utf-8?B?d3F6V3ZHYkR0RCt1c3FvbkJJVTczK2Z4QmhhUEdoSS9paU1jcHl6bTh3MHNz?=
 =?utf-8?B?MlIyRnBENFBhSGtoZ0IwcW9xUzFoZVJPb3ovMmxWSHNIM0NXcUhYOENCaXIw?=
 =?utf-8?B?bG5RR05LZ2oxWHJ1L1JCMERsME1QVVB0b3VMcSt4Vm1rYVhjTnJlcXJtSXJx?=
 =?utf-8?B?T01NUi9rclJJRHpYVE93aEtXUkQrekZ2dzBwTitXd05mOHovN3NIZGowcWJ1?=
 =?utf-8?B?WXFGRTEydTBaWkowb3dPdFpldlJZNW1UOUlRVjE5L1lnU0xRRGZvN1ZxYzBt?=
 =?utf-8?B?UkJ6YyttWU5Yb0JlczgrU3Z6RXJHL0svMzR2OVBHU3NITHZVdm13bHIyRk1U?=
 =?utf-8?B?dFA2WVBKdWFUK0hzV0NUT3pZUm9KQmxVWUNvQVdTV1RBYVhoVWVWWm82QlJ4?=
 =?utf-8?B?eE41dC9ZS2RwUURBcUw1ZzhWRlVTb1RiWDZYZGJXT3BtNTQxT25yWGYvbG91?=
 =?utf-8?B?dXBjVTNxOGIvRTI3Tkt5aFB4MHdGQVpFYkxwUlBkWEtDQ3NRQ0QyL2ZFdmw0?=
 =?utf-8?B?MmNyeFdjckpvd3NxZnplV1RjMG4zN3JjcGlJQjI1cENBWVBmb2lHR2w2aGdn?=
 =?utf-8?B?cnhzcEFZZ2tiaGJLa0RGd2wvemVuVHFPaWttSTRqN3dDV3RrNml5bGlFdjN0?=
 =?utf-8?B?b20va0hZbEsxREZVa2VydHZuN3YrYXVDcW1CeG9vK0lEcmp0YmtUbUI2UTQ4?=
 =?utf-8?B?MGIrN1hjZmVqMG1FVG9zaktZaFYrZy9QQkFDQXIvNlBBU3YyM3gvcTVmQUpU?=
 =?utf-8?B?ZHQxalV5b0pIUXVXNmVNVkJ3OEdSN0VEdDdSR2IwcVJDWTZYMU51Y3lVR2V6?=
 =?utf-8?B?SFhoSFlqQ3VERk1LL2UybmdSMFJHL2plUzN1VGx5dFdFa01SbXAzWmN5Z09h?=
 =?utf-8?B?eDRiNStSNmJ5Q2lyVTlKSkRVQUwxVHRkSjhZM0dZbGhpNzMzc0hhS1BKaHJa?=
 =?utf-8?B?TS8xTGduS0JBWms2MnBBYzBTUEZiai93TllZaW9NcTg2OHdhR3MrVGxsNmo0?=
 =?utf-8?B?UHZrS285eUF3N0N2eHF3Y0hRNTdtVkQzV3FQTGFBVkJGUE04QnBOZ2ZhaTl6?=
 =?utf-8?B?L0hMNURFayttbmNNdzlwc2o3S240SlFrWktPb0RRZmNvZlh4MWwzRHVsYVdt?=
 =?utf-8?B?dVA5a284VWQ1aDB1Y1FMTnRxcEJFSWNnRDJlQUdQczQ0ZGFVcldPOW05aUtV?=
 =?utf-8?B?UWtURW4rSEFPSjBGZTFOMXhPc20reE5LVEhtVlBvbFhodUpnVGVXVkM3aXhk?=
 =?utf-8?B?dGpYNzNmZWsvcXhtS1Zma2NSKzRKT05TOWlrRWtWR3NWV002QUpjNlhXWTFr?=
 =?utf-8?B?Rm14NDkvbXJwU3FuOFdGQm92OWRsS0xPcC8xc1RVOXAyM0dnVkxoMlBkV1hv?=
 =?utf-8?B?MDhUdm1SSG5kZGw4d05FY2xzc05ramRsNkRqZmV1UklRa3A1VjVqOEliSUZH?=
 =?utf-8?B?cHcrUGF4Y2xzdWFodFovUnpCOTZ2dTVxWmdvdGlkemg3aGlNc3pxdDFBenMv?=
 =?utf-8?B?eW5jTDBkZ3lrS0lLZmtFZ2RZcHptYmg4ZHhibGFTZ1JVWHVGZjY1NU1mQWI4?=
 =?utf-8?B?RTZCYnFiNlFQL2I4MlEvWEUwN3lnOU5lK3QvNUNBbEY3ZXdaOW9DbmZwaTVq?=
 =?utf-8?B?dms0THVOdHBrVlpCbkQzaytJYWFXWVFxc082eE9LWkxVU3JOWWIwSXBxU0I3?=
 =?utf-8?B?aUw4T1pKMFVLeXRMSTd0VzNjb1d5ZlFhNnlySVcyc1poN1dNblgrcGpKSCtE?=
 =?utf-8?B?SVY2MVVNYmVycFlMUU0yL25Na1BXUmZjR3I3SFc4cHh6Si9YY2hSblJESnNM?=
 =?utf-8?B?Y3d1Rjh6L3RLWVRHMkhyVHVyUExBUjVURTVTaXJhWXFYMlAzb21pdTdmOG1h?=
 =?utf-8?B?MzJDeDdndDNXYk5wOHp5SUVlUVd4c3F1UHBVVkRlL0drUDdLdzhFRU9Db0JQ?=
 =?utf-8?B?bHpyUGI4QjdBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGNUOFBhUUcyTUo1VWxodnBVanVNck8yY010ZzV0Zi9XK0daSzhpOWRpZHk4?=
 =?utf-8?B?TkpKZGFVY3QvZXJSWHg5WENPMDFZa3NTbkdrczlwc2YvNi9DQ2tHejhudnNu?=
 =?utf-8?B?QnBjaE4yMG9BS1ZYUlBrN0Via1h3TFZGYWZ2Z2E5YkI4RGtFdjk2aTJhNUdv?=
 =?utf-8?B?NzdXRC91alVRSzF0Mzh3T09uUlBSVDdSdEhkVXgwa1JhWWNIaS9XeGQvcDMy?=
 =?utf-8?B?YXRyNTRFbjdjTzJtVkFmeXhmZ2FYbVp0MkFPOTVERTh3UjM2V1VmYjhiOHJW?=
 =?utf-8?B?RmQzZ3grdXdaVUNEQ1JwcXZVUm0wOFpVNElsQnM0ZndxZnJ3Y3pnNldYbndS?=
 =?utf-8?B?b2NLNVl1ZTd5ZEQ4eHNzZ2wwVk1rRW8wTWpMcXVIMWdkdjF0em13OGhJYWNS?=
 =?utf-8?B?U2l3SGorZWY4S1N4L0czaitpVklWQU1BM2g2ekpqbFpLUnhDM3VZTlJra0Yz?=
 =?utf-8?B?dGJRcXZKOUpYaHdoUHhiWmNEbUlsbW1CRThMZWtkZnpmMy80dDVLT1RUbTY0?=
 =?utf-8?B?Z0dsOS9Bdkl5eHBvUlB3VlBOTURyUjJEeWZ4ZXU2N0R6SGdIa2RJWCtONXpP?=
 =?utf-8?B?N3dDSDNVVm5vbFhnNkFFTjJwa2FvSEVQUThhTysrbFl0QmNzS0lMcVRnc1pj?=
 =?utf-8?B?bHRaQ3lmdTkvcHhhd0YrVDY5elF0dXlISGVHck04SzlZdEVpMHdBYkFHRldO?=
 =?utf-8?B?NDUvSGZtMTV3WE1zZEhNMWVacWtJZ1F6YTd4dndOTjUzaVc4eld4c0VNZElR?=
 =?utf-8?B?dnVTYksvQ0Myd2ZKTE0yK3hjTktqSmpwRHZlYVhqbGlHTEw3cHpDWVVjRFRh?=
 =?utf-8?B?aGJNV1RWYlhtVE4vWU14SXhkaVpVN3N6NXdnbXVqVVNGdnUwcjNXckV3L0ZR?=
 =?utf-8?B?cW5KSW94eStUcEJBY3E1V2NMOFRoNHV4Q2xhR0phT1BiRURmWUkwcy9Db0Rq?=
 =?utf-8?B?NU9RdVByNEFOZXRLTkFzOE42UFhwMlVsUVNxWjlCWURocFpydm1wSjg3Ui9L?=
 =?utf-8?B?ckJVREZEZjM0UC95dDJ2L0dPU0czeWZaM0dwMkxBMDNXRFJrUnVPdlRmZWpD?=
 =?utf-8?B?MG5hbCtjV2xGeVd4a3kySWFNRWZYM3dYL3hiWFZnQ05QaFBoZmpFQ1M2NkU3?=
 =?utf-8?B?M2R4eUsxN0o4OGF3STFvWDhBdkhPenRXTEZBOWFFcXVGb09kWUo4UThPZ3JW?=
 =?utf-8?B?eVd5aWNjN2pGQnlkc3Q1Z2poem5lUXo3enhHM0taUjR5Ly9oSCtsaHFYT0ph?=
 =?utf-8?B?OEN6S1RtNnNCOTNTeCs4eEtQNDNQa0Q1Z0tsbGpNUFovcjY4TlpiQnpsb1FG?=
 =?utf-8?B?SkJ4N1ZmZ2kvR2wvV0cvekl2RVdXZlJhSDkxaDJwTTc1MTdTWk9OWEJoMVlO?=
 =?utf-8?B?ZTdYSmlINHZQNVFEcjIya09pLzRJc1paaWZSdVBKbXpvWi9WQUVVRVhEYVBV?=
 =?utf-8?B?aTRXMlIzeUxyQ3FqZHRaai9tU3VoVExhQ3UyeHkydXU4anExcEMrS0FwY3pm?=
 =?utf-8?B?ZHFwelhKVUlOQ2crVnJhT3gzUCt0aU9qUThSckY1SFdwSkVseFVsdTlJdHVm?=
 =?utf-8?B?YXdQVEhpWW4wblZ4RWJ3ZDJFQlNqZEUxSTFBd2R1MmJ5ekNwZFlCM1ljZzlq?=
 =?utf-8?B?cG1JMmw4WEh0WG9aRW1yaU1IUzVOdElXcmlaQThqUU5nVUpoVTlVSFVzM1h4?=
 =?utf-8?B?V2RCcnprL2hmZUgwMlduakMyQVY0NXY1VnRTVzl6WVVrWkx2aVFhaU1DUjI2?=
 =?utf-8?B?SmxkNXBPRnlPajNCK0VuUTFHWkVaUnN2MmhHUXpKOW9hTkk4ZjhmVTlydkg3?=
 =?utf-8?B?aTEyWWxpT3lkZFVSYThCOVM2dVpmbTVydGU0L00raTE0MHVMcjhwVmRsWWhI?=
 =?utf-8?B?LzUxYmtza01IcFEwYjJpYk41aGNHNzFYcG55aWhQYkh0UDZ5VmdWUVE2SVhz?=
 =?utf-8?B?d0JraEZ5SThDQlpwT3lhYzlEZjRwSEhEcUUxMytxV2tudTQyK2VQZ3lZTHoz?=
 =?utf-8?B?ejNNQ3d2SHRyTHlNMDVQNnNrOHJocFlIZFRJbCtucGNMZmhTMnY3RWxMd2s0?=
 =?utf-8?B?cytyUGJNVzcrV1NQTm5YL2g0NFVaeEhBTmZTK2xPNVlOV0dtVE96KzcrNjJ4?=
 =?utf-8?Q?Smmc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea4148b-6d21-4d2f-3bdf-08ddbeb3a436
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 06:41:31.9886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQzL70sqaXLcqfeQvtm5U5MByF68KqebCs7FQkFvBvk0rqQIkAu6AEf+DD94QUmcCcJMxYlt78MQ9V2XXDOtIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6922

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgOCwgMjAyNSA5
OjQ3IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBSb2dlcg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFudGhv
bnkgUEVSQVJEDQo+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbCA8
TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4NCj4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsg
U3RhYmVsbGluaSwgU3RlZmFubyA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+OyBTZXJnaXkN
Cj4gS2licmlrIDxTZXJnaXlfS2licmlrQGVwYW0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTEvMTFdIHhlbi9zeXNjdGw6IHdyYXAg
YXJvdW5kIHN5c2N0bCBoeXBlcmNhbGwNCj4NCj4gT24gMDcuMDcuMjAyNSAwNToxMywgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNv
bmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcNCj4g
PiBAQCAtMjgsMyArMjgsNCBAQCBDT05GSUdfRVhQRVJUPXkNCj4gPiAgIyBDT05GSUdfR0RCU1gg
aXMgbm90IHNldA0KPiA+ICAjIENPTkZJR19QTV9PUCBpcyBub3Qgc2V0DQo+ID4gICMgQ09ORklH
X1BNX1NUQVRTIGlzIG5vdCBzZXQNCj4gPiArIyBDT05GSUdfU1lTQ1RMIGlzIG5vdCBzZXQNCj4N
Cj4gQmV5b25kIHdoYXQgSSBzYWlkIGluIHJlcGx5IHRvIHBhdGNoIDQsIExJVkVQQVRDSCBmb3Ig
ZXhhbXBsZSBhbHNvIHNob3VsZG4ndCBiZQ0KPiBuZWVkZWQgaGVyZSBhbnltb3JlLCBmb3Igc2lt
aWxhcmx5IGRlcGVuZGluZyBvbiBTWVNDVEwuIFlvdSB3aWxsIHdhbnQgdG8gZ28NCj4gdGhyb3Vn
aCB0aGUgZW50aXJlIGZpbGUgdG8gY2hlY2sgd2hhdCBjYW4gbm93IGJlIHBydW5lZCBvZmYuDQo+
DQoNClVuZGVyc3Rvb2QNCg0KPiBKYW4NCg==

