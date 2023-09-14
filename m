Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681B87A0767
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602318.938815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnOX-0001RG-OF; Thu, 14 Sep 2023 14:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602318.938815; Thu, 14 Sep 2023 14:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnOX-0001Os-L7; Thu, 14 Sep 2023 14:32:37 +0000
Received: by outflank-mailman (input) for mailman id 602318;
 Thu, 14 Sep 2023 14:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgnOW-0001Om-8z
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:32:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b18f1ec-530b-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:32:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 14:32:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 14:32:04 +0000
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
X-Inumbo-ID: 8b18f1ec-530b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3WZ0xVPWb45mcwJEDmdFt2qQUZPHH34+vcNYfhwJR+BFi5nTy5YNpckt2JgasWDB4nIwKSf5clnZW6MURcfBSV7KkoJslP0eslVLdNhP/dR9quyrHVdlg6sTCpUJea8OM9Msb5fz1bR6enbT8cipHtN75o7NQCtnZBpOR+zwlmKoC07SZNhDnO6ZGzpOscFPKMoHUsqzOTEcOSsaAEpRjMSZJ2KLGvtafhvYqRLybL7/V72wY5jUBgQIPaKEWLmQgCXA+7ozSveaF62HQBsxVxez9h+QfosjnNvOr7CPWLqbStl7CMUvvXw94+sSJaMgffet7yyODSFbDDfFRZFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOEq8i9HTQF6kGAQWG9si/GkDBn4LNSFlY9R4GX6KqQ=;
 b=dbOYBN8GpTGJk9npcESMUCFP6hMng5H9lJLzUjYR9OSYo9EOM1wTkK8I+iskK/hweVtvdR+DNntFkLG3lHxqK8KkaHjPu1krrf90rx9QukqMzonXJNQ2D48b/2vWYf9AYe4M9FVITk7yiqzNQbs0Ywe+Vz4yG/jgfoTwCfWpyXCFPRYNgUmMDV4Ph6GI278wY5HXiMvVKE8ktDQkrIxltJNF7ZIRWNU6eNVGYi7BZBB6jrzQfmjAGDUufpI+h8yZvS2mwbt5rIVonvq5VjLQELkqK+qFxhqFd18tI754O3gq7j/4jdicyE97X8ZJJO+9Qc1GlvoZLeHC9H6eF3lGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOEq8i9HTQF6kGAQWG9si/GkDBn4LNSFlY9R4GX6KqQ=;
 b=kDbYQ2sf7ba6B/4IBUdx1/eUqBuqbBEZBuqJefxMIdB5DBGkZCURrIeRuximeIrkUdltZyyzhzMtRGSErIj6eY5bvfWdJl0l3ejeodAcF7evf5GfG+rnyHVZQPVA1bSGdb3CDq7egNXYjYZeMwFzbrLND/riF4ehcEU09InUWbfv8Vtb5H/v7dDQiPXlpbD6XrWveXN309WIRPcB3kNWpFdyTrF2eVNznwzd+bwQQ6FZi74YjgnQsTFI0C+O+W89KgZi6pOYSaq8eyxDDIYM9L7D5YcFrSOiV14mBCkzID/rq1sEaCRlasHGezCY2mhfdO9sEHzasbUiknnbi4GHcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11eaed0c-69a0-60de-43ab-55d50c981ffa@suse.com>
Date: Thu, 14 Sep 2023 16:32:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] timer: fix NR_CPUS=1 build with gcc13
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1f4a63-c4ea-44c3-3e6c-08dbb52f5db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	srzufdBzWZ5QHcrfzVk/Fo4ufRVmbpEpWaRlOnX6xK9uskgLOR5ts9yw1hCGiuY0HUsBAryYcfizExBmZK41jnttQHGj83+30fxGXOgxV2is0Jd0KFmY8Czv57pydtGu5DiSkcayW8CH0BwaUz0FM7nIVZ4N64g1XaDuqp4sbg8xRVv10Dmp3Hs8/xQPxrpVwnP7DxHGthAIjhygvf6aU8E7W8YNtBCC+NF/bjCkHYFZ9IhvDt/Ir0Sa6nge79dWoBhQafXNqOgDVuYXYL0BpK9PlAT9GHTvTtEqtmac/Sy13q166mmWWF3f8Vj7OtH4Sl1qeO6YfkQ0Bu7OWAwApQnQZ00GUHzGMpiGcnqtAsr3KGHfbWEYgKRjwzyzUwzhXor4pEU0MBzqouXFwMxgVzjKwsVRKmNKssQppPG862/Z0AfOObyXI91hN1k98wHZCCqX3uYIGWa8cgTIVDINoY0PbVaPufOyNWIck+j/XIK3a8Gme8hSWP9P1++X05+ctRNsAbipd/JTybcrrRjiHkeEOisE4j08zwZDiibIg95E7c96fwUi0UvPo3ZV/reGJCCXOfhZKyEQ1vqroyhJ6v0R3ULSgVRTmuc/Th5yx1cxyEEbEXPL4bo4jllEoEMUqp7IlOHQJWCorKxnUj6cbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(186009)(451199024)(1800799009)(31696002)(86362001)(8936002)(8676002)(4326008)(5660300002)(2906002)(36756003)(6506007)(6666004)(6486002)(2616005)(38100700002)(478600001)(26005)(6512007)(83380400001)(31686004)(66476007)(41300700001)(6916009)(316002)(54906003)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3BsR3RqZWtMa2tRZlpGSjFBQ0Fxbkg3NFR5ZGorOVFQKzk2QXVDcnorN3cy?=
 =?utf-8?B?VUZDMUR3cmg5aWNobzV1LzRzWGEzS3hTWGswTkpYMTdUaWJIZ3NYMHZJUENy?=
 =?utf-8?B?dWJGbmVQOENtMWZUWXYzL2Vid1EyU2VzOWhXRFVRN2lERG9jNlZDRzlRdFA1?=
 =?utf-8?B?TVlkS3kyQ3lMekVjMzFyZ0J4RFhpSDNEVlYwWDVZVEZwRCtmTW13VlplQVE1?=
 =?utf-8?B?aG5EeEI2TEVZU3FYaS95dDUzb3MwaWxyek9sYjV0R1hSZEhxeUpGMWIrUHR6?=
 =?utf-8?B?ZkpEQlBNcG40QVppbmJ1MU50ellUSHMvNlBQK1Y2eXk4eXEvN2hVWG9IUWVk?=
 =?utf-8?B?VHRDaWNiTDNvRHBsNU1NR1NlQWcwakczWVRyWW1ENk5PbDVxWUUvV2RnYXJ6?=
 =?utf-8?B?c2xNTWNWYnE4MzkzT2JPSExDL0J2MkpJQWpYUzJEMHFFMVlSdmRmZjhxZWcv?=
 =?utf-8?B?cEU3WHMzY3R0QWNrTit5ak11ZnZZS08vb0M0TzU0ME9QbW9vWjdZOXNGQVJw?=
 =?utf-8?B?UExtVlpDRzFGMVhJeGNkZUlVM2ZuUFRHNXVERW8yeFJTL1R5NzdFVmtqN3Vq?=
 =?utf-8?B?emhZWEpjQUhybUk0Ym1yRjl0YlZoTEdFUGRkWnZUZXJFZ1YwR05jY0IvTlVT?=
 =?utf-8?B?bzBVa1p6SmcxZmRzb3BzOWhsbkwvblVibWd3NUVxUDd4T0NJNSs0ZHR6MnZ6?=
 =?utf-8?B?MEdmYWhReDRzNHZ2Wjd3MUFKaVdNelVZa1ZEVEJuN2JOTktKSkZ5aE1MUXhM?=
 =?utf-8?B?bFBoZkVpRTJ1ZVI1bllhTEdtejdoUGhmc1dnNFNXcDU4N25CL2hjNGMzMFFx?=
 =?utf-8?B?K2t0RXRzZEJiSGNOWWZqcm5IRlptcENHL3VUa0todlpRK05DSmdFdk5VUTdM?=
 =?utf-8?B?VkhQMUs1eEpTTWRubmxOZERDWDFwSmlJckkxUFVCOGF5aUxKYlVsNFlwcXk4?=
 =?utf-8?B?QjdDbnM0ZFFPOVlLeHQ2NGVGZnFFV3ZGMVlXVWFJa3E1b1hlYnZDVkpiSGM4?=
 =?utf-8?B?dUNNMW5xZlUyWVZIcjk1ZHA1MHl1T2kvMU9YZlhBcTVNMUhtc0VtbHhtbW5v?=
 =?utf-8?B?KzNaS3BydnZaampya2Y3bkpMNlNmL21Db29SSnBGMHJabm91UzgxaHRMRlZF?=
 =?utf-8?B?eHorTWtqamZRc290dWEvY01SUW4rZXhjQXRjbnRlVHpHUm5jbDJoREFMVkdI?=
 =?utf-8?B?TC9sa1hJc3g3dW1EM1dHcnlVUFFLbjBSSUVTako0Zld6VXZJajJwZFlmcG1Q?=
 =?utf-8?B?RmFFVXFycDFXdzdrOFJoZWVicWhpMWxJKzAwQzIvLzhOSjdOWkV3RG1lb3ZD?=
 =?utf-8?B?c1dDbGRpczcyd1Z1aXVRaUs1WHhTdlp5MEhqdTN6TXlidDY3Ly94SGEzUUxJ?=
 =?utf-8?B?L09kYmo3OTVocVhKb3g5YUcyWGFTa1lQbUROUVZjS0luSUlxd2dhd2ZkZ2Ru?=
 =?utf-8?B?QTJyRGxNQTJzalk2SEQzREVGZDk1alJvWjRkVWhrMWNlUldzYUttRWpnVjM5?=
 =?utf-8?B?end1b01CNmNlajFybUYwUUhFMlpKTXZNS0JaS1lsaGk4TkM2aEVKKzM0Z0pp?=
 =?utf-8?B?WTh6Y2hKalBiNER2ZDMzWnVFYXBFVHY2a3h5VVJQR1pPdTFSdFhCdmJwRDdU?=
 =?utf-8?B?OU9DYlhhVzFmYjNqV0F3SkdGYm55SzF1TW4wZllUcmJmcVNhWGNUY3kvUVhV?=
 =?utf-8?B?b2wwWmt6alBJUlVyM1ljeTA1RE1HS0VrQUxJR2xmRmxncXlkUElQallqV3Zo?=
 =?utf-8?B?SnpnWkZ6SE5rUFM2dlF4cUJFMmM5Nk9vamU1WkI2ZHJBOUFReDdDY2NHbFRZ?=
 =?utf-8?B?V2RYRzRmbVJSak5SM0VhNFFjU1RYLzZJZFJMZWYxVUlhbm84K29pc1FjOVJV?=
 =?utf-8?B?RmRzdm5ZeWdlTWhnWXdvdmJ6S2dvZVE5N0hNQzc2c0ptYXVNSDNxMWZYSXJO?=
 =?utf-8?B?NU1jeWZBeXpVSFJmOTlkOHg5R1BtS1h2VDFwUVlZSjV0ZDNURlVpZWtycFBy?=
 =?utf-8?B?dHdPQUVBNGNlVkZTeVkxd2ZZY1A4UFlaaUcyaVduL25yd3AxYXNHcXRueHpz?=
 =?utf-8?B?TjdJRnkxUWl6L3JzWVhKUVZMK2oxWU9FM0t4VHByNEVqcUdqUklPeWZnRFlR?=
 =?utf-8?Q?/LFEPRXY8pDoCx5a3NqnoTd23?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1f4a63-c4ea-44c3-3e6c-08dbb52f5db1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:32:04.4080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfw5qEa02+zfZLu4D0+aWxULwJVarxHyC/rfnj9mupgi6+4k/6yTF1gZV0vhI3ojZ1cRux3hBT01cztUdkrFtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412

Gcc13 apparently infers from "if ( old_cpu < new_cpu )" that "new_cpu"
is >= 1, and then (on x86) complains about "per_cpu(timers, new_cpu)"
exceeding __per_cpu_offset[]'s bounds (being an array of 1 in such a
configuration). Make the code conditional upon there being at least 2
CPUs configured (otherwise there simply is nothing to migrate [to]).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Warn if it looks like an actual migration was (bogusly) requested.

--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -357,6 +357,7 @@ bool timer_expires_before(struct timer *
 void migrate_timer(struct timer *timer, unsigned int new_cpu)
 {
     unsigned int old_cpu;
+#if CONFIG_NR_CPUS > 1
     bool_t active;
     unsigned long flags;
 
@@ -404,6 +405,11 @@ void migrate_timer(struct timer *timer,
 
     spin_unlock(&per_cpu(timers, old_cpu).lock);
     spin_unlock_irqrestore(&per_cpu(timers, new_cpu).lock, flags);
+#else /* CONFIG_NR_CPUS == 1 */
+    old_cpu = read_atomic(&timer->cpu);
+    if ( old_cpu != TIMER_CPU_status_killed )
+        WARN_ON(new_cpu != old_cpu);
+#endif /* CONFIG_NR_CPUS */
 }
 
 

