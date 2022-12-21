Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A486531BA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467903.726969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z87-0005c5-3L; Wed, 21 Dec 2022 13:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467903.726969; Wed, 21 Dec 2022 13:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z87-0005Yy-0c; Wed, 21 Dec 2022 13:27:31 +0000
Received: by outflank-mailman (input) for mailman id 467903;
 Wed, 21 Dec 2022 13:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z85-0004I8-Oc
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:27:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2089.outbound.protection.outlook.com [40.107.13.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 371b1f6f-8133-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 14:27:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:27:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:27:27 +0000
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
X-Inumbo-ID: 371b1f6f-8133-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFI+7A7bB0bMZXnCezAEFai+PMf+hrNYXFT0H7ajeaeOifwGT4AA6SCHZOURfCbv1R7Zts0iZOkRGj0aflaovT/IxK5eMKyADNv0YXFusrnRUNIoNbS8vSklL4DORAypVrkoep1BXzPmVXseaRabze4odXRYn/l6XgGPyx25Mg51xbUkXmXnfD0kwwvVx77Z5sUB1ocoiTUZ6Ynwm2Y9i3/Xwuv4camQeFMbL/kHUx53nZ8kOcehXPtIFiiLuM09fnrABviZxm0nNYDg16SPCJ9IGmKIIYFA9GRWZTy2h/RPtTq20uGR9aC/sOEtSKWlfrIOteFOQZficjZHPa9eXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1niUsk5aDtIhCowAMZf6eTqYxpgtxdoRIXxLB3FTKzg=;
 b=SkrBSxbozIkHxw1vAoemOx7uep0396Lk8DUUrzTuBDZpKjrGUthVOuxVkyA/he4Lz/n73Yd9gv08uI3EwEI+gfzqurn+aFLV55RiwTgYhHtd2SUowYVdyyZTgRDU5Q3YpIdauzg05MXA7P0qr7g21J8bwNATuTIdJRB00ZAyy/lyUYdkCCDf+0ubXFzIzmrxCrgnXHSBGaDoYESjxAYzgILSr6XNz4aqgUc/EXb4f0kbMJiC40ad6S/veiX3K1RmKWzRMPPXwg6t16tAsTgLWiYwfrmiIico2b7z7fcw9vJp9VzvIGG10PGhdvBEVcV1UR0jRESyM4YZrPppcDzSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1niUsk5aDtIhCowAMZf6eTqYxpgtxdoRIXxLB3FTKzg=;
 b=Z/EDS2AHz+18HMErqIHcvRR7vY/hepriH43FamuB8Q2w26Gx/j5ipuJPKza5x6+JUpRcyjryVLKZYbdLTV//Otdsmc0ICKqTeBIVtFRnKpLzVMnwwcrpPfmilVh6qkzXxs+Igv0wKwI4w0ompsHY1XZH+ZYdfTqaFqGJoUt0EiGxiWyy3S+5o4pt57PPUdsYOzZ1j4RBdVTvspnHJ/kfXxSlPS8cJ/lK8cpd0rEPVxk0quqRqt9ZW425lI4t49KmjQnLaZ8E42MjJZFGSaApscSVjxnmgwRreqBiTaXmxlT6/1+6XBTLs7ko9lTT+5wLHE+iy/2P1Flsj+o0CrYvYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e142f7f8-1184-a65e-0f50-0b01ec7fad55@suse.com>
Date: Wed, 21 Dec 2022 14:27:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 6/8] x86/shadow: adjust and move sh_type_to_size[]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 8deae829-604d-404a-3840-08dae3571aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mxwVCf2q/XZq1IhjlxzsWPgiR0pMcZy81rcjhanZsLc+qnMDcCo6W4jKvrHbJ4gYGUhb334xOJpOdU1eTkUZrxLquR1RvS9y+m49LJ6r6aSert7G0Op3CsEcBTkPnS5gYHWXUPiQV5KfgiFsZrukr9s4fuYrh9lUEiE65e5al3TKI8rJBcL7kUyyZMihtega6Us3L0c8iHKVr0Zd4lB46U/DSb9co4TB8onhVXbvoZlPF7RXWvcYoJEV9o0klnD0KjqVu57fn8ixzDr6fU9Fv0fCIgTS3F+/dvi5VHYUzjuN849NUtXegiSZ1VtBa8p9Pz31dslxYYZHJesGQwn4hGyR+FFcWUAnc7QShcyLeqcXhUuQlhyTsr/wbmJnbIbu3cSyiKQztQ+krZ1LtDOUx1nk/28a5ynT4mnbfolGplS+/mxG5vwhXHnsQ4JRAvJqYBymxLoNxhEmNH1PL+NNO1Yd0wXevofN1bAkhdxl1SJA6KOFDj9XEv7NjIGS5XEjE8y+Yn4pe4FNI9NYhpQ1jdareW71oA5KI8W91BFq5qLgL4KHk9cxdbTQkRKslwKAV85YlFOpFVrxgsuayQewSj8uD51clNGuF60/mmntqK2RmiJljstLui8cCzDvkETcYrbYSQf5StEy14/u5bGt2TitDrxhlV65i6XzUjs4XhSWR4MVM6ufz4HSfuSljHeiXFrKxGDTRrtV3a/S7qu9LkY7xfq654efJN2H2FD7Wk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(83380400001)(86362001)(31696002)(2616005)(38100700002)(36756003)(478600001)(26005)(186003)(6506007)(6486002)(6512007)(66946007)(66476007)(5660300002)(8676002)(4326008)(316002)(6916009)(31686004)(8936002)(66556008)(41300700001)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTFhOXZCUTUrVGNsYmo1WnlZUjlLS0tmTFU1UU5ybmR4UnlpYk5jRkFHSVNI?=
 =?utf-8?B?M1ZQWFZ6eDdpRGJHZ1lVdGc3a3NtTzdlNml1Z29ManN1OEMyTjVFUWUxenlI?=
 =?utf-8?B?WENNbDVYOUozM3MwTUhsTkQvNVR3RnhBcjlsbDhOYUlRcm5JZElwRVI4aHlj?=
 =?utf-8?B?TllMcUlhVk01YTZpdFJadSt5K2ZJKy9SRXI0dTVqbzNtTDkya3BmSVhyWngr?=
 =?utf-8?B?VjBxWDRXNlZmUG84bW1qWkR6aWpvbXlSVHh0MFdJWU45U0hHWlFhMVJkRnZT?=
 =?utf-8?B?aG5mY0t4bnhJMDVZbHFWY3NwaXdYbFVqNjkyVWJuanNvTG52SkhId0ZMUG1y?=
 =?utf-8?B?bThQaG0wdjR6S0RlYTAyM28xTDdydkRkYzVRN0crdXhTR3BwZmFrd1NTckhX?=
 =?utf-8?B?cXhPM2c4WHdBb0tOWi9VL0hQMEgwWFJSSXJiTit1bmVWZzQwQ3M3eUZjbXhl?=
 =?utf-8?B?aFpOMTdHeU4zTmRjR2kxTkVqQlRheDgyTlZYVktidldpMlM5cDJkc2pWYkdo?=
 =?utf-8?B?bC9vbW52blQyTnRGRk1weHFOaDNGbmZIWlJuZEJteEMrYmZyYzhYVjc5ZlhM?=
 =?utf-8?B?N1hJL0RDNGlTTFdlYnArWVJRSkJlbUdrMjdiSmNwbTlDb2hnRFdsV3ZCamZC?=
 =?utf-8?B?SnpRN1lhTVFBL0lJYlZuck51UXRLQzcyOFArSXFiR3o2TmYxRk9xOHdKY2pq?=
 =?utf-8?B?R0VYaEo0MTFNczIrbjEyaE50Q3phT3FlcWNEQXhtTVlrdzhiSENmUnpmOUZN?=
 =?utf-8?B?N0RtVFpwYVZEWHV5R0VoNW5QQzc0NTlIWkVvYzBCRXJvY29GdDRoejRvbGpE?=
 =?utf-8?B?SXNJUVNDcWt5eDVkUnFCSHNUWjVBWHZjMFJzWXhCUitXNFAyRFkwaW5RTnc0?=
 =?utf-8?B?STN3UVBONGI0ZFMvZEU2UmF1ZzA3d0plQ25zb20waW9SWmZCemJYdE9VZDc5?=
 =?utf-8?B?bHJWWnh5a1JTMVoyQU5pL0ZHSkczYUR4QzBHd3BTc0dBN3FDOGhkNndwblAz?=
 =?utf-8?B?NENsK3dDVEpCdWs3MktXVW0wQ051N1Rpc1FoU2pKcWx4NWN6UjVQZlJBQWM1?=
 =?utf-8?B?L0FrVlBYS0NhM3B4UlAxQktKaU1iOHMvZk83YWxqTUhUYWxUaGRQYktiNDZB?=
 =?utf-8?B?TGVTaWVmWGprblNUeWVoTnpvRzZvQ2RPM0syRzdxNXRmRmt4NnNqMzV3OVdy?=
 =?utf-8?B?VVdjQWZSTUFBSkRLRGtUcDRRVTVKL2tEbHYwV0MvZFdsdnpsU3UrcnBhTmhq?=
 =?utf-8?B?elNRTFZqUys0M2FlYzV5aG5Tc2NHdDZPdC9ibHJjOXFrbHI3QmJsblVVNUx3?=
 =?utf-8?B?Sk1QdytWcnYxZEptamV4L1ErSGY3d1FxdGMzVEEzR08weWpycFpMdldFMHV6?=
 =?utf-8?B?cGIvZUx3Ly9KZ0hwWWdCalVpRVlLd1o0SERKQlU2bVlRaTdIZ2VUTjhzTnhj?=
 =?utf-8?B?ZTlWU2llZXVVZzFJc1pNWGJ1N2tBQXVBZUVPTnhOMEo2WUV6cFovN0l2TGhO?=
 =?utf-8?B?aDlaNmdDTEZqWGlsOXFGQWVub3QvVW9lK25SRnZENHJlODQ0SllJaVRldjR3?=
 =?utf-8?B?N3ZpWGlmbGZPc3RSWnFTbWVNWjVGSTgzd09iZUZBc1ZQRWIrU01BaXk3UGhi?=
 =?utf-8?B?eDdBYnY4QTlGcEFSNk9KemdaemVRSU9GaWdUMUhXdGpPSGNZa1B4Mm1Gbzgz?=
 =?utf-8?B?V2dnMC85SWQwMHA3MVhocUdqMlN2UkI1Q0Vidld3TnNTWTQ2TEpoN2FCKzd2?=
 =?utf-8?B?Uk56K00vQW5iWG1LTFQySVBUN3kxYWJHUzVpc3JRVk1YUk5vaE4zVnFIdTlC?=
 =?utf-8?B?WGl4QTNSRzRtMmdaaExTWmU3ZGJIQWkzdjZIZ1JxREI0Uk5UcXZiZGNTeVBk?=
 =?utf-8?B?T2R6WTYzbEJNYlZnd25jM2RWeVhVQnRRQ3lNbW8wcFRFSGIxcHhYaUh3WG1q?=
 =?utf-8?B?dmFXZG1aMEtnZmZwVGJQK1lmKzBIN0xydjRORkNTQ2V5aEpkOEVJdzZVSWNO?=
 =?utf-8?B?b1haSjh2TTNFbXdiUmU1U0NKSW1RTll2K2RKbzlER1R0YUpNVFU4T3N2NCtU?=
 =?utf-8?B?ZTZUMmlEc3lNN2ZZazA0NUpaQzlOUGRYL3IyOUZwQ21mci9ISVVUQVhRUTd1?=
 =?utf-8?Q?KUiKVYhEidOIwEPIWpgzeSq6J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8deae829-604d-404a-3840-08dae3571aa7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:27:27.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSSeBqK2mb9DSw1Qdwl7/icqBgZYMmnEEcvXgwjjaN3mXZQf7y4iwWF52Cwu/6k31Sbmn1NGn/hCLDu8xuw+aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582

