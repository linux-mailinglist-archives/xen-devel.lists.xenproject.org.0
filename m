Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2B550DB3F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312504.529766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuA5-0006XC-FE; Mon, 25 Apr 2022 08:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312504.529766; Mon, 25 Apr 2022 08:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuA5-0006VK-B3; Mon, 25 Apr 2022 08:33:37 +0000
Received: by outflank-mailman (input) for mailman id 312504;
 Mon, 25 Apr 2022 08:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuA3-0005KM-J8
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:33:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6538076c-c472-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:33:34 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-uwry9y5OPUeZAKnkaGefdQ-1; Mon, 25 Apr 2022 10:33:33 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB9567.eurprd04.prod.outlook.com (2603:10a6:102:26d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 25 Apr
 2022 08:33:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:33:31 +0000
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
X-Inumbo-ID: 6538076c-c472-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z53/35ZdniZbOvRjYGCROZXOzui9qbcXDOdkOD0m+zk=;
	b=MBPp0o1HKTKEDby7Ewe7v6glUqF85R10qpPM+6kgugU5bg2sAEGjonAkJQ23HNOUFFrZST
	daTr53/TpwPMogHoMo+9qOR3nsYwyc/XZ+bn2YPMKA+W6QNkdgnVYDxG1PzyoVZbJtFgEG
	X3BjBL70DypzJjBU/h2Bc8qSp4RKJEk=
X-MC-Unique: uwry9y5OPUeZAKnkaGefdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDQXtv204C/f9VPwvQC511Wup4uJLJK6ZrI5DSLO0lFc1xR4Lwl4g3V91MMtzhj59jgYbUROtqtgy2oCD24m79oPW+f3v6AMarRLxw/pMkbgG2pWAbcSc1PE1ids8PDSYY+mMQe4kPOmw8xQcvtujP4I5OCcQB78o7h1Nnf6E8pP2IFxpgcDuq3U/YEHoB0wkzWZAXgeqT3oEjEV0zpkgj8yVum4psd1hfozJRqNHYyakPT+KUa/TTzqxIQA63dNnPMDqgrkdoySGsR89BI5aqtWf+dy/tU0up/uPlRjUjZY0Jt6Iwc6753dGbbYIDw+1k/0gNIoJivCUKISqeLx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z53/35ZdniZbOvRjYGCROZXOzui9qbcXDOdkOD0m+zk=;
 b=MiAN1DnqOTNQw7Im0x6j2PAROhgQWsQdBY1QpE4pLFhWGwW0JzeFXnsFirBtFSLxEXNDTD55AUCtZ7lOyl26FqbScv/95kZWfXrZEbMBnicbW+VQ+vE7C8/187Y2ldBOPEIL87nMBwBnRGNGxiifH0i7yTkfqhjzGE6d6GnCq3KW5XmveB54NmmyRAI9kOddIuerUeECQN2qBTvBfWAKIDmC5gfCJeyKrDzodo8+1bzz9+p9rGi6g3Khcc7KPjCLludoSw1mMpy4npoaD6J/Eb9OJFXQVhoYLdQn9JWu3oXS8rzgi+VH5OzV/9sIvIuXUmyQj9/GPuG+3cvupNzAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <227d0bd1-c448-6024-7b98-220271d9bf63@suse.com>
Date: Mon, 25 Apr 2022 10:33:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 04/21] IOMMU: have iommu_{,un}map() split requests into
 largest possible chunks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0040.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb8186a4-4d2b-4713-8fd9-08da269647c7
