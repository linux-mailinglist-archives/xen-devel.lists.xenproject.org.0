Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD853FB6D2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175072.319037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKh9U-0003ti-NQ; Mon, 30 Aug 2021 13:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175072.319037; Mon, 30 Aug 2021 13:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKh9U-0003qg-K5; Mon, 30 Aug 2021 13:16:40 +0000
Received: by outflank-mailman (input) for mailman id 175072;
 Mon, 30 Aug 2021 13:16:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKh9S-0003qa-TG
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:16:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80f9372c-0994-11ec-ac87-12813bfff9fa;
 Mon, 30 Aug 2021 13:16:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-v_vi2ADxM-qARsdU_K0CWA-1; Mon, 30 Aug 2021 15:16:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 13:16:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:16:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:16:31 +0000
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
X-Inumbo-ID: 80f9372c-0994-11ec-ac87-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630329396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iPaSGF2Y9vmySV5bHttv69vkJpXpqgQRidWltffVYg=;
	b=YkXaYd2fOWQuI9eMk1kcE7EOsRS7TATxv6Hhuw/6TSnOxZvJpe4ygvNntXCNwHIAGDGkch
	/cJ4pczRS+P70d1Ebgwb8jbeplWoaxfXoDdihEL034uUf5FLL5R7YML64yUIrEEtGai5hH
	ZeV4OGDsAFQPAax+Ab+qBUPASq9jrKM=
X-MC-Unique: v_vi2ADxM-qARsdU_K0CWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYDwzSVIsPhYpyizyaiVFqu2ZCTooyH5okmlpG6XzxUoO1PdkLP9uuPXROO38O8gTxVpONtUaZN00YOeUV3oHWkxKXja/UXKTiIOoa5QnORzD7LNn01sqZgrchwIH4BpKZUIxEDm6woncxJ24irR6SR0MtLGdMjSo+4rvXBxbqQTSLPYl04dQq6vmq4oXvBMgF4LH4lSYcqWxQwiO7468nDonUvXF7jNmpEhXCvDebfSKXKUhEKIzq4Viap1Y7wdpjRABiDs6PHVxR/l/FQUEq/iMEavdhuyLmnRwwKQlHXaC3HwxrVBiEWjv7FjwcGjVYbqYc3K8fZtVT2bF9jvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iPaSGF2Y9vmySV5bHttv69vkJpXpqgQRidWltffVYg=;
 b=ht7+IXBNCEY7EjdbFPd7IhJ9raHCPOgKvlDP6Bkaqjdrgw/6aDPENmD4CCqYceHNXxIUJgmVbn3j4D39Aw3gzNhCBbWbfbcHzrj7nB9J00VN9CA8ipNQmjJK1G85cnVHsP2oHyXxIjbtywapuRoeoj1+qbMkdSlX5H0XuHeUE7hgZoG0ahO0B0cPessYUqp73gGcoTqnnMXwS445lLisupA51l6Ur4GIGRgp+hlvP7DAicUWicI4feaf+jtxmDXsEmPI0s/u9gb0ofNKSKfAuzU9vwqbDDhnnoPlJwqnR0ndkUATfnUA+s1HF0Ohe2Unb7oj8QoRT4NUwoOy+dvyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen: Introduce arch specific field to
 XEN_SYSCTL_physinfo
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1628897304-20793-1-git-send-email-olekstysh@gmail.com>
 <908e2d59-41f0-3bad-6030-b2889d9c5cc2@suse.com>
 <8c622f4f-1931-3e2c-4f6e-9b832e8e435e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdfe8217-3d7a-cc56-2a61-bfea02a348cf@suse.com>
