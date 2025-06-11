Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6861AD516E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011441.1389887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIYa-00041u-1q; Wed, 11 Jun 2025 10:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011441.1389887; Wed, 11 Jun 2025 10:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIYZ-000407-U0; Wed, 11 Jun 2025 10:19:43 +0000
Received: by outflank-mailman (input) for mailman id 1011441;
 Wed, 11 Jun 2025 10:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dnf=Y2=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPIYY-0003jf-BD
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:19:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2416::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94a91711-46ad-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 12:19:40 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 10:19:35 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:19:34 +0000
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
X-Inumbo-ID: 94a91711-46ad-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+4lHFb3Uo+AiKOMaMa5bGo9wB9dgrnW/8wiWVpGK3+Ps2Je/olwJFDs4U6GkkkjA4aPrbZ8ZfqJQ5DriQqBcJzIdGSy4oQ9ZP4w5Feja2KCgACBeTqvETG02f5uwEhXLjeH/sRkkcphLEUjyc6C5wWgkrrCZeydbsN8I7st+mXzVcuX6jYTohEUoH1sF0vgALXvYlxJKaNPmx58t025roZrjnuAHsxq31BtFJD88EYBo/pn88x2Q2OMmexcYKP2p4+NXzVp1QhcOEN8xu6yiO2G90nDsOFtC/FUe9KNaKqnEONIwpXrEjL6DP9p2sEj9vgVldhxL463ov5WbjT/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUApHNUtmZahn7IEFT++4Q19f9uAA00DwxrlyTg1OHk=;
 b=YNb3FlT3lYVpEvTKqpHfnXgsTbuIeNOr6rXQabpObohZF5IjVzCxNaI4r8OWn6i+c3JPEPOhHrpUoESmOxpVwXKl65CbBOvqRB3oznwPJwG1IsHs0kQYn/zBvPmR3+iANezxxiVN2HEQKkgoopQWJi5oAgEApEVIeHCSic9LBMIHw8hXKJ9xuCTOCpIgceRkj/v+czVNzHaFZIowNZM2H/g42noyc8Tf6qkQsTxZPHiF7oEV31MTmT4rAVZLmbmLvaN0Xl6muHm7ujeKSSNjek0OXmKCKMbLxrLDhew/CHjd/Uixaj01yPPBGucbJKqTfIgeEthRgMxO1K225MK7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUApHNUtmZahn7IEFT++4Q19f9uAA00DwxrlyTg1OHk=;
 b=R1mt5ac2hjsK9/d9QLJt4MVkUgWa1W6BLFtNcwaih4R1T1LD2Gk7+r1EWuGRYwp4/nkp4qzdXLyN+/wOtk6S2TJ0qQYPgT64WjP+ITc5xIozrlMOSxJH0ehRIG/Bj/nftfVupLwYqwf55BiIdqrVRb5XT2butY8yK2B3ihdCjeU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHbziMOHCuaHG697kCTYWoBETQpzrP0lKSAgAGsWwD//4WWAIAAI9IAgAUkMwD//5c1AIAAk1OA//+AeAAANIYcgP//sryAgAJNkYA=
Date: Wed, 11 Jun 2025 10:19:34 +0000
Message-ID:
 <BL1PR12MB584931934C33F982899FA577E775A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEapjHyBxHkkylkh@macbook.local>
 <BL1PR12MB5849102F05BD316C0BC20F9FE76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEa6JsVwyWchp04u@macbook.local>
 <PH7PR12MB5854FC2E82CD17483B6B6BCFE76AA@PH7PR12MB5854.namprd12.prod.outlook.com>
 <6a7a1ab8-aabb-465b-bd22-a2bc1597b83b@suse.com>
