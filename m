Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE95F416F93
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195137.347689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThrw-0003bB-1j; Fri, 24 Sep 2021 09:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195137.347689; Fri, 24 Sep 2021 09:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThrv-0003YM-UW; Fri, 24 Sep 2021 09:51:47 +0000
Received: by outflank-mailman (input) for mailman id 195137;
 Fri, 24 Sep 2021 09:51:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThru-0003Uf-K6
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:51:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 069d156a-1d1d-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:51:45 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-e_Q9zH3ROgOp0QTUyJUQ1w-1; Fri, 24 Sep 2021 11:51:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 24 Sep
 2021 09:51:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:51:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 09:51:41 +0000
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
X-Inumbo-ID: 069d156a-1d1d-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnyJfGA//OwEpfHeLio8RibL7MiCX+yG5T2utpneOsU=;
	b=J61IVrvQSEPDXeQStfQ9dhPRWc9QFNwIOXcVosX4+w9nJ+sjgFg01MaMHX4NbtItrK+QWn
	H7un91cqGKIfcgvo7md3I2BBkSzsQaDMZF7By4u9pMUr2WIP19LUPlWJunQPyikWR95AjI
	3NGy0xHg69HuHvh+GwJjC1Iv3nxqHy4=
X-MC-Unique: e_Q9zH3ROgOp0QTUyJUQ1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkUnLuMKY5cejw1hi8vSj/drZOWPMkwDuy+R7RHBiY58f7nZZuP9SfRb7RA26O4cxNy+3/g8sl/fo4AV8/Mc/zdQKa0N/uypQq3kC4DvF/11xrvO+eS1CvVTcJQna/gfVOsx/y5SBo6pVVAh5ONzPfSibMUPi5GV4pF/XqR7Qp7VzVoZnnpb5bC+Cc//lhwnba62fk1Jf0bnLS1D5et4h/1c72IzpzXx9XzdF40et2TFQlkFWdtUFjN+sZluTF40erLk5jWTKXnmYvpLwGRMckfyfj+zK5NK32Oyjac7A161ItzRVq+orGEJwGj19Yc7zt48HFYgWlZXzQ1eUgcL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QnyJfGA//OwEpfHeLio8RibL7MiCX+yG5T2utpneOsU=;
 b=a9Vly0idnV/kxTbee7tSV/ocW0qYSpN0r4nhV9FrhNtGDELNVkM9/rY8mIs0GNQLR7DlyPxAWWC0HZIgLMS1FiqP6z6NkzvYloMq8crm4x067RhYfjoI5lgOLfKkyNbW7VDaUfpvsuzXG8D93nECP+GjouWPZBV16zUspDsL5wcs4P21HrRjoU/jEzCfBJUhxQsALBYBVy7c1Wff6Gv31KqZnNexpbVFcJa+uA8+SAGKfH1Q8EQdtHEsGiuEfJF9wrrGwhfgbpG5OhL3I/APXaLGJK1NNw7Q9NRcxMsj4CxhIgmotLdfaOBZWTGNRHZvu49lxiWZLBhzP1b3bSFk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 11/18] AMD/IOMMU: return old PTE from
 {set,clear}_iommu_pte_present()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <33819694-2787-4bd6-1830-6b4eb81cb4a1@suse.com>
