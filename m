Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F62760B3F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 09:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569477.890278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCEk-0003z4-J5; Tue, 25 Jul 2023 07:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569477.890278; Tue, 25 Jul 2023 07:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCEk-0003wy-G1; Tue, 25 Jul 2023 07:13:38 +0000
Received: by outflank-mailman (input) for mailman id 569477;
 Tue, 25 Jul 2023 07:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOCEj-0003ws-25
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 07:13:37 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe13::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5415381-2aba-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 09:13:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8138.eurprd04.prod.outlook.com (2603:10a6:10:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 07:13:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 07:13:34 +0000
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
X-Inumbo-ID: c5415381-2aba-11ee-b23d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0uzrNUglJzCCu4cBi2r3oeNoksPNmfxNJcUpUjhL3rlcmG1vKeMhAG1dQGaBwACLqG6K/K1e7Gfb567PfgsvYEl9mETiKuUqFVI0rLnNGmBtfPmHn1FGwlpJ1DdYgOv9VtAosQex23jneBaM8H/jRJbBCHpbb1KSUuPE8uMVmdZ8vtoDsLBotJ3cJ6rVniC2j+MeNrHXhMnETScRKC8eFKsBSqjZfW9OaOTTY/wIbJnh7+VMbAzWPJVhXnus/0r6laHVIxwamMbcghVaSJko0Pen58FHdiZbSmDuwm3u9Otk1i+Nv7xJvp/nanYj+O2GCW0g1CqkBHvaGhle+p79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n4JaB/SB3ZqFC5yerfJWn8FgMLSUAYKEJdFfj6eUuc=;
 b=O+IQQQMPm1G8b9qboJHbzZC0J363K0nz8PY8TPUoM1jNIAaiW24e2YsTUWrAM8CQd4wBgu7xXmJhenaNcINTBFZ4cVFDRTXB+Hw19NpC2/ydmpv3LEgJJDrfv+6T5H1OC+fXLQVBgnPbddab4fhDUHk5zaAP3zaInYW16MWeT9X9ER2CYPAwMZiqhjuPBlVHDeeymwTCn3LrYm7xAbawWijYCuXhDqLkeHZCc82VPbNspIUixGa8WdtYfIk5W7wW4HU7S2/n/mwJGjndoMOo0WRW6POQc4Osi0iAAk8HMwJNuIIecwxoPtlonIGpPZ+73Mm+66AWAApMvxXBOwBx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n4JaB/SB3ZqFC5yerfJWn8FgMLSUAYKEJdFfj6eUuc=;
 b=e5nGmmrtmEKFjhRpn6/Uc3hhIv+SxWHhiDTyaugjr6ScNb0ewbiOwPgm1LlfQ3dZsktROuhhUGhaBxjHn6cTrQT+++nsk5WHE4cJQpYiPa0DJ4fBx4jLmz1CLYvglqbe7tWnadOovCz0V+K1k/1wVozSOW0XGF0mbbpUXGZAk0FvxjfPBmUoal5SUCPjcet+iZpaWc4MRKqGPJm1Dp8UQszDXzBW/FjfVL6GX7wD9joF+K4HtUKptOuXfx+7IgsK1ymt+1HfkYxkbIJ0WROQykXrDpZf/RwWOgF/PY39I4FISko06A+QxIaJswH7hN//gSdeGu1r76rq+oylSlQjSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eecc7968-970a-9eb9-050b-843d2496f8d3@suse.com>
Date: Tue, 25 Jul 2023 09:13:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 3/3] x86/irq: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690217195.git.federico.serafini@bugseng.com>
 <ae48788c6c41e5e506b9995037d176ac8b08d3f2.1690217195.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307241558350.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307241558350.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b4757c-67c2-43dd-c0a4-08db8cdea892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z/VwQoZPtF2RqCfNbGTC9UsEtgh/lZFG3cBDXE3bgci92zFxruqu0vDpPZxbFcnWxdSVdolFY5KhgT55r0FGZ0VKxa6QauNhv1geOOpVCgzT+JUbHbTTHyYzxW7AxEhxjoM9hVEaCfph8aacCX6I7FprJI/kXN7chJeIrywj81NAjjn654WP+4aXeomHCRIGZRQgLLpXc6apCUsLw11TvDJ8xorvg0NJX8rZNXzKvysqhb/jdyrTeUGUy9rK9hlK3kxMOUlEh7Tl0S8VmRbnwVNmljyLKE5oRRB8iGG0QLyDDcdB6P5DJCaSSnvXNyGpGuP8mOga7uVFhKT6WFcNnAVrkQ4g4+M59ap6tZQTkyjPC3ceyKp5aWaEX7fkatVBTQgntxo99f1fcKYyQaM6NVfxYn3nfvavQlnP1A/8ZoiS4hLtgSz1WQ4+ucKeCYKVuC+R46FMQ+gcN063sbjE+DtvVGh5ogs2hxfMXuePFGiVumZ0i2dN6Pyo/MthE1p+ytkrpfCXOr3HqgDi1QQ+n+SoQiGP0S+v8CyRLqi5VYyy8eJ5DAw43plewnHPBeLjq6G1eztXmioetbyOJ23JxFYp+PTvHkwE1UTW33fvJND84zy7OVEXnI2CxAY/fhoUB2W/iyI6faRU49pJlY0sdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199021)(38100700002)(66899021)(53546011)(2616005)(36756003)(8936002)(8676002)(5660300002)(54906003)(110136005)(478600001)(66556008)(4326008)(316002)(66946007)(66476007)(41300700001)(6506007)(26005)(186003)(6512007)(6486002)(4744005)(2906002)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDdCM1RmM1ZnRDRDS1AwSEZ6QWhQa2V6eHZpYllSUzNwUFZ5RFpkT1BrNi8w?=
 =?utf-8?B?SkVBT1daK2x6TlVScXBFdnpPYkZ1RkF0dVp3cjRjYzJaRFArOHd5am1VU2Mv?=
 =?utf-8?B?QTRXSnBGQ0Q0NzN4QVVBOGltcGcwRmt1YjZvUmxIUEtIbmxjUDg4dWRWQmlR?=
 =?utf-8?B?ZlFUaXNvZ3BDaE83bFZzbnlMQVhSdEV5OGVOUFZsczJYZEltYTBKQ0JENUlo?=
 =?utf-8?B?ZGR1aGt1WkRtbmM1aEdPVW1jdE15S3c2dE02RjRydU53Syt1cUdJNEtyUXNQ?=
 =?utf-8?B?TTFjc0VwVTNoUkZYRENFTnJxdkpSWmxLTjl0bThRcTYvNzRmc0Myd1hTWmFM?=
 =?utf-8?B?YjBZNlhncUZMZnJBL3QwbEhlclpvN0IxQ3VxcVR1eWtEbEhZUVlWekxtanNs?=
 =?utf-8?B?RSttNXUzUlVEeGJ2a3c5S2pOK0NMQ2tWRktydUc5K3kyZDBJeVZVK2x3ZCs0?=
 =?utf-8?B?RHZKaisybHk2S2hMcTFoK3JPWjNoMjRuZ2xITlZjaVVZVHBibmJaRGdPUEE4?=
 =?utf-8?B?aGJEcmlXZlgwUEJLQ0hPZFNMWFZCbG5GT1JMTXp4QXZsYmhPY1NKalZTVjNL?=
 =?utf-8?B?S3BaRVhtNGpOSFU4V1VVa1JDaEFrQXZaamUzTXFyTkx3MnpFVlVnSm56T3pz?=
 =?utf-8?B?WlArUUkvcHY5LytqUnIzbzBMZ0RaQTFhTWROMCtwTEhrNjlvR0ZsUk9xU0Nn?=
 =?utf-8?B?ZlgzRWNLcG1kaHJqL0Fabmo2SWQzVXorVnZEY1Z6ak04Z0d1QlMrOE9EaENW?=
 =?utf-8?B?NnZxVkdsQnlQcXptMWNpMkZjMVQrY2lnNHJQekJFOXlkU3ZXdXk2VnpqVUZy?=
 =?utf-8?B?cklKWXp5amdBaTViK29UV2VzQkx4RDZSUytaS2daZDRjcFNYSGRuY3JyUWxT?=
 =?utf-8?B?ODlUZ2htQWZ3d0VBUjhNQUk2cFdTelNGZ2E0YS9GL2dGR0NXVCtRRkJybWw1?=
 =?utf-8?B?YzlUVmt1cG53d3B0Y1lmK1NwcGVyOXV2ZjEyWkppY1RtTmNjdklZMUpFQll3?=
 =?utf-8?B?cnRnMEllZDZKdjFQVEhVV3A4K2QrMmlPTE03bjVGNXN6eGptWXZPeTc1eTdY?=
 =?utf-8?B?MnhvbEgyZjhyckVNRUk1VWQyazZwYkdyN1lzcVlvdmVQTVNLeVRCV3lnZ1lU?=
 =?utf-8?B?RU5RbkZJZ3BEQVFBRm01WWc5VjBOSTB5dFFvMzBxTlhnL0dkTlBkaE1ra3la?=
 =?utf-8?B?RHd1T29Od3NmK1lmcHpzMVpKaXFhNlk2L3NUVXdldDJhdmNwNVN4YkhlWmVO?=
 =?utf-8?B?QUc3TEZVOGRHTjFlYW1oM29hcHhPbm84VkZaTDkwSENrUGJEZElONHhnQVJH?=
 =?utf-8?B?T1krRytZZm5xSmlwa01nSnArV21tYUJMQW0rb1d0VjF0UlcxN1Y0ZVJxZHZs?=
 =?utf-8?B?NGgyUGo4Y3A3TXF4K2hZb1ZQSW9Yd1o0MnlZcDdhdkFoaG92QXR3bjMxQmdP?=
 =?utf-8?B?VlZXOVdiVVd3MlFlald2cmFBQmIxdW1vd3kxdEQwU0lTYWhWeUFITGlNNFZ4?=
 =?utf-8?B?MW5vR2NDQ0twVksxbFA0dldoTWpSdm5WYnhMVU50QWFTazZ6UGRpRGQxamNj?=
 =?utf-8?B?T1VzTU8xTml6cmh6MW0vQlJzSzIyL1YweWd4d2tCaEhTMm96c1lVeTRHZ3pQ?=
 =?utf-8?B?V21MQVd6Zjkwb2M1RSt5YXQrdEo3MFJaTzZ4SStYNFFxMk43c3ZWeFgxRVN2?=
 =?utf-8?B?R0pwR1E2cFpFN3BMcm5zZ0wxNG9vc0NFTGpGSW9YcTRQZUgramN4YmtUeERj?=
 =?utf-8?B?RzM0L1Vtckx5dVZTZFpWQi8zWDJWZ00vc0haOFcvSFhPYWpTR3pHdWJvb3Bo?=
 =?utf-8?B?N2lUZEdTNWNtZGxCcVhSMGJLc0lQeWczL1BmZzZhZncrWjc4b25pNHkwellS?=
 =?utf-8?B?emJpSjhJdldWQmFYVm9UZXNER1E5MGUzUTdnNDNRVTJkY1lTNGNFa3h3SHZr?=
 =?utf-8?B?ZXdBT25VK1VXOFgzcWNsUlJVNGc1VHZCNG90bG5IWTR1aENnNTFKL2ZkSnpD?=
 =?utf-8?B?aHB4NUlvZTFmQTBTTFYvZ3F6MVA2b3J3Vml0K0hLMmdtZnBuT1RJL2NtWUt0?=
 =?utf-8?B?My9vTkM1OTV5dFA5VGdwZUVXNWRrMDA1K0svVENPcVdQYUhseVJQenB3Q3pJ?=
 =?utf-8?Q?sDXGOiwlHw9HjTwwtUXiWKQKz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b4757c-67c2-43dd-c0a4-08db8cdea892
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 07:13:34.2884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoNTX+XFGCOBhDvoPA6n6aR0htxHKETbf2hBDFWquYEX9ZXahB0RakFN3WY0GMsbAJQRE4SGyebkFuaL7Zrvrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8138

On 25.07.2023 01:08, Stefano Stabellini wrote:
> On Mon, 24 Jul 2023, Federico Serafini wrote:
>> @@ -893,10 +893,10 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>>      desc->status |= IRQ_MOVE_PENDING;
>>  }
>>  
>> -void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
>> +void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *mask)
> 
> I welcome feedback from the other maintainers on this but I would keep
> the original "pirq" parameter name here...

+2

We absolutely should not further increase the misnaming. Instead the goal
needs to be to uniformly use pirq when pIRQ (used in interfacing with
guests) is meant, and irq when a (Xen internal) IRQ is meant. Sadly this
isn't helped by Arm not knowing the concept of pIRQ (see "[PATCH v2 0/2]
new CONFIG_HAS_PIRQ and extra_guest_irqs adjustment").

Jan

