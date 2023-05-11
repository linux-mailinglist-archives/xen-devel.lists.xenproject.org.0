Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F716FF0B1
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 13:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533278.829805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4oj-0003Vh-UQ; Thu, 11 May 2023 11:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533278.829805; Thu, 11 May 2023 11:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4oj-0003SP-RD; Thu, 11 May 2023 11:50:41 +0000
Received: by outflank-mailman (input) for mailman id 533278;
 Thu, 11 May 2023 11:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px4oi-0003SF-GZ
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 11:50:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bec8b00-eff2-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 13:50:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 11:50:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 11:50:36 +0000
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
X-Inumbo-ID: 0bec8b00-eff2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2r1doIJKrri6xCtuE2h9fGPWLuOUScI21erUdxDED3Nc0+zVe2H2klan8xFABFWNApAq4xMGqPV0frT4GNb8SIUWPY237KpRgTuo6kDPrJDMmk6UVwtFb7yk2gJw/oFx+N/H7ORo1fv4DwIHLjGjrDVG08Qytoa0MY3U/PMDEKSlYMQKWMZsj+efVLqUryHnbLCGpU8E3cqjYCaoKNGkEkN8o/gAuMRPNQpoVoiic9qG8OBZcJj1OyvsFPjjqD5EfB0OlgZfWAo4Ic6A4lrwEKtG9lBNBtOzsS7Slmy1GYzp0QQ5mhHlDv5B4BM/bq5RgShKymwLQmyIrY7SW3I2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfX++Q/GI7gjOd68wAklq5PlXbkjPE/BHUhHueaKu3E=;
 b=enUGx60mKvujOcQMkiUT4Ecr6XvJWFbUF/jrmzjUDUnaDdLs6h2sqsO269cp/VbxmDjc606omf+XWmeL+ynTDH+b7cFSjVnv7aslwXZAtCuX6gFn6P0Uh+1gpCQfFNQAVK71tLtdSPNtM38dM8/gO/KO83PPIgwabG7msKtcUM30mrxHot+QNwz/M+hm0RuSvfObrDgLBshYiPo0pGFlbKcOxaKpVojGjzIjE6E4SgskkiIFYWDe0Iv0Wwh8Fz3ikiuc2delsaaIcCWLVV6g99dGdjM5FbUq7Csli3ifkVMD/gRduIt4eMlBIa/uorHgFFfVCYt1alXY4F7RC1jcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfX++Q/GI7gjOd68wAklq5PlXbkjPE/BHUhHueaKu3E=;
 b=Vk7NyzyFtRuaYgl/A/fAcsYHqUUIUQ8NZwoRyG15J9S16wypfFff6d/L3tvHYXiGLMDJEJHeJuJzIKALdoU+oqrK9tTZsuhgNQ43SXZztit1Uagx+ru8iUzrW6ORSDbEaZtgrC1sbOHywTXESvTzUu0hSBJhG1n0f87/QThLa/eRuQGiOwazcDJgciEKsSkai1Ynr9vU0SyAlu9S0XEHy1D3C8urBDZmS/gKyCLhDjCX2/DfriBm8y8Ae3rCkFRU8f1oFnn8/VOwrsesm8QkUYatgKZ9D+CTqSYRs9h+7xe74vXhtgrpehE08i+B1Z5aBzlW6g5o4h1hbvEz8IzkIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <060ae425-2daf-9ce4-d291-215d483d592d@suse.com>
