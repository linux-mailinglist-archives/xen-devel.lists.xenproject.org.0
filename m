Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHL1Hq8Wd2k1cAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:24:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA46084D36
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213337.1523827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGxJ-0007df-3V; Mon, 26 Jan 2026 07:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213337.1523827; Mon, 26 Jan 2026 07:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGxJ-0007c4-04; Mon, 26 Jan 2026 07:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1213337;
 Mon, 26 Jan 2026 07:24:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0MJ=77=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vkGxI-0007by-FJ
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 07:24:12 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 005e274b-fa88-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 08:24:09 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB7257.namprd12.prod.outlook.com (2603:10b6:510:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 07:24:03 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 07:24:03 +0000
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
X-Inumbo-ID: 005e274b-fa88-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8FTgbiCsQ/ySrqUyMbzkN3ujd/klgx4lZbZycLBSvSLmK1GnrzsvJ87KXB0aqhVQgF1/aPvfmZrRernYbW6m6fq07nT8IAmoG8kkxVALsVphjeAqpTQdue3I4d/wM25/6XUAc8mdO3sLRoamUvXB3SEbQGXi4lqniQvKmEj4WgZLXJAXPiYgPm8/vj2oEMIHnkuraPg+QCgtlN1taH/SUWyQ1T0hzWVbZ2jwcEEnM1P3RokTGqvdoJRO8AcAX/Uo1lWvjELWwD+69gNMKy9p+G25h8I7QKtUsot1Y7gkYvvHRaEHBc9OgvssfmUudwn/G2uQY8/n0Pz/UVi6o0hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M864oLTCS+GwUIlCTlKALeCfrneBHjM+6rKe1v7Z7O4=;
 b=gpBJF7w0N0FNvXGR/S8X8efGPvfTGXXPjSiKntxImDqA37uJIG0cn4g7iSSw+cPU4r35iOo+v4e6keHlz+woPNOnQwuV8rsrSGhIUPABZQ5g6MaDTKOgauejUC+pOHuDw1J0ROIPQ9CnccidjktCMRqkoeB8qGM5CZDhPW3LQ7IRS7gyu8R1DcBZ2pOpXO1SgYDXr/qJvrd+SYtsup5u16FDVjmy+mcHoc5hPQ1DagG34XWK6GVHF8puK/sn/hjjIz+R7Tnw+Fq+ZrbDGFB+Nnd42LXxVDwirzL745D1lY4v+qVVgM4yRn4JPQUgNeCkJpcqh2+SsCDEzDlhFTcQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M864oLTCS+GwUIlCTlKALeCfrneBHjM+6rKe1v7Z7O4=;
 b=oVe6Y+/tgmBuJ/Qb7xqaxOJHjorLyzDQmTHH+Cv2kAqKVIHtJdEEbAns2qQI2Fhyf5xpEyoKZgDwHdEnP+RpeKvkNjt0ahX3tA1Kd+w9LJ09YFxDFvMkI+vYcOZc+UTHZEMyJWaXgGLMpZFrmO09Ax0y6HKmE0RDTCX2iOUetsk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH 5/5] cpufreq/amd-cppc: move pxfreq_mhz into driver data
Thread-Topic: [PATCH 5/5] cpufreq/amd-cppc: move pxfreq_mhz into driver data
Thread-Index: AQHci4Oip3RJ/Oi400aA3juf0wC21rVkEXpA
Date: Mon, 26 Jan 2026 07:24:03 +0000
Message-ID:
 <DM4PR12MB84515030E4302EF00385EFF9E193A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <715604a8-265b-4832-8001-1a2dbdc870bb@suse.com>
