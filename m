Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099A40F336
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 09:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189006.338460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8GK-00061J-Fl; Fri, 17 Sep 2021 07:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189006.338460; Fri, 17 Sep 2021 07:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8GK-0005yQ-CD; Fri, 17 Sep 2021 07:26:20 +0000
Received: by outflank-mailman (input) for mailman id 189006;
 Fri, 17 Sep 2021 07:26:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR8GI-0005yG-I4
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 07:26:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bc0ac10-1788-11ec-b66f-12813bfff9fa;
 Fri, 17 Sep 2021 07:26:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-rovLXMCbM8GrtK30tCfadw-1; Fri, 17 Sep 2021 09:26:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 07:26:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 07:26:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Fri, 17 Sep 2021 07:26:12 +0000
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
X-Inumbo-ID: 8bc0ac10-1788-11ec-b66f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631863576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFBhz6nwdzlrstTFpNbiXuqgmlHYUueogQifd2M0ax4=;
	b=nqR5tI+Bd/oP8WeKpY3VF0CLaj4HqOJkSAPnUDWjw5w7ks5u6w6fIO/65OEbZNGfS+HREh
	l78IlYrM75m9WjGvIsCxj8Dzgsd4xGhpeeytJo0xxGboW1d8lhmEwAMN9DYf0iUMsgn5IJ
	Kg+NUQbqxCVTBwFcHJg7zxmCUeTpebk=
