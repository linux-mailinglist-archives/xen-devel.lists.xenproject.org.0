Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB843401CA8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179946.326403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNF3i-0004Gk-IE; Mon, 06 Sep 2021 13:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179946.326403; Mon, 06 Sep 2021 13:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNF3i-0004Di-El; Mon, 06 Sep 2021 13:53:14 +0000
Received: by outflank-mailman (input) for mailman id 179946;
 Mon, 06 Sep 2021 13:53:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNF3g-0004Dc-Sk
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:53:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5e79a4c-0f19-11ec-b0a6-12813bfff9fa;
 Mon, 06 Sep 2021 13:53:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-57hMhSFSMBSVrQVWPxqeDw-1; Mon, 06 Sep 2021 15:53:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 13:53:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:53:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0271.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 13:53:08 +0000
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
X-Inumbo-ID: c5e79a4c-0f19-11ec-b0a6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630936390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhLZGAONCDDxsmgW/I/T1OjSqyvPMPUBLOx7J8nGXuA=;
	b=KvsoEaTyXPNlntYJgtfcZcKi7Hs1dPn+z312ZOKTuciFj83jgo8VRuLvgk3iDrqmrWB2pw
	9THrqlalj5gz0WAOIwWtuWh+HjkJAmHg2U4+AmAh3mzD4nAg1eq7uCEerHnTcSVrr2CCJe
	OytdjxyQk638DRn9KFfbJ+RWUogtFvw=
