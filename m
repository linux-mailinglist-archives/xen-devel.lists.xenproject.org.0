Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C023A0FB1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139111.257339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquX7-00039n-Eh; Wed, 09 Jun 2021 09:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139111.257339; Wed, 09 Jun 2021 09:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquX7-000376-Ao; Wed, 09 Jun 2021 09:29:57 +0000
Received: by outflank-mailman (input) for mailman id 139111;
 Wed, 09 Jun 2021 09:29:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquX6-00035P-Cp
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:29:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59f7ec7b-23dd-4058-85ad-4173d4163aa5;
 Wed, 09 Jun 2021 09:29:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-UC3lEw0DPp-taYdeEFZHVQ-1; Wed, 09 Jun 2021 11:29:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 09:29:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:29:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 09:29:51 +0000
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
X-Inumbo-ID: 59f7ec7b-23dd-4058-85ad-4173d4163aa5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KAEC3zWHdiALl0C1ggZlQZ2fYmIEsDbbA+043+P3nms=;
	b=FleOa31A9W3LlJNgFXt0P7ZUUOMSQQVFBQ3IyKee4pZvUHFI5+nnc69hUU1CbEceEtmekd
	IQQ3MTvSTKEw/0B6R0D6/2b/H7Vl5qqMT3f+L+WvoWLtvP033MbBiYb+G1ejraOEWTbXT1
	SM9ZDk7ikvD9a7MLuoNebZOzprEDMU0=
