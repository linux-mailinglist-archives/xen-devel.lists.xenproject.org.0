Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7C6444FE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454874.712441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YOT-0004io-43; Tue, 06 Dec 2022 13:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454874.712441; Tue, 06 Dec 2022 13:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YOS-0004fc-Vk; Tue, 06 Dec 2022 13:53:56 +0000
Received: by outflank-mailman (input) for mailman id 454874;
 Tue, 06 Dec 2022 13:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YOR-0004Xd-Pl
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:53:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63148b5c-756d-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 14:53:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 13:53:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:53:53 +0000
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
X-Inumbo-ID: 63148b5c-756d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cORUnGF9deRLXrgyuyL4xBcbJerVE/LWz20fXZUs7h2hTiLLFnak4Kv1W3OUqVQjWL1ST5HzHWe+Kw4hjiIzE2YRO15oZsDd1po6kH0YR89BNSkatafcuKcQ/3ggVBKPOvCrgOqqQN5WxEOyuF+uzvfJjrPD+if6gjKs7IyuRm4jjiN9HRq/FggswCh05QI8VlgPLPb+E6OiCQrsf+3FuwZ4PSqIjk7IVzeDQPR3CH2sZZq88oLX+c07dqC4OnpAgutOeRnrh9OwsXyEg/0JTJOEem7zHaBEfKmBJ3w59/ZINrGiZNT43BEULTI/h6O2Pvtrjy5AauDx3eJcSEv+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaQX7UlAJBNN43bq2jRmVma+04kX6t3hW9mNWKDJ9Vo=;
 b=EwOvfci4s43d7I5LHRr1nemztja+khOJGAlcrNEGApQsiFdcQTCLcmlNGtQzWxXwPu0W8w6ccmljHMYJZxLIssk7+LTF91j0NUzhClExncgzNDGL4IslRggGNbyt/HaZi+SpoTb+z7twRWgHtUA0KGeHAxRKiIwKu3PWHex6sA7XFiFl95sMiRS0ALsG39LFQUBkcQcAEJ/2kgRZExs54v13aqzeV6960wacFOCyfFT6VBGnT7NCvrXF9Oa+ZRcz072Jo0KwyHIOK9E/4i8r5BI61/oaBd3CaiLmPMoGI/D8WuUKSih1wUViVpS1myUlO9agEbLZVvuaO1e/B/qyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaQX7UlAJBNN43bq2jRmVma+04kX6t3hW9mNWKDJ9Vo=;
 b=XzxsoEfHHSsizSeXB/gJ0elwJf1GXdCHrzIQOw6Gn0iLJ7g05J9ShzUc1q2Q8wYKmASitEompuQL0OTlMgOLD7zA2Iwg7w1E2CaMLoUhVmT4BeUQZjkTtNjMAflIz+kS5me4OwkH+jff69aS7Dc7m4NXcoPNaef0ruzRgkj5EbOSateHVu6JEBYXEpKLYGtU+cFI/av34qZB2hO9FmY1m3IeluRYg7n5cM4lzi/ME4AvPQbRdvNkjpMa2+ISloHIn/lV8LgrwBdB2BpxF7CIaEP2WtaT7aQfEaFO1mEs/VlM/jUQUMijsbgrKJd0YoT4bE8Ck1hr9CzuB4MIn5W/Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb8f6cad-99bf-1656-4a2f-12a281481a65@suse.com>
