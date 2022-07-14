Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28943574C7A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367625.598701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBxNf-0005Eg-4c; Thu, 14 Jul 2022 11:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367625.598701; Thu, 14 Jul 2022 11:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBxNf-0005Co-0h; Thu, 14 Jul 2022 11:51:43 +0000
Received: by outflank-mailman (input) for mailman id 367625;
 Thu, 14 Jul 2022 11:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBxNd-0005Ci-Eo
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 11:51:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5248c70c-036b-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 13:51:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4783.eurprd04.prod.outlook.com (2603:10a6:803:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Thu, 14 Jul
 2022 11:51:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 11:51:07 +0000
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
X-Inumbo-ID: 5248c70c-036b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYq/ARUONuBH7Yzjy3+s55DRn9H1OZ4f/4hCTMdw/WZ55diKm6z7OZ8BN4tIrrIOzv/GUBEVoxXFF9Q0cv38KzXxeddkxq4wZVQvYLEY9r/NL7UxiT3W4fnDe9SN7m0vnCBkneW0QzLa85WHb/OJai31unPR9YyTHisZncdpe7DoICyWDp01HXOTpX3lrHdSSvscLc41iuCjvMcSWdFGsSUoHh6aboFWmBgQrynUlaiwP3rUwKbacZKInmrGR3KphQH/NregoRm2Rpu7vZ/YNRVlnQG45NQJlEvxRspy8/PUP8HvS/Pd3Yx8Llxt//UL9MlmjCUwocecHDpbb1tkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRJvKi/TcqUW/3TSHShq/4XKra83Qjczh2+hSwFAFZk=;
 b=dq8nnzlDv4IzpCTpR/dtHCB1f40tvepGlQOLDgYrXZSz1ZbA2vpg2aprQwUh+VeUmWjVHD0c/T9j2MPV1AmPZ4oXvi2uMi7kOGHmgWaFC3ol5qjLTCKVE91tz+Mgoh3Tch7Rtm92xqcMXnmn7Hl6eeF9oh0MHkY92lQXu2o85Cy7QUysmiyxuvA4m1Nrki5sBMnXu+vu5E0MMPRB8pa3QvCFV8jMdKnt6UfYd/Byz2x+7uSH+A1aEh0WFDGNluuNhAermVxs1ZlK7UkQrWHoYImfQ9GMqpK4HJkoFtsflf9oW60J7TOhr7MHHXhVbHGfW5h8SEGT26uzQy4g0h0Z1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRJvKi/TcqUW/3TSHShq/4XKra83Qjczh2+hSwFAFZk=;
 b=ys058qn5HSILyprmaZNCu0IYy3RfVUKfECj1eYjMtX9F3TFs6tq2UAWRz7ZiWWvH3iySpZ/UZRWsY3bzNteEBGKfjuHDGpm6BVfR5dJfGL2+7cc4uWL9rPXhFq91zLLa312pss+n8+sZXH+O9+OHkkwah3fIguZAXziKErcEPQbFe7T9Cx293eWjP5+TnfEJ88d9V2A7rMZyq7NvoBURYTwmZdyEdw9wl9jdKfIc5HDErVnhCb2IixTBtHTwNswHoZg/4oK9SWn5DJpMDZsgaHwqGltKcPS9byVqiBgLXVz0oUsqN1Yn3YL7TWBGLElj/hvSg0m29Na/m2XuR/XldA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a259bc09-710c-0c19-60c8-f7fa310357bc@suse.com>
Date: Thu, 14 Jul 2022 13:51:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 8/9] xue: mark DMA buffers as reserved for the device
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <0a30e15d9195d0cd09a5ea94297dc8a74bc12c97.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0a30e15d9195d0cd09a5ea94297dc8a74bc12c97.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 726d4715-afc4-47c1-244f-08da658f2394
X-MS-TrafficTypeDiagnostic: VI1PR04MB4783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iVcvopmGeQBcqdFO10gpyfonAMFferdQElMCuCglz2qwC5zgOSGPlTeSIJPP//730LCtHIy0b9gm64lO5Vc4ngi12Lt0DuyFojg8oj/pJqTLsR+/94aJfPbKLYvmfz3AC7kTCyrYbm9Gki/sxFywY65QBAcE/tHKspujYtd9PisGC0BGBathn3iavFAM5SoezbTz7OS5FJLcChn4bOzlGtKaAoJHa+zfFqzmXHiZEJp04r/uC2GUJFJ+RHdDEsRkUF06jgL4w8cmBO1iXcFYSm2aFYV/p0Fr/zAipa9qRyhb7KP/pBJ/a85H785gXJR2iBrZz1EZLdNUR747In29N01g+g2R6GNTqCZt0BIy7THGN/zEEC/iOVdVWbvIMhxVhvpavc2ncj2NzI4KQ244Maq/285StdryeDJ/KEDTtmL2JmMa3qPdBdC/qxhCTW0nTbSGkPNe2DfeFsfceFsfjIUsHqdkb6UA6sBdqYROLZU1U/ZbSpCVo2kvrZBaVAUyOTX2rS87NvM3HSx6NziXI+bQkSf0UfFxQS5gJhEK7tVzTIlIH0bUxerFwFTgfupjMnPG31zPenNFqZ93ezal0QVWVDyvfdu5eFMb57SG+SUc96pvM4HNS66oqdPTQovV0cS/3QmrmMr9e35uDji2syv6kCIbohcmzrQCC/O4x/ZjZuXCzPlcTbMfEZ0EujwrRuXEbFO3PEL8zWUQWPxHKKH+Q9hSpoHF8etCxq0n6yQkPFSlMRHPPXbL4c8QVIhHwbdraekVsiKNB/eI8dWb9BIqJkjfQR4x+QX2wjflcbIGuPmAoU9HSK7HQuG2hSRDZZGP6HrSxzjRoy77ZqGke+R5SzSmCg/yieNwJn/j18w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(396003)(366004)(39860400002)(86362001)(6506007)(83380400001)(53546011)(186003)(6512007)(36756003)(6916009)(66574015)(31696002)(8936002)(2616005)(26005)(478600001)(66946007)(31686004)(54906003)(6486002)(8676002)(66556008)(316002)(4326008)(66476007)(5660300002)(2906002)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0s0dUpzcjd3aExuWEhSdXV2enFaVklpWVJQUmhnYkozL2FGY3ZuWTNQc2lN?=
 =?utf-8?B?bThkeWo5R2ZLNFkxNGtCTTFFRjJJSDBhSjhaTk9aYkgyLzJzZCtNdUVVWXpV?=
 =?utf-8?B?RldQWksyd2VmQjc4QUN5bkFWR2ZuMFE1ZG9PWUR2Ry80U0xSWkloeUdOVm11?=
 =?utf-8?B?eUVLek8weXRpdEdmWWJuMWZnajFnTXVTSjg2Y3lJd3d2UUVYMmJ6ajNVRnB4?=
 =?utf-8?B?a2tVTGJLVldqbFVVbWhFTEdDSFlYeUtMMmhWZHcybXhRRElJbzJ4RlJBcDNS?=
 =?utf-8?B?ZWpoRlJKUnNXS1ZYamNmbWF0RWpVZWhkQS9TVzhXMm83aWJkL0FSd2l4RG94?=
 =?utf-8?B?SVVwS0JhdzJpODZLZzJSVUVvVWZPdlJSeXdFaTFieVpjaUU3LzF5V2FpTmtH?=
 =?utf-8?B?dU1IbHlJWHBXWkVadG1MaTAxS2Y1d01BeThxVlMzSHFFV0xjSXB5WEJRMFRC?=
 =?utf-8?B?SnVIeUN0cjU3TEVTWWpISWJxcXFKd2xueDd4TzZsR2x1WElzcFZDUXowTUFN?=
 =?utf-8?B?U2piQllUVG5EdTg2RHhWd210WUN2QzBZZFF2M2JvaFlaNEt1QlFtQVJiREx0?=
 =?utf-8?B?Z2N4K3Boc042WlZCT1hHelB5YjJvOE1wMk5aUlpVamFjVjMveGRsSWZYV0tq?=
 =?utf-8?B?dWlkSjhielBJckJ2T3RwaVV0VXlzakw3ZlIvcWM5dG1UTGtYci9ObTRIVzRq?=
 =?utf-8?B?WEJDTjgvdnpJMzJTUHY5bVA5REFBT2xhdzRnUjhNQ2xzTVU1bmp6U3FWNExm?=
 =?utf-8?B?dnVWTjN0bjdnWTcrQ25RUFNiWGVRbTBiWEkzZkdjeXZyVG1YbW9CcjllTUk1?=
 =?utf-8?B?NDNPWnZrVENsdWU3aldMak9RWGo4YU5wVENsSlhwZUFqSWVsL0NtUHdiWXZk?=
 =?utf-8?B?UTNWQmV5NWdodVR1SFJGMVAxMjNPM1AxdElQZm1iSDc5Nkttb2cxS0dJMkZK?=
 =?utf-8?B?Vk5qZG14N0I4N0ZUYmNJT3ZUUlNuRnRtRDVBbEtYK1ZZcDhkZ2lOSlVzMjh6?=
 =?utf-8?B?RHpwT09mYWpaQ1ZnaFB3ckpJUTNVYXdYWXROZ3Z3YTFlN3FNMFRGMXlERFds?=
 =?utf-8?B?M0ZHNkc4OHBGcWJRTTFQZGh1NWwyMWVVdGo4VHBEMms3cmFZak05QTYwZHBm?=
 =?utf-8?B?NTUzcnR0OGY1UVFpcW5jZzBUZjBGcXhnaDNiQXFkQTVMYU8rVjFnNlgyS2NL?=
 =?utf-8?B?Q0xuN0xCWFJHTGhRSURMdVFYVHNvUVZ1eW9JejZ4UHlxMTJ4UjFGMmxSRjRs?=
 =?utf-8?B?MHo1cWI4cTl2dEtmUmpWUFRJREFibjlBSzFPUzZzOFFDdngxTktaMFJablRu?=
 =?utf-8?B?a29sZS9SRGFiT29BMENteGR1SVROZ0ZiaU5yZFRnbjZKYmVOWmlHcHdPbGdo?=
 =?utf-8?B?SWZHMi9OSUdrckdLZkN5a0RSUExFUUhSS2ZIb1lOM29UTFlUeXN6SnJtbXc2?=
 =?utf-8?B?T1ljQlVYK3JBZkxReWRvalhTSWJLZ0p3dGZUbjRkcXBSc2xWRkROT1pIZk9B?=
 =?utf-8?B?U2JzcXFGZkdMTmYrSEkvdFg4RUh6WWpmKzIyYXpoWm15M0hPOGFBUzVpSmxG?=
 =?utf-8?B?dXpSaWc3RkZlb2FQTGIxalJvam44VlFVZUNWb3g2YnRwMElZTmlzcERybSs2?=
 =?utf-8?B?YjRXMlI2L2lzMzZiKzdROGJNVW5ZTmI0Q0R5eTFCSkFVR1dUeEsyczRCUzdt?=
 =?utf-8?B?QlB5Rm9pK21Gd2pveGdMbEpUMnpjK1JDMHB6dURmb3paWlNock9LTnZtbjZw?=
 =?utf-8?B?YU5SVEV4b1JXd1hRMmxnR3JJNW54WUNsYXltYWh3bXVBK3FlSTVTMG1LTWtJ?=
 =?utf-8?B?bXdjdTFpdDBnWlVHams0bm9zREcvQS9qRlBHWnliV01PNTBEbXlHdEVLVlNZ?=
 =?utf-8?B?ZWVKakVacE55SGJPbm9JQzFjYkVzZ2tlakN2SElBUE00U0E5anErdzJaU010?=
 =?utf-8?B?SjJib1VXYUdCTFUveUd3cUlLbmo5QTEybndJa08vdVBkc2pSU0pab0ZqVmY3?=
 =?utf-8?B?WkQ5TWQyS000REttQndIRFBuaUppV2w1aVpmODNPdkhOWUJVdWd2cmFLZmtZ?=
 =?utf-8?B?cjVNc0pmQ2NtMzhkVDFReitQdHk4Rm03NDN2OEpVWVJVL1JuR0tIYUcweG5Z?=
 =?utf-8?Q?9Znhh9Qh5zQ8GtAm/oYSm3u6f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726d4715-afc4-47c1-244f-08da658f2394
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 11:51:07.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msmrhx5rUx3Xnr3IMLyXRigAPNAxMTb79wYkoR7Jwq6GNTYGfjCe1bv7qW7906u4swl9jZNeCfhyCdKE2WEx/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4783

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> The important part is to include those buffers in IOMMU page table
> relevant for the USB controller. Otherwise, DbC will stop working as
> soon as IOMMU is enabled, regardless of to which domain device assigned
> (be it xen or dom0).
> If the device is passed through to dom0 or other domain (see later
> patches), that domain will effectively have access to those buffers too.
> It does give such domain yet another way to DoS the system (as is the
> case when having PCI device assigned already), but also possibly steal
> the console ring content. Thus, such domain should be a trusted one.
> In any case, prevent anything else being placed on those pages by adding
> artificial padding.

I don't think this device should be allowed to be assigned to any
DomU. Just like the EHCI driver, at some point in the series you
will want to call pci_hide_device() (you may already do, and I may
merely have missed it).

> Using this API for DbC pages requires raising MAX_USER_RMRR_PAGES.

I disagree here: This is merely an effect of you re-using the pre-
existing functionality there with too little customization. I think
the respective check shouldn't be applied for internal uses.

> @@ -952,13 +953,21 @@ static struct uart_driver xue_uart_driver = {
>      .flush = xue_uart_flush,
>  };
>  
> -static struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> -static struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> -static struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> -static struct xue_erst_segment erst __aligned(64);
> -static struct xue_dbc_ctx ctx __aligned(64);
> -static uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
> -static char str_buf[XUE_PAGE_SIZE] __aligned(64);
> +struct xue_dma_bufs {
> +    struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +    struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +    struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +    struct xue_erst_segment erst __aligned(64);
> +    struct xue_dbc_ctx ctx __aligned(64);
> +    uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +    char str_buf[XUE_PAGE_SIZE] __aligned(64);

Please arrange data such that the amount of unused (padding) space
is minimal. If I'm not mistaken the page-size-aligned fields are
also an even multiple of pages in size, in which case they all want
to go ahead of the 64-byte aligned but sub-page-size fields (as
per an earlier comment str_buf[] likely can go away anyway, being
the one field which is a page in size but having smaller alignment).

> +    /*
> +     * Don't place anything else on this page - it will be
> +     * DMA-reachable by the USB controller.
> +     */
> +    char _pad[0] __aligned(XUE_PAGE_SIZE);

I don't think this is needed, due to sizeof() being required to be
a multiple of alignof().

> +};
> +static struct xue_dma_bufs xue_dma_bufs __aligned(XUE_PAGE_SIZE);

