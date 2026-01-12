Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4845D13D3D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200629.1516496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKFB-0006KO-OK; Mon, 12 Jan 2026 15:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200629.1516496; Mon, 12 Jan 2026 15:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKFB-0006Ig-Lh; Mon, 12 Jan 2026 15:54:13 +0000
Received: by outflank-mailman (input) for mailman id 1200629;
 Mon, 12 Jan 2026 15:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfKFA-0006IZ-1g
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:54:12 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef1b6b91-efce-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 16:54:10 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so72210835e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 07:54:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432d286cdecsm25599921f8f.7.2026.01.12.07.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 07:54:09 -0800 (PST)
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
X-Inumbo-ID: ef1b6b91-efce-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768233250; x=1768838050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OI2oT5If4p3Fzj5mygStk/l4C9+d9IsfmYyxvoHmGNw=;
        b=bLBlvFJjU6dcQ3FK8gsok0HYFQorGZe0QU8YqeNEOka5DhsO9LUoE181FH5zimXcIA
         drNSLfjvDJ2YqRUaF6XziLofcfu2DOejVGJ/8wZ+0OBGLmMcTlMFws1urowRdyv5SUQn
         LQsTY3Av9TD1D3qMsrgLIcA+GMfcxUhn9h4CiyquYnldmfLD5sLo2GHsxnMGFxMam+eL
         KtpulA2bSTUyzVvzO1bFtkLneEwuXo4xfs3Pb1BFGu7fcwH9yuQ0HxhEoqt5/gRQJLP3
         eh0IOnlxq2aep8HataUMV0gx09Ny4otG04+rUl3z4QmtUH4VfBv6lWZ+eOPnslP+BSrN
         xRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768233250; x=1768838050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI2oT5If4p3Fzj5mygStk/l4C9+d9IsfmYyxvoHmGNw=;
        b=Dn0PsWQ8qnm7uTL64LBa7lttZcQAlv2tkeFhWJvT8RhijUeuy4eAOGGW8vrYsMiuIC
         s3HLoV52YttArxTbk3e16WIrtEGby871x9COvCVJRucpNJ/Ana4Bu/d66Jyl0lZFS+MH
         oS5jjp+olXMy59huvQukEABu5sUZ+VvEcq4vQU9B7qNZCxz3DhVw3ec+pZke5RPEbg/j
         lJi4WhGlZFWCktANxKylpxGY+lsHa1FhoLnTMexRKHck9mIyWSUjTxfb5+O02gx9/FQ4
         2taHz+JLCXSw+kG3v08U+NSK4CmQeBDhoNClpxRbSfSt+KB+DBGvgO+J4O3SG8rU4gWy
         azHw==
X-Forwarded-Encrypted: i=1; AJvYcCU7DUOF59U0/qvh2nGEyREpMxPybeX/v7MmGlNAwX9qOASQD0zkFZPD8M/w20A6eQkV817EiAyZIHQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqeg8r5Yn2M7iRsQKu8GSs5yPYk+BOnn1EiF9x3BSsBxvZNpAF
	m9116mTiXGX8xNRzUkmHpayWpDM5FsqbskjT7XtTRrqyt0o7vzvr6tBXmLLc6rtCEA==
X-Gm-Gg: AY/fxX5eVK34w1JGI00KsfQom0cR1k/CQBK0z5y2VUdkaBGlq5PmWgf6ujMqG10pT5A
	O+TxdoVu1+ANgviPRzmT9MzNlsVdrXZHCLaxkMbZBVHaTFeJ+9OkCdIcGQwHhyFc525Tx55sUfX
	XXLoOrRFoB4fcDSwftX4d9PfRw2meGgagS5q/YS1VkkadCHwI3EviBLxuyK4urCQaq5a7etB7/F
	m2wak6ue+B6LMYCfvFGH1PqRHqdsaYX7GJWIorPVaIBG4CrXCxSlIijXsNFekr5nq6UBno8a1vn
	CsrPnHyA2s7uug5vfY56+I56LITy5dwY/Lif3BdF4svJi10qDUyTGbOL3lKmnPjtWbQp0zYjZ+p
	Xl9wuK5NewwBjQ9UfmZ4SCOI+L8ihaf3FN00KrOpLXRTojoZteGke3DIxProQMCm2ryCMrA3XsU
	uAM4Lk0HmH9aeOsgw4myV13ShpXSm8Z/mOJzbsPwuOs4uQ3d699A+8ZeBGtMgzq16S9NqtXgzfT
	Ic=
