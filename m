Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJtNIPZ++GmHwAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 13:11:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4C4BC39C
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 13:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299702.1574254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJrD7-0004Gi-RB; Mon, 04 May 2026 11:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299702.1574254; Mon, 04 May 2026 11:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJrD7-0004Ec-OP; Mon, 04 May 2026 11:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1299702;
 Mon, 04 May 2026 11:11:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJrD6-0004EU-Py
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:11:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJrD6-008du0-5K
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:11:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f87edb-e002-0a2a0a5209dd-0a2a45019314-18
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 13:11:36 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f87ee7-c1f2-0a2a45010019-d1558030c577-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 13:11:36 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so19585905e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 04:11:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fee325asm94758735e9.7.2026.05.04.04.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 04:11:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777893095; x=1778497895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hlCTRef2XAgV4wftupmArr2/pP1EMbJR9+xydPHNSxs=;
        b=UH9r4FQqFzQsz1r5XYtkuLYwSZgc074w1DUFTCfXIokHPFjMhABulm3u+jv2j1fE0a
         sXW/vZqdU4g8dfiyBJBP5dNL/4TsL94uDn2XNj8eOG9PTb/ekUl8JbwN97+8GDlTtFdE
         JE9C/r0n47Z9qL2lLSTuLAMHZFIdJ7dUetq+hU15PP7piFnBFVuKLQhvbGTegwYJO/8a
         clsS0MImcKp0mGifbdNklDm8aSzOc+05Pz6E8p2AchdTi7VQ3WkfMzIvLhwbrWWgrm26
         jN975OdeFobAOcRDGC/+B2MLc2SmPv4kzijNKXsigy8AEoXq7XEzRWps0zR4yIITk2MJ
         xyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777893095; x=1778497895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlCTRef2XAgV4wftupmArr2/pP1EMbJR9+xydPHNSxs=;
        b=LAPrWWEok/+tuLHXcYVB6GKwzAtZa1MrWHOTHjOP5ClZIewPZVupKMk20M/zVQnwSt
         SSM2IwOwVrq3NLBZUZCXwsQxiBA7cYn7i7bE9uLX6zvpm7FTvkGThS5+CgJl+QhJ13MG
         yq/mPboKwwarzAnCXUnZgTPsw9fRlItqe1ivdfECYGB5PiWurQJIYS/mq1Zj0yq6ZdZj
         nGsnTYuiQn8yl3rNH58zPW5ZuJvubsIKgolqKekg+yi8CRFZ2BoVYCktDle0Euiu40Dt
         BILcnY7+lMIQriBmZruet3lfH0L+0XIqfMg0i1Q8Pim4hL1PQQBmSA0Jr1QXK9RK0iq3
         +oqw==
X-Gm-Message-State: AOJu0YxhMbtK4RxPlOsvTQt7yyZ8hf4PqVpb8+ASkQHleHIuGaDBM+eS
	YWxxsxBOg8wSuCt9cYugN3/K6yYs4jQA027Kp2AF2NR/wJYy1w5HujSaCooV+T+bDA==
X-Gm-Gg: AeBDietdTRCP7/XOAFMqkMTG698ClOaVy40gDgHDtoqtnTESBPRoQBzvEoP1pmR1lnB
	w67qLE4rtyVC0puwHbsFxvtHTjucl58R0UB4ZL2XXyIGII7CvMKD3rnBv7bFm+kKwz52qTG0dJ5
	8408sXwFFXa/INbK29zaW2EZseHZHt4fKmT9vIg97lFxM09twopRWyplf0324iDLJD4L0SjYw9q
	r9u/6hEAWA9LN2PPdusTBY7s1MecNYTOeC5t2U3id/H0wf71fr4BHS+8WcxdCdjj6UTRvjbzMBH
	x6wGXVInDal9vQ51UNYw/9HkQFxm4UhjkGEqzgpWguJDEVLVGnbKIca8zbj0xHk2H+iva/RWRNA
	YKq/5Kq/NYgtEqQLx7xpgzlMjBzrTuNDSqe0TXSC8VVrkZfwJT5LsC65dg+br+1LQyORiVFZtOO
	bknIPQW2q57W8gPYLjxlI/B4OwvvxmXEiWo/PG8RogkikYwXDVLLIx28fYy+xa2dOn4H4LMXt78
	KlzWbASg+X66syEZgBYrS3Z3g==
