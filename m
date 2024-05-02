Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F5F8B9A9F
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 14:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715791.1117694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VPU-0000Xi-Bp; Thu, 02 May 2024 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715791.1117694; Thu, 02 May 2024 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VPU-0000VN-8g; Thu, 02 May 2024 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 715791;
 Thu, 02 May 2024 12:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2VPS-0000VG-Sl
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 12:19:34 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b6a523f-087e-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 14:19:32 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41adf3580dbso10563065e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 05:19:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm1784794wmq.7.2024.05.02.05.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:19:32 -0700 (PDT)
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
X-Inumbo-ID: 3b6a523f-087e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714652372; x=1715257172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbTwUBrPlrMq/nr/N7RudbiJWugel33p8MkNTTCKAAs=;
        b=O9EprtJnl9kC+mrfeQJo57rAz/9l9+tsg134nd9Hqf5FGPy4D2yESPG5XTJbRFjFC+
         Zhm+YlGUxGrFkKpUrE03D9m3JIMNlaryB98xFBQqbaypFG1xgBXjzVXaJnuygJnm1Es6
         R+OyXkDvHNClkP+1+2lHw/quYvQQKTa/IQBhBca/Ri1kUqEhD8B4KeRkTF8odegk8Thw
         QUNXdYzxNYuy5myDhBCwf5d0n5dmk0D5awpCUcH/s+YGxFG5ku9SM7MMAIFfV/tXGEdO
         KTjQGIoCedQ9AJDIEB7uO/PP6cwk0ZBKtCcBAB76qtO8XGZPr36bIarTippRqCl/OB+D
         U6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714652372; x=1715257172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbTwUBrPlrMq/nr/N7RudbiJWugel33p8MkNTTCKAAs=;
        b=EtTBRqDORJBmUbbTyQzLLJYxSZnBn5YG4SQvbeaE9m/1QphoqPweyq///JTIdqeV1M
         3VVfHhaYSw0VUGW9WvnMHppO3uKu2qKdHxLswxJJsj9wvt4ipHwuuWbkj/1hshoWliAs
         3P2duA2nGnKFxEosvOS6lFPtg8U98WBzDETYa4BMbEBg1J8lEaGBHXUneuZ5uzCseiKI
         XfyBjwslpK+i+nDq5IGdr7fuUgpq2LFy/oxaUGSJKzJUeoySvLOZ6JqF/AYAN3FdH1Or
         WdV95Aftjuch/A1c3iu/hDWtLkwJ69qgy3U60XGSMFobm3jKQRM1rCOC9yRpm+RKhUI7
         D0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVthqD6Xaug8VxLlvUvDZbD+quv4WxcrInS+iC1IRpaxxkTixaC8KHY4gnJEj2fK4eFh1Ym6SJj0NKazGlsCQ9kRvuSCK5KFYk9P7mJDMU=
X-Gm-Message-State: AOJu0YxzJVFrWjec4R1/Kea96PCyu+/EAiWV/9XEVNkk633v32xZrajG
	kz+7J14nhvHSsESbYD4Fw/4761jopjoMtqAWP1V7Yz1Q1srk11/9L+EQet1PUw==
X-Google-Smtp-Source: AGHT+IESY9Io1fGavdZkQauA6sRbcTO29ju++YgwNmc8oPtSjv2mhq9nyxhxWPueG1MlksYd1YgKOA==
X-Received: by 2002:a05:600c:198a:b0:41c:120d:d3d6 with SMTP id t10-20020a05600c198a00b0041c120dd3d6mr2139460wmq.1.1714652372324;
        Thu, 02 May 2024 05:19:32 -0700 (PDT)
Message-ID: <741d4bef-8711-4802-91ad-8a6b4459da61@suse.com>
Date: Thu, 2 May 2024 14:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429182823.1130436-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 20:28, Andrew Cooper wrote:
> @@ -567,16 +567,51 @@ static unsigned int hw_uncompressed_size(uint64_t xcr0)
>      return size;
>  }
>  
> -/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
> -unsigned int xstate_ctxt_size(u64 xcr0)
> +unsigned int xstate_uncompressed_size(uint64_t xcr0)
>  {
> +    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
> +
>      if ( xcr0 == xfeature_mask )
>          return xsave_cntxt_size;
>  
>      if ( xcr0 == 0 ) /* TODO: clean up paths passing 0 in here. */
>          return 0;
>  
> -    return hw_uncompressed_size(xcr0);
> +    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_FP) )

This is open-coded XSTATE_FP_SSE, which I wouldn't mind if ...

> +        return size;
> +
> +    /*
> +     * For the non-legacy states, search all activate states and find the
> +     * maximum offset+size.  Some states (e.g. LWP, APX_F) are out-of-order
> +     * with respect their index.
> +     */
> +    xcr0 &= ~XSTATE_FP_SSE;

... you didn't use that macro here (and once further down). IOW please
be consistent, no matter which way round.

> +    for_each_set_bit ( i, &xcr0, 63 )
> +    {
> +        unsigned int s;
> +
> +        ASSERT(xstate_offsets[i] && xstate_sizes[i]);
> +
> +        s = xstate_offsets[i] && xstate_sizes[i];

You mean + here, don't you? Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm also inclined to suggest making this the initializer of s.

Jan