Date: Tue, 6 Dec 2022 14:53:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 2/5] x86/mm: rename PGC_page_table to PGC_shadowed_pt
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
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e03e88-48b1-4faa-ee0c-08dad7914fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pifqih2YAZrpZ5iByxrPizIqXz4WfC2dEP/1MAuaYlGNhih8y1nOuheP7ovFGxBS8uoly2LQcEOI52htu9N6DrmLYkmpe+/gZ2mFVi9eVS9dYKkESh8PY/s8PUwDfQ43qTvofgdmcohemTqBanGKo+bKw8i5dV+UkieE04Y/AVQxcusfTxrf0MEo0Hd7iggjqKiPnlTTW/8W0J+5daENapoOfCFA7o6fvlZF389ilnv5gu4LyoYrpGsc1dkSq1U22Atf8ckzUQYoa80OeJp4I+acMA5Oi7l/vYtwVZY8uunS7yGPM+W1SYr+eLRWIZEhYDrBE7RM8Ag7WGIIs9O/0TiPLvvaFjqecFj99+qDuc1oxgzR4yzdfwnYnSF1p9F54NGhp1dglxtVzW3DDcgtqbuNjylju+JmXHs7LirUQZOhB4ijpK0wGxDc7vmRc98mDQwj/ite8RIjP/MvIe3WHlU7fWHTFvgkTjtRSyG+Awqq84qCvkfIt0mu7ZI6ug8/E+GJc/QbrGnkjstib4hKf7JdPw11mAIPRpDpofxPq/Zxn68DVTjvRq0oe3zMhJCfXNzJk4uOBu9sao3XqqSEbZ4sSn28Z7cbxd7B/7nbm7oBBOyqBfUjB5mYD54FD+QeJmpzE9LPjoHS3RtSs1YNJDvsh9JenfzJ12cBV2GS9eIij5a3YpFh+iVvQ/X5cP2vSbtJIuzRcY+Vhj0kPcnnnKwhznLfzhDzUreECxNXcpQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(31686004)(186003)(6486002)(6916009)(316002)(54906003)(478600001)(31696002)(86362001)(36756003)(38100700002)(83380400001)(6506007)(2616005)(6512007)(26005)(2906002)(4326008)(5660300002)(41300700001)(8936002)(66556008)(8676002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFRKb3VESVNIdGduMkJoRGtoVVJDQkFnbGFSSHJDRGNLdCtJcmNEM0NBOEwv?=
 =?utf-8?B?cGszSGRtZmsyclBXMzlmNEZwWjRtaXZ3Z2d1QjlVSTg2ZjFtREozS3pDTzZP?=
 =?utf-8?B?b2NFSjE5TS85NEJLOFR2Y0FGYUtkY1p0aEQ5SEFkQXdFaVJyOWQ1aVNlb3lQ?=
 =?utf-8?B?Sk1pNmpWNE10QWM4QURFSlE4cHYyRXpyVCs3OFpRRi9qZmU0cVVzaUtzN3pk?=
 =?utf-8?B?bm43N0lkZ290Ukdiam42M2FNd2ZlVEdjSnNQQUE2Y1ppVTJYeFhKUGxhZDBH?=
 =?utf-8?B?djY0ZURjTmZ2SFRqbXZkQXFzMkY2QkVMcXVNcFpPelBpeWUycDRiRXUwTG9t?=
 =?utf-8?B?MHR0cTVoRDJLYVI4QmkxVlFyTk5WODhhNEd6NVVaSC96dWlpUUhpMTdPT3B0?=
 =?utf-8?B?WE4vY0pvZjl4T1Erb20rRW9iNjhUQm1UWDF1Z2I2c2U3MXVmOC9vbjZZUjdh?=
 =?utf-8?B?dUNTdHE4M3N5cWlRVlg3RUlUaEhPVXJwRi9nbE1jY3FUazhHandZOU9DWXll?=
 =?utf-8?B?RkZlZlZ5a29zMUJ6UkVrcEJEVGFWaUpPTnNGYTlPNXRZTUdkZXp1d0tabFVS?=
 =?utf-8?B?bWJJQk05K0EyTWdUOWtXckVQRndLTEJYOTBoQWp2SDFwS2t0aGtrV0pTRVhk?=
 =?utf-8?B?c3FSZVpwQWtTTFh4d2hEZmFJYWFIaHNMdjdIa2x4dGlzWTJUYXJ2bXdDRVVx?=
 =?utf-8?B?NVE3dWZucHA2RFhrRktaOFk5RGZ6NUNib2xITGZBT2dpQXhXb1M0Sys3bkVv?=
 =?utf-8?B?NEw0cGgxZDhtS3R6eG9KOUNFY0c3OHAwYzNWa2t6VU1hR0FQWGk2cEVKbEha?=
 =?utf-8?B?anEvN2JDZU43S21YNFZheCtyY0NVampNVnFRUTM1b3laZmFwUEVtL2xMUW9T?=
 =?utf-8?B?eTFzc1FWWWR6dlBQRk03bDY0ZG5WU2h1M3BGcVBIQWl4bFhIejMwOTNMb0lE?=
 =?utf-8?B?cHZPSzZDTDdlcXgzaWpmdldHcmJldjBqY0FNQXM2S1hCcG10T3BXTDZtOWx1?=
 =?utf-8?B?UnUvTlpWNy82d0c1QzFvNU1TNzZCQmVwRDhEb0ZjMVRaZEczVUxKWE5zSHJW?=
 =?utf-8?B?OW1hTUJHZUtTZUlsQlRQekZFWW1oTjF4RmhEMlNmTDlTZmljK0Y4RXMvWENN?=
 =?utf-8?B?WTc5VTFxQ1VlemJVaVd2bmJtUU9OZTIzR3Fjak11cndFZVRTcnJ2VEduWllh?=
 =?utf-8?B?Y3k3OHpQMFFYeVN4dFBNenFHNVJCTEx2dUtHNmYwNzFnY1lrVUVUdkRXbHNK?=
 =?utf-8?B?d3FJaDAxeGJON3YzQXlDV2FLMVlmSEtNektyamJscHJTazdEenRpa1pNdGpq?=
 =?utf-8?B?MWlVWG9wN0VSMWplUFpjZ3ZnM2ZKendHTml0UVY0WTVCaDJBSEltZmlHZk5Z?=
 =?utf-8?B?YTBsSHdQZ1F0cGk1NFVaeGRQZGZpR3Y3UlhtUHBianp2T3RQNjlyN2lHZFJV?=
 =?utf-8?B?K1NQcTJkcjZXNEVHTUZmKzlXeFNUQWttWE9vK1BaTkdqSkMrU2lCUllBRWFq?=
 =?utf-8?B?VnFnYkdZMksvVGduNThmYXdwUGJLVWIxNXBEZkhHaG5ER2cvUFBOUjFYcjdE?=
 =?utf-8?B?eHhweVYzV0ZFWkY4K2U2aWh2dUl3U21TQlVJMzB1aUVybzJlVTRnb0FuOUNr?=
 =?utf-8?B?NkRNREd3dWdqN1M5YjF1NGJ1NWZNRGVFNWV6akNScThudkZpK1N0QmVkb2lZ?=
 =?utf-8?B?eVloTXYrdXdGZkkxb3ZqRTBEb0JRV0VnTXlMbG5VSmJtam1RZG9RM2J3bTlF?=
 =?utf-8?B?MjhnVUh3ZTc1OGpGQWlLbzk5d0hxY3pIUS91VVlvT0xuVE51YktGZFZmKzF5?=
 =?utf-8?B?OXBuMjB2QVU5QUVyc2hwemtVa0NJcTNIeW9RVVFiVTlTVitzY21UanIvcmJZ?=
 =?utf-8?B?L0tEajFQTVJRbGc0R3Q1OHJnNS90ZXB1MUYxWGJBOCs0bXZ6dnJVZTZHcVpp?=
 =?utf-8?B?RmlGKys0UHA4REgzOTlFM0tYMzY3emRZcHZpTEI5UXd1YVljNFNSQW9IZHJY?=
 =?utf-8?B?Q3FaaDdVdm1Fd25oR2NpblhQL0lqelN2UUxKcWVKTVhscjNjMHpnUTk3MnpN?=
 =?utf-8?B?empJc21xQzRxR3NCSkpEbnRHRWswcXBRbmQyVVBNaks3RE8rb004dVNwcE5i?=
 =?utf-8?Q?4xzTEII1oJoPTeypHI2MfZYpK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e03e88-48b1-4faa-ee0c-08dad7914fa5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:53:53.4100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYMDL7R5oaeQLQrQC9gRQHUz6knvCUzszzxbEPa7dEG009I3oyyQKgTDBr1hFjqxQBJqDMPBX85wyVz8AYWXuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

The original name didn't express the purpose of the flag: It is being
set once a page table page obtains a shadow, and it is removed when the
last shadow of a page was destroyed.

In set_tlbflush_timestamp() also remove the 2nd half of the condition as
being redundant (PGC_shadowed_pt can't be set on a page without shadow
mode being enabled on the owning domain).

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -70,9 +70,9 @@
  /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
- /* Set when is using a page as a page table */
-#define _PGC_page_table   PG_shift(3)
-#define PGC_page_table    PG_mask(1, 3)
+ /* Set when a page table page has been shadowed. */
+#define _PGC_shadowed_pt  PG_shift(3)
+#define PGC_shadowed_pt   PG_mask(1, 3)
  /* Page is broken? */
 #define _PGC_broken       PG_shift(4)
 #define PGC_broken        PG_mask(1, 4)
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -803,7 +803,7 @@ p2m_pod_zero_check_superpage(struct p2m_
         for ( k = 0, page = mfn_to_page(mfn); k < n; ++k, ++page )
             if ( is_special_page(page) ||
                  !(page->count_info & PGC_allocated) ||
-                 (page->count_info & PGC_page_table) ||
+                 (page->count_info & PGC_shadowed_pt) ||
                  (page->count_info & PGC_count_mask) > max_ref )
                 goto out;
     }
@@ -946,7 +946,7 @@ p2m_pod_zero_check(struct p2m_domain *p2
 
             if ( !is_special_page(pg) &&
                  (pg->count_info & PGC_allocated) &&
-                 !(pg->count_info & PGC_page_table) &&
+                 !(pg->count_info & PGC_shadowed_pt) &&
                  ((pg->count_info & PGC_count_mask) <= max_ref) )
                 map[i] = map_domain_page(mfns[i]);
         }
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -185,7 +185,7 @@ static void sh_oos_audit(struct domain *
                 BUG();
             }
             pg = mfn_to_page(oos[idx]);
-            if ( !(pg->count_info & PGC_page_table) )
+            if ( !(pg->count_info & PGC_shadowed_pt) )
             {
                 printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
                        __func__, idx, mfn_x(oos[idx]), pg->count_info);
@@ -716,7 +716,7 @@ void shadow_promote(struct domain *d, mf
            || d->is_shutting_down);
 
     /* Is the page already shadowed? */
-    if ( !test_and_set_bit(_PGC_page_table, &page->count_info) )
+    if ( !test_and_set_bit(_PGC_shadowed_pt, &page->count_info) )
     {
         page->shadow_flags = 0;
 #ifdef CONFIG_HVM
@@ -734,7 +734,7 @@ void shadow_demote(struct domain *d, mfn
 {
     struct page_info *page = mfn_to_page(gmfn);
 
-    ASSERT(test_bit(_PGC_page_table, &page->count_info));
+    ASSERT(test_bit(_PGC_shadowed_pt, &page->count_info));
     ASSERT(page->shadow_flags & (1u << type));
 
     page->shadow_flags &= ~(1u << type);
@@ -748,7 +748,7 @@ void shadow_demote(struct domain *d, mfn
             oos_hash_remove(d, gmfn);
         }
 #endif
-        clear_bit(_PGC_page_table, &page->count_info);
+        clear_bit(_PGC_shadowed_pt, &page->count_info);
     }
 
     TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_DEMOTE);
@@ -779,7 +779,7 @@ sh_validate_guest_entry(struct vcpu *v,
     // Ditto for L2s before L3s, etc.
     //
 
-    if ( !(page->count_info & PGC_page_table) )
+    if ( !(page->count_info & PGC_shadowed_pt) )
         return 0;  /* Not shadowed at all */
 
     if ( page->shadow_flags & SHF_L1_32 )
@@ -2266,7 +2266,7 @@ void sh_remove_shadows(struct domain *d,
     SHADOW_PRINTK("d%d gmfn=%"PRI_mfn"\n", d->domain_id, mfn_x(gmfn));
 
     /* Bail out now if the page is not shadowed */
-    if ( (pg->count_info & PGC_page_table) == 0 )
+    if ( !(pg->count_info & PGC_shadowed_pt) )
     {
         paging_unlock(d);
         return;
@@ -2283,7 +2283,7 @@ void sh_remove_shadows(struct domain *d,
      */
 #define DO_UNSHADOW(_type) do {                                         \
     t = (_type);                                                        \
-    if ( !(pg->count_info & PGC_page_table) ||                          \
+    if ( !(pg->count_info & PGC_shadowed_pt) ||                         \
          !(pg->shadow_flags & (1 << t)) )                               \
         break;                                                          \
     smfn = shadow_hash_lookup(d, mfn_x(gmfn), t);                       \
@@ -2299,7 +2299,7 @@ void sh_remove_shadows(struct domain *d,
     else if ( sh_type_has_up_pointer(d, t) )                            \
         sh_remove_shadow_via_pointer(d, smfn);                          \
     if ( !fast &&                                                       \
-         (pg->count_info & PGC_page_table) &&                           \
+         (pg->count_info & PGC_shadowed_pt) &&                          \
          (pg->shadow_flags & (1 << t)) )                                \
     {                                                                   \
         HASH_CALLBACKS_CHECK(SHF_page_type_mask);                       \
@@ -2322,7 +2322,7 @@ void sh_remove_shadows(struct domain *d,
 #undef DO_UNSHADOW
 
     /* If that didn't catch the shadows, something is wrong */
-    if ( !fast && all && (pg->count_info & PGC_page_table) )
+    if ( !fast && all && (pg->count_info & PGC_shadowed_pt) )
     {
         printk(XENLOG_G_ERR "can't find all shadows of mfn %"PRI_mfn
                " (shadow_flags=%04x)\n", mfn_x(gmfn), pg->shadow_flags);
@@ -2339,7 +2339,7 @@ void sh_remove_shadows(struct domain *d,
 void shadow_prepare_page_type_change(struct domain *d,
                                      const struct page_info *page)
 {
-    if ( !(page->count_info & PGC_page_table) )
+    if ( !(page->count_info & PGC_shadowed_pt) )
         return;
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -320,7 +320,7 @@ static inline void sh_terminate_list(str
 static inline int sh_page_has_multiple_shadows(struct page_info *pg)
 {
     u32 shadows;
-    if ( !(pg->count_info & PGC_page_table) )
+    if ( !(pg->count_info & PGC_shadowed_pt) )
         return 0;
     shadows = pg->shadow_flags & SHF_page_type_mask;
     /* More than one type bit set in shadow-flags? */
@@ -332,7 +332,7 @@ static inline int sh_page_has_multiple_s
  * domain is translated, &c */
 static inline int page_is_out_of_sync(struct page_info *p)
 {
-    return (p->count_info & PGC_page_table)
+    return (p->count_info & PGC_shadowed_pt)
         && (p->shadow_flags & SHF_out_of_sync);
 }
 
@@ -343,7 +343,7 @@ static inline int mfn_is_out_of_sync(mfn
 
 static inline int page_oos_may_write(struct page_info *p)
 {
-    return (p->count_info & PGC_page_table)
+    return (p->count_info & PGC_shadowed_pt)
         && (p->shadow_flags & SHF_oos_may_write);
 }
 
@@ -545,7 +545,7 @@ sh_mfn_is_a_page_table(mfn_t gmfn)
 
     owner = page_get_owner(page);
     if ( owner && shadow_mode_refcounts(owner)
-         && (page->count_info & PGC_page_table) )
+         && (page->count_info & PGC_shadowed_pt) )
         return 1;
 
     type_info = page->u.inuse.type_info & PGT_type_mask;
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -593,8 +593,7 @@ static inline void set_tlbflush_timestam
      *  2. Shadow mode reuses this field for shadowed page tables to store
      *     flags info -- we don't want to conflict with that.
      */
-    if ( !(page->count_info & PGC_page_table) ||
-         !shadow_mode_enabled(page_get_owner(page)) )
+    if ( !(page->count_info & PGC_shadowed_pt) )
         page_set_tlbflush_timestamp(page);
 }
 


