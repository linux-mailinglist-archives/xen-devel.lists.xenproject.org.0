Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D641A7E0FD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940222.1340068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nLz-0006ao-5J; Mon, 07 Apr 2025 14:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940222.1340068; Mon, 07 Apr 2025 14:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nLz-0006Xg-2M; Mon, 07 Apr 2025 14:21:35 +0000
Received: by outflank-mailman (input) for mailman id 940222;
 Mon, 07 Apr 2025 14:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1nLx-0006Xa-Gu
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:21:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a2ed13b-13bb-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 16:21:31 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so41316155e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 07:21:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d980sm12409027f8f.61.2025.04.07.07.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 07:21:30 -0700 (PDT)
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
X-Inumbo-ID: 9a2ed13b-13bb-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744035691; x=1744640491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dYU1SZycQpQgTWFDk3NB6y+lOz/7ogFCvDsog6LLHUk=;
        b=D9LRlOjTZOUX0ynzbX6ExR9HokQnCwHL6qhu99tgoxy6mKi+oQPOTqGjsAZ1j4jsr2
         n4B+h6uORPVyvKMAofCwYDNvbKbDsCnU84lu+Hs4hGFZ/iJbhNO1eRcOkprNS8cypzEg
         7tliXMhqOQmEQvm1lVgg2yXQGWV/C41RxJhPw8xtjo7grSKESd++vlkYv6960hQ69Pm/
         luKLzmde//t1JBd4EaKZFe8Alp5wWIE4Y6yUQcMBhgVtBO3r83mc21DZxMLe1F0UulCb
         YsDv16pH4D4lHQdAWfx3jqYw4QNpibSs5TamC2uEqjZqiMbkSC2OpPIGQAeR+EQVklFK
         Xzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035691; x=1744640491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYU1SZycQpQgTWFDk3NB6y+lOz/7ogFCvDsog6LLHUk=;
        b=f68afGWDTsC0/6UYAtMCX1D+uZJlmqv/SHBfQQAGMnAbArqbAQFmYdpIvAuhWpT4a9
         0LuQ3IiSAJ1KHtgO+WvQhkESSfJmbJu8DkrumNp5rcXCCwGnijpuvwehwCbRfkyiGoUP
         5wQyHEHAFBGrd8qSBSPZ7ClB9Wf1plFVkR/j7hsrbNw4gHgGrt31fYqXIqJeKxidULU8
         iJmR2q8Ex8Z3CpJvI1ZQ6xHdl72kLzQGsHr934t1VYWXNwI8Cy4e9xcWuNF4nUUMm4KF
         s4GQYoyluUVARbaHJdHSSyNhJzNuAQJOLTeD4715hinWeGat5IxtIdNiIuiNB5AyOIYc
         555A==
X-Forwarded-Encrypted: i=1; AJvYcCXHX0mvr1qc9XwnO1GXReE29J+qZz/nuQAHEe9bJEoXT2xLA7sFdsho51lTbPciL0R+UzpbuTfA9W4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKpLfg2Lmskd7Udr5hTMwojKOGcmtv2JyaGNXCDxbn5+DX5eYM
	wuv6dMCK/rFoo3HFtdVqxJCw4n/fedBqngbGfhwt8lEwxNXny+85Z9+GVqn6VQ==
X-Gm-Gg: ASbGncsIDKTFdp1zYh0EwFerWuCGsrFsQDykahlsbAuZvywp/TEAkxgZdyNTTABL2Jn
	CkgAFP5egocGfBTMLQZkwWN2HKDkyFKzGc7iUa7bgfhySRJCV3BbKtrYDYukI5+5dtzPgxPFlYz
	em6iBN8KaJNl68H7ZaPDJGGy2Xj9BPveKUKqsayKb6Etxh4FSXdPgTYhWnMie+dUCK8Bzs7C6fP
	f3NbElAIIzv/aD5GhBraoF9YFLnJvL1yamjL0tr+xnUpP3zjSaSFi712hVFfpsCDsEOArp0FXLS
	/BSJtH0xxDvofRnLHEBSoPITb1/p68ndlOu521SRpuMkw7KgKye4vexnF8pY2TUbsVT/5FjeqUb
	qMicVTCDMsC/4KIEXNrKoRLb9ecxxKQ==
X-Google-Smtp-Source: AGHT+IH63bjPYlRBO8KvpER9xz0GgMpc1DXF73G7Bg3fZDNw8E8QF8ODYpH3yV8LrI1VTbyxGUnCdA==
X-Received: by 2002:a05:600c:35c7:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-43ecf842969mr106511015e9.1.1744035691070;
        Mon, 07 Apr 2025 07:21:31 -0700 (PDT)
Message-ID: <667775a5-48ba-47ca-8c73-eb95c35de381@suse.com>
Date: Mon, 7 Apr 2025 16:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/domain: revisit logging in arch_domain_create()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250404232145.1252544-1-dmukhin@ford.com>
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
In-Reply-To: <20250404232145.1252544-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2025 01:21, dmkhn@proton.me wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -791,13 +791,14 @@ int arch_domain_create(struct domain *d,
>      {
>          if ( !opt_allow_unsafe )
>          {
> -            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
> -                   " for security reasons.\n");
> +            printk(XENLOG_G_ERR
> +                   "%pd: cannot create domain on this CPU due to security reasons\n",
> +                   d);
>              return -EPERM;

I was about to give an ack, but here and ...

> @@ -807,16 +808,20 @@ int arch_domain_create(struct domain *d,
>  
>      if ( emflags & ~XEN_X86_EMU_ALL )
>      {
> -        printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
> -               d->domain_id, emflags);
> +        printk(XENLOG_G_ERR
> +               "%pd: invalid emulation bitmap: %#x\n",
> +               d, emflags);
>          return -EINVAL;
>      }
>  
>      if ( !emulation_flags_ok(d, emflags) )
>      {
> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> -               "with the current selection of emulators: %#x\n",
> -               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
> +        printk(XENLOG_G_ERR
> +               "%pd: cannot create %s %sdomain with emulators: %#x\n",
> +               d,
> +               is_hvm_domain(d) ? "HVM" : "PV",
> +               is_hardware_domain(d) ? "hardware " : "",
> +               emflags);
>          return -EOPNOTSUPP;
>      }

... here I question the re-wording: Xen could very well create domains in
these cases. It merely refuses to for one reason or another. In the
latter case the re-wording may be kind of okay, because code elsewhere may
need updating. In the former case, however, the situation is a pretty
clear cut. It doesn't need to be the original wording, but minimally in
what you suggest it needs to be "s/cannot/will not/" or some such.

Plus a nit: In the revision log you say "shortened message text where
possible", yet then you swapped in "due to" for the prior "for" in the
former of the two cases discussed here. That's clearly longer, without
(imo) gaining us anything. Similarly it's unclear why you replaced "DomU".

Jan