Date: Fri, 24 Sep 2021 11:51:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38bf7131-378d-40b3-c1d6-08d97f40e937
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446ECD9FE2262CB99D3BF1BB3A49@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DecMR9iCG+UI9Tw/ozLV3/S484/KUAtvflLntrE2LElkMl3UUYmz18+/kHOUn/Wbt39pkkznu4R9exBavylKjzKVuzLN2TQmXfj9Yvk+gI3xqPUlrGUGkWwLEJ8dfy6LK/QCSzZYKXL9QvVV1nscE0KAMC7JGxIIZuZnImiAg+rWkQhJ+bOC2kP/qP2MdWTFXYUqep37UJ1KbaSKSqqcD1dD9g8od5AvuGtGXEe/81mRlvzYYC0ADKi0wOwhjeE3YSAYpMYTxevVBKeqrg9fsrclF+49Vt9HlueZ638yVelYqpMbDNbz8vOPa1leKVS47Lwbxb0qMQX5BCvAkP+nxBIIMf8dB3UyIEVnv66UYxR1Kzf/WaFpGTWsvhngnaHA60n6ohOwSf5cYFmvUOCBiiLMpUMoGfG07DGdmgZsL8yTRs7Cd8T+g0ISEAuKoUqGpECOsjFGSyeZJh+q/gqKSy1iAakrwqvlGLcN/UJEpTL2vTRDATwDp8SXwIyoccU4+3Wra1ked1/0cecR9T1q8vaF0NkyiB+VPlgL2S69NhgAsIBujypz6SWdAc7DORdCoQkpEVslHcRswMGezq31KuZiPrUMFK3LHThGyck8yT45M6cL63qYA+GIPohyBIiToTAuA3mQM1HMe5rZSVO3tKzo2xgN44uday/iB7JfqKYoZ/08nrQW85cxXHPR+k354JTeO+BiiNMcPcdzPsCmDo6mhyWiF10J4RefDc/o+ic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(956004)(4326008)(5660300002)(16576012)(6486002)(66946007)(186003)(2616005)(54906003)(6916009)(86362001)(8676002)(38100700002)(66476007)(36756003)(66556008)(31696002)(83380400001)(2906002)(26005)(31686004)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1hiUzNuTVJCcGNVbFpjZC9iUnlWMjRxd3pGTzF4ajNvU1JCbHUybkVOeWE1?=
 =?utf-8?B?V05mR2lSM3RmUjJuZlZNbnVTSHlvSTdiNFd6MnowSndmTjJTTjRtL2Jrb2di?=
 =?utf-8?B?K1ArOGlUVXQ4bVhVdVl6QVVacXJwTGw0TDFXaFJjcGhuUEgwMldZTHNJZ0hw?=
 =?utf-8?B?UW1qUGlMR0hNZExvTGpBYXRJa0JCL3ZtM3RBK2lQellxTkZKMmlXb2RmTFFo?=
 =?utf-8?B?d3RDSlNTcUJkN1Z6c1hLaEdwT0lyMnV3QThodWdaMFA5NGNCQnpmdllHd1I4?=
 =?utf-8?B?S0pmbEhyd3BGdEdMSmhVcFEzZlFsczlKOGJPNTB1c0ZtN3VvOHdnOXhEY3B2?=
 =?utf-8?B?SU9yV0NPUnE0QVcxeU96K0lIUUhkN0hZaFJjTy9zclVJV2wyYno1MWtqZCtU?=
 =?utf-8?B?bFhINk9ieU1kSWdmZGloUndIU0oxY0tPU3JJVUJYdjJkNkE5dWtkVWUvUzJx?=
 =?utf-8?B?OUFZN3hYYzduT1cxWTRFdGdHSmFHQVliMGM1azMwaWROaU1ZTEdlQjJGT1g2?=
 =?utf-8?B?aThiOGhmdlF5NG5WK0haMHRFaUZUUk5FMnoyOEo2Zk52REJEMmVTNEs0bXU2?=
 =?utf-8?B?V1hLaHRjMjZQeHd1RXc0bHp1K2FQOXd4QUJYZWQ4RDBHNjlMa3dsYVc1N0lm?=
 =?utf-8?B?T0o1cVVOcUhXOEIwOUNSUmxvQmp4YUQ4ZTFSM1o3NkVNeWlkVjlGbU1WS1FI?=
 =?utf-8?B?NHdKVE5GNUF5U2RvbFM5dHJxVERRRmgvZ3FZd2M2YzVGMTdDcG0zbGY4aGRz?=
 =?utf-8?B?RFhuU1drS0JpV2xndTN3S0NjZy9XdHVmTW5TREhxUUtPWHA5VlhRRFZya0lO?=
 =?utf-8?B?WVFZVGE2NnNIZUtrdUdyQUx0TjFIWkRlS0cxVzQ5U3RzZzF6RlpnaGtGa0V0?=
 =?utf-8?B?NysybUMwc3N6T3Iwd0hJT2JpWWVFS0RieEFVcnlhcDRtQTF1azJOM0NadFhC?=
 =?utf-8?B?Ym4weUl3R0tmMmpENTVYUXR6V29aQ3Rscll4TlhPQWZXMGhhTEVZT2hFMEIz?=
 =?utf-8?B?MERIZElZYlI0ZGpZYklTRlNIdkd5ZHdrOWR4R2JGMjIrbHR4Nmp6ZTVSRVVr?=
 =?utf-8?B?NlIyd1pJSENyZm1KWkhqQ25MWmhMTHh2ZDVBRE1Vblo0bkp1a1JqZ0EzeUtm?=
 =?utf-8?B?TUlWcEQ3Q1dCckNoWXd5bm5nTXpjWUhZTDZzWHZSSkU1cVJTdWRTUFFvRy80?=
 =?utf-8?B?My9NN0M5VzhqMzNlWFlkYVg2TGQyUGxHemYySlp4SVBBWkVCQm05R3V6c1R1?=
 =?utf-8?B?Y1RxMWtFRlR1aWVDTGcwK0lOazZCZXJZU1B3Zm1uS1ZhaCsrZmkyNWxsOGdT?=
 =?utf-8?B?SkhWdU81L1Z1RVd4cyswUHNLOUtNREFIRzFXS1J3TW4rYUVMeHN1eWt6bitW?=
 =?utf-8?B?R2hkdzBHYm9xYS9OQnduY2o1Q08wMVdVTzYxbVU1VVkvTHVKa3JyMWN4cTUv?=
 =?utf-8?B?Zlg5Z1BDcStudTZ4elhpY1ZaRmV3NDlkUlZyTEZJNUhaR1R2VkZyTEhvNmNU?=
 =?utf-8?B?cWRMbThsK1BmNUhncUtBT2s2WUZmaitWQkl0ZXlvRTVnekZkaWVXb2lEU3RT?=
 =?utf-8?B?bFhZMkZ5cGFUTmlXQzl0bzd0RTMzSE1ZMVVCTU9rUDhLeTFwc05XcUUrUlV2?=
 =?utf-8?B?cGh3VFNaV2dLWkNDblByc2pQNkxGTHBGbXY5eSs0SHRpU2ljc1UyZm4xV1FY?=
 =?utf-8?B?eHhrbEFXUzd1QW91aVE4UHJSOUs1MWkvdXEwRlMxcmlRWWlVYTlEbXJONHA2?=
 =?utf-8?Q?W11Uo+h+bfEcMVJtvhEXs+9ZBKjrl5EA/W8/7wJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bf7131-378d-40b3-c1d6-08d97f40e937
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:51:41.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBwb93oGjtzvmKFAiPqS72Nzpo96yMVT51Eyi5LcOuOc5wZcxKqj973Mx1pMmigNrwaDm+hC68crmdgwZhILog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

In order to free intermediate page tables when replacing smaller
mappings by a single larger one callers will need to know the full PTE.
Flush indicators can be derived from this in the callers (and outside
the locked regions). First split set_iommu_pte_present() from
set_iommu_ptes_present(): Only the former needs to return the old PTE,
while the latter (like also set_iommu_pde_present()) doesn't even need
to return flush indicators. Then change return types/values and callers
accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -31,30 +31,28 @@ static unsigned int pfn_to_pde_idx(unsig
     return idx;
 }
 
-static unsigned int clear_iommu_pte_present(unsigned long l1_mfn,
-                                            unsigned long dfn)
+static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
+                                                   unsigned long dfn)
 {
-    union amd_iommu_pte *table, *pte;
-    unsigned int flush_flags;
+    union amd_iommu_pte *table, *pte, old;
 
     table = map_domain_page(_mfn(l1_mfn));
     pte = &table[pfn_to_pde_idx(dfn, 1)];
+    old = *pte;
 
-    flush_flags = pte->pr ? IOMMU_FLUSHF_modified : 0;
     write_atomic(&pte->raw, 0);
 
     unmap_domain_page(table);
 
-    return flush_flags;
+    return old;
 }
 
-static unsigned int set_iommu_pde_present(union amd_iommu_pte *pte,
-                                          unsigned long next_mfn,
-                                          unsigned int next_level, bool iw,
-                                          bool ir)
+static void set_iommu_pde_present(union amd_iommu_pte *pte,
+                                  unsigned long next_mfn,
+                                  unsigned int next_level,
+                                  bool iw, bool ir)
 {
-    union amd_iommu_pte new = {}, old;
-    unsigned int flush_flags = IOMMU_FLUSHF_added;
+    union amd_iommu_pte new = {};
 
     /*
      * FC bit should be enabled in PTE, this helps to solve potential
@@ -68,28 +66,42 @@ static unsigned int set_iommu_pde_presen
     new.next_level = next_level;
     new.pr = true;
 
-    old.raw = read_atomic(&pte->raw);
-    old.ign0 = 0;
-    old.ign1 = 0;
-    old.ign2 = 0;
+    write_atomic(&pte->raw, new.raw);
+}
 
-    if ( old.pr && old.raw != new.raw )
-        flush_flags |= IOMMU_FLUSHF_modified;
+static union amd_iommu_pte set_iommu_pte_present(unsigned long pt_mfn,
+                                                 unsigned long dfn,
+                                                 unsigned long next_mfn,
+                                                 unsigned int level,
+                                                 bool iw, bool ir)
+{
+    union amd_iommu_pte *table, *pde, old;
 
-    write_atomic(&pte->raw, new.raw);
+    table = map_domain_page(_mfn(pt_mfn));
+    pde = &table[pfn_to_pde_idx(dfn, level)];
+
+    old = *pde;
+    if ( !old.pr || old.next_level ||
+         old.mfn != next_mfn ||
+         old.iw != iw || old.ir != ir )
+        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+    else
+        old.pr = false; /* signal "no change" to the caller */
 
-    return flush_flags;
+    unmap_domain_page(table);
+
+    return old;
 }
 
-static unsigned int set_iommu_ptes_present(unsigned long pt_mfn,
-                                           unsigned long dfn,
-                                           unsigned long next_mfn,
-                                           unsigned int nr_ptes,
-                                           unsigned int pde_level,
-                                           bool iw, bool ir)
+static void set_iommu_ptes_present(unsigned long pt_mfn,
+                                   unsigned long dfn,
+                                   unsigned long next_mfn,
+                                   unsigned int nr_ptes,
+                                   unsigned int pde_level,
+                                   bool iw, bool ir)
 {
     union amd_iommu_pte *table, *pde;
-    unsigned int page_sz, flush_flags = 0;
+    unsigned int page_sz;
 
     table = map_domain_page(_mfn(pt_mfn));
     pde = &table[pfn_to_pde_idx(dfn, pde_level)];
@@ -98,20 +110,18 @@ static unsigned int set_iommu_ptes_prese
     if ( (void *)(pde + nr_ptes) > (void *)table + PAGE_SIZE )
     {
         ASSERT_UNREACHABLE();
-        return 0;
+        return;
     }
 
     while ( nr_ptes-- )
     {
-        flush_flags |= set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
 
         ++pde;
         next_mfn += page_sz;
     }
 
     unmap_domain_page(table);
-
-    return flush_flags;
 }
 
 void amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
@@ -284,6 +294,7 @@ int amd_iommu_map_page(struct domain *d,
     struct domain_iommu *hd = dom_iommu(d);
     int rc;
     unsigned long pt_mfn = 0;
+    union amd_iommu_pte old;
 
     spin_lock(&hd->arch.mapping_lock);
 
@@ -320,12 +331,16 @@ int amd_iommu_map_page(struct domain *d,
     }
 
     /* Install 4k mapping */
-    *flush_flags |= set_iommu_ptes_present(pt_mfn, dfn_x(dfn), mfn_x(mfn),
-                                           1, 1, (flags & IOMMUF_writable),
-                                           (flags & IOMMUF_readable));
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+                                (flags & IOMMUF_writable),
+                                (flags & IOMMUF_readable));
 
     spin_unlock(&hd->arch.mapping_lock);
 
+    *flush_flags |= IOMMU_FLUSHF_added;
+    if ( old.pr )
+        *flush_flags |= IOMMU_FLUSHF_modified;
+
     return 0;
 }
 
@@ -334,6 +349,7 @@ int amd_iommu_unmap_page(struct domain *
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    union amd_iommu_pte old = {};
 
     spin_lock(&hd->arch.mapping_lock);
 
@@ -355,11 +371,14 @@ int amd_iommu_unmap_page(struct domain *
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        *flush_flags |= clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
     }
 
     spin_unlock(&hd->arch.mapping_lock);
 
+    if ( old.pr )
+        *flush_flags |= IOMMU_FLUSHF_modified;
+
     return 0;
 }
 


