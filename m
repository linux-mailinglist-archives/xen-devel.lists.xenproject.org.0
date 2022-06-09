Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D615448C2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344956.570604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFM8-0008Ew-Au; Thu, 09 Jun 2022 10:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344956.570604; Thu, 09 Jun 2022 10:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFM8-0008CX-5H; Thu, 09 Jun 2022 10:25:36 +0000
Received: by outflank-mailman (input) for mailman id 344956;
 Thu, 09 Jun 2022 10:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFI5-0003pZ-H5
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:21:25 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe06::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea18e1e8-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:21:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:21:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:21:23 +0000
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
X-Inumbo-ID: ea18e1e8-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Odal0snAZ8F9yN2IlfiSiVIK9OwJDNdkM+AZyUBxTsCvEj1sc3v5AuyoKtnunKVw7dMHpgEos5Z69dYG6yR/wtci/DEnkzgfYZlCfEA0l4vtvv/Bmrp2RUBvfkCBCDi24M1sjkcyJtkw5kyYoKmtOYDpugONdTA3bCyl1wQq8GKOwJ11jpehA6rkgwCIYIvLexDfeVbGi3G/1ZMJ5Ha2wVZxhIhec7VnoCmNcqBwxD74BOV9FYu84T38HO6e3WSVABMlQwuSKAo1Ux7ieDhSqv5Kih7yDzMHbUUlJMK+4MVtddo2+Le839AY8KsHZXcDNypJ33BkPFJe8Jd7SfgeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNSivqMUGJNXw6YV9IuRH2YBw0MQFLGrycARpWhZOTo=;
 b=MFtefsviZuhrRF3fj+CZ28MqyK1OaOe6LT1BXQCHRaAEl/qImrkuOIdCDLCjV3MgkJoOBMsd3xbSBu1EvGbZAM3I64YTFjwLJdksGCSrkqGS390rh40ZRF1BIpMASKB0Td87LXYJws2sP4mBzqd6uOcRnAl3nDjGKNTXW7PqlTpKlr3t2/jdOETfY/c0+IZPNlBT9iMVDokHcCtPBFi/jnDQ4SIkPWrbQg+Hk1NboK0qY+n2hQ44SpnxjN7ywi6WpDK+J5pIFpJXTQId3ojg7TqnWFSY+mDvqVWmpFZDYaPCV4wdfVvVlAQoQQb4jvYhmzK4MBYOAYAtlV2CtzpMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNSivqMUGJNXw6YV9IuRH2YBw0MQFLGrycARpWhZOTo=;
 b=KNUbVApEC4UPIpV7LsnKtKBhpDqY3q9tOy7QJhEpI2HN3OX87pcA8L83dBBEgjj5OGa9qubomQDAof+suyPrYiEIJAPQmuNxVtrBWKy4gW0Uak6GqRnmygZiztkIvz10c0vRoPliC4XkU+QUdnWBQLAGLf+drDwl+S1GVQgxmy2KeFZsod7lQ6EObgIDaADLbyjsCjHdvq4g1LCqmefSRhoiNcLGKiA1v++O6X+liO3MX4/ofmfwS9eDdU2J/u+yLDF3v7YFMwMUUl0Ju+mrbBZb3UB6jx4sefoujEeira2KLkHhgWxJM5KAtypymyvKKOjQTQvkKFI2fnFJegaqsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5569f3d3-7315-3fd1-3e73-0cb610eb3f43@suse.com>
