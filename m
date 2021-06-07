Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206039DD42
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 15:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137958.255488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEwC-0005CI-Cf; Mon, 07 Jun 2021 13:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137958.255488; Mon, 07 Jun 2021 13:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEwC-00059i-9g; Mon, 07 Jun 2021 13:05:04 +0000
Received: by outflank-mailman (input) for mailman id 137958;
 Mon, 07 Jun 2021 13:05:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqEwB-00059c-9j
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 13:05:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2d6d4ee-addf-4745-938a-61118efa6ee1;
 Mon, 07 Jun 2021 13:05:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-FVgcdd6zOveW_GnFEucR8g-1; Mon, 07 Jun 2021 15:05:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Mon, 7 Jun
 2021 13:04:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 13:04:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Mon, 7 Jun 2021 13:04:57 +0000
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
X-Inumbo-ID: c2d6d4ee-addf-4745-938a-61118efa6ee1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623071101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4N64f9gsaOrT+9l+Ln3X7OWG+Nl2vmf2fgCMHzvfmY=;
	b=DeNTnvxgTlPJp9kdU5MfYE1rcCfjMn+kEmEpSgQ8pCJ3ie/K1KnomDuQlh4ADhS/BpsyCg
	zaQEunZqih3U4XMG/lcosY2S9j5AmtAUkn/7Ivn9Uj/4y7KYOwy92ETsFMqWvZOeo6AAwJ
	bhe+fu1VMoRdvGgRZuIsi0loGOv5O8Q=
X-MC-Unique: FVgcdd6zOveW_GnFEucR8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz1Lk9Z6TFYcc6j+a5ti3GlZyUTJPPdCex22m7ltiE6byNJJr2hSTeHSyFdrS6r3YSfXMwicyVS4CmIRN8CJnMMPFOPung+JzYx9yy+d7XwLSKPNNpHJHOWynooKuucnE3sIB1RGif8xwhpyaaXANrg0bBWmF3WcqQHUaA8kCmy5MaLSV2GYcTafzcy6m+g0CB0SRg7nrjRTKFy49IQMhMHs9AdEEjtP+8RMcYnIJ4jC64v3S34wXOHnA7zdKg5U8Za9PIrQ54UmbgHHx/Acp1FaTfUbYn1LTaKjEosYSbXWqY9yhC4/p4HYAAVQp7uOd60cFGu9vtnXlWWC2fDgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4N64f9gsaOrT+9l+Ln3X7OWG+Nl2vmf2fgCMHzvfmY=;
 b=mBl5lpWs1GqP+BuwOZ8GFzLyhB3lxeq4DQrOt9l4NrR9yt7w7b5gVsBbtCiN1UoWojCbEh1bfug3bww6ZhI8oDUYG9LhC8ywT5Nt6saE3JsCby8z5zpVxYbGVCA6l1AQsjZuG1PWhWSNML8u339/fU6Swpo8crZhJrwRnL79GliqBBnBLryX++ZCV75G21cE+aEWNd4HJ249fh5U5BMlDxXP+M+BmgPCmpVP9QQAfY/RAI9VUrRNijmnzbVKb4ZTOa0z9zK4Fge/QaI1WcTZGIw+88VITFZTckhOiAgsxUOXtugto/UYVvjNHGjAzErJ4V5mlG+jVBn4bR0e1sAPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210607130005.5475-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07fad6f2-3ace-044e-72af-a470f6864c00@suse.com>
