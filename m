Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDSIJDNo+GkSuQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:34:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E84BB00F
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299643.1574197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJphC-0005wG-0w; Mon, 04 May 2026 09:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299643.1574197; Mon, 04 May 2026 09:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJphB-0005u4-Ud; Mon, 04 May 2026 09:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1299643;
 Mon, 04 May 2026 09:34:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJphA-0005tu-5S
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 09:34:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJph7-00Gukd-Sf
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:34:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f86823-bab6-0a2a0a5309dd-0a2a450ac6c6-24
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:34:31 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f86827-56b3-0a2a450a0019-d155802fe51d-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:34:31 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso27295105e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 02:34:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb69698sm464402615e9.1.2026.05.04.02.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 02:34:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1777887271; x=1778492071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XzwYg0ZYJm2i5yNiHCwc4qY4sZgpTOT5lCIQdD2BHo0=;
        b=c3cm497qITi+Wk+szLh8uUJktLugldbqtdXuB57XbEJmx+DzkoExsfdql4PIyNZGeg
         foQt4XN+5Y02tdhQlnw6WQ92aSJVAilrHK8jjy3QtOZwujTaXHslRXq1aEcLZUTJo4/9
         7OhWf/boSsDzkUetm+vn6nHaTZVdsXMh79fFGqZ575T40GgGt8kZGpQG6WNe9DBJ4X4C
         3OK4zfxk931WEydQA+osr944OZYOyq4Wz+Jpgy95+GvAd5uLqreeppVpwPtRIkbkWJwz
         pZXZbF64BOqwXK7uzhpg2pCYoDmMrYgC+sVeUeQx5PpyNrBmKGxOSjgmkKqz9I3t0kqN
         iOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887271; x=1778492071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzwYg0ZYJm2i5yNiHCwc4qY4sZgpTOT5lCIQdD2BHo0=;
        b=py8XwKqK0zQazVZoxgqi3ypOuu4IH17sG9Y7yd2Gc3d6W18rZc6iNeA2IfKvektP5V
         EBUYOikGIAW2KRLtjCBPxcertuXda0Q0JmqSLoCNxWKM7Dbo55fyXXKpGun9Zg0Fv35U
         M9weH/86e1dls0EMDIjCEwSUXzKALlkOcXAcE/ND3pVIY1rbk/6OfsveuHFJ94uzzsEW
         TAYetFi0oQlQ6j/0p2Fb5lvC/00b7BiC20ZsUaaGCKqbpOcqByJRF5a620+Zl4Y1p1ZM
         7d/4r770Pr5bTNelc0qXtLbZEnsMVCciltJQUr6nJaTkGSJpHXKmD2o42As/dnEudsvQ
         BMeQ==
X-Gm-Message-State: AOJu0Yx+WpOsoSkzWsl1ZAF8cxkdPY5Y9Xg3muSNiuigMr818uCrqGYI
	5vebdvxsHxOtIB1w8XHCxmUJMLVTxn2wri8IYnoxyoAgXYHwHuhCvL3U3hkFvVlzpQ==
X-Gm-Gg: AeBDieueJjVxG3SGutPQxZNq7dHqyZEnKhCUndQq3FK+HvOv0IemGlelOtAf/kIsrj3
	8IM+6ypEYDeHXJ3bUCTJWwFdm0emqj4ah0eW4iUZmdT/eOuXqRerXspVe6+8sd74ajiqGL80HIl
	D/Ws6EoJqRJVPbqJJj248ZhEWGnJE43QK7Cv9skNwY3dD8Qa54k+5E+3bPTI/clLnAoeteXLJrg
	m+J9X6YP/2/42arV5yyvCPTzR+bcs8VWNzfORTS9V9zFUmsteRkNj/VD7c0ZUxO201HzYWsN6it
	4LSTjODFV1dn5VZoQRV7u4Cacz3ftIkbI5WJuznWZFnG6UmSPvYWi8rpFxWbXLhTMsg6JOvAuw3
	pHsUKAfsMdvjTECyWF/uwa3xA5frXkwLJNDR9NCw89hfFuJfz2PJApCbw5j3p/GA+N/C16GQcvV
	PxUWcykk6ubzXhEx0gSBQSY7xn+C6b01+Ki97ZW1Aq6r9ogsT8rVkucXe0RHSXNzYVSbGAGEahf
	G6+z86Iamd80O7AMePGafaNujuanwXWHMRy
X-Received: by 2002:a05:600c:2d4a:b0:48d:5c1:bc47 with SMTP id 5b1f17b1804b1-48d05c1bda8mr39466325e9.15.1777887270677;
        Mon, 04 May 2026 02:34:30 -0700 (PDT)
Message-ID: <57233a5d-3944-433c-a7c5-a1a491a2c1dd@suse.com>
Date: Mon, 4 May 2026 11:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] x86/mwait-idle: Add C-states validation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <d13912c9-8820-44e7-8aad-d8ee9ea17980@suse.com>
 <aevBUh77IeMuXjw4@macbook.local>
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
In-Reply-To: <aevBUh77IeMuXjw4@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777887271-45F698B7-55AD6BBB/0/0
X-purgate-type: clean
X-purgate-size: 1886
X-Rspamd-Queue-Id: F39E84BB00F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 24.04.2026 21:15, Roger Pau Monné wrote:
> On Thu, Mar 12, 2026 at 05:58:21PM +0100, Jan Beulich wrote:
>> @@ -1589,6 +1594,41 @@ static char *__init get_cmdline_field(ch
>>  }
>>  
>>  /**
>> + * validate_cmdline_cstate - Validate a C-state from cmdline.
>> + * @state: The C-state to validate.
>> + * @prev_state: The previous C-state in the table or NULL.
>> + *
>> + * Return: 0 if the C-state is valid or -EINVAL otherwise.
> 
> Hm, I know we picked this up from upstream, but this function would
> better return a boolean, rather than 0 or -EINVAL.

I agree, but I didn't want to deviate from their code purely for cosmetic
reasons.

>> +static int __init validate_cmdline_cstate(struct cpuidle_state *state,
>> +					  struct cpuidle_state *prev_state)
>> +{
>> +	if (state->exit_latency == 0)
>> +		/* Exit latency 0 can only be used for the POLL state */
>> +		return -EINVAL;
>> +
>> +	if (state->exit_latency > MAX_CMDLINE_LATENCY_US)
>> +		return -EINVAL;
>> +
>> +	if (state->target_residency > MAX_CMDLINE_RESIDENCY_US)
>> +		return -EINVAL;
>> +
>> +	if (state->target_residency < state->exit_latency)
>> +		return -EINVAL;
>> +
>> +	if (!prev_state)
>> +		return 0;
>> +
>> +	if (state->exit_latency <= prev_state->exit_latency)
>> +		return -EINVAL;
>> +
>> +	if (state->target_residency <= prev_state->target_residency)
>> +		return -EINVAL;
> 
> I'm not an expert on C-states, but isn't this checking against the
> previous value kind of defeating part of the purpose of the command
> line?

I don't know. The question would need raising to the author.

> Also, it might help to also write down those limits in the command
> line documentation.

What do you mean there? Some of the values are universal, but some
checks are against model-specific values. I don't think you mean to
enumerate them all?

Jan

