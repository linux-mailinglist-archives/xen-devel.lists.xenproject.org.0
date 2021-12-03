Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B7467547
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:41:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237303.411569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt60A-0003al-7T; Fri, 03 Dec 2021 10:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237303.411569; Fri, 03 Dec 2021 10:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt60A-0003Ye-3M; Fri, 03 Dec 2021 10:41:14 +0000
Received: by outflank-mailman (input) for mailman id 237303;
 Fri, 03 Dec 2021 10:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt608-0003YY-5G
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:41:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b5cd04-5425-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 11:41:09 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-iSP_buYKMzKDAoide2Qifw-1; Fri, 03 Dec 2021 11:41:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 10:41:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:41:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Fri, 3 Dec 2021 10:41:05 +0000
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
X-Inumbo-ID: 86b5cd04-5425-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638528069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BeKQsoEw/QHB4fxVezv70Xopat3rYrWVb++YQOpzQGg=;
	b=KGYrbQnR1r39Q2pXSs6DZFlBLzB72EUieIAoilkmL0heGMNwJgnLyPnKtglKIBAIwP78I1
	BS73rG5Q9VTMd7BscO5avoCgc6VlTVtoUiy1V1gKza8RQvlx6L9VND2PGaRQMH147u0QhH
	4biV+kuQwfNSOLE+dfG6XEX0y2eANgo=
X-MC-Unique: iSP_buYKMzKDAoide2Qifw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtvHw8prQqbmGQ5I43T72VqSWQw5WVQTIEKSa1OCzU8U9kt8WirnlKtDvIJROJCnTmjTHf3wYgs/35K6IK3YmSDwkQ3APYWRu/COtV1k2klDVTVAjXk3IKUORbeT99qKDhsDVuY9Gm3alo6fe6hsASz7vjK227qoXnsQPDQEvxWvT2K9r/ktZJVBw2mghutSJSf64MqxdQh+X5wWkI/C2KGv6FlP+LMjmHjGQx99NTLlpR6gaFssLmdON90KFWP4ypXXvXXwgtt0ihtl+jNu1oafe3GfSVW4f+m/5BkA5JD5FFT3NeggX4kZsJW7n1Mkpt59d7diMfks6uIFQfniVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeKQsoEw/QHB4fxVezv70Xopat3rYrWVb++YQOpzQGg=;
 b=XBlbLvV1D77c1aeh652yJWhbxfIL7W/lak4GHHglExo+JlBmhr5wtqkSBxacUsWDt2M0K6debtI2kGtw6bUXxaeDO4H01tA8bCTyLo2DGmvaspg7Xos59zqirOnc/3KvTx6DmUTat0n+2jwCyvlosiBV1JWrBeXR08AQXPHR/cgHIsO6U6UsMsC39OOYbZBdByEshNVAeZCOLpGqv/hyhS/UMQFRUBNTh5WhyecwvZnQQ2tYp3Uj8dZ3GyYGiUS/HgqqWK2XcxUAEeFvNRubtcinr1wATi39UVBMuGsyuh0VzmBBAm5gXub+9HFvSaWXLi67/FCaGlx7rUcj/IWGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7fadbc39-4760-1be8-fdda-455a1a321eff@suse.com>
