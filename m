Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F142BFCD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208349.364443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madGG-0006uM-D4; Wed, 13 Oct 2021 12:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208349.364443; Wed, 13 Oct 2021 12:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madGG-0006rB-8j; Wed, 13 Oct 2021 12:21:32 +0000
Received: by outflank-mailman (input) for mailman id 208349;
 Wed, 13 Oct 2021 12:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1madGE-0006r0-Q1
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:21:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c9740a5-8900-4060-b814-16501f450c43;
 Wed, 13 Oct 2021 12:21:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-IdhWJ55CMWK9aXVS3JGELw-1; Wed, 13 Oct 2021 14:21:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 12:21:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 12:21:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0086.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.26 via Frontend Transport; Wed, 13 Oct 2021 12:21:23 +0000
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
X-Inumbo-ID: 5c9740a5-8900-4060-b814-16501f450c43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634127688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/syMxzoUxIqbyCmc8IhtwqOjBQKNvck9LFDbtkJdXQA=;
	b=lhE0Dh0WkUBqBin6hLGVVHKVSlIK0rtz5gUgHyz4h6m2fc21Ju3+Qbhe2xk92DqgmURqJQ
	1EfLn7mPeDe/XrY8r16dHyXTEZeo4bXBmZ5Rcd2dAA4XOFQBEhFMZtIrZZn8HCed2YqBhM
	71d75B5ZYM6SY1AtuztlhTZK09mY0KQ=
X-MC-Unique: IdhWJ55CMWK9aXVS3JGELw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv4w+qSi7g2ktbymsPj29PlrbphbKpMjhN8KE8lfdLzwPHjwu4o3OUVY3GRWU/PfLI/cjbyq/834wznP7ju4a+zk12jENeQhUkFmSFbooZR/quSxC0K0EcMOBZsjgqH0vrO+0UufCGjvRUDjNZjYL9rbH2cIcb/9JAs/QL5zOHLbTFTyaKbn6kYu08jf4Jkw3QQ/2KtLafchXwI/glV/QKJmPj8X5HA9Rx2Nsn6Vl+TctCacASDagXhr9wI3fQ2KadrCk/SSCE/4E6EtZ+8jNNGZvb8OxKLccov/ql+qRjTctPaot7lYbsGcK8RKYMxBoEbh3nv0AyIOOGhwea1k6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/syMxzoUxIqbyCmc8IhtwqOjBQKNvck9LFDbtkJdXQA=;
 b=LB5XJeHTNp37c8Lt8Ckhk4W0J4yJ6frmp/uiNell0rkuvaSg7+FDvjz5VCwl8MzQ4BByUmfPyc+QeTcVjal1g0Kc5/lgEdCEX4T9Kv2/fIz3F9oQjGB4Ll4QB8TEyi8PNNQOuSGFWQ7NspUpzhv5aXkw0tGjC48gvrKqAhs6LddscFf3JDXdcT5rSP6aHmVEM6Ft0ywgdr0QLaKTPaleVXeRaWs99L73iUMMkv0OZNNERFJN4mSjW4OPX9YF80mBHCb6hRnXfLyAXVA3EE0VvYDMx+p56jIR5c+mDdlKKnA9ZKeC1gxnaSZd8fmW7JEAqa1ufuy862e96WDfjiEx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
 <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
 <alpine.DEB.2.21.2110111105180.25528@sstabellini-ThinkPad-T480s>
 <2fa4d2e2-7daf-6d52-ff4c-38a482af1fb9@suse.com>
 <alpine.DEB.2.21.2110121436020.9408@sstabellini-ThinkPad-T480s>
 <f15de716-4c4f-47b8-b6ba-ea549c61369c@suse.com>
 <DDD004E5-E8E7-485A-9FDE-298744C32DDE@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f86ad1d-040d-230c-14cd-25f606a47bca@suse.com>
