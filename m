Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DE50DB7E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312588.529910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuK1-000707-3u; Mon, 25 Apr 2022 08:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312588.529910; Mon, 25 Apr 2022 08:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuK1-0006wn-0q; Mon, 25 Apr 2022 08:43:53 +0000
Received: by outflank-mailman (input) for mailman id 312588;
 Mon, 25 Apr 2022 08:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuJy-0005as-Th
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:43:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3cfee6a-c473-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:43:49 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-KWNPR1rNMOqmff3-3asZWQ-1; Mon, 25 Apr 2022 10:43:46 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB2977.eurprd04.prod.outlook.com (2603:10a6:206:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:43:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:43:44 +0000
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
X-Inumbo-ID: d3cfee6a-c473-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ab4csObLsDUSWIHGU1Rqn2fo95dC4MwB105VQU6jBM=;
	b=kn/O4h13ccJFKgaYAjqdu5fZJ84HjjJ6DUjM69fBlyBzHxPTfaVvqNRSHylPD2P0b5nyjk
	snmaxc895CHDlCHzMIW7m+E9chm+9/oqQ1VuLcWVzUA31JaWipQJU62Uo5FJKHCCLVhGVs
	nB7yKUpDzmY+ObDwAN9JnpHfGpOHRz4=
X-MC-Unique: KWNPR1rNMOqmff3-3asZWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3sSYpQUGEe8oMQuLwpvxYE7IALALsYNSrxzciq44FAKisvIRZ21WAj4BL4oTKi8QCpEWU0nnfwqf2ofQVeAE2LWvgTcKUNpoII0ZDez+rWwtJz9dsY1WlciEu+eB1oSXMlwnQUQFX3g3bE7qqtWz9MQM6aVJ5+bfv2Z8gvFEmcq8RPw11SsYprDCRHsQrERLK8IHEO3SIsxvg/lbca+BxO4AcwSBSnqbIy76ZvoBFh65yKuEwwYPVYJVa5hhSfNO9q+rXZGAB6/Y7P+NHdWP6n9O3suJZWmRWm9CTfZOVpvqIHpsTrUSTeZxz+Rr8bBNU0BU67xRIctdAP4V1+ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ab4csObLsDUSWIHGU1Rqn2fo95dC4MwB105VQU6jBM=;
 b=jtjTfb2Xv1Lwdusn/BqZi1ZpIp9lm18sqYVKaQv1dFoH9nReYaLSGs6LLAVl09Ywaz+i+PaPCtDXT4oIVCaTdgbvfkoj09R1xV3tNDujoh74pI8lfwszPjf4uSbo5+dwl6ycQrzh0lL2w50jbEp3JzXksnhBenr3bsHUFaThNk+IhD/vES4jpSXNdLEEx5eSgjUwigMS+yBeMX4QWMH36BOIvIKfGdCEgMc5TOxoGgZJYQbQlMku6KYnONiZAz0ABzv1YbDB8MklTazAukg5pELcBGh7bCH3f4vMmMZLvbfd0ajb8C0kDb6Xq3N2hXApCEEYkhiFTht+DCP1HVNdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98553b89-6296-9e4c-4677-9201cd7cdeef@suse.com>
Date: Mon, 25 Apr 2022 10:43:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 18/21] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::35) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31b50537-6199-46fd-b8f1-08da2697b4e7
X-MS-TrafficTypeDiagnostic: AM5PR04MB2977:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB29774C5948BBD5F51854C31EB3F89@AM5PR04MB2977.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nzZBCILlrNZDOJWCc8bd7Frfg87ffeUqCgCeHxSU/SOuETRVFnnxO26+GxIkSky9IMiWMcK+y7GaRJ7ULk+3kuZSoacbqSbNGrH9MhbvNnuBGm8tf/0DTPoQDd0Z+lWEZ+dnDOd7OmPL0mxBW5eQNWu269Ls0lQv6Tob7hx5iyBN5sbCdUjrzD+n61lMJiJndDYvitL1MkyKTn0K4gEqQrprtsD80KyzRSJxmrQQYDNSWQ/u59BJi8pRQsplCgE9ADDnNoT1S98r+zjmSPEb1+DIh/ypwcTLSBngctxh3vvCRqKHG/hefKf+VM0vIhtFDmoBcLsG4mP3AAaC9dneR7VxN4O6pKLk5AVyIJzAfeK/pwNdjXq+pa8mF3wEur6MRXOELIYiKhVAdZdopgtizEXeFTZMErC4itRFj0DsHBSloL/Yb3cJ/CxyxhdR/a/m6jEo+ZZayo1AlG1Wo8LPEDX4afM/L3z3zs0vM4/Wqgl4WIp3J+cNk3Nmf8UswRdY3XLfwmyX5091J18OoB3h15dSgTJPhYW6+ZUcjvdIyVZK7oB/zGp5Fft1xDIwVgSzCePAZ2WbaCEcjpki4OGfN/ZLwxhVEmN+CziKKWjw0/opH2mbM8fAmSFocUANfoDHCaJ3hyYKULCo6Ma08ETTiDZ9TdDf52jMArHSo64hxkeOH0sikZV76kVDocybJW9RkX4XZ427fHe4itvTvXhZHnZoX1Syb/1Laj3FcX4vBuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6916009)(508600001)(38100700002)(26005)(6512007)(6486002)(31696002)(5660300002)(83380400001)(36756003)(86362001)(8936002)(31686004)(2616005)(2906002)(66476007)(66556008)(54906003)(8676002)(4326008)(6506007)(186003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0VBYjRkK1ZoVXJzZ3ZxdXp2NVo2dnJXU2NZb0ZsS1g3WmVOUDdPQkxNektG?=
 =?utf-8?B?cmh2UHJoN1dPUGNOMndHd290OXZFVlpiSnJWQXFKd1JCVU5aZFBUQzlBamNz?=
 =?utf-8?B?cDk1WW9NZnNXc3I1VUYxelAzeVlUUzhQQ1VFcE1TME1YMisxNVA4Qm5id2Jo?=
 =?utf-8?B?UGhERkZjck9qLzFjd2xQa21uNm9nQ0t4aGJhSDIvTVVQZWtFTWF0cTVPZFZa?=
 =?utf-8?B?QTZqUUwzbTdpQ2l0VVJjME9vLzBDSWw1VnRWUHcwRzJVODBZdm42QnRuU2hs?=
 =?utf-8?B?YS9sdDJlY3BONDNEV2ZkWGYzU0diL1JLUTBlUCtwTTlpZlJ0elAyTXlRWllq?=
 =?utf-8?B?eU5GRjBaSGl2d0c1OUprRHNmTmZJWXpzMjRjUGlsRDVPUnpCV0lJNWRyUkV5?=
 =?utf-8?B?TWJnTnE4ZG9PYWxLcFVWQ01rM3FTQnBDNHZGZXZvZGNkYnVVc2JvNzF0amg1?=
 =?utf-8?B?bkNCVGhhUnNISGpyV0o2Sy8zZW12N2RqOThjZjFwc094aklndXpvbnVvVlFC?=
 =?utf-8?B?blhEVzFyWnlIYmVYTnp6SktjK1QwaWNBdXRZSG54ZWg2dmUzZE9lY2VZVzNL?=
 =?utf-8?B?TC9QSUJmS09qQk54dEtpN2hpN2JUc0tJVys2V1R3enZWTEFyVVpNVkxEcmht?=
 =?utf-8?B?aHBMY3Y3SmpDOEVPdHo0bjlsOC80LzhNa2d5cVVQRCs4dGNCUi96dGRYK0Ur?=
 =?utf-8?B?eVB5bHpxR3hPVnNPajJtMEw3aDIvL04rdXFlaVdDbm5ZZGZUSlRBdURacWdl?=
 =?utf-8?B?c2VyZjJYNlMrT1NIUHlzZlAvNlN3eGgzQ0lHRXhIV3RUZUpTenRnODZ2YWpZ?=
 =?utf-8?B?dUhYMDB4a3o5dGtkL0hCbjArRTh1eU8wZWkwQWFJbFNGOHYwcytEbEF0N3B2?=
 =?utf-8?B?eWk1TERPUjNNcXF0VEhPK1FZYlhPN0J5V3Z0QnNsNmxLSHNsZUMvcmd4Snhk?=
 =?utf-8?B?UEFLUlMyMk1Dd3poY2NxOVUwbzIvMWcrenhnWG9DTW05Z2U2WTBMbEpNRGRx?=
 =?utf-8?B?RG1YQytkY2dwTDZndExERnUrZGNWNnl0aklxelFUT3F1T21aQm5JQy84SVVW?=
 =?utf-8?B?QTRoWkVtLy9SNUVQaW0xaGFKN0pVSnVBZHlXNlJwcUtaOWxOQVd5YUFYWWRQ?=
 =?utf-8?B?MWJhWHI0RDZCUHRTbGk2M0ZvNTBtc3IyRER6Y1MwMTN6OUhVSHNIeXVnUDZK?=
 =?utf-8?B?eENoQkhaVzlNVkFuSG54cmR2QmNDNjJUSGhYTjkxNm1kWU5YbEVkNmJzK2s4?=
 =?utf-8?B?dFRxWmJTVkRZSGJJQ1Z5Y3V0K2Z3SzloT21IVG9ieUxva0pNU3ZWTkFkRGpR?=
 =?utf-8?B?VEFCaVBlZnJOV09yR3EyWUtjVEhkc2RGdWZnMnBVd21Ec2hlL2JKc3RoaS9T?=
 =?utf-8?B?WVFqbXJsV1A5N1lvTy9QVGpOREFKZmJ3WGZJazFMcEdJWmQzYlZ6dzRPQ3d0?=
 =?utf-8?B?RDJ0SzAwU2krYVRCNE1TK1JxTFZCRHpyVmIxa3V3UE5mRG5SY2NmbVJDZUVt?=
 =?utf-8?B?a0c4eTZ0NjZscDVZLzRLb2x6QjBQLzdnTVRQUDB4czliNFJhUXlEUFlUUzNa?=
 =?utf-8?B?bDRlUll1cTBJTjZVRDltK2FCdGRxMDhJWmRmRWlkMndoYUJsVVFHcWVUMnRv?=
 =?utf-8?B?aXdObkdpWjlES3I5MElTeTdQMjVyeURURXA0RXFZekh3TGNRVjQ1V2VqenJ4?=
 =?utf-8?B?RU92S0JEemlkZDhlT0Jwb2M2TjJoN2NRUTlWcEVHZGRnRnN1V1pqTHdFdm1x?=
 =?utf-8?B?cEVCRVcrZGN5SFNXUGhua0crc1BPcm5RTDhQMkNjUW9XQk9jY1QvMXRhUHRO?=
 =?utf-8?B?OFNNamxRN0Q3dzR3K2FHeDhCQ3czNlI3SjRwOWl5SVNBbHJidGpOYVZWKzkx?=
 =?utf-8?B?MW0rZ281QWttL3JvTnZLNEh3L0xELzZuU25GVEdheXY0RTJOMXZ3RVNnK01o?=
 =?utf-8?B?L0gwWGt6UWpZejBVUEtoV3VMZThIT09qOXhsQmk3RDZZVmNMNy8waTRtRlE3?=
 =?utf-8?B?a3o2NGp0Y2N6ZUVQQ2NLd1NPRTUxNk5lZDJWL3lHV1RkRDJoZzBxSmYwRjRD?=
 =?utf-8?B?c0FjTnkyMkpWRmY0S21sWUZlMXA1MERtYjdmcHUvTGMvUHY1a0o3NDIwWWlX?=
 =?utf-8?B?SkRxQVdMMXltVk5hSzB0Uko4WFc1RkxmL2hPbjJSWElyOFRkc2xnTUxtTFov?=
 =?utf-8?B?Vk42S1lwMVNxNGNqZHB5MlRhVGJrQ0s5Tldkd083eUorTTVWdVFJaWRTN2Vt?=
 =?utf-8?B?dkxFNFZEZGJMa2VoUVVsUUNKcThRUUFlb1hFNnk4MjZ6bGlISjNhZHZRN0sr?=
 =?utf-8?B?Q09RdUdUYU5xRjBpVW1HbjlDOW15UkFPbmNSUFNIUDBIelkvWEhDdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b50537-6199-46fd-b8f1-08da2697b4e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:43:44.4286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnGPBIna7w5QCA+on4z0BrWmh88J8zzk6jnLn8NuK7xx2FVT0XPddEUHzw6i8DuoGABAlL7oU1NzJe5kpb99OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2977

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
for whenever we (and obviously hardware) start supporting 512G mappings.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Unlike the freeing of all-empty page tables, this causes quite a bit of
back and forth for PV domains, due to their mapping/unmapping of pages
when they get converted to/from being page tables. It may therefore be
worth considering to delay re-coalescing a little, to avoid doing so
when the superpage would otherwise get split again pretty soon. But I
think this would better be the subject of a separate change anyway.

Of course this could also be helped by more "aware" kernel side
behavior: They could avoid immediately mapping freed page tables
writable again, in anticipation of re-using that same page for another
page table elsewhere.
---
v4: Re-base over changes earlier in the series.
v3: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2216,14 +2216,35 @@ static int __must_check cf_check intel_i
      * While the (ab)use of PTE_kind_table here allows to save some work in
      * the function, the main motivation for it is that it avoids a so far
      * unexplained hang during boot (while preparing Dom0) on a Westmere
-     * based laptop.
+     * based laptop.  This also has the intended effect of terminating the
+     * loop when super pages aren't supported anymore at the next level.
      */
-    pt_update_contig_markers(&page->val,
-                             address_level_offset(dfn_to_daddr(dfn), level),
-                             level,
-                             (hd->platform_ops->page_sizes &
-                              (1UL << level_to_offset_bits(level + 1))
-                              ? PTE_kind_leaf : PTE_kind_table));
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(dfn_to_daddr(dfn), level),
+                                     level,
+                                     (hd->platform_ops->page_sizes &
+                                      (1UL << level_to_offset_bits(level + 1))
+                                       ? PTE_kind_leaf : PTE_kind_table)) )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
+        dma_set_pte_superpage(new);
+
+        pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), ++level,
+                                          flush_flags, false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
+        *pte = new;
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -232,7 +232,7 @@ struct context_entry {
 
 /* page table handling */
 #define LEVEL_STRIDE       (9)
-#define LEVEL_MASK         ((1 << LEVEL_STRIDE) - 1)
+#define LEVEL_MASK         (PTE_NUM - 1UL)
 #define PTE_NUM            (1 << LEVEL_STRIDE)
 #define level_to_agaw(val) ((val) - 2)
 #define agaw_to_level(val) ((val) + 2)


