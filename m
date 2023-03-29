Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810C6CD622
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 11:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516128.799751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRtS-00068o-O7; Wed, 29 Mar 2023 09:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516128.799751; Wed, 29 Mar 2023 09:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRtS-00065w-Kc; Wed, 29 Mar 2023 09:14:58 +0000
Received: by outflank-mailman (input) for mailman id 516128;
 Wed, 29 Mar 2023 09:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phRtR-00065o-6a
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 09:14:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb5fcd0-ce12-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 11:14:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8358.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 09:14:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 09:14:53 +0000
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
X-Inumbo-ID: 2bb5fcd0-ce12-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQI0XU+O6OlKlfYYSSKY4zdkXkIIyjTIJWcwvrFf893P706456Zt06ixZqYAMm7B0PHEVxb3/KbN5ivwCsqnU+FyuPxYqlSjlWqK+vkjrEGdDZZGBjsKxS0s9fjc0BQoF61OOd0DGVIihjqVsDRzyWbdrPxcjkx6swZal8bgEnRphdcJhmwZG6/CCujE2Ww69LjERyxSSU6oOK98ti1isOHhvJg1dEK3V2RpseDChrJ1lCiRrUOEir7nutlTU3WmYRxWr+mD2TgXHP/iaaNQ1/Qr5bK7Ii/HMrR88xJI21P7yT0y4PaEKyaWu1DzvFDoEIkkwrfLk3YRuYyOPkV5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4sAWKyaDBwFNNLe+1g52Oq/a530evX3QKSsEN31DOU=;
 b=A+nrVKi6Y3/73Udp9/5bLzR4DKVq0NjYOZWdJX0KK0I6kFLxg0INqxyzavTwk7OO/DawwHGu1uMAfNms68qqAidZGTuTP1oWIfIdPWin/Q3dIsJD6OBm7mo/Dkz9VFqYEfLv2+82knURBWmNCXXxaU8V3obF4hJC2tnK/ywyfdp1/ARC/ZZCxgfUh388TfvALcrK/73hIwNJHHSUR4ghwfNF6Jh8NqyAtZ7fZiAl2m4iq1z4osqpKoHzyWekBsAl90rhI0CN4XlxbdWCLt5VFXOtyXgA5d3spGS/UDAyP7s/zi4QT/9jdaIL1XBriIjpHm0iOWVx1Bw39sfbQn8cRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4sAWKyaDBwFNNLe+1g52Oq/a530evX3QKSsEN31DOU=;
 b=3Mlty+yxQD6/vxK8nwWq0LxqEN9f1v3bsgtaKB47wLqNdK5krhdadoX2eCRJbupXpvOxWJ6N5/GOWbOQU0BUGTCXoISfNH4oMkQSoWxWwkY7lUI/IlNUat95tPrKpH0aIWNuZd4J/IPUlfD/Ezx8T5iPr6ZhzYrSmjzoyQo8f9q010qJF7NT0j43aaoSUOvkCnVDjmw3P/+21oey8pdobpxZ9pzQ9dN6Te8dqn4/9B/35Kfyq5EHDhncEcZ+aVG2DzfnEYPICW4dntrm5mpWIgLgYs0KHP2qjTKLdKgepin0tNNjIZdDngccFteGzs8TlKD5FKYW2jNPRM9ijtZmgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cc58e5b-ba23-e7ae-c575-fe8cd713f515@suse.com>
Date: Wed, 29 Mar 2023 11:14:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drivers/char: Use sub-page ro API to make just xhci
 dbc cap RO
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <befefa60ea42a41543bc6dad70a559816cda8b7c.1679911575.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <befefa60ea42a41543bc6dad70a559816cda8b7c.1679911575.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a694611-6827-4660-b87c-08db30360eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5GwdWnSl6GcBAU7U8TjtBVRV5UNvdipo9D096xqVk+pN4WUTRNI2+PG1gjQLUYuHGdYG3hcYqOVyNY3ADyE8sUTH2iEQZvJf5uFm8WOjBYs7JmUGsplkdESWbXChoH2cMs5FQIY3FtzsyVVEAR37uBFue6FdDn8D75c68GcEPBpgZVv7N//tBYKbub9AUW0ju5/ahH61IMn38wbG1ktO+5tQyF4rJridaz8Nkv0at9HA4pZHZnr2JLb1OaJD0oqi9pIWtZFVGFA88XTjIoI9bXTX9C3FzqJVA6qbxJ/bxNcrl32zUM8SyygUMY4DKg8P7U3FhY8jaW325XUphDYCd0lr3xjcfB5c8AzkCiBBcnfq/bcwDcTFTRJtpIQUhFRI85l1iU1JD8808V9A3WZyHmlA/NmRN3T2Rtz2iZf8KskfzGZnwh9H4jC+V/o4Vb8SwFqucarqvQc3Yi6EEaCF9W5QjntK/qNcuHualWm+76GCebeh3+C/aK+FB9nxZ7H0jvuJ2vAxhhIYpA4kmQrL+TtiwnVeVwvVG7qqH9Ur5BR5A4gvgh4BTmIH5HHD8M8pemVfRAEt8qiqPcqwhE51LAZdtlplvvDgG+yI6zLN8mRpsS0FjQJpFMi/mVLUwoyZdYtKej1+9F5NjbyxJNj8IQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(478600001)(38100700002)(86362001)(31696002)(6486002)(4326008)(54906003)(2906002)(6916009)(8676002)(8936002)(316002)(66556008)(66476007)(5660300002)(66946007)(186003)(36756003)(53546011)(6512007)(26005)(41300700001)(6506007)(31686004)(2616005)(83380400001)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U08xM1owRzZadmRyNGRWbGV5ejBnUHN1em5EL2F5MU0zQTFRejBxSVVKSU92?=
 =?utf-8?B?QWo4U29HYUIvbjVzdk8yZ1pXR0pCTkNWWDcxT1dDMUNnQVV5djJIaTA5VGdL?=
 =?utf-8?B?THVFMHQxSEJkR1lZd3dVMC8xc0hVNjZyTEw0V0h0amwxTG1wdnUzUTUyY0hW?=
 =?utf-8?B?Mmo2Q0tyNjlmWDJJU2p3ckhRZGc5SytRcGJlVHJaZEFJTm5HSEJFMXd4emM0?=
 =?utf-8?B?UTE0VkZBNEZJMXQzZzh5aDQ5aDYzS3FXK2Q5aUxFNFlSNjQybTR4bDc1NGlh?=
 =?utf-8?B?bzdJak5wQUE2THN6QWdjcld3WjdZZmZOSmduVHRoM3FqNm1JT2JROG1QcUhR?=
 =?utf-8?B?ejBSaUhOenZuNjVkSGNVSUxhTUlKVjhGMVY4OTlnbkVXbHk0K3FKUzA4Q1Ft?=
 =?utf-8?B?TmZzZ3VGWnBnbHF3dzdEeFh1R2FMbmRKbGZ6cUdNYTVzY0xSSmVzcUNjYXhr?=
 =?utf-8?B?bEVWdXNOQTY3MWtvRkdadjFCRWd1U0hVMTZ3OVczdGVldUVQUjZhVGtNTThk?=
 =?utf-8?B?M3o0RXNOcXoyYklwNWZtMncrZmdnY09hc05yczBMNlJhb1NOdy9sSWpJL1pY?=
 =?utf-8?B?Y1JyRUg3V3dIdFAwSGx0bzRDc01DZDloYklhcmh4ZEJncnMycit6MDRuck1a?=
 =?utf-8?B?UU10L2trbEpadFZEUC92VDZ3ZnhkdWdOaFhjMTYrSEhTTFNJVXZ0S3g4YW1Q?=
 =?utf-8?B?NVMvMGZZSW9Oak12VS9jUUZpU0Q5cHBEc0xvakFhWXVLeW42WE9IdlJjWmp5?=
 =?utf-8?B?MHE5ZGk3V0IxOWM5WUJTTVdXb1FvOGNRczROZTBXZXVkWk5SZS8wdDZ5cm9r?=
 =?utf-8?B?STRwTUVUZ29seGlqSVc1VnFtZ0l4M1JQMmg2S1ByTzhQVXdYM2dVd0ZpTWtx?=
 =?utf-8?B?elcwOUR5UVM5U2tROTlyVnBCay95TXJ6R2UzeC9VRFNXTkpDeW9PZEdNdjli?=
 =?utf-8?B?eVZ1S050RE9PZGN5NExpUGFvdDBud0tuQzVmaWFIWmU5cnNDeG9rS0RoaVA1?=
 =?utf-8?B?eXpyRnB2cWJzM2h4czRSUjByMCsrVFg2R1Z6Q2lsOE14eVo1NjdZT3N6S3V6?=
 =?utf-8?B?a2g3bTl1N3FMU1VwQTBXd1g1SUtSemJCVGR3dlpOZllEd0pTWnpYazJnVlVk?=
 =?utf-8?B?TmtNbExxTVBraVBmYWVsOHZXZDFLcDNUZUtSOFcwd25kZ215bnZHY3J1dmdX?=
 =?utf-8?B?R2NDNWFlbkY2dy81TkJTL1A1bzBHZEYweDg4YzhWYkt5c0N0RytnQVhITVh1?=
 =?utf-8?B?Skw4NGkyM3FIVFlqSU5SbVk4Tko0dWlsTkRZOC81UHVUM1lnU3pHckVLRmF5?=
 =?utf-8?B?OUxUa2oybFJ5M0FTZlhUYUkwOE1WZCs3VHlDbmoyZm1jejdoazZEcWtta3RH?=
 =?utf-8?B?SFFvckR5TWt4UVNLQ3grUkZzcnlsaFVjd3g2UzNVZjl5L1pZaVZWMEc3dTho?=
 =?utf-8?B?OC9HOUYwa2NDaUVSU3hVU21UdWJLTWl2ZjErYzVSaEhYbXE4VFFOK2xGUlJm?=
 =?utf-8?B?bjZkTm9RMGJzditvYmFTTkZFVzJwOHRKNmZ4a0lGRE43ODlVNWlxbkNIMWtE?=
 =?utf-8?B?SWgxM1VvOWt4N3pqTE9Rc0NaUFVVSWNESWxzT0FhcXJGTG9yRTJxMWs4ekxT?=
 =?utf-8?B?YUxlVERPZTZ2dHAwcEZnUnhwS2lLSkJEaHNVQWRkYXFZRFlOSmpXcmx2WGhu?=
 =?utf-8?B?R3dwd3hXV2tCWGovVmdZSFRnMWNhei9Ob3BEVUhpd0czV1o2ZURHaWV5bWJu?=
 =?utf-8?B?RGNEZ2hXVEFpMG80T09SQzlRZmZneEJvcDV0b3NyTjRqbVR6NDRHckFGRkpm?=
 =?utf-8?B?dzRIRytyOUdVZkpXSm1tWWhTdnpUNU1hR01MMC9hQUhyR09PQlR1YTRSOWtn?=
 =?utf-8?B?ZSt4aWRpU0o5Tk5FazlIcXBJdVpZUjZGaXRueEpmUElCM052MEZ0dTk2Z2tO?=
 =?utf-8?B?Y1QvZ3dHWjJLWFkzbW9iS2pEYmJic3VybWN6cmxqWkFxeXRiSVBBd0ZQYWUv?=
 =?utf-8?B?L3JqR3k3UU9UcHI3MndvaTRNejRyTUtqbHVYNnZyUnFVUW0rZkxWZnAzVFpl?=
 =?utf-8?B?eGNJMXVkYWtHTzlSREN1dDVWOUxieGZiUFltUUhHUE01VUpSd1YxYllQTHpR?=
 =?utf-8?Q?tKO99ZAiakp2lDO8hE2BzdJnX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a694611-6827-4660-b87c-08db30360eb2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 09:14:53.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThBR9mBryTMpcdzUuilryI1ejchHE5VZ1p6u1qEqVHmwRqiAKmmlSPcAUqbyQNWdT6l79NZTGUGW+TxIq0FfMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8358

