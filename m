Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B24FB7E9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302802.516584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqYY-00037Y-AH; Mon, 11 Apr 2022 09:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302802.516584; Mon, 11 Apr 2022 09:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqYY-00034o-7H; Mon, 11 Apr 2022 09:41:58 +0000
Received: by outflank-mailman (input) for mailman id 302802;
 Mon, 11 Apr 2022 09:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqVJ-0006iD-82
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:38:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28fa19fa-b97b-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:38:36 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-JxMcKwvpPn6rrxgyZM2EnQ-1; Mon, 11 Apr 2022 11:38:32 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:38:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:38:29 +0000
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
X-Inumbo-ID: 28fa19fa-b97b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649669916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkoN9nC2qKwsSR3K+jJcseHwKHnMuECbT9MIWY/ddtQ=;
	b=HH46MiA0N6XHSw+LxS0jQjPkZXr9/clNme5gION92xoTUu/7OaOAcNR/9IVP9u2T1QLVS3
	iQU3kCYGg5gAqYKDjy7AQcA+AAMaC3872T9o+dUi/K1DBO1OlR8dbIutJS7/QPGTJdevvj
	mPwZlKTejT5sCUWqqw6cvCXJw1iJPjg=
X-MC-Unique: JxMcKwvpPn6rrxgyZM2EnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLY7ig+OCUvnW3I9U1ntzLJ+nxC7MMuf5Kw3YGiVtz1P1447uPHQVOKf/PXaP+cVcVhl9dzyWUxqN1LJBz/sLCAYXLz5HTM+T1snX/yQHX4OnwdZL2gpY0Hfzosg9i64g9R9JWMzH+VzWpl+DlWD652ZP2n0BEQQnimKQSiT9V6zN+m+vio/KsRaE9dzjsHW2UO4GyinUCTuqFRWZod+t2LW/x1vAGFPk1B9QnCHIq+FgqHGZnyGzO4lyqN464NoR0fWpZ5EpnzUW9gA9WFSFUcaPgRi0Nkf6gdWjvPCI8Dk+RgXu1U788KelQ/tFtsnkeeXwYxCTacZfdVuLzSYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkoN9nC2qKwsSR3K+jJcseHwKHnMuECbT9MIWY/ddtQ=;
 b=JJ3O7w+a3NxvPuN+lmTMZejaeDRcqABN+SM8kpb0qZxGCMw9VB6WzQ68w9LCTWevAAxudWbJm06i8usj+4ZV8mPpUELmdXTqLKhYIaLD/WR58ferg+/wbY2MWxZ1U/XFuTsJRSKyBiV1mh2mrKHsj4qCol+uzvxKmQ9mCbdh4jVuZ2Fzpr4+zlDWDyVIp+z9dxv/SkHtbi9ZpLPZp+jciE2uGykU3Ejyr1cQI3owB71rijf7SmEZP/6kn6l3OSKGYAhEVAZSO3xN5b9GluVd3zZ9+x8PoV8L5IPbUKLHEOpdV+v3vuTh0pTdAF191gkaqnV1bqPH8pPRfBWcgBGuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8780667-2307-fa7f-0768-753a83e00082@suse.com>
