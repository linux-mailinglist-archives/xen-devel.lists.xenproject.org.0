Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84E6BABD1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:13:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509986.786823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNBj-0004J5-BE; Wed, 15 Mar 2023 09:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509986.786823; Wed, 15 Mar 2023 09:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNBj-0004Gk-7s; Wed, 15 Mar 2023 09:12:51 +0000
Received: by outflank-mailman (input) for mailman id 509986;
 Wed, 15 Mar 2023 09:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcNBi-0004Ge-8B
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:12:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e68e763-c311-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 10:12:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9258.eurprd04.prod.outlook.com (2603:10a6:10:372::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 09:12:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 09:12:46 +0000
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
X-Inumbo-ID: 8e68e763-c311-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsP82frFvLzpJBkzbw3nI1yky3ia29kKRRcNq3jGEhlnDRWh5EFsMYLf9ygpIS9i8d7sB5j42Jp6LD34xkC/ZVHEXER74ucHvS3Hnim1KIsrHC5eYNLQsKL+1Pc54F92ydH8Z60ZkE71S9UhuPWI/D5YqAugFYPA6dBFBxO3hWEZH1P8jQGbOehoMwxgHlDYKGcgZm3gXvS3ra3Z2/L0tgrhRq5cuqnlSMvGgLAm+SjRi7ZLgzyGVUmhSXzoK/mgQHDQY3nqsChlHYBOl6nQNmJmWWTpQHZnCEcml0ETM6sChO1vtWZ/irSHt4a6Ol36diip0f7GYoKAsIT7V1nLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpsA/LeARYVPLGkv3RVN1hBvfrEtoMIo8vuvX6EqMG4=;
 b=VkKR8vSShoVhSML3rfXF8NmCX3M4zLe4FHctYf/e4vj4qxVNA02mncHq6uhCI1BqwcXhc8kY13P2/S/klAkFQADcHZoBjGzE0LrUGjzoTYPS/wkrawO/kH2EFD75mVnDFHt9or8DWFgO4ahmO+BvSSmokQ6XNFbB7ycqCcoZXhK2XDcOe0tZt/BQuEFqyIXHzpT6XXQn1IddygcWdue+XRp8fD0W3nxRIxjUh9D2SKam13FDZR7hDI+HVUS8jVI3Vo3ZhObGsVFcgq79HxUBmrBkMNT2DqJL6xB6sjbXBgBbQiO2cFdcl6RPeRKEtW9j2hsZYE5Ulq0/8jo1ucvQFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpsA/LeARYVPLGkv3RVN1hBvfrEtoMIo8vuvX6EqMG4=;
 b=gxqJeR9DX7OLV8ijFcgiDJsxkRA+zbqlcruFR1K7f0N/QMC9rAwGhLlIp3kknxXJmXS6ckdX3Wy2PNdx/2NPA+AZwUrJ/b2+5alf3Zuk8mOHhyIYDzaCe5NSoFLydlkXNnOMxGg0aUsfvgVox5+keGr5ge28tHe2PsdHCt5oSO7lTAj2rhQ7lRJCDmVEp7DiE1FJAxJ7lrjTLk68VWM+AYTWPsZXE5XCSN/k4BapDyQC97u4c7O9puNjio7e7RTqTLZ//MqvuC/BuyHKt2l8OKtWBe0vPrI+T2vI9MiQmNbdJUmBhqtuOqtnRjbFxbE3PpJE2H9zbLF/FvjXp2zzdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e46a667-da69-9f25-387e-4dd45db10cda@suse.com>
Date: Wed, 15 Mar 2023 10:12:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
 <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com> <Y/dlPXeJlPRwEB1s@mail-itl>
 <49f35c93-2235-4223-89dd-3e6256a17369@suse.com> <Y/dwd5Gkv5Ps61eC@mail-itl>
 <400b11d9-7905-1cc5-2ab3-e77d3fbd9908@suse.com>
 <CA+zSX=bQVQq1+gOXdPFFwerK-0HBCtmBW0mn__LaF3DgVGAx1w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=bQVQq1+gOXdPFFwerK-0HBCtmBW0mn__LaF3DgVGAx1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c1d8ef-7d93-4eb5-c798-08db2535713a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9MBdy5fYLTL2FiOFGgf8qjTVWeCdMipDlN/y4k13hJEff52VCNw7HxdWoFFZQuUs6QA5DmAK8ehN/aZwct4wq9nTf5uKYk0uzn/rimlLSF9rCDTIKuPqfYRp7UDHJSi9G7DJ9r2mjPZlOP86NxiflMXsIag4B4wcgNhHeQN2MPpcdAcadrpS6ghkA/EqPFda4mNkFgjIdRw5KgH/Z1WHrt1FCzVvZrygoL6yy25Xp3k2KnZHuFPe+LfmuUkt0d3sQdZDTJ5LI8J8D2QRl4pG+bnhL1OZ+sr9kL7fwBrTusa2VGpoBs9DBnZE3ZwaL6oB4Y7lQYIKdtk5fnwU5OTV/edSFbvZyeAytTUjotHNjnIeCWng5zWcOIfIpzuExJj8OTSB7WKN/F+t4FjuyC/3sEOEw46pKPmW8lzahWJBgRhpeq3S0ka02NGD5FjvPuX6bflXsbVI8PMYBGA8TZJJkfXFG+iiHO6ceP60VB7NmQvNd160dAE6wVhOQU0Fe43L+QhaFJwtfMYA+zxKC0nkS4IAhu+3SClr+sTJXLf/2B2380V9b23keDmHcfrqY9wUbYiyADBIbxU5s8KTtsHXbw/vtfiojgX5Zncb+SlId30cPkVmAojLZQbbZrnY05s2Ux2ZapaVVdfCja6maItZidC6ELB8EgyATFFL8Spf7MIc8d/U7C+IPkzBwLsajKlSVjKnmHOfVgebmYblltt3rLyhGsJfqVWoGr+aqZUVsnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199018)(478600001)(83380400001)(186003)(8676002)(66574015)(6486002)(45080400002)(6512007)(6506007)(2616005)(53546011)(54906003)(66946007)(316002)(31686004)(26005)(66476007)(66556008)(6916009)(4326008)(41300700001)(8936002)(5660300002)(38100700002)(2906002)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejFvWFFvakk5dG9ZUVZRaFNweFcyRkZtOVhXLzR6eHVIbFNHWHljbzR6T2dv?=
 =?utf-8?B?N1dTUDc2QzE3amFoZllSdG1Wa3dNUG1tNWtwSXczWjZ3eURrQkhzSnJZTmJs?=
 =?utf-8?B?Q1EzUTUwYzNvRlA2UjlsWG5kR3kzUjU2WUpnNmRTYUlKYU5QZURlV1c1MlBW?=
 =?utf-8?B?cStFZk5iMFJxVk9QZFdZMGNpdkxnSWNjS2xKQ3BjaS94Z2laaU91WXpIVUJQ?=
 =?utf-8?B?K3RuMTNUNStRcTkzZmtDM1J4RGgwYW9SUTNJTi9neEl5ZlNieGVrK0l1cExD?=
 =?utf-8?B?VmVXZkVqOUc5RW5tSXN6L0ZZZTVhNFJFbHF6dkM2eGh6RisveHFoMzMwc2NU?=
 =?utf-8?B?cFFXcXRBbkVHWldXMnN1SmZDUjBpVEZuUzRtUkVLMzZwNmo1L2lkSnQ5M3FZ?=
 =?utf-8?B?dWNXVFpkeWR4SUhneThqWENjZWh5cFlCajNmN1ZLbk1USFkyTDhoV1MyRlhh?=
 =?utf-8?B?WGZXcU1KeStjM3ZNOFptamhYMWErNGdXUEp5R2RUTnlCcm1xWnpEWXM2c3lH?=
 =?utf-8?B?NGhDWE0rKzMxVDM1eWVNZHMxZWt3OFAyRWphR21jK3Z4YnNCdTM0Wld5M0xj?=
 =?utf-8?B?bFlKcHRQNjNxd0V2aFVKeTZYMUNMcXZHc2h0bC9hTktLb2NPV1RSZHdXNE5x?=
 =?utf-8?B?T01OVWRKYzc3emtzRUhPNEwrb09SelppS3lpMWhST1FCbUVJSGFLV2I1Yk9B?=
 =?utf-8?B?KytjRVdMQ2dKa2VBMXVOMFJGMlljZkFudXFXRklsZ214WWJlK0tvVmNzMGR2?=
 =?utf-8?B?SWMxSHNJY2FROXJxL1B0NjhOOFVvU1RwMUp4VjVlZWd6aDlUZi9TMDQxVUZl?=
 =?utf-8?B?MkhXRDUrajMwenRlb0JpczlCd0E1ZXkyYTB3eTZXRnA0R2hNMzZnMzJzRWJH?=
 =?utf-8?B?ck9JZUt2eXJVYlNkR0h5OHVmMW9LRXpQalArT1IySGNRTjZ6MURTQ1NpUDRy?=
 =?utf-8?B?bU8yT2NwaWYyaE1CV0JzS2IzR0UxUXF6N1hDaXY0NzcvU2FwV3dFVVVsM0t0?=
 =?utf-8?B?TUs5VldrUklYTTdrVUVYbmVscUViUEV0UUlRb0I5ZVlXcGlGc2F5S0haaVM4?=
 =?utf-8?B?N2Z5RDZ5YnFQVjZucTdtVGtURXNRdHlnMHh6MFpCQ08zVGcvYmEyNkJUalht?=
 =?utf-8?B?MlJWMm1Dd0FZMURkd2xibnZJSnZwWjdmdGRTaStDQ2xtdmhyNkVFMUZsYm5j?=
 =?utf-8?B?cU1FVzJKckJmSERxZFc5Ty96aXFiRXdtOUJjS2N1ekh2YjBUdElSM25DUTNr?=
 =?utf-8?B?TjEreVgrdmtrSThYTFQ1UUNUN1Uxc1ArWVg4VjdNTFgyVFZCV2lndkNJM1hs?=
 =?utf-8?B?NnYvOEFJbkVVQms5UUVMUnZoaGZHbU1FTmJuR0M0UkhyanFYMGxpN0JvQ2JW?=
 =?utf-8?B?OWtWQ1NSMVk1YUZzeGlVazRXSEZ4N08vMWQxT2N0MmIwbGp4Z2xTdGlZRGZV?=
 =?utf-8?B?dFdOUjRkZGtKdmxYN0FuRGtRV3RhdEdqcWplWDJvYXpFaTljaURUeU9tSERN?=
 =?utf-8?B?MlBBQzNIODdqQ1pGeFNlcHNoYUhDVEVwRDJBc3NSWlcydTlJWmJCYzhKNm1S?=
 =?utf-8?B?N0IyM3I5Tm9kbnpkbk9ldEtNTmcwRmtNd1lSL3VaRi9JNmtZLzJLUkVvaG5B?=
 =?utf-8?B?OEVyMkgwenV3djR6aGo1dkNwaStvcDE4cWFicHhBN3E2bVBmckZhNm0vVENO?=
 =?utf-8?B?TXdKQURnSk1tbnY1QnBzMUg4c2N0ZHBtcUg5V2FvZGoyeGxxNGs0L0haaGJi?=
 =?utf-8?B?M09TNWtMMVJhSW53dXd1WWkzNjk2dDBZYWozeHdZdGIyQ0ZQSW94QjA4MVVp?=
 =?utf-8?B?WmpFc0NkR3NXYWYreHF0UmJYZHUyZU1UcVJRdXB2cjJpQkwxZWFiQ0pKKzVP?=
 =?utf-8?B?ZHFKOHphQUFCVzBOSjlTTnJJUGcvcUNLUWU3NllSTGhCRndsM0VENVphbGNC?=
 =?utf-8?B?d0hCQ1pPczZSUjU0OGVIbkFsczlhZlhlc244MlBvOGZHQ3JMY0dwRmIzUGhK?=
 =?utf-8?B?M0JtcWtiazJvSDVQd3dnT3JlbEhxZDVxUU1qY2UxUDJWaGxjelcyaGI1VWdW?=
 =?utf-8?B?eXN4NUc1Z1RxWXhBaENzZTNtZXVHamcyRTcrWnJFeWZHS1VWbXBla0NYMGRW?=
 =?utf-8?Q?Yewa2ISLQ4xNplNzuxbBbcnVl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c1d8ef-7d93-4eb5-c798-08db2535713a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:12:46.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8NVpX60I9lpj0fCdOVoQ7uoSwqc7Dxk1DF+ya5NrPvqtzDSfuOANXDpG7wdmClnw392woIkRVieoYfck6dh7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9258

