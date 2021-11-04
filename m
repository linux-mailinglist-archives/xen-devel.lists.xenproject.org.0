Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16544510E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221349.383017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ0t-0004b2-OZ; Thu, 04 Nov 2021 09:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221349.383017; Thu, 04 Nov 2021 09:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ0t-0004Yk-LO; Thu, 04 Nov 2021 09:26:27 +0000
Received: by outflank-mailman (input) for mailman id 221349;
 Thu, 04 Nov 2021 09:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miZ0s-0004Ye-Hl
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:26:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47eb0554-3d51-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 10:26:25 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-tUFMG11DPbSuS-Cf6S53og-1; Thu, 04 Nov 2021 10:26:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 09:26:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 09:26:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:92::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 09:26:20 +0000
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
X-Inumbo-ID: 47eb0554-3d51-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636017984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=REfHvitxeO5kKWtpDJ1uPc/dax70aeONLAz/WVTHs6s=;
	b=V/rB/Fjs+fmzY81t/uRFBzxeS6+O8pXDsL4pVYHkdP8sow48DX7QRrYeOvP/8Ur7ZsYtQA
	MpOdIQHqyjePNM8JzTH386o2i/N6qsNRBZQh+e1ypBtuFyQzIGipBPaA1M/zGLL4k/jKhk
	wyTta8spFPVXjp2WyTKj1R1VnlY8pQQ=
X-MC-Unique: tUFMG11DPbSuS-Cf6S53og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0pFSBg7qJfvLwjtBGSw//T8QlNsIRbCo1lYlKHDgSn7RNriq3uN2EjXB6zqMZ+2MhWB4rO54uiueEu4b/KW7mJLb9mCGf1GJQBu/M+ezHI3+dr5z9MqO5CI6mtVQhzCxeBKeD9oKHV/Q/AymFV2ovnBkGWRjv97xb5lVHKf6ylIW/tJg347Vv0qMO0YE1jhZyar/jyI/I9vMEuRNMr7EJNnj1BNf5R7P8YSOpsxAZCjtlWUezrHmY5lSaxzK/rYJl2AAw8LYuOAbUuceYuujCLgtdFufnR2DBc87gM2SSjPG1hdL01BUXM8xrvwjGZ8tzOnV5gFMu2GnHmd3u2hHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REfHvitxeO5kKWtpDJ1uPc/dax70aeONLAz/WVTHs6s=;
 b=RaO/q2SABPF2A8e0mkEVVWET0wT5Kxr36lsbS1a4xyJGibfpUpttZ5T+jGo48WBhj0BavIkeiwY2DbYND4g5q25X79qO3T4EUBGDi6mmNLO6cp4ZGINHnekd07qwPeSuj03Ps/eOUAhcc+hrj/nD0XgFfylqIgMS0GAhO71pLs+qNde6YUGSznvqAJvEdcHAjn7ri/UURn9nk+kfAFiH5bL5NpaJJ1qzG8HkYiBtfLhytqhkb3rThsYnf5JZdSYea4WzG9BaYYP/eIuqtRu+a5ileqqOmpXO4uAJmMxmwtjQuVyAjOYCKdXAa3oNxX2ep1Hidz2jtiKpI349bAnhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3f722ea-8f66-8632-a243-d13e97d5bc9d@suse.com>