In-Reply-To: <6a7a1ab8-aabb-465b-bd22-a2bc1597b83b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY5PR12MB6432:EE_
x-ms-office365-filtering-correlation-id: e865ac76-104b-467e-7459-08dda8d17680
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N09GZGw1YWF5T2VwYW5OQnp4RWxVK0RjdmFhdXFyYTg1ZFM5SEdSMFZpTDVq?=
 =?utf-8?B?ZjFwMHVoT2dDYisxWm1EYWhXdWJmNjNIQXJiUnNxVHptcDErR0d4NXFPQnhB?=
 =?utf-8?B?R2NiVVhwUDZSV2F0YzMyVDdKVk5ySjRxb1ozNG5pQ3FSdjM5c2ZvQjlhN2xa?=
 =?utf-8?B?UVRzcDJCaFo5bE44eXMrNysrK3V6cDBtdFpiYUhyTmF2cHVuK3pZcnNsTXl1?=
 =?utf-8?B?ZXRhTzY1ekFjN0Vwd3NQQ1F3S1JkS2RkcXVwMSs3VG5SeFJOT0JZNHdxWm5W?=
 =?utf-8?B?NWRWeUl4L29IZVhUVnlMS1JUTitaNDJnZFpqaEVsYWswUnR4VHlTVjR0NFdn?=
 =?utf-8?B?ZFIrZU1hdWI2UzhhQVowemhrNnBVVDdGR1EzbWJiR25MRnlMY2FiTTNjcm9P?=
 =?utf-8?B?Q1laQ2tKRUVadVU2d1NwQjNTOUdIaXVubnV6ZW15T21FS0Z1ZVJ6YkRiOTBj?=
 =?utf-8?B?alJ1VFVyTkhZQk1STEppS2hIMjUzUncrTXV2UGYwdDczOVBxYXNNWlVkSVJt?=
 =?utf-8?B?WHdENnRvV0lGanVBRFhIcnRJTmt1SjlHNllnaGV5U1lQQ0g4M3drSWRidTcr?=
 =?utf-8?B?bUhLeGExZE00TzZTQmYwNXl5S3hKd0hsOWx4MWpHbHVqSVF5K1VNWXNaV0U1?=
 =?utf-8?B?YWNMTFlIU0tKcEk1dXVYVnpmem5yZ3RrT2Jra0FsVkt0dUVHR1FmamlteGtw?=
 =?utf-8?B?V09hYzNIZVZ1MHY2NDdoK0d0WW5uTkVxTU9KbEErVmQzWGVoUUh6T3grNXJi?=
 =?utf-8?B?NGU1N09wWkFKSlVkVStjWTRCOTlpS1FoWkFnbXhuc2xNdGY4QXpnWVIzZ3E5?=
 =?utf-8?B?M2VLWFpuWHkwLzBKc3g3bE1QemR5WFRBdXB0UkhFS2pYRkNFN1Q3TmdkVmdw?=
 =?utf-8?B?c2gzWW14SnhXakV2R0JzVmlHZG85UFg3SzlmYVRzYTBjOXNKSDFIWU9ZbWZj?=
 =?utf-8?B?R1ZBNTZqWWVMMHhpdkhoVzVHM1c3K1I3c0o2NlF4c3VtYjl5OUlkK1BOaldD?=
 =?utf-8?B?VWFKWXQ3VlU5MUYrUUFpZEFVMVF2QlYyS1krVlY1TkR1SkpadWdzN3krY3Zv?=
 =?utf-8?B?Y3IxVUFSZzJNM2NoK1Y5b2FJWnN1eHJCWU1BclZqUm9pWHhvUVVrVTBPaWVx?=
 =?utf-8?B?U2N5djdtVlUxbWZsZDI2b0xYRnhDV28zMzVEQkwwU0dkajh6cFdSNm9lWFRW?=
 =?utf-8?B?LzFBd1lSUTcyRGZSN1VTeDlDRVVHWE0zaFZCeTkrclBRKzdYZ083N2RDNlJ5?=
 =?utf-8?B?OWZtRXl5QnB0UzA4NERiM0dCU0NqT3dxQjdMbGNvSmswZmRZNmh2VzFaL1Vm?=
 =?utf-8?B?TmUwUkNKS1JTd2F1ZE92ZSs3RUF2S1NtK08wbGp1MTAxYStTTnFCb1pUajJC?=
 =?utf-8?B?NEhuMElkS24yZW1IUWtHUTJNQ1M1SmdIaXA1M24wNm9Qb09NZks1OUZKbVZ6?=
 =?utf-8?B?TmJuSUl0dTUzWktPa0o3R1dhSzIrTFhpMitzWkxjQm9aRmZtck1oVlpIaEUy?=
 =?utf-8?B?c2FLMlN6UnZKdjdoV2ZiaGNERllTNGdYVmFpeXBBZndiYjFxVitiRHJQWXF4?=
 =?utf-8?B?RDNtUjlWaGs0RVFoOG1LOE5nSHJDK3VhNFE3VVQwRDVYdmhqSitSY0FFNmQw?=
 =?utf-8?B?ZzFkb1kzM2crQnNiRXhrUVFKcEVvemdEZ1RqNVhUdUg1QitLcVNvR01JdVFI?=
 =?utf-8?B?cndhajVuUDJZTUlJSUJFZ3lIck0xTW13YnBaZFNJaWYxaWt1dzZYWDF4SXBR?=
 =?utf-8?B?V0V6aEgvMVhkZllEUGZLRU9XQTRLQ0diR0hsR3IwQ3lkWHNsNEw2d0pUckY2?=
 =?utf-8?B?c3FFcTVYaEl5cTVJNHhrNmJyTW81YnJvOVBkZ3gwL3R1dWlKN1A1YVhQYXVr?=
 =?utf-8?B?RjNJQ3lrWlVJTENxZkVad0xua0J3QTVsd0VvK2NGdlJDZ0RlOWlnYS9DYVNx?=
 =?utf-8?B?UXlCd28zMEVYV1Rkd0dsYXdSOWxSRi84bFVyNzNsK2lQcllEM0JuT1FSdVhR?=
 =?utf-8?B?Z09pQUlFbVNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVllN2dVUEJaNk5LeGRBN3Q1OGVycjM1bzlUN1hicGJHRktrVnVqclVTSUd5?=
 =?utf-8?B?cEg0eWlON2tHVjZVOHphMEZzNkowWmIwYUkvdUJHZ0tPcXhSTmVjSWZoQlg4?=
 =?utf-8?B?eEJQRTBMZmdjSytnODM1ejRibmZyalJjYVk5VkVkMXdndGRIbXFGRUdCWjRh?=
 =?utf-8?B?aXphaTFmREZ0RVA5TFFNOGxIbVhlVmxQUFgyR21VeWpwUjU1dE1laldOU3pH?=
 =?utf-8?B?WTR5YzZIdEhtdUNWVjlmSER1L2dBMEVETURZejMza3ZSWTJyU2xSdVNYckxu?=
 =?utf-8?B?Q2RIcEJJRW95Y09aZ29Wc2s2MW9YUGdybXlCWk5JTmlvV1JucUNISUdiTjh3?=
 =?utf-8?B?UTAwZzFkdUpnOXRkZzE3UmNrdzlhSTltRitUWjYvaWEzNXQwQ0Y3NGN0a2N3?=
 =?utf-8?B?Z3Jka1FpbWtLdi9WY3dsaEZadENDN0VwRXpLdHlFUVEwZGY2TGpmZEhORTFF?=
 =?utf-8?B?L0hVV1hiQWoza2tYYVEyaC82VlI2b3VEdmJxSmV4KytRR1hjRFgxR0phQzFM?=
 =?utf-8?B?QjRFa29CWjAvWFcyVmJFNlMyZE90SFgrV2VMeHNrSlVUYXJVSlBKVjZmSG1T?=
 =?utf-8?B?VXJ0UGVIeUZmK0thOVZGU29YQ1RTaXI0VThJOVdNZkZHUGJVVkVXaDJFR3Bm?=
 =?utf-8?B?MHo0Y0V2bkpPRTNDbDZDL2Mwa0JkYWFyTDluQ0grcXpDSVZOeXBvQmUvdEhL?=
 =?utf-8?B?V2xTYkt5ZUlOWDV3ZUpXaTE5ZHcrQXMybnFSTVIyKzVpYSt5L0ZiVHdPQVJZ?=
 =?utf-8?B?ZzRHNlA4N0tGYW9UR0xmVkFjMUwzdkRUL3BKbVdsUzBxZWNncGpmN3M0bFdu?=
 =?utf-8?B?R3I3N21MdDVJUzEzWVIrdkVkN21NSHhDcUNmVm9yM3g2MUlhT0VPUlhzRTZu?=
 =?utf-8?B?RHgrbFlTOUM5N2JXU1RyVU1zd05YNmtHM3E4YVpHM3dHK2NxM3F6TG1WN3Zz?=
 =?utf-8?B?czN5WDZIUFk0ODVoc2t1K284RWh5TUZMRWNGRjk1OTRZSmRGN1NKV0pmS2tt?=
 =?utf-8?B?SFBwZU0wRFJMbUJ5cUVCNzVpUVZKRWNyMWpUQlYxd2J0ZTFDNW5Pb0M5dTNr?=
 =?utf-8?B?N2JJRnk4NjBhK1ROMXNHMk9MdUhVK29PMlkxU05aMGZSTC9HZUxtRXM1YUJY?=
 =?utf-8?B?anhmUmFqL2x3bUx2a2VxS3JhUzJ1SFRIcjNVZHNiRVM3WlpFTHAxMThpWmt4?=
 =?utf-8?B?WFhTUS9QQzRzSHQ4ZWI3NkpZQSt0R2tBdXp1WG5nTmZrOTBjVkp6YlRPT1RO?=
 =?utf-8?B?blJWVGxiR2gvM0RXWEF4bVZlYjNnY2RTekJhOUhxeUo3N2t0cVhZQ0JPdUgz?=
 =?utf-8?B?bTVEdmxwYWtwcEdxS3g4dUtVQXVJbEdnYjNSV0FNd205ZFRRQWhiTUpWTWlJ?=
 =?utf-8?B?NDlrcCtaTVRtQTBvZ0o0QjMxbWR5SGF3TmlZSjhmeDRpS0pidG16UktOWmxT?=
 =?utf-8?B?TGpQOExWaXJCRUs3RHBOTWtLSjBaS3o4RGd5UmJzdTE1bHUwbkxqYU4wWCt4?=
 =?utf-8?B?ODZsaTVaQ1dYOUdKaXdJYldQWEJZQnM2ZDFPMFgvbFJzbFFzUm9RaHpVMmRk?=
 =?utf-8?B?SjlBb25GOE1Ma05HbXlGRE05a0hYSXg4RUpqMDM5ODFWdUw3WXhHaGhJU0U5?=
 =?utf-8?B?RkxrSTczRkozeks4WDRGbzRuZWRSQkhkZGxKS0FNeXVyczcrQmkzbWhmRkQ1?=
 =?utf-8?B?R0VsYUo0UklnKzdpYytmZ2svNG1Fa2hVOTQ3Q3dnclJZbDFaVjFGQjFYeGlv?=
 =?utf-8?B?ZWJHelNRZXZLZ1c1MkJmVmxER0J1TkhENFJmN21pYWN3Wm5kWG5HUG5lMnJO?=
 =?utf-8?B?UWdxWDlaY1NGUUd1QlRuamg4V2ZpWVdLTUV6NFdHRGhhak5lYWc2cUNoL0t0?=
 =?utf-8?B?UVdYbU9kTVdUcFloeG9FU3lZRGRUTjd6MTI0cFlPeWtKUk5XQ2ozS20wRnpK?=
 =?utf-8?B?VjgyMVJsMFFGNE9UbUxZckFna2dPWm45c3FFREhZZ09Pamh5Y2N3MVphQUZ2?=
 =?utf-8?B?TVI5c1Frc1RFaUMwby84RnJna2xOOEd5S2RwN2MrMnhWdGpDSGUyMENkazZQ?=
 =?utf-8?B?RjdqZkhJaWJRczNtVExYT3VEU1VNTHNqUmFhWG42dmphNkpCSEordjdCV090?=
 =?utf-8?Q?6b6M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <644CE52FBE58374DADA3E2F84F2736FD@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e865ac76-104b-467e-7459-08dda8d17680
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 10:19:34.5953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EbnJo8mJc5uo4YCitpXYh73Mm0WU7bbAldJZKLhuzWSS3NVsz+JDT1Kcg6Iw8Vl8oIU/xSRQumdP8neptX2dJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432

