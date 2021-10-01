Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D541EEAD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 15:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200629.355168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWIkA-0002By-2S; Fri, 01 Oct 2021 13:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200629.355168; Fri, 01 Oct 2021 13:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWIk9-00028y-VX; Fri, 01 Oct 2021 13:38:29 +0000
Received: by outflank-mailman (input) for mailman id 200629;
 Fri, 01 Oct 2021 13:38:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWIk8-00028s-4W
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 13:38:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7507fe94-6313-4912-89a8-21b46f92ee36;
 Fri, 01 Oct 2021 13:38:27 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-UBPy5Rq4PnG7vn_SyT5nzw-1; Fri, 01 Oct 2021 15:38:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 1 Oct
 2021 13:38:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 13:38:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.7 via Frontend Transport; Fri, 1 Oct 2021 13:38:22 +0000
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
X-Inumbo-ID: 7507fe94-6313-4912-89a8-21b46f92ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633095506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmm97YkAc0S+VpA1HX4CbzpqfCrFhQlyQfEIZZkjp68=;
	b=Tko8oBcJJ3cTt4w4umQjDB+OBWJaRaK6/N123cWv20EgVjHvXMqiTqaJotzoW4HwLKfnFo
	EN5G15j/ZSeLyKj3Rc0R/QDnEXdKZRNybh4hnh34wCL3hmo4ZQEZ0hyLjJ9SzIajfTtewt
	ZPPbwFZujgiyZKp3ebChqL6GDjCUS4g=
