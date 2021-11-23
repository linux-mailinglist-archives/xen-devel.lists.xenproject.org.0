Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F445A3FE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 14:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229605.397051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW1R-0006a6-67; Tue, 23 Nov 2021 13:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229605.397051; Tue, 23 Nov 2021 13:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW1R-0006Wc-2b; Tue, 23 Nov 2021 13:39:45 +0000
Received: by outflank-mailman (input) for mailman id 229605;
 Tue, 23 Nov 2021 13:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpW1O-0005zm-Tu
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 13:39:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfeb60e2-4c62-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 14:39:42 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-q3U3v-FHOwame6kRf4RtIA-1; Tue, 23 Nov 2021 14:39:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 13:39:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 13:39:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0028.eurprd03.prod.outlook.com (2603:10a6:20b:130::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 13:39:39 +0000
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
X-Inumbo-ID: cfeb60e2-4c62-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637674781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTVWcpgaN5RHhZXfVu5ub8/JYsiP0odQFTntwSRApa0=;
	b=CyebUsNnAxyqypaB3P+Q8DfK2Jf1OrGLSjcV/5iStJD99epD8dHXAOfzAYa6qv5TOd8lvS
	Ksdaio6NO/5XmsethlD/kmedL3xppZeUcBYZggdo01PbIqmk0RQz3WsfrLmgX/8Q6hkW2O
	EQnIEF6SkdBh00q1ANsq49kdUYtco5k=
X-MC-Unique: q3U3v-FHOwame6kRf4RtIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8j9p7I8Wx84jFOj2U8bcWWNLUrr6LbvIXfypckMNEFZ78qZ665pHshKVYxAjRHOv3gDqbxRXyFQzgPf0QEkhFGPHhXvKb4KsQ6JxNxVZUGJ6bzH3n49QJwbWI8UCSnyRyG9WNgbeEtDajYsTwi5MumdqSBxvz3/PAXV4cmmQfIaPKeSf3FoA1UGWEOrlXgsIySwc/A3Xwc4l3ztKW7BcSdDLqih6+Gu7lI8oXNTj0KwXEGG1TXAzXeoOKvc58CzotFOGgb3AXUZHYM8mgTyIJP3YLVEPtbBl2X7WNQEFaM4iOCjPl7xOkUjFj5YqJPP63uhvKu8o1fhQM0KttnK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTVWcpgaN5RHhZXfVu5ub8/JYsiP0odQFTntwSRApa0=;
 b=IH2cVGt8Tg6wVdbEgiHhvCcoRCIj5CWZXMUHKO88cXXx96vTEiyAFaQI4p5iv6naNNOM66uALAYz+i9YWQgdZzGFvzCNPiW9rcQEb75Eby0iK4VZ8IGzYKrQjwYmfDv59uOqU5k0Qig1HXRxbC43wrnx2ttY8n54dHPUtXYwR+wzMCKM7sNYZK2mjnsmTrzfekdrvheJqVyWaJNNnJnq8gqZol5aIfSj8ejwSgExEYeisWy2cqrMMuPuiAdOv3rel5OheVfLaugTAqe2gvb5EYHkM57YzqCGO/HDmzLjbsnHh93Y2FPpEmaW0XZo8pmvaZNRMaPt0HSxQ57AGC4ZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e801190-ad7e-32da-da87-985e1b6a76bd@suse.com>
Date: Tue, 23 Nov 2021 14:39:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: [PATCH 1/3] VT-d: prune SAGAW recognition
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
In-Reply-To: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40a898b2-9ed7-432e-4bb8-08d9ae86b2c0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325EA307318B096A068F453B3609@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qYlONdBEQGCbDEHbWLxKS9q0SbDY3xIIzOCwuinob+PlpJ/FNGIbj3RcquBdgvEnbbjeVFeqPiBMANTQxpzkKVGhIQ/rOfEcHR3n/Hh16tmpMAzD8KF+qnspIsy9avSiICaqI4z/AzoH4DWnzFasXECaxzOJTsX50hgsjmhTgsV8Eq6ap3GENgTWAUsMknRa3MXWzwAl3seGeIk9z3LBhDSl6BuVfZBJonBbjgEFxW/DQ/gckIFKNHa4ERnRx84NiMtR5K1NDnAkgHYtROEvNEDsgRqr+wjfqCM7A1q8sH7FhuFOKj3r8mpMneaBz+yKfJk9UdI7hds+9WFhnPuDTYrSg0amGcn8FqH9a6wHIrZHgCbBPAN+WNOCv5lVUYbD+3fGS3mvJm3LCpS+8ThtaJ0dQZWhcuvH+WYiJN5aS3ZdVnUaWWGScQMnf6C7Xod75UR1yWGhQQM4ZIMEEscj6knh8vWyeiUZcmJDXhmbHTjl1ajGb8dzS/ShCWJRmq1BDtiHaNhglPFacOzS3VNXRtn43/o/o+m3QihOJsIMvthngX3ytjJxIlrFmzzjZMxsjwE4lpkJxSEyY3/XTar0QIOHhRvnnnpwGw/+ZVYTSdaHaC5p3NtDsRpILApHBrp0sWezkZJmRkRh/EYU1rDmuqCxXOiS+9Mto9EnBnTfcfFWqWCWNQUC53MMuuim37aaKVW/vVHnBZlb8V5Pvg9UMEMM8t4jf4UKhZbUQabcLBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2616005)(66476007)(4326008)(2906002)(6916009)(36756003)(316002)(66946007)(6486002)(186003)(16576012)(31696002)(5660300002)(508600001)(8936002)(38100700002)(26005)(8676002)(66556008)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxrQVp2MHZaKzRxMHRaK0FJdFVuRHI4bUp4T3JTY1pFYmpjaXlmQWh3SitM?=
 =?utf-8?B?N3h2MXgyT0VxU0RuV3U5NmNKQVlQR21FbEhWV2x4bnRMZEdML0I3dFNkSzlW?=
 =?utf-8?B?TWlUYk50Y000bFk1U3Z6OWRxTDRQcGIvYnl5SjIySVRiRzd0NjJUT2tOQURp?=
 =?utf-8?B?aFUwZmRsUStiQVJqRWJJTk9aVTA3YTlGY3U0N2Vrb1hlQXo5UTZQRWh0WlJZ?=
 =?utf-8?B?WS8wZlQ2ME9zdmZYQmltZEUwU3NwNnFOa3d3cnlKWTZ1dXBsVVpZay9VeGxs?=
 =?utf-8?B?VEE2Z2thTHVlZkZVWDAvVjkzQ3pjNGN0VkZlR0dQZURKNytTQ1NVWHpacmp2?=
 =?utf-8?B?S2tiNlUycXpneDg3bU0rSERiRDBBSElxUTRVWjc3clNTZkVlcFVmNGdOK3B0?=
 =?utf-8?B?ZUpIVWczcGpkVmdyTDE3OWQ3NmpuUHBDS2diRVJRd2hRYjQrMkZSdStvZUJy?=
 =?utf-8?B?bklOMVRTeW5EVjFsSzRtQXE5Wjk3UW8xWFgyNmdyTTc1Szd2cFpsQTBkeUE1?=
 =?utf-8?B?QmJYZExhZzZlNXZUSFlPd2h0VVlCQkw2d25QemU2UmFrNHVES3BxUW9ORkly?=
 =?utf-8?B?MU16U0JyWjMxMnZkS0k3YllkUDlvdFJ3dmxBV25YM1FuUnc4R0ZORVE2RnEx?=
 =?utf-8?B?SGZJNzNVejRMaUVlZ0NRT2JpRDZHVnpvVW5jOHNwOXJFdmhOWHBzQWQyeDFX?=
 =?utf-8?B?a0cwZ3M5dEk3YUtzMTBFRjUrWjlFR2hyRmhleVZ0Z0xlQnliU3hubms4TmZV?=
 =?utf-8?B?bDJrcnlhNXM0TDVKblc0V1BBaWlOKzZOVlBCM0V1NW0xcC92ZnMrRG0vVVZw?=
 =?utf-8?B?RXZUY2liaEMyU2o5eGJ0TEtjdkp0QWhvbjRSbkVHOWlzek4zSnVBbndHV0pG?=
 =?utf-8?B?b01pZXFEZGsxaTY3UEJKZzd3c2JQNE42aGtwU0p1cGg0NFozNTNPKzZ2TGxB?=
 =?utf-8?B?Q2Yxc0oxSkJvUlppTzhPMmRZby85Ymd3dys3UkFTZXc3REEvbGNDcU5HTW5i?=
 =?utf-8?B?QVVSUmx2L2tVOXlYVUFUOEdaWDI5MVpoRkVFYUd0YnJsUGpiOUdKNDdCUmYz?=
 =?utf-8?B?eVpLUHM3dTYyT1REQjJmT01Reks3OFFvdk1CZlhOZTZleS9QY0hmS1BndEVV?=
 =?utf-8?B?bk04UEJHWnQyVWRxbFpFZ296eVF3dDZQNnU4NVVYdXVocTFacE10d1dIUitU?=
 =?utf-8?B?MXVoZHFvTXR4eTRKekY1UVNWUE10ZUdVSDEzUjR6MUF1MjBNV0ZYWmkzdm56?=
 =?utf-8?B?ay8zdTlFbGUxYytiTnRZeHNCR3BXeERLTUowWWk3cTVqTXU2TjNBNlRFSWN6?=
 =?utf-8?B?eG8yaDR3TnY4eGI3TWxnQnpyaTNPTVNxTWVZQ1lVRTc4K0cvQVM2MUlLbjlL?=
 =?utf-8?B?cFhLVG05NE1MallmSE40QmZFZ3lEbHdWeXBBUDlJYjZ1MmM2KzNNbTA0Z3BV?=
 =?utf-8?B?Z0NndFdzNVQ4Z0h5WTJJSElWNmlIaWpHQ1NUK1ZpR1BsSXV1dmE1cU1NMnNJ?=
 =?utf-8?B?MGdqYmdBclBvaFZSNC9vMXRXZ2dRUThZVTNIZi9MUHdlVm8vUzBLWC9oYS96?=
 =?utf-8?B?WUZvc0tPYzZ0VHlqZVBoTm90eERzNlJVakFkU0NQK1Q1TUVua1JFY2w5RHg4?=
 =?utf-8?B?UGlhL29YVUdRRk5YNVVQWlp6SzA3OHhKVnJSZEVaazNmNEUvZWZqTlJxd3Zu?=
 =?utf-8?B?VDl5WW1DdVNDRU9vTlJNbklMcHNwMzJKa21RZXhPUFUrZVdUVWlvTTMvK1lt?=
 =?utf-8?B?Wm4vS1cwOVZZdU5RREE0Q25aZGN2QUN2UkdWdk9LUjN0ZVg0TFBPSzIvTnBG?=
 =?utf-8?B?VUIzVkpyQ1VoY2ZUdUxMeTNrMk9HREQvNXBwdkczdU5rUjl6UTBNYXI1eVRK?=
 =?utf-8?B?U3ZZeCt0WkdLeFpSMDZ0QkdkUnhTdGRhMkp5am4wd2N3K0FFQ1lwdENZVExh?=
 =?utf-8?B?Ly90NXhleCtzZ24wdnZPUW5kbDhFdmkyaTJOQ1hQUDZsT0dndkdCNXpIUUVj?=
 =?utf-8?B?ek5JTFJwZElncVZOWnk0RnN1Zjhkc1VxaG8zV1NTRnArSis0K3BvMi9YV29y?=
 =?utf-8?B?alpTTDJQTSsrOU04NjY2RU11eFRPTEZIYnh3YTBpdHdTZjFDU1J3ZlRFQWJN?=
 =?utf-8?B?NTFyemVrczhoNEdESnBlRnIyM1BWcldoeE9uVjVoVFAzNGFocEdqZ0pOQmw1?=
 =?utf-8?Q?Bwy3Wj6vPtdH9wW0EKefhWU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a898b2-9ed7-432e-4bb8-08d9ae86b2c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 13:39:39.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KV8phmLh3izguW8uSKD7vJOR8vqIlb3ij7/ZC3BwL2/8XjprNGwtzK1Ec8yEYCDbyrCB8Ynmrm0UGvBlxiyJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

