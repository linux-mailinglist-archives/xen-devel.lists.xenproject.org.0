Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7807F77BC34
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 16:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583694.913978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVZ1H-0004fj-L7; Mon, 14 Aug 2023 14:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583694.913978; Mon, 14 Aug 2023 14:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVZ1H-0004dh-Hy; Mon, 14 Aug 2023 14:58:11 +0000
Received: by outflank-mailman (input) for mailman id 583694;
 Mon, 14 Aug 2023 14:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVZ1G-0004db-0Y
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 14:58:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb03b864-3ab2-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 16:58:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9782.eurprd04.prod.outlook.com (2603:10a6:10:4b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 14:58:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 14:58:05 +0000
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
X-Inumbo-ID: fb03b864-3ab2-11ee-b289-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy9mgw/OnG42oGMyOPEr4qE1dNbTpSsNuSTHOCmpDj10ytRORHKXj3raGm9Sc8PkG79idoYwnj9xrxKJAwuhgfu3o/ceegwAKlULDvT1wBb01AKcVWdWBl/w5Z9CgUPHwJfxvzGpXG3PCyW6aOV8H2FO0HlouEVBFIkk1QJtMMI9KmIprkvJJAnE0lTAJ8CwQoBXwse0fzsE+Vpqx4RMKP3xWlCTJ0cPdmH+uO27XPD/OgK7jjyOPffw8KSNow9VTnwyRaNClX6LWMur839aEmPYJTCdXCGHqexOhML+ca1fcewO5qb0KiTZsbuWPwskt+H8dD4LNmajNKa1+/gJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxTTRlsxaVj3fTFIAi7otFLprYSJ2Iniq0rD1iMefOc=;
 b=Akjs4ERdJZqoJymSeIV3OfXeN5mP35Nq4xTyHcdB1O5+Bccdui4TmHAQx7REhhascJRgspHKIj86qq/cgdsmdNoQySALufG1iVDvOph+zl5Ec8khqi9yGkSQ0PoEdaarl4qxUa7GhcAMvzSwLJvvTsKRqjzTc7k35JIia53x/b8AF/V5JaPFYG0BrGRuUHQAXhDnp4TFQSgrR1bY7v5OPqXNnGdJFAFFXkcEfBrUg8OsO08cUU5XNEkv4q1N9EhxVHpeEp92WT9Xh/SbKoSB9pvHXuR0tvfal7s0E+1j6LssGooF6UPBB1KD8W73VkSzOTin+nUo9HcYN7zdsxxnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxTTRlsxaVj3fTFIAi7otFLprYSJ2Iniq0rD1iMefOc=;
 b=YJ0E34sUWFL683lzPn9NPJlQP0n3XjNV3+Y7qO1yukYUMcbsJBjKsnyzQWO4y5Hmt5OJDhLVeie71O+r3IGbBFDQkcv4eRlJMSL1CmMXq0/gPRvqx+gJ0zdHky71zuhlhbQ7D0xfQmujkN0/YsfoKJd4IAcTkRav3ShnowryM2I0DA14U8EeM9cwWsfREUo9JH5plaN3WJGaSpSQe5uc5d39F9nYpd3ovG3nQUVyHU4c5iDcoteLbt4IOO+dCegvaQM2l9ysEqQXAjNSWCclfdplyLx79x5UUV4+zju7iEoFOEae2KI4LTFDQTQGotb67r5OZ4CNos0aoPQEjQXLFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29d82586-550b-6e9f-f967-a2855d1c81a2@suse.com>
Date: Mon, 14 Aug 2023 16:58:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 3/3] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
 <20230810191312.644235-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230810191312.644235-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f8f858-24b9-489b-2dc2-08db9cd6dcff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80FbvIzNvs7EGO636jkghFelMrONMkQRfQh4leqMlolqYDZxX2Qzo56gpZdep/2mk2Vf1y5Zas6e0wYKoRz1GOv/tPkNT03Sjf8fnMDofRAPXJPlnJBLwXs/b/SghGf9lziHgsvxt+TkkNdmxD3QPSrmEKAF9snSuWjuN3Se3JLi/0RWDiduDjXdvnMd3GoWgw496kbYo0DOmTp98pDbFn+qYEoARfyWTanWYQjJCnXDhyE/XmS70QvTh28uWlHizdr7OO4vltLt3FSc/9vn5k5nciUkjcyXrnlJcQ/pacXOQq/x0hwAfrI6TFzm80iwVYilx+v2njsnWygpYT0M5fqYQRYbiYN2gROlZRBk3MAVaE7zrTFsF+rGmP8ryZyLvSlwDPQA/2Un1hp8l2eeDHzHR6fSETjjKeO+XuKhLph4SbcP+wMzFCB60ht5lAgFnn+coQPm35X1FlO/IzEgPgbUfeky35ULmPMHBhBSsDkYP5HfA3K50YYxPVhpFEUveJiaH5YQa7OXafysiAZjbRwsZQFy25M2MkLmoSxx21AKZ7aayR5wLqEQHR89da9B+mayk0IP852HEHVFrrq38wZuKc8uVATKEZg9p4IhTJc9h+NccMUk3UmlKlQl4KaHifyV1LLZzD/eE0+wNkfIaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(39860400002)(396003)(1800799006)(186006)(451199021)(478600001)(6486002)(6506007)(26005)(6512007)(2616005)(53546011)(66946007)(2906002)(8676002)(66476007)(6916009)(66556008)(316002)(4326008)(8936002)(41300700001)(5660300002)(38100700002)(36756003)(31696002)(86362001)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yjk3SkVRc3NlVm9rYVpCZGVsNjdUOTh2UWtnRzR1cUpTNHlReHBiZUpRbmEv?=
 =?utf-8?B?WEYyYXFOUmFzY1c1RzQ2RVhtZUtseFZndDdSUzlIdkRRYllmU0dVRzJMenZv?=
 =?utf-8?B?MUdRUDdLbnNiNStONmo0S1JPbVdlV3lEelV1bEJrNURTNTVBVm5QVVR3Z3RP?=
 =?utf-8?B?OHlqeDRZKzZ0RjJuSWdhNnhLUkk5YzhyTC9oWlJ4bXNCV3VsU1dvK3A5UnRR?=
 =?utf-8?B?SGVaZUhvMW1UTjBFd3EyYjJjREt4ZHEzcFZpUEdaQzVTS3VKUTFDUER3WWk2?=
 =?utf-8?B?dWYzUFplT0hMUjdQZGdSZ3I0ODRtRmFQZGF6amo0WEFrUXlCTm5uVUs4cnJY?=
 =?utf-8?B?OEtqMlg3M0pSenNmalBaeWRXRFZHUUl2WFEyRHV5RVpNVWJuTWliSjM3MHFk?=
 =?utf-8?B?Y1dGRUttVHVOWityZHFqSzI3N0hFdkVXRVA1dDZNSEhFekFmeWd5Z0NSQit6?=
 =?utf-8?B?aHpQQzZiVFZiOFlDblZudkZvWDJVVnpxQ0dndzhMMjl4L1U3NDdoWlRaZGlR?=
 =?utf-8?B?MXdHRDU5Vm5nTTZ2RzV3OVlvcGZ0b05vL2I3SExhWnA0WGRqSGp5VTJUWXRw?=
 =?utf-8?B?WFQ2cFpWaXlaMUJPS3UrUnQybTg2V1pVa1QveTc2RjVWSC9HbkFQanZCSDJH?=
 =?utf-8?B?VlY1TlRYdXhMRjRvd05DVTJWR09LRFJDaU5WZ0hKUXFhQmd5RW80M2xROFZS?=
 =?utf-8?B?YWhhNFJvRVB1bHAwRG1MdTRHbWcvTC9MMXZLQklqbU1aNFJwK3hQRU91d1Ja?=
 =?utf-8?B?N0VXbi9SMVdjV2FXZEFQQ1JuWlpoQ0k0ai8yeW1KTFE4RUlOOGpEOG0wQUxM?=
 =?utf-8?B?bVhzam5RSmFDVGFZRVFpWkN4cHVFQmtwQ0lFK3VBQW9yKzluU1MzV2J3M0Jh?=
 =?utf-8?B?QjgvaWVtVFdReGxOVVA3elhVbElNaW1GS2EydlBXQitkM3dHYWpaUFI2L1VK?=
 =?utf-8?B?OFBlbFBHenltRlhZSzVkdjFKZU1TRUpCazlZWnlaRXNmZThNdTVFbjIvTnNa?=
 =?utf-8?B?ZzNOK0psZjNEOUVhYzBaajJoS1dzc0Y0OEpiUTBzVVFtT0JOS1lxaFZRZTBY?=
 =?utf-8?B?b0tKdmx1QlVlTjh6bEFUcEtaOCtPOCszZWUrWVQrZ3BlOFgvcEFGSGxGcWl1?=
 =?utf-8?B?SUNNamdlZyswbFdYL2V3WWp4OUhFUDQ5dy9PSmFHWlA5T1NpRXNRM2t5bXRL?=
 =?utf-8?B?eGVIU0FOaGJJdVBZN2sxWFNXT0YrdHd3Y25GNldTOUVnS0ZpZys5SnFUK3JK?=
 =?utf-8?B?a2wzUjdYeDZIK0lqZGh0MVcyU1h0N1IvNi8rZFlxQlRkNXFlKzZRbDV3MGdt?=
 =?utf-8?B?OGdBaFBIUVVTYThFeHZhUFlML2d2NmR1TzdYNE1jN1pmSk1FbmNpZm1tQ1V3?=
 =?utf-8?B?ZDN4cGRXUGV0SzgyR3RSNlNMdk5sdUlWaVNxTzFVc3FVOEw1dWx1RFNIRGJy?=
 =?utf-8?B?YUFYUmZEWWxYR254SDVBeUpVV3B2aWlLOG9KUitzV0g3RzNreWhhbnhNc1lM?=
 =?utf-8?B?cENWTGZzVnVDa0ozb2QyT3VlWWdoQWhtdnc2L0hwcXg1QmJKSDNRM0ZMb0hO?=
 =?utf-8?B?WnZvV2RlK2t1YUR5alI1UExoZ2ZPZDZpUlNoZHJUOE5HRUVyd09nREpQY1pK?=
 =?utf-8?B?K2p3anZCYmZSMVdka2NPWkZqN2RIb1dWTnZOVy9mWUZUNzdGVGZjOWl6UmVn?=
 =?utf-8?B?V2JVS1M1c3hSYzl1NXdTMEc5am9OK0ZuZm43N3hxaWdaNDdWZ1NrYk1CNVAz?=
 =?utf-8?B?RGswWWdsekllR2JQZVJ0dWl4bzVMcTk1VVNEeUxhNGdaREdveWJ0T3JlNDdE?=
 =?utf-8?B?RGVySnZpMmZMQXY1aUZtOE5TK3ovQUppTUNkOTJ2bkVSN2g1czMwMU8ycDI1?=
 =?utf-8?B?MDRVVmlKZTNBUmV1SDdDVWoyN2pWbHhrZ1dFeFpJYWZJbnlqYTJLNnZCMkF3?=
 =?utf-8?B?am1uRXA5OGgrdjcxbFZ0N3ZIcXdVSFNwWW5tek9LSlVpbkxjUjdrTlVlZzNQ?=
 =?utf-8?B?cldwQlRLcCtCZHd0Y1RvMUxCWlBic2VIR2hkUmE3TFgyZkt4RTIxWFpOcjJV?=
 =?utf-8?B?RXpaUHVVQkJUUUo3cnM2UWxnc1lJcWtuRmJxQVlKQUhYV0l3bXpNWUtUREsr?=
 =?utf-8?Q?Dqu+FIFrsrxG5DOv942KPOQ6r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f8f858-24b9-489b-2dc2-08db9cd6dcff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 14:58:04.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpKxZ9AzByoC/ciz5/2VZXlgoJ6evAp6cDlUipY7EP8VX2jnKZ0KZIo1OQWagWi0bi+KND/r2HywJZVynmpZ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9782

