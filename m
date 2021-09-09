Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAF404788
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182827.330624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOG14-0002to-6V; Thu, 09 Sep 2021 09:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182827.330624; Thu, 09 Sep 2021 09:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOG14-0002rX-0y; Thu, 09 Sep 2021 09:06:42 +0000
Received: by outflank-mailman (input) for mailman id 182827;
 Thu, 09 Sep 2021 09:06:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOG12-0002rR-Gw
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:06:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dc8cc4a-114d-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 09:06:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-zgW_6RbmMhSL5WgH_llk-w-1; Thu, 09 Sep 2021 11:06:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 09:06:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 09:06:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Thu, 9 Sep 2021 09:06:34 +0000
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
X-Inumbo-ID: 3dc8cc4a-114d-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631178398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luE6vr4B2Em6B7HB3xH6vsWXRYWQjWo9rnvd6ZwmLXM=;
	b=RXchymbA8tqoraEaQpqFC9kw+G3twF5R+4nAY2KNHtujyxxN01fBcDSCZobIYlmB4GZSNw
	SBbHh10bxlPymOmEcYu34j+YkrPnTsKqfUBNPENKuM+sKnALnafXLcvf4Aei9Y+gEKWMiB
	QVuXpOKw2qDSjFV4Ri0+YkDXp8jxGMc=
X-MC-Unique: zgW_6RbmMhSL5WgH_llk-w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+/SGkWEdRYrSUOOilA2ADlXJ3RdabHx4b3S2gRAa9NnoQvkHZlHn8QynjsVE773UNW1HacaOFtlvJnwbJCsdTAz6rOg8a7nGAVQERsS+WxoHoA9QVnFSMkkBAGc2+zmwGwQQp4+edw7ujD9nLNeQVST0yxOybdMLZvzAiMH80/DvigDiviBME/Zf9s5kEzQscmaEB6K1jcvz5UGLaKpO6Ngy3ga76xycNZyDrWcKqUhGvzEWP31W1bR/qeWonaZUYGrjw2gVquEdCf3pgPF0AnIv/IjelJ20lPmZ8uGGfmYGClApgpnelt7x369fqkxjhbUuqtmfbRyhLqBNqDh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=luE6vr4B2Em6B7HB3xH6vsWXRYWQjWo9rnvd6ZwmLXM=;
 b=VPFp1S46PMqMCWiwjgs6WIEwi+bQxgHg3mJTosBu+4xdbc3uFHoxBkVqUm92NY1A4B1akXMxPLBhiqLOv03CBdUXJ6ZyWRJ5tMjbvFQR8Otj5ZP42WaFxCZZVBavDwY69diqjO5R//DlOODTGq1svx43WFSAk93DwbteOpJCAMn4ax7Ga5SyRk5R5SABlliFJ4wbsbxdyN/KLaS0/fPAqBH8oP/bwIfzfkD3PmYedkNgn7rf93g9Id+ZOnMsNBey2TyTE7J46NlLo0gpddOcuJvnn6McEdu8uQ3EoW4YWckKsyw9HoEXA7ze+bZJHIpjgqXiLuJqhu9VP/GeZWEgFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210908095248.545981-1-penny.zheng@arm.com>
 <20210908095248.545981-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da3dafd3-9e61-a7d5-b5cf-897d73d0fd16@suse.com>
