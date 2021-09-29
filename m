Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AA41C4F0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 14:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199048.352863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZ09-00045u-0G; Wed, 29 Sep 2021 12:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199048.352863; Wed, 29 Sep 2021 12:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZ08-00043t-TI; Wed, 29 Sep 2021 12:47:56 +0000
Received: by outflank-mailman (input) for mailman id 199048;
 Wed, 29 Sep 2021 12:47:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZ08-00043l-3W
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 12:47:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3070277-e099-42ad-bdc4-93bb23a647a6;
 Wed, 29 Sep 2021 12:47:55 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-tbeCnbqfPpGDHa0oJfEM6Q-1; Wed, 29 Sep 2021 14:47:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 12:47:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 12:47:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 12:47:51 +0000
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
X-Inumbo-ID: b3070277-e099-42ad-bdc4-93bb23a647a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632919674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q8LufTiCUQsqHdGqUe2Z53cyWIXeXkkmydlokoMNKK4=;
	b=kPTfCItiHOrWtNHOct9XOIQqtVtE9DMBcezRIlUc8tqUS9Sa5Au8J32Rhk2H3r+hvnoPHz
	hwhBnsQwZ8IgSmsAjBbdZWRRqA+1GYfv3NRw/vXl/9q1oqT7qziVC4EUF10yWx3sQj7s4D
	dn4Hl9Tc0ZLlJiz0bQky88DNy+jNMMY=
X-MC-Unique: tbeCnbqfPpGDHa0oJfEM6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5Fcwr0jtB+7+qt66ta0uxT9Of0oDiet3IpknjAG0d8ZHMeWV6bFznNReFVNYITq841f9ovvlyMhbqNrhvfmE1dIibPq1UCCejW142TTMWMZUoBLDHF58yyLqMj9GaOxifxvXRzu1/Gnm51AEf6nnHKEg+Y57ejCMqsvrAE9TSt6RTsbaV5V7bdtGCV/TFh9CgtcfUxM8w853YdMYwu08PTPYu57LmUT7BcO+970fNSjT8hp2AtEpqtnLP6rwNNVCtblYADTOSvF2Nyp2ZQAThzsStox2yJRpIpSf5ySyj6LzyKF7SpOAaNcFNtYBj5djHaft646m173nbNBpP3yKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=q8LufTiCUQsqHdGqUe2Z53cyWIXeXkkmydlokoMNKK4=;
 b=YLnCyRzo0kE/YJrwz2kjctT2hXNrEP3cagd4FtkV86V9kf0D7fTBDpt6dipHjlIT0VukC6NF3ydMJXOOlq+xYu2uuO44/DpTXpYZkP07YSGelNWXKrPdV25Yh3nrNZqSUkT7Is8xkjD+CQk33wASxyHVH+pMx3P5obOFkEBgk0pD2Tfnu1hcs2tUQkfcu6IU9ZlYZiynLOd0btkI56on90bpAnqWo7izrQQsazKgTicY5t0I498YM6LbMD9NnZZ0yYbYWHQ3etU+zjMRimgTqD3DBpyDZw5LGbQuI4bc0UZJz7zn/1ICXqn4fsaayeDdPQDuy/omc/T5hiDZHwRRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/paging: restrict physical address width reported to
 guests
