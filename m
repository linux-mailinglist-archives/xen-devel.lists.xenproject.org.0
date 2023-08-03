Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA576EC20
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576416.902535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ6r-000553-Ly; Thu, 03 Aug 2023 14:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576416.902535; Thu, 03 Aug 2023 14:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ6r-00052q-JB; Thu, 03 Aug 2023 14:15:25 +0000
Received: by outflank-mailman (input) for mailman id 576416;
 Thu, 03 Aug 2023 14:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRZ6q-00052g-J1
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:15:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f317f22-3208-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 16:15:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7977.eurprd04.prod.outlook.com (2603:10a6:10:1ed::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 3 Aug
 2023 14:15:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:15:21 +0000
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
X-Inumbo-ID: 2f317f22-3208-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYlbFVuVqu4CUqRNH4M/OO/m8/CyOQ3+xBmCk5+DVAC8W3U1U/HVoXc6UuugRdZQfScu62pv0gy56vsOOiSrztUnBrO8jZRXkfpq+UEEJOsxABCLwcU0plM8H7k+pPvSB/5NRUjCtG4KyZGiuQr/WEK0gVMZQSYTAUpi765RfgdFIab7S6iXhNfux9lJGDHmmGU7JaDPbsjhe7EQVd4XxUOmgR5pMy9LomANFWcQQhz82sbt88ICA0SscvpNygkrGT3ymBMfERSu88KDHIxMX0oJYx5bkzf8q2NaQX5jt0NgOP9DSE2jeZMHSM5SMBJgLt8MJGu2VTRDzggV3sgKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW0Q7b7mAbaCsN9ic44XlYuE60szaE3+3cpssf/B9Jw=;
 b=QTzN53d7Le6uhlStV/QGQCSzuAJU3cAjqTYctgC1IdCRJvoIKDQJDn0wC6VRY3tt4h7sVvhjaC7j+ht0KBCmbLG401/gbbkl1L3hUjnoZLcwfbs5wzGauVuWQLUi33YdixWkIhdnRjSNEUtEDoo9HzfwmZNZZe+wZcaMWNWrPiHUQrWY1PT/lY+ghPKwhrxqzTuSblz43nKskAl0n6zpsB9wab4yfcr1TZanbj1SKw1mm46KvnS8Y9Dd2j2vfykwo4t6vk3n3B/ONgsbt8NZ9ldMMF2Jj0In1VKfcaAYxLjg4gUlTOix0GgFFh02TYHoPh/ro/3KK0wBBKgaCXQ7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW0Q7b7mAbaCsN9ic44XlYuE60szaE3+3cpssf/B9Jw=;
 b=aICgwONFGMdantSZIeV5fBJDuPRAEavYjrmCVm0Syc93dawV/nJhliYZol/tfV8FkhsI1w88OzaazycSt06UVHnDzUVorDT/f0mV0QCiAEdMNChCgbwFQTRAZbVK4ARwyHHb1U+W16zSKGDidEpqMtaVxZAelkuDH5YfcENCohqYtFOqRDFFNqAFUIyPOtLlwF2zgMlHIoLxlToxm8gh9scvjZx8foIsk1WJho0YGjuQK/StWGyNxdMLLrug/G9Kv+s4CDPtWVSrU6ggU8tFp1Pusb97cOC5/hTgf3du7XAhMIgxpnngiyzaN4rM5YETwvY7MU4N4W8YL1Y0ElH2hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <550a2b3d-ed15-6035-623d-8725edb40b2d@suse.com>
Date: Thu, 3 Aug 2023 16:15:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH 2/2] libxl: allow building with old gcc again
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <226f087d-34b1-1a27-4048-f9c6ce3d2d76@suse.com>
In-Reply-To: <226f087d-34b1-1a27-4048-f9c6ce3d2d76@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: dccf5f94-90d6-4614-da5d-08db942c126f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b53N3KypiyzVIIKvaO3W/pOoLO1+hezA1tgpkg56YQZkgxEXJOfVCAq3tOEAHjiobOM2W2iN3bYj3dxtxe85+agKDbXiXjgaOynXzaDDrer/iv91F52DJjBVcgr7kc9D4pN3OxrYlZRZIrV5CrbVb8fqVKEnNkYpCdNo4yakZ8WM7Uiz6W4dirWaLFX0UPW1aOF8wSLZ0fls0tzT7EQ+BgD7Tc6B7MOscGJhy1OI/iPnf21IQqaSBkWc5LZTdnhQjc7ZCGpZXwmfhhFCNMnhY0mJEqBRgbZr/TngfX8JzfFHke+IxGgI/7gTjkfU0gF0Zoau0DvaGFrvdIskQFNhVD6+2m49dR/TXESC0+19DN6daWWkxrgtgmKw+gPz5JZ+D0iCgwqeyrkmTmyTSRqUyNEimPXQ92p4RwAlmvmZzDDX/NdQSVv/d+olWFUduRJRPFYjs44mZr+jZA7e6dkMTMi81MERX5NxOSNnKPA/nHtlQoaINOK2DO4zt9Rw63Y9opUV0LrfTJtVnllJb2qI9NAtfJmGbh65+N5ZzkwO+wI2CqDvsKvMvrq7v6k6+JTxBdCQ+0hNtkWJhA13e4s2BGpE1DJ8Rr2DdFpH3/GdDmh3LHiM6aVigEkYk9nmUwL4D82e8McdFy/NCcc9yqvCHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(54906003)(6506007)(107886003)(26005)(478600001)(2616005)(6486002)(36756003)(4326008)(66946007)(186003)(38100700002)(316002)(6916009)(66556008)(41300700001)(66476007)(86362001)(31686004)(6512007)(31696002)(5660300002)(8676002)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlZNTENoL0UzMmdQMlhqOFNGTklsYTR6T2xLdTJNTlZFOFpJS2ZBa3hPYkJH?=
 =?utf-8?B?QnF1WEVIUGRMVVU2bEUxU3FBbjYwR2hSS1VlOHo1NzI0RXlKcjBtS0d1cEEr?=
 =?utf-8?B?OXl5emRObWxHWUZDVWpOZ3IwWE5mRDZDSzhwSmNBTnhUNFNYYk9nOHA0Z3J4?=
 =?utf-8?B?Q1BFTWJ4TnJ6bVRaYzR0dUEzelhnMnYzNm14S3lTUkQybVQ0THpnbXBuRWRJ?=
 =?utf-8?B?ODRUc1hFREN4ODlpd20zNEtwRmlsbWdnckhSYjJzckwzQzBZQTBrM2h6bHNY?=
 =?utf-8?B?V0YwU2tRTWVjdG9RQllHSmMxcC9oRk9QSDJmOGlWUGFONm04Ny9penBIeTNG?=
 =?utf-8?B?ZmF4K0RzNkQxTkhXSmxWeGFOc3E5SXlvNzlmQTZhUkFOY29ZZXQyb2tXQmwv?=
 =?utf-8?B?d0EyYkV3SHlaUERxOXVhUmlTSGREQUxtL051WlVhaTJMUzUzL0loOHdnNmls?=
 =?utf-8?B?UXhTSHFaWEVhOWZkZzBwZ2hpOGhyQzJnMkZOTEI5NlcyQnNaTWw2UXVVa3dX?=
 =?utf-8?B?TUtUaVl2aGxkWTZQR0pEQVhLdXhORDFxSFdPcDRyWHFVVGgwZEhCR2ZJWVRZ?=
 =?utf-8?B?MHhRZlcvZ3ZacXRJcDJNTjFzcmRGQWV0bGI4RHgxeGZYZEx6L2d6RFcxeFRt?=
 =?utf-8?B?c1RSVE1rNWJQWE0yMDhjdHN1eEkzV0ZWZnNiRDRYVEkydEp3L2J3L05BeXI3?=
 =?utf-8?B?N2QrZld6M1dPYmgrcCtKeDEvc2hCT3Y5RFNONm9nZzBhMy9DRzhMN0FjRXhG?=
 =?utf-8?B?SkJxdCtRYWRNVE5vNlROeHN0VlBqMHNndm5YVmJYWkhMTUpTdndIdDgwL2pn?=
 =?utf-8?B?VlZ4eUNjOVZydlU0TG9rTWlVZVlydExnZUtsd1c5TW5hWFlaeFJLNFdVOW8r?=
 =?utf-8?B?emJhY3oxckdtQVpYbFFidWxlTm5ncU13THF3Mkg1a0JueGhMbUNRVmxoOGp4?=
 =?utf-8?B?US96cEJTcjQvVnZ5TDhnVW5qdkxBNU9rSW9HMzNRbERPODdRRVRCa3VwNGNS?=
 =?utf-8?B?VWlDNmtMa0pJengvUFVGRjhNbEphU1JPSG5JZjZEN3hKS1R0YitZM1Z1S1ZK?=
 =?utf-8?B?RWVMWWNSRzd6cEZCelp2K2NWa1k1K1k0K2JaY1FlNG05UDNhMkFueUpra3RW?=
 =?utf-8?B?MGc1VFBzZW5hd0R4d09PbnVZY2FIM1R2MnBHK2JCSXBvOUl5WTBDMWZIUGlx?=
 =?utf-8?B?T3BWLzVsYkY5SEp1Z1pVeWVhRmZxdllEMFNobFBqZ214czVXRk90a2JYdCtG?=
 =?utf-8?B?VzVrVXFhODQrb09pVVV5ZHRHOWRRSEErMkJCaTgySUNsbE5tWVhpMXUzeGZJ?=
 =?utf-8?B?SC9FbzFsM1hzM05NTnNYV1dwdUEya1hpeXcwZDB0alRTMXVSaHI0cmVWZk5U?=
 =?utf-8?B?TGdRSVpVamVIMHZiTzgyUWh2eVNHKytHSEwxSUwxS0w0azg2cnA0T1BRL2FQ?=
 =?utf-8?B?VjFNcWtmM2dPMTkwM28rMHl1eFFVd1AzSkFnQnRkSlpsSnRkYjg4WjA5U0kw?=
 =?utf-8?B?RG14OGZ2cGwxYllUdEV3R0VxdGllcStMU0ZTak9DUGh1NDVrNHFkSHJ5dUF3?=
 =?utf-8?B?M01CZ0Q2WExBaWxhaStFWkVmdzk3ckd6aFE3SkFXaGtDL2p2RjFRWWRMRXVa?=
 =?utf-8?B?Z25JUkhiVXB2TzdMcGJhaldWbVE4VDBnMW1mV1NCKzBObWFYRU1pa0VaNjUz?=
 =?utf-8?B?UjRYbzNKVGgxYmFLWEY0eEJIeWxQMGRjWEtVdms5Zk12NDNLS25JNTJ0TVN6?=
 =?utf-8?B?SVp5N2d4c2FsSW0vOThaVTJrNEc2M0hUdUpBRmcyV3FvN012b2RoS1YwUWVw?=
 =?utf-8?B?Y21yRlNtSzZHdVhCNUZwczhmMlQ4WXpNaHhUTk0zbDVqRWlGeU9LdDZXMUJG?=
 =?utf-8?B?QVQ4NUg5SGlBYlJvczVaNXVSK3QvNUY5SHJsckg5S2xSVHVDSktKTUt5cEFz?=
 =?utf-8?B?VGh3d3RnZE5obFgzMlRPbE01VXE4ZTNaQ2REcWRkczJqYlNtMmN6T3YyY0c5?=
 =?utf-8?B?ZDZ5UUJYN2kwTEllM08zeGU1TlUvVTZvK080SURHQW1zWHJycWVlcHFucFpm?=
 =?utf-8?B?TVVEb0wrSFNXS1I5Nm9EZE9pNTl4bUprMU1OYkxMekdDYXZDZ1VUNDZVRkNI?=
 =?utf-8?Q?+oy5LzuqBG1jV9xrOI86K29he?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dccf5f94-90d6-4614-da5d-08db942c126f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:15:21.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EV+FjhvzJJUKVVvV8Lpra1Qe0K03d7BqNc7GINrr2iwshgW7czoNxyDasuOo6w9gm+tBQMvcp3mvE3U4hPiw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7977

