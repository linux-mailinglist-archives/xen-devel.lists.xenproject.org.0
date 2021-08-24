Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93E3F602D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171470.312911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXKN-00014o-57; Tue, 24 Aug 2021 14:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171470.312911; Tue, 24 Aug 2021 14:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXKN-00011p-1R; Tue, 24 Aug 2021 14:22:59 +0000
Received: by outflank-mailman (input) for mailman id 171470;
 Tue, 24 Aug 2021 14:22:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXKK-0000xB-Vt
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:22:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce54cdf-c594-474c-886b-f21006515829;
 Tue, 24 Aug 2021 14:22:56 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-wog-5mtmOp--EWstW0iixw-1; Tue, 24 Aug 2021 16:22:53 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:22:53 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:22:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0209.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:22:52 +0000
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
X-Inumbo-ID: cce54cdf-c594-474c-886b-f21006515829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHr+CH5Pz0j1yX5jp8hrrxKCetSkHo6HQeq3jEu7QTM=;
	b=cwGIeEdp6rz/ULXfkoS7UJ9ZndHRjDZ97K1pD3GORcrI9ixCIcuRkD5FiAC/iZePU1Sqf0
	NRXBhsoAOca/kYvcQicIbCm28/SVuwdmQ62AS8GEPwxN3GcM9hltejPviDMHwYggkiJSFw
	B+4+emgKn5WJ4MJ4DubgduJg3ztnbCA=
