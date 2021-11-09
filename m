Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019CF44AFD3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223997.387019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSZ7-0000lM-UR; Tue, 09 Nov 2021 14:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223997.387019; Tue, 09 Nov 2021 14:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSZ7-0000iq-QC; Tue, 09 Nov 2021 14:57:37 +0000
Received: by outflank-mailman (input) for mailman id 223997;
 Tue, 09 Nov 2021 14:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkSZ5-0008Pr-Ov
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:57:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f584dec-416d-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 15:57:35 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-Eb4ZvnVmOR2JU3hFSdSl2w-1; Tue, 09 Nov 2021 15:57:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 14:57:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 14:57:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:20b:489::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 9 Nov 2021 14:57:31 +0000
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
X-Inumbo-ID: 5f584dec-416d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636469854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XXmDRcbmhNSOz+3m8n+EWENufFamtBOLA4E8m778Yc=;
	b=G+Cb5t+/OUsXTut729WkPjpQhFcYEoCj/Aml7V7tSKoa7+PehAg0XqbMhyX+LokyGXjT6d
	hTvfi//NKKHq0Qr7KqYA0H2dhJb1/TTPESBpzFF/sfyGytwcdTXuDpgMCqoBce2sf4esZw
	I0/shVtXk1yHt8jDD1qysxpqZQS88Xs=
X-MC-Unique: Eb4ZvnVmOR2JU3hFSdSl2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPcW05CP4itgA8lCOnYATYYmQ2E9r1OfUgBe+QJjv53E2mNxP3tQyHsJqpGPV183zh2GyJJABGDcw/CyrDqpPPZZhc9ThjlqKGE5Zs76JeoIx1WSMNw2Je6B/rwSiaHUKqEeMda0FEZJsGWkXHLD2N6I3FZCuYmzO6JW1P0EqOiMunspll2Jg85Oj3HnuzAc8C9wPUALg/tZM621Ln/QgMYwcAfr/+ORrmK3lUXYvjgkNKnOPGL5NQA1gp+WwZxjzDwD6TYJ9u/E6j1DAzDBm6R282jVDTQAUhf4ig5Htt4QveLJVjTUS9L7QmRZBoTrecZZzOL/sNQGdrQmeeu6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XXmDRcbmhNSOz+3m8n+EWENufFamtBOLA4E8m778Yc=;
 b=W/W8BrsZsaQyCVRRzqgxM97D47wWoOf7liHvAswQ11W4Ttt+ZkUj6yiOApS81VTtdfeLIsz5mcGHn0h6VgeDNda3eDdyzoLHYF+LVi76Yvt0RsBHSg/IlS2r5442Ns4NMoChjv0y9GcWzelZNAxdeIjGITzpxOmiIRQ0YqGfrXoDPoihq07Hzjm9LZNKPZN2Y9GJlj0/ZjcUhXItlmDGV24tibL9Hk8QeyBphnD8I+46aycVpOQzsxbOApNORfSfhV3nVnug4J8lBGLo1HFCSNujgI9OSSIH7IVAWWOa18zsirSBtKfiGvUoywLMXVG7hI7BiWyjYu5ZoprH27L4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35094014-1578-9db5-4635-c3ed45433a7b@suse.com>
Date: Tue, 9 Nov 2021 15:57:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 2/3][4.16?] VT-d: fix reduced page table levels support when
 sharing tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