Date: Wed, 13 Oct 2021 14:21:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <DDD004E5-E8E7-485A-9FDE-298744C32DDE@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0086.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e329b0-3d70-4485-9484-08d98e43f983
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53280934AAE6C84FC2AC0BF7B3B79@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EFcqFeXEYCq2BIhbD6fEF0B5n7RXiu1CwUWZYMT4F7lICuRJRfYVsrjUB2vDqLeZCgNQgv5+/7TcmzoXBK63j2CBB3JG5d2zam7gCFK+BqoLDRSKTRgKpYqE815/otyQvm6EB8qFLHJkwvpWMpzuQeezpJmP6DBEtvJ3bb2fAcspCQElbFcHVFV2l+87AkiDV/WoxCrLrWkoqYOsU8HTJ9Q0XzpXCrJ9V/oWVWWP6bqye5riiCngdymAj0h4d4eB8GjdJvodwEF8RNUQxvhqO9B/3Q2dJolAXPRHSI2KCT3PBjBtJLD7y2y1+mKVF43kEx4cq2grqUf4CQCGPro7Fuc9BBs7GenfmbAo2UCKE7M6VFKwQqzqrRJ8DgortypG7bnljNXtTFUy4a2FJ/oL9/KzxmDApqIKpSLRwgB+5RvvSeeR1Kc/kkip2VsCMB4ZwKSHEX6zhToL2fy2/S4QhbyQNK3lAmh5bWGSPF9PELKOgiutCVSq2mOfCFlShA9YnIzhRACT76ZGUL4PNIqBGBk1xJEU8JCmDmmpfpo/kD+MieRjtsX4I9gtlLBBcWVD08905gKV6oMmsevqyi5N2gLPOD1pKPmIS0s2ITNE3kJAjpm7uhqh49wIgDYrTweVPUBCq6QUITg3Ymm1b78/g+L0shpaYZ2KdSlfoopaK5oK6Edk/gQl5s+FMnkmgO9P/7jJOike31JQwdKKILJsvYRvZ1NH8FDzWErTEJeuoEo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(2616005)(956004)(8676002)(186003)(31696002)(7416002)(86362001)(5660300002)(31686004)(66946007)(53546011)(36756003)(26005)(8936002)(38100700002)(316002)(4326008)(6916009)(2906002)(16576012)(508600001)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmVZSmRwQWxwZitYYXVSVW1wYVdyNlhmdG1yZ2JvZVFJeWdhYlB0YTMyZUQr?=
 =?utf-8?B?Y2xTYTNlUlppMVozWWdmbjNBSStZUHpwNDdiUHdCdVM0TVNhTytwQXBkQWNv?=
 =?utf-8?B?dlhIRER4MUhrQ24rVGFSNm43amc1dHFYd096K0tnMWVOb3cyMkdUUkFpZlpR?=
 =?utf-8?B?KzZNeDRvU3VPcjh3b29tM0g3OHVXSDlJdmxpbTZtNkFTUEx6aThJRG1zM3pn?=
 =?utf-8?B?SkJuMTV5cVVEWDlJblRQaFNRV0xldVg1bWNVZEQyUTJaR1lKQ29HOWw1Qlh3?=
 =?utf-8?B?VjBxeXBEWC9zU2xRZ1lzTGlqU0ZaZEtDTDRyVkxIWHNCVTBUREx0QUh2a0JT?=
 =?utf-8?B?UHZ3VUdHcmJSSW1WK1NDTDV2RXdzWU5oRzZxd1JoTmdVaXMrdE5IU3BEcEp0?=
 =?utf-8?B?Z2JadGVXYkdLSmIzL2pVa0xMcGNKVlpuc0s0Q2h6Q0YxSDhKLzVLNnlyeXYx?=
 =?utf-8?B?WGlXQU1oc1VHK2o4c1R4S2M3RUdSN1BBYkRqR095bm81dURrSUExcVYrdFFl?=
 =?utf-8?B?R2o2VW1mS2lCVGVJYU90WHlUMkQvUENwMVdvUGhSUnRmSitJdTRsRHovdVhE?=
 =?utf-8?B?TUdiSEZ6bmU1Q2krQmhETG83L3N3WllTOWdWK2YraDczcm14NlVOVW9halpm?=
 =?utf-8?B?L2NoaTh4dXhiL1R0VzdYRmZ0c2ZTcS8xM3pOc091cWEyaXpCMnZGN0dnY1F0?=
 =?utf-8?B?c3JmWVpLTjZ1ME0rSUVWT09ndlpOZ2hHL002UWUyeU9JV1pnZzRZTUszRHda?=
 =?utf-8?B?Qmg2QnA0Z2hTWjRVSzNrb2VnTWFGbmN5djdIWmoyWUpkdWJFcnhQTmhhVkNM?=
 =?utf-8?B?YkYvaFBSZk1lQXNKc0ZzZFN0MjAvdEpNNS9TQkVwU3BVaEE1TkQyenA0aEha?=
 =?utf-8?B?S1Z1RWVLa1NmV1pOT0pEMVUydklxUjJjL2FuQTNEU3dZZGlYQUpwZVVXTXFv?=
 =?utf-8?B?WENlM0ZNU1Q4TlV1bUt1Z2I2T2FuMmg3Rm9JK1oraXBBUFBNTG4vd0svV0hB?=
 =?utf-8?B?MzhQeEdFR21XTXByenM5c3RLcEorWmNvNWcyRTVSUXJDcXpSc1B6NzVNbGVz?=
 =?utf-8?B?VnpRN3FQZXpycGUzTGJ3dTBISlo0dStUWXk5cXdiY3lPd1ZQdy95ckVTRDZ5?=
 =?utf-8?B?aVBlVjdGNUphaFB3cDJUeUphdXpkbU52cHkyRHRGNVp1VUF2S2dDbGVLMi92?=
 =?utf-8?B?YUxDOUlHbVc3WVpSN1VuRm50NFlqYTJQZE1GZkZFdkdBdCt2MEprZURHY2Nv?=
 =?utf-8?B?VnAzcGJyNGtkeEhJUm56TjZsQllsRWJUR0lxR3kzVTNFdnhETmdYUmZrVHFY?=
 =?utf-8?B?VERLVHhodlQ0TVRzVGJyVzNoVGVlMXl4TFJ1dG9jYW9SaVJQZ0pLLzFQRG5S?=
 =?utf-8?B?dFpBZkV2WFFQT3QvaFZTREpGZkoxaGVMUjU4YmE5UUY5YktvZHFpUEUzdytN?=
 =?utf-8?B?NGxSMXRSdCtaOCtVOWVXK01wLzQ1cTdacE94aDdCRnRnck1NdC9IaWxZTm56?=
 =?utf-8?B?cXk3WmJxNTZqSDJ5TlZqNmdYVmpIWVRyU1RzdGZXVE5WSkxvS3pId20wY094?=
 =?utf-8?B?bWU5Wkx5SEtFMG5nbThaNld5eDhKSVNwNTVFTUNWNVcxaHF2K0dmSEx2c2Uv?=
 =?utf-8?B?YzdDa1MyN2lIMkI5cDlmMEkvM1poZnFIRFA1VE96UEkzd3VsR1NMQ1dmbkZK?=
 =?utf-8?B?WExyODE1eVJHNzVFeVljTWQ0R0EvUDBnRE9DTVZnNUlmSHpmM0ZpeTJWVDJB?=
 =?utf-8?Q?CSqHbVSLY4gIE15SzMPoFszriRlM/vl9bCpWr9l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e329b0-3d70-4485-9484-08d98e43f983
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:21:25.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ayssO1JBjqnDTdfWTDD+VFhb21pHWZRSXNO8/0oMt5lU/4qIw0MCWcOapjIg8SpNoK/rQpggcTegp62PDC8Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 13.10.2021 12:02, Bertrand Marquis wrote:
>> On 13 Oct 2021, at 07:10, Jan Beulich <jbeulich@suse.com> wrote:
>> On 12.10.2021 23:37, Stefano Stabellini wrote:
>>> Good point about MSIs not being setup before the traps. We should remove
>>> the call to pci_cleanup_msi() in the error path then.
>>
>> Your reply makes me fear you didn't pay enough attention to the "partial"
>> in my earlier reply. The traps for the various registers can't all be set
>> up atomically, so there may be a transient period where enough traps are
>> already in place for a cunning guest to arrange for setup. Unless, as
>> said, there are further setup steps needed before a guest could succeed
>> in doing so.
>>
>> But even if partial trap setup alone was sufficient, I think the cleaning
>> up of MSI then might still better go on the error path there than on that
>> of pci_add_device().
> 
> I think I should put the msi_cleanup in the exit path if pdev is not null but
> we got a non null ret (in an else if ( pdev ) ).
> This would cover all exit paths, especially as I will move the add_handler
> before the iommu init.
> 
> Would that be ok for everyone ?

Sounds reasonable at the first glance.

Jan


