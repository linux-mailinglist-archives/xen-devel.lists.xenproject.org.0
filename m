Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F773F1BDF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 16:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168894.308434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGjKm-0006oF-Mb; Thu, 19 Aug 2021 14:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168894.308434; Thu, 19 Aug 2021 14:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGjKm-0006ln-I6; Thu, 19 Aug 2021 14:47:56 +0000
Received: by outflank-mailman (input) for mailman id 168894;
 Thu, 19 Aug 2021 14:47:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGjKl-0006lh-2V
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:47:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6eda79fc-00fc-11ec-a62c-12813bfff9fa;
 Thu, 19 Aug 2021 14:47:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-gmQypkXtM4WPtYtkZRvnkg-1; Thu, 19 Aug 2021 16:47:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Thu, 19 Aug
 2021 14:47:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 14:47:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Thu, 19 Aug 2021 14:47:49 +0000
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
X-Inumbo-ID: 6eda79fc-00fc-11ec-a62c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629384473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHlRw4Ape6keRlyNKohKA+gC+7dHjAEEMAUc7hxgDOU=;
	b=mvbExOAptHZR6iQD0Vsoevi8FPJqHztfbH8nG1tLLv/Vgb7wFclP9SoKPhhkTzcgiUpQfi
	Qr4PeY+iKTx1Ti7u62cxbX12QAlWkjKq+w/1XJCNVenAsbloHlUKuC9lzKUbdzY5o/1kyR
	QqObaKT2IWrl+I5Mbm7BkpZi5BQPtls=
X-MC-Unique: gmQypkXtM4WPtYtkZRvnkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9ews5PMLayYyqWg4pITvK5mnWOFlVORRKcG1NtIbhTx3Z+QEfgNxm9SiKjv0rKjcllggmZcBECq21YdQfzsQWz9k4kHO3N6wpFzWtSgS8RT5kLKQ6iPx25H+kAuOhVFMWAvr28GHTEZo7+IT1fj1+PpQiYht123B/pz11rsdpNSkg4HtXGTJfu9d8Y1srT4B5brS98CwTVVadODi22sqT7oGArHugtjnh2drLVkoXyaOMx3Nfu8TrzLyJZfKwRU+JYY6o56wqnXhCGdOb/H6BBviboamByEqMxQ+mqEZvdr4zCEUao0A9fM0ENaI6IBHI0EV1o075kiGDxbtmlrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHlRw4Ape6keRlyNKohKA+gC+7dHjAEEMAUc7hxgDOU=;
 b=fBMltH+IkkJMJl4MC7DILCCjXEHQhjVmxFyV9TAZ0vjPcdc5SqMPtNVt6ka+l9JyA0Ye3jv6Blhg1pl9LZRWPoAM67QMGZzv/ooHyuSwOIFyk1BP/IAFjcf/v6WDMecs5Dy2lX8EXH3Jaic8vtcVcjdUyMXjd5raYdjQ7TBr9ivZhxmIb3EL88FRN3JaoLBiTP2UDir+aicqWkMb0y0L73DA+ayeAvST4SGOKHFDawqlAfAEKLDihICkhxU7LYmNoKt0a3RSZEx8f5Zp0he1F0fxysdCpAhRnGnuAkxgk/ShI9U4JFuRorNm4UgvTUo52qNu7GT+Ubtp0yOE27HbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/3] x86/amd: Enumeration for speculative features/hints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <606ce242-65d9-2180-8330-525fe5ec5562@suse.com>
