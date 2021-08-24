Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB623F6010
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171438.312843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXGY-0004wb-Sl; Tue, 24 Aug 2021 14:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171438.312843; Tue, 24 Aug 2021 14:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXGY-0004u4-Pi; Tue, 24 Aug 2021 14:19:02 +0000
Received: by outflank-mailman (input) for mailman id 171438;
 Tue, 24 Aug 2021 14:19:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXGX-0004tw-C2
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:19:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a670ee93-2638-4763-9e94-0fe9f7096532;
 Tue, 24 Aug 2021 14:19:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-tJX3ceXFO3ebB_9P-Y5zPQ-1; Tue, 24 Aug 2021 16:18:57 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4609.eurprd04.prod.outlook.com (2603:10a6:208:6b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:18:56 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:18:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 14:18:56 +0000
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
X-Inumbo-ID: a670ee93-2638-4763-9e94-0fe9f7096532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lsv7bcHuwsgLa+AOHdsxg4x/Cg6Wk9VbC4oDVeLVkeQ=;
	b=dIqNvmsL4t282Cfne3hhIvT4+1dC8tLYfak0E1mF9zryugfCw6Bskqn8xlzWYnEKmKzb3b
	3Dl3iqjS1j9IbwaSgqLP3M3FJfgmERVEqN1wKPCoVmzIUL8hZlb1Q5vA6/M5MSX4lg6bSa
	/9oVH43YZTIr66GjMrzWxKBuiJ4E0S0=
X-MC-Unique: tJX3ceXFO3ebB_9P-Y5zPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV6HxKRgJIP8JA65ZWlOmJvEhWxS6g/olBgT5lbQ9TiJMTWQHHnAFM//8TByGYpLbK8H32yuEdesKvY57p5mt+8t25ZwEi73kHhX7CS0R+JqkAI69Xxzl8WP7+84CwZzcTloIgq0UxgG/CSevv1M+rOUOMqFkdvCmTadBEbuEkm4ad2O9HrKVC80L+/hvOiRZSgezPXw9Ny7j6M1vcrAsW3+sEqc2EqMwG1Dn2/l8gA0F9okQjL+B862LEZLWpEyo4DzCsrXcQU5AmR1+PqCHd1f+7e/aTfKm/u0HxYtgy0mUdaDI8xq3blCgZ0QQlg5GgUc1m5WTBL+Yor5hqIktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lsv7bcHuwsgLa+AOHdsxg4x/Cg6Wk9VbC4oDVeLVkeQ=;
 b=i4p0DN0yYaY2xGFcnXq+YREN5gRhLMI4U+WXk5ejxnvJY0Ec7ObMdfSzLkVKezhA5mtTcNLMpqOmz3Na201950ueCfYcfAoieJ+0C3eTRLp1r1BHYx2r61R24ZX3j9C+TY6En74VBweAeF76b8xxz9+QHZiO3GiUg3DPIIIRpkxCixb0vcLUduU8dxXwMqKRqj/WvwnT7mjy0h0FH2LHouaCmOJKv9YfDtGc3s9OCOLBQZF+UukMp1bqONI3ft3xnaC5JLsek5ZEx7KQ9wUbmSe0HTfwxUVz7iA79BAeBbYH2DVdOhxGznnhcwAvOvcmJ0bHNg0T/5WrEzDbnedepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 05/17] IOMMU: add order parameter to ->{,un}map_page() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <3141710b-2369-6e12-2ba2-4c01888f7ee1@suse.com>
