Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5CC58DB5A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 17:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383029.618125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLRVJ-0001OS-Vy; Tue, 09 Aug 2022 15:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383029.618125; Tue, 09 Aug 2022 15:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLRVJ-0001LF-SZ; Tue, 09 Aug 2022 15:50:49 +0000
Received: by outflank-mailman (input) for mailman id 383029;
 Tue, 09 Aug 2022 15:50:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLRVI-0001L9-RY
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 15:50:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08d73cc4-17fb-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 17:50:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6199.eurprd04.prod.outlook.com (2603:10a6:20b:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Tue, 9 Aug
 2022 15:50:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 15:50:45 +0000
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
X-Inumbo-ID: 08d73cc4-17fb-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AskTGe8AkF3GdI5Yu92z1jR1qH/ylxcYSaIOa3v0s4G41N4GDISep+p+bOr2a9lJXsMXsvZuGw5ux1ipN8hOLo2HyMieE40pvfeO11GIu1bSvt6CF6kJvQQ7W1/gJR/g7OVpzm3dr306OODrSrziOu2V2cf9VpEg3ralstvff22VhZEr3k9Fz20U6RomHguBkJzvu7xxhei1cg6igNlrMvdM0WQfF+HnnSCZxOIY0Mc7pqjC4/wDaRiZ/1sPNUd6SEbiloMNxt9LoOcjGRQvHrH3i4eUw1bon3zoYtXKCoousu/QodV/GUxIL4Mje/McDBaYOf4upuaTqbLhowMpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2o3e3VcZdpL1nk388vY2vbR7X6y2j6+znoiiGQykqM=;
 b=KT0+9yumtgfL76CfaIiq1VU5QqejDSstc74QvUmfAG9d1HhoQGP2tDQprP2ay91pE5oR/ZHTyImC8WJ/+oRzjHXe2387rCMybMUIA84WrMHFQEjFtbHPVq0mQsnKEc6YE4lmN6KoBzH9EAjKulMFgt/D1/BXEuknRpDjftM3tdPWRrBEgsBbFhOV5+re9anuG7/yTEpnPnv9Y4hwsqG5ObvIUTNSZXj13kmWu/S81XlnThLaWOSUAwWbYOYNUfPVIzJ3rLT+M7CaKHF3sP9JDFFyOsUkd5k4zCqW2LkC7nhHQIe+L0NK6YxnxOdPSpBPG0Q2gsVS4zJyzomAWDdb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2o3e3VcZdpL1nk388vY2vbR7X6y2j6+znoiiGQykqM=;
 b=25fNPUuEbQ4F9k+RPbpk/mgHMUFnPN1xvABuuvOMNV3/UkErhUeBpX05AfnMcnyyfe3KgUsmKIr/Rx2RJfgDXW8c0XSxJ6skiAD8sTWGB1ppUFywQn+bzFqLn0fr7h3zjvQvWR2rR2fP7+L00dp44on1Y0n3gE+W+qVAsaOl6c1V9my+OFsytdRuNnU5ZX0joNJN9zRTCx+UmOXyBo41SFf2bPCOjGHn2qPgyS8xnZ/cJHoWHVzc3psGkiJ8RCQWyHQqAoRB5o0BZnQD17dyeMhYnOoaRCHQqVOzq6Bhjmh+Gu1vz8CxMkqBgH+U3Aql0EWG3wZ3lDmYp9BBGEEZNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80fb0709-5a0d-a3a5-b2ea-dca089714ac2@suse.com>
Date: Tue, 9 Aug 2022 17:50:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] PCI: avoid bogus calls to get_pseg()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46fbd8e8-8b72-4f89-a4e5-08da7a1eec2a
X-MS-TrafficTypeDiagnostic: AM6PR04MB6199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wcy0nic8K7ZyDZQ+b0s3BmDk6N8zq94SUm3UMWIS6pO/fdZ1MIq7uN87QQIHubRpwoh+dgSWDGodIkuz3hg/e3M3PhoHCRF7ii9k2nYZyphxuC/gNOT8r3nDNxrjn3hGgJzN0YbJpQohPpPQAoZZLnfhMjsnIYyjbR7ok8zG3MlmJ1ZejlELvPYs/noUWA8a3FUUwLw8aErlIVGENM5G2cI5k48dXXTMSQajrdmVEak3Yi/4l2PnMEg+kTEp605Vi9DJOofvCmqDsBB762zePesE/qm8/HB5sJKxgRv2s+bP7BoisArqqOLSx/YoL5LHkIHsaeAiqHwliKgtWysCtJFOLGNHCZgYM6eObIYYB6grZe6KuJiiaOlxQ0g15NDTYXJW2mx+eE34ZJsRk7X+eT2VcUxka5fzCmJgJSRavrMNrlOWNHH63grXrdX0FqUU2/G9HZXFz0tScOe+6aSPMXtRNgjq7Dd1Np/u3CM3ajbG9ILZgK9PjKOWX2Q/QbOMNFuMQg5M9j69TG6/SLRaokrAbB55nnjoTJ1rkzLVTRDEmZ2OLB/45kHbY6W28Cw8Z6/gDYFCAwCP8CeP0t5IiXgIJ+m4+ANgWx9n+jDtUq8Cn8OGcI/Exv8y2mvfpXWR2gMeuqB2Rt1oW8vCcUFDlxMCJ1x/daSqGuv5RgL+pPOUCdFvV0vL4owGOIlEXN1eydrh1/Gf2vkPgnjh/fO79PZotjmOdKOcS+IPhNEeV+FO+cmklmaJsEXZqmYQ5YGbue/wDR99F1wHhJPmgTHPFV12Yw7s+MPS5tBu2vfZndKFDmCBwgYwrhxaQlF7XCboy6Cc6VAi2g0Lb4OGv2sq4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(39860400002)(376002)(366004)(6506007)(38100700002)(41300700001)(2906002)(86362001)(186003)(26005)(6512007)(2616005)(83380400001)(316002)(54906003)(6916009)(66946007)(31696002)(66556008)(8676002)(4326008)(66476007)(31686004)(36756003)(6486002)(5660300002)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1Vydy80VExjdVJHZmQ5eitxZTBtWFdPYXBmcFN3QW96OHQrQnFsTm5SZGRh?=
 =?utf-8?B?TjY2ZFlTTE1DaGpQYm9pUVZYR1BhbWxub2ZlNjIrRmtsb215WUtmNTZkOXRn?=
 =?utf-8?B?QStGSkYzQlArYUtaSmwwOVJoMFVCaEZ1RVNMeFZoUE1uVVpCUndOTHZucnJ4?=
 =?utf-8?B?RzkyUEJHQ0FpTFdOTUIzZTdUb3JSbVREWjNyOUNHdFVucURxbm1LbDV2VEpS?=
 =?utf-8?B?YkRXN1VoMTNxYURkazYwVTBlQm5vRXQxaGZ2UEpjd2pDb0tuNE5naWhHdUNt?=
 =?utf-8?B?S05ZTFZjY1FmdE01VWhBTWFnYnBWOTNYT1p3bFVTaFQ3L0YycG5wYjNyVWZn?=
 =?utf-8?B?UkZBblRSMllnaThlY1VWU0JnT3V3a2Y2MkUwVS96MUFoM1UwWHh6MTllU0c3?=
 =?utf-8?B?ZXZTZEJjMkRCN0xjWHA4cDhTbEExRkd4SjFLdVNKcU9HcXpoMVI5eXRlbmxq?=
 =?utf-8?B?OFRuRm1pbmRiU0F0SlJwVWFsRExKcU9hN2phRllMNmMzN2YydkwyZyswak5q?=
 =?utf-8?B?Q0tJYmtmby8zSkUrUllLQWNjcGdabDV3MG56T3E4MjFyQzF3N0NPcWo1MkFD?=
 =?utf-8?B?R2NObkVwa3RXdlpVMmFObnRBMzJGS1dEWDJhOGplaUtCZVpzMEpXZW8zc0lH?=
 =?utf-8?B?RjA2ZFh1eEkveCt1MWV6WlUxb2JIeDVRaDZsclBrcEpOajQrTkpSWWJaQ1pP?=
 =?utf-8?B?ZDlzSXg0cUNnTWpnOEdIUEtkL0FycGMzQmRVQjBSVGFwWnByVk1RZXBhbE45?=
 =?utf-8?B?UWtNbjBjUkZxM253UHFYNWJycmgwekhqSnZxcmUxS2tGZjBXYjRwV1pQcnBW?=
 =?utf-8?B?UkdxSjl6SHNXNU1WZ0cxdlJLQ2E4ZG9NYVJmQmRWSDAzUHNyTlA3bXoydko2?=
 =?utf-8?B?QmdQVHpSU2x4ZmxoNFNPTHNTcWJ3WFduWUxnOHhzc1YwT2RhSzdsanlRMWtl?=
 =?utf-8?B?VDZmaUMyY0htazZwbEkyNmd5NzNTMitxSWxxcjdPT2pVdmNRTEZjQlo0dXJF?=
 =?utf-8?B?WGErcnJzLytpSGRWR0I0KzAwaHNJSW51aEZja2VYR3FJNi84N0NZNUJDVEpP?=
 =?utf-8?B?dWRBalV0L01PVEx6YU9RbG1GWW51YndHYjYxem55SWdjR25qVFA4dGgxOUhP?=
 =?utf-8?B?bVdvSFJQTm55VTlwWWJ4dVYvQ0cxUUdZMUtrYnc4ODZ1TTFYbE1WaG13ZC9I?=
 =?utf-8?B?U1pRRjZuOXNwWDV1a0hxMkQxNHkvSkZDc3B5b2dOYmg4Z05IOUo2UGdXcmEw?=
 =?utf-8?B?R3Q5VUpreFg3bzlwYW1obFNyRjF6M3JQL000ZG9OY1d6T0kxZ2tMcEQ2Y0to?=
 =?utf-8?B?c0t0V0l1TnJST3QrNENNQXhaTktJc1ozLzBHQlRmUmd6UEJRTXVmb1hTVENI?=
 =?utf-8?B?Y0k2czNPN1FSbDl5LzhlVVZ3aWJIemhsV0FmTy8rSHRFZE5tN3ZSeUxRTDhR?=
 =?utf-8?B?d1JUZ2JaRWo1M1BjRVFwUTJaOGlsZC9lU3VUeTNaN0hRWDlndUFUNHdxT1hs?=
 =?utf-8?B?U0h3MUsxY2svZ3hjc1VITkpqbVQ2eGJ4ODZNaDlad3J0MHVIYXpXSjBmektY?=
 =?utf-8?B?elVLOTZLaDNCYXFBdk9Zb0RnOU9VVFVzbTFoTW5lWVF1RitUM204TnFDQ1M1?=
 =?utf-8?B?N1BqbHBiNTY3SU9NTGs4c0kxMDlMTkdXbEYzNjBLZzBMaWY1SHplWGpWazFE?=
 =?utf-8?B?elV6ZHZIZnVwNHdYdnF4bTUxY2NXeGxPRC9NanMrekdxWlloWGYzSFM0QmdZ?=
 =?utf-8?B?cnN1MDJXSDdiZ0NMZTNlWjVza0J6RXFwWXMxRGVOQzA2RFdSYWljMVI5ektM?=
 =?utf-8?B?RUNpV24wN01TS3ZLNFhXSnFxN2VNQWhDYjR0R0JYOHgxOERXMlVaYTRjU1E0?=
 =?utf-8?B?b2JhdVBpTkgwWmh6d3NwUWFUakRINWJzQU51L0pDUnY3YU1jdGI0alNoYmdv?=
 =?utf-8?B?UjdIby9HblJhUmNxTk50Z3kwYjdnU3Z2RDgxalRmdVRGSzRWNVBoUUxRbms4?=
 =?utf-8?B?ancxL1RZTmxFRzN4cVJOZU5abnJkLzFHMCt2MURPUXBwUmVZMFN3Y0t2dGxJ?=
 =?utf-8?B?amVuZ0hiSkwyeVNSU2pHRlljekE0V0FWSGlzeElXZEdXOVNpOHR5cjVMR2V3?=
 =?utf-8?Q?1wfCc7RiZMNI3pma8ntCjlCer?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fbd8e8-8b72-4f89-a4e5-08da7a1eec2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:50:45.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0nrcVRwisnSqhnvu53EfR4nXQlQ6cxetu4XjYr5il6e0Uvx5inFiJbdawOipwPW/fSiwtzHd+k0NE1oTPy8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6199

When passed -1, the function (taking a u16) will look for segment
0xffff, which might exist. If it exists, we may find (return) the wrong
device.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative would be to declare that both functions cannot be called
with "wildcards" anymore. The last such use went away with f591755823a7
("IOMMU/PCI: don't let domain cleanup continue when device de-assignment
failed") afaict.

Each time I look at this pair of functions I wonder why we have two
copies of almost the same code (with a curious difference of only one
having ASSERT(pcidevs_locked())). Any opinions on deleting either one,
subsuming its functionality into the other one by allowing the domain
pointer to be NULL to signify "any"?

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -578,20 +578,19 @@ int __init pci_ro_device(int seg, int bu
 
 struct pci_dev *pci_get_pdev(int seg, int bus, int devfn)
 {
-    struct pci_seg *pseg = get_pseg(seg);
+    struct pci_seg *pseg = NULL;
     struct pci_dev *pdev = NULL;
 
     ASSERT(pcidevs_locked());
     ASSERT(seg != -1 || bus == -1);
     ASSERT(bus != -1 || devfn == -1);
 
+    if ( seg == -1 )
+        radix_tree_gang_lookup(&pci_segments, (void **)&pseg, 0, 1);
+    else
+        pseg = get_pseg(seg);
     if ( !pseg )
-    {
-        if ( seg == -1 )
-            radix_tree_gang_lookup(&pci_segments, (void **)&pseg, 0, 1);
-        if ( !pseg )
-            return NULL;
-    }
+        return NULL;
 
     do {
         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
@@ -628,19 +627,18 @@ struct pci_dev *pci_get_real_pdev(int se
 struct pci_dev *pci_get_pdev_by_domain(const struct domain *d, int seg,
                                        int bus, int devfn)
 {
-    struct pci_seg *pseg = get_pseg(seg);
+    struct pci_seg *pseg = NULL;
     struct pci_dev *pdev = NULL;
 
     ASSERT(seg != -1 || bus == -1);
     ASSERT(bus != -1 || devfn == -1);
 
+    if ( seg == -1 )
+        radix_tree_gang_lookup(&pci_segments, (void **)&pseg, 0, 1);
+    else
+        pseg = get_pseg(seg);
     if ( !pseg )
-    {
-        if ( seg == -1 )
-            radix_tree_gang_lookup(&pci_segments, (void **)&pseg, 0, 1);
-        if ( !pseg )
-            return NULL;
-    }
+        return NULL;
 
     do {
         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )

