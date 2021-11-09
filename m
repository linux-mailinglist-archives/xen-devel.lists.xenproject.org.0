Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DCC44AFD2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223993.387007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSYk-0000D9-K4; Tue, 09 Nov 2021 14:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223993.387007; Tue, 09 Nov 2021 14:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSYk-0000BD-Gk; Tue, 09 Nov 2021 14:57:14 +0000
Received: by outflank-mailman (input) for mailman id 223993;
 Tue, 09 Nov 2021 14:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkSYj-0008Pr-78
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:57:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51c91e5c-416d-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 15:57:12 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-7pXC94hKOiS4kHvZzMrRWA-1; Tue, 09 Nov 2021 15:57:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 14:57:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 14:57:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0057.eurprd05.prod.outlook.com (2603:10a6:20b:489::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 9 Nov 2021 14:57:08 +0000
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
X-Inumbo-ID: 51c91e5c-416d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636469832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMRh1TVmrnjdKeqysw7fuqZzraxYoHb4qRDEO2U2g34=;
	b=G6MUJll1eri+vbCC4CbcmSlfylo6LaG2Mjr0UExurO/7HUuMC0SXKpyxTz5ProhGTR7mfx
	TyqlD7Ugd5rdK2MU68J6Mnf4UJ614F4oJ25AyZCysbGF0NkKAvEngdsF+wMyr6Gn8C9xUa
	GWTj282bUqoZHCW8h+c0lhhD3pXvl60=
X-MC-Unique: 7pXC94hKOiS4kHvZzMrRWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4y2llAGDF+NN/rRbFd+U4CfA2AWmdu3KOxpp3Ai8f3xIVOoO7wO6Sv6F0cLT35uQywPIf5l4erO/KSDCqt6QYmAACxMYFu0Cop1vladohY/dcaHIpYrURfMQY/d0iefiGOwXbF2SBIv8r2ujJ/QRt2tVj/7eqSkQpbyY1D9vf93XKuGnWelWROF9tRj5Mgzo6a5yPN32OWV+RVtkUKs1Qn9CYX+MOyRuKWR3iHRwfNmIWBhku4G4cYS9JUQ0K448ml3GdCx7L17a4IoHRKVfNhpegHL/r34YWU/EkDdGi/OeEScG2kpQQyEZISedpMLlDMEssfJXqDhPps+pgrRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMRh1TVmrnjdKeqysw7fuqZzraxYoHb4qRDEO2U2g34=;
 b=RLH5MC/29ts4v1Hx/OmWDpuxpd7KzNLCyVOkTirfjXfdY2z/efqySLuyHP7sMAsH1WNMLgYXX55tSrk9wHQnro7nGjvke/UQb26Z7Q779svAyIZcUu93W5edBcLN4dut+4Npw7jM3bIsimFKPHLOhOgx1hg/yuR8kLery3f72pk2YRrmeEoBFaze/QmU+fISFgWpzwylqWkHYaHNrmHzTXZuaOFkd4aRg1M2L0EX+8mcLkI3ofrWzK2S/PTpFx5n6ZAztJIn526/2glpYhSPy1g/UYTLJ4Q/1KaqXErNlO9N+eXWZNHfurrJGLZjTL/067cAAMgHAOMN1PjYjcmp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <abb32dba-bf89-5dfc-c781-10744a184c9e@suse.com>
Date: Tue, 9 Nov 2021 15:57:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 1/3][4.16?] VT-d: per-domain IOMMU bitmap needs to have
 dynamic size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
