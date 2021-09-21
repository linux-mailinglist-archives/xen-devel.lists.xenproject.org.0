Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C91412FFA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 10:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191542.341616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSasC-0004Pi-BN; Tue, 21 Sep 2021 08:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191542.341616; Tue, 21 Sep 2021 08:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSasC-0004N1-8C; Tue, 21 Sep 2021 08:11:28 +0000
Received: by outflank-mailman (input) for mailman id 191542;
 Tue, 21 Sep 2021 08:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSasA-0004Mv-NS
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 08:11:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4a795c9-52f3-4ff7-8e0e-b243856d2543;
 Tue, 21 Sep 2021 08:11:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-IIj35TnaO_GnjHAXRa2YKg-2; Tue, 21 Sep 2021 10:11:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 08:11:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 08:11:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0227.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 08:11:17 +0000
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
X-Inumbo-ID: f4a795c9-52f3-4ff7-8e0e-b243856d2543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632211884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q4DEfjy8i3majxxWRX69gfYnq7AfsHgE+0qIFCaUyk8=;
	b=E+aqtBhVIddgLXym5o/krGWW7RMR/bMXherR1Xa6Quao49L56XTquqYmbivgg6ezE0skjz
	upIcYY7BwZQQWQbW4SHaJn757M+7gXbpWVwqtU23LOwKTKTkfGbTnQ4ic+/6IYTFqLItVf
	GOBtpjy5bFhkIai+7SKj+wWmntpnKZk=
X-MC-Unique: IIj35TnaO_GnjHAXRa2YKg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3eWvomNzQPz7UInTvPpt3TV8/uUKAvkBiQ7CINIEAiaQ9zHM7pDU7NViFRwFrxR/8P1bzUngGTM7HIQnjH3IYbkXhx8gBhBGkCgP2N9//cC5hrYYKGBztho66FP3Nw4N7thMUReCK379HCxgWxiJJn4HhMOd9cE50Qh9OckS7PsG5RGYEL5UMDrcBc848K7fNcjUTruKoMp760wEQmK8JeeRErBUlyaA82Xy/gNKskfYVkkxbMQqcRdEHmC6ONzKPztIXkU5nsHZ+tHEEKjgzrH7xWbRvMNEn6Z1JB+FV8yR/wXgYOh7UPc9EVaPafiV6nqwgaolwwiGXG0FIclFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=q4DEfjy8i3majxxWRX69gfYnq7AfsHgE+0qIFCaUyk8=;
 b=C1BJ6PquMPSCR9wReG3akAIduEsN4m2GWuzOXyXy9xdMpRxytGOisxsD+eytzYKUs3Bk6R45aU4m3mmjxkTVaNX6WTKW4mq1H7lztdbK/9HzNTV9HnNGiGaVNe7nKBX1JI0mwhPTv8nyz5BK3JYnemb7UenNGXJoxny1FadhNNe/7n2meULrwoNangnw8ebRyBRSI/bB83JYepsuL4BqPFQaEidIm43NOugdks1yFeQOoMU19bqxnTVbcIupSU084/V3IuTQayYQ9RJapVMtvDiZIi3ZowIz8qomPf45BrnhviCA3udrrBdcn6s4Zfe166tUSlH63bLPsm2ByXpFDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/xen: remove unneeded preempt_disable() from
 xen_irq_enable()
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20210921070226.32021-1-jgross@suse.com>
 <99e6cf1d-ce6a-83e5-2e43-12f6c1a89f3f@suse.com>
 <599f4e20-a25d-6cd0-ced5-f2deaf997535@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6305dfb1-15bc-ce4b-cbf7-d44ef5c0456d@suse.com>
