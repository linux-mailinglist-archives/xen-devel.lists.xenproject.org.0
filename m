Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF7250DBAC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312614.529954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuRi-0001yn-W3; Mon, 25 Apr 2022 08:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312614.529954; Mon, 25 Apr 2022 08:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuRi-0001wL-Ry; Mon, 25 Apr 2022 08:51:50 +0000
Received: by outflank-mailman (input) for mailman id 312614;
 Mon, 25 Apr 2022 08:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuIX-0003e7-Mc
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:42:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ed68a8e-c473-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:42:20 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-0CaPfVyuOMuCq0QkgcbLoA-1; Mon, 25 Apr 2022 10:42:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6891.eurprd04.prod.outlook.com (2603:10a6:10:112::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:42:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:42:18 +0000
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
X-Inumbo-ID: 9ed68a8e-c473-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mS9j+KCKEN6hv0oR924WDhW3Lh9+MjR+9IlswbKwkL8=;
	b=I76/w8DGOZpgW35SScLZK8Mfh3oq3E5u84hjo3ndSjfDTWyL3P4rbqlbB/25bWPxIsEIyK
	+wtbtZZJE6qemVuJtRFhAhzUwfo31vQjAsxcwBVAwI3bN6/bkzkIZoerO4uNbKAcTxw/G9
	EGzw/qpATgJ/6PBlcdpqTy2Nl4czJpY=
X-MC-Unique: 0CaPfVyuOMuCq0QkgcbLoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRUjh57B/BFkSVqND4gx+M5oyLYLIjTb2ioq0JI2nOKfFKrDlC2fcypIHjbzwpogWZFibaVtm0Aj2VMyKG0kYReO4PqjH4xIpXS1qAJReuqlnU1NuJlhHb3XxPXMyk/7u1UcTBE8nv7y14Ei9KUnHRnM+FgVm6cguFicahET4e68zmW4ylxmbNN9mSiToqBNCImRsQidj0DoU4nrH7nHGfeUJI1aPam+fZaghqrfwV4mHAaWBmMXGEM3n61O0CeZM/KI/svS6hFyjj91+d96Z+ryr6i9fw0gRPd/UpY67xNbVtI7ZzXzQk+hsjBwO88hhQYocsjBMgcjN0JFnX8eRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS9j+KCKEN6hv0oR924WDhW3Lh9+MjR+9IlswbKwkL8=;
 b=HS8FiBEfGvy5bXFfl5ZZJw0pwmK+B1s2/2a781d+5SFuBRlK/KfPFlx9nlRms3xVIYYpb6dR/dUnjivS3JcXy0IaAn2OJXIIRZr8kd2jJgBwxmJBdj6T+1VVXknqpZYLuqBHPgZ09qvOKQTKEmKQTjOWAO466TJk35T9e+33Dt8vDvi1I2iAdu1TKO1rA8WoKMQleikUZeMatUuTdHTZiMBX+qoShmclds+MiJcNmRBodWgiDlcumpv3t6sGA+hq+at2V3AdpLihoG0t40UCrPhJ4OgijXwX9Bcw2iVzZ54HZFFB0rD/4pU3eybiJqWBWPESWJomArl0nzg7tHS8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16f5b398-56f6-a70c-9ce0-0ad72eab5058@suse.com>
Date: Mon, 25 Apr 2022 10:42:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 15/21] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b9e395-2f89-4334-3add-08da26978160
X-MS-TrafficTypeDiagnostic: DB8PR04MB6891:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6891EBD1A6FDA195D75C34A9B3F89@DB8PR04MB6891.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I0gBddgZfz9sq6a4pIpAEnA7XSRVz2ByjpF0e5hz/z57IZ6KtRO6xJsoSySDSDhotybWUy9goPbPUQfJfCl47A7oFtyR84Z/FnouxFNDF/jR72MgR/D1JewmLds6CR8iFx6anCp/UXUi5GztMbOBZTVfd9fa6FMdof44zIPpZCsZ+xgG4nml0AZstfxrFKZfpnf6xqYpgPPTTa87+8KZd0CUaFQaNYkaEbqE/tdirqb8+k2FsH9Xce7YJw6l4nWwaKeejLWW0PKDm4Pf83lhXP0lwcoFniHxJk4yY8HwUXrvHp7/a1B9Zzhhj53n+PCAusdRj0YZZA2eYv1xUU6wScm0VoFh3ViR7S11cbXlwURFQ8hd75Mzdo+rspWljYqz/DINMEuvV+Tr5sMkWC0qxq4QipBBaYSdON2zdLdXNJH18xIEaQgyiiDbTA7zdYBdthslmblMqBnvyXxI/3UHW2Bx4rb4puYRtAtuUkG5PVOTD1zoyuPBFto1NT8dUNBtlBhnPy2umwpq5ScL3DoNr9T4oFnt7zxyXGCJkCgP5zT7li9PhOgGp9GovU+4L+dq+GuHt6zsuWbGkS6ZlVsxwC5OpilNKODOHzgMLyWaqtwGc0GgrNVDZLYYouPxFuX3SbO2s2GJthEJSIqMG9vvWoTmiR3RILNQ/bb7y6VVrb8+jELrA0TFCB0RO8KdHw/vrZUVC3bMEzAfjlJ29c1SqA+whRKM9GRZrf1WLZXa00g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(26005)(66946007)(6512007)(38100700002)(508600001)(66476007)(316002)(6506007)(83380400001)(54906003)(6486002)(186003)(6916009)(86362001)(31696002)(2616005)(2906002)(5660300002)(31686004)(8936002)(36756003)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTlSbnowbmNDTmhYRkMzUElGRFc2YVN3cjdBdUpMVWdPY0ZPZDJ6WFBSeU5H?=
 =?utf-8?B?U3JNMWJMZkdmWWZTMk5wZUdLTDBxUWtVMXg4c3dyekNuYzlabW5jdk45ZUs5?=
 =?utf-8?B?T2hLSjBvTElyMyt2MzgvZG56Y0JBTHZTSXBmV3dCMDdQMStzYUxiUm9ydmxV?=
 =?utf-8?B?cmRYNEtPRVlReHBBTjFpZHFMM244Zi9EUytEQWNrWURudU8yS1RkdDZubE9X?=
 =?utf-8?B?OW0wWjhvbTBMT01lVjRVU0wvQjVVS0hSdkllT0dzSlZHODVJZzdPeGpOTjRI?=
 =?utf-8?B?bHNVTk9ianFVaFYyWVdraFRWRWJpYnJlWW5vaks2T1pmaTZWc0YvNlIyMjc0?=
 =?utf-8?B?aS8ybGpDaXZFalI1U081WDhkdEMxRWhhNkxOTzIwblBFaFBmTCs5NkI1L0RO?=
 =?utf-8?B?MkZNMWZsMGhRMkZGbjBDZlFaYkRFMGJtVXBYa1gxNDFBeGRPZWV0V25GRThC?=
 =?utf-8?B?bjFHT0kwRTlJWWpWVVNtdkl6RmJRZzV5T2JGMnk1M0kxblMyUXhxWVRiR2wy?=
 =?utf-8?B?bzZSOHJ0R1ZuMjI3K0E1T3lOb2laNnZZcXE5N3pjbFdubDRMbjRlYlFVMWtK?=
 =?utf-8?B?ZExjdkpvUXZFeDBTc1MrRHBsSlM0OVhUR1ptYmhEQU5IenVuZEZDcHNMZUNP?=
 =?utf-8?B?c3VkWXIwUjhTamFjZWhLZ3VyUlgyK0k5NzM1OXhCZFFOMmp6RVhrQmllMHRu?=
 =?utf-8?B?MEN5dTJQbFpqZ253VlR4bEJNdkt3dDlMRWxNUTdFRUpuaCs3bnVQMkZxTEVo?=
 =?utf-8?B?NFNHY3FoMFhNOUhkV1ZDVnFUZmZ2eFF0NmhWcG1xd0pucHZSZG5pSTgvQXBS?=
 =?utf-8?B?UC9WVHppdlRQMlhucXFTSjZDNm41TytnSEpycHgyRDExcmlmY0ZBTkN4L1lz?=
 =?utf-8?B?QUtSL291MlpvQ3RtQnR6bTUxSFM4Wk9Ebm5aVVlMQkNCM21GcUY2aVFMRktN?=
 =?utf-8?B?UmRVOFE4aUZ2aElQY3pGejdYL3VWVWZiWHlEcHArbmdPTkFZc3RBM09aQXgw?=
 =?utf-8?B?ZlczSGo0TmxpMDBPNXV0aWY5eVh3QUZMWVVtTUJxRlZXbG5wWkJuOFdmSUh6?=
 =?utf-8?B?UE95dDI2S1Jlam1MekREemJITWx0UHBscmMyejNRL2FEZUxNQVRQV25uY25U?=
 =?utf-8?B?Smp2L1NRZUUzZkJlK295enEvOGZBSHRpZ2NrTHVyMGdBRyt3WUNudklCT01m?=
 =?utf-8?B?c3dhYW1hSGVRQnFPdmcrZEJCMEZPK2tLN0ZZRmRnTXgvM3lFWmpPdDU4UHBY?=
 =?utf-8?B?NWtyMklpWTc5TDJOZmhyN3JEdkZmL3J4T1krQSsyajkxUkNmak1QMm52OWdT?=
 =?utf-8?B?bjFyVWNqakVzMFdCSWx4NmQxZVhBTDRYOTU5T0I2ZDJya0RucncxYkNGelhE?=
 =?utf-8?B?T3p2WEhUWXR1QzBYRG1BeXBSVEQzckpSb2cwVEVFT2JqdVdWYno1d29xWlo4?=
 =?utf-8?B?OGkvT0hES2tUYkdVOFNUcjZ6NUhLcmttVVpYNlFpY3Y3U2NxZ0d5dDk0YVJr?=
 =?utf-8?B?SkFpQ1RqL2FJR0pqd3lDc0dIY2t0Z2UzWmoweVVmTHdXbDNTbEdOa0ZLNlg4?=
 =?utf-8?B?VjcvdDlKdnEyVHF5RUQ1U3pjT09PcVJYNVVVWStncmo1cnlXM05UQzFWSGZX?=
 =?utf-8?B?d01uSi93ZWZOWDJBQkFuWER6QWpHZWtuczdGaU5QTDdZQ0p1c2ZMeWRUbE8y?=
 =?utf-8?B?cjI0cEcyMjE0cFZXb0NsNGpQbXZmbWt4aUJYODgzTEp3aVNka0o5MEN1ZDlo?=
 =?utf-8?B?OEFXMW9tVXp5WEF5Sm93Y1k5S0tBUFUwZC94UHVwTjA1VVBCNTBhaEpXeGNW?=
 =?utf-8?B?cHhtKzkvVHZyeEhQRjNuSG1CcjBtbTI2THZhUzJWK0lMOUx3VWg2a01UOUZJ?=
 =?utf-8?B?K0NSQllvblYrbXRvM1d6SzZUQmdodnZESmtFalZqaU95QmhJK0d1VTNMVlB2?=
 =?utf-8?B?UVQ5eS90UHBrbHMrbWxqellOU1NvaTRaTkdFTy9FelpWTWxiMWMvRmdZQnBx?=
 =?utf-8?B?WFFORFJ1NXJweWQwY200cm5lVkVJR3R4ekkwcno4bzhUeCtRTmw0c0dndW5C?=
 =?utf-8?B?WUV1cGY3bkI5Zm9Xc0twS0w4aUgwQi9rcWJxTk9MTXpiMkhOcEh2UUFPMnQ1?=
 =?utf-8?B?M2hTenM0YldXL2tFTW55OW1GeW5mT0tNZDh0WDBRa3AwQ0ZuMGE5cDd3MnF0?=
 =?utf-8?B?NnhrYkpod0hzUlBncGNPUW0wSXo0bENiZjk1M1pOajF3MTY4a25IYitxZlZW?=
 =?utf-8?B?TmQzdDN0YlhiSzA4WU0wbGo2WVBrT1pNWGxUZWVrSjhuNHd1NVZJWXRjZGJO?=
 =?utf-8?B?VGxsVUQrd0hGNUExcjJnbktDY2hBSmZKVTQzQ0kxUEdhMk81ajhXUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b9e395-2f89-4334-3add-08da26978160
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:42:17.9624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ckv8qioaFNZ4ZHa0ocqeNtfYSlenojKy/sQjR16M66MjYgxEcIqLVoMJWYNO4mVpbqd2BZSFVp1uDjSRcmY3iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6891

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base over changes earlier in the series.
v3: Re-base over changes earlier in the series.
v2: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -21,6 +21,9 @@
 
 #include "iommu.h"
 
