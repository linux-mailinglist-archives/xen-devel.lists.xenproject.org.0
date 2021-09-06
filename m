Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17D401C34
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179890.326319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEam-000535-9c; Mon, 06 Sep 2021 13:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179890.326319; Mon, 06 Sep 2021 13:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEam-000514-4y; Mon, 06 Sep 2021 13:23:20 +0000
Received: by outflank-mailman (input) for mailman id 179890;
 Mon, 06 Sep 2021 13:23:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNEak-00050y-AV
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:23:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a39a1414-ead7-490e-bae0-26b0da986191;
 Mon, 06 Sep 2021 13:23:17 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-htmKaAk_NEqJWFquy_URbQ-1;
 Mon, 06 Sep 2021 15:23:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 13:23:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:23:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Mon, 6 Sep 2021 13:23:12 +0000
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
X-Inumbo-ID: a39a1414-ead7-490e-bae0-26b0da986191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630934596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCq+T/w9za/+vXVmsi/kL7xE4T9zITd+xcOCO9ublJ0=;
	b=cHkJQa4uDFteIpHTdew1TpIQZKV05vHd2p51n7UaXdViG+/er6VnXPuRdwPTJc/4fia8Tw
	WCEOKCpEi8nE9o03uOze4xySd/Mmcmy6/q3v1DA4ausJClKBqY2nxzpuDpNlqS/e/IvWsB
	fqQarpkQ7RSWWKy51lKMz+3kvcBllHw=
