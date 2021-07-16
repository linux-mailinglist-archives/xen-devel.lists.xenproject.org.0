Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF073CB346
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157062.289886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IN9-0001Nv-F9; Fri, 16 Jul 2021 07:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157062.289886; Fri, 16 Jul 2021 07:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IN9-0001M6-BY; Fri, 16 Jul 2021 07:34:59 +0000
Received: by outflank-mailman (input) for mailman id 157062;
 Fri, 16 Jul 2021 07:34:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4IN7-0001Lw-Ls
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:34:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c19d4e2a-2530-4d73-b6e4-df6db13bf2ff;
 Fri, 16 Jul 2021 07:34:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-6FcKANHhNT-qe1b2g85KuQ-2; Fri, 16 Jul 2021 09:34:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 07:34:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 07:34:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:34:52 +0000
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
X-Inumbo-ID: c19d4e2a-2530-4d73-b6e4-df6db13bf2ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626420895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeBT2B+0DO4WfpakyKBnw75OOhwBBh/evF99g3h3TOk=;
	b=R+vipjqSj4o0+vZ11stuYtwQLi5r9oCkluACgVddYR+oeTNbOfq8tvNib3ZMzviFk6kHUt
	uO+STuTO0JNHS/yxcYRz1RQTrwUF+3+Ze4KGbBHHqUlvC420yrGEBiI4WMX8adS7bNhR1H
	P2mnTtFARhBNlIQW+ueXJRuUEAGJBaY=
