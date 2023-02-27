Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DA6A3FA9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 11:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502348.774105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWb20-0008K2-E5; Mon, 27 Feb 2023 10:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502348.774105; Mon, 27 Feb 2023 10:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWb20-0008HK-9Q; Mon, 27 Feb 2023 10:46:56 +0000
Received: by outflank-mailman (input) for mailman id 502348;
 Mon, 27 Feb 2023 10:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWb1y-0008HE-UX
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 10:46:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b7a0b0e-b68c-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 11:46:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8742.eurprd04.prod.outlook.com (2603:10a6:10:2e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 10:46:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 10:46:50 +0000
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
X-Inumbo-ID: 0b7a0b0e-b68c-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmdSjd/tl8Li714jTZ1Zo92GSPmnUzoFrLqDOyY2SkQT5QDJHdX7nRV2RYxpDMwIWqsv3onCLMzdXTJ2je6J6KwtwdYxNm6n+GsMawZdo9nrV20Fol9wCbwdEJwmJpgZHPvx6Dss0gRxM4pqRyL99hNEntlbRp5NfKms79AKDjicjKpDYCOnv6qkcAFQXO1vqfLTPNu4Rd2y2TBtmEoduZuOHrRJ+6eZZfQT0QtH4BfJl23sFOQgQpJ+Yr7W1ysNXs4WD11FmJKD2+lt2TFirJ7qaWUy20pW2OA4r5EQRo0sTjpxYO43ppQ+6nH+eJW5pWnmHLLGGqm9R17SRSAbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE41pJpNyFuLR2pR7p7MmSNHYwgMf2SNOMpvUGq9vis=;
 b=VBsiDATK1fYCQocknlV/pjo1fUZJy0wE55gtkDyasXKD+H6VbVLyyQR9SnGpSUJEqDktmJ+qTMTQ5uvF1sohLjlsdpmDXpkSKiJvOnbBJKrbJObLMa89/xs73pBUd/0sRn9hogOVCbVxu7h//UepvgTcS/jEPOYcaelZaE1VfCRXJfIxqUUTBqYNxflXzUk5YXyWqNuqEykK7DhF4UgKmXkh7nmkPSWzn/AJ5ES4J8nIakAErXmv4u1s66fHJcvyhxs3bezucnbL5WzPewKteogAADRpkRnbwtpls9M1yqKH0dNavqHfaMfuZT048CuRWqbhODaY+2Rf/PjcWiQEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE41pJpNyFuLR2pR7p7MmSNHYwgMf2SNOMpvUGq9vis=;
 b=ozdpsH5UBq0WEyAgxPwFWN1NwsW6Vl0T5fEo4sJajykJGg0RSZEFjA3GMzBfkePOIOYfSYQCLUxxAT4Vhcy4cIByxUycVszA7bjZO0Gl3Jb8J3UX2K/Vkn/GmeRZJo+j9zISvhM7fJuE2a1pAJrE3BoB4NgAlkY4ih3BETsuoYly9QGiDcwbSh8NPpYpxvLBO4G+dTpCTFrLcy59/dd7m8yEpot9H1JnAF6UPLCOh2z1oOTyFyolyW8EoPKkyy3nF1tPHAwkirAoC/uMObkihsCG6qL29708zwBDAQf4/UreK8kfPdofMpkWA1X/eGDVnJz74HTKuxtOPa5U4//ypw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
Date: Mon, 27 Feb 2023 11:46:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f77c4f-4a9f-45ef-fa81-08db18afee85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OtkTP71EX1gXQEqfLthwgUxhs1parQRMSiVVztYKhwBeiSZQN05xYL61NuE+RfAUoky4yg0vDdoOXgR5di1DaqkSlXYZqI3vLL4K4A6qNMaB64fOfNKL0A2KeSt75icbq8KdCArwCbwxYC7ap/G0lQcIx2X8RcIVPK9ywuIUSe/AWGA5lKSywyHLuoyWiA6GGtVdADvL91yTbo8QbiwlMvjlFxrzJBkN+PyL4brovymiPl7tTRCLxcVI3Vu8ANPwWh6nTU/GTHGtuPJi5/jCB5qee/dfHggZE8QXbtVXhtJRBPEJLO/NI4ej0Yp2jhf387bpHceJ5HjJNgkhDSOn7mH9gzcN2xTA07/iliFxkOO+NXiGk5Pt1KkqZgDxcTUEGUO0kjvGIlqRaAcOpIUhZW0uB+tcuk8TfDC9DYW6P+6lvyAV1yq08Pw4AuzeOTsyH8/2V2D6vDFPf3UgDtfDsTgJ6/DkoutAphixG9/1I1PTEDz3+4KRhGkIazpwKkEUVWy8wK5zn0AbFaDt8qSAdLn0KBdxvR5XGrFFbQHMKpLwXAGIZ13Ss9uNKvcfSBwU/bjjycb/DrfIIw5QFLjaHEYOR64+O0leixTeFnDf1ru+gOCllf1RACj9YDQdSObY91fJE2ycW4PTMohwB900JZHEODoMXrv2f6lH/KqwVb6xoRg1zEIT0ngT4kicHvnFJ+ElrtGtpipzSRmA5CaaPaOzT8Rj8kvttA+9ccYk6kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199018)(4326008)(31686004)(6916009)(66946007)(66476007)(66556008)(41300700001)(54906003)(316002)(36756003)(6512007)(8676002)(8936002)(38100700002)(5660300002)(31696002)(86362001)(478600001)(53546011)(186003)(26005)(2906002)(2616005)(6486002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkNmbXZ2NGdLOXpETFE1N1FGWGZYNFJ4Wkp4S1F1NERlbU1CWWMvQXlLMWZ4?=
 =?utf-8?B?Zy85WThSK1B0OUhVanZMWEhTNW0ybStMOVczRStKNi9WV2VOZmNmYkRzS00r?=
 =?utf-8?B?N3ZwNW5kVUZ0cjd5NDdWelpqNlZZeTVOTW5PenhkbkZFclFTVi8ydGNJdGt6?=
 =?utf-8?B?L0x2L2lvcU1WQjViWnhQTXdBWGR0cTU3R2JOS2lLK2I4T2FkZjlkK0locGRC?=
 =?utf-8?B?ZjdvTlVYWVlFc0lLTFZEMmkvd0lmRUJLQytjNFlERW9DekhvUTdCRVBiZ0pZ?=
 =?utf-8?B?ZVEyT0wxM0dZZnR6Vnk0SlhLN3czVEUvL2xsZHM2YmhEYklrdnYvbi9YNzVj?=
 =?utf-8?B?NVNrV3gxOVlWUWxpaEVRSFp5Z2JpN3pPa21EVW1wZExhOG8yNU9FcGZXUXNq?=
 =?utf-8?B?UzB0c2FncFVmaFBWUUo0ZHZ3U29RWVB6Z1V6d0d5WHIybXdVR0QzNnFsbGd1?=
 =?utf-8?B?MjJnOTJSNTBrTkpldnUrcTUvTDJKU0NYWkFRV1VjdWhUTnhDbittamk5SXNP?=
 =?utf-8?B?WG9MRW1HdnpHTWNXbEJSM1NTdmZZTzVqdUJwNUZLTW9YZEhENVo0K2pqQjlm?=
 =?utf-8?B?UmU4Tk4weE9xQ1RkK2dNQkdhYTBQN0xlTUZwL21UekVLU3M3QVZxYWpKUi9I?=
 =?utf-8?B?bk9JUFJKc2lTN0dTNDU5K1BaU0w2RGw3UHBwa3UxQnhoeWlKcFpGU2FZeHF6?=
 =?utf-8?B?YSs0NDFlbkJGOS92KzVHUExsY044MTNaQkJYb2NXRjVRTWw1NHd3TkYxMzJa?=
 =?utf-8?B?MzlHSkh5c2hDd3BVNndDWE9KT3o1VDAzczhJZ2ErTG1EVFlEOEsxS1J5VjNZ?=
 =?utf-8?B?TnVZaHhZMjUzcUZMYzZpNXBxc09yenN4bDJIMUxkbS84em9jaU9mck5HS1M2?=
 =?utf-8?B?WEZtRkJxYlNjUEQwbW5lMjY0aFQ0VHNOR3VCN0YyK2Iwc1NHT0pOakxrcmw2?=
 =?utf-8?B?clVoUjFHNUdUVDVmSkZhTkl1T1lFQ0dkSGN2V0VaQUtOazliUVpIc1VrdWYx?=
 =?utf-8?B?SEppUWxLamE4OFZqYmxPeGx3WG1qYnBaT0sxRzQ1bXlVanZDV1ljOEwvWmdV?=
 =?utf-8?B?UUlOL2hJWUtzazdGeURVTWJnL2xaNTZBUXRIdk1ZZGRwQzd1bzhUcjljYnJl?=
 =?utf-8?B?KzZwZ2laRUUybEdhRHozZndSckptU2w4bGVXQ1dOQjJLa2pzdWlibUV4OHlH?=
 =?utf-8?B?M0RwSkZYME5EdnRWUmhmcXZIeitJK1ljTlJKNnQ3VnF3akxRNnU2ZjhOeHFQ?=
 =?utf-8?B?bjc5NlB6SEhnbWphdko4RnJqNk80RUtSMmZ2ekRzY1F0QmVuOVBJcTdDUnhV?=
 =?utf-8?B?V2JBaHB0dU52Z3lwU2wreFlsWktyWTdzb0F5akhJQTE3RDhRS0p2UEJCRk5a?=
 =?utf-8?B?Zlo0RmF3YjE1TkdpNXZTV1pjbDN3cmU0VlZCTktSa2lPQXBld05uOU5KMk0x?=
 =?utf-8?B?V1BNN2VGMys1ZDdrREtjdGRFRmJqNDltR3lDSDdkb0RsWGN3U1BEaGc4UW5a?=
 =?utf-8?B?NDZoa1pIT1NTUmNmdk8rNmloKzk0RnNUYWExbDVlRWM2UUMwZWhyeDJ6VjJl?=
 =?utf-8?B?NGdYSStCSld1Yy9IaHBsUnRkZFJUUjEvWmd4ZzZ1UlB1c3JIMmtnTzlZZ0Uw?=
 =?utf-8?B?dEgzRzFHaERDR28zVkhISzFZTlZXdVJid0VCekM1VFVoaDBKT2hyeDUrajNQ?=
 =?utf-8?B?Z28zRHZabDBpczhiUjZTNXFVSkdFaDBjTGs0SHB0ZVZhS3F3L2Vqc3ZaM3Fl?=
 =?utf-8?B?Rm1jc01DZWFhb0dId3VOdXJBd0k4N3I2WStPelpaWkh5VXp4UGIxR1FHTktG?=
 =?utf-8?B?N2t4V1Q4YkhWVW1PYVVnUjJDejZLQVdYMWlOcmh3TjFjWmFrbXJhcXBXeEN6?=
 =?utf-8?B?OGhsa1dMUWpaZFg3UHRidG84UjhPckVYYU54bFBxZ3hxS2tJOEh2NjdjZ3B6?=
 =?utf-8?B?K2UrVk1Ydnl2WkVXS2JlWlZZWWlEYVFaUlhWcG9CR0JHV0w2KzVVOGV0K2R2?=
 =?utf-8?B?RlcrNGxidWRxZDVZVDE0RU16RlVMNThLTkM5b2pRR3pPZ2E1ckxTdDdkRHY3?=
 =?utf-8?B?QVdMU2xabTJlR2dZYjRsZ1ZIRzlzNEpmSHRIaFJmVEhtczJzSGgvNlg4d2cr?=
 =?utf-8?Q?KWR42YYeHlkBiTeXfMuQAAVVp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f77c4f-4a9f-45ef-fa81-08db18afee85
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 10:46:50.6439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XIWnMTOkXU0fmSS3myXAUQpYO64RmCRlGgPH3RyDoLS3UITwanTx3B5mTaBYMCranOoLr28FR5fNz/4CUJjTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8742

On 24.02.2023 22:33, Andrew Cooper wrote:
> But I think we want to change tact slightly at this point, so I'm not
> going to do any further tweaking on commit.
> 
> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
> updating the non-SVM include paths as we go.  Probably best to
> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
> only got one tree-wide cleanup of the external include paths.
> 
> Quick tangent - I will be making all of that cpu_has_svm_*
> infrastructure disappear by moving it into the normal CPUID handling,
> but I've not had sufficient time to finish that yet.
> 
> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
> disappear (after my decoupling patch has gone in).

Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
The latter doesn't use anything from the former, does it? And it
also doesn't include it right now. Since nested is still far from
being properly functional, and since most guests don't use it, I'd
rather see struct nestedvcpu's union to become a union of two
pointers, which get space allocated only for nested-enabled guests.
Yet it's only the use there which makes it necessary to globally
expose the struct right now.

Jan

