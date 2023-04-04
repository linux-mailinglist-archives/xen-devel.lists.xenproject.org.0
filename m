Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B3D6D65B8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517904.803882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhyC-0006s2-2D; Tue, 04 Apr 2023 14:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517904.803882; Tue, 04 Apr 2023 14:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhyB-0006pl-UU; Tue, 04 Apr 2023 14:49:11 +0000
Received: by outflank-mailman (input) for mailman id 517904;
 Tue, 04 Apr 2023 14:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjhy9-0006pZ-Pj
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:49:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d99ae6e5-d2f7-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:49:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:49:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:49:05 +0000
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
X-Inumbo-ID: d99ae6e5-d2f7-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhNa3gQVqEqVWOn1BQiWAUkMLvttOvoMTYXO6hoFgS0pyVeMkKly/otz5kRIMRz0WZtPgsKfRWB1KV1eJD4aGGzk4g8jHwXW4gBdhawPpYOC3nHZnfGvBuT2dnzkw60kJEz2EAkKsWFUqQicHtfT4zGOxwtlkwgYzz0z+6nCNztdv2wqFNOidDUxQ23Y552pThpgz0crjXFAtgzdjSvgxgrOnRuZStgOEZqNWXZfE6/1K8NHMg9ZiZn/0xXvcaSO/r2pjq8BZgmoM4FiRcI0i5j7sDEPQbYVh3BWdeF2ae+v3L68XHf1o5owZQO2CPjYwKgABnjPDmiuJ41TW08vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gpGtiRKwEgaAgJAWR+acZezpCQEWfuFPhZDqqfukzE=;
 b=lZtQDbpvs4EEYH9MHKzoQHu/gBzR7BFyLKl5iU7wsxqx19j+/KNIJNHJ0W9Q1ziByIefiYPK5Ze70vGK9Uo+GkG5/fNcYU6UO5OpEAI5WSidJpR8nKBhk6yvaopf6UZeG8CtsyGEXk6qWiMD828tIBijfUQ76oViF4+WoIgUMEPAeuYwxuikxXEZVJtWCZBPsBJMVj9pVSu1H77n+w5Rb8CuNf5DeByMDTMR6ZlpZ1nsBeIEh0pOZIijHHezxGCl4Nvc9qjnaQKn08oV10OBFBNkoz06BO+ZKJQOR8mbVo8kEbxra0xPT+bu0DgaQ+Q+tkdgx20ZTdzS0RcDiqcf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gpGtiRKwEgaAgJAWR+acZezpCQEWfuFPhZDqqfukzE=;
 b=cPOsI1bQRTbggibijwxFPtr05jC7HHOl5FaH6GijrFXx5PlPBjkX7Fxk/Tc6dKYf2v2U+kxi7hQwDzse3SjCWH3OmpDPscm/H0TA5FRLRMmnERC4oubIgwCRah2DrLLso2TDTNP/RceqTXjOzY6L5SZw3ELqErtNdmOeKtL6SfIa7cXrpdxbTRxv8v3GJCqR3USJCKjzQCV5kltJ7V7WyN09QYUUsTjx8xBusaoBaUgVHXvUEld1kMYoWOacnsd6Mx2O3stSvPlfOaW3kFap+rohcDTeuu4GmhXavGeHNGXoOYhV7IjevwZeHWDR/xGp/vy432vOjHln82fOo5dVSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1eb21ece-9d33-d8e1-1c2b-c682dbb1cda1@suse.com>
