Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F4A77F6F5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585409.916515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcYr-00056f-Tc; Thu, 17 Aug 2023 12:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585409.916515; Thu, 17 Aug 2023 12:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcYr-00054a-PT; Thu, 17 Aug 2023 12:57:13 +0000
Received: by outflank-mailman (input) for mailman id 585409;
 Thu, 17 Aug 2023 12:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWcYq-00054U-4C
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:57:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93fb1fe9-3cfd-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 14:57:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7334.eurprd04.prod.outlook.com (2603:10a6:10:1aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:57:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 12:57:06 +0000
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
X-Inumbo-ID: 93fb1fe9-3cfd-11ee-877b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yfa+PR9rifBhrNATgBGX+J2NtAbKzD6gZ9gNnuQLSplM7dEsjceUMgBCvj4b9YXCeaaDse5PLMCZH4hULYa9WSlJZNb6EgHXAbliEb+sDvp/mahYdPOs+ntEy5UpIHCpnhwHEzNAxQx4M9RnjWMmpQxblFqQ5N2nXpT/vAq7LJQ+pUJRoRP+nOCj4BNCEWR6aBUaKW+eghE/zDCIGAO+Cl+HN0AFiDd+qFBTEqZYahpjCiuFoJmOZCY8QG22EpXUxBOcKGm+7LxdmZKeeMGfjiODN8L3i0C8ONJkZnD4e88NUu2lo3lcpeT/qpeHqFHPeSzft2rQbFr/Kaso7n2M5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnf7/rB9Vxl626BQpr8hqZhxxhs0lc6r453Fhu0vj+A=;
 b=GNZwWUeG4qh1wpT8ZFYtm9qklCwUfW4MzwNJZtlHewAJdgMgmTfTD50TVbTpmiHwmBjLBmqEeavotuJret0RJOvxuVT6eKzn+FfvB8CZCu80bEJKAQgVPN4qMPdRho4fiTEGYML3QIe//9uoag0Re9Eu5ptqEZheu/Su4V5Ns1hm7z62g8G1sV6a5oi0KNWzU4jzuvpU59xAw75Wp44IPPZOympkDAQDgAbazFKXhVQ4B/j2aiE/H73sTFo5bloHCn6kfseBHfr6WK4gVY1OoEilmRsOtqqtqiqwjzPEx1W7hjh6wgXkNNJh6AZOuoBhRrBAxvC0+d3CLkLNbj4J9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnf7/rB9Vxl626BQpr8hqZhxxhs0lc6r453Fhu0vj+A=;
 b=enZTcziG+ns5cBAHylFOKgsMgIo8WM+Q3NFz67hGuBoHLrinmwmwJufhHeIBeBL0/up7ZHgy9AbZ8u8oFbMkubfoT6APSS+8QAqfDK0pNTdHYlWs28iDsn9v1h6t9FGwxbvE2nOlZKS47f9JFdsgsIxkKO4gBOtlxQnHVfQUBLxHlF+7ZszuYGtnMYCunn0AZc2iNt/FRpSpridiYJXUdTuAg+ZtxF/J6UNiw27xkeLycd/ZrYFtkQ74af2bPZcDrhDFNnvB1xuBrEpxxnHeks5iHPp1TctgiKa+V0DGLF92qfp96cOQK2h1K8j8T3IYlC9Lh6wdxQsTJnOjBTdNQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce7768c8-41bb-bbd8-3b6d-bf4d42ab2f3d@suse.com>
Date: Thu, 17 Aug 2023 14:57:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230816185035.82994-1-stewart.hildebrand@amd.com>
 <20230816185035.82994-2-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230816185035.82994-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: a2843aab-aa27-49bd-bff7-08db9f2175e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ebVa9LfW9iN4iR4DkXIbdvkIOcSfOidnJEi8XXJzUOYNWYpuI2QkNzI8SkfXO8KbAQu9LIzktRU2v1C8Y8ELUMC/iN/MYIFNHdQhcrf5P6U4ZhAm1wkQ0I4pRiWtzuUfrGyPcF1xfYXEBkwplRNdyd5RwFIKa/9eNGjKP8IypUmOF0xBAOAJ6aJo+naTW9H4sFdRMneNvV1erriiUq4p0mpe206hUOgSkhdOdrJJNKqqBzBO7LQqLe1Yi20OJcn4UFqBF0MzFFHyY5J1drCYGWyWszKXhyBjf3KRjChO+nWIEmnX3YXesVAUMRCvp7ieC9ln13FEQrJzM3yn+3ODT5gMZqQauJRo7g61pKiD8Jt75JUCzXzLAo7J6LZgzLXukIaFbC/HfDYL0hj1pQ/XfQXzb25FdUK3sBUowsQWkl39R6q82jYWESJGMbIqO2XpeIi0kqh+w6eExMizmMy3wXSKQfr5ZSsGvDNao3EQBLmsJ36YadWHQdVcbmTxRDvdLAwzTp7Emh0ZmuI6u2blDNN3BuPjtteSDp4xr+Et5sxOXb05cTa9qq21xBG8Vq9plpDi8KwK5B7iuz7KMlGq7F85DkMpBi78KGdPkV2rURS4YgXy+VZuBJJ9XW1Ey9cSNgSvYbJlEIsVvzQpC9+66w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(31696002)(86362001)(36756003)(38100700002)(5660300002)(2616005)(66946007)(66476007)(478600001)(66556008)(6916009)(316002)(6666004)(53546011)(6506007)(54906003)(6486002)(26005)(6512007)(41300700001)(4326008)(8936002)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVhvdFNoWHZhT1l5TTdRNE9ielFlN0daQkxVS2svMkxEVVFpS282Z05sKzRT?=
 =?utf-8?B?cmM3RWpZb1Z3UVVLTHA2eDVQdllQa2haTmxhY3M2aDJhMU9Sa016MnY1UFlX?=
 =?utf-8?B?aGwyQ3ZJcVRDR0hmQXNRTCtRMjNzenVRTmJHZnR0OUtjdGpLQ1pSSlFBWlVr?=
 =?utf-8?B?MjdxK1ZReGdvbDU3bWI2cTBHSTJwUnlFRzlIZ3NXZTNkeS81emt0cW9KN3dS?=
 =?utf-8?B?bWVBSkFxMVIyQUtvd0w2b3J6d0ZaV1h0Z2RsQjVpZUMxWnBlYW1XMUlnT3hQ?=
 =?utf-8?B?bFk0QjA5N0d3SnpUaDZpQWF0WjRDbmVOTm02cU9EOWlycWFsVGs0Y3lDTGJX?=
 =?utf-8?B?K3plZTgvOWRhYk00UEJkamo5c3lRRmZWMmdDb2dNUjlDdTQvb2JuTXpuVEJ2?=
 =?utf-8?B?Um4xci9GV09Nb05XclArLzRjbGNtQ0lxUDN6MnlpRHFWME9pZkljTWljb3VY?=
 =?utf-8?B?c2dpb0lTdko5cGd5Vk1GYURZM3QxdDc1MiswVTF2SzQ1OXNnRjFtS3g4Y21B?=
 =?utf-8?B?Y0lvQ09oZEVWUkFySzljWkJIZ3NzRWppRE1VeHQ4L1I1Slp6MHh6YTVKY3o0?=
 =?utf-8?B?cUZZUno4c1BaSER6b1FEcCtIeGFid0JrenhabCtXMmgzV2YyaVJ1RjNWQXg2?=
 =?utf-8?B?b0MyM0U2TXRFd2gyQStXOXpyZTlaSlQ3RXBvYlBOY05pSGpQYnVGbVIvOWpy?=
 =?utf-8?B?TEMrVUp4blNsSDNVTzFJbXVmRm1CL2RSYUV5T2Y1Tk1sZUlFN0JDak9DRm5h?=
 =?utf-8?B?T1hFSjhxMmpBSTc2WHREMXVwRU9nVTVIVjh2VGwyQTd0MWxWbVl5ZHdHNGZn?=
 =?utf-8?B?T2ZjNEF0ZTRPRWFreitnSVZWNXFRSGNWUXk4Sno3YkxINWtoK29ZdjhDOHRC?=
 =?utf-8?B?YmRybXdpRmdPTlpPYnBWa0c1UFhqa25mVSttSmVLK1M0RFptMmFlMzF2YW55?=
 =?utf-8?B?TDhTQ0RiSEZGQjJnemlMRUFhSGN1TCtKdmVNUmxUMjZsREtUNGh1cFdLQzJy?=
 =?utf-8?B?alhiYkMzSzVqdVpWMThDNEcxaE90ZEVYUlE1TmxJSEU2S21mTkZqOW9ZcTJM?=
 =?utf-8?B?bFB4K3grbzZwb01LK0JYTm01bUIvd1A0L29qZkhYcnNlejZBeVArMk54K3F3?=
 =?utf-8?B?bUowbVZJbXJiem9mbGdWaW5JSCs2ejdPbFJ1SW9INXhzS05taDVRSzRpdTRm?=
 =?utf-8?B?SGkza0FBL3RWd2tKV2JWNDhtYzZyYWNnQnVYWG9yN3N0cDFlQlFLM1VJRGdl?=
 =?utf-8?B?N1FXLzkxcnU5U2ZhbXdqc053YzRhRkxlZWJ4LzBONC9yVVAwZDZBQ3V0eEZO?=
 =?utf-8?B?czhwblZqVDRTcDBrK0hSdEs5UEptTDNtTDNBdklhK2xlc1NvMUJiOTgrZ2R5?=
 =?utf-8?B?S1huenVVcm8rNXFGSHRreUhvNURxM2xwdmFmNnZRd2FBQnZ4TW1BZGJqb2Fl?=
 =?utf-8?B?OXRGc1B1aXVnd1hUQ1JFZU1TUWFXUEdtQXJWQzlqM1dRRGVjM1ZXQS9FOU1m?=
 =?utf-8?B?cXF6Unk5dG45MGNrSjJ5TFo1dVFnMHluTFlzWEk4VTg2NkJSZ3NFNjJuTHFI?=
 =?utf-8?B?VTlSdkM5dDBkbTcrZmhOeFZGemRPcjFhWTBhV3M1Mlh2a2lWdnUrU3pvWVZo?=
 =?utf-8?B?WHN3dTlKcVR6SDZzNFNWMFI4TXZScW5ST2FqS3p5VnY0SEhhcDB3N2l6eVA4?=
 =?utf-8?B?d01jZGFyWU5wM3RQK3RtQVI3UlFkZTZGS2Q2MzM5RHgyM3I3NlFGbTVJeVlM?=
 =?utf-8?B?Vkx5ampZMTF4aXVWUVh3eEJlUHVLbHhLMFFSNmxSK21hd3ZFUUV2QzRjTFM2?=
 =?utf-8?B?dmt0a0RkUXNTZ09mS3BjQ2VpSnNTeEFsaFdlR0pwR0cvTS9sQXMzYnlPd0NH?=
 =?utf-8?B?ZDFMMGhkZVp1Y0hhZDI4eFdGUDhHYlRCQk5PUUdtWlB0RDJCaVZkVjljUTA4?=
 =?utf-8?B?WStDeU4rVEtwVDVKbmhrQ2h4cDNjbWFzK2d1OXliVVRaUkNvSGdSV0ZhUmZN?=
 =?utf-8?B?YXRQOGxQWlhINFY0T1RxUTBBYWI2d3phSXhPeU9NYlRTM0lHTDN5LzVMbFc5?=
 =?utf-8?B?Zzg5SElZcEkvdkN2UEppcmxxZVZMK2FuaTZ2WE5ZdGczK0ZVTHRWNS9wcnVR?=
 =?utf-8?Q?Jsa3HA/ojsDl+wg2rNk0i+cIS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2843aab-aa27-49bd-bff7-08db9f2175e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:57:06.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3XgvmZ9ffMyudl6k0xgCF3Os5bS0MqHRKtouYSy334eE+214LTPxsspYAWU35A7YehFIiyEdd1jaqgYTFTJpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7334

On 16.08.2023 20:50, Stewart Hildebrand wrote:
> If there are no capabilities to be exposed to the guest, a future status
> register handler likely would want to mask the PCI_STATUS_CAP_LIST bit. See [1]
> for a suggestion of how this might be tracked in struct vpci_header.

Can we actually get away without doing this right away? I'm not sure
consumers are required to range check what they read from PCI_CAPABILITY_LIST.

> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -39,27 +39,27 @@ int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
>      return 0;
>  }
>  
> -int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
> +int pci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos, bool (*is_match)(uint8_t),
> +                      int *ttl)

