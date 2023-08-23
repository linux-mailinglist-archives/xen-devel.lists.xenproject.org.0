Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E820785164
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 09:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588995.920671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYiBK-0007fc-IJ; Wed, 23 Aug 2023 07:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588995.920671; Wed, 23 Aug 2023 07:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYiBK-0007dH-FE; Wed, 23 Aug 2023 07:21:34 +0000
Received: by outflank-mailman (input) for mailman id 588995;
 Wed, 23 Aug 2023 07:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYiBI-0007dB-Rs
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 07:21:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae5b7759-4185-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 09:21:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 07:21:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:21:28 +0000
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
X-Inumbo-ID: ae5b7759-4185-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hijwJGXS6487shl6WS0kjyPd59wunI/aNhz4lZ9ceVD55xbmxR/DZLIE8/J1s0L0BgOHJXaQIT9EmeAJPHl8xjAufU/5PvPO/tqoCXuxdOZ7SpP6/s8T3s76k7fVwkkraQBRctq+x5cI2bgClQ50aREX2htJFNiO4XaxzMiC5vDuR9Cx2QaJQf5J3A1b4Xr1i91ZFilZxc3BiOYJhojfNL6Ag9X7OT5HjshH/P71qxfOd8NpzlVvFc9zaMqq/97R3H9oRIEOdBcnEheOMwVDqgCf5SWQz4itKS0FHOILdPPBhVzf7OZGI2iL9DuL0F28bdfbp3Rb4FrnU+IFu2Vvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf0oYnqYn/LfglmQ1aNeY2174tGgepv6jmssSRTXF/c=;
 b=erIUOeuTFU/z8k2zL1QQTWKGaLNFEC+jGuHi51ZHwOvwKf+82JJgWy55OvVBp39u3ieTc57b3AuNuHlc1YGzZugRWOTeQxxghZYnlMKDP7bamovUGrJjt7RJ6gIC6NBlIao/LTsn2BL9BwbcHd3v63njpT2e9a3wT3Rx7qh6JWgIQEkCCTnQpkcyBCv+7uR3dyo+Yvak6FwD+3N03JXsnSeGMAcs3512TThnULa+DJq6UXw+3mBJJR7KLxgL4S6CZqD9T9P+R1MFrf67ni2jENP7q14ecqw25hqJOB8B1Y9GTGZXkJEC5ohiqsfyflOJj0w+c9gRMgnAI7rAD8HmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf0oYnqYn/LfglmQ1aNeY2174tGgepv6jmssSRTXF/c=;
 b=kToX+A4VaL6tDkU/SD8/2747MaAY7YU2K8OmLiW/3e4ryeg1egFqz/1r8B+bhS8Un1QTNPtRDLYPDwPc0bIYN1kJUxyAzwt5pWa7ebp3cQKHBbHgLZUR9uWss1EqoTObM6JXe6/W/p/e2dae9QTQes7EXrZvJRgH61AKbaIOjy/Lu0vw1yn+DTv03OhFRmC9uP6RYzv5TGzbDKiedeZgoEoXR3Udv6vmauVNvJnDUn0aGAMQoxGX6Yk3BySHgGuvD52NTe6BHQN9V0Wt7MEblbu06ArsOtcMd8Qdj9Ne8WvKt5blkt6snhOtAnmaXyiRJXefcLfoKnU02c0wQq5bUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1517da3b-7d39-47b9-2714-d97dac217678@suse.com>