X-MC-Unique: UC3lEw0DPp-taYdeEFZHVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8J9IL6S32rKOZQRQmluRquayipicGoLFHGEaK46bsDCBN0SucwY6TpGYWzJowQIvZm336MPVdcgSWcjP8Dp6KSBbg0g07Y6KS3KD2qjjYd7DiBGgOsg4zvMYAUmXhPpA+fqt/b/lzcfioI3en8UgSCr9ZH01pYD6fXY6AQ5NGRN2OpiUuTwJ0s1BAqwyTBjP7+aZGsUxI+1B6vaqBDfBB/Pc2SSNSWZzu+sgC4tntaaOJgZXP+xifEBtne1ueQka3QUbtLXZxI+epio7SnqUbx3AZ9pmKazEjfqmGRw+j/yf+OhXBdcCzwXvDgIQnjiUv6hZFiG/JSS/tw8clVWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAEC3zWHdiALl0C1ggZlQZ2fYmIEsDbbA+043+P3nms=;
 b=FgpOWYlA3s3a1sHIME3mGdQ9aAkE/9vGqCmnN0peIK9aBKH9P9oo967PwXASSDIP/uOmxT5Sui2MAKbgPyNW2qXKoz2RwI1FD15h6WiTJGedVs1yC/gA7yoxyx7EdfcenFgcnis3iDOIOjdhHubB5gReDR3Heva2FXMZqOD7Fzxz+koqesbgWn37SasESXXq9EU7ZaWDYlE1UOpVkfPGo1KZvoOQXfCW4zJwPwg40n0WhaNJ2NZ/RVJOavPoZXt87zuHeTZqcaxdHS4zuB5//+oZGYIVoay6H/ShQsFGDRlad5wsvURo2D1XVjg0rZ4Og1A8rzKod11ltn/e9QCAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 8/9] VT-d: drop/move a few QI related constants
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <1b8558d4-42cc-bd68-e6c8-138f40f81e1c@suse.com>
Date: Wed, 9 Jun 2021 11:29:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f23b461-0b43-4604-b9e4-08d92b292263
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845B755358F51D92EA1228DB3369@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S8xSz1li6bF68Z1DKHw9Bnfjx56P7Ybrlqr3JIn+7bGSXRov4QXZlObwoffnz9Tp6E0w7DvI485hHjQBh4n1B+ZaySi3/2RsI9bFclfszGa9SxYhIF6lOFYpDnQogdMMcbKW+Y4H4Ve2ra4naECQbDwmlqzRigvcLiA3ywxvPi8nZV1IOM/nHBppWs7eCYtrQt+HkhCR/TmwWK2ZB4quLApdBGLGXDeDfRdLzMMjJSFvIf/1TLmfdpxjQ25e1V9gaB1KPfosZR9+qz/TgeR7BXqWVILrqrN/TlaayZWJtp1vaPNnlmCvXEghA6m3DErwmqGLb+knIyxaLBtO46qTUH4o0Z9s+tiY3bn0bnYQu5Jxkc4/dAzbVKUEJreNbuWrdy5ocXnePhhC5m9RJ3Z/xZ4X5yIOECn2EMDOV4wgaV5Df9dvbhQpP8klkIri/zlxSkQmZf+unJV3quAROayUAJNhJ5BI0WYpUBq0GHmAcg3QkrWBOX74gjzsjRM9bY5YijGjIzzufpOlKXlqu2azeOb1vIPdKbCwsOuhhoOJQzdWwoH/08gwIzBE4hW4/KEhSrH6gioM52+7/p22iIvemzVGjyWvgYYTAl2kRKVgJawnfy+w0KmCVsVFsasZb3AZFNKvTS0tbywASmU+zkP8/Y4Sel4UnW0fjUQts6l6kk+YmaVEJSoNCeRpNkIZF434
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39850400004)(396003)(376002)(346002)(316002)(478600001)(86362001)(8676002)(38100700002)(83380400001)(16526019)(26005)(186003)(36756003)(956004)(4326008)(2616005)(8936002)(5660300002)(6486002)(31696002)(6916009)(2906002)(66946007)(54906003)(31686004)(16576012)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?MFRpcEJZN1NUUlRSSElRVWZ2U3A5aGpGTUcvWVBaKys1eU5qeldWak83V2JE?=
 =?utf-8?B?a1lHcnVBR0R0L09sZ3BYcHVGY3JCNEZlMVhxY3MvSWM5VWtrSWovaVp4UXdn?=
 =?utf-8?B?UzRMSXBKS0E2N3A3dlpMRlpvKytaVUVwMFBvV05LaVhPUUtaMC9EazlMV0Ro?=
 =?utf-8?B?VWswU1VNQXV5aWdtZEVQY3JTeXVsZStGVjMybnI0VW91LzRPNmJNeTFmQ2FT?=
 =?utf-8?B?UHZ1NTloZDNjZkJLQWdJUWFyaXhESk5BRDRFYmxST2pDZmliaEYyTGd0MkJI?=
 =?utf-8?B?Q3Yzb2sra2tVdHh0czNwcmpxdFBtSEl4MGNQUURVZFUxeTE1ajRKTUU2RUk1?=
 =?utf-8?B?N0Z4SEM0cXhQUXdKSVhDemlYWEk5SVBRZjJ3STl2YzJ2WmJidHhWOUI5RUF2?=
 =?utf-8?B?dTg4eG42SjhDRVo3T2lCUDF6Z3pONDZuWVZsTU5JTzhKOFVRc1FUV1R2OHVF?=
 =?utf-8?B?K3BLTFZCdUY0QXZGUjdlVnF4WUI4S0ZrS2JpK1lTN0pBUUJxeWxqNmkxN0FG?=
 =?utf-8?B?LzJLSjRZRGtuWGdHcG9MNnFVQ0hneEkrSmJlaEJSSmFsL0tqaVZHLzhjQk43?=
 =?utf-8?B?MWJ6QmhoUkg1RnlXWEFlVkRsck1iZFZWWk1wU002K3lMb3A2STgrOU1FVCtw?=
 =?utf-8?B?VGY4R1FLc2QxR1hXYmNGNFRPUDhlc0IyZUlVSCtKQms0Tit3bGc3MlBHdFZs?=
 =?utf-8?B?QlJNTHRMNGJHeWJ3SGtMbmw1cEtEcTNwS2M4c0RpWEs1N2RYV3JkMWYwU1VR?=
 =?utf-8?B?UU5NbmM4SEtjU0dZWit3TEdzQzN6YjZtWHFhN1hJckRFNWhGa245bW5GS25J?=
 =?utf-8?B?MXljYmxPSzZBTGMvV05SdENtYmZVOU1EUzZJNUZMV25vYURyRC9PMUh5SVFI?=
 =?utf-8?B?TUc4YllvSkxoaU1sbW9iUmRiR2RoN2oyMzNXajQxenVYM3ZERmtQdjU2NUMz?=
 =?utf-8?B?enVLQzhnUVdKeGt5dnFUQnc5QTVLWnpsYjRhZEhRZUFjL3hWVlNhR0k1N0lr?=
 =?utf-8?B?UUl6b1kxUHJWam1ZUlhWUE5tc1JvcjgxK1RwMjBJQnRkTXMxR3Btbm9EakRB?=
 =?utf-8?B?K3A4SjNOY1p6WXFVOGdWRVVnQ2JZUGFHY3FsWWdQWU1VTVgyUHlnMlNoME9Y?=
 =?utf-8?B?bzJZNVNSOVRoY242bXVkb2czb3VpWG1XSzE3THR1RGpFZEczNzRWbnRKZExw?=
 =?utf-8?B?VUV6bWVNcDlPUWpoOThLL0llNlJhMGVaN3FWWkZhTWFKSmpUcWt0M0pIaVhl?=
 =?utf-8?B?OGtoRHZOVURYbm0zazUzZkVZZkgxR3NZZHNwUDVPNUVTaFRIb0xST0RiT2Vq?=
 =?utf-8?B?aFVwK3BYUkJ6ei9WSUw5Yk51UUdoZ05CR2VxV2JYcFVWKzQwQ1pnQVJZRmw3?=
 =?utf-8?B?WVlEMkQ1Q0I0TzBKejZvV1pydEpzTVZrN1FQVjd2Q0FnbldRNDZKWXAvZ1Bh?=
 =?utf-8?B?M2VEbEZFR3k1NWI3N0ZRN004b1hWSmZ6OG5XTlhWSlpGVjFobDlNd3JvZzhO?=
 =?utf-8?B?YVEwRDhaUXB6WW9Gay9pa2VaZ3ZrbGRyVEY3ei9KOFJuRXNFT0VybDdzcER4?=
 =?utf-8?B?bmxEazUzSmJHLzRBcG5pWnd4Sms1cFpKMmkyU08zVjNLVUUyYXdHckNUZU51?=
 =?utf-8?B?ejQ0Y2UyVElzQmVxbEQ5UDdGZEk0MHRSSTV5M0lBcklQV2t0UGVRU0FrVTR6?=
 =?utf-8?B?c05wR2hOMXArbVlOS3ArWDJxQm5rajRHbGx6RmlyaE50aUVJdDA3UDZsRENn?=
 =?utf-8?Q?jNuRPXFa+0u1mBk8BQOvhr0IkiPXADf0jxywiq9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f23b461-0b43-4604-b9e4-08d92b292263
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:29:52.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twIWbEA6QsPJfnyy4cbzQwoGeM/enrB02AXLfANTVHdZG0yp7oQZ4gRCqL6inFokNZ2dSHt9BDTAO1DxH3d1Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

