Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEC9DFD6B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846455.1261621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2v8-0008Vw-C0; Mon, 02 Dec 2024 09:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846455.1261621; Mon, 02 Dec 2024 09:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2v8-0008Tc-8J; Mon, 02 Dec 2024 09:40:46 +0000
Received: by outflank-mailman (input) for mailman id 846455;
 Mon, 02 Dec 2024 09:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI2v6-0008TV-Kn
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:40:44 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e68b748-b091-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 10:40:41 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa535eed875so640280066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:40:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e63b8sm492733666b.123.2024.12.02.01.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 01:40:40 -0800 (PST)
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
X-Inumbo-ID: 7e68b748-b091-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdlNjhiNzQ4LWIwOTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTMyNDQxLjA5MzI5Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733132440; x=1733737240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vw2wXZocv82RCPx217CPnuB34VXjsc0CsGzUZrn5t5Y=;
        b=Pj/ftNYSnPN+mjYpfdQ2opiHgq7fxTav5iW4JJDezro7n9CWgsawe8oUkT+n8dpCUe
         LyRwe7aERS80yML6nxc8tyarnWJGe5CAlWj0sXbKgB1QZipAEGnPQAm6K/XPnDPatIqK
         nT/x51V2O/K3JZ+Z0i0Aa5nW/urwhn1t82r20ezPoIf/IJYngdTUnDhy2KcwFV7fPC3C
         oezpLjT5kYj9muz7m1/w2xgqx3SOtZ35eR9YH0/Gn6Dup3x+7VkMnzUlFqSgeV2HhYEM
         mm2OraB+LGJC+6tjo+4EaJgkjFmBKDnboD7OCYBMnKWAmSMqfvwyz0M8JNbwLoGzZa6C
         6RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132440; x=1733737240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw2wXZocv82RCPx217CPnuB34VXjsc0CsGzUZrn5t5Y=;
        b=Vohmrf67PKYxSjNOpbIGDigwaZxymJSWUqBRNZ5lMxxX5J8t+7wA8UBENE5HiNwtMp
         h7s7lGy+pl6Too79a75l7HaUBeg5JBhnA664we9WnPdhEagjUOk/ClvdMHFxntC0gBA0
         UNHaL5o7Igjw1nbr+c9K5wJKjfmoBe2UbJWtam2H5W6grmPmX8B3lv9JatABwz5afkp5
         Z6MavH/ZyofXC/U1N2wb7TcGCezVmqQe80s7lpmgbrkkPk/tRR91l9VfZ+ljNLB2BeEf
         hYTUdDrT4utQc88FkNRZ7VqUHKOTete/Fi9UNz7X5kRaBvii6tSrBIfWutAgVYIbp9K7
         jDkA==
X-Forwarded-Encrypted: i=1; AJvYcCXqkA00xqt5wq/K677ss6Y1kFLcbP/dTyyifRi886cDde3jZed7ddJ77RmtjNzbPsiQGRUA6Hhmfyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDsA4zW1Yh6CJtpxZNNo7M5Kc8jDoQfDrZBeIaL0fzaKQaKV6Y
	jJCOHvsJDjdXMPBxJeW8xU8YzpCB2UPi2hGqh8eKD/0NlYYO5mf3yhdJB55DhA==
X-Gm-Gg: ASbGncvmfwaTla9/Mo25PmqF3nPdblBqXRs9ibNCFMOd4cUInsWmxNFEkp54OiR9mic
	2DUrLQslMWfdeywCnHHJ6wAwch7khDb0ty6QBrJH/A40glHYc64KednJFZGZXZcX6sN8MSh1ZoH
	eLwJbSIyR3ANnqv9kIXzZEK+6abFNeuihCl4k+kb2vupncH261ddbczaZnNVPMgUgQxcUI3G3lz
	KmVnY6aliIGyiQmFhE46lcJ6BEnwd9CmoVNNPTj7UiFahHsFtMnKqYA/mfv3l2NrAu7aHrcTfZX
	nk54F/U+uQZ7bEmMl8vamUIEttbr1vTHHDU=
X-Google-Smtp-Source: AGHT+IHhOQ+l7Wal0CzZCSp2o+Fwge5D5zZ1E1U1j1IdO9o2Z9YW4MzX++V5tAxOULQsKyK/yfUSzA==
X-Received: by 2002:a17:907:2d25:b0:aa5:274b:60eb with SMTP id a640c23a62f3a-aa581059879mr2310470766b.44.1733132440563;
        Mon, 02 Dec 2024 01:40:40 -0800 (PST)
Message-ID: <6e19dd6c-c270-4faa-b739-1f024d958f0b@suse.com>
Date: Mon, 2 Dec 2024 10:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] tools/libacpi: Use LUT of APIC IDs rather than
 function pointer
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-6-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241021154600.11745-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.2024 17:45, Alejandro Vallejo wrote:
> Refactors libacpi so that a single LUT is the authoritative source of
> truth for the CPU to APIC ID mappings. This has a know-on effect in
> reducing complexity on future patches, as the same LUT can be used for
> configuring the APICs and configuring the ACPI tables for PVH.
> 
> Not functional change intended, because the same mappings are preserved.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v7:
>   * NOTE: didn't add assert to libacpi as initially accepted in order to
>     protect libvirt from an assert failure.

If such an assertion can trigger, doesn't that suggest a problem with the
corresponding caller? I.e. isn't omitting the assertion merely trading a
noisy failure for a silent (and possibly hard to understand) one?

Jan