X-MC-Unique: 57hMhSFSMBSVrQVWPxqeDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iENllwtlBNZr9CQMofON5J4F1V5EhvxRYfNbCvWF8rQqhY/OmjJpkGKR4iz3eIiIkmmUsP82BZglQW6yftOMvW+yE7bK9H0qts0qlHDJBacet+mprGmGY0GkY2xUH+nAtSFghNAo3XqpG9g8YqmY0c5w0UEwzeKVgCnl5OPYhqYWOMq6plL26mbu9+sVb7YZJ0Fv0tdMO3FyVtlBt8JyrdvqRwGGP54H8QXNiJpPA2gmy/PL9fNqaknI8nLq2i9RDgnLb7a/kB3Ubbl4vQgnUY2PuszS3OL7ax0fenMpOtZzKEpiw/QgQQu+GFnktwlZdtKN0eicCN9SDdSMcIXhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GhLZGAONCDDxsmgW/I/T1OjSqyvPMPUBLOx7J8nGXuA=;
 b=BVtoVgWwlfrRM045Nz8GoNGZe6QFWZu7PSgbw+Fq5sFzSzJvSr212bEvmGm13Z/+P3Whhh+e55QBUjCu/6eUxKzyMQP4F5EGiyW+KUR3/SnvZshB0O2KnBwVH36VjV6uO4sbsyhLKXVJE9Q3xMUJ1Ho1QENs3zrXB1YeHnQMmyoGXjX3ytz/2HMcTKXm6XCNLGnhUBLfR54xJrcws1JC/cMQMHlsXIvrozIROk+V5uM8dYgVJs8ELUmuPfMtW5+ItGe60RhFucWWXHXJ4Jh1j4CFbCOyeFMOF0UWiQmyuMzHKyV04a+WcSZWAzicR1kUs8EzsqdHjb2R6vMhVGFWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/9] vpci/header: Move register assignments from init_bars
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-4-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4007d84d-9e76-32df-58f6-af5ff26fdf6e@suse.com>
Date: Mon, 6 Sep 2021 15:53:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-4-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0271.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91454edf-7940-401b-bdf5-08d9713da8b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958AFFCC2205163BE6DDCD0B3D29@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6fRXdngvvZMQEcXFxwtsB+i4DD+N/IBg3k/NuHplPd5zzLk7EPBKx3Qxn4sh2K1Pj2p13e0RVe0I4TPKepL6JdkcQOp71SLNLedR5ys1arHR9NFWtkyRqOjjDB5abfNehBOOek+fd25EWny4xvXJgEg6IS8XHjHjSu8TVH0+lGGABZxuXo66pgqHD6oFLKph+lEBt9sDeFfWKgD2VB93oEsvp5MtG+hHISARCT2Bo+Mq1lVEGL0O8duFRazU2vER73jKXi72NTfq7DWpLrJB4gPOFvo5i8udB5inl/C0FUsopDEvQzqblGtEKFqmkd2xeaHsU2uNEw/dyrD76ETtnDedSnntTX2ItYuaWl1nirNcVX/3D9okZCE05Gtd8CGFvXAXA4w07gOPz4CtuJbkPllwMeajXIDM3YpvGcW+sR/CRmPYEJSZ/Jj2HKrtqXTHs9HIw0cGnGoo5fxXCqIB4WygalYr5BXnH6LCIX8Fdw4Hd0uQ5QZN0gGKfTWM4NMiQSMWfP1bpO1zs63aR7LYYvC7LlWVEWusWnhk5xqZlKC7AfCg8L0292+8fLgwYtr8gpWw3AkbXL1J+1luv7KDifQ40BzUIusbVqIk5tajNEW7AF5+kaF7N4aqJjDQV4Ht2IZPHMIYKBIABUOYgUL8orGGxM6bPFVfVazAnMIKL5CqnqESvh8qHg2omvlzlaavtJipZcW3tBOBM4zXJJPuu2oa3xbXHrNNBoLW0UT5sw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(39860400002)(376002)(346002)(38100700002)(4326008)(26005)(31686004)(53546011)(8936002)(316002)(8676002)(66556008)(956004)(7416002)(186003)(5660300002)(2616005)(66476007)(66946007)(6486002)(110136005)(16576012)(36756003)(86362001)(83380400001)(478600001)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTZZMWRqazhCanBaeTVJeEZQY3dwSXphWk1Ca0ZvQ0FHNktsRUgrM1FMQmZh?=
 =?utf-8?B?dmZncGR6VXFBdkVvdW96bzZPZ3BSQjFJckJoQnUreGhlVG10bUR3dFRVb1VP?=
 =?utf-8?B?UUVmRnhxVWo4c2JORVpBTlVBeXhBbnJHOWlIRGp3N1BxWGxzN0g5dnVOQ0J3?=
 =?utf-8?B?SGgwY2JBQmJVcXBTaHZ5Z0M5a3M3aXdENHB6bnJkWlJVeHlvU2p2aU9FTVRF?=
 =?utf-8?B?RnVmbndxSmhkSnhrdWVCMnNjVENLcU82d1Y1Zk8rQklwOTZHYWE4VHR4Z1hN?=
 =?utf-8?B?VGM4Y0lnR1R6cWp4YVVDTjBJbUtIUnJjMUxvb2JsRVB3VkVEWkFHWFNRbG00?=
 =?utf-8?B?TlZsS2kzeXZGNEoxVm5sSHIrMU00WSttY21JelFJMEpQUEtMamp6Z2hnbnpF?=
 =?utf-8?B?VnMyTXc5R3lzTnVJQkM4V0l1TW9JQ3BiUWxTM0MvK3E0bWVBd2R1dU5uQUdY?=
 =?utf-8?B?QThVdDNlM2dVQ3A5bU5LZGV4UnRNbWI2R3h3a1dwdSsyeWQ5cGNaaFVaSEtJ?=
 =?utf-8?B?cEpPLzRzenQwRjUybWxuVmh0QzNMSk9lOE5rVnpleVczOGdjK2JjRDdyVTRj?=
 =?utf-8?B?RVIxTHM1TitrTXhqZEM2N0hDZjUzQm5FY0ZYSWFpSlhjR05Zb1pYd2YwWWtX?=
 =?utf-8?B?TUl6VEh0dTkxb1dWc0x2S25pTUhGRnA4V2RnM0t5V1lGRGpqSGdtdnlxYnpM?=
 =?utf-8?B?Z3NtSkc1VzFOQ0dzaHJDdmlDSXFicE5zeDJoVWNiUEFjc2h3VmhKQ2hjWWlF?=
 =?utf-8?B?eXVwWmRVTXpPdDJJSVlFSUl6ZWpsNXV2NDlmUVhqR0tJWFZpOThpVWFzSlNB?=
 =?utf-8?B?ZjNMUWppTDhPT2VrUFhiaE1jR3U4ZGJqUllNUW5QSlluNndPVEVGVlF6NkR4?=
 =?utf-8?B?Y00zM0pXaVlzMlJvTDVuckhuU0hzcm1pTlN0WGo3ZmRMSVkydWZnR1hLUWxl?=
 =?utf-8?B?YnE2VjJoNXI3Q2JmMVVxV2tLQkNNcW05MmNoNzB4RndON2dkZ1g1WVhsTERS?=
 =?utf-8?B?U2VwWVEzMVJjWEhjT3hYUlJKS2ViNmRSQ2RYTzRhbzJMMEFsdENLRlhQZ0l6?=
 =?utf-8?B?a3hUT2c1d0VXbGJtMU0xTDgvTzlQc1pQK2pFMit0NFJobGZnYTltandnTDJn?=
 =?utf-8?B?aGZaNUVYa3pHemFCQnAxWjlvanRvK3UrbnlENTE0d0ZUZEs4cXd6TWVMVmhI?=
 =?utf-8?B?TlpQTWRLditSanRXdlRKb1pYeDdxNUN4c0FtckladG1XS3o1TGZPMjlBamtz?=
 =?utf-8?B?aW9tSyt5V0NuU203YkIxNjFXdElSL3FKdUFxQittWGthTElnU1RvMEc1NXZx?=
 =?utf-8?B?RUp5dE5BRWoxV25Fb2MrcUI5Q1FnUzgzVC9VOGR1QUs2WERBOFhZTnA5MzNL?=
 =?utf-8?B?Vi9SUzh0Z0FVRk0xc2F5WmUvblREdTVoQnhicU80R09NMUhJa3ZmZG52Y2xy?=
 =?utf-8?B?ZzBmdUkyd1RMSW5ld3FEdUZBZzNHSldOTUQwc0JwNGhPT2xTTWU5VkVCZlpO?=
 =?utf-8?B?OWRyTWV6VG1vMTZVOUJPekhiNElxS1QrZWd4WkJCK29wQzV0TXNaYjdjWWRI?=
 =?utf-8?B?SWtIWmhVMzRjRFhMdERqQ1NjeVZNKzdLN2QxSDk5SFhERzhrQW10UTF4dEEr?=
 =?utf-8?B?UEtMV0tWekwyUmJPT1E0OEExbnI1VFpQN2RielBXc0h3ZmJQaWlDY0srQ0VV?=
 =?utf-8?B?MHpHdTlQc1hzenhTVE5NVkd1TnFpVUJBL2Zieko0U0NockdGN2RPTThIb2RW?=
 =?utf-8?Q?tePr6N0jUStceAZYO+MaSie5g94FaGzszZDWi3N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91454edf-7940-401b-bdf5-08d9713da8b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:53:08.8640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM3Z4LV21P1n4pwaJlSRTBk9mmlMggVVkpTzzF+6jkJWK5pc+WYyUq6Pp7B3Z3cuAFBc3zf9Tmk2PeLBq9ck2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This is in preparation for dynamic assignment of the vpci register