In-Reply-To: <715604a8-265b-4832-8001-1a2dbdc870bb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-26T07:21:15.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB7257:EE_
x-ms-office365-filtering-correlation-id: 3228fb88-6c2b-48dc-58bd-08de5cabe1ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NlE3NDE0WnUvSTJoZ0ZjVEhTbEs5TEFkNFQ1RUYzcHBSRTBYNU9JaGs4K3Iy?=
 =?utf-8?B?bTN1QW4zbDFFdXJNaE0zdGZNVWNwTzdOL0JEanBqcmxPSWNCakd0Q0NDZ2pL?=
 =?utf-8?B?VWRnNEFyWlZlMURPSVV6ampqT2ZueTVwNGdjRjVnWWhNYWp5S2hRZU1YMnJZ?=
 =?utf-8?B?dS9xdUdZalkyQUVpa2Voa3g1eENqWWt5Z0ZXTWJpVHJiTFlhTit1K0M4S3ow?=
 =?utf-8?B?MnAzRTMzWWV2dm0vTW9ZQkRZcnc0dURuWTMyeUZkN1ppQ2tiQi9MSVJUeHVD?=
 =?utf-8?B?N1hSOU5tWkhMZi96ZHNKNWovQy82VWtuNFp5SDRna0w3VEozVnA1STlKMEJ1?=
 =?utf-8?B?VmpPTTh6TmFEL1NHeFExZlUrdWpJaFhGMWpRdHo5M3BjdnYrWkYvTVkvZm1n?=
 =?utf-8?B?ZitsQldDb3VIb0pUWCtLMGM4VjdvdW9mMWRWblZoV2NKV0I4UjdNMjJzM2hY?=
 =?utf-8?B?c3VMUFVuak9LZmMvc1pGeFlnbXBVTWJ1bEVjRkQ1eDZjSFNZWTFINVZYaEUz?=
 =?utf-8?B?eDBlbnNEcGlKbm1QaTRkdGJadldrdENVVURYYzE2QW5LQm1iaC9LSjgyZzZq?=
 =?utf-8?B?cFVmaUlVTmJzcmJEQkhqRVZHNzA2TFJTdVJUb29RS0gxOUx3ZnZQaDJJaWgv?=
 =?utf-8?B?clBUWU5tcDJ0M095OVZGYmh6d3B1amhPUFNVeHJ4dzJRMEhRb1hwUHJzTXZn?=
 =?utf-8?B?dWh2bHdFNm9pTkc1RUJpTGRWbWJoeHRTWXRNMWRYdVpxKy9yYk9NRlFqcWVG?=
 =?utf-8?B?NXB6WWNaTXh6RmdmQ0oyTmprSkFTWlkwZzNXL2NDZUQzZUpaYlRmYTZ5Ky94?=
 =?utf-8?B?MGlyTFowWHFYR2tyVmZ6ak53Z3o0RXJvOEl1WXZsVWQ3cjd3d29DZ0U0azdo?=
 =?utf-8?B?aXZ0c1NFbWNERXU2UzBYSGd4Vzl0elNWVlB5WlBQY0g4OUE5R3Q1UXlmcEZK?=
 =?utf-8?B?OUwrTDJVNGZSUEQ0VmxNNUhCSkMvTGJ3SGd4WjQ3eW9QVjNaa1ZnbXhyN3Jh?=
 =?utf-8?B?VFdIYytTaktUZnFFUU94czZkY0dMNDlHSGNWQXlwUGIrMFpVWkY3QytZY1VN?=
 =?utf-8?B?OFZOdlFOZ1B6UVRWQjkrc0ZnR3cvSmFFMnVJWnVHOTVFbjAzS3BoRGNBQmpB?=
 =?utf-8?B?RnlGRm1KcFB1RjJsLzNZVzFtTWpka1owejlSNytDLzVka0dlMlRBazI5WTJX?=
 =?utf-8?B?cysrT0RmZ1JZN1ZzUUtCWXZPTHNMbmtMcFJZbzFVMENjVWxPSzdTWkluWWMy?=
 =?utf-8?B?NktUNFFtUlJCeUpPUURzRUJCTWpWOCt6VWVndFlQbGlBem5YMVF5enZQWHZI?=
 =?utf-8?B?UFl0S25BTzNpQUx3KzRJWWNGcnE1WXNlNUEvQnBwWUl3UXBtWUQ5VmtPcGNp?=
 =?utf-8?B?OGpIZS9mdkY3Q0JHSldlN040NDA1Nis1Y2ZoaFhtR1c1aUl3MTlIMzR6SWpX?=
 =?utf-8?B?U3p3cElvZndKQzZmWHhDZUZhQitHdURCV21pN2pwb2RlQ1BsYmZOcnNaQ1RP?=
 =?utf-8?B?V2hOdm1naG11SnJ1SGpRU3ZKb3B4d1l2TTh2NWNleUMrWjlYb0lXOENRQ2Iy?=
 =?utf-8?B?azhrYmFmMnc0TW5wOGFkS05vcHpheHFuZnRYQ045UWRFZmgzZEFyYkx1azlp?=
 =?utf-8?B?S0twV1IzMUJTYUNjZFlzaXFiaGFHU1VOOXlQYk40a1Q0eEsxUWdvNmU5Rmd2?=
 =?utf-8?B?ZG9RU0MzQ2ZvcTNjR3JONEs1QjJWSnZPTjhnT09tS1lsZFFtcVk1Y2wralZl?=
 =?utf-8?B?emE5clBxSjk5QWhacldSRHM2b3p1N2JjZ1pIdThPbHJ0MG1vVC9zaE1iTGxY?=
 =?utf-8?B?YVE0bEh2cHBIYXpnWkdqQkVKR2FEY25Oa3hqeC9vNGdtdUdIKyt2QXo5N0ht?=
 =?utf-8?B?dWxhNDY1SHAxeFM1dGx4Rm9qUEFlNzBacit6TlV5V29rVmw5T2ZJNHVKbUtz?=
 =?utf-8?B?d1NkWWIrR1p3eFBibXpkQVBZTWJudjBqaDhKZ0xqZjJ4aXl6eCtieHdsdnE3?=
 =?utf-8?B?cVFManFXUytoODBxek5vZnRYS0ljS2ZrMExTbE9WdXRCYTJlbnRzKzhMdTRr?=
 =?utf-8?B?eHdJVi9aVGV4VjRCTGdPWC9wSlpZWE1vQzJlUFJJUHM4NlIzMG1Jdm5qT2hC?=
 =?utf-8?B?RVVtVjJTdGFIK3JWZ1k3bjU1ZXZBaDVKVkt3R3RyQW53cVY4QXlHT2tYTDdV?=
 =?utf-8?Q?6fY7li5sxDOGbHjiUySIGr4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFEwOEhTdm1GL1RXM0VRdjIrNlVTa2JDU0M5ZjNUVlBlVzVGbzhBdlBXaWNt?=
 =?utf-8?B?T3I4ejd1dVk3MVVCMTQ0Z2pzZzVHTWQvSHZkOTJ4U3ZpRVRsUloxTnl0NmlM?=
 =?utf-8?B?aHJucnlnYkRUdDJOY2dtak9nbE1FOFZhNnNTWFdTYmdJckJIM2RDUGJrVmRt?=
 =?utf-8?B?eXIydTFnYktOaVNiZ0MyZm84dnFlUmplaUxJajNkMERrTitpU0c0K3dmQlY1?=
 =?utf-8?B?enpEZkNSOXhra3IydVpVTHBVK2lUSURVRjBKdjZqeXNheEdtaTI4SkxsUkNk?=
 =?utf-8?B?S1M4ZXhCZThjMjhDM25xWU5FbXAydUwxL1N5SGRmUkE4QmEvZUVRMXVsYXNK?=
 =?utf-8?B?dytmWFZLREdjcUt4SkxCbFRJbkV3eGcya2FuelJhYzlSYVl2MzVVYy8wcm8v?=
 =?utf-8?B?d0pPOVROZnplZThYTTNhek15RUtlRUZDMTFmdlpUUWhnc0xaR0hUQUlmaGlW?=
 =?utf-8?B?Q1ZQVGFMVUZFMmNidTFyZDZ4R05GcGhCYTBQbW5xcFhBNG1XZHFzQUlYRThq?=
 =?utf-8?B?aWdOZ3ZYek5FOXI1c0Q3K21LRDlaZ2NLdzJVQ0RLZFpEUzkwZTY3UFVXRDhv?=
 =?utf-8?B?UlRjc0YyZXZnYlExY2xLalFFWXBEaTQ0eElJd1NFK3lXU3ZtdS9malFBT0dO?=
 =?utf-8?B?OWFaRksyR0NVYjFHaGVIMEVpWTliU0lFUEVEZWk1ZmpVUXlaY2xzdjdyRzV1?=
 =?utf-8?B?anFGSStmaUZxanBReXk2Vitsb2w0VEU3a2ZEYXNFZm1HcFp5bkhNamtnbEpC?=
 =?utf-8?B?QWpDcldGV29WNjRpa0ozRllaR3pYSXVYNy9UUHA0MjhzRTJHbjR2V2hta0RO?=
 =?utf-8?B?UUVOWERtK1Qxc3F5bm5MVFVMWEZldnp3VCtjc0lDTjl3VG93azVUS1luVDRC?=
 =?utf-8?B?MkZ3c1c4Uzdab0hHaEZvMGt0NmRZRlB0RnJDaDJ4cEF6TkNaY2NUdlFja2FE?=
 =?utf-8?B?U2tnTTR1Q0JES1g3UlFuVVExS1VsblQxQzJ4M0hUMnIwS2tBankyRE9UKzdO?=
 =?utf-8?B?VVVZQ2JHQTVqaXMxTXpOOGo2Y0RNbklFNmRwU3ZGdEMwTzE4STUvcnR1d2hZ?=
 =?utf-8?B?bXJZL0tsYmpuSzlWZHFaL29mUENIRVVuNmlWeVExWmZzek1qUExBcnJLZ2c4?=
 =?utf-8?B?K0dYUUU0OHBmd3k4QXdaNEtzRWxUTjhLazhTcHRLcXBkV3pIYjdaZ1ZYQ25Z?=
 =?utf-8?B?WklTa2ZOTGhKS05WWlgwL0JJTmREZDRoOVFjYUc0ZnJPMzZTVDZuYzlld1E3?=
 =?utf-8?B?TXNFQ3VMV0gxM0FzYmVLWmJFSXRzSEtyY0lVMTJzZUdjWWRXdDJLM1hUT2dj?=
 =?utf-8?B?K0RpN0ZPRkw5c01HTDNVYXUwNkFPZVNHa1AxejBwU3dBeHJTS0QrVVZxNlc1?=
 =?utf-8?B?OE5pK2pBUjhOUVBnY1lRZmFtT2Y3QmFwaGpLRXVZYThOZStKTlhmeEdwakRq?=
 =?utf-8?B?eXd3T29oY3JuTXRKTHFUbXVpOXdaeUtsRHRTaXU1ZGpvbTJEYVdRMG5NWW0r?=
 =?utf-8?B?N0dIQXlpNkU1QVpoR0dHajR6WlNOUGs0V3RMRFBMZUlKMUc0ZGdNeDVVOFhI?=
 =?utf-8?B?V2tMZ1hzdHlWWk9QNnBBOFdYVmJ6ZTVnRVE4clFMYzhtTFhlOU91N2RUT3Av?=
 =?utf-8?B?TWJOMEpLdTMySVRmM3h1SGEwOFhCcWNLaEd1NEYrWEptUmN5ditKejl5WEpq?=
 =?utf-8?B?RGZ3VDRtSjdER0xKSHB1K2pGd0NNaDR0bXU5R0tpeFZ5aTRmK1hSWnEyTkdi?=
 =?utf-8?B?QTNDWFhRQURkNUJLUmU3SENhMlBURDhjUmx4bjhVdHcvYXdOTFlDbTUrakEw?=
 =?utf-8?B?UDlrMVFwUjljdUtxWkxhZE5Hd3k3RFY5Q2xBUEp2N0xKR2dVdTkzTjJIb3d6?=
 =?utf-8?B?dmZGdDhqditCRmRMcGFjRUovb2N3cTdKYTQxRXJkR2VEcEcra2NsSjhheDdQ?=
 =?utf-8?B?TGlXS3lLMjUrM2FqdGthM1JucWVUWmhEQ3NJcW9SWkN3cUNHcmNjQ21nblJB?=
 =?utf-8?B?Q1Q1bzBHVWVnT3lxTldCV2thTjlZZlZuU0NXdXhzUHBLcklkSHVzRmdudGNC?=
 =?utf-8?B?SURmeWt6ZHRzV1NDbEdFWjArWVhvdTN4dTB2TDNPU09manBidlMxU0U3WWwv?=
 =?utf-8?B?djlQMXNCQ0ZPZnpZZ0ExbzEvSTh4VVVCdm5iYkx1SERsMHN0dkhLUXRsbTBs?=
 =?utf-8?B?dUhzZ2VxKzJsbG1xZ3lMaUlJNURkQTFxVWg5YUl3S1htanpGUE1TeEFwVEll?=
 =?utf-8?B?N294REt0T1Y4OHFPSVlvZ2dIZWoxY3VUbW0yZ0dhWUwxeTYyeXFVcy8rY2pU?=
 =?utf-8?Q?9Ji5/mWaaej2BJxkXr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3228fb88-6c2b-48dc-58bd-08de5cabe1ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 07:24:03.2147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0umq4MJ9ZEouN7TVjUc/KPCsUG6ERxDwSh+ZYMJrY1CH3ta0EBCFNIIIwfA8P3QQVhf9p+O5gKHVOauROXglw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DM4PR12MB8451.namprd12.prod.outlook.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:email,suse.com:email,citrix.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CA46084D36