Drop the SH_type_none entry - there are no allocation attempts with
this type, and there also shouldn't be any. Adjust the shadow_size()
alternative path to match that change. Also generalize two related
assertions.

While there move the entire table and the respective part of the comment
there to hvm.c, resulting in one less #ifdef. In the course of the
movement switch to using designated initializers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle the SH_type_l2h_64_shadow entry could be dropped here as
well (for being a PV32-only thing), but I wasn't sure whether that would
be deemed okay right here.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -838,44 +838,11 @@ sh_validate_guest_entry(struct vcpu *v,
  * not contiguous in memory; functions for handling offsets into them are
  * defined in shadow/multi.c (shadow_l1_index() etc.)
  *
- * This table shows the allocation behaviour of the different modes:
- *
- * Xen paging      64b  64b  64b
- * Guest paging    32b  pae  64b
- * PV or HVM       HVM  HVM   *
- * Shadow paging   pae  pae  64b
- *
- * sl1 size         8k   4k   4k
- * sl2 size        16k   4k   4k
- * sl3 size         -    -    4k
- * sl4 size         -    -    4k
- *
  * In HVM guests, the p2m table is built out of shadow pages, and we provide
  * a function for the p2m management to steal pages, in max-order chunks, from
  * the free pool.
  */
 
-#ifdef CONFIG_HVM
-const u8 sh_type_to_size[] = {
-    1, /* SH_type_none           */
-    2, /* SH_type_l1_32_shadow   */
-    2, /* SH_type_fl1_32_shadow  */
-    4, /* SH_type_l2_32_shadow   */
-    1, /* SH_type_l1_pae_shadow  */
-    1, /* SH_type_fl1_pae_shadow */
-    1, /* SH_type_l2_pae_shadow  */
-    1, /* SH_type_l1_64_shadow   */
-    1, /* SH_type_fl1_64_shadow  */
-    1, /* SH_type_l2_64_shadow   */
-    1, /* SH_type_l2h_64_shadow  */
-    1, /* SH_type_l3_64_shadow   */
-    1, /* SH_type_l4_64_shadow   */
-    1, /* SH_type_p2m_table      */
-    1, /* SH_type_monitor_table  */
-    1  /* SH_type_oos_snapshot   */
-};
-#endif
-
 /*
  * Figure out the least acceptable quantity of shadow memory.
  * The minimum memory requirement for always being able to free up a
@@ -1121,7 +1088,7 @@ mfn_t shadow_alloc(struct domain *d,
     unsigned int i;
 
     ASSERT(paging_locked_by_me(d));
-    ASSERT(shadow_type != SH_type_none);
+    ASSERT(pages);
     perfc_incr(shadow_alloc);
 
     if ( d->arch.paging.free_pages < pages )
@@ -1201,9 +1168,9 @@ void shadow_free(struct domain *d, mfn_t
     perfc_incr(shadow_free);
 
     shadow_type = sp->u.sh.type;
-    ASSERT(shadow_type != SH_type_none);
     ASSERT(sp->u.sh.head || (shadow_type > SH_type_max_shadow));
     pages = shadow_size(shadow_type);
+    ASSERT(pages);
     pin_list = &d->arch.paging.shadow.pinned_shadows;
 
     for ( i = 0; i < pages; i++ )
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -33,6 +33,37 @@
 
 #include "private.h"
 
+/*
+ * This table shows the allocation behaviour of the different modes:
+ *
+ * Xen paging      64b  64b  64b
+ * Guest paging    32b  pae  64b
+ * PV or HVM       HVM  HVM   *
+ * Shadow paging   pae  pae  64b
+ *
+ * sl1 size         8k   4k   4k
+ * sl2 size        16k   4k   4k
+ * sl3 size         -    -    4k
+ * sl4 size         -    -    4k
+ */
+const uint8_t sh_type_to_size[] = {
+    [SH_type_l1_32_shadow]   = 2,
+    [SH_type_fl1_32_shadow]  = 2,
+    [SH_type_l2_32_shadow]   = 4,
+    [SH_type_l1_pae_shadow]  = 1,
+    [SH_type_fl1_pae_shadow] = 1,
+    [SH_type_l2_pae_shadow]  = 1,
+    [SH_type_l1_64_shadow]   = 1,
+    [SH_type_fl1_64_shadow]  = 1,
+    [SH_type_l2_64_shadow]   = 1,
+    [SH_type_l2h_64_shadow]  = 1,
+    [SH_type_l3_64_shadow]   = 1,
+    [SH_type_l4_64_shadow]   = 1,
+    [SH_type_p2m_table]      = 1,
+    [SH_type_monitor_table]  = 1,
+    [SH_type_oos_snapshot]   = 1,
+};
+
 /**************************************************************************/
 /* x86 emulator support for the shadow code
  */
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -363,7 +363,7 @@ shadow_size(unsigned int shadow_type)
     return sh_type_to_size[shadow_type];
 #else
     ASSERT(shadow_type < SH_type_unused);
-    return 1;
+    return shadow_type != SH_type_none;
 #endif
 }
 