Date: Tue, 21 Sep 2021 10:11:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <599f4e20-a25d-6cd0-ced5-f2deaf997535@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0227.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d6095ff-2796-4f89-e21e-08d97cd76398
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71525C5F1FD42250C1EA80C5B3A19@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ojROy3FgOMDxO6SI1kQi8nnpzENpcLinDsQpSlt9VGleDHJAkq4rZPkYpDFqGJQuE2+crXxoY2uyaKLr0N1D1D51uBQnQ0p9FIK4UaUS+gGDwyZD3zILEdzgWa7NouMHzqL9tBnHKkCG4/zAANj9mtvXBtcGy6NPti1KzXFIpoe9brP73gPamfEJd1PvTBdzu3TAcIcq1KjCtPfm1xLPAKpf4suwF9P6pSDYmyO7od6Uh1fn5917QkxFpDQvw+ITvHwc/UsMR0XbKKZceJay81vHYKxbDnuRG7IB7O3R2OCx2FKkHWEvuHsWeUeA+jNrAWK/yeFOr5u/bwgZsiMmQMpdzFqa75zBKolz/bPSQJ7BbBmX3uiWLWt/dnYy4LOHzoIKPtEiRIH7u4fKFrbWKxRNgDRGuo7GrWmz8XH4vAeWbdH0jbb8jPiSXDrPwGHcmhKRfdhy6rXoLhTOiZho0IH1uPV4/kYStnQATlitdoBAtC610Wluh3grPxe1Rv1C/CKL7djzWaxiEg7bHqB1PEpul5vnKCzn+hsZNLNwoKwcY5uF+wrfAMP089DhPU1nTkMhkwBlevSebs/1XTbtVEySMi87T9MuaNy7HnuR1ge5SjwQaoHzI99k5+uA1mzlKBbNYzrhnNsJEU06UcAgN0SZMuFyp2jznlcTh1xxLzc7QyZjpNSh8CNjiM+5YP1IkWPqVHC7u2+1QOsxHoa8MNPddijOvcilo+bDeS7CuYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6636002)(16576012)(31686004)(37006003)(54906003)(316002)(38100700002)(6486002)(2906002)(83380400001)(26005)(36756003)(8936002)(186003)(6862004)(53546011)(4326008)(2616005)(31696002)(956004)(86362001)(66946007)(66556008)(66476007)(508600001)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JDYzlvbEJDMHZNNVFzWTZLYkpFNk5VbDNIWmpmRk5BUVhCYld1SGNiSDd4?=
 =?utf-8?B?bFNlRE13K2VLL3JGNjd5bjYvYjJBbm9CS2gzSHp1cXl4WmIzNmxDV1doTTEr?=
 =?utf-8?B?bGVCTjFSVWJCbk1xN3FhR1poT0ttZEk4Ylh2TFhvS0xvZzJ0YUNaSDBSemc0?=
 =?utf-8?B?ZDlqR1VYWjFPMTRYT0M5ZDRxZ3NaOXdoUVBNbFFaNXI0RmFZekNhY0RiamdH?=
 =?utf-8?B?N29GNUtHSk9pR3ZrVkNDQnA2dVhNdi8vMFZLK0RpZXR1dTdBMFI5cHIyNXRq?=
 =?utf-8?B?Tnk1eWxoa3RtTXExVVIwRjFoUnJRaUpKVDQydUlJNUNqRGNrQ3B1OFF1eDF5?=
 =?utf-8?B?V3lhYVVPRWk0MldpRDdyNVhZWTM0ay9OUnlFYW5mbkxVN0Q1aXlPeU00V2xB?=
 =?utf-8?B?NUlEbW1pUXVES1dtWTUvMWFjeVU5aWpIYy8xaC9qTlBvd1NxejlzdW81L2tM?=
 =?utf-8?B?TlZqUC9pdytYWWQxaGt4VmlCNUFEdVdacVZNU3p1eHVYZnRqRFdSbmZYSDRO?=
 =?utf-8?B?Ui95amdUQ3VWUXc4ZjNHWlJaOHdKbEp2L1FocEZFT3hBc1ZSNGlrN01sZlc0?=
 =?utf-8?B?bm9ZeWdQZTB2bWtrbk1KUmhRbW01M1REblJBclZ4MDZsMGFiWUo1SCt0cmE4?=
 =?utf-8?B?MU5mRGhxRk9yTmpYSnlpaCtXZnAyeld4czBjNXBML2tHWU9DMnlqM0VFQmww?=
 =?utf-8?B?cGRsWmlBZWhEaTRkNk0ydjQzZUZ0ckRUY3lkMWErWU9xdHE4dkhNUmFVK0lS?=
 =?utf-8?B?NkU1T3JtbmUySFJqeG5PdXozUjJ0U2xJa21DVEtHUFgzMVR0d2pFa25BT3Av?=
 =?utf-8?B?TkYvSjZubUxMUDE3QWRCamg0bWZVTERCVGV4RkdpTkM2SHhBREFEVlRRc1B5?=
 =?utf-8?B?Nk8wZlVwUERoUzE4TWxEdDhhSWtya0VFRzVuY25sV2tTZk11UGJoZWZtOUZL?=
 =?utf-8?B?dkc5Mzd4MTAreEdSU2FXTTlYalptK2FyVUlTMFNqaUVPRzIyTkRsT1lNN1V0?=
 =?utf-8?B?emRPRk9seVdMVUxlMkFnUTUzQkNDYlF4TW5SalZkSWV3bXVxUU1xN1cwc1Zy?=
 =?utf-8?B?TXVPSzIwa2xIM1hrOEg4c1JzRXZnVGMwb3pxVHBYeFdxMkVIQzdUMWMwbVdT?=
 =?utf-8?B?MnhUR3NYWERZYy9XelR6WjdlczAwcDZzZ2p2Z1paVFNuYTFhQkxmQTRmNzdM?=
 =?utf-8?B?bmJlVkNUMlpwbFpqRVhuTk93N29OYWlqR3A0cEVISlBwU2ViK2grdFhZbE5W?=
 =?utf-8?B?UVlRMWdFWlRHLzh6TXJzeWZ2aVg1Q2txZXB1U3ZWaVBMOEtLQm9GT1BvSkRY?=
 =?utf-8?B?VENqYjdZd2E2S3lvclBVbGp5WXdmQ0Fpc2g3MktRNlJERm53ZkdRb2hQYVhP?=
 =?utf-8?B?aFpXM1lwbzczdWd0UWJwZHVGN1JHUndNR1Vud0pHY2FvYWd3bEVjbjFlU0tR?=
 =?utf-8?B?ajdXTmtUNllTSnA2UHlVTkpPN0kvOWtleEdvVkJtYzZabUpZZlE1dnlSQ0tT?=
 =?utf-8?B?Vy80WkpGN1dTSXIxU29hSG9yVHlFUDhBNXFKS0hxYmo2amtKQjIxTmVjLzBB?=
 =?utf-8?B?MEp6NDV6dGMvSDZMdWJMSW1OQUVMVDV0RmdUQ1NGSWQ5T0Z6U1lEVFAxdFpz?=
 =?utf-8?B?RFFud1RhMWJYc1N2SDdrM3dPL1pZWmhHekZLc1BWakl2U000OUFRU0h0U2dZ?=
 =?utf-8?B?ekVnakozMGo1QUltdGdTTnU2cXVxN1FDWmlvOFRDMTNYTGQ2eE01aHluSUE3?=
 =?utf-8?Q?H8uyPgvi4Hv7x6xKV64Tt/I0zbjA8f1Cu6aIyfU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6095ff-2796-4f89-e21e-08d97cd76398
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 08:11:18.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwE+hrgPnN352yJ+5qQVGcWkSy3VpA+m4sZxPvB5p9MSnyqViZ9i1ZJtPsiY9zICex1ZxuJR4LIfyoXKxrfbkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 21.09.2021 09:58, Juergen Gross wrote:
> On 21.09.21 09:53, Jan Beulich wrote:
>> On 21.09.2021 09:02, Juergen Gross wrote:
>>> --- a/arch/x86/xen/irq.c
>>> +++ b/arch/x86/xen/irq.c
>>> @@ -57,24 +57,20 @@ asmlinkage __visible void xen_irq_enable(void)
>>>   {
>>>   	struct vcpu_info *vcpu;
>>>   
>>> -	/*
>>> -	 * We may be preempted as soon as vcpu->evtchn_upcall_mask is
>>> -	 * cleared, so disable preemption to ensure we check for
>>> -	 * events on the VCPU we are still running on.
>>> -	 */
>>> -	preempt_disable();
>>> -
>>>   	vcpu = this_cpu_read(xen_vcpu);
>>>   	vcpu->evtchn_upcall_mask = 0;
>>>   
>>> -	/* Doesn't matter if we get preempted here, because any
>>> -	   pending event will get dealt with anyway. */
>>> +	/*
>>> +	 * Now preemption could happen, but this is only possible if an event
>>> +	 * was handled, so missing an event due to preemption is not
>>> +	 * possible at all.
>>> +	 * The worst possible case is to be preempted and then check events
>>> +	 * pending on the old vcpu, but this is not problematic.
>>> +	 */
>>
>> I agree this isn't problematic from a functional perspective, but ...
>>
>>>   	barrier(); /* unmask then check (avoid races) */
>>>   	if (unlikely(vcpu->evtchn_upcall_pending))
>>>   		xen_force_evtchn_callback();
>>
>> ... is a stray call here cheaper than ...
>>
>>> -
>>> -	preempt_enable();
>>
>> ... the preempt_{dis,en}able() pair?
> 
> The question is if a stray call in case of preemption (very unlikely)
> is cheaper than the preempt_{dis|en}able() pair on each IRQ enabling.
> 
> I'm quite sure removing the preempt_*() calls will be a net benefit.

Well, yes, I agree. It would have been nice if the description pointed
out the fact that preemption kicking in precisely here is very unlikely.
But perhaps that's considered rather obvious ... The issue I'm having
is with the prior comments: They indicated that preemption happening
before the "pending" check would be okay, _despite_ the
preempt_{dis,en}able() pair. One could view this as an indication that
this pair was put there for another reason (e.g. to avoid the stray
calls). But it may of course also be that the comment simply was stale.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


