Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8E644503
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454885.712451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YPB-0005Mp-GS; Tue, 06 Dec 2022 13:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454885.712451; Tue, 06 Dec 2022 13:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YPB-0005JR-DS; Tue, 06 Dec 2022 13:54:41 +0000
Received: by outflank-mailman (input) for mailman id 454885;
 Tue, 06 Dec 2022 13:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YP9-00049e-CZ
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:54:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85bf16fe-756d-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 14:54:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 13:54:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:54:37 +0000
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
X-Inumbo-ID: 85bf16fe-756d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXFtEmNDgQGGnQJmLMj5JXYE1ZDmBbBALsIBXP3miDAJ7OkOh+bIiXgfswwj5tksnhZET3q169nMAaP5/uexGUfymYvAYulS3/MTbyeabNLs5Ay/xedfMdLBfyiHPzgd867l6grMwY460gEmLEOnniM8Yk4J5WtZxHEfdJSPdodLjyebZF7ldKxQgOw285YAIFt2DWLsL5QI1RSw0BB4ihn5XknD4G57dUi+XEk37eEBXaLGn8OrXA+ar1HEhUSezvEoI3Dxp5Ze8AFGxKAyoRlxoHTm9LwKT32hHToantLBJQeVbds729InM/hyU9eXo4dylw6LU8nWsB+2rTkVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et5DDpshzeK44IkvBaMK0477F0uL2qhRcpoZlCJ7Gkc=;
 b=NQw1M8FPCoahntbsBKPfZafUBCqe1cew5aEj7EJx+Nyduz3PiT0g73/7yzQa99bKtxJvWGUcq39oGTJLzP8nPDm3QuuqgnFT+L7uS85JOPfejDgLZ1bRlx5HC7kd9Q+SYfgvARmi8aZgPSnnS0Y+3ITgCSnHVooTOnuxGSNYKt3ckLmKetAgT4HJ5i1UBhD4+nHUzaoT4ebHA8CulxNHcgicioWm2MvvXnTxNSEvdTA4Ck3sKeF2xnsUJ3TzHO5zV7r6lvgwIXpqesbspbGGXgePjHetTl0MSRdDbZFw9+G1IH2uynAQPss+HiopMic5SB7C3JjeGZiPPa2D8v2O/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et5DDpshzeK44IkvBaMK0477F0uL2qhRcpoZlCJ7Gkc=;
 b=CZojMhJ4BEo3H4tRFQiAtvGF2E/Rex8b5d7TWub/axgthu9528JXFzCJs2NoiVkePA3zkOr6Wh4r3emxxYEPkR5IqbvvD52QJ/KCx0vmaoseUsSer6MgLuaoNrBq3QlxMEwkoS1natEt0cFacIPTMIbjCdOmfeVu8gWk6rdLxnef/iixPulHhOMzVzI6bcz6Ryk5IgXcz5iewL7nY2qWdtZEWwvuZBflEANVv0Hj2HdYCf8uoO4WwUgOkkBxH1sp0MnCfmZ71zZreYCyx+5Xaq1/UMsxMADZNnzV/E4Ns6kV8BMrjk5A6N5jF9kGQs3qBk8/WFVJYIgcfSeqYvIuQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <512cfa7e-00b8-6efa-89d1-c850ade61231@suse.com>