X-MS-TrafficTypeDiagnostic: PA4PR04MB9567:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB9567713203EFFD3D0B8922E3B3F89@PA4PR04MB9567.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YGQMhTH3ufYG3qJKRgFZ0mnwQxBkZ7EZQB9Y3QhlDYJ89pwbtb4dzpbMU9sgzuOI4vtDVizXbn//Y8rXi48infzq8wk9X5Zpv2OAcyEj2bsyVM/h9r01u4qBikE4Cs5dCacB8IsoN3urOLi8VJHV32PqLIjD5Kj6kVKvHR+rVCZ7kofDLPITxghibsirXafGNWWwWiCxtpycIZ4FEG/GGJ60el6s8myYoOvckW99sq4pL6tYbZh4Hsu0lwMjwG/nU5cDJLYDWEIQZCy37wrYyz57oCNB1UjOAsiOAOd+kPLghA+2mMe6qstYnzcY3Hl5ZLoHhA7PS1H0SC1gE+MQkMH8ys5ffFsqQsiaG21fSFxQNuxp7fPrVMl3KhDaym8SZ5nDZlv6biY+YiC9raImcaUaRy6Ux/83JwlFUhUWhIbuL8s5ISfXUW5l0lpZwiiXwB1ZWEq35hvlEKj480WuUHnYXVNFLQbAmgwBFTVnsxAG9QNyXMMwBVlwcCU/9JsEI0lpM6kKQw91YAPDuTuZLD7saRLX+ljm3uE8JU4FTM1+SE3P2mFlEsRls1HbqdJR1/zbVBWnzRmDN83GoeGyelX+TlpqWSiNwIZMl8hSSI/YTK/7SEyVfmzU0/SI/lRjvjLuJTWo8+ml8ebOEcI0AbTEiSHsHlSvFy8YKtGmh/TwKiXt4dLOqbvRkWIIwKFZfldZz3Pdxg99fp0UK1ZN/NthhcuRNpdp+WEtZfnLQZY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31696002)(5660300002)(508600001)(31686004)(54906003)(6512007)(2616005)(66476007)(6916009)(316002)(186003)(2906002)(83380400001)(4326008)(8676002)(86362001)(38100700002)(6486002)(66556008)(26005)(66946007)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjRaTDR3ZWFPN2dROUhzcTJnbjJqUDFkYkJtRjJRb25JeDRYYm5VKzc0d0Er?=
 =?utf-8?B?YW9sUFpadU9sOE1kUk9DOW4zR1ZVZUkxYnNjTVJLU1hQenlBZnd1ekxCcnkr?=
 =?utf-8?B?bXpqaEZXSFliZDh0ZXdpRVEyRkpJNm80MXlFQ0dMNWFpOUFVaFZhWVMvVEJj?=
 =?utf-8?B?c2ZUbTZsSGpHL0tRKzFqQVc5c1lNK2FGNzVWTE5qNWZhUE9DekJnbVg5c2Jw?=
 =?utf-8?B?WTNlNHg5MlRLV0hNaks2emdZYVU5RWI5TUFBYzdxZUcvY2F3RlJkL2NhUGcy?=
 =?utf-8?B?STRwaksybXVPb0hyZXIxak9jVC93dFN5bGlRcHd6NE90cmpsOWo2b1E3bjg4?=
 =?utf-8?B?cjRaRUJwbGRnMS9rQmFOZlAxY0xPekM2eGZaMDlGOUtNeElBNVBtd3Fra2tM?=
 =?utf-8?B?U0ZsS00yeEdIeDVCMHk4a0tSOVdsVGV3b3FmeUZMUVNCRXZqRHFQSXN6M0tN?=
 =?utf-8?B?dDQ2RlMrNVp4LzN1K3pwditFalgvK2oreDdvYlpnRkpvdFZWSS9RUHdVd09T?=
 =?utf-8?B?UWpiTW85Q28rRDkwa2wxTVNxSjFFWUpTNDR0YnNpV0poUGZUM3UzY01HTFBn?=
 =?utf-8?B?R1BIOGVWZlNIZW5ZUFoxQm1uWDgzRFlOV2tWaUVYMkNuRXZFbVZreDg1NllE?=
 =?utf-8?B?WkxWWWlNUDI0UVF4NGF2a1BCUHpTQjV1enltUCtZdlg3SVJxVm5yb05yWTRa?=
 =?utf-8?B?QkdRR2hDUHlwVkVHSmZlRHg3anA5clEwWWdqYnpaRzFaTFZydWpXQVpOdlhw?=
 =?utf-8?B?L0tzQ2JuTGtydGVIRlo4bkZBemR4NXNpbTdDLzdSSUpaWGZFMmp5a2tBdEFu?=
 =?utf-8?B?VzR6WEVNdkpSV2FxNjBSVTF2dUFQbTBWemd6anAycjZzY2MxdnVmckFZeFhQ?=
 =?utf-8?B?eEw1cExVVVdRUUJxMWk4ZXhuVS9tKzhsdllCTHRkb2Z0Q2IzU0c0emdxVlpi?=
 =?utf-8?B?VWhaOVBFM0dNcW5TVnlUc2x5QnZpZStnOXV4ZHJLNXZvSUtBbWhoanFGakF0?=
 =?utf-8?B?ZEdsOFBnczhsWVVPNXE3bndOSFZvYmdUU2F2bGFYbTVqbHExSCtoYjJIbFV4?=
 =?utf-8?B?dFkrNXNzK0dKU3pkaEtoc0ZPSUM2amlqM3BPVlNjQnJqRFAxdTBNeUlqd0R2?=
 =?utf-8?B?STZoT2cvUkt6OTUwcFlYSDdKUms3Q1hnTkp0bXYxMkRROE4xVE16NGVvczZV?=
 =?utf-8?B?cHFPT2FtYkxNODQzeTJJVFFQSGxNZ3BtWjdhNHVPQkpLaDgxRFRLVXg3WDZv?=
 =?utf-8?B?MFU0c2NZaHRrKzNhQzJTN2tlM1N5MjNyMkt3dzR6V1dSZlVCNnVibzlWdEF5?=
 =?utf-8?B?d1VIU29mYUdtTlBBRjB3V3BhNDkycDFScjNiWUVtbjJnSmduS3lQNFY3QnBp?=
 =?utf-8?B?Umd4clQrVHZldXlPdTNEU1J4RHp0SUZBRjdkaUdLamEvU0FzMDM5c0FzUGUx?=
 =?utf-8?B?OENQaVA5SzlQenRIRE5yMXExZExWZkRRSkJHaUpmdjBFV1duUkZQc2VNaDZx?=
 =?utf-8?B?K0o2eXgzRGFqWXdkR0hQY2tYQ0svMnUwNUs0eENsS010WmZSOUcvVWkyU1Iv?=
 =?utf-8?B?amIrRUMrVnlHUG9XNGZJVUNUeUJBdWt2M1Zjdkt1d08vQ2pGQjJaVU5MUVRG?=
 =?utf-8?B?SVIxMFVzcHVPMmcyakpEOC9lTXlob1BFa2dseTB4NnpSdVZ0Lzd6b3JBOFJW?=
 =?utf-8?B?T3V3WWo2VDhZYnM3WjZWazNZeTVBc2xKVk9DUDl6TTZ5L0QxbzFYTXROcEtm?=
 =?utf-8?B?Y2JjUXFCVWk5OGI2SjJHSmlRVFc5MFhDUzVnN3JzWlJUZkpxMjhQZ3lmdGdB?=
 =?utf-8?B?REJDSHU4M0lNdkxUblJpMFNmaERhd2Z1TU50TkpCeGlkMkRjSDU2Z2I0a25n?=
 =?utf-8?B?ZWhlZzlzM1NYZ0dzY0pjQVdXUG83eFJMUzdhYTZ0ck9ndHB0VGxibmIwQllo?=
 =?utf-8?B?Q09ySjdoQW1EbkxaTEhsOVdLcmxoV0ducExkTVBCQ1o3REFuSHVFZlBacGRQ?=
 =?utf-8?B?UlhLWGZoOS9VWm5LZWVtdWdlLzVOU1E5Nk1CUDlDYWFrSEJQU0tiQlQ3SDJD?=
 =?utf-8?B?Y1RPczNwNjRuRHRDZW82SzkxYWlMT3dZUlpLTHQ2dUhHRWlaUTRLVk9PVDIx?=
 =?utf-8?B?ck9YZEFIaitzQWl2bklMQk1tUHZ6elBTbXhmZ2ZST2RSV1ZkWGE3aEhhS1Jx?=
 =?utf-8?B?MzZSaktjS1N6cHZVdFFMUTVCUTlQWFNoV3VUUlR3U291S1IvOFUva1BvVW5V?=
 =?utf-8?B?aXJCQWN2R21CQWlaL09WT2VCVTZWR2VYaWZzeTFWSmYzeUJlVVovaG1KaGdG?=
 =?utf-8?B?dHQvMGZOVmhjZ2RIUWF0STlQeWdDZnVmbkNkVFRyeDVmc3kvUnJzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8186a4-4d2b-4713-8fd9-08da269647c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:33:31.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMzdGho5gKzkzrISqdWMGx1hw/CHOUWgHGKUCs20jhSdc6melKevyZ+aRQbbcwXyJDdpfNBWScqO1tAquH+oPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9567

