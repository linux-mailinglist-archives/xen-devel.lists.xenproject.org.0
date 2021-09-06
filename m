Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9AE401D43
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180016.326509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFyE-0007vH-JE; Mon, 06 Sep 2021 14:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180016.326509; Mon, 06 Sep 2021 14:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFyE-0007tU-EZ; Mon, 06 Sep 2021 14:51:38 +0000
Received: by outflank-mailman (input) for mailman id 180016;
 Mon, 06 Sep 2021 14:51:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNFyC-0007t6-DZ
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:51:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1779ef4-d67c-425a-bb44-16905e5f7d68;
 Mon, 06 Sep 2021 14:51:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-AicrIZkDPiGpM8Q08cBCzQ-1; Mon, 06 Sep 2021 16:51:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 14:51:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:51:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 14:51:31 +0000
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
X-Inumbo-ID: b1779ef4-d67c-425a-bb44-16905e5f7d68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630939894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+e3TMfIQ3h7vzuGFjSUuI1jlMp8WLtee/hmiATvu5Y=;
	b=c2bG7a1cDwWAkNrSGeXra5lsf4/OmlcbnychRFXnLmrCMdrf4hlrJewR8DqWaXpgS880sj
	hule9+7EyVUmOxZzxtLPp5v2rZDgo4P6dRF6/JHIxSeRqSG6hZ0liwrZmpP1kKLjZgNHRo
	hywICSg21uIZTrfnDL9HibPd6eXracM=
