Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6FC784146
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 14:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588443.919944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYQtX-0004kS-5Q; Tue, 22 Aug 2023 12:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588443.919944; Tue, 22 Aug 2023 12:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYQtX-0004iW-2i; Tue, 22 Aug 2023 12:54:03 +0000
Received: by outflank-mailman (input) for mailman id 588443;
 Tue, 22 Aug 2023 12:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYQtV-0004iN-Gy
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 12:54:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f51f566a-40ea-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 14:53:59 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:53:28 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 12:53:28 +0000
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
X-Inumbo-ID: f51f566a-40ea-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAu4J20mkb2TLVfrKYgDFrfQhA+wuAJ0FK5MoRIg3TQU/Y1w62+KvqP3NhvtdoKwziECNs4FNJaqGwuP7x/uMuY10bwH+SYxPBfn9Liyd4vjdwhnWEYKFbTDaXcu5qInvIHJqpRUiqcg+bVTTlhR9SUtlAsdRB7Gdfk5X3opYtAiA4xUTfPa3TqYqqbnLfbBCmCvwmX0JRfPiOCIAxyFHEOvTlewuHh1wItvQsnQzx9YYZIf9dmydB/CTRn8xpCcxFSmHf7t+NiZT3fzwsfeKBGBLhk/QMOcC+RbQrQD4g84uSyvvR7DPI+I5NocNdxYrnzmWw+zUlDbtsF7f5clGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW33a4gSbvOY3I2Cu/stQ74P9tsFG1s7Qcrsxxj+CXI=;
 b=BHaS/VpqDIyIgVdLCSJM6fulwTbazbuXZwoDsvYM9iBusn67bjfTJcTqutbjf1v0khIeyOd26BkdXpipSamKJCOWuaIGbtPpJ8ZsBobA7OExk+bD277SMZcPQHMPFEFqgyzB56oZMGwJ4U6vakeEkFk20CzikoCmONTnM1cSaXiUZaM3tQl8XVjIOW/T6NVUfx8R1MAoYOfWC95ciBucyxnGdeG0syiPkEzW2UL6SIvvN+w17WRgZnzTcde3PjatbStz72hkmz22csHoDQ6eK2x2ivNKU3w4rgmGSmgYz18o1lFtZJ/Zvh6tlQEIif+/OANCLUwf2AE+Tci6eg3Sdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW33a4gSbvOY3I2Cu/stQ74P9tsFG1s7Qcrsxxj+CXI=;
 b=O5XGy6U63D88Fw0pKbFbzWEurMCNCTxr/WKFvwtG+MttAA9/r3NRzbdbaX3xYqdJ7OpsDRgiiOJiyhaijMxz4rYFZ8wA4QjSsSLV9W/aQbxja54fIsuNFC+X7/lTTJYIcRqQsb2FV5APihEjk+nUNk26URl/6lCqTvd772UxF6oAGAY+SjnPO3Mo+SP25HpRxreY6VtblFAwOa4lcfkUVOmXOoI8D3UhLhfXhWcuoHfghDYnIiVMtD3phCOHvT+Qr1lDfV4zxXWbTAFw9HFq6tdOZrlFz0lger6FbbaOoc13ez0ogNIcHHXVvE7pV0Uc/KsJ5UTXatNoGZcTVt+/rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31d4ae2d-1b25-b272-a5c1-2fef3dffb7af@suse.com>
