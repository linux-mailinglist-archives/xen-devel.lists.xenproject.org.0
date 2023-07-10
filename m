Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52674D09E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561092.877403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImdM-0005sH-8Z; Mon, 10 Jul 2023 08:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561092.877403; Mon, 10 Jul 2023 08:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImdM-0005pu-5e; Mon, 10 Jul 2023 08:52:40 +0000
Received: by outflank-mailman (input) for mailman id 561092;
 Mon, 10 Jul 2023 08:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImdK-0005pm-RI
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:52:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb69bf3-1eff-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:52:38 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9315.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 08:52:36 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:52:35 +0000
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
X-Inumbo-ID: 1eb69bf3-1eff-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+En57oQQSPTZAqHAmSxPyhTAHgvj17DALtgge4jIsYs6oA2IL+4Mqriy9EKO9rPZ3Otd2WnA634fC1SvBKAb+jkpL4GELtqRm56l7CSqGY2Ydj+ayewcjU7iZrWpbfEKhHocy/k3LM1birIGrA5BkTYHlGrk9abiZXpKwRFgI1QbVm2Ci4CTz78iD7cFJ0g0DHosjeixbbeIXJ+FzkOAfZq++vz6cT+NdTIr0RIzbtsLokkUnx0l5NO1X2XXqvQ9hIO1ias5bgD2HOIccvBDRi3JxKU4niSeiTn7paZpchhrbeFbWxzMZgTMq+bLcVpdAs7O2DYJrXS8gEBaFLxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njshz39xQXWzUhA0rIyJzlUroK26ZOgCP1y5HqVWGkc=;
 b=l9N+oSAPoI4ar5xQtsr3s7vg3AHX3vuVeTjz4JjVXGsBhu5UJ3TMzGcpxCygkCVD56071oeo8Js0MG1e6BrRVVOrf+axH+nE/unX2F4JrhGBHn1umbLCnkh24tEW+vejH6MF6/V3ohtK0WvxayFLf65HqCdKxcfdtD0XUbhX6fUfLjsu8hmmlNyeVBzK18buwMNKl8hg2oGiav2hyCaxKGmu94Zx2DTADJ5mLZiWZY0ToaA8HlT0jBeMSEx8XElpnhfRkzI5wTj8hN+0OuocHzTauecCGEBCybohp5+Gjk6Z8MMsgnwO6HYJyXKA15pLHkWhB7db48n3C7naG0ptIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njshz39xQXWzUhA0rIyJzlUroK26ZOgCP1y5HqVWGkc=;
 b=PpHfwbxubi50Zze7hViJybvADhiYC0wPvmGdysQQ2ZpjEVlci1DuXu5pCclt2GTY9bRH7yrjcTd5HEXnxdrYHlMQYx32/p4nQwGQbRok/KTcUeJ28VbT0TDM9LOEJ9di29/zqHj7Y9rNi77v7Cr2wB60voJVfYO7eQjiFhDt5sRy20zmdNkxPwsFdOex9zcQ1Ub0a5cVQBJYz5N+EIJAH7/YJQHqLCMFy1aZZ6j9q6UdVJvT7pVNClwo9RtNIPVYCjM9yHfOrnvYrQvxpuDOcEnOjW8ah8dBJvBbHbyn1s8gNFQKWNfVa0x2uEy7nfLWdQRg2V4JgTJ5ylIhiSR+hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e685d0d4-72a0-e628-c0af-75849fbdab67@suse.com>