I don't think the alignment here is needed, as the struct will
already have suitable alignment (derived from the biggest field
alignment value). Instead please consider putting this in
.bss.page_aligned.

> @@ -990,16 +999,22 @@ void __init xue_uart_init(void)
>          xue->sbdf = PCI_SBDF(0, bus, slot, func);
>      }
>  
> -    xue->dbc_ctx = &ctx;
> -    xue->dbc_erst = &erst;
> -    xue->dbc_ering.trb = evt_trb;
> -    xue->dbc_oring.trb = out_trb;
> -    xue->dbc_iring.trb = in_trb;
> -    xue->dbc_owork.buf = wrk_buf;
> -    xue->dbc_str = str_buf;
> +    xue->dbc_ctx = &xue_dma_bufs.ctx;
> +    xue->dbc_erst = &xue_dma_bufs.erst;
> +    xue->dbc_ering.trb = xue_dma_bufs.evt_trb;
> +    xue->dbc_oring.trb = xue_dma_bufs.out_trb;
> +    xue->dbc_iring.trb = xue_dma_bufs.in_trb;
> +    xue->dbc_owork.buf = xue_dma_bufs.wrk_buf;
> +    xue->dbc_str = xue_dma_bufs.str_buf;
>  
>      if ( xue_open(xue) )
> +    {
> +        iommu_add_extra_reserved_device_memory(
> +                PFN_DOWN(virt_to_maddr(&xue_dma_bufs)),

virt_to_pfn()?

Jan

