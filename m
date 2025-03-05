Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9DBA4FDC9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 12:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902211.1310173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpn3W-0005Kx-Mk; Wed, 05 Mar 2025 11:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902211.1310173; Wed, 05 Mar 2025 11:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpn3W-0005IV-J5; Wed, 05 Mar 2025 11:36:54 +0000
Received: by outflank-mailman (input) for mailman id 902211;
 Wed, 05 Mar 2025 11:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpn3U-0005IN-Sg
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 11:36:52 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e07aed-f9b6-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 12:36:50 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bd03ed604so9966715e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 03:36:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484489esm21159162f8f.68.2025.03.05.03.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 03:36:49 -0800 (PST)
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
X-Inumbo-ID: 20e07aed-f9b6-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741174610; x=1741779410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W/bZmWa2TlkhDcqJeZ5IU0BlLMr8XE1pU7pwumDx8CA=;
        b=efDzLbo6LrsgzSqRdAlDVxWtAFqux3qO9bGYB8f8usnOBRmEsMtuX29mVvTaKJMbpo
         CtvaOr1XVEyq333PF3DUx7b1J2G7ZznyKkETzIY38LndO/djzxn1EW3S0wrNOLE6TNhn
         PCfd0I6TJx6Ha4805HMORdU+lcASHy1xy45LBGt57OX0Ffy1F9zNA9WrjaGf/nZH5uLM
         kP64AnUioCV55ALCUCRTJ5cQL9zf475URlIbsCZXHdQPquIFfZQw7eA8JIkiWlNIYUgh
         /YpAeeoQwDoW8xBuHmJCjRV8jeOdIBJbn1PUQHByP0zj2syczSvw7q/yLdQOeHLtJUqA
         0qAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741174610; x=1741779410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/bZmWa2TlkhDcqJeZ5IU0BlLMr8XE1pU7pwumDx8CA=;
        b=WetF40i6TvtDgAwB/LsJ7hClAiPEN+j2/GdDKf0p24e2FLuXFaoOLWnj+AkWW0gLXP
         lnLj+SEI+n2Rp6Lo/oA/Bm26IMP8gspb7sPFUI2rp4WdV3mb3HL6QbZnFE6a3JV1ETln
         dDEvh/ZqnUsHdGZnWDOMkLU3OABx3aXIogbPf/udayjhAal1dF2q3u156kUsFw6xTbnJ
         wsauakrmv/sA4qOP3+eR6WoOHClNwRxwL2sjNvCjnMT7JI/WXz5pfxLVdqoSmlHnhwq5
         UbcKkt/A8nMS9YDJMaBZ7QcsRbl9dSJtiriZq/WmBPofW+L/NgK1uMaPWhlHoIPCkJGt
         /sBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6j+bh/N+tK8qXmia7S+uUcmufxJCDnAAOfJKcbpR7ueJ/920+FvgwRaTvI4wpuxVSiESymse8Q2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYGs1Xk3wmjD7ZDeIdWb2vXZjSUX7V0nYsUjcnzVxUzGZbR7ct
	V//Al3exCZUHs/FWG6b2YpCRtI/v/iW5xpW+GWV/Wj1BSR1CA9ho5AatDX0qDQ==
X-Gm-Gg: ASbGnctENj2Aj/PxZ+UNwbMj9dwu9zbqK0uK4IH66nsnIQ/X3nxZj+DY+KV/M6iYOU+
	kXN0+jaWEU2xeC0OUQ/P1ulvmNOMkuj5li8Pvu4bfYNZb2VPrkpemLjjrS3qK6Xoi7Ccl1slvel
	15xvP96RGcW9vgc0hHgtLgwMZbqq15aC32HTu/rRKpMH3m/od+exp8cTr0hlkk1t6UOPCyOWxCF
	6dSO3mhBt0JVJ2UyX9uMp1p44qpx74I1W/y7z0yceR2Zz/bYM8keqjmg2uoElP3LwQ13zX15G5G
	IO8GnXhlHz4DIU41f1b21mnjjZPt6WtCAhmhEYPlagLmzHZkCl7WnSOi1Ip4tspGMRiA9wJa1UZ
	PPXPzQkpibu6amSjrF7ZE/MlGyg0TBQ==
X-Google-Smtp-Source: AGHT+IFgmKuswOj294ppMALG72o6/WqlM2CHVNm/vXIzSQxFIGZ0H/tFnTsB9JkWpXe+e69WXr5S9w==
X-Received: by 2002:a05:600c:310f:b0:439:985b:17d6 with SMTP id 5b1f17b1804b1-43bd2adb414mr19397075e9.27.1741174609716;
        Wed, 05 Mar 2025 03:36:49 -0800 (PST)
Message-ID: <1f763c1a-5844-42d8-9995-3a07f3521172@suse.com>
Date: Wed, 5 Mar 2025 12:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250304232218.2768344-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250304232218.2768344-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 00:22, Andrew Cooper wrote:
> There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
> the CPU and dirties it even if there's nothing outstanding, but the final
> bitmap_for_each() is O(256) when O(8) would do, and would avoid multiple
> atomic updates to the same IRR word.
> 
> Rewrite it from scratch, explaining what's going on at each step.
> 
> Bloat-o-meter reports 177 -> 145 (net -32), but real improvement is the
> removal of calls to __find_{first,next}_bit() hidden behind bitmap_for_each().

Nit: As said in reply to v2, there are no underscores on the two find
functions bitmap_for_each() uses.

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1699791518
> 
> v3:
>  * Fix IRR scatter address calculation
>  * Spelling/Grammar improvements

The description starting with "There are two issues" I fear it still
doesn't become quite clear what the 2nd issue is. I can only assume it's
the use of bitmap_for_each() that now goes away.

Preferably with this tweaked a little further
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