X-MC-Unique: htmKaAk_NEqJWFquy_URbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhMlIlDF6bEYB3ozbM+KscYSqqEhkfQN/rd5rXwgBDIpfqg3venWAn+QQsoyonh+drME+6VsMgeLDMmM8s02/6WJs5aeRdhIb/96HbLQg8fnOZmqzoFFwZkGvNH/+JOG54pwmyup4i8hrLYEZlcZ0iisqaMp1B+/iI/SZv3/QesBpuOTcLZMZMLoo6RszDizzfVV4XBnhPfRgIH+lMIjC5aKX5rjd2sAgJd/gCBrPS7ZnkRhbnKyhUn9ZJaSXpIjhVDUt97Tq2cBnIEAtflIdr1lxigIndooVRRpI2816/LyDqgWNTkSglmk9gmarOlrKO9jnVpCHXAdEtPwxfN+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xCq+T/w9za/+vXVmsi/kL7xE4T9zITd+xcOCO9ublJ0=;
 b=JnVGxIU75PhBdciQs+8Efy4TB0uw/Xu+FGQMdZiFVUfdKuWJQ8XCLsNfY3KsuIIKmzkVK2DsBmi/mMZYNFk+Lrb/vjroxCWwmGIYi8wl6C+lfL/YMlreKZzl4pU6zZrrLoatI67UDuTTkUZbuko1/jypEReD0/c4nhOBvXJEgemQjujJ/D+wrfJFO9/6UTy6sEmHNzcXQnKM9xQ72ZmtH+w2rGFvhFE4b9BMbo2OBdLXZ+XX0aSKJKUhWwo223kUO8zBQdlIY0QWVXHEXpqmlDCMcn0pnVJchKNExspfiSgRppyZqpKd/626laliH1ctMby5pKZZhUYXoUBivUhRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/9] vpci: Add hooks for PCI device assign/de-assign
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-3-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <371a403c-adec-f1e1-8887-5664a749b169@suse.com>
Date: Mon, 6 Sep 2021 15:23:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-3-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe7cddd-96ee-4935-f6a0-08d971397a59
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848A708E281DC730EA66B21B3D29@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4b0nSyWvCjOOkRuuyRE3JhF+USvLjsUZOyiv00TqLcdQ8diaHwqQ+wisziUIKwLb2g+wQGVn5szYrmbciszzjW9C3rUdHsUi/M3ISdTvQIwUmTtK+QesJge9r9IShJTaIVm/fJCgnzFGB9I1+2NY51+Fneu9UqfHxO1s65Ds4FlvEQAUgp1lWyNIeAL4jZCKYBMo/jgQzgUyNZRT7gCttgS4svpiVS+MTZ5SddZCcuu/M5Q6Wg2F+2uLDggHLrW5L0bdJJALk3XvABPM6wdmwNSJ7xqTJ1JBKBYo6N41nupbTuNx//RsxDLhsJrt4vRNarXq56ggIYnNjRSQzEXiBqOUbZzSIfVr+QluohzreIe3RDpKKw2jbzgrC5FiML34UfnoCeLcnrdOr+5yXvkF0noqxeOikkDem1IfIcxoWCl3LnOrxn8OTuSP/y9Ll8CoYUCS9EzkYy0EXRPq3JC4zc912mTG3Er1nX6Pcj83sYs2AhVVxK/VDcAuyDTuuT2hg/X0TLDcPVsbBcen/JRXprPG5sITyFJddMVOF0xIVxJ1AJJShOnUN6vNXjmy2K0e1h6FiHLD25bngcS94pbX4rwpC9IhzWOsBWHq8WyWoxZwRq5AnePZEnje+t+PrcNGKwisBX1/5h4IokXikaKWj0DWkyvbfq8YgNeik8gQS61p9cxMbqSqrT8M229oCifBz5DYgLQMSKZvueBzgcTz7Wh1SLa8wlqLC9QpnJ8cBu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(376002)(346002)(136003)(396003)(2906002)(53546011)(956004)(5660300002)(8676002)(2616005)(7416002)(8936002)(186003)(38100700002)(478600001)(6486002)(4326008)(36756003)(31686004)(86362001)(6916009)(66556008)(26005)(83380400001)(16576012)(66476007)(31696002)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ZlcjB5WTR4enlGdlhzNkYxRnREN1czYURoMFFFZHdqYi9MVlFyZXJTTEw2?=
 =?utf-8?B?bzdEaGp4b3VZU0NZRTZOaEw2aUZHalBqeDIxK2JjNXdrUjRaT2U1aFhnQTdn?=
 =?utf-8?B?R01vMWhMVno0M0NkckVhZFd5ckd2S2RLQzJkL1BTcXBrdjFGRlFZY3ZSaFFM?=
 =?utf-8?B?L3dzay9sdGRSV0lISG96Ym00NVE4RUJQOFRFWW55cFEyeHF3VlZnK25tNlRa?=
 =?utf-8?B?RGhFMjhJS1NmRENtM1BraWpWWGxkeUdrNzA5VW9mbU9xNW16WEVsZG9zMWZB?=
 =?utf-8?B?aGRXM0huRXlZMGt0WlJoaTM0Wkc0TlhZa3loM3hHVmswOWNEK1NxUVQxWG9o?=
 =?utf-8?B?RFJCTTdUMmF2YWMySXk3MmJFYkxuOTlvdEswT1ZEaHhpVjNlOFdUQk5xNmNp?=
 =?utf-8?B?amdIbXBZMGJybVBtNkZ5Tk1BWEVrUWtzVjB6QWJRRjg3NFE3Q1dJWW90YS9B?=
 =?utf-8?B?Z2wrUmsyNjNrMHl1S1Eyb2VoZnpWV0VjbHZCMDdQVDJGeEZzRlRyYTRVUkto?=
 =?utf-8?B?SnRDdnhQK0tLSldhalV4dGEydlZWaEs3bXpLZDB5WVdoV2Q2bUc2OUZKU2FZ?=
 =?utf-8?B?L0tzcWxuZ2xHejNiVm9kRDJQWGNIajJwTWVBZ0xyNjU5SVIyV0p5VkR3MnM2?=
 =?utf-8?B?cUVsVmxCQjAzdXBJTWVCM3lMaUhhUjFnL05mYWpveGhpaWZqZjRvUm9tell2?=
 =?utf-8?B?MitUdk1WN2J2ZEZ1ak9pN2NMdjkxTEZkcGFlMUpTK3liWFA0d3hpUGNvVGFs?=
 =?utf-8?B?OUViaFcrb29pRmRDR3lCTTMrb2FJY2lBTTZmc2VMZisyWWxtUU5yOGJnTWdI?=
 =?utf-8?B?UkxTNCszenppQUNwV1FEK09HTnk5UnQ3U211WDVHeS9kekpyclpMLzRJd2ha?=
 =?utf-8?B?Q0pLS3kveWQ2R290VmhEeXBFV3lXMENKdDFkanhaNS85V2hENklzYUw2Tkgx?=
 =?utf-8?B?UXhoUWgzN090MUNEV2FxclJnNVU0TkpaRHczdzB0REZLKzZwOE0rSEhzK3Zi?=
 =?utf-8?B?OERCUjRzMHVuYmVyTTFVNHlTVTF6R0FHQVE4RTlpZWdDNWVBMjdtU1lrSWpv?=
 =?utf-8?B?VER1dDZEUEdKYVVDUXArb3ZscDdHYk4xMjJvWkJKRDEwR0V0V2ZueUFlYzR4?=
 =?utf-8?B?aG5EaTIzMmE0U0h2ZXVDODZsTkJpVEJhMm0xTzBsZTdQYkRpeDFnR1J5cm5N?=
 =?utf-8?B?Rm50R1o2bFk1MDFlMlFhbXhzQTBwRUVmRWRBdjUvN3JaQTZJb1l3MjlrUEJE?=
 =?utf-8?B?MjE5M2ZoeTliOXIzbDdwUG9uc1lXOFZ5SFJJaGJHdlcraHdnVGw1dXNpenI5?=
 =?utf-8?B?ZUZYeDc2Z010cjJlcVpyUzJHaG8zM201R3VjNHNNRHlWRDd0ekJ2bzA0SVRF?=
 =?utf-8?B?a3R2VnVvcmNLNysrQzV6TFRLNGMyUjNrM3BMSXlqeVB0S3ZJbW9YQ1ZES1lh?=
 =?utf-8?B?Y2ZNcFAyQWpla2Evc3N1K085ZGRmdmoza0lyYVlrcVBLWG9CSjhDUkc3Q2Y3?=
 =?utf-8?B?QTBjeTF4bDYrMTdTZFBudDlVT0RpNjN6R3FCZTVHenZPS1E1Rnl1aUw2NER1?=
 =?utf-8?B?a1Z0RHpYV3Rtb0NTQkhIWm9LS1p4R1ZWWHhlNFBpNnEwUEw3bWQydUFCc0Jw?=
 =?utf-8?B?RnI0Ty9DZWkxa3p5YVdyNGtQbi9MdVVRbXRoVFhyMjlZR3J6RkZKbGt5L21j?=
 =?utf-8?B?eWZEd0taejF6RG41aEhNb3picURIRm4vQkt3NFJzWVRpanBsSUVyam50QmYv?=
 =?utf-8?Q?AMiuc6YiWdgNPZOf+lt1dhKN79FclEYDKc2gV1k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe7cddd-96ee-4935-f6a0-08d971397a59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:23:13.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/zupNZRPlBvBXbEnA36NKl/5hZztPczuA0cIRc9Bi6daTlmcqlABsSDQT1HxIu8kO/bDQXbxV6baQtzpCLy4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -864,6 +864,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( ret )