Date: Mon, 7 Jun 2021 15:04:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607130005.5475-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e47e1f8-d3e5-40e0-5e8c-08d929b4da2b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024D203846EA8C8BC748AB0B3389@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OsGiDtZeB2KDgGj4gHuuICZuQJbTgnErZfTV60uMVkJtXWG+msau+DJm5Xv6xEXnDTWDWJOmgs1R3VoPVPaazGzLeUpg99bhTaY9zXeOGONNq9uyjXbyJjo72vH8dxXdZgfGcLw61WV5Fjqrd8MIDExswyAAA/tm6O5yGHZlRUMimjUHvTQHQr+XbofdANjYP6tSH4adTNBaL6zNL6+aAes8v8uZvwPmhTRS+dsu9F2KazLI5wS6o7c0Gep8OlYAkQv45WUVrIlhGH0tx/OI1WE2LJCV5X0WsTt0dX+hSPwDd3OFQZTKxCwjGNm9rQdIIn0U8G3/YiqwKCy/gE+KTRn/Rnzx7CE2hZrtp8cT92hPuHbBJgHbi3ZATflgVJHalkYLsHFHZ9OihMfKM/v+fuVUFDTgTG2HU2yuJTTKKirKd0U4ZiEAFMeKKv42kDLmE/Elnh+xXNxDvf86rz5hPXtV16YWOq7MAfntr6d2WXTfRn4CEPMVPiZ6xX0vGHUHjua5kqNlef+A4/gWPWDep/Z6iDYWw7JDk7aNxAxPUzE5sUJd5DHnTtjO/KeL1ElbNbAKke/4TkfsaJevxFgyl3Pa7B5SinMb/dTQKF1qbFFrIJhCgjRG/6PL7uavceBxZn2uawPvPkILBiQMdT2WhFd4kQ0qlYSimNl/sLywXJ+9pQy71onF498q21lAQHma
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(39850400004)(346002)(478600001)(36756003)(66556008)(66946007)(6636002)(186003)(6486002)(2616005)(31696002)(8936002)(66476007)(2906002)(54906003)(4326008)(31686004)(38100700002)(86362001)(8676002)(53546011)(316002)(26005)(37006003)(16576012)(5660300002)(956004)(6862004)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?OWhzaVhwc0xsYWthWWJZSmhKbVdIbTNHSHRCSGpGTHpIQW96a2FrOFFNQXRh?=
 =?utf-8?B?M2hOVnA0NUdlb0xGdXgrWUI5T0N5MUJ3bDRWbkpsd3lBUjh6WDZNc1VFd1hv?=
 =?utf-8?B?N1lncEVPSnExT1RoZXBWeHd0NGZzNFNYUTEyZFoydGVVVHZGLzFKY3VVcG01?=
 =?utf-8?B?Um9mTkFtejRmS041QWRHV3BaK09kRlRUeFdUbEQvQTY1UEhYWWVXVXc3bTlW?=
 =?utf-8?B?Z1prWkdZdFoxekZNZVVvOTZCS1Rhd2gwNjVvbnlycFFYZVc2OHZGQ0dhSVgr?=
 =?utf-8?B?V3E3N0ZHTW9LbDhDdkQ0d08rQ2hhb1VENHdFR0dPd0o3UFNSL0FDbjFtemZQ?=
 =?utf-8?B?Q2pCS3FtN1ROaTRjNXlqVE9xTThqaDg2bHVTVnFPN2JneTR2d0d4eHR2NjZ6?=
 =?utf-8?B?Y3oxZ3NLTmtwM2VqOXBGYk1NOXJudGJPMThKTzJGdUl4RTFOaWdxNW0vUElL?=
 =?utf-8?B?ajAwdE5NY1pwRnpQYjU1VG5UWW5jdlRlNytMM0ZTNU13bnVHcnlOVllYVHR5?=
 =?utf-8?B?Tmpza0dZTVZmdEg3Y1VHK0NIMGZpa0NNaGZnR2JVeUs1Z0ROeTMvRTk2MTNI?=
 =?utf-8?B?MWI0ai9Fby9qMUxzYjFxSUUrUnJHTHM4V1o0UkVTamJSTTJ4eXlYMjV6UzN3?=
 =?utf-8?B?dWdTcEZsKzA1V08xbWVWZEtSMWxpMEo5Z3NSaGMvQ3kyeGpjTTB6cHJnUDJF?=
 =?utf-8?B?M2VmbE1BZDdObEpZRSs1MWFWMmhvNExQUDVEQXNqZVgzcFVPWFlGY3BoOGtH?=
 =?utf-8?B?Vm5IeWRSMmpVZU5qNjFGNk9MUUJZOFhySFBpNldHdHRQNVJqcnpIMy9pcjRW?=
 =?utf-8?B?ZUt6NW15eFBpTW5HeGlxOHJDQkpVdlBBa3NQclBJbUtWY0pYYkdwdjIrZ2I4?=
 =?utf-8?B?VXR1aWNFTXIxdWw5dFllaWhUL3JBVHNRM3dGeUJFd2VlSVRmUU1BMkIrenpm?=
 =?utf-8?B?eENoR3h2T0F6RWR3TGRlODA2NG5mQWh2QjAwRFlubWNncFVScWlrL3Q3U2Nh?=
 =?utf-8?B?SVNka0dHZkF6UVNuZTJNRUFUWmI2MHN5RzJDTHVTRTRhODJUbEdod2Q2UEpu?=
 =?utf-8?B?bWdLUjFkL1JsWDYyOTVyN3ZhLy9jaHR3OVRYdGRNeWplaHZSeUx4N3JkcERX?=
 =?utf-8?B?cnZ3NU9wMCttcXZjTk8zRU9wOEtFK2YvaGN0cnNhZkhDeXBrYlUrMjdOVlZZ?=
 =?utf-8?B?akRjcEtGcGR6QjhmL1F2SXRyS0lYN3owcWhiODNzTWI5RU1XZFJFSnVNUWlD?=
 =?utf-8?B?a3pqN0JzYXZtemxGamdmQk1sMmlWNTUwQVdMQjFCSDVKaUN1YW1yeFZ5U0dy?=
 =?utf-8?B?S1FxV1VnK2V0STluQzB3S3VpbmhhbGREU1d3ZjZlaW1SN1QxMmI0eitINERj?=
 =?utf-8?B?T0pKSGtyZGRSc1JrZWxQRXZwQlZHOGovSzM1YTI5U0NxSFZTNHd5Y0xJVzdS?=
 =?utf-8?B?cGtuQkRza0ZlWXZ5UG1YV1Z1aTA0akc4VmNMOHBKd2hwTkRUWXFJNmd0d3Bi?=
 =?utf-8?B?RGExS2QzQy84MVJ4NVQyM3VLemxvZys4TkZRcGdUQnhubDFZOWZodXN0bXZ2?=
 =?utf-8?B?MytNQlRDUGs2SmJPa0ZsWGxFOGM4WnhTN1NtYkRGcStWY25IL2c4b3BMYWJN?=
 =?utf-8?B?ZjQxaFV3TUR5YkdteExUWC8wVHNKYm8xRjJBZ0tLd1JRVEQrbUd1K3Q1bitW?=
 =?utf-8?B?VzNzMkNRNXJYNElydzV4blRkbkZDVjZuQ1luZHhEcnIvcUhKbTY2MzFNOW4y?=
 =?utf-8?Q?tGcytCuyzUvCVSkyFfZJ44a5Q5JDgw9gAgwJsbI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e47e1f8-d3e5-40e0-5e8c-08d929b4da2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 13:04:58.3172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWS0Pi1oWeWQ2MJDyFQKSl6p6KbBG8rBKIFutZmDG+I96jInRc4gHKmQkfHbxUv2SZM3DWkbh2/ejbiP8JIwpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 07.06.2021 15:00, Juergen Gross wrote:
> --- a/tools/libs/guest/xg_sr_common_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_common_x86_pv.c
> @@ -149,27 +149,32 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
>  
>      ctx->x86.pv.nr_m2p_frames = (M2P_CHUNK_SIZE >> PAGE_SHIFT) * m2p_chunks;
>  
> +    if ( ctx->x86.pv.levels == 3 )
> +    {

With this opening brace you no longer need ...

>  #ifdef __i386__
> -    /* 32 bit toolstacks automatically get the compat m2p */
> -    ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
> +        /* 32 bit toolstacks automatically get the compat m2p */
> +        ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
>  #else
> -    /* 64 bit toolstacks need to ask Xen specially for it */
> -    {

... this one, and hence you could avoid re-indenting ...

> -        struct xen_machphys_mfn_list xmml = {
> -            .max_extents = 1,
> -            .extent_start = { &ctx->x86.pv.compat_m2p_mfn0 },
> -        };
> -
> -        rc = do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
> -                          &xmml, sizeof(xmml));
> -        if ( rc || xmml.nr_extents != 1 )
> +        /* 64 bit toolstacks need to ask Xen specially for it */
>          {
> -            PERROR("Failed to get compat mfn list from Xen");
> -            rc = -1;
> -            goto err;
> +            struct xen_machphys_mfn_list xmml = {
> +                .max_extents = 1,
> +                .extent_start = { &ctx->x86.pv.compat_m2p_mfn0 },
> +            };
> +
> +            rc = do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
> +                              &xmml, sizeof(xmml));
> +            if ( rc || xmml.nr_extents != 1 )
> +            {
> +                PERROR("Failed to get compat mfn list from Xen");
> +                rc = -1;
> +                goto err;
> +            }

... all of this. Preferably with such reduced code churn,
still/again:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


