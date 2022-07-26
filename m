Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A55816F0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375496.607915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN2E-0004Nm-SU; Tue, 26 Jul 2022 16:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375496.607915; Tue, 26 Jul 2022 16:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN2E-0004Kk-ON; Tue, 26 Jul 2022 16:03:50 +0000
Received: by outflank-mailman (input) for mailman id 375496;
 Tue, 26 Jul 2022 16:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN2D-0004Kb-Cl
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:03:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 887ca3dd-0cfc-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 18:03:48 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:03:41 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:03:41 +0000
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
X-Inumbo-ID: 887ca3dd-0cfc-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIsewXBuinDiU6BWlep3Kw0xfVyWr3/hkR75U4tM78IIJN1mWcZ9d/SA/f8gmXeDKe2lS0t2p+ji/eXvpF6SG/aQcL8GGuK12OoWVwCgAi8sOWZ9mC4oaiWvks8prnumwl03Ai1In0cxdx8y6HS0LytoN/OG+KPskTXd4hZ/QMVxbrSQE1QidR0QtoVCqIVZ/KnxviD4TVf2nZOiuE9NmoohEt17DEZOeod6Dap7yNoLadGqMsSF/3qMTF6QpZHHIYUwbR9VxhCVGEmnwGXwisPjVrV/X37ZG/CGLCZBuviBJcPfGnUDfwC5dXW5V/tuaU1jaqhJYDTXuzZ+HT2ATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5J6VHiXD4VRqnlBRJoS4Bi+7owZxh4DSFzpTxUKvMX4=;
 b=WZkJujO4AXI2Hdo7p2KfaHNAJ7Ukf8eN3I+y9lKI4zLiUitkWPFtCakPxYpcTp1hBLakvyNVTzp+KNlIemmsVODeX/VjSSXklKtDKzdzHUI3p/m+GjUYbBTolWEHOTBDtz4dXvXrDPLkICq5alnPdTmuYi5zLkEhQ2appKiR7crbRKl1lN0pDuO2b+DtAVTDg/vybjJFN7mVHZrxZFqR7jxvZTO+AdYGmNP9mu5JvhhFWR/OYwF7tVyix1Q/isFuszUaU/jeI9qJAqnaaxvEvX+R38wmnKIBdhYTaG496h+vSbMFW1OacMjN9JSAg8yG92J9impEwrzCSvGdHSDzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J6VHiXD4VRqnlBRJoS4Bi+7owZxh4DSFzpTxUKvMX4=;
 b=KPTvcddME0TE/pwUKDg7OwmIeggQWrMSQcGNISNyM+KwraL6jAIbHuidThvftYKJOEoB2fHuYByXMBNiXtZCqu7j/26xoRtha0lXvtNHecgA2XksSmm8KkifbT7XU64Tpttf2ajtsMFm25ueVMxxxVmTcm9dQIxmRzCdLg7BRoqYkK5hVveZeVOx4OheRYnQozBzlW2WVB0aW+uAdEdZiTuqTznBOFieyOepVBSMdjx2imZTCnXY1pSd/yai1uFKY7LxfrM/QUCXuOZs+etUiSUozQIZWJSzXS/sYnQoY/6HP7NnFUMw+9zuBMhB7ZROghV/TLfpUJveyFNkyM1Q3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50abcb9b-8f69-0789-5f12-c422ff71c3ac@suse.com>