>          goto out;
>  
> +    ret = vpci_deassign_device(d, pdev);
> +    if ( ret )
> +        goto out;
> +
>      if ( pdev->domain == hardware_domain  )
>          pdev->quarantine = false;
>  
> @@ -1425,6 +1429,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>      }
>  
> +    if ( rc )
> +        goto done;
> +
> +    rc = vpci_assign_device(d, pdev);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",

I have to admit that I'm worried by the further lack of unwinding in
case of error: We're not really good at this, I agree, but it would
be quite nice if the problem didn't get worse. At the very least if
the device was de-assigned from Dom0 and assignment to a DomU failed,
imo you will want to restore Dom0's settings.

Also in the latter case don't you need to additionally call
vpci_deassign_device() for the prior owner of the device?

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -86,6 +86,27 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct domain *d, struct pci_dev *dev)
> +{
> +    /* It only makes sense to assign for hwdom or guest domain. */
> +    if ( !has_vpci(d) || (d->domain_id >= DOMID_FIRST_RESERVED) )

Please don't open-code is_system_domain(). I also think you want to
flip the two sides of the ||, to avoid evaluating whatever has_vcpi()
expands to for system domains. (Both again below.)

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -26,6 +26,12 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>  /* Add vPCI handlers to device. */
>  int __must_check vpci_add_handlers(struct pci_dev *dev);
>  
> +/* Notify vPCI that device is assigned to guest. */
> +int __must_check vpci_assign_device(struct domain *d, struct pci_dev *dev);
> +
> +/* Notify vPCI that device is de-assigned from guest. */
> +int __must_check vpci_deassign_device(struct domain *d, struct pci_dev *dev);

Is the expectation that "dev" may get altered? If not, it may want to
become pointer-to-const. (For "d" there might be the need to acquire
locks, so I guess it might not be a god idea to constify that one.)

I also think that one comment ought to be enough for the two functions.

Jan