X-MC-Unique: 6FcKANHhNT-qe1b2g85KuQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JICVJB6fgHHskJZTohKpIEeN5mLDCPOP+qfa4ArV2hllybn66/dG11RpwN8xeMZ4/D2fVacciG4Eb/R48m5PwtyVi32LlTO9kqcOchpkH49w3MHgy/Z3aMgeqME9mJS7ylS6id9hy8IVY18ebmy2Ki0xVSAkwj4JDuga7HCDMqxbyqcLaS9z8VN1EUrdB2qkFHVf5TsJkOqIpuqPubDmhx4y00LFBZ5d9QZoTsMi71b9Coge7XvECgPXtWPZEPwzQUrR0hJ/sg9zYAIsxzHsHrUQqpY20ldYmMQ31ZYD1BXjvtzT5ZzZ2n3bUAAT/AHSfWONFk6Jo/cvYfWouxbc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeBT2B+0DO4WfpakyKBnw75OOhwBBh/evF99g3h3TOk=;
 b=AV6C6+lbrDtIlanVRIq1dGNGP5jjeTTjrhOHhkxa56vydtyuW6Elz1k4QP7Oqkak9lInIRonU6ALqO7R7aSZ+UDRFMhViRiKV3551qf3QxAnapKbRvHqYQITXL+aGw7JaLvg3quuMcesw8XlCZluES/V4+Wqe1rZoRLM9KViAuB5cj/gXLEx+G51OzB7i9LhG5lqNpEyrSWT4Eky87M3kqlvkHPqIs5nWJ374R1WOiPu5P0DmrbWu8SDg0uo4dABgl82bKMUULFsfPlJ/vWwQH7kH8bjfnMDlQRHXpr8dkvt6cTBpjygFloQlvVDSAcN7p4N/OQjdkrviBI9v7ldbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 09/10] xsm: expand the function related macros in
 dummy.h
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-10-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34c71bc9-18e8-08cd-d55f-9f5f97bde91e@suse.com>
Date: Fri, 16 Jul 2021 09:34:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712203233.20289-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::23)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff24c80-c33a-4204-1211-08d9482c3350
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71502F8A809F448FA235F43DB3119@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xzeZgqA6lYS9TO5mBa3mMFZBQ8BpHqlrl+lhNPJKTTOicw5iKwAgUTzLUPupi9GRDjXBQhWZT6ubqSoogpKaE/P5OeNScavUjYT1peS9gYr6DJ7AqkNiE1ZXduos3AuNw4DO1TDjytO5j8p0pFgvULDmccaZfmO3n3UZIGxO9tp4YA+w/rTofTMA30n/r8jtoPPaWkn0q54kYPvwoKoEY48QoXCw3b4xWib8jBWDyW6ZgPmFmGLSinSVCwb3AAo7Ll1GpibDWOUkKDd+0rACnM5cZacoCC3pgdnuybLtJRsY4u12d5+OodELjbY6qa1L4Fq1uK2Lw3LtHB44I1REFpVmuvnAELpvpR9BJ0qOCpoSLUi/p6JJ+RvHVHm8DJsfxKvTQuAT367ahKOZQsI3uM/jplFAkMh7/T+p65qYiB33TTFj9UzjNlFODxcgg4Ibzhu/xq0rTpmR888jvq9OWCVG3jxfEM/Qc90ZhAR/3Iu8Mgy8Rn6weRzsNDrqpBK5ZJJ/Cw5gbKEZ4nuQ5y7ChjeVcbojnT4EapmAIXH8uJ33NWYSz5QvhGlADwhNrE8j6TB9jD6efS5nJXga5wxEJtb1tyhZ/5In59b1cpvPx0GGg0w3PGFn5V2XE7Rpc9/69EvtcMhTvpLjhmJbM3bS92mznJXHQ1GL9yi22pVMKZSed9D6QwFk1Hj+zK3qXESM7MPBOtCOPFS5CZpDIvOyX7HHM38nBNdtXGVFVkBVluk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(2616005)(6486002)(956004)(38100700002)(8936002)(16576012)(316002)(2906002)(8676002)(478600001)(31686004)(36756003)(186003)(86362001)(83380400001)(26005)(66946007)(66476007)(53546011)(66556008)(5660300002)(31696002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVdyU3NydHZnaFNsa0dndEE5YXhDTjh5b2xCVEsvN2NUbzNsemRSc1V5MWRp?=
 =?utf-8?B?ZFlJSGNsRDR4SVNJMzBKbmJLalhLWENPZzZOQ2NWdm4yVlBGNnE0VUQ4dDhR?=
 =?utf-8?B?cG85YTJDcm9sOTRjZTVOUGxLcXMzRUlQTEkzTXlKL2JGbTZQb3lJajdvOGdn?=
 =?utf-8?B?d2VXcGh3cXFJMHdHODdRdkpkRTJUYldBNG8wSHdOaHFuWTM1KzlPU3JFVmQy?=
 =?utf-8?B?T1MxanU0cVVSMDJXcWwwUWQrOFBac3VSdk43Mno3S0E1dXN5eHJaYVFXeGgx?=
 =?utf-8?B?bEtGR0RyMUt3ckllb0txUnJqR3Axc0RvaGp6ZExWY1ZQTUwxK3cxNisvVmRY?=
 =?utf-8?B?azRIMHZRNFFYWC9YSmRGZHg3SXNrY2hJSUxBQnBGY29KV1ROaktaZjRRT0tB?=
 =?utf-8?B?cTB6cFpadURNYmRoNmZTREo5cWgzWS9KT0JHd3FyTExvbUxzWUV0WW80SlJw?=
 =?utf-8?B?cllrY2dnN0NDbktvdTM2SE1CNkdqbXpjWjFaRldhcEY2SytwTFB4cytOeEhk?=
 =?utf-8?B?WGRSUXVzNllaTzlVWjMzeFNHekhueVN6aVJqR2lRNC9XOEtyR0J0K2VBOUZV?=
 =?utf-8?B?KzZmUndPVHl5QWV0clpxL1VOekhCNUlCblFuYVhhSXZCZmE5bEx1N1BFU2lN?=
 =?utf-8?B?M2V0aTJOamRCSnFZYlhnZGdUbDNKUVdEeDdjblhxVTNuN1VqTVZ1N2dVZDRY?=
 =?utf-8?B?VGlXUmdyOTQ5NUVPZUpwMmFlbjNxOGd2bkNwTjg1VVRJbHAxZ3dZVVNvQTlu?=
 =?utf-8?B?OWZBcS9SdmVjU1l6Q1lFeUxwQVZqQjVXNkhmOGJBMVh2ZU9JTVJCcW1RUnNI?=
 =?utf-8?B?Z2g1clUzc2sveThKSmRGUTgyL2JCRDI1SDVYcXU4MkFkNW1HRVQ4RU5GOExL?=
 =?utf-8?B?RTgxK0pEKzR3cGFVNUtHYlg1YVVHVUVMTUMyUFBqQmF0LzVvZ2lNUnBYMDds?=
 =?utf-8?B?MU9rYThNaXVaTnNCb01CSGpXa3o5WkMzTFFiSC9pL0p3WERXZnFlVDZyU2JW?=
 =?utf-8?B?ZzE0ajRXVHZjSWNldFJwRkVETThyK0RYcDVkVDhSRHVTcitRaW1hM0Qwd2di?=
 =?utf-8?B?eTFJTzA0WkdncTZqT2E5WHYvZm1DUGtUbzZlNkpqWWtQdVRWaTVYbE1od3FJ?=
 =?utf-8?B?SDkzRlJIbWF0YUlhNGNUUXFUZkJQRmhBU0NvSXV6QWxOUWlVc3dBVHltaFMr?=
 =?utf-8?B?YXZHMEVBMzB0UElmcjZRVG91R2kxMFRaSTl0THhyeXRZZjRQWHIwYTV0aVpP?=
 =?utf-8?B?bFJlWFRzS29pbGZjdUw2STdDb05iMk0xZHlraWw0Vm9ucWF6MXgvdFQ0L1E5?=
 =?utf-8?B?NVphYVpidGU0YmkyTnQ2TmFPOTlIaE5BbHRpamRXKzd0UG9jS2JSUXlud0Ur?=
 =?utf-8?B?WTJTU0ZjZmtoZHFNMDI0SVRXM2hoOWFrbmdnK3hRR1hpYlkwYlluR3lEODBu?=
 =?utf-8?B?NnJZOFBhVng1UjJDN1dDNU5wNjJFeFovekN4NnRDc3d4bGg5d1hWRk00UTJX?=
 =?utf-8?B?NjZmc2dIeUx4UXZzbWMrbEk2RG9ja2pCbjNoamtnQjA2QVVxRHFqOWh5WjRy?=
 =?utf-8?B?aHd4dmM3V1FCRmNicXB6RExpL1pLNnZIdC8vTFBBbHcxS2h4cmVKWGo1VTBl?=
 =?utf-8?B?bHFXdWhDeVc4RXAyK09VTnYrTjhIUDZZUFIxWFgxZlNzNm5YRjczOUYzVUlq?=
 =?utf-8?B?eUYwUjhUeUQwWVFCUGdBUHJ2bnBCT3Q1dXE2dm1VZjJKK0o5SDdtS0pwN1VJ?=
 =?utf-8?Q?Rho8ihS7mDaTu94zTK+RwHf1I8xt/gJIAI9wBD/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff24c80-c33a-4204-1211-08d9482c3350
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:34:52.7841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QeL4fZ5hgkgQBp4Geogu7yAiL1F+U4bjmX/1UvwFFwfOcnawoxr6Ic6bwgZvtr1ikhiAKMUXIUbBJi/k4WqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 12.07.2021 22:32, Daniel P. Smith wrote:
> With the elimination of switching how dummy.h gets included, the function
> declaration macros are no longer necessary. This commit expands them out to the
> only value for which they will ever be set. This results in function
> declaration lengths changing and since some definitions did not even follow the
> 80 column wrapping style, all function definitions were aligned with the
> predominate style found in core hypervisor code.

I'm afraid this last half sentence is quite far from true:

> @@ -82,43 +79,43 @@ static always_inline int xsm_default_action(
>      }
>  }
>  
> -static XSM_INLINE void dummy_security_domaininfo(struct domain *d,
> +static inline void dummy_security_domaininfo(struct domain *d,
>                                      struct xen_domctl_getdomaininfo *info)

Padding wasn't good here before, but you clearly do not change it to
either of the forms we agreed on as being the goal for consistency:

static inline void dummy_security_domaininfo(struct domain *d,
                                             struct xen_domctl_getdomaininfo *info)

or

static inline void dummy_security_domaininfo(
    struct domain *d,
    struct xen_domctl_getdomaininfo *info)

. Further down there are enough other examples.

> -static XSM_INLINE int dummy_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
> +static inline int dummy_domain_create(struct domain *d, u32 ssidref)

When you have to touch lines anyway, may I suggest that you also take
the opportunity and convert u<N> to uint<N>_t, to bring this file
better in line with ./CODING_STYLE?

Jan


