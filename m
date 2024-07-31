Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2194244C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 03:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768173.1178938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYyRd-00033w-Ov; Wed, 31 Jul 2024 01:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768173.1178938; Wed, 31 Jul 2024 01:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYyRd-00032O-M3; Wed, 31 Jul 2024 01:48:01 +0000
Received: by outflank-mailman (input) for mailman id 768173;
 Wed, 31 Jul 2024 01:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMgj=O7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sYyRc-00032I-OE
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 01:48:00 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:2408::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ddeb49-4ede-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 03:47:57 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 01:47:53 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 01:47:52 +0000
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
X-Inumbo-ID: e8ddeb49-4ede-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IG36TsH5WHWQ1kf5T4OdDY7kemCS99smSRcMyTAxvgBGV3cmTP5tohVeUKx2dsDo4TYoLi201YwIdsHrqO0ie22Dy2fPBHNJa374P/azY6irdVtF0fy1+rziD3Z9GZPDiMQEnvJ4yc2cv/jQFWF3+FvdlKjUz5k+CwYTMVYKMetNV0BA4BqXIAXTHKyqBxjPjfCWzQyo3v8hSfRhPvj89/1wj28ko6xp2zGbVg4rl/CLRd9dyudG13OTdeMqke9fTqWAltZ1enYhLVGB3zBhJGeZdGYaKVwU+RQrJ3XXI9CoNrmUmTlrXwEm97jaFAosnYyTEOMWvLxxC2v2VQ+RKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9XE2AgI7PaHqCwa5ZCiJVV3ZLcsfMI4K5n7SsLc6TY=;
 b=hIJBzYB2KCEfXUl72vi+OydthSEcXLeQ3r6WKwZqNJ0Fs4D8Pgy9bA+Oy/GxEjq9ggldJztnLoN17T4rLyQ7MrUCMUbO/P2hXf0oFC7R90vzTGe5XHuncHVY8SpSJLIlsh39Ji5LlRGzwU5htZYvgSOnys4BOJ7zaykNPIcgCURQ0LyHPUxnc6tvDh/pLymmrJQN/PyYV4HD5t0QOojbw0E3pfF+dzh7jTJwPJWfQ6skPSaHDzHd3yD6HjbBkc9svXMJKSIsgjJ6Gl2vGKVJd6YKqot4c7oSydBAaUYHrrXw2CzZpDuwgWlq1XYoujb4D4r8LSshAyvRZuvFlpWByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9XE2AgI7PaHqCwa5ZCiJVV3ZLcsfMI4K5n7SsLc6TY=;
 b=Go16JNJeRujVTBB3QRqcy59wnypyh37wbxzy5rk8dACiPJyro+21TsF9DSD/0+z4bq3Of0Voeo8nGb3UN8EzFTWHoqTIvgr62GHdq/IX3SSmrlCDScDvSjxyoCSdD71qcHAtZOfyyo4XjTHxPA+0pA1S7NPNahBSA81hl6qhOXs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHa0SvUYCKIEvNO4Ei/mjm7Qit34LIPYP0AgAFZpYA=
Date: Wed, 31 Jul 2024 01:47:52 +0000
Message-ID:
 <BL1PR12MB5849623140E6DD40EDB598C5E7B12@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
 <d08179b1-a114-4ae9-a6da-e907f2c027c3@citrix.com>