Introduce a helper function to determine the largest possible mapping
that allows covering a request (or the next part of it that is left to
be processed).

In order to not add yet more recurring dfn_add() / mfn_add() to the two
callers of the new helper, also introduce local variables holding the
values presently operated on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base over new earlier patch.

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -283,12 +283,38 @@ void iommu_domain_destroy(struct domain
     arch_iommu_domain_destroy(d);
 }
 
-int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+static unsigned int mapping_order(const struct domain_iommu *hd,
+                                  dfn_t dfn, mfn_t mfn, unsigned long nr)
+{
+    unsigned long res = dfn_x(dfn) | mfn_x(mfn);
+    unsigned long sizes = hd->platform_ops->page_sizes;
+    unsigned int bit = find_first_set_bit(sizes), order = 0;
+
+    ASSERT(bit == PAGE_SHIFT);
+
+    while ( (sizes = (sizes >> bit) & ~1) )
+    {
+        unsigned long mask;
+
+        bit = find_first_set_bit(sizes);
+        mask = (1UL << bit) - 1;
+        if ( nr <= mask || (res & mask) )
+            break;
+        order += bit;
+        nr >>= bit;
+        res >>= bit;
+    }
+
+    return order;
+}
+
+int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
               unsigned long page_count, unsigned int flags,
               unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -296,10 +322,15 @@ int iommu_map(struct domain *d, dfn_t df
 
     ASSERT(!IOMMUF_order(flags));
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
-                        mfn_add(mfn, i), flags, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        mfn_t mfn = mfn_add(mfn0, i);
+
+        order = mapping_order(hd, dfn, mfn, page_count - i);
+
+        rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
+                        flags | IOMMUF_order(order), flush_flags);
 
         if ( likely(!rc) )
             continue;
@@ -307,11 +338,10 @@ int iommu_map(struct domain *d, dfn_t df
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)),
-                   mfn_x(mfn_add(mfn, i)), rc);
+                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
 
         /* while statement to satisfy __must_check */
-        while ( iommu_unmap(d, dfn, i, flush_flags) )
+        while ( iommu_unmap(d, dfn0, i, flush_flags) )
             break;
 
         if ( !is_hardware_domain(d) )
@@ -343,20 +373,25 @@ int iommu_legacy_map(struct domain *d, d
     return rc;
 }
 
-int iommu_unmap(struct domain *d, dfn_t dfn, unsigned long page_count,
+int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
                 unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                             0, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        int err;
+
+        order = mapping_order(hd, dfn, _mfn(0), page_count - i);
+        err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
+                         order, flush_flags);
 
         if ( likely(!err) )
             continue;
@@ -364,7 +399,7 @@ int iommu_unmap(struct domain *d, dfn_t
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)), err);
+                   d->domain_id, dfn_x(dfn), err);
 
         if ( !rc )
             rc = err;