Date: Tue, 26 Jul 2022 18:03:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 1/8] x86/shadow: drop shadow_prepare_page_type_change()'s 3rd
 parameter
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
X-ClientProxiedBy: AS9PR06CA0189.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 049105d3-9bc2-4823-e063-08da6f206880
X-MS-TrafficTypeDiagnostic: DBBPR04MB7532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DPxeoeQ9foYRKH856maPe6KNA4wi42EwGrUk4Vu1GamaK+EiKUbyNT/U0CLAhFUx5P3r811YvoTm65YdUCXAz4n+p/k7K9ZIb7QxkdIqZlQBavZvfObpYZNUzfe7iJW9d79cWgY7aePyc81dT6MMCAwagaJYPZvX0CSqwxw8lNjAsMCqAZy32fxVgwKN5xjNj3Ui3ZELlAkTWPik4R7RSIlkslcIE0UJThOjadZi6E6RQCRtj+9a+enh2kaynHcdUj+W1ShVL5/ZQtT0lfLgYPVfxuRHLrZ7IJIkZVh2Qs9VMEU0lvaP9NqC0UMgwt2PsVkqFJOyfNRV3JoUirbJB8kOhxWG5ImJyY+k9F9CSLPLxr2go3zmFoaDY0jAfx+d/REVoz24eujfuet2JqY66Dx/BZnP1+jT6kniXSHFZsgAYMX6CXodRN8DuNNdI/jEfKQ3Y3pMZ/Opy4CAPc3X1gyVcgKGRNIxts/MMQxnImlwY5x2EEiL3DCOldLij8F9PukceVYb1aagoc0x9M4k+wFYoQ/HAd98Io2OiiZELf/F8NLm1VVzH57NsooskpJW1oS5X+X9c+K4RReZyEqDY0TUfG7KUEh7w2jKUKYd11xoom6UdUxea+zV+My7Sd3+ElpX5tYZl87SU02fseHUKBeUzaMUeesyT2Hds7NSwHfADuAGqy0qjyTiO+lNLy9ZhhtajWWyKsd6oXF5IqLatZShnezUd+diLWaLXSdFs5jTJxJGcWQVGgfbqtDFKR+aEmo64LKQAmJq2gfDApoBAvCbiTyoyYXgxsyd0CvtEdm4Xntqwy6XuZVWdnqt6e+vlOxiZEjlwQdCbG6L21YMhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(396003)(366004)(54906003)(6512007)(26005)(6916009)(66556008)(4326008)(86362001)(66476007)(8676002)(186003)(6506007)(66946007)(31696002)(83380400001)(2616005)(8936002)(316002)(6486002)(478600001)(5660300002)(2906002)(41300700001)(31686004)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVFlMjBmN0ZEWTQvalg3dHp5OW5IT0c0cTVRMkczZSs0V0YrOStKWVhrcjdC?=
 =?utf-8?B?ektpUUx2TEZjdjJtUTBEM2VMQTlYb0M2UWJsRk5YaCt6VFRyRXQ5dlRhbUpH?=
 =?utf-8?B?dGpzV3pGTnpLeWRPR1ZBQjJweFp6M2Z6aVNjeTJEWG1CTGk4TzNOakoyTzMz?=
 =?utf-8?B?aXBadVNBWEpvVWdNODhvTllEb0htc2Nvc1ZYNXIyVG5tV1FBeXBiQ1FwdTc4?=
 =?utf-8?B?SjZSTHVUaUREbWpzM2VyYVFUcTI0Zm5hc09KR05lT2JuK3RRaHk4MjBuR0Fm?=
 =?utf-8?B?b0hmSjNXQVJqNEk3R0p6Sm9kV1RiNGdCUEZkN0VzVldCakQ3YnZaMjZ5TWJM?=
 =?utf-8?B?di8ycnF4b0h0WWx6QkxjWWJzUmN2QzcrbTVzOHlpTVM0Ym14S294c0VvK2FC?=
 =?utf-8?B?QjdSenZDOFNWL1llcFhkSjk5ckhESlpXYVVScHBMRmw3VkpWZlluUitYTW4v?=
 =?utf-8?B?Z1cvVklWdmk5eDJyZ3E4WE54OGF0eU9wR000NW1DcDRiNEZtSU80bEQwV04y?=
 =?utf-8?B?c1kzVzBDZG1JcDQ5eHNWSzhHSkhrL1ZNRU5OWGFyMnVORUpMRTZsNDFBY3Js?=
 =?utf-8?B?NTUxKzFrUWtzaWU1SElBdk1jM3N3a2F6cUlJMEZ5dFRUUnZJTlUwNk90dTVG?=
 =?utf-8?B?MXNGUXpYZFFTc0pEQ3dHcXkveEh4ZWRkc2RBM3BrNDZBM1VXVWhLSUNOMkZO?=
 =?utf-8?B?L010NkJXbU1EazdMWWlOS2FCbDBKeG1ydFJYSUxzT2tDeE5jTE12N05ZaWNT?=
 =?utf-8?B?ZHh2c3p0OXZ5bHRVKzNIS3dLMGV4VFBEbTBRRVcyYWdoUGgwZXpqTlpxQUlC?=
 =?utf-8?B?NXdZbWdvbWM4aXBDeVBjcVV0UTdVRTB0QjJ5aWZ3Z0gxMXNmVmhTdzU4REgz?=
 =?utf-8?B?dE5HNU40RzFOVjNoUEtmQnVQaG11Vmx0K1IrTE5QajNmbW5YdCtiaDdSVHhs?=
 =?utf-8?B?N1JsMC94eVgvWXF0Mm1LelNkSnExVkVFeS9IRVFGZ2l0ZEJPa3hGZDBGZkNL?=
 =?utf-8?B?ZHBhd3ZaT24xanVlOHEweUJIWGgyOG9VSGJjQjYvcEQxMFZuUWZMd1F2WDhX?=
 =?utf-8?B?dTkzZGF3Tk9xSzl6SnQrQVN5VHMwWXlxVGpIeWhKUTRrSDlwakorT280bUw1?=
 =?utf-8?B?UVNKZG55TEN5TWFGMUVMV00ydnk0b2FmQ20zWUFCOTRFUEFrYWtOQ0R3MCt1?=
 =?utf-8?B?YUVQbmkwTGkrK2FlV2daOWczamc5SjFidEdhbXgzNlRSaHdxM2hOaVUzOWZK?=
 =?utf-8?B?SUlBOEp5ZW02VDRlanAzelpCK0tPcXBVV1lOanRuWEhrK0JuL3BkcUFmV2JR?=
 =?utf-8?B?U1RSMHhSQjF1Tk5Wd3JIdjRvR1NMSkhnbVlGQUNRaFc5aC9Xd1NNSDdPUDhD?=
 =?utf-8?B?UmVnVFpkMDRJRzB1cTJBRGVRUGRKaEgyRFR0Uk5wUnkvajQ5SVZDVE1yVUc4?=
 =?utf-8?B?NHFaeXBSWnFCWUFHdElpbHlTeG9qeW9YVFVzRitLb1ZiR3hGSGg3NDRzWG5k?=
 =?utf-8?B?bzZHaHQ0U05aVm5XT0Fjb3htdGtBRlp6eW1VVGxwbDhCRXVsK0VEUU0rLzVR?=
 =?utf-8?B?STF3a1NFSENkWGc0eXBlS3J2MUlJNjNOWWtvVUdvZzhMUUc5WkwrbStkV2ZE?=
 =?utf-8?B?V0FJMWdlNjkxVCt0RHFLcXM2QnduOGFjS2o1RVJnQ1A0clpTUmR5cUxMSkRV?=
 =?utf-8?B?K09RNkcvMXFCZ01JOFdqeXZ2Z09FdmlUVVZHUTRsdlM4Qm5xNmFmek9WTDlq?=
 =?utf-8?B?V3lDQjY1QjdQSnJueVNWYUZ0UWhCQU1DaEZUeWhjNUFuU2VWNW1LR3dNelha?=
 =?utf-8?B?OFRNeHBaNXdmNGFYKzMyNFBxMHVtQlZOeE9hVjNEZTNmY3R1U3ZQUDcvTjNt?=
 =?utf-8?B?QUFjV1BKWGdNZksxNndPaS8yOTZtNWIxVnhLUUc0UzdYeG1rbFlzRFpYZG1D?=
 =?utf-8?B?UVdMM09jdGlHKzhVeW9SQVlOeXJjVCsrSitkS1JWbG52bnlweXROR3p2Nzk0?=
 =?utf-8?B?UFhpNG1WVm5yU08reGpzMlB3a3pkVTZseEZma3lpS3RwL0dkbnRtaE1BNDFo?=
 =?utf-8?B?VnJZUHN1VlU4WUN4VFlNSzRLcjc0dlJLbENSUkRKNGlQeUV4NGpnUno4TEps?=
 =?utf-8?Q?a/lU0NGkgq7DMxKN/fUU+S1T2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049105d3-9bc2-4823-e063-08da6f206880
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:03:41.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dx3lNN++gmLy3rVh0U249Lzw5bt6EjBSZrPUUKocUSY8Xu9lt1kVSRXU70SfWbySKxOtNQMvr/ICgpP0GTnC/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532

