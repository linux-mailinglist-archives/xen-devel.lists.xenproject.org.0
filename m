Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240009F3441
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 16:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858299.1270549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCrN-0002pO-Jr; Mon, 16 Dec 2024 15:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858299.1270549; Mon, 16 Dec 2024 15:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCrN-0002nv-GA; Mon, 16 Dec 2024 15:18:13 +0000
Received: by outflank-mailman (input) for mailman id 858299;
 Mon, 16 Dec 2024 15:18:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNCrL-0002IF-TN
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 15:18:11 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f64428fe-bbc0-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 16:18:11 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so46583195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 07:18:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706c77sm141985545e9.34.2024.12.16.07.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 07:18:10 -0800 (PST)
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
X-Inumbo-ID: f64428fe-bbc0-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734362291; x=1734967091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B4eBm+afKNIm9Ap0aIPPLtGyRI0QxsKpBcatLyVpIsI=;
        b=PR2Gv/fzpXl7KN58ihUjcfn3GE/PJziT8MfriCPRP/hTRIS66OMJYQHz1hAmBn6Kh9
         1H82sqZty90RsjPfEfPDvawdLd6RkaLpFRCyXezoxDnmp2OHgHQk+dhftPBYjdOxIs90
         MFxUDudvwYILIL5o9hJINoBf6FILkbSNRB8OQfD6hnx5vUOlIFaK2LIV+XHWzdCq0KJE
         5CpV85RYXOcS6ivRFvGasmfUsK7CucSjM1dRoDucfUXZfWclrnH3E12r4YZMtZUqRVBV
         NJ0C1GB8zbw9wrD3BdaSg6B9EazE/hLbR9QAVFIn/GjZQO1SAkTDBYp1yLt8OJARrZJ2
         5SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362291; x=1734967091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4eBm+afKNIm9Ap0aIPPLtGyRI0QxsKpBcatLyVpIsI=;
        b=fTJlUWYga63W70y0yl1gJEhfYqVg3mKUct12FXlais94TktgTEQiy5DkbNKRRBpbZI
         KSapojQdZipC3zJq8f62y0XbLyH/rJLLCTPcLwyb8dQZLFLnF6o4hxeTrJdRNI41CswS
         alKlx9DsQ/laIAdopXDjBaucu5m0dL5cCof2wJfdsjRzKJ637TzT30eQcH/M/UYmvKw+
         wSlyIcNTxAbNPSgjSIkEjp+tFRsLBF9wkMUzwh2oDnxx/h/aInund72sakpOw7nZqzsm
         EwWg+PayVVbBZoqAMC8jmr4u/FYNuHk4MPnDY4Ym+zhCHyYLHD0Akp9C0XgUsf19zAxL
         Ld1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgXY41ElUyasdWNZRV6l7LZ460ec+7IPNUuRM5wtosxpR7bJFomLd2ZkfJc/d9QrsJiK8iRJlxhiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5Mhh7T3vhAoM8DsAQr+PcOZmsdngonBaPWA40gwPVT/IR6qkC
	WF6s+nR04ym7GEro45Wf3O+gQQ+odooC1xepb/Ex52Fkv1AMOgEGi2Bqsg8IiA==
X-Gm-Gg: ASbGncu8FpvRUKXEZVXsihSUzhgl0+W8QVkk569oRPOuwkqJF8POO6UA6yw2uH33je2
	I9jeCPE1SnbNZsbmXMvJyM0y7t4yGuzvXAIpqq5Mm2ygNlUmRBcqSXQwgFxVXuM2EbqjNzv3Vxp
	8+7f9mviQ8wkqE9CWJUARNUdwiPtc1++OYfXFzlacXg2OcneF5Q3PRJ9GHDzZeOpwGwPzBBdvUg
	n7K4SfCoe12i/5QO7Xfnd/cZ8GWX1vAfJbW70QsAAYLZ3mw7i3nPQWluRAdRKT3SKKq1T1rHZeR
	OHi6tPhcFaH+91qZHJrMM0B3gX2njXpZ9YQQhaOtww==
X-Google-Smtp-Source: AGHT+IHFhOpf/POdPv6LZefHmstcbfninow334Gt3B8+Cre8SEpxkverSxld0YeA/75tz3ptFQ3eMA==
X-Received: by 2002:a05:600c:a014:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-4362aa3d7e5mr117152375e9.17.1734362290738;
        Mon, 16 Dec 2024 07:18:10 -0800 (PST)
Message-ID: <d516d05b-a69d-46d8-b90c-c868dd68eab1@suse.com>
Date: Mon, 16 Dec 2024 16:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-6-jgross@suse.com>
 <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
 <7061e31b-2d61-40fd-b2e9-528c4faf41f9@suse.com>
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
In-Reply-To: <7061e31b-2d61-40fd-b2e9-528c4faf41f9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 16:03, Juergen Gross wrote:
> On 16.12.24 11:41, Jan Beulich wrote:
>> On 13.12.2024 17:24, Juergen Gross wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -193,6 +193,57 @@ static void domain_changed_state(const struct domain *d)
>>>       spin_unlock(&dom_state_changed_lock);
>>>   }
>>>   
>>> +static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>> +                                  const struct domain *d)
>>> +{
>>> +    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
>>> +    if ( d->is_shut_down )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
>>> +    if ( d->is_dying == DOMDYING_dying )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>> +    if ( d->is_dying == DOMDYING_dead )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
>>> +    info->unique_id = d->unique_id;
>>> +}
>>> +
>>> +int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>> +                     domid_t *domid)
>>> +{
>>> +    unsigned int dom;
>>> +
>>> +    if ( info->pad0 || info->pad1 )
>>> +        return -EINVAL;
>>> +
>>> +    if ( d )
>>> +    {
>>> +        set_domain_state_info(info, d);
>>> +
>>> +        return 0;
>>> +    }
>>> +
>>> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
>>> +            DOMID_FIRST_RESERVED )
>>> +    {
>>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>>
>> For these two accesses to dom_state_changed don't you need to hold the
>> lock patch 4 introduces? Also didn't you say you'd constrain the new
>> sub-op to the sole domain having VIRQ_DOM_EXEC bound (which, ftaod,
>> isn't enough to eliminate the race)?
> 
> Just to be more specific regarding the race: I guess you mean that a domain
> having registered for the VIRQ doesn't mean the calling component being in
> that domain really is the one associated with the VIRQ.
> 
> While being true, even today it is possible for one dom0 user process to
> "steal" a VIRQ from another process by using dirty tricks via the privcmd
> driver.
> 
> In the end a process having the access rights to use the privcmd driver must
> be trusted to not disturb other processes with the same rights.

Of course, but that's not exactly what I was getting at. I was trying to
point out that the vIRQ check alone is still insufficient to avoid potential
crashes here, by one vCPU calling here while another unbinds the vIRQ. Taking
the lock is required for Xen's safety; checking the vIRQ is bound is an extra
policy enforcement.

Jan