Date: Thu, 9 Jun 2022 12:21:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 11/12] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0146.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9a45ac9-ad1e-4875-4c29-08da4a01cdd1
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8790DC857E3B530D97891F18B3A79@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CQaUxOHFIyLGzQDuN3kk7V7d1Sx4Qvv5WE8f41ZFqzwbSqHFBX8k+I7n/e1fJGGXI2cJOmOO6xGc++jyt2SYj5I3f2CyDKV7+db5zqscHqEgcyl6Ql8hQi147Jo2sa+/wb40FbxjhV2678mxJLzYdGZibA+BaxLf2e0jk1dLIEun1t1enSifdDPfP1Vt7NUJX4WNAN9K2G0+7Tg6hCSPOVDMPPFdgkUBcl67K0GWhoPzlMse3jv5l+gSa9TavaHRhPdbMaXG+5S5rRRuz4+0al0OHztIyqtPbTwcptmOX7QSGoUDFElj+L8fqoMWx7z+pI0UXhsxB8FpRm6EiiyRq3JfAtzmfij/YXc0S0MQX0lzKlDEQzrVlsbWSqupszkMtBBywY/rtfXARddFQ8+BPivL6jvoH9b85w9k4K75NqG5+jPZHg+VN7SWofbfv10n3TIJir7ZFnNwNzhCrcIla9MgOLITaL+60YJ8gwVLI7/WtcjJaFOE+rfew1pcKAmA6Zy2Zxu4Em7q0/ececBWPvczs7OGNkgwmcHSzQ2aX6TPNybNrV84L5Nh5/YLSt7rhmRGCv4LRTlYzIKehmEX7mmUhU4TlDRonKZDOg5bCaPprS/jce3p2CvnIb5uwSxvuEqD705TRtWpN5rOe112NUOizrQGeRuuEgWNI6383rwB4Un2t6j0K0OdTcQWHF/yLq2Zc5wBvGPVbaSXnp1qjRqEoN+cUmsuEo3oxW0BK8wiI1kHUXCcGEN8sM1NMZ88
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(31696002)(6486002)(6506007)(5660300002)(186003)(66946007)(83380400001)(2906002)(86362001)(508600001)(8936002)(36756003)(2616005)(38100700002)(66476007)(66556008)(8676002)(4326008)(6916009)(316002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWJ2Z0RVYzhaY2R5VHlrc1FVSkYrdmd4ZDRsMzJ2RkJhcU1NQ1NHODcrTjRh?=
 =?utf-8?B?OEVWR29DUG9Wc3o1Yk5ZbWZZaExpV1VEVUNndWMwazJEREQxanllRkVZZExi?=
 =?utf-8?B?UGxocFlSVFZuZkpHaTRTTUFvWWIrc0ZhS2dmeVN1eVloTXV0YVNsakkwVytV?=
 =?utf-8?B?Nlpjc21kaEVmWnBmMFhKNlBIUS9aM0lKbC9aNnZGU2s5T1MwMmFzK3hiUHcv?=
 =?utf-8?B?ZzY1SmNZblgxS2JjRTdvV3dCSHErRkVsYXVYTUpFVkVoVFcrVjZoZUZxS00y?=
 =?utf-8?B?YlJ5WHc5ZXIyUlM3Nmx3cDFsK0xuRXFQdGtHN0o5QjAyUWV6RmZIM08vYkM5?=
 =?utf-8?B?UkVRUkZwYWlqRmVpMmZBVXBhZU4zNmZGU2JBNWtWcjFnS0ROYkJWSUpFWXk1?=
 =?utf-8?B?WXNMa251VzhYK0VUdCtaUUsyU0h0UmdCSzE5TU1YcHRLSWdrZ2JZcFZKdWtq?=
 =?utf-8?B?anNDdUx0cnc4QkkzU2NySTRrMmIxWFVSY0V6bkg4M1NrajF1bzkrN0l5VGRj?=
 =?utf-8?B?cXYrYlVqY1BsREFIdTBqbXdrZkt6UkhrZTBmMGsyaVNhWHBnUEttWlVuWmM4?=
 =?utf-8?B?a2lla2JLeklXT1YyRVR0ZlErOEs5YUlOdU4zeWZkWEJidStsWkNnQXQvVnFm?=
 =?utf-8?B?ajZZQUovaEhBNWgrbmwxSGpMTGgzbzE3Qmt5R21rc0NUeUc3U2VxYkZUSWU1?=
 =?utf-8?B?YmNXaTFpWUFmUGJTVWNJQTZmTHo2cTZFdVRtdTBweE1TZTVTd3RsL3VJbE5z?=
 =?utf-8?B?V1VveEZMcGk3NFJCd0JiWTNlQ2dIZ25OWnFQeE13M3RCQ0NsQTF0VWJVQ3Ey?=
 =?utf-8?B?MDg4NTNvamNVR3NHcElEVTAwK1JzS09nV0xhRzVFaUF1NlJGQituS0dsRnRT?=
 =?utf-8?B?OUhRWjdNR09CQ1dyYXdhU1NjYUNtM0haWGRFZ1NuQmJHdnZwVU9jdHdOZWhI?=
 =?utf-8?B?UlljSnY1OVpCYjBlTWlSekVHMlNvYWJXNUR0dndEa094UEd0UEVHNHowMVho?=
 =?utf-8?B?QU1wdVB3WGVOVHVVb0I5UFc1cm1zZ2srYVFweXNpL2JacTZENHIvN0F5WmxK?=
 =?utf-8?B?RCswZWFaZWFCb1FhYk5HZXNNVkdUQVNpTm5NK3NpUUFEVENWb01tTTFSTmN5?=
 =?utf-8?B?RHNZYVpBd3dHSFVkeEhaTEt0THAwMEpkVlV1aWNpNXpzNG5RaitINThMTWJE?=
 =?utf-8?B?VEJ6eTJ0MXVMUWh1azUxczBnRmVmRE8rLzA5T0tCUHBXYUQzRTFEeStmQUc4?=
 =?utf-8?B?eWZRdWR5aXFSYUU2Q2tldi82R2ZxVDQvNTdvcDBCU2J1OExYVUpEZ3B6OEdF?=
 =?utf-8?B?SXhGVGErajVQWmpoZkF4M3F6ZElIejdXcXJpZmZlcklaRytoSzlSbkFpdGU5?=
 =?utf-8?B?WnFNYlFzTnBDNUI0aGljcmcvSG84Q2wyd01rZUtYRjdMNDJKTXlNSVpJbVVu?=
 =?utf-8?B?UnhJREZEenE0SUJkNU9aakdZS2FXaHVlRnIyK09GWUJubUw4Z2Y0cmQvankr?=
 =?utf-8?B?Rm1tb1J5S1BLTnVEQVJoUHZONGRyc094VUZaMWxHdm9xY3lTejlYQ2ZKdjRT?=
 =?utf-8?B?SzFKY2FiZlo2YXVtWThWN2UxYXhGcWVmRFh3Q01LeXNHbDZscm5OQ24xOWdy?=
 =?utf-8?B?d0RJNHh0aHJnQjcrLzJRODJua1dLbVBQd0E1cXpMODhCektlcmhleTUyMkIy?=
 =?utf-8?B?OVFaOEZPQmowM2xQbHZXa1EyT0JRZnVYMmVIcTF5cWR4czFYMXFwWlN4eGZZ?=
 =?utf-8?B?VFJpNEtZTlJBSHRmRWpHdGFzNkxHWjQvUytHT1lpeExzNDFJUVloYlBtbEhi?=
 =?utf-8?B?RGVJMzg5cXIzckpkUktpVlhpTGFBeDhHVXVRSTNnUDViaStYWU4zL1B4SlNa?=
 =?utf-8?B?MEpybFFuNGJzZkNuQ3hzdUtMZUFOUGlFUnRueTBJYk0wemM2MVd5TDZ4Nnk3?=
 =?utf-8?B?N1hkZ2FCWnc3eFNnbEMrQkQwem93M1NkRlc1SGNzTWdQRU1pMzQzd2dQMmhY?=
 =?utf-8?B?S2xvZEdFL0ZTa2x5K2VRQU5qOUFCM0tsM2dCMXhRRDExczJPamZTWk0ybnIy?=
 =?utf-8?B?UlF2dk9Xa1BqNmN6ZG05N0FpWUJyRldPZDk0dC85THJxdUdWVTU4U1J4eUFL?=
 =?utf-8?B?UFFseFpSdTRBSEZMQ2pRTnYzYndmczhDRFlHSWpvUHF5bzVUY0I2emJSdEY5?=
 =?utf-8?B?RU0yNFRwZUpmVUgrNTBRb3QzZG4vZGppRXlIRmdJZkFzSjZ1QWwyWTlzSmVW?=
 =?utf-8?B?RGd3Rll3UWlNMk93N2xlUGZEelhHcUhNNHZsS3FUZ1J6REhya29JU01IT2pF?=
 =?utf-8?B?SFkwY05zSmZ6NHNOZ2hwLzh6SldSUHJJUXloVnQvczV5dmphY0taZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a45ac9-ad1e-4875-4c29-08da4a01cdd1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:21:23.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHrOC8FivjUt+RQ/6nvDeVYA9jL5WMxe1ZLdaHzKmDKr8aWEm3ZpPgkgg805HuYYuBIxypm5el4/N/SmyT7DSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: New.

--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -125,4 +125,7 @@ PERFCOUNTER(realmode_exits,      "vmexit
 
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
+PERFCOUNTER(iommu_pt_shatters,    "IOMMU page table shatters")
+PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -345,6 +345,8 @@ static int iommu_pde_from_dfn(struct dom
                                      level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
+
+            perfc_incr(iommu_pt_shatters);
         }
 
         /* Install lower level page table for non-present entries */
@@ -477,6 +479,7 @@ int cf_check amd_iommu_map_page(
                               flags & IOMMUF_readable, &contig);
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -543,6 +546,7 @@ int cf_check amd_iommu_unmap_page(
             clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
             *flush_flags |= IOMMU_FLUSHF_all;
             iommu_queue_free_pgtable(hd, pg);
+            perfc_incr(iommu_pt_coalesces);
         }
     }
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -404,6 +404,8 @@ static uint64_t addr_to_dma_page_maddr(s
 
                 if ( flush_flags )
                     *flush_flags |= IOMMU_FLUSHF_modified;
+
+                perfc_incr(iommu_pt_shatters);
             }
 
             write_atomic(&pte->val, new_pte.val);
@@ -857,6 +859,7 @@ static int dma_pte_clear_one(struct doma
 
         *flush_flags |= IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -2239,6 +2242,7 @@ static int __must_check cf_check intel_i
 
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);


