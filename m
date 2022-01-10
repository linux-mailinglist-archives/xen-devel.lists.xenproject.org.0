Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC890489DB9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255500.437849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xgS-0007Xq-6j; Mon, 10 Jan 2022 16:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255500.437849; Mon, 10 Jan 2022 16:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xgS-0007Uz-2o; Mon, 10 Jan 2022 16:38:12 +0000
Received: by outflank-mailman (input) for mailman id 255500;
 Mon, 10 Jan 2022 16:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xgQ-0007SV-Az
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:38:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1dc0a9f-7233-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:38:09 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-4_F9siGPOn-M_PM5_YDU_A-1; Mon, 10 Jan 2022 17:38:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:38:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:38:07 +0000
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
X-Inumbo-ID: b1dc0a9f-7233-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiK4Py7T+iWHZozg71IXWaPgjEgLZSxpxNyWGT8sGvA=;
	b=mNPofTockME7AvQUKBAVb/nyrTnpTACf81eRu1fSPNfGOBLDXPcvEd+TfKyUjRBP9nP74w
	e4fyXmldVoyqxS7a/S4+uNadrhkDjlk90MjuP1VHoqxdmqlwP/mrV0gDAnOmXPNFySfS5O
	KRJZSRrZ8wA7zpdXKhe3fnEKF1QPrv0=
X-MC-Unique: 4_F9siGPOn-M_PM5_YDU_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOui2ndF3KBUf9/TkXp6ob02hXF+LCN8R4DilXupRSz0AXjBgPo/T2mmuSaLKeE4x22tudJi4MFKFglVh/nRR8WLFSpmE8H4A/8h+GPICaubQESR9sC8/Vikt5ErTFAlOfH6bl2V0g4umhw/EafCDxkX0zzdhCVqrDt+sHKq7UKsI+AYYiqI2Aw0MeuAfCcJUj6wVjIRQfbjGX4g7WgD0LLakunIW6oUkdNLJ+GxT3N5eEl+I4JIQt+y/4Y9DwJB8ldvlI8Uxzml4+5B85GTsJ8C2q5woAGage/7QmhmyN9l+lIHQh4tC/CVbS3+EUjEBFQz8F9i9xBMDmtTlvw4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiK4Py7T+iWHZozg71IXWaPgjEgLZSxpxNyWGT8sGvA=;
 b=TBal6CY2RW/v1FhhLKzJjHqf5adAhDC+CRfHqkwQCOuntr6f9LS6gpNIjLacttMXYvF6KhgYBv2xQPEECiZ1H5KGKpo03JgvxA0is6iA2o8ZcI3SYDGBDVTcbJqoV1zihxS0++ZegcY1pMzbNqucEHhqdC4cwDrmL9zg+X7JGV1gJZJwaVWzWkeRhi5YOoTfXe7uXcLugYkTtgSsf505xkME5O44LSDN9XiA222pywCL8uWlw3RO519BVWIF3GXLX0kjM1cWW9Zb1Ua17gbu8IFZuRVS2AcW559hSYbN+CtPkxbSfcWIvRXlL2x1NQmk1gl2+n4sz14aOcAcudJ0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58e8871c-0d5e-ec32-74ac-9137e8f2ce41@suse.com>
