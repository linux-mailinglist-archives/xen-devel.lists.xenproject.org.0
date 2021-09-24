Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75007416F8B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195134.347677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThrW-00034X-OW; Fri, 24 Sep 2021 09:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195134.347677; Fri, 24 Sep 2021 09:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThrW-00032U-L6; Fri, 24 Sep 2021 09:51:22 +0000
Received: by outflank-mailman (input) for mailman id 195134;
 Fri, 24 Sep 2021 09:51:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThrW-00032O-4E
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:51:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb5b3791-959e-421c-ad86-365dbbe10941;
 Fri, 24 Sep 2021 09:51:21 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-G3Ndlw9nNqes4sh3LDKR_A-1; Fri, 24 Sep 2021 11:51:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 24 Sep
 2021 09:51:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:51:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Fri, 24 Sep 2021 09:51:16 +0000
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
X-Inumbo-ID: cb5b3791-959e-421c-ad86-365dbbe10941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN0XMYBu453TsEQycVn7JwMY6NZVxUsfyHNqqJKG/hA=;
	b=Idcapd28bJJSymNVxTDmifj9CKDoqSD1PqEl7GsKxWMziYtnqMp4ga/SKPAm96VZWSWlwT
	UTHCHGc5ya3CqQ+NUuD0PX2z2u4H5XvDL6cYxGpvRp3f7e1JID0+ivep23nRFC244zvg47
	12E/zP6Z7g6b20AE+edVMrTwcU/H0LI=
