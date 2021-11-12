Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9044E4A1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225114.388788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTrO-0007qT-M6; Fri, 12 Nov 2021 10:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225114.388788; Fri, 12 Nov 2021 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTrO-0007nb-IM; Fri, 12 Nov 2021 10:32:42 +0000
Received: by outflank-mailman (input) for mailman id 225114;
 Fri, 12 Nov 2021 10:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTrN-0007nO-Kr
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:32:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcbb69e2-43a3-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 11:32:40 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-uwqBQAlXMRyRZCQakoyZYg-1; Fri, 12 Nov 2021 11:32:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 10:32:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:32:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0102.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 10:32:38 +0000
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
X-Inumbo-ID: dcbb69e2-43a3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636713160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uXPdj6utTVZJv737OWw1P/pyaL30rwsVcA5yvBiI65o=;
	b=L0o6gJPzNyOuigKs0/IIbw9EMC/A4rgheDre1TVWi5FSy9F++rHaeivepPRTJFerXlULhI
	p5snUNAeHpGywSpEmCYYtqM3LIHVo3qMdzxNlNt+wljKLjTm7Wm/VU4sfel82L7rztxWlG
	T/5cv0PMDEKowydH3jStSUea2FTZZo0=
X-MC-Unique: uwqBQAlXMRyRZCQakoyZYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loU1Qp6c1twDLTaVW3N9qMWT0zeS9vN25LOllNj2eSicQtMV3/aqFyhz1yshpTsKabDEhjT9K2sUaKsYUxTgaC/zBx5XbieV2z27oNLzddw/0ZC8L6K9103tlMDwr+U1G2ALXVyJY4nttZap7z7y2viUxIQWb3HLA4DivIyk8AWB7X5NBS4GwCCmqA7/RWwdWrugsILrWrtUFkSAq3MEP7xtcmG+pNRsVDNdwMM7wF+zm7coE/LWMYhy1thTvewmnwvlNt9CunnyXYAxGqatq/KvOvW6HLLq9hEuFqKt+Tl7SrBLiF2jHE7EkQjBbK+1MU/XPFpqW6/iwG8AjkzKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXPdj6utTVZJv737OWw1P/pyaL30rwsVcA5yvBiI65o=;
 b=ERJSzh9AFGMOtFaw3RUndM90TbWG6fxyN8DmV3NS3iaMUjvYsWUmQy5nBQPGB6CnEVZJI1TmcfQafsMgeyBOO5pblIlq5U4YGNbeSP0Q/32m3fshl7kL9ctubguSSICyd3xrtaXbkU42m3YUzU0DxDuxiGfGb5oAYixq2ZEIFUvWpq44+au9h+XHWuwe18tTmRYuHDsMJHimImM2dAId1exHGE2MZZUhSDraP7TOIv3Lzt4i5byCvYWHQ5p+YqH/5Mqv9CuVczBvjIlM8gIWCB7A6crPX1M7Hjp/er+nKBRio7lo+OcXHWwHLgHPBto0xJ5avlKaoUTDGnwcTpJ4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <684f2650-7230-debf-1de6-21745c8efa9b@suse.com>
Date: Fri, 12 Nov 2021 11:32:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH RESEND 1/3][4.16] VT-d: per-domain IOMMU bitmap needs to have
 dynamic size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
In-Reply-To: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0102.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eea8e971-4d42-4292-9a67-08d9a5c7bfd4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39338B0B8A39F4BF3B29FD20B3959@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4OnRFJLDBNaS3rhCGVtTvnThTkNzBwGS/y8xUZ1o25EsfbSoiM/LMcseZ9xMou/3iW8Nt+aTKLMRbmTkBiVZA7HI0bdITsjXEZx3ODjijlU+PBcCJI+xx3LVa9Xy/w4W04A9FxkujxcLwNE6UeNd2rN2K6RwIty44dGEvDaXAK9kHMIvCOlHNokObR5ONfsaYw70e3hksve63HHPCRSwzySTCW0bNML00i2iWEUKi0Ubzw0D9ebliirkIAxlmkk2R6FRmmt94itWcW+eXsaTHvRomhKjp12ahRpX6ZaIGs2GGzbrnqNDRyvEQq9EuT/7DdNz2Iqk7Bt8vS4A1AOyS7hux4DUoSmsgEa+LmgKDhjABqCNbq58hXqNruancG+pBHIaghSQVictE1hFaVbfzpPUlHkm5Vu0Q1nLwdMzBeND951tBu5mbMIitaczExWKcXA0yjRB277ngAJvPs+A0G83hJVk0r8p/vgbYinxudEoGj9kw0ynGNdntNc4Ll94dRDEwAj9h6k09T4NAZjLOSyH0cFO16uHAPaLAzulXuDwIbHZgPqmflvwS5hwHw5G8wJcgn1baHplDkkyZS2N84XfBqOKWj8JI2G56KHbGrNC6Uy6mypOh1p0gtEpmCS7y45lq7jSpdaGIX0FXTMpbhK5p1A9S6kKzhlWkzdf2gjOpxwI+/AuiisKuhQVyK6nCWBUXa0WFswIJQw0zUg9qzCY3QSUPIswDj1aKrzIaKbyynPXKtM7363FPe740o/Ri3aoEzudD099VhyQzQNAlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(8676002)(186003)(66476007)(26005)(6486002)(4326008)(83380400001)(8936002)(508600001)(5660300002)(956004)(2616005)(66556008)(66946007)(2906002)(86362001)(6916009)(16576012)(316002)(31696002)(36756003)(54906003)(38100700002)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1c5N3FqNksxcHZqaXFnQkVVZGZsWkNIR04zUDFRbUVXUlRSQTdjQWxPUEtN?=
 =?utf-8?B?M3VvaGU3Q0pMYWJZZGlSWk1EMHBsUHB1ZFgrS1BGam9uVndLK0g5T0gwQTEr?=
 =?utf-8?B?TFc5TEJoWm16cmVCUWE3cmtjaDQwSjNzdUE3SFJOSXl0STJWYUVRYWgwa1Bt?=
 =?utf-8?B?bUxCbkthZS9LUjlYTmlueU5BTmYrVlFxMzBVSW0wZHVVNThHcUpqbEh5TzYw?=
 =?utf-8?B?VVVORzc5TnJyWlNVNWtuY001NG0yaktzNks3dEU2Uk1ubERtZ05ZYkZIc2ZS?=
 =?utf-8?B?YUJQbUg1b1BHcWhsUE4xOHg4aFl6dVBlSkN0MHZFVUlGRjI0Nk55cTltcjc2?=
 =?utf-8?B?dWtoYnk2ei9VaEx6c0E0UVR2aG91bVJ2WkVWWnUzRHNVMU13NnRodWpIclpk?=
 =?utf-8?B?amljZzVzT3VIbWlOTVFNN3ptU3o3ODR6dFhGcExjMDlWUVAwcUtyMlZYRVJP?=
 =?utf-8?B?d2hobi94ZWRFQTJjZUt5TW9YdHdFWDJyTGtlaitNOUNReFU3a2E0S05GSS9J?=
 =?utf-8?B?WEJkMGtHVXJCUmR3ZjYzZWxQSEVjTG96ZGxOa2FBc1doTkxLUkI0MnpzUlg0?=
 =?utf-8?B?MlY3Z040WndZY3NsaU13Mk1QdzBzbE8rQWxLZXZrcTRSNW1ERFY5Vi9FUHZI?=
 =?utf-8?B?cytwZEJETzJFSnRqalZub1NKaEtPc09QTmM1UnpiUVEreU5ZUHRmWlYzeU44?=
 =?utf-8?B?Q1pQQlQ4c09tUmtOc3IwcVNPbCtXSjdlMktDRHJnWkk5WkR5SzZpM3JmS0lm?=
 =?utf-8?B?VzJDS2F0bTVHb3hDSlRTR2U4eGpyelRTaDUxWEFoVnAxZnV6UDQwVDlZdGZI?=
 =?utf-8?B?Kzd6SnNEeVVzVGEwUHVqZ3RPNkhldm1hWjl3L05hUXhzL3RSZko3Uzh2cDJp?=
 =?utf-8?B?NG90Y01hdVAzZjNHdDJsb0dvc09IcWd4enViUzBrTUxrWjR0RnJpS0tmZnNR?=
 =?utf-8?B?M0JLdG41VEM3TEFHaXo4eW1VUTdFVlljR3ZHdGFIM0xuRW1xS3JaN00vVmdF?=
 =?utf-8?B?R1ZjZ2FudVVhYytIUkVCL25sVmJCREQ2SlROaHp0azlaU0RYSTA0OHp6S2Rk?=
 =?utf-8?B?bmxrQkY2NkJFdlN0SytqTUtJS05ONG9UZnFJeU1LaGxpNTlsVmZMQ1MvaG1G?=
 =?utf-8?B?MGpZZ2xhWVlBWjFkV0crUUJrK0krVjlQTHZOU1QwUCtBMXdibGF5L1J4cWc5?=
 =?utf-8?B?RTJBOS84Zmtqc3Fic29aZ0ZSYmx2aGlQa0ZYd2xrWkNsN0dLcG1OYlNxUzl5?=
 =?utf-8?B?WkZKMk9Pd0EwV0pNNjRwNTZYbGt4RVB0YW5zd2pRRDJMZlJRMnBxaXQ4ZC9X?=
 =?utf-8?B?VldxdDYvNm13R213aWRqczI1UkluSlloTm5GRGRZRzBuT09ZQ2tNRXNwb2VF?=
 =?utf-8?B?ZXBTeW5OdG1iWHIzOVdqeE9kbXNuOW80VG9Zb013UmJweUZHK3hXUFA3aHBM?=
 =?utf-8?B?NXdUcXRxcENndjN0M2k4eGlZWksyaGZUWlF2S20xNzhjc3gxRitjcUJhZ0VW?=
 =?utf-8?B?cUNJZTZEL21QUUJoNVBxd282TzhxQjNXTTFVMS9yRkIzOS9aWHpucXVaMHRR?=
 =?utf-8?B?ZXVHMXNhZzNzTytoUW9lNmNvN3lSL3Q0ODNIeHVuZXh3WXdyRzNVaVYxU09G?=
 =?utf-8?B?bThKeVZNR0ZCVWF4VTh1SFJFbEEwbUhQbnloL1lGay9UcFZQR1hHc005TFI3?=
 =?utf-8?B?dk16c2RIZ0xWcXp3WnMvdk8xK29EeG0zRlRqazNDSURacUZCYkJvd2Q1Q3lM?=
 =?utf-8?B?cFRYMXdoWDFqcEhuQXk1MkNBb2ZRUVBtR3lUV1RBYTNWa1RxNFRtU2I4Sytl?=
 =?utf-8?B?dXNURGtlZm1raTZpOVdTbkpzeUZFNFFaVi9tUWM1Nmtid0loY2xEdnUreGxL?=
 =?utf-8?B?VmVVWEhHRXpIZnIwNFM1RDNheUR2OE4vYmlJMEtIRS84OTZMaHhjbmxhQjUr?=
 =?utf-8?B?eEhCSHdVcTRPb0VsTkNMRlN1eWtTNGRNWmRodTM2dlAxK3ZXZE9XMFhabEJK?=
 =?utf-8?B?M0xXY1JBU0hSbWx5amRYOFhVeHRJT0x6alpJMUlGV3A5bnFqb3lyMi9pYkZL?=
 =?utf-8?B?bXlZRnJDSWpRKzFwMkxJeXVveW1wOVdOSklFQzRMbEUxcHhYQ2xFbm1JWjFF?=
 =?utf-8?B?WnlDZXc4ZVh6QXFVMll6c054dFRNMXY4a3E4RUJUUDVSenNUM2N4aDZTZ1VS?=
 =?utf-8?Q?m5yaNWzmSL7ryJKJHlFy6z8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea8e971-4d42-4292-9a67-08d9a5c7bfd4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:32:38.6261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1Lpv2poG0wMxRqc3x8lX7JL+4XN/6GVi9tONirQgEwQDNI395ql6lGFilz8WP8wljAdGr/BAdzR77cLCkKmBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

With no upper bound (anymore) on the number of IOMMUs, a fixed-size
64-bit map may be insufficient (systems with 40 IOMMUs have already been
observed).

Fixes: 27713fa2aa21 ("VT-d: improve save/restore of registers across S3")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>

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


