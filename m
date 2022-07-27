Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87D5823B9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376004.608562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdsl-0005iG-V4; Wed, 27 Jul 2022 10:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376004.608562; Wed, 27 Jul 2022 10:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdsl-0005fU-Rs; Wed, 27 Jul 2022 10:03:11 +0000
Received: by outflank-mailman (input) for mailman id 376004;
 Wed, 27 Jul 2022 10:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGdsk-0005fI-Ac
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:03:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 509c539c-0d93-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 12:03:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4242.eurprd04.prod.outlook.com (2603:10a6:208:5e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 10:03:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 10:03:06 +0000
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
X-Inumbo-ID: 509c539c-0d93-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVIbKDcdUie00KiJyt4b9zSTO8sSKlBHdorAecxxsdap0Jxr/KogyPuwsjArp7V2DUOu9n56ek87wQGA6GFkINOLmNz/76nCe/vTWaPU/KhpLJK5CXr8YFYafzCtrTYK0vTyxHeHqmZHVBO8hq3K2GwE92sph0WG9lUp2QbBsI7204oAxY9bvyqL6lfBBHoUe6TkHYXTttpcisRhKhov0a3RP1C9qYRubyQJknOR6TMmjROAoC5y5xmNtIQU20/imd4Pp3iZI7Tiv0g248rGDwYr4gJ1Td/lIY3uBrG/hdyNPBFBKSboQ9ZOeIsLVU8+yz8kHz2CQBy18YWZVqdTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20WCdnFKcg8tMGaKS2EGRh5BbCB1Drrb+6HRMX83pUw=;
 b=Rr8IKWeUacH4Zt2Ers8amLVRL6BekJ0YxFmUB0gqSmbuAfysJfhPdtSdIFXrtnQShzrOIkvolRR4QhEpnqAKwJquC9CY+anh87c11z2uJmt+JngGuCQf93efgYidb7T+PBLmO6b44BXAig3dSzogvdHn68E36tKKnTQ6zIiCKjoioNGR3Md4yktoYExOe7HHDOXjd51GMjhHtWaHnOoIzey9hdG41iXdyh1S+a0IX9hr8V2Lr+3QgXZ+lkVJRM33/TTjz9CWy0VG2Jntho3OgiINbo2lYJuPpEcCXIeX0JGuL/vrKW50j/5YLEo/JFEqmOVyPi3QYSqm4yplVtxlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20WCdnFKcg8tMGaKS2EGRh5BbCB1Drrb+6HRMX83pUw=;
 b=XDD7ooby0VaZsNEU+B6ecJ7bnmNByjGigFJoz9a3Lig4FCym0Zo0xzoO66rEB7/hlgPoM5qTX0vdN5jwqYwUisHRtyYmLwBKcM1WdvCT06LX86SiAESQ57GGzNLmvVSl4zszJtmGGYISQeQYehdqVxOSCC4U2D+BAO85bjEiNwanqYbfG+pcXtlQuMqyqHWepsRT7azV4qscs0bX7/Fs2jW6WxshFg8OznsBDlBrzbMwKJWlanjmQSY9434rMy4DhUYoNSRomfR6PA8F+Y2ehE4O6YGI0AQzBgq7w1l9JHO6C+lvpbtriAMB/m8JRhzEUXpuQRL0M1gp/mvId/jTjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51afa25b-93ea-2685-b238-2edd9292bece@suse.com>
Date: Wed, 27 Jul 2022 12:03:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 02/11] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-3-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220719174253.541965-3-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0079.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f97321-0281-421f-5369-08da6fb733c3
X-MS-TrafficTypeDiagnostic: AM0PR04MB4242:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4dS0O8CzN++9ZT602b61/ydcpyvNFumBRWFpt/ExvkZhhRqkUV91JA9Kaj5N52ojcWDGgUrHXGVlHg5kYg1NVLjyIKJ0SXsOcJr9PaZ4iCVvMoO8xQN54lPMbUfzji47Le+/Sauxt2lxPOea11szLfK+z0nf/xq/ZqvbBbNBhajxKvkNJDiBEGZLjxDX9yzuKvLzYyQVRaXG02Vtn6sdkJoXQdt7bq6exOGfhPYBAiXENu1PxYonuT64L/l5B87tja4gHcnsOIQAnQ0wPdw9AUtu0sRQWoODtv/klSIgASMFl+1D7I3mVoNkNqvn/dc5LMxV4xyjdO02uzXc5yMBFZISp1fv7dUKgCRjC+8msa19Xytvaj5fibB43mgB4GaZOc5/+x8tPEts5cK45B4BdHMBl84ColR+7Y1z2akbAX2Z1G5hDclPqVqQ5OAEzaxutqZlHKv20pVYlKk1rY66jVenyr6w8+TBtlD6iFw2slSXanG9XtyFMFeuslfRJZ1YTmSz4FYl2z/EvfFkPfPh0GDWeTLYDm9fsT3L4XKTZBKdkR3Thlrp6ZhofE3Xyx6VC8mt6aOvUrxDuUWyUbT1ZbpiJY77pBrz3ZNfEgE0d/65wnSN/2ic3IP38GStNT+J5AwGcBCM20zgNUnHRgUlDEh44bz9LqKpy4dZnGJn49jWCrlKpoHwcm6krJlWo64zfWeBxA4pMNcRqfww/XcLleTg+VNt29MaNS7U7D0qj95KPbEzWIvr8IGoS4lMcttTsIaA7t9JuTpfbyVNAWbnavSWE2ACfKYYug4cHmgDUwzFG/unkMVcLy6PKN3NcPclMk5QTTg2MaZ2XNH8fTOyKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(39860400002)(346002)(376002)(5660300002)(7416002)(8936002)(8676002)(38100700002)(2906002)(66476007)(66946007)(4326008)(83380400001)(66556008)(54906003)(31686004)(6916009)(41300700001)(26005)(53546011)(6512007)(31696002)(36756003)(6486002)(6506007)(478600001)(186003)(316002)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHF6eFFtUmpTTDR1VVVwaXl6L3RVTlBYTWpjTU1wdTVxcnZPVHE2YTU5MFFU?=
 =?utf-8?B?S2RPd0ViZEtsNHBvaW1weUgwRURCTkUwbXRaRncyQXY5cWh0djNZbFhGMXp3?=
 =?utf-8?B?eDJTaWxnejl2TThrUDFtSzc1ZWVpdStEQmRTVlpLTFdGWWpPMXFpSHFVYVhW?=
 =?utf-8?B?akM4cEQ3Vk9NL2MvRDZ4K0NNQ21OcEwyZTJ5Q09KalFnUTgyY0hSbmZtQ2py?=
 =?utf-8?B?dDd2VG5qZmEvWmRNLzVjbHNxQzV5NGlMRlU1bWxPQ2xvSEgrcGZ1YUlXNnVL?=
 =?utf-8?B?T042dm5YVnFTYUJXUkdRb3lqMDVTV3ZKajliWWR1NG1LRTIzckRLNnZvK1d2?=
 =?utf-8?B?Q1hPdjVoOGxXblQ4bUhBT1pKUzRKRHFBeTU5ajhuY3FZQjcyd3c0WWtSQmNv?=
 =?utf-8?B?bFZyV0NZelFXZUNTc1hhbnNLR3pDT1JHUGVVYW5kS3ZXM3gxT2lnaTQzMkUr?=
 =?utf-8?B?VlZ0bzdDSEtGQTJINTFpUjJ5dGlQL3VITjFZd0hiTUtIRFhVSVdIcEVtSUN2?=
 =?utf-8?B?cVpYTkg1eGhwUWdWcytOVVp4QWZvWGJOVmZMVFVLK0paQ0V0U1M0SUNiU01E?=
 =?utf-8?B?MFFXRlA2bUUzOG9QRWsza2VJUi9FMFJoWC9vL2k3Tnp1RUpBdFRPeXkxa01B?=
 =?utf-8?B?SEFkY1hXYnhUN3RTWHBSU1A1WEtZK25Dc1NFbjk1ZzVidXR6K0x2QzV5bWFt?=
 =?utf-8?B?SlFEUGQ0djZoczZwUHpxZzFBNC9QQVljVzdHRDZkUnVnL2t2SlJCNWQyV1dS?=
 =?utf-8?B?NG5QYVkrR2tJcFJwRGV6VjNJcXVrb1pWc0VJRWZob1IyZklzMWdOajQwb3dT?=
 =?utf-8?B?WmlvdmtIWE04OUFEcW90K1NvYlpBYlkydmdKdThJMFFUdlY4QjBqR25xUVhv?=
 =?utf-8?B?Wm4vVlYxNG94ZEdwU1cyREhYcFE0RnpYK2lLa3pRTWthSkp3QlFoUnIvRjEx?=
 =?utf-8?B?QzhQY0toajhGSWRtZ2JLL1JsSHEzMnQya1JWMU00dGh4dUZndTE3bkgvMjA1?=
 =?utf-8?B?eXN2M3VocGNEREk1b3N1czM0YVg0OGFDUXFvWUJMNjJTWndtRTZFaGVON2cw?=
 =?utf-8?B?a1BQVzA3Z2E1blJJSjVmTDBvK2FLV0Z3TDZyWEFleW5tZU91WlVxZk1oNjlC?=
 =?utf-8?B?WnQ5RkloUzhiYngxeTNCMDVadTc2VHJ2bDFLaFExa2pTcmFlM3pjdW9oaWZu?=
 =?utf-8?B?NTB6eEp0QnBvUzhNV0o0MTVzbVpyUldaRDg1UUt1Vm43NzEvZ1Z1VC9zdThI?=
 =?utf-8?B?anYyQXRrS2FUSml5dG0vdVEwaUlob0VvdWZyWnhSTTl3RXptdlhBZ3d2NHNN?=
 =?utf-8?B?VVNIWnJNcTltaDRmSWhXT25HSThkU0xTbGNteWdQQVFCbys2N2JYRFUwaW5T?=
 =?utf-8?B?YUlKb2Q4Q2tFd0U5eHVFWHh6YitiNDJuUEpKbEduaU5wNUkyZGRXUlEvNnJm?=
 =?utf-8?B?bWN4R3BwT0xBeHFsOWVMeGpoeStOZDRhZnV0enZLM0lSZjBRQVRnbHhVd21u?=
 =?utf-8?B?MkR1ZHJjWmxHSFhwRzJENU1PZHB3Vk8wcnZ1RExLOG9QUVZ0ZkhVS3NCM2ZV?=
 =?utf-8?B?eGlqL3RpRHZ0NFlFelQ4Y2FjbjB5V2c0T1VQVU40TDJ0WVNPSHQxT0w0dlRr?=
 =?utf-8?B?Vjcwb2tDbVc4elNxSVNGUXlveU5lMWpkc0N1MXRJc2w5Y21UdCt4WHkzbE5q?=
 =?utf-8?B?K3VuS3NSdDZ0Rk1IM3FIbGZlWTUrWnFvQlRDODAyQjhVNndHZDZFMlhaMmZV?=
 =?utf-8?B?eXNCSWUxUENuN1RxSjlCVnlDekZwVThORENyN2JQRThTTWdjUGFiZVMwNUFQ?=
 =?utf-8?B?SWh6UjlQWjFndWQ5VXpRT1FkNjN0dUwzeHRsRFNKMkxoOU9nM0QydEpWUmFY?=
 =?utf-8?B?Zm43S29QZWh3QWszc0ZQbVlHZkZYeWZkdm92d3BXdkp3cm5FbkVTRWtlUWwv?=
 =?utf-8?B?eUFQRmJzbDNxcVd2MzRIK2plaUpPdk1WSlhqYlAzVUh3NmYrUXFjallnR3pJ?=
 =?utf-8?B?NkFDclJDZjNqdC9vOENEOWRBSFhOWWgxWWl0OFlnVkJIUkNqODNuSTJJNmt4?=
 =?utf-8?B?ZEFEUlJXdVIvN3MvN1hzdzdIYVZESUJ5VVBOcGZBRnF6RDdEMW1YNCtoTklI?=
 =?utf-8?Q?BVZT59/V8zCcOT+JnHYqLoAXX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f97321-0281-421f-5369-08da6fb733c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:03:06.5889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7JqkHarF/wwRQFjXiH2CAHZzkK96y6Mta3wjpufRSnMbiebwXf1/yDoi/2iUudysk/f6/lrKBooO6gH9olf2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4242

