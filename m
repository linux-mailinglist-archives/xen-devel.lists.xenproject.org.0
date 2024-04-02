Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF74895793
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 16:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700185.1092910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfXy-0002Hq-SH; Tue, 02 Apr 2024 14:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700185.1092910; Tue, 02 Apr 2024 14:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfXy-0002Fu-PG; Tue, 02 Apr 2024 14:55:34 +0000
Received: by outflank-mailman (input) for mailman id 700185;
 Tue, 02 Apr 2024 14:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrfXx-0002Fo-Ek
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 14:55:33 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dbd65b4-f101-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 16:55:32 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4155819f710so24768565e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 07:55:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 di6-20020a0560000ac600b00341c9956dc9sm14412688wrb.68.2024.04.02.07.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:55:31 -0700 (PDT)
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
X-Inumbo-ID: 0dbd65b4-f101-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712069732; x=1712674532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ieHwwz3BalsogdGLLvzCYVq9qVeE0Nj7lICPmpVo6zk=;
        b=WUO2/ty6ZLLK7jCpIUeAnYRW5DeP7jyJfr9rIoDjjYyMLS0RFowBL1vBeHqwCxV0FH
         4dk+EopmGwyyOEc1kQ+H2Edd1l0qeHNVI94Wz82kpdq/K4S+36plZ42YLWhm8AXGi/mH
         VSvcrbZcM1erneBVHDvt1q6bxs3xNVqxzpdpao+ETL71PHcUAeS6GFF/xyc//ECBgxiB
         7omW3omQ+3SaM/hmovO8siS9bv1CZqzpPhefVMOmtBrSR8F1XaZ0+kTiKb0kVuBS1Vwt
         EoFNwthyZtLgWrN69SOc2IxWlML/xPyCp8LVjw/IhXAOXXsunUxm2jbsK4LqIWmSWQ7y
         L/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712069732; x=1712674532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ieHwwz3BalsogdGLLvzCYVq9qVeE0Nj7lICPmpVo6zk=;
        b=XBeWAkDPA82Fxr5UoY/dPC/RbyxZlow0+HR5JmmUYkwJ95auOqMUxEDBbXvo0MNm0G
         cQHFBy0n3+d3hB/tlFlVsmw6XFq4vodRYaG3LJ+K5CnhM57ZVJy4zGo1WAjgFrtzl2WN
         Auza279Ly/4EDb/mKyzQjlpHZbvC1DQOg7NzA3p180BACmYkL1fvMko8dQdgQdqC5kdH
         03gi1oZa0W2Hr9q6neLy1sD0ijwgPlqPWeFd4hO/hOOFHrzE6dUYUnLUJgTq/eOvUx2K
         IUgGfSSL5aQJYRGQnuYwFKqMhK4JfG9bHXLiTJjZ9YHYbXH38gwzoVjxkL4UL5Z8MCuc
         RiVA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Wzg7ZO3Z2hizQqczAXOtSlHapnRO2nr8zzpNYoZWRhE6ZGup2jwQHxeu/cuBe6IxbznkV9JBKDbEL0T258I3gQZMDzjzz1OISixsO6M=
X-Gm-Message-State: AOJu0YyuGXklVOUvuBXD8NfUQdlS1vcQ5U/k/Q3IKtjkbBiLwDPOr6zv
	bqQ7E/OQzaUaaRGeOa3ENkl6Wwmdhy3O6Rk3rU2zgAUnRRmVmPOSzWPL4zduqA==
X-Google-Smtp-Source: AGHT+IFWcVfCnyl3l0VSBeBS6iGfe0EjGZa/2ggN8KeqC00NvOC2BKyx3OKacn4lYD4UdaZfHY0EoQ==
X-Received: by 2002:adf:a35e:0:b0:343:65a9:30ff with SMTP id d30-20020adfa35e000000b0034365a930ffmr1642051wrb.37.1712069731936;
        Tue, 02 Apr 2024 07:55:31 -0700 (PDT)
Message-ID: <71cd43e8-9841-4403-9af9-36efcb798fc9@suse.com>
Date: Tue, 2 Apr 2024 16:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 4/7] x86/hvm: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
 <ae50d853bbf20a74d2693a5d52f36d216c59213f.1711700095.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <ae50d853bbf20a74d2693a5d52f36d216c59213f.1711700095.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2024 10:11, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit once again ...

> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -132,9 +132,9 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>      s = (struct segment_register)                                           \
>          { 0, { (r)->s ## _ar }, (r)->s ## _limit, (r)->s ## _base };        \
>      /* Set accessed / busy bit for present segments. */                     \
> -    if ( s.p )                                                              \
> -        s.type |= (x86_seg_##s != x86_seg_tr ? 1 : 2);                      \
> -    check_segment(&s, x86_seg_ ## s); })
> +    if ( (s).p )                                                            \
> +        (s).type |= (x86_seg_##s != x86_seg_tr ? 1 : 2);                    \

... addressing the style issue (blanks around ##) while touching code would have
been nice.

Jan

> +    check_segment(&(s), x86_seg_ ## s); })
>  
>          rc = SEG(cs, regs);
>          rc |= SEG(ds, regs);