X-Received: by 2002:a05:600c:c119:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48a9853c91dmr119587575e9.7.1777893095479;
        Mon, 04 May 2026 04:11:35 -0700 (PDT)
Message-ID: <f6521590-e51c-4f00-bcf8-faee79a5d3a5@suse.com>
Date: Mon, 4 May 2026 13:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] hvmloader: allocate MMCONFIG area in the MMIO hole
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>,
 Thierry Escande <thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-12-thierry.escande@vates.tech>
 <afHPdxc72FDGnQoq@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <afHPdxc72FDGnQoq@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777893096-AFF50FF4-589AEF2C/0/0
X-purgate-type: clean
X-purgate-size: 2387
X-Rspamd-Queue-Id: CBE4C4BC39C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:thierry.escande@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 29.04.2026 11:29, Roger Pau Monné wrote:
> On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
>> --- a/tools/firmware/hvmloader/pci.c
>> +++ b/tools/firmware/hvmloader/pci.c
>> @@ -413,6 +413,58 @@ void pci_setup(void)
>>          pci_devfn_decode_type[devfn] |= PCI_COMMAND_MASTER;
>>      }
>>  
>> +    /*
>> +     *  Calculate MMCONFIG area size and squeeze it into the bars array
>> +     *  for assigning a slot in the MMIO hole
>> +     */
>> +    if ( is_running_on_q35 )
>> +    {
>> +        /* disable PCIEXBAR decoding for now */
>> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR, 0);
>> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR + 4, 0);
>> +
>> +        switch ( PCI_MAX_MCFG_BUSES )
>> +        {
>> +        case 64:
>> +            bar_data = PCIEXBAR_64_BUSES | PCIEXBAR_ENABLE;
>> +            bar_sz = MB(64);
>> +            break;
>> +
>> +        case 128:
>> +            bar_data = PCIEXBAR_128_BUSES | PCIEXBAR_ENABLE;
>> +            bar_sz = MB(128);
>> +            break;
>> +
>> +        case 256:
>> +            bar_data = PCIEXBAR_256_BUSES | PCIEXBAR_ENABLE;
>> +            bar_sz = MB(256);
>> +            break;
>> +
>> +        default:
>> +            /* unsupported number of buses specified */
>> +            BUG();
>> +        }
>> +
>> +        addr_mask = ~(bar_sz - 1);
>> +
>> +        for ( i = 0; i < nr_bars; i++ )
>> +            if ( bars[i].bar_sz < bar_sz )
>> +                break;
>> +
>> +        if ( i != nr_bars )
>> +            memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
>> +
>> +        bars[i].is_mem    = 1;
>> +        bars[i].devfn     = PCI_MCH_DEVFN;
>> +        bars[i].bar_reg   = PCI_MCH_PCIEXBAR;
>> +        bars[i].bar_sz    = bar_sz;
>> +        bars[i].addr_mask = addr_mask;
>> +        bars[i].bar_data  = bar_data;
>> +
>> +        mmio_total += bar_sz;
>> +        nr_bars++;
>> +    }
> 
> I think it might be best if the ECAM fake BAR is the first element in
> the bars array, so we ensure it's the first item to consume memory
> from the low MMIO hole.  Not sure how that will work with the current
> sorting of the resources based on their size, but it's imperative for
> hvmloader to attempt to position ECAM ahead of the other device
> resources IMO.

Why would this be?

Jan