Date: Mon, 11 Apr 2022 11:38:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 6/8] IOMMU: log appropriate SBDF
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0042.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62c1f672-32b9-42f3-bd26-08da1b9f0906
X-MS-TrafficTypeDiagnostic: AM8PR04MB7844:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB784451B406F58A74A39BFD26B3EA9@AM8PR04MB7844.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FyqBRN7a4kn0xF/KgOFk9+i5OEHShGlSIBNXzF/cFWZw5V/RMR6d50ZfmroqWQonvrUg6kzzcNebyuVFkxXmPRTnZlCsTYe/AKwTgtXDKJanUXSj44eNcEFxfQmxvYFmpJMok+7z/uvgKkwNrz0V76iCMwEL0+ytKMOXkmiDr4HpwBelFHCwOYNYnFctO6F9UBPkI9Cp52zHFFHqnXmL7S6kA+biUzgD6rUFeNUMmopf6Sv0NO4Ge/spgguOTKVusROx45q4kjty0DPi8IjlDOaXydFRYrEwfRqyx9gKorAxhZHTY4/jok4WMgV3WXX7IuCTTwVrU4EHSu1OJipaDrXYchW0W8iLNq9mzWAZAGtvAf1+2zuV0rjfoXuovBbUvwuMWAIHehch8mlEoaCgCq78A+baEYCBjRFKGLclVkkP4gMTKADrCmQW3sJA/HBWokPYpf3eZhmN+c22vqGALAf6iCZrRyFpZe6q/vYsFAzyBglWyIjHDoaKwW6SrZ3wl/IiRRV5r3BcP70Ypn9oan5qqCoWFMWeuA/aI9o2D4gdN1+O5q2Kskuwvhn2aPzkrv69mdA4GW315jbTXjYAQEtK3Q22ZkUDiAn9BfzFeVhSMW1w4ksX0ncsJO0K/c6fVa3OzrLbDPcoSSG7oRXZQV/jS7afjqnsVO28+EmGk9Pp5nvwdeEpKbAJU5e+rGcgH0uwghTTe8JtyDIaWKP5IVc14ZglT+oC5kW0xXtaSpTmMFT5cN/NWx5baiqrXzWB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(8676002)(31696002)(5660300002)(6916009)(66476007)(66556008)(4326008)(8936002)(316002)(86362001)(6512007)(6506007)(83380400001)(186003)(6486002)(38100700002)(2616005)(26005)(54906003)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3VkT0o4Qks0SWN2Sm1LYXJleDVSTllSSTFsYmtuN00xZ3hLZXRXV3kxN1lx?=
 =?utf-8?B?Rjl5bE9BaHNrMkFjTU0xaDVza2JiM1Z3RkV0Zk5LUGkxdDFHWXZFaDA1RE9s?=
 =?utf-8?B?eVQwYzVBUTk0VVpsNUZJMlB6bUVINjBBRHpIVUdRT0JnY0dzZUVUUjQxOGJZ?=
 =?utf-8?B?bzZxUXFJKzBMMitJRXBnaWJhUlBUQ0lGbDUwVlNiaTdXU3pMWmIvdFNiWkU2?=
 =?utf-8?B?Y1lENXB3aEY3RmZ3S0w2YjJEZVN2NWoxdWc5QTBUZGc3a3hrU2dQc1IwQ1ZZ?=
 =?utf-8?B?WWdjNTI2YW9JRHg4ak5NVUlMdG1pOVVYdGdZTysySTczWUpNTXlWbDBSOE8y?=
 =?utf-8?B?VWhvVmJ2MW5HaStPL01mcm85eDdTaVdKSU95SElYLzYwekJLRFRka3RodlZl?=
 =?utf-8?B?azIzZnhQL2tZSjArbEFRY0cxSVRkaERVbWNDR0ZjeHdET0F3MGQzSkxJeE5H?=
 =?utf-8?B?VHJacW9iOEt1Q1hwbWgzakFjazFBU0gvekM1MjBNRE1BOHVmbFF0aDMxNmF2?=
 =?utf-8?B?VlgyTUxtODR4Wkh5enRLeS93WkZ0WXhBa3lpMjhjeEkvWXB5VExHcVVxZ0ZF?=
 =?utf-8?B?NmFPU3RuZjNCc25GOFJZOGtyRXpvQ04ySjhYQ1p1a0V2Ni9vbWRlQ1l0RUNM?=
 =?utf-8?B?TGdwWVFjUlZScFBmRmdHZHdIMEdCZ3d4RWlZdU5EV0I4K3Q4NjV6NUtsSllj?=
 =?utf-8?B?Wm4xSVdZTU84RnlPaWJMbjVqcFNqNDN0UXJRVEVGeGluZmxiWWYxV04rZlFn?=
 =?utf-8?B?OUFjeGtFLytrbWtWUy91QlByZU01aW9Dd0JjREZEcE1GVHNyemgxSDFoMk01?=
 =?utf-8?B?SzRqYldKcFUxR2NBVzk3Z2pVOUs3REZzTUpXelVNNEFTVmp6bHU4Y1pLK0Qy?=
 =?utf-8?B?R29aMTJ5WUIvV1NWaFhFbTJVZjhBY2R3OXllcmRDRmx2Y054UDYzQWlPSm81?=
 =?utf-8?B?VVNBN2lqbXc2STl6NDZjNGY0RUZSU1dQTXdxNlpSbFBISTU5VnhUK0NuSi9R?=
 =?utf-8?B?bS9NOGh5a3RxTEkvV3RXYjJNcGJPWTBQSDlpWVBEUkFBYVIwKy81WFN6eTZU?=
 =?utf-8?B?ZUpEQmtYeGJ1MTJkT3F4YlhyUVNGRllJYzVkTmZPL0dmZkkyelpEbFJuWmdM?=
 =?utf-8?B?ZDZyaTRGVkpTUnA0Wk15YzdNRno5ZkVzWWtzSjNJS0YzbTNzYXB6NW9EWi9P?=
 =?utf-8?B?TElGanFxMUVwV2svTGhMMVJUM3lHM1ZJdzduQ2NYajA2RGEzUFBac1ZLVlFQ?=
 =?utf-8?B?WkZ2MEZ3bU9pUHEyQkM5RjJpZnRjZEhTNVRkUzFZMHFvak1FUlQwT2VxdUla?=
 =?utf-8?B?QTVIcU5xeitVTUcyZFJkL1hPT2U1ZUhTQ2VBSlRSVjBiQ2xYUzVFR0N5eVhH?=
 =?utf-8?B?ak5Za1BwRnVlcG5PcFg5bUNZeHVrSno5WUdOSEE2SVpaTTlVSUR0aEFnRDR3?=
 =?utf-8?B?emh0TEh4WEdLTEV3WnkzQnRvT29PSitrV3IrLytXaWtRemE1WGt0S1RncklU?=
 =?utf-8?B?eU15a0lLbno2NzF1RUg1Y05zMnBqbFBpalZ1a0hzS252RFVuSjJpRHRUUzlw?=
 =?utf-8?B?cHU5bkc3VmFXSkQ4VUsyRXdWMjdGRTk2Q1dKOHlMb09wUkpLdWRQT1VsU3Z6?=
 =?utf-8?B?Vm1SZkVsL081cG9XOUI2N1JuMVI1OXU0UzI2QnZkS292aEJjN1pJWk1IQTFW?=
 =?utf-8?B?N1YzQlowS3FNbXpuTU1JS0pQSVVpRURCRGxSVHJyZ0NxQ3diUGtqRFFDSjlO?=
 =?utf-8?B?Q1lnWnpGRXZCSUQzNFB4U0pKdVZFMDZHY2ZEVnZIT2VFTWhMaGdNL3RVa1pu?=
 =?utf-8?B?ci91TDgwZ1VwZ1JpZDBFU3JsSmNVaVV6cldPRDh5U296TU5xWG1sWE5uYTJM?=
 =?utf-8?B?S0NnbXJhKzhiV2gvNGQ5NmJ2dXYvOTQvM3dwdEVkSklXb0ZCVTZ1cUlRMHBF?=
 =?utf-8?B?bHdiQzEwTmZDUWJtbCticDB1MTVlOTJCT1FORmU3MVhUYjNPWDRkRW5kUXpD?=
 =?utf-8?B?RFkrR092VmFXTVZQUUs4bUtGVjVoWUhqejJ1NE1NZVNYNmJqN3UzUk0ycTlM?=
 =?utf-8?B?K3ljMmMwTWthZ29EejhEYWVvQVg0ekRhcGZNR0ladkdQZHR6ekFKTFZhazZO?=
 =?utf-8?B?Q21UOGtZQzZSRGJrVjlhSjBqMk05aFE2Q0lzd3RXb0hLNDdFaEFUTU9oL1dI?=
 =?utf-8?B?Qm0vUFNXdWV2RVJIR2ZqWURtMXQwQVVhc0FEWFU2WlpVM0l5NzJnRFdHWTB3?=
 =?utf-8?B?ZGpYQnAxMVFZVHphTHJHSUhhRmpPTmxNaTZkR2xxMDhTTHFQN29XQTV2OFlX?=
 =?utf-8?B?YURibFY3QWFFNjRCNkV5dmt0MXEzcDd3RW8wbk82RnJhNEFYdmltdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c1f672-32b9-42f3-bd26-08da1b9f0906
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:38:29.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csmPmRu9IfhsmFRAiiupboI+d5QlhJnhbeom7yBAKFqwq8wiOMpFo+/azqILBlx+Ouiu2JrK3fRuh7OQJ0BxDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