Date: Fri, 3 Dec 2021 11:41:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] VT-d: avoid allocating domid_{bit,}map[] when possible
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4991bc00-4184-4a9a-1783-08d9b6496914
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3534D57767ECDACFD7DA86D9B36A9@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	21Iz680MIje4sMfx7f/holr3TEeWfm3Z9W4s40qmDIdz7LPFLjFxnPpt9ONIKZRr2Fnpo/ZXkpZyijK+tp8Q19SM0GFmxN20oucTswzpadwWsBUnN2Q1+wVpVuHjvxcWEn3wJQ1xzpOPzaZElF3XMaJw+95s+LQSNt4SDJaH+Ufc8DYsEbV4lW/x1pU4kHpAeR2BsOPy6ROxOySO2A4dGGXQt0s51ZZu3lnAspPd0AJ+iMuxN7wHcyUsdhvdiBqzPQZcMcONrMHE9H/OVdLgvVkbZ2nncHRoS/rmo9hAa9H12Y4yP4n9jj4WmnyIGk+keCypg48Y/4iEu2GN6+2+Gsc5J5hAZ33SDOzk1qUG3RG1WjvsFWIO+K4Ml8wPnWxe5xYg/Qx5DjgBhkmBf1pVnvec7VfpB6q/i8cMoBbSa8eVVeOC10y0CJfVmMRvnMzXF7HPXzawSwwuREN4/gFjAJonnntv92ZLHziJbJ1o1KZqJd0XDg1fkH2WPZTCIun/dfjCgTcTX1GyUmllpQ306MaBIuSY9O+ZhB4ItUQOxDcdnju6ANAC21JMcdM9jAGt7FfabdFd/MmqG5YgDodP5f++QmSr8F1O9+5v4ma+zGO7EutelGvCQu1HMnPhxzk78GA3U1L8LMnaGGCZKvDyp3+25G6+Wr1GTnkMy8kHjk2pC1AX4T1XsGtc+owBfal8vzzkNmX7wmsIqsIRhIAfwFvemtoXvLYTrLq1C4iOmFer0/7cRdxCS3lWAKoFCRGl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31696002)(2616005)(8676002)(508600001)(86362001)(6486002)(8936002)(36756003)(186003)(956004)(66476007)(316002)(38100700002)(66556008)(16576012)(26005)(66946007)(4326008)(31686004)(6916009)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFdUaDJwUjlUR2JKS2puV0U0YnJDUnpndzU0TVRuQTBPVkY2Z0JkMlR4S3pX?=
 =?utf-8?B?WmVUL0NXcmFzdHJoMGZidTRNUkRvWm4wUmw3N3crOWR4UmduNDluQ2oyWDEv?=
 =?utf-8?B?dHBjMnRqSm4xZzFlZGhjeFM5YjBOV2d4SnBHNDBKTHhyRjFRbXpVSVNqeHVE?=
 =?utf-8?B?SjFRSDFYMm5aK1BLMFREbk5SbkNxbmRrb2pYZ1ZTVnBVMlFBSHdVMHNSRW5G?=
 =?utf-8?B?aE1NSGdILy9nRjBxMFJGQ0Q2UWJsOUJsT0dsUC9SRW1ZbmwrZTBmYkVDOHVy?=
 =?utf-8?B?dDcvQjJVRkFlSWJFeW93K3F4a1Z1SlFZVU5yK2RNUUpYNUhmYU9jdlBoRFlh?=
 =?utf-8?B?d0o5QXhMTW9meEZwK0F1OUk2NVkyT2x4aXpQYU93Z0VoS0xqWFZ6SUdUVWdu?=
 =?utf-8?B?OUxDb2lVK29LL0hGREZad3lmQmFycHAveC9pejlhZGp4NEJoUGFsUE9TOXpk?=
 =?utf-8?B?ZE0xbnNJQXFqVSs3aU0wdTNXbzJLS3hzVUFNbmU0ZERSWERZM2ZGajdTQnVl?=
 =?utf-8?B?NERxZmNoT2xJUEEycTBNWnJockdEbEE1eTdra2Zmc051WTlyL0dHdWpldFc4?=
 =?utf-8?B?VWdjT3c0TnRuNVhCUzI1dXVLb1A3TkhpMGlMTTVFcUQySzR2V3hDdFRVTUND?=
 =?utf-8?B?R1l1amMwcWI1LzgvaWtTTmxNdFg2VHVQNjl6L3BhZVQwRm8xTWZmelJvaWRT?=
 =?utf-8?B?L2tvWnhpMTVldlV3Tnh4dFQwNXUyQ3lYU2Q0cXNiTUtCd1k3RW1zV1hMOFdt?=
 =?utf-8?B?RWdxLzJjVVRsQzZhZFN2a2dPL2NwRENvcmpySUhQUTRtYXdLSTFMMktYRzh6?=
 =?utf-8?B?WXN6b2pwMEVwWFd4NzZDb2E0WFpFelJiWEhVZ3dNWE5Fc2xCdUNvMTlhelJq?=
 =?utf-8?B?ZUN6SXJqU05BQndvSFRRQkhveG1seEN6MW1ZWmdySTVvakV0Y3lKQ0hQN1Y5?=
 =?utf-8?B?WVBWVi9KaVEwMGtZKzV1eEVHR2VFQSswSTA4aTZrSkpvOVN4Nk9NTzhxOHhP?=
 =?utf-8?B?ak9ZYXJSVnhmTWJpdG9nN3ZVQksvbTBMQTlzMiszSmltbERLUkRvSFNLK09w?=
 =?utf-8?B?VjZYSzM1RXF5L1BhbW1HNTc4YkcrT1ZtS3pNbVJKSXZzdmtZdEZaVHFKbDNW?=
 =?utf-8?B?bHdXd3R0aDNJOVVkOUYvbUpndFdkU0FBa2FWL1NYUEFUNW53V3V6bkVnU0xa?=
 =?utf-8?B?bEl4YlY5cHVkRkpSSFlaM2w1NEVnVmRjK2pvN2NualpnclphVUFURVpURGdM?=
 =?utf-8?B?eTd6WU1adXh2QXFKdVlrak5wa3hyWnFqdnlkUlc5RmVWei9Kc0M2VUhrV0oz?=
 =?utf-8?B?OFRlV0JsamZSU3RmN0lFZURNV05Ld2dTbzk0WDQ4dVYwSWtpaE1BckRlZUtq?=
 =?utf-8?B?d054MU9xUXFnMjVvTko2bitVdFVEYTFXZUd6eWJ4ZU13VVRyZ2RZY1JzZTFz?=
 =?utf-8?B?bHE5SDRBd3F6aWE2elJpeW1lRDExUmVXSDhnTFRTRWF1SjZWcGdBTFN4KzJ5?=
 =?utf-8?B?Z2JrcUJObXNabEswOUZIOXJoNVhkWVhOY2w4Ukw1a1piQmp0UW1aamlrUEwr?=
 =?utf-8?B?ZkVsMVpBM1lubTBQV2swM0FieDhlZzFnYVkyclhUQThGV215Yzd6M3JrUEw3?=
 =?utf-8?B?SEF4QzhGVk1jYzVxWmMxeXhkeElnajY2WldaMzd0UkhWOG1acWxLNUZyMGVp?=
 =?utf-8?B?dnFCS0JmQ2Y1cC9UVDE0QldJU1FmVkp2bzFmVnJSejFHQXFvU2VpRnEzK3p6?=
 =?utf-8?B?d0ZUWFpkREw4aEV3ZzZvRzhGOWhkZ1NZSUZUR3JReVk1NE1ab1cxVUhBMHF3?=
 =?utf-8?B?dGNjZkp2Nm9MMUV6VEVIbWhmYzNtdDNGYzFBeENZUzRDeHMxQ09SUXdGeThJ?=
 =?utf-8?B?Zk5TdFZjdVpZK2xGSmF1OHdnUlpLQ3A1azRSVDc5SkJIMUMvbzlqb0Vmc01u?=
 =?utf-8?B?UU9DMGRhbWkraWdxOHFtWDc5M1J4c0pkSmhmYmM5Z0kxd2JRY2g0YmJKRXA0?=
 =?utf-8?B?RmJyOTRVdnVNNzhEY3lIUlVwM3FFVG56aDlPQlpKbGQxbjVuVExjcWFBWlFG?=
 =?utf-8?B?N00yejhkd2FsdzExWXBWdlZyOG5Fb3ZZQmppV2F6QTZ1Zys4UXc2aGxpZlNT?=
 =?utf-8?B?SERJbWZoZGdYc205Ry9IUDMybzVMK3JJUVI3L2xCQjl0L0F5eHFWWEhvQUJv?=
 =?utf-8?Q?4aOXiB1BFXHCCF4JEkUaPwc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4991bc00-4184-4a9a-1783-08d9b6496914
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:41:06.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXOKsLT23SxLqXZgilTdrKFgif7/Xx1z5oQJx3ndxGblAsJH/6W6ZIdpYKF0mFwQMEuPM12LjJWgihtJxiv0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