> handlers depending on the domain: hwdom or guest.

I guess why exactly this is going to help is going to be seen in
subsequent patches. To aid review (i.e. to not force reviewers to
peek ahead) it would imo be helpful if you outlined how the result
is going to help. After all ...

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -445,6 +445,55 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static int add_bar_handlers(struct pci_dev *pdev)

... this function name, for example, isn't Dom0-specific, so one
might expect the function body to gain conditionals. Yet then the
question is why these conditionals can't live in the original
function.

> +{
> +    unsigned int i;
> +    struct vpci_header *header = &pdev->vpci->header;
> +    struct vpci_bar *bars = header->bars;
> +    int rc;
> +
> +    /* Setup a handler for the command register. */
> +    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> +                           2, header);
> +    if ( rc )
> +        return rc;
> +
> +    if ( pdev->ignore_bars )
> +        return 0;
> +
> +    for ( i = 0; i < PCI_HEADER_NORMAL_NR_BARS + 1; i++ )
> +    {
> +        if ( (bars[i].type == VPCI_BAR_IO) || (bars[i].type == VPCI_BAR_EMPTY) )
> +            continue;
> +
> +        if ( bars[i].type == VPCI_BAR_ROM )
> +        {
> +            unsigned int rom_reg;
> +            uint8_t header_type = pci_conf_read8(pdev->sbdf,
> +                                                 PCI_HEADER_TYPE) & 0x7f;
> +            if ( header_type == PCI_HEADER_TYPE_NORMAL )
> +                rom_reg = PCI_ROM_ADDRESS;
> +            else
> +                rom_reg = PCI_ROM_ADDRESS1;
> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> +                                   rom_reg, 4, &bars[i]);
> +            if ( rc )
> +                return rc;

I'm not the maintainer of this code, but if I was I'd ask for this and ...

> +        }
> +        else
> +        {
> +            uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> +
> +            /* This is either VPCI_BAR_MEM32 or VPCI_BAR_MEM64_{LO|HI}. */
> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> +                                   4, &bars[i]);
> +            if ( rc )
> +                return rc;

... this to be moved ...

> +        }

... here to reduce redundancy.

> @@ -553,11 +580,13 @@ static int init_bars(struct pci_dev *pdev)
>          rom->addr = addr;
>          header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
>                                PCI_ROM_ADDRESS_ENABLE;
> +    }
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
> -                               4, rom);
> -        if ( rc )
> -            rom->type = VPCI_BAR_EMPTY;
> +    rc = add_bar_handlers(pdev);
> +    if ( rc )
> +    {
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +        return rc;
>      }

Seeing this moved (hence perhaps more a question to Roger than to
you) restoring of the command register - why is it that the error
path(s) here care(s) about restoring this, but ...

>      return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;

... ones in modify_bars() (and downwards) don't? I was wondering
whether the restore could actually be done prior to the two calls
(or, in the original code, the one call), or perhaps even right
after the last call to pci_size_mem_bar(). At the very least the
comment further up suggests memory decode only gets disabled for
sizing BARs, which we're done with at this point.

Jan


