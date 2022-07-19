Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6457937F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370395.602149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh5Y-0008TE-Or; Tue, 19 Jul 2022 06:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370395.602149; Tue, 19 Jul 2022 06:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh5Y-0008Qn-IN; Tue, 19 Jul 2022 06:52:12 +0000
Received: by outflank-mailman (input) for mailman id 370395;
 Tue, 19 Jul 2022 06:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDh5X-0008Ov-0X
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:52:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f7a49cd-072f-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 08:52:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4864.eurprd04.prod.outlook.com (2603:10a6:803:5d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:52:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:52:08 +0000
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
X-Inumbo-ID: 4f7a49cd-072f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDe5K/R3ZfIqyr2oCPK9TWvBA+EP3cLt23cytxrAUlvSm5g5T6tZ72QzluKiBiKm1Xm/1A9CYjVN651Jq/QC1Sa5i6jnuVIzApEb5c0Y4APwVsGPFInLnxcNJ/KoCtyP+9JyYFeR71+LuF1Y6as/Wzdqwxf+4UpP/Oj+rT51OYvOJWsqJ6FmQ0Lqa7ql4KB9ww6Nu32UOImgL8QgINJGVFABxeJ6+j8LYyVtVSMQgcOT7M+H0BWWBms6yINB02q6eQddjZUEZwHGvcwjmX0W2uar2gbwW+lb68/myzNxUE9xlBPgX51miSTGQv9+pKCK4A3JubXNzRIJI5yXQdghnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrLpz4xOfSP6s3F5vbYICU8lK4kwS1kPHKk6aMNfEXs=;
 b=l9pRrY8ivRG0VOWy2y5d8v7+nUGo/VYvm+GiCkAPrvf18vkD0LyR8d/Vr5MvXLjh0cz5oPlQIIaMDNKgYqWWZtUG/cPoqvtqlEQSv3JzCL6mw1PzKArlvaIf3olCMLrMvFiBTBldtbBWXQuInP10AuFFCy+om7OkNsZBGWab9wUOm0/ziOq1N2sXvs5cB5qe0hCRyQkot5ErJWt7UcPYmz7rZeAShw+WfaSfgHybNLcKO/PMSZB7OQTo7Rh2ibIOhQRmqESvVpZVPrCZ/qE5hy9BCN+5LeK3uVdoJls0hIQFSYXh9AXfBupm287UePAVgvMP9+6P1tO599LEDN/PGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrLpz4xOfSP6s3F5vbYICU8lK4kwS1kPHKk6aMNfEXs=;
 b=hOTkYRA6eEm9RqezIcC/K0DmnRO/ljz9KtyC6DKHayzRAkzl8bLXe1Dq63kACn0mTHUGliYRfzcxenR1MFBOEOzA82pukrOkCHEImlW0gsgfeMVi/xR4i7i2eATADbySFEwQyxSLNawFWlqOANYPUFcpojeDA9shaoSRHuYOCNb6TCfT/BY1wpiSVeVeMA9XIYbmiu7nx/2SNWgbaShXt1kSEN58y+Ft5miprmq7/vFczYgwX/ZOIT2/lmb4qMD5Nw/Hd7AGMWZFKkmKIBo9BeIgeNfPP40V0swL+4KHoLqsgNtN8CFCd0JJxAa7Fq8PZEYQRaWGAiHfn38T3T0lbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a13d256-b20c-78a7-54f9-ac094b7b50a5@suse.com>
Date: Tue, 19 Jul 2022 08:52:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v2 3/4] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change() (part III)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
In-Reply-To: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91166a84-8c5f-4dd6-b586-08da695332c7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bpmdc/ERwLcjploZq4GdqYrfSmTcEzwAbjyPtn6Md+Drw3oOC1aG5PSyMkY2pyYOlKpQdBDl8BHPovzg39br/rguvjJLL28+Is+LCnmCcJk3XfA33GakNDQetqkkIX4thDdh/LB4xrzDpFsBE7tAbqUaakveOzLLH7kTfQmBmTTH1T5rppxuvI6upNu/Sgp1Zjluzcsy88dwVdryz1+j9sgQMGdA4BMFm2SUApOKB4dRkYnXaAAF6iCYcLZhg95nnOEplC4ML29l54F3B/GPTp5Dr1+No83tZwprm7IkzVis6SMMB8xj5izsLElnUGVW47E78bOmNxv0D7pYqwIGsuFBdf1t7IBd7y7oC9CXZcczhLzLn0FxZrXD2vwUQuWPWj0STE4KLZhNQcQAT35AxB1vPer29LUwaI/H39Pn7G23Os1CesUr2e3jNICn27swTsE+EgKjm4TyzQaE4cbYR409JVzeJglfkqZP5n1BZSsNWruoz5OUbMf2rVolGLoeflDLgmCqNFDjeBdlKunygzL5O65lo8uvAH4fEkoMZufGQs3qeHf6O/+Abw0MSqdZ/HG5OdIuuOLt2MtSIzt2lrFMLlYkDVwAl5EhjOQuztMdIb6+Rtf0k6vd+AIygtgAxd0wEChCgVSRehU4mUz3I19KXslXghWRBvkx6R6anuaqupc/hpeYtBoNJBtWMM1apJopK/046coArpo2bnchVC8mpodNsaVYVHoUZpV/X4iIcJI7YwPqt12uuCw24kbrTUaHu7BFuvKClu69sEtlwsSViNXUe2mtFnNMqDsDpslzcQRS9Ff3+GA+/wgGHWD3gfWuMp43VOVc3dZ8cUuVLCMcchzFGFpu4KjOdlWZ1CY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(316002)(6486002)(478600001)(36756003)(31686004)(41300700001)(6506007)(2616005)(8676002)(6916009)(6512007)(186003)(5660300002)(8936002)(4326008)(66946007)(66556008)(66476007)(26005)(38100700002)(2906002)(86362001)(31696002)(54906003)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3ozcW9uM3Y1V3FFM3ZscFRpNENIVmJpQVIrdEtTZUdwMzhtbGFYc0loWkFE?=
 =?utf-8?B?UWxNb3hMckNTVjN4KzdSK0N6WENyYWlZeXNBTDI1eFZyNS9jSHZTcXNnYWc0?=
 =?utf-8?B?K2pkaWt0STZBMTRxb0txaVFDV0RVR1JFYmZyZlo1UzRseW1HWXY2WFoydkE4?=
 =?utf-8?B?VmhxaDR2NC9NVzRUNnZBK01GMVV1WWZqY2hnamtRU1N3aHplZW1BUWZvTk1B?=
 =?utf-8?B?OUh5eTVFd2o3V0xuY1plZDJWY1JSNE9MZGR0YjFXeS9LUkRYN3h6dkJFTXJ5?=
 =?utf-8?B?bUxmQlVBZFZBbHJTbXJnSGlvNEh6QVN2Z2gwbTBOa0NiTDJKaEk5UEVreDc5?=
 =?utf-8?B?RkkxYXdKLzRTU2ZpY2lOcS85WVZkbnNQZ3BtNVRWcllTSVh3dXp5Y1lNS2ww?=
 =?utf-8?B?TXNBbk5adUd4MFFKZS9UclpSbWxwLzB4S2k1YXpaeVhCQktmYURaVnhrRFdI?=
 =?utf-8?B?NCtpaUFYUm1DSFhycnNJM1FIbmVuNVNoV0xIUmI3QnNLbktnbTBhMzFIVEc2?=
 =?utf-8?B?MHg4RmRGMThBaVhTaGd2WHlVb2JEMHBGcU1Vby94NmhhSlhUdFNNdGxEVVdE?=
 =?utf-8?B?VjlYR1NNdzFRd1RTa0s4OXlWSi9WemtnN1R3SDRzcGQxVTMwNW1RL045RWJq?=
 =?utf-8?B?K0FUWC9ocHNNdUxaenkzSGpDdTdGZUtITFhoTStJMTBvaENyeHpJUlN6b21Y?=
 =?utf-8?B?RXJkb0FUcS91dzV0bzNZYlZZbmozZkFReDVSSmRuZW02NWgwQnJ3Z2FSVVlr?=
 =?utf-8?B?cDVKQXJZd3luVm9ZcVR0SFY0QVpjZE9xQ3FpamdJWDlVNTB1NUN4NVVVR1k1?=
 =?utf-8?B?V0tDVTlweU9EcDB3RVZOM0RtY2dSWG04clRHM3VUak5XZnRJbHcyVS9Ya1dM?=
 =?utf-8?B?QWIrdEVCMmhzazlIY1JFYnR4MVp6clgxUEYzMUgvTkkyay9mNGdEeWYxOWlp?=
 =?utf-8?B?YzE1c1hBdE9adVVRTW84akpxZE9KYU1kclc4TUdTNGZDN0FmbXBVZy9tRmF0?=
 =?utf-8?B?eGNwMmk0czZTYi9lV0V2TGtBSlA1YS8xS3R2YWd3YmpLZUVCcWlPUWpOemxi?=
 =?utf-8?B?c3RmVkN4eUtWc2pOejdOdHh3dml4NEJ4MGorMG9MRFN0YUgrNjZJdktURHpY?=
 =?utf-8?B?bWdpUWpSZk9qWkd1MkVLcFlmdDFkYTZpd3ZpbjRocHU1bSt5ZWxFYzNSOXNy?=
 =?utf-8?B?S01MazdKMFNKcjFPVk90L2kvUURURnZ4YmxGbjdpRURDOGhobE1YeW5LeDFo?=
 =?utf-8?B?TzRKSnhLV2lkWG5kaUFzZXFFVWVVcWZsUkF0aVcybk9mM1hodXJPazk4Ym85?=
 =?utf-8?B?U1ExdWRkRkx1MUJnaXppSDRHejEwS2RBNlRGMHlVdlZJU3FyMFpFSTA4UVVW?=
 =?utf-8?B?c1M2Z3pGYkdURHFUcUcwc0NpTklRTkIvOVg5M2VLLzZINzY3TmkwS0lZTHgx?=
 =?utf-8?B?d0htQVkzU2VKaWJWbEFac0kvZCtHOStVaDRQbU1BaHRzWEVhYklCcnJtVkM2?=
 =?utf-8?B?V3VVY2lvRjlPTllDYzdLcDRqVjVQdmNDVmhZRHUrd2xpSlA5ZmNyQU5Oc3VP?=
 =?utf-8?B?T2lqNTRKcW5BblorNlYybi9iWlQ1SzluSjFOdXZHL0VpQ1NFVVRVRUo0bE55?=
 =?utf-8?B?NU42MTJMR1JPSW9ZMm9iQThqSWgyc3ZoUXlEZTI5VnRkOXROdkU0czMrMG0x?=
 =?utf-8?B?WDlIdDNBOWRiM0VFd0VGSDgrZ1FsL1p3Q0pINDE4SDZ6TkdWT3U2MlAxUFU4?=
 =?utf-8?B?cDh1TFhUcHIzN0V3c2JkUGxBd3EwME93QkE4NkQ1cEVVQmpOWTBjRUJwQU5t?=
 =?utf-8?B?d1p0Ty9OMVFvVG9aRmRBWGtLWXlOVFdldWZpK3NkaHAxMkJpeGU3bjhSZjlq?=
 =?utf-8?B?N1M0WHBGMFl2eVUzTm93Qy9rWGhqeFpaSzJXZEF3Wk44cUl5WW1HM3NTemFr?=
 =?utf-8?B?bU9TVDJEV2dwdEgwVFErTHpOS1YveDFFbi9Ha2duNVg5dDI5Qzk0WUhJMWpS?=
 =?utf-8?B?UDExV1U0SnlTc1MvWkxUbzhlYmlXTklXVDdwd0pQZzFZNnpTcEVsK2xtd1dP?=
 =?utf-8?B?V0hyMmFlQ2VpZ29rOVR3N0JBZk92NGxqUzJUNFlZL3psK3V5ZVFqVzFNc3Fn?=
 =?utf-8?Q?LQg7qhwP8ck11LEWcbVkV2Wrw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91166a84-8c5f-4dd6-b586-08da695332c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:52:08.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4cI/4PVXw21SdIx0mi9sPBUHYLZX9lQSbdFPPqtg5EYdeFnRfGrg0Xj8oeJaLPlo5qxzZGblnentF1fccnQxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4864

