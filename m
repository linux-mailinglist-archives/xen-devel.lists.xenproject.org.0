Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BACC45EF9B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 15:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233125.404354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbvi-0005xZ-QV; Fri, 26 Nov 2021 14:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233125.404354; Fri, 26 Nov 2021 14:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbvi-0005vA-NH; Fri, 26 Nov 2021 14:10:22 +0000
Received: by outflank-mailman (input) for mailman id 233125;
 Fri, 26 Nov 2021 14:10:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqbvh-0005v4-BD
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 14:10:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96adc375-4ec2-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 15:10:20 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-14-rgWZoNzmbAwJ4mBOAjg-1; Fri, 26 Nov 2021 15:10:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 14:10:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 14:10:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.16 via Frontend Transport; Fri, 26 Nov 2021 14:10:17 +0000
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
X-Inumbo-ID: 96adc375-4ec2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637935819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YD0O1Cb5LPjOUy6fPt9e1rTxX0nxSQaYxZVe4srj4u8=;
	b=Bmyk3OT2moqbmxrVrXNVG+szxR8JXB8bhxnaKnt1A7uzFYatTginBhz1Avmid5JoFZpwh6
	hz3Pl1HMln/ZDhQtFwNkvD7KbFPiJxw8v3DSCq9KQwej/8qooxuNqw9H2WRVgztPP2FEmL
	IDXutq2PjsC2FyE/lyQ0hECZeJDaXGI=
X-MC-Unique: 14-rgWZoNzmbAwJ4mBOAjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqtu/EqtYpLTkPq+LxgAJXb9OOCut7ZsApIak6FJwLb+Vq6C4RB1W1gdg7t0ARCp6BSHReLdBC5gD/NJW94vhsJ0axwftZsDT8qqJ4uu4ZZRi6Bw4c9HKdCrJEfHRCMylYxd8J9pI4P+PfmDUCFilpsKfIusEjEW5hDJUhuSBE1mbU66J/bKzvhCU7toBa3/OomBwOhpv4qPrzu0trX0mLohEuDyAney7iDKZvm4dtPUHlj3wmtySB+DsbZ+I9xE/49iM2ST3y6dxV6u81o8KIpB+j+wkjKbn1UfiGvJpqg/E1jJBxEo3T88kV8AKRSyROuORtBK0scYbRrP416RgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD0O1Cb5LPjOUy6fPt9e1rTxX0nxSQaYxZVe4srj4u8=;
 b=D9h62Wkxu+g+wbG94N/KKmjssRA595LZo+HrprsgHGJEtlTDhLcSXFhK3gJf6mqQums50b1ySKjAJhzQqkJ3uw7PhnAP0jwc/pHs8t1uHYV0cpR2LxApVUzVAnfOQN26U/D7OpSpBpxJShHmM45rnodAattiJ3B1cIuP8tyu58xab/Lw/bevY7+uGLS95ZAgMJWYOHUHaUafAWzJw1q0/rVSzYSlFUFUZfcCXcsWvxPxdm2rGr+z1+L5KwzfEbLmZgGIidcntvOf+JYyvhmrzIH0R8B0P7HE/pbJCHmk1ruzar0j6Br43Mht4OljNjTqh2TnDuErfQ6SPtsmxiIhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69d1b4a3-a042-c2c4-2f59-ea897886ae1d@suse.com>
