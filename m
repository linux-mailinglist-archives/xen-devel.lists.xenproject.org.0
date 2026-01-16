Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BAD32CBA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 15:43:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206724.1520076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgl2O-0002B4-PZ; Fri, 16 Jan 2026 14:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206724.1520076; Fri, 16 Jan 2026 14:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgl2O-00029R-MS; Fri, 16 Jan 2026 14:42:56 +0000
Received: by outflank-mailman (input) for mailman id 1206724;
 Fri, 16 Jan 2026 14:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgl2N-00029L-Ic
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 14:42:55 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f344dc0-f2e9-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 15:42:46 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so1933853f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 06:42:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569927007sm5491907f8f.16.2026.01.16.06.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 06:42:45 -0800 (PST)
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
X-Inumbo-ID: 9f344dc0-f2e9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768574566; x=1769179366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y4wHI16YUXLiieGFEpwUAV2tNBHO1pG5DY/2eh2MmY=;
        b=R/EMqpZ7qSLoEbpIs1UlsFliKDGrKReb74MNGDTiPxuK1sUPcy/HlO8Cv1fKzOmS58
         ZKxk4N+NCKHNFvhCvFJF4zE2NUvJz8dkA8RtjCTw86/9hfXd1/qRwVXlPC0pyW3IuGuV
         NGHh1rq3m4AVN3Y2xyWuLQtYg93vt/U3KbFJ8JWL2kZxjvBO6TpL/qXfl33NLML3LHjX
         mjQm5ReWRZ9C1ZMkRbUhXs/DU/6NxH9Ty0kxqAQTpEwQYyGz0poEsewDi+H+oKoIAtkd
         YUQS8T9BZPedEiGz1dCxHilcH4K0+2bSfebmMlssjH2XKCc/DFlJ5nBKQwgwDXlHinSj
         xKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768574566; x=1769179366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y4wHI16YUXLiieGFEpwUAV2tNBHO1pG5DY/2eh2MmY=;
        b=ZcmyUcV7b3VAGqXl93gu7yK42+AfLPvZKbjJ0lCJxvSS1Zep2bW4s9McYVMSTkEWWt
         ZFyyGuSrjmNG+23D2HS7sYH/BkPR0rqFB56YAuYA74pbhQrw2G/5R4BUMi6vWwZAm2wA
         yAGtz9CHKuQNwwZ7I4HEhYdtk+x0e6u3R0kxyFWOXjhxm+eTTj+ptAa8dI+sUUEkiqWI
         LeCeQTeB+Z3QoNNjqyOaKboYz2spC4mTVutAqIPciJK0jnzdgPds/ZIMLTjE7bz2jor9
         aEZ6d8ZfDhaUTNfJUYOIc9mOWIB9WVpTqSZyt0f51N5uH8y7k4IItWwsox3hgutabKcx
         UtEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3V1MHJE/UTuupYbcTvS7vgMQJGI0dsb48tgHQFBN9PvOzg6oVo6WX7tdaFoHmIWTrJSfioYp1fsE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkEDk77er+iiU90UXFh0X4Z+CucNu4fbbhJIyGfUJ7fVsdTW5N
	LId8qTHsvMMxj+euItWtMJuM+AdsYjVirFTc9ZvW7dbri0Rx1Y+yswu25PF764GazQ==
X-Gm-Gg: AY/fxX6CAXVha5T8HVE1bnQIqIv5kCjx5EqZiiXiLwEU4H+MATj3wp41JS4ZvNShwFS
	TrXD2Njb8XVzC1uv90inDzO8A10hZ5Zl1jHglO7tEROikndvQUo3dqJQvmEgFQvdWyD7XXQ7jX4
	oPHh0xtFK1F1W3cUiVVFUwbaV40rCTjGnqWPV+npcabtRBxJdJY0bZGPbXAdDsloL1Uzs94xrwt
	9CtZEfD2oLcqqQeK9ZueI+yqo/ETSTQdnxVuZrBuMERq5s59Z5KuWKlVrhF1vmqpEkOKQ8WNa3O
	YgVPmqLpXYCmKEXmCJeMJMzrTQpkidH0CMlP8o66HZSLxi2F8Q7VkMtwIwpwiPdJP9ipDA1jfoN
	IZRCKPJsFr7XlD9SihsPVWqsVzF7yvA+bwoVGWKtH4vVHu4VnD0QF5WyETVNuT3UeRo3X4/Dvhb
	IQtaYZetcqRwEzohq+leJrRPs1ct06thaeib7eZrTRRaM5hJ9ASluMueznwPrRVEP9yEKqvr/Ub
	4E=
X-Received: by 2002:a5d:5f95:0:b0:42f:b690:6788 with SMTP id ffacd0b85a97d-4356997f4afmr4229753f8f.10.1768574565610;
        Fri, 16 Jan 2026 06:42:45 -0800 (PST)
Message-ID: <b8326923-08e6-4015-9fcd-ff1d29841118@suse.com>
Date: Fri, 16 Jan 2026 15:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c6bd40a9a40ae3194bcfcf90b9a71d4c190ab7f6.1766595589.git.oleksii.kurochko@gmail.com>
 <cdefd959-5700-4cdc-8563-d4954be1e91e@suse.com>
 <9212924e-8f3a-4797-8c3b-149ff7c4b03e@gmail.com>
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
In-Reply-To: <9212924e-8f3a-4797-8c3b-149ff7c4b03e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2026 15:25, Oleksii Kurochko wrote:
> 
> On 1/7/26 5:28 PM, Jan Beulich wrote:
>>> +
>>> +    /*
>>> +     * VCPU interrupts
>>> +     *
>>> +     * We have a lockless approach for tracking pending VCPU interrupts
>>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>>> +     * in irqs_pending.
>> And hence a set immediately followed by an unset is then indistinguishable
>> from just an unset (or the other way around). This may not be a problem, but
>> if it isn't, I think this needs explaining.
> 
> I am still not sure that this is actually a problem, or what kind of explanation
> is needed.
> |unset| is called only when the guest makes such a request, and the guest will
> make that request only after it has received an interrupt that was previously
> set in the|irq_pending| bitmap and then flushed to the hardware HVIP.
> 
> If an interrupt is simply set and then unset without ever being flushed to the
> hardware HVIP, it seems there would be no issue, since it would not affect the
> guest. However, the question of why this happened at all would still remain.
> 
> Do I miss some corner cases which should be taken into account?
> Should I still have to add some extra explanation to the comment or commit
> message?

Perhaps the problem is that really I can't see the full picture yet, for the
series not putting everything in place that is related.

Jan