In-Reply-To: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0057.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e514dd77-bcb7-4525-da9a-08d9a39133fe
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389A7693441BB329AD3F777B3929@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j4HN2eXbjss/OUXShVfiJHvOgSlAYpQ1syOw07uV8IyQwoxh7TmCFNSwWVLOsLJ/YTybn8xr2PqqQ2GNFdVz0rgyD+NMgb/QpBkn8D9fYIuD+xKb/3M9ruFcOuV1dr/Oe0cLCvPIvc2Sdk/n+Xde6Og1y1bSFZxP2PJDjMeYgtDDcCy6s01r7GRX8YnaHwDrdNlyRA9ebHd6sVEUwaaVHc/O5P236qGD1+su4k4I5yMu619VyDU6YDjRoQu9T+vF/2BV2GohmPBGbfckE6cdPpa0q9UFyvsKML653eValPlJyW5Rz0xAhfqDfxwZthmI16pl76iGkbUYkmGuRpkAVDd0MlTfeSz5ZZS13jAJhbYuQW6WQhAL2BOAx0MPvvdH108EpNKG7zgnfhqcEt7Ded1T6i1ejtAn4wPHUtGr3UTL7f9juTFHOdoN1RHQBTJy+QW9HTMuAlgJtM0mH638qU+jVBunQfsSaAELgXfoCYpHa7+5eVfESHFy4EYSscOTDh72wlqnlQNdwNBCEwDkBIelIla1gIznQ+f00BPu13Ku8ux8RZiI+8iHAraqGrVQJWaRoc9PDzELJI9M6IK3u3BYReWi3skq1cZDXftlDtelZH+0ufNGhzcM5gO8vsmsthaD9nCZa2hsqWk3Yn/VWkIeAWsO42Vk85eajMGz9HQqp4nb3wlKrct8iaZGfDe5fUMB03LFzryis9gl4U1USYZ3H+4jW/wF0NEACFc3U5Zhyovfii4eGU1PeONOCeOB5w19KX4ydxpq32Hw78Z9cQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8676002)(8936002)(16576012)(2616005)(83380400001)(6486002)(66476007)(66946007)(66556008)(31686004)(38100700002)(316002)(86362001)(2906002)(54906003)(5660300002)(186003)(6916009)(4326008)(31696002)(36756003)(26005)(956004)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enhBaXBHT3ZDeC9laEJ0bXlUZ3U4N2syejMwQzZEWHpldFlSSUF6T2QraWxO?=
 =?utf-8?B?VHp1dDNpQlk2eVVhTkZncUd2VFd3K3FCalo4dFdFTEFGK0xxa1BwcmxPUEIz?=
 =?utf-8?B?WWZpSmxPRDR0NXN0dDRhWmM2NENpWGFrTzcrVlF1bCtSQ2VpSXdwdFMyK3RU?=
 =?utf-8?B?Z2FSaU1BOFd2Rm1sY1g5MENuTFVYVnVKUmp0NTgzTFMzT3hBSTE5SXBDRCtV?=
 =?utf-8?B?dzkxemwvazcyWnhxQWQ3R2FRVVcvV0lXMm1UTjg4RWNBOC9aUWY4ZnlJbGl4?=
 =?utf-8?B?QjFaMmtDbmUwZG9XMGdlQW9GcytIcFJrMEJJUlNaYlNlaFROSkJ5c2MyRkZE?=
 =?utf-8?B?RlZUM0Z3aG0vSWRRZFpMT0JWVlM4VlFHV3l1NDRsSzlnZC9UOGoydE5VNi94?=
 =?utf-8?B?UitmM2V6NDQwYWRiemlMUmcvcEF0Y3ZQVDNPdXF5Y2J1bWVHckowUFk2UHZ3?=
 =?utf-8?B?NXZuVGg5eDBlaFR0WUpIRnNPV1VVemw2YmtKUSs4NVgzT0MwWjhEWmJNT2Qz?=
 =?utf-8?B?dlFqbDUrWktGUWpWSEhnOEJVY0hWelRvNmhPb3EyN3Nndk5GcnhYUER5Yk5p?=
 =?utf-8?B?K3JyeGtZN1NPNThmMWRld0JteHY5NUY1OWtmQ3Jaa20zY21Pb2ZKOGpNRXR4?=
 =?utf-8?B?djN0eDVyNDQ2QkIxdFJ1SnRXckkrMlpaelJ1ODNFTXd5aW43Y0YrS25yUnJm?=
 =?utf-8?B?S041dWRxdVlhUXNyV2d5OWE5L2lTWmlBYkx6emhUbHVmSUtlTmlHUXBUK0h2?=
 =?utf-8?B?dis2cEVtQlR3T0VYamxPS1ExOFdZVjdUYWc4Q0MzclpTeEx5UmRmcmZhRFZX?=
 =?utf-8?B?alg3ci8vUzJPUFJLcUdwc1ZmWFJ2dFkvclNPOUpoTUdiZkRVZUlORlZLdW9Y?=
 =?utf-8?B?a0VXUEFoSVIzTlpSd3RMZ3NBeDZlb2xHby9tNE91TmxFZDJvd1dnRzBqYjdw?=
 =?utf-8?B?bjZzZnN3L2RlQ0RRanljMU0ra0E4ZXdnbU42d0tLR0tLRUVTZnduWWdhcVZC?=
 =?utf-8?B?eG1QTTJiQ2tVQ0prTlRuNWFxeW9CTE8yeVcxUkFRU1IrVU04Nnl3Nyt4dlRa?=
 =?utf-8?B?cCsrNjVDcHc0d1FjdXNuWXFHSGdqUEI4Yk1uRjRBVVhxb01EaWVCWnhDeFdI?=
 =?utf-8?B?S1VvTGVXSWVZZXpZbDl5YmJZVGlzcGx2aWJFa08yMGZvNzgzVEw2UTd6VG90?=
 =?utf-8?B?MW9pUUk0WUVod2p6V09yTzh3M3YvMzljVk5xbTZGOVRuUWV2WlNyMzJaRTJq?=
 =?utf-8?B?bjJoMkY4TzBOb1A0RU03eEo5c1FUbHdHL3piUnphV3lmcHU2R3lvQzFHTWM1?=
 =?utf-8?B?d0RtOWlrOTNLQ3YyVlBTV0MxNXVMMXVxbHU0WUQveFdyUWYxSlBsaFVKeCtF?=
 =?utf-8?B?K2hucGtuMWpDNGhCZG9tc3FOWnUvTmF2dzhWeGtzQTFDazVNdzZhdmsyTStY?=
 =?utf-8?B?d3JIQ2YxdExhMWYzQUs3SXhhYjRWYnFUT254K2NTQk5IWDdwczUwTWFLKzBU?=
 =?utf-8?B?Z1BtMHN6ZnBpbW1STVlwcFQwNnlCRHN6aDNvdzB2VFZ6N3Mxa2pXeFRlQjVr?=
 =?utf-8?B?YlFTWm5tU0pYcDA3OEVKL1EzUHE2VzdLWEhUQkxTWU1UMlF6Wk95SDlDQUVw?=
 =?utf-8?B?RVB1Z0ozcTh1N3FlV0hLbWRTRjg4eHl0d0h0TnlZTmhWZU9EN1l3OTU2MGYy?=
 =?utf-8?B?blNJeW5jSFFONzZCSVRhZlI4YnY0YndjTkJhMG9mM3ArSjUzSk13ZHdUZUhM?=
 =?utf-8?B?R0RqV0pKVldXTDkzTXZ1TTR5WUpyNlRVVTZpanMwdFFEemkwcGhzRzFWN3Vj?=
 =?utf-8?B?QWNNbHpxYVNEbkw2TlBURjRBMGFEaThzRXIyaWNQZExBVlFwZXFPVVlCOFZJ?=
 =?utf-8?B?SmQrWjV2dlR3ekJlNnhKd0ZvejFvL2xidWxvWjlON2FNMzByTnh1c0JtS1hT?=
 =?utf-8?B?bExrNk9NOXl6ZEs1bnNBdUlkQUhyZFp5WTJQTi9TRlNDNW55S3I4K0E5M1JE?=
 =?utf-8?B?amUxdCt0Y0RLOHFEUk94SDREWGt2blRCd0w1RFFyNE55U0F6MnZoU2E3R2ht?=
 =?utf-8?B?WThBbUhmY3pRaWdTU2o3UHNhS0dwbFF6bFp3OS9SMFVrems1MXRJY1hrSWQx?=
 =?utf-8?B?ZGxYUVptV1QvMTNWMTJHQTk1UWxXL1c5amV3aGNtQVZvWTh1MkNkRkJzLzIv?=
 =?utf-8?Q?F878eKmqsZ1G9Ruj8sXpAjc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e514dd77-bcb7-4525-da9a-08d9a39133fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 14:57:08.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MY5+fY2Yrmg/qjL979oibLExDFOA15u9LqrJXP7D/mWe4dtXKZA0bs3JRPLOhonHLF44JoFJ7/O6jUBVdVZOhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

