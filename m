Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60E3D1314
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 17:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159443.293296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6EcN-0004eB-Aq; Wed, 21 Jul 2021 15:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159443.293296; Wed, 21 Jul 2021 15:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6EcN-0004ad-7X; Wed, 21 Jul 2021 15:58:43 +0000
Received: by outflank-mailman (input) for mailman id 159443;
 Wed, 21 Jul 2021 15:58:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NGKG=MN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m6EcL-0004aX-Hn
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 15:58:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 239e4f09-a5fe-4d5f-bdb7-22460d58c87b;
 Wed, 21 Jul 2021 15:58:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-spnDpO2sNp6TXeoEIqgPWg-1; Wed, 21 Jul 2021 17:58:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 15:58:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 15:58:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PAZP264CA0083.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 15:58:37 +0000
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
X-Inumbo-ID: 239e4f09-a5fe-4d5f-bdb7-22460d58c87b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626883119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5FOiuvQ1lHPaZMdImszYY/nt3sbsFeU2u+zkCtu7vEw=;
	b=ctm3CcJO8TMqGMXTv7BqMBHX7FoIfToMYuiVjyZUszIV9zmgtAETR31MohwCE0VKZhoYXe
	AIIqIFVztxuK8m6rb3MmGAjsiF62/6pKyYeC9JKvJFvHPSC3t5FpQ+Tb/GlPe1b0fN8T7d
	4osuVhr6jtwQxJO4GchJT9Pzgbp/TnM=
X-MC-Unique: spnDpO2sNp6TXeoEIqgPWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1aeiy2Ob7n49rpxPvZW0zwAmsH5T6IptLI4pI1g2jSZJc9w6t9K4AyxEaLdqc6ZqGFKu0yDR1tMo4G83MpyYWWqRMOMD+CDB4ofBBYAatGNmDSEIDR72JbPFcBTt9/ov6PhXLHE4+VQMHcsFekSLgBg/n16czNGChumKqfqOsUt+nAeAEDHKxMViaJmxWgVDo/HCZacCVx3pel1pbnnKDuwc7tcPkglddIlY/xLSSeHaxKkkHTiNNM06ZZ6b68oI389tZUWAGDSyp4rlb+a1YEXbDQQgb1x7OqDzTijGJuCqM4ZQgpacH9NhrlSjyHvxVc2vm0b7vjRUsRfvYFSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FOiuvQ1lHPaZMdImszYY/nt3sbsFeU2u+zkCtu7vEw=;
 b=W7UVNB310jI6qMZw+pJSzOMo1rPfKekpOUfWM8n3H4AeEwbfrj7FtPUBT94kBU7Cgj7YW6WUO3/WOPbeJ6uaTkIpnPVM9llAWorE2o9q7V2m23tjqf7O+7+2OMc9KFDCJmWgH4rwwRXjOfav0pPiIyv7/amVC+cnhQERrmwrdReCn4ZnvrNL0KXRK7VilabZDT4c+xQY9csUEM+UkcG8jjUY2MxI2AuFx6Dzu51eBbtsQKHnDYFuyQQknybn4FxSW0ehxUvXiLhAiQszDwboqSDvmQcIZ+nv7nejgLBUOeFvlwqe+tMcMjStUEz+KEJN4/eysD9Po83gj1YR/k+iVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: your change "iommu: make map and unmap take a page count, similar to
 flush"
Message-ID: <185f185b-443b-bea4-5068-b9ed763a4c2f@suse.com>
Date: Wed, 21 Jul 2021 17:58:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 621d41d7-1fed-41f2-7eff-08d94c6066d3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71493B70F54FAF3EAE5A9C27B3E39@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NQZPUXvC8GlvK1Gqp4AgV/ICbbOC2qpM9ZCU/PgcqVe3zbGESOiQKOxGdlSfeoTPrBIR13Z+xKGK16eY7PPMxqbUTxP5vzjUdzNT6Lggs+vMygP+9mbxA2xuHTg53cRCuLW2RWzVGYsy9VBQFYrys3J1UK3KDSul0KTKE0J81oYaH2vntZyi6J+yfdkkz4Z2qazp83taF4kthcp4kqIfzrnnsvcOLVAhP4EfAahAaklaGMYNnxkiTKYDdgBSS6QIcw+suDGER9ZlpAuLYCxUH8LsqdzeWnNvNZj96G7R+HVwNjgQBYxG7L2He3suFNV/cJChRDHQlNpYjp4ghJ2PgNda5Q1gnAyQNvDDZGgmOawvkbIBjX2/zsnc7gy8qKgbshODFMc5JA6sQzSQ8GwAPGmjw9J31FV3MR5EBt/C/21m1qZ+eN1uVrY90kZ6CsjxlNQHG+ij4pGKFw0DAFBhkI/GCj6Lg3ZuJTqFNHzwHj9sB9fb8OC8WATUoXRknxJZv8h2RsFQJn2TB+KpcnGeOEVBUaJ9CEL1kA76OJjZT0wT8o2xKI8/lQXW4F4Sfy4MglNdMY1SG0Que99iLmBaMLTEEFa9xh1Qbo2geFbZwosFdlsE6yBVZrrLiq/SujCGUi7aJ3DwkXLPEpWd/lCr1rggOwl877Jjewgw541VOVhfPJZKNEJwesFoqo6YxLh3EL6Rp+PGnVDJjKWRgMzaf35H3K+J2nPqolwJNKUI/dY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(4326008)(2906002)(38100700002)(8936002)(16576012)(6916009)(36756003)(6486002)(31686004)(508600001)(86362001)(956004)(5660300002)(26005)(83380400001)(66946007)(66476007)(316002)(66556008)(8676002)(2616005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTFxV2JBZHhKOUtsZG9tc24vQjA5dEw0R3g4L1lCRHlNQThDelVxVkZ2QjRC?=
 =?utf-8?B?cnQva0ZZT0xsUFNJSU5ETEhlcVYwOS8zcmZvaW1xdk8rVFkxUW56aVdyMFZI?=
 =?utf-8?B?QnJDeW5OdnV4VGVzeGNzUU1pK1JLRnJQSkd3UENVU0FMMUZTZVNvR2NiS202?=
 =?utf-8?B?aHkvRXFWZngwVTVNQ05XL2htWldBYUZqQ1hBWkxaZjQ5ZjcxaUhVYWh6Vitw?=
 =?utf-8?B?cmpJdXFXWHZhK09FVzJ4UWZsRWJVZzFnY2VnTnVUMFkxN2FaVXcwaWFQQTUy?=
 =?utf-8?B?eWg5VUpYMWs3Q3VZMXZOaTRwT0ExVU9KSGFXOFFqd3FIUm1VNmFUTk5IenJ5?=
 =?utf-8?B?Y1BxalFnYVE1djdVT0JyMlVlZnYySE9LQXdJNjJ6VWx5RklYallreHZXc1Y3?=
 =?utf-8?B?N0VvSWlWQ29ONmRPRmowaU0zVGRINE1GSTJmOXJQVlZjOWIza09WNmVzb3ov?=
 =?utf-8?B?dkJRaDB6T3NCS2NyeDF0ekplcHA3RHh0dDhzQWk3ZDlLT24xV0wrWmE2S0ZB?=
 =?utf-8?B?RThOWkRTdEhqTFQzVEozS3dkV2hLQ2xrdys4U2VYYWhqN25va093NUlTNzI0?=
 =?utf-8?B?bjJIR2EycnErcXhGL3kwTnVwbkdBckhCaHp5Q0dCVCtFSndrYklUTUFnU2F5?=
 =?utf-8?B?bFdpU2N4UG1aVXVQYTRzVEVvOXUyZi9xTEQyNDhFdXpDS2Vkc01jTnEvUWZC?=
 =?utf-8?B?dlBEa0NrNnVWRmhGUExOaTdjSmROc1FtL0NWV3Qzd3FySHVKdi93dk05czNM?=
 =?utf-8?B?TjBldFlWL0hlQ3ovaldrZEZmdW1CcHBrYnNYUndnSGczVEtraFdVK0ZFSDFh?=
 =?utf-8?B?YjR6TWR4NkJjZzRrblpCUFBYWGE1WDFtQjZsUDA1QTREeWhqMWk1ZFRLSk1M?=
 =?utf-8?B?T0l3dnRlTWR6YnYwOGxNT2o3dWNCVnZTUXVaTTFtdzhGYXlJc3hKNUhaUUVI?=
 =?utf-8?B?V1ZVcWFUK25yWDlLMldYTngyOG1iRU0rWEpvcndIUnhoNUZTcS9zL3dBME9R?=
 =?utf-8?B?WHVkWWlUV2o2SmM0UFZlYk5wVVZDek9TblJIK05UZ2VVSmhDeElpbVRsdWNt?=
 =?utf-8?B?c2ErU1NvdWlJMlhMb1Z0ZmdYbXRlaC9BMFhacjNsRjlFamkzRm9LdHNKbGpS?=
 =?utf-8?B?bjhIZHdKcUxQc1lnMUhXblJHbGdvRXhJcWFyY1BiRDhuVVJ1YThScVhRa0Y4?=
 =?utf-8?B?VkgwZkFPdjNpUXpobFE0aTlLa1VwUzFiOFROS014b3ZGRXA3SW1Id21pNC9v?=
 =?utf-8?B?VUlxK2pEUWc4VFV5amhnSlhxSGxpSGNlZlNwNjUvVFd6dUtjSktWa1FmaWhh?=
 =?utf-8?B?Rk1hU3RuajhIU2NnY0RGYzFYTzJzZ21hcmV3RVNkd0swSHFabkxBYlYzNzVU?=
 =?utf-8?B?UDAwVmVkUVpoRHJQTk56cHk2cUM2Z2FtckhXNmlRUGVpMFdTNE1OMWZiMXdx?=
 =?utf-8?B?QkwyTXpTcisrbHNYWFBtVTRzUmFJRDNhOW9Ea1MwU2hibGx1QktrQnBOMm4w?=
 =?utf-8?B?MldQRzU3U2ZTOTVVMUI3YWxPb0FZdFRWcHhKK1dyS1dXcHlNcjZuaFFCaFln?=
 =?utf-8?B?b3JqT1dBYWxOeHRlbkFOVEFJMXRDYWhualEramFmTTcza0J3eXJJaTBxRHVV?=
 =?utf-8?B?cXltYjE3ejZpSkpjeFd3SnhpS2JhSWs4MHIycy9qUEJZcUlCeDhYZFlHVkpz?=
 =?utf-8?B?cWY2enMvQW5FK1BOdHVTYmFNanZmVyt4dDF5L3cxeHFPYUlmSVovMDVYWHNu?=
 =?utf-8?Q?ZjlQiKEvN1qJuKzzzCRx5tYCe6t7WEvfuW63iie?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621d41d7-1fed-41f2-7eff-08d94c6066d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 15:58:37.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFOnoUlQ3UCkqA4FDGYVcsHhVbGzqfT9qAI/j7qoSsOIx0Y4FYadNKO/ct57hpbJh4x496XXWyuKsWMlfFwnOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

Paul,

the description of this says

"At the moment iommu_map() and iommu_unmap() take a page order rather than a
 count, whereas iommu_iotlb_flush() takes a page count rather than an order.
 This patch makes them consistent with each other, opting for a page count since
 CPU page orders are not necessarily the same as those of an IOMMU."

I don't understand the latter sentence at all, now that I read it again.
What may differ is the base page size, but that affects counts of pages
and page order all the same.

I'm intending to make an attempt to cut through the page order (or
count) to the actual vendor functions, in order to then be able to
establish large page mappings where possible. In all cases (perhaps
most noticable on Arm) handing them a page order would seem easier, so
I was considering to have iommu_{,un}map() do that step of abstraction
(or transformation). But since you did explicitly convert from order to
count, I was wondering whether me following this plan would cause
problems with any of your further intentions back then.

If we really wanted to cater for base page size varying between CPU and
IOMMU, besides the IOMMU vendor code needing to announce their value, I
guess we'd have to do quite a bit more abstracting work, as it would
matter to outer layers in particular if the IOMMU base page size was
larger than the CPU's. Supporting just smaller IOMMU base page sizes,
otoh, would seem entirely feasible to deal with inside the rework of
iommu_{,un}map() as mentioned above.

Jan


