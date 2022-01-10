Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB900489D6E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255401.437639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xSD-0003N4-GV; Mon, 10 Jan 2022 16:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255401.437639; Mon, 10 Jan 2022 16:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xSD-0003KR-D9; Mon, 10 Jan 2022 16:23:29 +0000
Received: by outflank-mailman (input) for mailman id 255401;
 Mon, 10 Jan 2022 16:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xSC-0002ES-0B
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:23:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3eca8b6-7231-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:23:27 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-M_W2aI7xOxC72dgOclvvpA-1; Mon, 10 Jan 2022 17:23:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:23:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:23:24 +0000
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
X-Inumbo-ID: a3eca8b6-7231-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641831807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbTDn+4UMa6dRTZFvW2eulMSRTVqS5JomnC2oSl1l9Q=;
	b=AF3WmaDEF3adRAZLnhBdcgMSbM0vCyBjtHiDji/Z6t5/xAms6WDTxw69kQ1vjnI1ES4qCM
	QlhlCBqWHtBFjBBSJ0iEys8zldJGR+3Mrf613baU/qPSKyTYRWa1zIm56CHysoyf8DU9oE
	N//lmj192OIqIivfQa7kUXOwT7BHoZ0=
X-MC-Unique: M_W2aI7xOxC72dgOclvvpA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4E/CxPk3hp20gDSvpBXWvzQtI5wH/bxQ85CO1rquwN5E8mMvW1P435RWw/HX6jEW/8gYc21d+H/B2wGoZZk/AoCDu8XTf/Ud1dRtAVCcf+63H5XwHaFrIvN26/XMPN9oHNCAxB0l2FuWpu2paw7MrE6qa3f2lnDFRtzaRsJoqyA6RaoRMX/18EKlpr7sibDk8Etpwh5A8vAleweA8sT7eiUeGD60aH3Sa3Fmk8e1gZ0/UsP24oHTzFuPHIaTkbGlc6fwtofu7jtIlx5PNmsyj445dMdLKXbvPpPeyByn2+gMA5GclYLI1eDD7AzJN233HO7Fn0pt8CucB1oYoIfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbTDn+4UMa6dRTZFvW2eulMSRTVqS5JomnC2oSl1l9Q=;
 b=Dl3MSBXHOdyULwK3qt+jE/CGfJlTf3QTrkBBB2yIQUN/4jyMMw1SZGCM+iiGR35G6G/KCfNw8UjUz61e80XQLL+/R4BKUaDo9/cGsZ8jb763MXF0mEqiYr75C+TuwMdgWBsfP4hEmNX8hoAboX4keTr8YWjkkBOqiwLtk6H15kFHX0cpXwYFBnMkNHW4baKvrlgK3jfabfsHkIyKya4m/wPb0oscSj0hjVOnyqLINAoKagCyobfnJfz3MTKmQU7JKCAZh6HI24EBko72kxMzz2NlaMRDfMZQjwkvE436AAkoKFj4RdePQJzGKds73qZX/gltJ4gyaZfsW2GF1njubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10d6b416-1a20-4b1b-d39a-1bf17b2e174a@suse.com>
