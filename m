Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D646170C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 14:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234536.406973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrh45-00049F-Bd; Mon, 29 Nov 2021 13:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234536.406973; Mon, 29 Nov 2021 13:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrh45-00047R-7T; Mon, 29 Nov 2021 13:51:29 +0000
Received: by outflank-mailman (input) for mailman id 234536;
 Mon, 29 Nov 2021 13:51:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrh43-00047L-Ni
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 13:51:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71de1e8a-511b-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 14:51:26 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-uosKhvCMNjiIdi1W362ogA-1; Mon, 29 Nov 2021 14:51:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Mon, 29 Nov
 2021 13:51:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 13:51:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:206:1::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 13:51:20 +0000
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
X-Inumbo-ID: 71de1e8a-511b-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638193885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJgKJSP5DW5Bq/wc15bS7aAnbsZ1fEXXDIUZLe3CRes=;
	b=NYgeM8j5U+upUadAkZQSbD/9XTSDP/J8XB/pF0V6ULn/sPIiQWbwCnc7KhZ3pCVJlM9K6z
	E2+miPD46skIugLSdLNZkxGACoBim/mm1OA1VDIwoZiUh0uc8qyndPUmoK9H/Yx780ijAq
	GTfmqhy2SdeTpF3OFJotXIHPAzFF1WM=
X-MC-Unique: uosKhvCMNjiIdi1W362ogA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJgQiUr6RjBOqFDps03tJbDLZHSi742l42QqniWH28vEDPnkwiRtVG8LaooVl4Nc0oNuAJPTnUsZYOtkSuQItJ0rEkLWx4R+7v9Xp6ZItuyzyDe7zDG7CVEvRWYyN73vaEZvaWoMdfK9nNQWz3Vt/rF3gCSjXvE7e6qFXThVDuiFGP4qFXXOdfAl7DwhtjzU622JzeMADVfxx+LkCZaN/4/Q0Xl4N/Oxilhd633N0LJuNoEP+Trb8/r4qtNh0SMcTFwIByZeVgOtYIyTC8+XQm+LgJWyfY484THPb+CDUiam+tCmFEY2vF7jd7MUOhbw/3lk1A5k9cMy/VpNCMpumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJgKJSP5DW5Bq/wc15bS7aAnbsZ1fEXXDIUZLe3CRes=;
 b=R+BgV3ehEk+6F+DIyKtHwM7pc7337+Ja4gSbJMUy+DNbnC4l0QswrsoLAMaGOxOcFcyb7b+BUZ1c9R/RziFdfbX8R8IS+2y137VZBdZ4+vNGC6wVLRSiWM8wdhOQi8kgKFS4IqU8mipurbQIAan2VZ9XlphQeD9gsqkx2iFfoxYZ/ZqLdA6fNrzupXtq57Hbaat78VeerKNqf9dEGr7o4sVRmln5py9+2G78+oaZAY9KTA6FRB+uWtwSapMHDuX6v+nw66KCDXK3MFvJSxxiFIZ3NRqyBlymhowuZGOSzqNxV/dvb1oA7lpTeu1WgMAyIjyTEH3iEbeHNdmxvpy+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7ce2a02-1883-ac06-1737-43149be3bfae@suse.com>
