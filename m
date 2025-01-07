Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D234A03914
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 08:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866066.1277336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV4OS-0003jb-2S; Tue, 07 Jan 2025 07:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866066.1277336; Tue, 07 Jan 2025 07:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV4OR-0003hF-Uw; Tue, 07 Jan 2025 07:52:51 +0000
Received: by outflank-mailman (input) for mailman id 866066;
 Tue, 07 Jan 2025 07:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV4OQ-0003h9-Je
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 07:52:50 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 619c2d96-cccc-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 08:52:45 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385df53e559so11903004f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 23:52:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a5524f064sm23649654f8f.101.2025.01.06.23.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 23:52:44 -0800 (PST)
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
X-Inumbo-ID: 619c2d96-cccc-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736236365; x=1736841165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d+k56CqkhlJP2/NgmgbZAI44vP6DNfOn+8VCtcYzVrM=;
        b=IXfdPj6DHQ0tbK0J8bFmDqDxxYmRL6owt3hItzmEFGJ34cjb3+8cKL1jQs0d0kH+OT
         /CKr40ZwZSfhY0stBFumjys6FaaDt6K5LQmlCIivF/u6qHucFVqZg/AId1QI2KJrfJDa
         dn3oy6ASCy5FA7L17XrCTBcFwHnlrvjlyUmBPz+YSOZ81vARCd+ladbEZ7eyFHTiL8h/
         z3488ZFpQqw234JxTRV7+yFd5prkpqsUcx3yYB3l/Q4nvd3EIDTkgsgr9PDGQLvSeSoy
         HwCnffm3DwXz4edv/LSCmDesjT8JXHgNt2YFevSLRK6dPRDj9nJvRezri0blsGo4NXy/
         0pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736236365; x=1736841165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+k56CqkhlJP2/NgmgbZAI44vP6DNfOn+8VCtcYzVrM=;
        b=w9Myyz5GwWkE/0BZetbXS2F41SPb02GnvlSegdbwZ6/gzVLV+QOvJekMt0XlY25e4/
         qQXkv7SMIEmZxVcbbatOtKslW1SxZT6q1r8eZ0umNbwjh/Q1bbfUjMdC51+dhgRW+Oyc
         eQmQzV06eT5fPyKxurOQCdak65Us/gZXu+bPez6UFIiJ7HTuKWkJvU4K3D1L+0JkAEm2
         +dUc39msZ+YwqgpSt0XQp1j300wi+o+Rjq768nkGdQzJjmakkdoJ+Qp2kxIPWfmhmXdc
         Lw2THveNe0IDFl0mvpLPWNQaZVOme3DGYyxyxYIFIFY5CZFf3JrRa4YmxEMn+EK/nllx
         E44A==
X-Forwarded-Encrypted: i=1; AJvYcCU8HHf9iwiCfV+wo6Q2nbiPth0dD/HDhVtSERZhWr/Jgso0gkZF7wNf+1zYY/7XYWZmox5PJdz+5VE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnxgTk6+KuA4S2MbvFPcqneToUnYSAAYT4qtkyKF6Pronrr97L
	V3DF25q3wT98pQDbmVCNDo29Qtsw7o3J4g42houKkYV9dBPginqZEsul0tYHUA==
X-Gm-Gg: ASbGnctvhKaAH+mp8vdjTYjJqoTNMYtnzDPm8nvceAzKpJekK8/WDreh9GAkwaCaLVI
	TMdBzwjm/hjTYF1YdYeD4jmaRDAKJC92h5yN0oHqR7/8+qeiuqk+1VEHyV+M1/0f10V5yatq+VA
	scFdHtB+vcqvY8InNiC3JTUIWpiGllInsI/5cQh8/oE7VbfDfUrLs04SAyR1MlBuxXyQ5XybwYa
	EJSrlHsov7nbOfLRKOh7Rr8sVfz3SNSgbrfCSu6/0UwVbTfyt5M6ExSOcyLbVc2PUUxqTz69a69
	5kOERpYEpwmCPXZFTPJXG9vDg9Ar1Z5MlR0imSEpFQ==
X-Google-Smtp-Source: AGHT+IGeun3J91zLuwjBBxEg/5joTExiUZ6dj9OnIJQ43O4u+Brej1LZEbYFUCvADqaliVDaALVj4w==
X-Received: by 2002:a5d:5847:0:b0:385:f6de:6266 with SMTP id ffacd0b85a97d-38a221fd10cmr47932448f8f.24.1736236365021;
        Mon, 06 Jan 2025 23:52:45 -0800 (PST)
Message-ID: <d8873cf8-dd17-4f9e-bded-7a47e04bd1be@suse.com>
Date: Tue, 7 Jan 2025 08:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] docs: FRED support in Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250103204704.84067-1-andrew.cooper3@citrix.com>
 <3ff59df0-69f8-426a-ab44-d2cd9b5bf8ea@suse.com>
 <0a780f2d-1e49-47bd-8c66-babbc2dd8f63@citrix.com>
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
In-Reply-To: <0a780f2d-1e49-47bd-8c66-babbc2dd8f63@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 17:06, Andrew Cooper wrote:
> On 06/01/2025 2:28 pm, Jan Beulich wrote:
>> On 03.01.2025 21:47, Andrew Cooper wrote:
>>> + #. In x86_emulate.c's ``put_fpu()``.  As far as I can tell, this is
>>> +    completely buggy; the values will be poisoned for HVM guests, and stale
>>> +    from the prior context switch for PV guests.
>> For HVM guests the ->read_segment() hook will be populated, so the path isn't
>> taken (leaving aside the odd case of the hook failing). For PV guests I don't
>> see any staleness concern: When the vCPU was switched in, the fields were set
>> (restored), weren't they?
> 
> There is up to 30ms of guest runtime between the last schedule in and
> this emulation, and segment loads don't generally trap for PV guests.

Oh, yes, I see now what you mean. Luckily even pv/emul-priv-op.c sets the hook.
Hence what's affected here are the two uses of the emulator from
pv/ro-page-fault.c. Sadly HVM isn't entirely unaffected, as the shadow mode use
of the emulator doesn't set the hook. Neither of the three cases are likely to
involve FPU insns, yet it's not excluded.

Question is what to do: Simply failing the entire emulation feels too heavy
handed. We could choose to simply store nul selectors instead. That would be
kind of wrong though for (in the hypervisor: hypothetical) cases where the
incoming regs are fully populated.

Regardless of what we're going to do, the underlying issue of callers passing
in partially inapplicable (to avoid calling it uninitialized) state remains,
...

>> For the purpose of FRED this doesn't matter much - wherever the values are to
>> be held, they'll be taken from by put_fpu().
> 
> I maybe wasn't clear.  To support FRED, I need to delete the vm86 fields.
> 
> @@ -54,10 +54,6 @@ struct cpu_user_regs
>      DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
>      DECL_REG_LO8(sp);
>      uint16_t ss, _pad2[3];
> -    uint16_t es, _pad3[3];
> -    uint16_t ds, _pad4[3];
> -    uint16_t fs, _pad5[3];
> -    uint16_t gs, _pad6[3];
> +    uint64_t edata, _rsvd;
>  };
>  
>  #undef DECL_REG_HI

... at least until your rework is in place. I did understand that you mean
to remove the struct fields. You made clear though that you'd re-introduce
them elsewhere (struct pv_vcpu) instead. And without (yet) recognizing the
staleness aspect I was implying we could read the values from there.

Jan

