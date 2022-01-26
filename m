Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0103249CBDA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 15:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260935.451246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiyT-00060G-Fd; Wed, 26 Jan 2022 14:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260935.451246; Wed, 26 Jan 2022 14:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiyT-0005xA-Bw; Wed, 26 Jan 2022 14:08:37 +0000
Received: by outflank-mailman (input) for mailman id 260935;
 Wed, 26 Jan 2022 14:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCiyS-0005x4-4T
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 14:08:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c1fefa-7eb1-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 15:08:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-1PVFt1BtNA6_bNIUPWKv5A-1; Wed, 26 Jan 2022 15:08:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 14:08:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 14:08:31 +0000
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
X-Inumbo-ID: 72c1fefa-7eb1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643206114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmZ1USskdLzeJF9Wk9MCWDo5Q/qi0RGnSUpeupKL0pw=;
	b=cEfPiGtMSeSEmPSyshphRMdbGY0iSwvQD+j7jfpbVNUskt5XevMwwlvUx7/w32naMZircl
	N1elIk//VQJVBVyWYkJe7+Jc7Pb2wsP4PMmvAlI2y7KJ/m025CQ4BB7cTT5JyzK6q6bnaY
	sf9SUqs8297DQR4d6DnACKWUYpvF1aY=
X-MC-Unique: 1PVFt1BtNA6_bNIUPWKv5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuL50o/WvPkGXRRX7gDcoTf4MvPdUs03VO0Q7NjqqvZwtXMoFKY/ys/7VI4utZ23V5Zsyukl/mEZl2C5SCx7/3kbxw53YFBejuXuvHMMBl/STt/dVvHrjqLuhIEPJxxhAnQQm/BIELm2YA2CIgD5ij//JTB5l7uhHfYRyAq4R+ntGbt+atZbdCtupMTL2UYFbOaumkpyy6DpBXk4bmrvfPL+aGrQiBpGOLsjJSWIHYfmGgQGqe910QWwo8FbRDOGv7cYrq3UXMiBydN4Xbi5mIJS4Xp41CCGxLiVsiaJu15rtk5uNdWelTUm5nqZQJfafv1wTHcDqeVlo1DoAvHIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmZ1USskdLzeJF9Wk9MCWDo5Q/qi0RGnSUpeupKL0pw=;
 b=BiMr9Mck8MYRDmuYKEXdqaMKzXnnbzn0YWCskfONJ/EicbIqkWkJMGWHuaV2765HHWuBAnC2S85JD9TZDjJJMc9qFUI3SdKG/oTXMoiXrD4rgBSOMpKqk1Pbhg6k//ZhpWgqXZhczkmi/mwZMmX6+tpruRMjp/LF8eJTac8U9ZzIWPuSXQKvFMRs80+o1nznPT69SvkU1kx4LzymC+q/q1hFXlzMTaYjB26Qhx93hR6cf+xoVyYUwCP16HE5GcYHCxIR+E1yj+sGqxgIzaFnkVIpxoI/Z2DAoU+TPgPrEBIciZpra6i8KHyRIp5IvyEoqxP/a+cs2KDgu1Ab7IPC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
