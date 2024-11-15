Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206369CDB26
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 10:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836975.1252884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsKp-0004hP-Eq; Fri, 15 Nov 2024 09:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836975.1252884; Fri, 15 Nov 2024 09:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsKp-0004ex-C9; Fri, 15 Nov 2024 09:09:47 +0000
Received: by outflank-mailman (input) for mailman id 836975;
 Fri, 15 Nov 2024 09:09:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBsKn-0004eq-An
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 09:09:45 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58ec9f78-a331-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 10:09:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so8877675e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 01:09:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab807d4sm47241515e9.21.2024.11.15.01.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 01:09:40 -0800 (PST)
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
X-Inumbo-ID: 58ec9f78-a331-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU4ZWM5Zjc4LWEzMzEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjYxNzgxLjQ5MjE0Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731661781; x=1732266581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PqpoAcj/XQNOaartWdvf83r66dGZi5ggKPn0gD0m3Do=;
        b=LTBfxKfjbxtTri4c4th8weNnJD4K2VlqUoE/vZu1ipYKV4j7QnMeJbWNyl3B4EKHgI
         zMGtodva1EOGf2RSW1ip5EezZEs1UeDFqKIieJg7Yz0P39izPnTfPSUQUnlEoXNmkPq+
         LOY9VPVYQOI09o43TwvgjVOWoSBqQGVyyA9Zl7WmvMlNX6fkXJdb337WX+2mviKHraIU
         lCHNapIg7tOMTCAfK8JvptG7wjEWpWTAJt/Ps0528fromrFBfgL0NSWdGd20VsVVLjqW
         Z0TmJHcMD+LyY4ZKOFXvAupIbha7byDZ+sfCcQjvzipuy49JvmrxzOJfNXXFvfMtJNzP
         b8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731661781; x=1732266581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqpoAcj/XQNOaartWdvf83r66dGZi5ggKPn0gD0m3Do=;
        b=dPgyXG3u7a7N5TRXEGUXioc7q3BSUFc30J8bgx5y6Ci2tNmUV06w0HHlTdNZtQ6CTe
         PEAPT+LNnpGX4KkQ9xVBSPvDtvDO6+p9jTUmuIeSzhp4Iw7nLDtlJR+v96hWkYmdGfNv
         /FUkBhE+vRScHT/H/xqhXLEIXKZd02Gv5DuvHZ0AN03vwf0CikqUjJXufxKzTztEgtlf
         cipfCtypO7M2tymlhAgsxi6SWYd5ojQheTzMkcZCAkBNkIrYMFkd5QmfD0KqXqi/OW1m
         FgN75j44YJ+wa8rzlqDKXVoIqDX7PVORme6rc4mXObhDw9EzUluE9fWQcB2JRD7hO23m
         54pA==
X-Forwarded-Encrypted: i=1; AJvYcCXwCguIR21mhkXKweHExRsr3mvF7TMoXdvwhRko/nmgn7hEBGHRwQqfZwh8YIVb7EQIT0l0RXs5WSY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/o9JcF6pqbYEYhV/CWdWicOSW95TDtiK7eGbwPw3c0VL1Fy3Q
	0+nzManhhcxEiTtoGpBe3BGvZriHRmzDf4CBVj7v6ypGaq7HjCiJI+ljLDVmYQ==
X-Google-Smtp-Source: AGHT+IHb8/J1ODzmb4vBay/PZ/hK/pLlqIENn8K2zC5gH948qe0lcPB5sIY+gaDDfQHKcaemDviKsg==
X-Received: by 2002:a05:600c:3516:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-432defd2589mr17215775e9.6.1731661780760;
        Fri, 15 Nov 2024 01:09:40 -0800 (PST)
Message-ID: <32d9b9ac-f70f-42d7-8d6f-0d95b7838ed8@suse.com>
Date: Fri, 15 Nov 2024 10:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/mm: skip super-page alignment checks for
 non-present entries
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241114145715.59777-1-roger.pau@citrix.com>
 <20241114145715.59777-3-roger.pau@citrix.com>
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
In-Reply-To: <20241114145715.59777-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 15:57, Roger Pau Monne wrote:
> @@ -5517,7 +5524,8 @@ int map_pages_to_xen(
>          L3T_LOCK(current_l3page);
>          ol3e = *pl3e;
>  
> -        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
> +        if ( cpu_has_page1gb &&
> +             (!(flags & _PAGE_PRESENT) || IS_L3E_ALIGNED(virt, mfn)) &&
>               nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
>               !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
>          {
> @@ -5636,7 +5644,7 @@ int map_pages_to_xen(
>          if ( !pl2e )
>              goto out;
>  
> -        if ( IS_L2E_ALIGNED(virt, mfn) &&
> +        if ( (!(flags & _PAGE_PRESENT) || IS_L2E_ALIGNED(virt, mfn)) &&
>               (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
>               !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
>          {

Upon inspecting Andrew's report of crashes I noticed that this can't be quite
right. We can't entirely skip the alignment check when non-present mappings
are requested; we merely need to limit the check to the VA. In a reply to
the 1st v2 I actually had it arranged to match that requirement:

        if ( (cpu_has_page1gb || !(flags & _PAGE_PRESENT)) &&
             IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
             nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
             !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )

Yet then I didn't pay attention to the difference when reviewing the 2nd v2
(that versioning issue of course isn't helping here either).

I'm afraid I can't (yet) connect the observed bad behavior with this issue,
though.

Jan

