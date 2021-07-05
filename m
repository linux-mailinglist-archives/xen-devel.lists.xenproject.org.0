Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15103BC15D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150452.278184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R8I-0004Pf-2R; Mon, 05 Jul 2021 16:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150452.278184; Mon, 05 Jul 2021 16:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R8H-0004NE-VS; Mon, 05 Jul 2021 16:07:41 +0000
Received: by outflank-mailman (input) for mailman id 150452;
 Mon, 05 Jul 2021 16:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R8H-0004N0-6U
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:07:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4d68a52-91e1-4eff-845d-77691daf922a;
 Mon, 05 Jul 2021 16:07:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-Oxut-bkkPS2x5yl46VHnWQ-1; Mon, 05 Jul 2021 18:07:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 16:07:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:07:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 16:07:35 +0000
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
X-Inumbo-ID: f4d68a52-91e1-4eff-845d-77691daf922a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7RY0ShcVxtWtMMh0NcPG5/m8X13IHxRvG2X5xqTlt8=;
	b=cQ/nUa8Loejs08bjMaiFJe0Zyp3oZKmiqzDJm1X8cbnLCigwz0s3+U8AfudDox61vPVvXi
	x6v3+YWdpYIfJVvoeIbcK+mdqIts5jpHxQTZI5kPIdsY0zN0CwLrM8LV4yTCXw1WhbjtG4
	GIzWEl080ms01B6v9QTSQHr8Kmg1oDQ=
X-MC-Unique: Oxut-bkkPS2x5yl46VHnWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBsnk7wSt5nL0G7mXPGv/H4EWT7NFSx2vj9tuzRLgrFeha3NNbjHwnkzcfxKElkOE5O/cb0gGK5aLQ4ZLes+Q76iaGnnj4eXVCseGQAdqRHOyhA+KMHc2TSPIVQCV21LSgX3+DFnz9GnydEB6sCb8K5ksFA/CRoqemJ1VNMS8PByElqAPDjg7xRzFwWVTnZrfffrr5e2q42oHU2UvP24dYcXR7VT9lVe3gE+Za4gcjBsdB3/NGkCiBYXJTMCcI3VJ3KkX0ynnymc46iREexPrPMnjvV0xaVym8lBYdd51e+UfwHBLYTJmZ2cKmIsJLRpZUPR6QLUTJpS4elcPa40hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7RY0ShcVxtWtMMh0NcPG5/m8X13IHxRvG2X5xqTlt8=;
 b=iAIdm5gBc+r4UOukFmdNtoYlH++g0QQj0za86VOBAj/c8gV8q569yqlqulNPAshs8tl2VfOTzpT/a9pDkC6orDUO+Z2UUjRzyBD2TF3gkufPI7k8YV2c18RYMBEScPR5adtmRHRH7K2Q8FmroKYEvHUekPTCPwtY40BzAh2RsMyO3Rl9x7SKY8WJXVsbQJCFK0xmFn8aa1E1CE/6M+8sURvnJTwppIkvzEdCdSk+Ow2s03+xZ0kO8NvEa4tYPyCj+1KsqeEE3UIMEBxDNZgLJj/UVUhITMkGLjMT3RO6pICvQu8XfmGf0Y3UJ4o+lQeHXIl4eYcbav6xtPiJ6Z4clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 05/16] x86/mm: move guest_physmap_{add,remove}_page()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <3636b781-d84e-6e95-6bb8-bc6a7c596912@suse.com>
