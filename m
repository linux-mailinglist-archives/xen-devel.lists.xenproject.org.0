Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C06D65C9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517917.803913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji1K-00010h-4T; Tue, 04 Apr 2023 14:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517917.803913; Tue, 04 Apr 2023 14:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji1K-0000xm-0e; Tue, 04 Apr 2023 14:52:26 +0000
Received: by outflank-mailman (input) for mailman id 517917;
 Tue, 04 Apr 2023 14:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji1I-0000xc-89
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:52:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e22134c-d2f8-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 16:52:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB9979.eurprd04.prod.outlook.com (2603:10a6:800:1da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:52:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:52:21 +0000
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
X-Inumbo-ID: 4e22134c-d2f8-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA3IJD4J6AdT496EyuFZF1ksGQWwNwCJX1fOQOuUXQwA9LT79yU3CD7gefWlKowNKY7qp61NXsua/ffV9PLUNzNJVELCjA8e+51qEMVciXPxW45/8zYRaY0tFPmahZlduvu554rr7YSHnOyOCEUXWr7ipn8l+NpQ2YvYW6tr8f3ZT4icAxK2vo2vLDGQvjZ9YYk7Ys8djKDOaSws/qUxjHhHreQePT1kga046WqW54hAT67OoDj4eKNPsj78TpL3GVIO8OwbazM1ZsmBCHIfIDWkm5+VhhQ2ucjoQuzh6x69JC3veovZCjE/g7bopj6gzAGVxYVCpzy2nIXGVHEe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytto9LVBxwhZWpIO0ffNtB+orBK2vTWlKoDCEHOFFGA=;
 b=k2NC7FNaoySdRSkYTg0hOI+p/jROwE71n4cleef/1LCtye2RD241KlmZV466bCcCmSbXdeB/6mQL+oceYn/txiXy0aoSLNUnjfYzpT5nsaG1JWCnxiOHdSPtsqaliAREt5drlWGoLkdOiZjUb9alWp7rEgYEHB/msEDYqaqxrVQmHMYgb+tKF5kS/qD35SFdeWdbjTVpvdx/kNVnQbH6VYCssuvNqBAo/83Loh3eFRDkoP4ARB8dk9zFsyeYKrgZgMM3L2V0dfbci3QFN6JcD2MYf8wyXzc5lwC0ejpWtGi+RbCiyxV8rIUcNQVoJ+Gsj1/RqzSHf5jGJvXWqz56Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytto9LVBxwhZWpIO0ffNtB+orBK2vTWlKoDCEHOFFGA=;
 b=3EbP+drpvdTr+SnRb9FMjKKHDtL8JluIHUEIC1Y9JBghfik/V7zNcSb5HEkGo33nrWDJOiGcimldftFjwhKihui+3bMsHD+fqKcNZje7ErqGnjFYburtNhmhblLW8HkHYCLeByENXxZXiDItzaX3hdfxnThsUk5bcZUFSyM/8DYla5Keawc8GkYO99EamivdYd4JfbjritkzUcxpYmGdYGKLiQ7AKcpI9AiwV4FMQMskBPb+rMm5wzWP2FWUVdezH+eRY7CQzEOmBkODtN5Fr8n7NE2NBTy9c7AuEDFbozmqBM9scrp3sVyd3UR18lqxMRBakof1ipgoHrjLZ1uOsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7fdf882f-0667-e0f1-8183-2dc1a344f4fb@suse.com>
Date: Tue, 4 Apr 2023 16:52:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 4/9] x86emul: support CMPccXADD
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB9979:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a2b5d1-4b23-43b1-bff5-08db351c3185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p/g0L5g/0M52/bLrqgAyDMN6xCfU6LzoTIsNQPL3c/43p80bWgLMNSg+ZASemFQ4/nnzn2aChYNc6jpokWischmjnnkYyTy85VAG43DMVC4ndQJ4voeHNyAGastoIjybugWeUGEnJtYfT5rPmvx7jvwydKcQzXsKEk93qnMJO06Rxz+obwPn0cuBpNxo9IQrzLDkqZ85AhMMagT63j1ghSL0xgC0A94WWhRkt1J2BqpbmXj3OwWHfknkpU6oqc/8qskjJVcYmxLZC/HweNoM/1Q0KamfkPLtOga5Of6X3IiB9fNJvlJCAjMMnmYu8dy6aKIEKIA9AVx1wOzSmcO2JXc3dc5+rVp4HTCXFdqT/50iXv+zOSaYMZfWoIzpqyqfoTULGv0s5ron16CN8T1l8lz472pR0KVNYaRVXpY0Ywexp5F/k38t2MHmkLar3J18gCbqczESuTlTcegVJG0H4cEFP0UlkiMiScLfrKaOgmqNqHAf9SmSMXTHUV/pqRhOU177BGUhcjzBfzmpVhYQEHE3OM52WNTnD91JEnSj4KCsD8fKE1XvhxkGLZB4wxIfp/GEIzvQhO3OI/K+N+In61ysjjv1dCTEYcVn9CR1M6wp6Xf5hYi/V9deO2IDKigNZnvIX5mvSmAtuiuIJSX9iA9O3YrDc+Wl2jjg1C/EZF9pJqY6AbZRn9tpUrvUGX8u9OwaeVydw2ztl8AtJNAdxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(366004)(39850400004)(451199021)(83380400001)(66574015)(2616005)(6486002)(6506007)(316002)(6512007)(478600001)(54906003)(2906002)(26005)(186003)(30864003)(5660300002)(38100700002)(66946007)(66556008)(66476007)(41300700001)(86362001)(8676002)(31696002)(8936002)(6916009)(4326008)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elhsdXBXZjYvS3Qzd3NEbTJkS1FrdDlYbW1xNWl4cGpsWkpEcFBWZGY1bUJq?=
 =?utf-8?B?dTZsN3dla1c3dHlteU91U09JTlRpdm5MS0JBRkMyQ2NJVGI0WUE1L1dBYTB3?=
 =?utf-8?B?VVV5OTY0TlVGT3VsNXIwNWMveTBCYm9pZHJhc0dXUEFjS0x6TlA3ankzQ2I3?=
 =?utf-8?B?ek5yK2E2TmM4OUFTdXA3Y0NQeFFOTVFiVkNhNWNqT0NIMGViTi9iQnFrTnMr?=
 =?utf-8?B?TiszRk9WZkJwQUFXaG9CMDd4dy9kZkxZV0sreDV3U1dUM0VZcXJQV2l1bERs?=
 =?utf-8?B?RFdCUTVvZk03YTZZVHNQb20yNzBqckFYOFpBNGJHNkg3QkkvT042TEIwbUVJ?=
 =?utf-8?B?MTF3cmE3VlFpbk5aVE52bnRvWGlqMytLY3lrZkxNczNEMG1HN0ZTYkRhbmhn?=
 =?utf-8?B?bWJwN3NlZEZIbnRhMVljYUJqUjFLQW1qZ2NUUnhvcFBmSTlPeTZ2VWJrNVNj?=
 =?utf-8?B?YTZEL1JneFg5a0ZTcHRyKzlMb1M1TlhwVU1jTGRuMDZJSWMzTGJqS05tS2tu?=
 =?utf-8?B?UWJDNllpRkJiMHZBZklmajJYTFBweEZteEkvV2FHMkpPRG5SRnR3dStrUUxi?=
 =?utf-8?B?MFpURmpPZ2FVUzR2d1pZa1E1eTVRckVIRDdtZS92RS9YakptNWRFMEx5akhG?=
 =?utf-8?B?NzZmTURIalVpQ0lEcUhwOE96VjRyQ0QzSzV4YWRMTmpjeXkyaElZSVZPYkpU?=
 =?utf-8?B?YlpmaVlPZmRkemFOTnI3K3JQSU5SNHR6UzRaQmNRQlNvSUcxbUhVR1U5ODNV?=
 =?utf-8?B?dVhRT2ZjeFBRR1BDcmNQa2RLWHV5cWxYNmJkZ2x5cThybjhPS0QrakFtbFdT?=
 =?utf-8?B?dUVBWFl0UTM0dEdXci9yQUZjN2U1MFB2ZWkwUDFrY2dSVmpaWVJDVGVwUTJy?=
 =?utf-8?B?YTA5QWlYU2NFTzMxSmYyRkRNeWRSSWY2L3lONWhLRnBWeTdkRncxRW9wUU5O?=
 =?utf-8?B?UnJybFY2Nm5Dd09EOGpqWnNYeVNiU3dKOVpkbEFnZEFvSjZyME9EelY3anZ4?=
 =?utf-8?B?MjJpQlJzZDFBSjlDZFFXd1g2M2ZCanpJdU9DTW1Qemdvd2puNmkycWpWQStm?=
 =?utf-8?B?enE0alJyeGI3dkR1ejU2MmhHbHIwMEtIbkdETEhpVDBIWEp6a0tha3pDU1h2?=
 =?utf-8?B?OEpJM0FaUklXblFPRDZjK3V0V1I5aE13RjNXZlIvZ3g4SjN4Y2JYRlBxN3lr?=
 =?utf-8?B?ZHVUb3I1U0xMQXY5Q2VGYWZkMmNzY0RwMThSRGVtdnMrQjNBUXU4aW1zQTd6?=
 =?utf-8?B?MWhuLzI2Q2xTSXNCbWhjWG0wRVR6ZHJNbVVOSXBsNEFIUTJjd0thV1BTc01F?=
 =?utf-8?B?Y2QveHAxR1dwRGhocVhWbnlqa1ZzSGFjWHNEMzBYLytPK29DNDhaMEdleGxs?=
 =?utf-8?B?VHBXQitkRm8zNHltaVcvZVNXM09EUCtabWlFV2tLbjQ5R2EyWEhLdkllbFV3?=
 =?utf-8?B?Tk9SZTF2OHVjelRRNzhvQ2EzUW44UzBNTU9LRVA4QXVBcmJudlAxclBhQk9h?=
 =?utf-8?B?akp2bVZ4dTlTcVcyU3N1K25iRWpMWkYrZzlybDlkRis4eXRBU2J3aXdaNHEy?=
 =?utf-8?B?L0FuUlBBQ1ordHlLS2lZYzRJM1pCZVE1MlVoQ2Y3a3Nkb3JFSjlyUE9YU0pJ?=
 =?utf-8?B?QUVaTEQrN0wwa3VaTmF0T2xrYzdhOFJlWHlLYjhDV0ZuU0NPdGRMVGVZcTA1?=
 =?utf-8?B?OUkxOU9MdXNITUkzU1djVE9SRzA2QUlyYWtkWUV4eUtUeGNpVzNyS3ZUbE9u?=
 =?utf-8?B?YWdvKzVhdlpZbTZFZjVBb3lOZFB5S0Y5L0oxT2txQWJmUi9kSGgxQWNNL0JK?=
 =?utf-8?B?RHJacll4ZlNOa2hFcXhGOEJhRU05SWJyRlR0eXhOUHEwVzVIeU9sSlJGblVD?=
 =?utf-8?B?VkNjRE02RkYrT0Roa0xJa0hGL1Mva3BYMTk4dVVydmt1amhwUE9sY2dLcjdW?=
 =?utf-8?B?MnBXc29pOTJ3NlRuallwUHAzZWNOWWVZSHpJNkp3Qyt1T2k1emhvdkM1Smxk?=
 =?utf-8?B?VDNYa2d3VWNzSzNYTjhQN0lzU21odldoOFRadU11M3BTV1kxckdLby80QnBU?=
 =?utf-8?B?RzRyS0d2SzdIcnpEcGxoM3VCZ3Y5YW5rVUJnQlJ6RG1iUGx2V2pUa01BUU0x?=
 =?utf-8?Q?LqPPpDvBk0nKkezpyyjDMiy+2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a2b5d1-4b23-43b1-bff5-08db351c3185
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:52:21.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MedJmFONYDiI83Q6l+pqfjGeR6f562yEcTke5WMYchXpTbjJJTjcD880K4Pm5t3N9HWG5nI7vPV4hTFVT1OMaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9979

