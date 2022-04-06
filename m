Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FB4F5DD7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299831.511052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4iG-0006t7-Cj; Wed, 06 Apr 2022 12:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299831.511052; Wed, 06 Apr 2022 12:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4iG-0006rI-9h; Wed, 06 Apr 2022 12:24:40 +0000
Received: by outflank-mailman (input) for mailman id 299831;
 Wed, 06 Apr 2022 12:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc4iE-0006rC-OJ
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:24:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86175df8-b5a4-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 14:24:37 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-i0tqvcT5NP2GDc_Fn25qFA-1; Wed, 06 Apr 2022 14:24:35 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 12:24:34 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 12:24:34 +0000
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
X-Inumbo-ID: 86175df8-b5a4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649247877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1H79nwsMeW3yxZjDR3qBFbh8QW9Tvu6xAmwomlRz84=;
	b=eND6D2zGIOQcj1HJ4LRJfrDO6ycyzDO9L+zN/eMJl56UVwIoMxF0ru2P9tkzvKOG5XwkZ5
	T0fH//jflxUSrCCwrHVAONWHXx+rps51uucmXVqvXbzhe6zxQJ0AdtvCKIiMJOsDcU2ITF
	69en9OkBwjvoCbA/VIwCZ+yLTEEqmoc=
X-MC-Unique: i0tqvcT5NP2GDc_Fn25qFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvGLn0QSXzHU/kbCVpRHZUVil0sBDFA3w0fdumkuRGxlDihk7b/HsbmdOMsIUtieHdAm7UUbBvNr5b71/T4H7v7agwgBxIV9tYc7slpquOvMCC5LQRJT7wLWT+takgHBa50tnnnucad6d6vhkPKb7K3cumTbJMryUy4Ve0gx/i+etIaHIz69SI7b/jZh1vN+mNCC3Or+wKRwKsaOAXnBO9+URvbbbCoucfelJD4+vWgUsk2aTnJMPK13rL1E8HAwkOuz/7fCkQPzfS6c2p5Ma923ShPPvniBvD7ihtekW4MDusetR2tOCRofnprZSTRFtc6S33B75LDRS4QgyRKUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1H79nwsMeW3yxZjDR3qBFbh8QW9Tvu6xAmwomlRz84=;
 b=higyzMtdPQU4xDsL+aovMUgTgl6u/o4rlS5ntv4MDXjU5SbTQOeOpjJJNx6WqlK6H82gJpTJUCmrlGC8uwf/MDxnI6+/oLB/jAtQID3R1ECOevwWPtIrY2ZkS9jc9HzAXiW+gHwHnIq/1KnTS25vdZYyG76DEJqokIgduG1Nhy6cN9tibFd5bJFOXi5asiTrVcSL2NlFo6LeHgrD+f+1+TuIOkiw/7+pqWE50WFdOZ76KwM5uO48co2zKkUBJuIeJ3AeepAoOtbvrDC0DiQbMKRByhXIPLfNAWsmwb7EzC/5IkBKmib0GOFedcubmDhPJd/7mzZ0CIw84Vvu8dGhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d232b6bd-17d2-c78f-49e1-67ffc2502810@suse.com>