Date: Mon, 5 Jul 2021 18:07:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7791f0e0-853a-4850-b426-08d93fcf0103
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32938AFB407C33BA76934943B31C9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1YVyOdy23sRq0DQ99yWPBvPzhXf9EnxvijT76e4gJgHlyFCtWwQiBZ4Ui1oitAdXFn+LQ1oklQPv7UsRwWiHACecuSRJAsaX56CpE/39gzXo+w692gAkn85NgIeFaGhnytaVugl8bWCwUtBuLXUOQ7VEoOM4C05fHJXDrRPuoyJsPJ8HoGsEXJB7mubVRDMC1ZxpAwyJVYEymom6eOdT7jIEQ1nFZ32bZCP7Z/zikpK0HWZJHG09lMoO+KYXrAPiYS1g9yrO2R/ptEn3xE2wuwmDzNIukTsZSE1g9HHtUwY/U5weMwz6r9hwum7xSWZEh+Hj4RjutifRbSfggWCOtvtYWxA0wu/aCd8l8o9DZKP3zWSD9bgRXmnufWUQN86bf4nGZHCePUUXjd/23An+hmgye1xPKCIZfAvCqT1/qGAxDa6JAz4YK9HV+XLpnfz0LrbEbg8I7CoAXuV+B/XRoYGtJUchMUwA6V7FUnsu3dBEnXjFMNihpNsaDLVnPIaIIX8D03Cs4VSopHYDeXGkTx7VUpzNKjjPKMvyD4mF5SMPlsrYs5Uo2PUJt37jtMvyCXAU9KgYkEcPHjw91/OjP/EyoVnD0gdTuCuE24O2nchuQ31T/NwEfqmMlLKAXj3OcoaxSo4aZcV3FTr1mPhk2iVT6oDZKzrMCpUzrvmC7U3EXP6GnyeYH5oO4APrna9NNRo94RP1ZO84zy+4O7q2L7DMdh9ZI55kaeIYV3SE31zsxTpvsEWjwmLgmArkTYjeKJMtrdE1wmNI0wCWbcBhTFIiE6o4xOnIS/9wdrXaywOhp/Z3B+uwLEHmRwGWChTdpFRJy2ByBekmocE6kvNMEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(376002)(39850400004)(5660300002)(316002)(956004)(66946007)(2616005)(16576012)(26005)(38100700002)(186003)(66476007)(66556008)(2906002)(36756003)(16526019)(86362001)(31686004)(6916009)(54906003)(83380400001)(31696002)(4326008)(478600001)(6486002)(8936002)(8676002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGgzU25qUFJmTzJ6aDVtWFZ3ZmJEcWpCODhqTGZ2SThwL0xTWWxoOE5CMkhM?=
 =?utf-8?B?UGpaZ3kyUG5rSlpYc3RIMmt4eFFBODR5ZStYUVdQUE1GcHMzNHowcUwwbTdQ?=
 =?utf-8?B?T0VoRHJaNWhWRVRlU2tiM1MvR0Z0WFIvQ0t3SHY1K2tiQUJMbXRrYlVqeDkw?=
 =?utf-8?B?OEVqV1hXZlFkSWgvNytrVnp5TnFtWC9mYXJ6YW5jeVhyYU9LellmR3RyMUcv?=
 =?utf-8?B?U0QvQk9pVXJPa204TGdJaGRGVENBcU5uM1ByaTN1blI0QTlyZ0RZUHZGYUV5?=
 =?utf-8?B?Sm0xQjZGRjdMeitLYmFxUXhhSmJGWVpMQk8wSk1CR0xvcldIOE9odmlvbUNK?=
 =?utf-8?B?K1JIL2tRRmp6dTFyajVVRjhzNFAyS0x6Yy9hSkN0THQyQm9aNEw2aGxGZXJm?=
 =?utf-8?B?azc2aTF3RUVOclVjRUpXYVFEZng0U2RFVExQaGRoRm9wa3BjaWM2VFI1TnJj?=
 =?utf-8?B?czZLS2xYeUFoRnMxYnBlaVE5bGh4aVBCOFMrN0xQVHlyaytUVmMzNmEyYnhr?=
 =?utf-8?B?dEtIU2NuUy9KdzZpNS9zTEtIWVdINjVOaWpscjR6ZUtBN1ByUERIeXVJN3hv?=
 =?utf-8?B?VSthcnl6RzZBN3hLOUd2eXlSL3VNTkV0eWZ2WVdRZGNJVFZuTEQ2d2RVSFkx?=
 =?utf-8?B?NmRsS0lJK2dLZlh1NlYwaFk0QTZ4cllrR0J5aWRWWmMyUzd2eTBtKzBnei9z?=
 =?utf-8?B?REdhZUljT2NWT0diY2VqRTBLSXVuZGwxdnBDZVh3ZEdEUVJjTGdaOVlkdXEv?=
 =?utf-8?B?RWNxT3V1MSs0UkdUUVg1N3d4ZW1keTdhL1hOTndRQ0ZJT3dVODZNTG9ZVWhu?=
 =?utf-8?B?UjFqYmFoMDhXYW9mdVBQd0d1USt1bU5OWGUzcWFva2thdzlDSTFsL0ZGWDMx?=
 =?utf-8?B?Q0RNaCsrTnJyNWt1NUVjQmtjeFZmUWZ3M21LRDNQeW9vYmdXdnl4RTNpb1RH?=
 =?utf-8?B?Z2ZpdTJ0NE1lRFVhbDBLNldvVitZL2xQRnp0b1N0d213aUdDVDRBNndwTzYy?=
 =?utf-8?B?NnFiajVuMTBlVGZ5aGE4NjZJS0huUm5ZK2VkL2VlaTBlQVFUUWx2WUhxaTZJ?=
 =?utf-8?B?aXhLWjZMNUticzgwZE4xZ3hTL2hodHdwQlpTY050Y0lQR0U0VHBLMkN3MjJj?=
 =?utf-8?B?WFVJOStCdENQb1dpVllnc0Y5dFQ2YmhpelFZS2FwQ0hrVGhHOGtHUHhRdE5V?=
 =?utf-8?B?Q1psRlh2aXowM2RlWkRwMDJ6SDBQbzR1QzRjakdLckhMb1dmODRlS08wQWx0?=
 =?utf-8?B?OE14bTBJY09xWmRFQWtpM0NXN3UwTW5DMmNEQUJVdWJTdG5VVHc5VWsyWVVo?=
 =?utf-8?B?dkZ3KzUxNzh2Lzg3NXZNb0VSRVZuZEVxTmR0MCtYbGlWaW5kd05pcnFRYVRj?=
 =?utf-8?B?NCswUlZXWkZDeG5MQ2hQNE5PQTJXT1pndUlIcHQ4dEdUWHBpV3JHeVc4M2Js?=
 =?utf-8?B?UW1JVmpzcVphY3BPeG15WktjWUE3cWJzT2dXclc1czZhV2FNSHhqU1R6aW9I?=
 =?utf-8?B?Zm9tSjdBMXN1OTJRM1UraWxjeTJ0ZzR0cTJaeW11NzBjR0p1TzlhN0QwYlJW?=
 =?utf-8?B?d3hCMjNsVUF0TjdqL3IwZmQyYnBpVWIyalZ0Q2dIOStzT0pmT3NSU1hOVjBV?=
 =?utf-8?B?eDZHcXFJZU0xSEtnMHk2OU90QllXSWFxOXM2ZXgvcVZhblk4a0xZN3hCcG1G?=
 =?utf-8?B?cDNKNGtuQ3o3OUNQL0xaQ0k0WXdJczJZaHFuMEtGRDBCOG0vaTlBZE9DNWdQ?=
 =?utf-8?Q?dYZCBA876cyn/DF2B6m8DsF+aCCs4rhTozjIgr1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7791f0e0-853a-4850-b426-08d93fcf0103
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:07:35.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dR7gufbQyESy6d5i/Nks8VEHBKWbvJgqaEfr6ItiVBxOWomhlAmOM8bPy7fxvj4L7b2BjGilJR+q7u9ou71lFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

... to a new file, separating the functions from their HVM-specific
backing ones, themselves only dealing with the non-translated case.

To avoid having a new CONFIG_HVM conditional in there, do away with
the inline placeholder.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) += mem_sharing
 obj-y += p2m.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