Date: Mon, 10 Jan 2022 17:38:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 22/23] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0084.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2451232-f7f0-47a2-4c3b-08d9d457948b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64775E32B598F9037834D70FB3509@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gkFnOfMOgRwLP7RFCv7pa7SLHbnEwq50pi3c5R0M+YrdMTYFsTRaOOu7iEp8uBx9FbJ0mceWo9mmGIhOVN8Lftp/ko8KNpP7gvO2LJcK87MU2Pj8ktSFXf1DFXHGkp5h880rG5Pp8LkB0QQW6wvfmR0u77/USY9iAWpH1mgC4JAiJwLX4qRCZmT1KaoH8x/0ZRqu2sLdA165lll65ZCKJhNgW6fc7pc224K1eC578AEFkg21grdJB1tOv0YCNRR8oP6lBQJoip+o3S+TQ8RFeSbPLXKh2CPwRIFPB8r71EL9gin1mrzkXHpYkTEhRvTs0JE5hgQPCQ6Z9Bo7lpFlxZuZA6Jvx0IKte2WihjkyTSb7pW5Sb2uUoIR2MX2v7hj3olFY1NkOsYHV+CyyE975mPuzCtt03x5tLd7aF9JgQNuST5hRA3JJTCp4LK9uF34mgLwHumRCU6+rviEPUJpMdzShPYsGO+NoFsBlWXXJtaR9ud22oIMYH5P/uejBK+GTKfsVgS9rU21yB9Li08T61rPZJLMcS0oP+I4YaUXPA5OmcXy6e+1uTwabZAKtq/i1LjCqGWi2VP8kFxH8itK6wYLKmk6BfnkOjbNtZz5lQOAAmCd6XHQmNVCNWass+1uWXM6ssPijws0gLoUFGzOxdLTVE7SQt32lls+kuvklnJUbuM9rjLIdLGzWNSICaf+XEH6kEpYFfCdrhW3gXji2ecD4HsEsWInH6HR54CzqYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(66556008)(66476007)(2906002)(66946007)(4326008)(38100700002)(54906003)(5660300002)(316002)(83380400001)(31696002)(508600001)(6486002)(6916009)(8936002)(86362001)(36756003)(8676002)(6512007)(31686004)(186003)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmRBeCs3aEYzR0hsVzJjT2FLTUZvK3c2ZkFsL2ttcCs3d1kyWS9kWWtDS0sw?=
 =?utf-8?B?ckl1dVE0OEgrazI0bnYydE5OY09MS0owcTZLUmwxVkR0aU9DUDBXODlBc041?=
 =?utf-8?B?WGZ6V0tBTHEwS3F6MEEzOHA5QUt2aHlqNURZbUtydHY3VkViekVOQjJ5UnFr?=
 =?utf-8?B?S3NzcWpkb2ljOVJycmdxeWNmcnJnZ1RVU1cvRXpneUJ0NDl3TkJPeFN4SEMr?=
 =?utf-8?B?MnFUSFltS2lJY29PMVlNc3VkaWs4TTVJQ0lFTFlNcGNHU1ZDODNhcDlad3h4?=
 =?utf-8?B?cm9mZjMrK21PMmI5UU9YUnZPbktnc1RqY1k3UU9TSjhrdlFoY3Eway91WlBP?=
 =?utf-8?B?S3RLdDJQKy8zQXBiZTJFcXBWUncrNXp0RE9mazdMRW4wVERCZXRNTVFJNGJO?=
 =?utf-8?B?ZGpUSytFV20zZGY2RGZVbWovTnVDc01MK2xjQnMyMHF6UzRVV0hhcithZWt1?=
 =?utf-8?B?aUtZMk5rVlUxU1g4OFhHeWFUdUZtaVlGQ000dXBkUy94YkMwdjJSRlRvK0Rp?=
 =?utf-8?B?dExLUHJXQXEva28zQ0tLSkFkblM1Z1gyUCtWbXdsYkx6SEtyWkdNRWttWUt1?=
 =?utf-8?B?cU91Z014NXRZbFZJTnpGZm1xeWJ2WHJzQmNpeTVKbkZHWmg1aGxNV3NFc3Zy?=
 =?utf-8?B?Tkh0ZzFVZTRQb2FPTFVRb04xbHFtZlU0Slh3R2xibnVPcjc3Vm9kb2YySEVw?=
 =?utf-8?B?VFl5cGt4ZkZZV0QwTVM1N0JOZFdBSDk0RCtxMXorVEhYbE9OOHZoeUpJNjNa?=
 =?utf-8?B?ZUJiN3B5bnJpQ0c3VGI5d1lkaS9WaXRwVFh1WkV4cjNpSE0zZ00yc25MRjBK?=
 =?utf-8?B?R2tJS1V5TzBKLzJPUDJjMXdzVVV0SzlXOGhZYzZvN3dJVko2dnBOWjh1am5Z?=
 =?utf-8?B?RzYxZjRVaGU5am1yVjhxT3YzNnpLb2FEZEtnZCtwVFd1Y1hyQmRVeXIxZG1Z?=
 =?utf-8?B?OW5qcFJQeXEwMHVGZWhCZTFEems5MlEzQTFrQlJRZXFzUnIrb1JLZHlBVUVv?=
 =?utf-8?B?V3ZUbFBDdzV1MUtKV2VOSk1NN3FCS0dWSndFTW9LZitSZ3JvSTR2V3g4bzYr?=
 =?utf-8?B?ZDkwVjRvbWsvQmlHaEJvMzYvQVJwRnVRNnRqQ1d5YzB4WlV5V3lyVEY4MTBT?=
 =?utf-8?B?NExlb3RGeEViQS9UampoN3hxeW9uTDZHZEV4TGhoRjdYZnF0cGQ4RklIQThu?=
 =?utf-8?B?V1BUeVUrdHVoUHlPYXdzOVVmRGxhbmVsdC83NVVKbDRpcDA5eWkxOHZTbSsr?=
 =?utf-8?B?Z0hoUkV3RC9HSzc1OXVwZnNHN2ZjaURhOW13SU5laXpmZDczM3prcFE0OFd2?=
 =?utf-8?B?U1hja3JZOVhjYVdkS09hNEo2TC83ZS9FOWdMNGlmVGJya2JDVGVVNkRUODlh?=
 =?utf-8?B?N0g4bEJlT3h0ZXlQeXgwUnRzTFFHd3RZZmU2dUl0MUNFTnlKQWUxOVBQa1Fi?=
 =?utf-8?B?VG1nYkkvVStvTUFQUldLNHBqQ1NSbkNNWTdSWnp1bmtXOXZsMmQ1SzFIelFB?=
 =?utf-8?B?M09BQzFrR01Hb3YvczJjNFFBUEcrUFV2T0pKMU8xaTFZQktuQUlCa1gydjZa?=
 =?utf-8?B?OXRYWTg0RU1wckJ1d2FZbTRGM3FHRFhwNllCMkN6UHgxVHRuYTdnQVpML25n?=
 =?utf-8?B?THFHcnFhM3JXUi92UWQ0ZURWTHVJZzZVUVlUL1k3TEVmR08yc0RVdGtvWVM0?=
 =?utf-8?B?aG5UazREODFMTFJaK2lmL3FoOGx5SUZhWlV3T1lOdk5mTG81UnZnMjdjcGJr?=
 =?utf-8?B?MXZWcWs4TDJMcU9JaDdpUWVWQW1FejJFazZGekt2V3d2TUdwbm85M3E5b3c4?=
 =?utf-8?B?V0lXWEt2a0pkUmxacmMvQ1Q0UFRvSXM3dE5UQzZ4aUVsd1E0WE9nMStVVVlD?=
 =?utf-8?B?c0RzQVpsREV3dTJ2c2RZUzVEemREQytsY01qSDJsL3cvbldVeWdSQ3l3cjhP?=
 =?utf-8?B?SzdHUzBFcitNNS96Ym51NC9OL2dySmJVR255WURPUnlaUit6aXVqMWxhMk4r?=
 =?utf-8?B?Sjl2OHpha2hNdmgrRzU2UmtTM01meUppSXJlWGNxVHN5QVAyMkRHUjd3QUNo?=
 =?utf-8?B?NFFXRmdRNklNODVwMEJlQjZORTRiVzdveEM1eDhOMzVRSk9pT0F0S0pDSFBL?=
 =?utf-8?B?eEl4clpLVFd0QW1ZTC9KS3U2djFMQnMxeVdYMlA1aWhnQjI4Mm5uUnAra25V?=
 =?utf-8?Q?ZUgE760ewtwMSH/zQJ7Q5y0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2451232-f7f0-47a2-4c3b-08d9d457948b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:38:06.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+uoNsBG71bn5ZxG0iJs55QAO/5yJhn8q8HYLQQgdji5npFZGLbgTX7MpKctrF+SC2VHO0vozm6PiPEYx7pVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

When a page table ends up with all contiguous entries (including all
identical attributes), it can be replaced by a superpage entry at the
next higher level. The page table itself can then be scheduled for
freeing.

The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
for whenever we (and obviously hardware) start supporting 512G mappings.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
v3: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2071,14 +2071,35 @@ static int __must_check intel_iommu_map_
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
+        iommu_queue_free_pgtable(d, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -229,7 +229,7 @@ struct context_entry {
 
 /* page table handling */
 #define LEVEL_STRIDE       (9)
-#define LEVEL_MASK         ((1 << LEVEL_STRIDE) - 1)
+#define LEVEL_MASK         (PTE_NUM - 1UL)
 #define PTE_NUM            (1 << LEVEL_STRIDE)
 #define level_to_agaw(val) ((val) - 2)
 #define agaw_to_level(val) ((val) + 2)