In-Reply-To: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0035.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ad76bab-400d-45b4-83bd-08d9a39141ea
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33890E8A013702775F539D20B3929@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xy100UhqOgxPHtdZ5yAB8eDzR1NFKVHa2jksCCrMNtc8W8T/06bAzt7RL4ZczR9MshcxCR9W+nYqlFklSsXxhDLLc3J2JbHsk0OLbkbBCsuGfn0oH5Q9Q/ROozstp7wwU5xTLPXEZ+c8GwQR9KNK/Ohi0f7n7E9ETF6sB89ZNGz0rR5Bbt2/kkykkoky2iNQHms5jEWYtprqIW4ghBZtJGKLE9FCr/BUgPt8iDwpVpBKbfeEfxKxUgMN+I3yF5TJwUdLSXypuyLISOrr0iO8kUAh2T5wCHD/ydUzigXxzZyJBDM8PxiwjNwVf/TKshEkDGzs9reic57Ou2rzz/NYE8oYpM6LBCenmfSfcZ4jvuidHn2/xGkGhH0+Gt/cgzfYLW1MNw3ntVD4XrPDw9gH83lVLXzMO5hAGQ4NDXTCg+kg/C08nUDtA1Kz126cp48JQKe8NzS0tnIQLu8AglPruJng/5Fl/rcIN9P0mQkX4UjNlrTSHoq20Prp7RmMLRpmydpR5ZjbfF9O3Gb5Zm/LilAHMdLT26vKhpG7qKLJtmDppu9T7gxeIfYNVj85inCsbsdyRp+8vB1SRr0paay8K19mRLo7JxkUnYDVNUn1N7EqfdqbDI6NmxlBMNG/7oC6xCCwxtlx4Yd+AX20yU9awHheixq16q+v8JIPvk3RmKPLrplxjaHRsk0jnkKd7zztiQQSejA76OjQ2JIKeWO9tXmbLp5Z5VGQ5SI1AzNivNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8676002)(8936002)(16576012)(2616005)(6486002)(66476007)(66946007)(66556008)(31686004)(38100700002)(316002)(86362001)(2906002)(54906003)(5660300002)(186003)(6916009)(4326008)(31696002)(36756003)(26005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFM1WmZma1JKWjhxdDJvWGoxanVZd3JxMGlra2IyWWowLzZVZWFjckdOei9B?=
 =?utf-8?B?N0FTQ0NSaUxVdE50MzI2WnJ3Yk51eFBSMmxSUm1EaEV0ZC9qR21HL0FFbnJH?=
 =?utf-8?B?NnNjZXJ6V1VwZTNUNHV4V0JaVTZjSk5XV0p0NlRGSUtqTUNMZ2xwKzlrNmlS?=
 =?utf-8?B?WWpuSmxnRzVsOVUrMGdWNVA2T1Vyd0czdlB3eDl1a1hjSFBuYk1kRndneEJm?=
 =?utf-8?B?U1g4KzFRM2RtWXlyT0kwb0ljK2pNZEJnd3pwVWxzeUlsSzA3SERSM0FoOGor?=
 =?utf-8?B?TTRUOUlRa0dOVmo4SUU5WHFVWWdwbTN2anJNaVo1QlB2R0JTNkZucm9yc3Ji?=
 =?utf-8?B?NUFCV2g3TWxEbm12elpqZllFeVd5Z2RVd0llamY2ZldIU2o2cnA3dVhtZE4r?=
 =?utf-8?B?ZytmN3MzRmFpREpDWW41NTQxenJjRTRGdlpGT2xYcmorL3hvbkM0c0J0ZzFl?=
 =?utf-8?B?QzdYMCsxK2tCVEpnSWRVeTNTRTJ6RVNGSVpuc1JaZlhGdUVtTFYxWUpQTmZ6?=
 =?utf-8?B?VkdxTzdncVhjR3lXWkRiNjRPSmtib1hWdDhmN3dwTzA4bDlWeE1idlZ3Z3Y3?=
 =?utf-8?B?TktPSVBrVk91eUk1RVdJZWw2c3F4eTlGWnlxL0Q0cDBPTi8rZmM4U2xQQWFi?=
 =?utf-8?B?WUM2TDN0cGtsK1pFQUU5dzJGdWtmYkJFTHdEeUpLVkF0T1JncDNRNDF3RWh4?=
 =?utf-8?B?L0VIVlptc3l6Zk5qU2FSSDUyRjJORGhGZVpHeXJQZFF4YStSdWZBdFIxVnZB?=
 =?utf-8?B?NHJwSzFrZW85MitsMmlOMUhyM2NZOG82OThZODNUMy95V2Y3NXZuYWd2MTNZ?=
 =?utf-8?B?SVMvUXhrL3FVNlBhUzhtaGIzNUYvUEQ3cWNtUWhkL1JVeUJaMnFBM3lsMVFM?=
 =?utf-8?B?ZmR2MFBCZWxVMHJPS2k2bU5mVWRXZEtQdFA0eDlMdWJ5c2drVUQzQUlDakpE?=
 =?utf-8?B?R2lUeUNWblprbFd4Q0VBOURlVGVSVzdVN0pkOE4wci9DQVJtTFdpODVSWkw0?=
 =?utf-8?B?WXJZWmVvUENxbVdwUytOQnFzZW1tT2xybFNLYU4vZnNsTXlwUGE2RUw1dVIw?=
 =?utf-8?B?S2ZXMjN5U1grVFNXdHFlSkRaS1dXMEVwcG1EVVViVWF6cjZQVlBGS3VlUmtk?=
 =?utf-8?B?SUN2KzBzdkZxd2tIb2lUQkxLWTM0Q0lCSzZpdHdzNTZ0YVZTVmYxMEhKRG5q?=
 =?utf-8?B?V1A1N0Z2RW9Sd1FvWEllMHM3SU1qNjVRdnJsenROQXhpdlhaOE1haHV6VW5M?=
 =?utf-8?B?YjZIZ09jU1hPMXYvOTJOZmlBdXE2ZXJpcldVUHZ5Ny8vNDN0VkVySFdBTFBV?=
 =?utf-8?B?R3NHQlFkVzk4TWZ3UmYxenB6V2xqeE5RZi9DaTVOb2tmQUdBd21SdTdJdHBz?=
 =?utf-8?B?Q2x4czFYekxycURJYTZMY0xsdm50Wk9EdnVMVEhwb2VjMnlQSzNTbFE5YXY2?=
 =?utf-8?B?VUhIS3lHdWZ3RUU2d3dnZ0Jrb0lrWGFROGtFb0J3TFNteE44QzM5c2doUzNv?=
 =?utf-8?B?ZXY5M0pTbTFJdVc3OGdETXllZWhHU3BINUdFUFFtd0lHaHVKNWtRRDVMYWJ3?=
 =?utf-8?B?bkhlZE9DanMyU2E4UVBMZ2JOK0tRTHhlWXFLTGdELzR2Z1hvNENUdFBGS3Bk?=
 =?utf-8?B?aUNUNzB2M2xPVFJTZXVWS1U4YzIxcFFvVHJXK1pkZ2dsRTlKcy9ybEhuQW8v?=
 =?utf-8?B?VDJJQVpPY0lHM1NyejJUNENSZERTZHFUR3BPZ3ZWTnF0RkFkT1pGcHowbld0?=
 =?utf-8?B?a0Fha2ZqTDdWMHhtZGJsdG1ZSUFjR3NkaDRTNGU0MTdIS3dhYUdYOGlVbGZ4?=
 =?utf-8?B?dHN6MVQ1LzIvY3dnd09MTGdsRXF4WUZpTElIMUppYTNjbVFUNWJibjNIelJB?=
 =?utf-8?B?cTJuRHZ0RytzdDFkbEZ5RHROY1lqTUJ0TnpyMDRWZlg1YWhFZmlKRnorY1l2?=
 =?utf-8?B?OUVWZ3BqSFZVcXc0L2VaVERzMUNlS1hiOXc3Ulo4b0pXc3FqUGhCVEgvU05t?=
 =?utf-8?B?YTFxUnFVSnNJak90ZTdpYXhHSkNjN2NMZXR3YWJWVWYybStQZXB0WHZnZlJ3?=
 =?utf-8?B?dUM0K28vNkJMMXdlVEtaaW42bzNFd2pLTXd2TURKV2V2QVdXV285WFROclU5?=
 =?utf-8?B?TXpLMG4yS2hNWWVhRjFpcnBWemp1dFJVT3RqMFFvT1p3cHBBN2lITjR0elRT?=
 =?utf-8?Q?ytCbpfEfE7xNA+hXB2JtH2M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad76bab-400d-45b4-83bd-08d9a39141ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 14:57:32.2328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjLSOVcUG0Ln13Ie4IL63Ld/D6eWnWw/HNwTJkLE9iYcVcNhcxhMoJfCTcBMttGsVUB04stoQDvXESi+JxEptQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

domain_pgd_maddr() contains logic to adjust the root address to be put
in the context entry in case 4-level page tables aren't supported by an
IOMMU. This logic may not be bypassed when sharing page tables.

Fixes: 25ccd093425c ("iommu: remove the share_p2m operation")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -340,19 +340,21 @@ static uint64_t domain_pgd_maddr(struct
     {
         pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
 
-        return pagetable_get_paddr(pgt);
+        pgd_maddr = pagetable_get_paddr(pgt);
     }
-
-    if ( !hd->arch.vtd.pgd_maddr )
+    else
     {
-        /* Ensure we have pagetables allocated down to leaf PTE. */
-        addr_to_dma_page_maddr(d, 0, 1);
-
         if ( !hd->arch.vtd.pgd_maddr )
-            return 0;
-    }
+        {
+            /* Ensure we have pagetables allocated down to leaf PTE. */
+            addr_to_dma_page_maddr(d, 0, 1);
 
-    pgd_maddr = hd->arch.vtd.pgd_maddr;
+            if ( !hd->arch.vtd.pgd_maddr )
+                return 0;
+        }
+
+        pgd_maddr = hd->arch.vtd.pgd_maddr;
+    }
 
     /* Skip top levels of page tables for 2- and 3-level DRHDs. */
     for ( agaw = level_to_agaw(4);