Date: Tue, 4 Apr 2023 16:49:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 1/9] x86emul: support LKGS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 809a8e30-a5b7-4f0b-85d9-08db351bbce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	//iGQc3JQ14jAqruPERNrELZL4XVtliVGJWs2Hq1qm1r5FkyLDs0yLSFuYeig3PdGCoSH2saEFo2xArk4TsmqxiS2na7i9FAbFVV7PjYA+OaVzgT6XJjpQZjBNr61dxn6bgYTAjf4vRf8CPaE1WgRknYd8/4rmhuTMA+59+qFY/GemoVQAWlITIwcQh2FyZ69JbF9mr5x1EewfbaQWpsG/q4s/+5hs1MqTAadQLVrEIC9Ep3thReE38wzQAOZOB1OQN0Nlcgf9wJak/TBoLSbs7X0d2INLt/OmVRyRtz9hoMKqHS1zpvCWBoR6Ou/CUvCDSNjzqlBwpa3NPfchOlapq+GwlBR6bQRhkNBFGG372BIGBQbqQb7K7r8EHnuIXwrfwV2rK5Exi6G1xA1Ji8oFlcPJZBjhd5OzuOZU7XntNsTxz2BaMG7MWs7+3KGMBTPDt9FxbwWKiSKhWYX/JTB3tg2PvEjjJteFw6lqMAmWHnX7RK2Vh2YjbYQNXQiZ2cobC3D2mgxssYOIlZRCXE2F4mWVxwZmOgl7yOpmazv9wDMgQoybBYJY3IriMnefwAzE6nbakIjOTvAfNxmIU5MXMh1w+pP6tKgA/gq4/Lnu8MCZeemS3HGi9Fg86rViUhGEM9Fa8/Qacb1EBODdBotA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(478600001)(316002)(54906003)(5660300002)(8936002)(36756003)(86362001)(31696002)(4326008)(2906002)(8676002)(6916009)(66556008)(66476007)(38100700002)(41300700001)(6512007)(6506007)(26005)(66946007)(6486002)(83380400001)(2616005)(31686004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QldCMmZ2aC9mWFdTZXJvSHNoWGFvR29qdFA0UnNTSy9BZzBUS3R5b2pvdTVr?=
 =?utf-8?B?WEsrOUd6WjBuZnpLb1UrcElJNW5vMHRFMzA0dERwOWlxR0NJQk1kVUplUEhX?=
 =?utf-8?B?UkRIbUtRUC9hSzFGV1gzZVFka29BQUNrUTB1eVpiZ1JGaGhxVFYrbHRsU2ds?=
 =?utf-8?B?bXVXSElwdUhsby9tazVFdEd3RFozVW13OTh4bGpGUngyb2NjdExiK040YXdW?=
 =?utf-8?B?TGUrOXhvcjFUaUZpSDZ1cDJjZ2xsRTlQY0lLaTRxeXdrRnFxcTMrVXRSdG9Y?=
 =?utf-8?B?WkpxdHBCb1lHVTJxNGt5dWU4L1FKMWg4VWlhZnYrUXdjM3FQM0V5cis2d2hi?=
 =?utf-8?B?M1A2U1prdXlQYXNEMkREOTBOMnF6cTNWemRZRnFoWEhMaDJlS3lORXA5Nm54?=
 =?utf-8?B?VlZpby9zcHlqNk5aV2dVeGdhazBZQ2o5UG5JcUtBcGxIM0hYSURQUWhDVUJz?=
 =?utf-8?B?WVdBcnRBMWRDd3Q4Y0lwbHdqTXhTSVFtclpPZVk0djU3RGNCcytIQ3l3SE1x?=
 =?utf-8?B?WE9GbXVKemlpRktlRjlKWHNqVzhFOWpqU1N5OGswRXR3NDJNQmVaRlN3TWFE?=
 =?utf-8?B?NklwV0V6Z01JdEFBK2x6VUNaV2Qwcm5lV1M4aG9VRzJ5cU1BaTkyeVMxU3lx?=
 =?utf-8?B?SFFtU252Rmx4c2lBenhFaFg1ME40RTVFeVk4enZ2WFk1YVcwSzViWkRUWmRR?=
 =?utf-8?B?Zi9waU1aNEJOUXRzSlZWYVRNVEgrVXphWWl1U0xQZyt5ZDV5T2l3RXh5ZjQz?=
 =?utf-8?B?dUI5dGdsKyt5aXd4M1ZQNlVEQ3lrMXp4K3FPRVZZcEp6YzU1MWF6Z3daZDlq?=
 =?utf-8?B?U2tJZTVTSTIxb1ZHMTV4ejdjQUlvcm5QWXpSTm5sUmhUQmwrNzAvTzdiU0pZ?=
 =?utf-8?B?UWVFZU5CMWhNWE9zd0dWNmZERWtJZmFHV1ZhT0U3OE82SHlLZjArSHRzQm1R?=
 =?utf-8?B?cE9FMkwxbXZzWWpROC8rY3JwcWtqeXFpZmFQb0hmZzhYR0NIeEphVFRiK3RB?=
 =?utf-8?B?Y2c4bWd1VFA1Uk8rYlA3RDRzQXVlWS9Fditvdi9lTThWdmNweHNvdEVmTWJ5?=
 =?utf-8?B?OVFXNHZrNVU5Q3B3R0RBSkkwTGUrU29pUFRaeXhiQWlYUkV6dEpndlhGWGlr?=
 =?utf-8?B?V09kVDBiQTFWcTcyeDZvL3Z4ZnhvYkdmZlMzc3NoYlloTHZHM1V3a29MV2du?=
 =?utf-8?B?cnk2VExLNk95NDd0bmQ3WGNtdjkxb0tJQWlWczhablFsdFB1V2FGaTVuVzEz?=
 =?utf-8?B?cXpwci9scFBydVV4ZG9xK3hQd01Md2t0anBoTTBFYzZxa0hmbzlLUEJhQWJv?=
 =?utf-8?B?dG9IUU5keFBhQjcremRLeGlxVngxOG1SR0dnUVFLVmg4c3FLWHNJa2tIZldE?=
 =?utf-8?B?V0ViSUJjVlJDRERtaU5lMlFMYVJhN1pCUjVmdm9SbEtQNlA0TFhHWXc4eVF0?=
 =?utf-8?B?RXE5OUUyRUtKVFJ3Nm45Vks3N2pZcXdpTEVnNXNNKy9NYmh5dXZuSnNVTVFE?=
 =?utf-8?B?Y2pRUkFpaHU4WGQwMnRtL2VLY1ZpQnUyak91RTdsbit2T0wyL0oyZlN2TzhP?=
 =?utf-8?B?c2JXd3BvS1VKWU40ZUpkckIrTVNmME5zWTNmM01YdXBrRGg1QTdNM0plL21O?=
 =?utf-8?B?MHFSeWRHWUFmNXY0QUh6UnkvQ1BGYjdOd0lERDhGbndsMkRtVy9BaCtDa3Qz?=
 =?utf-8?B?OVN4QWI4ekwybmFFVWJEV0pvWDNJeFJNZjRhWCthK3dteHRJakdZT3d2aFkz?=
 =?utf-8?B?akdGUCtOWHBJV0tBV1lCVHdpZnZjeWxSTEtxN1E4L2lKZFpDaDVCa29xWXRJ?=
 =?utf-8?B?a2lNN3BJRUMxY2ZYRjNTY2ZVaXhlaEc3b29HR1NzUmw1UVZ1WWZKZThIMHZh?=
 =?utf-8?B?NEVLay9UYTFqaVNVbTJRd3FJTTVyMmhCbytQTWh1WjkvVHQ0YUhzc1c5cTVI?=
 =?utf-8?B?MDZDbW9RSUlENWJ1NXpzN3Q4eW5rVjh5Rk9OaldQWW0yTlJtREIzbjM2Z0JO?=
 =?utf-8?B?VTgyV2VoWWJSMWdsZ05Vd0hyeUExOFFYZVZXdC9TT3pzWmdwbENMb2JKY2p3?=
 =?utf-8?B?TURJbFV0ZXo1ZXg4U3NaNWQ2VHB4a2ZCVFc0NDd2QlJCYlY5c1RKa0R5R2Jr?=
 =?utf-8?Q?8zkyPIclFEil40sKwAi4ZwRev?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809a8e30-a5b7-4f0b-85d9-08db351bbce6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:49:05.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL3awT8mHOCociecza1dYY2PnNYlnbDr5CCMg801VVTaV5tDIljqgqL7uDlmbEhOJ6W2fwppeND0zrq5HuuldQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

