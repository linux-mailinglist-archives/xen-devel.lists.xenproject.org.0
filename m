Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8DA3BD80F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151362.279743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lYl-00073o-Ei; Tue, 06 Jul 2021 13:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151362.279743; Tue, 06 Jul 2021 13:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lYl-00071G-9W; Tue, 06 Jul 2021 13:56:23 +0000
Received: by outflank-mailman (input) for mailman id 151362;
 Tue, 06 Jul 2021 13:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0lYj-000714-3M
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:56:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f01ce0e4-de61-11eb-8497-12813bfff9fa;
 Tue, 06 Jul 2021 13:56:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-bWX9iQULN5uTcfD_DZOPRQ-1; Tue, 06 Jul 2021 15:56:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:56:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 13:56:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:208:be::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 13:56:14 +0000
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
X-Inumbo-ID: f01ce0e4-de61-11eb-8497-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625579778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDE0HYdVWJ38/VbrQibF2AdXhlrnFsiuqMUU5P04z8U=;
	b=AXl7Z+9tRwvoxzlYTkdcZ+qR0edOy/DQRxxPMhqVX/CmAVxpQJ7r8NumRRxIjoKtNZ8yzr
	/8ZobqxRVxz6DU8rX7m4bJvLPq43litXBicLwlopkmkN4jDVm3obcXiKLbKRgFCDrcaE57
	KX0UBZ6Lf+uNWM45Txr+tUFLi6BIKt4=
X-MC-Unique: bWX9iQULN5uTcfD_DZOPRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DruKaP5G3lvayFCCEtLHGDuBjx9OV60udGNaoONZU+XegvMJ4perVyPZUBIZcHUPZdLpd70T68ed+nOAMm23Pu7B+jvsAyZaqQeehMazrPOlgY+fK6ckwHKn2yTGEVJme8nyKSXU8F8Ytqzezsyq2h2WsGCF/qVZkowe0eNEQwCXn3bJk+U7loBkJmTWt4/MzIv5SEfPyAFCG0cXDQwsh7xIIZ3YmirZGX6TGXz02I0iobpnFHBQDBYckRsli/R2ViSeA65ZUV8/SH30ciVHdbcY7uZCMxmhCkwCe8wXcxOZR3eHcFOL03FM8pqCDeEpleFtt4Npc+w8AjlAGL09YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDE0HYdVWJ38/VbrQibF2AdXhlrnFsiuqMUU5P04z8U=;
 b=FuQL1No8fF/3QhN9P/7KXTWffoYMXaKYFLMIxcF9i4tfwhhUC/mm0pab0OwKK9Je0mFrxEV2+9RUOAagow/MiLphgT2adtlXoG12tlRM8mfgK/tpQpPvPVre2v3hquJ0K3k/Msx+m0Owkt8Gv4Yt5Hx7lpQULPQsyZPLXKMWZTQqFN1SzN0nyw8t/iPkJXNSD1JeZHeKdKQ/NkfWAgFJ7qUajyBoHlM1T3FbAKmRGQLuiGQNU2ANmoDEY05T4AUF/58fgZZL18GgyDWO11IW2MucMeBk2w9z7S9UfR1W/fbd9XPoHR290519nQI1IOaXOkFzZ18mlp8dWzBtrAbc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: aepfle.de; dkim=none (message not signed)
 header.d=none;aepfle.de; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <20210706145804.1ab98f16.olaf@aepfle.de>
 <902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d4ea4ef-210a-335e-ee77-5e9401352c9b@suse.com>
