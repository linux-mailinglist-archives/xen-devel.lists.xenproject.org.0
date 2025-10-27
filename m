Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C61C0CC54
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 10:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151485.1482017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDJur-0004bv-Q3; Mon, 27 Oct 2025 09:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151485.1482017; Mon, 27 Oct 2025 09:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDJur-0004aS-Lx; Mon, 27 Oct 2025 09:53:29 +0000
Received: by outflank-mailman (input) for mailman id 1151485;
 Mon, 27 Oct 2025 09:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psOz=5E=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1vDJuq-0004aE-0D
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 09:53:28 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72734c5-b31a-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 10:53:25 +0100 (CET)
Received: from DM6PR03MB4764.namprd03.prod.outlook.com (2603:10b6:5:183::31)
 by IA1PR03MB8061.namprd03.prod.outlook.com (2603:10b6:208:593::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 09:53:21 +0000
Received: from DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7]) by DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 09:53:21 +0000
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
X-Inumbo-ID: c72734c5-b31a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeARPfWDNDh5DjZ++6lFJJuzyES0pVYS3OqHjqQwcGFVNoweLQKVb338mvNn1R2x+FkD4V3s1jho3HCNHU37lWKq5/w0vyY5USg/Lprt1h/5v9K5UEZOGWNfMtvGi3yMS4O/N2T1sh80Cmw+/FWmV6rbSs1I1Rw9kkSYCUOm05S2Y6cgQswHi5ldoLzKH8FeZ+LZhpUDXDVIYMI/it+utx95tT/TWg9uGdvM7FU4/7YqWxf8FpL+QeeI6zKJDBiOqah+kdUEY5/g01jP8KevY6RnBu1UmVfn4T/NnbZxKpDieLDIgTYMxqEX4qxVk7rIvN9S5zVBWi5FI7i7QS657A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtgKoyOCh6PYcXV+V7eu72pNy1m714ueBTbxQkipoEY=;
 b=eHUIxy4JxyuSrXc6RD/ELvx3JhHYZ8XWz8MKnn4+Xc3OSETDpKiqGSFG3iXjSmt4/RV8HhaH+us88xC3hAxn0QmuhM71TB1USb5WRR2g2H5yOsPQB3LKiJ9qH2UYpJEWwUqCwQwfmlDDojx0ar2T/2FnwhGagGaI7axhFlGvCgiG50WX/2u7ofzM1TV+MTj9TO96Tx5xUhiRb4LCnGFiDi+YjTYhbkAUC2lOolsdFaG6Ho0eQFc8BXWKR1TgXhLEsKOnmqmnj+/d0Ea7BJ2sRjhMb2711iY0IXquVp5VYoSVo2ECbsuZKlum2fjR3idw2e70aRIeV76KCMvoTUmM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtgKoyOCh6PYcXV+V7eu72pNy1m714ueBTbxQkipoEY=;
 b=iWKm09+BZJfYHWjPk+4iYlYRXmgfd7Y7eU02hBIYxPpxKTZwfS/hWTtk6HHanIqoxs9gdAkdvUgXaY5wno61aksk7DPzKrFa0YtjWfijxYyzwIVa3xa0xEiqxhEjmgO7Cm6bRAFbTdSAapZI3xnPoiTf3dCg3n/SoVWfIJCMKMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d289cbb1-33e4-4c03-b032-ec943cda8723@citrix.com>