Date: Tue, 6 Dec 2022 14:54:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 3/5] x86/mm: PGC_shadowed_pt is used by shadow code only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
In-Reply-To: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 2229dd76-1f17-4761-ed3c-08dad79169c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3uPvBrTZCXWrbQuOVrbXC0hIOwtnTThJTX5pJggZeSH7DgtjjAWnVNqixmBknYFpRIXmSABSz7AxZc7NPrTUXxy7Vy6eXkYnPUJkoyfjHqjKyCR8DEhgha71UPOQP7B+QZcgJj8tGcHJF6bd6V92N+3f/oOMjG7TNOBd+J2bA3sVYpsl4VMKPSvcAXxlejQ2NeJOPAPDm6tbmdtpBvJbcL6T4lco0HgNMxSfI67mGwYZ2miuV2J2QfMtyGNlKD2mN3Rp54etTH3JQr7HODR2wADImWUagFrn61AnxmhYNCTPaYKgrbghbZLss0jlumo2+dmAZ8C/hCTIHe5maCztM5T60y1uqMzz5oax23+UihNRLp/p34l3wzeZ6MJ4qrqscs7WGLdTtkX0OaW7KRbTEhUnMVYjqq8EuW5kRUNX8bjaqt2ysxnAhDPECYDpRs7My5BubbFJNj81eQexkS/Oi3U36qEy60sbK0BqnqrXRORluCxEeYKiF7e0dOeAO8cLMfDODZEkOWVzPi8W2K5S99Ukb970wo7wZpniIXdi8zZyGBq2ZRj+TDJv6bFFDwja5y9X5b8Hr+3mWWshb7Yc6mjfpZL+vfojCRKrSeah1mD2gOqimEzFZE3Ab/a7ayohp8gyCM9VyDtyemL03yqjduqF59ThNoeSfgIhBSbd7sXRGE3LQwcxUUwi1tf7aFg7mIvm6O2HetYZ4T6E4YWW1WAYRn+9+2X0YuAG6N62buU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(31686004)(186003)(6486002)(6916009)(316002)(54906003)(478600001)(31696002)(86362001)(36756003)(38100700002)(6506007)(2616005)(6512007)(26005)(2906002)(4326008)(5660300002)(41300700001)(8936002)(66556008)(8676002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2VtSVJielhURndJbDBGdTdTN3dIMnJiWTlpRmRZTWpnWVZwMmpQZDZjTkVo?=
 =?utf-8?B?c2I5K0p1ZDNPbi9qQVlTWjdjRXN6NXJTckp2YmxJSVhYeEo5WnNvaEtjeWZk?=
 =?utf-8?B?SmxoZkFvaHhiNE0rSnc5L2J5RWxPR0s0M2phTnVzMVllOWl0SExpV0xua1hL?=
 =?utf-8?B?bTNjdTlEaFpBdWFsRFJ5angxUFd2OG9DdGFTWXBnQitKMlBHZU5zenpmY0cx?=
 =?utf-8?B?QmMveE5yMlpXa1VLajlLdFczOVBhaUhKdHRFT3lObm42VE9ybGlDUHI4ckpT?=
 =?utf-8?B?c0RpRWFEMkMrMHhKUjdiZ3YrSmpYOFN0N0hGNk03Y0NlcXZpbEk2VktWVHdn?=
 =?utf-8?B?K0tOOUFnK05iUmkzbGhOOG9OTUh3QWZqSm5tTFMyUFpUVUZ1Ym5JN2FUcW5t?=
 =?utf-8?B?emtBUjhGejZISWhKQ3Rxd280cFh3MlBoZVJMWmRFZlA5blNGdjlXcUdjenUr?=
 =?utf-8?B?TTd3ZCtCb0xlV2UrMm5lT3JCeUxCcy91bG9sYnIyRlpQSzF1ckxLeEFRakNm?=
 =?utf-8?B?aVZBYUduS3g4Y3VrUzR3bHpWaERlQlhaV3QyV2hqNlZRNkg1SkJGVFNTY2dp?=
 =?utf-8?B?V0h6NEg5cDhhVDlTMEprUTZLOSttYkVUdllLQm01RC93UWRiKzZhRmlFTFdT?=
 =?utf-8?B?OWlRTTZJdkdmSE5BNGJTL3ZmeUtuckp0Nmg3QzkvWjB3VUJXTi94bldSTWdV?=
 =?utf-8?B?dHhUenpUeE5sdEhBdXUrbVFxN0FLWVM3eWcvQ0xjTERKWTA1TkZPN3FPb1dW?=
 =?utf-8?B?NDdpOG54VlV1VTdsMmdGVWM1c2w2RHJ3WDJCcnhVODA0RkROaHhvajVJRGxa?=
 =?utf-8?B?U2twZkdwa29WZlprSnIzK0ZVLzVWWHJSMGhaYkt4MmIwMmV6MDQvZzVMOEpj?=
 =?utf-8?B?bm1ZL2VvWXhTSy9zMFBBbFhTMUlMVmFSSnhLNHM0T2tIc2plSjh4VzVWNUFE?=
 =?utf-8?B?alVlL2xVZTFUY3RqdGwyUWZOQnRPMzlVMllBMTZ0dCsvNkhHQjFpSStQTHl5?=
 =?utf-8?B?QlhoMzRZd2duYSszSlNzVVcwMTJTN0FROXZnM1g0TXhIWXhlckRCdWRkZ0pW?=
 =?utf-8?B?b3ovL2JKYXIrbkRCZTlKeDV0SXo1RTJ6VTJoVUpaUkczdnFoUHZueGdMeTJG?=
 =?utf-8?B?RG5xVDhsSEJpODBDeDB1ZHFzdnVZSDRicmxhS1F2SXNZdmJwS1REL0ViR25q?=
 =?utf-8?B?c29yb1BuTnR3bmNNY3pMUU85N3NTMWt2N1ZzZ1FuSHZwS0dUTDZlM3JacHFD?=
 =?utf-8?B?R3hDeUJaeTR3dWdKcFh4NmF2OUNYZTRtMmZacDQra21CNkF2L1pPd3dwWExL?=
 =?utf-8?B?cE16dWVydUdzSGZQTjdDRnNVRS84UjU1UURFZi9saUJQZkZWckpZZWF2WFlj?=
 =?utf-8?B?SVlBalBac1MzcHFnZS9EaVdYeU9hUDlXcWhXM3VHeXZaQlJEVXl3aVFGNzd3?=
 =?utf-8?B?QXlSSDdac24yVUVyaWpub0FxVjJvV05jSW9CdUJuREtSaVEzVXlZWEQ5QUJu?=
 =?utf-8?B?c1FXL1p0VW45TDE2d0V0TnYvQ0dTcnBXNFlBdVN5SEtrSWxhNnJ1L2tNWk1s?=
 =?utf-8?B?d0hzSDlmVHNlWmd4NEpTU0IrQmFCTDhGZXExM0lGcTRkOTduaGZOMUZaVjcv?=
 =?utf-8?B?eGZ4UE1Vc2NNQnpmakJjQ3JEdVVFbTVHdWdGUzg2NEFIN0doNWpvc2ZVTkhm?=
 =?utf-8?B?UVJFSGcyKzRZeW83d0RmSVBnazFMYndpblVSM0JVaFBzOUZuR0k3NE1DMlYz?=
 =?utf-8?B?Q2tVQmU1RXgzVkhsaUZLWE40R25hbjRZTXlnODZ5WWo1RjFyekpVakNVWjRW?=
 =?utf-8?B?UVFhSFhIMzRvajBqdUhBbEhGNS8ybUZoZkdHeVkvSXNKeEkzSGgwZUVmbjVO?=
 =?utf-8?B?Tk1TKzd4OWh6NlVqOE54SzFldUtzZ0MxVXkyRzRkYXVnTllYeW8ycFAya09j?=
 =?utf-8?B?M0hPeGZVVFVDb21KWHRkdGduSk1xMGtZZFJXUHNVd2VZRGlEZVQrdTBBR3RT?=
 =?utf-8?B?L2pGLy9aeUlYSHdaZC96cXFkR2V4cFRPVVg5dWY5RWRRNWFma0swS3BlTHVo?=
 =?utf-8?B?NExVcEdYbUZTWURGcnNYZlZGdjZ6N3RQRyt4T1ZsS3pSTmRpWkc5WE55WGth?=
 =?utf-8?Q?EzO/7x19FYKHjK4jj90KclBNw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2229dd76-1f17-4761-ed3c-08dad79169c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:54:37.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZczWVMiH1kaeze1aBlz3cjsuxeyEO6rsznBlC11Ff42oBzG+c80KS2G5PlRsLPIitqweOlFl7PYKebtDOehRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

By defining the constant to zero when !SHADOW_PAGING we give compilers
the chance to eliminate a little more dead code elsewhere in the tree.
Plus, as a minor benefit, the general reference count can be one bit
wider. (To simplify things, have PGC_shadowed_pt change places with
PGC_extra.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -70,9 +70,9 @@
  /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
- /* Set when a page table page has been shadowed. */
-#define _PGC_shadowed_pt  PG_shift(3)
-#define PGC_shadowed_pt   PG_mask(1, 3)
+ /* Page is not reference counted */
+#define _PGC_extra        PG_shift(3)
+#define PGC_extra         PG_mask(1, 3)
  /* Page is broken? */
 #define _PGC_broken       PG_shift(4)
 #define PGC_broken        PG_mask(1, 4)
@@ -83,12 +83,20 @@
 #define PGC_state_offlined  PG_mask(2, 6)
 #define PGC_state_free      PG_mask(3, 6)
 #define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
-/* Page is not reference counted */
-#define _PGC_extra        PG_shift(7)
-#define PGC_extra         PG_mask(1, 7)
+#ifdef CONFIG_SHADOW_PAGING
+ /* Set when a page table page has been shadowed. */
+#define _PGC_shadowed_pt  PG_shift(7)
+#define PGC_shadowed_pt   PG_mask(1, 7)
+#else
+#define PGC_shadowed_pt   0
+#endif
 
 /* Count of references to this frame. */
+#if PGC_shadowed_pt
 #define PGC_count_width   PG_shift(7)
+#else
+#define PGC_count_width   PG_shift(6)
+#endif
 #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
 
 /*