Date: Wed, 23 Aug 2023 09:21:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl/CPUID: drop two more feature flag table entries
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3ea0fc-4e19-4d13-0b3f-08dba3a99138
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZwB+pZhzGhIpwZ4Q/q7JHV9/7x33XLuZweGQWNup8PT1QrCOYizyMfo2NBTC4trV7jUIw+4cRUZ80qGlrNINWB7oTjWQsus9ykOFbu0HlD/InqgBbUy4W4pdLi+jGdBgE98LkEoOVtOXPWaIM/3pX4WN2pTFOOApEk6QpmWBgOvEYoCSELCdQApVztkrXha/y6/ruC9VOccb4RfToljv9remaWZlpLotFKBFM//aler7lOfEeQVybJ0qjrNRvMbZR6Zd2iLpWTkLXWOEzisI4cpmi/WA7w0J99NTI5B4Aj7/sA7U4x31P0uzuYxMFueL+n5zkDk0Oq/Z0DS9J2edD9b9QoQI76RM/H0WAt4FEQNTr1Tt0sSG+cvNkd3ns43I97D6cP3TPy2eRAJpvQpRgKQp0l5jQkNNWNkW/MNRUviE895iGP8w67m9tYu17oI+LzGT/vEUYJH3N1QrGA1ipGX8qvozGC9Am4wwhuExXsV9GXtIXgDcaby02DBoHevUpDdoglOe21VoTdeANMoh2lekxGjFavWOrQEmZdQjA3wjy+sE0G6MNuvrFqPpnJ2Kc0+ZW3N3IfXABC0OXxTk72o/z3uIJhJNaP2H9g2QY+JMbGLJcNMTbD4bOd8YTBDvi94ktODMArEdwZpkjqDeaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(1800799009)(451199024)(186009)(2906002)(66946007)(6486002)(6506007)(478600001)(2616005)(26005)(5660300002)(66574015)(4326008)(8936002)(8676002)(38100700002)(31686004)(66556008)(316002)(6916009)(66476007)(54906003)(41300700001)(6512007)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2JnRkMzK3loOTE2RUlLdDRLZkNwR1hTTFNOUHE2aGpPQXYrK1dhL3F1QXpQ?=
 =?utf-8?B?K01aQ2lmSkM2TE9mMFowaDNFak9nVENkdTNMOWdGU2pRSjkyYWttRmZHRjVY?=
 =?utf-8?B?dGtYb2J4Rjg4WmhjdDZpRHg4WXFJS2RkKzRMNUo0c1N2ZDFHRWt0emxyUzhj?=
 =?utf-8?B?eDZGMEhBdi9EWmlrVzZ5bVpOcEwrTlZqbUtiTlE2ZWpiTjdvVk5VNnBRcTJt?=
 =?utf-8?B?MEdlM0psc2NndTJoT0hIdTRyZVZmUEM0blczOEpnUFFVTTZQdkYxakIvWmx5?=
 =?utf-8?B?Tks4R3VVbGJuTm9HQUhpeGhYZXFGZHNuaVdNRWt0S1ZsQ0xmYkxNdzZmekRM?=
 =?utf-8?B?MHlvaVNYVHh0WUx2ZVBzR2hOVXJpRnhnUStnbFh2YTdHQ25QeFVZdlRWTFFL?=
 =?utf-8?B?M09oRjJLUlE5WlY0OHo2UExpYWpGcENjVVhLOTRRQU9XYjdVbVA3ZitGTEdu?=
 =?utf-8?B?ajJ1VnhvSVBJVW4rcnRBWkh6MWE5NGtjY2tQamx2L045blhyUUt2Vis4Mzlu?=
 =?utf-8?B?Z0d5cnJKQnlmU3VKOVl0ZzIrOHI5ZkVwNkRZUkdLRHRRb0ViZTd1cmV4L0dS?=
 =?utf-8?B?SktHNk00NmtVcUM4ZjNpdGtBektHajFrSTZPaHFQT0ZMUFhJdmx3UnpFZ0I4?=
 =?utf-8?B?SHpVUS9sSG1YUVdBbjVOaGIyUS9PU082L1dLT1ZWTkh2bW5WN2xHRmxaU1VE?=
 =?utf-8?B?ZjlRdmhCTGlDT3dlTnRDM0RaenhEbC80dU82TUVvTlRhUWZBNWtjcDB6KzFX?=
 =?utf-8?B?YjBmSC9zOG9mdk8vZElCQy9RNTdrcWV0SWQ0eVZxcTE5TDRSaWF1K1RBMHhT?=
 =?utf-8?B?bVBLMzJyODRHM2pScGMwbEpiZzdsN1Z6SUE0Qno2RHZqZ1RRQytsWjE2VTZU?=
 =?utf-8?B?L3Fyc3c4OHpneHFpSmc3dTZISGZheEJpWWtVa3JraXg4OXAyZ2RlMEY1UkYx?=
 =?utf-8?B?WUtNbUptTEh0R2hQMmJvOENDS1czU1JHcWlYRi9oZUZTaEs1QVQ1MkNTNEhn?=
 =?utf-8?B?S1ZxTERFWEVLWHJ2Njc3VDhZZi9KM0ZucmF5Z21FUnk4MENMUWx1MFJVcGI4?=
 =?utf-8?B?MWp3b3lYUS9HcWQ5QlgyUFRmVzR1NDRHeC9JNThJTytZMUUrV0VPMmJUUjdT?=
 =?utf-8?B?a1BmY3Q2R0RLOGdGNEd6anUwc3l3OHA1V05ic3VtMXp0emthbXZUekNTZFB2?=
 =?utf-8?B?b0pRalc4c1RqSEk4UHZXVE5KWHQ3ekNUbngxejY3cTBPc3dOZzJ6Z1lPVW85?=
 =?utf-8?B?U0o3cmQySjFER1BWcmNsbllEU3VlbW4ydmxoMkt2bUl0ZVRXWmp1VkFJZ2Qy?=
 =?utf-8?B?V0ljUC84TnVCdkd3NndHOGhocVpCVDRyQUp1UEtaTFphWmsvWUl2ZDk0aUZJ?=
 =?utf-8?B?LzlIWG9KM2lyMmwxQkFVUk05bS83alN4blBZeXpJTzZqWkZKVGdlNUZiNmlm?=
 =?utf-8?B?RW9EMllMREpGLzdsNEVnak5xQ0pSQlF6U1djOG5YTGNHZERaTFdCQk9ZWmtG?=
 =?utf-8?B?Q28rbEM4a0twdXlYUkRTNm44UlB6TjAyYmkyZDRyTk9BQmRWWmgxYkZjY1Q0?=
 =?utf-8?B?WXY0VnAvM1dzdnJ6UHptdHd1WDBwb29PbVRzenRwMGhaOWwrWnd0NnJLaGc5?=
 =?utf-8?B?NjBaVWJaVTRMRDVpMDNnSzkyZFRTVzJvT25VQ2tDTm5UNFFWaFc1RUozOGNF?=
 =?utf-8?B?N0FnSklLUHlJYTd4cHlrV1FDT2pxcXB3TUc3MmlKbVNHQjVCeDdLYWhUZmhT?=
 =?utf-8?B?N3AvVG9NSmtNMzBuSTQwNlF0NjNrYU1qVnExR3V6b2lSdWdWRkx6WlJtZVRY?=
 =?utf-8?B?NU9ESjh5b2J0UDdEN1VTUEZUTWg1ZjhlN1BPVlI1SUU0QkhuV3llTmJtODFa?=
 =?utf-8?B?T0RLZHhoTUF4WGNxNU1rMUNwUHFGSHlHYWFCWlZ3L2NpZzNodytxSjZaRE1i?=
 =?utf-8?B?MFBPTEM0WWtKTFluOUdoOUNLTS81YUVyK2JYK0VXcE5tWmdMbGQrbDRyOTJH?=
 =?utf-8?B?ZXZsbEE4cSszeEJ2Qmc1aE9QaGwzTk1ZaGRHUThjM0dZS1QwMjFyUXhJZi9V?=
 =?utf-8?B?c1EyRjJicjJWSVFuZi82UlB2Ri8vcWpKbjNnN2tpOGdsM0dmTE4wYVB4K2hi?=
 =?utf-8?Q?oB7QZ8FTACIB1jNNgn7vlSxo8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3ea0fc-4e19-4d13-0b3f-08dba3a99138
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:21:28.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zpn5xO90iSdEqlf5oiTO/aaxlZDBx1+XjQTxKHMIlOz2mRwVYQPk9Xce0z4V4nl77Q/08P4V+Y8SKocdAi7k1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

Two entries were left in place by d638fe233cb3 ("libxl: use the cpuid
feature names from cpufeatureset.h"), despite matching the generated
names.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Permitting "psn", "ia64, "cntxid", and "perfctr_*" when the hypervisor
doesn't even know of the bits (perhaps wrongly so) is kind of odd as
well. Permitting bits like "est", which the hypervisor knows of but
doesn't expose to guests, is also questionable.

I wouldn't really call this a bug fix (the entries are simply redundant,
but nothing bad would happen with them there), hence no Fixes: tag.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -260,7 +260,6 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"clfsh",        0x00000001, NA, CPUID_REG_EDX, 19,  1},
         {"tm",           0x00000001, NA, CPUID_REG_EDX, 29,  1},
         {"ia64",         0x00000001, NA, CPUID_REG_EDX, 30,  1},
-        {"pbe",          0x00000001, NA, CPUID_REG_EDX, 31,  1},
 
         {"arat",         0x00000006, NA, CPUID_REG_EAX,  2,  1},
 
@@ -279,7 +278,6 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"invtsc",       0x80000007, NA, CPUID_REG_EDX,  8,  1},
 
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
-        {"btc-no",       0x80000008, NA, CPUID_REG_EBX, 29,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
         {"apicidsize",   0x80000008, NA, CPUID_REG_ECX, 12,  4},