X-MC-Unique: AicrIZkDPiGpM8Q08cBCzQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9oiN8EiXENiLveTSwmZdfT24vfgz83PH9xzFjxOhbZwXRYCSaw/bJez+tY2VYVmbkhHZFpagBLYrMQd8r0wnkhE8YBfX1Rb5a8dFIVhQlW6h1rfy9AM7DNPcv1n4/EzBuKrjNyk2k44DhrtNBzN5AnK97+oysdCSrqlMrEb/y1ifHhs/Y/+J96O1GIKWBwUB5B6w0mHK8kDYgYmMi5dtdgnIKBJZwup9OuFK0ng2AQGWFHLsgMwofgDTTmfwmsx0I9m5w2vxzoV9Gcg5Tc8KAxuJ+UY83lk0oKn6f/Tkk9/e2p6Zf5pu16k0s44amDohPoX0fQlPxIsbIMacZoZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=w+e3TMfIQ3h7vzuGFjSUuI1jlMp8WLtee/hmiATvu5Y=;
 b=mRALFWuwLamhmvp5l5pH8Y6azbeGOcWmYtnlvx2fKnZYlWLk2OKAObp4NBIAgm3pZTOGJkw8jdnEMqJS174U6jGSJ5L/zg1/fy+h8T0XJT3wxxuZSMHB9Z5ITjLVBSkS4PY9kCqHOJbqrsnaAknyly2xEL7KIPPKG4DGawTnCUfUSlBrEm3gCwQtbtR14fVsEIFshCTmKqur5mBgK+IGGH2ITsm0lVAmbadsDAsmr/OGByxdmuchmzoVg9/0Jt3Nz6+wgbju1jOiXTkQvheBXA0noNnVeHdIybsD7Wyl28CJH+Rn/WfBSdo0TWwnM6ZyHFrJQqV9I5sMEk8ZFPioHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 7/9] vpci/header: program p2m with guest BAR view
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-8-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90813678-d873-d346-5f53-ab97aaedd3e6@suse.com>
Date: Mon, 6 Sep 2021 16:51:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-8-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f704b4-e29f-4c46-0d01-08d97145d101
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68625A2052A58D2841710113B3D29@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nLHflvI2dgXVcHIKnK5CUAPowX26T6oAB4oD/sgsA4VxGi90Z2QxXfY032buko6GNrKMj7TDVg7m1FlfJCFPEM4t2e40vyeZOqGor6dAHE/R9vHDEOX1EQkcrh4t6I026uy4M+Gp/z7/l9o363ceBb9ryXyuvDVwY3qOxk7kkHqPIj715IIDkz43tYRfYMyZAd5sxuU0yTkyb8dpBwd1lN0qAxFc38LTiH7EMjDTymXaDvC8Ri+H1bu3Hqqu5u+42EkNDspR26B/8hsGmt1C9L+u24lwq8Zqirb+/Ej4mmm9ILfsxURbjTHAyoKopCjZ/B/w6nKIJtcPb8A/8Zs62pfmiZrZDVh4sjNoYWeeqYWmllOzzbfuZj0g6J/cCD9mBsCn2I9qjkzdbyCO+/SXK8GMkBezTa+d9pJIxpfpjY1taIyUD99/tprQgcx7fDN4eHlaZ0luC1OoMYWFE96Jg0ytCGewSclZkmFt94WNPCSBcL99w7Y89WqxbMu6J1/RvIFKXJ+kbQkFfnWhkOsdJttyBqe8ByZGioVFLcGmtkO3UAQx1E2g8XQhqTsO1k551AZRB2zRgFDrls6w77UfAKvXAfEIaKQhAAQsefv+q7Jok6ZgyZSwH5gmX5rhD2lV0Zb/t5gSalsjyJoW6KxDMIcbNR6hkz0A+g6Vkd6brxYkZwjc1DQFCXWf15c+RtSCj7a4lkMI4tOz/9jpH60Wz6JtwqJ6/rHDUiVAjwc+0+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(39860400002)(366004)(376002)(186003)(31696002)(26005)(8936002)(956004)(2616005)(6916009)(66946007)(53546011)(36756003)(8676002)(38100700002)(4326008)(66556008)(5660300002)(7416002)(31686004)(16576012)(6486002)(316002)(478600001)(83380400001)(86362001)(2906002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFhBNGFpeXpBck5PNHJaV3B3czc1aWZ1aGZSalhHNk0rdC91dWZzOHNrcVRO?=
 =?utf-8?B?bU92UkhNbXV6dHVseW1vdlpIdENpT1VhQXZ1K0JtRG5nVmRvNHpReXNEVWI0?=
 =?utf-8?B?dG1icmsvNWxWZ0dCdExyOU5leU5KM0J5eEdXYnFuQXBHNHlWNk05aWs4U2p0?=
 =?utf-8?B?UEUwYmRYTm5DVEdNUFFydkp3V3pWbFFBTVdVZVE1dFdHRmdZL05rMWdIUDAv?=
 =?utf-8?B?cGxxMWtuMEkrTTF5U3hrbldKRXphNVRkVnZrdEpWdldUMzk2V0I5Z3lsMkZu?=
 =?utf-8?B?bk9Lci9vVXllQ2NaeTZtNjBkaE9LTGYrbEI5RVoxYVhyVGliYXRKNTRmcjRK?=
 =?utf-8?B?TTRjWUN1STNvSG9oUFByckhoU2I1MDN0OC9sQnF3NzdMckN4N1Y5dDVsWmox?=
 =?utf-8?B?ZmZoNVNtN0FuSFdib1k1OXg5WkV6VHZmUS8zRlA1b1I0cGxEblJrbk8rRG9p?=
 =?utf-8?B?UURwMlo4T0hEdmNYdEdaWlRiVWVkR0hGakNTb2FXY1RVUTZkeWQzclcwQ2Rq?=
 =?utf-8?B?ZTF4Qys5aU9BcS9aQ3VkQllHMXQxNmVBdHo1MTlVdEtBWDh6cWQvU045LzNy?=
 =?utf-8?B?NEp0S2JsU3B2ZmozVU9YT3hMbEtYeUU2Sm16ZWlHdzRtcXh4VEhDTTZlcEhE?=
 =?utf-8?B?NzY5cDhDZE1RZzNGNDRQc0FKZkJvWXRJTG1ISFZiWk1mSGlFY2xWMjcwRnNE?=
 =?utf-8?B?OUd3WHVGbEFBWXc4dkJjeUpLQmVGMzJFdnVoaHh1WllzY0t3UmlFY2I3bll3?=
 =?utf-8?B?SmhSME5helVOb0IwWThJTUtLY3VnbGl5QU1DQkRzSUJzc3pJS290NGpLSmNL?=
 =?utf-8?B?Qlg2bU4rSzZpeGU1c3ppbE9kVFo4b1QzQWQxL0NlN3M0eW9QVXhlUng2RE1i?=
 =?utf-8?B?ZFA5WFZ5TFdwbUUwZDE4K1BVUmNVdVNCbG02cTU4WS9pRGo1RENuS0ZRWHN5?=
 =?utf-8?B?RllEbGd3OTc4RjZtdXZpcm5zazd2REU0REZNYThOdytCRXZuOXhjZ3RoUnND?=
 =?utf-8?B?a1NEdjhNS05OM1dJQzVhK1g0UlNBa04xeVJ6OXRxam1NVnAyOGlhSzBaMDFq?=
 =?utf-8?B?UWRydjN4OWtnU09iNkhXVG9TcUlQSFVIVGZGTk9GbGxLYlZxKzNVM3Q0TkJa?=
 =?utf-8?B?aWRrakxCZ0pSbzBUS2tZd25oWTdqYnFQTFJTYys1UklIalNxdkczT3hJOXNH?=
 =?utf-8?B?Y3BkVFVSUk9Va1VDcXJBRzJpQ3Y2bzRwL3lXLyttdDU5SUZiR3FXZmMyNUJR?=
 =?utf-8?B?WmpseUlXc3M0eTJQVXcxTE1DVW00aW9iQmN1Slh2RGZabForYkJ0Rm9oR2ZQ?=
 =?utf-8?B?TlFodHpUb2s5MHBqazliSXZheWNiMDRIK2h1UGJlaGw0UTJjOXRPd25ReVVt?=
 =?utf-8?B?d3lKSTB0NXNuS2FrdTRTTWhCQlVIWGtnQXcwVHRPdzYza0dxaVpFUjlDclBG?=
 =?utf-8?B?eXc4bDllMllGWWJtalYya3dPSi9SeExROTEyN1NyWjBxS2FMaVpwcjNwUUJV?=
 =?utf-8?B?QklnbVIyT0ZQMW83WTc3d2JVaWttamMrRjhoWjV1YzA5cER5RGtkVnV6SCsx?=
 =?utf-8?B?WDl5bXA2N3p2djQzSFJVcVVOVGhtMFRBTmxYaWVsMjAxbFJmQUt4azdyaHJj?=
 =?utf-8?B?aU41clRNZ2I1MEF2RHAvK0FCZHlJWGdtd21uWTRhYzNTT0gwclErNThPY2Jj?=
 =?utf-8?B?WlkvY1k2UXV0MHNvMllhVmtQVzR3c2daK2UvaGsyREVaZ2ZmbDRkVG9UNFR1?=
 =?utf-8?Q?wpsG9PmYRfFLtNOmU4ZrEH4MbazGv0jisGYC750?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f704b4-e29f-4c46-0d01-08d97145d101
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:51:32.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRNhdyZN6gjMGRBq5g4cPSOU8ktaGjC96t8cH2x1o9UAqf7xVOjbOrqFZLEYMzWgKlvzJfWcpvx/birmV0jwbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> @@ -37,12 +41,28 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>                       unsigned long *c)
>  {
>      const struct map_data *map = data;
> +    gfn_t start_gfn;
>      int rc;
>  
>      for ( ; ; )
>      {
>          unsigned long size = e - s + 1;
>  
> +        /*
> +         * Any BAR may have holes in its memory we want to map, e.g.
> +         * we don't want to map MSI regions which may be a part of that BAR,
> +         * e.g. when a single BAR is used for both MMIO and MSI.
> +         * In this case MSI regions are subtracted from the mapping, but
> +         * map->start_gfn still points to the very beginning of the BAR.
> +         * So if there is a hole present then we need to adjust start_gfn
> +         * to reflect the fact of that substraction.
> +         */
> +        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));

I may be missing something, but don't you need to adjust "size" then
as well? And don't you need to account for the "hole" not being at
the start? (As an aside - do you mean "MSI-X regions" everywhere you
say just "MSI" above?)

Jan