When an IOMMU implements the full 16 bits worth of DID in context
entries, there's no point going through a memory base translation table.
For IOMMUs not using Caching Mode we can simply use the domain IDs
verbatim, while for Caching Mode we need to avoid DID 0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For the case where the memory tables are needed, xvzalloc_array() would
of course be an option to use here as well, despite this being boot time
allocations. Yet the introduction of xvmalloc() et al continues to be
stuck ...
---
v2: Use different BUILD_BUG_ON().

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -62,11 +62,32 @@ static struct tasklet vtd_fault_tasklet;
 static int setup_hwdom_device(u8 devfn, struct pci_dev *);
 static void setup_hwdom_rmrr(struct domain *d);
 
+static bool domid_mapping(const struct vtd_iommu *iommu)
+{
+    return (const void *)iommu->domid_bitmap != (const void *)iommu->domid_map;
+}
+
+static domid_t convert_domid(const struct vtd_iommu *iommu, domid_t domid)
+{
+    /*
+     * While we need to avoid DID 0 for caching-mode IOMMUs, maintain
+     * the property of the transformation being the same in either
+     * direction. By clipping to 16 bits we ensure that the resulting
+     * DID will fit in the respective context entry field.
+     */
+    BUILD_BUG_ON(DOMID_MASK >= 0xffff);
+
+    return !cap_caching_mode(iommu->cap) ? domid : ~domid;
+}
+
 static int domain_iommu_domid(const struct domain *d,
                               const struct vtd_iommu *iommu)
 {
     unsigned int nr_dom, i;
 
+    if ( !domid_mapping(iommu) )
+        return convert_domid(iommu, d->domain_id);
+
     nr_dom = cap_ndoms(iommu->cap);
     i = find_first_bit(iommu->domid_bitmap, nr_dom);
     while ( i < nr_dom )
@@ -91,26 +112,32 @@ static int context_set_domain_id(struct
                                  const struct domain *d,
                                  struct vtd_iommu *iommu)
 {
-    unsigned int nr_dom, i;
+    unsigned int i;
 
     ASSERT(spin_is_locked(&iommu->lock));
 
-    nr_dom = cap_ndoms(iommu->cap);
-    i = find_first_bit(iommu->domid_bitmap, nr_dom);
-    while ( i < nr_dom && iommu->domid_map[i] != d->domain_id )
-        i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
-
-    if ( i >= nr_dom )
+    if ( domid_mapping(iommu) )
     {
-        i = find_first_zero_bit(iommu->domid_bitmap, nr_dom);
+        unsigned int nr_dom = cap_ndoms(iommu->cap);
+
+        i = find_first_bit(iommu->domid_bitmap, nr_dom);
+        while ( i < nr_dom && iommu->domid_map[i] != d->domain_id )
+            i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
+
         if ( i >= nr_dom )
         {
-            dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no free domain ids\n");
-            return -EBUSY;
+            i = find_first_zero_bit(iommu->domid_bitmap, nr_dom);
+            if ( i >= nr_dom )
+            {
+                dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no free domain id\n");
+                return -EBUSY;
+            }
+            iommu->domid_map[i] = d->domain_id;
+            set_bit(i, iommu->domid_bitmap);
         }
-        iommu->domid_map[i] = d->domain_id;
-        set_bit(i, iommu->domid_bitmap);
     }
+    else
+        i = convert_domid(iommu, d->domain_id);
 
     context->hi |= (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
     return 0;
@@ -140,7 +167,12 @@ static int context_get_domain_id(const s
 
 static void cleanup_domid_map(struct domain *domain, struct vtd_iommu *iommu)
 {
-    int iommu_domid = domain_iommu_domid(domain, iommu);
+    int iommu_domid;
+
+    if ( !domid_mapping(iommu) )
+        return;
+
+    iommu_domid = domain_iommu_domid(domain, iommu);
 
     if ( iommu_domid >= 0 )
     {
@@ -196,7 +228,13 @@ static void check_cleanup_domid_map(stru
 
 domid_t did_to_domain_id(const struct vtd_iommu *iommu, unsigned int did)
 {
-    if ( did >= cap_ndoms(iommu->cap) || !test_bit(did, iommu->domid_bitmap) )
+    if ( did >= min(cap_ndoms(iommu->cap), DOMID_MASK + 1) )
+        return DOMID_INVALID;
+
+    if ( !domid_mapping(iommu) )
+        return convert_domid(iommu, did);
+
+    if ( !test_bit(did, iommu->domid_bitmap) )
         return DOMID_INVALID;
 
     return iommu->domid_map[did];
@@ -1297,24 +1335,32 @@ int __init iommu_alloc(struct acpi_drhd_
     if ( !ecap_coherent(iommu->ecap) )
         vtd_ops.sync_cache = sync_cache;
 
-    /* allocate domain id bitmap */
     nr_dom = cap_ndoms(iommu->cap);
-    iommu->domid_bitmap = xzalloc_array(unsigned long, BITS_TO_LONGS(nr_dom));
-    if ( !iommu->domid_bitmap )
-        return -ENOMEM;
 
-    iommu->domid_map = xzalloc_array(domid_t, nr_dom);
-    if ( !iommu->domid_map )
-        return -ENOMEM;
+    if ( nr_dom <= DOMID_MASK + cap_caching_mode(iommu->cap) )
+    {
+        /* Allocate domain id (bit) maps. */
+        iommu->domid_bitmap = xzalloc_array(unsigned long,
+                                            BITS_TO_LONGS(nr_dom));
+        iommu->domid_map = xzalloc_array(domid_t, nr_dom);
+        if ( !iommu->domid_bitmap || !iommu->domid_map )
+            return -ENOMEM;
 
-    /*
-     * If Caching mode is set, then invalid translations are tagged with
-     * domain id 0. Hence reserve bit/slot 0.
-     */
-    if ( cap_caching_mode(iommu->cap) )
+        /*
+         * If Caching mode is set, then invalid translations are tagged
+         * with domain id 0. Hence reserve bit/slot 0.
+         */
+        if ( cap_caching_mode(iommu->cap) )
+        {
+            iommu->domid_map[0] = DOMID_INVALID;
+            __set_bit(0, iommu->domid_bitmap);
+        }
+    }
+    else
     {
-        iommu->domid_map[0] = DOMID_INVALID;
-        __set_bit(0, iommu->domid_bitmap);
+        /* Don't leave dangling NULL pointers. */
+        iommu->domid_bitmap = ZERO_BLOCK_PTR;
+        iommu->domid_map = ZERO_BLOCK_PTR;
     }
 
     return 0;
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -82,7 +82,7 @@
 #define cap_plmr(c)        (((c) >> 5) & 1)
 #define cap_rwbf(c)        (((c) >> 4) & 1)
 #define cap_afl(c)        (((c) >> 3) & 1)
-#define cap_ndoms(c)        (1 << (4 + 2 * ((c) & 0x7)))
+#define cap_ndoms(c)        (1U << (4 + 2 * ((c) & 0x7)))
 
 /*
  * Extended Capability Register


