Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D49489D97
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255447.437738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xYy-0001E1-KG; Mon, 10 Jan 2022 16:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255447.437738; Mon, 10 Jan 2022 16:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xYy-0001BG-HC; Mon, 10 Jan 2022 16:30:28 +0000
Received: by outflank-mailman (input) for mailman id 255447;
 Mon, 10 Jan 2022 16:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xYx-0008Dm-46
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:30:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dabca33-7232-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:30:26 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-i6yPQOavNqav6Pdw3MeVtw-1; Mon, 10 Jan 2022 17:30:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:30:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:30:23 +0000
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
X-Inumbo-ID: 9dabca33-7232-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f62ybvfoCSlLVGVKNs9Y8SU0VwhX09U4IvfLUd/XaZ8=;
	b=e1kdVX9mt3v7czLTgMs2mnzvvONhY7Syr0XvL7qFCAudfad8mAYwB7Qw+60JiStzhnR2rm
	G/UduMY18mXFQxfv2Qr73fXR2Ha04kVpeRFx5429wcpGqEfovTPjqK17ZGauQyHsHNJgxl
	Vq96Z2ZKT6/AWMo3CoBdy5b/pa2DQFY=
X-MC-Unique: i6yPQOavNqav6Pdw3MeVtw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbs9/1cMPapTX20HMqbcEPlXZJUnydF+u7rI0Sc3yTQNh6lgr63Xfj2rDvAnpj7FxnID+Teep5nd6fSrmf4U8dXUw6gnM9wvtyGhPBcHTbCq474GUM2XzxPFFEGu6kYx4KZQ0EsvjAwdlnTwEz/MlO7clvFB5w1RQWJ9ZmhZlaY9MMACysGADNU1OGMTjOUgKjkFj7s9Wp7yFpsirZ3p6A87M45WJligh3x1UMxGeoLDCSoM9CMcz3dvzVvC1gdQ2atqYqjFjWxxVSrRZvjljNPIGz89HK/lsX0jr5KFDsqPjhlNAMzd+M4/fZCLeWsqfqrxb5R165tQb7+06bl2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f62ybvfoCSlLVGVKNs9Y8SU0VwhX09U4IvfLUd/XaZ8=;
 b=UJ0r7sEYpQ/spo137DIXxx3J27HLaVJ1UzGxg2QRSKX64P1R9yBXQ8Zie/JvlVGNnifo6j/Y9vA7K0rZe6BEch7B6xXnFRknjvM4YasindixFA88PBLJl4KxMIrvlt9SzI7+SnZ0KOuE9B8e4o7k5ZH/k4wsW6s0f1VPwKBxB689aB/g0vai3t4iz7I/ZVoOO5xD6rSWVs0tK2P3ICkZHH8WNIyS6FWgghL5tQMjbH2NT5SKckV2r9Bxkgrn3tcZJIiquMsdsIHD7N6+/QNRcvWPtsTypA9uEZ28dmColskVDEVUjeh7oun9JYBmGgtVSIx6Jo3oHkM/NLSfamHpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67cb5693-3c52-ff7b-81d0-5dbd2231d940@suse.com>
