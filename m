Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB586447C7E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 10:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223136.385692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0aK-0007kB-3N; Mon, 08 Nov 2021 09:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223136.385692; Mon, 08 Nov 2021 09:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0aK-0007hY-0B; Mon, 08 Nov 2021 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 223136;
 Mon, 08 Nov 2021 09:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk0aI-0007hS-Ln
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 09:04:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f21857dd-4072-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 10:04:57 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-R84h1FKkPVWZNRcslnAkAA-1; Mon, 08 Nov 2021 10:04:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 09:04:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 09:04:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0025.eurprd03.prod.outlook.com (2603:10a6:20b:468::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 09:04:53 +0000
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
X-Inumbo-ID: f21857dd-4072-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636362297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9BR3w1qtteb7SAYw/dVKzJhDj+0XA2h2ePAIPCzzSA=;
	b=gTXeqvk6czONm1lwYXoPV17thmpmg8yw9xEhUIU6f8FAitAYL4QEThv4aAkVow/mYL8fwG
	vbMURQhHXRSp6kr5Z6hJBqmp+QM7jftGpFWyFY9Ee91/D11PWzV25NDx6zWDsNqCXStc9H
	1pgtnE9+uZkAkBluz/aa/ecHWoZ5H/8=
X-MC-Unique: R84h1FKkPVWZNRcslnAkAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXLWoUvnut7rigO3IL3zUAWfhGnkef4xCeXq49MXq60JZLLHYTUzSReqg3vZzCRbDZfD77BF9vNtfktAtazOXwHOZOGpRcyZXcljMIotvUI0BOLKViTGDBz3UaCtJt0x5cqUsPjCtT6XHzYZbud19Gfvn0fH786Z5Rle5K0SWxOTDFk9AhTh1D+DOk8arSndykt2k5t5aqbBvy/JTvXUjh2tA7e8fbTi00ocT0ACFJGbzhQqoxgOd4I1h9RDmddFi/qZ+t1MLjEkmvJ6MdmovG7JgZZXpmhc8HPTi5bXQ79743G50l9qDfvftLQPtgTA6VHjq9v2M5JEqm6Nvx5JzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9BR3w1qtteb7SAYw/dVKzJhDj+0XA2h2ePAIPCzzSA=;
 b=dlY5swpIIjQmgxs83SEZLDuyDkAXRkSUclM9/8D7Txv+3e8aoKL0vhvpbmxxjRC8f3ReTBWfeM7PhLBBXlrcbh0sgneMhrcMhSP3GEhn0uU1QFLMP2SZoggk6rn4/aF+KfNeS1mW/Qt+W2T9/pmsSud/Jc0IeQGjui2CZnw0DyQcCnrMohACUgNq0lUJVF+ycsLCJW6qjf9PWzngQ8LHUX0xZJrgzdZcKo5/rST1iqjFj6xJdXlRJ/nduOhapm79mqkjdqcIPWg2FR1lc5BnpkBxifhhw43TLBCk56c3E7rwLNb8zGwQjXt6mPvfWIxwuCqbWfu12N9DXBO/Hlqmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2a68ed1-e7b3-0862-65d6-0f0e1ca454c3@suse.com>
Date: Mon, 8 Nov 2021 10:04:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] xen/xsm: Improve fallback handling in xsm_fixup_ops()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105135555.24261-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0025.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99488d28-3b2c-47ca-fb1e-08d9a296d447
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040A1B496C0FA5F86D7464DB3919@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+0zzVJgFxtowfa9KOUaVMWA9xvh4SZ+rwRWY4SehmBLf52WjruGSkCcXbwT1dSAwNov3YODlnfozqy9xGEprOYIhYsrBQwr3zioTnRwdXQZpZgWEx29gSLm5DKP3nbRELuC76z5GSx9UI3aGICwKa8Lw5GqinFWCyfxAZKTFfUzNm/dz0A669cJZJ6hp1cmj0d8LqQ9Nlq0PSt4CSX2VzociRNlVy3ThOIIkwcJy5IwWs0wDrDXNKIhzs+kLdSNJKCgreQesefYvI7/FzNgD60NhNaA25dgtZRnluXOsWQQpJQgSnuOMjriVa9ej6axsAQXe1KC8JgHVWpI/2svQrNJkA/tErxKvrcR0mx1rhkgJEI5zt8mF2Wh+7GvkLA+YbU0ZCLTART+dO7NR+Jezb9IqYTGOLNSH73El8b2tgsM53re2Nkxac2wPgtS18Y/2csuQTTb1TH4SMjBqtyDQov8sBE0Sqz0574PopI4bF9znLfBje1hV28tanhU1N0TUJLPiTKlG4C6IhglsErcxDqGvZgu8ycpnT24aOLuAyyzaPmV3D6HktOxBgV13kSSFa6WVvnsFFbx1UkKHMatnfvYH+BoGuTF6iBEyQr9ZbyrrZLvj/VkoGqHu9vxzBkRYj3wOLr+DHi2qkcQA4+tphgc8csEww59on1B9seeTkXUqOMWtW2nKr7N/OImGcJ++78WhWR4ZCg21tB2kXHdusi5RcBHpu2/+jqo7W4eb0QFnh+JQsceFOO13CqIVqI7y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(2906002)(16576012)(26005)(186003)(6916009)(5660300002)(53546011)(36756003)(4326008)(54906003)(31696002)(83380400001)(66946007)(8936002)(66556008)(86362001)(31686004)(2616005)(8676002)(66476007)(508600001)(956004)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b09sUUUxc2poUG51UEdhUHlsRW1QT1A1SWY5S2piOWoranQ3Z3l6VTJoK2FT?=
 =?utf-8?B?MEtBVlRsYytTZWJ1Mjl3dXdWRVEzVTdpQU9tZ1RCeXh6TXhndkNiZ1FJSUZo?=
 =?utf-8?B?bnNIcXdjTTkwQzNubzd5Mmk0UjlSWDh4K2hGT3Q1czJIMVllMFB1TVdlTHZm?=
 =?utf-8?B?cWZmdkFPTTVqYXhYdGpFa1NYUlJ6blE2RUFhQk4zSFdrYStzQTZlOHphL2Vp?=
 =?utf-8?B?V0VueTEvU2xoa20xSjdIcmx6ckcvYU9UUFhtSGZYSXZwRkRKWXkwYUlPVUJJ?=
 =?utf-8?B?M1hBTWJxa2puOFBmOTJIbjVZRUV0akNMc1ZwSVFNdzdjdEhiZERYaXROWnkx?=
 =?utf-8?B?RllGVWZ1MldEU3JBRHA0bFQzbDUxNXI5cGpSSzFKclBmQU10WVhob2QwOHZV?=
 =?utf-8?B?eGhaSHM4djJXb3NoV1Z5OVI5S015UWJGN2dYdTlvZjB5b2RCU2tqSVhrdk5P?=
 =?utf-8?B?M0F0YVlHOUEwd01JbjVoNmIxeHVDd0FSTFVTSk9jWEpYeWdnamJLRHhQV3Nj?=
 =?utf-8?B?RTVoQkRFaVFid3RtN3dZVU9oS2NUMlBHd2lGbG5taE0vR1hVa0dsZmVVQ3RM?=
 =?utf-8?B?aW15UUhNQ1I3OTU5dnNDdGRaRHJWNGE2N0thTHVLRzg3MjF3M1IxaUl6dFVF?=
 =?utf-8?B?bkJoendaRS9rajBsWkZEM0tQaG5uWGRob3lkU1FvaU5wWXpEaHZQMWYrU2xw?=
 =?utf-8?B?QmJJSFZMdXdYQWp0akhxYi9idTh1bGZYWjdCamJ1bnZzQUduM2J1NGpvUWNu?=
 =?utf-8?B?aW1ZWHZxMGpMWTNWdXpMSVloelhxYU9SMlNiREdWazBtSHk0elhKczdHUDFu?=
 =?utf-8?B?c1l2d1pGajNwb1VBZGRoZG5nV2hwcFpPZnJGR05QUyt2ODM0YzM3YXVwZm92?=
 =?utf-8?B?U2EwUmo2NU83SjFQNFdha3FRTnp5WjJQVXBTeW12WUtTVHhZajBMc1diZU1q?=
 =?utf-8?B?cjBVNEhFNHV6cElBWnRVc0hObERHc1dnY2tPYjVnTHB5cVZxRVRqRjhsV0N0?=
 =?utf-8?B?M0J1S2s3d3luUkp2dTR1U3VySy9FSGVJeE1ubVZlZEl0c2E1NmtzVjYrNVJh?=
 =?utf-8?B?QXBMK01KOTVvUU0rcTh4aWVoS0NheHBsb0pnN2lNUmVNenRrblRNdE9XcXNy?=
 =?utf-8?B?Y1BXMnorK1QrS0JJbVhhc0lDRW8xOXBuOTIwSHNKWFIrRFNVTzhIalc5MWZI?=
 =?utf-8?B?U2ZUMWk3eHByRHF4Q015aDBCSi9oMjNjR1NYZGM5OUxKV0hneFkzTlFxNDFu?=
 =?utf-8?B?ejRQL1B1SVJxdlVuUStxWWtyR0dRVGplZVl1bXcwK3FQT2t3V1NWSU1SV0My?=
 =?utf-8?B?MWVjYlp4dGUxYVQ2alFzcFVTRmRIZ0F5eHRkSnpIb2F5cDNSUGQyTmExd2VP?=
 =?utf-8?B?VG5QOW5JY2x3ck9GcUVwWFVkWWVuQzc5cmpJdHM2S2pyVmRqMmw5bGRFWnhY?=
 =?utf-8?B?MUVWaTZBSXdTcGQwcTRmYU5JcWxQbEhOS2g1RFN0bEd4K0FUd2VsVGNHMTlh?=
 =?utf-8?B?Vis5eHBFQjdIcnhKeU9lUmFLSlljcUFFZjdIRHBQNXpsQkJ3YUlZNktyTjBu?=
 =?utf-8?B?bXEvamdWenZ2ZEt5aG1lUGhmVFIrNUZqN2R5THZWMG5MSXRZOTJ1YnhWYlZW?=
 =?utf-8?B?ZnNFY214QWpmZlFrWVE1c1hMa3MrcVUrTGNOa29UcExkdDFGSVJ6QXJNNUJU?=
 =?utf-8?B?UjFZQnR1SkJvRElyWjJidjZlN2VjaUFzYXF5bGpUeHN3TDcwRnJLZSs5aW12?=
 =?utf-8?B?TjJ6TUdlclNGZjE0TVBTS2ZHZXpiZm5uMWtiYUp0RmtZdXA5M2JFcWFVTXB1?=
 =?utf-8?B?YzJueDV0eU1aTDVja2tOck8rUGpXK0Job3JVeGhVQlowWmJhS01OWlUrWnFV?=
 =?utf-8?B?dlJ6NmN4NzlmQ1VQUjVDZVFsTzBFRytvNzNjS2FHYkZwQUtPbnpMMmJ5TGRv?=
 =?utf-8?B?ZUdjUWk3Z0k4a0VJWmdTSTRGNmtIQVZVWmlTZlpDSkVWNWtIY2xXQUZ0dU9j?=
 =?utf-8?B?VU54bFRHY3VKV0lJS25NZGpSMU9NQ0dLSWg4cWVRNWdWSmJwcXpoeWZZZ01K?=
 =?utf-8?B?cTloSFBjckFyTmorbU5QblhMQzJRS3g0NS9Cc2JSWFFJaGlPMU1uU3VDdFZO?=
 =?utf-8?B?SE1aUUJ5akxwYUdxL29mTFZ0N3liUmxSZVRTa1lWTDhqUEZ2VTFueU1ScXlk?=
 =?utf-8?Q?QiefP4pj4TKP5ITLhGz0GmY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99488d28-3b2c-47ca-fb1e-08d9a296d447
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 09:04:54.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z528pnWIQITLgEpxvMtsPYxVhcPwwtmX6T1u75R3oBtOImstzT7X2BHFrlheBMdQIxO/lBlL9I/K9VQcUxJ+gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 05.11.2021 14:55, Andrew Cooper wrote:
> +void __init xsm_fixup_ops(struct xsm_ops *ops)
> +{
> +    /*
> +     * We make some simplifying assumptions about struct xsm_ops; that it is
> +     * made exclusively of function pointers to non-init text.
> +     *
> +     * This allows us to walk over struct xsm_ops as if it were an array of
> +     * unsigned longs.
> +     */
> +    unsigned long *dst = _p(ops);
> +    unsigned long *src = _p(&dummy_ops);

I'm afraid I consider this an abuse of _p(): It hides casting when
that would better not be hidden (and there's then also a pointless
step through "unsigned long" in the casting). I suppose this is
also why "src" didn't end up "const unsigned long *" - with spelled
out casts the casting away of const might have been more noticable.

> +    for ( ; dst < (unsigned long *)(ops + 1); src++, dst++ )
> +    {
> +        /*
> +         * If you encounter this BUG(), then you've most likely added a new
> +         * XSM hook but failed to provide the default implementation in
> +         * dummy_ops.
> +         *
> +         * If not, then perhaps a function pointer to an init function, or
> +         * something which isn't a function pointer at all.
> +         */
> +        BUG_ON(!is_kernel_text(*src));

Just as a remark, not a request to change anything: A cause of this
triggering may also be is_kernel_text() not covering all text
sections. Some of what recently we've been talking about informally
may lead to new text section variants appearing, and whether those
would sensibly end up inside [_stext,_etext) is uncertain.

Jan