+#define CONTIG_MASK IOMMU_PTE_CONTIG_MASK
+#include <asm/pt-contig-markers.h>
+
 /* Given pfn and page table level, return pde index */
 static unsigned int pfn_to_pde_idx(unsigned long pfn, unsigned int level)
 {
@@ -33,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
                                                    unsigned long dfn,
-                                                   unsigned int level)
+                                                   unsigned int level,
+                                                   bool *free)
 {
     union amd_iommu_pte *table, *pte, old;
+    unsigned int idx = pfn_to_pde_idx(dfn, level);
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, level)];
+    pte = &table[idx];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
 
+    *free = pt_update_contig_markers(&table->raw, idx, level, PTE_kind_null);
+
     unmap_domain_page(table);
 
     return old;
@@ -85,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
     if ( !old.pr || old.next_level ||
          old.mfn != next_mfn ||
          old.iw != iw || old.ir != ir )
+    {
         set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
+                                 level, PTE_kind_leaf);
+    }
     else
         old.pr = false; /* signal "no change" to the caller */
 
@@ -322,6 +333,9 @@ static int iommu_pde_from_dfn(struct dom
             smp_wmb();
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
+            pt_update_contig_markers(&next_table_vaddr->raw,
+                                     pfn_to_pde_idx(dfn, level),
+                                     level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
         }
@@ -347,6 +361,9 @@ static int iommu_pde_from_dfn(struct dom
                 next_table_mfn = mfn_x(page_to_mfn(table));
                 set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                       true);
+                pt_update_contig_markers(&next_table_vaddr->raw,
+                                         pfn_to_pde_idx(dfn, level),
+                                         level, PTE_kind_table);
             }
             else /* should never reach here */
             {
@@ -474,8 +491,24 @@ int cf_check amd_iommu_unmap_page(
 
     if ( pt_mfn )
     {
+        bool free;
+
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+
+        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
+        {
+            struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
+
+            if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn,
+                                    flush_flags, false) )
+                BUG();
+            BUG_ON(!pt_mfn);
+
+            clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
+            *flush_flags |= IOMMU_FLUSHF_all;
+            iommu_queue_free_pgtable(hd, pg);
+        }
     }
 
     spin_unlock(&hd->arch.mapping_lock);


