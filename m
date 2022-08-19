Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52659968D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390103.627326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwxb-00063I-IW; Fri, 19 Aug 2022 08:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390103.627326; Fri, 19 Aug 2022 08:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwxb-0005zn-FW; Fri, 19 Aug 2022 08:02:31 +0000
Received: by outflank-mailman (input) for mailman id 390103;
 Fri, 19 Aug 2022 08:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOwxZ-0005zf-O2
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:02:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44e483a9-1f95-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 10:02:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 08:02:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 08:02:27 +0000
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
X-Inumbo-ID: 44e483a9-1f95-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LngbvELNnqOi7fzE1SCCaTr4fp9u7aZ8kKDQuX/K5PM4aLddmcKCWrW9587ZJEvAlmCFyjIskVx2qbcYJnN15UbM8wPp9WDyGKO9uzG+hcXcT1uLyvAXWPjEQdqWnkOvxhKaoTw1GAIuatcWkYI0uk/YoZ04awwq3qaB98led15xe3RVgDJRSxjJoCsJIdONMy39UM+sTdWlcelaLLJo1lgV9dNB2DfIyyi3PFqlCEw1Lwn4ecvvzU7KfphkFWTsYus5n55NrOMojJaaXhJUbD77U60QUVz1kAi70Q/ZEjMOlABLbEX9avUrqw+2kmoGtchNfq1ADtHpEUPYTK0XHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BR4PK+t4pG48d+FtjHCAGkQdqKixBM2NDX6ZX/kNB8g=;
 b=Lq1FrPs8UCgHTcMTCEiN/l0Al75LEb6/nYt1Wal54ue1JTwcv7qnRz0fNLW3IpfFdgheOIf/PrnfyCtGozDo67OuzuP6Ja/tnIQjTXufwtKS22OVpYrl0gh2JkRkvh36z8UY3aUxFq62c9j6uO9Fwq8ZoAKx/d1hN7dhrD/PoLHYLCeMp7/4dLYK+wPTWBZhw3cOyryXTgp5bImmaWYeme9hzll9DG0Nb9+c6xtXOm/ZIgiu3nLiwm2qaBI2YFKtksr046EWyY0PP/mQOO2dDmszznV6JXyCCOm5/W+TiShqQgbu7OjbJk7rpntJHoAd/Etfa3qud2kICm64i9QSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BR4PK+t4pG48d+FtjHCAGkQdqKixBM2NDX6ZX/kNB8g=;
 b=seyRTlTxCCowCNBJ+16aq7RnW/6LY0YF5uYvep9K7ZzjXFLQvtnKnn48Zvfqo4YFCkn8g9RmR59aZtFZxl2Iwpgu5G2U9iXDewCQuvnQxbWkI1WzIDDYsjlajuyaUmLB2wfAvwJBzHqbAJEfNEtrATPz3BLJUz4JjzE8uQdhrWyHkPVVYuiq55U1MxMRP2CM2sM9MHu5x+USu2TfHeCOaFsHSCmVq10yYkfxWwVp4VCFwZ9A4vLwoU/6WcgZWlWdFBOYLtPuWCmogTKnAv2vJFT31K6qdLXweeUL/DzKqneX1pTSkHboO3QN4m6DyWybIhJfE801KHVJ84j6yn2n/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e5496f9-47f1-3cf4-794a-9a840ee7c59f@suse.com>