In-Reply-To: <d08179b1-a114-4ae9-a6da-e907f2c027c3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7807.009)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB9245:EE_
x-ms-office365-filtering-correlation-id: 3f86800d-687f-4fbf-02af-08dcb102cab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGNlRld2dEg5ajhmd0p5QURsQlNrMkh1S3lLWFhDQ1NRa29XT2Rsa2RQbS9z?=
 =?utf-8?B?azFFMHJvS2QrMmkrOVV5L2RnM1M1V2tPbnp1NzVFMDRFSnFrb2ZiSlpvNnJN?=
 =?utf-8?B?VjE3L1M4L1VPMU5uczhFWVJ2aFEvUmc1cUgrb2lva2lwVUE4ZFBIaklPY0VK?=
 =?utf-8?B?YzRINk5PbURRVzc3V3d5L3YvNEpWVXMxS2l3Mk9FYlJyN2F6SFRxajlUY0xO?=
 =?utf-8?B?TE9OTit2b3ZGS1NIdU15Q21ScVhwaWtOeFk3RUZNbXdQL3djWFAxVmZLUjZ0?=
 =?utf-8?B?dmtEeUEvOWc5Q05WTi83ak4yK1YvbkZLYXVUei85eDNBaWR3SHArdE5haktv?=
 =?utf-8?B?SHdiZTFmUW5tNnd6ODF1dGZJTXNJOWFsU1oxaEVEZTc1N0xqd3JiTCtyREdC?=
 =?utf-8?B?QndGYjh1ai9TV2N5a05NbWtnK3NKT0xiK1p3K1N3RURSc0REUnhlQWJoWDFK?=
 =?utf-8?B?K2psR3B4a09SRkU0WlVrOENjRjNTZGRmZHIreERxVUdXVlM3T0Y3QW1RTWRX?=
 =?utf-8?B?cXBrN3VNOENLVEJaNnZPVno0OWtHelU1MFVBWnV0YXY2YStyei9ZV1JPYWpR?=
 =?utf-8?B?UHJhZnAyODVRZzFnUlk1QzBET2ZPR1o1NzJ6OXBnYUxNYU90V011OUJOTkVa?=
 =?utf-8?B?c3NUR2QxOTN3bFQxdkJOZWhsK2VZcTkrUndFUnVzL3VQazZEM1QyR3JjK2NH?=
 =?utf-8?B?QVY5Yld1V2VrSUFTN1FOV3VyQ3cwcE5QaENlam5IK05maFVBbHpvSy9xZG11?=
 =?utf-8?B?bDdqZmxPOHp3L0k2NmlIc0NhWTd2OWN5cGFmd1o1S3R6bjU2TjJKTzFwRkdu?=
 =?utf-8?B?c1M3KzJtWFMrbW5JbnVKZEFvVDRrNUltV1M2RE5yWHN0TTlyVDVtU0dZTUFU?=
 =?utf-8?B?eVZHMUVHVUVqandhdzJEdit0MWQzUFZDem1MRGFVUmI5bWVyWlV6Q2JWTHR5?=
 =?utf-8?B?eUdGc3JNcEJybFprSUFLdUdjUThWeFA1S0xSTVpCblgvWkYycy9pMEh2SGtq?=
 =?utf-8?B?TlpQT1JMRWVZR0I4TElUMStFQkcvVjB4YnlXc0dXbjFWd2JtQ1FRTHFicGEw?=
 =?utf-8?B?dnpPVW5pMmFaL1hiQmdLNlpPYkp5ZERNUVBvT2RzUFNMaEtuemNaek9QMnlx?=
 =?utf-8?B?RlRycG9hUldoaklzTG9lU1RJN3pjSXVHb2F1UGRkQk12VjVxSHpGMS9IUDkx?=
 =?utf-8?B?QWZSOHp6bEYwNVpyZ0NrMjcxMDVSaDQ2ZlpsVU9aZTRmY0xlQjMvQnp3TkhE?=
 =?utf-8?B?K2kreHRTVmFadVlsNlI4dnFSdjY3M0VwZ3RaSGhZRURSemhRYnJzQVVhaFpK?=
 =?utf-8?B?VEVzLzdTREI1ZDE5VWdtQ1psRk1TNjA4eTZrRE90OTNQY3h0SEZvUVdGc3dV?=
 =?utf-8?B?NFhNd3lBbkN6NUZ1bWluNkNuZzVGc1FlK0p5cU1LOHhmRWhnM1k2UThHUzZF?=
 =?utf-8?B?SjE4aG1wVVl4d0tqM0REV09PbGJNZ2h2MGhWRmllOThLUkhQc2FxWGxxU0pa?=
 =?utf-8?B?d25kblJXSDZZaXNBTmdZbkNpdVpKbnI1eG1NNEZjUFMwaStoOVIzeXhOZXhj?=
 =?utf-8?B?RkR1VFpFd3kwWTROcmgxWk5vZTBUTmNYc0RTdXk4bFd5b09DdXlKQjk1U0Jl?=
 =?utf-8?B?WVFVcjlzNEpoSEtDS2xXb0QyckYxV1M1Nk1FVTlPM1d6ci9JQUNWTmxWcmlS?=
 =?utf-8?B?bVJ0QkJRYmJmV3NhcWdaSkhqdmFYL2lQNTRMMzRXbGExajRYRnlUVlNSSkxm?=
 =?utf-8?B?RWtCOERldWNvWCttRHVrTDI4MWI2bjVCaW1HRTlBL21HM0JUU1p6NFdpRzR2?=
 =?utf-8?Q?6xD4tUgpitxse5Eip4rti/bzlxXgMRsPQxhX8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEsrQkp2dVExSEo4QzNLM09EOXh0MGtGL3FiZEcvZ1VYcjIxMVMyUHFHd0Ns?=
 =?utf-8?B?MHFHNTJKTWtZckMvSVllVk40TkxGWkdxNEJHbmVFRnhoWTQ3WnNCQ0MrNFVP?=
 =?utf-8?B?ZDhGOGdLUE5ndUhEZ1VVMktWaStPMUV6UHdwZ2EzdEF5RUQxRmk0aUdQV25U?=
 =?utf-8?B?OThVVk1KKzkwdTE4U3ltcEwrRDdTUmQvclQ1VlhKS0RwaHk1bDNLV21INUFD?=
 =?utf-8?B?UnJNR1B6YWVDcEdRRzBjUy9lVzY1N3ovMFBrcFZzci9yUHl0QzJDN1ovaFNC?=
 =?utf-8?B?OTVOVC9wR3VETTBNRlF1elg1ZElNcjRoamJ2UDYzYm45VlNHcUppeVRlalgy?=
 =?utf-8?B?SDVXaXd1OHhNaEZoZUNFRVk3bWJDK1pzN3o1Z2N5R2ZWcUh2ZTFkN3Q0RWNU?=
 =?utf-8?B?blNMQUFoemVtUWp3SFQvTUZPZjhKb1dFNnprVEJieE0zZ1hSU1FmbEpsaGJ1?=
 =?utf-8?B?L3Q5cWk4TnVseEMwTE4wS0wzU2RuTjh1L1NYRXpYM2lhTlVWcUZhM2RMTzVr?=
 =?utf-8?B?Zmc5MzVTMHJnZUdnelJBVWs2TDNZNmI4YjF5VTh1VjQ4RXlzTGpmdDVyOUZk?=
 =?utf-8?B?L2ZGSjVWdTBDaU9KM0RjWGFOZHVUbldqdXpWalI3SENKN29NNGZmckthc3Jq?=
 =?utf-8?B?cnNubXNGZ3MvbUNkaDkwWFlnR3Q2NEdPSlJxQjdJVHVMeGVuQjdDcFNlVU9Z?=
 =?utf-8?B?MzN4TkRVelZjamVkd05Sci9ZL3NwdEpDeVI1UEQxZGU5YW13RWpyL0o4SWlE?=
 =?utf-8?B?NGZsbk1OYXJsRDQ0L29PNTRzaTl0WDd4dE1aNXZ6d1k4WVBzUHpiYlNYb3FU?=
 =?utf-8?B?UTJxZFZoY0x1UytPcnNERExqMUVidVM4NjlWR2ltU0ZLa2tNWDFXbDYzcHVi?=
 =?utf-8?B?VmxUL1ZvbWxaTmVUS0hpY09DR1U2aDJjRGFpUlpQeXlqdm9nR2VOY3VaUC85?=
 =?utf-8?B?elV1WlVlNHUwcjlwTEJ6VXJobkJUYTB3aGxNZmFIMWxiMTN5UHhwRlBoSFJn?=
 =?utf-8?B?L0RYbTJMUVBMVVlma1Zab3NJUFdKcm1rdEFnR3NhWXhkbVN2K0lMM3RzRnpD?=
 =?utf-8?B?TENzQTlhTk5nLzFpeHk5VG5nNXg1K0FuWE96SVd5dEN0REdtK3hNeTB2UGJh?=
 =?utf-8?B?ZnZiV1phSk5Wdm1uS3BSdHBiUHFzWlI5WjBSTTNNQzNEQzNBUlZLYU8yR0Zo?=
 =?utf-8?B?Y3A5MDBnbUhRWnF2Q0IwK0VJencyRmdTVmN0QU1WZjNNQWFmTG83cXl1c2t5?=
 =?utf-8?B?Ykh1b2xkem1KRlVhaW1FMEh0ZElwaWFIQWV5NXVoM2xXbGM1Yy84cVZ4UHpZ?=
 =?utf-8?B?ZVp0WEtGeWVlczd0YjQydDRkMHpCUE1scFdnNEJPcU1iQzBXSm5WUXBha2dB?=
 =?utf-8?B?SnhHM2dNNGY5Z0Z1a1NScDNaRlpjNWtmSzBweEd0NlVEdUx6TGc2VEU4cWZB?=
 =?utf-8?B?c0p2VHA4TXIra1hxQi9KWWpSVUNvV294bWF1MWl6aG1ERlJ5WEVmR01xcUJn?=
 =?utf-8?B?RG5FQVhQbzNWRFRBQkVoTC9hRTk3ODFPaktUaHQ2ZkpIL2pFclM3SER3NU4r?=
 =?utf-8?B?bEJxNHMxZmI5ejNZcCt5U2lvZUt2UmloNG44SHFINExLVlJUNnlyVG5CMk1U?=
 =?utf-8?B?RXU2QmM5enhYb0tFQTkwM2lxZW1TZExxSlM4UldTZFBkWTM3Vk04d2I3QkVU?=
 =?utf-8?B?ZlY0TittaWwxdHpoNWVjdThsUEx6QWhPR0JoT0E2NFlJTTI4a1NqWlFmWU11?=
 =?utf-8?B?ME1KOTdiSXpGWU16MDc5VEgwd1hrN2FFVzV6ZHZmMGpjMDVkNFdaNXBadjJC?=
 =?utf-8?B?clhGVFg5NUF5Qi8raHh3Sk9WMXhuOWRlZEJOOTA0OHlsenZXT0E3ZGkxUlU1?=
 =?utf-8?B?MGVkdFdTY29DNEVBbzZhcWRPdmxZSlpQZlVMVXRoNVpVVlk3R2RjTlBCZk4y?=
 =?utf-8?B?bXhCV3FMQkk0VWFjUTlJVmgvRk0xZnRZNlV3V2pUSlhELzU5UCt3Wms0Witx?=
 =?utf-8?B?WTJrR3BFMS9rdkx3YWNURys0K0xaSFZsbGtXRTdWa0xxYUVZR1JIMUVvU056?=
 =?utf-8?B?TXk0V2xXbUY0NUFuNlI0ZnhrT3ZCdnZmYXFWTEt2b21lK3NOSHBvMjV1Z2JC?=
 =?utf-8?Q?/L8Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64C7C84F6DB92049B95E287023989749@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f86800d-687f-4fbf-02af-08dcb102cab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 01:47:52.8343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fq9BBl8/R9gvxIXoiID2QA3zWrS5PR0KqXvQIUdQc+88YUgIHK1AFyxukpISeCsvx3xopveVohA9YBl6GXVrZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245

SGkgQW5kcmV3LA0KDQpPbiAyMDI0LzcvMzAgMjE6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+
IE9uIDA4LzA3LzIwMjQgMTI6NDEgcG0sIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gSWYgcnVuIFhl
biB3aXRoIFBWSCBkb20wIGFuZCBodm0gZG9tVSwgaHZtIHdpbGwgbWFwIGEgcGlycSBmb3INCj4+
IGEgcGFzc3Rocm91Z2ggZGV2aWNlIGJ5IHVzaW5nIGdzaSwgc2VlIHFlbXUgY29kZQ0KPj4geGVu
X3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEgYW5kIGxpYnhsIGNvZGUNCj4+IHBjaV9h
ZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycS4gVGhlbiB4Y19waHlzZGV2X21hcF9waXJx
DQo+PiB3aWxsIGNhbGwgaW50byBYZW4sIGJ1dCBpbiBodm1fcGh5c2Rldl9vcCwgUEhZU0RFVk9Q
X21hcF9waXJxDQo+PiBpcyBub3QgYWxsb3dlZCBiZWNhdXNlIGN1cnJkIGlzIFBWSCBkb20wIGFu
ZCBQVkggaGFzIG5vDQo+PiBYODZfRU1VX1VTRV9QSVJRIGZsYWcsIGl0IHdpbGwgZmFpbCBhdCBo
YXNfcGlycSBjaGVjay4NCj4+DQo+PiBTbywgYWxsb3cgUEhZU0RFVk9QX21hcF9waXJxIHdoZW4g
ZG9tMCBpcyBQVkggYW5kIGFsc28gYWxsb3cNCj4+IFBIWVNERVZPUF91bm1hcF9waXJxIGZvciB0
aGUgcmVtb3ZhbCBkZXZpY2UgcGF0aCB0byB1bm1hcCBwaXJxLg0KPj4gQW5kIGFkZCBhIG5ldyBj
aGVjayB0byBwcmV2ZW50ICh1biltYXAgd2hlbiB0aGUgc3ViamVjdCBkb21haW4NCj4+IGRvZXNu
J3QgaGF2ZSBhIG5vdGlvbiBvZiBQSVJRLg0KPj4NCj4+IFNvIHRoYXQgdGhlIGludGVycnVwdCBv
ZiBhIHBhc3N0aHJvdWdoIGRldmljZSBjYW4gYmUNCj4+IHN1Y2Nlc3NmdWxseSBtYXBwZWQgdG8g
cGlycSBmb3IgZG9tVSB3aXRoIGEgbm90aW9uIG9mIFBJUlENCj4+IHdoZW4gZG9tMCBpcyBQVkgN
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4g
IHhlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMgfCAgNiArKysrKysNCj4+ICB4ZW4vYXJjaC94
ODYvcGh5c2Rldi5jICAgICAgIHwgMTIgKysrKysrKysrKy0tDQo+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwu
Yw0KPj4gaW5kZXggMGZhYjY3MGE0ODcxLi4wM2FkYTNjODgwYmQgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5
cGVyY2FsbC5jDQo+PiBAQCAtNzEsOCArNzEsMTQgQEAgbG9uZyBodm1fcGh5c2Rldl9vcChpbnQg
Y21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICANCj4+ICAgICAgc3dp
dGNoICggY21kICkNCj4+ICAgICAgew0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICogT25s
eSBiZWluZyBwZXJtaXR0ZWQgZm9yIG1hbmFnZW1lbnQgb2Ygb3RoZXIgZG9tYWlucy4NCj4+ICsg
ICAgICAgICogRnVydGhlciByZXN0cmljdGlvbnMgYXJlIGVuZm9yY2VkIGluIGRvX3BoeXNkZXZf
b3AuDQo+PiArICAgICAgICAqLw0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycToNCj4+
ICAgICAgY2FzZSBQSFlTREVWT1BfdW5tYXBfcGlycToNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4g
Kw0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9lb2k6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2ly
cV9zdGF0dXNfcXVlcnk6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2dldF9mcmVlX3BpcnE6DQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3BoeXNkZXYuYyBiL3hlbi9hcmNoL3g4Ni9waHlz
ZGV2LmMNCj4+IGluZGV4IGQ2ZGQ2MjI5NTJhOS4uOWYzMGE4YzYzYTA2IDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gveDg2L3BoeXNkZXYuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L3BoeXNkZXYu
Yw0KPj4gQEAgLTMyMyw3ICszMjMsMTEgQEAgcmV0X3QgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBY
RU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICAgICAgICAgIGlmICggIWQgKQ0K
Pj4gICAgICAgICAgICAgIGJyZWFrOw0KPj4gIA0KPj4gLSAgICAgICAgcmV0ID0gcGh5c2Rldl9t
YXBfcGlycShkLCBtYXAudHlwZSwgJm1hcC5pbmRleCwgJm1hcC5waXJxLCAmbXNpKTsNCj4+ICsg
ICAgICAgIC8qIE9ubHkgbWFwcGluZyB3aGVuIHRoZSBzdWJqZWN0IGRvbWFpbiBoYXMgYSBub3Rp
b24gb2YgUElSUSAqLw0KPj4gKyAgICAgICAgaWYgKCAhaXNfaHZtX2RvbWFpbihkKSB8fCBoYXNf
cGlycShkKSApDQo+PiArICAgICAgICAgICAgcmV0ID0gcGh5c2Rldl9tYXBfcGlycShkLCBtYXAu
dHlwZSwgJm1hcC5pbmRleCwgJm1hcC5waXJxLCAmbXNpKTsNCj4+ICsgICAgICAgIGVsc2UNCj4+
ICsgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+ICANCj4+ICAgICAgICAgIHJjdV91
bmxvY2tfZG9tYWluKGQpOw0KPj4gIA0KPj4gQEAgLTM0Niw3ICszNTAsMTEgQEAgcmV0X3QgZG9f
cGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+
ICAgICAgICAgIGlmICggIWQgKQ0KPj4gICAgICAgICAgICAgIGJyZWFrOw0KPj4gIA0KPj4gLSAg
ICAgICAgcmV0ID0gcGh5c2Rldl91bm1hcF9waXJxKGQsIHVubWFwLnBpcnEpOw0KPj4gKyAgICAg
ICAgLyogT25seSB1bm1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBkb21haW4gaGFzIGEgbm90aW9u
IG9mIFBJUlEgKi8NCj4+ICsgICAgICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgfHwgaGFzX3Bp
cnEoZCkgKQ0KPj4gKyAgICAgICAgICAgIHJldCA9IHBoeXNkZXZfdW5tYXBfcGlycShkLCB1bm1h
cC5waXJxKTsNCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICByZXQgPSAtRU9QTk9U
U1VQUDsNCj4+ICANCj4+ICAgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGQpOw0KPj4gIA0KPiAN
Cj4gR2l0bGFiIGlzIGRpc3BsZWFzZWQgd2l0aCB5b3VyIG9mZmVyaW5nLg0KPiANCj4gaHR0cHM6
Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL3BpcGVsaW5lcy8xMzkzNDU5NjIyDQo+IA0K
PiBUaGlzIGJyZWFrcyBib3RoIHthZGwsemVuM3B9LXBjaS1odm0teDg2LTY0LWdjYy1kZWJ1Zywg
YW5kIGdpdmVuIHRoZToNCj4gDQo+IChYRU4pIFvCoMKgwqAgOC4xNTAzMDVdIEhWTSByZXN0b3Jl
IGQxOiBDUFUgMA0KPiBsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5jOjE0OTE6cGNpX2FkZF9kbV9k
b25lOiBEb21haW4NCj4gMTp4Y19waHlzZGV2X21hcF9waXJxIGlycT0xOCAoZXJyb3I9LTEpOiBO
b3Qgc3VwcG9ydGVkDQo+IGxpYnhsOiBlcnJvcjogbGlieGxfcGNpLmM6MTgwOTpkZXZpY2VfcGNp
X2FkZF9kb25lOiBEb21haW4NCj4gMTpsaWJ4bF9fZGV2aWNlX3BjaV9hZGQgZmFpbGVkIGZvciBQ
Q0kgZGV2aWNlIDA6MzowLjAgKHJjIC0zKQ0KPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2NyZWF0ZS5j
OjE5NjI6ZG9tY3JlYXRlX2F0dGFjaF9kZXZpY2VzOiBEb21haW4NCj4gMTp1bmFibGUgdG8gYWRk
IHBjaSBkZXZpY2VzDQo+IGxpYnhsOiBlcnJvcjogbGlieGxfeHNoZWxwLmM6MjA2OmxpYnhsX194
c19yZWFkX21hbmRhdG9yeTogeGVuc3RvcmUgcmVhZA0KPiBmYWlsZWQ6IGAvbGlieGwvMS90eXBl
JzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiBsaWJ4bDogd2FybmluZzogbGlieGxfZG9t
LmM6NDk6bGlieGxfX2RvbWFpbl90eXBlOiB1bmFibGUgdG8gZ2V0IGRvbWFpbg0KPiB0eXBlIGZv
ciBkb21pZD0xLCBhc3N1bWluZyBIVk0NCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzox
NjE2OmRvbWFpbl9kZXN0cm95X2RvbWlkX2NiOiBEb21haW4NCj4gMTp4Y19kb21haW5fZGVzdHJv
eSBmYWlsZWQ6IE5vIHN1Y2ggcHJvY2Vzcw0KPiANCj4gSSdkIHNheSB0aGF0IHdlJ3JlIGhpdHRp
bmcgdGhlIG5ld2x5IGludHJvZHVjZWQgLUVPUE5PVFNVUFAgcGF0aC4NCj4gDQo+IEluIHRoZSB0
ZXN0IHNjZW5hcmlvLCBkb20wIGlzIFBWLCBhbmQgaXQncyBhbiBIVk0gZG9tVSB3aGljaCBpcyBi
cmVha2luZy4NCj4gDQo+IFRoZSBzaWJsaW5nICotcGNpLXB2LSogdGVzdHMgKGEgUFYgZG9tVSkg
YXJlIHdvcmtpbmcgZmluZS4NCj4gDQo+IEVpdGhlciB3YXksIEknbSBnb2luZyB0byByZXZlcnQg
dGhpcyBmb3Igbm93IGJlY2F1c2UgY2xlYXJseSB0aGUgInRoZQ0KPiBzdWJqZWN0IGRvbWFpbiBo
YXMgYSBub3Rpb24gb2YgUElSUSIgaGFzbid0IGJlZW4gcmVhc29uZWQgYWJvdXQNCj4gY29ycmVj
dGx5LCBhbmQgaXQncyBpbXBvcnRhbnQgdG8ga2VlcCBHaXRsYWIgQ0kgZ3JlZW4gYWNyb3NzIHRo
ZSBib2FyZC4NCg0KT0ssIEkgd2lsbCB0cnkgdG8gcmVwcm9kdWNlIGFuZCBpbnZlc3RpZ2F0ZSB0
aGlzIGlzc3VlLCB0aGFua3MuDQoNCj4gDQo+IH5BbmRyZXcNCg0KLS0gDQpCZXN0IHJlZ2FyZHMs
DQpKaXFpYW4gQ2hlbi4NCg==