Replace uses of QINVAL_ENTRY_ORDER and QINVAL_INDEX_SHIFT, such that
the constants can be dropped. Move the remaining QINVAL_* ones to the
single source file using them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -451,17 +451,6 @@ struct qinval_entry {
     }q;
 };
 
-/* Each entry is 16 bytes, so 2^8 entries per page */
-#define QINVAL_ENTRY_ORDER  ( PAGE_SHIFT - 4 )
-#define QINVAL_MAX_ENTRY_NR (1u << (7 + QINVAL_ENTRY_ORDER))
-
-/* Status data flag */
-#define QINVAL_STAT_INIT  0
-#define QINVAL_STAT_DONE  1
-
-/* Queue invalidation head/tail shift */
-#define QINVAL_INDEX_SHIFT 4
-
 #define TYPE_INVAL_CONTEXT      0x1
 #define TYPE_INVAL_IOTLB        0x2
 #define TYPE_INVAL_DEVICE_IOTLB 0x3
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -29,6 +29,13 @@
 #include "extern.h"
 #include "../ats.h"
 
+/* Each entry is 16 bytes, and there can be up to 2^7 pages. */
+#define QINVAL_MAX_ENTRY_NR (1u << (7 + PAGE_SHIFT_4K - 4))
+
+/* Status data flag */
+#define QINVAL_STAT_INIT  0
+#define QINVAL_STAT_DONE  1
+
 static unsigned int __read_mostly qi_pg_order;
 static unsigned int __read_mostly qi_entry_nr;
 
