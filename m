Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C498BDE5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 15:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808184.1220029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svd2V-0004bs-CD; Tue, 01 Oct 2024 13:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808184.1220029; Tue, 01 Oct 2024 13:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svd2V-0004Yz-96; Tue, 01 Oct 2024 13:35:43 +0000
Received: by outflank-mailman (input) for mailman id 808184;
 Tue, 01 Oct 2024 13:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svd2T-0004Yt-RW
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 13:35:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6b00e0-7ffa-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 15:35:40 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so1121073966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 06:35:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776dd4sm725005866b.16.2024.10.01.06.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 06:35:39 -0700 (PDT)
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
X-Inumbo-ID: 0c6b00e0-7ffa-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727789739; x=1728394539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+vbw+lMFDmqo53s3889EQkc0Oh3EURA3mSdEu3yW7/w=;
        b=Cap6NnSk6DeNUzMjZBlrVMYDacMKObpRdOwGAuuoXmjr1VEkq26TaBenD9Y6e6ckRv
         eZnB+N17KLzVjW28huCIT/+CJaufC0P3Uv2jBt0z6uVb6K6OQrsbEVW7QfMhcBzzUtPF
         egGLj5yyDX7RQtpDvWgZS33YwueJf4ZDLafWcjNGBJ4t48wxSucCtbKQVpSrBZ0ORzAK
         nNhCEmVOYh/foyZIZQ0Ru9+Dl33Vo6aQ/I/qK1wmu4KofEhp4g3dJgP19OGLOLrursC8
         bGX5rJE/W3SlGSOxlsfSfWS+7YtpWEkdcoSX4eMqUQ1m71jsSJM5Y8XubzRtpBhhdeFQ
         mymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789739; x=1728394539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vbw+lMFDmqo53s3889EQkc0Oh3EURA3mSdEu3yW7/w=;
        b=YnUi1zNJ1f0QgnNRJOcHHTXjam+DMGNFiAFIIl3qWZ5DwbIUomBkvRX/oVms9GLcNK
         3l3qJvA6TuWvEA7rVDFWVs4N4BJbqUDMh/lRXsBjV4W5dC3NOLRR9CUYJXwiZ4vs65Zm
         I8Rp+OUX2TEaI5SMkJaHujwkpXOOwGPefGEHD91QPMcckbMBrLUbUzJ4kInK3Ax6wpPC
         TMKEGZzUibp1jT0KIKIi6GchL1my3gruvmbGVc1WMhN0pkvnRFiqMRWH5n8BiASHQQrL
         9uFtQpoDKNHENb2GF71VQ0hy99z+8V5FHLI2v2IMwqybAJ4O0UrJOVSpH22K5UddEJAi
         0RpA==
X-Forwarded-Encrypted: i=1; AJvYcCWrnGryYm0BW7z92Wjl0XsjGt3ViIMJPbBMwubWU3UigGuhmXaClPoFVj21Xq/nrjNN114iWIU42uU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzjmIdA4Ap/1ggbZcG/XegQk1Ob0922vRgaoHLT1nKklVl3t8P
	9KLkdwtILbUU/uoS+lsdt8RjBucOzdA0F21pYLegJimgI8jZ8Pnrs76k7fpbNQ==
X-Google-Smtp-Source: AGHT+IE6x5FyMV073OEwfjKOOmVekEj8p5vNVy84etjdMH0jS47TSuCBlcaFc+dDKWUXN1rnk04AGw==
X-Received: by 2002:a17:907:745:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a967be95218mr331903166b.7.1727789739449;
        Tue, 01 Oct 2024 06:35:39 -0700 (PDT)
Message-ID: <ddc83900-c91b-45df-af79-a3e078500f65@suse.com>
Date: Tue, 1 Oct 2024 15:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/2] x86/pv: Rename pv.iobmp_limit to iobmp_nr and clarify
 behaviour
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20241001122438.1454218-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241001122438.1454218-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:24, Andrew Cooper wrote:
> Ever since it's introduction in commit 013351bd7ab3 ("Define new event-channel
> and physdev hypercalls"), the public interface was named nr_ports while the
> internal field was called iobmp_limit.
> 
> Rename the intenral field to iobmp_nr to match the public interface, and
> clarify that, when nonzero, Xen will read 2 bytes.
> 
> There isn't a perfect parallel with a real TSS, but iobmp_nr being 0 is the
> paravirt "no IOPB" case, and it is important that no read occurs in this case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one cosmetic request:

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -167,7 +167,12 @@ static int guest_io_okay(unsigned int port, unsigned int bytes,
>      if ( iopl_ok(v, regs) )
>          return X86EMUL_OKAY;
>  
> -    if ( (port + bytes) <= v->arch.pv.iobmp_limit )
> +    /*
> +     * When @iobmp_nr is non-zero, Xen, like real CPUs and the TSS IOPB,
> +     * always reads 2 bytes from @iobmp, which might be one byte beyond
> +     * @nr_ports.
> +     */
> +    if ( (port + bytes) <= v->arch.pv.iobmp_nr )

If you use @nr_ports in the comment here, then I think some connection wants
establishing as to where this comes from. Otherwise use @iobmp_nr a 2nd time.

Jan

