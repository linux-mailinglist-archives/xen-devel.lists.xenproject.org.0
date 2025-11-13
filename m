Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03EBC5666B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 09:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160750.1488807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJT85-00047G-AO; Thu, 13 Nov 2025 08:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160750.1488807; Thu, 13 Nov 2025 08:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJT85-000458-6t; Thu, 13 Nov 2025 08:56:33 +0000
Received: by outflank-mailman (input) for mailman id 1160750;
 Thu, 13 Nov 2025 08:56:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJT84-000452-Ng
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 08:56:32 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a62c85a3-c06e-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 09:56:31 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b72dc0c15abso86770766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 00:56:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad44b4sm121431366b.28.2025.11.13.00.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 00:56:30 -0800 (PST)
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
X-Inumbo-ID: a62c85a3-c06e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763024191; x=1763628991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WB8iAefIMVSJ6o2G71x2/0COcjSjFkkT6GJyrw7d7rc=;
        b=X095tyqjNeZtik6+tjy8TWZybcZSoD9QjDxTnEL6scz9nvE2RdjNosvBm8Ht2KF97K
         JOXSST82m/QC1A1K8U6qedoOnu5QYVA/yh2wwaSy/onXKapSpXSBsOoAadUvXbZRaf+d
         iQ7NBHzqVu4bLqDeNpEVauNRf4Plh9Is3Y+qQxlteevW3jf9imCIIrI058K8SjdZqpSe
         ntVFkYj+m/PjftxobuA1lVH++4PNixFEKJofbSKPE8QUogANXAKLcTMy49XBxXXctsZC
         9xbBBg39DLbihlyWdCuiIMYzGt1N5Z7HJefExBpZPk+gq2tuaiT2oPhh+ef1aQMvOcA0
         yKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763024191; x=1763628991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WB8iAefIMVSJ6o2G71x2/0COcjSjFkkT6GJyrw7d7rc=;
        b=AHjENtv7Eb1wPSbF1BO1gckbLMfrLLwWWTkBc5MMpCeRcIZwlxt98FsTzeGSH3xYKS
         UHtLb92Lt4/C8XjjnDpy9GUef8EgusUD5i0WpD+CjDDSzz4Op/UspOj/RW/ZaMVhptgt
         CItRiRc+I5k2bDQU6uJE4JRF4y+Bm7Ss+KO5I51cs/KQs/iL+4YXUs8M4A2Wnjudw9hA
         fpC7g6fMwI+twjFOam9J3BCdzGWoHMYUMFevRwHg7Fo9yh1k0Dmvzy8iwy+eRdp3Kqdx
         ErlCB2XONgA4qrVvehTIkS2iHCKO8vVEaU5GR7xUmSWqvguTRBrZ0yHnUxQpnFaDZk18
         qlEA==
X-Forwarded-Encrypted: i=1; AJvYcCUNB6UfljldRLdk5fGhnZEX52ZEmkmcHJfKEeVL+s2qmmnER/GK+0aIh6EHnnSpPImL8VwIkP/s0Vw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjcRSL7r9Dn/4zdYkcI13WufulsmxZjXooxOEjSayi4RYl5udl
	IA4xkkL050MEB0ukHvncV0phZAvAwFPJkzhGgJ6fPgSFkdjrjsct13E70NTQMVih1A==
X-Gm-Gg: ASbGnctvobkRMIej+/k28EjZGLxVh9ghNnREyE8GAYWRrOt7vLfeJdfZNdV+ywvpsz6
	Qv4YQdx8IsxVSh06oy/gq72gh/1Ty6Bk/VIlXekxVQSz0ZkpYKZb8t3MYmWdYcZeG+EKAzE/h1n
	DgacvpMYPTrY3VVcftrHNRjph1F9qqDZGulLdpLCleWpUanDoCiKNRnnR0n12jjtqjDDRZwQb+V
	T9i+/1f9Mr7fh3tfOP4uHRIIz4gL1ayLFhOAFU42rYl9MB57PWgFHq0zSYXTAXPfapdOSB0ntWm
	T95MI/UAJEqXbb4gX1Y8uS0LlbU+NIu6eGr27el0mvtdfjvWDAEigiPWtcUECDSufim6daPw19w
	JG7KqAog+4CX1nCtZ9EEXfyb6C5/E+X0VycqMzNvCLe130WKwttd2jvRMaJwfGm2+B82ES0XND2
	v9/EGCiEuPkFBJuxALq0M/NCtg0K/XJxmY2b66EtZNhHQGg9HF5dd6DQREm/QSbBlwvhARKsE0r
	VqdNGRcN9Qtfw==
X-Google-Smtp-Source: AGHT+IEPeUAQcLKj2ePCcM2V+hFqcv9hLl1CiLz2ny5oovhHFWTUl9sKcchtXdaEMn5FabMtxflj3w==
X-Received: by 2002:a17:907:2d20:b0:b72:6f76:cf73 with SMTP id a640c23a62f3a-b733198d627mr687017966b.21.1763024190974;
        Thu, 13 Nov 2025 00:56:30 -0800 (PST)
Message-ID: <8304ea57-0574-482b-a2ea-e1dadc58656e@suse.com>
Date: Thu, 13 Nov 2025 09:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] xen/svm: limit the scope of "rc"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20251113031630.1465599-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 04:16, Penny Zheng wrote:
> To make codes less fragile, we limit the scope of "rc" through adding several
> instances in relatively narrow scopes. We also fixes wrong indentation.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -2748,16 +2749,18 @@ void asmlinkage svm_vmexit_handler(void)
>          }
>          else
>          {
> -           rc = hvm_monitor_debug(regs->rip,
> -                                  HVM_MONITOR_SOFTWARE_BREAKPOINT,
> -                                  X86_ET_SW_EXC,
> -                                  insn_len, 0);
> -           if ( rc < 0 )
> -               goto unexpected_exit_type;
> -           if ( !rc )
> -               hvm_inject_exception(X86_EXC_BP,
> -                                    X86_ET_SW_EXC,
> -                                    insn_len, X86_EVENT_NO_EC);
> +            int rc;
> +
> +            rc = hvm_monitor_debug(regs->rip,
> +                                   HVM_MONITOR_SOFTWARE_BREAKPOINT,
> +                                   X86_ET_SW_EXC,
> +                                   insn_len, 0);

As you touch the code anyway, make this the initializer of rc? And at the same
time join the latter two lines? (I may take the liberty of making these
adjustments while committing.)

Jan

