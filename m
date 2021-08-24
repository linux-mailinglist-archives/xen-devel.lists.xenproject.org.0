Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757793F6012
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171451.312867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXHE-00069E-Mo; Tue, 24 Aug 2021 14:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171451.312867; Tue, 24 Aug 2021 14:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXHE-00066d-Je; Tue, 24 Aug 2021 14:19:44 +0000
Received: by outflank-mailman (input) for mailman id 171451;
 Tue, 24 Aug 2021 14:19:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXHC-000611-HC
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:19:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5224aaa6-04e6-11ec-a8dc-12813bfff9fa;
 Tue, 24 Aug 2021 14:19:41 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-A46ko_VeOXqQgrIpz0l45A-1; Tue, 24 Aug 2021 16:19:39 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6161.eurprd04.prod.outlook.com (2603:10a6:208:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:19:37 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:19:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 14:19:37 +0000
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
X-Inumbo-ID: 5224aaa6-04e6-11ec-a8dc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/xqY7vvGGkXpN8hylBtpj3jGQh5qHksSw0RnRhvYDs=;
	b=JSjBy3lBJ7NcZy3sfwd1koim16KeZqhxBbGHR51LMAzdcpyqQTSD67h2Xl1487C5ipKOuh
	Mx15WkDAbNEgFNSnNeUi6aD0zT+Fkpedp5R9cYckA9+NyMaw/xqpc0JcoLXyOxT+G9hzt5
	r3hWQALNeHqp4R+EkoSHZoD5oIkaPlQ=
X-MC-Unique: A46ko_VeOXqQgrIpz0l45A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCSLzVtCej7hfsl5YYy/lgNvP/CeYU+HhKrNytburNelZRGnW/Q5UZvpQimYUOqCF6pQx4SQbdHFdqTXZUP/yhUDxt4UvMOilp4qJyn9p5dLk6a4i51VKdUr45lQE3iCqa6GKgvl8BDZ/j8FNC5DD4Dsu8bGye2kvsxC8mTP5EipJ4YQzUN97BlY5dhceSCsmEveArpRMgB6+0oRt7JBk9vJJM6a5yZnkgP/uf4LiBJPlk1/iCVmkbum6xDPvykipoDodJ0/3uv6ECzF5Kp5vxYoVdcezisVG1rEQ16I1nyr7sSHYG4/81/ZQ7jFgcjtEolmefWwgZ+biH+0ouXhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/xqY7vvGGkXpN8hylBtpj3jGQh5qHksSw0RnRhvYDs=;
 b=oTMd2otgCIxsNNtute4yvKQTCtSmSvxwJklAgY4tblKMwZkG6JGBiwNMgs7XVVY0SbH9yasQDX4h0nV89i6ql3Uv4BL95yHCk+5S0eAvPk0JAa/ftvyRpHk2N2fjeWU8B3G1TmlIVHNVplsZZAnCMBVh4uv5UPfLdEyYN2PJHQ/v3CW1gn21LSVSUhN57PNS5qIDMDU1rI2rXqF1V5hR0f4F9ggYjPwi8H3hi9bBj+2tjKuCHjxG3W/4DyDWKNxZEwPlz3Ka86VRZPe8eBry1PhIthxfNAtnrmQLll24F3e2iI5CbfWhQ0wfgB6DPfyTBY1aXPMt2vzbKzmy5wd3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 06/17] IOMMU: have iommu_{,un}map() split requests into
 largest possible chunks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <a3df4f6c-6b11-d404-9703-cf1335a60ae8@suse.com>
Date: Tue, 24 Aug 2021 16:19:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf1a310-e229-4a9a-aa4b-08d9670a346e
X-MS-TrafficTypeDiagnostic: AM0PR04MB6161:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6161A6E97316238E5E80E5F1B3C59@AM0PR04MB6161.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kUvnqAhP/80vFC1Bsq4JNM6oFvb9FoD/sQGCqzuSe/O2/9XnxvTt7DiAcguk3nfP8VKssTytug8swrEU6tAJlHWU/1dHhjI4Qe/5fEPjvgicx+f4kH+n/k0IboGb3mT5M/tV2DK2jcPly/96+v62L79QqWLl4UXV7qcCTrCD7iZRc6gA1cb5iCKpJvlaTGk5oqq+YFxsx4YgV058A7/WPYM5Lkbi7VMYddrjb6+kWDIQM9cwFIGMEPL97HrZeVwZCnunTd80+v6IYabIqsz3Ts2Czmx91uxRjkDn5euZz4gty6IVP8d2qyHLWHwX3DSaQX92fKrelFPLZOMIRAwA1zGrz7BDd673X0m2pX5C3gC2X2pjJ4yhr4hw5j0jOm4EHChRdUC2+X6wQRQErctZsPcD1b4c9RTcUlR6eHRcL+nGkmC/Pz/tu/sxjg8IuP+Zzs8Y+/zksQRWpFDzQaEV4GljYm1rKjNNqCpHPTYbaU3ruiKClAULE62ylnsZDUHXVwO1znUnfzLTXg8W3ZCJndl+EyOpPkRsCOlH2fPIpGmy8eG0WBUa3TZupG7QdMd+VwJFRZ5Z5eCGGW/CLLhQuaAp5YkYAUDlQh1XO2RVegsSLupLmf00fA62tI87ntV2lum/ly9kVWmsbblXd3A9bqfSv0NjPURHNKISrD7KvEjBG+O2F6V6UIebXY07IuQ4W5YIsAoIj+KFGaDrYU34l3R/MReYSsbpMi0r4jSHjo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(5660300002)(66946007)(26005)(478600001)(66476007)(31696002)(8676002)(186003)(31686004)(38100700002)(4326008)(8936002)(2616005)(956004)(66556008)(36756003)(6916009)(83380400001)(16576012)(316002)(54906003)(86362001)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1BRaG5qekNFbndCQkdSQWQzSWpyYWlwWUhrUXNob0ljOGFmWXg2OHlrQUtG?=
 =?utf-8?B?aCtESmxkN0lra0N6T2VXT2FzRXFtNlZqdTJ5TmQzTkhQcTU0Tmk3NFhDbCtm?=
 =?utf-8?B?N1R3RUVlQ0NLemV0dENOMHZxWFJ0NDZuTWZqZHZjdnhyUGNQYUNTQjI3bGIz?=
 =?utf-8?B?SFIzR0l5aGErb1JQMmtXbHdRc0dUUmNXSzVXdUI1T2VWeTg4WjZYaldwU3R3?=
 =?utf-8?B?cmthNWNGVXNZMjJsWDYzZmkzaDY2eXUrRFM4bXh6UlZwSmU5VGNsMHdmeUg5?=
 =?utf-8?B?Ry9yejJGa1B4U29wUVo0Mk81SDFBemtLWjVkMWlQTmRYSE5sOE1uTXMyb0NS?=
 =?utf-8?B?SFJSVTFqWmhqZ2dhRzVOOGo4cGhGSGlxNlVLSFoxbjJaanQyZ2RkYXVlS3RJ?=
 =?utf-8?B?OWJnTTVCdVFMc3hHU3VOYzhVS1hSQ0Q2NHZ4U0tkWisrVWdFUFRqejI5ejBh?=
 =?utf-8?B?R3R3R0lXUlh1OThVbnQ4bWZpc2V3MjMwbEZxYkNMYUpnWnoxQ1VXK1hONnVE?=
 =?utf-8?B?aHNVanNNR25yNk1wVWhCMW1CWXdpYUphbUp5V3doYXZ6cDhSalR3VzdHeTFU?=
 =?utf-8?B?VDJxbFRVOS9VY3VrZ0xFU05xZnpIa2plODhndkEzeHBFU3FIdUFXb0luSUh1?=
 =?utf-8?B?VzlqcVZzc3RGSzVvT042WFpITnhGRGNFdlZRci9aWnY3Vy8vclZ0VHVlNE5B?=
 =?utf-8?B?SFlMNFIvaEtITGd4M2hBemZGTGp6YXZpV09MVlVnZllQQ1ZSY005MFY3YURy?=
 =?utf-8?B?ZTErNUNSYyt3Y1JpeEFmS1l3MmFaWDZnMmxwai9ZakNqWXdUMlRmTDQ1T3pS?=
 =?utf-8?B?NmV5aXZwc1hLdm95SHNsbnRIRVZ5MmU5emNqTUptREVkaG95TTU3T01qcG5x?=
 =?utf-8?B?QXJYOS9LOTUwY0JPUk5Kb1I0bUlPZjlTWjJBN2cvcWErazdDWjd3d2pMZFZJ?=
 =?utf-8?B?NDVMbzBvS0hlWFk3UGQvMGxKUkFXcFNoa1V6TzluOUxZa3hoenNIRGJVUjFh?=
 =?utf-8?B?eWdiQmJjVWxDWWpNR0ZsSGV5SG1NTVROMUMzUGhIenVtWExJZGo0aUNXWElU?=
 =?utf-8?B?QktDQVQ2MGMwSjQ1TGk2d0ZKUG5sMVpqTmpKSk4xSkhXcVJZSDlUYlhhYWZi?=
 =?utf-8?B?OU9vVlJNRlRNUzRoS0M4c0ptQ01sQzJJbVBoelN6OFFwRG9BY3lEUWo1aWlp?=
 =?utf-8?B?Ulppd1ZUeXlEMGNyNmk3SCsrSXJ5QlhCWm8yNmErMTBlMnFsMlZuQXpaRVZ4?=
 =?utf-8?B?M1pnTHZwUU8vdmkzNW04eTJDZTM4TkRpbDYySGNTRDVpL0loNlgzRTNydjla?=
 =?utf-8?B?ay9PLzFSNUtYemxIb3lzUlFjdjRpRzllUkNNcjZFRmUvNitzL1hIOUZwWmlx?=
 =?utf-8?B?ZUR0c09uNEUySGN5dUE4NDdReURTMnlHR0R6RjFyTXhHQ3RNZmVBTXY1dnFI?=
 =?utf-8?B?VTlJMU93c1R3V1RqVjcrUkd1VSt2d3BObnpaNlMzWWRiUEpVSVpCMnY4dXNt?=
 =?utf-8?B?MHlKQ0UwZ0NCSEF1c1hmd1BUVDZ3S0FtRmFwMS9xWUVOeUVxaTVQc2VvWFhk?=
 =?utf-8?B?dksvb3k1VU8yOUdHNlN2ek84UTR3aGNGRTg5Vy80ZitVeVQ2YUlDMDArb1hv?=
 =?utf-8?B?cDY0bFZibDcyNGhFMEFEbk5kdXJzcDJBZ09WY3BadzZnV0wwRmZsOURZRlJq?=
 =?utf-8?B?MEFEeTE4WTZSM3EvbHhsUWdvK2V4TGhlTHB6cmJmWEhxczRQZXd2RHJLV09D?=
 =?utf-8?Q?0M44fAdaEUj7+t5T5x3IisjsgefhTmXJZeNQ4jl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf1a310-e229-4a9a-aa4b-08d9670a346e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:19:37.7566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHzcKnMmKf1+Fy2uoNY3XtUrUtWt5DeDJlHmad4S037dq4+CHpxPxxlMq0HKcxzQITUkVSVdFLaDBR2D4pzusg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6161