X-MC-Unique: UBPy5Rq4PnG7vn_SyT5nzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bawwOhO4hek9Kss+TpavW3diqwKvfyE7DNqlsasrAtN6B0Ay4N1l+ICY2rr9HiI5Q0FEvLXMp26gTDmIyuD72M8tvKUiw3ZmRLUvPNPqpBh5NT0SyS/bwMNuxtwzN4wvd8R587VczDUG6eAlqx+lklmVQIAspx8OX7b4ML58x/WQiMgqTl937La2ZaZbFGg6bAQcHXLLsNTh6sYNIBcYBiCGP9KQCZUhA47oGWmyLZYJDj7BX+OsQD1mzsJUo4Nr39AeutUM3VFmn6UnE/wTCQ+8eB00MYyvvr9ZgnQ7+nTgDPlVuGynXKn9gnyLrcvQ0IhdbJppYU4oKBCiA9AqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmm97YkAc0S+VpA1HX4CbzpqfCrFhQlyQfEIZZkjp68=;
 b=FlQZTl9Iqs6kF7h1M83sItMjkOIMjtWXIDsm9JUCAbSTMksWz1eqU7EuwQaDMJGK5yOIRX1Z4mBfiKGTtdOTiAmn8dW7Uw24exD6k9WcQ6SDiC5wOUdiFDgaQt7ITW+Q5bt/PQAEs+DXq0z/R2RfJ1d+2gnQFEN+tQg7Z2ptfCRielfsTm3b00owrvp6Jv8oDM5T5WDxzvBQL5raCN+0bIohU31GpDnbwiD6JCPvYTwyb5/sHyscvg7vkVWheNvNyHlnDZtutDOmVoZolB3k83GTdzMRIA80clpJuezQhrs9mzQUMPh5FTylo5D4HdTQa1nbNsySnIYZDItttHp6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 07/11] vpci/header: program p2m with guest BAR view
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-8-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39d756cb-6ea1-b787-b5e6-4d88e763feb1@suse.com>
Date: Fri, 1 Oct 2021 15:38:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930075223.860329-8-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8dc15ee-7e65-4526-171e-08d984e0bcd8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4607D4866D4643B5C25BDCACB3AB9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QtL/K4x1tzyPXR+/uANB0eMqa3k6NUIqbBks0eiDm0NTzjH/Uxplw3dfZLHO13qLdEpbILh6X/HMVfsdJorkZxLZTnwJU51WfAfYTMHD7wRBeEDqDrIysZAHtRejyN7OVU6jl7BEkg7E02M94zRGq0pwgodCqz3c2G9F2ohJAzHByQ6I6pI5fXRTQ491q8Wu2AdVE4MTpDWwhcdsxDfgQrShOugMtfHAVUy+fXkj+lqXPpT85nrVPnifFaTKoSwKli0N4yPGLglAyd2d6sX43YUzy4f3O6/O3yXSXgi81JotAmohMKLxH53ZLBZ/FMe7xcb+B/MFYUdJNPiu580iAUJ1uo/L8/kNpI4rqiY/RJgtMTBk1yosld56Iv4Vc0w2WFMs19FvLnI23h842s9cg2y3rEbpLxwHmVKJozeFaWaOYCq5jlXfyyZlXEjNURwbUMenI1t9B+gWWxcE5JwJiwGHmp/lB1cSAfaAZdr+tdhgJvumE7TzszuWEQ/i/1em9YLPE483x7YGoXfOaEJ/fi4xlf+i13OxaXNhTFQwjmC0S/qosQG3Nr+dIRr0dc+ErzsaNy2ncQad8avEO3Hf/XIaY6nyVLE9ex2FAjpdhmcJPS7rG2BDAsf3bLdR7x6+yCfc7eiHxcqbKU5ZiTVj1Hqn+bTUJLk8ufRuNz+YeP23MGiXNXMiW9mY9QgjjcQL3tOrBuHVrtFAVPGmjX7/9l0o9j2nkEn9NddwbaQL0CchSd9RxWjWcxYAEZ3OHATn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(7416002)(316002)(66556008)(16576012)(6486002)(66476007)(66946007)(31686004)(186003)(83380400001)(26005)(38100700002)(6916009)(508600001)(36756003)(2616005)(31696002)(2906002)(956004)(8936002)(5660300002)(86362001)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGdidktZVGliMDltdXQ3UmNxR2Y1di9pU3ByNlZOMmdHZEVoN3lsWDdDVkxs?=
 =?utf-8?B?NHdCYi9ueGtMdHBsWG9Mc2MzOVl5MHJYQ0I5ZmFNRUJ5NGF4eU1PTVBoTmdp?=
 =?utf-8?B?b3h6Y3NqQVpMb200TnRuOXp4ZTVTUmFySVJ3VWEvS29rckkrK1NMbzZFeEtM?=
 =?utf-8?B?MmVucU9nNGJUcUZEUHNjbHFUVVFrUzQrRmRjZ0R4TGNkQklsbTFMK2RkWVNZ?=
 =?utf-8?B?Sytvd08zdGFucTZrYmJCNFZlandnVC94UHRjOHNIV1YxUGdXQms4NkI2d09z?=
 =?utf-8?B?a3dyOTFYckhRRFhnOWhscHNrandER051OE9zS1BoL3BKQU03L21pNksrYk5z?=
 =?utf-8?B?VFJVdmZvTllCYWoraFRVY3huYnRjSUhNMjEzSzBFdHB2Qmk0MGh4YW9yWGdp?=
 =?utf-8?B?MWVqejMxekNEcVYwVWVQVjVDUGNGU1JJNzNvTFZ5VitOcktWMXNlbm4rRjA0?=
 =?utf-8?B?aVRGTFRaRHRTb2k5TzdkWnN4SjBIQzBMb0YvSk5ETStHSTdaeHBXeXllSGcz?=
 =?utf-8?B?VjE2NWlmOGpXMUJSQVU1a1pzelU2d0IyR0JiQkdUQ0ZnS2JRWHlsVjEwb2Ra?=
 =?utf-8?B?K3NFU2Y3cUkyL1N6SllEVWZYRUliaUlsWU5obVNaaTZIRVZ4YklhTTJ0WE1B?=
 =?utf-8?B?US90SVNhYUpacHJOMVZYaTRlOXpyRXlOV3N6SEU3d3FtRXFBb2crRXl1dzRk?=
 =?utf-8?B?OGJXOE8vdlZ4dDZ0cWxVbndudWlJYWVWQXNqTVJoLzBNR2JHSytJWElScmVQ?=
 =?utf-8?B?OHhCTmk2UUlHdnlrbTRScUNDVm1wcUIxd1JrQXdoQXQ1UmM3S1BETk1JME1J?=
 =?utf-8?B?Q2hzOHBHWlhPbkM0dHNSRzBXUy9wY2Q5N01YTlZxSnN4S2l2a0ZoMTk2SmlS?=
 =?utf-8?B?Zm1lM09iazFva1l2dGl0R1dFU1BLaTRrOWdoMlVkbFc5TnBrUFFCNlkyV3V1?=
 =?utf-8?B?T3JacFdvUVNBZEJxVFZJdVZzN2ZDV2ZpQThTK3ZyS0NBQitzQ0grb0pMdHVT?=
 =?utf-8?B?T1k0UXJDSmNMVlBld3Y1cjRQaXJLK3BiRmlCeEh3YVk4WkZCZ1ZuaDEzK09E?=
 =?utf-8?B?SVJmcVlzcWtyajYyTFRldGZ2UkhjWXFtbjVHamxxZGJEVGNUajB6Y2xEOHdL?=
 =?utf-8?B?bG9ydGhwSVVNTXVQMVA1amdOaVJlcWY4WThWOFhlTGdsa3ROeDZRUDVkR1dr?=
 =?utf-8?B?YUZ1RDBTTXNmd3VDY0pkR0E1Q3RDS1czeWFrRU9mbzNxanJoT0lyM3p1SzNY?=
 =?utf-8?B?S2xqYUJzYURseTB4Q0sySVNUWkhqK2IxQWhkcFV4ZUoxbHI2cW5neEtCZ2ZG?=
 =?utf-8?B?ZUNqZmZOMVJDWDAwdnJ1RDBKTGl4SE55NlZrNUVZbTJrbzY1NWxTb0hxVFdy?=
 =?utf-8?B?RVdEU09UM2lteGYzVlRzdmZPTEtLcjJzcHkvSXVncVFOaXpSVk5UMXFicEcy?=
 =?utf-8?B?N1F1TjlodS8zY3I5RUcvT3RoeGFVdXJFamJMR1VXY0llVmVsMlh0WHFiV2hS?=
 =?utf-8?B?aU1WNWhpL0FyNnU5VUdZbXVlNWxmei9lUWd4UFVZNHltMGFSMFJjMWVodlJp?=
 =?utf-8?B?bFdnWWNSUlNKNjYrRGx2YkdyemI0N0R5N1dQWGlaZ1loU3R3L1QyNUdrVXV2?=
 =?utf-8?B?QXRuMGhGRzkzSlE3c1hOUEpiTytxa2RFRldVeVNBYW5KeE5rTHJQMWJpWlJG?=
 =?utf-8?B?SUFpWU9sMlhiYkIyeWx1SWZRZXl4MlBKMmhZVkY4dkF4YU1oc1hrK2lTenV1?=
 =?utf-8?Q?CS8PpHE2fToK+Yiyd7KquAJ6SZETntBggOcEGvi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dc15ee-7e65-4526-171e-08d984e0bcd8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:38:22.6934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwX+jazrGSBMTuiVlbOKq4DFQHhLEcEgC3XtzzJ+AVJIU1vJxZV5rAFQMWSuJ8MFJgWVnLRgT1vrb95olYMPvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value as set
> up by the host bridge in the hardware domain.
> This way hardware doamin sees physical BAR values and guest sees
> emulated ones.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Just a couple of nits, as I remain unconvinced of the rangeset related
choice in the earlier patch.

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
> +         * we don't want to map MSI-X regions which may be a part of that BAR,
> +         * e.g. when a single BAR is used for both MMIO and MSI-X.

This second "e.g." seems, to me at least, quite redundant with the first
one.

> +         * In this case MSI-X regions are subtracted from the mapping, but
> +         * map->start_gfn still points to the very beginning of the BAR.
> +         * So if there is a hole present then we need to adjust start_gfn
> +         * to reflect the fact of that substraction.
> +         */
> +        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));
> +
> +        printk(XENLOG_G_DEBUG

Do you really mean this to be active even in release builds? Might get
quite noisy ...

> +               "%smap [%lx, %lx] -> %#"PRI_gfn" for d%d\n",

%pd please in new or altered code.

Jan


