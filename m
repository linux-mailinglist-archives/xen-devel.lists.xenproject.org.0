Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533903EB0A3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 08:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166640.304167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mER4d-0005Wy-Gk; Fri, 13 Aug 2021 06:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166640.304167; Fri, 13 Aug 2021 06:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mER4d-0005TV-Cx; Fri, 13 Aug 2021 06:53:47 +0000
Received: by outflank-mailman (input) for mailman id 166640;
 Fri, 13 Aug 2021 06:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mER4c-0005TP-35
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 06:53:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33376ab6-fc03-11eb-a25f-12813bfff9fa;
 Fri, 13 Aug 2021 06:53:44 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-1UhRmV_2N-m4OtHFYCXIxg-1;
 Fri, 13 Aug 2021 08:53:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 06:53:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:53:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15 via Frontend Transport; Fri, 13 Aug 2021 06:53:40 +0000
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
X-Inumbo-ID: 33376ab6-fc03-11eb-a25f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628837623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4r4/U0Sd+x/vw8oKi4pjEa/i83aELXdDLXnT4NlCX2c=;
	b=bYIvr/5P+tuigkf1SztppH4cs4I5FxtCWAyQJ7rjbdN0s9A4UOW58HH1RaK/VWXceaHB1c
	9H3KTy5g5/hIgAMjWKE042a+n5S04wMIKdlRcnSevjsHdUnBQXuaJaFZXk11TkF0EoYFZl
	OQxvUZHJ/x77QuLagZAi7CFGI/0sKN8=
X-MC-Unique: 1UhRmV_2N-m4OtHFYCXIxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzkyfpsKu6cMqXpjfnPlAD+5zFJKtmHv1W/pfhq5Wjr6/T9Ymlo66S9+pTxb06kDcYH9i9wkeXRjcscWt3w5EUpfcnNVOQ5b4SwL9uEocWpiMydEzHA8WbbTKG37gygMGd9UyJxZvNWGgajxYENafuKC4vpz5b2b0Xvx14wV3DHTH4MIDtyKb6i1cobucGEs6fwrgbRpRZbiRoDrYrzp5F45Kci8s6K/YqU3qi3rElp6lcHyVvNEY6ixsWW5VBDRZQYzGmZPv1oXXwlGitfgugHGpu7mhlNn5qDCoCOhtbcVIT+8/OSrErmjelH1oXIH+8qnpd0vqy+SxRBkj45h0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCotReDo8e92hL89D1hHb/VtVR0xTLg4xltv/0BRQ94=;
 b=GP1P74U3meiaMdU8lyYW+y6/iX8CFmwjtJawePSXLcsZ243TCDbSOcsWJp3PcIrV4cMZ/zzMFQ6K5G36uNkmj3ChJWsaBKMLOwZHv4ft/OhrYhtrCcqtxxeUEfO/6NL90OzYGw1/2vhgL4G4mKMSwdBO5GRE/7v92/eeEuhZMj0/UcAgceZYZsWIe5S+NBQCBi3EdLrVtjSq4A02T3nfgrIrRg/Uld/vUaMIeLG7RNrhxu8gHENzaP4ZE/dm6mWnrrlxWjq0MblxLAdAA7QhpwnBeb6ZG94Qehhv8IjXCKb+VfeKvmsRUrzF6aekm100Em7ZQE1GJw+vk/1CAfF1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <bb62f56a-6023-58df-99ed-a4588c4d80b9@suse.com>
 <DB9PR08MB6857FD05AA5D73C8C59C9E419EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a2b99f42-9829-13f0-cbf1-c823386f12d4@suse.com>
