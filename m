Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66724B44704
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110778.1459824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGHB-0001MC-BJ; Thu, 04 Sep 2025 20:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110778.1459824; Thu, 04 Sep 2025 20:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGHB-0001KW-8J; Thu, 04 Sep 2025 20:09:45 +0000
Received: by outflank-mailman (input) for mailman id 1110778;
 Thu, 04 Sep 2025 20:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqEE=3P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uuGH9-0001KQ-S1
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:09:43 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17803460-89cb-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:09:41 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA1PR03MB11060.eurprd03.prod.outlook.com (2603:10a6:102:4fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 20:09:39 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 20:09:39 +0000
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
X-Inumbo-ID: 17803460-89cb-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5Yfpl9ELsIxrMzm2p6cYPlBVZIOF42BaiEu0NRW/2pSbRAdjz5D9gzPVRxmT+29y8obWrek+4yUKgPPJahD8uRmS9xJmcRBrf3Xnwcy9ua5Kpbi8zaBnJvbdYX0gtoR9SnUaR8ZWBIOQr3fT0DfULz3LoeHoSjjVTBIgtrWx9dG8Z2MTKKoXlU4ZnHLrZuSLYbixIDDhoKAoI+mTKWp3GPNQJvct5L0TkfFASlJB073CsDRBtni0cSpBl7j2qs65Suyh9YjYZzigZGOuvA2CyRsWPxgt/E3uAYvsPx9EBLgA90Ie1mt8JHEg5Uc4Zw3OMXbADsk4yncWM38VwX3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbFw219gsz36VnFihYJZeueH79SxPMDz6q8rd9b98w8=;
 b=oo+PxVaXdowC8mvhLtMCPlpWvlM6YRk/GZwvDAB7dKgkBb0qiHxS2HaPVG0emtmCXJmDtjfuIqYK7DRlwMpPEq2Pkfz+RqQiXx5kGTMTCDb8iy3JUzpQYxhDB9vTv9z4sZvVnbdTp7XxoMb+61xuqnXtoB/rAUlCoIbagdkozTfpbOCBUzXREbHDg9uQvYZeq7U2aWHvwvdsjwUWUa627VqwoO/h/bd5VBSL+8isoSCOkfYvt7FILDUCeFEWenROpImL/6T7oKhKMz7uUEuQbcDibFoi9QPtW7howNnzHNEo+mWXdDAHlyZRPW68qAbJdacUqmn4Utbbkagi4c7aIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbFw219gsz36VnFihYJZeueH79SxPMDz6q8rd9b98w8=;
 b=sfefW1d6A3OsFwr6veYFJfqVIBHLNx0waq/P0m6UGaJkWu8KNyyTQIXACRQ1WM62N67fDp9c0vlXXGLHEI0d5tKL8MrW3L5ZFn7xLQNHBZRt+ohaAePEY2v2l7fHEQwmostadmK7Vs/Cw7ylILIQhSoSFUQk61Z5MBICO+NoNGfP/SEh5en0Lk9ntUUjpqasA7E/cwQWwME1C/YV9Hb+sGbO9zDdr1QDudtAMYZwcFglME2+/upis4GFrpOBx2OpsTIGrzN5PmBwbi2Eykzc4oKk6oWTmVVKePYFT1+QVicIZlliPkb/8BAF2ag/9SPmJztbzSaFltX0QJ4C2rnLyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2cdcd8a6-0f14-4a4e-ac56-f0c33763ad53@epam.com>
Date: Thu, 4 Sep 2025 23:09:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: split set_domain_type() between
 arm64/arm32
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-2-grygorii_strashko@epam.com>
 <87bjo13976.fsf@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <87bjo13976.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA1PR03MB11060:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c9a591-63f3-45b3-3c74-08ddebeefa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGIyM3VzUm41eG9GOVVLL3NxNDhuT1F5QzV6cGxicE1taFl0NzhyY1Q5U3VS?=
 =?utf-8?B?eExWREVTSWNJL2NEb1VKT0t2UlBvYWdJNWFiOGtNOWtuejJrM2JSOE1kTDRX?=
 =?utf-8?B?bHB2OCtaK2wyVFNrakM4NWs2VU14NFNJY0h0emhaSG1LUWQ5M0FlT2drdEcv?=
 =?utf-8?B?QWV6c0ZQNDRrdzhWS0pSb1hvdmV1b2srYStnNTB0TXYrYnJTQnR6NXN6N2x4?=
 =?utf-8?B?S1ZLOURyY2MvR0JWQjYrSndvRGFxOWl6a0RkelIvSTNaSDZOSFZzR1BFejJ4?=
 =?utf-8?B?bStwTDJRZUdNdU45a1lvY0poUU1OaTVRSjEwTE5MMzVsekhIblBQNFpwT1ZM?=
 =?utf-8?B?d2dHTDlmbG9PZ3pScHJjVzFQbUFHV2JidklXMjAzZHYzb1dta2NBemMvNjRK?=
 =?utf-8?B?S2NOSzdGR2JHUloxUFBpWW9VUFVYd0pVT2I2TExBSVJzZllIU1M2VUxEZFdi?=
 =?utf-8?B?bGxWWVdvZm9UV0M0SERaZ2k5a2JFNjRhRG5lUmlpeDRLVzJlUUJ3cFhxVDl5?=
 =?utf-8?B?WU9WeVVUdjlLdHFLNXlTeXFCTW1lWVhoNCtabGhpdzNBNys1QVRPcVhLTGgz?=
 =?utf-8?B?SSthajRFT2NnVmJVT2xsQ2dLQytHNDV1eFpZWC96dS9CYklCTmV3VEJnVXJ3?=
 =?utf-8?B?YXh2TENsblBXV2VnZ0hURmRqZk5aVWE3SzlMODNQV1VQenVlMEtORFRRaUlz?=
 =?utf-8?B?STNVSlA2azNCcGlTV1RRUWpwcWhDY3ZsdWFkUjgxQ1ZnVHZXWk5RTUtJbWEx?=
 =?utf-8?B?LzRiMlc4aDZHNUxqWnpOSThXSnoxK1lpZ1NkVGJzMDZKbFNRbXBxTGZVdXc5?=
 =?utf-8?B?blNHRCs3Y3AwMEhnaWdzT2pBdG9LdUMzYzJkN25iaVRucUZFZnJhbFNGaUlk?=
 =?utf-8?B?VWNHTldJUjZTUWZNcDdNejlYU1BHWWpncUpQUVdRYkg0Z1hkdjVwMFNOaFVI?=
 =?utf-8?B?L1FMaEZIb0s2cjZlNnkwLzNSRTBUZk81eUxFZDc4Y3d2aTdZNmwzZUhGVmEx?=
 =?utf-8?B?Q3BjNU8vK0pCYlV0UmhMdHlFeXVKZjI3cmRHYkx4a0VBTS9KLzgvbUx6NFV5?=
 =?utf-8?B?dTJ4elBZbG83NWZheTFTV1hveGJhcHR6eGhMdjlDN2RVQ29TcEo2UjExNWNF?=
 =?utf-8?B?cHhyVFdzY3JiQmVKc09TeElxRElTVFR1eHhuRXp1ZVRGR1ZHd3FQb0UzR2tQ?=
 =?utf-8?B?T2l4ZlM5RjJvd0M2emtSeTIyVjAvNW9TL3VEeVZWQ3JmaUNnb2NycGJ3Vjl0?=
 =?utf-8?B?SzYvMDkvSU8wQmpDQSthTmt4Q2NuY2xlUUhTWVk2R0wvRUc5YmZBTlVrVURu?=
 =?utf-8?B?NmNzMXVxMC9nemJmWEE5dDBFRVIyOXVmbUd0WjI5R3hhVlkwZFIxbDNMV2Nk?=
 =?utf-8?B?Q3U2SlMvR002QTFoNEYzcHo2NFZEU0MzZGk2KzhXUmxHelppUVBzc0N4L1gv?=
 =?utf-8?B?ci9nTXE0eWZxQmxFeWFQNjFQS0FmeUQ5anBJaHRhV1o4cnhSSUFIcFlSV3ZD?=
 =?utf-8?B?NEV3YmtOSkw4ZmRGRFJqMmNQNmovT2p1enVKczdzQmNoWjhVNUhEQVJxUFVx?=
 =?utf-8?B?dGN3QWpERHJZQUZZMXdKeXBlMkNRejl5ZVVGMkF0M1hhMzMwakdRYTR2Tjlv?=
 =?utf-8?B?NEZ0c3I5Z1hEVTJsK1ZPTHEySzlFd1grQk1BQmsxZG9NRGdURXFlZEQxZ3h6?=
 =?utf-8?B?TE4wMlB6S2JQenhrRUZPRHorQ1VKOTczcEh5Q05KTUc1R0xURlZxU04rSEp1?=
 =?utf-8?B?OXFTaUo0R1Y4dHN5YUlPMHYzeDRBMS9BS1dsNHM0VnZYZ1ZBeC9ESE9zV1U5?=
 =?utf-8?B?aVp4WERxOEgzYTJnVldqcjZ6TTlIL1ZnL2xVL2ZhbTI4dSsvZGFrL0F2V2Vu?=
 =?utf-8?B?eHJiNzlFUmJXeDV2blJ1RzFHSGNPdlFCQ0ZBdFhYMmpySVRJeWRveUJWbFdJ?=
 =?utf-8?Q?2cbECcH/3Ck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUV0Wk5pZzZPU0l6QmdLeXcrbzBKWVpReHNxZEN5RGovUXZacW5aOVpYZmo5?=
 =?utf-8?B?RVlqbFRtQ0h5R2I1Nm5jakJkUlJvY0M5L3lpK3BQeVRWVlRCelNFbEl2YnM4?=
 =?utf-8?B?eWtOUXMzVFRWMTAzWk9BS2puQVVaOWM2b1Z1VEs0emJUZVpLanBXNVRJVlQ3?=
 =?utf-8?B?L0F6Z05qU0RpV0RKa3gvSzNtNnhoVnd6LzUyK1pCYjNwamhLellmcmRKTWtx?=
 =?utf-8?B?L2lHOEdza0JHdTJObERsZkY3MTUyZmE0YnJpaGhQRWJCaUxSUjdrOUM2N2hV?=
 =?utf-8?B?UFRhMmNOdGJDTE55cUdKWkU1aUlMV25nSHFRYTNlRnAxaUtRV1FuRU0za3RH?=
 =?utf-8?B?NVpkTmh5SG5KaVRJMnV6MklmcDRjUmVYdlI1a0Nva3o4TER1RHNrZnFNK1No?=
 =?utf-8?B?STZPN3BqK2tzMTZCUllQaDQ0L3hTa1lmSllTYlFNQWJrWW91aUQ3MTdSTS9B?=
 =?utf-8?B?YkFIdjdqZnBZOHhiK1d3ampSOWJzdFY5YkNNMm5MTXZuUmtNZ1RNRWNPOGdh?=
 =?utf-8?B?bnlEcUdLK00vOGFka2wxcm9DL3FKK3I2SDVhL1FDU21vYjJZTDBkQmU1VFln?=
 =?utf-8?B?TTVwU05Db3VnZzlPVzBlZ2dOZjN4K0Y2UXVzWHczS1o1Z0M1WFBPZFNKclox?=
 =?utf-8?B?dlRYWU5nNGpEMGRmM0xObUN0dUp3WHltTjVpT0ZNYUtnaFl4K2NuRTBUUzhm?=
 =?utf-8?B?V01aeVlCZXNudk4vamZxNXBXcVJKNkVLaUYyNElqV1dUUlg1eFVBVlNISW5G?=
 =?utf-8?B?cyt6QVkzNklxWm1UQzgyOTY4VFEwcXpISEQzSkI3dm9LNUxVMzkwYk9ZbEpp?=
 =?utf-8?B?UVlUVzhyejc1Wlh6UWcvUW5wNDZPN3VNOEdURndRUkVPSDdZRDNXQkZmOThL?=
 =?utf-8?B?Nk5YWGVPQXpNMVlrUlI5M2NhbUxObE5SWEhFWEpzT2I5dkJrVDk4c09JTy9S?=
 =?utf-8?B?czhyWHJsTkxiUDdQem84QzVEcExBcFlaeVg3QVJhLzF6djRlZEFIbzd5WlZO?=
 =?utf-8?B?WG9Ld3VaeVBOR3RBSDlJVTVnR2xNS3NvdWtBc0hyUURWYnZCZnVWdU9id045?=
 =?utf-8?B?Sm1zSk9PWkFVS0ljbmFGZlBvMG1ackJsSnFqV2JFRzdHVjFJWVF1VkpKU2c2?=
 =?utf-8?B?UFk1bThxb2xzdDhyTHhXZFFsUy9EVU05cXpPeWNNa1Rpa0dIVHQ3WmtNN0kw?=
 =?utf-8?B?bnRadWZhMFJqaDNRNGhFZ00rcUdTSHZ1UjRZOW1rNWlubGpHQXp3RHZiTHB6?=
 =?utf-8?B?MHg5b1QrUlBBemJqZXZZMlJmYkpQSUU3SUhhZVdBQVlVSVF1WFRnUEh3U2o0?=
 =?utf-8?B?WHhzcXZlang0MDVUUCs5K0VUS1Y0UlBIQlllcDVwQXRoTGF6ekt2UHFUUG4y?=
 =?utf-8?B?S2lDSTArbUo4WXJBc3RYbkp3RzVtNlhtTENxQXB1Ulc0YXVnMjdpZk4zNGhm?=
 =?utf-8?B?K3VzVUJrNTJLQzYvUjdWU3FEeW00ZGZqbG8xeWlrSDB3cThEMUlEd1ZOWkpj?=
 =?utf-8?B?UjZSQ0RNZjYrUUhyTnlKUGVyN2U1eU5LczhZMlRRWjNpZFpYd3doZ3AxUlZq?=
 =?utf-8?B?TStPL0c3Z01yZWJ1MVZaay9wWjRZMlJZdEJVZXh6Z1VMZlViT01Sb1d2NDlJ?=
 =?utf-8?B?UFZ2ZkprY2VRWGM0V0V6VUEycy8vOEQ3WEkxdGprUXZGbWR2MEJYaTJzWVRH?=
 =?utf-8?B?ZXd4ZzI3WllvSVVkRUF3R2RVakVIYkU4UEEzNTMyWjJNbFN2ZXZqN0FMTDlt?=
 =?utf-8?B?NTUyRWpackpEVjN4OUFjN0s3cEt0Nk4xS3E1VFBIcDdxU3JlRUp1UXRlZzlP?=
 =?utf-8?B?dyt2WTFjc1ZJVjVuRU91VUN2T2hMcjNibDBRUUpqc0xtcUlnV3FNQUdpWXNQ?=
 =?utf-8?B?ZmVIYU5ZbkR6QzVNSjd6SUxwamVuVDk1N25UUUFGSjMxN01mSWZJWTZWREs3?=
 =?utf-8?B?cU1pd1k1VWsrd2JhT3pGWTFvSWd1ZGtMY1pxSmVCdWpuaUxqSlJYREgyNFJH?=
 =?utf-8?B?RFhiZTVjY1IweHR5YzZMRHVhZTRNZkIxdXdDejZKR3dQV0R1WHBhOWdzT3li?=
 =?utf-8?B?ZlNSWEdza0k1dGxBc09YbERETWc2N2REbzJxUnZOS21qZGMzSzJtdE5jRmk3?=
 =?utf-8?B?ZWtwbmFDeE1IdE42b1kwa2xvQVRDcXZWUGE5UlBZbWh5a3BjM1lrRUxIOWIr?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c9a591-63f3-45b3-3c74-08ddebeefa63
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:09:39.3975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRwqQ98QWb4UcU8xNsUjXnc6Lise2DF4Io4jr9yaVuITH/L9Vxgc8bM6m6ylw7zBGlnqu1GOQw54XI21D+SrLtXXJ8gxmziAgHUx5RdhM1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11060



On 27.08.25 03:22, Volodymyr Babchuk wrote:
> Hi,
> 
> Grygorii Strashko <grygorii_strashko@epam.com> writes:
> 
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Split set_domain_type() between Arm64/Arm32 sub-arches as
>> set_domain_type() implementation is going to be extended for Arm64.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> v2:
>> - no changes, rebase
>>
>>   xen/arch/arm/arm32/Makefile       |  1 +
>>   xen/arch/arm/arm32/domain-build.c | 22 ++++++++++++++++++++++
>>   xen/arch/arm/arm64/Makefile       |  1 +
>>   xen/arch/arm/arm64/domain-build.c | 24 ++++++++++++++++++++++++
>>   xen/arch/arm/dom0less-build.c     | 14 --------------
>>   xen/include/xen/dom0less-build.h  |  8 ++++++++
>>   6 files changed, 56 insertions(+), 14 deletions(-)
>>   create mode 100644 xen/arch/arm/arm32/domain-build.c
>>   create mode 100644 xen/arch/arm/arm64/domain-build.c
> 
> Is it really worth to create two more source files just for one
> function? Maybe it is better to use already existing
> xen/arch/arm/arm*/domain.c ?

It seems a common approach used for splitting ARM subarch code.
code from arch/arm/A.c goes in
  -> arch/arm/arm32/A.c
  -> arch/arm/arm64/A.c
(just "-" is used vs "_")

This approach also simplifies any further code split (there ~250 CONFIG_ARM_64/32 ifdefs).

One additional thing, I probably missed, is that "x-build.c" should be placeholder for "__init" code only and
so added as "domain-build.init.o" in Makefile.

> 
>>
>> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
>> index 531168f58a0a..0fd3f5272361 100644
>> --- a/xen/arch/arm/arm32/Makefile
>> +++ b/xen/arch/arm/arm32/Makefile
>> @@ -6,6 +6,7 @@ obj-y += cache.o
>>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>>   obj-y += domctl.o
>>   obj-y += domain.o
>> +obj-y += domain-build.o
>>   obj-y += entry.o
>>   obj-y += head.o
>>   obj-y += insn.o
>> diff --git a/xen/arch/arm/arm32/domain-build.c b/xen/arch/arm/arm32/domain-build.c
>> new file mode 100644
>> index 000000000000..e34261e4a2ad
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/domain-build.c
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/domain.h>
>> +
>> +#ifdef CONFIG_DOM0LESS_BOOT
>> +void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>> +{
>> +    /* Nothing to do */
>> +}
>> +#endif
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
>> index 6491c5350b2e..3272fe7e4ca2 100644
>> --- a/xen/arch/arm/arm64/Makefile
>> +++ b/xen/arch/arm/arm64/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
>>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>>   obj-y += domctl.o
>>   obj-y += domain.o
>> +obj-y += domain-build.o
>>   obj-y += entry.o
>>   obj-y += head.o
>>   obj-y += insn.o
>> diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-build.c
>> new file mode 100644
>> index 000000000000..3a89ee46b8c6
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/domain-build.c
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/domain.h>
>> +
>> +#ifdef CONFIG_DOM0LESS_BOOT
>> +/* TODO: make arch.type generic ? */
>> +void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>> +{
>> +    /* type must be set before allocate memory */
>> +    d->arch.type = kinfo->arch.type;
>> +}
>> +#endif
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index c8d07213e247..58f77628df1f 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -236,20 +236,6 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
>>       return 0;
>>   }
>>   
>> -/* TODO: make arch.type generic ? */
>> -#ifdef CONFIG_ARM_64
>> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>> -{
>> -    /* type must be set before allocate memory */
>> -    d->arch.type = kinfo->arch.type;
>> -}
>> -#else
>> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>> -{
>> -    /* Nothing to do */
>> -}
>> -#endif
>> -
>>   int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
>>                         const struct dt_device_node *node)
>>   {
>> diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
>> index 408859e3255a..3e81d8ba3a47 100644
>> --- a/xen/include/xen/dom0less-build.h
>> +++ b/xen/include/xen/dom0less-build.h
>> @@ -57,6 +57,14 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
>>   int make_intc_domU_node(struct kernel_info *kinfo);
>>   int make_arch_nodes(struct kernel_info *kinfo);
>>   
>> +/*
>> + * Set domain type from struct kernel_info which defines guest Execution
>> + * State 32-bit/64-bit (for Arm AArch32/AArch64).
>> + * The domain type must be set before allocate_memory.
>> + *
>> + * @d: pointer to the domain structure.
>> + * @kinfo: pointer to the kinfo structure.
>> + */
>>   void set_domain_type(struct domain *d, struct kernel_info *kinfo);
>>   
>>   int init_intc_phandle(struct kernel_info *kinfo, const char *name,
> 

-- 
Best regards,
-grygorii


