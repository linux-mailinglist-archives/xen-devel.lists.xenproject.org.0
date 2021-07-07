Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF113BE990
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152296.281376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Ne-0001gV-Kg; Wed, 07 Jul 2021 14:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152296.281376; Wed, 07 Jul 2021 14:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Ne-0001dd-H7; Wed, 07 Jul 2021 14:18:26 +0000
Received: by outflank-mailman (input) for mailman id 152296;
 Wed, 07 Jul 2021 14:18:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m18Nd-0001dX-8s
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:18:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b658c29-e916-4871-a95a-f218f0dba423;
 Wed, 07 Jul 2021 14:18:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-2IPE5EjaPMukArSOruKEvg-1; Wed, 07 Jul 2021 16:18:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Wed, 7 Jul
 2021 14:18:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 14:18:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0205.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 14:18:19 +0000
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
X-Inumbo-ID: 1b658c29-e916-4871-a95a-f218f0dba423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625667503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiZd7ZFXOjWS8wcBhYOz5OyozrZLS7mhkzr92yVjytM=;
	b=DC3nvPhiMAhmMUe/GeRE61cBXfpzBvxvvdZSls+lHqMmH7UvTYiqkeUuRek4LuMUBPh1L5
	/aRPq2XgThiyuh/vD4VcX0DLGRh5UsiOP1LzvcNvfHGZLehD55vBZBJRdKkTauFC0/OzdA
	MxddafApTFRBJ812VMrtLmP0Z5dHQRc=