Date: Tue, 22 Aug 2023 14:53:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/4] xen/pci: convert pci_find_*cap* to pci_sbdf_t
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
 <20230822012955.312930-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230822012955.312930-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 136772f0-1282-486c-d66c-08dba30ec7a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w5gXAV5gASkc85BSLzi0m3R+NwAwdvw0l9Pix6kYK/DmaKqA5hLj2neYKti/rneXHYoZsEvZcGrNiUaaU08Tauy2B1gCrhqcfNqQkAdIy5j+1hb9Ej1OOnfeveUoz4HtwNj/Y5meyPbEfFq/PeYiQ3KVspjNKzwLNhwRRt52EgK6npQT82DfV/PmuEyhOkPPmURE9tB5KBniwkKANM1EKLwF0dLBa7j/wWnXMY3U4oxfa01Mg+pFc38egkoXl0FhRx3+px1Obkiwg3kqrqzQUHKS0201tG+jOxtoO7ZrRUwM3Vs1oY94CzMi3at7d6kVWNlXsbzbt+HDPOjRcVriZYfFUneV0Mu1+dohNqBxnHEiWOR3cdFhFWpTQ+5UzxQffJwLazAWLWIAaTRLyDelBGYcaRLHDGD9CAx408cFvb4qXFKD5XJzK69sGz5o3/BtWcoYC81FiXnwatr3J03TRkHg6dkfxMwMKHjOa1AXIeoytqgiLtv8AvRgRUCrM3WMry5jvbqILfQofnIlvL8IUsoUBEhtbrru7KNeJgo2R5P4djdB5dbU4FQfMw7h+pw++XL6fhzmpP555feKOR96zIhpshYsZN/7LAwByCexZuoTX7ZhiBx9aPmc1HZ8mYufzGU60DjoGpA9LY84Jxo0/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(66899024)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(7416002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW9GVU5aVEx3anhreTNFZjVtSnJwWkNzbk9BRkR5Rk9lWkYzNEVLT0ZEeXJQ?=
 =?utf-8?B?QWFPVS8xSUJ4VmF0dk5EdzUyNkY2cUUyY20xVnkyOGR3R1A2RVJscGZzb2FW?=
 =?utf-8?B?bzNENFFkbTFXM0pzcTYxOFpXWlZTZzgrRjR6WDZJQUVKbU1KL045U2t1aWpq?=
 =?utf-8?B?NkFXblZkemJId09vclVuUGNzMHBNMkd1Z24wMTI0ajkwN2NoREJrOGxqZUU0?=
 =?utf-8?B?SVNpaEgrbjA4Q1JxM3dXOUhobW1Rc1BNZng1QUlubTEvbnRuSS83T3VsQnps?=
 =?utf-8?B?RGpUa0pmVmVmTFNHRUk4MzFHekhRQVZ3TVMwUWZIbWpiQ0lRQk1oS0RkeGti?=
 =?utf-8?B?ZUFHWlk5b0xGUnl4RStDZjhWTXNNM3AvOWhnaGhQY0Fjd1l2aTBOOEV0U1l1?=
 =?utf-8?B?ZGt0MDlvT0V3TWtpZ1liRjVIbmdpS0tHUFJYVjFRWkxEUWI1VXFqYUpWcFNa?=
 =?utf-8?B?SXNvcHZSMENtTEMzSjRNaE9hTXIxbTNqaC9vdytVSUx3YkNzWWlQVXgySHlT?=
 =?utf-8?B?M293elVHbWxnVURZcFY4TDhZZmlsd1JqeFhOVGFaUzE0T1ZId254UlowbjBN?=
 =?utf-8?B?anIrS2pEMTIrUjdJbnI2cHhHZ2FFZlUvelZLZUltT0dxMUtEM2JCVXJsS21i?=
 =?utf-8?B?L2Y4bThoSEZWb04wRTVETmZDT1AzMThOU1JnaTJ2N3Nob3ZBamsxQ1o5Y0lY?=
 =?utf-8?B?U24rMjJmOHJjWHUraHFhWTJwS21mYVNKZXhaekhjTmhQQXNFcU9aOE5QQUh1?=
 =?utf-8?B?cjBJVHRoNmI3WTJkTTcxZ3FuWFNPaWU2azFjNXd3akpFb1A3aW85Rk9vTndI?=
 =?utf-8?B?WC8zalByN2R2Q0pLbEM5a0VPUW91clRaR2xHK0IwSm8xbk11MjRjWDRmNFN1?=
 =?utf-8?B?cFFaWjZ0UmJhcWhaNVUvNFQ1QmRaZHF2SFFKWSsvVkdrUFVDLzJzcXlkMjBm?=
 =?utf-8?B?NFFrWHN1ZTEvZDNTcVg4U0F2dUxQMU53WlozUnkwNGRYbjFwclcyLzB6WjVi?=
 =?utf-8?B?NTdTclZUSjJVSWtpTk43MnppZkp4T1FqUUhxd1gwTy9nanhCaEhEZ1dyV0sz?=
 =?utf-8?B?aFVRTjY4ZWxTaGxrNHdIRnBFVFpHd1hoanU3TzVkZzNiZitsVVVrMHZwTmpT?=
 =?utf-8?B?STBBQVdueEtmS3NyVHlqYVZyL2ZaMzk1eUlRYkZMU082WWhZeVNRUmtXZVAv?=
 =?utf-8?B?djdZa1IvWVFwUXRINUpvTW9uUEVFODlYa3pKRHB2RWVHTG9SRmM2V2FjQnE1?=
 =?utf-8?B?T0JxMnJOZ1dhaEpuK2VYVFZmZGZaSjdBZmtlVDJTcHlJZlNnb01YcGxZZzY0?=
 =?utf-8?B?blRTc1J2eXVENkFyOHdGWFhWd2ZtMzJqeCtQQ3dQc0djYS8xWkhlYWZDMHU2?=
 =?utf-8?B?TnBXWlViT3lmNFFZcTBpRXd2bnQwQVhaUlMxTVh4U0lVNEppeUV3Um9PcHp4?=
 =?utf-8?B?d1FNQlJ4bnJFYmxVME0wVk0yR1RsR1BaNktRQk5zMjlIZzg4eUdHdlVURW5S?=
 =?utf-8?B?U0FsZ1duWUlDU0poR1RjNkpuY3p6a2pYN0phR3U3bkg0MEFPYWszNHhteHY3?=
 =?utf-8?B?Uldra2dSUVBYcUk5ZVJFUHlBR1NDdE9aQzVEWGxVZDNJY2JMeXZXR3VhZUhC?=
 =?utf-8?B?OXRDWTlmek1uNmVCb3BJVng2aGZLQXhjRkxXZXhPcVdzNTJTMEtibUxyeGtk?=
 =?utf-8?B?ZzNhZHI2Wjd0UHBOOFVLMkxzUG1QKy9ET2pMRkxBVzhmMUtpek40SUxqMXpI?=
 =?utf-8?B?T2ZrTUkvNm5hcHo1akxSNDFtdjgyRzdJSm1KQ2x5M01zVlV1Yi9zZTR0YjNa?=
 =?utf-8?B?S0NNNGR1U3hXSkhqVlFHc21mV3c2UklGUStReUhZQkZDV2kxNDFrT2V6TndZ?=
 =?utf-8?B?SUZxc1JGWEJOV3JvQjUxdENDZWFWenhIZTMyVVRJT2NuMURpQ014ZGE2ZGVP?=
 =?utf-8?B?ZWR4TlVicWwwQ0RDUzJaVWRKaU80NUx5N2Rxa0F0OWdycVh4SUtKT2ZmdDFP?=
 =?utf-8?B?S0Z0UTIxRVM4Q1ZYeVVMTEM3QW5FdXZCeHhaNHdlVUxSaENnenEvOGsrcEJQ?=
 =?utf-8?B?STJlbVluSFV5OWRZbFFqMUhyRlNHWGNaNG9OQzRUOHl6SHhWbFpOc1JHN0w1?=
 =?utf-8?Q?gkWcnzpkQYmkOCAqwnvxBz9uf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136772f0-1282-486c-d66c-08dba30ec7a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:53:27.9249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGzjBnJ9ufNMWURDZKQ2os26WgTnSDqAVgLYFTAls5l5VqEsiAIpm2ho5qLqL/p2gUYhx81DPS5I4R2epESeWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969

On 22.08.2023 03:29, Stewart Hildebrand wrote:
> @@ -291,12 +291,9 @@ static void msi_set_enable(struct pci_dev *dev, int enable)
>  static void msix_set_enable(struct pci_dev *dev, int enable)
>  {
>      int pos;
> -    u16 control, seg = dev->seg;
> -    u8 bus = dev->bus;
> -    u8 slot = PCI_SLOT(dev->devfn);
> -    u8 func = PCI_FUNC(dev->devfn);
> +    u16 control;

As you touch such places, it would be nice to also switch to uint16_t at
the same time. (Similarly when you touch "pos" declarations anyway,
converting them to unsigned int when they're wrongly plain int would also
be nice.)

> @@ -318,17 +315,12 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
>  {
>      struct msi_desc *entry = desc->msi_desc;
>      struct pci_dev *pdev;
> -    u16 seg, control;
> -    u8 bus, slot, func;
> +    u16 control;
>      bool flag = host || guest, maskall;
>  
>      ASSERT(spin_is_locked(&desc->lock));
>      BUG_ON(!entry || !entry->dev);
>      pdev = entry->dev;
> -    seg = pdev->seg;
> -    bus = pdev->bus;
> -    slot = PCI_SLOT(pdev->devfn);
> -    func = PCI_FUNC(pdev->devfn);
>      switch ( entry->msi_attrib.type )
>      {
>      case PCI_CAP_ID_MSI:

You don't further alter the function, so this looks like an unrelated
(but still desirable for at least Misra) change.

> @@ -685,8 +674,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>      {
>          struct pci_dev *pdev = pci_get_pdev(NULL,
>                                              PCI_SBDF(seg, bus, slot, func));

With this, ...

> -        unsigned int pos = pci_find_ext_capability(seg, bus,
> -                                                   PCI_DEVFN(slot, func),
> +        unsigned int pos = pci_find_ext_capability(PCI_SBDF(seg, bus, slot,
> +                                                            func),
>                                                     PCI_EXT_CAP_ID_SRIOV);

... please use pdev->sbdf here. Albeit I guess some further re-arrangement
is wanted here, to eliminate all of those PCI_SBDF() (and then also dealing
with the otherwise necessary NULL check). IOW perhaps fine the way you have
it, and then to be subject to a follow-on change.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -193,11 +193,10 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>                     unsigned int devfn, int reg, int len, u32 *value);
>  int pci_mmcfg_write(unsigned int seg, unsigned int bus,
>                      unsigned int devfn, int reg, int len, u32 value);
> -int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
> -int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
> -int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
> -int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
> -                                 int cap);
> +int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap);
> +int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap);
> +int pci_find_ext_capability(pci_sbdf_t sbdf, int cap);
> +int pci_find_next_ext_capability(pci_sbdf_t sbdf, int start, int cap);

The remaining types want converting, too: Neither fixed-width nor plain int
are appropriate here. (It's a few too many type adjustments to make, for me
to offer doing so while committing.)

Jan

