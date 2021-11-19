Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC4456EB1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227810.394111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2eb-0001NS-9I; Fri, 19 Nov 2021 12:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227810.394111; Fri, 19 Nov 2021 12:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2eb-0001K0-5U; Fri, 19 Nov 2021 12:06:05 +0000
Received: by outflank-mailman (input) for mailman id 227810;
 Fri, 19 Nov 2021 12:06:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo2ea-0001Ju-1O
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:06:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1097b20e-4931-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 13:06:03 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-aHSY4e5rOFmthHmO4VdokA-1; Fri, 19 Nov 2021 13:06:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 12:05:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:05:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0039.eurprd07.prod.outlook.com (2603:10a6:20b:459::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.11 via Frontend Transport; Fri, 19 Nov 2021 12:05:58 +0000
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
X-Inumbo-ID: 1097b20e-4931-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637323562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vWZb/CzzzkP7Q1+Ep5+MNMZa4AVpfxWfgN2cUSP7rUk=;
	b=SppVQCRq/TjTs7XSwN7d/csmTFI02uoV0nw+/UZSYzEFAjjrockv/jZwjv/VCvciGQ1CyM
	EYOxfXIvpEfSuQlkO/ElGnF5Y5Eq9U7vRWGSy8rja9UGEPi2GvyAIIWxzmVhkGeyAFWKP1
	GozaJk6AvZ9oFx1jD0TXksSY2B24028=
X-MC-Unique: aHSY4e5rOFmthHmO4VdokA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egc8htBk53hkEZE7ITJe34F8QT9j/lt0jPiIwVmoiSplibjM2mSd/HDa3Xk1WwrAjfbS+jwQh2vbyQowyfY1gH+fuwW3wt0KuKAQjC0hXRRVLxb7DhnPERjaZ43I+3/aaW1c31s+aT8RlwQt9jG3uj7r4aqczIGo5vX8YRREmrZWAAWHorB2YVgjFuADVpc25x+MMcblmiEfbJpOhO7kulzC85L2KN37SW3Te0eswB21NM/jSxcfiBmNI7/DJM4FC7QeP4CEec2TaJ7ZL1c9fNEbXD2eyu89a0STAfbUm/1MBN1JOEzj+5scXc/AxRoXXyPUg2WYGxmvoey5uoV2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWZb/CzzzkP7Q1+Ep5+MNMZa4AVpfxWfgN2cUSP7rUk=;
 b=bZea85eqzAc1Z+5o2J7ejbQLFsFHtOUafKDgj4XQp1NuTM7VW3yQZpV7e0XS0WJlDRoml4gd21Lkw/ZyrmP2koZ8+/YIsduwtPgTC8eaNqLU81rqIituj29+Rk33LO9WNWuxaja/c1rEYJvOpB93ESHOiA+kD6AwT2WhhK1DQgpC16XFMZ40e9Q3usy8XZdgySv6/uLkLson32iz7G6llK2JFnxLWpT/oUwH+ny/3KgkJth7ago4PptLQpeDylgiGUWi921oIzKJkessUL15wVFZhDfeqG5uwtcLk3reOgDFkEat/1ZNYgPvUTEI/8oJl1NpDEw/LTYSnbmyPJ0GEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
Date: Fri, 19 Nov 2021 13:05:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-7-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0039.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77c9b394-ff94-4bed-8ba2-08d9ab54f31d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469A28C0AB58719391C5625B39C9@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0TR8+gAOO+T80GMtAQx7hroGi+jMGgjbn/HlnSYa1nQDbkfDguNmdC/Vv5681qQm15+L1dVarz/XjnSmU/qHfrgOviqTzV71dLNzzrodJ8HkRTk4LPUGmEn+KNs7AQilSYA2HmGm8rKC2bU+9dt1iCYIlAjVfqUbmVoHsFBI9aaM+bCUISJkoqceB0naSq6MkKmE0QowldREY6JdpMg6s9HAdSjy/3BAaoSRVuZP6g6+ND4kNtQjA80AD21z72z+qQDpre26QGk5UmGa5zz/DHNH8fZQfVqt1Dxkw+GgsmAVRDyevcv+kOH4vL4rC+vLFL50MP5Pfs51YATCrTsk6pEnMcY84Ep5yaMFQw+Eaum/ASE4KwCJ1GYBWALcGcpIr5eo1hLBwDREs8Mcd+dWfzOveiyPL/3b/xPRa6gTukqQv/HkdCnohsRpXTIrVoEo2jwtp1nENjBOlg8fbvBGaQ7gsqxWKO+t12LiPbn9zgDJxhHSpRVaExX53NFLSrPstu7H6xCn3Xd88VO8KEDVWCVKIBGDLmpHBcR2su0kwh8e4OVQoRSBUDLMzMVqiQxIVWsJn4iQ849vgrRsCpR58FTqWsJ6lkG65f0UbIW0lApLZfGyymTu6BEw6ASwe74Q6poGUvPgnb77IfeHIvsUjEvqBld39wTN7epJT59pkbgJc1w6ilqFqWHx3u++LqdyxczaVaenJZAEoKXJ9Yd1yW6+wGNLMUpWiRPEEhqlLVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(4744005)(6666004)(36756003)(66946007)(31686004)(66476007)(5660300002)(66556008)(31696002)(26005)(7416002)(2616005)(956004)(8676002)(53546011)(6916009)(16576012)(86362001)(316002)(6486002)(2906002)(508600001)(186003)(4326008)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3NWdFBvYlQwVUNucjIxdUV4WjlvcXpKY3hvbkFLdlhPcHlzeS91bWVlUGNJ?=
 =?utf-8?B?WTVvS3N0ZmhlbHFnZzRtZ3MxcHdvVzF3QTh6NEh6N005YzZsdHh0c2VtajBF?=
 =?utf-8?B?bDMzcFp6MGxrcUJiOTQ3S2dncXE3TEdBd2tQaERNUlRReUxsT1hkNlN2Q1lh?=
 =?utf-8?B?d1k4cC94RVY5R0llWTdWRUpyQitrOGZSTWlpVTEwMEZLNDhCeDZ1Vkp5emxx?=
 =?utf-8?B?UFhjOTFuMXhYdVE4QlZNREl1cUVFWDQyY0NMZ0xobktlUGFKSWtZcVJGTTZw?=
 =?utf-8?B?TGRsb2VQZWxKSVcxRHU0NTZiem9ZOXdiVUVvUE9lN25oQ1NYbWNwUVRoQ2ZW?=
 =?utf-8?B?RjFGOFU3R2pLZjZmY0tLMldSbWl5MXNaWVorQ3JHYm9ycTNRUWpLRDh0UzUy?=
 =?utf-8?B?L0cvSkE0dG94bFN4M3ZiMjQzWFdQMDY0cU44N28yZG13NjVSTUp6QVZ4RjVM?=
 =?utf-8?B?MytyaUxYSWpkL1p2MlRhanJ5MnU3TUtjVkZEczhzbnRxVWxNc2ptVHBuK0tS?=
 =?utf-8?B?NjY2ems3NFh2ZzhVWkZNc3QyYTF6WE9wQ0VUeDMwdGtJNGJ0MHB4cWRDVExU?=
 =?utf-8?B?T0Nza05rdXZpbHhsVk1mMlIvSnBvTVhrRk1mb1h6VUtIRWlCc1QzeVI4ZStT?=
 =?utf-8?B?bU8vZW1zL1NPeTJjZGxUSVdzZTlCZXNPZ0o4TjFCVnZaSjVnRGpMMVVxTWVT?=
 =?utf-8?B?L3R4L1FYdE9RTGRFREhrMW1nVEpyNWVRQ0RNU2UvMEtkUHFrUnp6T1pjdTdU?=
 =?utf-8?B?ZktsSkdTeC9TZytyOXBpZTVSSWlLVk1aZDhxVkNDZVNGQWd3dStocEF2OGQ0?=
 =?utf-8?B?WEFRUVlnd0tKM3hKcnp3UjB3Mi9jVWRFUjhIa0toZWYxOExlVmNBeWQwYnJu?=
 =?utf-8?B?MmlJZE1WL1pBTDFreHluRFdnVjFFOS9DVTFldkF4TW1PZGhLcXQ1eWlwSkE1?=
 =?utf-8?B?OWpHTCs2bEYrVWxueVVId1VWVXVuc0hDWFIvSklZb1RxUmRzY2JnNmcrSWNq?=
 =?utf-8?B?dnNGaTl1WFB1a0kxRmFQRE9GRjNPUTNxa2hZclAvV2pBTVgvSFNHb1RyczNx?=
 =?utf-8?B?Ym5yc1RIWTZxS3l6VVE4Z0VCOHIrSVoyWWlOeFZPZGc2K2FsWHNJN0FHUzlr?=
 =?utf-8?B?TFFBdk9KLzF4Vi9GZDA3czlpbWxkbE0zckk2a0FLQ3F3Q3VId25TVHdTSDdQ?=
 =?utf-8?B?anRPWmtOeFBBOXViWUpWNVFqS2h5RmFiamRJWElFYzRCUWU4M0EyWGw2ZVo5?=
 =?utf-8?B?OHZlaGdjdTFZcU1mYyt1VExxbG90TUxFbi8zNzdXQlVLTkhackd3ZzMwU0FZ?=
 =?utf-8?B?YjBZN05kek11NWdyTzFwN1A1UnpDa292aU9KREIrcVBpRnJZUEp5cFVEbGxv?=
 =?utf-8?B?ZU1kc3hSMmlvUnNUMzgyR3Y2S2hDSG1kZXZNalFzdkJhaUdwcEVlYUpIZlY1?=
 =?utf-8?B?THQ5WmNJR0lZYUpodmtXd0Z3ajFkUS93M3crWWxJNlM5cjMrU0Z3WGhkNEVs?=
 =?utf-8?B?QzB0Ni9leUNpOFM2cHFKVkhmeVRsVy9YdVg5VUd1RGozekdIbnk2UU1NSDZE?=
 =?utf-8?B?WlFNbUlQWmVoTjJySHNKaURUZFZQa0luOWVLVWViNmNVNEZ5elVxUjBBb0NL?=
 =?utf-8?B?WGR0Yzh3ZHAvZVA1bjhmUFI4YzkzMzIxTkl3RkpVOXVRZHpDTmRmZHN0dHRn?=
 =?utf-8?B?c2REUlk3MmxZV3dHczkzUXZGcHZiRHFVSGFVeDJDc2ZGTjNkNVNncHcvS3Jj?=
 =?utf-8?B?U29POUxUMEJmbUhlRGY1Y3dGdmhEWHlDeSsyYmdDdGVKUnZXeUtJRUFXWTBx?=
 =?utf-8?B?R2JBZ1NTT0hFbHJ2Q256SnFubUxEbzdSOXJoVGdnK2R4RWc4SVBpQk1NZktW?=
 =?utf-8?B?d2F2WWJCTkJwT2ZRNTJRU3FyYXB5cVBwNlRuNzNzT3dVSUlza3N6LzI3STNv?=
 =?utf-8?B?c21oQ0lpMksyaG13cHRyMWo1QmcyOFcxSHNKZmxReHBIa1dNRDhDRnpRQzlZ?=
 =?utf-8?B?cXdXeisxNC9ISmZwdFVidGtPVFdNbzZRcGlxTEp3WitwdXJ2emhCWlppWnA3?=
 =?utf-8?B?dSs4THZHcnVBcWZacU5nMWxZK1ZKNDh4Y3BrRHY3eCtzVDVBcVBoQVUvRVZO?=
 =?utf-8?B?VithUGJob0lNSnhnenNMQW9ZekxJd0JiQXBObTczQXF6QVVORTBlcmtHR3lV?=
 =?utf-8?Q?/LWINQIOznKS7VM0rU3ZWKo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c9b394-ff94-4bed-8ba2-08d9ab54f31d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 12:05:59.5287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRY83cZm4qQ7jnsUIr327QF/HxjWQDqbPiaqoBxkGCbwPyrNKEHYkInudTqSlmB17QFi009LSy4RiyqknKJVtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Instead of handling a single range set, that contains all the memory
> regions of all the BARs and ROM, have them per BAR.

Iirc Roger did indicate agreement with the spitting. May I nevertheless
ask that for posterity you say a word here about the overhead, to make
clear this was a conscious decision?

Jan