Date: Thu, 19 Aug 2021 16:47:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210817143006.2821-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24336409-ee06-4443-c6cb-08d96320510c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392AE6E6A616DAD939680C2B3C09@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZD6O9A9Azw1Emiu7hGwCyQQ84Hc8JWJj2Sq2X2tumjjm8fPvrOXyoQiYTG31RIbAnHmeFls0UcUddOZ3gLlOgI/bhhcHuaxKrmDhCzwCF9l1O88uLx09W+4zuZhINvH8FoRpwT0uCoCoXlC1OucONr4rUGhoq4pfTPN3ThD7Tm2GUzDNvqZD1UEt8NhaR9h7pcJ5Dhb4XBGf/GnjR7+XZfoWV2m+DsRRpiLa6PLh9BmKRHKBuU0gO9uCy08ZCOpoCVaj1IxqnD5ELEjTeenZkWCSWjLfgLmEDa3lDF5yfnAUerDp8d+raqpJbgvrfSpVbd7QrLaKFCpGm17fhlgPhASd0fnHrYZcDz3/oisyFbPi6qWfbtEBbbiEOzSFclLOI8IeezoL11mOouyDR8TcumERzWr2jPUsH2jCzpbnlU9COgMfjDVYGNJvuIMlcL02bODSKL3OD7X6JJPUKn3uz47KCt46ohl+oVGjpXHtwLfebct8uPAuUr0KqLD+/23KC/oBY/SDZHihnlNZbnoGnU9yb3/rVDyrNTu2TgYEsCffN/J9Ys4vFIurjCB3GKq6loh7R9+JVF2Xw16VVBofgxpUM6HrTw8pPuWmZN2+6oknKKfiRdxrQAR085nX8GO8drtqb1dnp04i2GMrcu/YeuPkj5k5ffCtE2V26w1o7j2wsPrAFCPFMlz7t1FBvA65pWZl3NTeajUOTcR4Qp1J5hLdDk5cpqx6ANUbzQIC0XA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(6916009)(508600001)(53546011)(5660300002)(36756003)(31696002)(186003)(4326008)(38100700002)(8936002)(66556008)(31686004)(26005)(16576012)(66476007)(316002)(2906002)(8676002)(66946007)(956004)(2616005)(83380400001)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW91TUhKSTRva3RZUjVZSUIwZWtuVXlCbTFlV25CNGVVbDJudEx3dDdhQm1J?=
 =?utf-8?B?aGxZc2dGVE1pWlRhTXV5NHdaSzNwVWJXVHZlVC8vTXRWdHpPQW82TTgva21v?=
 =?utf-8?B?LzdRUU5Xam9LTDdjZ0taWDYwVlpIY1JTVk5ObmlpRUJSMEliTkRKbUVlWXVl?=
 =?utf-8?B?Y2ZlaEwxUURiMWZMQzVYeVMzTDlqcm9ETjRFY0VlOHBUdnJKYU5XK0hqU1ps?=
 =?utf-8?B?ZmQ4SS9FQzU4T3Q2emhPcHBOMmhDMnZrckJLZjMrN25BV29uVHMwY0lZeFpD?=
 =?utf-8?B?ejBBR3FWaWN1RWZHeEF5REcvSkJ1RzFjYXMvN0dQZ3g0MDlLWmpFNlcxd3dm?=
 =?utf-8?B?Tk1pS1JHeDN3UHFHK1ZBeFNrR2NYUWY1MHdocE1iVnJPWFIvRVg2SFF6dk1o?=
 =?utf-8?B?OVQ2RmM5VUdaUTVpTWhmQVNOVjRlUVJUUHBZZTNiOGNHMUJHZ2U2WXNtSTVK?=
 =?utf-8?B?UlMvWG9tYkp4cVdKNDFPcEtkZFMyQVRUeWEzVFlDUzFXVXZYWVYyZWx6UEs2?=
 =?utf-8?B?b0lpV0FQYnp2cDdlUVJzbmlYREtFdHByZjdjWFdsVGd3WUNMZFJnUmgxdmdM?=
 =?utf-8?B?SXBwMFhuZDE1eXQycDRrK3M2dFNPd1Z4aWo3aFFnam8zbmNpdE5WcEtoaG1s?=
 =?utf-8?B?Rk5NWTZ3V2JEVTd0MnlVNG92cXdxYXBuZE5HTHZMdmt6all4RjBCY2h0T2N4?=
 =?utf-8?B?cUFOYUdHTzhHQXNtSnVDOWxVSzJ4QUthL1g5NTVjVEpqOVJaYTFmRkgzbk0z?=
 =?utf-8?B?NTJsNXJWS0FHemxTYjhVL1hZb2JMdnNPLzFRc0RnMG0yeGxWRnZ3WjU3a2lw?=
 =?utf-8?B?Smo4aXBoakhwTEg4eS9vYnluYVljekdlRDVtVDV6dzB2ZWRZQm03Nnh6b3pB?=
 =?utf-8?B?WUhuWHJNN0dxTVFSOE8yLzNxYTlRcTVPaUVCOG5jRzgyN3o3cFd0RUtyTDg3?=
 =?utf-8?B?SlMxSGh0cURYMHZkOXJETzhpeDFGRGoyLzMxaUxydU1zUzRUaGVpenAzdVE1?=
 =?utf-8?B?K2ljRFZMc2gzYm5UZW80Q0ZwSEJKMHZBVFV5K0g1OURnWitRdUd1TUplZTV1?=
 =?utf-8?B?MWQyZGZpNzRrSitHb2NKcmZUUTlLNUJ1MkM3clBrcUhNUFhKWnVraXJ1QWNO?=
 =?utf-8?B?L1BoYnYyb2hxMUpoZjNaTE5mc0JyVzVlSG9oNFpjdHFiMmtJWXcyUzY2S3Fq?=
 =?utf-8?B?TUdncytjcXloNEVyS2FlVW1qbTJHdXllZk1MeEJLS1l2ZUxWRDlBeldiUjlI?=
 =?utf-8?B?NkRoYndiUzJ2NzJOa1lHTWZpMXk4b0FteGFaZTZOSTB4LzlYU1lZMnkydGdW?=
 =?utf-8?B?OWFpc3daTnBRKzV4amNsUzBOZGtiWUxaQVVpWDB5QXFCeTF2Ymprb0ZCN0tP?=
 =?utf-8?B?djU2TWprdkc1WmxZT21KaHlQMzloVlA3THVSb2JlSzNtcVpBZDB3UjhOa21H?=
 =?utf-8?B?eUE3Z0pBU3hVTVYzVnNJWHgvNHRuWFJWVVJHKzhrN1lzTXVtUXhZR1BTZVF5?=
 =?utf-8?B?NzFRVHRSd240VzNYZjIydE43NG9sV2ZGR0kvYkg4RW1ETlRTVytLNjFLYlJI?=
 =?utf-8?B?Q2hFNEdaR3d5TjZtR0JTUVEzeWNOVHBYMWIzRzhDRG9kMmZac091aERjYmNL?=
 =?utf-8?B?NUpIb0MveTl1L250ZW9KSUg1UlFvVG04ODVtZml2dHcxeG4zMnh6eEdMVUJp?=
 =?utf-8?B?dGtmYU92MVNoRTV1MkN2Snk4a1dPTm9QelZLYlVIUmxUWXhWN2pNQ01iTUNm?=
 =?utf-8?Q?wUZVcY2roYV13s8rdchW17hLRyibgkC20VTE7A2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24336409-ee06-4443-c6cb-08d96320510c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 14:47:50.0490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx9OjKgDQF+veN773hfSar8S/hHS+1Jc5TS6H2x7o0IwRQVV1HSVAw4oMQitNZVEh4hG7LG2Heemv6lWZ5gNpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 17.08.2021 16:30, Andrew Cooper wrote:
> There is a step change in speculation protections between the Zen1 and Zen2
> microarchitectures.
> 
> Zen1 and older have no special support.  Control bits in non-architectural
> MSRs are used to make lfence be dispatch-serialising (Spectre v1), and to
> disable Memory Disambiguation (Speculative Store Bypass).  IBPB was
> retrofitted in a microcode update, and software methods are required for
> Spectre v2 protections.
> 
> Because the bit controlling Memory Disambiguation is model specific,
> hypervisors are expected to expose a MSR_VIRT_SPEC_CTRL interface which
> abstracts the model specific details.
> 
> Zen2 and later implement the MSR_SPEC_CTRL interface in hardware, and
> virtualise the interface for HVM guests to use.  A number of hint bits are
> specified too to help guide OS software to the most efficient mitigation
> strategy.
> 
> Zen3 introduced a new feature, Predictive Store Forwarding, along with a
> control to disable it in sensitive code.
> 
> Add CPUID and VMCB details for all the new functionality.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one suggestion:

> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -274,8 +274,18 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
>          {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
>          {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
>          {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
> +        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
> +        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
> +        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
> +        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
> +        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
> +        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},

Here and below, how about dropping the "mode" part of the name?
I can't seem to be able to think of any other "same" that could
possibly apply here.

Jan


