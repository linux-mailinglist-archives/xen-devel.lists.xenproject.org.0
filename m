Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD09874CEF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689765.1075040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBXg-0005uT-Ph; Thu, 07 Mar 2024 11:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689765.1075040; Thu, 07 Mar 2024 11:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBXg-0005sN-NA; Thu, 07 Mar 2024 11:04:04 +0000
Received: by outflank-mailman (input) for mailman id 689765;
 Thu, 07 Mar 2024 11:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riBXg-0005sH-0g
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:04:04 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679a0eef-dc72-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 12:04:01 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56657bcd555so832352a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:04:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v29-20020a50a45d000000b005649f17558bsm8310969edb.42.2024.03.07.03.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 03:04:01 -0800 (PST)
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
X-Inumbo-ID: 679a0eef-dc72-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709809441; x=1710414241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wgfiv/l/q4Cl1rIELcJuiMKkt6DFqZ7ZdPyrQjSqOg0=;
        b=O7CDa80hIBT449CKddpET9TSE2AbPuy088zLAYs6ZTk2NJk4dzdFPh3+ntCjCsCOKJ
         0o5r2UUX20x9SG+KZKQIN3qKlU1dMoqLq6ygea90AT7uVU4wsgTHI/Re462XGTs+2VlT
         YHv1EFd7LXKQb8z5SgelGZKQu1s6ffPowR6NJWGJG1KHf8LxIu8xheVLgYRR73dAULt/
         eqV8KbzTUmD9Bd4zuJtsoOObvwqj9LwzpghoB+xVOtwHjbSbcbuspxsXMA997BK9URRf
         NRuRn/WRrBwwd1idp6RlAPfN8cv2N5dkHUgYh64h3Al+6C1KWaa1lgC1mOG3YztOpcs1
         Qpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809441; x=1710414241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgfiv/l/q4Cl1rIELcJuiMKkt6DFqZ7ZdPyrQjSqOg0=;
        b=UxP28tI33SyWkxnivGu68DXU3VJRjAWW8qZEmbkuVcvB/rAqE7yCpe+GwlOex0A84r
         umWrmbetFBcq0Zakds/4KgmnCELNGwSPyGm/+U2L9/gvu4D7/bO/p/5hH1b7Y2WSaN3g
         ijyAK5hsRmad+gHwNsrVwVPOx+13OQUru+KwHb0lLIvs8Ts+ykfF+frVIuRJcJ66Av1O
         Ircd/BJlWfSUN/OEkbnFJ+LnHpAkdZTQM81Bj/tz6d9rGuaEWPGOuCOynGKjRXpBh0zt
         uy5o/Y5wpJ1Tb0wgfknmNMh5nFhJ/HUBNcsSVEOs9F3LFVLh724nwt/XEjnqyG8LAatb
         QzhA==
X-Forwarded-Encrypted: i=1; AJvYcCWlo2tG0j97Uk5P7g4CscblvelYRIHDX3e0Y4T5buNcq/kcseSJgk2DI5oJmg4sJCUqQqWuWrgrnqpnjymyBvXOuCBDkaNRjxjcfvU/iM8=
X-Gm-Message-State: AOJu0YyZZ+c7ydAf6gezAxQkljAiww9fF55CPKjyLVlunvIRI43t/oiN
	uO4G89N6A01/mSm76jP+B3p/s6ed5fh0sdtfJy/wOfEvY63yKni5zfT8xAYwfg==
X-Google-Smtp-Source: AGHT+IG4DPOB1uYdKCOOEjKLmKXTAuLYXyjLK+YjR+25T9+wH/oFGebCGKN8pKcCDp7b4ORQAknc3A==
X-Received: by 2002:aa7:d5c9:0:b0:567:a73f:ac79 with SMTP id d9-20020aa7d5c9000000b00567a73fac79mr4761634eds.36.1709809441374;
        Thu, 07 Mar 2024 03:04:01 -0800 (PST)
Message-ID: <8428e980-ac88-40bb-8334-d52deeb52bb0@suse.com>
Date: Thu, 7 Mar 2024 12:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20240307103847.3710737-1-xin.wang2@amd.com>
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
In-Reply-To: <20240307103847.3710737-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2024 11:38, Henry Wang wrote:
> Below error can be seen when doing Yocto build of the toolstack:
> 
> | io.c: In function 'p9_error':
> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>   with attribute 'warn_unused_result' [-Werror=unused-result]
> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | cc1: all warnings being treated as errors
> 
> Fix the build by using strerror() to replace strerror_r(). Since
> strerror() is thread-unsafe, use a separate local mutex to protect
> the action. The steps would then become: Acquire the mutex first,
> invoke strerror(), copy the string from strerror() to the designated
> buffer and then drop the mutex.
> 

Fixes: f4900d6d69b5 ("9pfsd: allow building with old glibc")

> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit there are a number of cosmetic aspects I'd have done differently
(see bottom of mail). The one thing I'd really like to ask for it a
comment ...

> --- a/tools/9pfsd/io.c
> +++ b/tools/9pfsd/io.c
> @@ -680,8 +680,18 @@ static bool name_ok(const char *str)
>  static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
>  {
>      unsigned int erroff;
> +    static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
> +    char *strerror_str;
> +    RING_IDX strerror_len = 0, copy_len = 0;
> +

... here explaining why strerror_r() isn't used. Unless other comments
arise and a v3 would be needed, I'd add

    /*
     * While strerror_r() exists, it comes in a POSIX and a GNU flavor.
     * Let's try to avoid trying to be clever with determining which
     * one it is that the underlying C library offers, when really we
     * don't expect this function to be called very often.
     */

while committing. Anyway it'll need a maintainer ack first.

> +    pthread_mutex_lock(&mutex);
> +    strerror_str = strerror(err);
> +    strerror_len = strlen(strerror_str) + 1;
> +    copy_len = min(strerror_len, ring->ring_size);
> +    memcpy(ring->buffer, strerror_str, copy_len);
> +    ((char *)(ring->buffer))[copy_len - 1] = '\0';
> +    pthread_mutex_unlock(&mutex);
>  
> -    strerror_r(err, ring->buffer, ring->ring_size);
>      erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
>      fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
>                  erroff != ~0 ? ring->str + erroff : "cannot allocate memory",

    pthread_mutex_lock(&mutex);
    str = strerror(err);
    len = min(strlen(str), ring->ring_size - 1);
    memcpy(ring->buffer, str, len);
    ((char *)ring->buffer)[len] = '\0';
    pthread_mutex_unlock(&mutex);

Jan