Date: Mon, 10 Jan 2022 17:23:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 03/23] VT-d: limit page table population in
 domain_pgd_maddr()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0045.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2403a243-4d22-4831-2c10-08d9d4558698
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24466BA4E87B6937CE6CA4B3B3509@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dvdxYmLMmDAhm18XNAuttSzsDN6XrI6nnC5hnQi8TPfw5UwkYwP0EBz4P/6SLLjXBmvd+Aa9+wbJGKofcdjsCYjo814Vn2abWUvGpLUFQUL/cRY3DyNFq6GBujI32Aal9vZn+8r5YIEQHnzM536eXtbIJU52ZjllkllSNdEoayUIF6pQdPfu25VfvynE3VNQtgOHtGxXCXO7hc+Vo66ubKQVz3cZ6+7XeOISO9TCif0trCwWE0tCSmo0bZfS1BUJfoQDwEHjlsPEkdSOaqj4E+Onxf04rce+swfDa0c+Y/0DIcrFvpw5sv2C6G7ZPBgx/6JdHENOC6Ca004r50k5bw2F6IFfknd7TVGqdWyO9lYqDv8Aj9qy0TZcc09yyWnu2o6VQAc8fwqMttoNiJhFnoqFpZKMQokkkxlTS55ij040L+Sn35Gkr9EHAqsvEIudg9re7q/g1+LyWQbxENj2KjhEY33SWjXwOqvCkBHNXohckeD4F0QU9L0eeT97G6EZ0hCQ0MCawr6lANl/IrQws1N4hDPs8hdGyEm9MP2SkB0wbITWssuQ/NE1OpDVAFReaHMiRaIGsTF5DLb1hdV5klPYSwsjDloPnToJB0+4CLLe1AcjHR3Qsjlc5q6Av25HxO/qXgKSkAsvhQ5lKyUK1aYahdMKJxHDiTsA9SpOpSS3DZc34jExNYftbKEpJWYn7GKWH+ybJdH5nBsvgYnxwvqpxQuN/ICJuc/DGQIxXOrxCRi7/+uywQj91KfKdyNF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(508600001)(26005)(31696002)(6512007)(8676002)(5660300002)(36756003)(4326008)(2616005)(86362001)(66946007)(316002)(66476007)(2906002)(6486002)(6916009)(66556008)(38100700002)(6506007)(8936002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3ZVNFRDeFAwVUZKMmxQWHMwRHBHd2lVbWcrZWsvSktaMWdKMHJHWklZdHBC?=
 =?utf-8?B?YU91dStpUFJSeHRRRW1VVWFCUlZwMHlYOU4vTFA1TkR2emxQNWxOT2dackFh?=
 =?utf-8?B?WUM5NXJGN2lCTkhqY3V4NFRDZkVwUFB5bUZwSlZHdnl3ZnRhWC9UTXZFcm9B?=
 =?utf-8?B?WjdBNFNxNHJIZkNsbUxoK08xaUVQQXNUSVM2V25DQkd2a3M1VzNWdGF1blNE?=
 =?utf-8?B?Slp2QzV4eC8wM0RJYzlaVzdieVpSQS9ocEovZjNFMXVWMXJmM0hzTUNUTGF5?=
 =?utf-8?B?K0NRSHhTbCtQWUF0NGpNWnVLR2d4clJYY29VUzlqTVNQTUVlV2g4UVlMZ2NM?=
 =?utf-8?B?N3R1Z3ladWR5cEFBRDY0ZlhkbDA5Tmw2VncvYThCRGRYYXhOV0ZEazNIcCsr?=
 =?utf-8?B?L3hvT2NFN2M0UUNvMHFKSmVoSWRmV1JqeXBnejFVZFN3M3BjNFdEWmFDcm1X?=
 =?utf-8?B?TUpsSU95K2RYdW5uZytsbWtSTldJZ0xRTUhVUmdlT2hhNFI0d3NKV1pZUnBs?=
 =?utf-8?B?SStxeTliWThxWW4yMDNlM3VFeWN5UFFETyt0bktBWFo1SnhIRUJIUWhWajZN?=
 =?utf-8?B?Nm5qdElmYVBSeURxNGp3N25sN2t2VmhCTkFMb2lWSmozUlRiajA3WGhsUmRT?=
 =?utf-8?B?aENGdXY5UDJBaE1IeWQxQmo0OHBCeFA3WG91TU9NUXVHWU5zLzlyLytyclh0?=
 =?utf-8?B?elRGWi9SbzNNdFFGSldiWWV5cEhqMERoWGwrMzlzTldTUm94VWpQY0hlZEJx?=
 =?utf-8?B?SzRRNnZyODlTbTZqNmtRZWJFcWUxTE9yS0xNR0pZSngvVUdXeWY1ZnZNRXE4?=
 =?utf-8?B?MU9qMFlkR0NBU25xNzJBakxiV3NyV2thdUR5VzQ1Mk1MWEtVS3ZYMEsvY1JD?=
 =?utf-8?B?cHYxbTlxTzZISHI4akdlVlJ2MXRqc0JCWG9nOFRuVW56dmZXSFZjN1J1VzBm?=
 =?utf-8?B?WWNOeUxIWmF6ZktaL2c5b3RvbUNzb3A4KzZDNWUrK2RLbDNKbEJlOEdTTXhG?=
 =?utf-8?B?MFI2VWJPU2ZaVytQeStsbzdxTHU4ZHcxcktYUXdMK3N5R0FBcDEwbkZpeWFH?=
 =?utf-8?B?cnJLZExiQnNsMXkrK21rRkRGQVViYnkvcElVZ1NtNU93QWZTM3hoQkdRRDMy?=
 =?utf-8?B?MHQ4R0RsNVdqUU5JdUdmeDRTbUVMaUMyR25CVDRoWmNWbW1ZWkJwZmZZVW9G?=
 =?utf-8?B?ZUdGYmJGK1NKQWlXUGIzTzNpekVDYVI2REp3OWREZS9zbjhOTHhwbDhJNjdn?=
 =?utf-8?B?b25qd2h0ZXAxN1JXdEJBUWZyM0tRZU5FR040eWJobE1pWmlpNG9FOHg5bWJR?=
 =?utf-8?B?eDkrOGU0a3FkWnhBa3Q1OHRjSlc5NEVtQ1pWa0Q1T0pQbGZ5VkxKVGExekp1?=
 =?utf-8?B?emthU21xKy9aeTV4bWRWUzhlTWY1TEMwVy9adGhZcVFQQjNKY1ZqVDNqRGxF?=
 =?utf-8?B?bFpLbmlIZG9yQ0dmaE11TUNYd01Qa043Q1ZPbVNqdEUzcnI2QVRPVkpkZzZt?=
 =?utf-8?B?YTFES3JDRFFqZlVwbXh5dDJydm1ndkZyT0dQMnl4c2t2Sk0vMVNsZ2t5akhV?=
 =?utf-8?B?RDFEZlZKUFRPbHd5dWljczVzTTJrQjdSWThmTDBoTzlEc3ZvQkdPdXNzNWlX?=
 =?utf-8?B?UzVpN2t0NUdScEM2aVQ0SHlOTEN6ZXBJdXFXSGx1c2R3Qjl4TkxBakhmVVI5?=
 =?utf-8?B?ckNpWmdyL25UT2ZTT09WTVEwaENacWVOanhnNXNvKy9EYVBNeUNZT3pLVGZk?=
 =?utf-8?B?eHhFK3ZiYkFMSHUzOWJnYTROZWo4ZmhKMkhtS1o1SlZ2OHU4UDYxUXBUcEJE?=
 =?utf-8?B?bHBjTThsRlUrQWRmUm1BQnI5ZTkzVDVWOVUraEVxeHY2MjF2cWo1VU5YZGs4?=
 =?utf-8?B?ck4yWHU1a0Q1WWJvQm9qYXVEaVl0bVI3NEFHKzJtemNwMVJRTisxclJ5VEZy?=
 =?utf-8?B?SXdRY0MwazZrT09lV0crZHFHZ05ab1pvaXBtTTZqUFZMQVhWcmxXaHJMZmNh?=
 =?utf-8?B?VVJEM2JwVGlkd3pQWmpWOU84MytabjZtU1VybXdvRmpobTZ6RjVYRTd5UHVn?=
 =?utf-8?B?WWZQZ25FM3RXQ2w1VEFTMDBzb3NQQmE1SjNJWEJuaU52bDJyQU84K2sraXBs?=
 =?utf-8?B?TyszTXhKZmxoNEJGSncvU0x5TGtOWHJ6cXM2QkxpK1oxS282RXBLZ3dZUTk0?=
 =?utf-8?Q?cSqX8JroOmDnTfXMcPPQ5VY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2403a243-4d22-4831-2c10-08d9d4558698
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:23:24.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+VVG09bPfhdb/5dF7G/GDk26XD8RlS2cKFTdgsjH3SSeF5AN7tE42zon8aYEVcF7WemUy8FEJYebyQpBUG9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

I have to admit that I never understood why domain_pgd_maddr() wants to
populate all page table levels for DFN 0. I can only assume that despite
the comment there what is needed is population just down to the smallest
possible nr_pt_levels that the loop later in the function may need to
run to. Hence what is needed is the minimum of all possible
iommu->nr_pt_levels, to then be passed into addr_to_dma_page_maddr()
instead of literal 1.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -55,6 +55,7 @@ bool __read_mostly iommu_snoop = true;
 #endif
 
 static unsigned int __read_mostly nr_iommus;
+static unsigned int __read_mostly min_pt_levels = UINT_MAX;
 
 static struct iommu_ops vtd_ops;
 static struct tasklet vtd_fault_tasklet;
@@ -482,8 +483,11 @@ static uint64_t domain_pgd_maddr(struct
     {
         if ( !hd->arch.vtd.pgd_maddr )
         {
-            /* Ensure we have pagetables allocated down to leaf PTE. */
-            addr_to_dma_page_maddr(d, 0, 1, NULL, true);
+            /*
+             * Ensure we have pagetables allocated down to the smallest
+             * level the loop below may need to run to.
+             */
+            addr_to_dma_page_maddr(d, 0, min_pt_levels, NULL, true);
 
             if ( !hd->arch.vtd.pgd_maddr )
                 return 0;
@@ -1381,6 +1385,8 @@ int __init iommu_alloc(struct acpi_drhd_
         return -ENODEV;
     }
     iommu->nr_pt_levels = agaw_to_level(agaw);
+    if ( min_pt_levels > iommu->nr_pt_levels )
+        min_pt_levels = iommu->nr_pt_levels;
 
     if ( !ecap_coherent(iommu->ecap) )
         vtd_ops.sync_cache = sync_cache;


