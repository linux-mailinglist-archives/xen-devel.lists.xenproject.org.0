Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69054C655
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349990.576222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QPb-0002RS-Sh; Wed, 15 Jun 2022 10:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349990.576222; Wed, 15 Jun 2022 10:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QPb-0002Ql-M6; Wed, 15 Jun 2022 10:38:11 +0000
Received: by outflank-mailman (input) for mailman id 349990;
 Wed, 15 Jun 2022 10:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QHf-0004ln-Jt
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:29:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad2e8e1-ec96-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:29:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:29:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:29:55 +0000
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
X-Inumbo-ID: 1ad2e8e1-ec96-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHem/YFsl4OXr3QZw1vdeNx/CBpoB6f7cuOEX3X031tcWhdCs9Y6uAjknYbzO+8BRJ6mFclSZSNnxoxxZh7HH7Gh/m4DKWvkaO8Sh6hKJzicEFy2Wj9E38ZWj7UvkTdpnxjlS+fNeTzFbhiOH3wzA7R24mkJ4JCzmswaZ8nEXTVgP+KYFRPl4xZz8cMvMfriNdRrKAPGVDi6EzQLlrhN1vDNwuomHPEMzn7fr6DpnLLbysAcmGjLMUgbcYCd97/P/ZKDlcJFrVmHB7H/rc9o48ZLjEzXy9gemIs4D0vu6sioZxOJab0gY7RRdlkSJibObfhNLrZzQV+ksRzugXi9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQbKjA8/usEOvga5i8HP0FnNQfY6bpT7pO+ZFMrlli4=;
 b=DXJZT59aV7Nmdnb7jE0oPiodRePh4q/pZnnF2UQAJ65SbeKHGdiYdshIAWZj/teghme053sOeAfDQ5W1iR6x5sd7jjyErk1OVhhX2cT5I3iZzezLlS0BpvUjMDbnSFrz2Pdq3UVDHOEQ5nWMJHwcTUi+fzxGTU2wUrzfcnUQXIVW7C+CA9zRPBerIvGkhJydd4S+1dZZpZipRyFG8nzSzz7gaTCT5/BTo4J3MNEVjilDugkFx0eEihyZoqHCx6TLtLMupc1LsWZbVTck9d3Pb7BpuqYleHgm1+mdhKrf/3SKgl5CSZOjbPKv3/g72yucE8D+NSUPEQweBdwkFT+jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQbKjA8/usEOvga5i8HP0FnNQfY6bpT7pO+ZFMrlli4=;
 b=Fa/6DLSWxc8V16DI+a4Aa8735JXTvh2lizXXwvVV+hUzUfzk9rEy5JQZa4lRLZghic8kugNDqcwdvQMLpdu1XjUJD+RYXunNqOmELIw8bYjrC3qADY4rAzgRLy13euLHLMcjR4OxCxcZu4FzB0dQP0/+TQRXAmE+wpI29gyX+XBLbKPl96WtybX5llpGNajPVnN3uGTjq8UqVsID4h4rGLd0jSAN2OyQySmMIH0NXw3j0O2t5PPzPZRaqVfOIKfSfv0a87fO1XfVvMZcIuEIyZgKh9VeYReKtOgFSntB80xuDDn5/h/U12OLrHJtEVzfnfMzlFOOmcKy33BDYZn58Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4054ce2-7645-e467-ad91-93868d493845@suse.com>
Date: Wed, 15 Jun 2022 12:29:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 07/11] x86emul: handle AVX512-FP16 complex multiplication
 insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0042.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7821c3d1-e5d0-4d70-2235-08da4eb9fd7a