Bit 0 of the capability register field has become reserved at or before
spec version 2.2. Treat it as such. Replace the effective open-coding of
find_first_set_bit(). Adjust local variable types.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking IOMMUs supporting only 3-level tables ought to result
in guests seeing a suitably reduced physical address width in CPUID.
And then the same would apply to restrictions resulting from MGAW.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -356,7 +356,7 @@ static uint64_t domain_pgd_maddr(struct
         pgd_maddr = hd->arch.vtd.pgd_maddr;
     }
 
-    /* Skip top levels of page tables for 2- and 3-level DRHDs. */
+    /* Skip top level(s) of page tables for less-than-maximum level DRHDs. */
     for ( agaw = level_to_agaw(4);
           agaw != level_to_agaw(nr_pt_levels);
           agaw-- )
@@ -1183,8 +1183,7 @@ static int __init iommu_set_interrupt(st
 int __init iommu_alloc(struct acpi_drhd_unit *drhd)
 {
     struct vtd_iommu *iommu;
-    unsigned long sagaw, nr_dom;
-    int agaw;
+    unsigned int sagaw, agaw = 0, nr_dom;
 
     iommu = xzalloc(struct vtd_iommu);
     if ( iommu == NULL )
@@ -1237,14 +1236,13 @@ int __init iommu_alloc(struct acpi_drhd_
         return -ENODEV;
     }
 
-    /* Calculate number of pagetable levels: between 2 and 4. */
+    /* Calculate number of pagetable levels: 3 or 4. */
     sagaw = cap_sagaw(iommu->cap);
-    for ( agaw = level_to_agaw(4); agaw >= 0; agaw-- )
-        if ( test_bit(agaw, &sagaw) )
-            break;
-    if ( agaw < 0 )
+    if ( sagaw & 6 )
+        agaw = find_first_set_bit(sagaw & 6);
+    if ( !agaw )
     {
-        printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %lx\n", sagaw);
+        printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
         print_iommu_regs(drhd);
         return -ENODEV;
     }


