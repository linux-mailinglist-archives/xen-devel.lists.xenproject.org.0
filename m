Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B17911AB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 08:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594980.928440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3UE-00035p-Qs; Mon, 04 Sep 2023 06:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594980.928440; Mon, 04 Sep 2023 06:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3UE-00033v-Nv; Mon, 04 Sep 2023 06:55:02 +0000
Received: by outflank-mailman (input) for mailman id 594980;
 Mon, 04 Sep 2023 06:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd3UD-00033p-FT
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 06:55:01 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f76c4fdd-4aef-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 08:55:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 06:54:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 06:54:56 +0000
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
X-Inumbo-ID: f76c4fdd-4aef-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z86pvISJEPocsoa3XvUHLVvz+OqLxLRD5hNcfJQmsQFzSdp7NcJ4IxnbIatpqkO4hyrWZVCnaFp2xgmXdMOUTIDTGZjxpTCnvqWW4BE9cyMW5KKZBkLkifolkzQlyy18jk7QqK3DXHA7vKRMJJu1Kl32ITg2N+iPRs8XKxOlV4qT2/JcRSiWmnVDw51AKgwCKcpRHhfXHEu9asoyMQBJ9+u2WMGsAIJ1JLsyl9PZR4HdfF8wOetm1EKb4HsizYQboFrSCV31kYS/0ZEjHG2xjXYHu/fsnZ5BqL3rjfV2u95bk/VUfSwQSzPzlgewDiowBPCKz7k6FaF0R6OrqrFAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTzpCVHCJTKOQRO3v4L6LiJj6MoZebddJ+AUkOG1B8w=;
 b=axTXPE7iS140q36OOEQ86q2AgOmDHi1lEkI06/rbywrpVhYwahWQGDcezJsdw+B3fvChMENGqWOYV7sSSpB14oi278YENEQY+jkJk3Z5dK1uHXHPPBZI1dTrKxcuPoEiLmbsWfRTkfnMBbVJlIQ3c6HFLSpknk7ZIgje51a4+rUcL9BvUtCekdDfxbnCEunuZDodf38fdm1LDh+kG4aZJR2dTaJP8KhTrl58DQ6jTMIKbZYBNTgNo0V7QRTOB2GqRri2UvoA9bhuEYR4htX0NWoCIMSA3MpVuU77j6iAe+CGWDRhQs1N1IuZm5AKEz/T2mFwpvBfb79qqpVKqP9x5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTzpCVHCJTKOQRO3v4L6LiJj6MoZebddJ+AUkOG1B8w=;
 b=1wwSY+4uyOySlyBOE30Oky87lvtm5AuNf1Iya149oGheKUJrGQcJzD1xjKVJKLG+gQsdAts1PsWuF8XA+19wkkPxSZcvUlNT3AOoR/SrkQKEMB8znbgeK0K2yRNUpkukmZk7oJnzpcR9RcieflZHOcDL5sEg5N5z3fvtlwdmRE5VCOjsQXpVKRWWMFS9oFpo6RFs6HrCRQ/s0tI5nkJOq67KP6Wl3AUfdHgGIjcQ9jkNfUV/tfF6wo3K7D0Z8cURh9vec0zUtU6GPX+qLgfToeL7iOKViXdaUuFiuX+nHexieeGlcNHrsYaI1nOaOrSZGUi1Y854afEmD0ibSfPAQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <464e3134-8b40-5f80-ddc8-7b523b1d3330@suse.com>
