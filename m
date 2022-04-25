Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C450DB57
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312538.529832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuEz-0001kM-Kb; Mon, 25 Apr 2022 08:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312538.529832; Mon, 25 Apr 2022 08:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuEz-0001iV-HN; Mon, 25 Apr 2022 08:38:41 +0000
Received: by outflank-mailman (input) for mailman id 312538;
 Mon, 25 Apr 2022 08:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuEy-0001TY-BJ
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:38:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aad4c05-c473-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:38:39 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-FnbnxG2eO5yWg5I1ukSaqQ-1; Mon, 25 Apr 2022 10:38:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8638.eurprd04.prod.outlook.com (2603:10a6:102:21d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:38:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:38:36 +0000
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
X-Inumbo-ID: 1aad4c05-c473-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9iSfvMKYPfUIQdOapiU+/T/G/OgrgAKwMM8hwIFvpo=;
	b=EqkNxuy16guVo0OgYTCCIeK52s7phBnnaN7NsI4LyOfjM93nse67dl/aCTFYo/fm1Tw+vv
	iZOstjjYDkkOZ9kA+6yTRFWxH6xFiRti0gnjVUQzcdDZbbN76uAVJ+xDr+SoVRQvk6cKE3
	b+JvCvfSQnwbsBVOijREzsSMIzTOiM0=
X-MC-Unique: FnbnxG2eO5yWg5I1ukSaqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AC9GrLuVvBD1b/TnZsGZSiVY1DbV36D8eXE/50Dd1+WHYeX8l/796QMQhbLWfQOU3iaPh1wZbM+vpTz1xeydMr30JN0qiHq71I5hkke5N9qy9Bejnok3hLUDp6btRlUxwwyZpAraJ/IIyimx1/vGYhZESEFNc/V1dovAiXTMLsKbanr5zzHiCjnwEu6vKhFUekMt3tkkCw2PaZukhotgzNpUA8LBIlWMHwynycKNudL82c33WqHb02pBH1X5OC0lQElG/MqEwODY12tAb9f9LhF6AQRncGfs+sgbyktCae7SmYujLOe9OM0np/KLo2VEyHEW2htiD+E88xmRVcV/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9iSfvMKYPfUIQdOapiU+/T/G/OgrgAKwMM8hwIFvpo=;
 b=hRQozTN2AbYVHczUPgxM6DHCgnFgGdUqMzyWE7U+ae1FAj0rrHIdgD5yvJyf9mI0qPCCYw+DvBvwRytr857wYO5cJfTvsRQ9eMfyAk5xZ4EzgdjJIIdDmJbOwUOVx8O19gv2SkSt4WbFETSjq76zel40l5F0S5r5qjhQO/ltvQUYHHDOkT+Es39fs4y/1J+K02howFk8dOK7gRmsVztFZVps4qWp0moQTiHdZzgJIkGWOyvRIYputYeAqqxIXQ5v5MdaPfqQzuhsEDDWdu7CBxQG2WxuNyVkf4FxAA8PBqAucTfrCfoGQwFt/54pyMh3q+QgkpF3FfnxZmnAVlbnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c73ae968-44a2-08f5-df26-7cf9b4a5b1aa@suse.com>
Date: Mon, 25 Apr 2022 10:38:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 11/21] VT-d: allow use of superpage mappings
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
X-ClientProxiedBy: AM6P192CA0016.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 024289db-c4be-4ab4-6b62-08da2696fd57
X-MS-TrafficTypeDiagnostic: PAXPR04MB8638:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB86388D68A565651EA665865EB3F89@PAXPR04MB8638.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0txE0dPW/Knkt9kdhOFyIlR3d3u/lL8h3ml3s4PWP+iJ8P7ndgoQHkFE7Fx+sTdO80P6EcYKL58edE7HTg0SNAvBXJdr1lt6dBpOG8PVCrQQDNCc/9aC526DBFzaJMJmWvRWpNdUi7TsChWWyxfUi6/KQ5sIxHJ1knteJDPyKHZwQIIwwz953V0FnH1DGVsBie+gXQGU9l4T4cJSbxqVXziHo0ZzH8qwjgBeNsxAwbzOLsHKecq7+d2DOeHr//PGWw52D1kTP0SLKyZ4opPyZmFTHw/jFLBdD0+rjRVEt0mBGJeD4phtcyeoeJ+FnZXAgCh/V5897KRQUVl4PRUmJYyhbfDJr5rkkIyUKau1fpxGvjusro/X1B6MhfZDpOxmHP7Bg8uoPsX+n2pIX5fiCrNLTydRjm7+kGl5mn86fjLlhZwHsud2+HYZc36zPZB7Ca/zyOLk/k7GoqxyWc0OgB1p0JUOj1/gh9K3dp8jD84uS533KbwnPr68gPMmCcXtFbQowFGWNuuMXX2nHv/eqIGUcOhg5GiKGirlVnR7UX5/yNznT6akHzyoPgMDzDdlinoe+rvl7wsFvz3w9aLkvTwtPUa1YLRjoLPQaVh7SAkQHUoLaFLCKDfjxZp5JBFcmJtmgsk9VSpAr9U9pL56P5+/ctQeAp0tIiYsY9wPr51VVxEEJTmVhxeYd4L8nDcQipq6uI/86IO99m+UbQtYwUzEYn3CmSk5+dttvGX1WrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(31696002)(83380400001)(86362001)(316002)(8936002)(6916009)(66946007)(66476007)(66556008)(8676002)(26005)(186003)(2616005)(54906003)(4326008)(38100700002)(2906002)(6512007)(6506007)(31686004)(508600001)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlIOEVkMmNvZGt6dGp4ZGp3WWZSNjBmc080b0JqZEJONG1hL2R5aGFNWkha?=
 =?utf-8?B?Rkl4NVRNVWdFdXpERFNDVHFETmNvMldNdW1iTnNrbVQ5Z3k4LzJQU1lCMlFm?=
 =?utf-8?B?dTJTczZGcXg3MHFsYmtRTytabTBnVGh4djRWd1lYM05oYmpKTkJsNmUrV1Yv?=
 =?utf-8?B?RFNUNjdDd2l4TmxtTTFCUzA4Y3dQMVdybTBjVVhaLzE5RG1TTFEzU3ZwazA0?=
 =?utf-8?B?ZXhudUgwOUVNYXpma1dpclViVzZOWE1qdU5sNUVMZllBeVp3dDNJV0U1dFow?=
 =?utf-8?B?TDNZR0JDaUF0M0toSG1Oemw1TjIyRnZQdUM5VUVheWtqdnZkSVQ0NEpHUXoz?=
 =?utf-8?B?dnBBRExDVjlocG9OQ0gzY0xlTW5GZm5EZ0lRaU9EcDB3U1czcHAzZ3AyNU9V?=
 =?utf-8?B?MGxjcUg0Q0g4ZTV3blViemtaaXBQUzdQV1FvenZNZHNoNkRQU3FSMG95YVlm?=
 =?utf-8?B?SERuQjdFVjhQRmp3ZnlVK3NkdnRXSmpwbTZWc3VPUW5HZ09LaGxrMWFIQ2xh?=
 =?utf-8?B?NzY4UWRwK2p2em1EYzZVSjdtMU9ndnY4TWFMTittM28vdVdscm1QODZxT0cw?=
 =?utf-8?B?Z3E0ME1DY3pzZU11a24yOFZPeVZUYitPM2NBM3NBU2FmOGtJemJKVWpUYyt1?=
 =?utf-8?B?MytRV0VkSE85MHRIbDJkdDFlN2lIakpZY2tYM0ZCamhYVlIzWFhReTJuYW5o?=
 =?utf-8?B?RUlQcitjRjFqM2Y0OTVVeGhWcUNjelF1cW9QemhRQVNwTFhxSmR4blY1b1B3?=
 =?utf-8?B?UzVwbGVrRXlzS3J4SmNVeWcxQkx3bTN5R002UVFYZzlBb1pPZlYvWnppbkM4?=
 =?utf-8?B?eTBTTVFqYjdJQkpsQXlmdG1nSHJvQWhTanBsYkxGaGwwNGNmMi81YzZzQll2?=
 =?utf-8?B?VWhxOFFvNmVNd2NSeUpHMVRTQnVJNTV5ZU41TGZvYzJraFIvQ21xV1RxUEw0?=
 =?utf-8?B?K0tPOVkyL1pjdVR6Mm1VcnFOYVhkeXZiOW1QQzlsUFR5UkFhRUVFb3VrL0NB?=
 =?utf-8?B?Zm9DYW9BVGE2aDJnZjVPT2FwNW4vaUdyd2lFTkk0STFDQjRvT2k0cXFFQ2VT?=
 =?utf-8?B?d2MyZ3VpK0twNncxbnBuSzNEK0xBTXhLUTdTQUVkbzVoemIyd0JjVDB4SWdL?=
 =?utf-8?B?enF0dk1YV0JoRVFHdGNqa1ZCUXc1R3RvblJUTXlENUI3cnVORzdoY0VDRDJn?=
 =?utf-8?B?WGV5ZHc4TDY1RFFFWWd4anlPREJIbmpsbXIxSHFOcmdLeFFpZjUzRE5GU3pn?=
 =?utf-8?B?N0ZoVUZSdmJGZm5zdmw2SVNNQXpvbGwxUUNvRWV4ckNYa005UDU1MGNGTGQz?=
 =?utf-8?B?SEVkcVVvTnFWR0o5ejFlSXVCdnpPeUIyOWJLdHdCUE1NMk5CRm5JNVdpN3Nw?=
 =?utf-8?B?QnF5Z2dZZE03bktZTFgrbkxUY09FS1h6aEpyY1M2SHdCUGNXYTFuc1h2Uy92?=
 =?utf-8?B?KzJxWjVET2ZZZGlNTnF5UmFjN1VKdzh4SXJHRERGZ3I4RmQvQ0kzdVhxUDVQ?=
 =?utf-8?B?S0ZKekhDRlVHUTlSZzQ3ZXNpSmFkS0lBNTJsb3pRaWI3YmVUMWdVZlFVemJh?=
 =?utf-8?B?RjJ0anRUc2l4bTBDQ0E2czcvUTFRamVXa0k1RW9pbkt5SUM0WUNaWFhObGZY?=
 =?utf-8?B?bjZDZEhkaGNuZVEwdVNjbnc1VEZ2M3NRY2M2bnFjZkYrQ1hHNFltOHNWQU1V?=
 =?utf-8?B?REduNU10b1BTRTF0NTl2SFk1c0pXL1I3c3AzQkdsUWN6MUY3WUg5U09vUDNw?=
 =?utf-8?B?M1piYVVFUlo1Qk5IWFhnZ2lkbW15ajcxN2dMclI5V0lyOEVnTmVldnF0OGhX?=
 =?utf-8?B?bE1JdUJKdkp0eEJ6OUtENFhtdjNKSGdCY1IzdVRLemtlV0FneTVGVEttZWxa?=
 =?utf-8?B?WGtiWi9KV0F1ZVZNREZwNWxLS2MwUlVWOVZlT2phc3cvOE1RR2NMZkQ2WlRI?=
 =?utf-8?B?OFJobmV2ZkY1eXVBYnZES01ETWxNOGJuR2d1ZTAzV1NCcmFYL0RxOGtWQStH?=
 =?utf-8?B?c1UrSUFkMUZSZG9FczBrY3pSR1VyL3FoZ1hTLzZnV0l5a2VUSEQwME1uV1VI?=
 =?utf-8?B?d3QrYjhxcENtYTRIaE1FU1ZkYklKemJVczJvdi8vRnRpTXpKSzRSdWF5QlpO?=
 =?utf-8?B?MzE1V3pWejU0clJ5cFJLQk42WjNDZUFNSFJtS05EK0I5dkJIMlpDc05lRW4r?=
 =?utf-8?B?V3lTbVJ2c2xQNmdZMkRrdzNGNitBTUoyS1pVSVBlaThTS0VXNG1JQ0hsREU2?=
 =?utf-8?B?UEpsY1lzb1d0WXdEeE42bGJjdXZUOUVZY0tkYlJDVUZJTzlUUmgvaHNKZ1gw?=
 =?utf-8?B?OCtTUUkrTVlTUHRFbERPdGo5WWlGUnp4TzU0ZkpxNGNoUjhLRjZMdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024289db-c4be-4ab4-6b62-08da2696fd57
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:38:36.4442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VzYyKTRyt6dCKW8dDbGLYv6niNWOFdSKAQ+GCN5TveojwzsCU3CvZpaHSudkuuoj5h15ylA8yUlizQ82Kkspg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8638