Date: Mon, 10 Jan 2022 17:30:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 12/23] AMD/IOMMU: walk trees upon page fault
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0047.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4625fa8c-4675-4e60-6b49-08d9d456805d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516567A0ECC94C2EFC6D6AADB3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xlJBf/1pCVcWXTUxQIiVqr0owe0/7i1HAUItyIKEzrfx+yCWfTSE1uhc/NxOXn3qXsRKRwkZO2QG7TyqCledGRAq4lG6GIf660fIq02f7U6n0lLy/PeFpbErfmy/vzyhNjaEsnOb0ANkllSa1Nie2BSq4tvr6FJRUGwxbxfqGAiqUOzW9ctTu9UxcTcah15y1AC2c/Lg+ESbZeaDI0OiazAFiJEXh+rccCrBd3YNiO8mcDuMwmt1jvPEGiWJ4dfv932arD2AFVLT+0Wngk5czYPYZRdB+fv3mEJvFqLa8pNxj5nst2vCKykTrtctHQHaOja4Jafjhy4TTJQsp9dx4Zxj5LKD+7rsqmrDU86LvyNy+29k9w0iWcCXT+VWc6qbXE0wEkNR/CIjLjH54SqkDnpr+PfAJKWdQp7kxe/Cb0OwQFHRQxD/9eUip4x1FNb3chqIRHVAatPKasj7t6dYFdx33lXp7nBR+aN5IPgeH6Mjz3BtuWLHEdh2fQnHyHoCSblesi+Vw0Rl7JLt8jPhGxKz7YIn1nzYH4597+gjQb7jb1E9aWYsz0t659cjhfWc22JYKNjy4ZWJGHHJq7Q67TGqK9/W1NA1WoLY4XTDtZ5nSX5Oemdnl6bp+0TQW1enti2AdT/ez2mX7kRMbazML+LVM+oxfNwzsBCvxgzDIXGU7JZTJPZUOxxw6uqOercJVZtaF5PNWqV5pMoZruvw0NXD7KYGl+SIrwetONfgeEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(6506007)(26005)(5660300002)(8676002)(83380400001)(38100700002)(2906002)(8936002)(6916009)(66476007)(2616005)(186003)(66946007)(54906003)(86362001)(6486002)(31696002)(36756003)(66556008)(31686004)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3QwcWNEc3VFWWlTRGtnUm9XNTJrd0dtTmt0SjBLbk1GZ1l2cjFubVpjNzhY?=
 =?utf-8?B?bDNSUjZKTjFveUZUUzJZbkF6SnBTMEIwc1hqQk9PenU0cmpxaFpISFErUXRR?=
 =?utf-8?B?aFU3ajZ0NEs4emlCWDYwNnNrRk5naEVhSlphbW1IdGdFSWtKcU53dEl2bGZo?=
 =?utf-8?B?ZTlZb1RZWDZod05EdjBncEhXYkVuLzl0ajBlSGtESzVHNnRmcTZSb2REemlp?=
 =?utf-8?B?UTdwemN2KytRZ0ZEcnBKUmpWek93ano3azZ2UG5PN1p5Z2M4VWNhbENhWjRU?=
 =?utf-8?B?RDRseWR3eWRnT05tT3lmaWE1YWh3REVMTFZkUWlWcEsxalZ4V2VBSHpWVVJm?=
 =?utf-8?B?NEV6dUg0Y3o2RU1seVppNGpYekc2WkFJYjFZTDZuRVloN013cUYwV1hmcktv?=
 =?utf-8?B?c2FxaUF1d2FUUzhFb2c4T0NCZXBDQmw4dXhFM0R5N1d4N25HM1Npd0ZZOU5q?=
 =?utf-8?B?QmVXMkpvdElqaGtsK0N1dXZqdkhsWi9VbVVNamEvY1gybyt3NktSUmJva2w3?=
 =?utf-8?B?OVBHdzdaNnhlNFIza3lEQ2JPcFd5NTJacFVPT0JVUzVYNEFUUzhQelVsdyti?=
 =?utf-8?B?YmpSNlNGUVVtT2pvY1JvQkVKdWtub3haMzhrQmxNNm54M2kwMVpnS0pObXNz?=
 =?utf-8?B?U0dESUxCa0Jmck8wWGdFSXpVbVpBVUs1eTE4aDY0UjBtMHFpN2ZsWitTREhQ?=
 =?utf-8?B?SDBTTi82TGRIRlNzSDd0dDV0c1h2bjlsOWlwOUR6eFJaYmQzQkpVb0J1bmgy?=
 =?utf-8?B?cGJhMU9tMnhRUi9xOVF1VUNpT2wzTHh6cEo5K3VkVHdNSUp6L2tFR2NHM3V6?=
 =?utf-8?B?TDVSWTh3MWRTZ0pQV2JaTGtGaU1XSThiclpWdE54Z0VMUUcwTWJ4ZHh0NE10?=
 =?utf-8?B?eDhDdjZuM3ByQUF5NHYzN2dITDBzQVpwYXNrOHB5MlJNUlpzRWlCR2hhdHdC?=
 =?utf-8?B?UHcyMWpDL0dGRTdzV3NPWG5YVWphdkl3MEdYcDBpU3hHNGt3dXZzSC9HQVJB?=
 =?utf-8?B?T2RRaVFhWlJseGUvU2pBakdoRXZHK2hYUFNaNzE5V3JIcGEvREhITk9Xd0Fq?=
 =?utf-8?B?R2I0MFR1UUI5WWNJUUdCR0Y2V2FCenhFTDdXSXcvQU1ONWJkbks2ejM5ZlFu?=
 =?utf-8?B?cXFrakx6UmdybTJBd3JWNmhmaFEwQWlpMWxQd0dHVDBMazc4M0YxUVRSTm5Y?=
 =?utf-8?B?aURBREZSWExaMTdXSnh4cy9xTGNPb0NicnV5ZFNXcmxvNkVxa0toR3ZyWkkz?=
 =?utf-8?B?UXh1cVJzK3hZQmJ5ZWpKODFtVWJGZ2F1WmhLOUlMWXR1Q1FzL1hkR3lUdUha?=
 =?utf-8?B?dlBMZ1dQeEVaSTBNamlJaW9CRG5aVFpmOUpTdjdVZC9Rb1R5R2p3bWF0cVlq?=
 =?utf-8?B?L1NEZzZ5UEpmYXlKcjkzU29NSktZb2ZZR0hqY0ZqZjNVVk1pdTFudVB5NjYy?=
 =?utf-8?B?MitTRFF0NGNJZFM5VXJTcXBPRWlzV3hQeWxCWHhBdUpUNW0zU3VHWjdubXhp?=
 =?utf-8?B?NHRaMStLd1huclV2VkJCYnBmVnc2bDVUTUlsR1lLZ1BUSVFQNmU4TXB5Q0tE?=
 =?utf-8?B?dEhGU1NuLzZ2eDBjV0dBZUt6OU92VENxWGIxVit4a054bWh0YnVkZU5XS3Jy?=
 =?utf-8?B?MDFXUnRBaSs1ZHVXaFhPRHc3ZURiTFMrMmRxdUtHcXRnSnJOUGVrVkhBRnQw?=
 =?utf-8?B?a1JWWUp5elRBK3AvRlcyZDRWcG45NXJPZHU0N3pveU9jWUhWY1Bqemhub0xU?=
 =?utf-8?B?SUxUblJSc3BrQkQzVzBzSWFUYWVuUTMwd2RlazRxOEJLeGJZdGNyRjI5UWtF?=
 =?utf-8?B?YkFWaE1haXpWM0F3dVoxUTNmUXBJTjZRMjZxYUprblpaVEtUVisyTnNVQXA2?=
 =?utf-8?B?WkRvT0ppV0V2cURKY0tFSHQ3RTNnYW5tQVZ4N0lVUnVtUU1ITnVkbHByNCtq?=
 =?utf-8?B?WEJIaEZTbnBFa2d2NG9ZSzJsTEdDaHVpbTBpZlZxdndxTDRYUkJhdHNpYnZz?=
 =?utf-8?B?VWpaS2tBZnlQT3FJcDMwWGREdWZpZlZ2Ui9UeGljM2ptZE9wckNOUlRZUktR?=
 =?utf-8?B?WEpYN2hGeG1kdEFtcklkUkZIK0s0dk5TMWp2dHRoTENjakhuTjZqbVhIdVh2?=
 =?utf-8?B?Mk02UXNEWkZaVGVtdURXZlVEWC9HdGNXTnE4ZURYSElKRWM0dVUvTURwQnlK?=
 =?utf-8?Q?hM6ErKkzzyAs75SbGMDfE+k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4625fa8c-4675-4e60-6b49-08d9d456805d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:30:23.6407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnWe6SqG3Es5eHMj/Q6iJ0Q1H8NgnT4OTosjRN3qBdnqg/RaGiHni/TV6rRhKjRHxvHBlXTaKN95/sGcgce0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

This is to aid diagnosing issues and largely matches VT-d's behavior.
Since I'm adding permissions output here as well, take the opportunity
and also add their displaying to amd_dump_page_table_level().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note: "largely matches VT-d's behavior" includes the lack of any locking
      here. Adding suitable locking may not be that easy, as we'd need
      to determine which domain's mapping lock to acquire in addition to
      the necessary IOMMU lock (for the device table access), and
      whether that domain actually still exists. The latter is because
      if we really want to play safe here, imo we also need to account
      for the device table to be potentially corrupted / stale.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -256,6 +256,8 @@ int __must_check amd_iommu_flush_iotlb_p
                                              unsigned long page_count,
                                              unsigned int flush_flags);
 int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
+void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
+                             dfn_t dfn);
 
 /* device table functions */
 int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -574,6 +574,9 @@ static void parse_event_log_entry(struct
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
@@ -366,6 +366,50 @@ int amd_iommu_unmap_page(struct domain *
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