To handle phantom devices, several functions are passed separate "devfn"
arguments besides a PCI device. In such cases we want to log the phantom
device's coordinates instead of the main one's. (Note that not all of
the instances being changed are fallout from the referenced commit.)

Fixes: 1ee1441835f4 ("print: introduce a format specifier for pci_sbdf_t")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -291,7 +291,8 @@ void amd_iommu_flush_iotlb(u8 devfn, con
 
     if ( !iommu )
     {
-        AMD_IOMMU_WARN("can't find IOMMU for %pp\n", &pdev->sbdf);
+        AMD_IOMMU_WARN("can't find IOMMU for %pp\n",
+                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn));
         return;
     }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -461,7 +461,7 @@ static int cf_check reassign_device(
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %pd\n",
-                       &pdev->sbdf, target);
+                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn), target);
         return -ENODEV;
     }
 
@@ -497,8 +497,8 @@ static int cf_check reassign_device(
             return rc;
     }
 
-    AMD_IOMMU_DEBUG("Re-assign %pp from dom%d to dom%d\n",
-                    &pdev->sbdf, source->domain_id, target->domain_id);
+    AMD_IOMMU_DEBUG("Re-assign %pp from %pd to %pd\n",
+                    &PCI_SBDF3(pdev->seg, pdev->bus, devfn), source, target);
 
     return 0;
 }
@@ -575,7 +575,7 @@ static int cf_check amd_iommu_add_device
         }
 
         AMD_IOMMU_WARN("no IOMMU for %pp; cannot be handed to %pd\n",
-                        &pdev->sbdf, pdev->domain);
+                        &PCI_SBDF3(pdev->seg, pdev->bus, devfn), pdev->domain);
         return -ENODEV;
     }
 
@@ -618,7 +618,7 @@ static int cf_check amd_iommu_add_device
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map,
              0) )
         AMD_IOMMU_WARN("%pd: unity mapping failed for %pp\n",
-                       pdev->domain, &pdev->sbdf);
+                       pdev->domain, &PCI_SBDF2(pdev->seg, bdf));
 
     if ( iommu_quarantine && pdev->arch.pseudo_domid == DOMID_INVALID )
     {
@@ -651,7 +651,7 @@ static int cf_check amd_iommu_remove_dev
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from %pd\n",
-                        &pdev->sbdf, pdev->domain);
+                        &PCI_SBDF3(pdev->seg, pdev->bus, devfn), pdev->domain);
         return -ENODEV;
     }
 
@@ -664,7 +664,7 @@ static int cf_check amd_iommu_remove_dev
              pdev->domain,
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map) )
         AMD_IOMMU_WARN("%pd: unity unmapping failed for %pp\n",
-                       pdev->domain, &pdev->sbdf);
+                       pdev->domain, &PCI_SBDF2(pdev->seg, bdf));
 
     amd_iommu_quarantine_teardown(pdev);
 
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1406,7 +1406,7 @@ static int iommu_add_device(struct pci_d
         rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
         if ( rc )
             printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
-                   &pdev->sbdf, rc);
+                   &PCI_SBDF3(pdev->seg, pdev->bus, devfn), rc);
     }
 }
 
@@ -1451,7 +1451,8 @@ static int iommu_remove_device(struct pc
         if ( !rc )
             continue;
 
-        printk(XENLOG_ERR "IOMMU: remove %pp failed (%d)\n", &pdev->sbdf, rc);
+        printk(XENLOG_ERR "IOMMU: remove %pp failed (%d)\n",
+               &PCI_SBDF3(pdev->seg, pdev->bus, devfn), rc);
         return rc;
     }
 