Introduce a helper function to determine the largest possible mapping
that allows covering a request (or the next part of it that is left to
be processed).

In order to not add yet more recurring dfn_add() / mfn_add() to the two
callers of the new helper, also introduce local variables holding the
values presently operated on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -260,12 +260,38 @@ void iommu_domain_destroy(struct domain
     arch_iommu_domain_destroy(d);
 }
 
-int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+static unsigned int mapping_order(const struct domain_iommu *hd,
+                                  dfn_t dfn, mfn_t mfn, unsigned long nr)
+{
+    unsigned long res = dfn_x(dfn) | mfn_x(mfn);
+    unsigned long sizes = hd->platform_ops->page_sizes;
+    unsigned int bit = find_first_set_bit(sizes), order = 0;
+
+    ASSERT(bit == PAGE_SHIFT);
+
+    while ( (sizes = (sizes >> bit) & ~1) )
+    {
+        unsigned long mask;
+
+        bit = find_first_set_bit(sizes);
+        mask = (1UL << bit) - 1;
+        if ( nr <= mask || (res & mask) )
+            break;
+        order += bit;
+        nr >>= bit;
+        res >>= bit;
+    }
+
+    return order;
+}
+
+int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
               unsigned long page_count, unsigned int flags,
               unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -273,10 +299,16 @@ int iommu_map(struct domain *d, dfn_t df
 
     ASSERT(!IOMMUF_order(flags));
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
-                        mfn_add(mfn, i), flags, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        mfn_t mfn = mfn_add(mfn0, i);
+        unsigned long j;
+
+        order = mapping_order(hd, dfn, mfn, page_count - i);
+
+        rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
+                        flags | IOMMUF_order(order), flush_flags);
 
         if ( likely(!rc) )
             continue;
@@ -284,14 +316,18 @@ int iommu_map(struct domain *d, dfn_t df
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)),
-                   mfn_x(mfn_add(mfn, i)), rc);
+                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
+
+        for ( j = 0; j < i; j += 1UL << order )
+        {
+            dfn = dfn_add(dfn0, j);
+            order = mapping_order(hd, dfn, _mfn(0), i - j);
 
-        while ( i-- )
             /* if statement to satisfy __must_check */
-            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                            0, flush_flags) )
+            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn, order,
+                            flush_flags) )
                 continue;
+        }
 
         if ( !is_hardware_domain(d) )
             domain_crash(d);
@@ -322,20 +358,25 @@ int iommu_legacy_map(struct domain *d, d
     return rc;
 }
 
-int iommu_unmap(struct domain *d, dfn_t dfn, unsigned long page_count,
+int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
                 unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                             0, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        int err;
+
+        order = mapping_order(hd, dfn, _mfn(0), page_count - i);
+        err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
+                         order, flush_flags);
 
         if ( likely(!err) )
             continue;
@@ -343,7 +384,7 @@ int iommu_unmap(struct domain *d, dfn_t
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)), err);
+                   d->domain_id, dfn_x(dfn), err);
 
         if ( !rc )
             rc = err;


