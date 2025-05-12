Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E01AB3A91
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981568.1367970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU7u-0007o0-8n; Mon, 12 May 2025 14:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981568.1367970; Mon, 12 May 2025 14:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU7u-0007lG-5e; Mon, 12 May 2025 14:27:30 +0000
Received: by outflank-mailman (input) for mailman id 981568;
 Mon, 12 May 2025 14:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEU7t-0007lA-3K
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:27:29 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 359a829c-2f3d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:27:18 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fd0d383b32so3012106a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:27:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc3f5c9sm5856742a12.28.2025.05.12.07.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 07:27:18 -0700 (PDT)
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
X-Inumbo-ID: 359a829c-2f3d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747060038; x=1747664838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qqmo5CL3c5gsz3mZVjw/Wmz019VO1n40VjC4cP+wD4E=;
        b=fPjhWWlsBC4pbF4VC+9xivrO8BidI9VuYg/iv563SqoQ6f+1+h84r5aoLRgM7k/jn5
         MzhPjv21eObIYDzaS1C1Kx8+Ju7C+Z+M1v9UtHNV1I0sMKtU1V9dhEBga0AY33Z86wAk
         eYXnF/0uEwqlEK24xCBfLk3M+Zperhu+DGQK25XLBClq1r5Ag12sk1wFXCnB4axzKJM4
         uhBN6wLfHMD6qHILxvdziBrPoT/v9WMATKItHB7YRg6Oyxz0ZnLfCUJHh293tIqweVvA
         xXxhRru0HvqKEd5uaWA0M3dcEVT50r7CE+tTiKzNJZJ1dEoVSDvJwyxLaer1yzo8nOU/
         gF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060038; x=1747664838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qqmo5CL3c5gsz3mZVjw/Wmz019VO1n40VjC4cP+wD4E=;
        b=p5Y30kfys8GtaJ3OcremQebVDMLy4PZcmSAsQ/jhj3MQf0y3syD6dLXf/MrbxNK/k1
         ytDmFBmNEk8pVqPv0hnN300hrGN5nP8Q3B3Zc3qUKSOoQbg2s15zkA5juxBKZ/LPvCix
         ELAL1clRlCTQNoX+/b1C55Bi5e2E2d2docqcpc6e+ADE0oDz3wgZmsM/m7V+w5OGIOd3
         gzj2dLHJtDIufoPLj+EYZ4HE2CHjK2lt6xf+ax8YK6hgFT/YTw5Dyx7ijKEWi+Ed2W01
         QKcJKTYOFl+G8yI7uebKG9U9YYdIY69w6VxJp43p1YIBspCoJQZgxaIpHy86fhSzvDe0
         n7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX/ySrvizhpzkyv7y30aqvGt/Jw1iBZyLoWwews6Dl5z1PlPgeVjctYgvNSgMARsZzQ9WGd4G2AxGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaQoE0QfLTxW9UsSgJ6kIrycrfNFui5MKdf0Gby7949DMG5mhv
	RUyYg2JbTVT6c8oT8pRLuidqGyQNAiLbio8iMjLw25vEhzWCCpiTXcLRctdIDA==
X-Gm-Gg: ASbGnctwfl087LE/aKbXJmKOG7fY4VnrcH3i6BCgQww2DDxp55D5lhkdCaCHv21zqWu
	lY4EiIyn30wbmKiL2qj9+S643CEoCxCiGq7GLDLa4P1eM+gadpKFKQKgiVcFmTS6dz80dPBPY+V
	7wnsaOqXz+VUpE+ivPTTzfjf6xoBLwHr8djekun8VAwhypPBJfDeK0A4fSLG0hb9uSPQf0g64bA
	+O4YRnoq8/ISX1NcXuQ/l2c4iBvpQwcf+Bu65rKqBtHOPrHZutyMyND7uKOowx3kDwCkHcl/PSI
	4/4uodJeA0GySzno84Rhmp29GHJ6C4s+xfHlBV4kJAysplmu4nXsXT6W32ZLifqi0kmGwt9YRrF
	ZRw/nu5hXpEXU1yfRYLzsTOh6IpEuZ4XjoswT
X-Google-Smtp-Source: AGHT+IGD8cYe56+34TdE6ssJ6nYBjI4mWbH6ySXD2OW6SgrMIGYSEtpUajRU6s8Rm7Z607SEy4PfFQ==
X-Received: by 2002:a05:6402:518d:b0:5e1:dac1:fa22 with SMTP id 4fb4d7f45d1cf-5fca080a47dmr10733342a12.21.1747060038421;
        Mon, 12 May 2025 07:27:18 -0700 (PDT)
Message-ID: <41f0e746-5200-417b-93b9-36b6d8b33d99@suse.com>
Date: Mon, 12 May 2025 16:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] x86/gnttab: do not implement GNTTABOP_cache_flush
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-5-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> The current underlying implementation of GNTTABOP_cache_flush on x86 won't
> work as expected.  The provided {clean,invalidate}_dcache_va_range()
> helpers only do a local pCPU cache flush, so the cache of previous pCPUs
> where the vCPU might have run are not flushed.
> 
> However instead of attempting to fix this, make the GNTTABOP_cache_flush
> operation only available to ARM.  There are no known users on x86, the
> implementation is broken, and other architectures don't have grant-table
> support yet.
> 
> With that operation not implemented on x86, the related
> {clean,invalidate}_dcache_va_range() helpers can also be removed.
> 
> Fixes: f62dc81c2df7 ("x86: introduce more cache maintenance operations")
> Fixes: 18e8d22fe750 ("introduce GNTTABOP_cache_flush")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Ah, here we go. I think this is what we want, without patch 3. It will want
to come with a CHANGELOG entry, though.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -940,6 +940,7 @@ static void reduce_status_for_pin(struct domain *rd,
>          gnttab_clear_flags(rd, clear_flags, status);
>  }
>  
> +#ifdef CONFIG_ARM

Better introduce a new Kconfig setting (e.g. HAS_GRANT_CACHE_FLUSH) right
away, in case RISC-V and/or PPC would also want such behavior? 

Jan