Date: Wed, 6 Apr 2022 14:24:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH 1/2] VT-d: avoid NULL deref on domain_context_mapping_one()
 error paths
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
In-Reply-To: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e67ae826-38f2-419f-bead-08da17c86881
X-MS-TrafficTypeDiagnostic: PAXPR04MB9326:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB932661D2ACDA217554B69A02B3E79@PAXPR04MB9326.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AEr2ZtqU/y3UibKYS4HcLP9S7D9zaGD2EYhJ9xKq2EZSgfdiYOrkWaB0uGnbbDv8zCqRztllXdwlpXNQKS+yuIU5ZmxOWZrv+dZmnWESbqjKmh+66GbzsWeFAoh2S8rPErFoY2slfsajUazwdM7oJqbm0x+NLWfILBmWFgHj/cZsOBou+wjEz1euwF7S6nxolcu0ZYgOx7WfcShn1hazkk9QnIInXgZjXc5cp7T0fVVvKnqSXhZTzZm6lHTetRk4dw3ecSBguMCMCPgoto3X+plPxkCGSx5D2RuGmIhtp9xykMjjkLR+97JEm1usbGFe35u/IBZs2m3UICuOMcXb5mhlqGDD4JKkBKM7oGXuIAflC/RrZuK1Y3o1UBcxBISRmNF6r/rAaR8AvI4gzw5urcwAEoTVWTyLoYGwn6cb93UktA/hLF+Jevasm1JNWj6MT5+nRn8QvEA2FfjwAqDhqEuGZlXqaHIZDYPYd3ytDZn2kduKf4+EKTpDTNmS60Od2v7vffX6B7APLCUN6Uqx44i4FySKkqIw02tPgqkznvIvkjo1THpVbS3zQCR4TJ08T0zEEi/rrqb86Qi51kn46PrwuGhY8dUyohvM9IKtgp218K9x+r/d13vguOThDuHGnt7uRCJKRH1PQa8gzZejqYuVvK4aiqWTySCkwl9vWUL7S2LCizUN7l3w11hHoW4xngFdh5vbFr7WO2/RdaMs2zVs/9oluyYXjfJ8/4Qcc+B5yUtxw590NAonZBRiG5XK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(26005)(316002)(2616005)(6506007)(6512007)(31686004)(36756003)(6486002)(54906003)(6916009)(508600001)(2906002)(31696002)(86362001)(66476007)(8676002)(4326008)(66556008)(66946007)(38100700002)(83380400001)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEJBbnlYcVRnSzVVaFJpR3FBcVNtRFg1QmVzSVJ6M2s1ZHNFQ0VFdjJXa1Nv?=
 =?utf-8?B?ZDA2V2I3eHJHTWVxMzRvTEdkVDEzdkJwR2JES094TXA4Q2dMZEZNVmdqL21U?=
 =?utf-8?B?ejB3dEhUWWRwRXlmOW1McThMYkNVWEF5Vk10ZytOeHdpUnozczBxYUlBcEZL?=
 =?utf-8?B?TGRnSXFrVDY4Ri9FMGU4MG55RWErUStOTXdHNUJRNElCeHd5eEhsaGE2VkRN?=
 =?utf-8?B?aWI3SEQxbmgyOEZQYkgzbGNraENMeEpoZTFaKzdlakJpRDlHdnlJakZ3TzR6?=
 =?utf-8?B?R2E1Mk5tMDJHNzdpZ3FpcjdXdE9JaWVycFhSMWU1Yms3ZnBpV2hLc3BOQ3Y4?=
 =?utf-8?B?TTRja3pHUkF5QTRUc0c1eGg5bGprNWlXbVVZYUxDOXVkYTlJTFZmcWE5bVRJ?=
 =?utf-8?B?TjNrTHVFOWk3VDdCTUlOT2I0WDZwOWxuR21iRm1FeXhrcjVFVnpwZVBtVzk1?=
 =?utf-8?B?N3cxS3BlZW9PQzVLY2JVcEEwd2k3R2M3U3IvVEw3NXpUZ2xjRXNxdUxVTWwv?=
 =?utf-8?B?QTB2bFJMUTUraTRKU3BWc2plN0JJOWRYelJSUmJVcGgwS2NMMXRNK3VaOUpx?=
 =?utf-8?B?Uk9abmR6bXFoYXBhWUFGdGVlZlY2aHlySnBEekdDR1RjejZEMHJNTmpVaDBn?=
 =?utf-8?B?TUZjV2VMKzRadndKZUFMS09uczU0NVZ0NVVscjkwN01nOG16M1VBRnFoZXEx?=
 =?utf-8?B?ZGQ2TWNpcDl6WVpXWjlQRWxyRUZNVkcrTmh4U0l4aCs4Qkl2MVZ3RTRRV3M5?=
 =?utf-8?B?YW5pb1Y4NnVvOGZ0dXZNbG16QnFickFiWTlQQ20wZFhPMlZGZHFsMEJqYnBG?=
 =?utf-8?B?UGJBTWdMTkZMWmUwOWFsN045WWJacGNGSGp5eStBejhHRFNtYzhaMzlmQmFm?=
 =?utf-8?B?QU5pQ240KzY5REh5blJPdnRUendXOE1KNWFUQXdMaVpxWjhwVjVOQkpDbmha?=
 =?utf-8?B?ZG1FVnlmTDJKdzVYN2JLWW5MVGlrUFdXYkY5NmRaZytPUjhEdUVsMzdYTVp1?=
 =?utf-8?B?bVZnWlBzeUpybjRFYmo5Y3dPZkY2Sk9yTUpodmNUKzJuaHdCdnBOcVBFdzVE?=
 =?utf-8?B?ZE45c3AyeE14SVRSN2djRTlLRkY3d20xWXU5cHVaNEJtZkNUSUlseUFhYnJS?=
 =?utf-8?B?dXZGZXVVLzlQNWM0M3BBd2laam45bTNYbVBsNEFvb08wR2hRR1VpdW1YV0My?=
 =?utf-8?B?aHZUeVQ5VzRDTUhiVUFzRWRwZ1BjRFM3c2NjUkRBQUtPV29uUGZvNVJHY2pM?=
 =?utf-8?B?TVU1SGZST2hETkFqZlJobkxLOW96WVFWZXBRaHBHQVNGLzF0LzJ3QWlBcG9P?=
 =?utf-8?B?SGNjTnc0VG1LTDJ3UTEyQmdHdFhMMkdWK2FrTXBPb1orc3ptMEUrTkV5ZHZM?=
 =?utf-8?B?cmh3YXBmUjk3dTR1M054TnNUK09STE9meGM4QzJqbUFuN2NFWEluWHJQaVNn?=
 =?utf-8?B?NmY0YjVTLzFOMWh2T2tiU0RPRmxYRVBMSy9LMGsvK1VVUytWU3JGcTFQOVg3?=
 =?utf-8?B?MjJIK0thcU5nWU01ZW1veW1xdGpJelJvL2xuQ003YkJlQUk2dFpuOUZOamFt?=
 =?utf-8?B?VGJQRHFONS9yU2NGdldyQW9BVXFRZjVYMTFZQUFzdmU0MmFydkMxWDN6TTlX?=
 =?utf-8?B?c0N4ZnF5amJPU2dPQ0ZjY2QraHNzZjFyVGV6M1pyS3ZDa0VMSE9hbzBNS0lD?=
 =?utf-8?B?SzRRQ1FFbUJERC9MYlkxQ016NENqRTFGYThaS2QwMEpxbGlIc0czQUM4cFY3?=
 =?utf-8?B?RXhsVFNkOC9pdmVOMkJCWEZrcVJETE80Q0NuV2p2c2tYQlJUcCtsNEZwTWlI?=
 =?utf-8?B?SkUxOEMyTDJnSk9jRmxJUTlwOUxTajhScmdXbWN3NThLMHBYVXBqK3dMYTZ2?=
 =?utf-8?B?VThjUkJzTkFTNTNuZktDOUFwSGhDWDQrOHNMTDJaWklvOFFIQVVYQ0Vhc3E4?=
 =?utf-8?B?Vlk3SUpWUHhaVDJKc0M1MXN5bEc4N2RxUkd1cVo0a3BlYjQwRVhXYkVYSFhB?=
 =?utf-8?B?SXdVa29qd1dqRDd6alQ4aitxVU43NkY0b2hScGlRRlJtL3U1WThJSnZYdlIr?=
 =?utf-8?B?NkdGSkpiRE4wd1lQbXAvUWlRSXJ6VXoyZnZzc3ViMkk3cFQzcldxRUxnblY1?=
 =?utf-8?B?ZjhtSmJ4UUZuS212dElmOUdSUFdDbjRybWR5R1NiK0lMWXRDZnRhWlhKaFZE?=
 =?utf-8?B?djRweWVoZEkvNHlNdnJsWDNQMjExRFJqb0JZVFh4UXVKbHJpY0ZFMno0eEdI?=
 =?utf-8?B?Rzg5UHE4cFRkRzZnRmRJazZka1NiN1dpWDRVaVNJUFlkTEFnS1pMYm9WRGpz?=
 =?utf-8?B?SUNGWVZFWkJzMG9iTjlxMktBT1ZnNmZqVmh3QjFkRklvc3MrWTM3QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67ae826-38f2-419f-bead-08da17c86881
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 12:24:34.2140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IfpHeMbB0sanWakkvum4kPAsxjl+46m2wxNR1Ft/hzmhXeWnBmXi3TdqkDwewdW9D0ClSmd3wvkN2ImVBxbHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326

