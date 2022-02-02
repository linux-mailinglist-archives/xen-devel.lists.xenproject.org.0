Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3E4A6DFF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263912.456789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFC9l-0004gf-Nw; Wed, 02 Feb 2022 09:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263912.456789; Wed, 02 Feb 2022 09:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFC9l-0004eL-Kw; Wed, 02 Feb 2022 09:42:29 +0000
Received: by outflank-mailman (input) for mailman id 263912;
 Wed, 02 Feb 2022 09:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFC9k-0004eF-17
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:42:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e637348-840c-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 10:42:27 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-L2hrBIFkOEyJ0bf15smVWA-1; Wed, 02 Feb 2022 10:42:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Wed, 2 Feb
 2022 09:42:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:42:24 +0000
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
X-Inumbo-ID: 6e637348-840c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643794946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkXxk37QoNgrDyPWLzP47ETl9eFQV0Qt63FMS3/VkKY=;
	b=Pi1gKDKPui8v1tUd06duMgxNughQeCMV5IznuiPBwyAtCOW5wgDveoOch0tgIZREzTuq+S
	jKQwyf9xxhe0a6+ldEbmFTS7KjN+JReIPAVJENK2CmDnkasPQ6GUYvU+wEigkm8Tkfnq5x
	y2oFXbBtPYgONoeG6a2yGvdYe4/EbCk=
X-MC-Unique: L2hrBIFkOEyJ0bf15smVWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEQ/76nkD2YfsOnJ5aM45YbMQrABGyl9P6UokBdnoqU0nVALJGdMgCKaRZn7Hzlyv0FhvGXt3jF7ZU39UA2EhkZVJi1GCqk5nooD7Znl4MbrzE/4B0yLDcohf3EaQYcBi2ZZLnow6P9e/V6WeohHFM/knxdheXeT0dUbwG3DQM16zvgrCxDleHtvQTKOcyGtYz+CRwIrjoTQIR2dxsjYiEYkamhOM5imJyGMIBtFtXKvcGikTDIx7i7a5OBXDyO5NaFNiVKr6GTajoZ0h9R+So024iftmi4OneeKPwkfjPVDTGqrNu9j2wFef5cwyvE/KQmqpPsGHIAhfS2rfyGx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkXxk37QoNgrDyPWLzP47ETl9eFQV0Qt63FMS3/VkKY=;
 b=RptBkwi3ThnrtdpSYrVO2w0aInbzec94ZyfZGBQR9acnXGrGUQp20MrfRCiSVqGpmlSGvE27th+huVj9/o8eXdZxriiMEQMeXOhHkh0urUr9tDAvlZ63LbLGERuU/536Md2qR/QkUveyn3EmU0I5/XLw3kWKn0ABbnm83OAuj3FIKbCwnelP/xJgsRV2Sec+AoZEFqdSIqd1Dk9ONnjTKUzEJLtWtX1xBr3kMtclVqFh12gaMm94Ktlw+MzX13RKvnyap9/b1zx7JzBYRgqUZpQge6smJzxXjpuWMdWGMiYpVJX07rx+rKfl+efkxGP03Hf4bDWW/LLo5IZWXYjmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
