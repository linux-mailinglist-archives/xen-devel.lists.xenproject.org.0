Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3376FA2D3
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 11:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531309.826887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwkD-0006uG-U1; Mon, 08 May 2023 09:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531309.826887; Mon, 08 May 2023 09:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwkD-0006rd-Qw; Mon, 08 May 2023 09:01:21 +0000
Received: by outflank-mailman (input) for mailman id 531309;
 Mon, 08 May 2023 09:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvwkC-0006rX-BF
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 09:01:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5b0439a-ed7e-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 11:01:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9455.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Mon, 8 May
 2023 09:01:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 09:01:18 +0000
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
X-Inumbo-ID: e5b0439a-ed7e-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKPQS3CSGm5j+Ov/BNyzfGf9DAZyYfSk0BbwErMLvK4c0UoFHrbiRcBFbL4cd0kB6204mGEC3Uq5Qdnq/VnvKxbL6a1k7lc6mhcccDCojzCnXGrfDcMqC9N1lNq1Rw55GZ59TdBcsrZ0bTW1JEOT8MRpqI2Kpfm2g4nc8D7bvqgXFOkCWJH+Dgtb+offIeXI2ZAZmSlNRKal9DY6QLYJ/VMl+PJ/zdi+88XONYK2x1Hhf3YlEROSO2SWqh7yib/4QBTWwWsbtA39cwBu5huUZLBkFfnZJsv2b0nH66YZX9Ld77V6uWG3xKwzCOhVGxNPJWW+3+6N7yhuKfeEsqw5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zg/eu4y+GGpwMvhH3GrfsmAH38DH55fmk8Qi+m0M+w=;
 b=GOEjCXb3x+DBzX1OoesCnFda/u3uf1SOuo5+a1jFH5VUSs1ROZxh4Qb0Gd6xh3D6ENNnvPdBOsTTTdqB8F9iLI90r44nEAXEb4REaBd9llVjoU09r2i7trW1TlFI/+9c9t//t5b9yDFt7E7cPBoEn1Z2dEPlJ+KOHcai/f1Op7rQfhbXztTpvi6yj3vmQQdHXqmY72jiPT74A4bFl2qh1mIqdl/86namLdKD5ATI87MBnWlGDoUH/za04ryJbclZz7RGxOdN0gjzDvz6Bo/wDGKSgtYLP9BSvw2efjFMW1uhocLvP0CbgWxyBttrHBtH+56NRwTrNXzsvgToFTeZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zg/eu4y+GGpwMvhH3GrfsmAH38DH55fmk8Qi+m0M+w=;
 b=GY/U4FSASxTKySe6MrR7bB65dMvTxCc45DfsWBTK54QgyxfbyFfZ+bFbM4eC1b0JhWHFqrM4DQsZ+bI0pg2TvElEAEyLtQYL6OyE/1b7a7+QD5t4EaOZn1T5tkWjZWmp9tSMDg1G6Yd5So2Rvjf0XCSIUO6ZT6NPe5e0fOYwqbdF2AX0nl9zCI+ocEsPizehxjFYy8D10k9Mtg6+8fke+Pq3IQfgYLFXJHZAqi1SRBjOMJgCfwhKHsQwsBuas+CieN2mRifeL034yk7JMPwqfdZOXSplJdS7SFqzPo/w66EuIdDOEWyu39W1gq+ripJKhnbNUkygpJOGjNfqEolbKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <763df4ee-95d7-be20-212f-7450f3fd431e@suse.com>
Date: Mon, 8 May 2023 11:01:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3] ns16550: enable memory decoding on MMIO-based PCI
 console card
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230505214810.406061-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230505214810.406061-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e0d617-609c-4337-b64d-08db4fa2c937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ywJKYuUS4sY3Xl/nQ9gg3gSCHbQn6xqxNWBKylRjWW707Y+suP467gXearmqlx08TPaQp47GdMQrj+T3+neRCAeV8+YTbPEHjBKdv39mOTh37CBgZaeMf97MNtmwa9Zbv9zqobX0sMs1WKLVGbwa8qLIoCGxlT8+tOO1LyWra/8ddA0g6BUfPf0uYYZ2sTpx93Ku6ZFZMrYOo6DIOJeaEGSjuUEOPJhZHJHXBVwD2wEToG1B2EEqmnjftlJ6YwYMV4H8KaQE8SNd+mVATObU62R5vnN119P/PihOeGjPkMPl6AdXPxjstBSpEjSW9Wimzt0V0/AHgZzqu9RmLU6tPFbaESCgdN3I1qd3O2PwPCss1SqJsYku55QkjnP60N8tqVPWqG/XnsMA+22kEzB3IB4EpwG9PxvQ44cH290j1KLkbBVswaQiCwvGw3C3+4hZze6DTeEGh3tbMkOoCALqKhs90c4xfKtMtNEZgTPhuHVHLM29axt8ukq6aOC/eemJtaSUAXLqU1HxRHL0dSAJCmdi9jWJSdhQXq1sQP42U91syr0XAdKsbnrtXZ8E94Z0Sg9NeHlJ5SkerTjeZqWvIXG0zG/MLl7nkoWP9HhPq5jZ3xfOOlxyKM69Tj8PcV4ONsWOIM5MEY8ICpyJegNcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(31686004)(66946007)(66556008)(66476007)(6916009)(4326008)(478600001)(6486002)(316002)(54906003)(86362001)(31696002)(36756003)(2616005)(53546011)(6512007)(6506007)(26005)(8936002)(5660300002)(41300700001)(8676002)(2906002)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGxOZk81Z1JudUxPR29vOS9MSW96RVZnRSs1WlEzVjJzWVVnMTFHeFluMHBr?=
 =?utf-8?B?d1ZoczVhMTd1REdVeURiaHprOU5BSjZENXU0dGxYQlEwVENsTDVvV3RIUHAw?=
 =?utf-8?B?RUZlRm03RnpCMUlWUi9LRy8ydlVBZ0U1MERwejhpTjVDSW9HT1hxSzh5UWFC?=
 =?utf-8?B?dUtiWGM0anllOVRiMEZ2TkU0TzBMdGQ3eHJvWUF1YUtsRHVJanJ2emZSWXFX?=
 =?utf-8?B?ZTlOb0xremFNWlVLb0k4eFJhRDNMcEdtM2xHUnBTc0crY3dVR2NJd0FPdHRW?=
 =?utf-8?B?NnM5K3JGSWRzQnIvNHppcjkzMlMrZkx5cFZEc0ZUUW4zRCs2NXc2Y2ovajVk?=
 =?utf-8?B?TTY5V0VOSXdZT2ZDNkdva2I2UzF4NjRnQzJFUUdYWHZWdGgwQ0ZwNEZuZ1Uy?=
 =?utf-8?B?OUsrSXY1ZHowMmNYQVlCNDZhL0M2UXpzbm9pWGI2K3lCM0FITGttOVhWRFBp?=
 =?utf-8?B?TFBZNFpSREV1c3JJY2pHbWFXeFNBRTdldFVWVkJidkVrK295aVZjWEFjRlVj?=
 =?utf-8?B?YkxQMWhCZC9TN3FFdm9zTUhxSW5GYWt3OCsxekZiWW5IZThWWkxTNmtsM0dt?=
 =?utf-8?B?dkZVYk52UEE3d0tIbWJYemhuUGNUdHQvcjVOY3RMMXdVcDAraGU5MWR3ZU5D?=
 =?utf-8?B?VUNPR0U4VDFMMDdlTi96ZUhBQzRQd1Y5bkNiZWFObk8zNVh2dFlGTVZqWlUz?=
 =?utf-8?B?RFV1UmxjUE5wYUZCZncxREV1Mzd5bE9kS1Y3Wm96QWJrRmlOWnBzM2c4SmxV?=
 =?utf-8?B?M3gzTmRBZ0lVb01tTXRJNG4xbDNlVXFPNTl1WmxQVEl3V20vSWxCOU0xSmRP?=
 =?utf-8?B?TzFtTmF3YnNoaTM1VU9LZm4yeVVVdUdKZVFKbWVYRlFRNFl0TWVuNXFjdCtM?=
 =?utf-8?B?a0JsVlV5Ly9TRVNpS3QxOGlWWjZwS0syenpBbzN6VDR2ZDJFRklocFF3ckF1?=
 =?utf-8?B?d3F1WlVrN1R5QXBMYnNZR3dHVkh1M3FyY0hsc3ErRWhmc0ttTTU2RXVMbnVx?=
 =?utf-8?B?Wk55RXhjWUFRN1JJeVpBVDZQbnUwcitwb1o1Y3NGSERMSUcvUnphRzJmaUVs?=
 =?utf-8?B?NmlsU0ZtMkprR0JiR0NXNU92WjB1UzNzemdXb1ZnaUVRRTRCbjBxRDh2dTM3?=
 =?utf-8?B?c2JYUFgzNVdmV25vRHk4Vk1nbnFWQjlRN2Q2VGd4VzZ2Y05HekNkcVJUZ2wz?=
 =?utf-8?B?WlA3NjhwRkgyT2hoQ29xaXZQVDltTjRwRHh6SWI1bEVSRm4yUnBHRnczQnZF?=
 =?utf-8?B?b2VxNmNCNnFmL0JOcDVtN3cyei9jbDBCSnVPUC9VY0c4RHlvQ1dZdlFsVWhh?=
 =?utf-8?B?Rzg0LzVkR2ZYQ1dvQUNkQloxTjFtc3ArSFRxWFREOVRXSUdiQ3ZFRitDcEUr?=
 =?utf-8?B?Z2tZUjBJQWptejNYVkhJcFdzQVowTnhPMFRnTi9BdVBZNWlYaTdsY0dKU2xT?=
 =?utf-8?B?eTlEcFBmMzBJUlp2Yy9nMXMzOTN5ZGxibVhyMGlpczJDZVVxMnVrUWlvR2tE?=
 =?utf-8?B?NkVqb0JZTmZLdUpiYzFXRGc1VWpOU1I4S21YZWFhbks5V3pzOUNQc00wY1Z5?=
 =?utf-8?B?N2FhRFF3UUQxSkF1UG4wN0lSSlRRM2NzSFFQN2tiTkVvTnNsa3VWd2RzU2I4?=
 =?utf-8?B?UGhxZklQN2pVd3dLam5zbnhxNTVqZFdQb2pqT0tQRk9ZZnF4Nko1VVRUSm9u?=
 =?utf-8?B?RGVLQVl6YWc1djNKYzRSZ0FiU3FIOGxyV25rSlVBdGdhQW5FUlJoRWhvcnhz?=
 =?utf-8?B?Y2JFQTBmS1RtWWp5c0F5V1hHL3V6Y3pnUWJQdjNQZDlLajRqVS9xd1lJOU9Y?=
 =?utf-8?B?RjBpdWpRMWdIUHptUFdvS3ZTQVIyS1c3R0x5T29DV0ZIODV3S3d4NFJtWk5m?=
 =?utf-8?B?NjB0bzZuQXFOUEVyM0NWV21sWFRabGNRVjB5cHBhRzRLRzdHUzVwOW1VOE9M?=
 =?utf-8?B?NTQyL1oxRHk1L3NIYzRDZDNBSEEvTllmWmM4OE9yYno4bis0RmJER2FQVjh1?=
 =?utf-8?B?OU9xSnNGL2lGRFlScUJzMDNjTk50aHVIQkFjYkZtU3VwZjdIQXR4eUFmUC9O?=
 =?utf-8?B?N0EydVQwaWt1VnJwUFdRUDlNWmdxOHR3dnBJa2RtQXlDb0w2U2t4dTlxTkp1?=
 =?utf-8?Q?tmW2ylXjON9AWGjLWNqpmUCWy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e0d617-609c-4337-b64d-08db4fa2c937
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 09:01:18.3807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJMZkf7NNndEpn7k8R2OzFoDecCX8nJ6PVfE3saH4wu1yR3jlTJQeikd+djvt5CXCMBxk2JryIpOYYNZ/EPz0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9455

On 05.05.2023 23:48, Marek Marczykowski-Górecki wrote:
> pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
> devices, add setting PCI_COMMAND_MEMORY for MMIO-based UART devices too.
> Note the MMIO-based devices in practice need a "pci" sub-option,
> otherwise a few parameters are not initialized (including bar_idx,
> reg_shift, reg_width etc). The "pci" is not supposed to be used with
> explicit BDF, so do not key setting PCI_COMMAND_MEMORY on explicit BDF
> being set. Contrary to the IO-based UART, pci_serial_early_init() will
> not attempt to set BAR0 address, even if user provided io_base manually
> - in most cases, those are with an offest and the current cmdline syntax
> doesn't allow expressing it. Due to this, enable PCI_COMMAND_MEMORY only
> if uart->bar is already populated. In similar spirit, this patch does
> not support setting BAR0 of the bridge.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -272,6 +272,14 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>  static void pci_serial_early_init(struct ns16550 *uart)
>  {
>  #ifdef NS16550_PCI
> +    if ( uart->bar && uart->io_base >= 0x10000)

... (nit) the missing blank inserted, which I'll be happy to do while
committing.

Jan

