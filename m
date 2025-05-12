Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1512AB3411
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981103.1367489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPs3-0003iY-O7; Mon, 12 May 2025 09:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981103.1367489; Mon, 12 May 2025 09:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPs3-0003fi-LJ; Mon, 12 May 2025 09:54:51 +0000
Received: by outflank-mailman (input) for mailman id 981103;
 Mon, 12 May 2025 09:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEPs2-0003fa-JB
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:54:50 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ce5e74-2f17-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 11:54:49 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5fbfdf7d353so5577603a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:54:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe7fb0ac1asm1472731a12.7.2025.05.12.02.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:54:48 -0700 (PDT)
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
X-Inumbo-ID: 24ce5e74-2f17-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747043689; x=1747648489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JJR8nGXcvBL+82rNXCyAqA/QDBq6m+sH970tnT9G51s=;
        b=OgC/oygp1voEcuPejR4rLtyyauFzdm7OjhJ+JoYY/H+ZWalqMXGSV9P7g7p+bxuFpT
         ou0L2KPfzRORxk2Mtx/JllqXX5RpBD8drBUJe5hugeUcyeciV6/kh3fmCC6hFx+AjcAJ
         P1fZX2c+idrY68AbD6A6eySTpmo6OKdQsQwdiP2xRUMUg2CPzKLKdzg+4rh61IfsYiOi
         7YKuHlyr61KEyJ16t4MJJ5htDcD7ElANUs/vcaR/996/GMN1zcyHz5J26yZahApoyePS
         ZsdhsCSJrw5mLqmLCl5frQw1HP01oAYou8k4Mgt1uYKd1aD+ps798ltcvIIk1cOy+DJk
         RxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043689; x=1747648489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJR8nGXcvBL+82rNXCyAqA/QDBq6m+sH970tnT9G51s=;
        b=fu8m/uoz4PkzUVkESJS7I8HmMliJ5HqtDgFNBCK3l46c5DlDM2UqCCkodTNtsfK1AQ
         0X80IY64PSizzWxLrYImPeIlrGaz71odlyD0HGJzPlx8O2qvYUH7604XqMMH2XO3mO0Z
         BCUZOkVFvXUtTJ27GM+YcjDHZ5mxSRpahC1k0BbOa/l3eO23k6Om/MGLql+dEi1mTkeM
         qRfizlVR/kHc6dats7/ChDacffOpkvOHymewgtdAnUUPiySL1WmNlMhQyIwSGDhlZ89e
         smJfsV+pQaOZmzTsWfTN7C0SK1AEHqbc+4hb+nVfo1UhCN4qxcjWxEr5u3PwFEPDAeah
         DM9A==
X-Forwarded-Encrypted: i=1; AJvYcCWqB8/Ui2kKc7J4u4JkcpNHPMRc5Hu1nICQM7ddzqqK/bGw9VCmQzznN0oYhCe0crvcEtoqa/QWoLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygi4edQTXof/qP5CO5PJUrwnJDMEbWQx4uASGz/3XGi7ZalMOE
	bT2A/sag8GumDzqSiEB0wYm7z/XbN7ZbpamaGyEYwQwfdif3lPcQbdUdknJ1Ng==
X-Gm-Gg: ASbGncuq+DX1P3IlwInscF7iZCUVIZPprip29fXOOdiG0u1ciqTQeOgyYVTOlfUVD9v
	uYMZiVbtCUqO/BY9GiTsMYpg0n4hizclij/M/96p7+zi+TgLeZg1DkCNXBzKIhhTWLE+5ZRT0nq
	u7eh0Ux+EoXqL2jF327ZREJ4ICLe48tf9BkGh9rJKDs8Qmo9NfGasr5ZbwmYRE+nb0UVbTL6R6R
	IusYPxFbH/wihQfT3yX05m/2umHnwcAzl9QVUEsYOOjJfWJRBorAxbdKtTb+8fKj+SoqWoE9CNZ
	Nf6/O0rhQ4NjThooay60AverHlRd+if4CubotuZwmuyqxxHpYbLipMhN366MJ2yD/jHoo9QdKYt
	jv+mvZr63xmONO3h6VnzlaZgvAEMUTG4EJxWyu18CS9tEYIs=
X-Google-Smtp-Source: AGHT+IHqg7jA3wOXDZTdY5HYs6pVHQYGls6jLDS9rtCpCAOZXYhRXa0/RyH329p7uNkpe0b07+hfBA==
X-Received: by 2002:a05:6402:3582:b0:5f4:370d:96bc with SMTP id 4fb4d7f45d1cf-5fca07423c9mr9594035a12.2.1747043689164;
        Mon, 12 May 2025 02:54:49 -0700 (PDT)
Message-ID: <d91ddac1-e440-44f2-8ae7-6f84fb9d9634@suse.com>
Date: Mon, 12 May 2025 11:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
To: victorm.lira@amd.com
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <68d30d0b-1f85-4480-a2e1-0c9c5effb49b@amd.com>
 <20250502234917.3533514-1-victorm.lira@amd.com>
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
In-Reply-To: <20250502234917.3533514-1-victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.05.2025 01:49, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Rule 19.1 states: "An object shall not be assigned or copied
> to an overlapping object". In the function like macro "get_rep_prefix",
> one member of a union is assigned the value of another member. Reading from one
> member and writing to the other violates the rule, while not causing Undefined
> Behavior due to their relative sizes. Instead, use casts combined with exactly
> overlapping accesses to address violations.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit strictly speaking the description covers only ...

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -527,8 +527,8 @@ static inline void put_loop_count(
>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>          {                                                               \
>              _regs.r(cx) = 0;                                            \
> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> +            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
> +            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \
>          }                                                               \
>          goto complete_insn;                                             \
>      }                                                                   \

... this hunk, but not ...

> @@ -2029,7 +2029,7 @@ x86_emulate(
>          switch ( op_bytes )
>          {
>          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
> -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
> +        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.r(ax); break; /* cwde */
>          case 8: _regs.r(ax) = (int32_t)_regs.r(ax); break; /* cdqe */
>          }
>          break;

... this one.

Also the padding of the backslashes ought to be adjusted, which I guess I'll
do while committing.

Jan

