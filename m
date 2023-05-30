Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFF715E74
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 14:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541132.843543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3y5Z-0003aU-78; Tue, 30 May 2023 12:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541132.843543; Tue, 30 May 2023 12:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3y5Z-0003Xb-44; Tue, 30 May 2023 12:04:33 +0000
Received: by outflank-mailman (input) for mailman id 541132;
 Tue, 30 May 2023 12:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3y5X-0003XV-Q5
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 12:04:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21e92c44-fee2-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 14:04:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB10037.eurprd04.prod.outlook.com (2603:10a6:10:4d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 12:04:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 12:04:28 +0000
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
X-Inumbo-ID: 21e92c44-fee2-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHa3t8GSuxt9bmWFt2doW+2vY8EB/Vnk3Uq0WGiYp4Yv8O6CNuB25oinK9q183T9Xb82vMzcViyTavn1o5CxJv5J9bIzDHyc1Of2fJxkdVAzkD5cSbrhZuZbKef3SYpAQ0FAoxa9KD9bKiCS7pPX347qUz3crwxIetzOVOa3quGeif6Wf4n+LWE4gY2IOtkyB9c3JVNFCrK/xXXsu579hsQJ1W29kwgwHJgN3f6uXdGe71a2lHueIQOnS7ex0L96fMGXm7tu4lVFFboxdbAKsooVX/KGpMpUMN9kK32nf+Fp4hR0SgkK8lzVv3ft0ht5a6ED1+5IlCh5z7YcssJKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5M6j9/zLZaXFCotqRCFUrGKX1avJFkRfkyDX0EUj/E=;
 b=n5rO/cTpMPDaOiFvfuExxVgi2Wd6tqjrxzIykXy5SKTdqYQch9y3gdlaivzmjsyc5nnlpcnH30qb21WfKssMsHCc3zwYmb7Uaedfz8Swlw6lCQSXnSrTwNXcobcq5nrmP1hbdlu/l3h3ZqrRp2SEli2GERDYh04RziZhuWIhaSw5q/rLarPhXw5yMTcfUXw2p4HnP7ffPweCwXSINQH1QL3wxYlNZTEmIM66BWoVsQqBpF26Zxj3iAxOynIdQQjQARH5QnexRHRnUcWMWU2qXRErl47sLyWYCLwyFxJ5vDJsk71Tx98/wyK0N9910d0lmR/JB5GRD46oGz1DUQPIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5M6j9/zLZaXFCotqRCFUrGKX1avJFkRfkyDX0EUj/E=;
 b=ReCeJi3kPOCQn9jooFMpaVUI0OQgDFRmyTfDX+wt/Kgq7CkOLQdKoczF711/WrNTs0XHFzbdgzwPr2X3amATFhp6CloJ3WDQ7O6Go2tcMOQ05+I4Ho5iD7HmS7y62Lx6pOma9OrYJYIf8bGhzZvRu+7U2w/ZQk/t8/DFFt3JuVotkR90D0GNy4XnufRVENg4tvwYeZqwb5/YqZjufZDlJhI3trvgfQZiJY9Wqn/kKbSVbSkt4nIfquq6Td1HF3pDKAEbqMZF+PPtcqF91LIu3T7s5ZEcYTU6v6GYCDs4tjVoGliI3U9cZ0U3sm1OEoStxShhMisuRd1hP4k2ibedyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f168a753-45d2-7d66-8ec7-ad06e6cd42eb@suse.com>
Date: Tue, 30 May 2023 14:04:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <1f9909dacfd7822a1c7d30ba03bbec93fa2ff6fd.1683321183.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1f9909dacfd7822a1c7d30ba03bbec93fa2ff6fd.1683321183.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f854806-b019-4b2f-d8dd-08db610604ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y9/AG552Nr4n1U1bnmK0T71xsoBUA839WZIKg3ueFrf7U9Oo4pxNdz0ykJBHxs9DsTwGW6YmVO3vHzhk6jN3RkfbmJWHQox8kUC7HnncF6GlEtpa0iiR4YKFQY/dsr7KwKs8b1DdvpSUTrj6BOi9Kd0KhdYyHmmbmtw5FKK+3DUgePrHNn2oaZXTUe/0MGUJ49A6u52tc3RPW95+p0CDZFkZBO8mc1K1MVZWTZ/2k0F1zSNB6qigVXa0Fh1iO5IQIlnSWoawW3OCBiF2+M1ip+jO69FDTNXujfdprWSxKmkyfMa7ACjRK37Wx+BrVdxeUS6yBRL23ZnBHhQ9Bspw7gTFUDJh7oKYjMX8a5ExZbAwHZ4p8wcExul7EoVl0QqL1a0DTrRPefwZ690STetVwsHQQbS4uzljtcYB5QNoIubwt87aCF89+RovXJVlKm0YiIZROo/F5GzxgkfmBOlwtxShp/yzFOD1qxShqzYKRUbosvAHB+GQl8bNvffBXiawnABtEfTa2BjkYtPUNeeKbAhux6AxBky2rg/5Wm28wqg1cj/aN5uG3/wpqbJuEW6OkWUnzD1GgkI+9IR7T8LVAjEtkeYY1N2F+AMVJ8NZmxp1k/I1vLN37neorGiPwCIK7H8IjF33SduvkJ1oTLPEBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199021)(86362001)(31696002)(36756003)(478600001)(54906003)(4326008)(316002)(66946007)(66556008)(66476007)(6916009)(6486002)(5660300002)(8936002)(8676002)(41300700001)(2906002)(38100700002)(2616005)(53546011)(6512007)(26005)(186003)(6506007)(66574015)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUdWTXFhQXNNKzNrVzFDSWNqeUFGcXhEVWxpbllZVC9xTmp6VDhReTQxdWsx?=
 =?utf-8?B?Yzd1N0hFK2ZSdm9XbGhtQjQyQ2NSdnF6MDdqZ1g1dFN6Y284eTVJb2xrc0xh?=
 =?utf-8?B?TWpJT2JkSXpUaEhHa21BSEF3cXBDblUvN2JuOG1oNndMQmZwMTlFZmp3S1Zl?=
 =?utf-8?B?ZFJmamlOWGpDNlJQZ2krc2dseUNpN1lGYzk2ZzRQNDhCNUJwb3lkdFNkb3A5?=
 =?utf-8?B?QUNHV1RnVUZjdG1pT3YrNXZFVkwyVEpqUDNiZXlmMFAyU3p0bGU4TDBpVkRu?=
 =?utf-8?B?bzdDOE5OK1NhTXRXdS9WK1lGUU9ONWE4Vm41V3p3SkZFUkI3WHp4a0ZNZzlK?=
 =?utf-8?B?M2pBa3dWZnZZQU0xNFFOZlUxbmpyOGF3VlZEZDIxUFdUK0YrTGhtRGxMWFF2?=
 =?utf-8?B?WDRIVXZHdVBDcGVEMVUvcHNEUTJQRWI2cjlBNnJwRStWYXhRMTZoRWZJamh3?=
 =?utf-8?B?NnRHYUx6R2hTMU53RWpaeVNsMys2MllteUlOSGh1ZUhkaW1WRTJqbUVvZEF3?=
 =?utf-8?B?RlZDYktYbk13bU9PS2Q2amhyV29sQ3dCQ3VBK3pTUXd1UnhENmkxbFF3RlNa?=
 =?utf-8?B?QWdvRG5uU3J6RmNZbXF3alRGelFXdmlBZy8vSGlveU9tOTRiSnJxb05EV3Z5?=
 =?utf-8?B?MDNUbVBEUy9NT25hdjVBV0FjaEwveTNDSm9DOWVheVZnZjA3clg3R2l3YVk2?=
 =?utf-8?B?Q0FsUzhYd0QvV05tRUllN2l5K1htK250cGYwbkJIUzI4TjdtZU9iK0VIZ0pw?=
 =?utf-8?B?ZG9MZVdTak0wbDh1dkNoaUxpZkw4dE9wZzdPbmRNQjd5b05sQWNRZEFEeGVl?=
 =?utf-8?B?dTlreXdTTXpwNUpSTUt2QXZXc1pXNFNDdU1BS25nSC83SEtFTGNFUVpyTEFt?=
 =?utf-8?B?K0cwR0tXeXA2TnRjK0Q5b2tRbW5XNEdpcUxIeXVIM1lFRE9EK1p4cjIySjdz?=
 =?utf-8?B?aGxYWGpUeHR3M1FKVzY5U1hIVXQ4THo5ZGNkamw3STlLbWZCMDFzN0xNMC9S?=
 =?utf-8?B?ZTBSSUp1THhvSU4zeFI4d1c3UEdURlZyREpqWVROQ3Arek5QYVpOSWsybFR3?=
 =?utf-8?B?N0VSVFVtd0JMZkZyZXJERzY2SWtWQURJT0ZFaHRuSTRmL0dqTUIyWi9nSHBt?=
 =?utf-8?B?OHNsd2hhT0NtV1pQeW5aVmFXU29FUWdXZlUrbXJpNVlaZGtLa0JtTlNLM3Y4?=
 =?utf-8?B?L2RGbTROdi9QdjM1dFBZVG9zVTRFSjYzajVrMVB4clBMeDEwL0tMZ0xXS1g0?=
 =?utf-8?B?V2V6U3ZRVGlQRFQwMlYxS0MyV3NrclZubEdEMEpwUHdJbGRURW05TFRIakxV?=
 =?utf-8?B?RnFKQzBjT0F0NXNMYi9QdERucGlVL0lMdXdENGgzanlLNXpXWklOUjRTNUhK?=
 =?utf-8?B?NmJINy9ramJxTHJvZWpmNkxGR3RKOWpzR0J0a1ZLeVdUNFZiZ0grNSt6cTlw?=
 =?utf-8?B?N0tTYXV5QUdHWHlXT3pHZjlzUk1CRjIwaEtSZllIZmdob3BsemRFQ3VQVm1K?=
 =?utf-8?B?UFk3dnZ0Yjd0Y0RNRjV3SElkQlpJamp2YlFQUzFxUFdnZWdWcnZWZ0MybExE?=
 =?utf-8?B?Z2RYMWMwbWZxTzk2RG5KWjh6R2p1dnUxTW1DRFNrNS96MTBjdGJlZ2o3NUR0?=
 =?utf-8?B?ei94M2Z5SXR5cWhvMjNHL01oUlRmbmx3Wm1vVmZjcGh2Mld3aWY3NWFkeDlP?=
 =?utf-8?B?dC9xeDM5V3pxMTkweDk0amxUTmF0OUg4U2hPT0FtYWxQK0ttd09PdlVPM1Qz?=
 =?utf-8?B?eE9iVFRnZUQ4L2hZVTE5VXYyTm4xNTBkaWpGdWRCVHl6ajMxVkpjRUVUc2g1?=
 =?utf-8?B?eDM3NFYrbzlwNDFJN09qSXNtem5qSUt4RlpMRG1JRzlTTmdDNzFMaTAwSTBq?=
 =?utf-8?B?T1VPOWhDOXVKZkRjeWFHaWpHWGZpOWJORUFBM1J3dk9YaGVjSnpySDVZMmYx?=
 =?utf-8?B?ZWwyallyRC9QT3ErejdhTkIxZURCWHRwYktvUlJ5bExXVlQ5SzhWWUZTMTFJ?=
 =?utf-8?B?ZnQ5Wjhub29hK2JiV3h1MFB4RXAveEVDQlhyZ1czV2Y4dHBkNENlR3ViUHdl?=
 =?utf-8?B?cnVIZXpQMy9MZFRzOVpHNWNMbW5oRUZUdm52QkRJQ1hnckZyU1VFVVJqWER6?=
 =?utf-8?Q?Gk/JEHSIm3l+42zM5fwNofid8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f854806-b019-4b2f-d8dd-08db610604ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 12:04:28.3507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9hSJE1YEutaTmGe2J5RPPo2U9a8ryxXJ9z+yTx3AqPLUgKZOvGZVzVzvgl6FiGCF/WMOCB5N/2lWZDU6cB/Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10037

