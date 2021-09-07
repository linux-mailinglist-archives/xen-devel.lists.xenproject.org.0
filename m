Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138DB40284C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180970.327891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZyi-0003WV-S8; Tue, 07 Sep 2021 12:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180970.327891; Tue, 07 Sep 2021 12:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZyi-0003Tq-Oi; Tue, 07 Sep 2021 12:13:28 +0000
Received: by outflank-mailman (input) for mailman id 180970;
 Tue, 07 Sep 2021 12:13:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZyi-0003Tk-30
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:13:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 014c1066-0fd5-11ec-b0eb-12813bfff9fa;
 Tue, 07 Sep 2021 12:13:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-hmssEa00Mkes3R_235iJ3A-1; Tue, 07 Sep 2021 14:13:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 12:13:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:13:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 12:13:22 +0000
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
X-Inumbo-ID: 014c1066-0fd5-11ec-b0eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa3ZLU03Swba0gYvsSEjRU1XJu+IDpj/E8M5qxMYmhM=;
	b=m/81AvXjwZBlj8QjxuUQXwqF4l1qlxXQC9MUfuQyClDi11QVIQC0sr6VEvsZECn5zSNien
	8CR2EnqavAKyN8HSWQ0SzWuMHUwLZEBOCoEda58aoQ92gToAB73+WeBfnRhXI89W7G3zQN
	dIXuV48KDNbZEEfGxtlEl6jSEg9B230=
