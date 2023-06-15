Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97673122C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 10:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549474.858025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9iNK-0002V2-FI; Thu, 15 Jun 2023 08:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549474.858025; Thu, 15 Jun 2023 08:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9iNK-0002Rp-C7; Thu, 15 Jun 2023 08:30:38 +0000
Received: by outflank-mailman (input) for mailman id 549474;
 Thu, 15 Jun 2023 08:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9iNJ-0002Rj-6S
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 08:30:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5dcdc18-0b56-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 10:30:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 08:30:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 08:30:32 +0000
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
X-Inumbo-ID: e5dcdc18-0b56-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEOjlj7GRpDJMXKe1bU6KM+3eyF+w13IQ3z4S7veu97R5oZc155LWWSzG3SZ4OZqXz11j37hcczLSwdUMlEEx9CCTA2dEMbDf7OIkvtawcW071Vd3d2Z1sNf3RleucYd1dCen23AUMFf5FHPt0b96JhOuCW5rD5b2Ba54gY1mHNLdQ0Dhx9ElTBbqNOqDg5OrQt0BSTE/FClqITcjXuMqbgj48OXiaTG64ahrWmK7RU2b3XQZm1atjzCwzC3KZHrDhg5yH3KUPK95Nbl21WG6aKrV/dTHiShvsmHeioaRuKqdkvdn2rvk4ZoI2ddKo8mzl2o+5nRxU+knIx/kq30vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATz8cj1PVQEDTSdpW1keIKbkMyuBQdQ4uXROrJa78lY=;
 b=b4XIr9Ij8uS0GSHiYFSvXZU0T5/s6kyogBvm4LRTgRqIpbuaj6hpWw2Cbfg8jdDFaQO5VFa4W4H8xiIAX1lBw0watXIsfesGIGIncy+n7dk75Tn+MeRZk4+AKKyzf0YZv5V3akgq3EJcecy75EqnubTH3jo/hwLgnT3ZxsQ1YBFiQJJ2UEjzIzt5FS0dAZdsBd3ClZc6UAlw3l3pBwlbRuqFcLdd6YxkObI9s6oGMiesDlXq80D5WYRzzdXmhgPmj7+/R3D3O7BW4soAChEE7GX/ZRzQjHqUVxsWK0D6NO7kqyCW0NWzVVygCo8AVSQbFay3/cDe72xqa3aowwcB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATz8cj1PVQEDTSdpW1keIKbkMyuBQdQ4uXROrJa78lY=;
 b=k0bofiYoX12apR7QBGNfH1Ot97Bq+rG7h2t7BiWItdePM41n/gi2KIdDYELtBAJuDsiiQpLxcrUP4zMRGqW5B1BPBPCr3fceQgoFtnvnQoRm/8SpAfZPFmKVgr2BWiBhNLHPeMV1masldnu0CiWBUBcderLDtc+S4WqNNaFFmG1UwepoRPMlnpJz9TFRWGo0Wu8in+25P0KEtR9A0V5rnWeaLhorlemC/kizOYaj9ufsI1bV5Bp/7H5Fd023FdGrOWRu98GceDIKHuExocWm1Y1Z98eC0SdeFe/wwUk1CygK5S/ytiEoo7w1BsoSSwl2ghwIS5Yi1uG62+I04CRlMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf30658c-daa9-7e4a-11e2-c56e4513fd8a@suse.com>
