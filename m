Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8238E412FC7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191482.341529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSab4-0005OY-FW; Tue, 21 Sep 2021 07:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191482.341529; Tue, 21 Sep 2021 07:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSab4-0005Lm-AH; Tue, 21 Sep 2021 07:53:46 +0000
Received: by outflank-mailman (input) for mailman id 191482;
 Tue, 21 Sep 2021 07:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSab2-0005Lg-PU
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:53:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 377793ac-e0ba-4f04-8a61-2163daaf85d4;
 Tue, 21 Sep 2021 07:53:43 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-Tb2tPBaVMdSP0NQvFO7ckQ-1; Tue, 21 Sep 2021 09:53:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 07:53:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:53:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0113.eurprd02.prod.outlook.com (2603:10a6:20b:28c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Tue, 21 Sep 2021 07:53:38 +0000
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
X-Inumbo-ID: 377793ac-e0ba-4f04-8a61-2163daaf85d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632210822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+tEN8D5GCwudAasmF+KAlvekOlZNbe3X9JtFJBl+DU=;
	b=kt+7UacLFVFKe9LU2dFDnpw4Av2Okqb6wtoZ9ofzcOl9WgzFgJX/w3PpC7l56cyBei6ckA
	Jei+W0Ldvqc712azp2HKVQ3giy0uSfHR0AtNpsisskHolHMdB9YwcoR+wZrBh8qOlP1uK4
	bJRHfAEQ3THdwxi+ikq1ztk85TTc4bE=
X-MC-Unique: Tb2tPBaVMdSP0NQvFO7ckQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkvOOV642MgBjfJJd1M5tXX1mQS5mU2yXyScRHJlJ0VS7jiXE+8UiKV1ldsdK5gUX0YkSxWEt9I7eCR7C7lPCZMsfwVXE5bQI20KLANVk7yyM/4nNBWmtqbQZJDGjKOw/JcRYpe9qYYLcJnKDymifjbyGXHR4inDaeSlX8tGoKOygk5jkEOdLdGxOGZhh2ICqt646X+Y8v9awriStSqbtHpcZpdgOl7yLrvfH7biIKUHQg/UJl7Ja1/KaxvGWT6sKJD9lk/lIwcwiK5OxsWMjF1ZeAff785F+hZLUGraiGYsSIamEJvWil49cA60EsJSTJI6abzLSxjVs5/ymmBV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=x+tEN8D5GCwudAasmF+KAlvekOlZNbe3X9JtFJBl+DU=;
 b=jXbJK9TDe4pSKn2BFPtIwflx1P6Mvd+X9EqsfBc/gS8IRmQAEBydT1Lb3iWwYFLa3Ssz3c2TYXbF7Bu6MB21BEc+c0Gy6M/jc25RbTqwWmQtftvo94bLSfM5bwnMfktU8mlX84h2VeknW1qxyZIgie7ECt2GUk0t2QFsjFmZXBIHe7reBHsx568UNn/Yaf412iRWiP+F7p+Kg98Jsm08j2Pr/4bLw84Be6iCLM0r/jO8+2S6tSVp5tDOGP4DGmPA/2PaPUIQqeLahjyixBZ7c1mcMINKtQA658tVuqlKjabdjAKDuNhFaIk4xV9IKrL17Lj0Goc7EhdzlBqN0mdiqg==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99e6cf1d-ce6a-83e5-2e43-12f6c1a89f3f@suse.com>
Date: Tue, 21 Sep 2021 09:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210921070226.32021-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0113.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da6b922-2679-47b8-5df9-08d97cd4eccf
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617656AEC198E6C4F5932FC7B3A19@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zH7Kl1Jv4tCQF8p34gML8wlj6etEc+soqyZSRJH2F3FJgZp3XEqmKGPar43sh+6UM/D4RB864Gf9iNpFyykzqoc1KZpUYy7lEw3BwQUnDktVUdj+I9mOPa0mWZMdO5JT1KQi4pM/Or1aD4DHaEj2QiUbjSppGR/Oi6JvPGoDwOerob92S2a8+7q4ktnuW3Ry6Tu1v0kv7PYvYXU/3sKzdfSwSHLyEi3hF8d0YZeAtXKjeHSuIsw+mOJs+2uDMNY+xAzp/CoHOPjiSTt9mk4PRVubMtsIYEkZp6m1zKT5HufsSMpYQqiFRdrw6r5nFcNFpVCdUidmX/Jv8jw8JDUJ8eo1DAfTc8Y0lJSrD63rbhJRsEjTEnIShDeS1TG44ohE3qfwWbTbZhj0ExE+FOWTp45S+33c4RGyYtJu7BLQXwzRw2WBtQGBpo00zynGlXodBWWCv7sFhsgkn2h6prmRAVzm4CYgGj9RUe4BrV+cvHLFAcLwvCk9SWNQI0UvCCbLp0w71Tl3BmdlCZnHw6LjBUtVn24CTEA7xySeHmAGnquXCrOMGrkqv7CihF2QAkzzARPL/RdOi3+nvpy8P2vaJfY9fWXdKLPGzBIxMsFIOiepwkifgRybSeTWE4Vl2EZL3R9zBkOcEiqAm5zhH9CzEW75brPMLBkWJ4hbBYtlJg6rEFY/MWA8ycW1rFru3gJH4As4R9Us9Fi7CSiF/09hXTfXplT6K1NiyEL3p4tPi+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(4326008)(36756003)(2906002)(6862004)(38100700002)(8936002)(5660300002)(86362001)(37006003)(6636002)(8676002)(6486002)(53546011)(54906003)(316002)(16576012)(31686004)(66946007)(186003)(508600001)(66556008)(66476007)(956004)(2616005)(83380400001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG9nQTVHL2k1L2R0SzNJb2s1SWVBbE9hRTJUNVlLdDVjNXBydzliRUQvNkNU?=
 =?utf-8?B?Z0pqOFJlN2t3UHVrelNLV0Zzc1daZ20vVVhXZlJ0UlkvalJkamVMVHV1dVd1?=
 =?utf-8?B?WHk1Y0pha0E4bEJabUF5SFcvbTB6bEwwMlVpMkE1SGRDMENqcVVkUTdDc3V1?=
 =?utf-8?B?ZEE1L0ZVNmlCMVBoZzlUVjRQTGY4SysvaS9MK0d5eUV1Q2MyR2o5SGwzVFN0?=
 =?utf-8?B?WDRIYlBpRVVjUzRIeEZBd3oyZUNrL1VsL2xhVDZoYkZQWENiOG9mME9qTHNF?=
 =?utf-8?B?bVhYdHdCc2RWMWVxN1lHdGlOb2VLclFXMHUvbytGTThKVklqMXRRM3F1eTZn?=
 =?utf-8?B?S3pwQ0I5d250UU1ZVUJxTldPckNqc0VtVWVhSjRsckF1N1lJay9zRjR5SDEx?=
 =?utf-8?B?aTBsTG5WazBEa0V6cm5sYktWa1U4MGdBTmQyT1plclF4emZWLzMrVkdMbWpi?=
 =?utf-8?B?TmdBVU5lcFo5ZXJHbEJUZUdvdjEwc0tyUllzQnVHSTNTcFJPVlI5dDRvMXU2?=
 =?utf-8?B?UlkrZW05TEZlVUNTQ1d3UHdpTDNnNjJINWVTNjRsK1MvVm1HdG5oc09pM0JK?=
 =?utf-8?B?WWZyZlNndnBJOGgrV1ZPVTNkbmxQZ0syMUZTeW9HWjg1ZVdHUmFIcEhIWHhE?=
 =?utf-8?B?ZWE0R3dydHo1dmFnOVpkd1M5SzZoWk9Vb3cybU9yZ1p3aWhUUythT2x5VndR?=
 =?utf-8?B?Sk5lVEYyekl1N1BvekZvQ1UwWWtCMmJ6YmFGZG9KbTJHblFjNXBqbHRja2FQ?=
 =?utf-8?B?blU4Rjh3bjBtTHhkb3B4Qld5MmhqVUZTRkdGK0tRRnAzNllmUjlQK2cvTFFu?=
 =?utf-8?B?Q0xXdHN0aC9RMmI3NFRvc2dRbS9HNHMzTzVML0dUdE9Qbkc2SGJCNk5zWWty?=
 =?utf-8?B?RlVHMzFqdmRGT2lTYnJIMVNUeC9RQTZvNnlvSmozSmQ4cDh6L0l2azFHT2hh?=
 =?utf-8?B?b2NxRDFhRitrSW1FQ2NzRUxsYmdnT3VyWlVCUldvdVdWNktFT1A5MUZrUkJR?=
 =?utf-8?B?czAreWl4SHVPTjk4d0VUbStJTUlwWFVHV3Y1K2NWYURyUDZwWXZsRjhTdmpT?=
 =?utf-8?B?M1JXQ0xTcXcybENXU2dwMEFqbmF6UWNGYUk2aEJRRnp0ak56Z1RmOUpBejJB?=
 =?utf-8?B?a0dOeGxFSmxIUEhHRFJhTkIwTFhoYXBZVnUzaHJYYUtsQThQVmxFVUhtTGRa?=
 =?utf-8?B?RG55eFFkNTRQcmdTejdaNVRoSTgxSzlUWUVwQkhpYm1IenNPdzRlMEc2dE1R?=
 =?utf-8?B?dDhDSXcxdmZ5S2FweHlNVjF4YnNWcWZ1ZUpqY2lIUFZxTlQ2bFRmbHpUcFNX?=
 =?utf-8?B?NDBkOVVaZmdOM3V4ZWFEVDdxSUxUY1AxZUpGdXh2VjIya3FTa3R5dHNTMnAz?=
 =?utf-8?B?ZEFWZlcrMUFGWG5NbnJQUUYzelBrNmR5a3l3T0R2em51UFM5OEhCRURkMzVZ?=
 =?utf-8?B?aGdmYW5ySkdHVzI0TUVFYmx2ak5SZVBQTmgrWkFWeHluVStGTzB6VmR5c2tk?=
 =?utf-8?B?MFkwQU5xRy9sS3NZUVFSVjY1S3V1NXBuQ3RtWFpOREVlTFJheE9RVk1iellN?=
 =?utf-8?B?U3pMbVJiVXlNMThwVEJqZmV2MUVESmIzQ1I0a0xMQ0t6dzVBb1A4TlRIODM4?=
 =?utf-8?B?aGY5enVpbHI5RUJkNEswY0N1Y3Q3NFF6ZnloZUx4ZUpkUGtWMlhLVkRicTF1?=
 =?utf-8?B?VVBoUTZBa3pMMEVPczJURjFVSlIrbnJjb0hjZ0NKU1FvSlp6Q3hTb3M4WUVY?=
 =?utf-8?Q?+Thz10xf2rFc310/nwuM0hA3zXmqyjS8iXYiBF2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da6b922-2679-47b8-5df9-08d97cd4eccf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:53:39.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKRDiSHa8a2Gm0WfbdtojdwkXs4PzHNGkFSE4sxd4acePbZmbhFhDIG3Zy1lU3lNUqfopuOdWLL1A7uld0vWMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 21.09.2021 09:02, Juergen Gross wrote:
> --- a/arch/x86/xen/irq.c
> +++ b/arch/x86/xen/irq.c
> @@ -57,24 +57,20 @@ asmlinkage __visible void xen_irq_enable(void)
>  {
>  	struct vcpu_info *vcpu;
>  
> -	/*
> -	 * We may be preempted as soon as vcpu->evtchn_upcall_mask is
> -	 * cleared, so disable preemption to ensure we check for
> -	 * events on the VCPU we are still running on.
> -	 */
> -	preempt_disable();
> -
>  	vcpu = this_cpu_read(xen_vcpu);
>  	vcpu->evtchn_upcall_mask = 0;
>  
> -	/* Doesn't matter if we get preempted here, because any
> -	   pending event will get dealt with anyway. */
> +	/*
> +	 * Now preemption could happen, but this is only possible if an event
> +	 * was handled, so missing an event due to preemption is not
> +	 * possible at all.
> +	 * The worst possible case is to be preempted and then check events
> +	 * pending on the old vcpu, but this is not problematic.
> +	 */

I agree this isn't problematic from a functional perspective, but ...

>  	barrier(); /* unmask then check (avoid races) */
>  	if (unlikely(vcpu->evtchn_upcall_pending))
>  		xen_force_evtchn_callback();

... is a stray call here cheaper than ...

> -
> -	preempt_enable();

... the preempt_{dis,en}able() pair?

Jan