... depending on feature availability (and absence of quirks).

Also make the page table dumping function aware of superpages.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible. Tighten assertion.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -784,18 +784,37 @@ static int __must_check cf_check iommu_f
     return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
 }
 
+static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+{
+    if ( level > 1 )
+    {
+        struct dma_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_NUM; ++i )
+            if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
+                queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(pt[i])),
+                              level - 1);
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+}
+
 /* clear one page's page table */
 static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
                              unsigned int order,
                              unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(domain);
-    struct dma_pte *page = NULL, *pte = NULL;
+    struct dma_pte *page = NULL, *pte = NULL, old;
     u64 pg_maddr;
+    unsigned int level = (order / LEVEL_STRIDE) + 1;
 
     spin_lock(&hd->arch.mapping_lock);
-    /* get last level pte */
-    pg_maddr = addr_to_dma_page_maddr(domain, addr, 1, flush_flags, false);
+    /* get target level pte */
+    pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags, false);
     if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -803,7 +822,7 @@ static int dma_pte_clear_one(struct doma
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = page + address_level_offset(addr, 1);
+    pte = &page[address_level_offset(addr, level)];
 
     if ( !dma_pte_present(*pte) )
     {
@@ -812,14 +831,20 @@ static int dma_pte_clear_one(struct doma
         return 0;
     }
 
+    old = *pte;
     dma_clear_pte(*pte);
-    *flush_flags |= IOMMU_FLUSHF_modified;
 
     spin_unlock(&hd->arch.mapping_lock);
     iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
+    *flush_flags |= IOMMU_FLUSHF_modified;
+
+    if ( order && !dma_pte_superpage(old) )
+        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                      order / LEVEL_STRIDE);
+
     return 0;
 }
 
