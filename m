Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C1416F79
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195122.347656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThpI-00011y-W2; Fri, 24 Sep 2021 09:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195122.347656; Fri, 24 Sep 2021 09:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThpI-0000zH-Ss; Fri, 24 Sep 2021 09:49:04 +0000
Received: by outflank-mailman (input) for mailman id 195122;
 Fri, 24 Sep 2021 09:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThpH-0000z6-Bk
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:49:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34e2868e-edc8-4611-bdb0-d85d1b12a56b;
 Fri, 24 Sep 2021 09:49:02 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-knYvFKPcPPuzKwAHNz8SYQ-1; Fri, 24 Sep 2021 11:49:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:48:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:48:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 09:48:59 +0000
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
X-Inumbo-ID: 34e2868e-edc8-4611-bdb0-d85d1b12a56b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHr+CH5Pz0j1yX5jp8hrrxKCetSkHo6HQeq3jEu7QTM=;
	b=H4RlaSok+NWd2mnH+/4nQsDa/EFGgNFFrXIOZdp2C/Lmv1fYmEHwxpCQaHwFkY1NaHY79D
	UL9l4T3eUqjSDBXM7GNsBkhGf7XZDG8XoFvYNzYncGdU83PcigB2o3WQdxWK73jQsHKQ8n
	UXzyrbTAioAKBOkU38ijnIe5gDZEmOU=
