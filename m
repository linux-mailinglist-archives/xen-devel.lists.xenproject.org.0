Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AFE431621
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211973.369684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPu4-0000FB-QV; Mon, 18 Oct 2021 10:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211973.369684; Mon, 18 Oct 2021 10:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPu4-0000Bs-MO; Mon, 18 Oct 2021 10:30:00 +0000
Received: by outflank-mailman (input) for mailman id 211973;
 Mon, 18 Oct 2021 10:29:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcPu3-0000Bl-Ef
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:29:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57139c96-2ffe-11ec-82d1-12813bfff9fa;
 Mon, 18 Oct 2021 10:29:57 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-kaGPccwlPDGIX5gzpKf5Rg-1; Mon, 18 Oct 2021 12:29:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 10:29:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 10:29:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.10 via Frontend Transport; Mon, 18 Oct 2021 10:29:53 +0000
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
X-Inumbo-ID: 57139c96-2ffe-11ec-82d1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634552996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRDaHiiWyXwCU/PSNaVBX4fynCkDXWAM+DosMTCygrk=;
	b=kvcwlW5lbswyVabXszrsYPIF8fi174CNnNEyuEUG23GXYZCoRSwCXve4q69d0XTJL81KZP
	JlVG/LMpbWC/FgeHR66D1yiVgUiIcifcqjzbi6CvIMQWvkMSOGy0F3gNA6bHbJ6e/mHCos
	HrNFOi2UAkZsbijzNJpUe1IrNr5BSCg=
X-MC-Unique: kaGPccwlPDGIX5gzpKf5Rg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3PIvXqHciQqn9tjM8EogjRkyMBmb/6D+wtp0fHlRFpNVndh/QG8329fwiA6zMnK5ytHIntUFhCAl0JsEXKbNaMHTmgNtQgawmtj/NHW5rZ1gghpTeqApq0ryYzSPGAMlkZx4zC0M2b+mXhxo3Xr5syhbxSR4DNKVXVdDerdy2n+T8+SGNLibfZT2f5t9ayqqz9NA2Jdjs741ecKaHJnD5w7MK2wZVZdAFxI13LP9XMcszyKQAvOActMZEvajF9Qa2s8Jww46nD1CV5/LSYPqLpf7WDLCBmROsfY4wAeY3bdmUurd6uxD+R3ShoNPoig2vdgX/RNQ8WR5CljSGO0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRDaHiiWyXwCU/PSNaVBX4fynCkDXWAM+DosMTCygrk=;
 b=WHIhcdL6E9r2Cg12s/rGu1fImWuLs2x/yS2r9rzkPFWISaUtJFzh6jEtinoXX+tCpXPR5+4OlztPSXWvxuzSHKiRU8noRrclgNhzoC0ABl6WxoOSCWlqb+YSc4TarwxGfXDlJzBbUs5cq+FmNOysXiAGjdieA9JR3fgGPPzaMlpAIM80A6+zsaaZYI96OWQ0JYgfsFUtyCTJiDBwXBYpeu6nztk+kbUgPWkZfpuUFF79kdHwl2ne4UQNsIh4j93YQuWDRdfZmXBU7jCJQxQQSmrhWHcI5DNpLn2CpawBj6vxzjOogHKx7hd5vf8hcBQX67qtGKw9Xfv6de/dElfxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
 <FBC4FA6D-AF07-437A-BD81-52708B139070@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c99e635-9509-b078-2285-48fb6fb91507@suse.com>
