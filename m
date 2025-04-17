Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83CEA91584
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957013.1350223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JuA-0001SW-0y; Thu, 17 Apr 2025 07:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957013.1350223; Thu, 17 Apr 2025 07:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Ju9-0001PN-T8; Thu, 17 Apr 2025 07:43:25 +0000
Received: by outflank-mailman (input) for mailman id 957013;
 Thu, 17 Apr 2025 07:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Ju7-0001Oy-Po
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:43:23 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0e9e854-1b5f-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 09:43:18 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c2688619bso260605f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 00:43:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b0b220aa259sm2421071a12.3.2025.04.17.00.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 00:43:17 -0700 (PDT)
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
X-Inumbo-ID: a0e9e854-1b5f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744875798; x=1745480598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fvT1CFm4PuErvhoQ1+aI0E8mAOuAeJJCy7e1uH1U38o=;
        b=Mk7tCMjwkM4LmajFtY578Kkqi0HcRAHOS+Rn1/JPLLwuj/kyqXYFKJURjsVzFZdXA7
         DCGzLnE0M/Jo5hGFj153mEYrd790utDksS7nOphnKY5loB5K8ih4R3j4JxcVhF3KsPb8
         ALo3p4rOfzYK9K0P2bwD6w936Xo2NNP54nPZEkh8nGy01fcglTD5BQEmdHSsw5Y+PyYy
         h0JfA1fBBLsu5aqjmmN6tGwJJybnvCCx4xDIw0XxMynHCnB6TFqbMWBZisIRD5EyAjYD
         EspoLEWBjsGuqZYSK4wDbk1zHJ/NDesdKcBoIvJYj+iQZQk9BNSeUk7HOkEoyE78sIXR
         rrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875798; x=1745480598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvT1CFm4PuErvhoQ1+aI0E8mAOuAeJJCy7e1uH1U38o=;
        b=XySwZCTuy67y+eZlrbtAMm+tz12HAq7AmnOqW6chd76rNnf00DM2e+lnTohWibLzFJ
         yAwQy3Ttt4xahu6lysCsjoOzBKOvLUBo/iTt+LA0cJAFPRAW673d9ZH8+GOzfp02WZ+8
         KB1bPd427WwzrTCmJn7hCSimU/of/xYTniuwEjc0WlrHXeFlMzlOzfHXreU5dM/Batg7
         fsSEVzJQgVlt9J2IcdkfJgP0bgUMs9I9T4T+nFRXZggJsEH5PtTUzRWQKidWuBtb2AKu
         p2WMsWoANuFifVFbIWzJOmYS1JIg3EPhJEFCK+ijpba/taVuI+CITr9Vo5G/Jd4WbCaN
         a9hw==
X-Forwarded-Encrypted: i=1; AJvYcCUJn/x3f29j28EgEyIya/LvEvOeimaEx74q5WlhrvBGA2rKKKA1/xOPvb3VpsFKtNwVX2ehKHSQQl0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUiujPWkG5gjkwXrSsT2KWoBv00iSiKxswGRm50vqmutgiBcVq
	hWX2MAIx/XYvPQDhBhgenPguCI1MeK7LRN2ApamZEpoQ1G1wAanZIcqKYTrMKg==
X-Gm-Gg: ASbGncudeDzXzCVVtdU1Br5/JqiVCuOuzByQm724W6UeRJuNp0a+dFtmEiAYr8H32NL
	VweOn4OwXVUII0OT9yK6RIe78VxxtCMQ0CpsQ6bnD+0a7IY4cFfVvmgMw8KPPcOqyHTEKamYseK
	fRXtJJRvJZjE9Q4pHu1NzYHEl5ZmQuWSn9Szp3C3JsnN9OfV5OD1XINCaD0tRRLvmFFEInrVkz8
	AxPX1GRNg0fvIyH/u7/k9FYQEye3uYxEUISjaNUn5sEUaVYZQZC89CPqSMALUGmDbRQBmLRUjFh
	zfCAUqNTJ4HARjEGBkGwWPdjqTpwikqZsSmza87RLf+kPwEuTcE59Zqi+q0ONGmrpf676vViaRP
	iorzC3ZQasE96Pq9ClW3ivbt87Q==
X-Google-Smtp-Source: AGHT+IH9p4NhtX0oTaXx2VUaUsmdTjmBsoGLp9UI3KPNg2MoC9OHuQWxY4zOvOrebcsXzQmWcuddtw==
X-Received: by 2002:a5d:59ad:0:b0:39c:30f7:ac88 with SMTP id ffacd0b85a97d-39ee5b16ecemr4256090f8f.20.1744875797987;
        Thu, 17 Apr 2025 00:43:17 -0700 (PDT)
Message-ID: <1c4f6304-a272-4fb2-8892-43118d080641@suse.com>
Date: Thu, 17 Apr 2025 09:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/io: provide helpers for multi size MMIO
 accesses
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-2-roger.pau@citrix.com>
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
In-Reply-To: <20250415153246.81688-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 17:32, Roger Pau Monne wrote:
> @@ -5115,7 +5115,6 @@ static void subpage_mmio_write_emulate(
>  
>      if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
>      {
> - write_ignored:
>          gprintk(XENLOG_WARNING,
>                  "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
>                  mfn_x(mfn), offset, len);
> @@ -5131,26 +5130,7 @@ static void subpage_mmio_write_emulate(
>          return;
>      }
>  
> -    addr += offset;
> -    switch ( len )
> -    {
> -    case 1:
> -        writeb(*(const uint8_t*)data, addr);
> -        break;
> -    case 2:
> -        writew(*(const uint16_t*)data, addr);
> -        break;
> -    case 4:
> -        writel(*(const uint32_t*)data, addr);
> -        break;
> -    case 8:
> -        writeq(*(const uint64_t*)data, addr);
> -        break;
> -    default:
> -        /* mmio_ro_emulated_write() already validated the size */
> -        ASSERT_UNREACHABLE();
> -        goto write_ignored;
> -    }
> +    write_mmio(addr + offset, data, len);
>  }

Should probably have noticed this on v1 already: The log message is now lost
for the write-ignored case. It looks easy enough to have the function return
a boolean indicating "done", to retain original behavior here.

Jan