Date: Wed, 2 Feb 2022 10:42:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] xen/pci: detect when BARs are not suitably positioned
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201124551.2392-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201124551.2392-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0055.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8599ff4d-45dc-4afd-1c49-08d9e6305127
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31207A09C1CEA0CE797D930EB3279@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4/RW+xgTHhWfkejPQb5JIIeu/CRQPf2CM8zKvkFrhe8gG0n8/CLqILtNQiMwAVuZCS1QqGWPztTn4JmeUFN9HeqN8GEbRPpx9DdwQP7+Q89rbuJMX4a8taqHQ06xzqzb87iQk6PU2B5G7nf8hOnv5TAuZFiGTPdfQ0qMbeOENkOAVJrf3BVEDsrscudr5/6FRSoEBynGwBoLVtxCeNYbCCPMIYbTVRWlYhKbIOEa7EIXQat1iEmAv7yzJGwAPI+J1OO+7kN4Ft/Ow8xq6drW8Yv6EIz699O7wmCCBncyDAvXPvT/BYn8auUhKC63pO8MrkPrdi5iPTYYySE5tOZgfrMOqL5pgk7ntLpq9VVnW9vARbSki8vhR/+ji4Q+lOXxwHG/c2CN+YtQdqOr27dUOmeEHzH8aGI5apCGGXhCHd3kERhXCdIzoauG50UZBkUCPcsy6LgmkckWeoIDYJUrWli0gX65vN7VGXp+CEgeLJDnfzbS+7WUpzwOBSKb0sCsTscnIh3cq1fVeBFCyxNG3PvORk9jZy/p2Hb7k8AFTXClnvJhZRQH2eiWWUw3/7JBtYL1gDpBAjlNMiGnbDyjbndKdGMZD/EXwGp4YLE1TOy0aQ6bNoVBu+RrN/wobwPU6saWVRHZQSI8ZopBM0Q1nlORH6IhmNoyd+25B/RZm/yYZGJIAXvuE9Xja/K4JDfCaRIxk5wXEkXHVkn+4VnKtgprlFCU/XoVZ4OFx0BvGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(38100700002)(186003)(26005)(6506007)(2906002)(5660300002)(66946007)(36756003)(2616005)(66476007)(54906003)(86362001)(53546011)(31696002)(4326008)(31686004)(8936002)(6512007)(316002)(66556008)(8676002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UktZMkR6ekx6OEhUVThCVk1rYld6WEhpNFdXVkwrbUZEWEIvdGp5SjN5cUFK?=
 =?utf-8?B?UGZRREsvbllmZ0ZSbmVKQU9Xempsb2c3WjdHM2ZKa2x3Mkthb0tBVXhrVXhO?=
 =?utf-8?B?SCtnMEpsdkh2bExaZk94RWROQmlFN1d4SnA3ZDEwMEJOMTB0ZWY4bmpFdEF6?=
 =?utf-8?B?N2xPSDBGWnNocFMrNzJqS0hVazM3NEVWV3VXdkJCbStKVkIxckUyV2ZlSFQ4?=
 =?utf-8?B?TDlTUis4UW9OR21FRmljRXl0WWF0VDlvMEF2b05wSjZHb2tsVkFRd280ZjRw?=
 =?utf-8?B?czhrNVcrQTY4ak1Mc2ltVWl1UTFCSklaOURoNnlSNVovbWU2cG5BclVSRFIz?=
 =?utf-8?B?RlRWT1FyS3NNeEFsbG4wSTZ6RkpNSHd3TXhHZCtYUkF1amZ0N3NxZk1rSjBQ?=
 =?utf-8?B?ZnRGdTJJQ0h4U0pQdm5UY054K1ZrcFRZUUR4eHpaRFRtWXpFQkFZcEtvT2dQ?=
 =?utf-8?B?a1Q0SXdTM1Njd3YxdWJ2YXA1aElseDJZSXdOeXo2NUMzY0QzaFVXd1JMNGJG?=
 =?utf-8?B?THJ2VUdwRE40TThZZTlVcnhsVnRzUlplbStoRVRjTVlNVVRLK2xQdzJkc0Q4?=
 =?utf-8?B?RXRXazQ1cU5Ya1J6TCtOOHVFRGFRSXJWMzNWSlNBUlc4RXVHVUVteTFsdlhh?=
 =?utf-8?B?bERwbWlIR2dGRzdIOVZydk9veVVSem5DOXBHR09OOVpFNms3Y1FrRGtOUkNQ?=
 =?utf-8?B?MHVWV2RlKzRKOEFTSldBRElDTHdNWWtZL1hDR0o4cVJWd3Jnbm1XeGkwanRv?=
 =?utf-8?B?MGpvMzkvdjNvZjE2LzI5VU9pRTNiUnE3RmZTRkVhdzJ2N1BncVVmQTFIL2g4?=
 =?utf-8?B?cC9wQXI4VGhvZWlXWjE5dXZGdnR5YXkzelZXSXpteThBMm1PYkMwRW02RGhC?=
 =?utf-8?B?SERCcE9kN2VIZ3RkQ3BXbU05YTV0Tzc0dHVwd3JYVFdWdFlJVWhzbTFXZWVY?=
 =?utf-8?B?bC90bStzQWpIb0hLbm5DNkZ6SHQ4Q1B4QWUyVWpTTlZIOTc5SUZZdVFzN3NH?=
 =?utf-8?B?bFg5aHpCcUxqTnMxaTBjUXZKbG5SVUFqbytsblN1NEZqQUtGcktmTVRsb0Vm?=
 =?utf-8?B?WXpIcDR5bWdmRUg5bEZ0V1ZXeEhpRFFEVmVHUklxdkZHUzgwYjg1d2JjSlph?=
 =?utf-8?B?R3N1dnpaQlRVWHR5ZG90L1pZYm1ZOFF3WExvM3RyT2loT21lZFk4b3ozdDlt?=
 =?utf-8?B?NWh3R1h4UlFua1JiM0hrcWhtbDMyNkI3MmNkMjhocmQyMXQxRWVEb3lDK2Rq?=
 =?utf-8?B?Ylo3V2RJNEQvTStWNkwwTjN5Nm5sd0p1REpQMnluMS9kOTZaNVNpOU9PaThC?=
 =?utf-8?B?Qi9FVTAxallSVkxhYUowR0tQaEM4SFNCMXhJMytsTWkvY2RTeTUwQUg1STFU?=
 =?utf-8?B?N0dTUlR1M3lzSGt1NGR5QWdsY3d3S1lyOUh0MWZBenI0Z1dUV3REREhpTklY?=
 =?utf-8?B?bThvdnFIUUVwTGQ0clZFRTNaTldPdUhSWk9CbFFuaUdZc0R0cXZXWXY5aWtB?=
 =?utf-8?B?SWYvWVdrcUR2azJFQXR6akpPN1NSVXl6MFZDeUxVbmR6V1BXQktSTElVeW9L?=
 =?utf-8?B?dlBBTUlicFpLWU9Qc0pibTFTSmwyR1RxWTFMYklacjlIL21YYzAyUWdSdStq?=
 =?utf-8?B?WHQ0K3pOK3MwamFkRDhTM0w1b3NSdmFkZlpNYjk1clpnTURLVXFUY3FKZ01S?=
 =?utf-8?B?Z01jUWRKTHluYkgveWN2QkRGOHJuaFREeU9MWTRPL083SGZNMlVJaE02RE5J?=
 =?utf-8?B?MjE2bVlwTU5KTUNRZy9Gci9Lek9ndkQyOG9yQ1NJbGFjY3I0enNYSFY4eFBl?=
 =?utf-8?B?QWxWMlhRWkRBaU1IZ1hib2Vvd0FiNmxCMmpNMlR3OXBvR3Q2TzlUSExLSVVZ?=
 =?utf-8?B?Z0Z4UkhXbDNLem4xeklPYlVwMHFjZEpuK1NTNisyeGtHa3FaZDBzZXhkbkNQ?=
 =?utf-8?B?djRqK3lGT0lHekV5SVBUUVdXK2VuR1ozODB1NGFzVW1IT1NuZXZCZGc5R2I2?=
 =?utf-8?B?cjZpOGQ2bldiNUp3YlZBQUptN1krL3R3a0xMdmh1SXluL2haYkhHN3NNTFZI?=
 =?utf-8?B?aXVMV0IzdlQrUnRzMzQ3Rmt3d2NsN1E0T1orQjltM1JPaVdGZWFReVRBbEZi?=
 =?utf-8?B?bk1YQVNOOVFYdWxxTzRnY2Jvb3NzRWF2ZTBtNHk0b0Ria0cwZ2dPeml6c2NB?=
 =?utf-8?Q?U2wLz5vb3H9nPBB7S/F5GAU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8599ff4d-45dc-4afd-1c49-08d9e6305127
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:42:24.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEaFyUQDgqQrLzRdK9KDWU4UH9o3caIKjzaBfTg7LRvx84ao5ydkyibxXeReYp7zMixDCZVXnkxiLXu62s0cBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 01.02.2022 13:45, Roger Pau Monne wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
>      return (page_get_owner(page) == dom_io);
>  }
>  
> +bool is_memory_hole(unsigned long start, unsigned long end)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < e820.nr_map; i++ )
> +    {
> +        const struct e820entry *entry = &e820.map[i];
> +
> +        /* Do not allow overlaps with any memory range. */
> +        if ( start < PFN_DOWN(entry->addr + entry->size) &&
> +             PFN_DOWN(entry->addr) <= end )
> +            return false;
> +    }
> +
> +    return true;
> +}

Doesn't the left side of the && need to use PFN_UP()?

I also think it would help if a brief comment ahead of the
function said that the range is inclusive. Otherwise the use
of < and >= gives the impression of something being wrong.
Then again it may be better to switch to <= anyway, as I
think you want to avoid possible zero-size regions (at which
point subtracting 1 for using <= is going to be valid).

Finally I wonder whether the function parameters wouldn't
better be named e.g. spfn and epfn, but maybe their units can
be inferred from their types being unsigned long (which,
however, would build on the assumption that we use appropriate
types everywhere).

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struct page_info *page,
>  int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
>  /* Returns the page type(s). */
>  unsigned int page_get_ram_type(mfn_t mfn);
> +/* Check if a range falls into a hole in the memory map. */
> +bool is_memory_hole(paddr_t start, uint64_t size);

While resolving to the same type, these now also want to be
"unsigned long".

Jan


