Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66B592FD6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 15:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387466.623698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNa6G-0003pK-RB; Mon, 15 Aug 2022 13:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387466.623698; Mon, 15 Aug 2022 13:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNa6G-0003mh-Nw; Mon, 15 Aug 2022 13:25:48 +0000
Received: by outflank-mailman (input) for mailman id 387466;
 Mon, 15 Aug 2022 13:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNa6F-0003mb-Ea
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 13:25:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2069.outbound.protection.outlook.com [40.107.105.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c532f2a6-1c9d-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 15:25:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2281.eurprd04.prod.outlook.com (2603:10a6:3:29::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 13:25:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 13:25:43 +0000
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
X-Inumbo-ID: c532f2a6-1c9d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHkbxvj0UnAY1TvdyC1n9OsEvkcCJX6VcIQ17Wz8S7q59ogOQXdSYOcTxOb4NQhcOE/LMxdgn1DayQWheUrhdjPyLPVy3a4CjSs+xLh/vTSQL/NnIgpQvLvNE3KbF8NdiQnOtBtWYWFr2n26mhOnxgzRNvGORapG7WBJAeo306+Tgg4Gc71AJ7t4Y4DHGByiCzPvRX4h5E4wLiHBrzc8em8+RlOdRuJPasUf5Dfjz95blK2L6sGga3TV4UP3S1W5+8Zlw8cQj/6l8HqqvZnMJOoNIRsZHNiDOjxP7ZVJiLaH4d8XDN8V2B3ClPPnMBO/OFUl4TEbTGzB7yygsoiFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNo/Qvn2uBvl6wrIsQ/rl9l4NCdnYiUDjBsh9nnmEGc=;
 b=KwD8fitJNDTzrqgTgB4tUpzYlv8P8srtzzmHuFhCB0d45pg5XfvihpO8fc2R2XhRd+89YDgqAuJLhWvDUXNP/Q2ukuUFgk/ewoE4KqM1LU8Gr6ggaYRe0+Jw+dkh1pgMf+fhebA3yT0iZ6DiZv4fcUdN7jMPnALAEdlmjIjib3E3Nd27kpPcjHJEFDQ4116u0M902YDj+XpQopbT1QyPLNthDdsGll8gNGb88jhACXmZjiN6AAqDKj/8WLXOcAYNJVafS4zvEfwn6BVdAXsXFOqz2QJKqd1OW6uShcf7WuCBFByj4VUGx3BHYmmgg4LvuT8JfqUCSM4Fcwuqzp/+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNo/Qvn2uBvl6wrIsQ/rl9l4NCdnYiUDjBsh9nnmEGc=;
 b=RQHTdhzQ+E9TfCHZUzC3n2h+UVdLNpRLDQY9rxJ1TChgpJcIFput9BG+SF6zE/Ks6f0nnrlxemBOsK843N3jYv77mTT8a4PQPn7/ejZatTJhKV0hdmCQKJAYdzjiRLfuPwXuTgCswZJKxkql40gH7nJgvOFuGOCBxCZPl+/GQZqKh2CNbo5AL/ywRfrR1tn/oP4B8edLJiKUIgr/CqptgqfcNJd62yD7j871uaXCKNUSDFF5MVScS6GEg7QAljcnmJ0N/HJ5W1ko67/dGCGVO+2Ll0wfxYTq5UNLzAzpPSeLIVentAJXD5AZIB0X09eWdFPVRBrSjvceCoTbYV87pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b977eb7-59f8-7cef-b2be-579476b148ba@suse.com>
Date: Mon, 15 Aug 2022 15:25:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 06/11] IOMMU: add common API for device reserved memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <2688e04266c71b3f0f9a60e2bd5fdb11776a9ef6.1660354597.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2688e04266c71b3f0f9a60e2bd5fdb11776a9ef6.1660354597.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79685250-dec4-44a6-2e2b-08da7ec1a7df
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2281:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sBx2A3POgZ/4b6MUU7dgTSCD7bByRU7QfZGhxJfx76VgIt+FN+cP1RmnY+OTm1XxreWCl0X8fpvBntoQNWkE0yWnQXYpElTxyRIIT7fNl46+iLeHunnejuXMcTv9SFHnG0rcKbnVWPVGHBodvy4ixVmNZhRmyWuF6wdIId26AfxgKCjEqQ3FP1W9w43Z5iqniS9EFWnDIYwDg8mtlq0S5avX7it6DkQXQ8CAdhKU1KXg7NuI94ciYNjUs0K51bSJabYsJOBnnNex5+v9TKgw12W7ST2+NchxmSlmojyRkJEvUCvwsIhByIZKWDyJn7YefdKSDFQgZ/iWiAHolZy+lWlS8IK2TfFMGRis85X5mgk2QGpnzLxEO5yIkm4S8KZSieMxi7L+WazbLrA+F5+n14FfZ+AqCH3iFG81PmpJtzX6ZWINKulpacIA1SL/90Cy1WqIByym5DHxjI8Tdy0mQC56uqM5Zxy054Bxg5f/QwLBgHtbDlsmPM1lUwgmdF0laacHedv5Gr/pIoAWOCYOj2gv04Ot+kl7jMZxDeWMAW1tGvic+LAY/oC9/SkZC3nt4piG41CJi8FUF3jV04xU3Q+B4cRNrjiGvJwVnfhM/oEk26+oKh8z/no41lg2pOmbdytKwMs5UtB+nuU4yz2UYc28dkXy2z5mTAFkVBzG9KnsUMGvigMme9/xp8MtIoMLKfGVsYl/JIy+6E9jcM1UmAkt0A8No0h+3W3R2dO98edgSrxffVvZ0Cqmz6Q6NKtTJgu2/cH3e/xGWqXMMSt47o86gB/r6MWzqqIsqCr8ehwTCP3GdF+5JmeVnzhWcv5gIUryGEQRXMLTZYgKs6hquA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(31696002)(86362001)(38100700002)(5660300002)(316002)(6916009)(54906003)(8936002)(66476007)(66556008)(66946007)(186003)(4326008)(8676002)(2906002)(2616005)(53546011)(6486002)(26005)(41300700001)(6512007)(6506007)(478600001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak5zTDBaQVAzS1BGeVlQYmtYMThaWGR4SGN5N0V3aVZ4THRGRWptc2x6N1Mx?=
 =?utf-8?B?MFpnUVhleFo3SWVPRTVFSzdzOFpIalJBUHZlcEpLNStDYldLVlcrWkdnSjdl?=
 =?utf-8?B?RnZrY3BqQ00xMTdBQTFNMkkwMDY2MTAvQ1pvbVVuNDdWdlhnazVTMHpZcjRw?=
 =?utf-8?B?bXdkS2ZqelU0MnpHcmxwODFOOWMycmlzaGdmemVZaVB5ZytBMzJOUUI0T2FG?=
 =?utf-8?B?UWc0WEl2MldmSEFGSnU3SHVKbjlxd3VyVDcyeGF1WnlsL0x2VzNabVkyd2dx?=
 =?utf-8?B?ZXI5ZXVqcHVrZklpTW5MWHBCcWdENDlSUUdlSjdERW1FTTlmc3JCZ3g3VXBZ?=
 =?utf-8?B?VDdzcWRZQzBOd2M3SE1oWjhPaVEwZGd3dUNzckZhVU01NVBrUWk5VlY5UlpW?=
 =?utf-8?B?amlGL2tvM1Z6YXlKeTY4VTUrbkJFRklTc0YwRVNaUWxEVGdCU2V2SWdmMTRI?=
 =?utf-8?B?QzF3RWVGY011NCtKTHYrUjhmdkhVN3RzSmFjc2ZVSDZEb010b3VwQXhFR3U4?=
 =?utf-8?B?YlRGN01ibGU3U3ZxYXhERHE2OHRmb3pZaU1PSkY3djk5ZU5TeW5XQnZKc1lW?=
 =?utf-8?B?RW44NE9wellwSGN0WGYvMytDdi9pVzlpcjVJRUZpa0V2Mk9tUmdrSUpYRmM2?=
 =?utf-8?B?dFlJVzF1eXArQ3dWblZWRFdaWWxyM1F2R21qQy9XeWtpNWh4Z2JNckFBbnhq?=
 =?utf-8?B?Z0ZnWjByNDJEUnMvOGpkWHBaMFVYOVhGeW1pRi8wM0lZV2lsZTdEcTV4QWY4?=
 =?utf-8?B?a0tYdGtqZjUvZ0Jlc3BsOXNiN1dVdkJaT3RXeHcyUUdNYVh3UTcrRnRrelZs?=
 =?utf-8?B?Qm5kY0N0VVNIckN0cVFkazhEVDBYNnJUS1VXd2dDQlFvNlArRWhhcmZqL0t1?=
 =?utf-8?B?Wks5alYwbldRYmFSaTBtUHhwVXhDSCtLRkp0aGxmYTJUMXZ5MkduYkVkcEZX?=
 =?utf-8?B?UGl0MStkakZPNlJ1RUY3a04xc3RObGpLcXM5NGdRMkk4VnZSKzY5elp6Yk4y?=
 =?utf-8?B?R25Ca1Y1Q0dBWDJvaFRPU2h5QjBmVjNpckJKVGVOdUZoUnF3ZHByUittZlBk?=
 =?utf-8?B?M21aRW9ydmdmM2k0SjdYTGRneE9ya2xDdHlyZGdoZENQQk5GNVpjNXlTMUpG?=
 =?utf-8?B?aE44cXZKTHZicHBnZmE3dzgxUGNHZGtNbzhXMnUzaGZuV29CNnhpbnR3TTIz?=
 =?utf-8?B?aCtjWjZnOUdzSFBkRm5IZHNNTC9rWXYvbElwcVN6TjhlS2gxU0xESXRZY1M0?=
 =?utf-8?B?YnRrcUQzUWtBQWdQblBkd0lrR2w5b0p1Q0NGYnFHaXN0ckJ4WGFodFllT3Ur?=
 =?utf-8?B?Ukh4SGFQSFI2ejNwbjc5ZXlESmNscTdjNjJ1MzIxdDhHNjN3RjZ0NS9GZER6?=
 =?utf-8?B?elBaMW9yM3pabmRJZFFRUHY4dVE0WEw4dFFkMmppUHhrN0hWeEJaYWo3ekpB?=
 =?utf-8?B?V0xDbjFrRmZWNlhjbEl6UUYxc3d2QUYvc3J2STZCczFmTlRYbStRbTFhUjdK?=
 =?utf-8?B?NWJBaTBrOXh3YTV4UkVGZnBTdmFxdXRSV3d4bHRCdWlKMTFsZHYyZEZ6MWx4?=
 =?utf-8?B?VkFOS2tRTGxCbWFmSWtZY0VhdFFJU0c4K1FmQzh0bDRwZjFQODZSYnplYW5X?=
 =?utf-8?B?MU1walFFUEc0KzRMWW9TaE9DS1ROQUFUMDRwd2FYREgxR2lPN2FDQTJodEdH?=
 =?utf-8?B?cEliR1RyUmdSL0tKOXhjcDhHYzg0Uy8wQ0RYQWxwMVRtK2NFREtRcm5FZE5F?=
 =?utf-8?B?eEZ5L0F0anF5YU5rTHhrNUgzMUNHdWxzMk5kaUs2VG04MjQydWZaQVQ0eEdz?=
 =?utf-8?B?YVNGWDNsMlMydGpVYmlIeDYxVUk4MmYveWJSWlZwT0FLWGh3VUQ0WXdRUHdh?=
 =?utf-8?B?SkU0WXZQaklYcGx5NDRRVkZVVzYwNkp4MFFHZnVwaDZob0NtU2l2ZUxUSUNw?=
 =?utf-8?B?MlU2ZEtWYStQZkI4RExIaURZMEdmMjI0ciswZjVxZEh6dVlnaWZyak42YVp6?=
 =?utf-8?B?NmpBV1haOXJRbExlQ1JkeFlZdFlLOFA5aU9nMTJjNy9RWHk0cDhQekE2Tnh1?=
 =?utf-8?B?bUd5L0hmVTJMWEFpbWZKRnZNMStuRk91QnQ1dTh0bmFvSkwvRVVyM1J5eHkx?=
 =?utf-8?Q?hqCGGnI944R0Q7LpJJ3H/gQ84?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79685250-dec4-44a6-2e2b-08da7ec1a7df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 13:25:43.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vr/4x51O+MmP5dAQcuFST+eMY/DM5kSxVwhs+yPVX+lCgY8vrs/XNl5WzGgBO2V2WvvEZlivRdhi9QLwpN9tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2281

On 13.08.2022 03:38, Marek Marczykowski-Górecki wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -669,6 +669,51 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
>      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
>  }
>  
> +#define MAX_EXTRA_RESERVED_RANGES 20
> +struct extra_reserved_range {
> +    unsigned long start;
> +    unsigned long nr;
> +    pci_sbdf_t sbdf;
> +};
> +static unsigned int __initdata nr_extra_reserved_ranges;
> +static struct extra_reserved_range __initdata
> +    extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];
> +
> +int __init iommu_add_extra_reserved_device_memory(unsigned long start,
> +                                           unsigned long nr,
> +                                           pci_sbdf_t sbdf)

Sadly indentation is now wrong here and ...

> +{
> +    unsigned int idx;
> +
> +    if ( nr_extra_reserved_ranges >= MAX_EXTRA_RESERVED_RANGES )
> +        return -ENOMEM;
> +
> +    idx = nr_extra_reserved_ranges++;
> +    extra_reserved_ranges[idx].start = start;
> +    extra_reserved_ranges[idx].nr = nr;
> +    extra_reserved_ranges[idx].sbdf = sbdf;
> +
> +    return 0;
> +}
> +
> +int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func, void *ctxt)

... this line is now slightly too long. Personally I would prefer to
shorten the names, e.g. by using "rdm" rather than
"reserved_device_memory". But I wouldn't mind names to be kept, just
as long as style constraints are met.

Jan