Date: Mon, 27 Oct 2025 09:53:15 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vVMX: Cleanup partial vCPU initialization
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251024162054.2610454-1-ross.lagerwall@citrix.com>
 <213b6d6a-9d97-4ce6-a4b1-e41e8380656a@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <213b6d6a-9d97-4ce6-a4b1-e41e8380656a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::16) To DM6PR03MB4764.namprd03.prod.outlook.com
 (2603:10b6:5:183::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:EE_|IA1PR03MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: f12cd5da-8a9c-4d17-7bdf-08de153ea992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0JFempwcFJYYTZOTUxUdkhQVXpZYjUxakRQK2xCaGtqTmZublVVdENEUGpi?=
 =?utf-8?B?NEFYRm5OaFZmQnhzalZ6WGJvVy9rcmQ1N01hM3ZHczJmaEpkWHZXdnBhZU93?=
 =?utf-8?B?WXJlSUc3L1FUZ2JrWWRvNU5udUpvMlh2Q3RURjNlcHF4YldlV08xNkJGZGZI?=
 =?utf-8?B?M1RkVU4rc0tEVlNiSVZUVWUvbERiQ0g3VkcwemVtTGhkcEF3REE4OTBLU2E1?=
 =?utf-8?B?eWorQUthU2pKc3cvODY0RGZmZ043MXFUdHpjMHlGWWFUS0xvaVFrdHlQUTgr?=
 =?utf-8?B?YlgxdUZJdUp0TmIvbWEwNjk1VVl6dkx1cm1OMGdPby9UMzVackNaa2J2RFhr?=
 =?utf-8?B?cGgxdzdlbStEYkRzSzJEOTZRcExwQWxNV1pSdVova3loZHNyN3B6Y252ZDhI?=
 =?utf-8?B?a3l5NUFGaFhWa09LaEQyUll6MGFHMlVVVTFNZlVpNDNvZUE3bjN5YnMwdHRz?=
 =?utf-8?B?S1RCV1VSUlAxMmMwYm9vZmtxL3dMQjJsTWtrYVNBZkZyd3FPeThna3lHa2VC?=
 =?utf-8?B?U3c0MTRmL2FBQUp2N2Nnd0U5K3JVUERzdTVaQlY3SFVveHVVZjZlWkdKZGVN?=
 =?utf-8?B?KzlUc2psamlEcFc1OXpRZjNqUG5MZEVrYS9RRkk2cytjbWpZRU9iMGJPWDVD?=
 =?utf-8?B?MWVodE1Sd2hhbWRoaHY5aGJyUngySTZzNXA5b3VIS3pZbmJjdjZoQkVsUGhD?=
 =?utf-8?B?ZnIzUzB3SmU4TWV5SVpPRU8rTzNhaG5xNjZPUGJDbHEzanFhWldkYzZBTkR2?=
 =?utf-8?B?RFk0YjBJUUpWd0dlQkF1TkVXK3lQKzZhSFAxRVVBTEMvZzE2L3JYaWJnaWgv?=
 =?utf-8?B?WjF1ZG5WcnR5YU0zem8xRWtmL0pUZTIwRFR6cFNaUy9KU1cyeHVYMDhJWUo5?=
 =?utf-8?B?d0dOc3JKWk5FMnVod3UrV2F2WmE4MWpPemRRQUNBZ0tzRU5kV0k1alFEeUdl?=
 =?utf-8?B?WjJ4OEZEVS9lcm00YTVaYW9raE94ZG5HZU5pOUQvdnQwaUNCZ3B6SkloUjdF?=
 =?utf-8?B?YzF4VDJ2Qk13T3hVQ0lGa0tkbmtoMFI1NnNnVGNvTm5vNnZMRENhSHI5OUFD?=
 =?utf-8?B?eWczdUNQbVVUcml1cXE5d1YxMzBDdW12akk0dGdVeThqZWtMNDBWTndnM01T?=
 =?utf-8?B?S3VZQWRvaDNLN2MxVm4zQ1BoK0JqSWVoak5wWTBaLzRTbnZGaE40N25zbkJu?=
 =?utf-8?B?eXYwMlVwYXNIdDlDNlhmZWJJemFlT2FFeE56dmZuT3VCSlgxSTltSU1ucVpl?=
 =?utf-8?B?TWphdDRvbE5UbGxKTER2RGpRY2R1enh6MjVyTjkrQy93c2ErVGUrMkEzNDg0?=
 =?utf-8?B?U2R2NGpYbFdEZzhHNlRaNkl3N0VPVk5sbDZielhGeUFPQnBEOWl3TFM5dElB?=
 =?utf-8?B?TnFEMDNvQmUrbDlhOXlqbzdTNXpZeTJtZDZwc3F4RWlOVWZyR3BzS044L2dt?=
 =?utf-8?B?Q3VtU2tkYklIWGFubHFKcURaOGMrVzNHSEsrMDREeDBKc0RNejI5RG1PdjdQ?=
 =?utf-8?B?d1RtYXE5M05Ud2tlQ0RGb0YydlBRM09FT2M3MkkvUStkcndhV1M4QkhJbzVI?=
 =?utf-8?B?dWVrbG10MkVjb2pXWjFqRU9KdWxvY0lwcmJSbVgzNlo2eEo0NVJlYXpKMU9i?=
 =?utf-8?B?TTNkZFh4ZnY4MWtQNTFFZWhhNkJJeFZ1TUttVkdYN0NkbW1KWDdjelFDK3dy?=
 =?utf-8?B?cDEzbGF6bUNrRXJaYW0vejhqQ0k2N0F4WndRbUpnckEwcHEzYUFocVM4RU5D?=
 =?utf-8?B?VXdnZEdvTVIwR1VDcjBxdTMxS2dxWW5FTzU2ZVROY25iZ3R0cis1VCt2NUwz?=
 =?utf-8?B?OVJ1V2VXR2xYWTgySDNLSU0rVUdyTGUwdFk0U3RlREQrOEs0aDRQSmRZMXN2?=
 =?utf-8?B?eWt5NGxlRi9tR0dHVUhMQU1sdFNKSnpVdDI4ejJISTc1RlptV3JqVVIvT05w?=
 =?utf-8?Q?C7Y8yXMfcyvzh92kV3Q9LuyUFjmwyHhD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4764.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXVVeU5lR1R1NVhGRE1zM1N0QzB0WjdGR0krY3I0VE5pSGdTMW8yNUk2MmVX?=
 =?utf-8?B?RVFqaHI0Mm5qRDJocGJnbldxa2paVm9SelJwWVdBblZpbUU0b05yWkgwVVUy?=
 =?utf-8?B?WWtLdUUycjJZcXlza0hjR3lNR0NhVlRpWERORmgwb2pFRmVOYXV1Uk41VjJU?=
 =?utf-8?B?ajFjYmZ6T3JyeTRhMitJM2tzMjVWWnFKWEkrZFNGY1k3ajdvK2RnZ1J0bnZG?=
 =?utf-8?B?MVlwRC9CTUdGbEM5VEJsMXh3Z0Z3ZiszWFcyOFhsTmo1WE9VZ093K04yY1cv?=
 =?utf-8?B?WUZlZWhleXlodkVZT1FZVGFHa3dGeDRJQUFPSklNaGpSSEsvSFp4b09icW8w?=
 =?utf-8?B?Si9KeVF0R1NlUlQ5RkNMdDVYMXZuQ3JSY1FoN1pqTWFBWWZyR1BlL2Qvdzlj?=
 =?utf-8?B?cXdiUFBBcHM1V1dHWU1aRCtOMlZnSE9xQ2JpTHI5NW1MbjdsM2pCWlcxMWpW?=
 =?utf-8?B?c1VYZTBTZWZaQ0c0MHhjWGNBdDEveHNybCs0U2U4eTZ5cXRVcTFiSjNDU3hq?=
 =?utf-8?B?OGQ2aDFZdHhsS0hiWkN4TTlaRk9kM2tQSEtualBuUWVVUVRSV1BaaDQzQW03?=
 =?utf-8?B?MXE2RUhyMU9tbG1QYUJqNmt0eTcwaVQxNWtUYnF3Vm0vVmhVNm85cmpzUnJl?=
 =?utf-8?B?V0IwSmFteld2WnpsSjhkTytac1poQzUvbk5ZdHgvTC8yOExQZ0xUVGtqc1Zn?=
 =?utf-8?B?emhHb1J2WGppVGdOUXp1RUg3ejRHTEFUYjF1SlRMT3dsU1lwb0drdHBnc0cw?=
 =?utf-8?B?VnVvQWxHeWRKdDRLYWVHS1pVdk1yRmhoZmwvdFJVWFhWSWxvRTNxYU9Xaktz?=
 =?utf-8?B?eHhvdExpZ3RXWXZtSndBSWhsWWdSQXZzcGlRWlhzSzc0S1lpeW5nMGlSWm9V?=
 =?utf-8?B?ZXRma1h1ZUV2bFNXbkJDWEplYkxEMllGMDRreVlGNGMwT1RRUCtCeE5xNUpl?=
 =?utf-8?B?cmVRVTBldkdmREpNdEs2eHk4WW4vWG4zWUhzbjJMclFReFBVV0NrMjBhU3Z5?=
 =?utf-8?B?Y082TmFyTG40TngwQ2pNUktLdnZQeFhXQzE0MHVrSUxGTG1Ubk5EdEdCWmNv?=
 =?utf-8?B?Z3UvdUJyL0ZQRjhlTDhJT0syRTNzQjAvV0NMQ1o2cUprZU41ci96MUJablhM?=
 =?utf-8?B?azR3SXhkaUZ6ZUhPNDFqTVBUd01hSGF0SnN0RVc0UHFHcnIzZTNhQ241RzVr?=
 =?utf-8?B?SUhHRUNIcExESTdYMHdzSkhDNXpweVdTWHQzWXQzcTM4d2xDQjNQZUNXZUQ1?=
 =?utf-8?B?eWpJOXpVS3BSemVNY05HTGt5cmVCbUs4Y3J6WFRiYmQwUlNVTXkrUDFDM1M5?=
 =?utf-8?B?aEg2bmVxS0xuNjJ5T3QxSHFadXVwb2J3OUNpZVI5anhEelo3UVNPaWR5dlU0?=
 =?utf-8?B?NnN4U2s1bDZKQnYyUjRYSHRVZUcyUnozTFJ2eEFlQzdiQWRDamdLeUduRzh6?=
 =?utf-8?B?OXl6ci95UTFSTERhSUtyM3c4bDhzWHpLa05ZemhVVFJ2MytsSDZDYW1YQXJB?=
 =?utf-8?B?R094cHd6STdBNXI4di9oUFA3NVFWR1l5QnR5cTZvSGcyMktqOG12dVdObkZu?=
 =?utf-8?B?N1hUL2x2dXhGd3gzTWtGU3JCdWxkL2RuTkR1Rnd2cVhPcTJUQjFaVUUwd01K?=
 =?utf-8?B?eWpMUDByd2o5N09EM3RxSlVwS0ZaL01FdEVDL0VNYzBmaGhJZUNiQ2V1SzFV?=
 =?utf-8?B?QVE0R1cwelp4OENSc0NOdFlPZGIyWFdCdUN1SldIMjQ4NjRkMnp0bTRvV2JP?=
 =?utf-8?B?SmZoTjU2RXhGLzBBY3BSVHc3Wk1NNXpxSXVIMmNIL09CaU5Fbzl2L05pbHl5?=
 =?utf-8?B?OE9BWXpqU25hVko3amdXUkVWaUtwOU1SQWwrcUUreTJaYnZiczZJazVEN3Jq?=
 =?utf-8?B?VzhoQVJzY2ZOR2lVSEVyaGhpR3ZVK09peW9uSGNUUU1XT2RWamdXbURiOXRU?=
 =?utf-8?B?VWl6V05OZW5iT0lZMWJqbEx3dlREL3pkOVBGRFpkV3p2bkxWd0FiWlRVVlAz?=
 =?utf-8?B?bW96Ni9nMEwwNmc0eG5qU2FMWVZTZTkzMTFBbW1hKzM1ZHpwVC9aRXIvQVJK?=
 =?utf-8?B?UVVUSGFqUDlQQVExUWtucUxjUzVmSFRGWHRDVmpJcFRoSzAxcjN4Si9IaEM3?=
 =?utf-8?B?NHBHZVJxUnp6eWxiRDluYnZjWU95ckJaS2VYZW11Y1pqaUZqWjJWZnR6ZnlF?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12cd5da-8a9c-4d17-7bdf-08de153ea992
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4764.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 09:53:21.2313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCH+BxWMtVQp6xZNUBQZMRXWmIW+rJOuLIyLZBAuELTIQ7U1IG8RTZiOl/Rbl31gwA6eU1idaqzt2x1eM9TvDfnebMXip9ICvECbeYTO8NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8061

On 10/24/25 7:08 PM, Andrew Cooper wrote:
> On 24/10/2025 5:20 pm, Ross Lagerwall wrote:
>> If nested vCPU initialization fails, cleanup the allocated memory since
>> it is no longer handled by the caller.
>>
>> Fixes: c47984aabead ("nvmx: implement support for MSR bitmaps")
>> Fixes: f5bdb4aaa165 ("x86/hvm: Obsolete the use of HVM_PARAM_NESTEDHVM")
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> AFAICT, this is because of hvm_vcpu_initialise() not calling
> nestedhvm_vcpu_destroy() if nestedhvm_vcpu_initialise() fails?
> 
> I think this is an improvement in the short term, but we really need to
> fix our object lifecycle.  Relatedly, I should dust off the fault-ttl
> series because it would be able to find this failure automatically.
> 
> ~Andrew

Having hvm_vcpu_initialise() call nestedhvm_vcpu_destroy() would be one 
way of fixing it (albeit it is complicated because some cleanup is also 
done in vcpu_relinquish_resources()). But IMO generally a partial 
failure of an initialization function should be handled up internally 
rather than expecting the caller to deal with it.

Ross