Date: Thu, 11 May 2023 13:50:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vPIC: check values loaded from state save record
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 792d20a9-834d-4a4c-f221-08db5215eede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NHO8R71sjy0wPHJeBw5EChMPMCffsYN2eaRrDS+ChaO5nwl8wxTrUGomy7eALKNM6RlIEBoHR7JuvQARfU7hJeAUaK5ywQxJ6FExZub4ShIeR8SZNwLCnx7fIhgEbQF7m7F0TcxsuFLLuZshqMu8ITQgtd71IPM0kU2npFIpcC1ZNUykt1aOaNUVAdZQsLksBwWE2juCuowkEVtDwlgC7BuXM4mxtYvCRik89zsBKMx89ziss+Ko3+rgQVgrxhS/5Hl+hAPAtLEldmuxv5HCCzlYPOAnIRLsEnAPfTU3tDE5g8Y+mtMopfXPObLz6vpqVwAwI04KFpCPAX9gwaDEG4+KecHz9bGsqwrOhRCR3ExwZJQd6B1HwbrAb51JR0bLxk9brohxCHinCH/TvRZxtlLsztnvEQrCpq+xe4+IGTkuwKKBeOeyzbmT9WN+UzWeHNJ/Oij7NpzZ8fBMkas9145/wLR7Ltai9KoSn2uQ8ux44q7IdxxOlxtXfqL/TEInXFADfXhXTbdxx+R1F1UABtySNVVcdutSk41elXdvvQbJsKns2UGR7Hm6oV4RaorvSo8Ootu4tPYjRXF1PXJ6mQXk28L3W9+8Vyv01vY5dJS6ASk4gETPVTLF+2qPjrEmuLdgoq1wdcrMIOq7BMlxHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(66476007)(66556008)(316002)(5660300002)(66946007)(4326008)(6916009)(31686004)(54906003)(41300700001)(83380400001)(6486002)(38100700002)(8936002)(2616005)(8676002)(6512007)(26005)(186003)(6506007)(478600001)(2906002)(36756003)(86362001)(6666004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFoyNEhzTmwvWlpGM1dYdUNFUTlmbjVvMHpJREg2UU5mQm9PTjJEYmhPTEty?=
 =?utf-8?B?VXMrZC8rNjA0QStxVzMvU3hRNGJqcGkvTHNVSUJaeEg3YjdDZHNNZEg1VlYw?=
 =?utf-8?B?djRzWktlY1RLQS90dTVRLzFZeHpndVYvSnU5Ym0yWExyOWZib055T0FmZy9B?=
 =?utf-8?B?dWtMV3BSY0ZLVjB5bVFIVFVUbVBzbk5LY0pwcS9QbXpWMVlNanRuNERPMTN4?=
 =?utf-8?B?bmQ5MG9lTEhmSS9JeE56V1ZtUlVTdHBIUHAzMTBDNFM4RTZWdUhsRzlCb0RT?=
 =?utf-8?B?VGdnR2tVN0NzSW9aa1Zrd2NQdHBpa21qYS9FdkRUa3cxOVdJaGluSFJMNGFp?=
 =?utf-8?B?N3JhTlphWW45akJsTnJWYS82dHFCQjBpRFl6Yi94cHNiU1ZuVlFtbXBtSWxX?=
 =?utf-8?B?V0NWWmw2QmtGenYxZGI2THppMFBEWmYyM1BibHNDRTBKek5RQXl6RzZ4QVYv?=
 =?utf-8?B?VzFqQU5mU2FoV1RHVzk5a3JGZ3FJVnQvV2IzUFl2QXJLdXR6Zi95QXFVU1h2?=
 =?utf-8?B?R0dwS0swUjF5WFJtdDlKMTM4OUkwWWdWS0ZVaGRIanRpdkVsUmtSb2o2dE5n?=
 =?utf-8?B?WWFnYXZkS2FPeHNWMjRxSTZHTUJNMGUzTmQwcVVLaFRzejJBMjhGQ3llb0pk?=
 =?utf-8?B?ekVsY2hsNkUweU5pRjA2ZWxkZnk0NUVTTVhLdXZNNmNjRmkzU2xETlNsNXVp?=
 =?utf-8?B?Zm1qamEzckNhWitubktqbnRHQ2J5S3l1MW1melhrTDRBNXFGSm1jVi9nRGY3?=
 =?utf-8?B?TFRhcHBWdVVDRDJpTitKSlp1Sm1hamNDTEdLTUNwc3VBT01hdzljclltWC90?=
 =?utf-8?B?YnNQeXNMNkQveEc1cHJOdHJRQzF3VWEwV0prZDhSZUNDTGthNVBjQk9KRUFF?=
 =?utf-8?B?dkYwSzc4V0VEcnNhRnJsUGhjSU41Z1dkOWdEeFh3WG5DMXM4dWVyclFYVVdv?=
 =?utf-8?B?MXcrOUNYS1Q2bFBsWks5RkJydm4xUUtYR0Faa3BpTzZZNncrUmx6R2tuSnRu?=
 =?utf-8?B?MGdlSFpYRUIvcEcwaWpkaUJEWDUyVytZdXZiQ3BKeXhTV3BmR1N2YVZnRUp4?=
 =?utf-8?B?aFdaTEVZUFE2VGFYUjNCT0xzV2l3YWpqdW5jcURWVTM5M2liVTl2MDhIUkhq?=
 =?utf-8?B?d2RtcUppMjlaMjFyRk5IZXZpY0doaWZrVnoxY1N0S2tWTXVjNXpTQVQyNDNH?=
 =?utf-8?B?aFJVZnBNZGxkeGUwNHBQMXY2TE5zRG5WMkE1Vk90L2h0MWo4Ylo3R2xkWTBS?=
 =?utf-8?B?eldib2ZsUzgwaDhQNFlSYWdQNVlPVlhwWm55eklyL0MyUXFhR290eTNndGFY?=
 =?utf-8?B?K0tLdnRoeXNKeC9kc0R3Uy9sTmJkNWJub3ZqMW5vaGJiVGswZTFKZHU5N2NW?=
 =?utf-8?B?NXJkRXhoNEFhTXkzK2Z5OG00R0JyMlVpejkzS0dwWVd0L0NkSVRnTFNDLzRG?=
 =?utf-8?B?QjJBVGE5OUxmWVVtb0V1ODd0R3c1c1Z3Uk44NFdsaVpuUnBNR3JOaWdSTG1X?=
 =?utf-8?B?VE51WG1mSFdzWk5QQTJldi9rLzA1OXJydzNkQVMxUWtQbEloK3pVUWY0Q1VJ?=
 =?utf-8?B?YzhWWFFLbWVCaWk4emV6ZTJtSm0ycnB2K3c4bWFxeE82aHNpUzRIKzQyOHk1?=
 =?utf-8?B?M0p1K0psSWoyVmZZOWFRNHUxWDFOc3I0QTFYcVpaYTVSakpYcThkeXJ1bkhL?=
 =?utf-8?B?NnY5QUlXV3NxMVRXYVMvc2lFMEdHbE5pM25mUGlOSDFpYUZwMndKUWo4Q0R4?=
 =?utf-8?B?V25EQnlwY21mMHBFNXRHUyt2eW1uUDRyU1gyeUZzVnBUK3BKTU9HOE8rTnA0?=
 =?utf-8?B?WStCTExVZnZHZi9Rb1FOVGpNb1VUVGZMWEdmdjI1Rk5CbGM0dDFqS1ljTGlD?=
 =?utf-8?B?Z0wvYzAzZkJJQ0dhR2lwZG52WXJJTVhGSENSemJteDFmU3FIZjkybzNsNDU1?=
 =?utf-8?B?N0RNRFJpb1k0dy9oSlJ3Y2RIM0NGM1l0ZU1XTmptTzE2aFJKL0xWcGFOM1BO?=
 =?utf-8?B?OFZyY2JBMmlNTG5xdEY5WWFpVmY3S00ydGxLK0FvMnhoUEdHRmNyVC8raDc1?=
 =?utf-8?B?VDdPS25UVmFsT2xtNHV6N3pnbEkzc25lbEhMYmNQS2VyTlRCRWtuRms1TnRk?=
 =?utf-8?Q?7Y83XWYjvVMyOHn0qT+wfuH9W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792d20a9-834d-4a4c-f221-08db5215eede
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:50:35.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dHY9LnykJJGKvu94rhDk4ZbSNen1BGAB8GIHMZv6ZNXQ64mSFUAJgpU1ys3GwRKB6O3X2EEfI79wijnTgyKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9071

Loading is_master from the state save record can lead to out-of-bounds
accesses via at least the two container_of() uses by vpic_domain() and
__vpic_lock(). Calculate the field from the supplied instance number
instead. Adjust the public header comment accordingly.

For ELCR follow what vpic_intercept_elcr_io()'s write path and
vpic_reset() do.

Convert ->int_output (which for whatever reason isn't a 1-bit bitfield)
to boolean, also taking ->init_state into account.

While there also correct vpic_domain() itself, to use its parameter in
both places.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course an alternative would be to simply reject state save records
with bogus values.

--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -35,7 +35,7 @@
 #include <asm/hvm/save.h>
 
 #define vpic_domain(v) (container_of((v), struct domain, \
-                        arch.hvm.vpic[!vpic->is_master]))
+                                     arch.hvm.vpic[!(v)->is_master]))
 #define __vpic_lock(v) &container_of((v), struct hvm_domain, \
                                         vpic[!(v)->is_master])->irq_lock
 #define vpic_lock(v)   spin_lock(__vpic_lock(v))
@@ -437,6 +437,14 @@ static int cf_check vpic_load(struct dom
     if ( hvm_load_entry(PIC, h, s) != 0 )
         return -EINVAL;
 
+    s->is_master = !inst;
+
+    s->elcr &= vpic_elcr_mask(s);
+    if ( s->is_master )
+        s->elcr |= 1 << 2;
+
+    s->int_output = !s->init_state && s->int_output;
+
     return 0;
 }
 
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -329,7 +329,10 @@ struct hvm_hw_vpic {
     /* Special mask mode excludes masked IRs from AEOI and priority checks. */
     uint8_t special_mask_mode:1;
 
-    /* Is this a master PIC or slave PIC? (NB. This is not programmable.) */
+    /*
+     * Is this the master PIC or a slave one? (NB. This is not programmable,
+     * and hence is ignored upon loading.)
+     */
     uint8_t is_master:1;
 
     /* Edge/trigger selection. */