First there's a printk() which actually wrongly uses pdev in the first
place: We want to log the coordinates of the (perhaps fake) device
acted upon, which may not be pdev.

Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
device quarantine page tables (part I)") to add a domid_t parameter to
domain_context_unmap_one(): It's only used to pass back here via
me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.

Finally there's the invocation of domain_context_mapping_one(), which
needs to be passed the correct domain ID. Avoid taking that path when
pdev is NULL and the quarantine state is what would need restoring to.
This means we can't security-support PCI devices with RMRRs (if such
exist in practice) any longer.

Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quarantining")
Coverity ID: 1503784
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -750,6 +750,10 @@ However, this feature can still confer s
 when used to remove drivers and backends from domain 0
 (i.e., Driver Domains).
 
+On VT-d (Intel hardware) passing through plain PCI (or PCI-X) devices
+when they have associated Reserved Memory Regions (RMRRs)
+is not security supported, if such a combination exists in the first place.
+
 ### x86/Multiple IOREQ servers
 
 An IOREQ server provides emulated devices to HVM and PVH guests.
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -85,7 +85,7 @@ int domain_context_mapping_one(struct do
                                const struct pci_dev *pdev, domid_t domid,
                                paddr_t pgd_maddr, unsigned int mode);
 int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
-                             uint8_t bus, uint8_t devfn, domid_t domid);
+                             uint8_t bus, uint8_t devfn);
 int cf_check intel_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt);
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1533,7 +1533,7 @@ int domain_context_mapping_one(
                 check_cleanup_domid_map(domain, pdev, iommu);
             printk(XENLOG_ERR
                    "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF3(pdev->seg, pdev->bus, devfn),
+                   &PCI_SBDF3(seg, bus, devfn),
                    (uint64_t)(res >> 64), (uint64_t)res,
                    (uint64_t)(old >> 64), (uint64_t)old);
             rc = -EILSEQ;
@@ -1601,9 +1601,13 @@ int domain_context_mapping_one(
 
     if ( rc )
     {
-        if ( !prev_dom )
-            ret = domain_context_unmap_one(domain, iommu, bus, devfn,
-                                           DEVICE_DOMID(domain, pdev));
+        if ( !prev_dom ||
+             /*
+              * Unmapping here means PCI devices with RMRRs (if such exist)
+              * will cause problems if such a region was actually accessed.
+              */
+             (prev_dom == dom_io && !pdev) )
+            ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         else if ( prev_dom != domain ) /* Avoid infinite recursion. */
             ret = domain_context_mapping_one(prev_dom, iommu, bus, devfn, pdev,
                                              DEVICE_DOMID(prev_dom, pdev),
@@ -1809,7 +1813,7 @@ static int domain_context_mapping(struct
 int domain_context_unmap_one(
     struct domain *domain,
     struct vtd_iommu *iommu,
-    uint8_t bus, uint8_t devfn, domid_t domid)
+    uint8_t bus, uint8_t devfn)
 {
     struct context_entry *context, *context_entries;
     u64 maddr;
@@ -1867,7 +1871,8 @@ int domain_context_unmap_one(
     unmap_vtd_domain_page(context_entries);
 
     if ( !iommu->drhd->segment && !rc )
-        rc = me_wifi_quirk(domain, bus, devfn, domid, 0, UNMAP_ME_PHANTOM_FUNC);
+        rc = me_wifi_quirk(domain, bus, devfn, DOMID_INVALID, 0,
+                           UNMAP_ME_PHANTOM_FUNC);
 
     if ( rc && !is_hardware_domain(domain) && domain != dom_io )
     {
@@ -1916,8 +1921,7 @@ static const struct acpi_drhd_unit *doma
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn,
-                                       DEVICE_DOMID(domain, pdev));
+        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
             disable_ats_device(pdev);
 
@@ -1930,8 +1934,7 @@ static const struct acpi_drhd_unit *doma
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn,
-                                       DEVICE_DOMID(domain, pdev));
+        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( ret )
             break;
 
@@ -1954,12 +1957,10 @@ static const struct acpi_drhd_unit *doma
             break;
         }
 
-        ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn,
-                                       DEVICE_DOMID(domain, pdev));
+        ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn);
         /* PCIe to PCI/PCIx bridge */
         if ( !ret && pdev_type(seg, tmp_bus, tmp_devfn) == DEV_TYPE_PCIe2PCI_BRIDGE )
-            ret = domain_context_unmap_one(domain, iommu, secbus, 0,
-                                           DEVICE_DOMID(domain, pdev));
+            ret = domain_context_unmap_one(domain, iommu, secbus, 0);
 
         break;
 
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -427,7 +427,7 @@ static int __must_check map_me_phantom_f
                                         domid, pgd_maddr, mode);
     else
         rc = domain_context_unmap_one(domain, drhd->iommu, 0,
-                                      PCI_DEVFN(dev, 7), domid);
+                                      PCI_DEVFN(dev, 7));
 
     return rc;
 }


