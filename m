Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E71852A7AB
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 18:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331234.554716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqznC-0001vP-L5; Tue, 17 May 2022 16:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331234.554716; Tue, 17 May 2022 16:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqznC-0001su-Hx; Tue, 17 May 2022 16:11:26 +0000
Received: by outflank-mailman (input) for mailman id 331234;
 Tue, 17 May 2022 16:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqznB-0001so-Fu
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:11:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff9edd14-d5fb-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 18:11:24 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-bTpgSBWuNpCpTXvwrq0TIQ-1; Tue, 17 May 2022 18:11:22 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 16:11:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 16:11:20 +0000
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
X-Inumbo-ID: ff9edd14-d5fb-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652803884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZzeCh0pPrXtu0rUV3W/FXa8ThGf/mCGGbhst6Ctq+0=;
	b=ZE937RgjAKRX5AouLuWIH3YZfz7pcfd0fXnoyT/g/WICpq2AbeHsgPgYIzsN1cbyJZCnqI
	pMP32mVgVMwDEfIMQn4icLTJoNB5A3O5SQ+w6JmZOVooaMofYIFlxdqspA8Sh5S+FC3PRQ
	X4fRUsm7NLVanLEdhpwpGMO8wROqIAQ=
X-MC-Unique: bTpgSBWuNpCpTXvwrq0TIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OL0D+ttCdbixlF6c0YHMUUlteUXI98/KWX81IW7LoT+3joheLbLRbOXKYfRPfIIhNVcrPCDPl1c/O352tJOMPPjGAWLfdJTB1cTa5Gh7jYD7m0cBoeyYh9N1fQxpSDnjGqXMy1pdw1TXMTHdalhGkyVZGIFZTJQo6wPJpXU9rdLNwE4eqFv+jKivNqLcSHR+C2klWuoswjD/XcNXePco6aBbrVc3ES0IF6Hp1sxw2XK26A9ywf3gBWERDQcOrKDwzsavlvYIpCq2gAOdDj0Ig8xM/69P/Jl3KhKwWjjtKI1s+HSt3+PhnRw6OlCzzJIsBKhReQpE/cL9HTuLbuI8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZzeCh0pPrXtu0rUV3W/FXa8ThGf/mCGGbhst6Ctq+0=;
 b=LeOSfk+vmpqfbXgQrGPQdxM3c6HrpXejeM0tV37IUNht+KP5qhxsIamOlZkrcl0BPXwXjxuSd4JTQ6R95FLXkFu9cBVm3tiaxrt/7RG7jgFv8Ci/2f/AKn+Aq2wmoXremwyXQdMj0X2lCK1Y4NHZlMHG22INRZV/a5weACcdkP2OTih3zepeKVjMaYbsOZD0IHx1spa/HbVYcEwbAR9y1m+sEjCl5vS+4rdFvglSawURwZOfLP4v/iNyn670SO7T7Cx4tC/wjPAHzbvEioRgqv1OnreTtT+kDMga8wifm/lqH3y8yP4ERv40Md8RUYJPJCtBW0jpHq0yMkqrATtvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20dd9308-3cdc-4ebb-61b2-e0a71e808697@suse.com>
