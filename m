Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD073D82C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 09:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555334.867034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgDr-0004pS-53; Mon, 26 Jun 2023 07:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555334.867034; Mon, 26 Jun 2023 07:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgDr-0004nU-19; Mon, 26 Jun 2023 07:01:15 +0000
Received: by outflank-mailman (input) for mailman id 555334;
 Mon, 26 Jun 2023 07:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6QYu=CO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qDgDp-0004nN-8U
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 07:01:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3935a0bd-13ef-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 09:01:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9124.eurprd04.prod.outlook.com (2603:10a6:102:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 07:01:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 07:01:03 +0000
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
X-Inumbo-ID: 3935a0bd-13ef-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkTxt/okZInFj2gMhp2TxH/+34gNc44O6Xkv96EYbn+UcChgqlTaJzww5jY7hacHJCmdRZFcNpy/FE+ARRt1Ze+OLq7nOKNiEE+BqMBSUxXtZKUSRT6ZoOAyK9hTpb/ibekMdT2wjbmO40KK6uKFnJCiUy4guzDVQjKh/1iC2fMGwh3ycq2hsmgzmZEULbzfLC4v8Iq8u4mR1vle0fkcBmB8FWxl8SErzIZAJ9MxUGzIoTtp+8zTWYrIw4ISJJJq/Ghk3rNZ+mp5VQgZAL86IXkxil+ncrB3yQLns2ocYj+nXg7LQTrHjO0rYP+EyOCqbDdEb9r9R5NJo7PGe9bOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziQBtY/vCXPacWsma6Ji4xwTPOkjPa6xuf7cYjualXM=;
 b=Xxfp7+z9J+pNKYRXLX4r+q8awkgxiZ6D1goPnIS3uSCHRtvOVW7gZms0UpAYbDe5pst74GA/gOrWQ4nE10KNoEhO6NOhJIJ0GjQnq5Ht5CtOdhr1cNNcIZGEl3Y/TlDA3ubvZbNQZkbRf6hUa+0NnLxWpk308VDy6VCvouIRcWI7AXa7V1AWSO2NpnTrE4xiHCKRXunLRQ3VSR05XojPe/x1U8pw0uEpeV/dxBt8UjZvBZdu1PZC7VkCEaYEhw508F3seRaCqO3v6uqvdTr5Z93/O0gaiVcALThuUXWpcPJkG5sl+xXE20VZUskxvyPlSm1DH8XN+fcl5GhEttcELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziQBtY/vCXPacWsma6Ji4xwTPOkjPa6xuf7cYjualXM=;
 b=gCA56LB3BkKXJ660bgwzKjVQuviv/GYyXHPWt7pMOrG9ufbYG2K/UqctJzhgUjuCbc6l6chY3S0qQKpEnBGzn9hADxeLnyovRaXW4bxhx5iuyH2l4egjXbC7Clu0YLJU+5FFH3ajKpIeDbsY7VucLyFvl1iSwFZ+q7YSgUzftwW3f/qwf9s6PNkB4RSpplRBknxEFcnu19vNcjzzAtrbCbczw9HvBHEhLVXDJd6XUUGgEBVThT4+FsSHTSBZhl7LAlgBcp+MjuPnb9EfX80cZYmtUAM4nCl8UfnReSWpqM2sSqyNDAbB9ytr6QhhO7MmZVEznwMiGTF4YhWicjInzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3115e211-7ed6-32ea-892c-a133b101dd31@suse.com>
Date: Mon, 26 Jun 2023 09:01:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 21/52] xen: introduce CONFIG_HAS_PAGING_MEMPOOL
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-22-Penny.Zheng@arm.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230626033443.2943270-22-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: e12c1b78-ee94-4702-3f40-08db76131afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wNIO9qtLEQXh7JmyeqhNwnFVSQ+VbHciX0cJcVGiv5QLhqZ0ge4iocY4DOWIuTHmOfu7WfBP5raPwwJLLrtqrQQbaWwsLA/6E3hYbTwIDmN5g1WcvLaHxZwA5pHF80Eg5QoPnYXz2VUZJtJ2m2MCHtqkTK/Hi4qSWubrjIxQzLzzHAQQ3x/UdMYN8Uq7eOriv9lZOe+e+sp7Oi0CxmLoriGQKTexkyymyPMsqL40e0iq8gXqHOtZJS4i2y/wDm4KWowiR1/Ei3Q3OLz9tVWuBctlhMwqMQl94zP6B8LR9Zu3ABnl75kmTBBBm7072kp0t7jIVYKrS+M7Yw6KAVvLjOEFAr8LaFJmi3RbvYQ2vcQpaJQ41gZmmUqJgpgWVvLmo72Jk8rUhYxxlBqB6IIa4zkCjVVBkGU4XUFaf5dcGFAeNpsomXieSZs0wk07jIhIbKKtQV+aRgMNpiESHIVh5IaTbwkhXfYgbg8Mq9TO/09Z3ZS7ckVtGv0yobffwsw1Z+531y7rh2vd3GfhBMO13d0N9LrfA+uW/i6bYuNY2n/P1XpsgPoNGfD+U7J+R3exH+CyRP4AW1oFUv17oGYTiLVi4mODgnd4lTMu3BuSqZNSAJQGUPpk/fuRaJZO4T0jSMWTanK9QPOeIJKl0BcKzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(31686004)(6486002)(54906003)(478600001)(2616005)(86362001)(31696002)(66476007)(53546011)(186003)(26005)(6506007)(2906002)(6512007)(4326008)(36756003)(6916009)(316002)(66556008)(66946007)(7416002)(38100700002)(8936002)(5660300002)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3J0VWR6eFFNZHA3dkRiRHRHK3Q1TTZ4NXNrbWNZc2lBSnprVXFOaXVjUG1O?=
 =?utf-8?B?NXZCYU1kdWlVelNRazBwTWZLQ1hmOGdxLzM5K044UWlHNktZa1VINVFxYnE3?=
 =?utf-8?B?clgxVjFxbjJCSHdNWGJjZGVab3c4bmtJbnJoRWRUZld6eFFlVFBDWUNlRjkv?=
 =?utf-8?B?dXIrcUF4UC80R1o1Mjk0YllkOG55RkFTK0FYdCtkM3Z1ZFJCWFp4SVJKTTNK?=
 =?utf-8?B?aEdYanJzWkIxZnBXZGR3aFBmbHdWQVBtR2hkc2lKZVhneEtPYTZuS1ZDdFk4?=
 =?utf-8?B?RTliNjkxMFU0UGh2TEp3My9VbFMvU25QSm1zcFMrRzlPSWQ5dmMrM2Jsb1Nz?=
 =?utf-8?B?R21FdjFqcytyTVhDdXZHN0NtaWd6MXMwM05wNUJ3TEptOHdRb3JXOXRrZFhE?=
 =?utf-8?B?MzlyUXFFTUxNSW9KVndlTFVVVmtHWEpzSUlqT1QyNVZ4Q09mSGwySGRDZDAr?=
 =?utf-8?B?RFFCY05GZGxWbGh2MEpYeFdmUXcvOVZRdG5uWnlQM0s2S0JscitreTZ5Ym40?=
 =?utf-8?B?Zlg2WXAvZEl4L1RDdERMRDJHZ1N4M05MT1J1VE0vemQxOWFDeDlodlZ3bk04?=
 =?utf-8?B?RmxGS3dhWkwzaVRBNlRsMkhyZktkYWtzREtNdUJVampxNFAxVU1SZGR6M2dz?=
 =?utf-8?B?b2t6L2lFQ21FUFo2SFFaWm8ySjNkdjFzR0M3M1o1RndSZmdjcENIODhPM3NF?=
 =?utf-8?B?NVhjYkxOZ1BZQzJIN1ZpcXFUakpQeEk1M0RhN1dHUkErOTRKbVdaSmV6aWtO?=
 =?utf-8?B?cEw4bEVBNUpDT3FpNDh5eC9XOXE0MTFzYnROazBBc0sxenlreVlEMUh5L1c3?=
 =?utf-8?B?RE5jREFPaCtySVh0aTIzTlVjU0d2ckpqdWV6dGFOTFUxQXYwV2I2Zkd6THJl?=
 =?utf-8?B?R1BHeHRHZUdBQmJ3c1JLUy9pV3RqbE16ZWxWUzBvN1k4cVVLbzZ6T3lNTnI5?=
 =?utf-8?B?bWxyOENrTEhLZ1lZN3g5dGpWOFp2VnRxZDR2aTNwaGg1NjFOU1RBcE5ucWdv?=
 =?utf-8?B?ZjQ1VHBnTGNHUzM5UVdxeWJhRlNFb1kybEZkQis5UVZ3cXhWWGF0bXV2eVhu?=
 =?utf-8?B?WkFMRTJKQ2RyWlpXMEhCaUg2RnhtUExuOXppOCtxb1BUeWhLOUx1eHU0c25M?=
 =?utf-8?B?VENNS2RGSWxFVWJiVUJmcFpWYTVqOWJ3VXcxaWd0Y0NISm9RSXJiOERLTUZk?=
 =?utf-8?B?dGxXTlBhSnY2SklaQTNkb21Zc05GMkcyS1liSjhiNi9jN2k4bHZpZExaeEJS?=
 =?utf-8?B?czFTaExrYjZjVXYybkVRNjgxZDNvWndJQW9iVzYvNXI2WUVSeXhBS09vVmVM?=
 =?utf-8?B?UmEzVmJ5MlRrT0ZwSTR1czNlN0hJQnZJdjIzOTI1dy9zb3ZxMVNtQVNWK2c1?=
 =?utf-8?B?dlRmK0FDaFBuc2xZcXNaVTZ1OGtrZU94VUMrR29zS3M3ZGJjQlg5YW1TQyt2?=
 =?utf-8?B?QmZXQXRaSjRGSmlIREdkK21aZkE5STVvK29jUlIxRGl2cHFjSUJjNkM0cXdo?=
 =?utf-8?B?dGV4emFhSElLdjN6dE40NFFocS9YZ2thRXZ2RzBpeVQyYW1GWkpqY0RiOWZW?=
 =?utf-8?B?TlBOenF6ZUZDcnMzR2ExT0ZOOXl3dEI2OEVHOUsycVUzOEpxVU1BYUVzTXdv?=
 =?utf-8?B?SmJoUUJiaEFEQlEvSjNYbHh1eGtlc3JnOVJoNHpBUGkvN3pPYkhqLzFwN3RX?=
 =?utf-8?B?bTdZeEZxZEdjaWZqanJpNVpDemdBUFNyRlF0OW5Ma2tHdjhxdzk3eVlwNWx0?=
 =?utf-8?B?ZisrOEx2dUkzcXU3M2h3V2Q0cDRVRmZDNmpmenM5YUd3UUdvaWU0dmNIdlg4?=
 =?utf-8?B?T3dBcy9Bb2dEUmhzcS9xRUVvMHdPdUI3cVQ4MDJCVWo5dlFnZEFWRUU0K21q?=
 =?utf-8?B?ZWlnV1VqcGlHZTcwaXg5S3J2cXZUQ0UzSXZobTY5bzJtY1UxSmFWV1JvcFNI?=
 =?utf-8?B?OUg0MnJJcVg2N1RVQm93dFdvMndIczc5TU5SM0dxdmVBb3FXSUp6UmI5WVNM?=
 =?utf-8?B?bEtBNlFZUHh6OXVnM0RQaERiWDRvSWF0bXk1MTJnNjQwc2JvZFR5MS9tQk02?=
 =?utf-8?B?eE1Ta21BZlBDR0huSjNwNytEWENzMmYzWk9zbW90aEVUVXRGR1FaTTVHdTJi?=
 =?utf-8?Q?KS/umQeNe7bzLi9DE7c22uM9S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12c1b78-ee94-4702-3f40-08db76131afb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:01:03.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HA3dLfcEz6fBcMl+e3SrJvvEfey1kBFnyEgMLEwBjoUNVA1tal+IrtHo1rYTywdt1PypIxL+u+6LB8IJEewwaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9124

On 26.06.2023 05:34, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -54,6 +54,9 @@ config HAS_IOPORTS
>  config HAS_KEXEC
>  	bool
>  
> +config HAS_PAGING_MEMPOOL
> +	bool
> +
>  config HAS_PDX
>  	bool
>  
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -844,6 +844,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          ret = iommu_do_domctl(op, d, u_domctl);
>          break;
>  
> +#ifdef CONFIG_HAS_PAGING_MEMPOOL
>      case XEN_DOMCTL_get_paging_mempool_size:
>          ret = arch_get_paging_mempool_size(d, &op->u.paging_mempool.size);
>          if ( !ret )
> @@ -857,6 +858,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              ret = hypercall_create_continuation(
>                  __HYPERVISOR_domctl, "h", u_domctl);
>          break;
> +#endif

While I'm not outright opposed to doing it this way, I wonder
whether it wouldn't be better to leave common code untouched by
making arch_get_paging_mempool_size() do what you want done.
That's part of what arch hooks are for, after all.

Jan

