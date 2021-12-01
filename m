Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BDB464AD0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235740.408929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM75-0002WS-Gg; Wed, 01 Dec 2021 09:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235740.408929; Wed, 01 Dec 2021 09:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM75-0002UT-DO; Wed, 01 Dec 2021 09:41:19 +0000
Received: by outflank-mailman (input) for mailman id 235740;
 Wed, 01 Dec 2021 09:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msM74-0002Tk-1m
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:41:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e1dd3d-528a-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 10:41:17 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-9ZBsNzQUM6efcr40Flw50g-2; Wed, 01 Dec 2021 10:41:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 1 Dec
 2021 09:41:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:41:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0085.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Wed, 1 Dec 2021 09:41:14 +0000
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
X-Inumbo-ID: d4e1dd3d-528a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638351677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YQb8+AjKpTlqHxQEbPICVBl2jBxSIOPQK4afq3ep8dk=;
	b=gBL7HPi+uQKtp9dggUR45iAuVuYQvjhOSVm9apdaopdjRqfpJC5P342wKduU5vWwaSgX6A
	bLbNLbjOTygxNOQa/LSjLGweTeaYiSPE1Q/rd2HM6Vc7d/cG62Un7B5ITgCF6FLtdH+8eY
	6KgOjOV97CYNveFsD+vdCD4TOfpKkSw=
X-MC-Unique: 9ZBsNzQUM6efcr40Flw50g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfoVbzO/ko4dBRljbNZGMp63s2JkDVV+D3nzcuABMVdpmMbCiXb5Ol1VqiDOSRGni2Kn5ShQ2tsxwEmq+EK6DQab6MP/dl8fGLBznyRO/peGaT2HjlZ4txcU9g5Q3v+X2N0JLCBi7qCkug5zxybfXXCoOINLgLuXBVFuoMsYtC1O6ogVPJ46gXdX4x8kKHXMx4bJGOsAgF+17bCEH+z50p/KpdExqzkEdIJqb2b8G/ftW/qdcH3kbvDNB88DV8ee1PlAfv1PtP2+i3aHaiHCne3QSkhm+yeKtz9+H8EFnhgLTO9jG4gYHrAJvAQ1q7ZqTOwiTedgzk4eBd1EeZhPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQb8+AjKpTlqHxQEbPICVBl2jBxSIOPQK4afq3ep8dk=;
 b=gynYJcla0lZVDrhK7UGm7GJYTZ+pRvk0SzVH6tvyjPHVS7+tBKORaZc53gQnGBY0gD+oBPXz22APCfKt1V+rLeZmiKmDsk/MKE47xKiTmkFLiN99eYNThK8fPZgqLvmYf3f5JRvsuHIeHagDFLajDkYeNOM6Kov+b1bjPQxHqAIaKh0F7NIR1yTLI5DrcbYDPCbUGM91Uearx/tOHwrAkKb/XDsoHsTqoxWt+83COGM5M5q5J+LEw8EhsYF05n3kaug1BMQB5WZPkWWdslbEfo5TjQfA/mR7g0bJ3iEQJbDyuGAutpcC2UiDP0TCF2V/tnchAkkiijCz6qjPvXYE8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a8dd03a-5447-bc45-1554-50fb5b6c075c@suse.com>
