Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FDE51B8A1
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321502.542487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVms-0001Y2-2l; Thu, 05 May 2022 07:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321502.542487; Thu, 05 May 2022 07:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVmr-0001UX-Vu; Thu, 05 May 2022 07:20:33 +0000
Received: by outflank-mailman (input) for mailman id 321502;
 Thu, 05 May 2022 07:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmVmq-0001UR-Oe
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:20:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8bf0952-cc43-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 09:20:31 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-yTHRmf6YN7-XHXyB-OSbhg-1; Thu, 05 May 2022 09:20:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4545.eurprd04.prod.outlook.com (2603:10a6:208:73::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 07:20:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 07:20:28 +0000
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
X-Inumbo-ID: d8bf0952-cc43-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651735231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sp07AszI1s7SokeGwBG60Tm9noCAWBn8yawQFWbTxu0=;
	b=W1MHVL3EH8TWalRWIhRU69MF5yp3CFM62j0tcdDL7R9kod66dRrmSotdCt2mJtf9Jjl+Na
	Dkzs+1KXSkB/e2ay/IsCyU6jFACMKSyMcCvjsolMSKz2Bq+Ht8aeze6bHek4FFrTI5NRJx
	zxTzZdkuu8OqSzIe7klIMIcOhL+EAtM=
X-MC-Unique: yTHRmf6YN7-XHXyB-OSbhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKBUMi467tJl/L01Wn0JBCcLuWvhAAL3dEWirMWh+QoJiOt1sW09JSuAdeVDEQKoa8LuhNIfNeJ/8SZL4PBzDtq1Qv33x9qw/V0vPejrAhqCd6xw7RTwqj9QFEjY+2HMTqGLHPlMpmTo6jMFY3qQi5eOzkaaKtHkQ0Nnxr/Nc2wzU56mu+VpI66zpsKLI39skvbRG0QhProyjAzBIgjMb3N+HHB1DI9UvYSNPobvpAnPuWxTnfdiUAur4vhAnoiK8LTNUN4ax4UnLl0GLbfIrZq6yDPq//NfPv6wIkGH/YYzbjz14Veyf7xf4qw0RzGHO8cPN+0Gb2zOqgccbKrndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp07AszI1s7SokeGwBG60Tm9noCAWBn8yawQFWbTxu0=;
 b=NNsJp6EZNS4r8b+fXyClB+X//tQMCC0dCWUecGDpcVAKJB39i8u+X8ctdx+mdCVDRwUTXov2TxPBpxYrUo2l0Ipky9J5dgRZe+TJudKrzvqcIxqpAxbZuMSX8tlX5LAfrOLPvE4DpvqAJ53gLt+tPztFSZ+pKIuWFkDD0NqSoGR05yNc6xvC4oUf53DaS5pG/785v+NiyHFUgurs+b4B7WPElSxUqNN/PhsFVb/JdHb2EM3SURvM8ROf/ShZoqCp49VXjgl2EIROcUSxKDWFeAGoB3ykGMRyJyYNDsuSVKgSehEvnIu9LRTRJ6aXrJ1r9FxEqioiuIGKNOOwwUt8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89fa76cc-2fa0-5ec3-64d7-d83407b8a495@suse.com>
Date: Thu, 5 May 2022 09:20:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
References: <20220505025407.919988-1-Henry.Wang@arm.com>
 <20220505025407.919988-3-Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220505025407.919988-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0152.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf45d3db-350f-486a-1bc3-08da2e67bac2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4545:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB454533BD7761093674A52216B3C29@AM0PR04MB4545.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22hGQP4UTHVt0xS0w8TXUWOOP8Sw6SP7pKs6+Rq1p5+FoV5OdxGjiCk8zCR+IEzFTHCbbeufmHmkK357kE06lvWYXJ6p0vI1k63mPfzYXCFhY2KyoZRPTcG7nQzbifZ5TU6H0EAQ7WTdm1VcdRUzluRGCol6BwZXvUPGquhk12fgTdTfnAFk1/DCkv7UdV5jCDKor/sakKEH70BSbiBFRkUbDGZf2N5P69h206S2rSwq979+eynThCmWT8S3zfFSFytX1JaVoMj8tKCC8oo8Opli4NkLMusLEgFYKiY8a0BbcroIhoeLt/at0wjnZsbXMeAUywUdYxqpyh3EfxLhTjKhlYMP4eskPP1ePAX93UBsnRQmz3pCJFxaGuZfg3HUBQZgFxA6XDQvjbozmiwhMJX/0IHzvrLv7dDEapPEsPo8oYGtPVDQ9R+iEIfoAU2s/kk08jzOmTBgluFD7PLLjfFtJKzsoZ737k9a+tn0MlBU3aOCifXf6VrhgysBHfSZ9yt+cIIYQpmOrGJfn8JeaL9U2Mqp/8qA5jT/NXbRQzaw9jgFQLvyiSblUkiZF00KabKJAZG45U7b4t6GU5kE8N7vIUFqIHpL5crxzweomUpncEXs7OdO5iR98LkBDPElg5CmdpV73oCcl2KoSdS4qI7nUravcMZu+l4FG+tLwgW2BJQjXKSJCBKxLQBoIDh7dYRNg7Et7TTGwOvwPOPB7cPhrCZB/33tah9+Z05lPD0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(6486002)(6916009)(8676002)(31686004)(5660300002)(316002)(36756003)(38100700002)(2906002)(508600001)(6506007)(53546011)(83380400001)(2616005)(8936002)(31696002)(4326008)(66556008)(66946007)(66476007)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW9NQXNzNlhtSzVXTXRGNmRPa0dodjNiWUZabnhLTFh2Zks3VXkzLzBwWDNW?=
 =?utf-8?B?Yk9Xdnpxd0JMdFBMaTdpY2l3aGIrK1NTd2RTTGdjMk5UZzhQWEZ1d3EzMGVF?=
 =?utf-8?B?WW5SMnUyWERSTzFNb3ZiRHFLTDNGZ292Sy9EVldjQ1VJcHhEM1M1R2pXTEtx?=
 =?utf-8?B?c3Zyem9CQndEUHIxbVBxOUJUeEphZnYyaDhrM2wzUWNrTUNoTkQ3Z0dHSStG?=
 =?utf-8?B?Y2lGOHFidGNEV1pEQ3BTRHp6eFRtbDNHVXNleDJISlVhS2lBZ3hiVU5kejBE?=
 =?utf-8?B?Sjh2RVNPZ3ptZ0Y1NjdGWEZHUlVQNmlNeFl5L2JXdC81Mkg1MzVDZEFoMUtl?=
 =?utf-8?B?b3AxdSt6T0JhQTA0bkoweGdkZFlOeFIxR3grTXlUNDdmL2ZPVlFBcG5oclpv?=
 =?utf-8?B?QlZKRzd2QndVN2N4aHNCR0ZXVlNYMEFGbWNzakc5blZXUnBHMVZHbWdodGFT?=
 =?utf-8?B?bUdCRnNTRVhHcGN2dzFxOEFzY2piWlNBTWM4NFNJRGh2UzU0cHk2K2U2UGNX?=
 =?utf-8?B?SUxwd2RxZWNWVC8wZjdjYmR1MlYxSXJCa1pUOE9mM1h2NGhiaDNuL3hRYlph?=
 =?utf-8?B?blBBUXg2dU4rSXpyUjNnNmk0am9zbzV1eXpJa3dFbGpFL0xqRkxBWERDMllP?=
 =?utf-8?B?UTJUa0NQUWFQQzNxSjNML2hENTNUWXJzQzh3N3NSWGxvZ2hNU2FZWUZFbE5k?=
 =?utf-8?B?dUZjazRJbW9QSlNnejJ6NWU4WS9YbjVLVW5PNjlTL0VTR1dBRHRiTXhvZVEw?=
 =?utf-8?B?Z3JBcmtZZDdKM3JqUzVtbkJBc0lNcG1ZNHNncjdseWlBUDV5Vm5wRDVWV2Vs?=
 =?utf-8?B?RUlMWnIzZ1h3UmgyNEk0cWF4eHltcW0xUllQY2F6VEU5dXpaK2RnbkRzNGlv?=
 =?utf-8?B?ZUordFExWlJ3ZVYzOWErNW9WbTVLV0hGMzh2SUcrUDkvajB6SDZtcDhaSCtM?=
 =?utf-8?B?YUdzZHlHdExYRGtTei9EZE9zZkRPa2hNVkNqREN0aVdNSGd0NGhoZHRWU05R?=
 =?utf-8?B?L1NRNEFFM2RFb1g5NGM2Ym5kU1NCSXREVWVSUDFtSENJWUNKUXFZY0RzcEVM?=
 =?utf-8?B?TE1RUnZCMHBEVWViMVZNMHU0MXNieVNLSE93dGtQZHE0Ykp2RDlsZDQvSGNn?=
 =?utf-8?B?L2VpbkVPSTdWVFFuWEh3U0w2VHZLR0RwT1R6QkEwODdoTTBLelBqalI5YkN2?=
 =?utf-8?B?R0tGU3d4TEdxanFxeEVVQks4OXlLVzd3R2cza1F5SjVaVzZVK3BLNmxSdDdo?=
 =?utf-8?B?WmRESG5CR0xsYkNqaDd0QlV3djFoWGlobEdkZmRUbk9NVG9mNGpjZmtpMWFY?=
 =?utf-8?B?OGZ3RGxTTlNKcVVmN2hIdGFwaUlzeG84VEdudGVqY1FyOUFRdjNLbzN4emc3?=
 =?utf-8?B?c1VsWUFPWTZPbHdQYkhzclp0Mi9LM2FRTHZyR2xMMC83SzhhejBsZ3BXekk1?=
 =?utf-8?B?K1dJd3BENm0wWkhib2NnaUtua3NnMVN5cCtqbkdCMFdkK3A1WG0zQmJ1SDBU?=
 =?utf-8?B?bjJEVnZXdzZjNkk2V3NtYVJYOElFUS9GT0ZYUm9ydXI5VnFSN2lIbGN2aGYz?=
 =?utf-8?B?aGEvT2hIYXIwb0gyY1ZOQ0FlVlNpRjR5czUvbW41VFhIQWl3Mm1iUG51Y2Z2?=
 =?utf-8?B?MTJuOGpnVCtqLzZUU1gxUDFXYlcvNkRlSWRHK05ra2RiTDBlZXFRWWhES2xZ?=
 =?utf-8?B?QmFYZ1BGK2F0Y3pUZ0o0c0dBUGNocmZpUjl3cGRvNW8yWWdpbDdoRjNHaW5R?=
 =?utf-8?B?Y0N4VlNWYmNzRTE5bnZwNy9xcDVWY21MWmZvclM4QWkyQlVKbnJJR2VTbVYz?=
 =?utf-8?B?MHdmN1Y4L1pONzRxOVF3N1ZydDFQZ2JJenpqVng1OEJEaTZuUUl2S1EySlh3?=
 =?utf-8?B?MmoyUW9GQTlGSk1tVVREUFlMSmIzUjR2QTgxZi9TYXladklTZDRZcE9pZFV1?=
 =?utf-8?B?RmFlNW5BK2NOMzE1WFhrWGVKQWFaSjVPRWo4c0NOUlNlTnF2bTkwY2cyeDY1?=
 =?utf-8?B?Y0Yrc0tOcC8vVmc2VHo0SFR5UktqdTFma3pzRWtzTHBXalZkZlNVa3RFMERs?=
 =?utf-8?B?Y3hzTVpweUZuYmluQzcyRXpwUWRKa2MzaHlnWCs1b1BNeVpuN2lER21uc2kv?=
 =?utf-8?B?S0M3dFdyazgvTFk2UkVMMlpYNGlIL0ROdDNsMHY2dHBKTEF1NFQxdXZmKzJ4?=
 =?utf-8?B?aEdCampNNjNGR3QzbHpFbFc1aFFnYkVoVTUvTWFFV3VJL3ZxVTdFMWZPWU1U?=
 =?utf-8?B?QWxaYVVEUm13SDFHcFZYWVBEdFNxeDBNanNtU0ZGdXdTLzNERlVxdGFUYmVm?=
 =?utf-8?B?Ym9DNnBWNDVyblpmc21PbkhvSjhsUGZwTU5xZGYwaUpKVFlrc25vQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf45d3db-350f-486a-1bc3-08da2e67bac2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 07:20:28.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foebnPAj6JL446/+xKoNJHlVdFrkjtunLFkpTMlEgKdqK7t4NgVu4AT/HAbqLhRnZDhw5JrEp2isa6EDOsydfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4545

On 05.05.2022 04:54, Henry Wang wrote:
> xmalloc() will use a pool for allocation smaller than a page.
> The pool is extended only when there are no more space. At which
> point, alloc_xenheap_pages() is called to add more memory.
> 
> xmalloc() must be protected by ASSERT_ALLOC_CONTEXT. It should not
> rely on pool expanding to trigger the ASSERT_ALLOC_CONTEXT in
> alloc_xenheap_pages(). Hence, this commit moves the definition of
> ASSERT_ALLOC_CONTEXT to header and uses the ASSERT_ALLOC_CONTEXT
> to replace the original assertion in xmalloc().
> 
> Reported-by: Wei Chen <Wei.Chen@arm.com>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Change-Id: Ia463d2241e80e8a78d7dbb5b2318694d3ca5ed67

Just two formal remarks for starters: What's this last tag? And why am
I on the To: list of this patch, when ...

> ---
>  xen/common/page_alloc.c   | 7 -------
>  xen/common/xmalloc_tlsf.c | 2 +-
>  xen/include/xen/irq.h     | 7 +++++++
>  3 files changed, 8 insertions(+), 8 deletions(-)

... with this diffstat you should instead have _Cc_-ed REST maintainers?

Jan