X-MC-Unique: hmssEa00Mkes3R_235iJ3A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNrCjBtaCc9xrRgcZFD6TBodIymGQhEGSbmgii+q0J6PhiCvr9GbbJuWLbKnB3UY3AiS6gQ5Am15OL6bQ72vSLi2Rl1pS8ygiZUy5fMJMJVBNo2vBeKgD6GNJIz3oOyzOaErWXlx6+qgAOHM/xHdcCyoRl6IYlrUuChkpjOj0n5Rj6KfDry0tDdAKzdxfTNdOb6dKDkyJxySSyrIBoIfwxRYutrJtc3Q/aK+iAzkkavz7qe9K0/tLz0FRWkwNU9FG9wpXeT5QPqJdyzA5QyvjxQjYwE6qAKcmugli7NzsvX4mPCPxSOQc5d4354ZWCK25rcy1PWGw0+gBnOwlHiiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Oa3ZLU03Swba0gYvsSEjRU1XJu+IDpj/E8M5qxMYmhM=;
 b=JqLWdpRvPxsIWlGroRzDRKNQZLUS8rpC0Vt0vtXK9VxNpou54LoVMXTNImYpMRQsMha8Rnu0VWQu/QXCRXHObhYJf/5cVSuax64pcn4CdXJvC8tutebA/iyv3dHmt53PcQCAaU9jiVmnmLcTIxGdVKS4MVkkHCNFq/3WKbQqNGwFI2BkvLEbHty+BpXyG+1nyMntSXhfxiMfXt0jNTqAGgeUkzxX0zb8BZMQswUdfkIzmdJEQCuNjT/yjE1W2+Ww9jhD/V42Gy+RZ73oPjffsxbLGy1UoXVyvOK2fmCXIhRkZ9csNBnXLy4ilnn1SM8GGzLCc83VzFDfMlGMHABSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 12/12] swiotlb-xen: this is PV-only on x86
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <004feaef-f3bb-e4bb-fb10-f205a9f69f28@suse.com>
Date: Tue, 7 Sep 2021 14:13:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7774d84-fc14-4235-a792-08d971f8e396
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4943E21069F40049E0492C83B3D39@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8vr/cvpjrHj9i7Ab2anwybJQtqfCUkLxrZeWoopggiJjivFTbp2KsRgQ7A2tgPQ4E3dOZgyqMef+rxP0r5Pb/k/MdvSyLCv19bNVwzU3Wav/jqlnxpDcGNZf3oWI1zJ3821MhF2+GsIRFmZ/FRgc5TPAN+qcGGolJ296uFSTODOP4iBS41fSKYHrj0vKL2X+GH7hfLfocq4UG1yP75NCkcuUnP143Qeew0LxdElKLrcDQxoS/xWKZIbYj2Y4C+/R0nnB+NinOvshRjrymlEpD+/SpI3HUe5CU41rLje5eigEnujEG2jzV4ZHmh52GxX1FvrPUjf+I6wc+Ku1mf8MfzLHuT0W5aTkGHbGouuR8v3wfT3wWlsGfvDUwv3lRZv637OQuIIjQUvQHcItHz4iz+Ku+OOZ3QW1NSSBWI2u9rgrpiIMziD6/CXdNzDSSLOHvQ8nS9zDmWKra/zxTOeFyjw/xbxYT+vppVOHSpgnlFuWkvMKlsMUU5tTJ/xAJhPGttvOw4enrLTTEkhBRXyowPNlNQA6FsMcs0Tw1wm9/3QNA50+/aY1IMKRzau7FjZnj9WACrpOg633GLU2QDw/Qm521l1aI5Tyy/Maf0tW5F7gp/P1lPDMv90nJd4Bv6cdIK7hNEBlgIJCEFTYlPX/bkJRjCPs8p3zDNxcMeQ46w65dAX/NcfTtC5Vs+2X4NB9t9aHqIb8A4os50DK35X5H9nqR2plZG9dVJ5LvUOkGkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(366004)(376002)(39860400002)(2906002)(110136005)(16576012)(956004)(4326008)(316002)(66556008)(66476007)(66946007)(5660300002)(83380400001)(2616005)(54906003)(478600001)(6486002)(31686004)(86362001)(31696002)(186003)(8936002)(8676002)(26005)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2FGYmxETys3V1dJemlPY2s4OW5BSEFxcFE4M1N2dzNsdENSRlRES0ZRbEEr?=
 =?utf-8?B?Qk5ITnlXQ1V5U3RGUFRwbmVFUDdCQ3VsQjRZQ1BEandnRnVGOU5reitQMC9V?=
 =?utf-8?B?NEltOS9QU1pVTzdqMzlETE5ldVB5Wkk2SXpEZEhveXZKZUdPMDhtcUV4SVln?=
 =?utf-8?B?QUpjNG12QnFxUlhIem5Qck5NRFoxaGkzd2JldU5FTTNWVWJWNkwxNlVkSGVt?=
 =?utf-8?B?alpOd2R0dS9WeE1maW84c3lTSHRaY1dFbzFLL2xXdDI0Ri9UY3hGTEhjdWFU?=
 =?utf-8?B?cGNtWWlCU3hLUnVjcFVvU1lXb3FTaUdiNzlpTnRtRDR3YklnemZUbEdFcGJP?=
 =?utf-8?B?T3RQb0N4TzArRW5mQis4YzhRWlhiUGJZek5FZHZTaDl0Zm9qdUM4amZWYXls?=
 =?utf-8?B?N0J6dUJTTmNtOHpjZkNneTcvR2dYMkRBM3ltVzEvQlJVb2lnQjF5cEpHVEx4?=
 =?utf-8?B?ak43Y0Y2ajl3RmRQZjU3eVdMUGZXVVIwblQ2WDI2eEdKVUp0aXpYVVkzNkZH?=
 =?utf-8?B?bnU5NUxwOWtWcHVPZ1A4Uy81UWkxOGFJdEhuTklwWXVkVk90UjJHcUJsUlNi?=
 =?utf-8?B?K3pCNjluWUhYYVNybjJ2c3BhWVczU1N4ZXplanROc1RzU1FuRmYrTWVCSUdy?=
 =?utf-8?B?bTZaREhydEFaT0VnYUNZb1pHQ1ErQXQvVHh2VUFLWGROZzVMb1RFbjRPUFh1?=
 =?utf-8?B?TzJIOTZkRkF3WE5mVDVsS1FuMFZwSjJ6cjV1SmZhNjQ2R3Jsc1NpSms0NEUv?=
 =?utf-8?B?SEJTQ2hyNGhuSnJsQ1FmcXpJUnlZWWpoNThTOGNmWkZDSC8vN1pLUFlVZGlk?=
 =?utf-8?B?RkNqM0p4UTlscWROUmVyWkQ3Qy9LaUZ0U1huWlhjUS90RmNtOXV1c3M3NWI5?=
 =?utf-8?B?VWVuRndhbzdNaEYxM212MlV1MXRkQ3dIaTZqQmFEWUxtZnZVVGxydmJrNFIv?=
 =?utf-8?B?eU8xZEdGSWFyUDlPeEg2MmlGRFVDZk1MZzZBakRrNnN6ZFg5QWVvY3lDWFRq?=
 =?utf-8?B?VEtrVWIrZGVBU3FzaDV0WE1Qby9RVzdxY0c3SWptbVMvY3A5aG1VNHpxak9p?=
 =?utf-8?B?VFM5QWwzdVZ6KzdkWUp3SSttdHcwcEZxZVFlYzNnK0RacHRtOGZaTE5OYWNM?=
 =?utf-8?B?Y05GSFdhbFpWN2kwdGs0aDlCbW41dTNrL2FsSEIvSW0wWmcyekxZRTVrY3NI?=
 =?utf-8?B?Y01maHJLb3ZJMCtjRmdYbUtzNDdPdGlqc0ZoMjNmZDFuWmtwWVdCUjR6NWNL?=
 =?utf-8?B?ZjF5VjBaYWladFhtN2J0S3hGWHNqUUVOTHZsRGxKc2ZUUWlnNVVHVWcxVHFs?=
 =?utf-8?B?RG5JZ2lhK2J6bzhYSkRicm42cGdwQS9jRkJ2UDcvRXVHZ0VqVnlhc1lUdU1a?=
 =?utf-8?B?dlRtMVZtTUUyRTVFTEE0S1EzMmd0QWorSHE3NWRYVEJxdUh3VWV3alNCQ3Vv?=
 =?utf-8?B?S0xSN1VueXN4d1l1VDBYWFZJaWJIWjJTVnRRekVVYm83Q2tpbHFRNVhLR1Fa?=
 =?utf-8?B?Q2hPSWNMU2tLZXhZbnpqbmd0ejVBK2RrZXNtc2tLT1dEb3NaMHVZUU5Ga1ZC?=
 =?utf-8?B?SVFGZ0tuczh1MXk4T3QybkN1UnQweEtLU3JvVFNicTNJZTI4ekFjOWNrUE5D?=
 =?utf-8?B?amNwQmJpcnpJZDRvZHBRWnhIYW51eDZKemdJNitZMDdKQVVxL1dUMElsQmpx?=
 =?utf-8?B?dnZXdnlYaWtUNitkcEp0VmZDZTExKytYVVhJSE9mVUg2OXA2eUp6Slo5Y1pz?=
 =?utf-8?Q?DkglmFvVEmdbK0RxdTVeJSQptHiGlsOMnlgHSNX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7774d84-fc14-4235-a792-08d971f8e396
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:13:23.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXdSfbCYvgXozurmPaARtxlnRGuVKssWDwgdeKOzKQHuirdoSSd5NUtLJsjbmk5WNeJhUNtDrNo0pK29j9rxJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

