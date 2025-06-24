Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC6AE5E8D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023273.1399226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyY0-0005mO-AH; Tue, 24 Jun 2025 07:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023273.1399226; Tue, 24 Jun 2025 07:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyY0-0005jv-7e; Tue, 24 Jun 2025 07:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1023273;
 Tue, 24 Jun 2025 07:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTyXy-0005jp-B0
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:58:26 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff185bb3-50d0-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 09:58:21 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-453608ed113so43840105e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 00:58:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e217bdsm1216481b3a.52.2025.06.24.00.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 00:58:20 -0700 (PDT)
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
X-Inumbo-ID: ff185bb3-50d0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750751901; x=1751356701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V6xQj0y1FfvS292RhxT8v62hjhwlmlUxYI116gPjOZM=;
        b=XzsHD8c6Wx5el8ZoSz5fsZV0yzSOtOANLOJZ3+cmZLkk65ccIwqLIzSaRSmuP+Dy9w
         Hr30VLH1AP4Ig4BwsnDEBwmzjDXICWBp0yZb5X8jEMmX4nB9gzTSVURRn0XurVfuCj19
         p6imhDLDUTuQay5ggVqVZ+F8yeMrIrs4+3/ZkqGju9DG1fL8UHGC8ugRt71Wip+xp7hz
         vt7m2aSFN/41q0yk4Yu1B45kLf9MLqu0Qt86xAKzPTlf2YNHyMH1BFn02XcwHlHx/xGl
         txnPoU+wLyJujC+pUYigVgCiWGGTvcTnsc9YUz1mSjoin9qE7FsAnIanIcrib2NImytp
         qnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750751901; x=1751356701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6xQj0y1FfvS292RhxT8v62hjhwlmlUxYI116gPjOZM=;
        b=cvFDyzrZHQfE2iJ7upPPStBctxDPO3gqMkzYUGnEGbHBMgjpahJdHIIlK97N/PdLgr
         sqe2a+vsBALCSXF4G8J3+/WjRcrwFX235w46pkg+0wXE99FvipgpFwMtt+NCbCZjTkhI
         5BFQ+jf0H/OxFGHCoqYzg9metY01vDxXda+/hvt6bKFW/Jp4Va7A2JDdBHDPK7EFwOAa
         HIvySUoGJvkJ1DLu6ztrWlyUa1snFZ1/UkH9fiI8rYaTwrK5p08q1r7E4b/HQpekwIgt
         eGkrJP6JWrZPeWa+VhECZUy42LKmwn8f7Z6dmUSXcG4H5CsoIXgKicZckN8mqteCcBU7
         vfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj0u0qIoAVWtUvbmgXXZSOWxxKTud5sGuifp1bbnEQ/abcPE6Y8Et4zZSZ1+HYXCs+eCPu+YWPBaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwThs/ySM57cCn5AQu1xZ5OXCjbgdsnUIwcKOBDS+jHbLQxa5Mv
	xt+pAhOV/D7h6rb6rGVH6LzZyki5AqbUoeJXIHLrMT4UI4nghcaH8M3rv9SCAoWrgw==
X-Gm-Gg: ASbGncs9XzYL4QLtKJn5LUUAHTNvwBzWi1TQ2lK6xQQpXLWoNVpUIxCRd3/FSgmqYOW
	mL13XvP2W9Otn5LkGSXwWgA4URxtBxrYc/OHmdlTGDHy8PzeDliLPbB3zKtDfkBpNojzNv1agY3
	jUuWSzuLUo8pg1kvaOf7EI5vvWuzbT1o+9897blem+WPKHGyBzdOVLjYiLTqEOrT/LXBsexya05
	wAf5GpMzRiDNO52za/Ad8qIGb9gGHV6LpDK+QdWPchgBxIRI3m6UBooCwZDH9k95e1o8NNtr0E9
	NdTo22SCVgMWvoTHTp3uFSlnu5qq4bqBa7ot5D5Ua7og/24ITPDnnu2w4zJQdQPspAhChJ8SFmS
	+zb2fxZLKHKcEY3mKkEYo5n7gZTiyZN17d/UyF5rB5qOwkpA=
X-Google-Smtp-Source: AGHT+IF1jXWbrNsQe4ycNbGox/hi8MTmz/2xGI0w9OsCTCwEWquiHe0kHrsCpDIOuGlDq1VMfvL+rg==
X-Received: by 2002:a05:6000:22c1:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a6d12e5a26mr13495125f8f.25.1750751900715;
        Tue, 24 Jun 2025 00:58:20 -0700 (PDT)
Message-ID: <7d53a801-89ed-440a-b5d2-bbc6abf8a6a8@suse.com>
Date: Tue, 24 Jun 2025 09:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250623202030.208655-1-dmukhin@ford.com>
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
In-Reply-To: <20250623202030.208655-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 22:20, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce domain_console for grouping data structures used for integrating
> domain's diagnostic console with Xen's console driver.
> 
> Group all pbuf-related data structures under domain_console. Rename the moved
> fields to plain .buf, .idx and .lock names, since all uses of the fields are
> touched.
> 
> Bump the domain console buffer size to the closest power of 2 (256) and
> rename the symbol to DOMAIN_CONSOLE_BUF_SIZE.
> 
> Finally, update the domain_console allocation and initialization code.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - parentheses fixup in guest_console_write()
> - move buf to the end of domain_console

Plus do other re-arrangements there, if I'm not mistaken.
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>      BUG_ON(!d->is_dying);
>      BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
>  
> -    xfree(d->pbuf);
> +    xfree(d->console);

This now needs to be xvfree(), to match ...

> @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
>  
>      /* All error paths can depend on the above setup. */
>  
> +    err = -ENOMEM;
> +    d->console = xvzalloc(typeof(*d->console));

... this. Sorry, I probably could/should have noticed this earlier.

Jan