X-MC-Unique: rovLXMCbM8GrtK30tCfadw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EekxNJxJ9SQX8GMNt9/fa/1NHAioyG88UI2hbI4Gxeq8dZlIJvaCj4ifxzKjUTkLTFl09itZyODrABngWdFlzyY5pGOoBXiK5CmEfHnPJObrT0Zeg6eF33H6QU7VA/5zEU0sVF6fblBwERxa9oupz2lPNhK0j9nKEz89zYQsoTrZII0IEkjd6fnV2yLpxTjHNR7MX51uKt4XKWr4TrM1s4xdf24RYXgLya9y8wQEQbfHV4giPBlIYbJpM9aAvu4NIjuBcT1qZ/2WjOUwVTQN7y3eGDjpGKpEog9y/Xj9bT1DxmIn+vMW9/QKFGxlsmclnngChYjSvDDrvW9YhbMzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YFBhz6nwdzlrstTFpNbiXuqgmlHYUueogQifd2M0ax4=;
 b=N84SdCnduDCJMc3jNqm1JNxgQMjxMJgA+rsSY0ftDPn9u5aKccicrf2XcZHk6oi7inyXGdsGln2pnVqHXfkX6GUvi/sykMxKU83bkHXCt/SiLu3uKNx62qK+sBwCkRxZZ6PcMFiaPADAjWoKG7dC+tHORPxQCZtZ3giXY+Suv4Bul0gZNA/Y477hm3ww939srAT/j2ZugPXmY3o71+QElsQkNmh1vUMA+N/mM34XYJOBA/Cvr/cWirelIgSiUbNaeiib1ut4OY7j5Ubf0zIMfOhLQUT670uWe9lBN2Zt64zQJZ1LapLmHqVeUpsQolks0x9S7aazoRTMy6swBy8Jig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/mem_sharing: don't lock parent during fork reset
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <c21708c84c850ff8c976a3934099c54da044e7d9.1631802816.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52b28c4d-1cf1-6c98-e1dc-1e0f7b2f768c@suse.com>
Date: Fri, 17 Sep 2021 09:26:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c21708c84c850ff8c976a3934099c54da044e7d9.1631802816.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b150297-fbec-40c9-0402-08d979ac6da2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260853BC50ADF76A78E78C1AB3DD9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lhoNbeBRHbqWdI9IUM3+jlv58pzvAVqwkGJ8s7aruERNV/80dDTxWIdSmx3PGNcUZbXRhNg225ryLA1YvaqOcwmdfVcP4ttKcuJGw42jAspnF8TpziKfczaa5inoN0hujwM5wA08Qs8OA0sKLC/MBUHslWTAOMqSS+Nra9n04v8H0ZXsfKCpv14d8QOkGxO4MkQq9IYpGC3gjlfWSJYLrKj0u7CEEoI2ibdTALWX9dpZu7FYcvFAwupp6Lrb0QHFA/aTF922W6nfrTrhXLQUMLIPPkI0zWj0z+mpi0wQI6NSn53Wx/fCBVepkxsncFfQQ2dcrUxtelA7DnBroCsBjWHFHnUADc6H6IjkGWYApKUp2FoCtffu+DyIbKrhn+WJmMHWlp6euEsVSTWktGKcmNk2UtBgDBO6SCBxnmYDmRYGziUl/4L8+zfqWKo4yx4gH9vEA3DeNsdmPyN9N5N1h7Lcluc+oLZs5kqOdzyflmtCaLAyp86cuJEQecVoqjezSQQrEG6JS2j2q9MZkTCAwseBDWrAkfxbfwIbe17z8pEXH0MtMpHLH5pasOVYdKu4Re0+T4OeFc+amLp6YpovyGtIWlX0rrNL43eZNT6gKsgOjmC8zmrtTj9Hv/+y3OJNHDFt+ppRJ1eMZDFh1VpUaVlXBO79rhAeZjjVEuDLYD96/fB1y52UqwbPxsvoygRbVG91eft3oepjxbEFoe/yCJJ79fJS6c6Hpzu62GRdtiA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2616005)(83380400001)(31696002)(38100700002)(6916009)(86362001)(31686004)(16576012)(8676002)(66556008)(66476007)(66946007)(316002)(8936002)(5660300002)(54906003)(26005)(186003)(2906002)(508600001)(6486002)(4326008)(53546011)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1Z6MmlpTUJQcTZoU3JMajhsN2hoazM1QnJ1WHdvK2duMkxubU5ORFE5YTA5?=
 =?utf-8?B?RGhLQlNmYk1RVERBdmpRQU9YUHM4ZDlaazYxNTFyVEhCc3Bha2EzbEpVTG5u?=
 =?utf-8?B?bTZKUFhqMit6d2xLcTdaRUEvVzh0VTBBZktZNVRFQ2tGU0FINlI2cldnOEZV?=
 =?utf-8?B?bEYra0lIZkJXeXZKbGRDc3UvVUhLQy9xdVRacTJRUHlISFZIMlJHOUV6clNM?=
 =?utf-8?B?M08xNUdPbWE0ajZQVDRlc2tJM2ZGSWZwZVM3QzlscDRKUVZXVGJOQXZwS1N5?=
 =?utf-8?B?SU53dzd5OE9WeHBVQWRaRFpaSVVaY2kzWFFXOVZGdzY4Q0tRUWxORnE5clZ6?=
 =?utf-8?B?UFRGWXFlQkJ0TW1nZFpWVmRXaURic2dhMms4ODc4VTRKSDhDSmVEdFJHUGlN?=
 =?utf-8?B?YWY3aHVuS0YrdE9qRCtvUDRnMVo4ODlDWmlwWXhIVkVwZ0RYbzBSOWRSYkNx?=
 =?utf-8?B?bC8xeHppVFVPbHJPKzB4WXRzbDYzOUhnSERFS09uak5VOVAzOTZrQTlTNlJs?=
 =?utf-8?B?Qmh2V1FyWWxjczZhQlcvZ3I3YVc2OUd1RjFlRlIvV0pLNXJzTWJaa01MekNv?=
 =?utf-8?B?b28ySitwenRmQ1BMOGNmcUg0ODhURTJucGduem03Y2RISm5Wa0psZ3RZWDNx?=
 =?utf-8?B?TU05aThWNlBucWM1Zk1LS0tnMHZIUERxdUo5MHJ6VXpBVTd1b1JZeGNUUXZk?=
 =?utf-8?B?UXhVeXhSdXIvMWdLU3hSaGJodnFuS3N4SFR6K1E3N0hVMEF4cmVTdlB1ZG9w?=
 =?utf-8?B?U25xYWd1RFQrZzIzWVJwcHA4V0NOeFFnaU1NSTAxbkU1ZkNGbE04RWtLZWZl?=
 =?utf-8?B?WTNCNlNEcGFNMmhiTFlZMEhDYlFJa0wxejZybTVxLzhYd25OTnkxb3dSMUQ0?=
 =?utf-8?B?TVlqbnVDUVlFbGM1ZmQxdVFyakpWNFFGbkhORHUzaXBLTkMvQ3ZjWGd1MmdB?=
 =?utf-8?B?bzNVKzlZYmlxNVVFdFRzZkI2V0w4Z3R4eW9OaGpVZ245KzdDaTZYeU11ekVC?=
 =?utf-8?B?QjJVWFlvOHE1SmxWNmhYWmFZOEZMZ3Q1UUNrbENqUnFvbHRNMjZpWVFoY1lM?=
 =?utf-8?B?VThzT1BwMkxOYzVqOGRVYWhRQ0NUb2g2a0FJTjlQTi9ybGIvSkRKWkhNanFt?=
 =?utf-8?B?aEFOeXpsK29lbXpYUkF6MWFlaWxtODlBRHlwUW5yOTh6RGovQWg4aTFQRTRV?=
 =?utf-8?B?Uzk3Mi9WTWI5TCswbGpFRzVUWFNzeHJuQmxjTEJ4elZiVjQ5YWZPSjl6Y0RB?=
 =?utf-8?B?ZVlhVkUzYktWRFFhN0JUWTV0MGo1d3N6endHcFJZSWp2T3B5OEdSQWNHS3lw?=
 =?utf-8?B?QWJ1ZHpmWGlWWjY0bldIM29UbmovMUMycm9YQWZGNmhoeCtuOWdMeVh0ZWZZ?=
 =?utf-8?B?MTlkdDJsaE9mcFp6RjVrRHMvb0YxOVZ0M3RMLzNNM1hpOE5XWFlSZ1FzWW1N?=
 =?utf-8?B?dHArQTdDcHZIYlROQi93ME95ems1b1ZxN2NvN3gvY1BQcjZsQXg5MW1jUjQx?=
 =?utf-8?B?TGJBaFhzbGJveUZyRGdZQ2taNktPZVJBUzB1Y2I4T0NMM2xYVDJPNmpUUjRT?=
 =?utf-8?B?Rks1Sm5ZVG93TWlNRmZodkFmQ1d3RDRNZ0xKeDhGa202Mmo2SkVlbVNlUkhs?=
 =?utf-8?B?T295Mm42Y0dTN0RWSVVwcTZSRE5jcitWamF5aEYxbitRbFkzZEV0Y3FDQWhr?=
 =?utf-8?B?b205bUxjL1BEQWdIR3lyUWFmd1lRSkJsWTAwWXlNVnJQcUw3cUkxditsNDVt?=
 =?utf-8?Q?MtW9e9Rt5ZW43M9kqVZGZIQQ9MQtjDKRUIWGB7h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b150297-fbec-40c9-0402-08d979ac6da2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:26:13.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoCoWMBA/jKtjtDDuKZ1uXUa9LE8dCMxvU3IAU1tUwgFyOnbm6zwlkdI0V1ABAxXe8ivKYWQOlhk4MRgbrzMTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 16.09.2021 17:04, Tamas K Lengyel wrote:
> During fork reset operation the parent domain doesn't need to be gathered using
> rcu_lock_live_remote_domain_by_id as the fork reset doesn't modify anything on
> the parent. The parent is also guaranteed to be paused while forks are active.
> This patch reduces lock contention when performing resets in parallel.

I'm a little in trouble following you here: RCU locks aren't really
locks in that sense, so "lock contention" seems misleading to me. I
can see that rcu_lock_domain_by_id()'s loop is extra overhead.

Furthermore - does the parent being paused really mean the parent
can't go away behind the back of the fork reset? In fork() I see

    if ( rc && rc != -ERESTART )
    {
        domain_unpause(d);
        put_domain(d);
        cd->parent = NULL;
    }

i.e. the ref gets dropped before the parent pointer gets cleared. If
the parent having a reference kept was indeed properly guaranteed, I
agree the code change itself is fine.

(The sequence looks correct at the other put_domain() site [dealing
with the success case of fork(), when the reference gets retained]
in domain_relinquish_resources().)

Jan