Date: Thu, 15 Jun 2023 10:30:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
 <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
 <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: af0b3296-e22d-40e6-6fb3-08db6d7ac8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K7fYeuxPBzGeOVmUyXpLrssXbNWhQF+jeTCWd+RP7hDViV0unbaixPufZJcdMezUaMwQd9NUlIGQELUjJgnZRy49Ox8NJZ9NQSSXU5B249+uIT1QI3NlcI6scLsSChSfBvMPm1fRyJof3aKVKiDlSsHRUcdsdQBZGDdF653SBnkeKoKqCke3aPKYvCswfZuUXAsyKS53x+o4yM8lqyr/u4zOcMMD6J4+Os42+oEVYYWW127U8ZZLeluImhw2+5jfNNl/5hBKswMKZ9C6ts4Ueho8fKTHommxoExPFhSmI03uTFUTVVs7/yaKunhw4A86uv3xG46wO1dIc7eihzb5Z/R+54F3x7dXWyLbwEZp+V60p1ufBeb+guHcxB9g5Bs6HsWXnnJiQ+yED6D4+eWuhjUZ61tmHTSOZ7CCM3IwXKNi9se7jR2kKWz7jHQbVeUVcxncEUgowUytpmBBP6l/dx9CiV6wywcVevo3AhRcSzs8u00dyFtCSXnQQ0jiWQ1+4X6I5CIylXxVK25pKmdQ9dTJIKdUT9rHgTnn1xBIC0Vdce+iEjMHIQTE9DrFkCmTGgj6ruJqbEgYXY4MPFzk+6uaMK32/Y9GNrRdGWLfIjvsL/Rx4GuO1i5Cs94ELNFAA+hymcJike39xoVFcBmCfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(478600001)(6486002)(38100700002)(83380400001)(2616005)(186003)(6512007)(26005)(6506007)(53546011)(36756003)(316002)(41300700001)(66476007)(66556008)(66946007)(6916009)(4326008)(31696002)(86362001)(2906002)(31686004)(5660300002)(8936002)(8676002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d09TamRrME5jR05qc253MlFDa09WMjV1UzJUaW1UblVFNlA1cXBFQjdUTXdh?=
 =?utf-8?B?cTY2cjlHeGtFbXEycldFSkZaM3M0SGRvaWUrRERRODBXVzhmZC9ITEZtWDVW?=
 =?utf-8?B?ZUViaGNqZXRRREFXak53VHhINXNBUW5oUFgrL1dNM0xTcHF0Q3IvSVpQMHNC?=
 =?utf-8?B?dUwyMEpPdkgrb2YvSndIYmtEZlk4SE9ReHBNWlQwaDhMTUw0bkE1TEE2MzNT?=
 =?utf-8?B?Vm1UL3p5c0xZQ0FmQmRZeWRNclEyaTlTaWNIYkRjUkpJSi93dXlJaTI3c1BV?=
 =?utf-8?B?NHR1bW1ONlp5a0pLWjJuNmlZemx6WHUyKzRLRllPRHdUOXR0QVBwbThUZGI1?=
 =?utf-8?B?VStobXRMcVdDdEdXcFVDUkpvTk5mRDRXZHpxSEsrVEMwR1ZhbmIvZEJRQmla?=
 =?utf-8?B?Q3BwcW44M0tiMTBmcmUweE9KeEJSWXRrYXBLbksraHlNSmJtV2hJNTJka29Y?=
 =?utf-8?B?bEN2VVN4Mkh6eS8rYXlZNkZXd0NBUnFRY2tPR0ZrNzg5R09hRmZyOFYvM0tS?=
 =?utf-8?B?ZnNObG9GV2tXRkpWZTdPSHF0eExINEpUeS9kYVdPQWQxZ0hINEI4cXY2VDZT?=
 =?utf-8?B?ODBQNDVYZ2daa3ZDQU8wR3BQdTR2aEMweUVJdXZkRGd4enl4cUlKemVEY3lu?=
 =?utf-8?B?cllEZi95V09HRFBjS1h2YVQ4VkNXUHoxSk1HK1kzM2RXaVNRNzVXSGVQcDdF?=
 =?utf-8?B?UHFhb054NnovUjE3Q3Z1N2dSbC9DaFRKdEpaY0Y3ZExTcFVhNUJycEZSa0xW?=
 =?utf-8?B?ZlFZNzdySDQ3UEJIc093SDVXNUt4bFVQMEMxcW91c1krU2t0ZWhGK2l6TU5G?=
 =?utf-8?B?a1libVp5UzRJUVczaC9MZEJnRTR3M1JENVJnOVlpdWZBWU8rQ0ptNjc3Slo1?=
 =?utf-8?B?WFQ5dzFmajBrOUhCZ1IzejVHNzN5WnljaWJvYmVWUzR2NE80MjZWYkJzV242?=
 =?utf-8?B?OXhmU09tTVo0T2pzc0RIcXgvbHNBbTVEcFhybzBpVDE3Um1SbW5GcUVuZitS?=
 =?utf-8?B?Um8xbWpzRjJnTzE5eklqajE3SXJpQmFTN0JWV080eEhURzFVNlIzL2xqbHc0?=
 =?utf-8?B?K3ZVWUpTTjh3cEJTRWNVY0Q0cFIzU2FXS3llNFR1cUUxVk5oU2ozM09kT3Jn?=
 =?utf-8?B?WkRQbHUyVS94MWtnZ2NUeVFWQ0lPVWtDY1V3emltNk5KdnVyeUlmRG1oTlRa?=
 =?utf-8?B?K25JWU9aMytRSk5mV1FpVTRYdXczQ1RhdG8vR01qd1B3STMrYlYyVFdCa0JX?=
 =?utf-8?B?WUNleSs1SkRVZ0E2dE9pMGJtUE5ISVVIclh2MHI1ZWl0ZG5LMCtCRjV4elJF?=
 =?utf-8?B?OWpUZTdMYUQvemt1MkRDRzhPWFBsVWVIckEzNkxXUmdlVDBpbHF6d3dPQ2dR?=
 =?utf-8?B?dzYwZDFkYUowWkV0U1FTTGZzUm1xc3BtcUpLUHVETTBLZjlXSFIrcWFwSUho?=
 =?utf-8?B?Uk0wbE9hc1gvblZIN210czRtdlpsb2wzT043Sm9NaE5VaVh4alY2aGdhbktN?=
 =?utf-8?B?K0s4VHFuRlM4YmJ6aHpiV0VjUzB1WEZjUFFzR0pCL3BpMDg5Sk5VWlhBMDVz?=
 =?utf-8?B?SnlPZnpCTHdJc2pqMUZBbHpIdjlURUxBRUZadTVVenN3SEVWWFFyZGxjS2hO?=
 =?utf-8?B?K21Qc0ZjTHUvNEtnRFlESmVOYVB1WlpTU1pBRGZzUTlnYlh6K3JpcTAzT21y?=
 =?utf-8?B?ampTY2IwRncraDRNMTh1bkVaSlYzUUtHU1RZYy9IbWZmbzhyT1oreU10TFFs?=
 =?utf-8?B?RDMra1hVK1BxS3lZYzBia2VVNjVVbE85eXdlbXdWY3B5aFAwbHBpNGdpUXM4?=
 =?utf-8?B?Ykwzb3NNTnl4cWlRU0hBbG9KTndmZFBwZW1GRGs5KzdVSkQxSWNsZldGWXNW?=
 =?utf-8?B?WlpVdkxYOEw0ZldvQmdYS2FKVjRqM1lRT1QrMjF1NndVL09oK3YxcnhpWUVD?=
 =?utf-8?B?L2ZVS2Fac3Q4ejJlZVZZdWFhZzFNdFRoMjBCVmxPWVlZbWlJL3N4R2FQdWJ0?=
 =?utf-8?B?T0ZDdlI3UGoza0huRHZHU3VlVFR0Y09LU0VJelpDdEpMV0l2OEV6aU10NURV?=
 =?utf-8?B?cm5EOGZJSmhNMFY4WGJwRW5pWG9FdlBRMHdOTDZGRXAyVy9IUm9Uc2RhUFNM?=
 =?utf-8?Q?FHavsAnCIY1p5lfOvt4otftvY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0b3296-e22d-40e6-6fb3-08db6d7ac8dd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 08:30:32.7996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8qybOMGSJDWRG66tOmx6UwXxfKqXUiqvZAYco3HxzBJAhhbEHlY6XLXtrRmAEoTgTt3ZIAAsGnFiF2K+WCYnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

On 14.06.2023 20:12, Andrew Cooper wrote:
> On 13/06/2023 10:59 am, Jan Beulich wrote:
>> On 12.06.2023 18:13, Andrew Cooper wrote:
>>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>>> predictors when empty.  From a practical point of view, this mean "Retpoline
>>> not safe".
>>>
>>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>>> statement that IBRS is implemented in hardware (as opposed to the form
>>> retrofitted to existing CPUs in microcode).
>>>
>>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>>> property that predictions are tagged with the mode in which they were learnt.
>>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>>> alternative predictors but restricted to the current prediction mode".  As
>>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>>
>>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>>
>>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>>> linked, absolutely nothing good can come of letting the guest see RRSBA
>>> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
>>> this dependency to simplify the max derivation logic.
>>>
>>> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
>>> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
>>> "somewhere you might run, Retpoline isn't safe".
>>>
>>> The default policies are more complicated.  A guest shouldn't see both bits,
>>> but it needs to see one if the current host suffers from any form of RSBA, and
>>> which bit it needs to see depends on whether eIBRS is visible or not.
>>> Therefore, the calculation must be performed after sanitise_featureset().
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>>
>>> v3:
>>>  * Minor commit message adjustment.
>>>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.
>> With this dropped, with the title not saying "max/default", and with
>> the description also not mentioning "live" policies at all, I don't
>> think this patch is self-consistent (meaning in particular: leaving
>> aside the fact that there's no way right now to requests e.g. both
>> RSBA and RRSBA for a guest; aiui it is possible for Dom0).
>>
>> As you may imagine I'm also curious why you decided to drop this.
> 
> Because when I tried doing levelling in Xapi, I remembered why I did it
> the way I did in v1, and why the v2 way was wrong.
> 
> Xen cannot safely edit what the toolstack provides, so must not. 

And this is the part I don't understand: Why can't we correct the
(EIBRS,RSBA,RRSBA) tuple to a combination that is "legal"? At least
as long as ...

> Instead, failing the set_policy() call is an option, and is what we want
> to do longterm,

... we aren't there.

> but also happens to be wrong too in this case. An admin
> may know that a VM isn't using retpoline, and may need to migrate it
> anyway for a number of reasons, so any safety checks need to be in the
> toolstack, and need to be overrideable with something like --force.

Possibly leading to an inconsistent policy exposed to a guest? I
guess this may be the only option when we can't really resolve an
ambiguity, but that isn't the case here, is it?

> I don't really associate "derive policies" with anything other than the
> system policies.  Domain construction isn't any kind of derivation -
> it's simply doing what the toolstack asks.

Hmm, I see. To me, since we do certain adjustments, "derive" still
fits there as well. But I'm not going to insist on a subject
adjustment then, given that imo both ways of looking at things make
some sense.

Jan