X-Rspamd-Action: no action

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDIyLCAy
MDI2IDU6NDQgUE0NCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
w6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0Bh
bWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNS81XSBjcHVmcmVxL2FtZC1jcHBjOiBtb3ZlIHB4
ZnJlcV9taHogaW50byBkcml2ZXIgZGF0YQ0KPg0KPiBObyByZWFzb24gZm9yIGl0IHRvIGJlIGEg
c2VwYXJhdGUgcGVyLUNQVSBpdGVtOyBpdCdzIGNvbm5lY3RlZCB0byBhIHN0cnVjdA0KPiBjcHVm
cmVxX3BvbGljeSBpbnN0YW5jZSBqdXN0IGxpa2Ugb3RoZXIgZHJpdmVyIGRhdGEuDQo+DQo+IFRo
aXMgYWxzbyBlbGltaW5hdGVzIHRoZSBjb25jZXJuIG92ZXIgYW1kX2NwcGNfY3B1ZnJlcV9jcHVf
aW5pdCgpIGJlaW5nIGNhbGxlZCBmb3INCj4gYWxsIENQVXMsIG9yIGEgQ1BVIGdvaW5nIG9mZmxp
bmUgdGhhdCdzIHJlY29yZGVkIGluIHBvbGljeS0+Y3B1ICh3aGljaCB3b3VsZCByZXN1bHQNCj4g
aW4gYWNjZXNzZXMgb2YgcGVyLUNQVSBkYXRhIG9mIG9mZmxpbmUgQ1BVcykuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4NCg0KUmV2aWV3ZWQt
Ynk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KDQpMYXRlciwgSSdsbCByZWJh
c2UgeW91ciBjb21taXRzIGFuZCB0ZXN0IHRoZW0gYWxsIG9uIG15IGJvYXJkIGxvY2FsbHksIGFu
ZCBjb21wbGVtZW50IHRoZSBUZXN0ZWQtYnk6LiBTaW5jZSBJIGd1ZXN0IHVwc3RyZWFtIGRvZXNu
J3QgaGF2ZSBib2FyZHMgd2l0aCBhbWQtY3BwYyBlbmFibGVkIGluIEJJT1MNCg0KTWFueSB0aGFu
a3MsDQpQZW5ueSBaaGVuZw0K