Date: Fri, 19 Aug 2022 10:02:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
 <6da837d7-4784-f517-5c24-2bbe6a2af2be@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6da837d7-4784-f517-5c24-2bbe6a2af2be@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0398.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a683a87d-9a4d-4dea-ca0d-08da81b92881
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b7Xxjcn48MWxv78ONEyVo9JFExsRa9Q2fqBzbhT5c9KGCX9LfouVXbGMMlCayzOf6z9NviZozmAOrGcf1HDV7sZGwI7EDRz3sxtWGyw3EyZI8AnbEXJks91hrOdpJI6CCZPXGEsl1LtOT87N1arTtB0NOvAWmYBeHgL55o9sgI4//esNJeh4D1KvE5AEU+LGuFgx9YWpaeRraJ6qnYCFi0N8e63B7yAUnEWe4GBVKHJOC7TAdaeh5n1IrkPhcg0Gkd6aQvRZX0c9XP00bUOT6kPpPqMgqRpymUwSiWzhZY49KGHPd+4EyKMJGgCe6hZoBby4uT3XbD8ktHB+9gZTBskuT+L5NXxyaqALBvksdi1nNJkN/yTBEvF5ZN4HEq+sPpRV+ZSAh3WIbbD+tLb55SXNmH2Lb479hYMU5nIrO5XrhvfT/rD5RnZwWYBskOVY/tsXBj/ICS1FEOF9buuEu7lQXHVxjz22KK4voJ9/xAc42jkPCUqhCUY0eRvBkf9Np7g21s+8A91KhM0rxIYNH7Pz7UyQMpCGwHlFJTOJ63D7wQMwVluIYRy03zsZ+obBH1C2KaMfzloH/mcUXLF6IpBJSoCrwpdl4kAStOiV/RypkZwyS7Xh8kvJO60YCq0PjuQinJSY7g9TXIJN2JcQdBYwMSfaMd3oHoBX0Jsu28hvPMKJh/+tvln3tJlGd4VVOrz2HqLQbEvylYbBqlfNi4AeLnhMa6CJPyOQq1kXD4UCRPEAO7bx33dn/2Rj8rAr9yg+4k19Nf+6+zO/chSBdm2USh6HDAD85hifHmlyHfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(136003)(376002)(346002)(478600001)(41300700001)(53546011)(6506007)(86362001)(31696002)(36756003)(26005)(6512007)(31686004)(2616005)(6486002)(186003)(66946007)(66556008)(8676002)(4326008)(54906003)(6916009)(66476007)(316002)(5660300002)(4744005)(8936002)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlgyRHRTK3lodjRtdkRjVUNaSGxTRnpQblpzOC9TQyt1MnQzcVNUWEN1ZHZL?=
 =?utf-8?B?Wmd4b3c2YUR0RWJ2emtsemRvbC9jWllUVXFqc0htVlllQlQ3YW1HUjF3WUla?=
 =?utf-8?B?S3VnZWpHdmNTL3FHaFI0ZDhCTTRGV3FuSUtWU2lza2hKL2JkWVlMbmhobTBr?=
 =?utf-8?B?dExPTWt1MWE3Y2o2L3RwSkthN0xVUE91T3RYNFM4ZkY4Vkx2M2NOdjU5RXJO?=
 =?utf-8?B?K05ETE9uUm1EcUc3RWp6MS84Ym54MnpsRVdDQlBuZ1JWelhuSC8rMVJVU2NS?=
 =?utf-8?B?VEREUWwyc28rWkdGSkFsWDkwRk9qMk42RncyUlR5bEJpVHpZblRMeTB4M0tr?=
 =?utf-8?B?emxaYkpna3h6Y1d5Z1p4SkdjM3ZnTWJ5bDU1OVpYRE1Dd2RiaXNCS081cFBm?=
 =?utf-8?B?OC8vOG4reUZtSEFBSjdLRERVQXFML3Y4eGMraWFzS092dmVSMk9SQTQrN1Y3?=
 =?utf-8?B?UFJnTjBYNHJrOWdjd2VFb0VPY01FTUNUZXFqeXVOQkF0bWFEcStHTUJGbWR2?=
 =?utf-8?B?alV6WDNnMnN6cVRtc2I4RUVCUTJMT3Z5ZnFuUmtFZkZGR0tuOUR6Y2NXaVhK?=
 =?utf-8?B?NHpQc2NiTW9qZ0JrUC9XQkM0TW9YbGRhQkRNb0NwbzlUbmVHTmsxcERpTEIw?=
 =?utf-8?B?T29Pa1c3aUZqb0NTc0pwM085bDZaN1NJRVkzQW9kYS82NU15OE03T2k0WVBK?=
 =?utf-8?B?QXdUa0Z1M25uK1dHb0hsUmFiU2dPenBWMitIT3VORExFMFdqMXBxQU5ZM2dr?=
 =?utf-8?B?U3JkNkc2cGJJTC9HZ3k5UGo0dDdpa1lRK0ZjQk9YbG9zdSsvVWVNWUo3a0NI?=
 =?utf-8?B?SmlOMmVLTzRNT1c1cFp0WFlCVGs1NkkyQ3QvSUJiVXdPdXhDb3BhRHZKVEd3?=
 =?utf-8?B?NnFEUVpBVlRZWHF6RU4yd05BelpxOTVnbDJjQjdPTnl6QU5sakZYYUN4Q2ZI?=
 =?utf-8?B?UUw4UTh5akp6QytoOCtsTFd6Q3BJcktVS1ZaUFFMdUR1VUNCaWVnclM0ZE9J?=
 =?utf-8?B?MUE4MHhKcTBjOFp1TEZ4U0l4R1VpYjZDV2ptTEpFeGhROFJRdjNwV2FLYnVr?=
 =?utf-8?B?T1V6MFlOL3psaWJ3cDZRN04rNUlUZTBNbDdqU2U0UmIyVTdzYkFSLzVkL0Q3?=
 =?utf-8?B?SXplN3JBUjJrTDI5TUZXMGE4RjFjWXVEbDk4dVlQVmVFcFBQZENodDFiUURU?=
 =?utf-8?B?VjdlMk02dDF5NGcrYUszY2R6L2RaV3ducnpxbGNFQVlQa1gwTTRQT2NQQmo4?=
 =?utf-8?B?MEovc3U0ODZlUTExY0oweE5PK0NCbU5tc0xZSVkrOElHSmg4bXlQNWxDQW9E?=
 =?utf-8?B?bFYyejU1cTN6OXROWEZsYmFwT04vYmZ5TjNsQjJ3MEpobjVuZ0NNTnN1bDFy?=
 =?utf-8?B?aHZrUWlqdXMvckwrR1RnOUpOd0FlRTVRNWxEWjluUi9ES0ZkUGczT2RYTWMy?=
 =?utf-8?B?cnlwOUFOeFhwcHIzWUx3Yk5PbzcyQVZkdTFaUk5oRGdMZVFPSnZXbVlPTmha?=
 =?utf-8?B?SW9Xbm4rYjV5UXJpTXEwb3dpSjh6eUxlTUhhc3BGR2twYUcxclpnanhmb082?=
 =?utf-8?B?OG1TYkJJMXBkeVlBYTJPQ3VQU1hBcWVaN0pKSTNFNmtERlVGcUk4cnNsSnBj?=
 =?utf-8?B?TlozdW5pMUQ2cHd2TDJSUmszN2dQcGtLcFhldnhUaDNJNmJ0UHZNYmJvRWZZ?=
 =?utf-8?B?WWd1NVhsZEhEekNTU2wxVzdsTXd0RG50ZjJURmdXVFZkZjh1WnVJYWsrRjZW?=
 =?utf-8?B?Zm9MZFNYNGZoSWNxNXJyNlZ3U25mVUhMWVdpUTlEZUJOcTBwNVllbE1NM3d4?=
 =?utf-8?B?b3RjTURYUUxZdXpLTWhSdDE2MmJWc3ZSbWliTkw3dmd4eXRwUGxPZHZMNXRr?=
 =?utf-8?B?WlhyOGNwcyswbjJwNzVBM1pnejdzNFA1aytQbkQzKzNjbUszcWFrRDBJekxM?=
 =?utf-8?B?dm9QVXc3RURmOHhuaFdiSTdvMGIrdWRrMEhiMVRwbmhVZzhMTDhNV0l3eXl5?=
 =?utf-8?B?eWo0SUs0a0JJZnc1aWVZMWVja1pnWnRMR1NJc1lXQ0hoSmRnVWFaYmJHQ3Bz?=
 =?utf-8?B?QnJzcEpHUE1IcGJzL3BNaXNhMU5DaU5IOUNCZURVK1JxcjYyTlNtTFF4OTd0?=
 =?utf-8?Q?X00/rcsHa4zPU84D4LzQQF04p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a683a87d-9a4d-4dea-ca0d-08da81b92881
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:02:27.6280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRZViDRYCDisXAvM0VnjCGqO9eT1zZTkYUFpADOCceTVUmXpFloLFygFCmRbH3bsjOjFLS9oQaC5q6Iv9DYUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 19.08.2022 09:58, Julien Grall wrote:
> On 19/08/2022 08:50, Jan Beulich wrote:
>> - add parentheses where they were missing (MISRA)
>> - make sure to evaluate also v exactly once (MISRA)
>> - remove excess parentheses
>> - rename local variables to not have leading underscores
>> - apply Xen coding style
> 
> This code has been taken from Linux. From you write above, I don't see 
> any strong reason for us to modify it (even if it is small).

At least the MISRA issues want addressing, I suppose. Plus I wasn't
able to spot the macro in Linux anymore (nor __memzero()), so to me
there seemed to be little point to consider keeping anything "in sync"
here.

Jan

