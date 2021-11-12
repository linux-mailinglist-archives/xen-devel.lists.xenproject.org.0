Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6766344E423
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225046.388661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTBM-0005gd-Ge; Fri, 12 Nov 2021 09:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225046.388661; Fri, 12 Nov 2021 09:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTBM-0005eC-Cp; Fri, 12 Nov 2021 09:49:16 +0000
Received: by outflank-mailman (input) for mailman id 225046;
 Fri, 12 Nov 2021 09:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTBK-0004Mh-KE
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:49:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cada10d3-439d-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 10:49:13 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-52YRadEmOyCYYlQMIy1OCQ-1;
 Fri, 12 Nov 2021 10:49:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 09:49:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:49:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0088.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.18 via Frontend Transport; Fri, 12 Nov 2021 09:49:11 +0000
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
X-Inumbo-ID: cada10d3-439d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF/Vb7ed9I59/XJgr3zPTQZWriuA9PRohF+C+Aac0+I=;
	b=Lz8C8dwbxYi7F6qMDEHqwOdxUk85xBKRPOk5Cnz/1TyUbjjK+mu+1VJbBTgJ6YO/gEaXah
	GcR6/kPrkznNj0+2mpwk+Eo7mleTfyfN0xYWU2VnYMOXz57OAG/s7gLFKt5t5fmNuai+dr
	SzOVTCG8sTgUrDsQ2nUe+wEJ7+ceBdY=
X-MC-Unique: 52YRadEmOyCYYlQMIy1OCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbqFUXWzzSQKzbi5CHiYrcdA244NO+6rN4Zl07uvvl6QYX7UmMXrnwsVI2Vp3C3i7x8AebhGroa4qTddkIw4n2cfASp7p+Z8NoKYnG8tO9d7xIxDSepztaXi9HsylOuVrD10JgiINM7S6F2ct54QhloKD48ETPNYmobVlzArkd+caLe3n5Y6J8iKQmbPzBCrSymBS9leWMiHx5sait1TXJOEf+GSXbsFEx2imU9sE8Gz/WJ8u/NpcyjMG6qCiKpWwPSdb9Ip2fE04lhtE2OTkzUmxVPjiuoptnaEGubEsHRqP0WINih80QhXNnqSnTfpObpNiHLUtm9SY3z1Uk+qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF/Vb7ed9I59/XJgr3zPTQZWriuA9PRohF+C+Aac0+I=;
 b=kO/B6FJLzNWETiph8Niu1mlxwwUeAAxDNFgBF37lyZn+AmBqm0CMe0otsWStwSSDUqhnBJUIhs5g5ID7zYTmwzAD94vbeNpAio6QNT582z38r74J5kurwxRpR1sggh7cpbCQS3Jk8HQXFneCUQX92O5he94m+6IIHwu+Uyel15hPmA5NrQdkZtiL54Q1s0LVWrav+OcDT87SUeKqXcbIaRXYjPfMrd+sQNmx51WSGcacRyWWMEL/VATD8k/UN0yhtUtTfddw2hFyFHojGVy5MmoJ+77ELjhcvSPFqPF0mGcOm+NiLfA0AVLANUFxL9Aig7NI0Yx3gHId79JFxhZoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a802a25-8d86-d1de-446d-0e2d86b5a54e@suse.com>