Unconditionally wire this through the ->rmw() hook. Since x86_emul_rmw()
now wants to construct and invoke a stub, make stub_exn available to it
via a new field in the emulator state structure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
# SDE: -grr or -srf

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -232,6 +232,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
 
         {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
         {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
+        {"cmpccxadd",    0x00000007,  1, CPUID_REG_EAX,  7,  1},
         {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -186,6 +186,7 @@ static const char *const str_7d0[32] =
 static const char *const str_7a1[32] =
 {
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
+    /* 6 */                 [ 7] = "cmpccxadd",
 
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1388,6 +1388,22 @@ static const struct vex {
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
     { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
+    { { 0xe0 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpoxadd */
+    { { 0xe1 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnoxadd */
+    { { 0xe2 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbxadd */
+    { { 0xe3 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnbxadd */
+    { { 0xe4 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpexadd */
+    { { 0xe5 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnexadd */
+    { { 0xe6 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbexadd */
+    { { 0xe7 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpaxadd */
+    { { 0xe8 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpsxadd */
+    { { 0xe9 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnsxadd */
+    { { 0xea }, 2, F, W, pfx_66, Wn, L0 }, /* cmppxadd */
+    { { 0xeb }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnpxadd */
+    { { 0xec }, 2, F, W, pfx_66, Wn, L0 }, /* cmplxadd */
+    { { 0xed }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgexadd */
+    { { 0xee }, 2, F, W, pfx_66, Wn, L0 }, /* cmplexadd */
+    { { 0xef }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgxadd */
     { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
     { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
     { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1398,6 +1398,78 @@ int main(int argc, char **argv)
     }
     printf("okay\n");
 
+    printf("%-40s", "Testing cmpbxadd %rbx,%r9,(%rdx)...");
+    if ( stack_exec && cpu_has_cmpccxadd )
+    {
+        instr[0] = 0xc4; instr[1] = 0x62; instr[2] = 0xe1; instr[3] = 0xe2; instr[4] = 0x0a;
+        regs.rip = (unsigned long)&instr[0];
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        res[0] = 0x11223344;
+        res[1] = 0x01020304;
+        regs.rdx = (unsigned long)res;
+        regs.r9  = 0x0001020300112233UL;
+        regs.rbx = 0x0101010101010101UL;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_PF | EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x11223344) ||
+             (res[1] != 0x01020304) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.r9 <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x12233445) ||
+             (res[1] != 0x02030405) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing cmpsxadd %r9d,%ebx,4(%r10)...");
+        instr[1] = 0xc2; instr[2] = 0x31; instr[3] = 0xe8; instr[4] = 0x5a; instr[5] = 0x04;
+        regs.rip = (unsigned long)&instr[0];
+        res[2] = res[0] = ~0;
+        regs.r10 = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) != EFLAGS_ALWAYS_SET) ||
+             (res[0] + 1) ||
+             (res[1] != 0x02030405) ||
+             (res[2] + 1) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.rbx <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] + 1) ||
+             (res[1] != 0x13253749) ||
+             (res[2] + 1) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     emulops.write_segment = write_segment;
     emulops.write_msr     = write_msr;
 
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -185,6 +185,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_serialize  cp.feat.serialize
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
+#define cpu_has_cmpccxadd  cp.feat.cmpccxadd
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
 
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -170,6 +170,7 @@ extern struct cpuinfo_x86 boot_cpu_data;
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
+#define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -443,6 +443,7 @@ static const struct ext0f38_table {
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xe0 ... 0xef] = { .to_mem = 1 },
     [0xf0] = { .two_op = 1 },
     [0xf1] = { .to_mem = 1, .two_op = 1 },
     [0xf2 ... 0xf3] = {},
@@ -934,6 +935,8 @@ decode_0f38(struct x86_emulate_state *s,
             ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         break;
 
+    case X86EMUL_OPC_VEX_66(0, 0xe0)
+     ... X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */
     case X86EMUL_OPC_VEX(0, 0xf2):    /* andn */
     case X86EMUL_OPC_VEX(0, 0xf3):    /* Grp 17 */
     case X86EMUL_OPC_VEX(0, 0xf5):    /* bzhi */
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -265,6 +265,7 @@ struct x86_emulate_state {
         rmw_btc,
         rmw_btr,
         rmw_bts,
+        rmw_cmpccxadd,
         rmw_dec,
         rmw_inc,
         rmw_neg,
@@ -322,6 +323,8 @@ struct x86_emulate_state {
 
     unsigned long ip;
 
+    struct stub_exn *stub_exn;
+
 #ifndef NDEBUG
     /*
      * Track caller of x86_decode_insn() to spot missing as well as
@@ -593,6 +596,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6881,6 +6881,15 @@ x86_emulate(
 
 #endif /* !X86EMUL_NO_SIMD */
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xe0)
+     ... X86EMUL_OPC_VEX_66(0x0f38, 0xef): /* cmp<cc>xadd r,r,m */
+        generate_exception_if(!mode_64bit() || dst.type != OP_MEM || vex.l,
+                              EXC_UD);
+        host_and_vcpu_must_have(cmpccxadd);
+        fail_if(!ops->rmw);
+        state->rmw = rmw_cmpccxadd;
+        break;
+
     case X86EMUL_OPC(0x0f38, 0xf0): /* movbe m,r */
     case X86EMUL_OPC(0x0f38, 0xf1): /* movbe r,m */
         vcpu_must_have(movbe);
@@ -7942,14 +7951,20 @@ x86_emulate(
     {
         ea.val = src.val;
         op_bytes = dst.bytes;
+        state->stub_exn = &stub_exn;
         rc = ops->rmw(dst.mem.seg, dst.mem.off, dst.bytes, &_regs.eflags,
                       state, ctxt);
+#ifdef __XEN__
+        if ( rc == X86EMUL_stub_failure )
+            goto emulation_stub_failure;
+#endif
         if ( rc != X86EMUL_OKAY )
             goto done;
 
         /* Some operations require a register to be written. */
         switch ( state->rmw )
         {
+        case rmw_cmpccxadd:
         case rmw_xchg:
         case rmw_xadd:
             switch ( dst.bytes )
@@ -8224,6 +8239,7 @@ int x86_emul_rmw(
     uint32_t *eflags,
     struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt)
+#define stub_exn (*state->stub_exn) /* for invoke_stub() */
 {
     unsigned long *dst = ptr;
 
@@ -8289,6 +8305,37 @@ int x86_emul_rmw(
 #undef BINOP
 #undef SHIFT
 
+#ifdef __x86_64__
+    case rmw_cmpccxadd:
+    {
+        struct x86_emulate_stub stub = {};
+        uint8_t *buf = get_stub(stub);
+        typeof(state->vex) *pvex = container_of(buf + 1, typeof(state->vex),
+                                                raw[0]);
+        unsigned long dummy;
+
+        buf[0] = 0xc4;
+        *pvex = state->vex;
+        pvex->b = 1;
+        pvex->r = 1;
+        pvex->reg = 0xf; /* rAX */
+        buf[3] = ctxt->opcode;
+        buf[4] = 0x11; /* reg=rDX r/m=(%RCX) */
+        buf[5] = 0xc3;
+
+        *eflags &= ~EFLAGS_MASK;
+        invoke_stub("",
+                    _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
+                    "+m" (*dst), "+d" (state->ea.val),
+                    [tmp] "=&r" (dummy), [eflags] "+g" (*eflags)
+                    : "a" (*decode_vex_gpr(state->vex.reg, ctxt->regs, ctxt)),
+                      "c" (dst), [mask] "i" (EFLAGS_MASK));
+
+        put_stub(stub);
+        break;
+    }
+#endif
+
     case rmw_not:
         switch ( state->op_bytes )
         {
@@ -8384,7 +8431,13 @@ int x86_emul_rmw(
 #undef JCXZ
 
     return X86EMUL_OKAY;
+
+#if defined(__XEN__) && defined(__x86_64__)
+ emulation_stub_failure:
+    return X86EMUL_stub_failure;
+#endif
 }
+#undef stub_exn
 
 static void __init __maybe_unused build_assertions(void)
 {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -278,6 +278,7 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*A  CMPccXADD Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */


