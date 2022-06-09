Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3E544895
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344878.570494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFEg-0001h0-Mi; Thu, 09 Jun 2022 10:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344878.570494; Thu, 09 Jun 2022 10:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFEg-0001ea-Jr; Thu, 09 Jun 2022 10:17:54 +0000
Received: by outflank-mailman (input) for mailman id 344878;
 Thu, 09 Jun 2022 10:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFEf-0001eG-3a
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:17:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b31da17-e7dd-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:17:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6297.eurprd04.prod.outlook.com (2603:10a6:10:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:17:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:17:49 +0000
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
X-Inumbo-ID: 6b31da17-e7dd-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuZwRaVZOZULWr7YNvcOn45z8LRSdDG8yBRnBcjztnBO3ZFkxurmrOnRvRZLK/T9Jz5KFdgxYDxch8Dyt2gJDkXi+tONpgDCu+k7HJSN6kLnHbV2zei5Qc3ME8LizT/Ji6Hhm0hRK4JEufFbMz2aUKkUTBixvwfexNswa10hHoDwGVEXuvNZLxKt7gAIX+w2vacTs4EXfhnFLBdN2KdFbeGi9EBF0kO89nU6LKfiIs7yYMbZf4+n3HNIbsMmBEpDQxvPvkwCpJ971qjeDKg3wIvR50OcIwgQa5wH5vix9qMOixSphQHzvI3kEy91HBzj1ch30l+4sqoh9CKlHqVrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxiRfgvA8ZTM896+3sr+fZ7fI2k/BkIKHoJCeGpTy2A=;
 b=BH9AgLBo4YDVtaM0nrNSYwAoL7RFOTOC/JcQKuxsHG6NkMy0JJZmP9Wmr7jZYhiDh7f7WBEYAbTySJ+0tEQx4GShuMRIQ7iMs3t02ozinY12KlzCefJ7akvjB/cYCvZsBn0442pXRrzK8u0AN3dLRYjkuOMnk00K1EXLdPcdfbYTY3NSfTpChOL8RvDgPs2hCp5kjDKQaSDNOmvNssEFfX95ndhdN/eytHXc+9E6ob6ETKBDSPJoemcPXBY7YJ5bkzaorRdhqoyANWR+lD0lytG6N25SbO45prxD8OuKdAKcNJ51JVsVU8cAhO7QiQdZiEXhHlSdlYPfTSH984JgGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxiRfgvA8ZTM896+3sr+fZ7fI2k/BkIKHoJCeGpTy2A=;
 b=JoG35Y0rnua6N8FOZ3UAT/x5CFgDtE1kqBy4BqzYcTQGLT9HwFT/OGueEwtXOYw/GbbfwBIVzlWckVy4ppI3jbIIenmiI2PNi6X2n9xhvsAOjkJTPGcX1slwsQsyL4Tqf7NmGXWDodK68spENWCH/1Cl6cOYEAcglR1LNlhDKpsrhU6FcCzF6zQ9292vpgPhN9hPTC/98c2t7COL5U4ozMRIqj3HC/bEdDK1yfV/t2MwYazcdA/3sFCnv7ltDTtj97U6dGOKdz98KgwiRvkXjNG11JRaS6mJGyH4b8Akrj6XGuABRUORyXwSc58LKEkPc2fkPTiLuzvYyY/WdQ20zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ffe69943-1d65-9d04-f167-f0d61e04a9fb@suse.com>
Date: Thu, 9 Jun 2022 12:17:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 03/12] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7e8f5f5-7357-4601-53f6-08da4a014e56
X-MS-TrafficTypeDiagnostic: DBBPR04MB6297:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB62970640B237D96693498A8CB3A79@DBBPR04MB6297.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3R/Q6DIY1wA4zQqvgybq5IySLmywL9Vj4o85gUEBvPsvetMRPm03pO24wliT92gxwQLPEv7UP0AUdiFxf8UeW3eUpQXUQ0hQXkWkieBqKtG6ha2CxqE/yM6rkhx3bS6lpK2CgzEts70w2QFNN1zgq+ed3iDyXYaJjnDNpQKeRIphXx07PLf+/tYTplecZB17toauAatRf+adeWqpFL9KS050YuGBU5CbFCXVObp5ySqjYCdzQKgfBQbZS4WMimt2Il8hHVDXyTvVemBy6SkQfQdGCJm9VG9N3e4gUKVLKqqSnY/t4kXJNqNMvZN0aOCym+0CYTTzYWzREw3Y4zl/pkUeLpLgWEtTxMSno0D3I/sxjVEsSFhtWBDFO8Y8d5bfQAT9HJdznwU7znR6jko4QJhHNRqg4a3h4tKqC/kwcBCwKT+GCpa1TrMmtL+vzKhGyR1o7qlF/skIqq88LxunGjXV3X/u7uTeKqE937a+4gw6hfvtfUO9nMwy8W3ki9cIFoZJAx6BE4WedVt56r/IZAyc3k/5L5o+5KEZvaiMwwbxnyoxMdI6inqU+lKHhfLytFZHYm0bigpkVgb2PdO4wi55nV9rCP0oSjcxxnDPs315+H64aEjWShnWyQyK7ax7qDjxGJDnykoDWVjw1t7xC0DDbdkR7q9h6o3rRiL4gGRHoIuEOI6OjxzBz0h6OFedihAGKMglqRc3gNCjjFOU/WSBtHZklFeTKHAgC/Rvc/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(36756003)(83380400001)(31696002)(26005)(31686004)(6512007)(6506007)(2906002)(4326008)(54906003)(8936002)(5660300002)(316002)(6486002)(6916009)(38100700002)(508600001)(86362001)(186003)(66556008)(66476007)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJsZFlBbmVYWkk3Z0JubWVOd21VTHZ5c21IelB0djd0MHBSWjRtQjhLR09S?=
 =?utf-8?B?THc0ZXJrajM0M1ppaGo3ZHROV25DdUZLRnVkNjN3ZXlLYmkxMXVhcXR3VDJG?=
 =?utf-8?B?bVdYRFVncFFrTmxIZTZ1UWlmMXVXMGJVTjZQeVlOcEZIWHQxaHVsRUtnSG9t?=
 =?utf-8?B?R2FOaXlqK0JRSVVhY1NOZ0t0OU1NTFExZTRpVnlINExpVitxZnZUdEtnYWc1?=
 =?utf-8?B?ZExSOEhGZis3RUNmSjBLclFaZlRaQ0tLNS9QNnZTdmpXMzBSSzVuaGdRMWdG?=
 =?utf-8?B?azZuNzJHMnR0WDZBb3ZhVmppRVgxNlk2YUxzOW84NUFtendRZlJ3WnlqQ2Np?=
 =?utf-8?B?cTI5UVJNVTVtQUlxWXorZkdSRCt4MDdNN2NoRnliTFhmM2NEZnhSQnp5V2F2?=
 =?utf-8?B?SUQvZDRVdEs3SG9sYitSVmFoNVV3ZkdiNUNKaGN1Z2R0cHl2RC9RMU5hOXVU?=
 =?utf-8?B?OGh0eFFuTVB4Vjh3Yy8zT1ZXSDVFZHZlZjNMVWswOWx2UHdTQSswUjRCT1lL?=
 =?utf-8?B?ZHJmUEZOK3lHcXZ2MzNQNk9oOCs2aXV3djBERnhjRDVtM3g1TFpoUkZQRWN3?=
 =?utf-8?B?MTYvR0kyN05lV1VaOFJnUDlUdEJESENGeHk2TDJZVVJUYjlrMElaNGMvMWJP?=
 =?utf-8?B?a3c5U0RteEt2YjJDcFVrQXkvT1IvdTJWcGpmMkp5VTdHeW5WT3JablN3eW5w?=
 =?utf-8?B?dHBGRStYa0UrMytMSURlM1ltSi9UVTJ6VW9VNXRLMjBBVXRoamxuT0Ira2Z2?=
 =?utf-8?B?WmptMTRvY1hNQ0gza2xTYWZPTVo0NHd2Z0p5ZENGS0lDN3hqeE43c2JJbFQ3?=
 =?utf-8?B?SzZ0eDVZSXZOQUYrNkdPd2ZtYTJtbjdMTkFEOC9tRC9XNzJIK3NaZnRZS1Bi?=
 =?utf-8?B?VlpubXQzNVh2V3FuOHhJUVN0T3NJN2ZZTW9QelRvQkZDU3hMKy9ja0xGUUgw?=
 =?utf-8?B?c2dmS3FmYzhPNm5nMDVaVklKSTI0K2FpK1M0M1NianAwa0RiTlZ6ZU9kajkx?=
 =?utf-8?B?S1hGQ1ZDdlEyMk42b0ozNmhkeUJEcXJCZ0hFblRYeVI2aVI2VjZrdWM0K2E2?=
 =?utf-8?B?d1dnV1hMSkZpdDFodXhHYmdpM0EzU3RYOGVNeURZWHVmL2hiWnhQejJGVG1I?=
 =?utf-8?B?WUNaR1B5TFdYd1V6NERNRmZVR3lkWE56bi9XaUc2bHFZR0xjbmo4UWdZUndw?=
 =?utf-8?B?K29TOVA0UlU0dkdWK3lnWkNOTXhMTlhvNi9vNUdIZnlUV3Y5T3FrYTRQYXk1?=
 =?utf-8?B?NlVKbzU4a3o5eGFqcHdFRlc4M1Rkbkp0UVlDbExBNE9qZGs1bm5EdzJybGlr?=
 =?utf-8?B?aVNudDZFTmlweDhoZ0xrN1lwNjV2VFhKcWhHM3BVbXVSY2pEQXpRRVVKbVJi?=
 =?utf-8?B?K0NPb0pTY0w5cnNuN1JnM1VNWEtod3NBYVllckRCSGh5UGhxNzZSNXJOK0w2?=
 =?utf-8?B?WUhTZyt4ZVlLOFVTdmxEbVozMGdjMWZTTitFY0Z4QWxxRHBkcTJWZmZxM3c3?=
 =?utf-8?B?RlNmdGd3NUwzMXJ1WlBEaWdzb2UwSmo5Rk5reHlWdndlRzhUeDVjUHdzZ29o?=
 =?utf-8?B?NUE3NSsxYkY3QzB2SWhqanNlS1RJODdVUVc3bnM1VnNmRStpcHFsOElhL0pZ?=
 =?utf-8?B?SGl3Miszdi9pZnNNNXdWaElCUU5QM2w4RENhcVhFWWd1NXlZV25iZm55VTl2?=
 =?utf-8?B?TlpZQ2puWkFhU3V2N2dkRW5ZQi9vdHd3SGRRLzlrVXFKWGo0bFFiWHllZlVH?=
 =?utf-8?B?VjhjcGNlR1h4eGdkYlQvcllwWVc5T3JrZ1RUTFozQnA4THUxbHZGcWQwNkhE?=
 =?utf-8?B?UnJweTNrS0x2VHRzT3NEdC9KWHFwNmFTc3U4VXptNU5RMklFSzBibHQ5aTdm?=
 =?utf-8?B?TE5TSVJNSjZraU9pOGFYMSs4RGZwRU1wWkF5aG5DVklaTDVEdWFQaVFlckxW?=
 =?utf-8?B?UGsxbTgzV0FKNFZHbnNsUGZFRVpQWUdlL2ZXL1pwb21KakVTcWhCRkFkYUpz?=
 =?utf-8?B?aXF5UStIMEhORFBwSEp5NS81dFl4YkdpeE1SNTZkbG9hRVk4dnlsZ3BJc0g0?=
 =?utf-8?B?MkFmTWV0VDdxbENBQ0hDcy9PWC85Z2FlSEk3ZFFsQzQyYzQzS09yK1FrYXVa?=
 =?utf-8?B?VU54UWVlc2FQRXEwRi95eGZleWQ2MnRjK05ub2s4VjNySDVIMFdhTGJreGtC?=
 =?utf-8?B?NVlzOUUzRHd6K0FzQm44Q0hNdlBQSnlyQSt6TXlwWHVkKys1UjJPNjFWZlF2?=
 =?utf-8?B?T0F3dURIREVyZ1FMZ0RMTGIycmJqU3lqeU04Q2xKcXE4NjM3R2NDWCtBakZz?=
 =?utf-8?B?MWE4Y1dIOHBLSnlreXdQdmVBdC9MMVFEV2VlZWVmOHpERE9tNlBhZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e8f5f5-7357-4601-53f6-08da4a014e56
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:17:49.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7YmCFx/gyE4T16TDgIg23liYij8Wh85TRRphxCr/8f08HvvHFfGKdX03gsQeTde/MDa3+BHJg/Y3GHesgKxLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6297