Date: Tue, 17 May 2022 18:11:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/6] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220510022733.2422581-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69389720-60ce-4841-622c-08da381fe1ad
X-MS-TrafficTypeDiagnostic: AM9PR04MB7554:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB75547FDCE3A516A92AC073A1B3CE9@AM9PR04MB7554.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WIM4u/KPhY39XRrnlb8S9FI+GGyFJMPlAmAK5NrmEbMvN2FlCtq7bLMEgoW2Xwz47KTZQ2AI7myJ2ebdnewrdiC08EX4/+Gxxi8OEDvS7oBcoQTtTBaKE9jqKLnNMTa8qI6zw85/joKQM+Vuit4PQkqVtTUPGFntinWDggovxbPvjJWOFw0nizf9c8K5QZsTQWeMWnW+N7WiQxwG0xIaEV7lKY4elVVjfnD9OnfGGAssCrkBYhVHLe/b6DqzkeeDz0I0b19oaLSERw2TSFXfm8d/C5PLAKUG0ezFkQN+6ZqdfRc1NWocxNVCFfAsJO2m5crAHT2seK0Sec41rUEXohxwxnsiiTQvah5ABfKgfbKxrtnSNmPf+nH1uWOPOH/vWp3pziPATwXmiFJx/s/MmvooA0aj4Clxb5nOIHUSHLDDvzjNzxpQd91e7tPfdxaNpNNSiVlwCth5j27VCkq3Fn53Wz9XRJzfdl/INdUnj157QUbrQ8F0bCpKCgjmkhGlXm9+rozXsa1EhHnEtk+8ZMCQiR1ejXJZkjn+0+6ewkDPEHB4gVg9tOEEWn8Ln4zTvcev1NPS/YqVqzjeu3ogFxqUwtkJubXy7N3LLtF+coqEGr68hxf7TAyNvKSTPxortRNKUfIX4iW/Ox0iaEJ4sFzINTRpKt9ZO5+z/7I4TT5/3NsPAH20J+493bwJYqxdZQ540cLTWBNQ3Hfj9Lzub6xJ8EKI1brv3uL3xoGnS+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(4744005)(6506007)(38100700002)(2906002)(26005)(54906003)(6916009)(8676002)(316002)(86362001)(31696002)(5660300002)(6512007)(6486002)(36756003)(2616005)(8936002)(31686004)(186003)(66556008)(66946007)(508600001)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXdMODdLQVg3TjN1U3BLNEFPKzl3U2FIWDZhdGFWY1FuWDRuVTJpSnI5NlhN?=
 =?utf-8?B?VXFuQk5Ec3JaNTNPVnVvS2VvSk52YnFsNWRlM3p1TXB0THlQeFBYdW5jTHRO?=
 =?utf-8?B?WDlMa3dvT0VNQjFrUGoycHhQaGlNa1VBeTdTaGc5WldTd3grd3haTThWTGE4?=
 =?utf-8?B?a1UvQkV3K3QrWXMrc2UzTHVtMy9IcEZXNjlITDVma3hqMUlQZVZPRi9GRkZH?=
 =?utf-8?B?WVpzbkNxR1lTT2QvZzBaU0VqS1hiQ01kU2d2ZURsMG5Cei90Z2s1V0hvb1d6?=
 =?utf-8?B?TjUyRW8vQUlmek9DNEJBa3BwNU5Bc3UxSSsyQWdSTGU4ZlZ5S3hsdjNvOVN1?=
 =?utf-8?B?Nitnbkppd0ovZi9pWE84aW9uZE9GZ1ZxRmJ4OWxNUUw5UWh1eFBXUzJMTTBz?=
 =?utf-8?B?K3N1bi9CU1A4Yks4blh4WVloR3RkUVVmWFNEME5nU1poeEU3Z0lJVzR5Yllz?=
 =?utf-8?B?UW5RZ2RUczNDUmFNVk1OOGdZMFQraUpQTi9mSkJEQ1g2amtTdlhGOThocVlW?=
 =?utf-8?B?NDN0MUdDYUwwMTVuakRaT1owLzRvMDY0VWxpQjBBaVJhdWVFK1lzYmgrMEVs?=
 =?utf-8?B?QjBPZUVGWk5aM0xxQ1VDZi9pMmlVT1BIdWJmYW9jak44ai8rVnJMRWMxL3Jk?=
 =?utf-8?B?K3NzajVVMXNDanU3V2ZiOXAwWWxzRWtwV1ZEWjN5UHh4WjlaWWFVbE40MWRr?=
 =?utf-8?B?OU16OXZxNFBFRExhVTVCWjZxSU15QTA0TEpqWnpYS0FmMTJpcFpnT2FqMllV?=
 =?utf-8?B?TE1BUUNiRzdaZ1o5dUZ2NDF0SG1TcWZBcDZNT3J5aFgxMGNZYzVNL3ZRbmsy?=
 =?utf-8?B?YUtSWUg4amZTOGx1eFlwUjZKdDRkNUVreUFxTW1rY1NHSFVnNFAzSnF2TUtu?=
 =?utf-8?B?QUhwWU1lQXBBQlErWDYwOUNrdWxhU3AvZlloaXdwSUttTGpRaGhOOTRZemtW?=
 =?utf-8?B?TW1RTWM3a3JjZU5LRGdhYzVhYWJwcDFJTzNVSHhvMjhUWndBd05VeStkaElE?=
 =?utf-8?B?OHcvS0pLbHE0OTlYY3dnSDJlbmlCMkdwSjJnMHE2cXZVeUtsd2JYMksrcVRI?=
 =?utf-8?B?U0VraTJPRzNBdTk2TUpxelllbE4rMDQ2Vm0zUXN4ZWRsSWp4ODRZSjVjVEdX?=
 =?utf-8?B?eGVlay81TDhEcDZDaDRIbkFIdkNWZXkyZ2haZlZzS1E1UXdDK3hkK0ZxMFVP?=
 =?utf-8?B?QjF0L1RRUXZWbEtOVkFWejVzT053a1dsd2NhWWlOZmVPY1VoaG8xR0ZsTVhO?=
 =?utf-8?B?Ry93emY1cnBRMmlsVWJJckxlSEp6OG5qbXplQzBxeERsa2IyNkFJQWN5djBF?=
 =?utf-8?B?U1hOWjkyWDlMRTY0VEdrMGRvZzVtcW1JRjkrOWVxcm1wRzdkOXJ0bVNxaGxw?=
 =?utf-8?B?NEtBbEViYzQwMWFndHNlNmhWN0pwYUFyaVJiTkJscmRZQ2pCYjc5WThMbEhZ?=
 =?utf-8?B?UjdKWW5VQ05mY3d5bkNxZkdITHNzdUhyK3Jua1lrMzFPZHlhRWQxNjNmdldT?=
 =?utf-8?B?MTg1YnAwVEIyeDI3TjlIRDlNbVozTithWkYxdE4xVk1pNXRNUkZMYktscGVY?=
 =?utf-8?B?U3dYWWRTakxKSlBBV3ZVVksvdHp6UzdsT3E3Y0xoMExkMVhMRlNJL2dMVDZI?=
 =?utf-8?B?QWVQajIvRGtsVkQxU0FBbWhyWWQyTEE5QkxzQW40ODd4K0p5UTlFdCtxbDFk?=
 =?utf-8?B?OEdLN3ViZW9KM1JvQ2kyc2ttLzIvN0hFK3J1eDArY0VycXV4VXE3NjFPcDJL?=
 =?utf-8?B?S09BcXlad0YvRU0vVGpYMFlzS0xLRHEySVJ5eFd5UlVSeVJTU2Y2d3dQMjU5?=
 =?utf-8?B?YWpvNlA4NHdPRnlmTUFQV3ppYXA4Wllyc091aFdDUmdqQURJbC84WTlSVU9J?=
 =?utf-8?B?NjJkTG9ZMFgva2g1cXhQOW9rVC9RWHZWa3FJMDJVRFg4cmtSRTBjeC9MaW1V?=
 =?utf-8?B?SHFKYzJpNkRlWDAxVVVmN0l6ZVFoeW1ObzE1N3FHZkdHcC9Cd1Y3Unp5b2c0?=
 =?utf-8?B?ci9oSlorTHY1QlI1RUVKbHpNVnVFU3VETEhiZDVxbUkvT2ljMW85TTNhV3oz?=
 =?utf-8?B?OHVTS2xsUmh3eHQ0TjloL3lJWGNQd0phWXBjOW16Uml2eWZYdGVWSDdMTktn?=
 =?utf-8?B?bXc4UU9hNi9POGZQaTZTOGdqNkNMYS9QV1hzVUppVkFtb1JCQ1JCQU9jaUlm?=
 =?utf-8?B?cDRxbGZLYUhjdVUxN091VC9pV0lqZDFTV0xHL0czN0RFd3NsQkZ3RGtxZWVE?=
 =?utf-8?B?WmFWNmZiUXJ3dTY4UFpBazlzVGZyc0ZaYkcrUFJnOXhLaHlzZDEvcmk5bWhZ?=
 =?utf-8?B?U3h0VWthVWdTU2YySmpYTGppTWVoWGdNYVllcUxQWTkzZVhQQWJ2Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69389720-60ce-4841-622c-08da381fe1ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 16:11:20.8662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTZTyshDRihO4FeRd05UEcu54vrHKUUvNRoweY8yBrWA3Ba9MIqUX/tqlrznhTvggdPrW5nsfBlPAVESjGKwog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554

On 10.05.2022 04:27, Penny Zheng wrote:
> @@ -2762,6 +2767,12 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>  
>      return 0;
>  }
> +#else
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>  #endif

As before I do not agree that we need this (or similar) stub functions. As
already suggested I think that instead Arm wants to #define PGC_reserved
(to non-zero) only when !CONFIG_STATIC_MEMORY, just like is already the
case on x86.

Jan