Date: Fri, 12 Nov 2021 10:49:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 4/6] VT-d: tidy domid map handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
In-Reply-To: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0088.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c71ea85-ef23-4d6f-8359-08d9a5c1adf1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233548F64D20C5DC566F3C5CB3959@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jZ0FEiQg14thbjxTPn3t3J5NroKMzv43dX5soUQ2ctqWOkBylc3V9fGeOkVX2BlnAgxSR9yevyRRmUu19Lm3ThQihWaomqUPhq+m9oO7n6fEISCisZkU+LcB7W/XpY9jllWdx76KhX4qGb9GbnC/XCm3s6Chqza70nscamwh8soI5l4nfFEmg3eLrIyaOBajfVZ7yqXcLfLesHzrmw+NAsXLOFcEisS5S4epYz2qYECZ68ucgFGgblVYiBO9jQaOX1e2aNCcG1gtZ2QiOa2/odd/gFUSPJHnGJ+QmdIBFBwrXMo7FNI1uYjZgJMQYgyE6rjTUzTk36H68LBlFf2/xeA6P85uprd4gFdkB7ipQzu2hjQ5/GIWhCBxofRF4FgX0du5rug7VDBOiseVn1htXu+QbgelhGXMbgRa8jGi5iyWhv7ns1ouLoKrac3lui2mX7OfObn1m1SFREt0sICTbQ2T+pBz9f2qRlsmvMkYnIsQXQ3mkHFZ93mUj90YKQm1RyGI42wb1XC4SeuOV9bpYOAvBMKwoWTA6wUHQgcAWXvszcZkwx/Z8FqPIJ02mNm+FolKCFHH7DmL5iJhqXNJ8wROQdNBpeE/NIzfRp2V/Ie5p76Rh6D9699OwicCG1WQcaC/et0NWgCOI0hEuOcXdrwBuhJKXVGbB1SMhAmwKkuXR5iUSdjvMoRLtj1izLMcInTrB+ybPD7bBe8nPEK0ZDn0MEr4VTI02B/oSK6rzJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(38100700002)(66946007)(66556008)(2906002)(8676002)(508600001)(5660300002)(8936002)(6916009)(36756003)(6486002)(83380400001)(16576012)(31686004)(4326008)(186003)(26005)(31696002)(956004)(2616005)(86362001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXdTbGhDeDFLcFUrbGxwaGRhZ2R3UXZkZFZOVjZlb29hMmpiWnVGaUhIUHZC?=
 =?utf-8?B?dFRMZkFpUWxpSmZ2VnVNTWdzVCtKZU5maGl0S2l1NzZ1K0NteUdtcVVudFVR?=
 =?utf-8?B?djVRVlY2a2ZmRkdqbWsza1NYWDdsMGNLWE1pRFp2UElHaWRHc2xRdDQ4blR2?=
 =?utf-8?B?RTBYVWdOMXN0bWhSMWZ3aWxLYWZhYkUvZDBPbHRyVDZQd3NFYWt4ZjVkTzFI?=
 =?utf-8?B?UUE3MmhZYVJOMTFHSWQ5RzE4WTdOUm51TGwrWi9UbTNuQm9icHgvMkJOWlc5?=
 =?utf-8?B?Y0dTWVFkenZqOG5YRDFINHBhVDU0VndXYVl0a2F3eUFxTmpFTnlaRDg5Wkdl?=
 =?utf-8?B?aUxEYjR0TnR4Ny8ybUpqcEs0c2FueTU2cVFPbXFSL1BLeHpYNkJUT01yWEYy?=
 =?utf-8?B?SEUyY2hrTTQ5Vy8yUWorRGp5RnJRUFNKemZtTVc5ajRIeWpSdTBrRnJlMitD?=
 =?utf-8?B?cGJFR3JaWW9GU0EvZWsySTI5eFp2UGFWMUk3SjRnTHlzWnllNUE2elQ3WFNG?=
 =?utf-8?B?UHc2MFFITVVPbVN0aGtiZ05rMTJTaDVLNjcxM0VSV3J3UDhEU2hJaUdhdjJr?=
 =?utf-8?B?YlhFaGtTWU9zTkhtRVpnbmw1SlU2RzhOWVVEdzArbEZWZDNkY3E2YUVqVWFk?=
 =?utf-8?B?VmQxQWE3QXE1ZXJ0Uk9oU2N2cHdrbEUybElZZ1FHRDd4MnRpTWZRaHJCOVpz?=
 =?utf-8?B?SHVvR1M0SXdqZGdVMGs3bk1mN2RUUXJDWEo1dHpTcU9TSWVxWXVmenhNb1JJ?=
 =?utf-8?B?UHJJekVob3I2d1pqanJaV0hvZ1NOSEpJaEp5TzRoZExIeWdPOW5NK2NSa1Vw?=
 =?utf-8?B?S01ZbytzOTBJLytoYlRFamd5K0dPRXF5bnh5Tmw3QTdFbWt4bDEyV2d1R0N3?=
 =?utf-8?B?dDFwc2JUMVRyalc2QzJ3OUc1T2I0d2psaEZZbkVJMEdFZGZWQ0c0Ny9SL1hu?=
 =?utf-8?B?SUxiUzFrcytlOWx4WGJFa1NpdUZHZXM1TmpzMkFxQTdxUVVRSTA3N3NSdFlI?=
 =?utf-8?B?UFhHTzB4Q0RrQnNIZUZnK09Yb1FSRVk5d0tvYXJpcFM5WkxvT0VJSGFsN0ZV?=
 =?utf-8?B?cmp0aVlGQkxKSTlWS0s5TDI5TTBLUjJqUGROSUdhNGNHaS9KSGF6bzlIblhm?=
 =?utf-8?B?OERDU0JMbFdubHNUWEh2eGtiWnhadU40UDhEZ3N3eHVNaFI4bVQwK1BjWE1N?=
 =?utf-8?B?NW1CZmxOeFcyZ1g0RzBrcWU3WUg2NWYvTjJKQXJBN0JLNStkbnRORk80K1kw?=
 =?utf-8?B?by80T0xNYlM3UUQ5Q3ZjTG1xZnpWRWh4ZFQwZzNPU2tHZEt2bmF6bWY3Z1FF?=
 =?utf-8?B?UE03M29STVI4aTJhSGxQM2ZTVDJFVk5EbFRsMk9haFpndVcvdkRjWmkyT2dv?=
 =?utf-8?B?QWZQeFYzMjMySTMweE55YktWVStvV3FCR0Q0TVJ6WVV2Q0lYY2VNTnFMQzVY?=
 =?utf-8?B?ZWx4aUJZZ2xSVm5BckJLVXlocEdqMHBpNVBGMHVXbklVOEhEK2s5ZTkvNHpl?=
 =?utf-8?B?SmZDajRvVDhSN3VlQ25tTnYxeTdCdXlhc0JaSHBsRWhycWJ6WGVlcW94NmR0?=
 =?utf-8?B?YWZROEp0TThlRktsYW9keTQrUHQzb3JYSVFNRCtsZW1wY2ZLR2hoa3lJWTJw?=
 =?utf-8?B?ZFFhWm1LOXRXcXltYWZyU1BNSmNMRDFFNXdBVDVVelB0TXliNVFkQTRKRU5K?=
 =?utf-8?B?VE9OWDhSb2RibWtUZjJhYUJtVURGNlhod2laV1RneTQzOU9SUmRzbE9YRFg4?=
 =?utf-8?B?b2lxelJ6d0Y2L3oyUnJQRkE3MUd3SmI4TUp2TWU2NlZTNFVKZlRZUnlCNkQ4?=
 =?utf-8?B?a3JiUWh4Vjh4ZC9Gb3MrWjcwOVFrTWhhd3B1dzJWTTRHQ2psemQxRlBEcWp3?=
 =?utf-8?B?b1Fva0dObG43Nld5TmV3Y0E4aEJKdEpJTDRkQWIreUxGMFRzZTdYUGxZNmJN?=
 =?utf-8?B?K0w2end6dUEzNGptU2xxSmRJbUxpZW51Q1UxelRGc2lHVXpMSmE1Z0RLOGEy?=
 =?utf-8?B?VDNaR0pzeStzT3d5YzVJWmJXQU4rWDYvWXVVOENXajdFV09abW9GMm1yZDFL?=
 =?utf-8?B?WDZnWDdJQ1laR3ZwKzM2Z1owWm5WVnNLRURFNE1vTGFOTEFrcEFvQVpBQ2Nm?=
 =?utf-8?B?SkIwTkI0NzhGeXdhdVhFNjl1M3QvQlAvOVdUd3lTcTNNT05HdHhDZ3VoNFd4?=
 =?utf-8?Q?6n6SKzl4fSz/XVuhTAoz6d0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c71ea85-ef23-4d6f-8359-08d9a5c1adf1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:49:11.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+yb/xb9i44YKQRgDuliWM1GXxsrK7Reqlnuwui+RyzqZHI8hXQ1xeg8i5SQGABPXO5GbKnfpYGW3AzPnfy25Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

- Correct struct field type.
- Use unsigned int when that suffices.
- Eliminate a (badly typed) local variable from
  context_set_domain_id().
- Don't use -EFAULT inappropriately.
- Move set_bit() such that it won't be done redundantly.
- Constification.
- Reduce scope of some variables.
- Coding style.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -62,10 +62,10 @@ static struct tasklet vtd_fault_tasklet;
 static int setup_hwdom_device(u8 devfn, struct pci_dev *);
 static void setup_hwdom_rmrr(struct domain *d);
 
-static int domain_iommu_domid(struct domain *d,
-                              struct vtd_iommu *iommu)
+static int domain_iommu_domid(const struct domain *d,
+                              const struct vtd_iommu *iommu)
 {
-    unsigned long nr_dom, i;
+    unsigned int nr_dom, i;
 
     nr_dom = cap_ndoms(iommu->cap);
     i = find_first_bit(iommu->domid_bitmap, nr_dom);
@@ -74,7 +74,7 @@ static int domain_iommu_domid(struct dom
         if ( iommu->domid_map[i] == d->domain_id )
             return i;
 
-        i = find_next_bit(iommu->domid_bitmap, nr_dom, i+1);
+        i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
     }
 
     if ( !d->is_dying )
@@ -88,61 +88,52 @@ static int domain_iommu_domid(struct dom
 #define DID_FIELD_WIDTH 16
 #define DID_HIGH_OFFSET 8
 static int context_set_domain_id(struct context_entry *context,
-                                 struct domain *d,
+                                 const struct domain *d,
                                  struct vtd_iommu *iommu)
 {
-    unsigned long nr_dom, i;
-    int found = 0;
+    unsigned int nr_dom, i;
 
     ASSERT(spin_is_locked(&iommu->lock));
 
     nr_dom = cap_ndoms(iommu->cap);
     i = find_first_bit(iommu->domid_bitmap, nr_dom);
-    while ( i < nr_dom )
-    {
-        if ( iommu->domid_map[i] == d->domain_id )
-        {
-            found = 1;
-            break;
-        }
-        i = find_next_bit(iommu->domid_bitmap, nr_dom, i+1);
-    }
+    while ( i < nr_dom && iommu->domid_map[i] != d->domain_id )
+        i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
 
-    if ( found == 0 )
+    if ( i >= nr_dom )
     {
         i = find_first_zero_bit(iommu->domid_bitmap, nr_dom);
         if ( i >= nr_dom )
         {
             dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no free domain ids\n");
-            return -EFAULT;
+            return -EBUSY;
         }
         iommu->domid_map[i] = d->domain_id;
+        set_bit(i, iommu->domid_bitmap);
     }
 
-    set_bit(i, iommu->domid_bitmap);
     context->hi |= (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
     return 0;
 }
 
-static int context_get_domain_id(struct context_entry *context,
-                                 struct vtd_iommu *iommu)
+static int context_get_domain_id(const struct context_entry *context,
+                                 const struct vtd_iommu *iommu)
 {
-    unsigned long dom_index, nr_dom;
     int domid = -1;
 
-    if (iommu && context)
+    if ( iommu && context )
     {
-        nr_dom = cap_ndoms(iommu->cap);
-
-        dom_index = context_domain_id(*context);
+        unsigned int nr_dom = cap_ndoms(iommu->cap);
+        unsigned int dom_index = context_domain_id(*context);
 
         if ( dom_index < nr_dom && iommu->domid_map )
             domid = iommu->domid_map[dom_index];
         else
             dprintk(XENLOG_DEBUG VTDPREFIX,
-                    "dom_index %lu exceeds nr_dom %lu or iommu has no domid_map\n",
+                    "dom_index %u exceeds nr_dom %u or iommu has no domid_map\n",
                     dom_index, nr_dom);
     }
+
     return domid;
 }
 
@@ -1302,7 +1293,7 @@ int __init iommu_alloc(struct acpi_drhd_
     if ( !iommu->domid_bitmap )
         return -ENOMEM;
 
-    iommu->domid_map = xzalloc_array(u16, nr_dom);
+    iommu->domid_map = xzalloc_array(domid_t, nr_dom);
     if ( !iommu->domid_map )
         return -ENOMEM;
 
@@ -1477,11 +1468,12 @@ int domain_context_mapping_one(
         spin_unlock(&hd->arch.mapping_lock);
     }
 
-    if ( context_set_domain_id(context, domain, iommu) )
+    rc = context_set_domain_id(context, domain, iommu);
+    if ( rc )
     {
         spin_unlock(&iommu->lock);
         unmap_vtd_domain_page(context_entries);
-        return -EFAULT;
+        return rc;
     }
 
     context_set_address_width(*context, level_to_agaw(iommu->nr_pt_levels));
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -505,7 +505,7 @@ struct vtd_iommu {
 
     struct list_head ats_devices;
     unsigned long *domid_bitmap;  /* domain id bitmap */
-    u16 *domid_map;               /* domain id mapping array */
+    domid_t *domid_map;           /* domain id mapping array */
     uint32_t version;
 };
 