+obj-y += physmap.o
 
 guest_walk_%.o: guest_walk.c Makefile
 	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -849,60 +849,6 @@ p2m_remove_page(struct domain *d, gfn_t
 }
 
 int
-guest_physmap_remove_page(struct domain *d, gfn_t gfn,
-                          mfn_t mfn, unsigned int page_order)
-{
-    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
-    if ( !paging_mode_translate(d) )
-        return 0;
-
-    return p2m_remove_page(d, gfn, mfn, page_order);
-}
-
-#endif /* CONFIG_HVM */
-
-int
-guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
-                       unsigned int page_order)
-{
-    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
-    if ( !paging_mode_translate(d) )
-    {
-        struct page_info *page = mfn_to_page(mfn);
-        unsigned long i;
-
-        /*
-         * Our interface for PV guests wrt IOMMU entries hasn't been very
-         * clear; but historically, pages have started out with IOMMU mappings,
-         * and only lose them when changed to a different page type.
-         *
-         * Retain this property by grabbing a writable type ref and then
-         * dropping it immediately.  The result will be pages that have a
-         * writable type (and an IOMMU entry), but a count of 0 (such that
-         * any guest-requested type changes succeed and remove the IOMMU
-         * entry).
-         */
-        for ( i = 0; i < (1UL << page_order); ++i, ++page )
-        {
-            if ( !need_iommu_pt_sync(d) )
-                /* nothing */;
-            else if ( get_page_and_type(page, d, PGT_writable_page) )
-                put_page_and_type(page);
-            else
-                return -EINVAL;
-
-            set_gpfn_from_mfn(mfn_x(mfn) + i, gfn_x(gfn) + i);
-        }
-
-        return 0;
-    }
-
-    return p2m_add_page(d, gfn, mfn, page_order, p2m_ram_rw);
-}
-
-#ifdef CONFIG_HVM
-
-int
 p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
              unsigned int page_order, p2m_type_t t)
 {
--- /dev/null
+++ b/xen/arch/x86/mm/physmap.c
@@ -0,0 +1,85 @@
+/******************************************************************************
+ * arch/x86/mm/physmap.c
+ *
+ * Parts of this code are Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
+ * Parts of this code are Copyright (c) 2007 by Advanced Micro Devices.
+ * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <asm/p2m.h>
+
+#include "mm-locks.h"
+
+int
+guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                       unsigned int page_order)
+{
+    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
+    if ( !paging_mode_translate(d) )
+    {
+        struct page_info *page = mfn_to_page(mfn);
+        unsigned long i;
+
+        /*
+         * Our interface for PV guests wrt IOMMU entries hasn't been very
+         * clear; but historically, pages have started out with IOMMU mappings,
+         * and only lose them when changed to a different page type.
+         *
+         * Retain this property by grabbing a writable type ref and then
+         * dropping it immediately.  The result will be pages that have a
+         * writable type (and an IOMMU entry), but a count of 0 (such that
+         * any guest-requested type changes succeed and remove the IOMMU
+         * entry).
+         */
+        for ( i = 0; i < (1UL << page_order); ++i, ++page )
+        {
+            if ( !need_iommu_pt_sync(d) )
+                /* nothing */;
+            else if ( get_page_and_type(page, d, PGT_writable_page) )
+                put_page_and_type(page);
+            else
+                return -EINVAL;
+
+            set_gpfn_from_mfn(mfn_x(mfn) + i, gfn_x(gfn) + i);
+        }
+
+        return 0;
+    }
+
+    return p2m_add_page(d, gfn, mfn, page_order, p2m_ram_rw);
+}
+
+int
+guest_physmap_remove_page(struct domain *d, gfn_t gfn,
+                          mfn_t mfn, unsigned int page_order)
+{
+    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
+    if ( !paging_mode_translate(d) )
+        return 0;
+
+    return p2m_remove_page(d, gfn, mfn, page_order);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -8,18 +8,9 @@ int set_foreign_p2m_entry(struct domain
                           unsigned long gfn, mfn_t mfn);
 
 /* Remove a page from a domain's p2m table */
-#ifdef CONFIG_HVM
 int __must_check
 guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                           unsigned int page_order);
-#else
-static inline int
-guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
-                          unsigned int page_order)
-{
-    return 0;
-}
-#endif
 
 /* Map MMIO regions in the p2m: start_gfn and nr describe the range in
  *  * the guest physical address space to map, starting from the machine