Date: Thu, 4 Nov 2021 10:26:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 11/15] xen/x86: call hypercall handlers via generated
 macro
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-12-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63837cbe-9221-490e-ea3c-08d99f7529e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384AAB6CFB44F3169C9B4ACB38D9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M3SpjnDbjQV6yjbzDZxR/9q0MTCY7GUr7OLaKR76wbhcZQh6gXD1vmkwRrsPxqFT1UTXHZVNp/Lm7p/KVhqp/S899dgSpHqsIMNYulqDrlNn2jQAqr1k5rVAlaZDMS+t3/8kChTx7mkqFnp35usToTKFATDMpFi3+nKz7YtnvYDd2DVIPFri1TWH0hUZzO3FOQmY+vPOqKWGRDBpoy0HTjN/yXIEbfFYT6psBLT6WmCdtULRx+suUN3hjHi0jd8Qurnvp9Ldi/vpe4TI586122GniCRJ4sqfWqUWL621103GNPeseDcWXUAOE47Ofw4KZhApqqFKhOBxVmP8dxnFhFUXNsfiFks/ZPWxTK/jhEYdZa06WOMKvQN6iRUZjiTeyLvWmjQHKuH7C0lGOM+eBl6JSrX1AzkliPyU/L7fzqz/YSBPa8lqu+O0Inx65w/F0wsrHzPl0AdsdApwL6YMU0qtRRADnjiqfxUgBdCPc4t6v8RnR5NrZcv7xZIT7uKTNhOsiIENEzphunMMoZg0kP4qEsTQ6SoUQJJAC/2JczX+RO0Lu7V6mm/zw0ok4f+1hVFB9WotiEZMCVMUS1sP6QKcnf8H7Ydeen3EP5XZ4gpPhGHUOhQ3mCoy6WFu1OBS14hx7NCwtrqf4DjaHNsmSEPO6MuwSsyTZ6dqNqB5ccIsmr9JElV0JWwmc3wU6WZ8kx3p7y4Rp4vINA4npFW/wVuHfLUIsFprx1anCpkUObNbS8GjKmd7/PPlgpFiS36F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(86362001)(26005)(186003)(38100700002)(956004)(6862004)(8936002)(2616005)(54906003)(16576012)(6486002)(316002)(37006003)(53546011)(36756003)(31686004)(508600001)(66946007)(83380400001)(6636002)(4326008)(66556008)(31696002)(66476007)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVl3WFR2RDBsU0Zka0tNS28yYXVWeW9LMzdWbE1vWGFSVjlaU1FmUzlmU1VW?=
 =?utf-8?B?ekUxWGxoNmM2QVhnM2NuZEl0OS9lM2ZaSXZPU2o0alIwSkVzQVBlQkRLeC9a?=
 =?utf-8?B?WWRqYkoySVVMRmJrUWltcTQ4UFVpc1IzczhrclIxWDM2QWFXWmRtWk5jc3M3?=
 =?utf-8?B?M21XTi9FbW5ERkhESWVzREsxN3lQZXhUT0xaZU1NT0VJYUZialRKRHBCZm1F?=
 =?utf-8?B?M3NjWVJIZEJOczM0QkVqcHJYVkJhc3IrM05HRjVqQXlnOXZzaFcyL05ES1Jo?=
 =?utf-8?B?ZmlCdlRZT09YSFdPRVEvaSsyMGIzM1dsQ0IzRlEvVjhwT0xyOU9VOWgzK2FZ?=
 =?utf-8?B?SkFiQnRnbEt5VmhYdVlVNmFjVGJyd1dkeUUwUm5UZ2RyTDVaOVF3d2pZbG5N?=
 =?utf-8?B?Um5TZWxOaXplemxCc2lXWFlqVGExZkxHaXdadjZ4Z1JBR2dpUERJVnUrWXN0?=
 =?utf-8?B?UHZwYmFLUmZJVmE5aGFzRXd4Q0xOZWVSbC8rRGdVZUxla2JIZi9hSzhnQXBB?=
 =?utf-8?B?eTV2c0cra1V5WWtzTUhTZVkzUE1pZjE5MWQ3ZXJaU3hGYnEyNlJKVGpoTFF2?=
 =?utf-8?B?VjV2Tlk1S1l0L1J0a2FyYkNmZFhWQXB2SlhZTHNCb3JNbENKdG1MT2hxNDFu?=
 =?utf-8?B?WXNOczQ2aXNPbVdDaThFaFFxdUJtNW1LV0RmZ21WMTM3QTdBcWl4eG10VTQv?=
 =?utf-8?B?K0FKci9PaWpCZitFa2ZaOGFmVmJEb3JBTll2THdIKzdaN1NWR0ZRaTJPUW9H?=
 =?utf-8?B?N2w4Q3J3ZC9CUGRvQVp6TFBwK1BJS0swQUt5eUpXb2dPOWw2OXZpUjJyTVNY?=
 =?utf-8?B?TkExYkh2ZWUxdEdnSXRhbUlIQkNvY0J2QWp3WlJDV1FhZEgxajVyMG5kNFMv?=
 =?utf-8?B?azA1MG5QR3F2UWwxN3lmb1QxcGNPR2NCNTlaRnRSK0ZVTzQwM1ptZ3ZqTU8w?=
 =?utf-8?B?dXRVT0dPWDAxU29ObHZ0bGhDMTRFVmhRLys3RlZNWXNBdC8ycEh6Sk9ZOXMy?=
 =?utf-8?B?ZDRYSlBVYWdaTUM0Z1NhNGNCYkI3dUFEc1MwWUN4aHdGSlJCVFRIRVdldFhO?=
 =?utf-8?B?eHFWRktRUW5zVlZEWGpxRHpmc09wYnl3aXQzUHJRamc1eUxjWlo1MEw2aXVX?=
 =?utf-8?B?WndtdUprZ05TaGpic2l0VWpNLy9ZY1E2TWZLVTZTaDlob1owUy8ybVM3STFu?=
 =?utf-8?B?bzc1d256T3F2NW52REgwSUNINkxiWStlS2Q4VFhJbExqcFh5eGd1N3dLdzJW?=
 =?utf-8?B?WFV5MjE2b2VNZFprMllhL1RYTjFGbHRMRDV4Nkk1dGU5VDlya1E3N21CQlJZ?=
 =?utf-8?B?VUpQMVI2aFJaQi84VEtzeW1GL2w5RjRVbG9iZjlVcklwTTFsVkdDTmNTS0Js?=
 =?utf-8?B?SmtsYklIOU5lKy9Nc1dxQjU4NWtMYzh5bTY3OHZDRnA0MTNFUjlnNzlHNi9I?=
 =?utf-8?B?N0UxVGZXS2pKUG42WFNOeHI0TzdhV3RYd3lvUVh1emszc1pCNTh5RDNBWnBk?=
 =?utf-8?B?Z2crOHNZc29oNmwraXhET3dLRDdkTStIbmRWc1BvWGJFeEUvcEhUQktKUkE3?=
 =?utf-8?B?QUtGWE8vLytKcjFSWnh1cW1DdUJ6YWFMUDNaNXBBMDJTSGw2YUxoazJOdzl2?=
 =?utf-8?B?TnZmeEVqR3QySEZGQXIvZTdlYnVPT3czRnNhOFRyeTc4TllMbXJBVTd5QkFq?=
 =?utf-8?B?cFVadnhKU2p4UjNOUDRwaVU1OEQyMERRQlFkNTNsNnV4T29BWjJzb3puZTVr?=
 =?utf-8?B?d1prR09TKytMQWdrYTlDR2xNU29sZG1YRW1XTEdYT3NUVTNabkVUczJuR1ZH?=
 =?utf-8?B?ZVp6RFVOd1crOXFmUUJzTWV6OTh1Vnd5K1dWL2k0bmIxU3l1NUhxb0lPblAz?=
 =?utf-8?B?clh3Rk9kcGVtOFcrRUtJUDkwWXBkT1A5UTBGQ3J6UDJHbTRNcVdWeGNHRERD?=
 =?utf-8?B?THJBd25zS0NWNGZ2cWxXdmg1aXhaUlEyUzd2TFpqbG1LQTh5UXJDWnM2eE00?=
 =?utf-8?B?ZnIxb1AvUXpuVElTaDY0TjVCdFVsRTgrL013cFdFckk0TVJyMXVkaWJ3TitE?=
 =?utf-8?B?VXVVdHUvT09ZMWU2SEJxSlptdG5hRmJ1RDl0YitRS0d4VmpkNWYzSkxidFBh?=
 =?utf-8?B?aEhjWGhwNWt4T3J0QzltQzVacDhBMzI0ODNyTTBJOFdRVXJlMTZEWm9nM2c3?=
 =?utf-8?Q?t3GSgA+AvxMl2xhlbHd0zeE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63837cbe-9221-490e-ea3c-08d99f7529e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:26:21.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqZDu89UiASCkqouZRnQtK6vyZUEWxX9B4EiD+F74TKj1Qfl0zBVD1t/tdJE7Q+1jj1NZbM2F0SDkctBZKrefQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 01.11.2021 16:20, Juergen Gross wrote:
> Instead of using a function table use the generated macros for calling
> the appropriate hypercall handlers.
> 
> This is beneficial to performance and avoids speculation issues.
> 
> With calling the handlers using the correct number of parameters now
> it is possible to do the parameter register clobbering in the NDEBUG
> case after returning from the handler. With the additional generated
> data the hard coded hypercall_args_table[] can be replaced by tables
> using the generated number of parameters.
> 
> Note that this change modifies behavior of clobbering registers in a
> minor way: in case a hypercall is returning -ENOSYS for any reason
> the parameter registers will no longer be clobbered. This should be
> of no real concern, as those cases ought to be extremely rare and
> reuse of the registers in those cases seems rather far fetched.

Considering mem-op where certain sub-ops can return huge positive
values, may I suggest to amend -ENOSYS by "(or the unsigned equivalent
thereof)" to make clear that this case was also recognized/considered?

> @@ -55,4 +42,45 @@ compat_common_vcpu_op(
>  
>  #endif /* CONFIG_COMPAT */
>  
> +#ifndef NDEBUG
> +static inline unsigned int get_nargs(const unsigned char *tbl, unsigned int c)
> +{
> +    return tbl[c];

While maybe not overly relevant in debug builds, it doesn't cost us
much to use array_access_nospec() here, so I'd like to ask for that
to be switched to (replacing the original array_index_nospec() that
you remove). Preferably with this adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