@@ -45,11 +52,11 @@ static unsigned int qinval_next_index(st
 {
     unsigned int tail = dmar_readl(iommu->reg, DMAR_IQT_REG);
 
-    tail >>= QINVAL_INDEX_SHIFT;
+    tail /= sizeof(struct qinval_entry);
 
     /* (tail+1 == head) indicates a full queue, wait for HW */
     while ( ((tail + 1) & (qi_entry_nr - 1)) ==
-            (dmar_readl(iommu->reg, DMAR_IQH_REG) >> QINVAL_INDEX_SHIFT) )
+            (dmar_readl(iommu->reg, DMAR_IQH_REG) / sizeof(struct qinval_entry)) )
     {
         printk_once(XENLOG_ERR VTDPREFIX " IOMMU#%u: no QI slot available\n",
                     iommu->index);
@@ -66,7 +73,7 @@ static void qinval_update_qtail(struct v
     /* Need hold register lock when update tail */
     ASSERT( spin_is_locked(&iommu->register_lock) );
     val = (index + 1) & (qi_entry_nr - 1);
-    dmar_writel(iommu->reg, DMAR_IQT_REG, val << QINVAL_INDEX_SHIFT);
+    dmar_writel(iommu->reg, DMAR_IQT_REG, val * sizeof(struct qinval_entry));
 }
 
 static struct qinval_entry *qi_map_entry(const struct vtd_iommu *iommu,
@@ -413,17 +420,18 @@ int enable_qinval(struct vtd_iommu *iomm
              * only one entry left.
              */
             BUILD_BUG_ON(CONFIG_NR_CPUS * 2 >= QINVAL_MAX_ENTRY_NR);
-            qi_pg_order = get_order_from_bytes((num_present_cpus() * 2 + 1) <<
-                                               (PAGE_SHIFT -
-                                                QINVAL_ENTRY_ORDER));
-            qi_entry_nr = 1u << (qi_pg_order + QINVAL_ENTRY_ORDER);
+            qi_pg_order = get_order_from_bytes((num_present_cpus() * 2 + 1) *
+                                               sizeof(struct qinval_entry));
+            qi_entry_nr = (PAGE_SIZE << qi_pg_order) /
+                          sizeof(struct qinval_entry);
 
             dprintk(XENLOG_INFO VTDPREFIX,
                     "QI: using %u-entry ring(s)\n", qi_entry_nr);
         }
 
         iommu->qinval_maddr =
-            alloc_pgtable_maddr(qi_entry_nr >> QINVAL_ENTRY_ORDER,
+            alloc_pgtable_maddr(PFN_DOWN(qi_entry_nr *
+                                         sizeof(struct qinval_entry)),
                                 iommu->node);
         if ( iommu->qinval_maddr == 0 )
         {