On 05.05.2023 23:25, Marek Marczykowski-Górecki wrote:
> Not the whole page, which may contain other registers too. In fact
> on Tiger Lake and newer (at least), this page do contain other registers
> that Linux tries to use.

Please can you clarify whether this is with spec or an erratum? I ask
not the least because I continue to wonder whether we really want/need
the non-negligible amount of new code added by path 1.

> And with share=yes, a domU would use them too.

And gain yet more access to the emulator, as mentioned in patch 1. The
security implications may (will?) want mentioning.

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1221,14 +1221,12 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>       * Linux's XHCI driver (as of 5.18) works without writting to the whole
>       * page, so keep it simple.
>       */
> -    if ( rangeset_add_range(mmio_ro_ranges,
> -                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> -                         uart->dbc.xhc_dbc_offset),
> -                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> -                       uart->dbc.xhc_dbc_offset +
> -                sizeof(*uart->dbc.dbc_reg)) - 1) )
> -        printk(XENLOG_INFO
> -               "Error while adding MMIO range of device to mmio_ro_ranges\n");
> +    if ( subpage_mmio_ro_add(
> +            (uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> +             uart->dbc.xhc_dbc_offset,
> +            sizeof(*uart->dbc.dbc_reg)) )
> +        printk(XENLOG_WARNING
> +               "Error while marking MMIO range of XHCI console as R/O\n");

So how about falling back to just rangeset_add_range(mmio_ro_ranges, ...)
in this failure case? (I did mention an alternative to doing it here in
the comments on patch 1.)

Also, doesn't the comment ahead of the construct become stale?

Finally I think indentation of the function call arguments is off by one.

Jan