@@ -2097,6 +2122,7 @@ static int __must_check cf_check intel_i
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
+    unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
     int rc = 0;
 
     /* Do nothing if VT-d shares EPT page table */
@@ -2121,7 +2147,7 @@ static int __must_check cf_check intel_i
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_flags,
+    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
@@ -2130,13 +2156,15 @@ static int __must_check cf_check intel_i
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = &page[dfn_x(dfn) & LEVEL_MASK];
+    pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
     old = *pte;
 
     dma_set_pte_addr(new, mfn_to_maddr(mfn));
     dma_set_pte_prot(new,
                      ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
                      ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
+    if ( IOMMUF_order(flags) )
+        dma_set_pte_superpage(new);
 
     /* Set the SNP on leaf page table if Snoop Control available */
     if ( iommu_snoop )
@@ -2157,8 +2185,14 @@ static int __must_check cf_check intel_i
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( dma_pte_present(old) )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( IOMMUF_order(flags) && !dma_pte_superpage(old) )
+            queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                          IOMMUF_order(flags) / LEVEL_STRIDE);
+    }
+
     return rc;
 }
 
@@ -2516,6 +2550,7 @@ static int __init cf_check vtd_setup(voi
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
+    unsigned int large_sizes = PAGE_SIZE_2M | PAGE_SIZE_1G;
     int ret;
     bool reg_inval_supported = true;
 
@@ -2558,6 +2593,11 @@ static int __init cf_check vtd_setup(voi
                cap_sps_2mb(iommu->cap) ? ", 2MB" : "",
                cap_sps_1gb(iommu->cap) ? ", 1GB" : "");
 
+        if ( !cap_sps_2mb(iommu->cap) )
+            large_sizes &= ~PAGE_SIZE_2M;
+        if ( !cap_sps_1gb(iommu->cap) )
+            large_sizes &= ~PAGE_SIZE_1G;
+
 #ifndef iommu_snoop
         if ( iommu_snoop && !ecap_snp_ctl(iommu->ecap) )
             iommu_snoop = false;
@@ -2629,6 +2669,9 @@ static int __init cf_check vtd_setup(voi
     if ( ret )
         goto error;
 
+    ASSERT(iommu_ops.page_sizes == PAGE_SIZE_4K);
+    iommu_ops.page_sizes |= large_sizes;
+
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
 
     return 0;
@@ -2961,7 +3004,7 @@ static void vtd_dump_page_table_level(pa
             continue;
 
         address = gpa + offset_level_address(i, level);
-        if ( next_level >= 1 ) 
+        if ( next_level && !dma_pte_superpage(*pte) )
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else