Date: Mon, 18 Oct 2021 12:29:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <FBC4FA6D-AF07-437A-BD81-52708B139070@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c985eaba-2975-49ec-db48-08d99222392c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61746F39FFB853945E795E8DB3BC9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ht16229mhZfNh3Io3b06qX5SnlcJEPuyRYs+oRGLtCdu4ZFLY/jFXKdQgk+CBpGX7psPx9ipFJtP2eDDwIIYR3POfzpp27UWheB24I/pDkS7+Ei0InMC09qE0bvdnBgzDdvoa/i6GFQLFOkZzQt8Er0RFYkZ4wiS7vTAZKnasUbw14Vyu7OBpizR9Eu4VVqHEt/84DzADVmfenRSPDcBBhvq16cn3GM3k2r7qqjPnNRJGfxEsHFzuz6D90/IADf3nIHLVQsPiinvlt+t1T19Ldzc1HPrGMOMNoR7p9AYmxvc/tYRxTTWzHdrqh7GObDdnFZmH4GH4i0IToQrjbSZDPhLFryhbAZDsPzU8TkzfifYUiF8jJ1OTw/tfYswwonwF4CmewhnWE47/jDMoyin7ZkQ2FmiPoQ280wWBBvnvISYle+Bc5pBiUrfvFd82kKfLHvJF0JXB+kEZhaClgCU7X9enQGvrykTYoLk5oqBXOPNSnSIkwkYMsRDipyvLSrZk6x91OF2F5UCADKiT+14Wfcd0IZSvr6cAsm2RWMjRf2LZXeKF1oH1wxna1IRlSjaht7Wj365ywjr7OA8cklyuiIAZbAvZuyTp1ujm53miXI56ZkNp11fMhPDyTnLlTaSur9asAlFV/Yo+Q1LO1ZELXQUbDvyvbDfFiV6LRemYhryK6tN05ogruEbcRrCWhvW5UUE4aWS6PO5cADpaxp3GYwOnrZ96hXJjMFABATSEDmgHM2ab2zC2ZSucJhTa+vVFzxg0i2XkJKh8K1HxQe7Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(186003)(86362001)(26005)(2906002)(31696002)(316002)(110136005)(16576012)(83380400001)(66946007)(508600001)(4326008)(38100700002)(6486002)(956004)(2616005)(36756003)(53546011)(8936002)(7416002)(5660300002)(54906003)(66556008)(8676002)(66476007)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkFZeDFTeVZuOENIaFR5bm1lbjJOcnJGYS93OG1YRFR5eGwxSkxGdEEvN0tC?=
 =?utf-8?B?V1VrdStlcXUxU29NdVJ3MWhoN1Z2aVpuQlFQdElVNXRKOFlkckQ5RC9hZ1lp?=
 =?utf-8?B?UnFQL2VOSlVIbFVVT0V2c3hjOVVEeEw1dTJ0aEExa1B5M2tlaThZOFp5bTU4?=
 =?utf-8?B?ZE10S0x1Uk9IVVFZZmtDWjAyMEFWWDUyUWcyZ09pK3YwdXBFZGpxNXJuTzJt?=
 =?utf-8?B?SURtdnpCWEF4SnNXQnNNRGYzbVBrUnp2Y3ZYNy9tRmhrTHdzN1VHV3VDblJS?=
 =?utf-8?B?aEVYaHlMUVNkalYzQ1Yvd3YvN29pcVNhRXVBNENxVmtwZmQvdlA3WndMUnF6?=
 =?utf-8?B?NURTN3pGakpETnA4SDlmTVM1THl5UU1EN0Fra0ZJS0V0T1dYQ3lZV3VNOHEz?=
 =?utf-8?B?ejcxbXhuWndGSVNwb0ZudDlQUWFBK2RPMVV2TXY4bUNRdFh3THdEeXh5TDVv?=
 =?utf-8?B?cnB3OWkvS29IbXBLQzBRU1VVclNxbzVFRzhoUytiMS82VENxZy81QTRRc1c4?=
 =?utf-8?B?ZStDNFAvVG1ERC9CcGR6MmVLNDQ2bE9rNWlYaDU1Umdjb0UydVh4YU4rMFJC?=
 =?utf-8?B?blY1Z1FqNDJXUDVyMTRBY1VQUVdNMTZPLzB2R2ZCMU1XM2NmbnRtNmM4NnBp?=
 =?utf-8?B?a01Ham8yL3M3S2FvTkNLeTRFV2JzRFNJazJQZjV6TU1GZ2F6Y2pYcFVQVGFV?=
 =?utf-8?B?VGdUYXk3SnFMaTFGUERyMHJmaEp5ZUNtK2gySWUwczdZRmMyOFg5dGw0bkJt?=
 =?utf-8?B?RUx2YkE3Unhjb1FkeHZZN29jREJZdTNaQlBMNUxKYU54VmlpekY4SGVyZUVL?=
 =?utf-8?B?RFpmZDd2ZUp4MEZMNGhua2c5ZHA3MXFNcGZaYUtaZm5ha3l0YmtpcUhzQTZn?=
 =?utf-8?B?aGJNNWlWTFk2ZUxFUWx5RHhTMFpFWGJ6WmhodXJjdWl6UGVmUm05VGMvcitx?=
 =?utf-8?B?SCt3TnczNzNvS0pCaTI2RkU0d0sySUVyRUdaZW5IR0RCcVlPMWEvM1ZZWjJa?=
 =?utf-8?B?aDlEbm1vam5hbmVCV0tDOHNFNzNTR0J6TzBleU1xcnlBTHhlRTdjNmNnZXpL?=
 =?utf-8?B?cmllYUE5MmNoTkQySlZkS0Vqa2I3OUNCYWFDSkJsQ3owRjVHMENlbVFxOE5m?=
 =?utf-8?B?eU1iaXFZOEx0MER1U0o1VTE4RFl2OUY4UE9HdTgrckZpbG4rYUp1VGVnTHhw?=
 =?utf-8?B?RXp6dEdtYlIzTkJiZmVTYVdoWm5YS2RnUk1YYUpBWVVlWjBnVmxNR1hFM2c2?=
 =?utf-8?B?RnE0U2RSSUhSdG5Db3pJVDFzRjBCbkFEUU5uV2VVdlNjQldHampPVDBKaFhR?=
 =?utf-8?B?eURBWlg4VDIxK003OE55TWloVHlZVnJsejE3T21vNlp4QkYrOFZIdHV4RkFL?=
 =?utf-8?B?cFk1VmRsdmRtbUFrYzhURkNCV0ZBTzQvbWY5UUhkRkxpVVV1R1ZGL3lWQXls?=
 =?utf-8?B?UFYyNUJnc1dvTDEzc3didGtXTG1HNXdEUjh5Zy8xVW0wdkowTFErK2JiNmNB?=
 =?utf-8?B?RGl6a1lORm1aTjdCVmM4SUVFbmJ4MGZnaUVoUVN4a3FyWk9kVmRSaEdPNVla?=
 =?utf-8?B?ejZPLzhCNjNFUVV4MmlRN1BqWVVrWU5IeHg5R21lNFFUVWxxVXFma2hZUWpW?=
 =?utf-8?B?RXZkaDA0VDV5MThCYkVHNUhCSHRQQ2xjalZmSFl3VkdUSlV1THMrYnhpVG10?=
 =?utf-8?B?STU2ZEJqWFNoS2pBUmFVNWZ4ZEJmN1Y4VkE5QklkR3lSaXA0WmhIejNYMDRs?=
 =?utf-8?Q?2TDLtTk74ElJn+2oykhAHtwigImYOSIlh2k+Gvy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c985eaba-2975-49ec-db48-08d99222392c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 10:29:53.6949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOI3Aq6crGj11rbT3PiXREppclu2lqS3imV2FoBNExdDgUIx2pNKpP9Eo36kaMjk00AcYqOknfE6aZois+LQ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 18.10.2021 12:11, Bertrand Marquis wrote:
>> On 18 Oct 2021, at 08:47, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.10.2021 18:51, Bertrand Marquis wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/arm/vpci.c
>>> @@ -0,0 +1,77 @@
>>> +/*
>>> + * xen/arch/arm/vpci.c
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +#include <xen/sched.h>
>>> +#include <xen/vpci.h>
>>> +
>>> +#include <asm/mmio.h>
>>> +
>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>> +                          register_t *r, void *p)
>>> +{
>>> +    pci_sbdf_t sbdf;
>>> +    /* data is needed to prevent a pointer cast on 32bit */
>>> +    unsigned long data;
>>> +
>>> +    /* We ignore segment part and always handle segment 0 */
>>> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
>>> +
>>> +    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>>> +                        1U << info->dabt.size, &data) )
>>> +    {
>>
>> Here it is quite clear that the SBDF you pass into vpci_ecam_read() is
>> the virtual one. The function then calls vpci_read(), which in turn
>> will call vpci_read_hw() in a number of situations (first and foremost
>> whenever pci_get_pdev_by_domain() returns NULL). That function as well
>> as pci_get_pdev_by_domain() use the passed in SBDF as if it was a
>> physical one; I'm unable to spot any translation. Yet I do recall
>> seeing assignment of a virtual device and function number somewhere
>> (perhaps another of the related series), so the model also doesn't
>> look to assume 1:1 mapping of SBDF.
> 
> This question was answered by Oleksandr I think.

Yes; I continue to be sure though that I saw devfn allocation logic in
one of the many patches that are related here. And I'm relatively sure
that there no adjustment to logic here was made (but since it's hard
to pick the right patch out of the huge pile without knowing its title,
I can't reasonably go check).

>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>     if ( !pdev->domain )
>>>     {
>>>         pdev->domain = hardware_domain;
>>> +#ifdef CONFIG_ARM
>>> +        /*
>>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
>>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>>> +         */
>>> +        ret = vpci_add_handlers(pdev);
>>> +        if ( ret )
>>> +        {
>>> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>> +            pdev->domain = NULL;
>>> +            goto out;
>>> +        }
>>> +#endif
>>>         ret = iommu_add_device(pdev);
>>>         if ( ret )
>>>         {
>>
>> Upon failure, vpci_add_handlers() will itself call vpci_remove_handlers().
>> What about iommu_add_device() failure? The device will have ->domain
>> zapped, but all vPCI handlers still in place. This aspect of insufficient
>> error cleanup was pointed out already in review of v1.
> 
> Yes a call to vpci_remove_device should be made on the error path out if
> iommu_add_device is failing. This should also be done in fact in 
> pci_remove_device before cleanup the msi.
> We will push a patch with a proposal for a fix for this.
> 
>>
>> Furthermore already in v1 I questioned why this would be Arm-specific: On
>> x86 this code path is going to be taken for all devices Xen wasn't able
>> to discover at boot (anything on segments we wouldn't consider config
>> space access safe on without reassurance by Dom0 plus SR-IOV VFs, at the
>> very least). Hence it is my understanding that something along these
>> lines is actually also needed for PVH Dom0. I've just checked, and
>> according to my mailbox that comment was actually left unresponded to.
>>
>> Roger, am I missing anything here as to PVH Dom0 getting handlers put in
>> place?
> 
> From Roger answer I understood that it will be needed (in the future). 
> When and if this is needed, the ifdef CONFIG_ARM can be removed
> but this would change x86 code behaviour so I do not think it would
> have been right to do that in this serie.

I view this differently: This change {c,sh}ould have been broken out
into one changing x86 behavior first, which Arm then would simply
have adopted. I don't find it unusual for issues to be found in
existing code when making that fit for another architecture. As a
result ...

>> Of course as soon as the CONFIG_ARM conditionals were dropped, the
>> __hwdom_init issue would become an "active" one.
> 
> We will push a proposal for a fix for that.
> If I understand Roger right, vpci_add_handler will also be needed in runtime
> on x86 in the future so maybe it would even be right to remove the flag altogether ?

... I view these as going hand in hand: Removing the annotation
altogether is the way to go, yes, because on x86 the call will also
need to be made.

Ian, considering that PVH Dom0 is still experimental on x86, and
considering that the patch here was committed prematurely anyway,
would you be willing to release-ack a patch dropping the "#ifdef
CONFIG_ARM" alongside other necessary adjustments here, provided
maintainers have reached agreement?

Jan