X-MC-Unique: 2IPE5EjaPMukArSOruKEvg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EukFQoSyVV9/J0fYOt1Cvxy15RotMOTmBmLRszRZjiE5wmnh+VQHbLQB0JhSAM0ty7HSSCXwOXnRs+ZN/ToSWD07lBbHSkYi+QGvHgn58M/OpRmOpUZ6jRIBZdGRZvT7fz9zxBm9yLx6Ua2hZLYzcVRkA1Oej69zmcR2CEA1Z6qjIHRKoZNCYPrZy/Md7dfoX6ETcfibMe0dOMbAEI1X5F5NZjuMFTAnrIXkKyHvDK/VOlr82I8N1FnU1snDG2Vs+M52dweSsxPW2FF/YfAQakK2hdxYyKMRpW/IDnM8iwEWufcCYDQdY24EcJQBgXrMPKZG/wLua44QJi0Ab/xgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiZd7ZFXOjWS8wcBhYOz5OyozrZLS7mhkzr92yVjytM=;
 b=kXRpiAmunwpeklu1ZnH2dKVqCdM2APU0rnQcJV5MnC5mWZJuNzI/t8rSxbVwIerlq7L4N08lvlX4jtLTLGaF+k7xf9sruG2KAmf7Md965qZufx57xaATHy0EPKPcIeOApfGfsjyU4YSfZSmUnsuTmvH05hyb3pRCT0uJuWRoXsbkNUTMOXgq+tDqthZobM/ImKueh1sojs4hUKG7EipH41JcpERobVgTBUKWo8O81LZqLZfNLmgtNCCotwlf/dDJhyu0FMx/5EwY96+LJFH9HvjV4uiSOdncAC6vfIW38Th+gCPWw1Vd0qH1X5c6KZ5JeBjkGvLv8/Pz/Bwa0OvUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 02/31] build: introduce cpp_flags macro
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1eaf6dcc-1b92-361e-04d2-a172223ae96c@suse.com>
Date: Wed, 7 Jul 2021 16:18:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0205.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecd86d0d-8ffe-43ee-f645-08d941521258
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3534D5B931257EAF27567C55B31A9@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kf2no31wDJtnF0kF/lUk5hmREPHN1XNlnzJIjE9rjX608Bg1mPj+5OQMUPdZ3p/joz5qHVJUXrpYOSy8B3KPBux2rC4eKXDujNSK1j7Xhgb8IBv1OJbxpfXW78uARVQvHCEiRZN0h6AUvCOc9ZUtpwMszU2gosFdyex0+dWUwy//DQQy5CdwL8m0xL5kP5/DAAgSJ6f8KK340QFyZLmWG8cjgXuKSNK90zHiPnL+1s1a9eAYog+X1utSY/zl2Ey1cs8s1lsrenyxhq/CWeXkM2JNIr9qXPVyjiPnMhtDiAwRD9MliL6OcWyjW40mKlbqNMx/bWFsfvqK9O6s6YwPXRauftlxkJ1pVGCftblqbS9ljQb4xte0H2uLyAKzji9NU3CGpRoxGlvyR2V8cuYbE/pGWSKAyhylXA8C6g61dZFQPauZENLoo2w7ue/mtsRXm8K1QbSMMN9o6BYmHHPw1U7/qgYhLGttlEPiJnrEUmo/emdJsoWGgMRXfoJ7z405OqJz+lQNHNhmj+Sdm2y4hrshgBy6Z3g2SEO0mTt6rCLezhhOaWwf3GR5C7fPdbkxYb9wfFiTctIeHMVZP7yPmRvpo/RUqhLvBYxpPpUVW2dIjznECk9Jg4iOc/7pHzDngtDCIIiQvTjqQD7lMlCCqjxI6fJhi6IiJTbhEUOKDQJoVgxci9HF7p2faUvrXqbRPS2bFKUYRtlrzcxAYw0oJsodcst7brERt0KaZAYjfi11SdN4LLo62Gu2NHqGUvNA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(376002)(346002)(39860400002)(16576012)(6916009)(83380400001)(53546011)(478600001)(31686004)(186003)(2616005)(54906003)(38100700002)(316002)(6486002)(86362001)(956004)(4326008)(26005)(2906002)(66946007)(31696002)(4744005)(8936002)(36756003)(7416002)(5660300002)(66476007)(66556008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1VqY01mb3lkbUdOYzJQV1Zud1NiSnFsZVV3cU9uWDlVYkhVRUsxZENoREJK?=
 =?utf-8?B?VVhKT0NkejNCZm5FbVpEa090bUtvaVMwc1JORTczZ3BLNHl0UVBtcmRRS1pQ?=
 =?utf-8?B?K0hFYm43UFAzRVVIb2NNdWRRYnpJZ1BGYzhjSnd0ZlJFQVZNa3BDSTc1cXdW?=
 =?utf-8?B?YU9QT01NZHUvZFNQODdjSGQ1UDNBaUcyM2Z6cjFCZDhiN2V2aWJveFJZOTJN?=
 =?utf-8?B?YUZMTURmcWxpM2R4a0hmU1k5QWRtM3YzZ3h4RVJlb21vVkRtVzM1YVhSZjFB?=
 =?utf-8?B?N2kxUkR0ZW52UUxSUzZPNEt4VFg5Ym1TY1VaWmVDSy93UFllT0tNK3ppZFMy?=
 =?utf-8?B?RERCRm9MNUdRdHlXWU9OUGFXN1ZPQVV6ZERBUWd0czdxamU1dm9FSzJjeXU1?=
 =?utf-8?B?VWEvMjZNaFpGaWRDR1IrbGdHWWdYM20yaG9UN1lTQnFYbkpIanFnbDRkbytj?=
 =?utf-8?B?VTJLdDRaR0IzVWhoakZvK0pHQTcvU2VYY0FLQXh0WGdnRXc1MFl0WUdCMjVl?=
 =?utf-8?B?ckhpMFJrNFd2Wm1pSGJlU1NwY00yZzA4VE9TNjZ1UGRadnZwTWhTYWE4QXdh?=
 =?utf-8?B?VnlNd3BTZi8yZnJLWVM5SzNCemYrM3hqU3ZjZjhMZC9ZQmVwK3doa2ZyKzRJ?=
 =?utf-8?B?ZUlzMjNCM0xYL25yVTdWekc5d0NROE1veFN4bFExdXc2akgrWkd2cnh2VFpx?=
 =?utf-8?B?RGtHYlhTMzB1UUpUNU53amc4K2VKakF2enB3K09rN0Q1QkJROWNpV3ZaOXR4?=
 =?utf-8?B?dm9mYWZhZzRjNmdVQlZZOWNNQXFvTnpjWFk1WHpFYXZRQjFtU1VVcUdxa0ZE?=
 =?utf-8?B?M2t3bEk5NStibmpFVDg3eTQ2cDNFT1UySWY5QlVEdk56QzIzUkRyYXEwZVA0?=
 =?utf-8?B?cE03N2ZONUZZNjRuTU1LRG4wY2hrc01sUFlSMU5zbno0b3JnL0ZhdmNFOHl2?=
 =?utf-8?B?SG5vSFlTb3RsdXlRMFpLejlFcGx1OWZzemlZblp0S0dQOHlsU0MzbHpmWVZN?=
 =?utf-8?B?KysvQWxQYWhmMG5wS2xsQmZLNUFqdWl0YXdGTkJXRm4xL2NNRkZPQ2tkcWZi?=
 =?utf-8?B?djVYd0NXZkVzeUZ5OWQ2Y0hiQWZMQURHZ3hCMjZGUTEzS3lBQmliRDlPVjlu?=
 =?utf-8?B?SnVsNnRLb3pzV3dJTGFLZzF0UWJYcHowMWd3TGhLMzVybmVEZFVhb3ZURkVO?=
 =?utf-8?B?aW1adjZEWEN2K2JoL015YlNqWXlYSk1IdWkxeXhSSUFLbW9vZjEyVWIwMGpx?=
 =?utf-8?B?Qy9QaUZmZDBFT3MyODdmeHN6NE1oM2RJSUw1N0c5QW16Z0MvaVF0ZkZKUERF?=
 =?utf-8?B?RUlPenFtL0s1bm9pUFRtditIZ3o0TzhsVjlrSmxZdVI4RUJqRmVrWFA0cHl2?=
 =?utf-8?B?WEhNMTYzTjFGU3RDTGJMRnFoNWYycUY2a2QvTm1qbmxpd09xdktFRVIvbHRl?=
 =?utf-8?B?UG12RXBWdWFQblZKUnZUdW03WG5BclhmWFkzb1Fxd0lDbzl4bTBlaDJ3SWZm?=
 =?utf-8?B?SFU4MWFEU1FRaTdhd3pmVHA1RFBOWWZLTlFhU1NvVEl6ZEczZ3JUODE4OXpq?=
 =?utf-8?B?RXlGcXpwOFpBWDRQVHRsMSttRWpiM3h0UXVRc0lmSGg5d2JPbjMzTkwyK1ha?=
 =?utf-8?B?Q2xGcng4RnhETWN5dlFrRmlBVUpSWHZtTDBBK1h5QVJQSUxkUFdPZHhPcnQr?=
 =?utf-8?B?Tyt1N3FxZGlwYi8yQ3lGeTgzdzA1UzNQNEJsYXZuZm5UVGFYNHN6d2dsOFJa?=
 =?utf-8?Q?jDPQ04/2SPmgAPcidp27oUBQDMh0h7FVKvD5fXJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd86d0d-8ffe-43ee-f645-08d941521258
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:18:20.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtwAHITG8BWIKsRN741oP2101enMLQPcRM4GI/rplQZnO2bhEI7gF3dDC0WQ7mzOvCvxUbPvp+gH3K1Z+jJINg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

On 01.07.2021 16:09, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     v6:
>     - switch to a macro as suggested
>       which allows to be used with both a_flags and c_flags
>     
>     v5:
>     - new patch
> 
>  xen/Rules.mk                    | 7 +++++--
>  xen/arch/x86/mm/Makefile        | 2 +-
>  xen/arch/x86/mm/hap/Makefile    | 2 +-
>  xen/arch/x86/mm/shadow/Makefile | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)

There are two further uses, one in xen/Makefile and one in
xen/x86/Makefile. I think both want replacing too, and the
former suggests you also want to strip -flto alongside -Wa,%.
I can accept the use in xen/include/Makefile not getting
touched, as it also removes an -include option at the same
time.

Jan


