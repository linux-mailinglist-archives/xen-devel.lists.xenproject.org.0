Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB878D60C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592918.925765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKy3-0001IX-SJ; Wed, 30 Aug 2023 13:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592918.925765; Wed, 30 Aug 2023 13:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKy3-0001GX-P8; Wed, 30 Aug 2023 13:10:43 +0000
Received: by outflank-mailman (input) for mailman id 592918;
 Wed, 30 Aug 2023 13:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbKy2-0001GR-I4
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:10:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e83d006-4736-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:10:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6979.eurprd04.prod.outlook.com (2603:10a6:208:18b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 30 Aug
 2023 13:10:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:10:38 +0000
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
X-Inumbo-ID: 9e83d006-4736-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpAK4ydViZcyshtsmb+tIpKluUYGMhCOaF+y8iYSVgyDCR8C+Y9srF4NMHeaX8/6XnBEUr30ecr2pwlLTK3F7jesKjtESLn3KgL5P53ra68nFzNRqn38bQvYk54gZTGr7UhUPygLiAyIRFi7gqNVPFEcPBXX0++oJXIac17ee6J0opcw07TP+u51eSYgO8D5U8DTjfeTYW2khXxq19R+Y2+l78wEH17miXJjFKg+y7htdOKBPiGgSz1EjT795OCTB8RNHVeSCUBEyd6UmDmfc0KvAKlNiyGKKAbDyE08+QQET/p/kIlfr/8uNslhCyCVWP8GL5p/fKfE0pvpWfyuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgnXlNHbOpp2PVphDUzUf/dDpsstOuKU9L8Dvc0zuho=;
 b=NbKZYqXUY1xn69lM8sIB59l2IW6ODUkVl1UbdmdKyT1ywh3pC068FPilyQtT8vbQum+sNmV0RbsyseUqgYrh0M/kWH4SM8g98tPGqYPB3M17fD6TX1j2SRT+e0Eg/DYwIOkokm1g9BzL2z6yNG49tcw+d6TOZEfT83eDp0iIQGm5LcTopq6VhKKh/bknhQwUahcy2zpWivqj/r5ZrI+O3lVBUECXKtazVVCzeA6mK190bu+YMSe9NS43FeKnpJ6xWyVz5Y4+zSllVppw3p5HyOHsefQ4Hb11vE7npftAdrdR/mwbnVznybfjec+eHtoq5MluQ+J7krbfl49aqOulwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgnXlNHbOpp2PVphDUzUf/dDpsstOuKU9L8Dvc0zuho=;
 b=nPwuVhhQIB7qnaq6Hjky60Ym7FKdgW4lOuxNW32OkGWMDeUHZ5hTRmnKz6sYtvCCvAvdmDA95xZDeN31/La37maSU+XL94Foar0w2CGyowYRrOxGAHEvyZQAP9ZORAxGZ9YnZMNzUIoIFl8YTglnJtodtd/84LSB3loFuMTX/0DW31iajVGGH8RVCTrgPU9qlTxAt3+J75Mkqr0MuIhTq13K0E2/pRU4TiHoOvgD4+QCBgbPOidqN88xBhRsULfV3TdTiioUt2nsPz7NbmGRFJexOshsoEQEkxGQChXlzp2dyVMW5Qcas7dLPbleX8Fb0eaxRT9u9NuPB9lOrkK6jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29e0e9d5-9ba1-f453-4dcc-8ecdd1f646b2@suse.com>
Date: Wed, 30 Aug 2023 15:10:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 7/8] xen/ppc: Add stub function and symbol definitions
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <1fcde99f8eae396ac7741913e0a3b84039eb7adb.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1fcde99f8eae396ac7741913e0a3b84039eb7adb.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 33856c9b-08a9-47e5-0b1e-08dba95a817c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U/knJyqskFpERAZ9Fns6uNyqYjV4V/RraGbjEJJyEK6+lFHnig46zScZb5p/cJcXej8lBS3Ys1/i8nS0+jB29SS/UR+CrMTSOITIRzU0nRD1apQvSL48PeAPItCGHVKX5m1eBudU0yj9BZvPSHhPoVjfFIDGCf3lXU+J47IX7LGHHYBoLtGjuTculx6ASWeXC1b4q0kmvNT+Pwv6d3plZ7vUTP9XaUUhegt0Zu1qKijeaxfQ8CgjXg7oWH6fTNGxCxsccQJjDic71UlpbzlP84crWADiMrghnJrjPnJSjapQfNtYpP2E3F1UPoSkvBNl3S87c5tZIHRY2nx3XwVMImG2sZDPlE3bcAhhQOV80IoXv4rs3F4RiFIABjxnZBxlihImd5DhGz9Iv8HN2HFcdDNx44I7MyAAAOLXY9x+HS6wVJDU4S4CehGllwZNeZCsjoHSKF8Yw77MkDH8JmfxIbe3R14J3K3AsjN5Eiso7SRFdFZjXIjLSSXj09xrFLpdA21KO7MWT4rZe2Rt9uNWCaSuI9ENkDIuh9arY/cA060lXE1/efXTgzN62xrq7cwQabyNicG8U2QhtPlqDi5UjgLGyimNjhztcgwV8K6L0IcEoTevzOGEXWhRNDI9kerpkeveEn9tklrIUqdO+XjiOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(66476007)(6916009)(66556008)(6512007)(316002)(4326008)(8676002)(66946007)(8936002)(2616005)(41300700001)(36756003)(478600001)(53546011)(5660300002)(2906002)(38100700002)(31696002)(31686004)(86362001)(6486002)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEUrbGlqS3ozdkswTkdENWtndW11NzVKeUgyRVlkL0ppWThudysxeHFvd3Bo?=
 =?utf-8?B?amZqL1ZGdVRpU0hHS21VeDROV1EwWFRhS3ZtdWFEbElxZ0c5UHVKblVNaU9Z?=
 =?utf-8?B?MTMvQUIxUWNpVlZ1ZzV2eG9IRllFczU4cXRTNUNCL1c3bkVyNzc4WVBOL2JI?=
 =?utf-8?B?T2RSL2F2QUNyRXREM0pHaSs0Qmp2MkFOdklTUmNRaGpZRHpMVW52UkJDZXpx?=
 =?utf-8?B?dFQ3UzU5SEx6UWoxclhpZ1Vqd053YmRBeWsvZE5EN1czWHNJbU1PaGN6T1JI?=
 =?utf-8?B?cjZoOU1GMXNNVkNwRnBZczhONFpBdGFqYVdWNGRtOXI0SHBoQ3V1MXo0RW1Y?=
 =?utf-8?B?UzBVZm9DcFJZbGNGTEdrcUVleXhrTmdHUUtuWWNHNUVvU2kvQllJUnFkbURC?=
 =?utf-8?B?eGJvRFRzYkVia1hXS2FzMlc0U0RRbkxSQnlqZzc0VkhzaUJMT0JZYWJCZVRL?=
 =?utf-8?B?UFFaZlJrR3E5eVVuTUNvcjZNYkpUNFNuM1lIeWdXZ21GWjN0NDlObkpuL1Nw?=
 =?utf-8?B?TUdvTXJjVDlhSTkyMDNqTVVJcEc4U29Sc3lvTVIrVC83UFVidktpSGFqeVhJ?=
 =?utf-8?B?c1UxeTc0Q1FjWVBFWFoyZXJVWWxsTUIxOXNmVjlDKzdWMEs1Z05yR1FPb1hs?=
 =?utf-8?B?eWNKSWlBN3ZzMDdnNGE3M1M5U0p0QWNHeS84cWFyNzVWYmNGMk9Bb3ZaYnZi?=
 =?utf-8?B?Z3ROcGZKUnJjZWovdUk0WjlLQmZMTkRwWkRCWFQyVUxmdzlaT2V0RE9uend1?=
 =?utf-8?B?VnRtaHJILzVaSW53aEt1TUhhY3llOGNoRXU0N0UvV3U2VHhnWk1zSUtxb3pP?=
 =?utf-8?B?aTdxdnc0R256Tk5VSnFsSmZneWJLcGlRd0ZTM2RlZi9lTnNMV3NiUkNhcDdX?=
 =?utf-8?B?ZTl3ZjRLVWZrbmQyQisyQWNBRnBCMmhVdGNiL1pCUVJYWWxaT01HbWZrZlFI?=
 =?utf-8?B?MUJndmdkS3hQTlI3QjZiVWtGbmkzUURJSFBUcDUzY0g0Umk5c2U0ZG5DdU4w?=
 =?utf-8?B?VmV6UXhqMzhENUEreVFaOGJET21TZWxUL3h5YjE1Y1VrQURaMjFqRmhRYzB4?=
 =?utf-8?B?Q2RqTEVFcG9jVnlOUDB0b0xjMURNWmNCODhnd3laNXZ1ZFZYNGE4S21JYVg5?=
 =?utf-8?B?V1JUU2pKaS9uQlc0OUQ1UzRudEg0aU5sVW96bzF6TlFRSWFBaHVTVkJSZkUw?=
 =?utf-8?B?UnpJNTRnYkJQNTIyazRpUTJMVTZLeUpZSmx0WUMvMWlZMmxDNWxybjk2UXRM?=
 =?utf-8?B?blUyU1h2a095b2gwTWZjR3ZQVUlWUHB4c05QeW14QWJMcll6eVBpdnFzaTFl?=
 =?utf-8?B?UytUTXV2emI4T3JicUh6bmkvUXd1L1pZL3FsOVJuS1VRQ3FHeXNjTlNBdS9F?=
 =?utf-8?B?cDRHRkpvdzk2Q04rTVo4Zzh4YVBlT2Z2N21IMXFiRHhFYjl0RHZJODFoRDJ5?=
 =?utf-8?B?SDUxVUY5aXBKYml0eUg1RWhUR0xrL3NJR3hkUzRWVnVWa3p0MGRpRmZTTTlo?=
 =?utf-8?B?ajdDckdlaUdnbmtwbUpYbmpkbXd5RWdzQnRpeDBLRDBJZjJXb1h1d0FnODl1?=
 =?utf-8?B?ejN0M0cyb3c5Q08zVk5OZDlrZzV5WVlQWWNMYkZ1UDV1RGFueVRtS1gybGNi?=
 =?utf-8?B?dXRwYlVMRittSEl4ZlRLQjNhMXJtYVUyclE1Vk5kMFVQaDZRRncxNWRwY3BZ?=
 =?utf-8?B?Zm1wUitQU0RUeS9CcEdRcGZ1OGtrdWxnTWlrUldOZ0tBakxuVWg0ekNmOS8y?=
 =?utf-8?B?S24zV01Ia0FhZmQ5bGVkZUU1bjR0NVpXMnUyQ1diMFJzaUJkMWlPRjFZd2Vt?=
 =?utf-8?B?eEl6Ri9hb29uRHFqYUhqQzhydlRRaStocHMzRnNwc3ZCdjZUMWpoeFltSDZp?=
 =?utf-8?B?VHZRZEk1ZTVBR2ZLRThZUHAvRy91L0xFZkJZSE5jbVNCaUdPbGh4c3U3c2p4?=
 =?utf-8?B?Y0hBRkQ0S1lKUE5YZFp0UjlPQjBGRVpna1ZueGszNWo1UzZqajVWSitGOER1?=
 =?utf-8?B?OS9kN2wwdWFrbGRqbUF0QStmek9jMDZraXpmdGU3czZidmdiRGZSNGZRQmQ3?=
 =?utf-8?B?QldsbTFtdi91NTY1NXBrMzgzK3NWZkdmcEdSYWQ2aWVPTlk0UkZNNkprdzBG?=
 =?utf-8?Q?zVcWgrW4xbOnlGEknpmMAlfDG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33856c9b-08a9-47e5-0b1e-08dba95a817c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:10:38.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ANFQuuGmZMJLGlpR7xek7flrKZMaQP0yKBOY+Bi/VXqPHK3qVf27DwALZVY1Bxk2XPrYyvTG3PJiZKPgvVt8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6979

On 23.08.2023 22:07, Shawn Anastasio wrote:
> +/* irq.c */
> +
> +struct pirq *alloc_pirq_struct(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +static void ack_none(struct irq_desc *irq)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +hw_irq_controller no_irq_type = {
> +    .typename = "none",
> +    .startup = irq_startup_none,
> +    .shutdown = irq_shutdown_none,
> +    .enable = irq_enable_none,
> +    .disable = irq_disable_none,
> +    .ack = ack_none,
> +};

As said before, I think no new function should be introduced to fill any
of the hook pointers. I.e. I would suggest to also drop ack_none(). But
in the end it's your call of course. Either way
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

