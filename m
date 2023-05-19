Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF27091E7
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536763.835431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvkN-0008Pt-9m; Fri, 19 May 2023 08:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536763.835431; Fri, 19 May 2023 08:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvkN-0008NK-6D; Fri, 19 May 2023 08:45:59 +0000
Received: by outflank-mailman (input) for mailman id 536763;
 Fri, 19 May 2023 08:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzvkM-0008NE-69
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:45:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c4dc22-f621-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 10:45:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6792.eurprd04.prod.outlook.com (2603:10a6:20b:dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Fri, 19 May
 2023 08:45:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 08:45:55 +0000
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
X-Inumbo-ID: 91c4dc22-f621-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+bOzZdLdyXKzqNbOthwJs0ikvle9iktmbN/c43l0P0yMk9kBAnLJfHA4KeGh04cbVidLIxOHQ+uHGsVnjCmJoJYrMd9w2ArcuMH/JfjP3TnAq9ze37NS+4NRk3Ug8XDCT5wiFTZXF/V/SJbp0gmTpWzQP/CrjjM++eeG+gXtS7z5QQpSoRFzOka3q81nwvMyHBip/6jjjyqXy3yFrQU4NAW0eh3AfMdEc+H/EnyzIc9kv3tYrLtm0rFn767swew4fgTYoH1lSgg5WLXGdG+IGIiLa6OILhoEd99qKgMFCA7lQd+TZSE/xIu3vht1nuvuLd0y25NNddCi8UAsQshAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8nyHlQZBJinqOl3PekLKCUs6CLB2n9F7EIZ9hgRSzE=;
 b=feoUbBPxjNNbMVy0xisEqy/Jp5fK6VwKLY1lK3dZHMyY7llXIDLEWx94tWKR+Qak7ejNIdR+huAJsLagNxiqNg6DbHsbiW5SOnahu+VpFo/TJOCwwSf8FxesAan2Q8WG4NNVsAb2XQEvCYxA8JCU4pAwnLkPNhKTazRRdjmBu69e1+6epzn2tLrzW56b3pmM+07b661F02qOYyTfpyr8kUyig6ekhodmSjy4EtQ6x29HssRRzzfvqrciYxdFiePaVIAA6BULruomL3xBL9HFwFK1cfAELPoT61jpnDQ9SracVkirx2oN5Ipk9E8/uup7blEBWd5zWHVZV096C5aMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8nyHlQZBJinqOl3PekLKCUs6CLB2n9F7EIZ9hgRSzE=;
 b=laEqbydaKllNSgTQBcgt6oUrwkD1pyWrUCHDqr5mVLRBcrxb9FU94qmxfTFtPVnR3vixx9J497xe8mZ6pDChWFPw23Xu1nhSeX0dZlyY57wt4PvHhyBbp0fM0zeT4/bpb1TkunWJs/w5dwY2Qa+ZOMSEelpeKANJo994Q9t+oyxhbM7OGWgVQbU/NdVukTnt0AYsFF90oZusVE+LjB8wUR1bMzB3bmfrjV7tDRKcdSw+F8srRkEiUuqdlYzCO3rmUnMEBYoU+NAcJ4iNXxFXP+dVihYjy9aklHpfMCwTJxc3rljJB1dUZSOMhM6dwl3mCarnQv9Zy69Zugb1kxrMSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9618948-d4da-cfea-ad80-d130dc50d3cb@suse.com>
Date: Fri, 19 May 2023 10:45:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 3/6] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
 <20230518210658.66156-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230518210658.66156-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6e522c-83d2-4f9c-64ae-08db58457553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p0tUdzLXv7ZiMJvtc0mFzA4Zo9LQ+j2tq1xQN1h+1GYJMAtLaiK1KSLinp9EZvSTQCOrCBwcsrP1nHdrBQjFS2615FPppCawPL8PB4kHeOa14JlpNX9LhEqaBK3UI0NRLq9EU5VVXHKMJ03C9PDVs/jk15rnRM2oIaMQ/F1LgL0S307Xya53Mew89BstkYCbVqaVbQBls/B59w27OH1VyBU97ekLsjfzBe8G9+7sDUsQ1yVHP/DDuHq5lAbDAMxmRKhFPqWalp8Xn3vv7HXem4TuAylVnl3qIHpbBZB3FdJlNn693gRgCnvITWp2KnVkEGKz4p2J9cpHeGVYlgtGSkfbOVvXRxxD/fEdZReyCGOfBn6UcDnrOagcB/niJ6A9DnpRGqQ6msN3S/9J34jEqYyjdiqEyGM+jyjr6q8QLu/2yftv4TglXtchTNIoryW1dX7gav/0KbuVDb5YjA1tL4hH+OJ7b2xZ/QhUpjbvdGrVq1phpclHbxY6aayrTf9N314roz8x7cQsd/+qi3YEL+R5p9accH6DnbuZVOYAAjN8VZHUEjT0R2v0mcUmoBFaTd7RQvJKEM/1AurhL9EubhoXzYp8trjqEE0imDJo32sz4fUcDxfzQq05P5yF7Y9KrWgevsRJ5kNbJssltkQn6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(366004)(396003)(136003)(376002)(451199021)(6486002)(41300700001)(53546011)(36756003)(38100700002)(6506007)(6512007)(26005)(5660300002)(83380400001)(31696002)(2616005)(186003)(2906002)(86362001)(8936002)(8676002)(6916009)(4326008)(66556008)(66476007)(66946007)(54906003)(31686004)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGltcGJOTllKY041bnF6WXNjUXZLZGRudkpyNnBpVnQvdVF6OHNQZ3BxbFdv?=
 =?utf-8?B?WHpWNjE1MzZtTmVaTGtlQ1pNSUN0Ym9TNnFWZjNZVWp0SkxrRmFEeUIwc085?=
 =?utf-8?B?TzVnTUhwbEFxaUhJRmxheHRqd0lWeTlrai9DdmpNQzgzQ2xSYWJIRUNGSk9D?=
 =?utf-8?B?emsyWCtuQkxVeGlBdzA2SGR2ZWhHOEZyYWFWM3FFb1FuY0l4KzVTb3hYdTBS?=
 =?utf-8?B?V09aV1BtdDBoRGdDSjltckxHV1lUNUxGcHhaOWFGL2VtcVJrWHoyMW1XVnpL?=
 =?utf-8?B?RERDU1NVMUhHMjdVTVJuUTkxZitZaDRscDBYOUZISEtlV0FWUUJLUTlqc255?=
 =?utf-8?B?cWZuaVVpSDl4MEYrNnhnMlVpSGNZSUhDRUw5ZXkrWDJTcnR5NzVPSHJ2amF3?=
 =?utf-8?B?NTAxb1V6SHlGL0ZTRlZJVE0xeEtmL2hJUFlYUllLR0lvb3hsMjVqVk5hR2Q0?=
 =?utf-8?B?TjA2V094QU5KNmxjcmxjaTRqdGphdm1HV2EyR3pIODNFSzRXSjlnRlBuUTFs?=
 =?utf-8?B?Y0R4eW0vcDRKYnpCZm5VNmRhNWFrSllGcUw0ZUFTSnBLdExGSERxTXU4eGdQ?=
 =?utf-8?B?bGJ0cjl0c01ERWNScWFhbTZnbHY3K3RaMWFxVHBIeHFVUnJDTFdFTUtNQkRp?=
 =?utf-8?B?cU1GVndYUTZ0aFE4aVJCUzNYVjRhcXA0TjhlR1Z5NzRBbHc1bjVTREFqNEhz?=
 =?utf-8?B?dDE2VGpiNDBmaE9EMllXa0VXeW9uc1lCQkdvdmtPa2lGajBnMHM3Z1ZVcGsr?=
 =?utf-8?B?Y1BKL3Z4WUtrVXJqSG9IT2k1RXNaRGdKcEMyampEL1dYcWJQQkZWWktzOCsr?=
 =?utf-8?B?c1ZnaDk5UzhaYkVVVG9NWFdVQjRwUWc5TmFkNlFoOTVydmxxckwySkt6UThk?=
 =?utf-8?B?UzJ0MlRTdUJYZlNUT3U5dElvdEdFTldrd0ZTaXAxRUdySGp6a2xaZk5idVNv?=
 =?utf-8?B?aXBDVm11c0VXQ1VOMkpsbUY1MmxsWFBSZHZib1Y5VGg1eEx5WGR3b2VYRzBm?=
 =?utf-8?B?am8yV3VPUXc1bGNwSFRIb21ENTdMdnE1RmJOUjladWRJRFRGWXZIQkJkdGRY?=
 =?utf-8?B?N2UrckE4SjhOWWh6YVlGYlJpUXB5WEx4RnFZTXJzZC9MN21KNGNQWDdZcHdR?=
 =?utf-8?B?bzBKUWp4bGtoOTRSTVVmK3MzS2h3NHEwbElFa2pjdjF5bXMyZHJvT0ZNNnBB?=
 =?utf-8?B?bE1NVWREQW4yTTc2ZDR1UlVxS2ZuM21sWnltbnhhcWxuL0Q0Y05PdklGNUox?=
 =?utf-8?B?R0xvQStuamZHZDJPVC9QTEVRNmNZYm1NMkkxOHV2Yy9qQTFCd0EyRlk5blZV?=
 =?utf-8?B?cHpNanBoUHhhUTNNSGZ4RWtIbUpjOW9LSmFvbFhFcXFBQ2NkK3NvSmYrS3Y3?=
 =?utf-8?B?Q04xK0ZIQ29wTWR3OE5HVktsL1U1QkFaN0dsSTZsdXNuMFRoM1NsNHpmbHd1?=
 =?utf-8?B?NjA1dWlscjBacjdsazBtdzlJT2J3TENkam1CTnk3WmFXYXE5Nk9RZXFXV2E5?=
 =?utf-8?B?YkFMTmhuWDJ1N0d6cWtoQnB6TzZEdm4yS0NBSEZ0d0IrMFlUWExHU3A4b1Fo?=
 =?utf-8?B?VXdvMkZnWnMzOTFHZDJTQ09EekhKei9lTE1HZjVNQTM5TDROcU9UTzN3OFJC?=
 =?utf-8?B?QTYzOGJldG9qSzYwNGhXY0duc3ZuVWQzLzREakNCNmM0QzJxUVVtMnJlK1JE?=
 =?utf-8?B?NHBXTFdmWXV5OWZnVHJrWU9KYXNQUlh2NkF3UkhYbnh2VTVBSElGKy9DUWdh?=
 =?utf-8?B?S0NxUC9iODcyRmpaOWZXZjJ1TG9mV1hNaWJkL2M5NEdCMzBDNjV6UUlMWWdm?=
 =?utf-8?B?aXAvQnpUWTM2QUdnSlpvSTBQakpEb3FmTUxFbjFSN01id0luR1JrMWY3T0xN?=
 =?utf-8?B?K2FjdmNYb1NsNFJ3WW05anBpaWRoZ1NSQjduQ1ZmNk16ZVdXRnJaSWVLekNH?=
 =?utf-8?B?THdIM2IrVHdZNll6dmtnbXlWZWI0MjdqQkxmOTliTmVwS1EzKzZOQjd5dnh2?=
 =?utf-8?B?ZEU3ME1ZMkhrcjZsMDhKTzN5aXNONDE0Q2x4NFAza29ELzRxQU9GaUx2WmVC?=
 =?utf-8?B?NmE0TmxraTlMSGVaem9TM3I1UEhLcHZFM055dmVoWEZSTlpnUVN1NjI3eXBN?=
 =?utf-8?Q?lVAZdlt1HRNUH7A2o0fUEijQd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6e522c-83d2-4f9c-64ae-08db58457553
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:45:54.9310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wJnIFbRX9gnaULqI4rL4WJUa4a9Yz3Za4MNX3kitsllgMweGY/zBlTVebTIy5Sm9bMV70/8U1eeOQta+K6DKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6792

On 18.05.2023 23:06, Stewart Hildebrand wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -26,6 +26,7 @@
>  #include <xen/spinlock.h>
>  #include <public/domctl.h>
>  #include <public/hvm/ioreq.h>
> +#include <asm/acpi.h>
>  #include <asm/device.h>

I view this as problematic: It'll require all architectures with an
IOMMU implementation to have an asm/acpi.h. I think this wants to go
inside an "#ifdef CONFIG_ACPI" and then ...

> @@ -228,12 +230,25 @@ int iommu_release_dt_devices(struct domain *d);
>   *      (IOMMU is not enabled/present or device is not connected to it).
>   */
>  int iommu_add_dt_device(struct dt_device_node *np);
> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
>  
>  int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>  
> +#else /* !HAS_DEVICE_TREE */
> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
>  #endif /* HAS_DEVICE_TREE */
>  
> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    if ( acpi_disabled )

... the same #ifdef would be added around this if().

All of this of course only if this is deemed enough to allow co-existance
of DT and ACPI (which I'm not convinced it is, but I don't know enough
about DT and e.g. possible mixed configurations).

Jan

> +        return iommu_add_dt_pci_sideband_ids(pdev);
> +    return 0;
> +}
> +
>  struct page_info;
>  
>  /*


