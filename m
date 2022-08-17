Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5888D597174
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388993.625786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKEW-0000cs-43; Wed, 17 Aug 2022 14:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388993.625786; Wed, 17 Aug 2022 14:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKEW-0000aF-0b; Wed, 17 Aug 2022 14:41:24 +0000
Received: by outflank-mailman (input) for mailman id 388993;
 Wed, 17 Aug 2022 14:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOKET-0000a6-S8
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:41:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a80254b1-1e3a-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 16:41:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5313.eurprd04.prod.outlook.com (2603:10a6:208:c7::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 14:41:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 14:41:14 +0000
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
X-Inumbo-ID: a80254b1-1e3a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiB7iVnDnqSKs8BUm1SVtjg6XVreLuNOXvM/iUa/26gbO9RRuKa69Cu9NFHyVXpPD1RGUefRSmzgnfMGTEfmvkcvDAaWNF84vZ4Kuw/lcrs0ZhXU/zmIKXfunSFA5pjiWK+R74Ftj0yzN2YkitBUQfcByIYB+QcNPbmtMR3Zo4Da8Pg1FTzNdXZL8xYYWWfzETbyy8u1A6JnGqYSLcLTILMwtqNMNzHeA7tuec0tlN1FwqO0uXiyjZfm7LGcKTs0wU14DgLcCzeWSP5ClplZpDXFeJytAIn3QEgmGiecUpXs1dIV9xbP++zmp4wQ+eUxRhl3PFuXFh8RJ4BcZXLrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8uwe4jog0+UmSM27cT6RB4SwTz8PGxXA8vTvaE2CtI=;
 b=YURhSH9XKqGPqcFtVpnvqoRw/b4xsLGQPaqaOQGETzEz831og+gtQnimo+wWT5BAmAupCq9YYXyQM5MESHt/6YK+TJlaUu4m9PNcESGTKamDQqMmDwISNmg0SMh59xGwJjhpja+4GNvCVQypjF2A5Sw6OPlcpJlCTA3TpVWdSRjoY3i3vas05O/Szb5H9R1xsCva8qp6ScohT3fbkLCTElrpDRMVft2idk0+JK2UDYOYAyBG1jdY7wTdVu90+ozjZiVvACnLX2pJjJUhY4xEUkfecZB/cZlGVnn3Phb+BKK5iPIHOiltoxGomwziYT/qNGOQlXsaqWXax3iWXj1Dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8uwe4jog0+UmSM27cT6RB4SwTz8PGxXA8vTvaE2CtI=;
 b=oFvRj8915Q2d5ft5CLZfoEgnISmtCFDbhYKrBTo68lkopmGwsxIpO+w5wOj17Q5kz+knXA8mYNt8wjzpxZZ1bHBxl0+ZCwtBETtugndQKhzook4sJsrrkkkMh+KaY+P/KDuxKwm7CORf/LJ9m6HrsroiB9QUCA9BbyNur9qJ0Rk3/Bfig+s/yeireXFN0CmLRaLyXPtPqaz6Q4E65F7KsAf+344Vc0SZXRqiNa3XHG65trfmQjvktcOZhNVR9PYnK+zcIe/sg2qRxRtLl9+yr4Dkod+R5PefuNIbftmUkK1CJLpwuCgG4YJtSXR0f5iDFTzDjlm/v5p5YGIcvMZ8gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbd8e717-8edb-eb51-8849-d12519c5529d@suse.com>
Date: Wed, 17 Aug 2022 16:41:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 09/11] drivers/char: mark DMA buffers as reserved for
 the XHCI
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <b3d917bd1d46393857bd82bcdef9d4486d8f3945.1660354597.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3d917bd1d46393857bd82bcdef9d4486d8f3945.1660354597.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3844efe1-5834-4058-2503-08da805e88f5
X-MS-TrafficTypeDiagnostic: AM0PR04MB5313:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kO0BUR7j7qPLzRXWa0R8cV16Mui238lfUQhqB1C0foZr3tCcOtbVWIZo+5CFk5P3cQAUXLIPZ//8nFlMxBfo1g1F+jCT4GOrZ4+ALBlKvJ3iLE/qUasSuXWtcfBOTHv3WlGZSLA3Xkdl45g0rluDAL1tNUR3S5YUccwzls4g9QL3PtSGULvXs4Ah0X/MQLAKw+cNQN8S3A8FrW3lEdZFerwyhuP4sONbccWf+ZdEzmCZ/b9mVV1usMjNiF5rFZT+yKeECn33/NsELyfEVQzy/ek6DvdUVQpySZwe/FRUP4bLcqrFw6KKVX8vX+PUyV+Gchxm8ZX8yQn7jdlLY+2be5EE3BE0zOZ27wx/kekajgjtTLVw0ugtdaz4aOlEW/onSuY9cdXfgvchr/i/ig6T+v0tj4LIDulXX+iLli0UB8asPXI2Fe8fJmP0XslojzzQZNxe/9HnPqiTl0r4GHeo/EEu1ontumKYpi7DP+h8f5tdG3fgPhiY3DjAmOCXoF2GzE7XG1CZOAYrZxUkzjdAaWX6EU//9TffIQJY/dkcYQNRbDLbvTIzubZhjUX5wsl5j+n7+otpE3Fr6IGdxITAVg/qxSkaNdKQKj0bnJlKN1CTIfTvk0ZEeIAzr+5fb7e4qHyddk0/AMEE33JVBecPQ/P/wTIu4jNza/aKS1ArpnDDQw01gTsvKNSWQeG+cMQhIDc7uOJG/mEDEDTbbYGC9QavzkGI/jOJGDTP/YREpw6BH3xKmaZRqdiPrrE1mTZj8hII/T7kLzJo1IuKfVjEql9XKlHmOQtw1YTVw1zm9v3XjiCeMv7v+MMjgL5Dq1wd/3T2fwK+Se+7cxucaXPaGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(366004)(39860400002)(396003)(41300700001)(54906003)(316002)(478600001)(38100700002)(4326008)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(6916009)(26005)(2906002)(31696002)(31686004)(36756003)(186003)(86362001)(53546011)(6506007)(66574015)(6666004)(2616005)(83380400001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDFFVDlKTFlsWk5TRkZJVHRCYytnY3pNNlBKV1pnNktDMDNaRmtnNDgwbFRE?=
 =?utf-8?B?MTJBbGtWR1VkRE1qR2VndEJLOElCRDYwc29Jc2Q2eFVXY3lhL0dCK2MrZnRa?=
 =?utf-8?B?ajNOK3cvSGtqSjZ6Z1VEWHVibkxDdUJEeWRxcUhlOGFwY3hHdVFTOGlRcnFJ?=
 =?utf-8?B?emdYdmdrRm0zN0t4RFU2c0J0UlozN3pKcDEyMnQxSUhJcHp1V0p6dmhZNkwx?=
 =?utf-8?B?Q1BGTXRXWWU2SzNLelJYcURKd1RGWEtmRlpWQkFZK0c3R0dMeGU0TWlHL3Iw?=
 =?utf-8?B?dW50NXBmcEhIQ1o4WHhTWW1YNkRmNW9RZGE5bHlLNFF5a3JGSzBUL2hyL2xU?=
 =?utf-8?B?OUM5M1gvWlh3MExaaWdoZ2V2VGJxcWVyVm5EMUNMWFhoTk1vQ201Wk0zRE1h?=
 =?utf-8?B?VElwZ1pRL0ZYKzZ1L3V5ZnlzcDVNNDk1aGxkelpOOWcxallHNTk1dnBwWUo4?=
 =?utf-8?B?UzNFeDlPaFpuWHRRVGtrSDZiSWEreFNkRmpubmFWNktlNnFNSnd4K0ZiWWZB?=
 =?utf-8?B?VndPL2xoZUhZczFKOENhUncrRDJiMkgwWUdNS3RmWno2ZWp6b1J3aVNIL1ha?=
 =?utf-8?B?QWdFVUl3U1J6UFlFTXdxbllxNklBSkFPdVRINStpd3FhNlRVT3MrUlFJY0dZ?=
 =?utf-8?B?SDRJRnluWklxckdZR3NWMUpNd0dua0lEREhYRXZDZXJUQkJXWnd6cytCeHpv?=
 =?utf-8?B?allRRFZ6dWJ5NDlTNng0QlBta2I1SkJNaGV4eVQ1Y3pVYlNBSEQ4SGhPeFRj?=
 =?utf-8?B?REEwaW5INHJZSG1lUDgyQ2E2NGVqZkNwc3VqSU5JemMxaHVwRnlLYUgycmtp?=
 =?utf-8?B?VDhtK29DQ3Y1OFhRYzJkUW81TFVraDByTk5rYkxCcm16VmJMMHlVTUxmdFlI?=
 =?utf-8?B?Mm9wUERaS2l6bXdwdUMzMDliNVpjYlhLSDJHb1VaOHE3UlZMMjIycm1TZkd3?=
 =?utf-8?B?a0g4QWxXc2xxc0Nib1BtUERWdWtjNXplUkJKNmlGMmJObWZGL2hvQTluMFEz?=
 =?utf-8?B?QkFSS0lMYkZrVXh4U2pjVGR3clhWdTJuUnBtd0dSWWhTNmFBQlEwVmh0RzFs?=
 =?utf-8?B?NU83aW5wUlpXTW1RUkYySFpVcG5pUDA4YktudFZPSC9hUUdxbGh5ZmtpaDlq?=
 =?utf-8?B?YVUxeDlVUnI1U3BMWWtOaUtkWUw4cjNjcGkwSHh4UDFmeHdnOEwrV1hTK00y?=
 =?utf-8?B?V2hHVDN0SjFId0Vod2ZNbVZtL1lJQXBKaC9FbjhaVFhORklESklvUVpWdlJZ?=
 =?utf-8?B?RFEvNlNTODUzUWt2Q2VGM2E3NTdsRGV5MHBMcUZZdUY0d200UWlTeXZ2bmtx?=
 =?utf-8?B?OHBFODBPcHdvVi9mNDRNamM4d0QwRmJhaHlrUzI3QWZMeEpWUHFjVnRSbjMz?=
 =?utf-8?B?UHZ0MGU1N0pmdzExVGZHLzRTMThoVjFrUXRRc3lUWmpNUlgzd3ArS3NEeVpX?=
 =?utf-8?B?a0d3Nk5EWVdmd0s3OEI4S0piRnZvaFFVV0h5WDlmeHZvNkx5SkpXT25lMUd1?=
 =?utf-8?B?M1lsY1FkYXFhM1NuejAvRGNTUEJDSjc0eFU3bFgxcXZUQWRxK3JDSlJHSkk4?=
 =?utf-8?B?OFFyZ1E1TEZNYVFUOHVlLzlHenB2M1RiSW1wQTJudXQ3UWkrdHNXMnBhMVpt?=
 =?utf-8?B?U3dFL0wxc0dydURYWTA1clRQY1FvQ0JMckdFRE9abFZxU3Avd2paSkNmeWhS?=
 =?utf-8?B?anQ1emZ0Y21JenZJd1NWNlZUdkRBSTl5eVJhL2JkbFVLaDdWemNlcWlLeW41?=
 =?utf-8?B?U2dRRVdVZG9YdlNzUVFLQXJCNkpGNGNybnRNMk5oUlhEeVFGU0gyRE1ZSjY5?=
 =?utf-8?B?MW84eGdhV29jZ0Z4NW5MN3JUUGc4T0M3b3pHMUVOb24xZ3B1UGRmY2JsZEtn?=
 =?utf-8?B?RDUwaVJLU0V2MFpmenJURFhjUWpXZjNEV3laRCs4YjE0OTJIeFZ6RVk5ZHFY?=
 =?utf-8?B?bTJ1Ry81aC9WSU5xbFpZU0hRQXNMY0pDL0xwZWMyQUNGNnlJL05rMmhOSHVI?=
 =?utf-8?B?aEhJNlBqd1pPTWNkV3lHVjhldlJEeGU2NEtxUzMyRDMwV3lmaHFsNktQQVdY?=
 =?utf-8?B?Q2dpODFZZlBySmwwejluSUp2N1BPejlBOFQvY0tzYThrV0xwNkw2QUNNenpM?=
 =?utf-8?Q?/UsAegd/+jqkWVpBml5nmWvGv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3844efe1-5834-4058-2503-08da805e88f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 14:41:14.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JcYy5AjfFio4xm26xTg02t7E/75ER7pn5NLx4rktwTwrzff9RIlARn6JMwTRhBYJ5KlTXG4xTbc+MeHI4QBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5313

On 13.08.2022 03:38, Marek Marczykowski-Górecki wrote:
> @@ -1050,13 +1051,20 @@ static struct uart_driver dbc_uart_driver = {
>  };
>  
>  /* Those are accessed via DMA. */
> -static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> -static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> -static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> -static struct xhci_erst_segment erst __aligned(16);
> -static struct xhci_dbc_ctx ctx __aligned(16);
> -static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
> -static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> +struct dbc_dma_bufs {
> +    struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> +    struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> +    struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> +    uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
> +    struct xhci_erst_segment erst __aligned(16);
> +    struct xhci_dbc_ctx ctx __aligned(16);
> +    struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> +    /*
> +     * Don't place anything else on this page - it will be
> +     * DMA-reachable by the USB controller.
> +     */
> +};
> +static struct dbc_dma_bufs dbc_dma_bufs __section(".bss.page_aligned");

Don't you also need __aligned(PAGE_SIZE) here? (Strictly speaking
the type itself would need page alignment, but enforcing it just
for the variable is enough since we force suitable "post"-alignment
in the linker script. Provided, of course, that all other
contributions to the section also force the necessary alignment,
but I think we can take this for given - I do recall changing some
items several years ago, and a quick grep looks to confirm it.)

Jan