Date: Wed, 26 Jan 2022 15:08:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220126122648.52275-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126122648.52275-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0059.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac27af11-13a6-4654-d038-08d9e0d554eb
X-MS-TrafficTypeDiagnostic: AM9PR04MB7651:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB76515AD01D66CD44A8D929D3B3209@AM9PR04MB7651.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mzHB33b85Z3/JqhGiWmD6/D4bLq2TBOklcrZt8b7ATe8fcPrYIj7zwu6j3Z5UeFnGlMcCt+Zq6Jj0+cI2MJFlpU+8rPvgZ6foHiCy9Ch60DcJsKLtGu1u+BTQwYwBl2QPMx/kD3du7CcGrXi3uT49GZA3GG8MPPtVXqPpoafGPm1M0Tn2nNaNX957mgSy3Sa+FgDSmZDSpL/0poKaJLnljD+umRaRwEYL6TOFn6p89Q4K10RePTZQL0gKhBjOau5IMqlQbvVONPeW4kZY0DLT/rRlwCuLoj2l6b5bMrbaAlk+LCxPDZFORLG/OXxYE2aUCZ/X18qz/7indaMCZBaMeTwmFfrkRAd2yUuWCagOcIjO4NzOWj5VjA4NqXH9j4OqhIslg2fHkWrTTBOmzE7cIQI6iO30+VN39zeap/99jGunnjgyhK8GBlT3CrElrFm7lFv94QeGoDrBvmRazkQ39otddvKK6QdnebWtDutWqC27ToYYvTeTkl0p31nS0/Ad87uDC3mSDZ0R05qUKNUBDNa6N6WDnzVPC/OTjn2sI46ePdZ2D4m14kzKuDcM4FCbtHCjEvk3FkHIAayLwgf1ZtRBNmuaGpbfeB8YCHD7rUfx1mecLmmHYagyjnhbnIh7s7/rMTmM06bTvRo14C7Wj6x6DPpzqgu7dJbwz5HXALHfes/NCkV0HiJ0iUVc3fzFBCPYZCZFxkLZ6EZreJhBr3p1YVLSQAlWJu43SbsghM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(38100700002)(26005)(2616005)(8676002)(66946007)(8936002)(2906002)(66476007)(7416002)(66556008)(31686004)(5660300002)(4326008)(36756003)(54906003)(31696002)(6506007)(6512007)(6666004)(86362001)(316002)(6916009)(83380400001)(508600001)(6486002)(53546011)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEM3em0yNlB5S1F4aXJGdlNTbXgycnJEcnBsRVR1cnJWUmVLMDd1V1BOSWNF?=
 =?utf-8?B?RGV3WUpjYTdCcnlBYlh0Mm1IbzdhWXlwQlVnODFGK1djQ05yQ0Q4a2k3RTFz?=
 =?utf-8?B?Qm5nMkk3eEpvNGk5WFJVVmtvVkpJSEdEOXJsRk0vZFgveWJIU3BhaGJmejFV?=
 =?utf-8?B?a3J3ZE1oWnZydGM1T3dHMUowNXR2YjJTSzdhNE5IRC9adDU0WUIrY2hqQzg3?=
 =?utf-8?B?RUNIUHgvVm9Cd0tPbC85Z3JpV3FVNDV4SWxaTTVJT0NHZ3hMU21uU3I3TWY5?=
 =?utf-8?B?bmNjQ2hHa3VtOHFSQTFhVXRXZVorMGxWdWFJOXJMMENaZzhnUEcvTW50Yzlv?=
 =?utf-8?B?RjBvNmdDQjNkR1lpN0pra2JWbGFwZzI4T1kydjJhYktaU0RTMS9lT1g2cFpq?=
 =?utf-8?B?Z005bHdwNjU3dDMyS1RQTlZDWWlDazJFS3E2dTZwMW5xbVAyT1MyL3FkQm4x?=
 =?utf-8?B?TDE5aSswNEFzeWNSdmZ2MU1LRFYyQURFeFRDc1IwVndYNm5PS1JHcGVXaWMw?=
 =?utf-8?B?TWlyc2ZvRng1bHUvaEZQcjIyS0xhZ1Y5d2dXQk1BMG42ZWtRdlFOeTh3QmVL?=
 =?utf-8?B?K3ZieVVJdFU1ZnExSVlCTUs3d0RmWWw1SmwrWFBMSVg4WUVDaHMxMGdFZlgw?=
 =?utf-8?B?c0FnK3BraURFVFZuZEpIU0V5NFhTU2ZZK2RqN2xUMXRGOGptUmlNODNKZkxs?=
 =?utf-8?B?akovSUlGR3hmVERTL2F0cXVWR1JKR3BsR2xyR0xscDArQzRJcTBmeVFvVm8y?=
 =?utf-8?B?am5IVjRoMmZvZEoyblU0MTVxRHROVnA5dXJZZC91UHdYbkM4QWc4QzltMEhn?=
 =?utf-8?B?NERBbG1QdHdxVUpBcG1LUmZpclVRTmU1cU1LOU96Vk5EYy9IUFluTDNQcUlG?=
 =?utf-8?B?VjFpanJzQ25wdkFCVzIyUXgwbTMrUTVteGdKZ0RSN0xGb1BzZGZGUWZxbU9m?=
 =?utf-8?B?STJJVE1CRzZwekx6YWlLM0ZXRTVpcmc3eldwNkY3UGJxbVV2Y2dHaWt2d3lq?=
 =?utf-8?B?M1FGRUJQbVZ3YXczV3ZEY200cTN6T2xTb04zeEk1UXV2cFlqSmcrYk5Ld0tj?=
 =?utf-8?B?V3ZyQjFCbW5jcnEyVUdnL3hXZUtuYWF5aUJkZGljd29JVVpuVU1TTElPdjJU?=
 =?utf-8?B?cng5Q3p6YndFZHBSSzdGTThCTjBzcnZiL3ZML2VBS01WdjQzNHJ6U3k1ZWRD?=
 =?utf-8?B?WkdtUFBpTWVqeU4ybS9aYzJ5ekRRYnZYN2l0VXRBeHo3K00wcTRydHRDWCtL?=
 =?utf-8?B?S3VjdFVkR0w1R3Z4ZWt4b3VrSkhJMHJkUFVHcVRJMnBPZEtjNnJUSVpuOFZF?=
 =?utf-8?B?aStMWXpSN1VEK2owY1VpOEsxWjJhbUpEZG9JL2lKU3hoMy9MK2FXZk5VdE9v?=
 =?utf-8?B?M3hCcWpGcUltOTE4SGhTYXBSa2kyQVllL3NFbGxaS2xLSzhXQTYra3J6TkxX?=
 =?utf-8?B?a1A5aW1vZzgxMW9ldHNKbTZKaWdBT0MwM1k5L0Ryam00QXg5aFF4K0hLU0dH?=
 =?utf-8?B?SWhyWHB4WXRSNkx3cVlLRDNTSzR1dE44YzMxeVVUNmsyY2syWjc3UHo4aGI4?=
 =?utf-8?B?Mlo3aldlZ1A1RnQrcExackNnS3dPenpsT1NnTXp4aUpRdHlJalVodVVJVER4?=
 =?utf-8?B?TVUrUmQrNVZhTDZPZnVqeUNoRVgyQkVpekxQZ0FzTC82bGh6Z3hWNmVrcmZk?=
 =?utf-8?B?RFRCUmxsTHhyU2x1c2hhTnNhYmZLUEJXcjlieURSVEU5TnhtS1VrcmF4N1Zu?=
 =?utf-8?B?Z2xhQXpiSThWSDcySy9mMXRHdVE5SWw2cGJMSngvNzVNUDRNaEZ1TmNlVkFn?=
 =?utf-8?B?TEM2dWtaK21MTVk1c2ZRQXVwTnpPNXh3RUZlTlRQZThpdzBpQ1VkbVpuRjdx?=
 =?utf-8?B?WWc3MXNwWlhaUmpSSXVBQjFOd0lma3M4N1BYMUlSQUFsNmh4MVhpc2RlMlJM?=
 =?utf-8?B?YU41UFZPL2NUbzBqOW95VnJPd2hNbkNlMjJvV0NuWDFyeHZOaGNTR3BPZzhN?=
 =?utf-8?B?clE1VjNVckxBZHNNditSWXBvRDN2dnFxQTAvWEQvUnZVOVBlWHVMeU9BYkdI?=
 =?utf-8?B?OE5ndkVsNmdRVjFRc0R0c2UzcTh5MWwxTExhVlE0aGJFNE9BYVdiZFJla1ZQ?=
 =?utf-8?B?UVdJOGlvVHQwV0t4T2pRVFoyRlZHYlY4NkpOL2FuUnBLdkVRY0dBTGdCNGFD?=
 =?utf-8?Q?XF2L2s//rwf/lR2w2VkLUfE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac27af11-13a6-4654-d038-08d9e0d554eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:08:30.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6K03TpZbSBWLLAeeXaTIuUKPLQfm1OHLEz+UhiXwAiqKBJyMwgv3iHdEDi2UX4QWxzt759h7vyNTh/lCrCriA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651

