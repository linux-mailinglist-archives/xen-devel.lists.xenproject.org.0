Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19902489DBA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255503.437860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xgt-00087x-Gb; Mon, 10 Jan 2022 16:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255503.437860; Mon, 10 Jan 2022 16:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xgt-00085k-Bb; Mon, 10 Jan 2022 16:38:39 +0000
Received: by outflank-mailman (input) for mailman id 255503;
 Mon, 10 Jan 2022 16:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xgr-00081m-L3
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:38:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c21ae3c9-7233-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:38:36 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-gCby2cU-MuSOeORWtzizcA-1; Mon, 10 Jan 2022 17:38:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:38:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:38:33 +0000
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
X-Inumbo-ID: c21ae3c9-7233-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97KazUwFBsNkQrAya4NCXyO8j9M+QQa3dDJrEHqAexY=;
	b=MKH/w1aKZMa0UqPWlOkdULDxInifHJSWM0Ojq+tIwMv+htpyg+48ySVwjdY8yGLLzwrvpR
	5nsTVjuYbep277m2fIDEp5Si0C1ajQBKNcBZrpRLOCezXZIRwflILpj600nmTAMtb2Zore
	nY37CtdhztSxwIBNdjNf4sAyI2ymBY8=
X-MC-Unique: gCby2cU-MuSOeORWtzizcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K267DTvJe8m8dWOmIX0c7eBXKE3CmyYZ545KLDeLXzsmnWF4sykc2dilqv3rP/pHIBz/VTLrvCFkSM0RZGq3OWmDH6rBcpZBdeLdTRc8J3FcAqQhu9oYPk05CZMt5zsC0sGg0KWwBy1bjIjTP+KTNx/wc4hTykp5qAkJmtHkJJPpmNZ7EkGpCpu0hdWWn2YH5UT5I30OhwDnqAeZYNK4XJNKUwHqwsxg7qdr6W9pObyLvW1f+ZljJa0LEMbmaa5ffItUvKFT+RxCdPhyad64UoO1vnA3PCEt+MTifocsBTCzg9D4ShSb76BxCf7tHDr8TDLdyaJILD7P+TqIQUho/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97KazUwFBsNkQrAya4NCXyO8j9M+QQa3dDJrEHqAexY=;
 b=cHfol603NA8IMzoZuUAp+nZ0I3NV50r5bZkxwBunL13ThGrCqN1dTODJ45cGvnoQngNMEddsxzQN+2Li1q0A8Plnl+NvJiIjensiN0XMw/3F64AQ5uvtKcLBCzxS5YOZ3d8sPhpVmwzICxoSt9FqUTaEww6QHZhfDkMJW0HVywqTIan9A4T04um9QRFtgoXP3NQz4V4LDC/iOtBrXqAWOXwXn4V7qLz8yu/i1IoK6R44qj04sGjAnYLxy8eMjkwOfklWos8YO9ebpU/oBAPsGalbZi5lio6hR8IIf41vQ1sg/BeiM0sWCdqDuno8SCnkExAbEAwce/SEg7wg7dEbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5d5d7b1-7b53-5c74-1988-3baec74a9f45@suse.com>