Message-ID: <e0acfa40-0901-2fc9-31b6-c2609625de22@suse.com>
Date: Wed, 29 Sep 2021 14:47:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57e79f26-3d35-4cbe-9f64-08d98347594e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57413B7124CCBA9D363504B0B3A99@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2hzOjIQ9Kj72tyCwMqle4AvB1pBoQiUiSlU3NkqItd+KD0WznVSiwXEcIZUX0JifQQ/qVGkEZrRIR2V+ftRtXrBmPgRoQuJv1I7ApVuY6gWlZ++u41I+nedar0XC0rCaO12D0Kt5ahWJld82v3Of1osVKsJMJY1hXw9VNC9L4OBDRSax6gOfIExRRluR1Nfo0UZertX8sI3ho1mXSEr3WirQgiXwhthlcvdBSvMPB9JhJeckiCuOYoLlTYFVRu4g3wypEKS40UhmkyhYVPBbvsv7lG3o8Z2ZArx8RbHTDYDStFOLwLap2PvfSrvNI5/NTEItk6hzGAoujxI0JALrtD3K9DDuSSrWFshXc2Kor7G6BqwQnziD2PDZqEnF3HszbAaC7Pdua4w5SEUKLM9n0sBRJY3PIHS6QPPpDmsyPuKZIX+ajGQnWGPNzp+k8zevIGWcjZawjTnA90ot3jNS5IT/ekMuqcclbEUuZ1h17xNBFPdLTzOcuR+1eOQbFvVRAt03QBiV0Xww8zF8NIokFJdOWAgsL+DdptweIXLuEeZzLo2M88a93/AzdjicwLOeAquUBeEOkVA0Q3OM4mDkLlKVmNEsJyxmgucikYwcyMxqTujgJwenD1XJ7G0dXpmFJzRQFi9RoxIjoZie7BMYoBvEOkLLYAd0FuDcA+gEKJruyA6m6YSl8IjQWi0pYhMltMzfpOjlC4d4WweVWLS11bdDfrt48MKHi7lyP5KPE8w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(2906002)(66946007)(38100700002)(66476007)(956004)(8676002)(54906003)(36756003)(6486002)(8936002)(2616005)(5660300002)(31696002)(31686004)(508600001)(16576012)(4326008)(6916009)(26005)(86362001)(186003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkNOd3lZcmY0M1RqeE1Bc013MnFuSitzK0tDeUxYYmRhRjZPVTV0RlZueTZE?=
 =?utf-8?B?K3JpMkdJcDZCVldlK0dRZy92NTdOeFRHUnVvWXJvZEREaGVIU0ZnanBYMEdu?=
 =?utf-8?B?V3JQWFpldEVKK2tjLzF3WWloelJFRGNMMFRzQU53d2VkdEtEaisrRkpiRDJn?=
 =?utf-8?B?Ymg4cWlFWkRLSDF4YW1yMjNoalpUK2VGeVRvMEU4WThpTS9VYjhLZ01OYUF0?=
 =?utf-8?B?QXFYSWxkdTlqOXhLL1NWZng2VGxCeXkyY2R5RFhHVmE4UVZMb3N1aXBuOWVr?=
 =?utf-8?B?VnBJTGlxb2NoOFhOVkFmMEpiTTUxRldpMUg1SlVYajJRL3NrOTEzekt5UUJZ?=
 =?utf-8?B?a3F2elNrRDZnZXZpNVBzajhPU21BcENOUHBzeDBEbXVFb2NMQlBrNnFaN2Rz?=
 =?utf-8?B?Nm5WWEVaMERYMDdja0c0SVg1dy9oaGNHdHJjdmtZTytxWGp5QzErbTFnK2h2?=
 =?utf-8?B?aWR5bThacjRaaFNtbEtMMDJjVFRXaTBidjRmaFZET0tkL3B1U1V0dEFETXBH?=
 =?utf-8?B?N080WU5kUWlBV0YvbDdVT1ZJQm5QelpZU1R4dklPSWpvR0FvMU81VDUyb0Rx?=
 =?utf-8?B?UU9hOFkzcGdxbDVNNXZSSU1ZcEVFSnJ5Q2FKanVUMjB2NVR3V2lTamNkQ0gy?=
 =?utf-8?B?REkrNnozbTBVTUNTYjJNMXpURllvcU5DT1piT1JNbzRsMzN2dzQvb245Yjk5?=
 =?utf-8?B?L3JuSnFRZDA3K1RmY1J3TGZDblNMdldESmNrS1RhWUNqZWw1dFVxV2dQbDlV?=
 =?utf-8?B?VHMvTG4wQzRoQWNYQjVVYkJVNmk5dXBKVHB5NmFCVWxyTFF1b3MzcXo2cGQ0?=
 =?utf-8?B?V1RKMTgxdjZ3T1FzbnQ1Yi9vb3NjYWcvam1ISTM0R2orYVU3cjFKUTJpMk5Y?=
 =?utf-8?B?akZpR1BPNGY5eE43VjNLb05XK0ZVUGZQdk4vRTN3YmR0OTFzWS9XRGJEZ1Vr?=
 =?utf-8?B?aVRtZGc5WktEaHlJakRlUjg4M2ZvNUFOdmEwQm1xcnFoT2lJT2xWb1FQU3RR?=
 =?utf-8?B?RFB5VHJsTGxITk1TbTE1b3dPYm4yeVg5VGtNclluOE44T2Z0dXFhRUxqazYy?=
 =?utf-8?B?QU5XZVdFcUNjVkROR1ZOWkphTllVNXF3aTZKQitWSzlSSmxFajhGZDk2a1ZM?=
 =?utf-8?B?dWM4YXFldnpaM1cwajE4eUpoaS90RnlHQ0xxdEdtSWhvQTZSN0dhVG1vK2M1?=
 =?utf-8?B?QjN0aEtXTVlWVXdodjhDYmJjTWxNWUlSZjZaSE1tR0JNVEFqRWdvUnI0QUVV?=
 =?utf-8?B?UzRoRFBDeDhDT2sxV3BnSFNpTFFqaUh1eG9kNHpJdkRhMlpLN0ZheXNHem45?=
 =?utf-8?B?eENDMytYZXJpblFjRy9XSEFRelZBbDFLTmNhQ01WY2I3dDVaMGVQeGd4eGIx?=
 =?utf-8?B?aFozN0VNSEVjMk85ZVNOY2ZnSk1yMUdETjFwRmwvQ1pCN0kwL0syNmhjR2Nt?=
 =?utf-8?B?azJWMGd3Mng1NXRraVZMaDl5MkRKc2ZxRmtLUjJubHFSVXdEdHhvK3UyZExY?=
 =?utf-8?B?T1dSNXQvZ3hUbi83aUlDY0tMRlJtYW5DYU9HcWxCb1ZXZHpyMXVwTFYyS0Rn?=
 =?utf-8?B?Tm1EVUJWM3ZvWURHd0ZkeFZnMU1Qanowd3dCMFVFcFo1MVhHOW9VNVMwUFU1?=
 =?utf-8?B?eXNwbFAzZHhVaXlPQW1VQ3RJSWtadEFrbHlTQ3g4Mkx1ME4zMTRxK0tyVGZa?=
 =?utf-8?B?TTZVYms1K3VpTnFzMXpCcFI5b2E0OWxEWk5zYU5yckQxellqVnQreHVCanhB?=
 =?utf-8?Q?hj8jv75Pu//jDjA1vRT4ZeQRDWpak4idZs47O8u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e79f26-3d35-4cbe-9f64-08d98347594e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 12:47:51.4676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovCQe4XfL5DP/FReXXGijNvFa41NB63jqh4ukMeog0w7gcdyibpQ+5ByxN6ZQrFhlxxq/nkOKFN6dDRmDF0NMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

Modern hardware may report more than 48 bits of physical address width.
For paging-external guests our P2M implementation does not cope with
larger values. Telling the guest of more available bits means misleading
it into perhaps trying to actually put some page there (like was e.g.
intermediately done in OVMF for the shared info page).

While there also convert the PV check to a paging-external one (which in
our current code base are synonyms of one another anyway).

Fixes: 5dbd60e16a1f ("x86/shadow: Correct guest behaviour when creating PTEs above maxphysaddr")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -401,11 +401,18 @@ static always_inline unsigned int paging
 {
     unsigned int bits = paging_mode_hap(d) ? hap_paddr_bits : paddr_bits;
 
-    if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) &&
-         !is_pv_domain(d) )
+    if ( paging_mode_external(d) )
     {
-        /* Shadowed superpages store GFNs in 32-bit page_info fields. */
-        bits = min(bits, 32U + PAGE_SHIFT);
+        if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) )
+        {
+            /* Shadowed superpages store GFNs in 32-bit page_info fields. */
+            bits = min(bits, 32U + PAGE_SHIFT);
+        }
+        else
+        {
+            /* Both p2m-ept and p2m-pt only support 4-level page tables. */
+            bits = min(bits, 48U);
+        }
     }
 
     return bits;


