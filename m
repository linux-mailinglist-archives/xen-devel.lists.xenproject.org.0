Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE94AB791
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 10:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266612.460306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0Tf-0005fs-Uv; Mon, 07 Feb 2022 09:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266612.460306; Mon, 07 Feb 2022 09:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0Tf-0005e3-RD; Mon, 07 Feb 2022 09:38:31 +0000
Received: by outflank-mailman (input) for mailman id 266612;
 Mon, 07 Feb 2022 09:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH0Tf-0005du-09
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 09:38:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4df92fe-87f9-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 10:38:29 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-bZBLMa94OvWTZzCYsb01Aw-1; Mon, 07 Feb 2022 10:38:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2469.eurprd04.prod.outlook.com (2603:10a6:4:34::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 09:38:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 09:38:26 +0000
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
X-Inumbo-ID: b4df92fe-87f9-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644226709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnC2UznGjDVROvbGU1mF5qH5Fp/581JGnSKukwxZp0U=;
	b=DgUY58LrPd4BrfN1ASARDgnVqXcyEOdXhwdlCCJQSZOpH3eghh91x7VnpxE3dt/xEAyqck
	bIftnLXlGArdpFnqMWBcmjydnpUnoLdiCfO3M9LnFkieEgjxGDn6U4XnNhbAfANSnGKcC+
	5dQwoAIYJvo/YuzkRZ5yOEyvNL8lJiw=
X-MC-Unique: bZBLMa94OvWTZzCYsb01Aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMey19zXuLcnWftzZCtL1aofE9Y6oz4aPyYGvlQMjDeCAKxTZ9DGnyaIojEWEJjAyl58fMZqDwuD7mPOF+rVnG8RwodbS3dPhJc/T3IA1RIOn9gBOOmzJeM6nlv9dZMtYX8FqOOwKe0hNUmo9b72TpPZPaGO2cpovnhhpqpCqyXXZOxb9P+gIeUqQHud25AuNHMGF5onUrHB4iC9sTu8AqSdaZR4I1VwOpu5mfZp+vZ86JUFO54QFaex7lRRHdp/DjtOvdI9fE1dCRcMTI9XnnRK/b8ir9TYsi8O/I+nKDolhOenEEs0HF3mL4XbEHUT91/XwLoIja9s+jRtwf0U8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnC2UznGjDVROvbGU1mF5qH5Fp/581JGnSKukwxZp0U=;
 b=e995fgMt7vlRerm7P1muB9oEwayJSjq+vFrRDLajJulNLL2ekdOebl968EpK8YaIhKJIu32pD7RqBa21/rdUxxrGJCm/+S1s38t0G3EJD3KjyS0QviZSlN6/JyH+sMcmZ0ZRZSNrF+YUyub6jl3ap2fzB3UDCOvSTsVzmnVGNf9tRjVM6fNFElgshrZ9XOL1+yf4bicovnp5hCDXsmm84/xE56WREALZ3k4tDay0sCi4GYVhdFhawTiO3pr2stOIQ3Y1Sxx7HzomQu4HP9LMaNbZAXzU/Re/hHwDmtEgpNvJId0CCJOqwPi33q3mqEiVkj0mjQLdFzUoPZOEGmiWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f986aadb-0eff-0f51-be42-16c31999cb08@suse.com>
Date: Mon, 7 Feb 2022 10:38:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/16] x86/P2M: introduce p2m_{add,remove}_page()
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
 <CAFLBxZZQgfYZ=OcyhRedPvK0CZxjrHY-5kRp4EOpJ2LEFL09yg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFLBxZZQgfYZ=OcyhRedPvK0CZxjrHY-5kRp4EOpJ2LEFL09yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 850d59a7-f18d-4182-f7cf-08d9ea1d9716
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2469:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB24694CC8962AB2077A9B2929B32C9@DB6PR0401MB2469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ba3sFaGL24n1Si+WKyRTTMUWJqKG/l/rtwRWiAk5xV1FW26R/g+HysbSDLxHZIGQ94cL26qGLABHnxtTNedJVsu/m++qNf1eNfkvdL+a24+kbyfKRVSz/8wYr8fxq6l1DeY7fX538KL+MNddTaArhOUnA+xhbyT+sglc7YyvY6dOIMdLuqX+XvLmIsHs4zwxd9x8JWjwvZIJdigJlrgNr/7SosyJmJjYBtBnNy8Wr4tVkA7sNt10HVuZE6Ielm6YVoekmF4MRlUb9A8wMllNEpJN8s5cjRV66qa5SC63kIHVkb3KPUOOiD0hiBD9F7P3wrAt9FqlsmIQDA1z99uAKTBsFN8WpGgzlAjN7iyYZOhk0OyJR0JFZ09i5ejPxkzpLnxxA+KpOSFbqNzZeEKSOl6cVqodbXfUTawuqm9p2UUg93v4jBE6qpx9lA6vatErKepfoFpfok8nuiAXxw/F85dR9WJIcB/PkDYTDTgZh8I4pOhiJh1EVeedGs/TyrKpdw+ZPyPj3NUmF+FOK9jONYE95hLOMMuHGcDTudVEXiSwDxQjirnjU1EJCZdSNyQr6MGP0I0PrqDMgzFfhEoR0TPJoYCTB2pxpPEQbPhZU7WbF9a9p9PIuQwVqIsZIAreVHMbzEG8cmHkevkVsvG4RHribydmJExgLGteuiAe0Dyt1V0k7U7a3WFPh8bHYj++X5YXJ3c7pSXyIgoWBzKk+f1QKnja+rSmxPMNI83hbTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(66946007)(4326008)(8936002)(8676002)(38100700002)(83380400001)(6916009)(5660300002)(54906003)(66556008)(66476007)(2616005)(2906002)(6486002)(316002)(508600001)(186003)(26005)(86362001)(31696002)(6506007)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlYxcHN1WEFlcmgzMCtWdTdDb2QrUytLMFl1TTVEUmRyUU5jUHJEcGFtenN1?=
 =?utf-8?B?NStSVFIrTVdMNmZtV1N2dEpCR3I1TktNUW0wTC9WN1lZS25BN2Z5TFRHamNI?=
 =?utf-8?B?VXF0YXRnVzhHdkNnb0ZXTjZQNVNJUXRlMVh1cklTVnpXTFJMdGFHTTlGU0dB?=
 =?utf-8?B?OENmaFBDYjJERU5nV3hoYkxHY0k3ZWsxL0pzUlRoVG5GZVpZS3FTa0d5aVZ6?=
 =?utf-8?B?Y0tCNUZ3cUJrclRjMTdpQmJiZUdPM2NCNTk0N3oxRFhWcnRVaXV2eHpVa0V5?=
 =?utf-8?B?RTRoMFlRL1l4RXp1R2pnSGI1b0pmVGpLTEN2WHZaNnJUWHNVV21ZWmhPSWwx?=
 =?utf-8?B?Q1IzSHR0Q1d3SzZFc0pHVEZ4NjlrcFdqaFdTQ1JlWkhaaklEYnVkNlhVVEV4?=
 =?utf-8?B?enVtRGxkTVM1OTEzWUZlSGlTY2RRRjhNR3pxZ3g0UkVtcW50aVNSYTZaM3cw?=
 =?utf-8?B?a2NKZGNxOHR0SHJVa3JSbVk5aHN5L3IyeXVvbWswb0VQSlRsTVVabWFpcFU3?=
 =?utf-8?B?VWI5M1BaUWpzdkZJWTZrWDIyL2twTnB4TXRnMGVYTTQ2VGNoMkp4TE9mUXV6?=
 =?utf-8?B?ckNTMTU5b0pvdGRMWHFKWkJucWptaVRDcG5aNUFDckl6L3JnUzBPRGNRNm9E?=
 =?utf-8?B?YjJibXJNYU1Uc0oyMjVORFNhZzNpckg2ejVTRzI3TUJPY25HbC9SRnUrSFFx?=
 =?utf-8?B?WmFQYk13ZXplcUNjcEpBYldobGtpNUN5REVyeUxSeFl4elNzRW1keWF5SDFL?=
 =?utf-8?B?RkpRRFpzekJqUEl3N3QyQ2owRVh1dHIrNC9HZ29aVUVEQmNQRjg4L0I1QzZs?=
 =?utf-8?B?MGROcXpOL2ZIRVJYcUQ5MUozZzFsRktGaFY3b29USC9pWjBQKzMxcWt0UTI5?=
 =?utf-8?B?aThXR1p3VDRjb0RRaSsraDM1NGRYRXRRQUxaZ2pzUW9pNGdiYnVycFhDTTdB?=
 =?utf-8?B?NFNyKzYvaUs5QmY0QitMRFBPRjVVZHBPQUhncjVGVVphZ2J4TUdzYVg0TXFQ?=
 =?utf-8?B?SFI5bTdRWjlvbFFNUWpsVmJnQ2l5cURBV1g4SGZneG4xMGYwSHZjTk9uZjJm?=
 =?utf-8?B?L2N6cUcvMEVueXQvbEl4UzQvVGsxRldNYmdkMWZ4L1Q5YWtSNGlZSlZpTkJZ?=
 =?utf-8?B?Y2ZVMnpYQitITzJMQTBDZkxqQ3huNytuMmFzRzg5NjNwZkNuY2FvMnhUUzNi?=
 =?utf-8?B?bWNBbitTV0lzdUVjTkkxN1VCL2UycXRKMFJObjA0bm45VkhBWTh1QnlpRDFi?=
 =?utf-8?B?TDR0dVg5MEtKM2JJL3dwVUhMV0tHMEZ1b2x6b0pzemlHemloa3llSkNrdzBq?=
 =?utf-8?B?S2ZtTW1aUVdrd1FUY2hMbUhwNjd6OWluSFVXNmZpWUJ3akNvOVdoc29kcXp2?=
 =?utf-8?B?TjY4RkxOSXdGRUcwdk1uZ2xZMlFRUUt0L2JVc3hIMjQ2SHhPNi96d3ZNK3Bs?=
 =?utf-8?B?S1lnZXdseWVwWDEwYnQ5R2V1VUM5dnA2TU1zeVUyS0pTSXBwYTJSVkZuQXA1?=
 =?utf-8?B?Mk5PU3R1MEpxd2Y3c1cyVjhSVEN1bDRoNTRoUGp6azRTcXJpUUFxaDBMYVRt?=
 =?utf-8?B?TG5oamcyd1BXNm5OUXAzWXU2UjF5cERHNGRpazRGalhUNTdpZU1WejZLYmEx?=
 =?utf-8?B?MTJNWU1paGUvcDQxbWM4QnFpbmZYVVZ5VzhuaU40Yjk2MUMyQXoxS2dYWVBU?=
 =?utf-8?B?amVKOGhWZkkzRVp1ekIwRE9NQ3hLYmlHbUROM2dNNGdkOVBSa3krMEhFdG9n?=
 =?utf-8?B?cFFtMzdZR3pXUUFsbUFGZ1RpaFVhMGJkMlh2OTJoYUR0UkF2OFIwbnlmaGFk?=
 =?utf-8?B?bmxIVnJ0Q3Z1aUdDMmN1aFlEcDhqMHZmOHdyWHRwcTRoZ0ZrT2dYbEI5RVl4?=
 =?utf-8?B?ZzVMYndiQWh5eGU2M1ppclllZk9XeDVCaWF5Ly9KODg0TmRRUk5yN2plWk0w?=
 =?utf-8?B?RCs0U0NlTStvQjV1NHNNN1M2eTNuMURoTE5pUDJJWFBJL1VDUTlKNkRNMHNE?=
 =?utf-8?B?TlFUTXgwcUJXaVlXbXRyemVWR0ZHQ0RPbVlKTGhLVXpTQW9ONHdHU1NJVlZG?=
 =?utf-8?B?bklMSlJTVEZrYTI3dmQyQWQwYUlybndxY2thNFBHWG10WmxCdUhjQThMVXZl?=
 =?utf-8?B?TGdpQWx0UnlRcnV1YUdjY3RCcEZiOVZzeHI3eHQvZUlmTitMcG53QkErV3Ez?=
 =?utf-8?Q?5jvTdnhLc7eeQauaJ08YkS8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850d59a7-f18d-4182-f7cf-08d9ea1d9716
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 09:38:26.0701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeOPZPK1Zto5f0UWFrPoffwz4c2fgTiLgU+GKSfsy0qvIV7CBZal0RPwxbDtPnayGxG0wE237AUnnAC55YFl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2469

On 04.02.2022 23:07, George Dunlap wrote:
> On Mon, Jul 5, 2021 at 5:06 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> p2m_add_page() is simply a rename from guest_physmap_add_entry().
>> p2m_remove_page() then is its counterpart, despite rendering
>> guest_physmap_remove_page().

First of all: It has been long ago that I noticed that this sentence
misses words. It now ends "...  a trivial wrapper."

>> This way callers can use suitable pairs of
>> functions (previously violated by hvm/grant_table.c).
>>
> 
> Obviously this needs some clarification.  While we're here, I find this a
> bit confusing; I tend to use the present tense for the way the code is
> before the patch, and the imperative for what the patch does; so Id' say:
> 
> Rename guest_physmap_add_entry() to p2m_add_page; make
> guest_physmap_remove_page a wrapper with p2m_remove_page.  That way callers
> can use suitable pairs...

Well, yes, I understand you might word it this way. I'm not convinced
of the fixed scheme you mention for present vs imperative use to be a
universal fit though, requiring to always be followed. When reading
the description with the title in mind (and with the previously missing
words added), I find the use of present tense quite reasonable here.
I'm further slightly puzzled by you keeping the use of present tense in
"That way callers can use ...".

Jan