In preparation for reactivating the presently dead 2M page path of the
function, also deal with the case of replacing an L1 page table all in
one go.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split from previous bigger patch.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -847,14 +847,9 @@ static void cf_check sh_unshadow_for_p2m
      * scheme, that's OK, but otherwise they must be unshadowed.
      */
     case 2:
-        if ( !(oflags & _PAGE_PSE) )
-            break;
-
-        ASSERT(!p2m_is_grant(p2mt));
-
         {
             unsigned int i;
-            l1_pgentry_t *npte = NULL;
+            l1_pgentry_t *npte = NULL, *opte = NULL;
 
             /* If we're replacing a superpage with a normal L1 page, map it */
             if ( (l1e_get_flags(new) & _PAGE_PRESENT) &&
@@ -862,24 +857,39 @@ static void cf_check sh_unshadow_for_p2m
                  mfn_valid(nmfn) )
                 npte = map_domain_page(nmfn);
 
+            /* If we're replacing a normal L1 page, map it as well. */
+            if ( !(oflags & _PAGE_PSE) )
+                opte = map_domain_page(omfn);
+
             gfn &= ~(L1_PAGETABLE_ENTRIES - 1);
 
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
             {
-                if ( !npte ||
-                     !(l1e_get_flags(npte[i]) & _PAGE_PRESENT) ||
-                     !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
+                if ( opte )
+                {
+                    if ( !(l1e_get_flags(opte[i]) & _PAGE_PRESENT) )
+                        continue;
+                    omfn = l1e_get_mfn(opte[i]);
+                }
+
+                if ( npte )
+                    nmfn = l1e_get_flags(npte[i]) & _PAGE_PRESENT
+                           ? l1e_get_mfn(npte[i]) : INVALID_MFN;
+
+                if ( !mfn_eq(nmfn, omfn) )
                 {
                     /* This GFN->MFN mapping has gone away */
                     sh_remove_all_shadows_and_parents(d, omfn);
                     if ( sh_remove_all_mappings(d, omfn, _gfn(gfn + i)) )
                         flush = true;
                 }
+
                 omfn = mfn_add(omfn, 1);
+                nmfn = mfn_add(nmfn, 1);
             }
 
-            if ( npte )
-                unmap_domain_page(npte);
+            unmap_domain_page(opte);
+            unmap_domain_page(npte);
         }
 
         break;


