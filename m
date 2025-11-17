Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64494C6426E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163731.1490803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKycc-0008H7-B3; Mon, 17 Nov 2025 12:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163731.1490803; Mon, 17 Nov 2025 12:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKycc-0008FK-7f; Mon, 17 Nov 2025 12:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1163731;
 Mon, 17 Nov 2025 12:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKyca-0008FE-Lx
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:46:16 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 654d406a-c3b3-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:46:11 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64080ccf749so5699636a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:46:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b739911c14dsm312922566b.27.2025.11.17.04.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:46:09 -0800 (PST)
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
X-Inumbo-ID: 654d406a-c3b3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763383571; x=1763988371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5qOu0fRnSHl0Pqr6xpw3AZXEQPdxoT1CqzyvNosJUI=;
        b=APE1hb5DGdlojAOaUSTHsE0Icvb6ZeTBlTGPe2JMoD3RqygkYQIE8W2NDPrmjR3sbk
         QZMc/x0HI05u7jAWLdVg3qrp/DogWOHMVuFc7E8SzLnhmfLvkXTx9t/HCnfvzB3MM3S5
         3IQnswnqPIItii5eYOAezs8de9JotevesgA6Q1PLeOzcSYkq862318Eue/wVW93hyolR
         zOVw3BaMIvCesI6iG13SOeqONpYK9r975WAmkXQEavJYp72/Gwc+doEzCZoRo1jOj9Zt
         7sT/4GDWzj2ixy5g2KxWAldMEBAREJKb1lOhixzbX9gYEBkoMSLPPJCpfMne/k7AYHOt
         zadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383571; x=1763988371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5qOu0fRnSHl0Pqr6xpw3AZXEQPdxoT1CqzyvNosJUI=;
        b=tQ4gyCzym0TL9Js4R+nitjXXiBlbezRfYdsoJ0NJH7veLV5FHUubE2d047JwT+FRAL
         pO0q6qc5KQHmWM6YgQi5NC/vCzsnOIEp60njoQpgnK7UeXm2hMUXmDqBeaL2I4hRNFio
         X0L0bgumWm7JHGHB69MxMaXxwurd6Y36WmqHaj0s3ypYVf/lrN2boMHqR7QRHzEXUKb6
         /mV3/S0q8ZTUYzh7yDHSlll8af9xL9QvrU4hdhDqonuGFMcFnRzy0g3enEENrRb2s1Sv
         jVa3B9NQ5aq1lg3GAZgR4tct0xv9qD36j76nyie//4i7moOLY7tw7k+yLbP8tPSnN9WD
         4h/g==
X-Forwarded-Encrypted: i=1; AJvYcCWOmA7oGaU2O8DNsIvb52BIQIUrtiFkfZRQoUMbltKVZbccYdSh0Y5P15ppT60YwH6upNx6dyMrVj8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkEctKS8VkRJotXmHHnRkAFCbUdZGtqWS1xc3KGX04csYCS+j+
	TqX4pNVqY33JFndwD4+/Xu+kuKrR/vGRtjjzND38tFMtBnJiXtln9DDfqeKlzqSVyA==
X-Gm-Gg: ASbGncv8EpOzv0Fl5tzVRrA0/wdniMIM/hSsWiD8wVg8d5H6pmAVlAv5El5W1l4C7rz
	k+4oQnvVk0ElTBVvCFnLX0319m5a25bNCt7eLrswb/knW5kIpnmCt7Lay1Ta2HzNQLJB/ofjPQe
	9meVAyEfbbu88mBfpWTiP0xyhrUJ7sgJSonUB8TDXmo23mItv2sgZiRKVGl7RZig85uPwtRoYfX
	mPhHMQEYFt65UzDE1N5TrzW0I5pVjZWCPjtBR1EpR0C6+SXUPuqZPS/mA3GF9pTgtv7T5gNqpeA
	wGMPZ7+qAEJjkf7z4LOqB6dW76ysh/hqKjQnGZbyIvmf5awr+boC1fZpOu+d7WWS8dkuGOd/ZmG
	Ar/k4ZegQkAxghfkJmv6jrftYdcX+paM1rS2eYqTT9eOtol3TXYYyLHVb6jyBDQ3ApiHUVGoe93
	S5opp3B1EE8Bh1XKUZjjEqOvfTZRS2L5NixEvl8KXT15CktyqhfTciE0ekPN6GZuz7G8QzNKpSr
	pFEqP8yIZigrg==
X-Google-Smtp-Source: AGHT+IHTCqrjZW8NeOxAJLkX9UG7XJ7CRcxLTyKsmmSb506+liRpu41Pr9J0khx0n1PEASRzbO58uQ==
X-Received: by 2002:a17:907:1c81:b0:b6d:8ce4:ff18 with SMTP id a640c23a62f3a-b73677ed4d2mr973154466b.9.1763383570968;
        Mon, 17 Nov 2025 04:46:10 -0800 (PST)
Message-ID: <97ffeca9-348e-4997-a223-359fefa83107@suse.com>
Date: Mon, 17 Nov 2025 13:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ioreq: Make sure ioreq is always in-bounds
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <dddbae09e8e6b94a20f5ce24f3560dd15e5c6c01.1763382746.git.teddy.astie@vates.tech>
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
In-Reply-To: <dddbae09e8e6b94a20f5ce24f3560dd15e5c6c01.1763382746.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2025 13:35, Teddy Astie wrote:
> A 4K page appears to be able to hold 128 ioreq entries, which luckly
> matches the current vCPU limit. However, if we decide to increase the
> domain vCPU limit, that doesn't hold anymore and this function would now
> silently create a out of bounds pointer leading to confusing problems.
> 
> All architectures with ioreq support don't support 128 vCPU limit for
> HVM guests, and  have pages that are at least 4 KB large, so this case
> doesn't occurs in with the current limits.
> 
> For the time being, make sure we can't make a Xen build that can
> accidentally make a out of bounds pointers here.
> 
> No functional change.
> 
> Reported-by: Julian Vetter <julian.vetter@vates.tech>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

I was meaning to ack this, but ...

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
>  
>      ASSERT((v == current) || !vcpu_runnable(v));
>      ASSERT(p != NULL);
> +    BUILD_BUG_ON(HVM_MAX_VCPUS > (PAGE_SIZE / sizeof(struct ioreq)));

... does this even build on e.g. Arm? IOREQ_SERVER is a setting which can be
enabled (with EXPERT=y) also for non-x86. Yet HVM_MAX_VCPUS looks to be an
x86-only thing. (I then also wonder about some of what the description says).

Just to mention (no further change requested at this point, in this regard):
HVM_MAX_VCPUS being part of the public interface, we'll need to see whether we
can sensibly retain that identifier to carry changed meaning once we up the
limit. The check here may therefore not trigger at that point; the hope then
is that while making respective changes, people would at least stumble across
it by e.g. seeing it in grep output.

Jan

