Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF876FA0B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576860.903482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoGT-0001IM-TS; Fri, 04 Aug 2023 06:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576860.903482; Fri, 04 Aug 2023 06:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoGT-0001Fg-Px; Fri, 04 Aug 2023 06:26:21 +0000
Received: by outflank-mailman (input) for mailman id 576860;
 Fri, 04 Aug 2023 06:26:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoGS-0001FG-RQ
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:26:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d320f1ee-328f-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:26:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:26:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:26:18 +0000
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
X-Inumbo-ID: d320f1ee-328f-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIcepoZQLHoAej8AtgDTFQ5gmLSRviAcQHQfoyT31S98lbcGu3RfU6au/SbF4Bf7uehIu+DMKHTsj/BhsaYnZiAmV8eL+qAq8wCz/L5sTkB9qvyYLZtyoD7kvl2YWQTin2jWXcLe+hWiaYRbkc8uu3eFbLRwqxHzIXjU5NkBWE8EP89v4FjXJFJc2dhw5qqA2HRNedkKNw+NItuy9GHML9WG5saWllyJmLPE37FmXoiszVDJa3lc3+TXUp/gGfCdESA/BmsPtDFbOUHieryZqwkUn1yMIxhwHK1yNnz0BzuDZh6qPWkXhcRWvlnZcDixPLRzjihw2pHbjRNGnTntoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njshz39xQXWzUhA0rIyJzlUroK26ZOgCP1y5HqVWGkc=;
 b=C2YNExXJc14pTzxKK6yDUvKBjGgWvoXD4j5vDSVQu70W0mGzfCcCpPltY9uxYNZv+HF6il1lFYPyp/bX0TxsGYo04KKPA+hEewtOt5oeAvm0nKClznrGSYT4y+JsPqGu8BhTnOr+vxZfju2mDufzmbDL8nEjH0KP4dAaQU1WMUdm0xb4FfuqkTTb28SQU8Hro0TEIDzEnOVp3NPCoujXU0e8rOU8BtzqBy6oH0jX7XI7cgD03jbQOjyVTRGChW5VkcUU4gw2qBQ6SR6NM7OidH9vXs7LpVat9XHofhgyJLDkXD/Rtxb2XBNSrg8E1iufCPjvQId9uUgLxxVuoihdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njshz39xQXWzUhA0rIyJzlUroK26ZOgCP1y5HqVWGkc=;
 b=f5nWjrvevgLbNrsC1jnrSqI3W78s9oeCwKE+hLBU8Fy0v8W+Rp1hb40gAOxKyxcUKd/+rVYY+GcIUGBtrWNgSL1RqWBbhvww0DRfQPTraFKmAECrpkTYqkbRmGM9jPUaA1Bs0tNRNObRdux60RMEYNZjWQvtwM4bASh+tU+FXgB+ZKMrSnu2XLbztsPSnwGVzdfHQYmTRsMB/QrbNOxBZ5Ai26hI+H6Ep1rIzzVgX7QmHl5I2sxDWCXz5yIYjY69JdSNE2xlskEuwX1p5wa0IMHettJL6YW26a9Vnsba4K7CbnIx3xq/7yfv5vPgoSYQTrFbzb1GDUzT4kvA1I7UlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ed43968-311e-263b-4dd7-9f8a49a394dc@suse.com>