With no upper bound (anymore) on the number of IOMMUs, a fixed-size
64-bit map may be insufficient (systems with 40 IOMMUs have already been
observed).

Fixes: 27713fa2aa21 ("VT-d: improve save/restore of registers across S3")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -54,7 +54,7 @@ bool __read_mostly iommu_qinval = true;
 bool __read_mostly iommu_snoop = true;
 #endif
 
-static unsigned int __initdata nr_iommus;
+static unsigned int __read_mostly nr_iommus;
 
 static struct iommu_ops vtd_ops;
 static struct tasklet vtd_fault_tasklet;
@@ -645,7 +645,7 @@ static int __must_check iommu_flush_iotl
 
         iommu = drhd->iommu;
 
-        if ( !test_bit(iommu->index, &hd->arch.vtd.iommu_bitmap) )
+        if ( !test_bit(iommu->index, hd->arch.vtd.iommu_bitmap) )
             continue;
 
         flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
@@ -1308,6 +1308,11 @@ static int intel_iommu_domain_init(struc
 {
     struct domain_iommu *hd = dom_iommu(d);
 
+    hd->arch.vtd.iommu_bitmap = xzalloc_array(unsigned long,
+                                              BITS_TO_LONGS(nr_iommus));
+    if ( !hd->arch.vtd.iommu_bitmap )
+        return -ENOMEM;
+
     hd->arch.vtd.agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
 
     return 0;
@@ -1457,7 +1462,7 @@ int domain_context_mapping_one(
     if ( rc > 0 )
         rc = 0;
 
-    set_bit(iommu->index, &hd->arch.vtd.iommu_bitmap);
+    set_bit(iommu->index, hd->arch.vtd.iommu_bitmap);
 
     unmap_vtd_domain_page(context_entries);
 
@@ -1789,7 +1794,7 @@ static int domain_context_unmap(struct d
 
     if ( !found )
     {
-        clear_bit(iommu->index, &dom_iommu(domain)->arch.vtd.iommu_bitmap);
+        clear_bit(iommu->index, dom_iommu(domain)->arch.vtd.iommu_bitmap);
         cleanup_domid_map(domain, iommu);
     }
 
@@ -1819,6 +1824,8 @@ static void iommu_domain_teardown(struct
 
     for_each_drhd_unit ( drhd )
         cleanup_domid_map(d, drhd->iommu);
+
+    XFREE(hd->arch.vtd.iommu_bitmap);
 }
 
 static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -58,7 +58,7 @@ struct arch_iommu
         struct {
             uint64_t pgd_maddr; /* io page directory machine address */
             unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
-            uint64_t iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
+            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
         } vtd;
         /* AMD IOMMU */
         struct {