On 26.01.2022 13:26, Roger Pau Monne wrote:
> RFC because:
>  - Not sure the best way to implement is_iomem_range on Arm. BARs can
>    be quite big, so iterating over every possible page is not ideal.
>  - is_iomem_page cannot be used for this purpose on x86, because all
>    the low 1MB will return true due to belonging to dom_io.

I don't see an issue there - if you were to us it, you'd end up with
the same scalability issue as you point out for Arm.

>  - VF BARs are not checked. Should we also check them and disable VF
>    if overlaps in a followup patch?

Not sure about "followup patch", but once we support SR-IOV for PVH,
that'll want checking, yes.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -479,6 +479,26 @@ unsigned int page_get_ram_type(mfn_t mfn)
>      return type ?: RAM_TYPE_UNKNOWN;
>  }
>  
> +bool is_iomem_range(uint64_t start, uint64_t size)

Might be nice to have this sit next it is_iomem_page(). And wouldn't
at least "start" better be paddr_t?

> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < e820.nr_map; i++ )
> +    {
> +        struct e820entry *entry = &e820.map[i];

const?

> +        if ( entry->type != E820_RAM && entry->type != E820_ACPI &&
> +             entry->type != E820_NVS )
> +            continue;

I think UNUSABLE also needs checking for here. Even further, it might
be best to reject any range overlapping an E820 entry, since colliding
with a RESERVED one could mean an overlap with e.g. MMCFG space.

> @@ -267,11 +270,74 @@ static void check_pdev(const struct pci_dev *pdev)
>          }
>          break;
>  
> +    case PCI_HEADER_TYPE_NORMAL:
> +        nbars = PCI_HEADER_NORMAL_NR_BARS;
> +        rom_pos = PCI_ROM_ADDRESS;
> +        break;
> +
>      case PCI_HEADER_TYPE_CARDBUS:
>          /* TODO */
>          break;
>      }
>  #undef PCI_STATUS_CHECK
> +
> +    /* Check if BARs overlap with RAM regions. */
> +    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
> +        return;
> +
> +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
> +    for ( i = 0; i < nbars; )
> +    {
> +        uint64_t addr, size;
> +        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
> +        int rc = 1;
> +
> +        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
> +             PCI_BASE_ADDRESS_SPACE_MEMORY )
> +            goto next;
> +
> +        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> +                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
> +        if ( rc < 0 )
> +            return;

This isn't very nice, but probably the best you can do. Might be worth
a comment, though.

> +        if ( size && !is_iomem_range(addr, size) )
> +        {
> +            /*
> +             * Return without enabling memory decoding if BAR overlaps with
> +             * RAM region.
> +             */
> +            printk(XENLOG_WARNING
> +                   "%pp: disabled: BAR%u [%" PRIx64 ", %" PRIx64
> +                   ") overlaps with RAM\n",

Mentioning "RAM" in comment and log message is potentially misleading
when considering what other types get also checked (irrespective of my
earlier comment). (Ftaod I don't mind the title using "RAM".)

Also please don't wrap the format string (also again for ROM below).

> @@ -399,8 +465,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>              break;
>      }
>  
> -    check_pdev(pdev);
>      apply_quirks(pdev);
> +    check_pdev(pdev);

I can't find the description say anything about this re-ordering. What's
the deal here?

Jan