Date: Tue, 24 Aug 2021 16:18:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ce6636b-c2fb-43a3-04c5-08d9670a1bc6
X-MS-TrafficTypeDiagnostic: AM0PR04MB4609:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB46091F171B00B8C636FE34F5B3C59@AM0PR04MB4609.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D60fcsz/3KF5BVVxcJQQjDDSSs/xOsgptjhmX6KMrpAaAO8l8aG3LQ5kxRhczqfCINg9D2lbK1JBWkw2J5fG2LTdVBVLlApsOaOOi4yh6+jcygIViaz6Lvy2rE/DrN54Bq0oErDWWc5aaij2TaXEtqzRHMTyXjd0fDnnmqApBi7VOnUqiiHNW2AJZcqxTeIgD+IvcA4jRNY2GBvGlSb17efH3tvbBV7IVIZv4b3m/pX4CKE343cuhP4c6rOO/Mw8c4CA+VyOOL2jdFkg6qWMS0+H4zEIEcqJMZi+jC+CmA2y0DYy+RmT60XsVKpK2J/0irIKGtCmg5kR8HLHSuotCgojG2GeE0SGeUd+jN8K9VB02CmHIMLhdo9CMIqR4lGUMU6yPLiToI8s/VRe0uP65GGBfcjDtBGNtF0okZy+A4zsTIyIkfsmoNajZP4PycrnC9vD33K+4cHzKYOjuO9tUgvk/kQ5rMTFZdOBmP5LY3F0fQSn/Bh4OBtOJufBzKDleiAcK5cQKnVusUMzQSaypdgOC4r0tk/4rIVAYhNyExz6rcHjLGS/kU958g8HL76lww0MKO9E25GgGz8/XW5PjK6DlAYtDMpRjKHUUZxjUUFqEM9XIkLeIYVHVXk/H0QIA3vZLsl29DsNjxoZEbPV1RgqeNpYvVLUyQMDMMPHmlmj2wPPuFWOPV4g+HSNORHjOpjVadJSG8XqO6aPRE9WAOb03DPlxyb9OZKB7qPMwWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(346002)(136003)(376002)(396003)(2616005)(186003)(83380400001)(16576012)(6486002)(956004)(38100700002)(66946007)(6916009)(54906003)(26005)(478600001)(66476007)(66556008)(5660300002)(316002)(8676002)(86362001)(4326008)(36756003)(31686004)(2906002)(31696002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhQc2NmL2d2NTIydzJLeHlvcGRnUjMrbGw1OXhIdHlTVGlGVUtiSm1HZUZX?=
 =?utf-8?B?eVZpQzdFSkxGZVNZVTBoQnc1eU9XT3kwTWFFOFBmVVg1aUNIWktQL0tqZnU5?=
 =?utf-8?B?TzZGVGtTK0JkMGNWei81L2dzV1k5YStKRlRGalYyaDlVeXZzcHBzWFBpMTV3?=
 =?utf-8?B?d0RFbm9sLzhRS3FLN1ZUZ3I1ejY4S2d1amRnaUhQUlFSL0NJMkJ5cTNIek5v?=
 =?utf-8?B?WjFuOWtLcTgrTXYwSFArUG9CaUVWWEpibFRwTnlGZzhtVmV1dWJXSXZ2Y1Nu?=
 =?utf-8?B?SzB5aEVvVWhmc1cyOVN5R1Y2N1NZTWFHNTJId2g2S3doWlJIeXNwdWxCNTg4?=
 =?utf-8?B?SmR1OFVZNHRDZFhBTE9LLy8za3pFWUZLcWNGTGpxb3J6Y2Z4WS9yTW9QYUVw?=
 =?utf-8?B?VDhFOW1kU1F6eURwZUJhNHhGdUp6SmNxZ2gxWW1hTU1UWCtVc0VkQXpFL0Zk?=
 =?utf-8?B?b01KZlMyNGRvbzVBeEtjMnAyV2tDRWp6SHYraWRTdGROZnJWNTlLdXM4ZTZL?=
 =?utf-8?B?RUQ0S1NkcUJuWGZWWTZUcndCamJwT0p2MVk2eFJoa0xISDc3YUZHZ3RhcXVV?=
 =?utf-8?B?YStGRUQrVzJzaXhFTVloWTF1MDltZjJKd2tLWTlaNnJXTzVIcC9ES0w1T29X?=
 =?utf-8?B?M3J6dWd3QTVjVkdGejdOaVE3amZNb1pVOEdNS1paRFpQMzE5T0ZtY05uQ1BS?=
 =?utf-8?B?SjdLZGltV1JjNjdvdzVNVUg5YXp5Z1RLRkZOd2R2NHVrS3RVeUxDWGhGUnhs?=
 =?utf-8?B?SGJXTEdISzZiVW9EWEczNmFhYUpFVnpvY3pMcmhZNEk1T1BuUTVUaWlwSjFT?=
 =?utf-8?B?NDhSVVNGbzh0aE01VmRaTi9zc0E1MG1rNEV1cXR2a21WK29zcVpMcnZ5RTJ0?=
 =?utf-8?B?VDM2Mk9nZUIwQ3hKMGdNUEhheVYxd2R0eGNTbERpUzVPb0dPQmNub3hhNGF1?=
 =?utf-8?B?cHZpR3NGUEZ2RTZ1cU5VOGhlRVhacUpqQVBzWmdod0NqZEJTK3VXaFRiS3Fk?=
 =?utf-8?B?Y1FMU1YrYlNxYUxYakpWRXVpblVMZ2cwOTRDL0FMblg0UitsOG5uMHNkN05l?=
 =?utf-8?B?ZHpFT2M4R21PVUp6aDFvcS8xSkdaNXdLR3JxY3AwTjJRNmk5bktUcVo3NXkv?=
 =?utf-8?B?Yjhsd29Fc3BIYjhsVWZYWlBDR2VtOGdWYVRHNWJyZkQzemptTGUwczBQMGlC?=
 =?utf-8?B?QjV3THR1WlpxUnVGc3RMVHpNRHNIR0RGc2RvL0pnYmpBM3dtSjYyRXlYRVMv?=
 =?utf-8?B?SnUrQzhtL0JvbE9CbE5nZzRuOTVWdU41VnhBMTZQN3JGSDFvK2JvL0x0U3Nr?=
 =?utf-8?B?UzRLQngva2E0S3hxT2ZlcldLSU9kK1NOd0pzQ0NTendFS1RCdzlLV2NiemxH?=
 =?utf-8?B?TGpCd2VwTW1PdktaUHoyY241OVpLNUNubjZXOWRDRFUwMkJraFJKSjduNVVC?=
 =?utf-8?B?MGFXNmRHYy9iejNkQ2NoL0ZIdy9iNXhYNlVYYU1qQTloUldBZ1VnNHo3M2tu?=
 =?utf-8?B?TDd2bzdNakJ0QnNVN0x6M3BjcHNqcEl1UG1JUTZJT0dlZk41U3RoL2VYSCtS?=
 =?utf-8?B?dHdvNm5OSFA3L2tKU0VsTlJoL1ZteVRLcDVtQndrWHkyL3g4UjFlWFBVNkRi?=
 =?utf-8?B?TUkzdGFKTnBCYThGby9YV3FmRWhZd3ZLM2hLWlkxVEpxV1N0Q3FhTUtkMmVj?=
 =?utf-8?B?TmJXMEY0aXowUUt3WGpTY1Iwc0hTTGRrZXJIaS9KR3Fkd253K0FmZjh0U1I0?=
 =?utf-8?Q?sxImfYg9Sfi28bueLCK11mQWOFgeesMWVTPI0E5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce6636b-c2fb-43a3-04c5-08d9670a1bc6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:18:56.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvwuNiH65JhsT5F4nbFQHkQsd/o1Ts3t9ooisWVTljaxKOHKeXnsbnDbHsiD3Ehu2dHRTcZbpQ/O3bCq7CXCBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4609

Or really, in the case of ->map_page(), accommodate it in th existing
"flags" parameter. All call sites will pass 0 for now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -225,6 +225,7 @@ int __must_check amd_iommu_map_page(stru
                                     mfn_t mfn, unsigned int flags,
                                     unsigned int *flush_flags);
 int __must_check amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags);
 int __must_check amd_iommu_alloc_root(struct domain *d);
 int amd_iommu_reserve_domain_unity_map(struct domain *domain,
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -328,7 +328,7 @@ int amd_iommu_map_page(struct domain *d,
     return 0;
 }
 
-int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
+int amd_iommu_unmap_page(struct domain *d, dfn_t dfn, unsigned int order,
                          unsigned int *flush_flags)
 {
     unsigned long pt_mfn = 0;
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -57,11 +57,13 @@ int __must_check arm_iommu_map_page(stru
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
      */
-    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)), 0, t);
+    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+                                   IOMMUF_order(flags), t);
 }
 
 /* Should only be used if P2M Table is shared between the CPU and the IOMMU. */
 int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags)
 {
     /*
@@ -71,7 +73,8 @@ int __must_check arm_iommu_unmap_page(st
     if ( !is_domain_direct_mapped(d) )
         return -EINVAL;
 
-    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)), 0);
+    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+                                     order);
 }
 
 /*
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -271,6 +271,8 @@ int iommu_map(struct domain *d, dfn_t df
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    ASSERT(!IOMMUF_order(flags));
+
     for ( i = 0; i < page_count; i++ )
     {
         rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
@@ -288,7 +290,7 @@ int iommu_map(struct domain *d, dfn_t df
         while ( i-- )
             /* if statement to satisfy __must_check */
             if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                            flush_flags) )
