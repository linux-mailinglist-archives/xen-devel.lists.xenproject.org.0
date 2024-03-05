Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA9D8716DA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 08:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688608.1072994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPGL-0004B6-OG; Tue, 05 Mar 2024 07:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688608.1072994; Tue, 05 Mar 2024 07:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPGL-00048u-LB; Tue, 05 Mar 2024 07:30:57 +0000
Received: by outflank-mailman (input) for mailman id 688608;
 Tue, 05 Mar 2024 07:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhPGK-00048k-6p
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 07:30:56 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ca49e35-dac2-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 08:30:54 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so920329366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 23:30:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bl9-20020a170906c24900b00a45ab830eabsm211109ejb.51.2024.03.04.23.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 23:30:53 -0800 (PST)
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
X-Inumbo-ID: 4ca49e35-dac2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709623853; x=1710228653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=197nhNBsq4cL0hPa5PQ1jF0N/hg0vDGOjhUx7AFo1Kw=;
        b=AFmh7a3NurJNEc002bqxxBeWHii7GS7wRJqX7txOMp2Vtb3UDWUPbjdd4jzDIR4OsW
         d1S4JCtRZL6VnSNKDQEcBunUnvQUTHi2U6Pe+UXIbfzHYbq6pc7D3GHBuIM1Xvoj4PoC
         os1hjycbzy4w4wPMrDFVBnn0v05H5U7G2HHDzzHXNOjFLdOnqdp0Jb924d147BlY/fKH
         L/1OU1HfXoGEferyW9C5fVVB67IVYH6NGfnodyo9rYxilnlGjkP4EkrK8TPY5Dz/E2p5
         vHP67sh/Qdy1ERWBk7bkwRvUueQ85dhg8FZzb28CvLO9KRq9ySdaEo2Isk9wzc6+8O/v
         O8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709623853; x=1710228653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=197nhNBsq4cL0hPa5PQ1jF0N/hg0vDGOjhUx7AFo1Kw=;
        b=YM6rgl8shGgHEZCIJt9Bung98+HOrJ6tMywweQESynZ1VA5/M9pdP38toCraRMwsXD
         CwU22RQcTWizxTcAGBQ9h47J/NtiQoPUakGFGoVn7BUdr8IDX22sRKT3tPnjMGwjYmZv
         /1/fuk67s8Xl2jj4HM43QjfPzCBXfl0jhATH13/uE5Rza4nQ93+ym0X2aJx+nu+S0+gX
         rAqRci7KMkCBFBCqaKk99hD9WUOkoOF4ZpsP6XmNsvK6WDVFBDH41PgWdqP0v5tC8K4h
         jkCq+P2zJH8yRn/0YxH2fyBwPRsaLBHx6xHLme3tYTRiEX50I8CRm0bHDnqV5Pxg471X
         zaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgVsk2O1Wmif69uBk60r9+u29pVQeF3RQ6Lj2YVblodQttBBXhxgQcadDxn6mnMM5Imfl87ZGdxlVP+9ePnl3XpDROgak0u8FoYmhgdZk=
X-Gm-Message-State: AOJu0YzGMDF/UemZFyCOGJRFBVteftZMlU0o9mKcvehTp3Nb6mdrItfV
	XIHB/MbR28jNdZPIhgmZIGNi6t87ATLsYG6aPM88IWJO6/9akoy8R1/2dstGOQ==
X-Google-Smtp-Source: AGHT+IHK07/o2D+rdv5MbwmWJzh09zrb52W0ObjEsxKg2Ei2EOT/81RT0hKDjgSKjkxWlfrY4uIfbQ==
X-Received: by 2002:a17:906:fb89:b0:a45:8efe:7c0 with SMTP id lr9-20020a170906fb8900b00a458efe07c0mr1407884ejb.48.1709623853595;
        Mon, 04 Mar 2024 23:30:53 -0800 (PST)
Message-ID: <3f46f0f9-e3be-483f-9f4b-41f9a5a087eb@suse.com>
Date: Tue, 5 Mar 2024 08:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/nospec: Allow evaluate_nospec() to short circuit
 constant expressions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240304161041.3465897-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 17:10, Andrew Cooper wrote:
> --- a/xen/include/xen/nospec.h
> +++ b/xen/include/xen/nospec.h
> @@ -18,6 +18,15 @@ static always_inline bool evaluate_nospec(bool cond)
>  #ifndef arch_evaluate_nospec
>  #define arch_evaluate_nospec(cond) cond
>  #endif
> +
> +    /*
> +     * If the compiler can reduce the condition to a constant, then it won't
> +     * be emitting a conditional branch, and there's nothing needing
> +     * protecting.
> +     */
> +    if ( __builtin_constant_p(cond) )
> +        return cond;
> +
>      return arch_evaluate_nospec(cond);
>  }

While for now, even after having some hours for considering, I can't point
out anything concrete that could potentially become a problem here, I
still have the gut feeling that this would better be left in the arch
logic. (There's the oddity of what the function actually expands to if the
#define in context actually takes effect, but that's merely cosmetic.)

The one thing I'm firmly unhappy with is "won't" in the comment: We can't
know what the compiler will do. I've certainly known of compilers which
didn't as you indicate here. That was nothing remotely recent, but
ancient DOS/Windows ones. Still, unlike with e.g. __{get,put}_user_bad()
the compiler doing something unexpected would go entirely silently here.

The other (minor) aspect I'm not entirely happy with is that you insert
between the fallback #define and its use. I think (if we need such a
#define in the first place) the two would better stay close together.

As to the need for the #define: To me

static always_inline bool evaluate_nospec(bool cond)
{
#ifdef arch_evaluate_nospec
    return arch_evaluate_nospec(cond);
#else
    return cond;
#endif
}

or even

static always_inline bool evaluate_nospec(bool cond)
{
#ifdef arch_evaluate_nospec
    return arch_evaluate_nospec(cond);
#endif
    return cond;
}

reads no worse, but perhaps slightly better, and is then consistent with
block_speculation(). At which point the question about "insertion point"
here would hopefully also disappear, as this addition is meaningful only
ahead of the #else.

Jan

