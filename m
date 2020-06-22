Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB9203284
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 10:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnI8d-0006hM-Uf; Mon, 22 Jun 2020 08:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnI8b-0006hH-Vk
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 08:49:10 +0000
X-Inumbo-ID: 3c4c1322-b465-11ea-8496-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::607])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c4c1322-b465-11ea-8496-bc764e2007e4;
 Mon, 22 Jun 2020 08:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtrdZACy1TtRB/PDBLiEMnxyYN1zrYzs+KVydMoFOXZ738pRif1Okef6FExYrrwgug30tNW1bgOq52xB4Zre82icWIK2pkli1P7jfKQ5JHW4adZoZc/gKyhzn7zbeP9Vm9wR/B8fdk6GEEDn0oQB1OdgtjpfHvd8++2KndjPvFM2tHLaeQhjbnIuWZhfECcl5i2ClUmR7Lbd8kyoP4S1D0q+1ITK5mcH2r3LVHQO316/oQnjOlFBNxV+rU+KxhRZ4mXTvDxZuhxVYqgMUlbFoqFHXMUxf7flvj98jyDTjfpOwEyeOo1PPtbSIpEwMtYY8Tt06zqCnzrMtOqU5MM6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZH7/xZQX+TdFs0CqjEu3za0269PNeZnFsQkTcfLmfw=;
 b=HE8XhBBv02af3Pp5ZtQtqgUEDO50/Yga1qOzpSyu+D7iQsy8iOmhtMHm8UCru3WsSShduJ0Ra3Z1eXDOQSMy5ABvtSxxSBWmrPuBG1W1MB6TxU4PYONk7+t8ehTu3+TJYzmBCO0dMfrKF2tmnLL2BaUxXKjYPjD+mo/aqWJbF7Mgq+0RxNbctIAZe9VawVp+bRcclgF0JP/RDZoZ9kXwqLk2gFd8rrN4WiW7+Y6+D92i6cSO/Xet5nIs+8omkvWt5T3NHovC9JQ47PCOxx7sbbFqn2gigpcB71RpoptesxIVmksz37f9Q6smxzOjv4ihVRfNci7hDJLxEOsFRnpMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZH7/xZQX+TdFs0CqjEu3za0269PNeZnFsQkTcfLmfw=;
 b=etX/yD4O2MwGNPtx37NA1igRWzQNKQFEbkEpmS+GNQcRQmV0JbTNxn4s9U8xoi742qqfaasicvN5GFHQ12UPBcaibGPceMVZpOilw5pyMTdduvaau8YRev7KmDl6vDMU4UxwtjHFT6wiHXiP+T+6C7zG8KFLFggElNmisScq1PwEkTxDgAcDzNRHXs0qNu5E3aF1PozObwE/sEWJbV356/Xxs0vY1hq/mq0npNUqYBQ1Ii7yguSaT0N9+Rm3mDZV4xirjp8SzFjmB9cXrlW+SGhse/tDDJ1i7UhGa2O3GS1Skt8QhwWyJR/szQDqqKDxhcD+8ECfmiIlmENXacoAtA==
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5230.eurprd04.prod.outlook.com (2603:10a6:803:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 08:49:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 08:49:07 +0000
Subject: Re: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
To: Grzegorz Uriasz <gorbak25@gmail.com>
References: <cover.1592603468.git.gorbak25@gmail.com>
 <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5993e716-d71d-cbc0-a186-5325e2bdeba4@suse.com>
Date: Mon, 22 Jun 2020 10:49:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Mon, 22 Jun 2020 08:49:06 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 356962eb-1335-4a8b-bdf6-08d816891f80
X-MS-TrafficTypeDiagnostic: VI1PR04MB5230:
X-Microsoft-Antispam-PRVS: <VI1PR04MB523017403D96713BA1F4E852B3970@VI1PR04MB5230.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nN3ylsmMiqy3rDdrKWqr7bg2j8Z5f3O/3NKcb6l4dwXs1zUewgAT36wa5DybNmaoy1mT34d41inVej9MArV+R+ElREyyc7FLEw4qa5aR3Uov9DKBz7iuTgf+pbicsdFBfWygtiYIJ9wQ4OgdWjBsq9NWQIZwmORMdVzrhZk217T7LrMhSnBFMR6HOsiXHq/UFL4Zt2F0bJpTpKP7KDL+JUJVGNck8wIknhPnsdltW3WZlRrKSjwtH+s6vGiO+0VHG+YOf5HHYenl3dT81yrc/RBpPhxBdL01VQsIWp2HXMk3fqCfCReHKwLc8w/TZqnxpyz/FYel/feSjx80Hi1uI7FJfJhhO3jFDEsZFPplzUWWauAOe19FK7lyor2U9Mf2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(376002)(136003)(396003)(39860400002)(4326008)(31686004)(8676002)(53546011)(186003)(52116002)(54906003)(83380400001)(26005)(36756003)(8936002)(16526019)(2906002)(5660300002)(956004)(2616005)(478600001)(7416002)(86362001)(6486002)(31696002)(316002)(16576012)(66946007)(66476007)(66556008)(6916009)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: d/0RR1SESjllfuSFNG6YAC3GxzA7thf/qUJeD7EFL2Y4EIw3Ayrn7hMFkLiPVWbTMww3Mh7eYp9sg8PUzgOeZecrsJhXihVHO3trReTt4mnqYe+5mrRcREW0F+9UlI9n6VTQXE6yMpfs/F8W+l/hy3tWiTjx5Ccbre0q2WCEG+VdG8Wrn3mOYq834MPMY/yxiT/OPcMMo0qhLdbLN+m88N6sY1tLiw+83Ztv81SIdGxunhscdd0U6oBO4WbP1v/VQGYsLUJYBfqA15ym/6qSpG/GZqjsMqKYO++OBErm3JnJWXMVb7Y+IChNi0SXNgGw0XUWxif0Y1MzIQn/L3UZfCmyGfepfbAwdbUOOV3qLeiOH57mWpeIY78Cp/RKjMupVN7oRUyMJ880485d8wGGFxN6iQZY8pHtO+oFtQHr5ei7Vf8RBU7yi7y53C4a1QziiWv4uNYSLLGyiqW6V/bwO7IwzhkipZYDHq05inqBe1M=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356962eb-1335-4a8b-bdf6-08d816891f80
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 08:49:06.8976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b1W+PRq2VB9D9Od7uToT8QJ2hnX2FRZdbcVx0/JQxuDurLpPSjUPe8Tc6TqpbgXCwXuYg//qtMe66qgJiBllg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5230
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org,
 contact@puzio.waw.pl, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.06.2020 00:00, Grzegorz Uriasz wrote:
> @@ -490,8 +497,12 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>   	 */
>  	if (!pmtmr_ioport) {
>  		pmtmr_ioport = fadt->pm_timer_block;
> -		pmtmr_width = fadt->pm_timer_length == 4 ? 24 : 0;
> +		pmtmr_width = fadt->pm_timer_length == 4 ? 32 : 0;
>  	}
> +	if (pmtmr_width < 32 && fadt->flags & ACPI_FADT_32BIT_TIMER)
> +        printk(KERN_WARNING PREFIX "PM-Timer is too short\n");

Indentation is screwed up here.

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -457,16 +457,13 @@ static u64 read_pmtimer_count(void)
>  static s64 __init init_pmtimer(struct platform_timesource *pts)
>  {
>      u64 start;
> -    u32 count, target, mask = 0xffffff;
> +    u32 count, target, mask;
>  
> -    if ( !pmtmr_ioport || !pmtmr_width )
> +    if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
>          return 0;
>  
> -    if ( pmtmr_width == 32 )
> -    {
> -        pts->counter_bits = 32;
> -        mask = 0xffffffff;
> -    }
> +    pts->counter_bits = pmtmr_width;
> +    mask = (1ull << pmtmr_width) - 1;

"mask" being of "u32" type, the use of 1ull is certainly a little odd
here, and one of the reasons why I think this extra "cleanup" would
better go in a separate patch.

Seeing that besides cosmetic aspects the patch looks okay now, I'd be
willing to leave the bigger adjustment mostly as is, albeit I'd
prefer the 1ull to go away, by instead switching to e.g.

    mask = 0xffffffff >> (32 - pmtmr_width);

With the adjustments (which I'd be happy to make while committing,
provided you agree)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Also Cc-ing Paul for a possible release ack (considering this is a
backporting candidate).

Jan