On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
> @@ -1558,6 +1560,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
>      struct pci_dev *pdev;
> +    uint8_t old_devfn;

Why "old"? There's nothing "new" here. Perhaps "orig", considering ...

> @@ -1594,6 +1599,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>                            pci_to_dev(pdev), flag)) )
>          goto done;
>  
> +    old_devfn = devfn;
> +
>      for ( ; pdev->phantom_stride; rc = 0 )
>      {
>          devfn += pdev->phantom_stride;

... this updating of devfn is what you mean to deal with? Then again
I see no need for a separate variable in the first place. The input
(seg,bus,devfn) tuple is translated to a pdev, so you can simply ...

> @@ -1603,6 +1610,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>                          pci_to_dev(pdev), flag);
>      }
>  
> +    rc = vpci_assign_device(pdev);
> +    if ( rc && deassign_device(d, seg, bus, old_devfn) )

... use pdev->devfn here.

> +        domain_crash(d);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",

This log message will want to appear _before_ the domain_crash()
related output, or you will want to add another log message there.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -92,6 +92,37 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    ASSERT(pcidevs_write_locked());
> +
> +    if ( !has_vpci(pdev->domain) )
> +        return 0;
> +
> +    rc = vpci_add_handlers(pdev);
> +    if ( rc )
> +        vpci_deassign_device(pdev);
> +
> +    return rc;
> +}
> +
> +/* Notify vPCI that device is de-assigned from guest. */
> +void vpci_deassign_device(struct pci_dev *pdev)
> +{
> +    ASSERT(pcidevs_write_locked());
> +
> +    if ( !has_vpci(pdev->domain) )
> +        return;

There's no need for this check since ...

> +    vpci_remove_device(pdev);

... this function already has it. At which point the question is why
a separate function needs to exist in the first place. To match with
vpci_assign_device(), a simple #define to alias is would be enough.
(This is one of the cases where personally I think a #define is
superior to an inline wrapper.)

Unless, of course, later patches extend this function. If so, the
commit message giving this as justification for the introduction of
(apparent) redundancy would be helpful.

Jan

