Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5323F603C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171482.312923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXLJ-0001kS-Fz; Tue, 24 Aug 2021 14:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171482.312923; Tue, 24 Aug 2021 14:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXLJ-0001i0-Bm; Tue, 24 Aug 2021 14:23:57 +0000
Received: by outflank-mailman (input) for mailman id 171482;
 Tue, 24 Aug 2021 14:23:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXLI-0001hB-MM
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:23:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59aaa45a-01c1-4ca2-a580-3cbfb9cb00dd;
 Tue, 24 Aug 2021 14:23:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-jHF9keATPpOOLyfkz10sXA-1; Tue, 24 Aug 2021 16:23:48 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB3970.eurprd04.prod.outlook.com (2603:10a6:208:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:23:46 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:23:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0121.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:23:46 +0000
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
X-Inumbo-ID: 59aaa45a-01c1-4ca2-a580-3cbfb9cb00dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0KESrPG7AH4RWYD4JfplIzBCHkC6romhn7Gu1QPbq3c=;
	b=e2RrG5vPDeeNhihu/jj0U+wfb3Jw4l+UD5BhyVYxoaLOkDwUsqtBv3ShFvpwBfLrz9/Q65
	2Gh6SSBn1KwwnbTPM/S7xzb/LaahzwIcR194xpjYPxA0yVNnuGa6skdEliJGEe56AV36Mi
	HOJCBeT0Y7AC7MvESoafCHof0/XgQU4=
X-MC-Unique: jHF9keATPpOOLyfkz10sXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjEl0CAVxWmCAqitmHqQNrj39Gbb57rWnJhQfH+XPG7EOT1G0nXSHirO0tQSNb7z+thhEwSUHz6gdWhVrxGL300Cttm8vyBI9TVoGsErHE/CUIUSvs/DFdKmbI/QeT0qtIeF4t50JWC9n0ySJt26+nTaH6CyFuH7ox5/MJK7GlUDMYMXD5tZE/Kv3jCdgGmGkreKYlbpFuHuPjO4Mxb2WJTo9P9ti+wPEq3MGT/VAxnSgf6gPYRSdlL5/MJdcyU9uO1yfTS9mV5xj9p4DNgJTfkzSb1unelE1FO/TzmArIzw+zktsqozT1idrMKu4Eis+VaYoaGZctmIDhH5RzZlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KESrPG7AH4RWYD4JfplIzBCHkC6romhn7Gu1QPbq3c=;
 b=Qz+k8ycZBtNcGhQnIke5K/cPT+3vIEPflZppeWyzH9RoLP/JY5Nmd6/uy6toUwvMlXTSLs2c8NxdrgSCTcxqtNza2QJZ1UB3mFJuMIEjYfQ/8nrWUy9y1+z9K8wPUV+sjEayvvHX1A9G7DWjYikJaPr2cPZab6v46Rnk44yxAoVp7BKHSkqhZxeJBQcFi+5Cp+f49UV+y9XaQWU42uQQUC10D/ApfQKFUPSseZPM1QqGR+Xsfj8pJiI0LDSm4kXA7lIl1i3X55kkjTyhY9fnNdyvBV2SULHmvVAM8x/9lpYhERL5wGb7fzhQFNnEmr9i7kPluRm2MPwPMCwlyrXH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 11/17] AMD/IOMMU: walk trees upon page fault
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <f4998466-3777-eab8-a416-fe0f7d8402c6@suse.com>
Date: Tue, 24 Aug 2021 16:23:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::13) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed7bff5f-2cbf-43a4-35fe-08d9670ac8bc
X-MS-TrafficTypeDiagnostic: AM0PR04MB3970:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB3970CCB59407857681761318B3C59@AM0PR04MB3970.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M5gaHb/MdzLw1nGkogOnZ/pWhWkUXvKqvMM1F2DoFh/IPHCC2v39zpNIDN43RnrWjMkak3QG0sow/yYfnNBmuDWCasZlRxCR15id9QBvFaVSBl1V8L6BxAHpuFGuH3+DtgAkEV3ZmmAy44fMo8tdmP52zGXptzAv0cfs5jU8nFv/FUnfhDfarg0461k4xRMGK3XmDva9gu+wCtsyE4vuzAg8Ht0BgQleMzpWEjJWdEAk3EAv8n8Pt40krV9AMM/N/j4Q+smCEgjtqqAEzSxscqkZNlxoy5pVttwpucenMxrRJHZVXcew4fjlpbxOJ3WcIfP8Qn54ymZ3gMiNA7VMM+wiD/RYxVChlpOcPGWM/3tIju1YVL03OKX71ilytjWfUv1kXDaggn/HKiicr9GeVlS2xiAzVoviy28dT9uykQM/ccoUdbFFAUjsLfgSzcQWahXvGIFnbbiiH5ttieBLaskxZae9VfGaaXGnqouFld8kq6JdQgGdDe//Ig4esMQVxepP7ar2FhNXvJq8wv60NbZSEgS4X5uYDA46c6lwZR27p4UruVFJ2YUt05kAY1goQFGrA5KX/KkT0ZdJTW7GAaimld7694hVVCjZ9DypeIfX4nL/k+NU02e0qdCAnOcpqMYRoUyNjEXn+ICigD+xklOXS6M5WVRLy56bxwGBVnMyKV/rUTHJcGCQdOrd6RcDJKOP3ToFW6XpyCcFInWsjlseJt8fFdAuw0ZWcm31ct8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(54906003)(4326008)(8936002)(86362001)(31696002)(26005)(2616005)(8676002)(508600001)(38100700002)(6916009)(83380400001)(5660300002)(956004)(316002)(66556008)(66476007)(186003)(16576012)(66946007)(31686004)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTRaNTF1WSs3UmEzVzZoSEY5dHdjamJuTXRBSjdVTVpaOU9MN0llaHBoRldP?=
 =?utf-8?B?b3plVHJyN0praFpvdHZNSGdhU2UrVkh3MDYyaW5Fdkp2bnZsS3JCTWtJM3Vn?=
 =?utf-8?B?clFEUXpCdUtsRU9KSU5UM2ZZYzlpT3JGcWExbjQ1dSsyR3QvMUI3Yk1EcjFO?=
 =?utf-8?B?RTRHamVra1VwQjNocFlHb1Q4dmlMWFhmS2p3bWpsK3M1UHZ0dEpjaGV1eXdy?=
 =?utf-8?B?Z1FpSWpaKzhNcWI0eW1DSzdlVlgrUXRPZVBGdDR6alZ0ZmdiY2IwR20zQ3ZE?=
 =?utf-8?B?c3BaN2JTcUtVWEJYTWx6U1B1YXhKNWZIaEhvUEJSNTBVbUJOdWNHQXZxOC95?=
 =?utf-8?B?NFB4TGN3TG1HK2xxL0FETkhRemZuM21LRHBZY1JuOHFXakFDdXVTNDYzMUg1?=
 =?utf-8?B?UnVUOWIxVDdoZlBSSy8za3pncWRoaTBuNEl0ZUFTdUdZQkVUOFBEQ0p4M21G?=
 =?utf-8?B?UjF4UU1neEJQOXpwdHFzLzBLS2ZhWS9ualhHUkxoRlA5bG44ZHZIKzBxaHcv?=
 =?utf-8?B?WllId2kxcENmZkQ3YTUzaHRQVHRtanNtWnpJa3ZsZzgzL1lDRGZIVWZVZEE4?=
 =?utf-8?B?aGI3UUdOKzNVUDZ3aVpaRlV6WUQ0a3VNK2VoQU0yS1dIellwNnhNVGE3ZzIr?=
 =?utf-8?B?WnVKQktLR3VuLzduOURTajI0T08wV25lVFUwZko5ck5IYUpqNUg1V0NQcXlQ?=
 =?utf-8?B?M2xKc1dWWFArd0dZMjZuZFZ1L2h1cjJ4NGJUM0h0d3pndXZtaHNRN2Y3ZTln?=
 =?utf-8?B?cTBNYXZ5OWlGdCtsNmZHSDJ4eDRkUVJ4alpPYmlBTUJmd3QxYnVPUlEwZmRk?=
 =?utf-8?B?UDlhU0x0Z2luTmpiRmFNYm1PTzlBRDUvV3lkbWk4NGxEcFNOOXRwVnVoeWdY?=
 =?utf-8?B?RXZIMGRLWDUxOG1IcUI2WU9aL0tOZ1hPdmkzdEVHSjk5aFVmcVJlZXF6a2lD?=
 =?utf-8?B?QnBqWG9mUjRINTQ1RFVjV3ZLMEFSd0dtSlRtMERsY0RjK2IwM05ka2FtUkRM?=
 =?utf-8?B?TnNad2JySkNlTm9FbXBkRzJoazJNOVBYR0V2K1JCajNxb3gwakpiT2FTQWFW?=
 =?utf-8?B?WTRENUxrc2dtZ1MrbmVPOVVyZ1M2NEtzZ00vTEE5S29Ba0xXRXdTZVVPOXpN?=
 =?utf-8?B?YkJOT3FqSjc0WXE5YncyNUVxY2ZTNkxlZGxRZSs0VW1LN2p4Zi9GN2gyVVFT?=
 =?utf-8?B?UW9ZOE5QalgwVzdyQXk2dXJVcHUwbGZnUE5tcmFEelJzQTR3M3VLRnMxVXFU?=
 =?utf-8?B?ek1aY2M3SjZ0d1NBTVRKZTJLU2dlMk5DUUJUUm1QdjlwUzFBd2JLRFBHTDVO?=
 =?utf-8?B?MitCZlZVRnBxa2lUUFRkTk5XekRKRUR6N3ZwMlFHM1FHQ3I4UjRPQnpDWm5G?=
 =?utf-8?B?eE5xYS9EK0dTUWlUalM4Q1N4azhxWnFtTTAvYTdCRE9HYS9NbGR2WCtCTm13?=
 =?utf-8?B?elJHV1FTT2tONGJHY2JQTTRxTmdXQ1Z4T1F2UUxDTWN5Ny9DaWpicnhMdWhK?=
 =?utf-8?B?bmR1cGlmbjMxZFdReks1ZExtMCtxN1JUTjMrZS9va2M5WlBNeXZsS3RQTXFu?=
 =?utf-8?B?S1lwV3BSWER1b1NIMktrNmRYazhmaVluVmo2d3BJUEt6Tm5tcTM1REJyRzBL?=
 =?utf-8?B?ZEtENWFyeXRibUtjbGRRdCtkV2NFTTZkdDNzWktGTzVYdGtRczM1T3VlaUFq?=
 =?utf-8?B?bXNpVWErc1ZucXpHZ0pncmFZcVlJb1hRZjZXelBFSkZYYkY3WERiMnVuVDdR?=
 =?utf-8?Q?yyrJf1hrkaG48xDCMA+9l6TTwpU47g/0Z9cH6OD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7bff5f-2cbf-43a4-35fe-08d9670ac8bc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:23:46.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SHSBeRV7fKEwvM0mimcyHWV+zAZgUUFzAUm3dPYl91INd9nPD1zXPvIY9P4mvxfujS7Tpyx86SmlcDUMt1H3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3970

This is to aid diagnosing issues and largely matches VT-d's behavior.
Since I'm adding permissions output here as well, take the opportunity
and also add their displaying to amd_dump_page_table_level().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -235,6 +235,8 @@ int __must_check amd_iommu_flush_iotlb_p
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
@@ -561,10 +561,11 @@ static void amd_dump_page_table_level(st
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


