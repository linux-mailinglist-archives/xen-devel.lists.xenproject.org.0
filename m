Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E144E425
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225052.388672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTBi-0006HI-S7; Fri, 12 Nov 2021 09:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225052.388672; Fri, 12 Nov 2021 09:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTBi-0006FB-OR; Fri, 12 Nov 2021 09:49:38 +0000
Received: by outflank-mailman (input) for mailman id 225052;
 Fri, 12 Nov 2021 09:49:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTBh-0003th-77
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:49:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d856b5b7-439d-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 10:49:36 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-nEjc3_GAOZWzx6Klm0Z3WA-1; Fri, 12 Nov 2021 10:49:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 09:49:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:49:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Fri, 12 Nov 2021 09:49:33 +0000
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
X-Inumbo-ID: d856b5b7-439d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63EDCVBQW7h8osASYLbubyyEjZ4ArJhIRz0iWWv/m8A=;
	b=Y/UiYYR3Qj63H0f1KLc5uat/XiTTMGCLZHIhBBPjaxSVIff2q3hoAvFeQ05O9rcFL+QX+M
	0tYyHsrY5tjr+Nz2hZvn6In1x+ok1L2G2X60yW60aAL4nzZBjcWTeVSwxKOrVdV9OKCfMm
	3bTTfAJ56dnPk6eLYsFOumwsWnPDIQg=
X-MC-Unique: nEjc3_GAOZWzx6Klm0Z3WA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhI272e70J1zR1W6dcSsk9xtwnUHR46eIKZmEl9pPgGaunXERXbg3mAy8Ik8C2hs3RI8kbgGpy/Acuob8ODTiMoX8jboKF9m+fDG08uddu4c4SkyZzKIH2YDDMPzEtgEV/B4jovw3DJOln3E/J3plxbidN2+EAdW2gIyXl0jYasfFw6DK/abRtiLFqHbYopDg/T/5UxdKT+/5lOGmRyYdE048kCJCobNnou4ZoshvSlYeHDjqqTEKjhx+5d2yvoVXKazceRdT7VZUkx0CXSePwMB5yhkJti81imajZYr9T/CQsLIf92WSNyKgDVyKc95DRFeZvg7O8LZogFtPtF6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63EDCVBQW7h8osASYLbubyyEjZ4ArJhIRz0iWWv/m8A=;
 b=M5xE8eoZ4bZkpAlBFzCihWveulqOB9OBKWYZxRZJd1xRgUDMXP+WqNAceRf6yNn25eXdoVDQ0huB9aqTyG8wLVOBAjXH/9YvJIs49kZHg+exWuJ++H7z17e2qV/39POnH+ZXJ3tM8fXG2ISKL4ItNPwwAzAMP0k05RxLpRcUo6huD0wkqwhRuupACbHv55K8kyIj3HQnmjwFh3yH1BiRuaki1YXazBJLqGMPuImA93WH27BkjWDhzUtgbfXegNwC4opB8Cx6X64fi1A+4PvCdWLG6Ecm67Y3hiDdOb/55JMg0j51GcZbQ3dWGzjMmMMUlekc7i1ryg9sdkQ4bTdQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff49be66-1d4f-9e1b-95ac-b445eef29d41@suse.com>