No separate feature flags exist which would control availability of
these; the only restriction is HATS (establishing the maximum number of
page table levels in general), and even that has a lower bound of 4.
Thus we can unconditionally announce 2M and 1G mappings. (Via non-
default page sizes the implementation in principle permits arbitrary
size mappings, but these require multiple identical leaf PTEs to be
written, which isn't all that different from having to write multiple
consecutive PTEs with increasing frame numbers. IMO that's therefore
beneficial only on hardware where suitable TLBs exist; I'm unaware of
such hardware.)

Note that in principle 512G and 256T mappings could also be supported
right away, but the freeing of page tables (to be introduced in
subsequent patches) when replacing a sufficiently populated tree with a
single huge page would need suitable preemption, which will require
extra work.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5: Drop PAGE_SIZE_512G. In amd_iommu_{,un}map_page() assert page order
    is supported.
v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -32,12 +32,13 @@ static unsigned int pfn_to_pde_idx(unsig
 }
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
-                                                   unsigned long dfn)
+                                                   unsigned long dfn,
+                                                   unsigned int level)
 {
     union amd_iommu_pte *table, *pte, old;
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, 1)];
+    pte = &table[pfn_to_pde_idx(dfn, level)];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
@@ -351,15 +352,39 @@ static int iommu_pde_from_dfn(struct dom
     return 0;
 }
 
