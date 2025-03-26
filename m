Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED51A71585
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927597.1330319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOkO-0005OZ-U5; Wed, 26 Mar 2025 11:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927597.1330319; Wed, 26 Mar 2025 11:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOkO-0005Le-Qb; Wed, 26 Mar 2025 11:16:36 +0000
Received: by outflank-mailman (input) for mailman id 927597;
 Wed, 26 Mar 2025 11:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txOkN-0005LT-9R
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:16:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c61db162-0a33-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 12:16:33 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso45393825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:16:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9eff9asm16852064f8f.92.2025.03.26.04.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:16:32 -0700 (PDT)
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
X-Inumbo-ID: c61db162-0a33-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742987793; x=1743592593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ANTsplwvecV89CHtaFqq0E073tJdLatT17Rz3bc1ls=;
        b=Sn8Xnh6Qq4Ovkmltz2Xl29Kp7R3TK2OjhJ+o6150OkkO8q9El6Me7F88WgLZ4BQSlh
         33+NUqnoce7RAdRBP4pSgG8C62u7MqqGQr8fsmIZdmMdB8X+oXo/HxheBSCqSvZAL3t8
         bUuRG7RNrkJDakIJpI5wmu76Jsqqu9/JNmlBMSjqixsimFRqJbqioTFzLtXw7XU184iI
         tw4NJrGcQkaDLQNwzR+nAM//nSDIGqNivLE5+aLxNI69VkWLD9l+yLrWCJjawfp6FcTW
         cJiD/pYgyADxd8sM8GPQIbgXABsy1kL8GCyuoNEVYQcGztCeRHKfZ0c5+av5zshsCpRg
         PrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742987793; x=1743592593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ANTsplwvecV89CHtaFqq0E073tJdLatT17Rz3bc1ls=;
        b=jlmFHpQlMM0vdTpFq9X+AfXVgy3VlkwfT4QcLY6rJqYFUMnVdXps+n7fKjN2W1Y/D2
         8sGkmFQ4Zeo91Avo8UvI3L2XRHKg5VMxBpd4t+qxInik4E/46i7WjlmnxMmezwWiRNp1
         nf8Wh1KPRGRHoJtm3dSczXi5UdWZf1j4JlbfmwCEB21iNJPf9JatjZmzLpX21AoLnCf7
         +o81pl8XSwWoQEX/etjabcJPYq1C7fojcM4gBOLCgD3LQy6nMakHEcpllTQ1b5juaeFQ
         9VhdzoHhLwznLbwcbcrT5DdLAq+B1MOwgUcnC9vYN7B0Oa7Fo7gjtD497sBLoHmVSGv1
         eypA==
X-Forwarded-Encrypted: i=1; AJvYcCVsSHV4+ZkMNoriW6yhMlumJjluda9L1vWnp5FBojdP6+valalVqNLIDKon9xbpyb4Fo8QX+5Abx6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzsu7SmTG2bpnksJdHfKoK+GvyO4Xrn9Oqlh29HFVfJjtrTOiSd
	YsaXPdQHyuL8MZazWfooP1HK1Rq/KPH2Rfv33VImsoS9zN8Px+DDQ/bjBhrR3w==
X-Gm-Gg: ASbGnctPEPEQvOirYs4EF+GUjqXH4IuYLGvCDTElD90wTAmFH6p7lH6Er0ZlPlrPuW7
	YGJbzaEeTKXH6SR0G4xIt1WMxuV4RT850kNeaZRLZB4Ndx6YoFaw1+wJqVtsQO2RLIY4cTqf+2b
	sJigMyQRiS2YK81/fhIisshxsvxQUC6PcuWMv8Ti4uiPDhPU7GxBx3Z/ddJUUfgrzFLz6F1Yr7I
	Y6UcZTldFQYFxwBv51i0+yHOFzXpTk6pGA9Uzlp3XG1p55K29bqepn9G7X32lIc11n8B6DSu0EF
	tvM1xBKwF4KfTc0q2qx4f5rT3b8e/P6ujES3WQXcWXooFFDN9KuQQL/iDKPxs0GJKoX09ic9kT1
	+IrM6JyJ6ulhwsRzoKdgmyt/gri/oGg==
X-Google-Smtp-Source: AGHT+IGX59XPcWvKd+XWhkN3rGxATEJeaViUCJIYtnBgv3GjRYG7l53a0SK6snj9WHlkfREHJxJNOw==
X-Received: by 2002:a05:600c:83cf:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43d509e6492mr210842975e9.4.1742987792699;
        Wed, 26 Mar 2025 04:16:32 -0700 (PDT)
Message-ID: <0f87af42-8ed2-47d4-a0a1-23d5b24f70f5@suse.com>
Date: Wed, 26 Mar 2025 12:16:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/hvm: Rearrange the logic in
 hvmemul_{read,write}_cr()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325174109.267974-1-andrew.cooper3@citrix.com>
 <20250325174109.267974-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250325174109.267974-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 18:41, Andrew Cooper wrote:
> In hvmemul_read_cr(), make the TRACE()/X86EMUL_OKAY path common in preparation
> for adding a %cr8 case.  Use a local 'val' variable instead of always
> operating on a deferenced pointer.
> 
> In both, calculate curr once.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two suggestions:

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2273,23 +2273,30 @@ static int cf_check hvmemul_write_io(
>  
>  static int cf_check hvmemul_read_cr(
>      unsigned int reg,
> -    unsigned long *val,
> +    unsigned long *_val,

Could I talk you into avoiding the leading underscore here, by using e.g.
"pval" or "valp"?

>      struct x86_emulate_ctxt *ctxt)
>  {
> +    struct vcpu *curr = current;

This can be pointer-to-const?

Jan

