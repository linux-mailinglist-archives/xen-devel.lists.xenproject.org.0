Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC050DBAD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312621.529964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuS6-0002ZT-7i; Mon, 25 Apr 2022 08:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312621.529964; Mon, 25 Apr 2022 08:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuS6-0002Wb-4M; Mon, 25 Apr 2022 08:52:14 +0000
Received: by outflank-mailman (input) for mailman id 312621;
 Mon, 25 Apr 2022 08:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuKN-0005as-UA
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:44:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2a41c9e-c473-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:44:14 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-K12lP_fTMSycn3GH1ByPbg-1; Mon, 25 Apr 2022 10:44:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5736.eurprd04.prod.outlook.com (2603:10a6:20b:a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:44:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:44:10 +0000
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
X-Inumbo-ID: e2a41c9e-c473-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zlfuedf2q4YXfgbpQ1MWK6FkdjlHZbNpmqaza4t7ui0=;
	b=ZqC6XIIk0MO9pqRpiZnKWC4KSX4zb7ptRtfPjJKkB+4+PWgM1PTdSjAzBAqiPAJSIB0FQ0
	4yvio6tmaohuD4Zy2SNbPruBFyXEqP6KrGMYliZGzDHm1M4PinqeB7ku3hiIDvEsZ3V8Xv
	6cvk5SQdcqjGn8l/p3Udiehc2iJVmIM=
X-MC-Unique: K12lP_fTMSycn3GH1ByPbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiH9++EK85PyX3TRC6isqEvNAa5XVolEvvmHWXnptDiTS1v9VzfUzNfQnH+UY5IOIn3CuoQbdhMzVBr+Cvk92DvGvjgYD723kjRYw4813rlAHveluyz9owTP5ZK9wpcGQFtE92xgvZ7TorU/XyYrlT3sSmqsmh4fNoy9ichJcnmvZZWcF75RApPFBZZvT/5/CenULZL/6qROR2wMJ3sV6Fs+FCh1uRotFnn6e5R0gzeYDMoEkalonLR2vuPvko0IbKnwiwnMBLW2UyefsYwzB2FXjMpPDh92dWXWLxrfSdKdXmHWn2FaQivZ/S06VdvYyFowFf/yTsUzr5qeKKrcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlfuedf2q4YXfgbpQ1MWK6FkdjlHZbNpmqaza4t7ui0=;
 b=fRR/fjHaKZvyftUmmyoxpGxqm0f7bBjHCOaE4R5nWWaR3AuNFlfbO3/2Luf4mSlAwVUYPRRG2ck+0vdPllauErqFP4f0wYwbZWYWYUenQyF3FfqyxbfCcGBN+xD3oYHUKTCxb/3fHEcRSQwkNdHibjUdOMkpsNBlldgyeNHfTcd4/qOlbjbU6XLjqejG+hcfNkjEXL7r9Oo2TjKgKmAJ6mxIm0wQEYLXpGYvv7vWciPNSQhpcfDJZLQfYwpvqTh0dHaMwfEYxL4PPrnEO5sRqp9bQRE5SXeVlDQSBMwyaEOKbrwayG5nBA5eVSDh51fCR2jY5h25w+MhtMAEdfavqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd077dac-c53c-3369-03db-f2e4260ee94f@suse.com>
Date: Mon, 25 Apr 2022 10:44:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 19/21] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 312f22fd-5081-46bf-c97b-08da2697c446
X-MS-TrafficTypeDiagnostic: AM6PR04MB5736:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5736BC88E927256F00D6EE98B3F89@AM6PR04MB5736.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rR0LqJokPUj3LZ21D+k1gdv+6H/uRaLBQ/QkXNTEBMSch/Pho5Tl4jyPYHWOIpuoeT/hZmdHE1ZIt4klNhcq95rp7i3PDo80X+SfxQuJcUJ9uQ3Z4rXvTfUeCZ4n/MDLYNOturgTKri4MUg3xp5tv+Av9cDpF8Xg7wstLEhXWDGu3SywURFgOWzTyabEsMpBiW2H7sr832oNJO+z48ETDrkqiuAv+tfuRPQ80FSH8Brs50FHlKtgxx2GgI6KafGMvw9dgtiKxfqX8P2fYj1k9pP7yWsXkKAHuDDMFpyssolZCWcNCC+HLWFQtSTJViN1//XYIoqKokfhlpknISXO8dYXGLPZcmz+jmh7y6hjynfJvRR2e92uBMCkPf56NxJOl7eHBCq+7GmHQDl/TeQq7WZM4u1GjNt+j6+iPU56M2Tm3GYBkPHa2tnRytvG9kAAD5Hp7Un9HHRJo51vvusUkG8v7K7/CPXbWmuliEX31KHePM0mqiBONf9kiVakUG6aM6cK5HsFmQedSNLjtfdB6Dkv5naxMBjtXNMDtAELxGaUI/OXb610q9Hi+J4BZDZANot/c4wdqZRLtqosd+Y5jhaA8dMmOPHzzsaDvyk2Kq/B2HIkW1Tx91Gr4Fs7Bn93N7ETe4Otrbxrq6IA7sRTDfxha12bUHV3SeSGuOGZc4xJBeua4U8jOec0IoFtDBBQ1tGhWtYbJ4KKp0XlsSqpdpZHGnAfzi3p+Yye8JjA2Lg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(8936002)(6512007)(31686004)(83380400001)(26005)(316002)(5660300002)(36756003)(6506007)(186003)(2616005)(2906002)(508600001)(86362001)(31696002)(38100700002)(6486002)(66556008)(8676002)(4326008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmNuTlgyZnpycjFkT3VuMkdLa1pEc0ZDaUpPZEZyK2xUaTJsTmxnUUtETVRj?=
 =?utf-8?B?Rk9zZ3ViNXBnYTVwQlRnaHgrYWh2QzdOMTlRYmdVSFZtZkYyREtyNWdTNUQ2?=
 =?utf-8?B?QkdXM0pydk1XOExJTnQyUk5KYW9XNUdaYWZFYmRmdFFSZWl5c0dxYTQ4ZU9m?=
 =?utf-8?B?eFFuakFFRGhNMjd5aVByMFBkZVhPeUloNVFoZWpseXkxMGZxUXdVSWNNcjZp?=
 =?utf-8?B?YmoxbU5Xd2ozQ2c0OGxGdTBxUmxrY0QzYWVHcncrNVJwRDlNT0Y5UFJhOFRT?=
 =?utf-8?B?T2FJbTdVSE16aW9nRFpjWFhXdWFTWGZCVjNWOGVSbUhuZFlsRjAxeldKYUpM?=
 =?utf-8?B?K204ZWVOQzY0cEF4K0FRcURZZFhCZjJCd0psN2lpdzljNklhemxnQUNoeGpv?=
 =?utf-8?B?OVZHVzVhMXNCbUZYYU1KTGRIY2tvbi9ZMXMzYXFRU2REclNlN202NWNhbWNl?=
 =?utf-8?B?azlyTFJiT3hud0VYZUYvYTVkL3pKY1dtbDUvTU9HTGRTMzhndVhtcjQ2Yldi?=
 =?utf-8?B?Z2dRTXk3b3p1SG1Td0FVQ3pLZlk2OTdkUXd3dEFPZlEyUXU3bzNwQnVWRVBF?=
 =?utf-8?B?Zm1oT2kyTEhzQVlNeXowWFhmcHV2b3FJS3NRTmRpeXg5WlJNWUtXYVJmdWg2?=
 =?utf-8?B?ak15RU5ON3FvQnoySm5vQzZUYUttNnJHZ21YR1ljMkdwb3pyQlZGWjQ4MHk4?=
 =?utf-8?B?NUVOTEdjQzhJbk1kM0xwRFRRL2Y4Zm1KeCtyMGs1MEVEcTNjRHNyaWYvY3o4?=
 =?utf-8?B?SXQyalo5WFl4L3MyQ0l0OElJTkZkZHJZOFVnZUd3ZVBNWjVqSnBZb3VNbWJh?=
 =?utf-8?B?UmNHRW41NllFZDVFM1FzYnpJMXc3L1lLVnROMG5Mc2ZKcjZDYTFFeUNQSHNP?=
 =?utf-8?B?MHpPc1pYNVhuZEtnVWtRRGtqcGdzbUFybHFQNWUyRk5jQXFON3J0TnNoWFdI?=
 =?utf-8?B?NDJadlpTZ0tGeldhRWlEWU1USllQb0Z2QTB6c3FWU0Fwc0Q4U0h1MXUzYWN1?=
 =?utf-8?B?bmpiOHNOMHpzRTBxNWYwSGxBQ1NkNWVoL3ZoL054WEdKZnY4OVJJVkJKbmVk?=
 =?utf-8?B?a1o1WnF3R1JEc25VZld5YlNPSFRML08yb2dSV3VWNER2LzZ2a0hOTHpMSTc2?=
 =?utf-8?B?NlZTTXVRbVVpTzJnSkd1YnU4bWpYYUkvNVpOajk1YXFVd0hFM05SOGlUckdK?=
 =?utf-8?B?LytZN3BLUitsNUFvakk2Qi96eFdXdldRNUxBdHhwckR4alBza2cvbWpiam1a?=
 =?utf-8?B?RHVuZDlwOHJZSUdQMlNhOU54eFNIVXdWQTBkbG9OTGh3c1ovajVHRmpxclBt?=
 =?utf-8?B?cVJHNXEzS2lDbkw5M2pBVDMyWW1XQk5ZeXUyakZ4MzZjTlhOUGdiRkZ2WU1Z?=
 =?utf-8?B?OFR2WmFCOXBLRis3OGtoY3FYNVI1bkEzZU5BK0hueWlGNjIrMFdXVDIxTll0?=
 =?utf-8?B?aUVlOFFObSsxTUdmM1hUWEtLTU0relV0bmw1ay9GQW56enppMnpVRHMvb0lV?=
 =?utf-8?B?VzVEanltRDRwUndNTEhRUURhK3J2RXRub1h1RzFkaHJWSk9sTkF4Z2NYMUxu?=
 =?utf-8?B?KzBYU2ZLVFFka0hZVk1hZS9uK1Jpa3FTREZ3YmtJbVBmaEQwOHVlcnpLTlQx?=
 =?utf-8?B?Q25zZVBES3BDOGFpUlNITUtQS1p2T0VtL1FRMk1IREtpaGVRRk5ScmluTTll?=
 =?utf-8?B?azV5QVJsWFF3Z1JvOGRHdm11SnZXeCs3QW0xNmRhdzluL1JrRFVuRmdDVWVV?=
 =?utf-8?B?bTFWWVR3c2ltd3RTbWpCR1ZWaWpERDhHd1ZNS0FGQWxlLytvbG8vb1BZZSs5?=
 =?utf-8?B?RTVGUUxYWG10bjhEckVLNmpLelpJMWpjK2dZaFRNUVpQVGMrUFRVQkRzYVlE?=
 =?utf-8?B?QlUwZi9nRlE0Y0V0TDlrK1gvU0xNQTNpbnZQMGJadDcvVmxXakFGcUdOMkFZ?=
 =?utf-8?B?clB5VHdFejliUzU5K1ZjZVFYUzJoeDIvWlBJYXluVy9FM1Q4cW52bDhNbnV4?=
 =?utf-8?B?dzFXa25POFkvSHRsS1ZJQ1J3eVA1NW4yYjIwMTlqMlhvOXp4Q3dkV0dxVE5M?=
 =?utf-8?B?dnRZRmJMSmhUMmNYbnZaSWJJaUVWYTgzUFFFOTduYUh2azZxa043VWJkSmNn?=
 =?utf-8?B?T2FoanM1ZlA0SlpiWUg4OUVMaUR5T1YxOUpURFI3aGYvTDE1NlY3QUg5SUl2?=
 =?utf-8?B?SkpSam5rYy9PL3ZoR01DenJMaEp6eE82Q0V4MmNBNWloZDRSK2VIVjF2Z0hm?=
 =?utf-8?B?NUt2MlBNT1poL3gxZFRnNDg5NVA5cXNIR0FTVzZwTlNRcmtMM1BwOW82UVFF?=
 =?utf-8?B?WVNkZlI5cURaOEdIQ1NqS3pGL2pmS0RKR3RpNW5uVzdtOTRKeUVJdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312f22fd-5081-46bf-c97b-08da2697c446
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:44:10.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmGHL2u8w04+ko7s6OOlm/kavCHzUpHAjWSk1g4TDrkMbTQdl7w5p9EBiQ2EPgvktGMS0MuoVV9CqrMc0LoXsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5736

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin tian <kevin.tian@intel.com>
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
@@ -343,6 +343,8 @@ static int iommu_pde_from_dfn(struct dom
                                      level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
+
+            perfc_incr(iommu_pt_shatters);
         }
 
         /* Install lower level page table for non-present entries */
@@ -472,6 +474,7 @@ int cf_check amd_iommu_map_page(
                               flags & IOMMUF_readable, &contig);
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -532,6 +535,7 @@ int cf_check amd_iommu_unmap_page(
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
@@ -865,6 +867,7 @@ static int dma_pte_clear_one(struct doma
 
         *flush_flags |= IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -2244,6 +2247,7 @@ static int __must_check cf_check intel_i
 
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);