Date: Mon, 10 Jan 2022 17:38:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 23/23] IOMMU/x86: add perf counters for page table
 splitting / coalescing
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
X-ClientProxiedBy: AM5PR0602CA0020.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b9832db-e6cc-4391-03de-08d9d457a459
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168354D49B07535C6A25B67B3509@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D3Zv0S7mKEZg9PIiNTQvM2GgtRLbIemWYsxZk7kNh1qpc+yqyto+c4aTxx07O0JmYhpUaSz2ShFzchaRUEHpUhyi2Dh90JrV3oAXCxCGNWjbbZQQQQFoPnWK1enM29B+Oc9zPjAp5O+tSetUvUhN+9Utre7h66qcrrJWLWYyl8JxzrN8ysnEWwE90wijxKfsBYLQfWDPZeq3/4yZ5QlcGe5vpwe0onBLkAiuhbCQX1qh5fMDxHkaDawjnBkXyr80oXrUFCyIHXO0uGWWSTZvC22kutE14CYCPFIM+GCmM4K0EjIh4+S7phSz6dYnK/gScunq4HjWbp0BSgI8lGuxAvgqiEFmuMHlmP3rktrkEKW7Zuezdf1yINo60F1wXJYh7HCIga3+i2x63lL+tNYqonakm8ZbMotZ0ph5qRCubNXUWivobHl2yWBYk2JgiBGpwqBMTCwUWe6WpKS5V3ZytxnQN//qS4N9c25iCUWBLwhyPN5dsWUYXXkc1efQ2BX7dZll71ze0K8s2HID/10fGNUhMN6oWLL1ICynIEUfy4l2KLEZJcoZaZC00di291DvhLwBz78oCzFyB2wb4Cnn9UtOlNAyB5fVsE9/zazfhv1uWuKvt0fbqXu1fv/dXQjuNnnVattH5mWnPIXCtJJv2uXrHGGd9p+YPvyPHI5VlByv3HkJBUnYmgW4E1N/Xj7Cpqh2o1kjFJAlaZCo5/2lii12kdpnTpd7zXLqGFsJeMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(36756003)(38100700002)(2616005)(2906002)(5660300002)(26005)(4326008)(8676002)(54906003)(508600001)(83380400001)(6506007)(6486002)(66476007)(66946007)(66556008)(31686004)(86362001)(316002)(6512007)(186003)(8936002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVdoZldOSWFscGNVdG9OdUhRNGFiTUkrek9FK0xYaUpyUDNhVSt6Y3k5K1JZ?=
 =?utf-8?B?aTZuN3JCMkozNjJVaSt5VDNSeUNqYjRVSDZGU0ZENjA4YUlPZlI2QjA2TFl6?=
 =?utf-8?B?NzY4RVFpbnNyQmZFbFV3YTJveDdpdm93dFFBa0hic2NuZzNZWlc4TDViSzEy?=
 =?utf-8?B?UVgveTZBRzdYaDJNeERIT241aW8yV0Rqc01MNkFYc3FrM1UrUTFsVExwRXNW?=
 =?utf-8?B?NkU1dEpFdkprYjFMNWJNMzBWemNKL21INllhREpxOUZ1ak5aeVh0VGE5YzFE?=
 =?utf-8?B?T01IellDcWo2aHgvRW54bTJOVmVZVmhNVkVzTEhuMTVWS0M1OEIvREFJUnAz?=
 =?utf-8?B?TlpFWlFrenRXRzRYZDArT3IvdWZIQXhrRzU5WWUvc0VlZFhoUHdBWHdXd291?=
 =?utf-8?B?NGhMSzg1R0pBalV4ckJ4UUkzL3Rzc05ka2tFWG92YkE3YmpkUUVYblBYVDVG?=
 =?utf-8?B?WklVVVg4VmtmUlI4Z3AxYUhWTllmeU9OSW4vSXgydlkxdW1yNEhQUmpnWkJu?=
 =?utf-8?B?NnBPTm5Qa0EweklzOGJJZWt0ZUpwTnpCeWtxUGw0MmMzcEd2SE5MZTErMDlE?=
 =?utf-8?B?eWdreW42aUZDOE5jaThCWEVkQXh4U1pJaFZVSkxmQW92aU5IclZROERaYktJ?=
 =?utf-8?B?V3F4OU9UVXA1SDB0Z0VpanF0ZHl3MlZiZmU0cmtVSlhQYTA2MXpSd0wrTzhj?=
 =?utf-8?B?TlpOSlQ4YlJZV3VxRnBuZG5sY2NTdHhGRURUbUg4K1VETUlQSy84dEhwcjBD?=
 =?utf-8?B?ZDNKTmlIdTB2NVJ3c1YzY25wd0RwbjVLWU9waHJ0UjIxZFVvZ0RjSlZmYUlr?=
 =?utf-8?B?ZUVqU1hTSFJqTUNCNTlQcDE3dGdwd1prczhXcXNqaDErVlVRV01oVGgwa0gr?=
 =?utf-8?B?TEQ1eVQrYkZmYlNDU3EyOVU1OVVqYXdtSXpxcTMxN2Z5b3hpRTdBdW5LdGtR?=
 =?utf-8?B?U3BpNmJVRXgvSHJzSXpFMEVLOHRHMjdzQlhkN2p0Z0wxek4rN3AxYWhmNDRY?=
 =?utf-8?B?NENZQmVFaUNTdmFiSE1SVnIwdktXSERwa3FUWXRiOGJoUTk1WHQ0cWNaS3R5?=
 =?utf-8?B?SlFJOGV1eVNxeXBUV0RRdWpyYXEvRGU4cmw2clVEdzFDNkVhVC9XY004aHdO?=
 =?utf-8?B?WXpLVUFPakpSM2NSbHFCQ0R3ZHdiaEM4WlgrWjdMNklwZUVvZnVRRmREMGFH?=
 =?utf-8?B?SWRSVWpEZmExR2pYWU9MUDJFU1dobXJ0MU1kdnlPVFZWaEtNcHR0aHlQNWhK?=
 =?utf-8?B?MkVFbklQMDYwaHB0MEU1YVpuSmtuOUZTRk0zRHdwcmtSeTBXNVQ4QUkzVXpB?=
 =?utf-8?B?U1RWRHIzZ2ZjSVV0M21SZjZwNXoyeWFQanpEcmkwRmRoM1NNK01pODFTeStF?=
 =?utf-8?B?NGk3SS9YeWRXMEdkaEF5UFdPNytFM29jNWl6Z3Rrd09BUURaOGpXZVdTWVF1?=
 =?utf-8?B?TlJ3SHJpcVVzNTRGYjlDeFI5Y3JienZndzJhek56UTkvcHJSWTlORjZjYWhV?=
 =?utf-8?B?M1dpZ1o4NGFWVzBqNnljZVJKWHVrUTI5TDF3VmQ1U0RMZElibWJ3VTZ3QjBv?=
 =?utf-8?B?cG9FaTdFVTFWWjN6WXBWRGFEazMxMm5uc3BTU0czMkQxRUZzT1dad2tCZUgw?=
 =?utf-8?B?elNaVE1qRnlVWEIwODVhRUlhZmtsY0tFWWwvL3FnOWJTYTVXNFFRSWhseDlw?=
 =?utf-8?B?cmdLSThnZ3pUa04wRTlSdi92K2FtWEJsK0R3R0Ntd2tra0hVN0t2eGtVdkpX?=
 =?utf-8?B?L2xPMU1BcmxLN2dCdmRTcnBFOXY2QTROYWtEOFlveituY3BRQkZ1NXFUU2Vr?=
 =?utf-8?B?UTBxUUdFanUvRDVZV2dtUTRGS3doU3cwMExjeEZhTGdoTnJtV0xBb3E0dzQz?=
 =?utf-8?B?NmR1Z3hqY0s0WFBYZHJreTZiVXBmNTJzLzRhTE1aNSs3VHZPZU5PNVQzcm1s?=
 =?utf-8?B?K3FOT3FUWnRNOTMveWROT2xOLzBkaWc5SnNqV1dkWUlucGRLTzlDbUVvbHNJ?=
 =?utf-8?B?NGlaTFZvTzY1TzNPNStpQWNZS09NV0V3Z3FhWmVveEd6RElqV09DaXpsZFZw?=
 =?utf-8?B?bFNMK1dkSjRSVE1Mc1FKeGJBUlhYQ3loN21MVERaZVcwREZ5eDFCODk1dDNL?=
 =?utf-8?B?SjhrZ2s3MHBHRWdtM25wWTZObFBEUVFIWU5BWjJ6cTdWVE1RZWRPSkpmYm0v?=
 =?utf-8?Q?7PH7l0Wz9kdx1xkwAZbWmZ8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9832db-e6cc-4391-03de-08d9d457a459
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:38:33.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsNWg9I0/Z4ZZzeFY12tBFtgIW6/jdu0QZqvjm0efa4A7HuLFYuwoMjp62HrQpjJU8slOjF+ILst9ehfuNU7iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -283,6 +283,8 @@ static int iommu_pde_from_dfn(struct dom
                                      level, PTE_kind_table);
 
             *flush_flags |= IOMMU_FLUSHF_modified;