On 27.03.2023 12:09, Marek Marczykowski-Górecki wrote:
> ... not the whole page, which may contain other registers too. In fact
> on Tiger Lake and newer (at least), this page do contain other registers
> that Linux tries to use. And with share=yes, a domU would use them too.
> Without this patch, PV dom0 would fail to initialize the controller,
> while HVM would be killed on EPT violation.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  xen/drivers/char/xhci-dbc.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
> index 60b781f87202..df2524b0ca18 100644
> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1226,9 +1226,43 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>                           uart->dbc.xhc_dbc_offset),
>                  PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
>                         uart->dbc.xhc_dbc_offset +
> -                sizeof(*uart->dbc.dbc_reg)) - 1) )
> -        printk(XENLOG_INFO
> +                sizeof(*uart->dbc.dbc_reg)) - 1) ) {

Nit: No need for a brace here (and certainly not a misplaced one).

> +        printk(XENLOG_WARNING

This log level change looks kind of unrelated.

>                 "Error while adding MMIO range of device to mmio_ro_ranges\n");
> +    }
> +    else
> +    {
> +        unsigned long dbc_regs_start = (uart->dbc.bar_val &
> +                PCI_BASE_ADDRESS_MEM_MASK) + uart->dbc.xhc_dbc_offset;
> +        unsigned long dbc_regs_end = dbc_regs_start + sizeof(*uart->dbc.dbc_reg);
> +
> +        /* This being smaller than a page simplifies conditions below */
> +        BUILD_BUG_ON(sizeof(*uart->dbc.dbc_reg) >= PAGE_SIZE - 1);

Why PAGE_SIZE - 1 (or why >= instead of > )? If there is a reason, then
the comment wants to be in sync.

> +        if ( dbc_regs_start & (PAGE_SIZE - 1) ||

Nit: Please parenthesize the & against the || (similarly again below).

Like asked by Roger for patch 1 (iirc), here and below please use
PAGE_OFFSET() in favor of (kind of) open-coding it.

> +                PFN_DOWN(dbc_regs_start) == PFN_DOWN(dbc_regs_end) )

Nit: Style (indentation).

> +        {
> +            if ( subpage_mmio_ro_add(
> +                        _mfn(PFN_DOWN(dbc_regs_start)),
> +                        dbc_regs_start & (PAGE_SIZE - 1),
> +                        PFN_DOWN(dbc_regs_start) == PFN_DOWN(dbc_regs_end)
> +                        ? dbc_regs_end & (PAGE_SIZE - 1)
> +                        : PAGE_SIZE - 1,
> +                        FIX_XHCI_END) )

Nit: I think this is too deep a level of indentation; it should be a
single level (4 blanks) from the start of the function name (also
again another time below).

> +                printk(XENLOG_WARNING
> +                        "Error while adding MMIO range of device to subpage_mmio_ro\n");

Nit: Style (indentation).

> +        }
> +        if ( dbc_regs_end & (PAGE_SIZE - 1) &&
> +                PFN_DOWN(dbc_regs_start) != PFN_DOWN(dbc_regs_end) )
> +        {
> +            if ( subpage_mmio_ro_add(
> +                        _mfn(PFN_DOWN(dbc_regs_end)),
> +                        0,
> +                        dbc_regs_end & (PAGE_SIZE - 1),
> +                        FIX_XHCI_END + PFN_DOWN(sizeof(*uart->dbc.dbc_reg))) )
> +                printk(XENLOG_WARNING
> +                        "Error while adding MMIO range of device to subpage_mmio_ro\n");
> +        }
> +    }

Seeing the uses it occurs to me that the interface is somewhat odd: It
adds a r/o range to a page that is already recorded to be r/o. It would
imo be more logical the other way around: To add an exception (writable)
range. The only alternative would be to include the call to
rangeset_add_range(mmio_ro_ranges, ...) as part of the new function, and
reduce accordingly the range passed earlier in the function. But I think
this would needlessly complicate the code there.

Jan

