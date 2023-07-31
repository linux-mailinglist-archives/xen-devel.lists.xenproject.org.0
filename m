Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C2769774
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573048.897351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSt4-0006A2-TU; Mon, 31 Jul 2023 13:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573048.897351; Mon, 31 Jul 2023 13:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSt4-00067d-Pz; Mon, 31 Jul 2023 13:24:38 +0000
Received: by outflank-mailman (input) for mailman id 573048;
 Mon, 31 Jul 2023 13:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQSt3-00067X-CX
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:24:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97e168fd-2fa5-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 15:24:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7701.eurprd04.prod.outlook.com (2603:10a6:20b:293::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 13:24:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 13:24:34 +0000
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
X-Inumbo-ID: 97e168fd-2fa5-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEUP7LRDcmsbTHJF+3C6ah+dTJi5hdN+uURkQWvjJUt4ryTvmpkUP8x9je8nn4SzepY6LPH0t7URySpE6ECV7I4ihR4FxmGmfBJqVh/BGsGcb483AQlC2mfK5iurqEVCnadTUmSIs2sShq5SJAccEBwOI67Awhq30fmBzGDetf7WyyESt/FsSTWpq3voL07neIghH4koMXbiml0cyeqoxEVgEplv95OCRDQMDZ/titvBAPL5Gw4srnQVaNc5rDSwING90SnCr1ouYG42q937uPJOQ75m7LHGvW3Z7NAhzyr/KiJT4v/7fbqv0EFFc4IGpULao1mpWnxIKypf48gnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjaJPRAsG8ZVfoOjQO1GFUeIsGVylpeuNhe5+y0nvhw=;
 b=lQXad6/i/S+veN8bgss4O5Wrxv9uysPI/A22Ts9sbenV1QhUvu0qpsFtTcFKQvMm3kGh5hUUzMVEO0+ra59i7b8QdpW7glvVSvrCocyg6lti0ERKvsgBBPFt61gPmPi/z96zBKNgZ+gB+13ROYntRknEtFBsuMtGQ5f5vVkaby/lbrvWbgdcegHe4a2hpW4OQ5J1h8XKOUYQXatEc2a2Gc1fhH2hi36LGu9FgrpUx9gtlyfz663rQWbssSe4BU07W+U2+WcCwVTNl5c+4ncgq8S//YHABTBe28QT+7QO6UMqD70nxt6K+Ab/FHBJopoYvhDOcDN0nBPt9GXNU2UWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjaJPRAsG8ZVfoOjQO1GFUeIsGVylpeuNhe5+y0nvhw=;
 b=BYAoOgfeGfQgI8V/f4jP5FVhEqy5eoc5+aW4qjsSXogJcKU18HQdSSMrh5PPHfAjiyT1wns591sBx3vRWHA+Z+I/S93LfYHoZ1KzK7oZDUq0s8YbkoomBX1WfD9Xt20n4yjzvItyeJ7mkKXNvXZ0gqow8j6EBvuljL1ppGkbrDpueos2ZcqsOD/T/wtXirsI4f6lPSB5JwMJVQ5u4AaQDDyOTmtR6BG0Lbvh3xE9BbXL7UFGvNeDCV1I+s9aHEQUajpzn0K5hpRKBcBxpfCAbdRpudYntXXDbgg+oHjShNqpRBSSPfHHx8nc5UJ7LxE/h5utmXVYoTMe56LoZ0516Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98596d8e-6c11-715a-7842-910806abda77@suse.com>
Date: Mon, 31 Jul 2023 15:24:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v4 1/1] ns16550: add support for polling mode when device
 tree is used
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1690475512.git.oleksii.kurochko@gmail.com>
 <6e8f243284b53a9c56e7faf5e0e5ee5e20de9958.1690475512.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6e8f243284b53a9c56e7faf5e0e5ee5e20de9958.1690475512.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fba9421-3581-4193-5f8f-08db91c97b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d2M3++t9bUqwSnCWTvdng+59qTxhG1OTYEOm4P4hW3NW0ip4/zVl8UDHUwjXDDaHTKwGzK0ShdcchNvH662Yq2FuNaqXI4b9boMhvI4tBhUukGd1zOungqxyk8+VUH5lRNInk+S2Ms0aJpNuS3CrwL8PLWGCtsiZGFd1LXN+aYJjTPH3ddxHerqpDM8Me9fiogPlg+SQJVesTLno0+kYFxexP6lzK4zWNZYIE+cAq6sVMyJmoDiiAreUf8cQXI0EH4hkczT2Ndyp9qjChJWRBfkCcYWn79PvDGEVYxdzFe2LT91u27T8MQan3plMFQXdRzKsCu0oWLx7kKfwZ9JCgMM55ILIXptBXOHeGknrWQZ2e8S8URw4972imzNCQhr0XZ25O2RhaeXwGectRxxRKFV9Sdd9rdYsX+TPONAY8Ya6MmVTVUZmZYRkas9/3UTxDDReyK9WWn3P/3WCD/WaMYnBrxKA6pIA89MjskhyBLXkR5YrKkHRbwmEc5ZzwNYxje5GZvbDJ/YgMzB8wNk1+ZILDxz6MJDGUT40vSjRYmrk5h1CpB/R5uMh5qfHOjR6dHrGsq97lF0tdlVMl0HYrE5X/N2tc3kf6RMi5+dWNh52Dz4gM9HsWnROz3hBvZ4ZCA/CFbOYSiU4713W8IW7LQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(83380400001)(186003)(66946007)(66556008)(41300700001)(54906003)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(38100700002)(2906002)(6666004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3VxR3c3VGxsWkpHSE5qTlY3NVNUVHRNdy9nSFRNd0hzU09Xb0VCd0dXNjBw?=
 =?utf-8?B?dmNRNTFMVkNESEkrclhuRnNhSGxkaC9zWGJ5cU1qekdtRTJCUDZvRkpwR1JZ?=
 =?utf-8?B?djBSYVh3N3NPcUlERXkvUXNVR2xOQVFpNkFvTTdEQ0x3ZnV0ZitSeENLOVJW?=
 =?utf-8?B?MHdHUi90ZmFXUE0xOVhTQXpwZHV0NmJUeXVicE5oUW9zYUFUVDlMYzBOVlQv?=
 =?utf-8?B?TW5GV2NKWTBucTVTcFJORjRnOC9udTRxcXpHVXhrOXYrV0E0VVoxN1NvVW1I?=
 =?utf-8?B?Uy8wcVdMZnJ4eTQrbDRwZ2JIV3VPOXc0eHlXb1VtWGN1dWdFQ3RJS0s5Q2x3?=
 =?utf-8?B?UkYvWnZrcDh3QmgzS1cybVdjTmo0NlBNNTBXcTNxenNXQ1hOdk1QeHFaYTdQ?=
 =?utf-8?B?MTUxVDVCYjYwbk4rT2UwOHpmZHJucGVGSkJQeEREeE85bTlKcU1LTWRCclMv?=
 =?utf-8?B?TCtJOVg3RmpFbW5sekpoZ2Zpbm1WbEVNQjkxa25pVTBlRG5sYzZTNmVyaVNQ?=
 =?utf-8?B?RWM4SWQ5V2dneTJOWkRVVGREcTFtVjVZWU9zMmhGNGRDTVRxWGgzR2JIMVRv?=
 =?utf-8?B?QkU4VEhIWmwzdHZFQnFtc1daRkg0bGZDT1JJb2tnYWZQMjE0TDNIcTFTOTZx?=
 =?utf-8?B?b20zalBuVitkM0wzWjlzdEs3cGZVWDN2ZE5KMUJDWUtmUi9KK1JHeHcvNWtp?=
 =?utf-8?B?elFxeThheVNxdFVCd1lhNDQ2akxFeGZoOHptMlo5a1VRODhxZGNYVXNNWWJu?=
 =?utf-8?B?enZpMVJuK2V5UHpaeWFjWnkzVW5NVURGbGVvdEVEdEpBSVBKc3d3ZWdybjNX?=
 =?utf-8?B?Yjk3MTUwc2RMd2l5Q1dHZUVPSThuWUM2Nkc4Uk1YVDd4Zlc0SHkzTWt4WHdy?=
 =?utf-8?B?MHp3OThMQ0dQVlh0YW5oeUV5Q2ZwS29XZHFNWkY2SldjZzlJZDNNdjNoSGtw?=
 =?utf-8?B?amlhL2Q5a2RHazl2Ly9NY3dsdUxWOU9lSEZsenhLMUdCa2tFa21aaTQ0NEhT?=
 =?utf-8?B?U0lSNGRYb3lJWDVHbi95S044elc2a1o1VDMvb2UwVktvM0hRY0JrdElJR0FN?=
 =?utf-8?B?ajNhVld3TjNjbzV5dEU0c3dBL3VhUXNEOHJxeVJwaUt4OEZtWjUxdmJuZzRq?=
 =?utf-8?B?RFVwYzVLTkljdTJjaFpHaFU1SmFnbEtBaE8wbHE3WS9zOVZFUmFPcldjb2or?=
 =?utf-8?B?QXJqOExoZ05yS3JBYUhBNTBQN0VqbHpLWDBDTWhpUjRVdUx0cDVCVU5MNWo3?=
 =?utf-8?B?SGNYanc5QkJmWVh6Q3A5US93RkxqQWIrcVpnREtma0M2ajkzMllIVER0OWdI?=
 =?utf-8?B?TUZ1RCtQV2R4VWlWV3hqbm5UT0JvVXVObi9FNERySnNZcUdRNnNWT0czdUNU?=
 =?utf-8?B?ZTMxdFNkTUtPS1o4NURBL3lCRURQbkNCQzBpYkxvTk5EeWZlSlBoTzI2UCtR?=
 =?utf-8?B?YUtMUzBiaUt6VmdyeXh1ckQyM3o1VVBaOXpFL1ptNVdVZ1hvaWNPUExIekEy?=
 =?utf-8?B?YzZkRjBYeW92bmI4L0NlYXdsNkM1L3h5RUZRS0F5eWRkbk5sdUVKb3dVdEp2?=
 =?utf-8?B?Tm9peG1HenQrbGRDSkNDUHJQVTdjbDdjdFZsQTEzWDhQUjNHVmxzcE5DQXl3?=
 =?utf-8?B?Y0s4SjA5SUpiK1dmSlN1c3pyNWh6TkZNTitEdWhaT2U4VGtZNDg5QkRoeW94?=
 =?utf-8?B?V0o1Smo3b0p5Yzl1alJsazVQeEtpaWJ6b0puRkpGa1VKeVFNZm9NZk5tQ3p2?=
 =?utf-8?B?SEIyYkZRTUxlaUM1TXZ5RldpUFBVSUM5R1RsaU9Nb0dFaXhic1Vpd3RRV0lN?=
 =?utf-8?B?WEVESGVNN1EwdUhDTUh5cHc0MHNVeGxPdGhrcGNzVG9mZWpSc3c3T3dQWG1F?=
 =?utf-8?B?MzB1Y1UrQWVTVktSUERIYUNKTEtMYzhTS2JCbVZHQkp5V3hxeHZlZWw3eHVj?=
 =?utf-8?B?cHRJQUhDN2R4L1krVlpCcHY1aFkzeitSRUVFeTFIZEM5V29iMERzNDlyci9k?=
 =?utf-8?B?YWxGbkI2YnJrRlUrQWx4c25meVIzL1dmVGFoQU4ycWJCT0RWaXJBbmVlenVo?=
 =?utf-8?B?bVg2eHd2aGxxSUVPTGtSSjdSZkxkTlk1Zkh2L2wxa2ptM05uVTZzdlYyVjlG?=
 =?utf-8?Q?PgiFrHP3ukyzACoXRpLm38SJy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fba9421-3581-4193-5f8f-08db91c97b12
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 13:24:34.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbCT/JrkxGAane7YfeVpnowRZkZ+axx8+hRYC1kXpYDI+O9mtRfx1lf7gIxZGUpDAHF31q9n54ZpegLy/LUBoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7701

On 27.07.2023 18:45, Oleksii Kurochko wrote:
> @@ -654,6 +674,9 @@ static void ns16550_init_common(struct ns16550 *uart)
>  
>      /* Default lsr_mask = UART_LSR_THRE */
>      uart->lsr_mask  = UART_LSR_THRE;
> +
> +    if ( strstr(opt_com1, "poll") || strstr(opt_com2, "poll") )
> +        uart->intr_works = polling;
>  }

A non-__init function may not reference __initdata objects. But strstr()
is too lax anyway, and you also shouldn't check the wrong port's options.
You want to recognize "poll" _only_ where all other command line options
are processed.

Also may I remind you that extending command line options requires their
doc to also be updated?

> @@ -1333,9 +1356,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                      uart->irq = 0;
>  #endif
>                  if ( !uart->irq )
> +                {
> +                    uart->intr_works = polling;
> +
>                      printk(XENLOG_INFO
>                             "ns16550: %pp: no legacy IRQ, using poll mode\n",
>                             &PCI_SBDF(0, b, d, f));
> +                }

I'm okay to leave it at this for now, since this way at least nothing
regresses that was working before. I'm not convinced this is all
correct, but that's a largely separate (and pre-existing) issue then.

> @@ -1791,8 +1808,11 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>      }
>  
>      res = platform_get_irq(dev, 0);
> -    if ( ! res )
> -        return -EINVAL;
> +    if ( res < 0 )
> +    {
> +        printk("there is no interrupt property, polling will be used\n");
> +        uart->intr_works = polling;
> +    }
>      uart->irq = res;

Shouldn't you avoid writing uart->irq when res is negative?

Jan