Date: Tue, 6 Jul 2021 15:56:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:208:be::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dbb9137-9da4-4046-d1f8-08d94085d246
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606FF7ADA853573693C9FD2B31B9@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eFVp1+O0BolLSbMX+ZOk3sjlf4fQRWt18LB+mYR0JjrtoNDjdCVDdey6v8BlAhkTKaQg9fYM252TOY5l4q2JG0Qppq0h6jwsoYOUXmMHPY///YGUV5oZXZRNxOtElgbmOCpBf9CBEm3HzgTn3PcZOF7es83c1ECtiJrEMxvwOhRuxiwQMaXUElSTtPv1V8Ie1xx3qJ1BKkLiYsjz3oHg0bqSJUggiSFM5NQrGg1rCBSoExFmUtrSDKNgbRC0oSbKQ/gg5d/BWXL6BH+zsRt7Ac6CZH57ujIMF9aY0Y//PTWJzs6zNliZeLahN8ErkSgReS3Kp+qEXho6FOc9otw5Ck48IntO/m+LZ57YW2zq2zpdB+b3irXgpibnrPhCd0x+VdEu/MgYfZYNRwWenpF+BeEeHHZMlXBa0+dnoceDp1gm7Y3jmoUVjOiACvjyVwtUi6m6A0zKHpPS8wyL4gxc2ddx+BxYR4Gu5PhJG1zHU/lz8C08VaNBQH6U9NByBrHNT1QXpXwC99VJJcR4GFnsMJt56jkodRv46IXSETAdLWIhfDFf4LMH+aKg1tbMA0Cnaa+XtrvX3ugK2+tU+tl2LEldnS5BX6lFQmyPLeyPbFfdsI2QNpNRfucd9YSQQDSuhXvmepJ++1Y3Kg2ff+7wqI0S3yiWVvpQoiCf+f3Z/WRMxDm6MJJUB3XKzrlI5QkIQfMvrbTwIWnMlo8IVuKq23QEf7nIYw1aKQIehVA05ZCd0cXlatgpi28HZdIqzc/d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(136003)(396003)(366004)(346002)(36756003)(478600001)(31686004)(6486002)(8676002)(86362001)(2906002)(6916009)(4326008)(956004)(53546011)(2616005)(66476007)(186003)(54906003)(66556008)(66946007)(16576012)(31696002)(316002)(38100700002)(5660300002)(8936002)(83380400001)(26005)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?DMuzTMoGarCZ1hwEafcfrS5XDuAjRqHodo2mzhduV7MAhbTyY2JxHhAI?=
 =?Windows-1252?Q?Ks6q105MK0gjPBm5CFL6ilweeNujZubFeku04ESDR+Dyp7kJeJlhcPsr?=
 =?Windows-1252?Q?y/XFETHsBZYvG4uqRzSEuPOrQ8plUGFvPvLfqcgnOmwXe2F+GNaXmcGH?=
 =?Windows-1252?Q?Q+pRnkBZoDX0V86FiFYtDFmoYcuDlqXi+rPCtxfefMRZPkWC963BCnmh?=
 =?Windows-1252?Q?Y+13vq2U0mnepEIk+pyLDYwleQMyCF8LmDA732qYwhO25G3T04wcl2C9?=
 =?Windows-1252?Q?Lew2jobP6gPUvr71mEYAw+ajmSSy5Zf2Kja041INU9BRsVn4qx62p9DH?=
 =?Windows-1252?Q?hX134cCzb3GNCV9EQaTZvItn+czeRRYnxkmC2+W6G8TDFP7ioewHU/Wy?=
 =?Windows-1252?Q?Xc4O8O86ZVWp3D2KDdaxSrBSjYujWlZ3F2Y8F5E6SR8P9psKmh3uHgZw?=
 =?Windows-1252?Q?KRM0hnAIE779TDpqqqqvWH/fKdrS2nkcLuNPPVo8dOoHiO4VEH+4eGeR?=
 =?Windows-1252?Q?DIKDlufJ8zSxww7NzfODuhc+ZvwXDcT1WJJaMJubuvuwr0tSitZUaWn3?=
 =?Windows-1252?Q?RupIScO1jd5mjtcKsxdwCdHxCUXvx9qtBZ0RQMHo0JOwCvpSH+XUwv4p?=
 =?Windows-1252?Q?IuAEUYtLHFVVtx6qPGBnwvMWdsL3xRgkng2I6oQ8n4fe8nLgVhPGZ+dP?=
 =?Windows-1252?Q?4q1e0Qhq26SSPXZBbACKWAOgXbjssJqWGVJBcFoLuZE7hIur84IzeNuq?=
 =?Windows-1252?Q?3cOUuF+KhazVniVSnMSePaLvi88TTL0vHbJxvZe8Xs7Lx11fP+WfP5Yv?=
 =?Windows-1252?Q?W0hvRa6MYhy8PCuFHMdrgS+JSQECeVViZ/ZxvQp7aBL9BQnoaJx0P1yP?=
 =?Windows-1252?Q?yQ31Wwf4XI6chFQsoTY+GFlo5xgYIsQcYl3P25fDAFwXXUMwjOZil0o0?=
 =?Windows-1252?Q?vvJxRVo1jXuBAypL2TVv+W3oKrJDZw5e25S8yZK8vxFJJHZUTdiJ/N/K?=
 =?Windows-1252?Q?yBGi94znxDJB4qm8yxirkc21zAT2qZSXTIkpgpaiZVWMaX6M5gDdnGvB?=
 =?Windows-1252?Q?AzKRiaB06PX27IVgeNrVB+Eyh+gTYkR2azeFTY9AuAsLVzoLR5VMxD1B?=
 =?Windows-1252?Q?5v2+rUMe1QYRZ7qzQt3p3cf4ZAHgbm6P8oU/VF9hQRrDZzG/05iZT/+C?=
 =?Windows-1252?Q?wgdlihKdvczvvsFBZ+e+VhvSyEEFMCSLLXsJGkydrgGBfixM6NZccgJH?=
 =?Windows-1252?Q?nigDnbwrorC2D6W3PYOiPPBl1vBBVNPeZSlfcm1gCwhel2BPLkFcDNq+?=
 =?Windows-1252?Q?uU614qdm9RJZLNTkIM9FORiz3ADnEtwz8curml7uI3mGftPrO3r1Wl2/?=
 =?Windows-1252?Q?rxUXv3om6A5jnV10r/9dMFUdg4AO7+R6KwMnswmXJhrzeLDNwAro9h+M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbb9137-9da4-4046-d1f8-08d94085d246
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:56:15.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP6ZmruCWzZj8Qr+da0ew8xDrfYiAApdaEmNbrp2t2xl+mISV5AiX9OtKJSQS8VJlFNDQXSWwZfdvkLeAT8iiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 06.07.2021 15:19, Andrew Cooper wrote:
> On 06/07/2021 13:58, Olaf Hering wrote:
>> Am Tue, 6 Jul 2021 12:23:32 +0100
>> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>>
>>> +    count = stats.dirty_count;
>> Is this accurate?
> 
> The live loop relies on it, and it worked correctly the last time I
> tested it.

When still merely investigating in preparation of my recent series,
i.e. without having made changes yet except to add some logging, I
did observe "Bitmap contained more entries than expected..." a
couple of times, with "written" and "entries" typically apart by
just 1 (as determined by extra logging; to be honest I don't recall
if they were farther apart at any point). So the number is _not_
accurate in any event, and cannot be used for other than reporting
purposes (as also expressed elsewhere on this thread).

This also underlines that, unlike you did say in a reply to one of
my patches, this is only a "detail" message, not an error, because
migration happily went on and succeeded.

Jan


