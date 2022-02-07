Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9934ABE9E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266817.460525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3NV-0000od-7t; Mon, 07 Feb 2022 12:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266817.460525; Mon, 07 Feb 2022 12:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3NV-0000mr-4k; Mon, 07 Feb 2022 12:44:21 +0000
Received: by outflank-mailman (input) for mailman id 266817;
 Mon, 07 Feb 2022 12:44:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH3NT-0000ml-T3
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:44:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa740287-8813-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 13:44:18 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-L0ijYg2hOeOD3d9XJJfcVg-1; Mon, 07 Feb 2022 13:44:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5203.eurprd04.prod.outlook.com (2603:10a6:208:c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 12:44:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:44:15 +0000
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
X-Inumbo-ID: aa740287-8813-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644237858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mc0EmJ2Mg3cHfSZS4ns3R9Ze/ls3uF4kcDlF/rxSnzg=;
	b=H+kQIrx1EAm3PrIPIfJZHTI0MJauZwkiMzLGYAd1D5IW06dJSiXtsZeETzQufOFPhdizGv
	nYBnR17XNSo340GQZCBGq5ay6bx8jPdmqnIygAs4Q0Hhjfe8vJLRjQB4Jhyu4u48BA2mnN
	MsftAZae+hfpWAy5V4sZOe0WN2a6yDw=
X-MC-Unique: L0ijYg2hOeOD3d9XJJfcVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmWQeIFfiKL0YuATWWkOVdSk0PGOgb2grDq1nEPD9gJmZo3mBn8WQWAs3A9wuGOftykAA+ZdwCG0FWKoLZs3yNdeA5AKRhvYC6jZHlORPOGV0TVKBuoEg8RhXGmonQDN+OPLfOfiaUxBoHwOvKx+1QTOmeTUuV0qni5p0sRlXatUW5UTf+/DHJAh0aZZyEWCsNITuhwawf2NPjT5K7jl5j3ZJdNoqkRR+kF+vFi3LdxYUi7mGhm/Znxq8lt5Xno9Pk3iZpfK+4EddF0dnVYBx/7DUlCeTe3S0bxAyTHW0WndZJE/HWsCnPsiR0TikIKuGH0Baot2khGbuaFJehlTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgOgIVGHqp6uwlV6qACYzpHBiaLrb2SMnM4IY0n+KVc=;
 b=YDLvmkR8lRjlMQNoPoF/Ocxq22qmXjXEnuk/MLfOy4chaGoDaRm8QOVRdd1eK9AeWdpHSYYPr8AMuG1tbSLduB8d5KLvxYyIpk9l+0ipo93vBmUTjPh0WxHspUAKOWP7HPBWOS43CynRVgpoy+DUn6WLGw5ZLs3hlPGoHkEdyR5Yr/bLiCW0zFREBYYtvV+V4k60gded8heiQtsVPQoSeLl1hBG/4uJFj7gw1xcRolLvIXBM6pA7Xnrh7KxmI0URo0aRY3Xn0BVw87nHdpGzJoTxy2Aef6BHpbStfNjatw0qzfHK1aTnA1KepoCLPbATUi99zY/tLOCYgAP/qBpGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13afa877-d885-0419-96c2-96754f1750ac@suse.com>
Date: Mon, 7 Feb 2022 13:44:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 3/3] xen: Introduce a platform sub-op to retrieve the
 VGA information
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
CC: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-4-julien@xen.org>
 <4da70949-7d6c-65a4-662a-301bb7075bc0@suse.com>
 <YgEJWLF/yp8YkU2M@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgEJWLF/yp8YkU2M@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae9e99f2-abaf-42d1-b466-08d9ea378c8e