We can't use initializers of unnamed struct/union members just yet.

Fixes: d638fe233cb3 ("libxl: use the cpuid feature names from cpufeatureset.h")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -316,12 +316,16 @@ int libxl_cpuid_parse_config(libxl_cpuid
                 uint32_t index;
                 unsigned int reg;
             } msr;
-        };
+        } u;
     } feature_to_policy[] = {
 #define CPUID_ENTRY(l, s, r) \
-    { .type = FEAT_CPUID, .cpuid.leaf = l, .cpuid.subleaf = s, .cpuid.reg = r }
+    { .type = FEAT_CPUID, \
+      .u = { .cpuid.leaf = l, .cpuid.subleaf = s, .cpuid.reg = r } \
+    }
 #define MSR_ENTRY(i, r) \
-    { .type = FEAT_MSR, .msr.index = i, .msr.reg = r }
+    { .type = FEAT_MSR, \
+      .u = { .msr.index = i, .msr.reg = r } \
+    }
         CPUID_ENTRY(0x00000001, NA, CPUID_REG_EDX),
         CPUID_ENTRY(0x00000001, NA, CPUID_REG_ECX),
         CPUID_ENTRY(0x80000001, NA, CPUID_REG_EDX),
@@ -380,9 +384,9 @@ int libxl_cpuid_parse_config(libxl_cpuid
         struct cpuid_flags f;
 
         f.name = feat->name;
-        f.leaf = feature_to_policy[feat->bit / 32].cpuid.leaf;
-        f.subleaf = feature_to_policy[feat->bit / 32].cpuid.subleaf;
-        f.reg = feature_to_policy[feat->bit / 32].cpuid.reg;
+        f.leaf = feature_to_policy[feat->bit / 32].u.cpuid.leaf;
+        f.subleaf = feature_to_policy[feat->bit / 32].u.cpuid.subleaf;
+        f.reg = feature_to_policy[feat->bit / 32].u.cpuid.reg;
         f.bit = feat->bit % 32;
         f.length = 1;
 
@@ -393,10 +397,10 @@ int libxl_cpuid_parse_config(libxl_cpuid
     {
         unsigned int bit = feat->bit % 32;
 
-        if (feature_to_policy[feat->bit / 32].msr.reg == CPUID_REG_EDX)
+        if (feature_to_policy[feat->bit / 32].u.msr.reg == CPUID_REG_EDX)
             bit += 32;
 
-        return msr_add(policy, feature_to_policy[feat->bit / 32].msr.index,
+        return msr_add(policy, feature_to_policy[feat->bit / 32].u.msr.index,
                        bit, val);
     }
     }