Date: Fri, 4 Aug 2023 08:26:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 1/8] common: assembly entry point type/size annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 383e3393-971a-43bb-ed4b-08db94b3b62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AV0XOXT8QOWAFgwYxjNSlQmqEFIG6vcr71PeiqsmZeyoYhzz1/u4jEhZ3xmMsa+FQPPVu1ZnrKvutWR5CRjJQNSIgEEakA/Fc6eQtKXXqskBnEKexv51jYoPPVyhoROWCSj8N8IRtVqzMkA+qT11Q5M2jtjhpO57IRJef0RSrIR+9ixgi3GRcM30lZ34IRRqjspwdoN2daA0U4I+lwishW3v+LPpA1PpCVfl333GMt+xJ4Sf5fqPVWui6psI0VucXjLCUb9DdybyQmoKE/7ZR5gN9CWFVrvpjVYuVxNs+7zUrPhiph3oKcX+3B/o0Gj9lswKNfsAIKdBRPx6QUEz2V7ZEK6UsRhYdhdjJ5V2zRYZYb1DYok4WZH5VmubD/FlpQlPpblzmRXp0j+Y7rCiWctM6lf+JzPQ+idgII+y5ojeMkjicbam0pgyjgr/mu0DX1Q3HbpNz3ze1O48KOVWralpfB2R1ewS53b4zyLUCMtxn8sIKUeMQZ0vzgX8Bxqt7/f5izH5x0P+JnW4RtkCLorTLA73QyG0AtzFDLAwzV3oVFyLuq+O1CWAHOKOPRiUcwrRxnIcfgXA9hoGdR200ww+NjQsmWliqPU9t6Y7QOy+m1NVl0cqj2HN+wJuSkR0jhZ6e7zBmgmhm3MQ94IISw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(6506007)(8676002)(8936002)(31696002)(54906003)(6512007)(6486002)(966005)(478600001)(31686004)(38100700002)(2906002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDFYZk5MQURlbnh3My9xOTlyeForOWZ4c1ZVUEJSTXNCUDEyaEZyVWlPYzNJ?=
 =?utf-8?B?blY1OUtpSmJyc1FrZlZNd0Z0RjN5WkdGNDMyQmRQbGhEcjFBVGtIN3pCMTRi?=
 =?utf-8?B?RlNBZExPK0hKTlMyQWhBSWs3WlZjbWxDMWR5bHZMZzRFV1NJWmFXKzZCUU9h?=
 =?utf-8?B?d21iRlp2TUpBSVRNcXBLeDNqVmZaMWhkUnVlb1NUMzdtZGtnRDdXR0g2TVlG?=
 =?utf-8?B?dTlFUUJjdGljb05RTndWdllPRHluTlRrNHhRcDJHWlZ4cU00UTBCa1k1Ullo?=
 =?utf-8?B?MmpXT0hkN2JSRnNFaE4vb0ZBVkNoYmN6SEttY1I2NUlSUERFa1plc21aL3JZ?=
 =?utf-8?B?cXBJdUh2OUowTXIweFV4c1VEcExSWFF3Z3F0VjJsRzd5YnI5QUZaL1dib1JH?=
 =?utf-8?B?K01yNnUvS0VhSUFXM24wazFwUFBma1c1d1pMblFmK0VuM3ZwNFJtT1c3Z0tl?=
 =?utf-8?B?cUQweU1HYUxDb2ZtU05LclFoVXE2aUtKaTEzR1dISWNCYk1aWlVtSGk2VWZR?=
 =?utf-8?B?OTZueTNVS2s1Rlo3bVV0TUROcEZjZ3NiZW95VCtqc3ZEUjk4SjI2YVk0cTRs?=
 =?utf-8?B?SFYxS3dkOTJVUWF2TUt0RXdqZXlyQUZGK3VLeTRRMXZmbEVQMkd5S2xjaVhk?=
 =?utf-8?B?Wjhkb2ZaTmZjNGtMVU9jTXNKMUFKK2NabVpSSmthRG1Fa1c0RnZ0aTlQNFli?=
 =?utf-8?B?NVB5NlYyOWYvajVpdC9xSjlUUFZiRmhtWmRXQ295NXRKYjJBVXhSMkNHaW5h?=
 =?utf-8?B?SHVSS2FWdFNkS3YxUGgvWU5PejIvTnFvMXlESnFwZ2hjY3pmWlY5N3Q5dWdR?=
 =?utf-8?B?Mm5QSzYreWJkOCtYRGRPeGtYVW8vUVFwSmVxakI4N1pqeVJsYXdCQTI3WVdT?=
 =?utf-8?B?bXNoazFSSGxjcUFBaEhQNE1PSnJhc3MvK0EwZ3VscmczYm5hUnZpQ2x2ZVZJ?=
 =?utf-8?B?SWFRNHRWQ2pIeEdJUWVGMmJyK3MrSkllTWdLN3Y3b0VKc1ZkZGYwc1ZsVC9K?=
 =?utf-8?B?OTZ6aWU0dzQxR2pNMzVlUHdPN0FwQTRQVHc4aUpsWG9BUjF1Q05kQU5sZDcy?=
 =?utf-8?B?M3U0cVdPcFh2T0EyTnFMbzlBYUVBdFAvSjFud1RzazhBK3NXM1JtaVI2VWJU?=
 =?utf-8?B?eUwybW9SVWZuZFZDUktKWWo1R0FBTjdIN3N4M3NOS2tqUFR5azZ5U1dOWGlh?=
 =?utf-8?B?QVdwUnFQaWVhRXFxNE02a1kremgxcFNQLzNNQysxREtWNHAraGtlTFV6Slk0?=
 =?utf-8?B?ZXBuclJQZU13amhnWXNXS21CbURCK2lCcll0MkZ3dzRxQ0w0RFYwd2JNMllV?=
 =?utf-8?B?T1RPc2ErZzRiNmNzd3djVWVaemtVNXd2Y1ZaVEpIMjNMcXpnUWNLQkk1S3JW?=
 =?utf-8?B?d0Zwa0gwUzdhemFxUjBHQnZCNndBWVA0WlZTYVg2YnJ5SUZhSjhscXZsWnJQ?=
 =?utf-8?B?V3RSUHFSOEdKOW9Rc0F2K2V2Y2JVVTArbXdFMURTSzNoNEt3SkRydGpPTGIw?=
 =?utf-8?B?ZHY4THdXSE56emdFQTErZUpvdXhXNERuMHo2WjhkV0dWOXB5V0ZGTDZPNHAx?=
 =?utf-8?B?ZTAxMTluTDgyQnBZWWdRWUJUZEpPanF5NDN0VnY1d01rRHVFcSs0SkpDSFhN?=
 =?utf-8?B?Rk42RENpZUJjMWFsd1dTVTNYMUR1c3hnVUxLN2dVUmlDOEk2YVRDNzY0RlZx?=
 =?utf-8?B?aDEyOEUzMlZlVUNTUUlZK1JZTmt1NXRjVktyL2VndGo0aW82Z3ZKd3pPQ3dS?=
 =?utf-8?B?WGRBTysyazZPRk9WZmgzUDRoYWJ2ZEF5R1oyaDBxMVc5UzNrd2k3UVhPR2ty?=
 =?utf-8?B?OU56cmRFMjY4K0s3WXg2ays2UVFwaVBTS3FEUGdoZjhYMXA0S0JUZ3BwbExC?=
 =?utf-8?B?Vis3T1lGTXdvemxiZEVRdytWVm1ocXpoenJndm9XdzdiZmdXRkhIWkx3bGtv?=
 =?utf-8?B?MitNT3B0NHhZaWtTMGMwQTRzSGtjdVozblVYU3FXVGtibWMzWUdsWndiczdj?=
 =?utf-8?B?c2kvdXFONEUzMkg5bFlqK3Z2dGJVUUJjSWFMa2cvVnRJdU1RTmJ6S0lxVTNI?=
 =?utf-8?B?Y0xSekZrdFBlM09lUTdiZktMNWZZN0pJVGN0ZkFKRXk1V01BWnBoazBBTXhj?=
 =?utf-8?Q?SRPElD4ZypTEuClsxqMXBJXoN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383e3393-971a-43bb-ed4b-08db94b3b62f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:26:18.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoHYrPZKr9sQW8achC1A8vhLJAM36g92Uej6kWeOlvLlR/OdBzFP1iw7Z5QhH+3KEkM+wzeKAB3X8cqOmlZBAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

Recent gas versions generate minimalistic Dwarf debug info for items
annotated as functions and having their sizes specified [1]. Furthermore
generating live patches wants items properly annotated. "Borrow" Arm's
END() and (remotely) derive other annotation infrastructure from
Linux'es, for all architectures to use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
---
v3: New, generalized from earlier x86-only version. LAST() (now
    LASTARG()) moved to macros.h.
---
TBD: What to set CODE_ALIGN to by default? Or should we requires arch-es
     to define that in all cases?

TBD: {CODE,DATA}_ALIGN are byte granular, such that a value of 0 can be
     specified (in case this has some special meaning on an arch;
     conceivably it could mean to use some kind of arch default). We may
     not strictly need that, and hence we could also make these power-of
     -2 values (using .p2align).

Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
still have ALIGN.

Note further that FUNC()'s etc "algn" parameter is intended to allow for
only no or a single argument. If we wanted to also make the fill value
customizable per call site, the constructs would need re-doing to some
degree.

--- /dev/null
+++ b/xen/include/xen/linkage.h
@@ -0,0 +1,56 @@
+#ifndef __LINKAGE_H__
+#define __LINKAGE_H__
+
+#ifdef __ASSEMBLY__
+
+#include <xen/macros.h>
+
+#ifndef CODE_ALIGN
+# define CODE_ALIGN ??
+#endif
+#ifndef CODE_FILL
+# define CODE_FILL ~0
+#endif
+
+#ifndef DATA_ALIGN
+# define DATA_ALIGN 0
+#endif
+#ifndef DATA_FILL
+# define DATA_FILL ~0
+#endif
+
+#define SYM_ALIGN(algn...) .balign algn
+
+#define SYM_L_GLOBAL(name) .globl name
+#define SYM_L_WEAK(name)   .weak name
+#define SYM_L_LOCAL(name)  /* nothing */
+
+#define SYM_T_FUNC         STT_FUNC
+#define SYM_T_DATA         STT_OBJECT
+#define SYM_T_NONE         STT_NOTYPE
+
+#define SYM(name, typ, linkage, algn...)          \
+        .type name, SYM_T_ ## typ;                \
+        SYM_L_ ## linkage(name);                  \
+        SYM_ALIGN(algn);                          \
+        name:
+
+#define END(name) .size name, . - name
+
+#define FUNC(name, algn...) \
+        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+#define LABEL(name, algn...) \
+        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+#define DATA(name, algn...) \
+        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
+
+#define FUNC_LOCAL(name, algn...) \
+        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+#define LABEL_LOCAL(name, algn...) \
+        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+#define DATA_LOCAL(name, algn...) \
+        SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
+
+#endif /*  __ASSEMBLY__ */
+
+#endif /* __LINKAGE_H__ */
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -15,6 +15,15 @@
 #define count_args(args...) \
     count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
 
+#define ARG1_(x, y...) (x)
+#define ARG2_(x, y...) ARG1_(y)
+#define ARG3_(x, y...) ARG2_(y)
+#define ARG4_(x, y...) ARG3_(y)
+
+#define ARG__(nr) ARG ## nr ## _
+#define ARG_(nr)  ARG__(nr)
+#define LASTARG(x, y...) ARG_(count_args(x, ## y))(x, ## y)
+
 /* Indirect macros required for expanded argument pasting. */
 #define PASTE_(a, b) a ## b
 #define PASTE(a, b) PASTE_(a, b)