Date: Mon, 30 Aug 2021 15:16:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <8c622f4f-1931-3e2c-4f6e-9b832e8e435e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30e058cd-1a8d-4de1-1182-08d96bb86250
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4944C374DC9CA4D6A5D4BB98B3CB9@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z4503eSgF3rAzsiM36Txt6EAP+Q1oYPk3pSk9TyJksYk09Lj/Q2rXPyLctOvSK/G16H/qg2CeR/HgLuMlvpnIh5Kooun/zut8gm7kkB5WmbeB/zKsI7QmXPRvG+cfHm0E2AN/mV6eTQOj0d7RfS/eYv4i/zYGbXUjPzp/WMiQ6cOe04noY3z7qCRgJIsQqjKRYiXvMavMJ1hCETVxdEOZB0Oh6zX8TOqGZW4kmkGgH3BbkUIkl6LsLd3xM0KPP8wZVkRsvgzaRzVGcxSXAXFRBo9GaW9r1yiCe6q2nsgmecTc0hASEqeDpiNYR0YFSaOolkDVSzL7flqywc6JRC2qwO9tk51MhmH4cYK13OTT5eqGTeqP8lycjV5ZdouLhLL2C20iXGNvwzAeuRHb6apZLOvHo7SNI5hOilX0w6Zey816x5vtf5dbJNUbOhTdZmSNwAH3m1PQ2UdvTzztts8DAb3gHJUx16o6gOHqH+tpEPxnAsp3dEVwWLccaZL+AW0418s/etQjsWD7BpJTMMa8l5ti71i/PylFwuXa4SXEh86X6CrH5B/n+5wrYGq7QEo7Dd2QU8SbOM3D79AE+1M70m8y19EbE9FhHgSngIbfFtWqx10Fjquk9v/9qP5zHw5QM4XQs3Z6WBduQu+Fk7+138Yc12KwZDwJixBu28NxY6AmP95cfjlo+XO2zXEZ+hGVMtGimmXdQh0a+VWWRndeKba187EmcrbX8s2jkgVxtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(39860400002)(366004)(54906003)(316002)(16576012)(53546011)(5660300002)(26005)(83380400001)(6486002)(186003)(31696002)(66556008)(66476007)(2616005)(956004)(8676002)(2906002)(38100700002)(86362001)(31686004)(8936002)(66946007)(7416002)(4326008)(36756003)(478600001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c01DV3E3d20xbWJ4UmhpUUQ2Wnh0NmRXS1dLNmgwa1hkMGdaOXlLRnJ0UUJm?=
 =?utf-8?B?MjU0TVQyOTYrWUhKdFFMRlV0SXRFQ0NSYWlyamhFVEp5ZFhxWGxXNU5pZC9a?=
 =?utf-8?B?K3FTbmljd1JKVlpBSW4rNzJMSk1RdFR0bjA5QzFBM2RmYytHS2xmSmJaVXJF?=
 =?utf-8?B?SXplTTNDaEE1UDc4OEpTbVM5UFRSZG5XNW5VQ0RvcWlRSVptbE54VmU5Kytk?=
 =?utf-8?B?Z2FlZVpTVGxoOWNCMVdrRVJCeVlIZ29EckFBWlJsdEgyZnFmYWpNcVJ1R0M3?=
 =?utf-8?B?dXRMbmljNUh4UVJVZHp4emFIWllzRjRqRTE2NjJsUWpGL1ZMbE1pRWF6Rlla?=
 =?utf-8?B?OVRhK1A4dTlxSXg0M1hBdm4wcmpXUTB0TDFSRW1pVGlURHV2MHFkSnFPWE83?=
 =?utf-8?B?bXp6RWJCN0JuTTBmQlNUL1FNM25nS085dHJXTkNJeUxKbXBxbzdRUnczaDhT?=
 =?utf-8?B?SkpnNUltK2xWbEFMY3AzUlZvV2JiYnZBcmxvMndyYjEyeGhpUlVwV1VGOUR1?=
 =?utf-8?B?cUtxVnZ1bGx4T2RxNm01MDdUcHdVdm82Vk5qVHhDNnAzbjVMSTZUUTFyQUdx?=
 =?utf-8?B?cWY5ZlFLVFVzMXhEc2Ivc0U2VDZrOS9PcUdxNkJ2RWJzZjMwZ3R5YzUrZEFQ?=
 =?utf-8?B?SEQrZVV1TDg2WGZsRGkxakJpZ0xmRitaUFljZmxPelZDRDlvck1wSS81VW1K?=
 =?utf-8?B?QkwwQ2hpNXRINURuQkFNQW9SYXJLUHlrekV3WEc1Vlg4N1Vaem1LTUdnOXlx?=
 =?utf-8?B?WSt2K044VWw0VFV3T3VEeFFGSVdYWXZ0VHNrUExmSS92S0w4ZG9pT1RSUGto?=
 =?utf-8?B?VlAzL09Jc3ZUYVlqeXJzcWhReEZRdmlXWkI3cXRSYmdZNHI0UXV5ZWVGUzhB?=
 =?utf-8?B?VVc1aDhEazRURFRLZm5rNld1ZW03TElPWmNnaDlRL1ZJb2J3WFNtaVdEb0Ra?=
 =?utf-8?B?SnRibzlabDJxb1d6UmFtUGczaUdsZEVFTnFVOWNHaDZacHRRNDFocDMzd2Rw?=
 =?utf-8?B?a0dLRmsrZWJBSVVtcnRRU3kxK09SeFdEc0lvWWh3SEFMVWo3MEpPWm10bkdG?=
 =?utf-8?B?VmdSNUhMbnNMUVlJZGV6THFoSjRZUTZ2YjMxTVJYNnc0Qmpoa0RkYmZRMDJu?=
 =?utf-8?B?NGs0RHhabVBheDF6d2JoVDN0ckI0NnlnTXRHbG9GczlRa2hVTTgvNU1XTUht?=
 =?utf-8?B?YlNhOWRBWk01ZDh0YXVwSUdoL2p0SGloQVRRUHVEVS94cHF1cDBJbGYrQmha?=
 =?utf-8?B?bW0rY3FqdE53QU9jSW8vMWxHazJkMzVWZjlDSnVBQWo3cWc0eitIeEZNY2JJ?=
 =?utf-8?B?VHNkRFprL2hvZGxnTVFVRzF2ZkZwMUVYMHh5NW8rei9kOE9WSTRITksxYjNr?=
 =?utf-8?B?UTVHQVZMcCtBNGlMSjJaUkVSNTU2RExhY1Fjc3I1b3dnV0ZZcEhveUJsbmRk?=
 =?utf-8?B?OWZtY0t0R056cEZjSzFLczhhOXcwbDhOdC9ZeEtBU3FlV1hMcytKYm9BTWJD?=
 =?utf-8?B?dHh4N1ptSWlzZzh6UjlKSEhtaWZOME4wME0wUENWYk5wdEtvb3dsazBXbDdF?=
 =?utf-8?B?Sm9qcTlPUnQxMEN1RndGcUtUaVl5UFF5U2ppU0hHMkU0YlV2OUNMZGs0OEp0?=
 =?utf-8?B?K2FkbkluUGhobzZlcXdkdnVISHNvRWxXTEhRSWtna2d1UkFCZHg1MDN3d0hl?=
 =?utf-8?B?SWlpeC9COEcxdGlieVRPczhwaytsaytRNDI2NytDYW1tZzBMQVZ5dDEybmFK?=
 =?utf-8?Q?xijs6+5nXFOu40HTMLl7uov+3rI5X6NtLyHLesJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e058cd-1a8d-4de1-1182-08d96bb86250
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:16:31.8744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mN0u6h19wivYNLrZPZYKDtS/e2xOmcbcrkS9N2wR5p2T8lDd96T/XkNqGOVZCAOyCsnUpX+qos1LpGKPBs1BCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 29.08.2021 22:28, Oleksandr wrote:
> On 16.08.21 10:33, Jan Beulich wrote:
>> On 14.08.2021 01:28, Oleksandr Tyshchenko wrote:
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -332,6 +332,11 @@ struct xen_arch_domainconfig {
>>>        */
>>>       uint32_t clock_frequency;
>>>   };
>>> +
>>> +struct arch_physinfo {
>>> +    /* Holds the bit size of IPAs in p2m tables. */
>>> +    uint32_t p2m_ipa_bits;
>>> +};
>>>   #endif /* __XEN__ || __XEN_TOOLS__ */
>>>   
>>>   struct arch_vcpu_info {
>>> --- a/xen/include/public/arch-x86/xen.h
>>> +++ b/xen/include/public/arch-x86/xen.h
>>> @@ -346,6 +346,8 @@ typedef struct xen_msr_entry {
>>>   } xen_msr_entry_t;
>>>   DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
>>>   
>>> +struct arch_physinfo {
>>> +};
>>>   #endif /* !__ASSEMBLY__ */
>> While the term "p2m_ipa_bits" surely isn't arch-agnostic, I wonder
>> whether the expressed information is (the x86 equivalent being
>> hap_paddr_bits, at a guess), and hence whether this really ought
>> to live in an arch-specific sub-struct.
> 
> Well, on Arm we calculate the number of the IPA bits based on the number 
> of PA bits when setting Stage 2 address translation.
> I might mistake, but what we currently have on Arm is "ipa_bits == 
> pa_bits". So, this means that information we need at the toolstack side 
> isn't really arch-specific and
> we could probably avoid introducing arch-specific sub-struct by suitable 
> renaming the field (pa_bits, paddr_bits, whatever).
> 
> We could even name the field as hap_paddr_bits. Although, I don't know 
> whether the hap_* is purely x86-ism, but I see there are several 
> mentions in the common code (hap_pt_share, use_hap_pt, etc). Any 
> suggestions?

Well, HAP or not - there is going to be a limit to a guest's
address bits. So I don't see why it would matter whether HAP is
an x86-specific term. If you wanted to express the guest nature
and distinguish it from "paddr_bits", how about "gaddr_bits" or
"gpaddr_bits"?

Jan