Date: Fri, 26 Nov 2021 15:10:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 01/65] x86: Introduce support for CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d82a074-8e5e-450d-a58f-08d9b0e67965
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46059129D62A4F60AEC51FD3B3639@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FzHtrMgcQCjWXEWzAupgAeghtIytVVvXKF2HQ8zcZ1KfKZ3vRkho/waqGDV4tqPM6La8HCYb87ftE5fh9pyH3FVf7sf6nmJV6wegSYiV4PymcwkHoVT6H+5sJKwsYvmcALIjOH6DXEBMNri7ftG7oHR9X/VBM95/s6W+O/c88ylqGMjWHetw2RebIPgJaKmR+HZ8rb2pmJtxN0LOirVmJhg7I+IuLB87JDDzuLkzYW6YYHcjLRgoQhRGsdR6LWJ0zm742wJEiSO0EbFtEB2o7JrLQ9j7t9Ux7cU/gZHXDnyMj7FbfSor/WXVefEA434TZzVKMDJ6aqpCJB7W3b+/Gi+63T7wLaxW7uuCg3O272yZ6VEEFXNiU87X/eX/LCD9rBul5OuMih6zn1/i0G4oEnehNf8hEDeWCmSEDxXUw7XjkUNS3mNPIztpezePTPWmvHuLjtGMsyNKNi01hb/oUlL/r1jRf+zZy5jiF1k9gP03NlJjXU1pW8tMIcAqirwWydoymn3sSZhkxKkRgTZ88yOCtlmn5o3m9lCri0mRy2HUcOXabnzLkUPttz1wKw+cOHbL3nyS/DwKKaHMnvaeWUD7M/oHplsqmKQ1mNXoHa16obJMQDBlpal6fga+bPx7Rd5VG2jJ4BfSjULcZcSd47TaMc8xOHciDMplb4W+6WeJ3f2LcuBW47m8EybHn8BzBif5Fc0mjtD/2YT78vL/T8d1z0S4aH+pvUXoCWvD3as=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(66946007)(53546011)(36756003)(2906002)(4326008)(38100700002)(16576012)(186003)(6486002)(31686004)(54906003)(316002)(26005)(66476007)(6916009)(31696002)(508600001)(8936002)(86362001)(8676002)(66556008)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmsrcWpoUzVBek5QRHoyY3Z0R2lQalpuYlpsemI3T1dYaHRsQ3dwNUJ2NU50?=
 =?utf-8?B?UFRmS0RJQ2k4QlBrdVZwTGpDK0loUTZ6ZWVvVGYzL3hodS80NHpDV1lEVzBl?=
 =?utf-8?B?amg3L3o0Q1BJZlpVT0NMaGZCQ0ZRTzVMcXpqbHhVVmNCM0Q3Nzg5VERPSUps?=
 =?utf-8?B?MkF1OWRVL09HQVhQSW4rNG1lakhoQkxFT0tzT3JqNGk2Tmh5MXNjbThaaTJD?=
 =?utf-8?B?dCsveVFOYU1WMmhhYlI3RFA0WmEwYXZVdm1CVk1LR2xKSW9GdWhqRXhaMVBy?=
 =?utf-8?B?RUc1OGxnY01tWGY4eXJhNm15Qy8yWUJJVVhGK0NJN0lJRkFieHFEMllWeVFC?=
 =?utf-8?B?bk1DQnVRb1V0dndIV2NaenRHTzF6bklFK1RmUjVXVlZ1WVZXOC9kME5kRGlk?=
 =?utf-8?B?MjJjTzBpZjNYVVBmM3kzYVNUMis1MGNhY1BudDdKUm5BTjNxQnF3dzhYUnhT?=
 =?utf-8?B?SWR0MEhPK09tYzN5UXF0WmNnem1PejY4WUpxWEN2U05LMU82Y0F6ZDFMekpp?=
 =?utf-8?B?YzU5RmZlUXpsTlo2YkFpYWZsd3p6YTFBNURVZlkyb3JtMjI4VExuUDgxMmg4?=
 =?utf-8?B?eFRHaE9vUEVSQ0p0b3RraVZibXZVT0J6b2NvRVJudCt3eEp3THZENktnc2sw?=
 =?utf-8?B?amFRVXh1NUYrL0MvUWFnK2t2N2NoS0JaR0pZVlkyZkVkbFNvbGxVblZhYWVL?=
 =?utf-8?B?Zms0YkhlZGtxMzliSUxQQ1Q2Z0FCRGRRRVcxM2V5dTEwSFB0b3BFWkVpZDJW?=
 =?utf-8?B?NmlXektwMXZ0SFRFa0tqczBsOHRHMXhiMDAzQmNEcHI5c3FWaXkwR1loUDNT?=
 =?utf-8?B?bVBxd0N0c0NBeTBmeWJyakZjU21kM0c0VE4yK2puS3ZBbzJ3dGpRMStkRVBI?=
 =?utf-8?B?RlRxT3g0ZjIzeEF0T1phcmNXRElndm9nYlpJYU5jOTZlOHBzcWFETmt1dE1o?=
 =?utf-8?B?VUw3TGFBeGJpMFhkRnY1Vit6V0xoOG93dDNUTE5WRVhqUGtXeUJsZy80b0xX?=
 =?utf-8?B?TUpSbTNlMUUvb2UzZ0FGUUVVclVVZldvbUcyYURTRXFiUnpNNWMwWHlEYklG?=
 =?utf-8?B?K0EyM1lkUFRRZTRUSTlMMTFWeE54QnBCR2JMWENOQVd0Rkg1VmhFY2EwNEw3?=
 =?utf-8?B?N0E3Kzdjc2k4Q0YvaStjcjA0NzJZL2l5MlVoUGJDMkgvcTZDK0xXWlErMzZD?=
 =?utf-8?B?MFFaSDg4TDkvTFlEOFY2S2JnSHo1U0VBSGlZWkJEOHdZejVES0w1OTJlNWxN?=
 =?utf-8?B?eWp6alVvM0t1R1lCTWNZMU9LWktsT1JmVUYvbjJWZGh2Q2xuZjJta2VpWlBR?=
 =?utf-8?B?am1CZFlYR0dnZkN5UzhOVGhVQk8zd2pnU2kyQVk0NWZoQnJZSGJCN09PbVNp?=
 =?utf-8?B?SVZVcnRuckJ4ZDBsWGwwbDFkaWtVcDNwWGJqWmpKbjhyNktvcHFXWmd5MjBp?=
 =?utf-8?B?c0pKYkJKay9WRFlUOWl3cGhHWkNLWlppRitZOTRlUkVRbFljN2JMMGxadjQx?=
 =?utf-8?B?SC9rWTJ5SzQ0UHU1QlFNNVlSYi8ycVB5cUMrU1g1Y1RySjAxQVlKVU0wU2NX?=
 =?utf-8?B?bmhJNDZ6YkNoSWNKUHRqQnYycGVvVFFMZ0FaaisxUTR1bUpYZjROSVV5OHdR?=
 =?utf-8?B?OEVYb0xpRktrL1VndCtKRG9CWW5XcUt3T2xjakNwUGRPMWtYQ2R6bHYxaS9u?=
 =?utf-8?B?bGRsR3ltbEVIaXAwT0ZLQWFZdEIwNjYxQWNCMmRzS3JXaUdvcnRtWGNiVmc4?=
 =?utf-8?B?eUlralhKT3hMRUJoNnVYRDdoMVNFaWxvMDdWd2ptQnN5ZFlhckc3bENTelor?=
 =?utf-8?B?YTZRVTYwbThpbnJFblViTVA3Y1JHQUE3VkJmQkovaHR0bUs1eXR5K2tZTGtv?=
 =?utf-8?B?SDZPVXlidTY4dk8xekRiMkdXa05hUGJRRGs2c0tsbjFaOXhNS3M0Mk1INWpZ?=
 =?utf-8?B?U21UVm13UGFycFFzRFM5ZGczTVBSTnh1QldTM0Q2bEtnQUVIc0ZrMytSR2Nx?=
 =?utf-8?B?SzNsbTlka3BhRVVKSTcwZ2FKWkhIQjltL2RMSFBkaVJFaXpIT2lwNDUwb1Jp?=
 =?utf-8?B?VjVla29pWlZCYTEwWkcyQU1aVFNqU0xhWTl0bmtySjNuUGtBWHlJai8vOWFJ?=
 =?utf-8?B?YUU1RVI2U1o2RTFUSGQwU1BuL1RZaHNXNXdpN1FGOGZ0bm5CVk1EWVY1U0VT?=
 =?utf-8?Q?Yo1FEv08X8jl+5GsDYMUML8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d82a074-8e5e-450d-a58f-08d9b0e67965
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 14:10:17.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wwo2wLkJYsAFc0kr++WwvLIucwrRhKOw7hUk4ATQeyuudB1G+WXBzrpCn+27v2j0rmwfu3hhn8am/HPomwi3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 26.11.2021 13:33, Andrew Cooper wrote:
> @@ -124,6 +129,18 @@ config XEN_SHSTK
>  	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
>  	  compatiblity can be provided via the PV Shim mechanism.
>  
> +config XEN_IBT
> +	bool "Supervisor Indirect Branch Tracking"
> +	depends on HAS_CC_CET_IBT
> +	default y
> +	help
> +	  Control-flow Enforcement Technology (CET) is a set of features in
> +	  hardware designed to combat Return-oriented Programming (ROP, also
> +	  call/jump COP/JOP) attacks.  Indirect Branch Tracking is one CET
> +	  feature designed to provide function pointer protection.
> +
> +	  This option arranges for Xen to use CET-IBT for its own protection.

Shouldn't this depend on BROKEN until it's actually functional?

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -35,6 +35,11 @@
>  # error Unknown compilation width
>  #endif
>  
> +#ifndef cf_check
> +/* Cope with userspace build not knowing about CET-IBT */
> +#define cf_check
> +#endif

Imo this shouldn't go here, but in tools/tests/x86_emulator/x86-emulate.h,
and then presumably without #ifdef.

Jan