Date: Mon, 29 Nov 2021 14:51:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 17/65] xen/evtchn: Annotate fnptr targets
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-18-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-18-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:206:1::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92eb66ec-2f90-4696-f437-08d9b33f52f3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393334090B19E8A2401B027CB3669@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	txbZ5VIjNuxqz2TVfyeD5RwnsaBqVjpw/FWAYGjhI+tY0pwC0rqc0k5rGUDO+/2uMCEoIkkwycnP6wVfgc/upo1n9GSVPcb66W+LmSzM7qhQtXLalVRf+n48LNHOtVLoCUP80JBEZYKwsp2kc2p3bB93+fp1WLo4xpgS/0dAQ61xB9G/MyoEu/No77hfKVqHsakA8/nVesfFzJWsLk1k2OTJMbr+prj49Zj/vhSm40zBVW/Tnnz3MvlH5AP2jlJ/YxyCxW16JLtQVuc2kkED9JnrxvFY1W4MS+sfcOI9Iz8+wbOhy8dcHvd51YeGQ213XW0LFCD5tdsrpE0rJXxl0Ddk2uTnVK8S/m9+VCA6umHUIisGrN9ntZgcsXaECQw/zyDmDRaGYBNHWLijIIRMyRGQ5vse+UGMKUWx1mvg/spy8hUuPLV9DDGp1ctZl5GjAn0lsgJuiN4fta1DvreQLgzVXSrHJR6rwHEhpbZQ0VJjsLUb5bmvYvIYjDfCI7ZSksZOqGVETxAbv/pGpJqEIoUHtIN1skwCIm43m9XidEUebs33fYhSqznOrWJzye4CsK8KBqmBglyJPfU4eummwtho7VABkMgUUoTqEW9Vtt+c5w0aehEnnr2DVU8V61o1puC95p7/JLX5YXSen1xYs+ibFyHs77dG+iXL+/Yvr2eqzOv0sO3Cl/16ZKf9LzJHqZzXSAILOi0+6vfoHxNkFJbb/cDY1XXrGXKiVD+J936juISOk41zrR4s77lpY7kg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(2616005)(956004)(8676002)(186003)(86362001)(16576012)(53546011)(36756003)(38100700002)(6916009)(26005)(6486002)(316002)(4744005)(66476007)(66946007)(54906003)(2906002)(5660300002)(83380400001)(4326008)(508600001)(66556008)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU1PRExBWG1Fb3cwVU82NGI3UnIzSjhHV2hCSFUzUlorUUw2OFZTa1MydDJM?=
 =?utf-8?B?emhTeXBQbStDOFg4dnBWRTNaSWdiUk5LQXpnSVQvbDlWdGg3ODRWcWFEQU9U?=
 =?utf-8?B?NUVJKzd0d2twUzRQRHFSa0h4aDc0cnVleWtVZ0h2a1RyNGVwVnNtVnAxZDlr?=
 =?utf-8?B?bmZNVERqVU41cllJVlpxT2ZqZjdBYzQrTFpwd0Q0MFB1cUp2bUFJenJ2cTg5?=
 =?utf-8?B?TGJXb0lTb3JRcUx6a0tJUHhyYkZyZ2JnQ0pHenQrK1hrekFnOUtiazlYdExK?=
 =?utf-8?B?NVk1NHJTbjNzRW9lT0w3SUJVRFBBTnBhME94Tzk5Q2Q1U0RZWVVLSjAwYkRr?=
 =?utf-8?B?VHFvazlXWGlTbTJkMFpzSkFnZlpnc0RlT29XM3RvY1UwaFMvRm93Uyt5dG9a?=
 =?utf-8?B?djFHeUZVcXFNTzJOV214Nm1LcVl4bHE3MjlTbXR1TEQxdnZHQXllMDZUdG9j?=
 =?utf-8?B?MmIxc2xpNFloSm9uOVhtb29Ub3NPbElMdmZwVGdOY1BGdnhKSnFIYVprZ0lN?=
 =?utf-8?B?MEp0bWtndUFXdGJOZ2FKc3NiNzFNbVo0S0EvVkZGckVnUlRiY0w0Zm51Umdo?=
 =?utf-8?B?U29vbjhtSUdscExSbkxJYllsZjhTSU9xc2N2VFlXYmdDUVVMblI2MEJFdGxS?=
 =?utf-8?B?a3BrRW5iY1pOZUQrRk9sakU4SnB6TEpTbmVlYVNnNTFUTm1ZazltbVg5QlZp?=
 =?utf-8?B?a3Z1MVhCRVUwbkFMck5PVFR4dE9qQUg2Wjc0YU5QbEtSYmVYdGdKUjRzc1lE?=
 =?utf-8?B?eXNuTW5VYXVUTzd0U0l6dEEvdlZicmZGSXVvSXNnR3kwVFpVMXAwaHlLYjFr?=
 =?utf-8?B?alMxeEJzZzJZNy81TVIvMXlTSDNTcDlLbWNJbjJUbXh3eHkxYUE5cXB3QUwy?=
 =?utf-8?B?VDE5RnYvK0Y1WDQxTmlZd0h5Y0ZGS1oxVUs5bDZnZitPaVRyYkgrVWZhSlI2?=
 =?utf-8?B?ODNEQnVoaXRVVGNHNTJSbE1pZmh2T0xxSUYyMUY0OGN4ZG1JUmdLZ2I0T2dR?=
 =?utf-8?B?U3ZRdStVeHM0b0JRQVpFZFhSUDhnK21qUlZhb0NQRnErU0ZSbnlkeUViT3hn?=
 =?utf-8?B?RGpBWlVBTTdyUW9iekc4b2dmRGtZNmhDcW5DUERUS1dVdVFxUkJ6VFJ1Q2Fs?=
 =?utf-8?B?MFdlc2RYNGdPNWx6b0g4VjV1VkdCN1FxUXZQNTFVVkVqUHhOY2czRzM3SXdl?=
 =?utf-8?B?ditBMFYzVXZ2aHl0WjdnWWgrdWVqdEgzQ1JHUW84WmovUFYreWFtaVR2NnpP?=
 =?utf-8?B?cjZ2ckZqMWlndGk3OXBNQ0hULzVKL0tOOUtxVUZnQm94dGhxSGdPdjFjSUZP?=
 =?utf-8?B?cWlBcEFmL2FDRUZuWmJTMGdQcFFNQTJIei9Da1c3Nm1IeWZYT1NtcXkzbDNa?=
 =?utf-8?B?c29NWnNnRXpTM1lZWTI1Yk9LWmpBbmRSN1ZrS29NbkFoQyt3anFQNHNRVFNw?=
 =?utf-8?B?dEJhTHgvb01zcStLS3RkYy9FL1ZDalpzTGlyR0Y5aTRGcVpUaHhyVnBzK05E?=
 =?utf-8?B?M2NaQ2pweGpSYlF1K3RNWkxnY3hoS1E3aVFKTElNL3I0WlJPdi85WHFOVE1x?=
 =?utf-8?B?QjRwY2FIWkIzR0xXN1pJTy9GQ05wTTVQdFZGVnZ4c1dSdlNCeUVjOWhFUnRv?=
 =?utf-8?B?NWlxVEp4bmU3ZU96V2tUN3Y3K05kSWRHYVo2Q0RjUjllTSs0NG10WUFSOHJP?=
 =?utf-8?B?QXRTY0tnUXd4OHlkSXI3UmdPUHV6WjVEZlZDZlgyWkNnMkFXODk3U1kzalpX?=
 =?utf-8?B?OTZTazhxc0xLdkNFMkJXVXRMb0M2a1RLa1RQWHhlQ01vSDFYL3VXSm5NMWZn?=
 =?utf-8?B?a0RNbks1OW1OZGN4bzFMTU1sMHVGcThWM2taNWhRQVVaVTZsRU82K2VXRms4?=
 =?utf-8?B?Vk12N3gzM29USS9SK2VHemx5bFV3QlY0Mi9iT0liZWpxR3NkdVkvU0FzajVi?=
 =?utf-8?B?QjRlNmJsYXJ1TFduQ0VlZHB2ZzlObzlZVU5PVXJkUk0ybS9yYVRHVXhCRGJ4?=
 =?utf-8?B?VERERHRVaWlNMWU2dWRiUzZscGRBR0FiellUdkE5ckR0N1grRWRXSmMyVFVk?=
 =?utf-8?B?WlpxQzIrdkt6YWl0NVpENW5qcW8vWU0vczlZMGIxN3VxemZpUGVOYlVRQjFJ?=
 =?utf-8?B?WjRjZ2Q4RVZCUytSZldtMzNwekNVRnRjVEtROFMwLzBzNEovdGgyWHFPLzdv?=
 =?utf-8?Q?9n/+Vnrc1QifIQVbwx/y3nU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92eb66ec-2f90-4696-f437-08d9b33f52f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 13:51:20.7375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9Gh/6SKQdrNMMDhCjqI63IxVZypMzqC7AmPewe5jC9PDHMPbeMXAHP827+Dz7a3Ak9xI1gK+KcvoDY78kAfHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 26.11.2021 13:33, Andrew Cooper wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -99,7 +99,8 @@ static xen_event_channel_notification_t __read_mostly
>      xen_consumers[NR_XEN_CONSUMERS];
>  
>  /* Default notification action: wake up from wait_on_xen_event_channel(). */
> -static void default_xen_notification_fn(struct vcpu *v, unsigned int port)
> +static void cf_check default_xen_notification_fn(
> +    struct vcpu *v, unsigned int port)
>  {
>      /* Consumer needs notification only if blocked. */
>      if ( test_and_clear_bit(_VPF_blocked_in_xen, &v->pause_flags) )

Alongside this shouldn't you also annotate mem_paging_notification(),
monitor_notification(), and mem_sharing_notification() right here
(following how previous patches were organized)?

I take that you're specifically leaving out anything in Arm code, no
matter whether such annotations may gain a meaning at some point (not
that I would know of any plans).

Jan