X-MC-Unique: G3Ndlw9nNqes4sh3LDKR_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjg14M4DWctNYQBNaBYJ2EPyWzRT0DAkpdbAk9NUwmKpBNTxX76gOkiG6TjejTfb2LMTtpmCuhriiy2MpCtB1ppfTUwUBWvjrb1UPTBmG+eNz760uLC8VNMODivoUDQWi9f9Rz2WIXV0x9VUVzXjmmcQA1e0pO9mG+9eT5Nv3xIbhRuQMbAUHpcjtqnhlxdcDy7BG9Ag9j0I37I2sAzz/HbK6QZp65ygzz6ueAKsYJ9ehCjlCyqUTY7lIho/tL+kmJP8yHrzTkAgP3xklsgFuDrg/7FFPZl+LeL3jJ0M5Q+wdqEmOg+QpXZDGvG6llVK1U+pLEiw9exlyViAXcGIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cN0XMYBu453TsEQycVn7JwMY6NZVxUsfyHNqqJKG/hA=;
 b=gGd4jvbmvJ6mNlrkbHZVO7DWwhOIIuyY3oSfQQRkVh6tQPUjjCA4OQihcFjawXfSXQZylys/2LjcexE6irNoN60Iyf/xFGGbD13JBw7ygCvTFHB8VBBMNVawrCe072B10p6Owb5tz3vsTM2xoI/hrU0fsR29W5LNPTIqrXSprN6I2XQfjRizN+qsmqivG3XP/VI61qeiR9xpx6vTXmZpUPL9DOHr9VzAmuiWMIUboZ9I7+V+6I5VaSYqtzBr0MB9mtBPQxg/xYWzS+tpiHTS0GgVnwEw6gSLSaL1T24DTu6v1JJt1CMH02mU94+GisANRMcCiCIPpsdY+dy4Ka5Z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 10/18] AMD/IOMMU: walk trees upon page fault
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <5d4a4cd8-ffb0-951a-c86d-98f659ab8d0b@suse.com>
Date: Fri, 24 Sep 2021 11:51:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8386776-8669-4586-927a-08d97f40da44
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244686214157309FD7E00932B3A49@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRUZZmzOy58uOkgUYVtNIpTJSr/p6heiQQbsHlu8VZHcPPwStp/4HHb1L043TkmEawKrbze4N08bDTZRbQlVq8rQ7B38JzrfXRojYyFnqLqBeF5rp1lYVBYMPs2tnGdbzounO/OINZ6nJ4Pgp6DwIpczBA+YvRaFotV0uGigIIcwVekk15CmSyqzz1yZAnUZ2Vxrj6NUI6YmPAazKIi0X+82V1sq9vKLubz9rlBTSPPw7ApDETmM1Qb2+ioVN4w/4RylEJqcST1FoWH/a8E9C9h9QQbfwk20OPFOLUOkqZQKvKrF22zqyel413d//Lif0zbpOT5sE1oAR+6/KheGNmr6VNFNkmHLIvLVFq6XUz+/Z3iba++0MCtzwNPD8uwzm9l9bQG9i822868CFMpzXFqvMq/N/17LiNJNqn05yLJRo641W7zzENLn+BLCFCCPp2KyaHPDMEvHh54Wqu0CvrKMrQkLxBXWt7WyXSfo7WJJybICrCnxAUAduQVqf5+FfuGv+WxpHL0FTe1dDhqpLxm/ykdtPwkYOoGLhU1uwCSCHrue77alvP/l9XPx3hGI/bhYGen4ubEhfFYXlLs+oogYZIAt2yAQTCNeOpExqoeriWa1BKD3ziFfCoCRRPrBZy8TOuUczGkqvBUFobC0rIkhOHPMrepBIUKrKOQ/Kr4vjCKQhi+iJS6H1kK/o47LWq8GH/DTX7Tr4tYZHfTtruEqDJmNUOhIPXX+qUT+r4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(956004)(4326008)(5660300002)(16576012)(6486002)(66946007)(186003)(2616005)(54906003)(6916009)(86362001)(8676002)(38100700002)(66476007)(36756003)(66556008)(31696002)(83380400001)(2906002)(26005)(31686004)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1d4UFlITU5WaFR1dUFXZXB4YkdHTmtuV2p2bHE5N2pkdDlPRzk0Y1h0MGxh?=
 =?utf-8?B?M09hUXRhakVOUFRsd2I4V0NndGVMWnR1dldnUm9MWnhPRWwvUVZ2amNKM3Zm?=
 =?utf-8?B?SHd6MlAxcHN4alF2ZEUzcEMydVB2Y091QURENGpjMkxxb0p6M2hMa0hLakJI?=
 =?utf-8?B?cE5yOFlCcmxSQWhqMXczeHcrVVdvMVNYQVNDM2hnbnRkVE5jQnJkeGQwTHlQ?=
 =?utf-8?B?ZlpaL3JhNnRDai9SK3o3Vk9sRXY0VVZHQ0RGTFdIOGtQUU8rSUxOSnliakph?=
 =?utf-8?B?MnVpVmVuM1JkQnBMS1RXM2haYzJsbHFJUUtRTlJ4VEIraytUTDNjWm54eHR4?=
 =?utf-8?B?QnZlWnlhdVkzWHFEZmx4amZKbXJoVDdqS1ZNWWhFSUg2dGVlVGVLK1labWx4?=
 =?utf-8?B?cXNzVlJSMElOVWpaTFFmL1J3ZWdkeXhNR3JBYTliaXRubTVlSVBoOGQyWXo3?=
 =?utf-8?B?ZHlMT2s3cUR3UnFOaVl4YnhoQUc4OEtjckEzMmtkZmZMbVZzaldKTW5vWUNX?=
 =?utf-8?B?YkFCSEl1d3BJMTdDT2o3UE9hU0lNKzM5Q2UrdTJjNnZaNFdLSmxzS3RQcTFj?=
 =?utf-8?B?TFFVVHJHay9tWVR2ZzJ6T0xDaTVvSW9TbEwzT2ducTl3SnlNWVNGek5nZjFL?=
 =?utf-8?B?VnI3bFNOd1J3ejVPQmNKMWZkbGFoOU5zczZVRS81aGVSajFKcTZmRWtzcFBQ?=
 =?utf-8?B?RkVUZmVqdW14SHluSjRUbG9SeHRUYU1kNlBtekM4enJkRUxYdWF3TzZ0NVB4?=
 =?utf-8?B?MllrcVpQbENDWUdmVFpoSVNQRXRXcGFEbHR4MHpta3JPbk5IRWs1SlZna1Vo?=
 =?utf-8?B?T0Q0OFJYV1FPR1VmRHFxZUhwWktsOWlibjZNczMxWXhkR3A5RFBzeWdHNlZ2?=
 =?utf-8?B?SkVuMStzWVJSTk5xdnkwS0Y0NWJBbld3b1pSWi9ydmJYNmJ0RHFMTTNVbEVk?=
 =?utf-8?B?ZmtCNEswZDF5YUpXZW4rUEVjRGk4NlJIa3VXYWJtSXZHWjVGMFMxN2Nmbm9Y?=
 =?utf-8?B?YnlVS2VEWjBhQ2x2a3YyaWhjZ3RLZ0lyY25wekMrcmRRTVlsWG1YU3JWVnBm?=
 =?utf-8?B?WkVyNUlrUkVuWTdwZ051ZTlMRTl3c0FRQUdPa29yYkd2L1BIVVNHWWY3b1Bp?=
 =?utf-8?B?K2ZLejRtd05FYStWZ0poemtYR1FsM09IS0NKaHNkL0lNM3g0ZVh1T0ZNUEtI?=
 =?utf-8?B?cXJXZzZqNG1JYlpXNVFyS3NidGE5UG5SaGQ2eFFPNU5GSjRLWVJONWNoR3Zq?=
 =?utf-8?B?aWVmNWQ4QWRhMzhUak9KV1AweGdQVHRmaGloYlhLMWtHc0VHcG82dkRJanlu?=
 =?utf-8?B?ak9iMHVJaTBGYUxrMEtqay9NWHNVZkx0bHBJK2NXcEZrQWxWTjRoMVdxbnJ4?=
 =?utf-8?B?a0tCSW81SU5ZSVY1WTczMHQ1YTJ5bDh3MU5XWmtXQ0t4THBrYkxhbC9TSW8z?=
 =?utf-8?B?T0NUMGlOU1dMSTFFblZqa2V3SnE4Z24xZmZqM3RkdU5pSm5WQW40V1o4eVZq?=
 =?utf-8?B?ZzdEVUFKN1FuZVVPWFJ0TGNYRWVLSlBOd20rckd0Nk55RFpBajlsc2Z3aE5B?=
 =?utf-8?B?T3dkMk5Ndlg4dkhaRXpja1hHTzNhME5RZmduN25nSjVEcGM0QzEzVUlzZUh3?=
 =?utf-8?B?SmJ5cVE0RCtSZ2dxMHVMNzBmYzdEMm9WMTRJa2ZaNnREWnhpRERsd0poM1g0?=
 =?utf-8?B?RG5oSGdYK0pYLys5ZFo0VmZHWHIrZDFlTXhrdzB2dkExMXFZQTdoWGQvMWNL?=
 =?utf-8?Q?wSD1ynKy4VZ9Kz5rzxCtggwa/EmnHWl9O+06Bon?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8386776-8669-4586-927a-08d97f40da44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:51:16.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwWmJ+NKXfNkaddDeoANaeE3eW+yshrPdeBiYKgQCKlUntGkhpe6gxZZXD3XPGAO5KInLU3hdk+FU7j11w/JNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

