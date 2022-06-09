Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589454488B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344854.570462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFCH-0008Km-I0; Thu, 09 Jun 2022 10:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344854.570462; Thu, 09 Jun 2022 10:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFCH-0008HM-F2; Thu, 09 Jun 2022 10:15:25 +0000
Received: by outflank-mailman (input) for mailman id 344854;
 Thu, 09 Jun 2022 10:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFCG-0008HG-4z
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:15:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12b43717-e7dd-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:15:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:15:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:15:21 +0000
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
X-Inumbo-ID: 12b43717-e7dd-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj1+9VgKZzatEAZUG2hpNPtIrU6+7H55pXFR+QOjQdhlqzHLhvpnBhOoJNYp5NlJUKLOS46grH66lKbx8i8UhAxZjpkkfPni6YvqafPIDuvnAV6F1TFdTbwO523IX5Ru/A53rUmhQ71CtKrZ9GMw8nTQv0G5sW3chZAYHlsHXpatXN+AYHj0ZeuOKl0AqiSYcUJzfe/yZb2zWwkoI5M630vuQZi65IFS09mOvK/SmFSZn68w1m3vmg+LBIa89t9MhpkltLzTIaaRHLhNDtz7Vjd3jJ5Ir7OG79GW6Ma4MYdW9e3RRpSBPVpbdRcVa1A6QpVLGEbFQXp2MsUWtLtQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYUfvm+7aTTtLSn0S7sSWO7MQyed7qAyha2WFJFBcm8=;
 b=mg6u0DV7Mic0Xw5RyeEPZKlDQzYaOlsJJV4oBJtc8lwS94Lh3PUyf6fY9p29WTHgceny5b7RKUQxYN9atnc45ndEaOLv1/YNyWT1zdJjqAhGMAkvziMv3a/LSNMHLxzdaQb8Y6mYm9m7yCowM3nR/o8bMs69JrvjTTotWkF+dV2M87qkYH/59EhW1n6hym7tG8V3Tklkw1ARlL2PCQz3T7i+ScABau+J6BUw74TeHMMhWx5kstpK1nTzGPiD9yOupzzjbEg6d38TPDnWPJVqlsPix4djlhpq2vU3i5sOWLfYQSBX6yvuP3IZsakpJ66aKdRfkyiNehkbzpw39SeIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYUfvm+7aTTtLSn0S7sSWO7MQyed7qAyha2WFJFBcm8=;
 b=eUzWg3gwTT+UVKye0ZMfTDPulfgquIOj3XQmaTrAxUPuyC5/eKAuWEpmffW1L9cf2nGvAwIQ/+dsRjEULuVq5q1kdwvlM4xQYRQCDskr/L+j1xDWC9I3U1OqUWDaAee1TqSttbo+hHZXZrB7e+l8IrgoM28pHZq1pakJlON1iYysKwju7QvGRn8085/Z4P8IZ3yr0Iz1EeDAaTm2w5i8uG7U0z8qs3S51ztyUe1yGFWa1irSGnxSgWfPkeHd6XeCTzjkg9XKljB7ZKAQFDTfyS8JMkRYBPJaDLs19Sar05F6gpyNrUg1jhpaX5BJhkwaJl2kHWPWwryb+ZAcsCEYyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Date: Thu, 9 Jun 2022 12:15:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 00/12] IOMMU: superpage support when not sharing pagetables
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0150.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9106dbe-291d-425d-0643-08da4a00f61c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5608B9BFD105C146B38EA27AB3A79@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	avEdKG5Ha2/xg/At0p2X/SjlAYYKz7rF6bM19kC25yXjbWJKiJ1/9ct6vdT/IV9jaqxgb7aiVc9niqQ9JULAgyNIAE0CAPuQKYQ5lCuSagheYU0TRH2w5nAxgE7Y14lxyLka5q6SBGldCtHj7d4ClcyUP+OSdU4EHpwk90X2wi46YaK7cwJt7dtbCkkGD3G3XJd7Yc1bnZ5lCS9vE/hvy5GHwBecrbgUl03uL4bkMvxSHcMqaUcmYUHab4bsTdnry7pba66mWZAJanl1bbzw3Qx/zA1MAmAo5IzttMRnVPUEm5+U6gbslHyBJ8HmQvogclvkgHHcWy6ChWYjhyYsaWZazDQe4hWJQzttvrz1gDlwaTCwMQ9UxS/3R9kp019lNKMIpp+6fY0dblKVVvIbVDU59b1OmUK9hU5NuQqIiAGpM+XbVHG2iM5wdayeBaNPOamt2S1UXB1WzCnOKyMp4tLXrJkzfDMFvwFVAo5i4Y8iFwjQjZRW99PJSwlLSZeHGVU+PQKLhn8Zx9S8zgNowcL6P2nqRFvSldFNyfAuw1/zVuW3GrD8afSxoV9hn1rZJlZvqFHh1LyG/WvvzqyrvRwWaVWE7VDHdM/U1Y8ev3FKX4exylZbalNgyUJ1JUBzYhF5NYpGcqNZHdICiiR+BR7tsaAZAM5PUqOZJpEuqibaUeVoy+OP/rhu8Rb5dfMEV9IFPc+ynYIs7DVrLXI3kxwYAKlWvFNGy4zoHCgdbExJvF8tpUt3J9rqoBnnSldDyRXvbMDHyIFzOehOcqLkAcCI/e3HhZI9z+TYO473+LVFu2b1LJrEr49o0B8t7qFBE6p/gImWUScz4F7TdjCoJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(36756003)(5660300002)(31686004)(4326008)(8676002)(66476007)(8936002)(66946007)(54906003)(316002)(6916009)(38100700002)(86362001)(966005)(6486002)(6512007)(26005)(6506007)(2616005)(31696002)(508600001)(186003)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukl4bzRCeUhSRWlZNXRFb0lLRUdzcm1QdTNGT2xIdDdkYjJ5S1JzK0t1T2Vx?=
 =?utf-8?B?RGRlMGR4Q01oMzVWQWY2bHcwZ2U1MzlNbUUxMU03QzBkTVp4eEZoNGpSUjhF?=
 =?utf-8?B?UWdESUlLc1A1RTJrV0MyTDBqTlJRWWc2MEhhN3cweWZ5U2lqOGpKbmVJbWlo?=
 =?utf-8?B?MmErM3ZCdGFqQjNMbjY0ZWYyQWdya1VhYWFGdHBjNDBkZzEwSnNZTDdHMHBO?=
 =?utf-8?B?dDVzUHR5SjdwZlhzd3N6bGg5c1R3c3lRankvQ015MkpwY1RPYUZNUVNpak1C?=
 =?utf-8?B?dkt2aXhnZnQrY3FMUjRpV1BDVDk4azczVFcyOW1tNlpENzEvNWo4UXpSRXVM?=
 =?utf-8?B?VEkrNnhxU0V1RDRvd043VkxmOHhDdWRjeHE5RTF0NmVhN3g4Y2dITG1QUjhr?=
 =?utf-8?B?TTg0UFJ5OGpvb1NOYmhJZjRZYWdTMGJESmF6MW1ZNUFsc0V3RE5HSjF4Z2x5?=
 =?utf-8?B?YU96dFdQcG5YVlk1TnIrY3hoenU2dWh6Vm9Ca3VCdmoxMlJhTXIzZkhLMTBz?=
 =?utf-8?B?ZE1WRjNRVWdvejB0QllHbFkwUFM2Z2tSMkp1OTI5UTgyYWZQa2dNMjhpOXNn?=
 =?utf-8?B?T2hpK1NUUFZkMGFaUk1sZk9ibVRpTzU5cjh5NTJjaXJYaS9XQUg2aXQ5REps?=
 =?utf-8?B?RmVnNGp4SHhJaitpZTYyaW04QXlaRXNwekdOUUxLSEtHSGhRenRIL0NkUnVI?=
 =?utf-8?B?MGg2bG9JUW55L3oxR2RSSEFzTW00UEF1d21EMTdtNzNVNE5OYnIyY21IeEVB?=
 =?utf-8?B?ZW9mQ25CMXBDWWUzMWtuT3VsUkxBTWVuaEhQMmZNQkhiR0taeERlVUpHMFk4?=
 =?utf-8?B?YlY3bjR5VXlUd0FPQ0pPamRoYjVBNlQwTGVESW84MWNvT2srMEZxaU9IcW1t?=
 =?utf-8?B?RUNFZ3lmU011OE1vR1N1Y0tuWmYrMEJnTmQrTWFVL0dMUmpneFJSaGZTOWJW?=
 =?utf-8?B?NlcvYmZqRGNUOVdyNVVNVGp5QUM3RDBSZFNoTVkxWVRyU1FpT3hOS3g1TGpD?=
 =?utf-8?B?VUlmakRGeVNkK2tuOWhKN0ZHbTFXZjRMSytKaS9jUEZWaVNWU3R1WllhWkZV?=
 =?utf-8?B?ZVZ0WlYxMlpQYkE4MndDcThUTUNreG9STkE2TWpHc3haVkUyeVp4djNqdHBI?=
 =?utf-8?B?RU9JN2FqR2kxU2RUYXFkcll6VGhZOUNTb3IzZWJUZ3J1QjM3bUl6cUxJREJI?=
 =?utf-8?B?MHRzM0R3L094ZEpnQzRyMFNKaTUzdDdSK0Mva1B5Q3FGSjVXQVBUcklJNkh0?=
 =?utf-8?B?MVFCSm85SmI4UEUvRSthREpxa2pHMyt3bnVoNVovd1ArYzRWR3NENk9pN1ZH?=
 =?utf-8?B?ZjNuTUdqZ0JUb1ozSnZxUFcydWZMbDZzL2doVnFXYzZrenpQREx6bWhmVlh4?=
 =?utf-8?B?WmFCMVdPWFhQTGhuVTJvc3o0ZXgrbUZBazdlU2lTYklWdzN4YThLZmRrKzY4?=
 =?utf-8?B?SDRueFdiVVV0YVZ6VnNYdWYrQU9iRHc4Vyt5amx5TVZTRmcrdDJPdUd2L1lu?=
 =?utf-8?B?eE1hMTdONW91NEh4dG1qNFp1ZFU2enFNSG9DUU9vdnhlZVpmVnoxbmM2UTBO?=
 =?utf-8?B?V2hlSHpXU0hFRGdFRzljSmt6NG1GYmdmcWlsdWtKbThNcEhKM25qMFlUYWlp?=
 =?utf-8?B?OXUxQVMrWXV2b0RxSHJIdkZkeXJBY09vdWc5ZWdqWjhaMlI5SzhyYmZHWXhW?=
 =?utf-8?B?TVRIQ2RLWGkrVjFYaElTVDBjRDd6MHlIUUdleVV2WmxNMDdIbElCL01PQ0hY?=
 =?utf-8?B?ZlV0dzB0RExKQmRvKzZaZHVJYWtPR1VFanE3T0RzY3FlSTNKWHFhRTRwQ3dw?=
 =?utf-8?B?TzN0NjRyNitpME1MUk5pY1JIWWkwUDhlSWFQUlY0ekQwQ3UyMlBOUWNrV0hD?=
 =?utf-8?B?T2dLWng5ZDlPOWZhV1ZRMXVHRlNWODcvR0VhZFVxbXZydUtkMmVRQUVVSldy?=
 =?utf-8?B?Q2FYUFFZcVFXaXhTQUNQdk5wbnB1QXdCVVJ6NVQ2djgvSnNQai9wNktFaXA3?=
 =?utf-8?B?eU9qdkdwZDAxd2F2b3pIL1dxWkEza3d0LzBYeGJMeWJ1ZUpVNm1Dc1hyYzV0?=
 =?utf-8?B?SDdSRFZxNHoxWWFLdkdNUnVqaE8xdEM5QWc4WWVGaTNicm9oUitEQnVneWJX?=
 =?utf-8?B?MUtETEdvSnYwUnNTZitTSU4xNUpYWjluM0lEdjJlcGJxTTZPbFZRODhlV0g2?=
 =?utf-8?B?WUloQnMvWVpweTJmaHg3VGVXTTdIWFgxTWM2YVR4aEJHV01Lc0JEMVFnOEVw?=
 =?utf-8?B?S0lPK3ZudzJlZlFrNVhVT1JkVG9RQnlscDlsS1BTUzVRZU1ZeExqRmQ1SkYx?=
 =?utf-8?B?c3JTQnlFV1lhaS93bzA4eVU2VWRZZ2djZzZiUUVFVFY4MFZiMHpQUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9106dbe-291d-425d-0643-08da4a00f61c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:15:21.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+ULaibvoEAKvKKDB8lI94SCu6kWTy8kGDTDZxh9XesMVUT/tJbfEt6sJqRcKSpO/prSavWIefYrbvUGduBqxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608

For a long time we've been rather inefficient with IOMMU page table
management when not sharing page tables, i.e. in particular for PV (and
further specifically also for PV Dom0) and AMD (where nowadays we never
share page tables). While up to about 3.5 years ago AMD code had logic
to un-shatter page mappings, that logic was ripped out for being buggy
(XSA-275 plus follow-on).

This series enables use of large pages in AMD and Intel (VT-d) code;
Arm is presently not in need of any enabling as pagetables are always
shared there. It also augments PV Dom0 creation with suitable explicit
IOMMU mapping calls to facilitate use of large pages there. Depending
on the amount of memory handed to Dom0 this improves booting time
(latency until Dom0 actually starts) quite a bit; subsequent shattering
of some of the large pages may of course consume some of the saved time.

Known fallout has been spelled out here:
https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html

I'm inclined to say "of course" there are also a few seemingly unrelated
changes included here, which I just came to consider necessary or at
least desirable (in part for having been in need of adjustment for a
long time) along the way.

See individual patches for details on the v6 changes.

01: IOMMU/x86: support freeing of pagetables
02: IOMMU/x86: new command line option to suppress use of superpage mappings
03: AMD/IOMMU: allow use of superpage mappings
04: VT-d: allow use of superpage mappings
05: x86: introduce helper for recording degree of contiguity in page tables
06: IOMMU/x86: prefill newly allocate page tables
07: AMD/IOMMU: free all-empty page tables
08: VT-d: free all-empty page tables
09: AMD/IOMMU: replace all-contiguous page tables by superpage mappings
10: VT-d: replace all-contiguous page tables by superpage mappings
11: IOMMU/x86: add perf counters for page table splitting / coalescing
12: VT-d: fold dma_pte_clear_one() into its only caller

While not directly related (except that making this mode work properly
here was a fair part of the overall work), at this occasion I'd also
like to renew my proposal to make "iommu=dom0-strict" the default going
forward. It already is not only the default, but the only possible mode
for PVH Dom0.

Jan