Date: Fri, 13 Aug 2021 08:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DB9PR08MB6857FD05AA5D73C8C59C9E419EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe2752bd-62ce-4b43-d06a-08d95e271569
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686486FA6607A192CA011670B3FA9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2WJPp945+Fu1hkHgUXCd1HuRabb73kt3pIGbeDiNj0Ef6zj0o753cz49xGTD+k/8vZorwka3zla0aTeflw2O2sDbE0naBT+AatcTsrGSb3TZG16mnisgHNJtJUwKT9jlue4PqTR4vDFjWkEqcnzVddTF4r6QTl4yWEpIfXJS1OR0H6Ae+6qCT118VftJtKQt09dlW39fcpxh62U8rMDUnXocgTZXC7WzAd9VGa23r5mpZdlMSA+UgDT2x+8Q+xT7g6biRuSWjxLQz7R9YhdgpQNwFxKRZBRxk7AxfADORpv3C4J10fCpCg5CG880UAbbGZM0LPujs7bFd4cVawa7iJHj9sE2SC+foALWsJtQxVqMo4I1fRCt2XTSnYlBDTXOcJX/qVA1+qyYOplY79e+g8McDGlCNtw1WDAXhEjOLEBE/KNXEZI/BXiwU0f6LUryH/I1NRP3dn8JdVVgDoccocbBx4CPIjXNQEz6p7KeRrlKjtPxEuyWkWTg6P5ikIpbyKN8pPZG+qOjTmy6Yzw8n6ngEZ7kQeIRC1o1U7DiDChnfQyyiGRDjZ4hSlJRvuRvmD3JMJfcbzvgD53KLAQH5lqL2Y7Awaa6HrwPBOvbu8E/DTIfPMyrSIzNhbRcsfTKS3FT+JjHVOBdP9fcq7lhR/3DkceMWbIlad3TgxIJ9znNE8Hpg6r4PkFSKZYxpAlIGp3+3jJYMInqbQ7bZD1G165X6YkFPvHPjjOTEYSlE8w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(4326008)(316002)(6916009)(2906002)(5660300002)(16576012)(956004)(31686004)(83380400001)(53546011)(508600001)(38100700002)(186003)(26005)(2616005)(66556008)(66946007)(66476007)(8676002)(8936002)(54906003)(36756003)(31696002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0xHfDSegp21fxErsvocGQTTfqMpfg7KQ1btLe38sFWrMf9xK3xPiViptAnjP?=
 =?us-ascii?Q?GBdKNlul3pge/jDnOEcTopBRLa7jF5dQ5FI4vDKqjFgM0b8S4/DCRleJszCE?=
 =?us-ascii?Q?xMFfZwIGL7GBK//uXOhG2XO2nNEO+1uKF8baXvOVoNrydFUA/jmC4mrXHhs8?=
 =?us-ascii?Q?XQtxrJxqIYOpVmjk7R73rDyNo0oggi8dOEW5S9XROO1dw8RGaKRBLGGWF3eB?=
 =?us-ascii?Q?TFVpmJ0FaD6jzd8KyDi1skNvAXOSIWXk9fl4A1x3kEx0/rNlC2+JSPu/bnee?=
 =?us-ascii?Q?bgK2OK3kbt0O3yYfIK4gT19/zF5Hqb6nti1WVRY0Y4wH8ieRGogkWoPtxhCT?=
 =?us-ascii?Q?amnq5licc1RGdj3U7OSlBED+tCRsNw3szisVHAYjZ89ACihin9BNQfE7yAML?=
 =?us-ascii?Q?SV1ZrcGuRgN6Pf1466Q6AuDf3/2MSl5W22BzykCei2trV1v4/mDLrqQ6MH3V?=
 =?us-ascii?Q?+Xjvvs6yOdfg5EiG8pVWjqM2zPTii204/a0Y9GFKvhVHm54SwDXyecbDL4/J?=
 =?us-ascii?Q?r7JZG2f05D9YBcvhL0VS/ONnkchIMBAOX1yjRJ56efiLgHHLPpF1Q/Y1PjME?=
 =?us-ascii?Q?oa4L0smRXrayBnqsYmnd5WlUad87bSTxOMHvoy8kceuHUnvdNe7aJHMSqYpM?=
 =?us-ascii?Q?+cSF39laM7xH68ADFx53d/sKoE6QAlZQyl3PayM14PsUmTcOTZg+OtUIjMSW?=
 =?us-ascii?Q?jim/ZeyeglOxTg9aXhmMvXdYQAAfj9FnesjLnzWRN+r/qWyBOM0krEdAknpJ?=
 =?us-ascii?Q?gNnxfosdhbrPjJd/Ehs5rOMVsnxIQaBiVwFkcwFQniz8notP5ccvjMebggml?=
 =?us-ascii?Q?xvv+bVn0K0/75fvkxhUqA7VM5/AAulOj9Tj8glTPItfOBIFm/zQJnm8611EO?=
 =?us-ascii?Q?236eg1BXWXIH4PB7neLSpEmkDC7vSm0keUCfsyGTpS6IDU8MC7+EbpVLeuXJ?=
 =?us-ascii?Q?Hj4k34ue2FpfV+HqB0POkXidVjf5PBG3KKgXXSHqWx5VzCMCHLjusZfhKtT0?=
 =?us-ascii?Q?hgEB7LXer5SpbuMARzrGdsT5q4pGBnA9u9SwwPrpYnzjIL56C+bVFWQ3r5yV?=
 =?us-ascii?Q?p+MGECRqDJ8OfV1lJ9s6B858sVcRSVx7+2oB/DDQV6UyLvBvu8GSlfqtz438?=
 =?us-ascii?Q?0Zayh/Rvu1QsBI/jc3Wh3Tk6HqpsaVTdu52C7VVOJrV4EFTo495wsEMk81X9?=
 =?us-ascii?Q?mG+Eua3z2zHJT9DvId/2edKw4AHAhwgs4BhUvpSoAhwvE7Sj8ucqcxIbsWrc?=
 =?us-ascii?Q?IQs5u+QAZNudSx6nHEfJK3EFV4UqDKH+y/yhMJRF2rY0BI8zm51m5SNKdcUr?=
 =?us-ascii?Q?XcCXD8H5TCRlB4Ty5zreKfr+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2752bd-62ce-4b43-d06a-08d95e271569
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:53:40.8495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc+Q6e7iZ/p/kCZaefhXyh2G9q5GD2yxLgfC58xEnmmXE9+5W9plB5VP1/LbmnoRZFiTuNRcLdk8gwGBXfo6WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 13.08.2021 04:33, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2021=E5=B9=B48=E6=9C=8811=E6=97=A5 18:42
>>
>> On 11.08.2021 12:23, Wei Chen wrote:
>>> Hongda Deng (2):
>>>   xen/arm: return default DMA bit width when platform is not set
>>>   xen/arm: Fix lowmem_bitsize when arch_get_dma_bitsize return 0
>>>
>>> Wei Chen (38):
>>>   tools: Fix -Werror=3Dmaybe-uninitialized for xlu_pci_parse_bdf
>>>   xen/arm: Print a 64-bit number in hex from early uart
>>>   xen/x86: Initialize memnodemapsize while faking NUMA node
>>>   xen: decouple NUMA from ACPI in Kconfig
>>>   xen/arm: use !CONFIG_NUMA to keep fake NUMA API
>>>   xen/x86: Move NUMA memory node map functions to common
>>>   xen/x86: Move numa_add_cpu_node to common
>>>   xen/x86: Move NR_NODE_MEMBLKS macro to common
>>>   xen/x86: Move NUMA nodes and memory block ranges to common
>>>   xen/x86: Move numa_initmem_init to common
>>>   xen/arm: introduce numa_set_node for Arm
>>>   xen/arm: set NUMA nodes max number to 64 by default
>>>   xen/x86: move NUMA API from x86 header to common header
>>>   xen/arm: Create a fake NUMA node to use common code
>>>   xen/arm: Introduce DEVICE_TREE_NUMA Kconfig for arm64
>>>   xen/arm: Keep memory nodes in dtb for NUMA when boot from EFI
>>>   xen: fdt: Introduce a helper to check fdt node type
>>>   xen/arm: implement node distance helpers for Arm64
>>>   xen/arm: introduce device_tree_numa as a switch for device tree NUMA
>>>   xen/arm: introduce a helper to parse device tree processor node
>>>   xen/arm: introduce a helper to parse device tree memory node
>>>   xen/arm: introduce a helper to parse device tree NUMA distance map
>>>   xen/arm: unified entry to parse all NUMA data from device tree
>>>   xen/arm: Add boot and secondary CPU to NUMA system
>>>   xen/arm: build CPU NUMA node map while creating cpu_logical_map
>>>   xen/x86: decouple nodes_cover_memory with E820 map
>>>   xen/arm: implement Arm arch helpers Arm to get memory map info
>>>   xen: move NUMA memory and CPU parsed nodemasks to common
>>>   xen/x86: move nodes_cover_memory to common
>>>   xen/x86: make acpi_scan_nodes to be neutral
>>>   xen: export bad_srat and srat_disabled to extern
>>>   xen: move numa_scan_nodes from x86 to common
>>>   xen: enable numa_scan_nodes for device tree based NUMA
>>>   xen/arm: keep guest still be NUMA unware
>>>   xen: introduce an arch helper to do NUMA init failed fallback
>>>   xen/arm: enable device tree based NUMA in system init
>>>   xen/x86: move numa_setup to common to support NUMA switch in command
>>>     line
>>>   xen/x86: move dump_numa info hotkey to common
>>
>> May I please ask that you follow patch submission guidelines, in that
>> you send patches To: the list and Cc: relevant people. Furthermore I
>> doubt that I need to be on Cc: for all 40 of the patches.
>>
>=20
> Thanks for your reminder. Before I sent this series, I had paid
> sometime to consider CC or TO you, I found you are in the X86 Arch,
> x86 memory management maintainer lists. And in this patch series,
> I have done some changes that affects x86, so I added you in TO list.
> Obviously, my understanding had some mistake. I will add you to CC
> list in next version.

And then on a patch-by-patch basis please, unless you see a specific
need to also Cc my on certain Arm-only patches. Thanks.

Jan