This is to aid diagnosing issues and largely matches VT-d's behavior.
Since I'm adding permissions output here as well, take the opportunity
and also add their displaying to amd_dump_page_table_level().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -243,6 +243,8 @@ int __must_check amd_iommu_flush_iotlb_p
                                              unsigned long page_count,
                                              unsigned int flush_flags);
 int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
+void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
+                             dfn_t dfn);
 
 /* device table functions */
 int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -573,6 +573,9 @@ static void parse_event_log_entry(struct
                (flags & 0x002) ? " NX" : "",
                (flags & 0x001) ? " GN" : "");
 
+        if ( iommu_verbose )
+            amd_iommu_print_entries(iommu, device_id, daddr_to_dfn(addr));
+
         for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
             if ( get_dma_requestor_id(iommu->seg, bdf) == device_id )
                 pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -363,6 +363,50 @@ int amd_iommu_unmap_page(struct domain *
     return 0;
 }
 
+void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
+                             dfn_t dfn)
+{
+    mfn_t pt_mfn;
+    unsigned int level;
+    const struct amd_iommu_dte *dt = iommu->dev_table.buffer;
+
+    if ( !dt[dev_id].tv )
+    {
+        printk("%pp: no root\n", &PCI_SBDF2(iommu->seg, dev_id));
+        return;
+    }
+
+    pt_mfn = _mfn(dt[dev_id].pt_root);
+    level = dt[dev_id].paging_mode;
+    printk("%pp root @ %"PRI_mfn" (%u levels) dfn=%"PRI_dfn"\n",
+           &PCI_SBDF2(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
+
+    while ( level )
+    {
+        const union amd_iommu_pte *pt = map_domain_page(pt_mfn);
+        unsigned int idx = pfn_to_pde_idx(dfn_x(dfn), level);
+        union amd_iommu_pte pte = pt[idx];
+
+        unmap_domain_page(pt);
+
+        printk("  L%u[%03x] = %"PRIx64" %c%c\n", level, idx, pte.raw,
+               pte.pr ? pte.ir ? 'r' : '-' : 'n',
+               pte.pr ? pte.iw ? 'w' : '-' : 'p');
+
+        if ( !pte.pr )
+            break;
+
+        if ( pte.next_level >= level )
+        {
+            printk("  L%u[%03x]: next: %u\n", level, idx, pte.next_level);
+            break;
+        }
+
+        pt_mfn = _mfn(pte.mfn);
+        level = pte.next_level;
+    }
+}
+
 static unsigned long flush_count(unsigned long dfn, unsigned long page_count,
                                  unsigned int order)
 {
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -607,10 +607,11 @@ static void amd_dump_page_table_level(st
                 mfn_to_page(_mfn(pde->mfn)), pde->next_level,
                 address, indent + 1);
         else
-            printk("%*sdfn: %08lx  mfn: %08lx\n",
+            printk("%*sdfn: %08lx  mfn: %08lx  %c%c\n",
                    indent, "",
                    (unsigned long)PFN_DOWN(address),
-                   (unsigned long)PFN_DOWN(pfn_to_paddr(pde->mfn)));
+                   (unsigned long)PFN_DOWN(pfn_to_paddr(pde->mfn)),
+                   pde->ir ? 'r' : '-', pde->iw ? 'w' : '-');
     }
 
     unmap_domain_page(table_vaddr);