Date: Mon, 4 Sep 2023 08:54:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d40ca25-1d4a-48fb-42f5-08dbad13d93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ugEf/ihmojgOGMeLWLHRmP6LaxxL8cTsTl71MGUUyqTjsN0OZyWnvn9FS58NDPxAuv9XL6L5AzY8a+/B3QmRSboQapG5KW3pOLOamvuSQf0/YDSLqqQOnYNs0nuo/ofAO+xTa3uES0PGZF8HEeD1Tlv+d0v9q8+P7E0rA00KBuL2pC9WnRZAWCxAEnEJBc6f1KPOGj2DSmaleGyDp3Oquq7VbcAl2g16vbz1pOep2vARmqRpLOn9u08tB0zjGE/lNAOdmA+WM8wSv9N7OVyHxiWqZKhcUlJ2gAeYsIUh4uUyBP4oirurvMCYnLbRveXp2xm+4kSUi5DxFsJmSkFJL5ZQOHAE4xV4Kv1MARLgjpreiAnnvPoGKdlkVzmDnBaEk17NNKPev6IhG9WUn3ucfOGivUR83etlj3CnlY3RVOdO3PbCZ8SSnjThWxk9oqj17AyT3GOBuF/OAQfZ6oO+zUyx4i98a6I7r3igNhC06UsnC3tGI6jhkaZ5ts6IoQ/cU0cdN6IXumMzcfvKmSqHulKCqDy6rwKhc7Jc7dqKZJr4BgnQdQAeKjW+A/tqCNdWrskV9zcz4h4RJdzQ14lm7FFlEgRPK5mK0TMSgkv16XroXsEcLEoYmhB+scbvYGp3l5JY+TbVBotSf+xfFma3UhDSr6lX6o0O5yxCVsebV/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(186009)(1800799009)(451199024)(41300700001)(6506007)(6486002)(53546011)(478600001)(38100700002)(83380400001)(2616005)(26005)(6512007)(66946007)(36756003)(2906002)(66556008)(66476007)(54906003)(6916009)(316002)(86362001)(31696002)(31686004)(5660300002)(8936002)(8676002)(4326008)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEpDMjVUa1lqcGYxWVVEUlF0bnV3aHpuN1BPNUR3YU53NTdMY0hlWkdGWmow?=
 =?utf-8?B?ZlhjaHlYdUxrMHJFSjhlNFZBWjl6b3ZzNjdqa1ExQUFiejl5ZG1GZHdZNzdh?=
 =?utf-8?B?YjdKSnY0d0VSSlljMlc2am9KWTJxMUZGckxGYW8rQVUrZVhxMnFqYVFUeDE2?=
 =?utf-8?B?OHMwWDM4YUIybVpYblpyRmRkeWlYSWxpcUxBUWVYRUovcUREM2tZM2h2NFNq?=
 =?utf-8?B?b2w0RzR5WWI4MDdrZXZmbnBQNDQ5Q1ViT2pHYjg2TFNhczhRMHVQa1Q3OTd4?=
 =?utf-8?B?NmwvUmovdDJtWUFuTWdubk0xdnRBZ3JCT0xhbW11eUxRVGIxOXEwMGE5MUgv?=
 =?utf-8?B?ZG43YmJsVDNiSmNtRXRnUEFwM2dLdlZqcy9jVzJ2Vy9qQ2R5YkFGZk1tQ2pz?=
 =?utf-8?B?VDM3WDdpQ1ZKeXF0dEVZdzl4WU9QMjZ1b00rVXZQY3YwK2VyNjIySU1BcVJO?=
 =?utf-8?B?V1ZndjQ1QjNQcm9RTk5UTmtpblpSTnpob2dJbklqcUtiNkl4V1JKMkhGRkRu?=
 =?utf-8?B?YmZnYmdJN3lFZGRQdmFQL3dlNDNhZW9BRlRUTnl4dEhZZitTVWkxUUhEOC9r?=
 =?utf-8?B?aEhkNkJqazYxU2p3OVJkNDdMdXk2SHZ5NWRlRWdBRkVZdWR5ZnhHczgvRHlK?=
 =?utf-8?B?ZFdkUVo0VlZkRk9PdWtvOU5UWVVucFhOTzNuRlpXQjF0ZEYvU1ZlRFBZVXk4?=
 =?utf-8?B?S2ZVdWNZRDRaRTMrNm9RQW5EbzVJL0hLSGlySFBMUmZMWXNZaktsRjV2N1A4?=
 =?utf-8?B?dExUd09JbjBFVUhrZlNWOW9BaWZVbDJmWllnNm5kTkdzSkNleWt3V2l1Uklw?=
 =?utf-8?B?eEplUzdndTNtL0E5cjNrMGFidWM0VlZ0dmNnZU5CclNwZHk5SlhzQ2E4YUt3?=
 =?utf-8?B?MnRhTUlDa05WcUN4K1BCSVQxOVZyVE01NDdWQ3h1MTIwSlU1aTZNMnZvVE5V?=
 =?utf-8?B?bE1Qc3dqenQvM01YTDRWQUpmM0xNME1JQm9CQ09PSHgzVjc3QUlUd3lMQ0xI?=
 =?utf-8?B?ZzIxRGwvQW16RTlXSXZadG96TmtLTzZmSVoxVHFSdWg3NVM2QWRTdU1BS1R1?=
 =?utf-8?B?MXhXbWRyMFF6OG9sNDQrRkZnV09QWUN4N2dxN0J3R0QwRkJxNVllTGpPL0x1?=
 =?utf-8?B?NU9VdU9BbC92bTA0RGRqTnFvcWdYQUdEKzdJdFRFdHNPM2xwNGtpRzJLWW9w?=
 =?utf-8?B?SVJPckYrYy9TRVhvUVMxSGRTODdaRDczQWJyOU5aR1I5MFcvdDBRbzVQbnBU?=
 =?utf-8?B?MWdsSG0zREVpWUt1MUlCS0FwRDNQaDlLNHRneXk2NHFWREo0bUpOSElZdTk1?=
 =?utf-8?B?a0xQUDZvUTZnaHRxQ1BZK09ZYlAzQ3QxT3B2NE8wcjJnczFMNkljM3pNRWJi?=
 =?utf-8?B?OHFwZmN4UmgrMTlBYWZJaXVHZWVvMW9jTHdZcURMRXdzcEJSOTZCY0FidzA5?=
 =?utf-8?B?QlVENTBGOFRNTGNsaVYydktwSUdnNnFSd1FOU1dWTE5FSTBKeitTby9GYzgx?=
 =?utf-8?B?R0pleFhkbmorcDdNUlpxbHdvUHFUdnZnTEpjVjRVbHBhdHgydFJUMU5jQmxo?=
 =?utf-8?B?bHJBSGY4UVVSeWVaQUlxTnhySm5ZUTF6cWh1bEFkYmVjMkw2RytjWkNISkhL?=
 =?utf-8?B?bTE0cXd5TzRZNm9wSUxmaGJmNGpCYVJmYkttN05aaFlNSWpvR240dGo4Ulhz?=
 =?utf-8?B?dmdGc3N6aDVuQ3ltdFFYL0xpME02WHRGd3pkdHJjQ3U1aC9wZXNtK2hjYjFo?=
 =?utf-8?B?Q0lGNmRmOEV3clpWdEJhb1UrdCtEVEJ4OVBtRmFlYk5GWkYraDJRelo3WEl6?=
 =?utf-8?B?by9YdG84WmZyUVdnNG9LTDF3YlUxMkJ6engyRENtRmxCK2xjN0tFS0p0MDFj?=
 =?utf-8?B?bUd6S01YRFBnZmZtTjJQOUdKN2gvYnZDRFJQNTBMaHBOa2F0ZFVZeUVIZ3h6?=
 =?utf-8?B?VDRrUVhnL3d5aDZrS201QkE1emgzbzgwdEw1cDFTNzRVYWNpNHh5Z3VIVlkw?=
 =?utf-8?B?d2dta0dXdE4rL1hLU0xqcmR4a25rMm9xUGdOYXdZL2p1cmxlbWlZclQxODhp?=
 =?utf-8?B?Q0k0S21pa0tQRm9ZdUp0ZkdqdmZsWGs0eUlESURFUkhkWS9WMlBUYzhNK0U1?=
 =?utf-8?Q?g8Z/VBvxze5jmk5/eojoWbKUt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d40ca25-1d4a-48fb-42f5-08dbad13d93f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 06:54:56.5099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtWTX0ishfotlbKpcZQxkHnmBMj9n9pMMBRGQu0q1Wz44ING8BxyzmlR/Sqg7MVIMCeJ7869hU/3kT5V1OEYvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

On 01.09.2023 18:02, Oleksii Kurochko wrote:
> asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> asm-generic dir.
> 
> Original asm/vm_event.h from ARM was updated:
>  * use SPDX-License-Identifier.
>  * update comment messages of stubs.
>  * update #ifdef.
>  * change public/domctl.h to public/vm_event.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in V4:
>  - update path of vm_event.h from include/asm-generic/asm to include/asm-generic
> ---
> Changes in V3:
>  - add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for "xen: move arm/include/asm/vm_event.h to asm-generic"
>  - update SPDX tag.
>  - move asm/vm_event.h to asm-generic.
> ---
> Changes in V2:
>  - change public/domctl.h to public/vm_event.h.
>  - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
> ---
>  xen/include/asm-generic/vm_event.h | 55 ++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 xen/include/asm-generic/vm_event.h

But that's not "move" anymore, as the Arm header isn't being deleted.

Jan