X-MS-TrafficTypeDiagnostic: DB8PR04MB6876:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB68760683BBCA4C49A45A4823B3AD9@DB8PR04MB6876.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FbXnr4BOOLAY5sBSndTU2W5NIpHquBmXWqkZw7syhFgQxbFh7YPSHJtNPnecrCvce0uXdFCbDLxOBZqUVQ+Tj3x/L/Ikh+pNJBe50ZZLtGO2DhWu2vBunJTJfXVvjKw7VZRpRoZCSCQL2TNgfeh1g11nMt2N/4EdMBOBxDQS52dQfDHwpycgn0mDGRsfpgFGESNvgvlkAUrdoL8UPHJ1ceJWyDv7iqkhZZZe0hzIdh0EoVvtidG/3/9buDzi133pm+oHkKGlaSfhxVEyGzSzDnPr3t2k9GRQvjHqWnJdS4XktJq3apacASEqqyCeyABXUqMiLscFQrBBPE1gR7DcyiRf1F4Iwl5bqVZKnbv0NI6avrTfWm8mhzkcndPuanHNHaACPUwD3qRs8QTnxx+R9sgtP/+nx25ou7MvkkpCGDHKf2gkrohQltkTyiPJuXHS1KmxIDy6i5WjRiwPZ62WQSdMEb5iblBF4mOhJ1u0p+YUdowFZahR0Rov7tzCsPYAdzbG/rQARrFRpim0HnrcV9C+viF7gz5LE/71k3O5pk7BjPWqO765HdLVd6pewmjnZIXfrFJvYqxdoPEWkR3rPLSlkDan5ZZYFC4PyRsYVd3eWeke4HwBv2rpFAk6stjosgQgG0lDjwhhbXUK1PsU8uhAc/7O6TTNSyURb6qdPSrcKUKSwjtopKrB9cD9GomeINqW6PXkmsJ8JUbFGfdT1I/KFEDI/gGQrRg9ANuFW86L7VS2G4JZwFeX8u956ieR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6512007)(66556008)(26005)(54906003)(5660300002)(6506007)(316002)(186003)(2906002)(31686004)(36756003)(508600001)(6486002)(8936002)(66946007)(86362001)(4326008)(8676002)(6916009)(66476007)(38100700002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDlTYkFBMVlaR3p6YjVDWHRqci9GNEYrVEh2VGVzWU51RzN1WnlLemhQYkho?=
 =?utf-8?B?aGYrQWUrd0F1UGdJcE1XbHNCd2p2NkxmNnVneUhkSnZGbGtlSGxnZTgvZjN5?=
 =?utf-8?B?bmQyUU9kTDM3OTY1WklPa21WL0hqTlJmQjlLU2VlNUVMMmZvVDVMUThaUUxz?=
 =?utf-8?B?UGFhSFFSRkpPUFZNbWE2ZUc2YWhWSnFCT2o5UkJXdDBYcHFZWGMzenAyYVRK?=
 =?utf-8?B?b2JRQjNVQzJEMDduWGF5ZnpEK3FmT0t1amtvYW9hRTlXZ3F4WXozWXJ2MmxI?=
 =?utf-8?B?akdzVXREWVpUdTJSWTZ5MWw1NUR2M1c1dFA4Zkl2RjBVZmVhVDV6U3A3Vm5U?=
 =?utf-8?B?YjZib2Z0emxTcEVsRko4bFhxS3laSzRjL0VNV1BVc0dpbGp5TlpzU01wMlIr?=
 =?utf-8?B?WXNuVDN5UjVaN05nMmMvWndSbGx4SEhPWW9LWW1YS1ZlanIrYndiOHJqazVx?=
 =?utf-8?B?VW9zNmVuNEZMSGxKeGdSR0xldm80VDYyUk51dTZRNm05NExJT3M1aFJ3SnZK?=
 =?utf-8?B?R3g1ZGVOL2JiMFNhUG9zTkRCMitYNEc5ZEpVeGFDN1pPUVdMUHgxNGthZ1F5?=
 =?utf-8?B?V1prRklxMndQa2JzTWsyWFNNdUFGbW4zZDJnYTE3UEFwc2kxaWtPc05wTHZF?=
 =?utf-8?B?a0NjNjFrK1h3eDBxTWFiK1dzWjkvdW1wZlRZTWRIQXp4Q0F2WUt0Q05uTHNt?=
 =?utf-8?B?TjZja1lUS0Y4aThBMmZ3V2ZJOTBBSFJRZktjWjEvOW9PampxWHZudzd6YVFS?=
 =?utf-8?B?V0NzYXdLYUFId0xyVElPSjZWYU00cTFPNnlGYnhXNkZyNkp3WEJnVGdCOER0?=
 =?utf-8?B?U3Z2ZzQ5amJVbDdUNytVTW5kYXN6eGszV3dLbHZFWDJDQXIwcDFvODdlUCt4?=
 =?utf-8?B?S3pCRXFPaUZ2VzBkWW80cElWUGVXbHFvcys3TGwxWGk1UUVQd05HendmK1hh?=
 =?utf-8?B?S2g0MkJHd0xWQU5QTjNHY3ZvUWUzU24vK0I4dlFTREVEbUxCd1RrYW5lZ25W?=
 =?utf-8?B?VlA2dTNXSSttRWFuS1AzeHpTcEJYdlNvRzh6L1lwNmhuZGkxQXJBcUpQSGE0?=
 =?utf-8?B?TlpOZHJVemdjWTZjTERkT0VqcVFIbEYwUmZqMkppSThncjg3TXNJcS9xR3A2?=
 =?utf-8?B?UXhnaXNJM2MwOEFQTFhNV25nbnptdTluZE1tcERWVmxhaU1pYXZvczA1VjZD?=
 =?utf-8?B?K0VZanZRUVhVa1UxOEtoeWRWWm5lcDhxV3ZhSWZCYVM4SVRwKzJmL2VEZkFq?=
 =?utf-8?B?NUVadFNJQU1iUk9UNkF6YTRoTFhjOGFPY21Xbm5JRTdLSnprWUZZTjgrNTdT?=
 =?utf-8?B?ak1NZmpBeXBzR3lna2lpUmY4VWV0c0JGMTAxSGltTjlzQ1FsUmpGWWNGSS94?=
 =?utf-8?B?NTJLMllHN01DRmQ1bS9iU0crdXQ0bmpPcjJMMFo1Vi9ldktscFZZMVVYc2s3?=
 =?utf-8?B?NFBXd0RQUzU2LzJjMDhyeUd0cXppODNMeW4xandLK3Q0ZFBmL0VudVltOTlw?=
 =?utf-8?B?VUU0YVFLQXovMURRRHRCRi94REQvaTlHRkliQXlqdS9MRnEzQ2dkWHEwYmp4?=
 =?utf-8?B?bUxaeU5aSXR6K3I5eG5QbzNhQjJybGJaMEhuc090NlVsR0dYNGU5NDM4a0xJ?=
 =?utf-8?B?dUVocFpTaW5UUnFSeFMwSVpGaXBGTlBLeWxqUllPSnF1MFZ6TXdxRFA5cmFo?=
 =?utf-8?B?cGdnZU5QOGMrR0VKSkxuS3kxcWM0bUU3OTNwN1dPRHpHcDJoaGhWcWlkZ293?=
 =?utf-8?B?dGVwRGNKU0F1QnhWdHZTbU1KbjdyZmFXakpBSjlldEI5RFhaUlg1R1RWMU8v?=
 =?utf-8?B?Zy9BajBlSzYremhXbnF0L1RJUVI4TUs5OVZSODhtOUNFRTZ3a0JJWW5CdHBY?=
 =?utf-8?B?MGRLK3JFa2ZkMDJEcitQSEJRV0ZFU25oUTBVakVUWWV1OWRsUFl3S1hUdk1h?=
 =?utf-8?B?M0JhaFBpZFFNNDNDUlVGK2VOOGNoUWUyemlhMTI4Qyt2eG1Zby9wRE1aV0ZV?=
 =?utf-8?B?NEFNREI5YUFjRnUzanhIRTBNc2RuOHNURFgvMVpqMW1kdUdPK3NZTTY0V3V5?=
 =?utf-8?B?eFZaRmtnS3ZVUnFQQysxUnpZZ0hmdzNYVkdyK3ZZUXZQUDZ6SWk4Y3hSMStR?=
 =?utf-8?B?SkNQcjJneUNlR0hsUlB4MEZrU3p3Yll6SzZZTkl2WWJLbThiaU5MZTczNXZQ?=
 =?utf-8?B?SVgwbXZobzZIYm15bGhzMGs1SFVxdDFFVEI2UThHUkdDNE9zRkt1YlNKbEJS?=
 =?utf-8?B?MUdXcEFKcFVKbGVMNXJic3JRVk5tT0lzQWZjNmg4MnBwSWh2eklnOTJLMHFy?=
 =?utf-8?B?elpZV1RYMDBiYjlrejdmbUgveXFBMDc0RmdYT2o3c1FtZjZYL2hzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7821c3d1-e5d0-4d70-2235-08da4eb9fd7a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:29:55.6621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXdKV5xn5ShlcB9wbtNQJATumr9ACa5l2RyFaLAfb82bSmXpmInSstpxcRIE26XE6alOifnbSKOKept+x5OKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876

Aspects to consider are that these have 32-bit element size (pairs of
FP16) and that there are restrictions on the registers valid to use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -614,12 +614,18 @@ static const struct test avx512_fp16_all
     INSN(comish,          , map5, 2f,    el, fp16, el),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
     INSN(divsh,         f3, map5, 5e,    el, fp16, el),
+    INSNX(fcmaddcph,    f2, map6, 56, 1, vl,    d, vl),
+    INSNX(fcmaddcsh,    f2, map6, 57, 1, el,    d, el),
+    INSNX(fcmulcph,     f2, map6, d6, 1, vl,    d, vl),
+    INSNX(fcmulcsh,     f2, map6, d7, 1, el,    d, el),
     INSN(fmadd132ph,    66, map6, 98,    vl, fp16, vl),
     INSN(fmadd132sh,    66, map6, 99,    el, fp16, el),
     INSN(fmadd213ph,    66, map6, a8,    vl, fp16, vl),
     INSN(fmadd213sh,    66, map6, a9,    el, fp16, el),
     INSN(fmadd231ph,    66, map6, b8,    vl, fp16, vl),
     INSN(fmadd231sh,    66, map6, b9,    el, fp16, el),
+    INSNX(fmaddcph,     f3, map6, 56, 1, vl,    d, vl),
+    INSNX(fmaddcsh,     f3, map6, 57, 1, el,    d, el),
     INSN(fmaddsub132ph, 66, map6, 96,    vl, fp16, vl),
     INSN(fmaddsub213ph, 66, map6, a6,    vl, fp16, vl),
     INSN(fmaddsub231ph, 66, map6, b6,    vl, fp16, vl),
@@ -632,6 +638,8 @@ static const struct test avx512_fp16_all
     INSN(fmsubadd132ph, 66, map6, 97,    vl, fp16, vl),
     INSN(fmsubadd213ph, 66, map6, a7,    vl, fp16, vl),
     INSN(fmsubadd231ph, 66, map6, b7,    vl, fp16, vl),
+    INSNX(fmulcph,      f3, map6, d6, 1, vl,    d, vl),
+    INSNX(fmulcsh,      f3, map6, d7, 1, el,    d, el),
     INSN(fnmadd132ph,   66, map6, 9c,    vl, fp16, vl),
     INSN(fnmadd132sh,   66, map6, 9d,    el, fp16, el),
     INSN(fnmadd213ph,   66, map6, ac,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2058,6 +2058,10 @@ static const struct evex {
     { { 0x4d }, 2, T, R, pfx_66, W0, LIG }, /* vrcpsh */
     { { 0x4e }, 2, T, R, pfx_66, W0, Ln }, /* vrsqrtph */
     { { 0x4f }, 2, T, R, pfx_66, W0, LIG }, /* vrsqrtsh */
+    { { 0x56 }, 2, T, R, pfx_f3, W0, Ln }, /* vfmaddcph */
+    { { 0x56 }, 2, T, R, pfx_f2, W0, Ln }, /* vfcmaddcph */
+    { { 0x57 }, 2, T, R, pfx_f3, W0, LIG }, /* vfmaddcsh */
+    { { 0x57 }, 2, T, R, pfx_f2, W0, LIG }, /* vfcmaddcsh */
     { { 0x96 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub132ph */
     { { 0x97 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd132ph */
     { { 0x98 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd132ph */
@@ -2088,6 +2092,10 @@ static const struct evex {
     { { 0xbd }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd231sh */
     { { 0xbe }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub231ph */
     { { 0xbf }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub231sh */
+    { { 0xd6 }, 2, T, R, pfx_f3, W0, Ln }, /* vfmulcph */
+    { { 0xd6 }, 2, T, R, pfx_f2, W0, Ln }, /* vfcmulcph */
+    { { 0xd7 }, 2, T, R, pfx_f3, W0, LIG }, /* vfmulcsh */
+    { { 0xd7 }, 2, T, R, pfx_f2, W0, LIG }, /* vfcmulcsh */
 };
 
 static const struct {
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -379,6 +379,8 @@ static const struct ext0f38_table {
     [0x4f] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x50 ... 0x53] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x54 ... 0x55] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0x56] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0x57] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x58] = { .simd_size = simd_other, .two_op = 1, .d8s = 2 },
     [0x59] = { .simd_size = simd_other, .two_op = 1, .d8s = 3 },
     [0x5a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
@@ -441,6 +443,8 @@ static const struct ext0f38_table {
     [0xcc] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0xcd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xf0] = { .two_op = 1 },
@@ -1502,6 +1506,10 @@ int x86emul_decode(struct x86_emulate_st
                 if ( s->evex.pfx == vex_66 )
                     s->fp16 = true;
                 break;
+
+            case 0x56: case 0x57: /* vf{,c}maddc{p,s}h */
+            case 0xd6: case 0xd7: /* vf{,c}mulc{p,s}h */
+                break;
             }
 
             disp8scale = decode_disp8scale(ext0f38_table[b].d8s, s);
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7840,6 +7840,34 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F3(6, 0x56): /* vfmaddcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0x56): /* vfcmaddcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(6, 0xd6): /* vfmulcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0xd6): /* vfcmulcph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        op_bytes = 16 << evex.lr;
+        /* fall through */
+    case X86EMUL_OPC_EVEX_F3(6, 0x57): /* vfmaddcsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0x57): /* vfcmaddcsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_F3(6, 0xd7): /* vfmulcsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_F2(6, 0xd7): /* vfcmulcsh xmm/m16,xmm,xmm{k} */
+    {
+        unsigned int src1 = ~evex.reg;
+
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || ((b & 1) && ea.type != OP_REG && evex.brs),
+                              EXC_UD);
+        if ( mode_64bit() )
+            src1 = (src1 & 0xf) | (!evex.RX << 4);
+        else
+            src1 &= 7;
+        generate_exception_if(modrm_reg == src1 ||
+                              (ea.type != OP_MEM && modrm_reg == modrm_rm),
+                              EXC_UD);
+        if ( ea.type != OP_REG || (b & 1) || !evex.brs )
+            avx512_vlen_check(!(b & 1));
+        goto simd_zmm;
+    }
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */


