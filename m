Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A07F76FA17
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576872.903512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoIu-00034f-WE; Fri, 04 Aug 2023 06:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576872.903512; Fri, 04 Aug 2023 06:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoIu-00032w-TQ; Fri, 04 Aug 2023 06:28:52 +0000
Received: by outflank-mailman (input) for mailman id 576872;
 Fri, 04 Aug 2023 06:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoIt-0002sK-Uk
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:28:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d461186-3290-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:28:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:28:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:28:49 +0000
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
X-Inumbo-ID: 2d461186-3290-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAwIm7t/p59NATT5GUxBa9UY5w0LT4rTpdYOEa53UMmsA2s8IKTmjW0xuwCL3ItYin2skl8nymY+IXDC/ce4h5SdzAuf9n6xWb7nI8JoqlpBEV8k/Sl1Dqj6l6Qv2rowMIhR/b0skKmRnJOw1IP7tdQRE8c3i5cMwiVdN+qwkEpvDToCzmzgOgu9qHGkwOojjJem6tbzTiC/xHRy7jDLNkwTpgi1jgt5xEHSbvlJdC+Cu6cgIxcqftgCIXNf9E+ogGlsxbyqLnx2mMa+6giErBTYFKTAITnVY+HoFjcXCrzdX8gOjtqNydxxcZrkMZ9Gnn3HuoqHRv/HBL+A6L9obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bblEvpBVoD14a8jtWBS2FnTxPcXC/Rz9Fz+d/NPUWJs=;
 b=HBQirrIYTFNN5bX/rVpT/Aq/D/U3MkowqWXWtTHJSwgRtz/wa6bYNOtlHVWr7KcoeW1fTHL+Qa3VAxgWbgXLq4xS1OKiKOxwVMKCbudVA4RdzxJ4SsIq4S7+q5O/sRvxj6pdcR2I/arho/tJ4EvO6wizdhnHu/sNUpd3yAB05MdRqOKp5/zkOCcEa4haoAVnud+D8Mo2+9fTOh2soZ4nPzeWiSpHVq/Ea2tOD5xSJgy8P341hLsBjj81RKdPNgf9NPSarCA4ZBY6zKHaeyl3lLquYjVAeH3zqxXu4cj9R7/2f554XeqTr931yU36kZQmDMglfRWYkfaETf4RkgGQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bblEvpBVoD14a8jtWBS2FnTxPcXC/Rz9Fz+d/NPUWJs=;
 b=va1cqj3Wc5A9jHdzwb1Ew58MsL/7SPWWxkIgtdU6eAQNnu4yzid0VeU0DKZ892QAlPI21UcAd+kn/E9CI9UzcCkmSU0EvmqA2x0EHGS+OgQjhdXZVIxk+HHTH0z5aCtUwbj298Pv8OV6eAj9tnWN9eit4jcte69bGtyr99dfbVglI8KAeuX7H9+gaziyxb/7YoJnrMaKJEKjyJuCP3b8o8gI9IGt34SWMs/J2dV92NkgYgPqpFENWmpFtEhkMdhgQSkKwiajxNWgYd5yIKk3Yr/BAd1NdZEbdzHcG2BfqHlDTgTb7WYMYW9RIzPoBS7WlN4pWZ6zCH63NzbrwpTbjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7685fa0-62e0-98b9-f9ba-7e698fb7373e@suse.com>
Date: Fri, 4 Aug 2023 08:28:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 4/8] Arm: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: b92fb431-0328-4079-04d1-08db94b41093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C9KNJo03jiSHm2NtZc41XT+yy7OFz+SSzThnYQYrw3S294auz+cVPllf9k14OQ/O110gNK0JzkVHxEumE0YkEyGW80lJVctPsFoCPidlJ31PvuKGcmtVjXypbvxHMaBx1p8evJy4mIiWKxfc5uT9awUYe9XBXUFZhKY86v3BC/9Ba8dvhucp3hUOC036rJd4Fj+LDuJzacEm3Bafod20SBUyTHYxdTnAshtZVk9Pk97NlL19kA9BMaanBvUocCZWuKKJv4xeVSiuMaTWcNIv03kv9ny6p7embBCTlFFKMMwdjhxlunWB9bd4wldhZ/7frOwZvoadJMWCPg5zW1RGoCb8v41y0bZRsKAWwrW12MH1GE2hmxqKntL0br15nt4AvKOL7xMyMPK5UZ2mzZ9gJHoUSyzkKMignxfBSF1FTdmto4KRYXKpJBAg6s33fVA9OSs4v6xgc8rHHQLGdnO9GT2SiES3t2LW6KTt0YCxv1BbdmEEOWaaC2bu90bv9hRmtvSdmDJ8F8eNkAziVEpwNIHOWSUP1Tv17nyQj1pawL+2BguwDF4oOTqtD9jHamO9MJyLJExx4AiZ7zk/LoKKIH9PpGxFUNM8EL5WaEvZ6L4W4YswCsImD+UYzTwNc0nSGYg2YYp7XXf2t8kDOd9gHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(6506007)(8676002)(8936002)(31696002)(54906003)(6512007)(6486002)(478600001)(31686004)(38100700002)(2906002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d09RM25UZlRYSTNSZDAwcEVqRHlEdlU0QU8waGt5QnJPdi9pbGN1N1B0WUg4?=
 =?utf-8?B?bHc2Z0Q2SFY3YVBmcTZGUVZ2NTVrblM5bDNwczBmcnF5SkZiVmNZNzlaZnlz?=
 =?utf-8?B?QUVmUEg0ZHIyUHMyTjdnZGxoaDlGdjBmVVV6Vy9iSDFySlhiWXlyRWpQTm5k?=
 =?utf-8?B?WWVIM2pJYXhWNURhWjNQYnVJTjRFVk12ekdFN3diZzdnK2k2aFJlMWp4S3o2?=
 =?utf-8?B?THUwRk85RjNDSCtKZ2QySW84NjAxN0FtOWhuOTZMNWNxL0RudFBRcHp3d1lL?=
 =?utf-8?B?aGpuNmQ5akF1MVptM0M1UlRRTlhUVDBxLyt2TzVqa3graVhudmlobG1aWkp1?=
 =?utf-8?B?N045QzJQNTQzMEh4MTBrcFJvUnlCaXFhcHJBbVFzUVZEaUFWTDZYQWN2OGdD?=
 =?utf-8?B?TFFsOUlIZW1zWmhQWmRaSVczSzUrTkE2RVRPUjNYbUwycmRvQU1DQmtVMkpK?=
 =?utf-8?B?bmtTN1ZtbkQ5aGw1RTE3MTdQZHpnTUxkakVqOXY1akxIUUNPb1ZPT0szTVZY?=
 =?utf-8?B?UUhuMmk5WHhzd1dJdDhmSDhsS3NuVmoyVDErcEtRbzdDQkljT1JmZy9HOFZ4?=
 =?utf-8?B?UXVsczJ0bmh4NUp6YkdhRTNXRHdHLzA2UllzMWE5UEFsOTUzQ2Y5bklWUnhp?=
 =?utf-8?B?RElDWTdGRnVVUzl5TVc5TjBOSE96ODNSeEp1V3QxYVJJT0lkVUpsVEJZMGhO?=
 =?utf-8?B?Uk9ZTk1lZXdhUnprbi82bHlGKzl5R2dIeEFpYmdHS3EwdXMzSjZCcnJ1eUVv?=
 =?utf-8?B?RDRCR2xKV25mVTlxNmF6NFJ3SGd3dGs4OTN2RmY3b1hNdS91cWM5a3FvaC82?=
 =?utf-8?B?RmpzTE54K2diNEREUG5WOTA4RHFYdHA0Kzl2SzMvOWI5SjhuZ3ZYUjBIN0pK?=
 =?utf-8?B?TUtzOGhSVTZWcHFjRFhrSVo2RVVZWVJFem9qeWIvc3p0QmIyMWtaM25qZy9F?=
 =?utf-8?B?cHZWek9YRU1EbEF2UzdHN25yU1ZlSHBSNlVZRTYzVVAvc3plVFRIN0RSVmxN?=
 =?utf-8?B?eGRWbTQzSW5PZDdQZXZlQnF0LzVvdkNUSWJHUUdEbHpFdXRCOUpkaFBsNGti?=
 =?utf-8?B?T1NodTZVVU1GdzRreFZENFBqeVpPa0xFcGRWKy9XdGkreng2bzh1MURrR3Vr?=
 =?utf-8?B?UEx1dm1xdS9NYWpLdU4weHlNZkljUGRwVHJYK3ZlSk1KMmUyYk1WSFFNdW1Z?=
 =?utf-8?B?N2VCZlVSRWRJd2NlMTN4akorYmo1QzJ0UzUweHBkSFhva0RIdEdRall6N044?=
 =?utf-8?B?aE9Qc0FaeThqSTlDSXdKYnV5Y1NBVVJwM2tndG5sWFJ3T05QTUkyR3RQU0Yr?=
 =?utf-8?B?eE1JVFVFUmk0SERqMFc4VW00L0F1aENJODYvZG56bzlLN1R3c0tNWlRLNHJK?=
 =?utf-8?B?T0JsYUxBY2pwb1k3b3ZLdzBuTVhPRDZsOXBRVTFrRjRUWHJ6ZEhCN3p4d3hF?=
 =?utf-8?B?bUl3VVJWQTNJYjRKWEgzYWxOcTVpOG9VUlB0TXpGYmQyd2RrNS9kTjFSUlpG?=
 =?utf-8?B?Zlh5NGUyMXFUQlFyWWdMaXMzb2pCZERwZ1R2RlVELzVxcU9GTDJpZ0VuRlQ5?=
 =?utf-8?B?dTc3dDJ5eFFwNmcrVGxYY0VQS3piMHl5ZkJOQ3lEbzlSbks5RHpaYWpDV0ZZ?=
 =?utf-8?B?OUY4aUU3aHVMNTF4aTcrQzVkZEZpTGJUeG14MXAwOENyclpPaklranZQWURY?=
 =?utf-8?B?OUZrRC8zamlCenpwMElMZUhkSjg1RnFGbTE1T3Y4ME9FVHM3eGd4Y3ptdkJS?=
 =?utf-8?B?UUR5OFV4STBqOEFCOExzV2xOM1FjSldBa1FGckR6b1NnY2VOaXhwZnZkOWdP?=
 =?utf-8?B?ZUdINmtFQ2pUYnROTlJwZHNLRml4RnAyTTlpUFJMZ2l5MVgvYXRZRXpoMzln?=
 =?utf-8?B?RlpEc04yNGpFbzFBOUN0VWRsWFpOVUZDWUJLV2J3bitMQVp6SDgvdE1sc0to?=
 =?utf-8?B?L0lIMnhoWVpTVU5ra2RTVzQwOTJBdWcvT1FxZ3NOeENyTUFVWHNDRSsyN1A2?=
 =?utf-8?B?T3Vod09xNmpPekVmT1NYTUlqSGU0UElvb0l4Wk1RRGd6US9UTHR6bFY5Y3Vw?=
 =?utf-8?B?V25sUnZVcTlBN0w1cThuVnJYYy84VTIvS3lCdlFObzAzOHh6dVk0VXdmQWR6?=
 =?utf-8?Q?uhpC8/RkJYPFmwCTMiCnNNtze?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92fb431-0328-4079-04d1-08db94b41093
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:28:49.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ODH2L1NH/UcFL5Q8/2ygdm4sej1aI6yGeWojn4fVcYJyr8TpZJSqmEkNlRY8Jon7/uEUS+LMjxzM7RzOUJTpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

Use the generic framework in xen/linkage.h. No change in generated code
except for the changed padding value (noticable when config.gz isn't a
multiple of 4 in size). Plus of course the converted symbols change to
be hidden ones.

Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
use site wants the symbol global anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Only one each of the assembly files is being converted for now. More
could be done right here or as follow-on in separate patches.

The ASM_INT() redundancy of .global will be eliminated by a subsequent
patch.
---
v3: New.

--- a/xen/arch/arm/arm32/lib/div64.S
+++ b/xen/arch/arm/arm32/lib/div64.S
@@ -42,7 +42,7 @@
  * Clobbered regs: xl, ip
  */
 
-ENTRY(__do_div64)
+FUNC(__do_div64)
 UNWIND(.fnstart)
 
 	@ Test for easy paths first.
@@ -206,4 +206,4 @@ Ldiv0_64:
 	ldr	pc, [sp], #8
 
 UNWIND(.fnend)
-ENDPROC(__do_div64)
+END(__do_div64)
--- a/xen/arch/arm/arm64/lib/clear_page.S
+++ b/xen/arch/arm/arm64/lib/clear_page.S
@@ -22,7 +22,7 @@
  * Parameters:
  *	x0 - dest
  */
-ENTRY(clear_page)
+FUNC(clear_page)
 	mrs	x1, dczid_el0
 	and	w1, w1, #0xf
 	mov	x2, #4
@@ -33,4 +33,4 @@ ENTRY(clear_page)
 	tst	x0, #(PAGE_SIZE - 1)
 	b.ne	1b
 	ret
-ENDPROC(clear_page)
+END(clear_page)
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -5,6 +5,7 @@
 /* NB. Auto-generated from arch/.../asm-offsets.c */
 #include <asm/asm-offsets.h>
 #endif
+#include <xen/linkage.h>
 #include <asm/processor.h>
 
 /* Macros for generic assembly code */
@@ -28,10 +29,7 @@ label:  .asciz msg;
 .popsection
 
 #define ASM_INT(label, val)                 \
-    .p2align 2;                             \
-label: .long (val);                         \
-    .size label, . - label;                 \
-    .type label, %object
+    DATA(label, 4) .long (val); END(label)
 
 #endif /* __ARM_ASM_DEFNS_H__ */
 /*
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -53,7 +53,8 @@
 
 /* Linkage for ARM */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 2
+#define CODE_ALIGN 4
+#define ALIGN .balign CODE_ALIGN
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
@@ -61,8 +62,6 @@
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
-#define END(name) \
-  .size name, .-name
 #define ENDPROC(name) \
   .type name, %function; \
   END(name)