Date: Thu, 9 Sep 2021 11:06:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210908095248.545981-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3670a37-31d6-4c8b-abe2-08d973711fd3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686176E7CFCA8BF203C1235CB3D59@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FBgUTYTyyavtVar2YNqd7nHvbbJQA5kvGoKZpEIbRg77E9OFdaDO19gSmiUY6IXtkf8M8qRP6X+fzv5whXoyB+ZSOWS3/bHJtdLXC55tZ0KEKn7aWOa/nbYAz+ND+shAsTmzCqrxDSanuSSM9q/D+5KhFVc1tyr7DDFtH0VnwqLP7xYMWoj9FyxjwM+F/zrgJaGDl7vY6BwyT+4uvlW+ZAt+sWCZ6kdFP0agj2IoksWBt+MB/v6wVp5pmP6fgMWPzs9Y17lDT6UYhXDvHmOd5F68Z+hKBq7v3/Pzbcy90OrtP4CwMjXq8eM4ss3rsjLj0CAeu2ki/4m5zkEZKCqIew/N96/YNpImGtka1SKxou6hUGRE9kjCKZsPQbYGOyvcINfjkq2a5zFzwUGEGzlcKXeXW9WIFpFfC/llZXJX/nAGhD+Kzg0AdqAp4XxV/hyfGABCYBpSw6lgEwyJ28kQNRAimeD3OXcERP0wjcHMqaGO1GVdLyB396Ii7/LpBr3ScjHD9xM1Q6Ue34Kiw3+38zCD9N65za8OXQzcygR52eZK7bK3dHoR5UfqzjKKMw5XDXfDXIcq9Q1Sl9ijCGbmddK6/ahPxofqDayN7S/+zklsduy30ymodIOFDPs3Zwzf6E4fwicRsOUBLmVs4IRUWGYIUzzrW7mnsMVVu8EccR38mwzVDqBPIq3lb2aNTioLrVVI7FafQ3XJ6lDilExiz0XLY7QDXXvfmHURasriY78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(136003)(396003)(366004)(36756003)(2906002)(2616005)(53546011)(8936002)(16576012)(6486002)(478600001)(956004)(38100700002)(5660300002)(31686004)(86362001)(26005)(6916009)(186003)(31696002)(4326008)(316002)(8676002)(66476007)(83380400001)(66946007)(6666004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1sdHRBdVBaQXRNNmpISVhiY3NhektDQ3FEQkNqRjgrZzVhWWg3Q242MkZ6?=
 =?utf-8?B?ODRNYnh0V3h1YUJDelFtUEFVandSNjVnallWb2U1UHhDUzA5QzZ0dkI1WXdy?=
 =?utf-8?B?U0k0bXJ1b0l0dTcvWVhBZzBZcFJtVjh5bEp1RHMxLy9WeVRiLytjSEJLUWlS?=
 =?utf-8?B?Y1FEcDZ3UnNZYm5lUldiemYwOGQ2dzNNOFkwL3dEQ0dGcHFjQmhkcmZFR3c0?=
 =?utf-8?B?dUpQTzZaK29sNlhjaUFUOGlXWTZhRkZ3WlNUZG1YNXJQYnNlVjlxTmV3VWUx?=
 =?utf-8?B?cTZvVDB2S1M4UEhqL3UrUWxSd1l2MFNGT3RMK09tMXRKOXd1Y0xzNm9KS2E2?=
 =?utf-8?B?NUFIQ1lQOUVPTVR1T05XbjE1ODNtVCtLU1VSNXFPaXIxYll3LzVkZUh6NmR1?=
 =?utf-8?B?R0pSc0l3b0RTbDcrRWVqajMxVHhpMHdvazVZc1ZvMjBDVnR2L200K05VUzFj?=
 =?utf-8?B?dDVYb2htV3haQkd4djdDYnF1R3A3NU9TK1B3STQ4UitIOVRJRGVyc3lvZmp3?=
 =?utf-8?B?eTJQaklEMEZ6eTd4VU5KQXlrazhCWnhORWNkalFTMW1iekdkVXpvQUdHU3V1?=
 =?utf-8?B?Z0k0TXJMNmpxSDczaWg1dllmeFVJY1RDaFdpMTlLbHRTTkJiYXBrYnU5MW4v?=
 =?utf-8?B?MTh0SEx1QzZrbzFNNGZSRzFsZFdvKzJkOEhzYTRpdTdGYmZ0NE5lZFlDOFlL?=
 =?utf-8?B?eE0xb3hUQXdhamJuMWxWV3VTTW5RbkcxMzhyZDJ6T1R4Y1dLZ25LNTVsTXZK?=
 =?utf-8?B?UlpHbGk4MkZ0cyt6eVlOYlIrS09DaGFmODJScU1wbzFQd05oWVRQNElwcXQv?=
 =?utf-8?B?STh2Q3BYMlRVWTdDMGdFSW5UUXJPOWlVNjlkOUdCYjZqREF5VTN1UWN3TEFV?=
 =?utf-8?B?K0RsankxRXM0Z1JoSVdIRXR1SGo4UGRzU2Jmem5VL3VBWVVOT05TbjFmTmU2?=
 =?utf-8?B?L0ZtOUhXOEpOaDdEcXY4ZVkraTdibUo5Z0hNbHJibzVuWDFmVFk5czByVGRX?=
 =?utf-8?B?YTR0ZlRzTTkzQTY5ZmhidllHeVMyRWpMVllMR1M0UTNwZE44Q09VT1RxQ2Ri?=
 =?utf-8?B?cSt2ZEZLLzRRb08rNlNZcGI0aWVhMWpWRlJxRmorQ0Y3S0JMUTZFOHNybVox?=
 =?utf-8?B?Q3VCMXRQaFJJSERQWFpIOWN3eEpycDZQNGNxNkwyVXJXU2JrYjBnTXRkTWFW?=
 =?utf-8?B?SzlPcm9LZUVlTTJ4anBnaU96ZksvT0dWRDM1dExoTmFYeGdSOUl5UVNJakEz?=
 =?utf-8?B?UXdjb0R3NHFQV1lWaHdTRjFmZnpZZVZhdU1KRlpxNXBzbVF6M2VwcW5qNGhJ?=
 =?utf-8?B?U1lNdk9pNFFzNGxjL01sUXdTeG1kNXdxREhac1hVWCtxanQyZ2FMUnpFQTg4?=
 =?utf-8?B?eElDVXQ1TkRwNGZqZGVDSldHRVdjV1NtSUU4WDN2Njd2MWdaNGhJYk4xRkor?=
 =?utf-8?B?TVBIb0pnRXZjbW8xR0RveHFzcitCalZhU3Y5NFhJaU5USHVqcVlIaFY0VHRC?=
 =?utf-8?B?djhXRUdLNXNvZU1RZk4vd2VFTEt0MmVzWnVMeE11RGdoMGFCUVpqZkJhYmJC?=
 =?utf-8?B?VEFIOUh0R0VYMXhrQ0dBVEFpMzVEV3p3YXJMOUZjOXJMSWFzUlpnMDIwS3lH?=
 =?utf-8?B?cmltL2I0TjlxYVRaamdpQmI2NFFHVnpJOEpJWllGOWZraXgwdlhIUHNuOWJW?=
 =?utf-8?B?eXprWEhvcVR5eWJFcGd0R0VXQUtSd3lUbzhES3I3WExqZVhqbURtQUIxTkx1?=
 =?utf-8?Q?9K1n5RMTobtL+WwUPVZnbsY92WbCHJVheY2cev/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3670a37-31d6-4c8b-abe2-08d973711fd3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:06:35.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqiQadXNCsUMRIz4B3auIlfRWO5PqFN0mfsM1UiMCkpM9/RKuEQ2z2oeozPWqGCStnnlOgkAYoGTqETYKnVbvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 08.09.2021 11:52, Penny Zheng wrote:
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> introduces a new helper assign_page for original page with a single order.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

I have to admit that I'm now very puzzled: Instead of restoring the
long agreed upon ordering of parameters (and then keeping my A-b),
you've dropped the ack.

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -568,7 +568,7 @@ int __init dom0_construct_pv(struct domain *d,
>          else
>          {
>              while ( count-- )
> -                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
> +                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 1, 0) )

This change alone demonstrates the problem when it comes to backporting
future changes: If the original patch contained a code addition similar
to what you change to, without the person doing the backporting paying
close attention, the result will be an order-1 request when an order-0
one is wanted. It was explained to you that in order to make people
doing backports aware of this semantic change, the order of parameters
of the function ought to be altered. That way the compiler will
complain, and the person will know to look closely what adjustments are
needed.

In this context I find it further puzzling ...

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -133,8 +133,14 @@ void heap_init_late(void);
>  
>  int assign_pages(
>      struct domain *d,
> +    struct page_info *pg,
> +    unsigned long nr,
> +    unsigned int memflags);
> +
> +int assign_page(
>      struct page_info *pg,
>      unsigned int order,
> +    struct domain *d,
>      unsigned int memflags);

... that you also neglected the request to harmonize the argument order
of both functions. What we want (and what I thought has long been agreed
upon) is e.g.

int assign_pages(
    struct page_info *pg,
    unsigned long nr,
    struct domain *d,
    unsigned int memflags);

int assign_page(
    struct page_info *pg,
    unsigned int order,
    struct domain *d,
    unsigned int memflags);

Jan