As of 8cc5036bc385 ("x86/pv: Fix ABAC cmpxchg() race in
_get_page_type()") this no longer needs passing separately - the type
can now be read from struct page_info, as the call now happens after its
writing.

While there also constify the 2nd parameter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -84,8 +84,8 @@ void shadow_final_teardown(struct domain
 void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all);
 
 /* Adjust shadows ready for a guest page to change its type. */
-void shadow_prepare_page_type_change(struct domain *d, struct page_info *page,
-                                     unsigned long new_type);
+void shadow_prepare_page_type_change(struct domain *d,
+                                     const struct page_info *page);
 
 /* Discard _all_ mappings from the domain's shadows. */
 void shadow_blow_tables_per_domain(struct domain *d);
@@ -113,8 +113,7 @@ static inline void sh_remove_shadows(str
                                      int fast, int all) {}
 
 static inline void shadow_prepare_page_type_change(struct domain *d,
-                                                   struct page_info *page,
-                                                   unsigned long new_type) {}
+                                                   const struct page_info *page) {}
 
 static inline void shadow_blow_tables_per_domain(struct domain *d) {}
 
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3018,7 +3018,7 @@ static int _get_page_type(struct page_in
         struct domain *d = page_get_owner(page);
 
         if ( d && shadow_mode_enabled(d) )
-            shadow_prepare_page_type_change(d, page, type);
+            shadow_prepare_page_type_change(d, page);
 
         if ( (x & PGT_type_mask) != type )
         {
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2265,8 +2265,8 @@ void sh_remove_shadows(struct domain *d,
     paging_unlock(d);
 }
 
-void shadow_prepare_page_type_change(struct domain *d, struct page_info *page,
-                                     unsigned long new_type)
+void shadow_prepare_page_type_change(struct domain *d,
+                                     const struct page_info *page)
 {
     if ( !(page->count_info & PGC_page_table) )
         return;
@@ -2278,7 +2278,7 @@ void shadow_prepare_page_type_change(str
      * pages are allowed to become writeable.
      */
     if ( (page->shadow_flags & SHF_oos_may_write) &&
-         new_type == PGT_writable_page )
+         (page->u.inuse.type_info & PGT_type_mask) == PGT_writable_page )
         return;
 #endif
 