X-MC-Unique: wog-5mtmOp--EWstW0iixw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQF2sDF2mtee0at7lvVtM6YUPkLPfpdLAJWjd1Jj2oV/AT4KNz+ld9crXPk8GuaCZhnslGkHKZTSt9wImDRsxEro/e+cHVPKEETyAftdjLU26wNqOJH2ARqJvSmtWk2uac3YY3A18TmxnWa2WVODUYtt2mmfev3iIdSjNmDwWAXhs9i++Ci1m8iMryJcHxuq6AWfkmoCj968jcT9HiAevd+FCh3AZXB4eyEB087/N9qXpSoGO+dw4PJpUfbRAmmPL0oDWhU/4KPsj6hqKtyFqvuj7OuthRWYu70s5OuHEt8Z0hQlsLBGgjyk3OFvpApmQPS4g4VVjpDielZvLsHW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHr+CH5Pz0j1yX5jp8hrrxKCetSkHo6HQeq3jEu7QTM=;
 b=A2FVjf8y3TsRzNCJ/+hY+xGT0WisI2hYPcZolfX2inUkFDTiKcCmynYcte9pFKL9awGWS4K+VByyU7Dl42e6d2fxpxc3U7Oey6fCKxW+KfI/84XFtXhp+SffNa/Xa0gCnSoJEVpE9Gsqy+ykDy/dpYhRoxmNIxcy/RoX/P5MM3UlvYSOR7ShpcihYZ6MNVdpKJ8RRCiMgzyRWwt4E3cAED/udwJgdaE3oDlxEnsU0QU6Irf2Xjy10+JG2BBGKBdPsUufy12gq2kuebes99ouwHLlUrruAxyMz2JBlOotpj3vYvt15hjDXHfAe6dZwNHAaiW1fRF1xy+Ij2QyUcFRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 10/17] AMD/IOMMU: drop stray TLB flush
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <d662c8ab-ee0b-87a1-2e02-e39228c7c3c2@suse.com>
Date: Tue, 24 Aug 2021 16:22:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::29) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f0806f0-de44-460e-03ea-08d9670aa8ca
X-MS-TrafficTypeDiagnostic: AM8PR04MB7841:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7841B61CACABF2BF8D350BB8B3C59@AM8PR04MB7841.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bPkW+/mT7KGsZKB7kfJucvRCTOF+i6xQ49NVi4htL9Wc8gAunDux1k0KobMxOcOiRKkSOCLVz3hgMBatq8rkwCAB9UZt7kpNcnuC7Vs4iUrfjDFh7MW5pBljUkE8pmOYFlEwl7MQV7Y3r87o/bo5nNecl4uv6CpU8OoL17dBPGKP+78GbJklEDW6e58NW9npCJFV/tujXhSX3fYBbVJHoLdHYrJas89lsUvKAPIxBFGkQzpSW3jhwjU+RX+ABnn45rm4VBl0MoQi8oqd5hAgRMsKkmL/X5gDDiHskWIhCp/FwhJJaIGe5/7QxZG8vTuu3DjG2l3Zkmtaf0zMWl/Or2S5H0tWwpOIeeUKdVBZJfxahYYBIGiWuLW9+/zA9yEaYpzfWQ3bpd8w4tNuWkT3j0wNz7kQJlTZUvwutqpW38oh9WxpRivHi4ECv2beMQ2953N3jCpH73KhGZimAD7K2wzSyqPs1LmXRorkL723coPgYfRbJ5A/DMKUwTFCBePwuYoI9tre5Ttu8x4FIyNKaHxkpvIGh/4iE+3XnlvjOBNfEGWDZRczOiPHLV3wCjSihMMnZ7MFE5NKh3RweU24jV270f0rJYCu3L1nfU/o6Xt5NcdeSbPTnGjdjv8vgF7bQmSKjiLtywuCEzoNI7Z9XXFehbwXdlIrfCyFbnOqOStOmds1ELowXzj7yr2SY+coIdtUZqpgTDHOuvonbs5r/LV/L93JBNbc7t7kL3P8IZY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(396003)(366004)(376002)(136003)(38100700002)(8676002)(83380400001)(26005)(6486002)(31696002)(31686004)(5660300002)(86362001)(54906003)(956004)(316002)(478600001)(36756003)(2616005)(66556008)(66476007)(16576012)(66946007)(6916009)(4326008)(8936002)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkVEQS9YRm1xYUNkUVBOUjJpU1pNTDdjdzZGekdDcjQ5UXEyVEtoOFdaOGdj?=
 =?utf-8?B?bzlzSWlJK3BLQ2NtVE14amE5b0QwWUdSczBGcU1uaEhrWkZodmdwMzZHaS9r?=
 =?utf-8?B?YjZyandEY3AyQWEzTGNXRkU5dDhEa1RubVNwVzJjSzZxZVRvOHE1c3ZYdEl3?=
 =?utf-8?B?WE1YR0owQkF3WHdrVnZlZjYyT1NVUEQ4SkIwTURuaVhRSmsrcndiWGQ4L0xl?=
 =?utf-8?B?ZlRmSkZGdHRjYktDcnpKekcwdngvODQvKzFkK0JrMEE1SThEZ2dzRkNzVjhT?=
 =?utf-8?B?NFlWTzlua09XVGIwSkhnbXQvV3B0RlNQTVora1I1NDZVTy9KSm5LSEREdk1j?=
 =?utf-8?B?bE9wb3dNRWZBQWFWb2lJMGcwVTRnRjBGRWNxN0dXSlYxV1BpVEhqbHUxTU53?=
 =?utf-8?B?SUFIcWhuOU5ac3F5bG0xeFB4MExIMDcwZHVXMEtyclFZVzkwa1pLZnl4aVVG?=
 =?utf-8?B?WVdDZDJvN2FEY0hMd1ZNT3Y1ZTZhZGF6czRmRmptUkVJUmdicEh1LzVUVkpE?=
 =?utf-8?B?SkdxWlR1Wi84blB6UldoSXczQkprL1U3VDdudnFsSUhLanJYVFlERkU5aXVV?=
 =?utf-8?B?a3hDQ1ZyTW85RXptQzFSdHN5Z3RjTVdjV2ltRDdRUVdrWUdYa0RGOUlxc0NT?=
 =?utf-8?B?YnE2Qzg0SlJJTEpVZ29WK1VqRVFLaEREU1BCMzRoVG94NFJMbkFKQUkwUlZB?=
 =?utf-8?B?YjNHblFzZnRLTEZhQno3WU9pZkRWZURqdU9USlRjanZhUE45aDZBT2U1NmlO?=
 =?utf-8?B?ZWJqeVVXKzY3SG9DT0pUaHkzbTNkTit0alJ4alBCcWF3L1lHRmllajBLalNj?=
 =?utf-8?B?SDF1Wjg1dE1kajFUejEwVHUwRk85ODd3UTBuT1EwNzdHbXNrV1I1Mk9DaVdM?=
 =?utf-8?B?YXl6VzlVZFJqV0FnZW9tTHpHbjMxQndRYTJ2RysxTUVSaEV5V25WVUVtbnZw?=
 =?utf-8?B?THZXZWpad2I5SjZIdWJFdXZ3OFhDeDZpVjF0V3k4ME0rdGZodHRJZWZGMWF3?=
 =?utf-8?B?NnVVaDlRQWIxR0J6TTYrMWdISnNQZGNsY0FMaDk0Nlhob2FvMGplRC81NDE3?=
 =?utf-8?B?MEw3UUVsaVZXUEJjYnhGYUszc0lCR0p6Zm9KRDNVb0NaNGg2OXBqVVl5MGtR?=
 =?utf-8?B?QlhMa3dMUkJ0NHpTV05WaFVrNHRVNnpIVm4vVldwMUtUNXJLSklYRmUrR3gv?=
 =?utf-8?B?dzhLN0E2UWZNVGRhNnAwbnFZMENTMmhHbHVJYWg1MWZUaW15TWdHRzBhTzd3?=
 =?utf-8?B?NXcwRWhRWTROMGNZenZydU5JMFBISXkxZE9tZ1phRmJZM2E1dzc3UDJxMnJM?=
 =?utf-8?B?THpKQUhVY1NhZEpBZ0F4VUVkcnI5QmFrckRSNXc5R0craXQ3eEJuaHJTNHMv?=
 =?utf-8?B?eWU1Rk9OM2NuN2RvTVZWRmFjeDJScHZsSW1KOXg3bHJJclpCTkwwS1pkTVZz?=
 =?utf-8?B?KzhmM2EyODR3VWNNVmRNWU1nbkw4dXhGa3hiZnhNaktmVFVXOTMwNFkreHNH?=
 =?utf-8?B?K2lIeGNXaWJ6TExUVjkwMWt1bTJRcVErY1JMdkZwUDQxSmNYb3NzcXRpdkth?=
 =?utf-8?B?WDI1MmdMRVpEOXJ1K3dRUHBhMkgvZlRGTEJBclk5OSttMWJITmZ0WUVEeDJK?=
 =?utf-8?B?QmJaU1VUSnRlR3Y2aUNTUGFzamJJT3BqNVFTcjJOdHphdGQvZGxsTnlzdmNt?=
 =?utf-8?B?dkFlN3h6QlhucnVMZTRZWTc1bkJnbWg3V0JFalNhaDNjL0UvTkoxdmlRb0FN?=
 =?utf-8?Q?yBf6sYo5Bo20486uCXeSesICmmbGS7DUc63nP7x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0806f0-de44-460e-03ea-08d9670aa8ca
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:22:52.9910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ezzxh3R+sjU7YwhcSzQM+MZYAOwMkyPyoizxoAiGnrFEfNpEM1fCCRRi3dKH+/pKX/VljPGqQ7KVHbS/zanYdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

I think this flush was overlooked when flushing was moved out of the
core (un)mapping functions. The flush the caller is required to invoke
anyway will satisfy the needs resulting from the splitting of a
superpage.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -179,7 +179,7 @@ void __init iommu_dte_add_device_entry(s
  */
 static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
                               unsigned int target, unsigned long *pt_mfn,
-                              bool map)
+                              unsigned int *flush_flags, bool map)
 {
     union amd_iommu_pte *pde, *next_table_vaddr;
     unsigned long  next_table_mfn;
@@ -237,7 +237,7 @@ static int iommu_pde_from_dfn(struct dom
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
 
-            amd_iommu_flush_all_pages(d);
+            *flush_flags |= IOMMU_FLUSHF_modified;
         }
 
         /* Install lower level page table for non-present entries */
@@ -309,7 +309,8 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, true) || !pt_mfn )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
+         !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -342,7 +343,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",