+static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+{
+    if ( level > 1 )
+    {
+        union amd_iommu_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_PER_TABLE_SIZE; ++i )
+            if ( pt[i].pr && pt[i].next_level )
+            {
+                ASSERT(pt[i].next_level < level);
+                queue_free_pt(hd, _mfn(pt[i].mfn), pt[i].next_level);
+            }
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+}
+
 int cf_check amd_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
     unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
 
+    ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
+           PAGE_SIZE_4K);
+
     spin_lock(&hd->arch.mapping_lock);
 
     /*
@@ -384,7 +409,7 @@ int cf_check amd_iommu_map_page(
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -394,8 +419,8 @@ int cf_check amd_iommu_map_page(
         return -EFAULT;
     }
 
-    /* Install 4k mapping */
-    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+    /* Install mapping */
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
                                 (flags & IOMMUF_writable),
                                 (flags & IOMMUF_readable));
 
@@ -403,8 +428,13 @@ int cf_check amd_iommu_map_page(
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( IOMMUF_order(flags) && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
@@ -413,8 +443,15 @@ int cf_check amd_iommu_unmap_page(
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
+    /*
+     * While really we could unmap at any granularity, for now we assume unmaps
+     * are issued by common code only at the same granularity as maps.
+     */
+    ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
+
     spin_lock(&hd->arch.mapping_lock);
 
     if ( !hd->arch.amd.root_table )
@@ -423,7 +460,7 @@ int cf_check amd_iommu_unmap_page(
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -435,14 +472,19 @@ int cf_check amd_iommu_unmap_page(
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
 
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( order && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -747,7 +747,7 @@ static void cf_check amd_dump_page_table
 }
 
 static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
-    .page_sizes = PAGE_SIZE_4K,
+    .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -21,4 +21,14 @@
 #define PAGE_MASK_64K               PAGE_MASK_GRAN(64K)
 #define PAGE_ALIGN_64K(addr)        PAGE_ALIGN_GRAN(64K, addr)
 
+#define PAGE_SHIFT_2M               21
+#define PAGE_SIZE_2M                PAGE_SIZE_GRAN(2M)
+#define PAGE_MASK_2M                PAGE_MASK_GRAN(2M)
+#define PAGE_ALIGN_2M(addr)         PAGE_ALIGN_GRAN(2M, addr)
+
+#define PAGE_SHIFT_1G               30
+#define PAGE_SIZE_1G                PAGE_SIZE_GRAN(1G)
+#define PAGE_MASK_1G                PAGE_MASK_GRAN(1G)
+#define PAGE_ALIGN_1G(addr)         PAGE_ALIGN_GRAN(1G, addr)
+
 #endif /* __XEN_PAGE_DEFS_H__ */