Why plain int? When values can't go negative, respective variables generally
want to be of unsigned types.

>  {
> -    u8 id;
> -    int ttl = 48;
> +    uint8_t id;
>  
> -    while ( ttl-- )
> +    while ( (*ttl)-- > 0 )

I don't see why you add "> 0" here.

>      {
> -        pos = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos);
> +        pos = pci_conf_read8(sbdf, pos);
>          if ( pos < 0x40 )
>              break;
>  
> -        pos &= ~3;
> -        id = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos + PCI_CAP_LIST_ID);
> +        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
>  
>          if ( id == 0xff )
>              break;
> -        if ( id == cap )
> +        if ( is_match(id) )
>              return pos;
>  
> -        pos += PCI_CAP_LIST_NEXT;
> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>      }
> +
>      return 0;
>  }

As said in context of v1, this function should remain usable for its
original purpose. That, to me, includes the caller not needing to care about
ttl. I could see you convert the original function the way you do, but under
a new name, and then implement the original one simply in terms of this more
general purpose function.

Also, while I appreciate the sbdf conversion, that wants to be a separate
patch, which would then want to take care of the sibling functions as well.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -513,6 +513,18 @@ static void cf_check rom_write(
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static bool cf_check vpci_cap_supported(uint8_t id)
> +{
> +    switch ( id )
> +    {
> +    case PCI_CAP_ID_MSI:
> +    case PCI_CAP_ID_MSIX:
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
>  static int cf_check init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -544,6 +556,60 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( (pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST)
> +             == 0 )

This fits on a single line when written this more commonly used way:

        if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )

Otherwise it needs wrapping differently - binary operators at a wrapping
point belong on the earlier line in our style.

> +        {
> +            /* RAZ/WI */
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1, NULL);

This last NULL is likely misleading to readers: It does not obviously
represent the value 0 cast to void *. (Same then for the extended cap
handler at the end.)

> +            if ( rc )
> +                return rc;
> +        }
> +        else
> +        {
> +            /* Only expose capabilities to the guest that vPCI can handle. */
> +            uint8_t next;
> +            int ttl = 48;
> +
> +            next = pci_find_next_cap(pdev->sbdf, PCI_CAPABILITY_LIST,
> +                                     vpci_cap_supported, &ttl);
> +
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1,
> +                                   (void *)(uintptr_t)next);
> +            if ( rc )
> +                return rc;
> +
> +            while ( next && (ttl > 0) )

Don't you need to mask off the low two bits first (rather than [only] ...

> +            {
> +                uint8_t pos = next;
> +
> +                next = pci_find_next_cap(pdev->sbdf, pos + PCI_CAP_LIST_NEXT,
> +                                         vpci_cap_supported, &ttl);
> +
> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> +                                       pos + PCI_CAP_LIST_ID, 1, NULL);
> +                if ( rc )
> +                    return rc;
> +
> +                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                       pos + PCI_CAP_LIST_NEXT, 1,
> +                                       (void *)(uintptr_t)next);
> +                if ( rc )
> +                    return rc;
> +
> +                next &= ~3;

... here)?

Jan

