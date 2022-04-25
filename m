Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9750DB4D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312522.529801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuDA-0008SY-LM; Mon, 25 Apr 2022 08:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312522.529801; Mon, 25 Apr 2022 08:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuDA-0008P4-HW; Mon, 25 Apr 2022 08:36:48 +0000
Received: by outflank-mailman (input) for mailman id 312522;
 Mon, 25 Apr 2022 08:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuD8-0008Oy-SG
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:36:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6e6387d-c472-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:36:45 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-gSnVVsnVNa-CbtIEbv3wKA-1; Mon, 25 Apr 2022 10:36:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3831.eurprd04.prod.outlook.com (2603:10a6:209:19::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:36:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:36:41 +0000
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
X-Inumbo-ID: d6e6387d-c472-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtcZhyZ3f1vF1sJNNT1uwgtm+sm1Ld+qz9aFACUX3vg=;
	b=gYkQ4TjBGzw6RvBgD/EigooTehKz7XibdXx5mTnm0q5SrGFdjN9apTNlVmOhXH76zlMn5b
	GVnyRrpZY5JzQrqbnY0+uOVM5R96k6yMRDXvPJh6N7Qo7AYQJQxRqvAPygTiueXUxFRulx
	785+8mJkxElXusUaX1G2ZtHDe3CGeZA=
X-MC-Unique: gSnVVsnVNa-CbtIEbv3wKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdNXV77H1NXVLu3v1tX98yi5giqrhi1AVSWRKpIeJDImc59aqNeb1coPEGfr9PadNvQBThoYp3+JTZpR3S5Q+UL4s6CRgGdWz5qPmBvaFP8MWAK1IvqS/6ZUCFQuwSwY301oZ//Jd2XMM0gPR3K3k4q2XCrFI9Ko2TiGaSsvBYoObjAFIDyEv2fGDqfMVSRU7NxBBR11ts8OtPXie1qlOtK4WvqtAnrqWuY13Bii81DBPoyTB6aIAyq7tcRGXAJwVq+ELq+ocjNMVi+4zocQ9vHZhKNj79oZu7jDkt2bUT8ybXcmVg/QYMfTPKq+NXrvovjtrucdaJdNahZUf91Xhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtcZhyZ3f1vF1sJNNT1uwgtm+sm1Ld+qz9aFACUX3vg=;
 b=GvKxR8c/dwRcqKyi34eO0hf+wIesvubCyO5d1FCLYVZV24GlKBrUaRhSjYFSmYtNjByxYrt57Gwhc2nFdQaStJxT0IKWl1Cs8uJ9lMsM+49APqZKVxUPXymZWR3QL7mfvy4KnRDVIh4NG7N1Arb3s0cYaSfl1/BNm6J/Qev1aUpB3yXsWWYZsbcldjupgGD8Z0JuqHNvCSV55/RSsTbqxfz7joIEx+0Ac70FHbbH/x9/PXAIPf4ZOxVQ8miQ9IdDykdFQBzUpY5jGZP2IrHQUB0ql9k1fZkKQjTUWRkIV0U7xTVai3JLdPH81BTSb4KzcJzB9o8HZo664s/qaLZZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc32c611-53cb-8c4c-1f97-355d58efad4d@suse.com>
Date: Mon, 25 Apr 2022 10:36:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 08/21] AMD/IOMMU: walk trees upon page fault
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92e83e9d-ff7c-4cdf-3ddc-08da2696b908
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB38316B0FE0523F20657DA3FCB3F89@AM6PR0402MB3831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xm7dGnj4lg4cYqZJgka0kXEATUj/KgewnOFgpQ1hn4GyZ9KuepI5SA64E0xUAq5nNwYL4OePaBatCPsNN8dAL8abJH4i4io9Fxw26kZSSkQl9X3d+FUwm29PvsJf32CWCcCyI6M+6vEtbBPD8wDzuHEu9LAMgXQzCO6ybIrrtcwn6OAzF9FvtjxQCPVi0xdPZYD11F5VCFiJuBBc6XI076oKYX8uvUVaAwWCMHGTxmSm1mNW/CQ30q+CnxjfW3O08t4X0rZrANGUzuFT2i603cROf1yMy4wvNf59epwjXXNrZ4uDwLGlArnZwzmTe4qxOkBpCIZBJxRVk6s5apRE3MehNAaUKmG9/MFJzvI636QHvE5ZtTZk3gYnNre4X6ux0qU/NSaBaq2hrU5an/BticdVztwy7u+uqFxdzr0UvTvbB0+ESQKNot3sEPEeDJbnjfqnBeqC7rTKriGFpBLAjPNoPYPdFgygzvT1zMTJQXal+73JVXD6Sp1H1sNdZVA530fMpAGjsD4rQphOcMoG0IsNeJzggkVS8fuaWMiHr4LzEiEG1pDVJuNiBZO0JI9XUQk4tyQpc9zXO1sx1zFfpOHjXWeb7/lS/lUWdy7g4wdR6kmN189zZxf2Osbk5j2wfup1jfBRpxfdFTIAcHrlLIFEU9NlyG4DetNEKo6Hn+sYyGg4YqixzuHA7rHa2LUR4kroaKGjybyws/Mtr0oO1HN4wQKrUfzgbdziEW8Z9N4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(2906002)(66556008)(4326008)(8676002)(38100700002)(5660300002)(508600001)(6486002)(6916009)(8936002)(54906003)(2616005)(31686004)(66476007)(36756003)(316002)(186003)(31696002)(86362001)(6506007)(26005)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NURQQ3ZrNlhGSldiL2pQemd5dmdXWEV3b3VhOE1Yb2NZamQ2Q0o0MHlVQ3hW?=
 =?utf-8?B?dnk3VEEwcS90NmIrenZsWWJaSHBRYllIQU1wS0VjQ0pFaitYenpORDJhNDhh?=
 =?utf-8?B?TTZXRXpDaW1SdHlUWG5aREVUZ21kMm5iTWFGSkVSWVhYdXdpR1RDYVRHeTJH?=
 =?utf-8?B?aVhZRHh5RnU2NFl5Z0FyZHNmYzZ5ZmJaTW8vTEpqY3NxckRlUE9TRUg4Q1J1?=
 =?utf-8?B?VUszNi9YN3hMbGRnSE0wRTBBazdvdlpKZlAvbWdlUTc2d2dwZCtPZGh4cDkx?=
 =?utf-8?B?VlhGQzQ3bU14NVVmcnZnSWpTaGZ3SmNPQytWUDYrR3k2Qk91NEZpVnVZcGlK?=
 =?utf-8?B?OXh3c2tjSzg4NDhrd0lzNW9hMWp3SWJ1b3pYSk5UaEwxcmxnR2dmTytBRkxK?=
 =?utf-8?B?SzRYaVgzTVg3bzQ4VStBWm1iS0FqS1NBVlg3S0dOMXVZZkJXK0FGRDhqQlZC?=
 =?utf-8?B?K0RBT2lHY3BDZ2FEV0cySFZEYWxiMDJSOEh2SmF5bWY4RzNvK0ZYVHdOZks0?=
 =?utf-8?B?TnVxZmxwVEVUcjZTOGZ2Sm9BR1kvclJJSnRsTzRRMzhTbEcwdE4zVU1yam5n?=
 =?utf-8?B?UzUzM28wM3R6eWJoLzVUbU9PbmtXWWRTS0JNQzFTQ254bExJZXByQllWekxN?=
 =?utf-8?B?V1RjTS9RTUxiQkhTVUNFcWh2cXp6RlZqSXo2NERQY0FiOHlwK250dTNqRXJz?=
 =?utf-8?B?ZjlIYWhNd0RaVTFHcTJHU3lvUVRUODNtSVVDc2FtU2k3OFJ4eWZoOVdRL1p0?=
 =?utf-8?B?c09qVXRrOXhjczN6VHZ1WXI5OWF4VGpiR04ySHRibUhJMFNHUTVCN2VHV3pW?=
 =?utf-8?B?YloyQW5yNW5nWGd1aXl6UExkbmlNYVIrbFoxeDZucEc0bEQ3bERQL3k2a01h?=
 =?utf-8?B?S1hFN0psWGNadmJwQnhyd2Nhd2d2ajVwTVVNMjhCdTM1MEY2M0NBMm85TkR1?=
 =?utf-8?B?UFRPTlRrQStWQ3V1RWl1bUNXS3NKQVlDU2M4N251b3cwcTVkZlVjL3JrS1Nz?=
 =?utf-8?B?TytNbHUwRXNQaC8xMHJCVzFETDVQWFhybnAxeXdNeEF6NVN2VU5UZm04Q3Vj?=
 =?utf-8?B?aGxWVDYxdy9ZUGhWR2Vwa3Vkb1NTeWo0SEpNdHpZUWZnQUUxbkNVa09jbFBX?=
 =?utf-8?B?MURLcWlRU3I1K29xa0lWeURUYnZINUxwaXFQcjR5UjQ3K2lzVVhyQmhRYzJK?=
 =?utf-8?B?Y2QvVFNtODF0K3drR0l1ZmNkRkQ5U1pSK2c4QjJjNEU1OXBVYjlUTGxLckpm?=
 =?utf-8?B?YmRFY2NKWWRqcW9nVFA3ejgxUk9WUjdieXhkWnA0WU1pbEdMOVAvZGtqaEhF?=
 =?utf-8?B?dXhmaUpPU1piekFnWU9vR2U0L2orSXB5M1JjR0hEd1V3by9TbWEvUzFvM2JN?=
 =?utf-8?B?QUF2ciszNjY0OHlsVWQ0U21EcGNqeUlQQTBsY0M2MnVwOFEwQ1R6QXlaSUI0?=
 =?utf-8?B?Y0VDZ2FWc3c3dy9zUEJhWlgza2ZjbUx1Q0V6R3d1dnRLcjEzd1ZZVU1CNzBt?=
 =?utf-8?B?MnpZR3dEWnQyTEZwOWhWZzRxdFR6cHdTekVmeHRZWmJUWWFTTUVCU2puNG1P?=
 =?utf-8?B?a2NSbmZMbnRmeTY1Sk8rYlU1Q3N6K0Z5Yy9lUC9iNTRwK1ZLeEcrdXMxM0lH?=
 =?utf-8?B?dm5zajlrUjI1N0Y0V0k5TDh6Qk1VSFpUWlArbnRkVXVyQ05XeHlrS0xoRytN?=
 =?utf-8?B?bGZ2SUVWUjRkYWYydmc0SmowZnppWlFSb3ZFbVBXNmVNeFh0OEUrdTlPU3A0?=
 =?utf-8?B?YUt6c2YyMk5IOVh3ZUttTmtNRWMxRmQveUdYaWVQR3YydnZ2S0F3VllaUyt3?=
 =?utf-8?B?OGdtVHdqMndiZXNyb1dkKythektPaVNhN3ZNcmxtRE9vYVJvalZ6S2dEenNV?=
 =?utf-8?B?YVhhNzVGSGhQMytLR0VqNGE1SkEydmUwSFA1UnQ3MkdBSG11KzNjdDNNelBo?=
 =?utf-8?B?cHlKWFJVakVhY0xKdTB4Qm01T3lHeExNckExL0xqSXlLUlNGUFBqVWpxVm9E?=
 =?utf-8?B?dFJmTjJRc1FzejhMNmJmTGxNS0Fkb2tWb0dhVDcrOU15bjRneFBJaW1lQUR5?=
 =?utf-8?B?T0dOOVdkYTlRazlBc2xOUmpjVkhlRjhEcWYxL1lPRHlhaVlaNmxRSUM5cHdR?=
 =?utf-8?B?aHVKK00yb1czUkM4WVJCNkswT04xUENLQUFtNUNXcnppRThGeGtRYkNrQm56?=
 =?utf-8?B?endNbkRndW1ZL1JraWtUS25lbVNod0ZoVEZQck5tbHhRRHN3YXQxeGpBMCtr?=
 =?utf-8?B?SUpvSVlCZGVPYm9iWDBIRTBQeDdqbGtjdHNDK0czSktOVkt0M3k5NFlqQlJS?=
 =?utf-8?B?Z2kwbk91VEdXSGtjdTFpN1BYOTMrU25KZnRQeUlkUDE4bUdVNk90Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e83e9d-ff7c-4cdf-3ddc-08da2696b908
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:36:41.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5c2buF642afHOntxQfEsIvR329//ygv1CjYXrIANgUDdYiUPcb8pamR7nb+4pTEpy9uuyUZswXAHuXCAjJ5ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3831

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
---
v4: Re-base.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -259,6 +259,8 @@ int __must_check cf_check amd_iommu_flus
     struct domain *d, dfn_t dfn, unsigned long page_count,
     unsigned int flush_flags);
 int __must_check cf_check amd_iommu_flush_iotlb_all(struct domain *d);
+void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
+                             dfn_t dfn);
 
 /* device table functions */
 int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -575,6 +575,9 @@ static void cf_check parse_event_log_ent
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
@@ -428,6 +428,50 @@ int cf_check amd_iommu_unmap_page(
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
+        printk("%pp: no root\n", &PCI_SBDF(iommu->seg, dev_id));
+        return;
+    }
+
+    pt_mfn = _mfn(dt[dev_id].pt_root);
+    level = dt[dev_id].paging_mode;
+    printk("%pp root @ %"PRI_mfn" (%u levels) dfn=%"PRI_dfn"\n",
+           &PCI_SBDF(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
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
@@ -724,10 +724,11 @@ static void amd_dump_page_table_level(st
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