On 10.08.2023 21:12, Stewart Hildebrand wrote:
> Xen vPCI only supports virtualizing the MSI and MSI-X capabilities, so all other
> PCI capabilities should be hidden from a domU for now.

I'm not sure about "should"; imo this would need evaluating for every cap
type separately. I'm okay though to take this as a starting point. What
needs considering (and mentioning here) is that there may be (iirc: are)
drivers which depend on being able to find/access certain capabilities.

Also - what about extended capabilities? Don't we want to hide them all
then as well (by returning 0 for the 32-bit value at 0x100)?

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -513,6 +513,36 @@ static void cf_check rom_write(
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static uint8_t vpci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos)
> +{
> +    uint8_t id;
> +    int ttl;
> +
> +    if ( pos < 0x40 )
> +        pos = pci_conf_read8(sbdf, PCI_CAPABILITY_LIST);
> +    else
> +        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);

How about avoiding the if/else by having the caller pass in a useful
value, rather than PCI_CAPABILITY_LIST? I.e.

#define PCI_CAP_LIST_FIRST (PCI_CAPABILITY_LIST - PCI_CAP_LIST_NEXT)

> +    for ( ttl = 48; ttl > 0; ttl-- )
> +    {
> +        if ( pos < 0x40 )
> +            break;
> +
> +        pos &= ~3;
> +        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
> +
> +        if ( id == 0xff )
> +            break;
> +
> +        if ( id == PCI_CAP_ID_MSI ||
> +             id == PCI_CAP_ID_MSIX )
> +            return pos;

Can this please start out as switch() right away?

> +        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);
> +    }
> +    return 0;
> +}

