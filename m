Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E24A9A6D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265564.458965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFz50-0003CW-Fv; Fri, 04 Feb 2022 13:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265564.458965; Fri, 04 Feb 2022 13:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFz50-0003Ah-BT; Fri, 04 Feb 2022 13:56:50 +0000
Received: by outflank-mailman (input) for mailman id 265564;
 Fri, 04 Feb 2022 13:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFz4z-0003Ab-8u
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:56:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b7acca1-85c2-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 14:56:48 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-01_o3IveMxGxI8fmq-bljQ-1; Fri, 04 Feb 2022 14:56:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4538.eurprd04.prod.outlook.com (2603:10a6:5:2e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 13:56:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 13:56:45 +0000
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
X-Inumbo-ID: 4b7acca1-85c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643983007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hqXtvA8QT1El6gi/VOf+F8xHktquhDqteU2+BYDQISo=;
	b=Yqg49wDP1wsl+zYjZFNl+QJcuNds4g65tl6TCRpTQ3pMMtrNUxAPrE4nB2BCHnt0J4BRmI
	sSmtdq5r1SPkNR9mFMq6aRydUe3wv23VI3FnvMgdvD6jKhCuorrYmcTqC2rq18v+uAhEGn
	TvSP4jgn5xlY03uRQ/P6P7jsxrtCmhs=
X-MC-Unique: 01_o3IveMxGxI8fmq-bljQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsTR6wHSHp31wDxVapWvddP8JBPJqUD9c6n27atW9IWFQEevAB6keYGckNcEKdnR1br6NwZH6AotWbq37lmRlsYNq8pXcoCzbn8RSOEeNSZs+wbnvlr2eADMdIL2Xtz0634AcSpGVkA/lleYUWUqt5R4HmPTj9qfsK2/m6waZJhSvirbcxw5KsFgGqMjswKDNrR262qdejLd8lvBjwubEJATwWs7EPAYJbkWk5FBruIyI+xpR/iCyOhdsiZm6GeWRDkihahWQtuztLE2t2lZt9mWOVHNUxtU+zP0NIt94iWL6iUebpQu1cZSuR/S0zyVXd4R31KvoOx9iz5AaNc1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqXtvA8QT1El6gi/VOf+F8xHktquhDqteU2+BYDQISo=;
 b=B5kwYz5OdHFAFydQn3Nk0657ePZ8vjqcP2YweWhGm8c5HYiyQCGfu/m+mGbBgg0RjhOQCnj7+mEMILCRUpm+92O4xt2mKUfCjCVmhNGyqKtuMvxmLnuKqWlKAuCZy3FyaNzIx/JZOjLEnc290foFRzfLlCUP81Z69yAj4DBg6++2t5cJqrynSLSRFPNPmxDJ8bfAevfXV9m1zedY4WdziQ7EOy0csfHhU3e55EXRKG12gru+noO4R03aJ9IIp5jWn7bQgMYRX1z7lrUeGt8XF3nzG+q5l5Z3BGo83dilmnQkTsDyBjmcja0eikAYtjMI+AfOkfEUqIrz6ruFx2GHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <419db65a-a6f2-f812-d51e-7a23d065d460@suse.com>
Date: Fri, 4 Feb 2022 14:56:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Intel: don't log bogus frequency range on Core/Core2
 processors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0415.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e7944d3-5ce0-4887-e6cd-08d9e7e62e4e
X-MS-TrafficTypeDiagnostic: DB7PR04MB4538:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4538A526C2677969D7A54FD5B3299@DB7PR04MB4538.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YG32QVAjLfr89s11BZaUJXtVUxIk0fO4TrcoDvUdEgcsldImm41S+OVXfEhTEhA7jAjQgtsKUrDzAg7Q2PEIdjIsqofLLOsObJNY/6sCVugszz1j2tuN//wTPkQUJEufwR9OgNC21jWCF6Y6aqneNAfQwgKcO1XTeadhj5U0M0q1wRYv6n6yECgWCQkXznZ20afVvHkTdJ7z1sgHQpubOU/RQentBX1vbKVDDH0Qi1iNpekO/SKXtPaT+GrKRbLSufll5B4FD0NTL6BYPKnhHhlswGoffNB8G0iOIuusl4aBHfjpWo9KvCH26vSaAmRLp4EA22EdNTreIKiAKPnE18ZgWYs89tAgbseDcffALYFN9qMkfjhVeXEFKIV2T1VxTnYSZS7crAZOACp4ac4bPeKr6O9Qm26y7BjByjeBXZJ1LORNeFDUP8wq1U3uurT8Emk1fnoAVaZGc4e7goRCIrASEQ76dt+QhlgYArPIKLWhjdhzGOMOMzJkCcIJ4wWkuvev2kJ9fPc21dE7/Yr0wYK9ynx0QsdknfkC7+PfrQpWiq8edsukVDfrgY4ywmiy0BlXjbIVSqBL8SeayegPI1GbRcgABFMLXcj/S3d+/aPOpkthqMk4kyYaDB2XlIEnXkr9cIdNVTKzxebIZyqTnnxP3T20IV8ztjpkiLhDGkfZjGZiwJ8aSZ28xMvJRCJCnTqS3JZpY8yK7Cimcq57+Tyhb+zKTKWhKzeJoK5bHrjNjDe+LBg8gdMUC0knBr0a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(186003)(26005)(38100700002)(5660300002)(66556008)(6916009)(83380400001)(8936002)(66476007)(66946007)(54906003)(316002)(4326008)(31686004)(36756003)(6486002)(6506007)(31696002)(2906002)(86362001)(6512007)(2616005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm13WTdPUjVwQzZRSzk4eFQ0Q1JKc0FrVDNIYndwTnNIdTBUMGFEaUZXN0Nm?=
 =?utf-8?B?MzBMSDJ1OUExVW5kc1BuYzdOZDBwRXRSRXAyMjVRSjVFbWJRM2tuWVl3amM5?=
 =?utf-8?B?WFNQZUdFVCtqeXFnaXR0MVhEc0V2ZGZjMEk2UEp6ZDk1anVTWm5mNE9JelRG?=
 =?utf-8?B?eTJiSzRBVk15MDMwb1QyTGM0ZDF4cW5SdFF4N3ArU25ZbHFPQ210NjhhUlhl?=
 =?utf-8?B?RlFCU3NJcGxpbEpPdUNaeXk4VkRsc3A5WUxKdVpWNE5ET1NFSnBkeExWZHlW?=
 =?utf-8?B?RHFycklreWgvaWs4dHhBQWFxWmRXVjVQcms4Y3FjNWoyQlBaYnMxM3VtQ3Ro?=
 =?utf-8?B?d29teTFLNUpsMk1EOXcxSW4vNUlFaXJBTEhWYzFqZkI4dWpmUmxndzcwT2pa?=
 =?utf-8?B?TXB5QVNjZTRESitUMEkvSHlGcDB0UkVPM0t5ejVXVUFMM0VIcUpSRkkxcEUx?=
 =?utf-8?B?cFlveE80NEZZT29NL0s1WVZYTnUzSmR0djFQczR6cXU0dkVtdVZDK2F0Qm5v?=
 =?utf-8?B?bk5WLzZ6T0xueStoVUowZk1JYlVCVHl0NjhJSll1UmRzLzM5UU9qUXJxM2dP?=
 =?utf-8?B?bitlUnArUnlJNWJzUmdUYXN3QTRVcFJYNEF5NHdYZHlpZ1NhMlBDdG5yL015?=
 =?utf-8?B?WXh2eGVTcEU3dW1YbzJzMXJ1L3pwNTNOdnMvTE5LWGFKMEl0V3J3NDVHSVhS?=
 =?utf-8?B?UVdPZWJIS0dGekhzRUxsbHdTMkdXNTA4VVdvUlFGUXZSdktZdlY2VHpUdC9a?=
 =?utf-8?B?TDczY3F4Mk5Da3NjdGRyYzFEVFFrcjhoRXZ6SEd1bWNwZk4xeVNBZzVoOGk2?=
 =?utf-8?B?b01YSDlwZmd6aE5SR0tCc0J1VEc2b1dRUlJnWDllQjJWMm5FUzZBakxwRzlm?=
 =?utf-8?B?VUNHNzY4cndKVWprejJZVzNoTjA1amo2Ym9hV090bXFqUDZDM085ZmxjZXU5?=
 =?utf-8?B?RG02eWF5a1BoVUhtVXBRUVdPWHprK1BPUEpDT0xjRUI3RUtlb25GR2w1U0tV?=
 =?utf-8?B?SHJ0bDYzeUhoTmgzUVF1R1F3QkhKWXdiL3pseWlaY2duUTFIejVnK094NDBJ?=
 =?utf-8?B?dDFWODlKb0k3UUhxekxEWEVORkxMN0hySDlPU0dDaWx6cEU3OGFJV1I3QjNl?=
 =?utf-8?B?cmpHQmxMWVJSeUNXRkxMNVdPZmp6U1hWREtORmtpWFBxSFJqa2xsamJCdkNG?=
 =?utf-8?B?NUQ4VkhhV1NPM29rK2R2NzVSSlNaSE1wM3dZaVo1c01OeU5PSjB3QjZMMzRz?=
 =?utf-8?B?L0lBWlhsUU9TOHBMUmN5dHMya000SHFSWXpRbjlvUVlCVUdweWtlVkNsZGVv?=
 =?utf-8?B?ZjZlZW1iUlVKMkNXS3NvVnpJSnU5VVVOQUxDZkMyZm5WSEVaWGZQVnVwQ20x?=
 =?utf-8?B?dzBTRVlJMnNabEU0WmJHc1JXVmxUSkU3LzFNRkthTTI3MXprd2pqL3ZSU1pX?=
 =?utf-8?B?YmdoWWcrc0oyWHBSRVB0QkI4eEZyNmI4RW9nZ2ZhcmJ3Wkx2TStpTWhwaGNp?=
 =?utf-8?B?bkhZeEdML2QvQytoaTIrUmo5dVVzZFBDd2hwMEw3VzVDQm9LNk9ENGhZVEE1?=
 =?utf-8?B?M0JWNC9xZ210SmlVNzAxWE5YUHBBTWlwOHkvVDcxZFMzOTRneEEvbVhNTlJE?=
 =?utf-8?B?bk9qcVNmRC9UTmVpZ25maWlxLzVIc1FlSlo3NHFIQ1FSNTlWdEtOMXpsVzhp?=
 =?utf-8?B?MkIyQXhIYUIrcmVBbmZ4YWdFUkl6N2luU2ZqN3N5NE9DUW5KakJvOTBPMjRJ?=
 =?utf-8?B?Q1FIQk81dnBYZmYzN0wyMkdpRExMVExTZEZRQTRRQ1YvWUdrY25QbkticWZp?=
 =?utf-8?B?U0Racy9TK1F2M2JydlJXZjNWREpWZThsWm5WOXUwWU41MTk4a0RQdkN0WEcv?=
 =?utf-8?B?MU5LQkE0K2hlR0N0TEJZVnhGT3JlcWVqbFdtRW1FdVZTZHZ5cVdJdHF5ZXVK?=
 =?utf-8?B?eStSU0pKdDhUM2gwSXBaR2xLSUd6TXVMd1hlU0lBajRMNitYcHVoTy9PdlRx?=
 =?utf-8?B?VEtFeWhqVG5IUWNxZEcyc2cvVnpXTmdXNUE5WmVBbWFMMlFoaWZoR0ROWklo?=
 =?utf-8?B?eGREVGxleGw2SGw4NlVHcE1PbmgyaUp3ajNnZ0EvV3lrUURDeWJ3S1RCeU0y?=
 =?utf-8?B?dGhRTlJHeW1qTVFjRkVuUFdIdVYrT0cxbzZOOXgzTHYyaXBUMUswWHZRcmZm?=
 =?utf-8?Q?oTlHbF9qDklxLhbzNlPTRKI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7944d3-5ce0-4887-e6cd-08d9e7e62e4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 13:56:45.6459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOP0mNkrjclnD/3NzlMlYxoWDB2ZTLoiXswsx2R4RuYt1/mCJEJjq7NMXqPC+zYBTa2WGJ4GLxaLeMjImTvIZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4538

Models 0F and 17 don't have PLATFORM_INFO documented. While it exists on
at least model 0F, the information there doesn't match the scheme used
on newer models (I'm observing a range of 700 ... 600 MHz reported on a
Xeon E5345).

Sadly the Enhanced Intel Core instance of the table entry is not self-
consistent: The numeric description of the low 3 bits doesn't match the
subsequent more textual description in some of the cases; I'm using the
former here.

Include the older Core model 0E as well as the two other Core2 models,
none of which have respective MSR tables in the SDM.

Fixes: f6b6517cd5db ("x86: retrieve and log CPU frequency information")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the SDM table for the two models lists FSB_FREQ, I'm afraid its
information is of little use here: If anything it could serve as a
reference for the frequency determined by calibrate_APIC_clock().
---
RFC: I may want to rebase over Roger's addition of intel-family.h, but
     first of all I wanted to see whether going this route is deemed
     acceptable at all.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -435,6 +435,26 @@ static void intel_log_freq(const struct
         if ( c->x86 == 6 )
             switch ( c->x86_model )
             {
+                static const unsigned short core_factors[] =
+                    { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
+
+            case 0x0e: /* Core */
+            case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
+                /*
+                 * PLATFORM_INFO, while not documented for these, appears to
+                 * exist in at least some cases, but what it holds doesn't
+                 * match the scheme used by newer CPUs.  At a guess, the min
+                 * and max fields look to be reversed, while the scaling
+                 * factor is encoded in FSB_FREQ.
+                 */
+                if ( min_ratio > max_ratio )
+                    SWAP(min_ratio, max_ratio);
+                if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
+                     (msrval &= 7) >= ARRAY_SIZE(core_factors) )
+                    return;
+                factor = core_factors[msrval];
+                break;
+
             case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
             case 0x25: case 0x2c: case 0x2f: /* Westmere */
                 factor = 13333;


