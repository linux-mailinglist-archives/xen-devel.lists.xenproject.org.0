Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE2F665D26
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475373.737058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFban-0007pI-RI; Wed, 11 Jan 2023 13:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475373.737058; Wed, 11 Jan 2023 13:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFban-0007nY-OO; Wed, 11 Jan 2023 13:56:37 +0000
Received: by outflank-mailman (input) for mailman id 475373;
 Wed, 11 Jan 2023 13:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbam-0007nL-CY
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:56:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2079.outbound.protection.outlook.com [40.107.6.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1f28ee2-91b7-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:56:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9116.eurprd04.prod.outlook.com (2603:10a6:10:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:56:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:56:33 +0000
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
X-Inumbo-ID: c1f28ee2-91b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z953bz3nFFFaQ8kRRDXismk0G7je/7A7feBoknxMk94W9dqBDDOXX4mEzejOYUSw3B7Gm2NMmgpZukW2t5lpVPYGUkCSlCelD7rN6bMJjHwC0llDL8OBOh1OQnYWbEJYX3kTM82iRHqLLv27sjzLtwosLtL7qO688g9QjzxwGDIgHN+uqUP6cJqF8Dr9iDGYliahGOBv/59fat9luHaLFVVhkqBiClnw5Nk+OmtbAfPTLo32/WmnTN02h8x/k6NUmfa1zGvMXUY3G2Q/hwdd8zYVJQS6pWwR5dq9jDVtYOJRPC98z9xfdZWiXLrAP4BJZLkQ8h8PAmtbxeylI0Gqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOlBxwttZ7/+xseKnKOuiqz4kR/3+d88oza4XKWQx5c=;
 b=Q1F0GUfzbx8Z7UvU8AP+nNyj1rjYDxJ1ByQvE6awNcYfvdXADwXV1/RYwBNikqX8XWKMepjsSwsLiFqbPKOa+ulf5x5FLjtUjYC3gDHMSzCcmmAOSE1RwugoCnXY+pzcc1ekm1JZFeDYQMqHLCEgGaP2XheeW0HbSL0GfS4P7XmOzUVv6viabhuHXXtXQR+gW+8YmCLLB4lmW6lwGdLqxBrdopLfKRTW4DEonhELpNlONWyca/sU8ZJvHVkzUWjpWEK8GWQ8VCSNrg817ewABmRVY4ivcr6e2fI6JSgyqF+jT715XW8F/2sHT5eChtkneZu7tJXAUPi/qxbzW1D19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOlBxwttZ7/+xseKnKOuiqz4kR/3+d88oza4XKWQx5c=;
 b=zoh4veZ5PfqSLe389B4cbTUw2GjeL30lAIp39GgmDuMjqPaDGQwXQ3n6Mya3x+aZe8aKg2gEIrmsKi+DI0EFlcUwDuEotmelba3NFWnbj/DyGovZyCBm3aw4Bip+8VOsGS5vyaUNZxKyplNQmNKsUOnL16yVwDIhGcTY0+r+tFoRcHygdPQ3+qQ67U3XCKuPLElbHZODMf6PuVaZWVx0FuzLmLwP1fHQZXqg0sqHt4my+ptl4fs1vOzAzJpD937p/TexMbUCXPb7NQY76kZNRK/5l769OhKspd8VFjEoeUZkYmDd3RTaBuWLeBVPnFWlCLSdOomfw/VLhOmTbuxeIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4785b34b-2672-e3a8-8096-df1365b6b7b8@suse.com>
Date: Wed, 11 Jan 2023 14:56:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 7/9] x86/shadow: reduce effort of hash calculation
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fef956-0412-4031-5c15-08daf3dba5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5D8H1G5oecUJkQHviGT+zZZ6KmsDOeRgaOgDikazts7wgSrYXYRltyRh9cP9HxiWIYeayePzRP0CpZgDpExaPme0fTXXW1HpPT6LUJEiIuh7MlrmbRh64+QUeaDKZdeFUDAgBcRWVLK0IOmOajbGy0nbxleD84HcoVq24l0R8s8WhbrnU+QCNAJvYh6bUDWt9PH3wfXJBHklpmNTqSA9/ZRnnYAgaZgo3cWlQ92MzUuVoxqQ3gwsIan2omIxKU+8SycGAAtT/zJ1o4I8NqMZyfRgFcW6qN+3vMuLSvTh8c0Nl6Oj8UipEL4Yu8IR24id1bWMECkSdRBIZMg4JA+x8eOvIUWNDFwl36paZftkxmQryqtCVcRNHMmWLMz6ZNaBh/M2Pvcbw5iq7GBKidkhh/PZcR28PJXqwk5O42yeCdE2O7AG3N5qmdhbkBYMWLN8N/PewCioNlfPTIAlOoTBgwH/z/Ure7Plg8FcWj7uTx0M6RYuV8Tp3OvJ9JzR3QMX45SEfgVTN/k660eAvAjO1WlNrS20lJ6100fED/3se3k8ShIcbmA57eOdkoQpHX3h9oIUE7jJj/cMML4kGQmvLS7B3ULSQBkRpHSviY5EWPKXapIvvJf3vMP9Yn2FVK83mCUfhQJ7f1qFJK3RycR+Hz/0z3B6CGKFPhhIPpMfgG7+j+6kwMBo71I8afZOm5sVmo9DXmzDZlQq8PYg3Wtu57JY1P0Rn6t3ugCWc00aM0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(8676002)(66946007)(31686004)(41300700001)(2906002)(8936002)(5660300002)(36756003)(6916009)(66476007)(316002)(6512007)(66556008)(54906003)(478600001)(6486002)(6506007)(4326008)(26005)(186003)(2616005)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFdmek02TExYa2h4N2pEUXFNa25uTWJBV2xleFBQRHRjRWJNcjl1SmNrMkEr?=
 =?utf-8?B?T2NOanRSbWx3Q3BtL0hNK1VkVldnemJTYUphSzY3em1wOFl6Sit4MGxmWGN5?=
 =?utf-8?B?c2dRSnE1V0FZaVhNcUdhT2V1NVMvcWFKOThBdWFsTTZMRnh4QlZGTVVJQWRB?=
 =?utf-8?B?dGdPZVlNbFVGUWw3eGNoWTA0M2JuRy9PaDJGUWVUOXZnSWZMMThZbGc1MmVh?=
 =?utf-8?B?amh1WGZXVUc0TVcydzliZEhDUGFKVHR4SU4zK2pNTDRRTU51U1VkclNNVEha?=
 =?utf-8?B?QTFyYmNuMDUxUzA2b3FCNnV5OW9VaWpjOUVuWTJxcXZkOXliZ2JMQUJVSGhR?=
 =?utf-8?B?VnhnSGVwbUlUUWJMK28wcUhyczV0a2xRSTRwczFBTUVqelF4YnNEcUtadmFa?=
 =?utf-8?B?YTdIVXloK2dVOFMzbFdBSk5Xam04M3FSZGJJN1dKNDhuSmcwWDNHU1EzVmtl?=
 =?utf-8?B?d1BKbk5lMzRyb1pOSGFvam85Zjh0d3NuS1hGWkhEcnFVRjFmanlDRlNmbDVs?=
 =?utf-8?B?VmFScFcyWWJCTWRkVGVsUVp4SHQrcXg3cWFEaDhPblRCaFd2MStBdUNFZDJK?=
 =?utf-8?B?dzh0N1BLSm9sUHFYenUrdzBvQjIwbG5COHhFNUFPRDFrWm56WUszZjhZYVdN?=
 =?utf-8?B?cW5oakxRRnNvbXQyUHMvNTJheXNPaVgxQ0dlbmszelo5TUJHb0FnZ2g5MGlQ?=
 =?utf-8?B?WXZNTFpqaFNlMDhmV21iT0Q1V3hpeEN4ejJiUGpjQmYrMjZqYTRoTGRHUzNW?=
 =?utf-8?B?ZFNBYkg4Z055VFZVcGJSODJsNzZONVRDNGVrOHlwZmpKV1ZsR3BjU0tQcTZC?=
 =?utf-8?B?aGpHdTRRbkpWd1o1OG5BSFpuOVl4U25WRkM3enJjWUhpUTdJWjlyM1ZNVFll?=
 =?utf-8?B?d01HRy9iRG1UK1d5ZmVDZDFJTVBiQ1R0bCtDUDhVc1hEYTZmNWxqenpiUk4x?=
 =?utf-8?B?V0lRNE05N0s3aCtOMFdpM2IvcWloZHFObHFSa2xSMy9LWEpXRDhSa2JsbExl?=
 =?utf-8?B?SkxFM0ZUOU5RQVprL3RYNjhUNmYzY0IxSzMrWER6YitmYVl1alZ4SFIrRkNj?=
 =?utf-8?B?U1F3TEk5cG8vRUJPSDQvYUdOWi90Y3dzWE9WMWhXQ29jaDQ1ZnpUWFVhREJ1?=
 =?utf-8?B?dGdoaFV5aFJzVm9oUkFWcnhPSVhvenZWYWVoK2x6TGJYU1I1WW1FeFA4dVRP?=
 =?utf-8?B?Uk0vTG10NHdyblprTStCWk9ka1ZJVTF1WTFKVExsMTl6RzVkN3E5SnNJdStE?=
 =?utf-8?B?SXMxSkVwVVAwbUNrS2p5YlBWVXk1OHE0c29vTVUrYkQ2bTV6TmNSV2dndTNx?=
 =?utf-8?B?bEcyK3hRTjZYVDhRMU9GYzIwRVNUMGhVMkJXVzJRVzI5SW0vZ2JEVlFrRWJF?=
 =?utf-8?B?UlhzSkR1TUZNUnNvZGRSQUNDMWtOZGIyOEVocUJQcGdEV2JvWlhweHJsaUpB?=
 =?utf-8?B?YWhObVUvRjFaeTNuQkcxSjlCOWY5T0xRbi9hSGs5cC9zVWlpakVoYk82eFFO?=
 =?utf-8?B?eVpmTXNCdXE1OTROeW9QQVZEUmtqOVROdTIxeVEyckJXeFl0aE5MdksybGFU?=
 =?utf-8?B?MVRReGdXZlBYdVpRaFlMNTl4YkpXeTZ4U1RWdFc2OVo2R1luWDJyMGsxdXVh?=
 =?utf-8?B?dU51emdGMU1keUM1dHl0VksveitVNDRXcHlzUC9pNW5xNFhlRDhtNWNRZ0Nm?=
 =?utf-8?B?bHo3aElpZ29GVXJ0LzRwT1hXVFl6MktJY2NyQVlKbnVMZTlrNlFRWUtKaTdp?=
 =?utf-8?B?STNNeTNUditicGFkUkM4L2JDeDBKT0VKblduNUVGQWtURml6T1l3QzdSNkQr?=
 =?utf-8?B?ejU4bGNQU1BCRGNyRHQxTzRPdnJqTjdzYXhESmo5SHRyb1NmL251Sk95SU13?=
 =?utf-8?B?U3ZhbENpbFRXRlJUd1M5WGpaOG9sT3YzRWFzNitocjVqOWVzVERkcWs0NmpY?=
 =?utf-8?B?RkZxempXVlRzM0lNYlFSYTVSN0hGOW9rZVdodmVuK0pmN0hQMjhGY3JFc2Mv?=
 =?utf-8?B?ZlpNVTZxSTFuTUtTeHdEZU5NbWNYR0EwUTBUeXIzYWZlTjFmTXdIRFkrKzZj?=
 =?utf-8?B?cVFEamRab1VpOGN2K0NPdkZDZzZrSGlPU092NnRGc2EzdHNCTjFtR2dnS0J2?=
 =?utf-8?Q?pAkakPTD2PBzyj1aXfaRBETlv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fef956-0412-4031-5c15-08daf3dba5a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:56:32.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHszxTT8ffrBZ8Z8eMdO5NeCQq5truvEfqlaFWhfwO2foFKWTbPB/zn+tpAyS9Sk9fDjwYbs/fR/TedndyqQ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9116

The "n" input is a GFN/MFN value and hence bounded by the physical
address bits in use on a system. The hash quality won't improve by also
including the upper always-zero bits in the calculation. To keep things
as compile-time-constant as they were before, use PADDR_BITS (not
paddr_bits) for loop bounding. This reduces loop iterations from 8 to 5.

While there also drop the unnecessary conversion to an array of unsigned
char, moving the value off the stack altogether (at least with
optimization enabled).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was tempted to also change the type "i" (unsigned) right here, but
then thought this might be going too far ...
---
v2: Also eliminate the unsigned char * alias of "n".

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1397,10 +1397,13 @@ static unsigned int shadow_get_allocatio
 typedef u32 key_t;
 static inline key_t sh_hash(unsigned long n, unsigned int t)
 {
-    unsigned char *p = (unsigned char *)&n;
     key_t k = t;
     int i;
-    for ( i = 0; i < sizeof(n) ; i++ ) k = (u32)p[i] + (k<<6) + (k<<16) - k;
+
+    BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG + PAGE_SHIFT);
+    for ( i = 0; i < (PADDR_BITS - PAGE_SHIFT + 7) / 8; i++, n >>= 8 )
+        k = (uint8_t)n + (k << 6) + (k << 16) - k;
+
     return k % SHADOW_HASH_BUCKETS;
 }
 


