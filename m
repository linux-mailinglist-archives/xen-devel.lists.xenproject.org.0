Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F559BE683F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 08:01:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144898.1478096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dWh-0000ND-8o; Fri, 17 Oct 2025 06:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144898.1478096; Fri, 17 Oct 2025 06:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dWh-0000Lm-4u; Fri, 17 Oct 2025 06:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1144898;
 Fri, 17 Oct 2025 06:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9dWg-0000Lg-AM
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 06:01:18 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b181015d-ab1e-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 08:01:16 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso986144f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 23:01:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711443ec3asm61555685e9.11.2025.10.16.23.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 23:01:15 -0700 (PDT)
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
X-Inumbo-ID: b181015d-ab1e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760680876; x=1761285676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QRom5Clpyvz754pKPW4KoNuDtywfd3FcZl6z+c84ySw=;
        b=Zdx5XiCdHte8DkFhAwwUN49g/J5tat+qNqFUHQA3Jps4KEkw2phiex7MRwvIzYWPZb
         nZ7h6gzOzEHj8aDhNOnstp9MpeduTHfZ4i3tgHsqDqJjhlcLf/D0dfCXRjRADoMaStsJ
         R/pCNTnH4zPy/sWvL8bkIQz0/voSqQ14BDOYwTMgldOM/r3NIoSF1iG+ToQaRtJB6813
         7W2XQJT7xdNM5kacyCeXLnORg/QMBPupokNBQsX0/U6sBjRXHHs0AG90vRrr/Q0SN4yJ
         NlJpBN0r6ITAZbEQAkbCFBWgv91TqCQwXz8lODMYlJcKUgDMhiKHpfPUBbP2xYhg8Y31
         D9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760680876; x=1761285676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRom5Clpyvz754pKPW4KoNuDtywfd3FcZl6z+c84ySw=;
        b=W2Gxa7xJsefrxqIx9Jo7Lr+/vDfTJQXRhSETKKcqaYperw0KG7Nv9087Kmhq8OlmIB
         YtuDXeB41BRpxIZ6TXaHvztGzA+1F3+YVDPQ/lIDh2pYXOcMCKWER+bITmEOtnSVHXA+
         uh0xY3DJN4ZjcyIM4vVt1Ds48A4wnWkEVcmLnMcw3Q3xCANDDlPP8w+Foy9n15q4pOVd
         t2Erg/st8X/ET7HHQjHMpS/TkUSrcxByhjOZAJdqc1aX4DboHW0IgAmyf56QIE2fxPGh
         cEUxkoHNwzUChuvJEJ1n1RwSGP8Ubfsh3DGCy+d4LWQXumqPW3RNGljL30S/uFpdLCtN
         R+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPALqRina+Hv+xt2wiUfzvI6nl2rUUKcjNA9BlMCMjMqLTvDhc49JoY8X2gaUfE+UvgTYmAAZqrQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwERWjIq2BOXiNCbGZNBaGY5z6uEqaVgQGEIJFZDRzjozqaQbXJ
	WnjF1EkpMFgGus8GYJ5ukg8dl3hPtuAwtTpnFm+FBU3PRe+4JbHG+5ea+/m5ooWF4A==
X-Gm-Gg: ASbGnctRVIen1Sc3PCSEJu9YcmAGXk/tCCM8bA1XhnNiReakGlAwoV+nfW7nOt/aaMR
	MMfk3nPtBmGtiOPq6lHVGkJoMu5bT+eXi0lH02sMRqDCMdr0pHKZVBa1U+Coy2Lf3UppK+wD3Wo
	djZaTl4S8eLF+wMTHhuhiSW2AT318q/POydMda3AGtL8EwdjYE1eQAag2hRgOn5hXFKp2s0JTeN
	S12gon1i60CRRNeN4oDl9pEHp13aD+K0tCLoC79vIxvAgXkq0fyjwcEOTBtvIBvO8gjcaOdsh4c
	xcAoBfxFi3rCs7fvhevRvegnaEGALi6gZHawimYZMiXVlWFJtynUxx6Qei9R8fSKkWyrgwEpz9g
	L1H113PqAawbgj/TWoWromOqYddWQBYBLnEIxPIkAlX3iJFSDw7i72WgIXPObCyZA5qoEDFzgUR
	t3SFT2uUWcAOVX1VhFdDQqStDcbdPtCv6E4LTs+JynvvmE6DZtjpZ7tVN4MD1z
X-Google-Smtp-Source: AGHT+IFSmAdEJB0B9pQxb1vsb32zi3ntmjINH7+LqB7tnIJ5dJbWN+Wkb1RSYGZ5sRHSN5SOryYH4A==
X-Received: by 2002:a05:6000:2089:b0:427:608:c660 with SMTP id ffacd0b85a97d-4270608c8b7mr850627f8f.59.1760680875874;
        Thu, 16 Oct 2025 23:01:15 -0700 (PDT)
Message-ID: <4367edfd-b3a9-4bfd-809e-fa7b23d127df@suse.com>
Date: Fri, 17 Oct 2025 08:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan> <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan> <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
 <aO9UgQ3J27hVgGIa@Mac.lan> <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>
 <aPFz3-RjsG-VGRLU@mail-itl>
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
In-Reply-To: <aPFz3-RjsG-VGRLU@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.10.2025 00:38, Marek Marczykowski-Górecki wrote:
> On Fri, Oct 17, 2025 at 12:40:33AM +0300, Grygorii Strashko wrote:
>> Another point, assume change like this is to be done for HVM_PARAM_VIRIDIAN
>> - there are another HVM_PARAM_x which depend on build-time disabled features, like:
>>  HVM_PARAM_VM86_TSS_SIZED
>>  HVM_PARAM_PAGING_RING_PFN,
>>  HVM_PARAM_MONITOR_RING_PFN,
>>  HVM_PARAM_SHARING_RING_PFN,
>>  HVM_PARAM_IDENT_PT
>>  ...
>>
>> if corresponding features are build-time disabled, above HVM_PARAM_x
>> become R/W with functionality NOP now.
> 
> Are you sure? For me it looks like setting build-time disabled feature
> returns -ENOSYS. Or do you mean some other interface than
> xc_hvm_param_set().

Where do you see that ENOSYS coming from? In fact, for example, I don't see any
of the *_RING_PFN even mentioned at all in hvm.c's parameter handling. Are you
perhaps thinking of only the HVM=n case, whereas I expect Grygorii talks about
the more fine-grained controls?

That said, whether to uniformly fail requests for params solely related to
build-time disabled features isn't quite clear. Arguably for e.g. paging and
sharing, setting the ring PFN can as well be silently ignored (no events ever
appearing), while failure would then be reported from other compiled-out logic.

Jan