The code is unreachable for HVM or PVH, and it also makes little sense
in auto-translated environments. On Arm, with
xen_{create,destroy}_contiguous_region() both being stubs, I have a hard
time seeing what good the Xen specific variant does - the generic one
ought to be fine for all purposes there. Still Arm code explicitly
references symbols here, so the code will continue to be included there.

Instead of making PCI_XEN's "select" conditional, simply drop it -
SWIOTLB_XEN will be available unconditionally in the PV case anyway, and
is - as explained above - dead code in non-PV environments.

This in turn allows dropping the stubs for
xen_{create,destroy}_contiguous_region(), the former of which was broken
anyway - it failed to set the DMA handle output.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2605,7 +2605,6 @@ config PCI_OLPC
 config PCI_XEN
 	def_bool y
 	depends on PCI && XEN
-	select SWIOTLB_XEN
 
 config MMCONF_FAM10H
 	def_bool y
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -177,6 +177,7 @@ config XEN_GRANT_DMA_ALLOC
 
 config SWIOTLB_XEN
 	def_bool y
+	depends on XEN_PV || ARM || ARM64
 	select DMA_OPS
 	select SWIOTLB
 
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -46,19 +46,7 @@ extern unsigned long *xen_contiguous_bit
 int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				unsigned int address_bits,
 				dma_addr_t *dma_handle);
-
 void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order);
-#else
-static inline int xen_create_contiguous_region(phys_addr_t pstart,
-					       unsigned int order,
-					       unsigned int address_bits,
-					       dma_addr_t *dma_handle)
-{
-	return 0;
-}
-
-static inline void xen_destroy_contiguous_region(phys_addr_t pstart,
-						 unsigned int order) { }
 #endif
 
 #if defined(CONFIG_XEN_PV)