X-MS-TrafficTypeDiagnostic: AM0PR04MB5203:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB520378F8503412A52DF7B657B32C9@AM0PR04MB5203.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W+3SUsXXTdRT8oqjxjsLzqe7OeYz3C7LxKhRb3RRXirzDNij5wcrIRY7GhlGjyhzheDu8b6szO9MwfiDKchfCVU4F1/6YLLiVMQw9P0v7UQMx6nwQAHicQ8hy5BB+KbLdYe571cSXF6Dt/j8uZ633K+Sw+QGG8dSt6Fsu5WWMSrz3xDZLnXVqiVw9AdfBgPnI5dyn/oX7/sFYRGGMiWvcoXGINS+suRecYjEOLzygfq6Za6fREa6PedW/qKFaYp5pRbSCmQ8yro3nIMcRdc/K16cxCzMIgucZns4SRvOhTElC5Ou6H8PnD454fmYwPp2tweaMM8h6oee8P4Q+2VLgYbCtcNIFv9Hy6pcuvzRD2zDyN10ptB+bw8cAOW4tqpde9asHsJM7HByc/b5EtXzBf+jTPnIIzmVmoHJ+DBxX3nHxfQRsrTCAheDWj127wN3/ru4lkaBsU9U/EKjm4bN+6aBfp+oUhqHx8T0xVqWmxrWlOgiMpnP632x686zB4pQXC+A952RlRNqRmxrVBkXKJO0CN/HXg6cvuBoT6mYJOTtuyaUnrZlOe4KTK2zxEWnzDOdPCa7KG0H1wKuBDy0pHsXYCOfoTRejIVblmpY+hGSEZEk7wqJb//gHpiI9/szHbGu0Kf+75mV/t7ZH/qzbsCghxJK2WFlvcn4Jj2AXDjHc2FddGeur3pQbldZeiDRzzK9xMvvBuP9Zck8AGmQIvSbSej1DzuPH0nfw6s5Deg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(36756003)(6506007)(8936002)(53546011)(6512007)(31686004)(66946007)(26005)(2616005)(508600001)(66556008)(186003)(66476007)(4326008)(54906003)(2906002)(316002)(6486002)(38100700002)(31696002)(5660300002)(110136005)(4744005)(7416002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yli1toXiCnDQMe25+0TO0TFKtzGqOv1uFI11vd0O7Z+UF1B6FO+o/825gBoS?=
 =?us-ascii?Q?Y9FiSYbUCvdWzCjuAaJh+tFFxERP141ubNcWkO4FIBxa6PasZtaQ7nee4ilR?=
 =?us-ascii?Q?I6zkmu0q0ZsmgR5zdTFI8rT5FMGdXBSgH1ummwoQ7xEy0yi4vTxN5AhnNGkU?=
 =?us-ascii?Q?YtKjpwuQO6c27393DybnrFNZZ0OXcr/R80Hn3n8BBAdHdteuGy0A8K1R6nXn?=
 =?us-ascii?Q?FK5eCQOEv3W9AbzxdP/Vp7KxG1SPg3VhmzVGf9y6NSqdLaFJkRScOToov+xi?=
 =?us-ascii?Q?jublsdJbWUJyD9i56PO1gkgfFZxmf9zKMWwchK/5VuXEJsKrfD3zl59+IGn+?=
 =?us-ascii?Q?1yk2edh011cJBuV7auu57AAs11uEZjQi/pLGeaOz/WbsdwxbjV38k5xpOjyI?=
 =?us-ascii?Q?kf7ePeCN7UIE4qivwV8g1KjB4AguYNDQZPPQKSOXalz6LEeDCf+DGHU1cov/?=
 =?us-ascii?Q?4DRZxt7nAHfaGLR0IKm9mD7RmvZ941VpPYxxYsnXpzvrftiboYvvBFMogZoQ?=
 =?us-ascii?Q?2LYhfTPjG0SqH6bGfIVXmV0+jsL95umneOtWtBCjp8Ft5qhNjqvY7KI0cSvW?=
 =?us-ascii?Q?hizZeC2vBipZ5/SNchN5oteVP8MYa5AIinCq/kqi7P6EGXbYoHY3OG+7/lVU?=
 =?us-ascii?Q?01ZlFfeLRnBKym61RdRkWdyu0uu9/LbpIqR3Dz6MTYWx1Hbi3FRQIuj+5b8j?=
 =?us-ascii?Q?BNT/7Xj1e/GyK+9cTOKoT6KRkYvXQakzhS6633NZLHcRHk41LCpLGiYswgcy?=
 =?us-ascii?Q?Dc6Ap/POnPkGnXPv22vmLJkKaYxBD8I8KVOW+LopOQDKDuL8cKf6VHCW2CBR?=
 =?us-ascii?Q?MUEXqC/onuQtw7GYswh11wTcY45OKezMDK2lmjnbwFIaQWhL+ibruovoj2sP?=
 =?us-ascii?Q?dwYvdZGzi9SjJHgepVSuJh8wh7FVV/J0ZnCiCJ+bnIvpcETad65HT0I7zvGg?=
 =?us-ascii?Q?pX1WwDspajVwGcTnf6KSVClwNKaYSUY7yfgDhPyDWke6uxlEbmW/NbjVHKZY?=
 =?us-ascii?Q?WXgPG+zCHExwu1TMPgaa6wz1e/Tz+NS4g2kk6ijGGpFW/Yytr+4+GtfXx3+9?=
 =?us-ascii?Q?vmq49LCx0HFCZIVAK2mvsDvVlOfgPVgAI7aT8Toi8wPS75Z5B10ehHs3+7If?=
 =?us-ascii?Q?XfoSpL7CxzPm0fmQAEk8VNZEB6zPy/tyeKhO7FSGnrweavNM3cGP928gUkAv?=
 =?us-ascii?Q?U0pixzCawD+IP29m6pTO6cy71qW3+nC8cZ1M4UgY8yemQcF1sLtQ3qjRnNfl?=
 =?us-ascii?Q?CZh/O7PYnxzANqNeib7FcPmV+26LrVHlqJj2hHZWldKS8F0LXzijhfosuD8a?=
 =?us-ascii?Q?9LUnk2OWENCGjnBuhJId/v4vksA0Wk8YQBNVUL1Mk2Y8rgyfICzw8786Qbzn?=
 =?us-ascii?Q?267CKOXOnPr8mLNWV7ukzi7f+flXadNO6+liFfqYECV7qnqTZetXQvf2nrn2?=
 =?us-ascii?Q?2sLZksDkJZjgvsbMOOFfLTtU4zg7/HZr6p8AVwGP5Kjag3FVRPAyc3oiGJgl?=
 =?us-ascii?Q?DpZ0qjJ8pV+CCd8WdL+jtnVEhwhxYH+a4Ob9ooVacp5jmNOzCPLwZ9s1ECaY?=
 =?us-ascii?Q?kJ7BXcS9fMoYr7bm7mw1IwsqQCnnPPV7GiatmkUONzJe805UVS2EYoMyXOL5?=
 =?us-ascii?Q?H+ba58UHFivbIGsVLpiT6Ec=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9e99f2-abaf-42d1-b466-08d9ea378c8e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:44:15.3774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61+X7hIdYBynHxaEJO1U8T2CF3yCvf/+Db0Q2pXrRCTf0isZq/TM8v/hfw6nt19odqn1XhWb0604UakOMnruhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5203

On 07.02.2022 12:58, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 07, 2022 at 09:57:55AM +0100, Jan Beulich wrote:
>> On 06.02.2022 20:28, Julien Grall wrote:
>>> @@ -311,6 +312,7 @@ struct xenpf_firmware_info {
>>> =20
>>>          /* Int16, Fn02: Get keyboard shift flags. */
>>>          uint8_t kbd_shift_flags; /* XEN_FW_KBD_SHIFT_FLAGS */
>>> +        struct dom0_vga_console_info vga;
>>
>> ... the structure name including "vga" (but if the #define is adjusted,
>> the field name would want to become "video" as well).
>=20
> It's my understanding that this will forcefully be
> XEN_VGATYPE_EFI_LFB, at which point we could consider giving a type
> name to the vesa_lfb field of dom0_vga_console_info (video_lfb) and
> use the same struct here?
>=20
> There's no need to propagate XEN_VGATYPE_TEXT_MODE_3 into this
> interface.

Hmm, yes, this is probably better / more clean. Julien, thoughts?

Jan