+                            0, flush_flags) )
                 continue;
 
         if ( !is_hardware_domain(d) )
@@ -333,7 +335,7 @@ int iommu_unmap(struct domain *d, dfn_t
     for ( i = 0; i < page_count; i++ )
     {
         int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                             flush_flags);
+                             0, flush_flags);
 
         if ( likely(!err) )
             continue;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1932,6 +1932,7 @@ static int __must_check intel_iommu_map_
 }
 
 static int __must_check intel_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                               unsigned int order,
                                                unsigned int *flush_flags)
 {
     /* Do nothing if VT-d shares EPT page table */
--- a/xen/include/asm-arm/iommu.h
+++ b/xen/include/asm-arm/iommu.h
@@ -31,6 +31,7 @@ int __must_check arm_iommu_map_page(stru
                                     unsigned int flags,
                                     unsigned int *flush_flags);
 int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags);
 
 #endif /* __ARCH_ARM_IOMMU_H__ */
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -127,9 +127,10 @@ void arch_iommu_hwdom_init(struct domain
  * The following flags are passed to map operations and passed by lookup
  * operations.
  */
-#define _IOMMUF_readable 0
+#define IOMMUF_order(n)  ((n) & 0x3f)
+#define _IOMMUF_readable 6
 #define IOMMUF_readable  (1u<<_IOMMUF_readable)
-#define _IOMMUF_writable 1
+#define _IOMMUF_writable 7
 #define IOMMUF_writable  (1u<<_IOMMUF_writable)
 
 /*
@@ -255,6 +256,7 @@ struct iommu_ops {
                                  unsigned int flags,
                                  unsigned int *flush_flags);
     int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
+                                   unsigned int order,
                                    unsigned int *flush_flags);
     int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                     unsigned int *flags);


