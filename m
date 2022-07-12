Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F551571B81
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 15:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365724.596036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBG7n-0001ta-5C; Tue, 12 Jul 2022 13:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365724.596036; Tue, 12 Jul 2022 13:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBG7n-0001rL-1W; Tue, 12 Jul 2022 13:40:27 +0000
Received: by outflank-mailman (input) for mailman id 365724;
 Tue, 12 Jul 2022 13:40:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBG7l-0001rF-Mh
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 13:40:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e75ce4e-01e8-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 15:40:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3839.eurprd04.prod.outlook.com (2603:10a6:803:21::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 13:40:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 13:40:22 +0000
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
X-Inumbo-ID: 2e75ce4e-01e8-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjoF6xf/Dh+y7H5HGxJkzkjB9lw4bxWO4igEmGVw3HSqP49ZMDw0eds7cBLJGSjiF7rBzeT4U12b0n3YGjlp6bj4+SB5i2dfId6Gm/44iwdtSF5xPm+n4Pnk+p/W2ETi698RWWyzdvx9+xxYtIUehrbRZWr8Ce7CNzagsxNZ5W0yQBaV9dec5e4RjAVKnwwohQowiNp9eQvfJa0BB7W9dytmLsn/53XIESHKo4jtpq8ZkT3iq42kEZNdIV82BQRmvqxW5FJ01NjyrVYEWfSK3xvQNvd/v/nsPeHu2Q0pQL/ZChjL4smattW2/m79LaTpIjzhGWtjF9dNJfGnEnNoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yckDpB+CZaEaxjaTr9UPPIv53wpyUD1nhmp+fMCR2Jw=;
 b=C1uryHjtDJw0x0mlgq2X2GcOD2nkjOsExw7vz/+Nito0KMbQkAXfYP1WVmQyc3qx9ca9X6s55rk6KKDXJ1lr8jdmblVTc+vPnHlSPDsLJ3h9q3ujX3QdbicheYG82I0Zu+F5dSBE57+XfG3+WL1ONE6orEbD9k164fbpuf8DEqwtCkcCz9Elq0/nfPlaNzIaiAmGivDROrNedT0nXcuc49Jm28IMC0EBVPp8b21fulvA8G9fp49AbU6zM8CD5hhbzFcHyLKGo0z5qIfss66QgXH5Bw4d4vKNIx2rcFWNMrEfbWxSTzclPm5cRYyCMKWA3TFJbgrW5KOpTbTAgGZvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yckDpB+CZaEaxjaTr9UPPIv53wpyUD1nhmp+fMCR2Jw=;
 b=WjkF0rIefRPVexpPrpDwm3Budfhq1+hYyIu+a9bCh8WnOzBBMDWWqrvIIOZMO6H41tLbnEXimsTEiVJTZWdxJJmd65sGMXWSp3xuH00Q4ZbWUErLxrv8SkXXChydTWBXuLZN0+kz+U5g6IeXnoM2ZcpKEZxfbSMGvpPTZ/5mjQWQy+YWG8cZPVPT7bJV2RKhefqSkq78vnoTJMsnafwrheGOAin3XhMz1ND/O+rzXoKAFplJqa5zFSKNa0Nk7UeSrXbb3xgpFMToRxFv8O3VT4Iboe+Vr6EBRXFi8kGA6GdvsCn5kSBs5l3oMiyGzMWD/IjGSJbrhWlVUa9oF1eyJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b42ac0ce-4f5a-9113-57b0-d85d37bdc65d@suse.com>
Date: Tue, 12 Jul 2022 15:40:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/9] xen/x86: use arch_get_memory_map to get
 information from E820 map
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0321.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36856c2c-d9f3-446d-c7b9-08da640c119a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3839:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BwA+iRsN3ZUeMvlS3fHKR5kQdCqaihQxlxN4h4EVVUeeC4mWhHew1YGYDAhUkRKWKmE9CvdGeW5YMt6WnRGRKFBTXQi3MH5fFZJPSadm51UVACvW6PxklKjk0Ak7R7c7F6Mt+hLn+TDjKVojdFdYYFaNTvvITyYbgQ3hOKdz2uJCZucNlMGbCrBpE8ZtG3TVwFM/COiWX+Q6lbWyI9xEStzmjy+UlVgxK05L08RoUSpCnbV+uggQA7k2G446kosRD2IdRGD3Hh9S0DBxSZSDu4bZhG4l8DMJi9ay6RrkVncHFydAsX/O6GMRJrV8qvlZjxU2SBkxqnl/GYC+RcO9SZC+UdniKQMRUkD/eenjfd78OFdkLKte3a+3JpxInnEiTD/ggmg3+F7LYzh6k4CdOfbr28Y+uEIE4MiSkw3EvU+ENhmtOO6PDpI22RX7VzfJ2YrDDB3VKw3dJnDV+pjJ+JsFCTaMM/letULIxrG0SkVLkMeXqnnSz04z/WqTYodxqfkPVoFD8t0FeBNisPta0SuYOGP1M4nPRZ7AztAtvPipEO2+DO66nHQ38+SvTQD/ckfXoOe3Iob1omBCjo2ZGxblC/uX5YWrbGUGAK17ZCCb3Lde1FFxa6kINCg0rJoh8I8x2DI6WrXPN8LMg55CATSlceowcMrb2zrOUJFpWcIn8zubpn2M2FKbP1hVz/FX8LWpczc8ixMt/710P+SM5mSVWxNaqqJOEfzxAtammJA6hoKKNjKFBvHwcV1BtFeznFfN4D+X4Pl/lHIP8IzgUVXHKgfsWYnsGivXN25OGIbTTUP4wf/uhCoM/lgQleo29KouckPPmwRpuftK35BWzq3CuiLLUS9elFPe9Dwdbvo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39860400002)(396003)(136003)(376002)(36756003)(6916009)(4326008)(66946007)(31686004)(54906003)(8676002)(66556008)(66476007)(38100700002)(316002)(53546011)(5660300002)(478600001)(186003)(6506007)(41300700001)(2616005)(2906002)(31696002)(6486002)(86362001)(26005)(6512007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUVCVEwvbW1XK1VMbVNsSFhCMkRPcGFvZmw5NHFVNUg5ZCtIM0xQcGN0aWtC?=
 =?utf-8?B?QXlTYjFjdU9XZ3ZCOEJuQ3dFUE8rY2RQeWxGYkZJd3ptSHVKMGVZdmR6ZnBN?=
 =?utf-8?B?SUJjUm1QSGtlVUFwTmNhL2Uzb1NQVEE3Z3hDTjlja3dvTzdsWmZ6a01lamhy?=
 =?utf-8?B?WEs0YkFPYTR1bU9lcE1RV3Q4MSsyNWpIRGhyYkZHWnNSM0RZMUVvQjRRSjNu?=
 =?utf-8?B?eHJlMTg2Kzl2Rm1jQ0gwRWdaRFVlOFREbS84NFE4T2hrSDRSWnkwVzNvcnM5?=
 =?utf-8?B?cytlU2U1bHd0SElhMTBMMkF1cHU1QmxkakVoMWtESzVmSzE3b0xzbVJoNGtY?=
 =?utf-8?B?VzBpSWR1YUJjM0F4Q2xldXB6cmpmdmFnRkdVcW9DaWc0NGpkMThYelJtcndn?=
 =?utf-8?B?cEpnVk9jU1k2Rm84c2lHWXRVRXpVZHZpUzV1d09GeWc1NU50V3JFUm1ZNzJG?=
 =?utf-8?B?ZHpNOHNkUmlzR0pYWjFOWU1xVnhRUitscVVncWZGWkNWK0hDaFIvbC9JOWdS?=
 =?utf-8?B?Q3BOUVJOWE5HOU9BTW51L1VBaG5vYTVvTXZoNFNodGw3dkpHTGVLb2pXQlhL?=
 =?utf-8?B?cXl4dFVSV3poMU11Qm1MR2VtVGg4YjVVV2wycXNVRjBNRGJnVEN5dVRzb2Jl?=
 =?utf-8?B?blFXdWZzajcrbmh1RWl0VnRIZDZEVVpsSnJTbDJqK0FWbmJkamZZcUhwTjFp?=
 =?utf-8?B?bGYrcE1iRlhaa25BRGw5V2RGZVlEZUVIbWhCbEZiUVZiMjZldTFCbHNwSk91?=
 =?utf-8?B?ZjNiWjFXMVFvZGtIME9GQ05QaFpBdVQvcFBEZjIvcmFZOEZiS3JxVHl5dEZF?=
 =?utf-8?B?NUEwNmZrZHNneW9SdmlObXBnMDdtSmtCazJYd2c0UkJTQ2l4cVMweGNvR3BF?=
 =?utf-8?B?bERFaHNpWFl3K0RSN0JkbUxRaUZJT24xY09ZdHZ1Vnl0b3VEVUVoaXNNUnA4?=
 =?utf-8?B?MVhiL2pMbHl1WG1wUHprSFJBaFoxaGZVWmdNQms3U0hoeWl0UnFudjd6TkVH?=
 =?utf-8?B?YTl6bW13M3FpdmhvOGpiVElzMEFid0FGeS8xU3V3dlA3TDFsQ0xobThkekhX?=
 =?utf-8?B?K2xlWHIyWk9jNjZNNnpVS1kxaXpTbnE3S3lCZG0yWURGNEozSE9FVFNNdjZN?=
 =?utf-8?B?c3ovK0IxTE43MUVsZWJNVGU4NDFrKzZHaS83eWZIU0lCK21xaUtSQzBTVGNL?=
 =?utf-8?B?Vmo4VkNZMDZmUFBXQXV2ZWJsaThFMEkvMTY0UFd4T25Wbjdlb2hpaFF5SFQ3?=
 =?utf-8?B?dnRpQUlaRzA3N2NjU0txVXcwRGpDaXZxbCtaNlNJS2tFWWw0YU9CNE81WFpH?=
 =?utf-8?B?clFPcERkSFY3dk15VS9rd29XbGpjNjA3cVFxdHpLdkZrVDViNC9hM0VrbGZx?=
 =?utf-8?B?cDJVMFlMVTNlN0dmbFk0NzJRaytSVXJ4UmJwNXZaNGEyc1NaZ3VWOW85TlBu?=
 =?utf-8?B?bjNKQWtadXI2LzR1NklGaFdtUEVmNjd1VzNsVm9DR01LTUZHU2hWNU1QR1JC?=
 =?utf-8?B?NUgwZFdrZmVmMUFyMHN2Y0srUlMzQTYwQ1E3NUNDYXhNdnJSbGpPT2ZWUEtB?=
 =?utf-8?B?cFptdzYwUk1LL3E1TjJWRjdlem5KcXRJUyt0T3UwVGNENWNQc2U5OC92WFE4?=
 =?utf-8?B?Q3Z0bVRxbnVQcU9PNkJkcnA1ZUFCV2RkS3JzTy9IcEZrblRTN3Q3MVZEKzY2?=
 =?utf-8?B?S29pN2U0K2QwSmZZczJJbVBqaXZLa3FtK2JIQktMV3U2S285NVd0U2syOGFG?=
 =?utf-8?B?WWtvYzdKTnBsaU1YUVp3R2ExVWRFeWhkSXdLVlc5WVNDMzJ6VFlzeTNXNXFG?=
 =?utf-8?B?WDBaYmx0Wm81b3FBbmpML2pENERrQVdMQ3ZaaEo5Sm16QmpHQ05DYks0dFVQ?=
 =?utf-8?B?cDNjNzE5dVVRaUowQ2FEZ1YxZlpNQjJxazZkVmVtaEtRRkpiT3h4M0g3RVpo?=
 =?utf-8?B?VURVUlZxUm83ZEN5S2E0QW5kRk00TU9lWEgrc2g5RE1wMmtXRXdEdVpFTks3?=
 =?utf-8?B?ZTRtWDBkSE5tMlhENjBvT2p2VVJzN3diVTZ2MFVobFVUcnN1VlJlMFduR3ZO?=
 =?utf-8?B?M2s1dGlIOHhBTUpVa281Mzkza2k2S1l6NlVFcHZOU0h2eC9TeU1zVGFyc2VI?=
 =?utf-8?Q?F850LXQkDlc8ZdBtcE5QthTae?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36856c2c-d9f3-446d-c7b9-08da640c119a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 13:40:22.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7L9UH3bNdoqk0w9vyLCsSt/mvPKPQ+PVyBo91G0iFYuA67rYcVDUvgjPaJuKqudzs243Fj/aW7/uaVJf0Ukdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3839

On 08.07.2022 16:54, Wei Chen wrote:
> @@ -82,3 +83,25 @@ unsigned int __init arch_get_dma_bitsize(void)
>                   flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
>                   + PAGE_SHIFT, 32);
>  }
> +
> +/*
> + * This function provides the ability for caller to get one RAM entry
> + * from architectural memory map by index.
> + *
> + * This function will return zero if it can return a proper RAM entry.
> + * otherwise it will return -ENODEV for out of scope index, or return
> + * -EINVAL for non-RAM type memory entry.
> + */

I think the comment also wants to spell out that the range is
exclusive at the end (assuming that's suitable for Arm; else now
would perhaps be the time to change it).

> +int __init arch_get_memory_map(unsigned int idx, paddr_t *start, paddr_t *end)
> +{
> +    if ( idx >= e820.nr_map )
> +        return -ENODEV;

Perhaps better -ENOENT?

> +    if ( e820.map[idx].type != E820_RAM )
> +        return -EINVAL;

I'm sorry, this should have occurred to me already when commenting on
v1: "get_memory_map" doesn't really fit this "RAM only" restriction.
Maybe arch_get_ram_range()? Or maybe others have some good naming
suggestion?

> +    *start = e820.map[idx].addr;
> +    *end = e820.map[idx].addr + e820.map[idx].size;

Nit: Would be shorter to read if you (re)used *start.

Jan