Nit: Blank line please ahead of main function return point.

I also notice that the function isn't really vPCI-specific in any way
(except for the specific PCI_CAP_ID_* compared against). Would it
perhaps make sense to have it be a general utility function, living in
xen/drivers/pci/pci.c next to its relatives?

> @@ -544,6 +574,54 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( (pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST)
> +             == 0 )
> +        {
> +            /* RAZ/WI */
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1, NULL);
> +            if ( rc )
> +                return rc;
> +        }
> +        else
> +        {
> +            /* Only expose capabilities to the guest that vPCI can handle. */
> +            uint8_t next, ttl;
> +
> +            next = vpci_find_next_cap(pdev->sbdf, PCI_CAPABILITY_LIST);
> +
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1,
> +                                   (void *)(uintptr_t)next);

In vpci_find_next_cap() the low 2 bits were masked off. While reserved
at present, I wonder whether we wouldn't be better off passing them
"through".

> +            if ( rc )
> +                return rc;
> +
> +            for ( ttl = 48; ttl > 0; ttl-- )

vpci_find_next_cap() already bounds its loops; you effectively allow for
48*48 iterations here. It would seem better if the ttl applied globally,
and would hence want to be an in/out for vpci_find_next_cap().

Also note that according to ./CODING_STYLE ttl shouldn't be uint<N>_t
(this likely extends to other uses of such types here), and plain int
also isn't really appropriate for a value which can't go negative.

Jan