Date: Fri, 12 Nov 2021 10:49:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 5/6] VT-d: introduce helper to convert DID to domid_t
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
In-Reply-To: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71873f67-505c-412f-cf09-08d9a5c1bb7a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233526F865865CC78017F291B3959@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FxR3/eh1KRjleE/FV6Azc8ZSFElNjxklhL6nmJWhPD2lZiMFILK7Wn4ks6whkidA46gApNcwviA05/fW2T7mad4w5y3RvTVaYK9IvY1tBukIHraMb60BjEvO/e3KlC0YHZ3PCT49dWbvJIIjf0W0gOvrQloIJL4RR4rDjvMx6R2qVqh9AaW/bMf7PdeX2ZPwT8U6f0SKS4LuGi1U2oD8oPmAz8ECk0cr0WUz8rm+bIPZn2jSqqcZDhemecrWL0noYpMQ0e/6sJwb9640XA3rMA5ShVY05T9bSjVXl/8ve24K+0bVFyGXVaDg2HZLb/meGiwJU324w/vpMfMMt2ux165TKG8esw/goMJOwEDD68bGAyZTygkLy8XFR5/lEp4FF9U3dReTnkDW3Qlt2+3INYJcj6EzqHYQNO/zg+xVong8FM5pDqz0LbB5Xv7oYUe87MWlFjvTcs1O6s5vTxtuIhKmnxJ6zah8gnXlJq2ZsMc4vdu9cM97HBt9+j33lfCTjdsDDvgT0dm9c86o4wT8i64rk3nB0XxycL1jSpibsADqMZt2QyooSIx9QXzs4LnpdVwuKNRs5uHD6iUDW7IO6sE4kVhkxA7GiiLwcqzjozsL7CE58Zo87MEhBmLArxZxfmpOSiaTQyDQQl4bE6xuNsw7BBhlvP/qsWRVQAau/r7AEoGd5E7R7Y/VkdNwrYN8qWsn+t1AIC2rGtPg+hiaCr3TPHRsH0uRkFTqm5y4yqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(38100700002)(66946007)(66556008)(2906002)(8676002)(508600001)(5660300002)(8936002)(6916009)(36756003)(6486002)(83380400001)(16576012)(31686004)(4326008)(186003)(26005)(31696002)(956004)(2616005)(86362001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk9PVW5MTC9GN01PZ2dRQTY1c2tjY25YaUZGTXNYV1lhNW5zcjJQTlVkZE9H?=
 =?utf-8?B?dkZLRFRHT0wrT2w1M1ZGd3pEdHdaS3FZMUhhTmlwT1dhbVNOTHNiTFRhZXg2?=
 =?utf-8?B?cUNwTG85cm5TM3hBUHp6NG16Q1lCbndyUk1ZYXhvcytJb096YkhDbjZhcy90?=
 =?utf-8?B?bFI1akVOT1ZrYmF1STdzRkhncTd5cHFWSm16QXgrVlQyVDAzbHYzbW9KdmU5?=
 =?utf-8?B?Y2hoZlBZT0RLckk3bk1NYkxwUkV3ZnNqSVZFa2pkMDhSSE9NUTNUQ1ZjUFM1?=
 =?utf-8?B?K0JXYWhnS2Y0NlBsL3N5NXJzaGIzTW96RXVDRlZ2OHJsU3BLaUVYc2JNS3NC?=
 =?utf-8?B?QUlXKzJLY0dKWVZOU25OTDBXMkJaQ3JUUTFhYXZNY0pUTkxuVXR1QjJDSmkr?=
 =?utf-8?B?UXM1WVFuQ2p6V2cvcC9tMW90Tk5RWXJWSUNkWXFkN3h1Tmx5bS96ZThlTVd2?=
 =?utf-8?B?aHRJK3pvN0F4cWE1S3p0YkgvWkZraU8raThPRDlZZzl3MUxZRkNXeUh5VVpF?=
 =?utf-8?B?RW45OHdZVy9Gc09vZi9YeWRjakxaWCtPdTBjOFRPOWg4akwycXNmYUdMSjRv?=
 =?utf-8?B?azdaQ0FEMjZGbjdwQUU3dGl4YWE0eHBzSEpRKzJ0eFJjdUhlaUdvVC9PZi82?=
 =?utf-8?B?RU1ibXpXdjkrb2xKMVBmdHNFOFBZUTBQK2hWMzYwU1JaaDc2U0lqNmhnZzVD?=
 =?utf-8?B?QTJzSjZJRW5sVHQ3OUlSNVRZdUpReS9rcmdMbWF6UHl3cG1XYlplOExzMHc4?=
 =?utf-8?B?QnU0ZmJBMW9ZdWVqSk9BVEVHWmo0SWpjTFRKS1V4L28wNDRmMHdvSzJFcU14?=
 =?utf-8?B?aXlhV3ZnV3RmeHJQaW9CKzlyREdLdmUzYXNNTzhob0pQUjhjRm4wRVc3WWZS?=
 =?utf-8?B?Q3NJbGpkdzhoU0J1TFFMU0Z5YUM2MnM5elN6WHBHUFRFMjZqZ0tkbVVOMmsy?=
 =?utf-8?B?aTJJWE9KSUZ1T0lPSmlnT3NsRjlZNkY2MUNFUXgydEZtMzlueWUreEFsVzkv?=
 =?utf-8?B?ZTBPRkRJTjNwSEZVUDlkeTlYdDRnNk53NHBab3JyejhyYkdnbXE3aWFiY202?=
 =?utf-8?B?QmlFVnQ2aXFzN014L212c0xsNkRwWEcrS1M3MVJidHgvRTJhRU1BNUppRldN?=
 =?utf-8?B?MngzT3NMTHloQ2dTd0NWbjN6cit4NHE2Y0FBbmFQd0VmWWpKT1QwUUZmUFRF?=
 =?utf-8?B?TTJYdDlLcFk4aG1BaE9lY3ZsRm5IcFBsM3BvSGh6dDdjK2Y2OVZQNjU2NDVr?=
 =?utf-8?B?ckwvVjFMVWNOV2wxcUcwWnY2bmhKckozYUp4Q1Nha0xHT0tZbHpOTmdxcXp4?=
 =?utf-8?B?d0FsQ3ZkeHp2TWlQKys0eHRZOG9ZUlhTd3hGc0NDRVRHeUpmVHQ0bDJvY3B0?=
 =?utf-8?B?Qk9IbGUwaEhvaW9kWnd5R3NTV2pVMGFjV0hEcWcxZjJNSEQ5TkE0YXg3cHZo?=
 =?utf-8?B?RFpCVHRJSVRxU096ZUFmcmpyeHFNUFgrTlFYSzlXSG5vZHU4ZkdqeW9kaDNs?=
 =?utf-8?B?bkg3UTNNVlEyWjhwdytDSXg4VmpzSnBUNk1LYVQwdE9OcXNZZ1JrN3UxdTBT?=
 =?utf-8?B?dlFvM2FpbHdiV2VQUUNBYytISFNlc004eHA2bW5xcjM3alh2c0RmdzJ5YUIr?=
 =?utf-8?B?TEc0OEVHWkpMY012R3BVR3M2dm9qUnZGN21kS2lFY01OZzJpSGg2Y1dIdUdk?=
 =?utf-8?B?OWlMeTcxYU16aHJBWnNlK1FoUmtnQ0FocXJvUytBWnJpamZJdkZDUjg2WFFz?=
 =?utf-8?B?d3N1dmtSN2JFYkMyZERhUUNMYmNIb1gwd3FiTE5Xc2QySEhKMG9DQ25GK1dC?=
 =?utf-8?B?YmRSWWtNZ2h6NjR6ZkNibHpWdmJ6OTNRNjlLcFJoUXdYTFJBMmVIcEVIZ2do?=
 =?utf-8?B?YWdBaVEya3VVT1R5bG9SUDh6ME0wMlVVQTQ5QXlxTzdmUG82Rk1nbHM4WUF2?=
 =?utf-8?B?V244M1VaYlpOd3h6TUFpQkRrbDlRck9EOEJZMEtjTHhSUE02a2Jjd1gwYVVN?=
 =?utf-8?B?WG1OaUUzYkV4VlNubkJiVEJaRkN3SFRwMnlSVEl3S1BVVjA5L1lsNVF3eW5L?=
 =?utf-8?B?VXVUNGV2bVEzWlVQcDUrbi9penJseGpJZXN2ZmlHNW5kYW5yaTJxTmZkSDBC?=
 =?utf-8?B?Rys0RWdmNUJaVGFyYWphVjhtRkp5STR1bTBSSzI2V1pYdURHWWR2andMUjJY?=
 =?utf-8?Q?gjSvK8T8Xi29zT5/D6Bmdd0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71873f67-505c-412f-cf09-08d9a5c1bb7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:49:34.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk2QQDZ3q+tgpJQXQaFP3itMuPAhUvnc8aAxFCUnYICA+QxOaimlDAKaxlHLZC3EcTzTOafxZ8VqioE+YPvPjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

This is in preparation of adding another "translation" method. Take the
combination of the extra validation both previously open-coded have been
doing: Bounds check and bitmap check. But don't propagate the previous
pointless check of whether ->domid_map[] was actually allocated, as
failure there would lead to overall failure of IOMMU initialization
anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -45,6 +45,8 @@ void disable_intremap(struct vtd_iommu *
 int iommu_alloc(struct acpi_drhd_unit *drhd);
 void iommu_free(struct acpi_drhd_unit *drhd);
 
+domid_t did_to_domain_id(const struct vtd_iommu *iommu, unsigned int did);
+
 int iommu_flush_iec_global(struct vtd_iommu *iommu);
 int iommu_flush_iec_index(struct vtd_iommu *iommu, u8 im, u16 iidx);
 void clear_fault_bits(struct vtd_iommu *iommu);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -123,15 +123,16 @@ static int context_get_domain_id(const s
 
     if ( iommu && context )
     {
-        unsigned int nr_dom = cap_ndoms(iommu->cap);
         unsigned int dom_index = context_domain_id(*context);
 
-        if ( dom_index < nr_dom && iommu->domid_map )
-            domid = iommu->domid_map[dom_index];
-        else
+        domid = did_to_domain_id(iommu, dom_index);
+        if ( domid == DOMID_INVALID )
+        {
             dprintk(XENLOG_DEBUG VTDPREFIX,
-                    "dom_index %u exceeds nr_dom %u or iommu has no domid_map\n",
-                    dom_index, nr_dom);
+                    "no domid for did %u (nr_dom %u)\n",
+                    dom_index, cap_ndoms(iommu->cap));
+            domid = -1;
+        }
     }
 
     return domid;
@@ -193,6 +194,14 @@ static void check_cleanup_domid_map(stru
     }
 }
 
+domid_t did_to_domain_id(const struct vtd_iommu *iommu, unsigned int did)
+{
+    if ( did >= cap_ndoms(iommu->cap) || !test_bit(did, iommu->domid_bitmap) )
+        return DOMID_INVALID;
+
+    return iommu->domid_map[did];
+}
+
 static void sync_cache(const void *addr, unsigned int size)
 {
     static unsigned long clflush_size = 0;
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -229,10 +229,7 @@ static int __must_check dev_invalidate_s
     rc = queue_invalidate_wait(iommu, 0, 1, 1, 1);
     if ( rc == -ETIMEDOUT )
     {
-        struct domain *d = NULL;
-
-        if ( test_bit(did, iommu->domid_bitmap) )
-            d = rcu_lock_domain_by_id(iommu->domid_map[did]);
+        struct domain *d = rcu_lock_domain_by_id(did_to_domain_id(iommu, did));
 
         /*
          * In case the domain has been freed or the IOMMU domid bitmap is