X-Google-Smtp-Source: AGHT+IHXzMZAx2KYU922PSm7rsAkuOAnOO+mOurxfNz9YH6YXM3rP5FVQxBzWPx+d/eeNtRC//wJxw==
X-Received: by 2002:a05:600c:a48:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-47d84b08652mr217833285e9.8.1768233249768;
        Mon, 12 Jan 2026 07:54:09 -0800 (PST)
Message-ID: <30dbd0b0-2a2b-4064-b39c-4dfa438af15b@suse.com>
Date: Mon, 12 Jan 2026 16:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
 <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
 <7ba4bcfe-59d3-43f3-adb4-207424dc1713@gmail.com>
 <f1beef63-1995-4e8d-bbdb-3be406ac414c@suse.com>
 <988ba581-5503-45d4-a621-18cdc3b14cab@gmail.com>
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
In-Reply-To: <988ba581-5503-45d4-a621-18cdc3b14cab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 16:46, Oleksii Kurochko wrote:
> On 1/12/26 3:28 PM, Jan Beulich wrote:
>> On 12.01.2026 13:59, Oleksii Kurochko wrote:
>>> On 1/7/26 9:46 AM, Jan Beulich wrote:
>>>> Also, wouldn't you better keep internal state in line with what hardware
>>>> actually supports? CSRIND may be read-only-zero in the real register, in
>>>> which case having the bit set in the "cached" copy can be misleading.
>>> [...]
>>>
>>>> (This may similarly apply to at least hedeleg and hideleg, btw.)
>>> Regarding the previous bits, I can understand that it would be an issue:
>>> if SSAIA isn’t supported, then it is incorrect to update the corresponding
>>> bits of|hstateen0|.
>>>
>>> However, I’m not really sure I understand what the issue is with|h{i,e}deleg|.
>>> All writable bits there don’t depend on hardware support. Am I missing something?
>> My reading of the doc was that any of the bits can be r/o 0, with - yes -
>> no dependencies on particular extensions.
> 
> Just to be sure that I get your idea correctly.
> 
> Based on the priv. spec:
>    Each bit of hedeleg shall be either writable or read-only zero. Many bits of
>    hedeleg are required specifically to be writable or zero, as enumerated in
>    Table 29.
> 
> Now let’s take hedeleg.bit1, which is marked as writable according to Table 29.
> Your point is that even though hedeleg.bit1 is defined as writable, it could still
> be read-only zero, right?
> 
> In general, I agree with that. It is possible that M-mode software decides, for
> some reason (for example, because the implementation does not support delegation
> of bit1 to a lower mode), not to delegate medeleg.bit1 to HS-mode. In that case,
> hedeleg.bit1 would always be read-only zero.
> 
>>   In which case you'd need to do
>> the delegation in software. For which it might be helpful to know what
>> the two registers are actually set to in hardware (i.e. the cached values
>> wanting to match the real ones).
> 
> Does it make sense then to have the following
>    	...
> 	v->arch.hedeleg = hedeleg;
>    	vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
> in arch_vcpu_create()?

The above makes no sense to me, with or without s/vcpu/v/.

> Or I can just add the comment that it will be sync-ed with the corresponding
> hardware CSR later as ,actually, there is some h{i,e}deleg synchronization
> happening during context_switch() (this code is at the moment in downstream),
> because restore_csr_regs() is executed and re-reads CSR_H{I,E}DELEG:
>    static void restore_csr_regs(struct vcpu *vcpu)
>    {
>        csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
>        csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
>        ...
> As a result, vcpu->arch.h{I,E}deleg is kept in sync with the corresponding
> hardware CSR.

No, the r/o bits will continue to be out-of-sync between the hw register and
the struct arch_vcpu field.

Jan

