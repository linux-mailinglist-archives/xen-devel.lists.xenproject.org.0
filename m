Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728B5816FB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375533.607991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN5c-00009e-4l; Tue, 26 Jul 2022 16:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375533.607991; Tue, 26 Jul 2022 16:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN5c-00007M-1z; Tue, 26 Jul 2022 16:07:20 +0000
Received: by outflank-mailman (input) for mailman id 375533;
 Tue, 26 Jul 2022 16:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN5a-0008Mo-2k
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:07:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0507d35a-0cfd-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 18:07:17 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7772.eurprd04.prod.outlook.com (2603:10a6:10:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:07:16 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:07:16 +0000
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
X-Inumbo-ID: 0507d35a-0cfd-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktA7nN6zAq3AbE/KoNY5DyGI/cFOI3j9W01sKmpKyZnnbmK3MsBWetaWpAY3JcSfpoRRBAbuxK0AOhLeAPgbsYG8VcgABGzpHA75+Afb4dYZ9VpZP794ichuy3vTEJ61ETHFffW6Yt7qLxpPG5CzLz2EUU1mnjyvziEMfXYQKdvvk5bBNFpA1NZezgHAhHfjY1UIKtzLfiH7hEgFJaI1BSrKlWRoDHr0CFsZS/hEG5i/d8OzS3n/VQ5kf3e0XtopLVRjU3yaP28YIllUK7EdH6ZC3cGe+bJiTI1cH4RREJ9Yj0FWVB2h6HUZDY06NL9Soxz87lAsr7Zc5pmWwUO6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HL14tmU18Cp4BQe+e29MGYjb1FaYInGq5siSnr2Mod8=;
 b=e5EzArV5hs+bs9alpdeSnIT3UBGaljOZScU80EqjLPSwv6Cwgw1565vzTAyg3LszDjPswjDbcmqDdcJ02G2oLt0WrcDM8AFg9KqIJM70InhX27BXdGcXK49R6mPwOJoV4QUkGrYMhcMrFzSdYiBnmzqUZ8CeI6GqxLjgIzvG4QL0v1j2QNUMfBIWS4Gg578gUEzDcHClylGeLAKiArf1fE/EN7y4uvLWvLQLgd04NM64FZ1ThOanwE/SyIivw4HKPXS8eT6tvBkiZSwgJ4scGP/LSobkcB1aDzmIeOJfG8r4Iwj/bSirOlKAUZPEFM27+7f5pdniqyYFFYgyhER6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL14tmU18Cp4BQe+e29MGYjb1FaYInGq5siSnr2Mod8=;
 b=1RP9IRPEu0sGKc2jeJcgcP75xp4XaAGrfVyBSqznNo4ZEpGAXtfsBa7WvPyZmh85yj2UFFItWpvTkIHLsP3FbXFRYJII42a0ABejipRsBJsJU4O488WCNeyX31o6PDnLurs4pXBvKH2OO7LzWBGtb+71nRsUOxjrhWS8sNq9qiQzybWV8Uwm86VzDxfG4xK+mQyXlAnsxbxuyCYWaMJh5+aWwLXHnGZ2fp4ICn87dLbIkh1x/o/uKD+pAitFaXzF1eYRjcPrCfVW13z4n2MGmR6ESjJGDD+V7mwjKhn5r2mMQDf2HPxRZnVTpqvD8ZN7sSPf7ha3BWwHF5W2xR3BEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8f707e1-528d-b372-72f4-610939acae0c@suse.com>
Date: Tue, 26 Jul 2022 18:07:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 8/8] x86/mm: re-arrange type check around _get_page_type()'s
 TLB flush
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02585d12-4562-4112-7e35-08da6f20e8a0
X-MS-TrafficTypeDiagnostic: DBBPR04MB7772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AEm64qTKRLumjDJ+ucK02p7g+pZezDTZ2RP7QbEuW0e54AWKo+OJWG9wC5rY03dpg9f/EN6OYhihtHyeRlh86zudoQBLFFi9H+GLTWmhvga6O6KikRBGz4wXK/RVdG3qfLPrAzfCNN+8DIYIGPlvoCD0xmlABbmCdzotrqkEuXnKQQobFq1U090zN5uZ0/acLdDUlSgHkANjirtkNmwqcGh5yQpM3+tmlZ1Tz/OclR+gzOXuLMi3ZvxQmLwLoFnadn0nHtgbcvy8JSWMiT5LRYI+1Rmjz5uV8NAHu95n70RSXkc7lPoZ4n4HeorFN6TaE3pwBGUelwYbTcR+rakh0hzCdIGA6+d+h3dd84iJe38Xf7br4gzgSX3n0lbOsRqIsCj3+g50SS8nvhNgKR6V9BWVvEGFquAa9OL8+43828GAbZIZ+NX6ybW3/1JwgdnyltkFcwM97rvU7RY1JmtEWZzhUw33GjwrDiZKHV4WqAz4sSbdgUTTJamL/piiNXjOOVEIG440SMBHylLgVQoX7ig73zs5jzS6JpjjmXhF5BIykxwc4FjOTjfvvKeJCZhZgyuYQEPoQp595cQCqHtVamBrQzowODUWd3pE+l57K1o9s2Wc+92dMpEU71qXmpYS4H2iUoPbSO6SeCrT1Rv/34is1qOU9ludAvLL4/Q3LkrvC4Uy1D2aF2ab5htS6oNH/F+A5mKiDaBIJVJZIP7S8k44jZLJwCH62W/GG002MwBZ7hbe/A+OrjMFAJcPEzv+Hid7e3n0ROuTZRxAvTGb27aJNwszO8O1bCnlPgwtELZXfrBfNf9k+Ut3bu8VZKON0QeOMRTK7ETDPsFGCPwDEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(366004)(136003)(376002)(41300700001)(186003)(2906002)(6506007)(6512007)(26005)(5660300002)(86362001)(6486002)(31696002)(478600001)(2616005)(8936002)(6916009)(31686004)(36756003)(316002)(54906003)(38100700002)(66946007)(66556008)(4326008)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjhvMGtOMU4xc3BZbU8xaHFveU1zVWtOWW5VUnFxeFJaOEgyUkVwM25ZdDg3?=
 =?utf-8?B?WVMrK01vL21jRGM1OVBzL0FnZmhGTmV2S1V1eUx0cDl0MU84cVJyK0tSRWMv?=
 =?utf-8?B?a0RkdHpOMzJBWitHdTlqRkFjR3Z4cEJUZTd4Z0sxSDhwOVJvdTdsTGNJQ1VV?=
 =?utf-8?B?VTF1N1QzLy9UMDcyTnBhbUhzb0hkKzNtL2xrOFppbjZJT0VLZTRyZGFZOUtX?=
 =?utf-8?B?T3dvT2lnRGRib0kzdGw3N2x1clFBM0xldmZvWWovMHl5c2RKTTBWMlFjQUdS?=
 =?utf-8?B?d1FmZW96QzZMdDk5Sjl3TjFzR01LNVpsWHFRdFdZR3NudCtSUnBsS2RMR1ox?=
 =?utf-8?B?R3BWQXl3NlBzbmhDTzB6RmR2RjlRNHIzSkxLUzJvcENEOG12WXB6OE84YlpT?=
 =?utf-8?B?ZWJobUlVZkZxMXAvNUZONXFRa005bVJESDZoV2FVZ0dpMjdqSzFRMmZUeS94?=
 =?utf-8?B?ZFVuZ0xtRGlad3FVdWExODhRU2xBNnc0U0xCQjRFTjc4UjBIM1dCZWRmWmw4?=
 =?utf-8?B?aGhXNHRFYWdQWDl3MmE1SllkMi9rK3J4dGU5YmtSSXhTME9VbEtPRW83dXJO?=
 =?utf-8?B?bllFVE9UVFhuQ1dFd3BBb2lhdVpVbVRYVXRlM0NiMlhlczIrU2xYSUw3RHpH?=
 =?utf-8?B?ZGd4ejI0QzFUTUxOSXprakx2RkdNUmc5WFduZ1FYamowTzBjTXlyRGZDWFdW?=
 =?utf-8?B?UDUwVjNGdEp4L205SFlHbUt3RWhjMUpJNTltMDJRSGdqcFhZTWt6OW1DdTYz?=
 =?utf-8?B?UVdrWm1wV1hDbmRVQkVCWC9yelBRU1o0UUU1S0UwTDRIcWdaVW5tWVZNRzhQ?=
 =?utf-8?B?M200dmhaRThFZVJwb3dJUGhiOFN2Z3Vtb1RPVmdCYWEyaHZoQVRxYmYrVkIy?=
 =?utf-8?B?QmphWGM0bjNFZlVvdGxRajFVeE5PZ2JxQVcvc09XL3FGT0dadG5vK3V5amxR?=
 =?utf-8?B?TXV6bDZDWUlPcXJNUjJsRk9VV1dERFFQcU90dWRGRU56U2JISTZjNE9KMS9y?=
 =?utf-8?B?TGt1L2hjcnhYL3RRdjBmby9kdXpNd0JPdDdkWkJyQzNlcHQrS3dNTnEvUjgv?=
 =?utf-8?B?K2RHWWZib3VlUnRNZmx4QSs1elo1Q0tJd00vc2JaNzdtMEFUbE5ROHhLdGNP?=
 =?utf-8?B?VGI1VlNlbllBY2VnS1lGeEsrQjg5RlYxTG9ZRTNXMkNBUFZIVXRlbWN1Ujk1?=
 =?utf-8?B?dlFaL0RkcmpVQVlXcFRSejFSTERhNk9SVVIxdjVEZ0U3ZEFSNVpHQ0NRK2Fq?=
 =?utf-8?B?OUFJSkN0OVFxT1lHS0NHTmt3bkVxMERNTjlhSzBJWUVnWWt1dSsyMW5kVWhr?=
 =?utf-8?B?MFF5NGR5YkxkQ3pGQnNzZ2swVHVndHYzUVhYa3hNa1g4amdVZkxQaFpyMzdC?=
 =?utf-8?B?OGtQcld3d1NZUlBDUDFmUExlRUphZDA3QlRIblA3cm15NmkzbFNjak9sQW5W?=
 =?utf-8?B?N1AxVVRBeTgxdWdnNVp5Zk12bGlyVjgrY252SlJma3dNcGRhWituU1pvdUp4?=
 =?utf-8?B?VWRzZ0F6TzA2aGtkWW1SbDVPZUhkODFlTlk5MXdHSHk5d3FFc2R6Q05Fa2tZ?=
 =?utf-8?B?WmFwMWtjNlVoQ2VKdnZoS1lWbndzRk1ram5haHBUL3NBSlhwc0VvOGlOejVE?=
 =?utf-8?B?VXJNSEpTUTZUaXNGSDVUOXpkaVVTMGpaZG5RclloUWpSRmJMM3NFaTdVQjZ5?=
 =?utf-8?B?bGVCa1Z4VlVwdUdPaS9qU0ZBeGptQkRVTFp4SFFXMitmR0txNGRrNWxPcUph?=
 =?utf-8?B?M3I0dk5KbXROeUUrVmQ5aWdzVUlJMmRERS95bjI0NHMzM2VaVFdoUUtPeS9k?=
 =?utf-8?B?Mzl1NXY4WmhwTzFoRFkrTEJueUt4Q0dkdTkzR0RjdGd0QUlhVENzRktFSTh4?=
 =?utf-8?B?dWhMeVFxSmc2V3RzVkV2WlhNeTZud3BranJKZWdpTHUva2Y3THdsR0tyOXpa?=
 =?utf-8?B?S3Q3WGIzd0tvQUswL2tyTEI3cWZtM2tHc0VSQUJjQ0I4QVlQM3c3emx1eUZn?=
 =?utf-8?B?Q0FCRmpqVjFPMlZ4ejJNcUtDWGQySHVQQU1iVnVaKzM2eFQrcWNJYWJpTEla?=
 =?utf-8?B?NFpSTWNSbWptZ09aOVlZV2pvQ2g5L215RHR2dnRCM1UrLzdqMGd2UVNVTkJp?=
 =?utf-8?Q?Thz2Yo4iHXiyNnOzFMWJa78rI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02585d12-4562-4112-7e35-08da6f20e8a0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:07:16.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RAwXEg+VBe2dvUhRn8P4KhIOD6Wx6vlAzPCvE/pHmR7lmRq2t+frp0eeMrxQC51zGhg9tSMOnwHX/zxvTo4hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7772

Checks dependent on only d and x can be pulled out, thus allowing to
skip the flush mask calculation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3020,7 +3020,10 @@ static int _get_page_type(struct page_in
         if ( d && shadow_mode_enabled(d) )
             shadow_prepare_page_type_change(d, page);
 
-        if ( (x ^ type) & PGT_type_mask )
+        if ( ((x ^ type) & PGT_type_mask) &&
+             /* Shadow mode: track only writable pages. */
+             (!shadow_mode_enabled(d) ||
+              ((x & PGT_type_mask) == PGT_writable_page)) )
         {
             /*
              * On type change we check to flush stale TLB entries. It is
@@ -3035,10 +3038,7 @@ static int _get_page_type(struct page_in
             /* Don't flush if the timestamp is old enough */
             tlbflush_filter(mask, page->tlbflush_timestamp);
 
-            if ( unlikely(!cpumask_empty(mask)) &&
-                 /* Shadow mode: track only writable pages. */
-                 (!shadow_mode_enabled(d) ||
-                  ((x & PGT_type_mask) == PGT_writable_page)) )
+            if ( unlikely(!cpumask_empty(mask)) )
             {
                 perfc_incr(need_flush_tlb_flush);
                 /*


