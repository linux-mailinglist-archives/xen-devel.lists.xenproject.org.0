Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A85AAD418
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 05:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978155.1365004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCVWl-00055s-Ni; Wed, 07 May 2025 03:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978155.1365004; Wed, 07 May 2025 03:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCVWl-00053e-KV; Wed, 07 May 2025 03:32:59 +0000
Received: by outflank-mailman (input) for mailman id 978155;
 Wed, 07 May 2025 03:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCVWj-00053T-Ha
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 03:32:57 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2009::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f64b953c-2af3-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 05:32:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 03:32:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 03:32:47 +0000
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
X-Inumbo-ID: f64b953c-2af3-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRT3TmSQ6i5Vh81fY6tQ0qWcS5bYCIk+lgnuIB+7KBikNcyjCqPRqS7LBS19q58EX7QJz7xaXtwwPUuKP99vbfDc8ozDGa3W7+vZTOw1FsnJLtJbDtOZNmjMKQRW4QZI/GbXfl81W4lkjffqM1h3jYCmyyCRhUtXYahm0217NFjQQ7Cw7c5H5ALQjPlp4FiXX72/q0EPVEebiRhv7ram9oHJ35TZTDBjBTAoXdj+mP+M/2WL5K/ar7yITGNtG5dQWWNxtMv2Rft7WgVgzBeS5nxuaN9m5Nd5LL/GGe5z6NDRrO1VRE6XREyhVpyPmhGhp13xmYZNLxkg99Zm+M5fPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0klfDFk0oD1mNFMFmYWfGLUMNDOrYjQgES5nwI92hA=;
 b=hs1cmZ/Fqs/yZummmnAcpHjqIcdNFRvAYN6OiEzSQZSW2dDGvalxr840gLV/Pk/WLQ/SrYArJINOxii8d7Q8Yzp+nIgPJ6JL6QgHt6R4UdvC41XlfD+zc3Do1VYePVrIQHheyguojjYr0W/V2NDC5wlvO/8754ewwB47PbPK95h/pyBRixestS+S6REm+9yud7duyKDifUXgktFBRG2+6WojeQ5y0CQ2Dr84arQ32WKQ6/jEl9nylx3dW8jfZIh4fDtNDDOaLGWLcwxLKAM60Zfh/J80zeItQkvuzQbKqX89ZwtqzQKlT5wxbPul1Hg1Ia1IzU3E+O8smFe9cDp0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0klfDFk0oD1mNFMFmYWfGLUMNDOrYjQgES5nwI92hA=;
 b=EI+ibxlSu3ziT4lKRvagaMmGp8Yupq78HmFAY+v98NfAwjQFH1UFxB0LDj0/4xzB6FKhUnBRxWWGRa58D9YDJfNLrIqJr1APnUmeDW6g15H1heGnQmsKHA8HwCGhv3MFfMPmtLaa9117dY4yA5OaDi0nbCpDrDJcoWb+oM6B/rQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 04/11] vpci/header: Emulate extended capability list
 for dom0
Thread-Topic: [PATCH v3 04/11] vpci/header: Emulate extended capability list
 for dom0
Thread-Index: AQHbsoVY5fFyP0iPLUqWwUIzQgdm1rPFvVIAgAFjzIA=
Date: Wed, 7 May 2025 03:32:47 +0000
Message-ID:
 <BL1PR12MB584924E0BBAFBE214699BCE3E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-5-Jiqian.Chen@amd.com> <aBoZRicr20a4eCNV@macbook.lan>
In-Reply-To: <aBoZRicr20a4eCNV@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB6164:EE_
x-ms-office365-filtering-correlation-id: 42698237-e66b-4875-029d-08dd8d17d638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ei9PMjI0ZHFzczBGVnNXSjM3L3dKMTV5SVp1U2FaRmpyNXVIMjRUbzkxZERz?=
 =?utf-8?B?ZysreTlkUjdDeHhHRTVIenczWEM1UnJUQjJvd1A5dm05YVI3cGpqMUk3SUdq?=
 =?utf-8?B?Z2w1QlFDelpsN2pZY2tQYTlUNHBFa3BrTVRoa2NweGU5dmY0L0xnNjdhc044?=
 =?utf-8?B?Q1c2bFlmM0xndEI1cUZ6M0JnR2FUcFJTY0VFb2tMYlROMzlRZ3R5TzFrR3NV?=
 =?utf-8?B?LzJXdlZERDdlRTZHaTF0ODk0blJIMm5IeHZyaTZUckNLcVNISXZDQ3F5ekhM?=
 =?utf-8?B?Z0dOZ3pHeUt3TkV2RHRmV2xiZ0pJc21yUGd3UWdLUXY5K0Ird21XVHZRL1Vq?=
 =?utf-8?B?TkNtQXhNTDFyeTZlWUpJRmdhT05DYWtjYTBMcDV3cUpoTnNJOEdkYmF4dmww?=
 =?utf-8?B?VG1DTkZnQUtSelNoSnFBR0J1aWhPNURid21DdzNzY0ZBUFR1MkUvZUJLUDBY?=
 =?utf-8?B?OXlBVWRMZ0Faa3pjYzBrMGtRVDdCSzRsSER4VjlqcFpYL2xzVDZhWjNrWTJm?=
 =?utf-8?B?czJKdkFOcWk2VFFTTUxuRTVHMFhiVnhybU1hL0ZhS3l1OE44Zk1EQ3pFVDdh?=
 =?utf-8?B?ekV4YUxIOGo5bDZNNmR0TFJxQkxaNlpzSWlNNnRkNWtuRU9OWS9TcTMxSzQ2?=
 =?utf-8?B?QTFFUTJ4UlRQemN4MXAxc1FISzZBNGVQODUzS2RVckg4VlZaRHpzZWVnWWhL?=
 =?utf-8?B?S25DYlRLSitabjVvV0g0ajFWRllOWEpkY1JuTnc0TERNWE1hRlhDcmlSWmkv?=
 =?utf-8?B?T2VtaEh3YjdRYUxDL2NNQlIyQkpNWXllQXF6ZDZwVzhPalFKbHBtYTZ1amdE?=
 =?utf-8?B?a3VjNWFaRmx1Nk1ZQTlldFZ2NExSVjZaNzF6VS9hTW5OK0Nxb2EyMjl0Uzg1?=
 =?utf-8?B?RXp5ZWpxNHIvOHg1SHJsa3B0cEp0aE9jbWRhV3ZuaW5BL2FVN01oNzBIcU9L?=
 =?utf-8?B?d2NJZTV6OE5IS3Z2dm82cWVTWmRQRmdKdFpOM0xpbURRNHNFSG11R1dmT05G?=
 =?utf-8?B?d1Z0enQzaEt4c3l3RXl1cEtDem51Nm9lSno3T085WlEzaXhsdkttWGF6SUI3?=
 =?utf-8?B?cWFWNmlZYWp1V1lBRDRKa2lXZVJKK1pwbkU0NktFSHR3Tm9VWG54TXNqZE1Z?=
 =?utf-8?B?NEM1ZUxJQkVEMkJhT1ZTSml5ZWtlQjdxdVVhY1ZyekJVM1FPNWRZdWswS1Bn?=
 =?utf-8?B?ZWVTTVNPMk9aRWZWd0NyWEJZZCsrMWpmT0lQZG44bW51MGdnWjJVeGc1eFJu?=
 =?utf-8?B?c3k4ZWx0cmcraE5tUUsyRUlpNmNFNFhMTUFEZUdRdllDV21vY0JuMC9pZzd6?=
 =?utf-8?B?WjU1RGZ5elVGQjRvNnJJLzhRM1hlZTJJV3pZMmk4Q1lEUUlJTWlHaXRwd1lt?=
 =?utf-8?B?VFI4Y0lHb3pJTDcwZnVORUoyQmY3bzdmWHlpdmpyTW1PNFlaOE41TnNkbitY?=
 =?utf-8?B?VG5UNVYxb2h1SjRhWTBKM2FQeTFFS3N2NDB5bmNDc0tnalBXL3JBMXRYQ2hk?=
 =?utf-8?B?cEMybWdMTEl1VVJzR1JPRmxzVndMUkhhem1GclZyKzZYeFVCM29EVnJSaUVL?=
 =?utf-8?B?M3pzUytzV21ISG5XTTJneENlZUxzbytraGVuZ2RacEZOWEZVRnJWdGZrVEx0?=
 =?utf-8?B?NStOTzZDaGY4cUVHWVh5OXpnTEdQYi8yRkl0Z253MURvVDNJVDlrdERtZ0Rt?=
 =?utf-8?B?dDJYZmV3QWlIZnVZVE4ycnNjRzRmTnFZNWRvVEtqS0h4NFJydC9MUzhZUlc4?=
 =?utf-8?B?bkwrV2hzdDRsTWh6V3BVK1hFbkdkZFQxbFQwQ2M4WnV3M1lqWHFGQklaeEpr?=
 =?utf-8?B?cFR5cldueTl0ZTJQYjlwRmo5QTE0bVc5Z1ptcVFZbFZMajUxMHQ4SC8zczd4?=
 =?utf-8?B?YWpmNitrOC9WUVFwOWdyb2lhMGM4WEZVZE9NMzFNcDA5MmJMZ0plYk8wd1BC?=
 =?utf-8?B?T3lnZ1Z6NzBQd0toRmdtWFJwbDlKclV6dWJoYU1sTTNQbUFRUVNZVVNNZC9F?=
 =?utf-8?Q?W3H8XiiMq/YwoeTM/ZOr60mChQTs2I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkFrd2UxT09VcmZrYVhZS1FqK2xrNU16bnpiR2pLdWRGWjdwaktnK0ZhNHdw?=
 =?utf-8?B?UHZhL2k5OENKRnFqMjFyWGlqRVRkY0VkRGNjdjYwa2FzWnd1US9KZ3EwTWgx?=
 =?utf-8?B?WWVTaHNlQndoYSsyQ0FHb1pZRU1hV0lDTUpPYWtETGZsVWhHWERoSUxMVkYr?=
 =?utf-8?B?YW4vd3NrVjloWDZYNDM0NjNGZ2hIc0x4Tk5UK3YxREdtN3BuWmo4bnU1d2hH?=
 =?utf-8?B?aU1SVUthbk5ka0Z3TkprTHJGUFZ4NVlFeXY0SjlyY3pjOFV5SW9xTUdxejNp?=
 =?utf-8?B?VkpDQ0tkcVZnekJ0aWV2KzlGakp1VzhWVFZBTitveUlFemJWV0dFSS9vSTVa?=
 =?utf-8?B?OTBoSHdoSHNBZ2luYm1vWGg5ck44VkR6VnozbkxvUEMyU2dUbXU1RWEyaEhw?=
 =?utf-8?B?eDdsT0FCVFpxcm9qVUdMN21seTFUa29ldFo4N2dmZ0d3aU9SV2hZZFN6M2pt?=
 =?utf-8?B?T2lMYXo5M0FCQUx3citySTlxbTNBN0pnWTc5ZUdhdU02OFBlQUEzdWZOZXZp?=
 =?utf-8?B?dFgrOG5QbHdOb2dkOGF1bHhxT3VjUkZmbGQwaTFqM0I4UHhaVUpQcmY4NnFL?=
 =?utf-8?B?OXhFNkJIZEdoSGpOclR6bS91b005NDJEa3BCZjhQMFpYeEl6Q1FUWG41dWF5?=
 =?utf-8?B?UStqcHBHK2d6dnVyUXJnRko5SHVKSGFrWHJCYTZTZ0VwVXZyZmc1VnNhRmtw?=
 =?utf-8?B?L2VVK1B4cnpFSHo4YzNEUi81NXNtWlFCaVV3M0h6bmVydzhXWThlSG04aGtE?=
 =?utf-8?B?dTlLSlVneUUvY2llenpIU3RCUVVXbHErVnM0NHdLZ25pRnI4Q3VBM29MdlNk?=
 =?utf-8?B?SE1hZE93bmVHWHpjYmJWWkNkVGhzWDlvUEZZZWYrRktvUkFJbzkvZlVHS1Yz?=
 =?utf-8?B?TXpWckdaRm5xSmZCa203NkI3bThDOGdPY3dxWjFGTXpPQ3lYem9xMlU3NnIy?=
 =?utf-8?B?NS9vOUwxcU50ZUFqcTdkM3FzcGxHV1lNc0ZMQnFOMXhSQXRQd0d5TGxzREQw?=
 =?utf-8?B?WDUwdUtWWVFzT2VGUk9Bb2VoY2hGWVI2OTRXTTV6R0VhY1IwK0dsNFQ5bXRo?=
 =?utf-8?B?a3pUemtsWXVtb3JhTHZWRUJTZkl3bjRzdmIzYXUzY1ZLYWt4NUlZZ0IwQnkz?=
 =?utf-8?B?VjFmZHJmbHExVW5ZSjBIbWxaLzBTQ2U3OWE2b2d4ZEk5Wis5UGtaMzlhR3Er?=
 =?utf-8?B?WnJZMk4rSnhIODhFSUJKWkl6S1FybFpWR0g2T0NQcWdPbnhsNHM5VGJFVXNj?=
 =?utf-8?B?TTVEMTFZV3dzZG1pek81VHpxeVA0MFAxQ0hITnlGeTZRMDcwZVpBbnlYK1lV?=
 =?utf-8?B?MThuMGkyM1BmbHl1Unc0b3o0QUVRTElQNkFUZTAyV0FOaTBMVTlwYU1qZHRl?=
 =?utf-8?B?U3JqN3QzSFl2Q0pVdUhnb1hVb3lsUDI4WEphQWhBRFFvWVIxZUxFMTgySHRz?=
 =?utf-8?B?TlBIWVVDbEF0d2xIQWtqNDlwWW8xaWN0cStEVCtEOHl3elN3QkVpQ3FTdm02?=
 =?utf-8?B?bUEwUC9CRndlVVJ0U0ZKTkJ1VlVhcmxBcnora1AyeGQ0dC9ncmRlaUdDUXl2?=
 =?utf-8?B?R0JDOURkWUIvZlpPcHZna3hsNUlIK0JGeUxoN2tiRnc0c1IrSFpZdDVIU0xS?=
 =?utf-8?B?dWRiaysrZUJHRFg2YnhJeFVJQkpScWdjVEliTWFOdzRxaUdQVXhRMC9wZ3p6?=
 =?utf-8?B?RnlOOVBYaTFxeitHM0dMSXVSeXZOVHBTbFRZaHoyT1dzUkZmaklxSWZSbWhu?=
 =?utf-8?B?Ti9WbnowMlBtNjc2emtoalpGUlZOY0pDRSszS01ZQ2w0YTJ2b0kraTI4cXNW?=
 =?utf-8?B?TFdGdDFTV0NQNTdoTGFIb1NkT09xbStITzdFUEZyYWo3TG5HdVdCSldmZTdN?=
 =?utf-8?B?RTdNbzJ1NzdXK1pkZ2VkblpBS3dtaFE0ZUtudEhZeEFuMEp6VmszWkNRbms1?=
 =?utf-8?B?bDJqL2tNdk1WeW1iVnh6eHFwR3NtMzhXbDJpUEg0Q1VoYWVKNXVqYWZEd3p5?=
 =?utf-8?B?U2g3amFENVJWc3dtZVo2SWJaa0NsblhQamo4UTdLaWF3TWdRalplQnp0K3hk?=
 =?utf-8?B?QUplVUs2a05oNTJyZk9IUUxiQlFtRjVjSHBTTTA3RVc0ZEdXWHBnMW5hTzN0?=
 =?utf-8?Q?cF8o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79DA249CEB6CC7438EE102ECCAC774A5@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42698237-e66b-4875-029d-08dd8d17d638
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 03:32:47.3898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUW9fiMLEcCBbjuTJ1iIEUxX4ipq/d0r4N+yttQzIJBloQyVPxi4TH0kT6JgLiObnrkHQIrxP/fFRSMfd0UnNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

