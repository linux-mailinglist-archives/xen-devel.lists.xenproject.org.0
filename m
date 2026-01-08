Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BABFD022C6
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 11:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197562.1515057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdnUo-00017m-8E; Thu, 08 Jan 2026 10:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197562.1515057; Thu, 08 Jan 2026 10:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdnUo-00015U-5f; Thu, 08 Jan 2026 10:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1197562;
 Thu, 08 Jan 2026 10:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdnUn-00015N-3d
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 10:44:01 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0d6089d-ec7e-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 11:44:00 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so21107515e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 02:44:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5eesm15738154f8f.34.2026.01.08.02.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 02:43:59 -0800 (PST)
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
X-Inumbo-ID: f0d6089d-ec7e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767869039; x=1768473839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=glUqg2PmYit/j7nTnA+jbcoAtGVuASCfCailxWG4bDM=;
        b=JuZI8QQIdP8tWDQYqN0bB4S1O4vVyZCsdzGvV6E6U9JbnX45DGXXor/CEFPJcULXKK
         94tftM3YzSy2m3W/xsdSAsvpOTydOmHdBPS2VCHz+oA4L4edvVipsvT6QeltSFrqPiph
         t2j1TrinOebHm4HU+FBVvlCi9pwMkuANSIE6COc+j+nq11hGEw9bkYyqnE28BthZk18S
         F+I0Yqd7FylvM3QFl+TGAAhNwVS7HuBKMAayq0MmtlkqITM3Ry6IgUx/OGxlrsPaIJ73
         41q56HauTlD+fFYavVocoLufURTci6tyu1pNiuhk47C5Q7HH6IN7Xo9y0ciZM+M+kPJy
         o12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869039; x=1768473839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glUqg2PmYit/j7nTnA+jbcoAtGVuASCfCailxWG4bDM=;
        b=LZxj9aMr6l5Ie+FxRoC7QdK4E9vvfEUm85XwmVnekfzb/gbJzJtta+wmdYLCnc7/kI
         IY+rnrA6Pgz6WhkZYyKVERxqFTcCy+LkSfWbJuy1ZOlSYVvAc7jWZZtaFYUpWdzLLOo9
         iOG1RZOlsRctc7hLAGTwyVdE9vISi09mbT/C2HORsmC7coF1yN3+SK8gDj87tzI4AhfO
         7eOB7mBYUkiTtVGprvs+kWnA/FtvTu4/ES4DhMUse/fDFWuNI0kIUsddcpMjkN2W/gtW
         Zj1S2rlZbqNrKD0kEYDzu2IZrTbYDwBa3V8ZujcyvuDh/7jEQPE5vJPjxWcww4rqM+9o
         8ekQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2ynhKLXpMwERSH/OC3xaBUwp83Td1GLZ1mn1z9rNtLQTDX1sgNHFc1uUIzgbomDje9Vn8rIFxOV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLgWuU/hqnk7aqi2GGngVXd5X02yAWxKtUkwADjuR6PClZbdAB
	9j0Zmj+D6+KXYkHaaXbklSwlAKTKAqQ3ouvFUPhKBTst8Fmvf591hUXH362/fOBQgg==
X-Gm-Gg: AY/fxX7w5JOGM1cWsNkz44LSY0frdtGw/J4QgIj0shCwNJHO7wxunm8fZaJ+NB9uAiI
	5U2K8QlC/0xwMWewv7012DbebjtbrgqZgNplOx674uK8myfBZ1+qFmj0ckCzRo676l+0c6R/Imj
	snqWfXjJ91nFmeThL5MQR4BiVhF8jGKkkdMY1t7aDrAJS87gNX4bRyixeDCc3KWfNWS5w8NgJ+Z
	NHDhNbVfnfaSwrA7vIP2BbPvJ6tkAEDPtkxt2VlUjZWltt0ovTJJ/n7Ixl4B1KSpVh3EPp5BVCQ
	S7kj1sRqDumfnF84zc/JIEoYomagELjht9NmWJh9bb9K55khboAHzaOmB0kAbvFYiaJD2FxDHqF
	a+bhUpVMgJ/dG01dM6gf722yWwzO9YsKHwjunDUsOHxQiRVJhPUwJ4kPp4OjkZsGYk/jqldHeqC
	5trD68ByLdq/eIapni9HCKvqOoHdPy5L69z75PDBNvqf9KB+Ja/27Ry//yLLfSg07t3eNqVibL/
	jTVJ/UNxnFAXQ==
X-Google-Smtp-Source: AGHT+IGWkUdOQZX+Z7u+m7zE2yqYKekS7w/gzfjAVhuUcSIK9GQxBr2HUPba5JI/u+jT8wXDP4c4QQ==
X-Received: by 2002:a05:600c:698e:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-47d84b52c67mr58563865e9.33.1767869039386;
        Thu, 08 Jan 2026 02:43:59 -0800 (PST)
Message-ID: <9d02934b-d448-4ec0-af0d-b4ee9a918e03@suse.com>
Date: Thu, 8 Jan 2026 11:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/15] xen/riscv: add vtimer_{save,restore}()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c553efa44f384dcb9a49684c586a762b2a1444c9.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c553efa44f384dcb9a49684c586a762b2a1444c9.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Add implementations of vtimer_save() and vtimer_restore().

And these are going to serve what purpose? Are they for context switch, or
for migration / save / restore? In the former case (supported by the naming
of the function parameters), I think they want naming differently (to avoid
confusion). See how x86 has e.g. ..._ctxt_switch_{from,to}() and then
..._switch_{from,to}() helpers.

> At the moment, vrtimer_save() does nothing as SSTC, which provided
> virtualization-aware timer,  isn't supported yet, so emulated (SBI-based)
> timer is used.

Is "emulated" really the correct term here? You don't intercept any guest
insns, but rather provide a virtual SBI.

> vtimer uses internal Xen timer: initialize it on the pcpu the vcpu is
> running on, rather than the processor that it's creating the vcpu.

This doesn't look to describe anything this patch does.

> On vcpu restore migrate (when vtimer_restore() is going to be called)
> the vtimer to the pcpu the vcpu is running on.

Why "going to be" when you describe what the function does?

> --- a/xen/arch/riscv/include/asm/vtimer.h
> +++ b/xen/arch/riscv/include/asm/vtimer.h
> @@ -24,4 +24,7 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config);
>  
>  void vtimer_set_timer(struct vtimer *t, const uint64_t ticks);
>  
> +void vtimer_save(struct vcpu *v);
> +void vtimer_restore(struct vcpu *v);

Misra demands that parameter names in declarations match ...

> @@ -65,3 +66,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
>  
>      set_timer(&t->timer, expires);
>  }
> +
> +void vtimer_save(struct vcpu *p)
> +{
> +    ASSERT(!is_idle_vcpu(p));
> +
> +    /* Nothing to do at the moment as SSTC isn't supported now. */
> +}
> +
> +void vtimer_restore(struct vcpu *n)
> +{
> +    ASSERT(!is_idle_vcpu(n));
> +
> +    migrate_timer(&n->arch.vtimer.timer, n->processor);
> +}

... the ones in the definitions. No matter that RISC-V isn't scanned by Eclair,
yet, I think you want to avoid the need to later fix things up.

Jan

