Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFyYG0tIk2mi3AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:39:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D841314646D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234420.1537701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1d8-0007DY-Tf; Mon, 16 Feb 2026 16:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234420.1537701; Mon, 16 Feb 2026 16:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1d8-0007AY-Qb; Mon, 16 Feb 2026 16:39:26 +0000
Received: by outflank-mailman (input) for mailman id 1234420;
 Mon, 16 Feb 2026 16:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs1d7-0007AS-KS
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:39:25 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d418b76-0b56-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 17:39:24 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so38074425e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 08:39:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a3eb7asm134713045e9.1.2026.02.16.08.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:39:23 -0800 (PST)
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
X-Inumbo-ID: 0d418b76-0b56-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771259964; x=1771864764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rxQJHljzl7Xjpy0a9qrPUpNX/ls+n4E18//+eYOdcZE=;
        b=fbOq/OWEBRtSQjsMRLnIc1YFYHlH5f5EqeMdObRuVaWp91MzoEH2m/fTroI4Gr7m2O
         6iKGXOjE9VWZQigigY3rrOKtvHwYnVgmZug54N0I98JXzlZzMixvwhS8bdf2HT6qdK8v
         A9xanaAjOTgTLxb1xjwq5qysutbnTt9rSZa8iA9O+ybLLEAXGoaXtIZME+yboVMixZiR
         igNu4yQGhw4aTL7XQZ352JL57exDvs00WEWrM/RhgR+zt4FKXqZhxoovpEFnVovFqc+b
         EimuYKKA8FAEYo4ezoxIvc/F+eTs8c50klXELpwl3No5FUSGsxHN98uMHL+H73OGw660
         1Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259964; x=1771864764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxQJHljzl7Xjpy0a9qrPUpNX/ls+n4E18//+eYOdcZE=;
        b=YNpioEb6v3qOLCy7Ns+85CNJaulkmxohC9c5G6LYcYJrKrMGEif/oG20eScINYzTi8
         bvs3G8/Oytl/jhob/dYDgjf3jut9wjDP67guRpNTwuwf0lUo9uzF3EoHE2e4OpvhLojo
         oZZTMAAb3iYxJoO19bayyAPHZvzP2qLqjd1eOxFYLBYTUdsCe8Pu/kRXu4ZjrYLtgYAI
         RWqr1l6lUIsAsz1nn/WpuGZFNNysA34O4wAGTof5RKcfGYF/Yl8t5AAc2Utr/00ZjCey
         +eDza9s8vPKwFCuQVCv4zpdAA/ciCZx/FE+Qr4LSVku3QqihyPo1vzNOd3HBJWAHT9Lr
         GfMA==
X-Forwarded-Encrypted: i=1; AJvYcCXW2pSGdRLgWtuh8Lkeg1kgc/vqXWkfOGL9U5N+J9DjGaDEsWNlNrMbB590lsfBOIwHHhYUebxy6rc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXrKHhgKMRVxQGg207W9PY8xOAU5oGd9ENItjakbEx6OLHLed0
	3hWEToZDXvqBCwDfuRtoJVeoFf1QFPyEA1w5fM9Mk0AiPoj8SBnxH3W/Cxc83LcITw==
X-Gm-Gg: AZuq6aLAqx41XQ/i44RsSEN2hVovy27DblVR4+sa6Pvrzy0i/vBHr5TOM0W/d9nIHVb
	s56XxjUlGJAZrU9FxndjbEEf4wtLvBQ6w5M8vZOrX2daEQGjEqj2EbxetqkmF2D1SxAFRH5NG+I
	RO3nS7gMteiLXbc+Ays2CX5/5msbYCTS79zWXUjfN9tVATFMzTOkSaGJm9B+EgO61hrdK9b9mXC
	WKq8XaQ3feXOPeL8nOWfe3/YV7ze/htqUuEvVWe4zBEbUWKcrbnEoTbfxwmzuFqHFSY/YP9lAWU
	q6ny/a3dSsr6zOdvCnjPjE5l3rPTOr+1jr1uePTsmaazMTEOf7Og9oXKg5OIrA/ltpIDvVT8V8a
	ZzRlAl4fJ+VeAdv+l1RZLyAs53z/Y5Jpr27S8iT7uxHOUcUvySjWbfy6Cd4HOwepZtv5UoWYI0j
	QdcnpvkZqKNWcpcHPn3UAZE+fiO6OBakYCn0dC9vnvqr0wDLTTUvptxl8RFfNOkY1aOvQ5BTYiJ
	63BV4kzmcF3CEc=
X-Received: by 2002:a05:600c:148f:b0:483:7f7c:ad89 with SMTP id 5b1f17b1804b1-4837f7cb108mr85963485e9.37.1771259963780;
        Mon, 16 Feb 2026 08:39:23 -0800 (PST)
Message-ID: <871a5922-9d7d-455b-8257-d583e3e47bc2@suse.com>
Date: Mon, 16 Feb 2026 17:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: move vmtrace_alloc_buffer() invocation in
 vcpu_create()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
 <50c79874-d07e-479d-80c2-7c0694a0828e@citrix.com>
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
In-Reply-To: <50c79874-d07e-479d-80c2-7c0694a0828e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D841314646D
X-Rspamd-Action: no action

On 16.02.2026 17:29, Andrew Cooper wrote:
> On 16/02/2026 3:51 pm, Jan Beulich wrote:
>> The label used upon the function failing is wrong.
> 
> Is it?  Which label do you think it ought to be?

fail_sched, as Roger did point out in reply to the original other patch.
After all ...

>>  Instead of correcting
>> the label, move the invocation up a little, to also avoid it altogether
>> for the idle domain (where ->vmtrace_size would be zero, and hence the
>> function would bail right away anyway).
>>
>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -493,14 +493,14 @@ struct vcpu *vcpu_create(struct domain *
>>          set_bit(_VPF_down, &v->pause_flags);
>>          vcpu_info_reset(v);
>>          init_waitqueue_vcpu(v);
>> +
>> +        if ( vmtrace_alloc_buffer(v) != 0 )
>> +            goto fail_wq;
>>      }
>>  
>>      if ( sched_init_vcpu(v) != 0 )
>>          goto fail_wq;

... this comes first, and ...

>> -    if ( vmtrace_alloc_buffer(v) != 0 )
>> -        goto fail_wq;
>> -
>>      if ( arch_vcpu_create(v) != 0 )
>>          goto fail_sched;

... here the correct label is used.

Jan

> The positioning was intentional.  I just didn't get to wiring up Intel
> PT for Xen context yet, and tying the buffer to the idle vCPU would be
> the obvious choice there.
> 
> The chances of getting around to that are admittedly low, so I don't
> mind moving the call in principle (noting that this is a wish that
> likely won't materialise), but the claim over the label needs resolving.
> 
> ~Andrew