T24gMjAyNS81LzYgMjI6MTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE4OjU2UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gQWRk
IGEgbmV3IGZ1bmN0aW9uIHRvIGVtdWxhdGUgZXh0ZW5kZWQgY2FwYWJpbGl0eSBsaXN0IGZvciBk
b20wLA0KPj4gYW5kIGNhbGwgaXQgaW4gaW5pdF9oZWFkZXIoKS4gU28gdGhhdCBpdCB3aWxsIGJl
IGVhc3kgdG8gaGlkZSBhDQo+PiBleHRlbmRlZCBjYXBhYmlsaXR5IHdob3NlIGluaXRpYWxpemF0
aW9uIGZhaWxzLg0KPj4NCj4+IEFzIGZvciB0aGUgZXh0ZW5kZWQgY2FwYWJpbGl0eSBsaXN0IG9m
IGRvbVUsIGp1c3QgbW92ZSB0aGUgbG9naWMNCj4+IGludG8gYWJvdmUgZnVuY3Rpb24gYW5kIGtl
ZXAgaGlkaW5nIGl0IGZvciBkb21VLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6ki
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjItPnYzIGNoYW5nZXM6DQo+PiAq
IEluIHZwY2lfaW5pdF9leHRfY2FwYWJpbGl0eV9saXN0KCksIHdoZW4gZG9tYWluIGlzIGRvbVUs
IGRpcmVjdGx5IHJldHVybiBhZnRlciBhZGRpbmcgYSBoYW5kbGVyKGhpZGluZyBhbGwgZXh0ZW5k
ZWQgY2FwYWJpbGl0eSBmb3IgZG9tVSkuDQo+PiAqIEluIHZwY2lfaW5pdF9leHRfY2FwYWJpbGl0
eV9saXN0KCksIGNoYW5nZSBjb25kaXRpb24gdG8gYmUgIndoaWxlICggcG9zID49IDB4MTAwVSAm
JiB0dGwtLSApIiBpbnN0ZWFkIG9mICJ3aGlsZSAoIHBvcyAmJiB0dGwtLSApIi4NCj4+ICogQWRk
IG5ldyBmdW5jdGlvbiB2cGNpX2h3X3dyaXRlMzIsIGFuZCBwYXNzIGl0IHRvIGV4dGVuZGVkIGNh
cGFiaWxpdHkgaGFuZGxlciBmb3IgZG9tMC4NCj4+DQo+PiB2MS0+djIgY2hhbmdlczoNCj4+IG5l
dyBwYXRjaA0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IEppcWlhbiBDaGVuLg0KPj4gLS0tDQo+
PiAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLQ0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgfCAgNiArKysrKysN
Cj4+ICB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgIHwgIDIgKysNCj4+ICAzIGZpbGVzIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+
PiBpbmRleCBjOThjZDIxMWQ5ZDcuLmVlOTRhZDhlNTAzNyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMN
Cj4+IEBAIC04MTcsNiArODE3LDMxIEBAIHN0YXRpYyBpbnQgdnBjaV9pbml0X2NhcGFiaWxpdHlf
bGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUENJX1NUQVRVU19SU1ZEWl9NQVNLKTsNCj4+ICB9DQo+PiAgDQo+PiArc3RhdGlj
IGludCB2cGNpX2luaXRfZXh0X2NhcGFiaWxpdHlfbGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBwb3MgPSBQQ0lfQ0ZHX1NQQUNFX1NJWkUsIHR0
bCA9IDQ4MDsNCj4+ICsNCj4+ICsgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKHBkZXYtPmRv
bWFpbikgKQ0KPj4gKyAgICAgICAgLyogRXh0ZW5kZWQgY2FwYWJpbGl0aWVzIHJlYWQgYXMgemVy
bywgd3JpdGUgaWdub3JlIGZvciBndWVzdCAqLw0KPj4gKyAgICAgICAgcmV0dXJuIHZwY2lfYWRk
X3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIE5VTEwsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcG9zLCA0LCAodm9pZCAqKTApOw0KPj4gKw0KPj4gKyAg
ICB3aGlsZSAoIHBvcyA+PSBQQ0lfQ0ZHX1NQQUNFX1NJWkUgJiYgdHRsLS0gKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICB1aW50MzJfdCBoZWFkZXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2Jk
ZiwgcG9zKTsNCj4+ICsgICAgICAgIGludCByYzsNCj4gDQo+IEknbSB0aGlua2luZyBpdCBtaWdo
dCBiZSBoZWxwZnVsIHRvIGF2b2lkIHNldHRpbmcgdGhlIGhhbmRsZXIgZm9yIHRoZQ0KPiBsYXN0
IGNhcGFiaWxpdHkgb24gdGhlIGxpc3QsIG9yIHNpbXBseSBmb3IgZGV2aWNlcyB0aGF0IGhhdmUg
bm8NCj4gZXh0ZW5kZWQgY2FwYWJpbGl0aWVzIGF0IGFsbDoNCj4gDQo+IGlmICggUENJX0VYVF9D
QVBfTkVYVChoZWFkZXIpID49IFBDSV9DRkdfU1BBQ0VfU0laRSApDQo+IHsNCj4gICAgIGludCBy
YyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIHZwY2lfaHdf
d3JpdGUzMiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcywgNCwgKHZvaWQg
KikodWludHB0cl90KWhlYWRlcik7DQo+IA0KPiAgICAgaWYgKCByYyApDQo+ICAgICAgICAgcmV0
dXJuIHJjOw0KPiB9DQpCdXQgaWYgYWRkaW5nIHRoaXMgY2hlY2ssIHRoZXJlIGlzIGEgcHJvYmxl
bSwgdGhpbmsgYWJvdXQgdGhpcyBzaXR1YXRpb246DQphIGRldmljZSBvbmx5IGhhcyBvbmUgZXh0
ZW5kZWQgY2FwYWJpbGl0eSwgdGhlbiB1bmRlciB5b3VyIGNoZWNrLCBpdCBkb2VzIG5vdCBhZGQg
aGFuZGxlciBmb3IgaXQsDQppZiB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhhdCBleHRlbmRlZCBj
YXBhYmlsaXR5IGZhaWxzLCB3ZSBjYW4ndCBoaWRlIGl0IGJ5IHJlbW92aW5nIGhhbmRsZXIgZnJv
bSB2cGNpLg0KSWYgeW91IHdhbnQgdG8gYXZvaWQgYWRkaW5nIGhhbmRsZXIgZm9yIGRldmljZXMg
dGhhdCBoYXZlIG5vIGV4dGVuZGVkIGNhcGFiaWxpdGllcy4NCkkgdGhpbmsgYWRkaW5nIGNoZWNr
DQpJZiAoIGhlYWRlciA9PSAwICkNCiAgICByZXR1cm4gMDsNCmlzIGVub3VnaC4NCg0KPiANCj4g
T3RoZXJ3aXNlIG9uIHN5c3RlbXMgd2l0aCBhIGxvdCBvZiBkZXZpY2VzIGl0IGNhbiBiZSBxdWl0
ZSB3YXN0ZWZ1bCB0bw0KPiBzZXQgYSBoYW5kbGVyIHRvIGp1c3QgcmV0dXJuIHRoZSBuZXh0IGNh
cGFiaWxpdHkgYXMgMC4NCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=