Provide support for this insn, which is a prereq to FRED. CPUID-wise
introduce both its and FRED's bit at this occasion, thus allowing to
also express the dependency right away.

While adding a testcase, also add a SWAPGS one. In order to not affect
the behavior of pre-existing tests, install write_{segment,msr} hooks
only transiently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of ->read_segment() we could of course also use ->read_msr() to
fetch the original GS base. I don't think I can see a clear advantage of
either approach; the way it's done it matches how we handle SWAPGS.

For PV save_segments() would need adjustment, but the insn being
restricted to ring 0 means PV guests can't use it anyway (unless we
wanted to emulate it as another privileged insn).

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -235,6 +235,8 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
+        {"fred",         0x00000007,  1, CPUID_REG_EAX, 17,  1},
+        {"lkgs",         0x00000007,  1, CPUID_REG_EAX, 18,  1},
         {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
 
         {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -190,7 +190,8 @@ static const char *const str_7a1[32] =
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
 
-    /* 18 */                [19] = "wrmsrns",
+    /* 16 */                [17] = "fred",
+    [18] = "lkgs",          [19] = "wrmsrns",
 };
 
 static const char *const str_e21a[32] =
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -326,6 +326,7 @@ static const struct {
     { { 0x00, 0x18 }, { 2, 2 }, T, R }, /* ltr */
     { { 0x00, 0x20 }, { 2, 2 }, T, R }, /* verr */
     { { 0x00, 0x28 }, { 2, 2 }, T, R }, /* verw */
+    { { 0x00, 0x30 }, { 0, 2 }, T, R, pfx_f2 }, /* lkgs */
     { { 0x01, 0x00 }, { 2, 2 }, F, W }, /* sgdt */
     { { 0x01, 0x08 }, { 2, 2 }, F, W }, /* sidt */
     { { 0x01, 0x10 }, { 2, 2 }, F, R }, /* lgdt */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -666,6 +666,10 @@ static int blk(
     return x86_emul_blk((void *)offset, p_data, bytes, eflags, state, ctxt);
 }
 
+#ifdef __x86_64__
+static unsigned long gs_base, gs_base_shadow;
+#endif
+
 static int read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
@@ -675,8 +679,30 @@ static int read_segment(
         return X86EMUL_UNHANDLEABLE;
     memset(reg, 0, sizeof(*reg));
     reg->p = 1;
+
+#ifdef __x86_64__
+    if ( seg == x86_seg_gs )
+        reg->base = gs_base;
+#endif
+
+    return X86EMUL_OKAY;
+}
+
+#ifdef __x86_64__
+static int write_segment(
+    enum x86_segment seg,
+    const struct segment_register *reg,
+    struct x86_emulate_ctxt *ctxt)
+{
+    if ( !is_x86_user_segment(seg) )
+        return X86EMUL_UNHANDLEABLE;
+
+    if ( seg == x86_seg_gs )
+        gs_base = reg->base;
+
     return X86EMUL_OKAY;
 }
+#endif
 
 static int read_msr(
     unsigned int reg,
@@ -689,6 +715,20 @@ static int read_msr(
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
 
+#ifdef __x86_64__
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base_shadow;
+        return X86EMUL_OKAY;
+#endif
+
     case 0xc0000103: /* TSC_AUX */
 #define TSC_AUX_VALUE 0xCACACACA
         *val = TSC_AUX_VALUE;
@@ -698,6 +738,31 @@ static int read_msr(
     return X86EMUL_UNHANDLEABLE;
 }
 
+#ifdef __x86_64__
+static int write_msr(
+    unsigned int reg,
+    uint64_t val,
+    struct x86_emulate_ctxt *ctxt)
+{
+    switch ( reg )
+    {
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base = val;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base_shadow = val;
+        return X86EMUL_OKAY;
+    }
+
+    return X86EMUL_UNHANDLEABLE;
+}
+#endif
+
 #define INVPCID_ADDR 0x12345678
 #define INVPCID_PCID 0x123
 
@@ -1331,6 +1396,41 @@ int main(int argc, char **argv)
         printf("%u bytes read - ", bytes_read);
         goto fail;
     }
+    printf("okay\n");
+
+    emulops.write_segment = write_segment;
+    emulops.write_msr     = write_msr;
+
+    printf("%-40s", "Testing swapgs...");
+    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xf8;
+    regs.eip = (unsigned long)&instr[0];
+    gs_base = 0xffffeeeecccc8888UL;
+    gs_base_shadow = 0x0000111122224444UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[3]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         (gs_base_shadow != 0xffffeeeecccc8888UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing lkgs 2(%rdx)...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x00; instr[3] = 0x72; instr[4] = 0x02;
+    regs.eip = (unsigned long)&instr[0];
+    regs.edx = (unsigned long)res;
+    res[0]   = 0x00004444;
+    res[1]   = 0x8888cccc;
+    i = cp.extd.nscb; cp.extd.nscb = true; /* for AMD */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[5]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         gs_base_shadow )
+        goto fail;
+
+    cp.extd.nscb = i;
+    emulops.write_segment = NULL;
+    emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
 
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -86,6 +86,7 @@ bool emul_test_init(void)
     cp.feat.adx = true;
     cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
+    cp.feat.lkgs = true;
     cp.extd.clzero = true;
 
     if ( cpu_has_xsave )
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -744,8 +744,12 @@ decode_twobyte(struct x86_emulate_state
         case 0:
             s->desc |= DstMem | SrcImplicit | Mov;
             break;
+        case 6:
+            if ( !(s->modrm_reg & 1) && mode_64bit() )
+            {
         case 2: case 4:
-            s->desc |= SrcMem16;
+                s->desc |= SrcMem16;
+            }
             break;
         }
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -594,6 +594,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2886,8 +2886,31 @@ x86_emulate(
                 break;
             }
             break;
-        default:
-            generate_exception_if(true, EXC_UD);
+        case 6: /* lkgs */
+            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2, EXC_UD);
+            generate_exception_if(!mode_64bit() || !mode_ring0(), EXC_UD);
+            vcpu_must_have(lkgs);
+            fail_if(!ops->read_segment || !ops->read_msr ||
+                    !ops->write_segment || !ops->write_msr);
+            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+                                     ctxt)) != X86EMUL_OKAY ||
+                 (rc = ops->read_segment(x86_seg_gs, &sreg,
+                                         ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.orig_val = sreg.base;
+            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
+                                         ctxt, ops)) != X86EMUL_OKAY ||
+                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                      ctxt)) != X86EMUL_OKAY )
+                goto done;
+            sreg.base = dst.orig_val;
+            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
+                                          ctxt)) != X86EMUL_OKAY )
+            {
+                /* Best effort unwind (i.e. no error checking). */
+                ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);
+                goto done;
+            }
             break;
         }
         break;
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -281,6 +281,8 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
+XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
+XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*   WRMSR Non-Serialising */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -295,6 +295,9 @@ def crunch_numbers(state):
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
+
+        # FRED builds on the LKGS instruction.
+        LKGS: [FRED],
     }
 
     deep_features = tuple(sorted(deps.keys()))