X-MC-Unique: knYvFKPcPPuzKwAHNz8SYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie9SxD5ecB6XO2f1xNO4xbXITdouMtirBdeNhfNejrfO0wZT56BB7wBZHFgcUx5w+PZlHVsXU0aoptHQ6hmVpK+D/HqvzIlBtrKZofgJP/DmHFGhhGhO0+oB656ZZw1xs4hJH8hLVbR+/XY7gusME6BVyl/L54FvI+UCsGWR0phxk66yrYx0DEBbjIw0If4GJQR/xhCnwBCnMvrZ7O6gF+SegO94sYLMO2xJU16WHspIoqQ09l6ajsWXWzC/ApnFm9do5EWfyWoCz/nRsrUgBSys3iIXP8PMGVkndhyj/1sY8mkQ1r7aH25AKQJ8kyHrps9MXJxsse7Kz98Y9FYaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YHr+CH5Pz0j1yX5jp8hrrxKCetSkHo6HQeq3jEu7QTM=;
 b=I0doe435a5+KyFpwAFi4r8rGn1Vtu5OXJ+CNmm0Iph50qCR3M+i9kYb/rQ4xd+Qt+AOFE/eSfrcomMBPDysMMEsFe5d+NQBLxoMb7eKcCh3r4ADV14PzciH0ydXGQCA/J2mzK9PGouyAHLZOBv5miLlji8GNH8We2YNBFKZwStfq22uhgMFsMPgo6TVwHr6g7Pc+XjvXocgW/goBpmDJl7IeYESowhmZlw7AKZMW63Zfa8WtF0qg5oaaciwhxxo6HcMNF6HP2Xo//lHhHTcSHjReDxNL3OKpL+9AFWNw/7HYjBy9oxdPLNjaQPbn9PIBIPHIIUp6gNBX6903gM7JsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 09/18] AMD/IOMMU: drop stray TLB flush
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <6d825fc7-d600-6759-5bc2-ab8b17e4033b@suse.com>
Date: Fri, 24 Sep 2021 11:48:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 699ce415-eff7-45cd-7d45-08d97f408877
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383D1F8BF2D3E7335DF15F2B3A49@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ui0APsBmqrSL6p0QicK29x2jrKvGyP4f2042V+nx86DTiOHQnHwQ+4zPqfxBWrRqgjdFwN3MlFrt1RXHLuPBY2hYCce1ki6Ytiz23wvYwAsyijq9Ftp1IEOVev3twqRxR3RHakhuJ+J7rahVzu9APyDrKmK+pJd8bY2w63HvA7VdZ3YlZKHvdQ3m7ZsukspF+9PMgOHgn7a2HrNCkZRIY3f/Ao+OpXNZoupqHw+aTZLNjYdcJ/K7DDoHNqsE5JtE4rYFezXSilPWsYoSzrz9keSkkmqmxsU4A7U8YR9f5ty1+9D9k3wD2v7pNOpJuxfVfOMbZgRA28q4PlAxR/ui7j64CCpKwXmKeWY4enBdo7P/bY0pv1VK72mdlFNmmqoNW8erPfn2lgwXyEqw4u7SrMblWNnnjr7tmww98Nw2D+PNfHg/BjUkUW2QkiZnJTnQ0dNpYQ1YZ3MiqKeN/rXr/SQWTb6ffsdiicfg8tzKGRu6GAmtmKay937AbTjmHOaH2Ex3u7ZHoMZsV97qFgE7ra532b35FQCR8JFF6j6YYvYGZjfc4E5kne0fvc9qn69ngQQRvE2Xc9PrYBknGvRpufC59nFzHuCcsz5VRKdtD4wHNNrcojLKejo8FoqKaSh++mMebuyaDtKuj8zpx8HxlJ+oTv32m2qNuC1uW8n0cKoutasKl3a9Av9xIXyRGKNjXVvHlBOzeVjQBUdbTfGzeZJnjPVb83AyAtjLb6dCDdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(508600001)(31686004)(8676002)(16576012)(38100700002)(83380400001)(54906003)(26005)(36756003)(66946007)(31696002)(2906002)(186003)(66476007)(2616005)(66556008)(86362001)(956004)(6916009)(8936002)(316002)(4326008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnduOG9EMzVyWTFlclF5Y3V4amVLb3hkVkk5b2dOZzZ0YVRXZzZ4a2FKRThQ?=
 =?utf-8?B?SDFudVgyVlRpYmI1Zm84RllnZmtGUHE1Qk51RHgxZWdCL28vL0M4V2xJUCtl?=
 =?utf-8?B?MVBFK21FQXd0RXRqSzg4eTduU1p3a2lveTA1bnEyY1U1M2ZmZlpXUDdmVHFD?=
 =?utf-8?B?enBlc1FJNVBnZ3gzVjg1cTFmRTJJZTFGNVJDZC9ZM2dpdkN0Z1pSNGtyTmht?=
 =?utf-8?B?akFkSkJWMExQbnRRd0x4eEhKa3dNWllYeEZYY0tGbndyMHlwL3pDdGZ5UHEx?=
 =?utf-8?B?MHFTMjdsd3Zza05NZS9sSTM5aGFDTnFTWENJR3lBbHVKS3Q0aHo2OVhZblNI?=
 =?utf-8?B?U1RGcDdJWnh6dzlyNTliYVJjRWxNclh3aDFXN09DSmxqRlkzQWpIRnMxMW1G?=
 =?utf-8?B?TjNRbTFUUG9SNlo2UkNEZ2pldXFJRlFOMmN4ZlB5cGJ1eDhNclA1c1ExZFdp?=
 =?utf-8?B?RlcySExBdGNMdVEraXRpSjd5MThCczJKTW5CZE5ST2FvbEZVaVdkZ0Jtc2dx?=
 =?utf-8?B?SmRROWlqaWdqVEEzTXlneEZyMlZ2eEk1M3paK3dXdDFjbVM5YlJ1QTZZSWxi?=
 =?utf-8?B?VUtiaE5YVWhKdzVsajlnajFsSlVReXdxVm9kek1XeGpQdUxYNVBtV3FYcjJ6?=
 =?utf-8?B?R3ZMVS9pYTV2eEpuOEdnREM0anRibFliU3drS1VzRm42clI1R09KMG9ydkJC?=
 =?utf-8?B?YlNxVXl6TTcvbVE5TEJmMXYvUVFyYi9UTmhUMkVvV0RLMHFaZ0ZiTk1DaTd6?=
 =?utf-8?B?R3lDN09lcXdsSlBqYkpTWnB0b2dPVlg3K2lacDZzSm1WU0dMVlVVS1FObjJR?=
 =?utf-8?B?M3BETDNqOXltekZXVWdBZXB4VnkwNmtPV2d3blJ0ejNYSzJJMkMyaWRzTnNT?=
 =?utf-8?B?bU1IdGpybzhxeEFXeU12ZmQvM0h4L0hzekY0YTRmYlpMYjJIS3Q3Tnlnb0hP?=
 =?utf-8?B?aXBXWmxsZDlZNFRCa2c1N3lKWTBpMmlMZC9lcSs1REpNdDNGZU1ma1VwTG1q?=
 =?utf-8?B?WVRFQkxkN1dPYWNqQnhncVVzUUo4ZEVjQXJ2RTlQZHI3N2RLYzBTLzFLeTF6?=
 =?utf-8?B?ZnFZT1NMNGRoZFpQNGZjNm1WUGZyU0w4QXdKbkMxN1g5ZnBxemJxaU8zc0x1?=
 =?utf-8?B?WndDQnZFWVp4Nkl1Mm1pS0lQeUhyRVZCdEpxNUloUWd0UExKeEtwNFhocWJV?=
 =?utf-8?B?NG5ETnUwVXRLS3psaUhVNXZaZGZRNEorSnlCMGM4WC9ta0FZWjFQNXowdkdK?=
 =?utf-8?B?L2RJaEN5YWs0cmZJZzlhREs2K1hHamN1RkFZMFB2aHp6NFpNVEdtMlVkOHZ2?=
 =?utf-8?B?aXR0RlhOREowQjFZOVgyb2xtU2ZtUTlGTE9CMWNWOWxJU0VubkVPc1pDOTgz?=
 =?utf-8?B?bEpFYWx1OWd0QXBlN2ZHRStyQUlicmJFOU1xbUsybmxlLzIwTEhxQ296UmNO?=
 =?utf-8?B?TXVsVWkrSlFRN0dYUmQvUmhuUWEzdkwrSllzTTh4dG9BcnhmRUxtL2lqOCtV?=
 =?utf-8?B?M3BGUk9YVHBpMUZzK1crM3d6N2laVUpVNUtuYjVYRS9OamVWTlRZVGtWNCtF?=
 =?utf-8?B?ZEN6d1hOMlpWcFl0QlgwcisrcUhqVytId1hDTUdNeTJJMFlPVWY0ZHBUbUFx?=
 =?utf-8?B?a1RubFBYNTFTeXRHUWVldGtsTEtsQ1pSN21vT0xUY3FnZS9saDZwelFidmgz?=
 =?utf-8?B?WExLTjRwRHZNSjE0QkVDdzQ2aWQyem8zdE8yTDFFUTQ2K0Rwd3J1WXA3V0d0?=
 =?utf-8?Q?Ksb6LR+DK2EttLnmbFJ4vuKCZUaYAfJympo1g95?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699ce415-eff7-45cd-7d45-08d97f408877
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:48:59.5421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yG8po0PC8Zdu0M6Wyc4c1WwPes3P4NUP2qR5LlShPUixxjY3NPlySaduZK5ceaSCrbfnpCrs8S9ai+4csLUDog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

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