Date: Mon, 10 Jul 2023 10:52:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 2/8] common: assembly entry point type/size annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 74920813-a889-4af5-2e54-08db812301e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WvBd+tBkx6BccUgQIQNEALAMP8Q53U+xgUI7QJG/S/jahPI4Iqamyabdo52axjc3aeYpN9fvjskEIlsBMJcR/SlwmJ1AQ3ffvaBtWrczsOs1c084by4kvst/3CdvgiqjUzZGqxAuswcAusokCF6tFi2AnaG5DE/ZdDLfjezheV2vPlrHmQ7lhLg2TYBvZxyTs80SVecBTySzxo4VDWHfUr2ZggWAsNrNU3ShwMti95eOjtdh9gBI12fzauh9SJaVx2L5lk97x5TCW6vCrsVR79oaqrbaqsH0cvrlsnKKer2HLD1KiX06ZIgGdrLk9RdxBD8XjnH/PPTiupAdknjN2Uhjeg+JaNKI65QeCqrf6uHIPUDB6UO/Y14yCC12dvpxWO17OnQymiv1yChlXwANvmn1WRqUpJySWp7c0lGzyMPsXYlKdStV0NggIlz25fqcUiK2HzqxlVXtnA+I+vbs9zyu//RAWmtuFL7Dnf1Z4J2S/CWdiV7N1UzEHN3g2rqmz9u8cciVArEWhTuj1za1vMAjalYxHVigkE2OgZHh4JgYUZSmQgFWZv5sEG0iImzUwqxy0vFqgh3JRhm29CyyUl5fCqODtwzArdoPuAff1Mg1mE/Ke32x7I5pdLX68ZZLldg7qBTTj/MDZQu5OrE48A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199021)(31686004)(478600001)(4326008)(54906003)(2616005)(86362001)(31696002)(36756003)(2906002)(966005)(26005)(6512007)(6506007)(6486002)(186003)(38100700002)(66556008)(5660300002)(316002)(41300700001)(8936002)(66476007)(66946007)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjFuZWREOU1OeFNIb1hreFNpd0NZdGE0Y0FPZis3V1NFMEErbGtuS1g4ZnRm?=
 =?utf-8?B?R2ViZFl4eTZ3SDB6YlNCZWpzY1h2eWUzVVdHdE5XZ01WdnFucVFSclMvQ01o?=
 =?utf-8?B?M0h5UVRRNmhPNWpTb0dyMkhZZTF5SFBGODBmd3RaY1VNdnN4SVp4aVBQWllY?=
 =?utf-8?B?WWQ0WENCSWU3TmI5alorY2c1K2xkd1ltSXp4bGNBejhicEtiRXJKZUpMMU1U?=
 =?utf-8?B?NlROb1ZSdEtQc2ZXV1ZJcmxVSUJLV1NtNGs2WmhyQWwvV0Yra01vWVp2Z0ZP?=
 =?utf-8?B?S0JOREpSMkMxNE13K1ZwTEgzWGRJdUZaK1Bhcm9LY0k4Vi9NYU1yTHBWZTlK?=
 =?utf-8?B?UG5Mb0NBMUZNR3g5cldmK3MyQkcxWFBCcU1nOG9aRlErOHpnbE5wb3pYVmNM?=
 =?utf-8?B?eFNnVlJ0TFpaWExpNU5iUG80K3VtOTY1QVV6UWdhbnpBZVhaS3dFenVGd1FN?=
 =?utf-8?B?MHBJN25TM21FM0FYVkYxVHQ2eEZrZGR5aXZWYnJqZ2NpUy8vU2F2VkRZUTMw?=
 =?utf-8?B?UUtTWHVvSHpHTXFjMW82Y3F2RVQvQWNWZGp0d0Y2ZjA3a0FqSG9qeVkvMVBu?=
 =?utf-8?B?OUxzNThjT0U3TWRoNjRBVXVma2N3SXluUjNNZHhzUHRuWFRGN2Ixd29BcWRU?=
 =?utf-8?B?NmRhOGNtNElObUh3U1dlWGxvekorSnZ0QmdDKzhaQXg0VkI5TVN6eTdTSGwy?=
 =?utf-8?B?VTZvSjdHYVRTZGJ4bjRpdFB3UW4zSGJZcDgyOVdHTU5NM1N1KzA3VFBNb0U1?=
 =?utf-8?B?UWYweS96MjVUaTJqeDU3VXNSV0QvRit4OGZSNkt5Nkh1c0ZrZG93eXZxQVJ1?=
 =?utf-8?B?ZWFZK05xVVo0b1F6QkVSM3M2b3pYN3dpeHF4YVgvNnp3dS9tZ2J1TWVhbFNQ?=
 =?utf-8?B?YUtQVHliT2hHUVRlQ0Rud0tCZDdTdG81RHdFdUl0MFV6Ykd1eThsYW1mdzFv?=
 =?utf-8?B?cXc3RUdodWc1ZmFuS3B6UFdxNDNVN1A3b0ZnWVVaejBLMFR3Y295VXhLSFg5?=
 =?utf-8?B?a202RUpyNUg5MWtkZFBhVVBXYW1BNVlPQUt3bWkzbS9UUzNFSHUvUWhRZ09E?=
 =?utf-8?B?c0N2TnBUazZ6eHhjTGI3ajIwbWFoQkVEM1RlajNGM2wyZzJ5MFh0Q3MxZjcr?=
 =?utf-8?B?Ky9ha0VSU0ovbVhiQW1haHNHQ3E2Z0FmbUszZktWSFl5Zm5jd09QdmU3dWNJ?=
 =?utf-8?B?ZkpSbENVZFA2d0lDZmFsQmsvdFNwdURZQ0tkbU5qclVpTE1XS01kTlVBSWJ1?=
 =?utf-8?B?VTJYM0xYVTFSQUlrSElQWHo4TVN3MDRSamxyMUFxWU9jQlAvY3ZHQmFJckVP?=
 =?utf-8?B?elI3VktocFQ0Sm1GMld3dkVBSDg5cG9iQTEzWFllTWErOXpUbkVTTHkvd1dZ?=
 =?utf-8?B?YkRWdTMzb3VDRS9VaE1EbFVxNlZEOEVDUmNBcnA4Q053bU5HSFBTRzB5S0xm?=
 =?utf-8?B?L3NtUTNOZ3pmVU9yaWNFQ3VUd1ZVWXFqWkhJUmtVK2VOOFJ1NDIraGM0dUR6?=
 =?utf-8?B?bXhhU1p1bUU0MmNqMUx6Nmg1cEtLcW1rbGU1dEVzdEthNllGeHh2b1hnYk5l?=
 =?utf-8?B?T2lPWWlLUTkzSXpITGpGa1gvYWRBWmowVkVVd1lHU0U3aWFVRTRiMXUvSXkx?=
 =?utf-8?B?Z0JsQXJvelpidDczMG9ZQjUvQkdzSHZCZFZsZFJuTi9kZ0NnQnZHRExYb2dL?=
 =?utf-8?B?ekgxN2tjblVyRVhOVGVsbm1LMnRDK1pFUjZHMHRGRHNEUk5hL3B0U0FnRVA1?=
 =?utf-8?B?bm52bFRHYUVPVTJVRWI0TlUvVS96ZndyT3A3NjlRak00bjhSYk50TjZ4SHNN?=
 =?utf-8?B?RUNsL1RIMU1vYWQrQWluMktVMnlqL0dLcEF3VGVXTFJMRnVyU2F2aFYwSVVS?=
 =?utf-8?B?bDNBMWNkVDJwaHFFQmk5VlM0NFRMVnRaRUNrcENRY3JSSk50d1RyWnZKMklJ?=
 =?utf-8?B?MmFvQTR0b2ZCQ0tkK0VDUjFHQWJUQnkxQXlaVk1SelVyVDIwQkxaRHpjWkZq?=
 =?utf-8?B?NlQrYWtzanoxYmk1d0dMdkNEVFpvS1d1WWZkczU4aDZTRXViSG9aTkp0bC9M?=
 =?utf-8?B?dEVBY21hYW1Gc25GWUloV3dsMDlDSkVnTE9yb3pIbm1JaXBSaURQckM0S2NZ?=
 =?utf-8?Q?viZuIClV7rEb1mSfBAw1qvCcz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74920813-a889-4af5-2e54-08db812301e8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:52:35.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28CeclLfKUPr5AFGA+2dmN3r2sss919lvKYpuYPIJV1Kze1UqCoTEA/6hMTp4ksFSFAeup1hqtZ1r5X8kwwaRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9315

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


