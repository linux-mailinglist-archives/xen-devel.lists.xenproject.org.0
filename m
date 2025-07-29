Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4EB14A9E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 11:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062304.1427962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggCu-0002oh-Ij; Tue, 29 Jul 2025 09:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062304.1427962; Tue, 29 Jul 2025 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggCu-0002mD-Fk; Tue, 29 Jul 2025 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1062304;
 Tue, 29 Jul 2025 09:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugg51-0006C0-6F
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:53:03 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f1d0bb5-6c59-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:53:02 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so2940864f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:53:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b420351c3d2sm3198707a12.5.2025.07.29.01.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:53:01 -0700 (PDT)
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
X-Inumbo-ID: 6f1d0bb5-6c59-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753779182; x=1754383982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rEHfcRqV3MBpA/v53GsPEK6uX0VSS/rQERp7qHUtZmA=;
        b=HDAnewB3lQY2Uqe0782jiJT6r5FAJ1mHU9Gn9u2qW6CGFI3zt/7OG0WxqOTyirBCJP
         NZeKLPR5rUqy+zDHJyD9kgZKuyqSr3ll7OwJgIQZlepy0nElJQt3aJYnGZ0tfUmGKqw9
         VWEf8b37vuuN/Y/3HLqGu4nN8d6sQGjRCAxktsWPGHU0xmMTU38cYcgrG9wUo1af0Icq
         mYDMoIZgwxjdz0+W7qfkog+Sj+rTj7jmikFquzaTsryRTBnLjQaLXSpCbjwxtL8efWuX
         ccpsRdNIObrk+IWxy/1kosJE2GQHO650cR36MJGaxhfoAkJa3VDirKBzz1HtEaHdfyis
         LCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779182; x=1754383982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEHfcRqV3MBpA/v53GsPEK6uX0VSS/rQERp7qHUtZmA=;
        b=tDKx84tXr2zEaz9wbC1RYbQPFWBQZooGjoEFPMEKzAGBM94wL8Ntx4PU+8hZcMm3gu
         MdQWe7Zf6M+S8xu0xS/eYy4v2/wtsj8yu9aeu+qn18MoFULITC3brRpwuI6N0j0xTou2
         AnuN3+cF0ztEGLZyDuHhC6wn7d/g0Yu87PyVqHW8r6q098d05G7Bj7EEEgXa2f31DdNy
         JNR5atM2Hss+UFrtwzV1mWRv8xx6ffl26eodkL1KlxI4IkioMakk2d11O2950k/1NoWf
         9d8rC387TGqw3U3m3J9mvGCQ6/VOAYyqVEeJkjcJ77WqemyTRYCkbiRklGKLZiJdXfds
         NoAA==
X-Forwarded-Encrypted: i=1; AJvYcCUfsTop6zRKIxbv5Jh9iZxBaW5nsToWGIile2zADA8V+4OGDZWWHKeASRchsB2zDxCaZsmRUTbotc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnOGy3CMM+OTzR/wweEmmg4sdvgiPv+X8Aooc0CX0kmwVcZu5z
	MID6nrizh/jMmGGFyKCKEIMEfAbQhduQQFF4WHcmcovaT4wzZz5ffxIQZDT5HZQuyQ==
X-Gm-Gg: ASbGncvDIYHzNM7m0bhtNRRx2uHzCTudi4pc8lFDR8000HzyBNGf2KiLr+w3pb/eRf6
	w67E8Iag4g7TtREnX0Kz87zMr6i9HuwKNWfKsUY9Xp6J9sbUeCIvLKZQvap6wHsh93l+MaKiDED
	NmIxUlSpcSLC2vM7Rbsw6SgduinhCgt1/WP+MLTrqQijeIByIW5DBgh+1EMOkLgLVSWmbtPElno
	XAaNKKPz+HFdPZZvAO6EKmboKdr9zEdZzyKrO/GSYttDvvmx7Ry72KA19h3uNbF5iPwmeZWlaM0
	3y/9oq1S6YbbNDGbhvTC0PwwUiarA1R/EMM/ER5RK6vpzC/wTYl9TG3SV7e/cn39XwZv8I0mFih
	if5D1qHbIUlSUuJD9+jeE0OM+XIDqMczAvxWIvQvLcFhiSvG580DFFWSCwsF4D8PHBZIcO7u/Mq
	noKp89aQA=
X-Google-Smtp-Source: AGHT+IFcCYoHjXwjmi7PMeUlJquckSj7oo/H+CmB0+mZ/Ol9FCQtfaNIxyOYyP9/8xd6JWkH5fSiRw==
X-Received: by 2002:a05:6000:2c04:b0:3ab:27f9:e51 with SMTP id ffacd0b85a97d-3b77675dad3mr8953251f8f.31.1753779181746;
        Tue, 29 Jul 2025 01:53:01 -0700 (PDT)
Message-ID: <2fb97c32-f0e7-4d9f-bf3c-5fd621498b29@suse.com>
Date: Tue, 29 Jul 2025 10:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 1/2] mm: provide a way to do very early page
 table allocations
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250729083829.11038-1-jgross@suse.com>
 <20250729083829.11038-2-jgross@suse.com>
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
In-Reply-To: <20250729083829.11038-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 10:38, Juergen Gross wrote:
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -640,13 +640,20 @@ void change_readonly(bool readonly)
>  /*
>   * return a valid PTE for a given virtual address. If PTE does not exist,
>   * allocate page-table pages.
> + * Provide a small pool for allocating some page tables very early. Those are
> + * needed currently for mapping the shared info page, so 2 pages ought to be
> + * enough. Add one spare page anyway.
>   */

Hmm, 2 pages plus one spare doesn't yield ...

> +static char early_pt[4][PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));

... 4. Was 2 a typo, and 3 was meant? (Which, just to mention it, then isn't
correct for 32-bit aiui.) Whatever adjustment wants making - happy to do so
while committing. Just need to know which way. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