SGkgUm9nZXIsDQoNCk9uIDIwMjUvNi8xMCAxNTowOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9u
IDEwLjA2LjIwMjUgMDU6NTIsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjUvNi85IDE4
OjQwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIE1vbiwgSnVuIDA5LCAyMDI1IGF0
IDEwOjE4OjQyQU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4gT24gMjAyNS82Lzkg
MTc6MjksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBNb24sIEp1biAwOSwgMjAy
NSBhdCAwNzo1MDoyMUFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAy
NS82LzYgMTc6MTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+IE9uIEZyaSwgSnVu
IDA2LCAyMDI1IGF0IDA5OjA1OjQ4QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+
Pj4gT24gMDYuMDYuMjAyNSAwODoyOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+Pj4+IE9u
IDIwMjUvNi81IDIwOjUwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+Pj4+PiBPbiBN
b24sIE1heSAyNiwgMjAyNSBhdCAwNTo0NTo1M1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZTog
DQo+Pj4+Pj4+Pj4+PiArICB9OyBcDQo+Pj4+Pj4+Pj4+PiArICBzdGF0aWMgdnBjaV9jYXBhYmls
aXR5X3QgKmNvbnN0IGZpbml0IyNfZW50cnkgIFwNCj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAg
ICBfX3VzZWRfc2VjdGlvbigiLmRhdGEudnBjaSIpID0gJmZpbml0IyNfdA0KPj4+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4+PiBJTU8gdGhpcyBzaG91bGQgYmV0dGVyIHVzZSAucm9kYXRhIGluc3RlYWQgb2Yg
LmRhdGEuIA0KPj4+Pj4+Pj4+IElzIGJlbG93IGNoYW5nZSBjb3JyZWN0Pw0KPj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pj4gKyAgICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0
IyNfZW50cnkgIFwNCj4+Pj4+Pj4+PiArICAgICAgICBfX3VzZWRfc2VjdGlvbigiLnJvZGF0YSIp
ID0gJmZpbml0IyNfdA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IE5vLCBzcGVjaWZpY2FsbHkgYmVjYXVz
ZSAuLi4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IE5vdCB0aGF0IGl0IG1hdHRlcnMgbXVjaCBpbiBw
cmFjdGljZSwgYXMgd2UgcGxhY2UgaXQgaW4gLnJvZGF0YSBhbnl3YXkuICBOb3RlDQo+Pj4+Pj4+
Pj4+IGhvd2V2ZXIgeW91IHdpbGwgaGF2ZSB0byBtb3ZlIHRoZSBwbGFjZW1lbnQgb2YgdGhlIFZQ
Q0lfQVJSQVkgaW4gdGhlDQo+Pj4+Pj4+Pj4+IGxpbmtlciBzY3JpcHQgYWhlYWQgb2YgKigucm9k
YXRhLiopLCBvdGhlcndpc2UgdGhhdCBzZWN0aW9uIG1hdGNoIHdpbGwNCj4+Pj4+Pj4+Pj4gY29u
c3VtZSB0aGUgdlBDSSBkYXRhLg0KPj4+Pj4+Pj4+IEkgYW0gc29ycnksIGhvdyB0byBtb3ZlIGl0
IGFoZWFkIG9mICooLnJvZGF0YS4qKSA/DQo+Pj4+Pj4+Pj4gSXMgYmVsb3cgY2hhbmdlIGNvcnJl
Y3Q/DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3hl
bi5sZHMuaCBiL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmgNCj4+Pj4+Pj4+PiBpbmRleCA3OTNk
MGUxMTQ1MGMuLjM4MTc2NDIxMzVhYSAxMDA2NDQNCj4+Pj4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4veGVuLmxkcy5oDQo+Pj4+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3hlbi5sZHMu
aA0KPj4+Pj4+Pj4+IEBAIC0xODgsNyArMTg4LDcgQEANCj4+Pj4+Pj4+PiAgI2RlZmluZSBWUENJ
X0FSUkFZICAgICAgICAgICAgICAgXA0KPj4+Pj4+Pj4+ICAgICAgICAgLiA9IEFMSUdOKFBPSU5U
RVJfQUxJR04pOyBcDQo+Pj4+Pj4+Pj4gICAgICAgICBfX3N0YXJ0X3ZwY2lfYXJyYXkgPSAuOyAg
IFwNCj4+Pj4+Pj4+PiAtICAgICAgICooU09SVCguZGF0YS52cGNpLiopKSAgICAgXA0KPj4+Pj4+
Pj4+ICsgICAgICAgKigucm9kYXRhKSAgICAgICAgICAgICBcDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4g
Li4uIHRoaXMgaXNuJ3QgLSB5b3UnZCBtb3ZlIF9hbGxfIG9mIC5yb2RhdGEgaW50byBoZXJlLCB3
aGljaCBkZWZpbml0ZWx5DQo+Pj4+Pj4+PiBpc24ndCB3aGF0IHlvdSB3YW50LiBXaGF0IEkgdW5k
ZXJzdGFuZCBSb2dlciBtZWFudCB3YXMgYSAucm9kYXRhLWxpa2UNCj4+Pj4+Pj4+IHNlY3Rpb24s
IGUuZy4gLnJvZGF0YS52cGNpLiogKG11Y2ggbGlrZSBpdCB3YXMgLmRhdGEudnBjaS4qIGJlZm9y
ZSkuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEluZGVlZCwgbXkgc3VnZ2VzdGlvbiB3YXMgbWVyZWx5IHRv
IHVzZSAucm9kYXRhIGluc3RlYWQgb2YgLmRhdGEsIGFzDQo+Pj4+Pj4+IHRoYXQncyBtb3JlIGFj
Y3VyYXRlIElNTy4gIEkgdGhpbmsgaXQgc2hvdWxkIGJlICooLnJvZGF0YS52cGNpKSAoYW5kDQo+
Pj4+Pj4+IHNhbWUgc2VjdGlvbiBjaGFuZ2UgZm9yIHRoZSBfX3VzZWRfc2VjdGlvbigpIGF0dHJp
YnV0ZS4NCj4+Pj4+Pg0KPj4+Pj4+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZSBuZXh0
IHZlcnNpb24gd2lsbCBiZToNCj4+Pj4+Pg0KPj4+Pj4+ICsgICAgc3RhdGljIGNvbnN0IHZwY2lf
Y2FwYWJpbGl0eV90ICpjb25zdCBmaW5pdCMjX2VudHJ5ICBcDQo+Pj4+Pj4gKyAgICAgICAgX191
c2VkX3NlY3Rpb24oIi5yb2RhdGEudnBjaSIpID0gJmZpbml0IyNfdA0KPj4+Pj4+ICsNCj4+Pj4+
Pg0KPj4+Pj4+IGFuZA0KPj4+Pj4+DQo+Pj4+Pj4gICNkZWZpbmUgVlBDSV9BUlJBWSAgICAgICAg
ICAgICAgIFwNCj4+Pj4+PiAgICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsgXA0KPj4+
Pj4+ICAgICAgICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsgICBcDQo+Pj4+Pj4gLSAgICAgICAq
KFNPUlQoLmRhdGEudnBjaS4qKSkgICAgIFwNCj4+Pj4+PiArICAgICAgICooLnJvZGF0YS52cGNp
KSAgICAgICAgICAgXA0KPj4+Pj4+ICAgICAgICAgX19lbmRfdnBjaV9hcnJheSA9IC47DQo+Pj4+
Pg0KPj4+Pj4gRGlkIHlvdSBhbHNvIG1vdmUgdGhlIGluc3RhbmNlcyBvZiBWUENJX0FSUkFZIGlu
IHRoZSBsaW5rZXIgc2NyaXB0cyBzbw0KPj4+Pj4gaXQncyBiZWZvcmUgdGhlIGNhdGNoLWFsbCAq
KC5yb2RhdGEuKik/DQo+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gQnV0LCB0aGF0IGVuY291bnRlcmVk
IGFuIHdhcm5pbmcgd2hlbiBjb21waWxpbmcuDQo+Pj4+Pj4gIiB7c3RhbmRhcmQgaW5wdXR9OiBB
c3NlbWJsZXIgbWVzc2FnZXM6DQo+Pj4+Pj4ge3N0YW5kYXJkIGlucHV0fToxMTYwOiBXYXJuaW5n
OiBzZXR0aW5nIGluY29ycmVjdCBzZWN0aW9uIGF0dHJpYnV0ZXMgZm9yIC5yb2RhdGEudnBjaQ0K
Pj4+Pj4+IHtzdGFuZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNzYWdlczoNCj4+Pj4+PiB7c3Rh
bmRhcmQgaW5wdXR9OjMwMzQ6IFdhcm5pbmc6IHNldHRpbmcgaW5jb3JyZWN0IHNlY3Rpb24gYXR0
cmlidXRlcyBmb3IgLnJvZGF0YS52cGNpDQo+Pj4+Pj4ge3N0YW5kYXJkIGlucHV0fTogQXNzZW1i
bGVyIG1lc3NhZ2VzOg0KPj4+Pj4+IHtzdGFuZGFyZCBpbnB1dH06NjY4NjogV2FybmluZzogc2V0
dGluZyBpbmNvcnJlY3Qgc2VjdGlvbiBhdHRyaWJ1dGVzIGZvciAucm9kYXRhLnZwY2kgIg0KPj4+
Pj4NCj4+Pj4+IFdoYXQgYXJlIHRoZSBhdHRyaWJ1dGVzIGZvciAucm9kYXRhLnZwY2kgaW4gdGhl
IG9iamVjdCBmaWxlcz8gIFlvdSBjYW4NCj4+Pj4+IGdldCB0aG9zZSB1c2luZyBvYmpkdW1wIG9y
IHJlYWRlbGYsIGZvciBleGFtcGxlOg0KPj4+Pj4NCj4+Pj4+ICQgb2JqZHVtcCAtaCB4ZW4vZHJp
dmVycy92cGNpL21zaS5vDQo+Pj4+PiBbLi4uXQ0KPj4+Pj4gIDE3IC5kYXRhLnZwY2kuOSAgMDAw
MDAwMDggIDAwMDAwMDAwMDAwMDAwMDAgIDAwMDAwMDAwMDAwMDAwMDAgIDAwMDAwYTUwICAyKioz
DQo+Pj4+PiAgICAgICAgICAgICAgICAgICBDT05URU5UUywgQUxMT0MsIExPQUQsIFJFTE9DLCBE
QVRBDQo+Pj4+Pg0KPj4+Pj4gSXQgc2hvdWxkIGJlIFJFQURPTkxZLCBvdGhlcndpc2UgeW91IHdp
bGwgZ2V0IHRob3NlIG1lc3NhZ2VzLg0KPj4+Pj4NCj4+Pj4+PiBBbmQsIGR1cmluZyBib290aW5n
IFhlbiwgYWxsIHZhbHVlIG9mIF9fc3RhcnRfdnBjaV9hcnJheSBpcyBpbmNvcnJlY3QuDQo+Pj4+
Pj4gRG8gSSBtaXNzIGFueXRoaW5nPw0KPj4+Pj4NCj4+Pj4+IEkgdGhpbmsgdGhhdCdzIGxpa2Vs
eSBiZWNhdXNlIHlvdSBoYXZlbid0IG1vdmVkIHRoZSBpbnN0YW5jZSBvZg0KPj4+Pj4gVlBDSV9B
UlJBWSBpbiB0aGUgbGlua2VyIHNjcmlwdD8NCj4+Pj4gT2gsIHJpZ2h0LiBTb3JyeSwgSSBmb3Jn
b3QgdG8gbW92ZSBpdC4NCj4+Pj4gQWZ0ZXIgY2hhbmdpbmcgdGhpcywgaXQgd29ya3Mgbm93Lg0K
Pj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMNCj4+Pj4gaW5kZXggYmY5NTZiNmM1ZmMwLi5jODhmZDYyZjRmMGQgMTAw
NjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4+Pj4gKysrIGIveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUw0KPj4+PiBAQCAtMTM0LDYgKzEzNCw3IEBAIFNFQ1RJT05TDQo+Pj4+
ICAgICAgICAgQlVHRlJBTUVTDQo+Pj4+DQo+Pj4+ICAgICAgICAgKigucm9kYXRhKQ0KPj4+PiAr
ICAgICAgIFZQQ0lfQVJSQVkNCj4+Pj4gICAgICAgICAqKC5yb2RhdGEuKikNCj4+Pj4gICAgICAg
ICAqKC5kYXRhLnJlbC5ybykNCj4+Pj4gICAgICAgICAqKC5kYXRhLnJlbC5yby4qKQ0KPj4+PiBA
QCAtMTQ4LDcgKzE0OSw2IEBAIFNFQ1RJT05TDQo+Pj4+ICAgICAgICAgKigubm90ZS5nbnUuYnVp
bGQtaWQpDQo+Pj4+ICAgICAgICAgX19ub3RlX2dudV9idWlsZF9pZF9lbmQgPSAuOw0KPj4+PiAg
I2VuZGlmDQo+Pj4+IC0gICAgICAgVlBDSV9BUlJBWQ0KPj4+PiAgICB9IFBIRFIodGV4dCkNCj4+
Pg0KPj4+IEZXSVcsIEkgd291bGQgcHV0IGl0IGFoZWFkIG9mICooLnJvZGF0YSkuICBSZW1lbWJl
ciB0byBhbHNvIG1vZGlmeSB0aGUNCj4+PiBsaW5rZXIgc2NyaXB0IGZvciBhbGwgdGhlIG90aGVy
IGFyY2hlcywgbm90IGp1c3QgeDg2Lg0KPj4NCj4+IFdoZXRoZXIgYmVmb3JlICooLnJvZGF0YS4q
KSBvciBiZWZvcmUgKigucm9kYXRhKSwgdGhlcmUgc3RpbGwgaXMgdGhlIHdhcm5pbmcgIiBXYXJu
aW5nOiBzZXR0aW5nIGluY29ycmVjdCBzZWN0aW9uIGF0dHJpYnV0ZXMgZm9yIC5yb2RhdGEudnBj
aSAiDQo+PiBBbmQgdGhlIG9iamR1bXAgc2hvd3MgInJvZGF0YS52cGNpIiBoYXMgbm8gInJlYWRv
bmx5IiB3b3JkLg0KPiANCj4gRGlkIHlvdSBjaGVjayB3aGF0IGdjYyBlbWl0cz8gSXQgbWF5IGJl
IHJlcXVlc3RpbmcgImF3IiBpbnN0ZWFkIG9mIHRoZQ0KPiB3YW50ZWQgImEiIGluIHRoZSBzZWN0
aW9uIGF0dHJpYnV0ZXMuIFNpbmNlIHRoZXJlIGFyZSByZWxvY2F0aW9ucyBoZXJlLA0KPiAiLnJv
ZGF0YS4iIG1heSBub3QgYmUgdGhlIGNvcnJlY3QgcHJlZml4IHRvIHVzZTsgaXQgbWF5IGluc3Rl
YWQgbmVlZCB0bw0KPiBiZSAiLmRhdGEucmVsLnJvLiIuDQoNCldoYXQncyB5b3VyIG9waW5pb24g
YWJvdXQgY2hhbmdpbmcgdG8gIi5kYXRhLnJlbC5yby52cGNpIiA/DQoNCj4gDQo+IEphbg0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