Date: Wed, 1 Dec 2021 10:41:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 3/4] VT-d: replace flush_all_cache()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
In-Reply-To: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0085.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9fb6998-eae4-4113-c0bb-08d9b4aeb7b6
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329311F6C534DB6E4E8BE4F2B3689@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LZ10LFIP6hF7O5c13TaJATFutts0Ts5fEnannys3tvE19r5VaeVYtz35XOSvdkQFL4JG8QlMesHrggWvr1QFzywSNnn55Js6CJXyQQzSJw40yosuT8DlBSJzvokRf7QBTbT2C9UYt8SlmGI24OpB7y9SV6puroLmdHNJA64w2icuwna9gJkPlzkF5oc2QB3Hkg/cr/V7i8eRJR871uAfyS5oeFSrC4G9Tp1/PDhF3S0CI4nr8wR1633ZoE5T2bd8EkGRhxEwe+GsugcEMiFaXEpGfzvI/h0edOiug6m4hw38LVA7CbrYP9bQE+F7SF6ptULhLlySU0tEqR6VOwGR3/7KzaoymAwyO9ZCDC/+dwaDYF0nznv2j48TmwCL9Uryh5IduDl+vpx3EHQ2GCb2ru6Ps1wgTe5OTXjAHA78LLHF2vTjiaoLK7sYEvhuh6TMYudyZf0a9Es8uZCc0eriPNi5ORt4edON54y3oiDfxlhPwmrb84XROIb4KBEhuceOWCpqDiJ37TzZpIg2tH/MnUo6iMTaQzZHJ5ExkEFEMO/YeSAZkctuqzyigC6Vha7HW0ntS3uM5a/20xV227iz6D+OohOOQjL6IuX921T4rgj8flMFC6yV7/Az6dT1xLjWf/tWfQ9OfDiBC/P667baBD2BTDhL4fUm/KRwh3Ykh2aKy5FSiEHsy9wrzse1dEjoRui91wn3iYXNgQXAh66txyo/gRM/h8Ik9YpIKaGkpu10A84PoW/mvOAiOBTJbpjM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(26005)(66946007)(4326008)(2616005)(66476007)(956004)(38100700002)(8676002)(86362001)(186003)(8936002)(5660300002)(31696002)(31686004)(16576012)(66556008)(6916009)(316002)(6486002)(36756003)(54906003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXl2czd0S1N0eUEvWlMvZ0ZwNlJNNjJhQkpXZ003eGRUbTRsRENkZmltb3cx?=
 =?utf-8?B?Y2U1MEpaTmZ0VldYOU5FVGMyT2VpbHowd2hKZmxnclBQNUNZYmhHY0xxVkhN?=
 =?utf-8?B?V2lOeXAreXVaZG5QVXkxSUFBcy9GR0hnN2ZkN2pGNHpkNmlibkdCdythYjU4?=
 =?utf-8?B?NjhobEowYzhac0l2aWZPREVNWktHRWs1ZXpYQkcvT0dmQkFjb1dndHFXZ3FC?=
 =?utf-8?B?bmRSazIxS2pxUXpBejN5dnE0djdGL0xLMVpldDRTTTAwMlY5NnhwWkdzcVYr?=
 =?utf-8?B?ZTdCRXdDKzdWWjFvTGNkZjR5eXVLdlN0QlVzSFQ0RXIrYXpHZm82S3VqTzNr?=
 =?utf-8?B?Q1ZjdWkvYy9kcVBwQ1J1Zm1vcldsUkhjL0JROHgwem1BdjIrVXZuSEs5NzNo?=
 =?utf-8?B?WEZTTW9jMHpWQndwMkZ4MmVkL2hJRUVFWTJqOVNHOTZuZ3hianlENWI5MndM?=
 =?utf-8?B?dzJHeDFVelNjZ0dBaXRJSkJPUmo5QTBzWllna0ROa0JONkZIMU56UllPZmp4?=
 =?utf-8?B?b2JpQnU5Vk1uR1c3VUQ1aXNJM3RudndnNkxhNFJqUXRDYXRrMHFCT0lCRnk4?=
 =?utf-8?B?Q1RUVE5GanBVMWxOY1lVb3RNM2c1aXBvNUhwa21iSE4yM0hmWkFXSUE4eWNS?=
 =?utf-8?B?U05yWkdmNGpiNnpYcXJYM2loMWFIZ2N4eDVtV0FNcHdZVytTZXBrYzFDVDhN?=
 =?utf-8?B?NTBPNVc2SjJlVXA3Q1VqQkpTMVZ5UVp4dmg2V210emRNQ3JqWGRWRFhidUhs?=
 =?utf-8?B?ak1qTExlUUE2RWdvTThSVHdGd1RINCtJMnVyM2MvZzQyby8wWVArQlFFdDV0?=
 =?utf-8?B?Zk9JVDZBYmE4K1pOT1NOaEJROEFIYTBnaFhrZ2RyNHIxek8wNHI1YmlkT0Zu?=
 =?utf-8?B?N0wxMWRneTk0MW4va0xDVStIQzhaaHZqRVpqT2MrOXVWKzRCOUo0WVF3VlFS?=
 =?utf-8?B?Qmt4Rm9qcHNndk9NTm5XTXFSaE94V0dNS1FPanZJclhZVGtHOXdwQlM4UzRD?=
 =?utf-8?B?UWxLUGZUUVFtdklZM2J5aURYbWdocjBPMXhUY0F6VkNkV1k4ZXdhNlk2Vk1H?=
 =?utf-8?B?RHhxdlE5ajRTbVRZMUwwT0MzWll5cHpmVk1keVNweWtaaFl0L2lVeHFhb2Z1?=
 =?utf-8?B?NmlhbkJZTHdDR3JOVTV3NnlWV1k2OTFOTG5mdU5EUXk5TjlFb1pHLyt0Ny9V?=
 =?utf-8?B?ek9FcitjaENGQWUvZUYxbmFJTnhIYUMwS0tkalJ5K1czOVJrUkJ0R3h1Vytr?=
 =?utf-8?B?Q0lDdGlGSzVCdjZpYUZrTGdUTXFhc0xVbllSQXF6WGZDbUhGbGpkUlIxbGxa?=
 =?utf-8?B?MmRIbGxDL3VVSVUybVAyZTVQNnFGdlJaaXdHVmw0M2Z2Ykg4SENNbFNPS0x3?=
 =?utf-8?B?VXorVFNmUFl5NHJsZEVCZFRlcUkzUU5zNVNjZTN2ZmlRSmlRVEM4VlB1akVZ?=
 =?utf-8?B?UkZBSnh3aE1ZS25OSVp2amd3SmJnWWlGK3NISUVBaUxXREdQd215MjdZRTcv?=
 =?utf-8?B?eURYdlFYMDljZnJJaXFjeTNscTF3ZjVJZTdMNHBQWHNNWTRESkdaMHJvbVJs?=
 =?utf-8?B?V2pXZjJJRGFFZGJyNHBpdm5BYkFRL0RudENhaXVlKzIxcU1FaE53eE1Sc2RE?=
 =?utf-8?B?cGx5Sm1UM0dCOGN4U2ZreUFrYXROZC9YV1J2RUZrZ2xMS3dnU2VBOFZLZTM2?=
 =?utf-8?B?WXZVZ2ZyUHRNUFloYkFyUVh6TFl3UzVqT1JZeG16YjJoOXhiREw4RURBeGpu?=
 =?utf-8?B?VVhSTEFiNlFodkhFYnpTRW9ReExZY2dDb1k2czZoZ1NqMWdYNUF6RXNlKzdu?=
 =?utf-8?B?Q1hNWjhsa2ljb0pXb2VCbnZTVnFmdk5JQ0xHOUp3c29wL3V1RkhRdDdiSlRC?=
 =?utf-8?B?ZG1GN3BtdEtMWWlDNUJyVzBvelZOeWpnZ2R1bVp6Y3hENGxqSDR6TUljT0sy?=
 =?utf-8?B?WGFTQWx0TkhDVzFPdVprZm9IQ1JsVXBMTC9zT2toUG1ZRFpVOU5pMDMyWDlD?=
 =?utf-8?B?Sm1TMUoxZ3ZTdllKODhaVDh6dHFEeG1mRmM1M1Q2RFFta1Y3QlZ4d1NsRzkv?=
 =?utf-8?B?RUxGNHVoWXl6ZHNFcW8zb0Znc1pvOW1LdklqR3g3OGVVc2xrOGtEajZkejdj?=
 =?utf-8?B?b1lndm9MaW5pVWJaV3ZMZTdmSGpBR1ZnTDlqYTFTNXg0TUwvc2N6ZldrQWVI?=
 =?utf-8?Q?n6FJBQ4n/0ad3MkNF9Bd3tQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fb6998-eae4-4113-c0bb-08d9b4aeb7b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:41:15.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkV+1HSBmRRzcgFT1KMfSEMMKF2qrKtlOw7kQBLNxSEkFtv99O8lN7EKS6IeqxWO8QztloK4UazqXbSycM74SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

Let's use infrastructure we have available instead of an open-coded
wbinvd() invocation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -76,8 +76,6 @@ int __must_check qinval_device_iotlb_syn
                                           struct pci_dev *pdev,
                                           u16 did, u16 size, u64 addr);
 
-void flush_all_cache(void);
-
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
 void *map_vtd_domain_page(u64 maddr);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -591,7 +591,8 @@ static int __must_check iommu_flush_all(
     bool_t flush_dev_iotlb;
     int rc = 0;
 
-    flush_all_cache();
+    flush_local(FLUSH_CACHE);
+
     for_each_drhd_unit ( drhd )
     {
         int context_rc, iotlb_rc;
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -46,8 +46,3 @@ void unmap_vtd_domain_page(const void *v
 {
     unmap_domain_page(va);
 }
-
-void flush_all_cache()
-{
-    wbinvd();
-}