On 10.03.2023 17:05, George Dunlap wrote:
> On Fri, Feb 24, 2023 at 8:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.02.2023 14:56, Marek Marczykowski-Górecki wrote:
>>> Yet, not calling SetVirtualAddressMap() leads to actual issues _right
>>> now_, not in some hypothetical undefined future.
>>
>> That's the way you, Andrew, and others like to put it. My view at this
>> is that it's not the lack of the call, but the improper implementation
>> of firmware which leads to an apparent need for this call. Like for all
>> other firmware bug workarounds, I'm happy to accept any proposals for
>> workarounds, as long as such workarounds either don't impact spec-
>> compliant systems, or as long as they're off by default.
> 
> 
> But it sounds (reading though this thread) like it doesn't impact any
> spec-compliant systems -- that is, not any *known* ones, but only
> hypothetical dom0's which are neither Linux (including kexec) nor NetBSD
> nor FreeBSD.

I can't say anything about the BSDs. Originally, when our EFI support was
first implemented, kexec would have been affected from all I know. The
way it works was changed meanwhile.

As to "known" affected systems: Elsewhere on this thread I pointed out
that I was happy that, at the time, I had an excuse not to worry about
getting our use of SetVirtualAddressMap() correct. Properly establishing
virtual addresses before making that call is still an open issue, for
which I do not yet see a good solution. Marek saying "It works just fine"
can only mean the limited set of systems that were tested. With more of
physical address space populated, said problem would arise. Can I point
at a particular system? No. But I do know that systems with "odd" memory
maps exist (that's what e.g. our PDX abstraction was introduced for),
and I anticipate problems there.

An intermediate approach might be to call SetVirtualAddressMap() on
systems where we can establish a complete virtual address map early
enough. (Saying that without looking at the code, so this may not be
viable in practice.) But I'm unsure this would improve the overall
situation: We'd then test one thing on typical systems and would end up
even less certain whether Xen also works on atypical ones.

> If we were Microsoft, we could afford to say "we don't support this
> hardware", and that would be enough to get the manufacturers to change
> their tune; but we're not.  Making it difficult for our users will not
> fundamentally make vendors write better code.

We can certainly agree on the goal of not making it more difficult than
necessary for users. Provided reasonable command line option documentation,
it shouldn't be overly difficult to establish which workarounds need
enabling for a given platform. For known problematic ones we could even
enable workarounds by default (just like we do in various cases when EFI
does not come into play; most of that was inherited from Linux and hence
is rather dated now, though).

> Particularly as my guess is that it's probably mainly a matter of testing:
> They only do testing on Windows (or maybe Linux if they're particularly
> keen), both of which seem to call SetVirtualAddressMap(); and so bits of
> the code accidentally come to rely on it being called.  Sure, in a perfect
> world, developers would read the spec, automatically follow it, and test on
> all possible hardware; but given how software actually works, it seems
> inevitable that we're going to have a never-ending stream of bugs because
> we're behaving differently.
> 
> So literally the only benefit of your policy is to accommodate hypothetical
> operating systems, who may need the functionality for unknown reasons.  And
> the cost is to have vanilla Xen not work on loads of real systems.  I don't
> think this is the right decision; and it seems like the sort of general
> higher-level principle that it would make sense to have a project-wide vote
> on if discussion failed to reach consensus.

Certainly. I'm pretty sure I would end up in a minority in such an event.
Yet if we started to enable random firmware workarounds by default which
can have an impact on spec-conforming systems, I guess I would have to
seriously consider to step down as the maintainer of our EFI code. But
maybe that's what's wanted by others anyway ...

> (Obviously if there are other technical issues, those would need to be
> addressed first.)
> 
> Supposing such a hypothetical operating system appears, is there any reason
> we can't figure out how to provide it what it needs at that time?

Well - about everything can be done in software. The question is how much
of the necessary road we've ended up closing by going the "account for
quirks by default" route, and hence how complicated things would end up
being.

Jan