+
+            perfc_incr(iommu_pt_shatters);
         }
 
         /* Install lower level page table for non-present entries */
@@ -411,6 +413,7 @@ int amd_iommu_map_page(struct domain *d,
                               flags & IOMMUF_readable, &contig);
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(d, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -471,6 +474,7 @@ int amd_iommu_unmap_page(struct domain *
             clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
             *flush_flags |= IOMMU_FLUSHF_all;
             iommu_queue_free_pgtable(d, pg);
+            perfc_incr(iommu_pt_coalesces);
         }
     }
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -451,6 +451,8 @@ static uint64_t addr_to_dma_page_maddr(s
 
                 if ( flush_flags )
                     *flush_flags |= IOMMU_FLUSHF_modified;
+
+                perfc_incr(iommu_pt_shatters);
             }
 
             write_atomic(&pte->val, new_pte.val);
@@ -907,6 +909,7 @@ static int dma_pte_clear_one(struct doma
 
         *flush_flags |= IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(domain, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
@@ -2099,6 +2102,7 @@ static int __must_check intel_iommu_map_
 
         *flush_flags |= IOMMU_FLUSHF_modified | IOMMU_FLUSHF_all;
         iommu_queue_free_pgtable(d, pg);
+        perfc_incr(iommu_pt_coalesces);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -125,4 +125,7 @@ PERFCOUNTER(realmode_exits,      "vmexit
 
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
+PERFCOUNTER(iommu_pt_shatters,    "IOMMU page table shatters")
+PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */


