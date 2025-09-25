Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8457B9DDEC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130052.1469696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gXA-0006GM-NX; Thu, 25 Sep 2025 07:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130052.1469696; Thu, 25 Sep 2025 07:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gXA-0006Ep-Jx; Thu, 25 Sep 2025 07:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1130052;
 Thu, 25 Sep 2025 07:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1gX8-0006Ee-Oy
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:36:54 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60762e79-99e2-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 09:36:41 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-63163a6556bso1314191a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 00:36:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a366116esm756513a12.21.2025.09.25.00.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 00:36:40 -0700 (PDT)
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
X-Inumbo-ID: 60762e79-99e2-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758785800; x=1759390600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+vmBTrttjFBsGU7mSbaGhj/zdpSBS+dYN95fMNlirQ=;
        b=M6sdl6nMUgaMVzGA0Zavanz8QhlBOjVBjkZlgmpc8m6szJlX4DQinmwGbFds9C8oo0
         E1J6lCJeazL9t7GflFl6eettqZzyQz7g4EvV/PZ+XzDuX1yHD4enUWrd6E2OmqsJIdgI
         Syh5MWDHwrkffkPMAQtFO2Fc2JRXbNw9e7jIjoylcmkTk+3oAsIY7nxFXLGzLyh49aTq
         igCpogcTHXr8trKCOOf6blto+SWlrlSZtyZaRBaO3R+tbYbfEbDJ1U718mYk2frGmDOk
         Q0bqcXL6yOBE87C7mD4g2/SMvCcDWnqKVTJtRQqfq7w1yeeZWsAeUBpEbiOcbCJDFemr
         XL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758785800; x=1759390600;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+vmBTrttjFBsGU7mSbaGhj/zdpSBS+dYN95fMNlirQ=;
        b=hg+3FDO/9A5FZFJzxmCf7PWIl0yP/ax4AOWb3AGtGwvPS9z2zQ+qgwwQ+/XO6zwa1J
         2h44abhv+tjBIMuP0Gxp/vi89br0/PVBA5y+YlKoZW1nKRVSXBR8GLWLZizoHTT+MV01
         3H7E+yM3B0aAQnPLEbJmLcQvueMql8uLf+xrm8yFdvmhWAeTb+Tsqb+CbAaddoTHwJyl
         2pFYPmMGX1zTnE3xALl0DKZ2w87OUVWT4WqGBhVxbu5SnM1/z7OpnkTiViPz8b9O+hur
         0WJP9mVxJJDdFgVL6dXVlFG4C9rsG2KUYxFE1Vf7CyEnBAnli0hn0yzT8IXRMs1xC5L6
         LiRQ==
X-Gm-Message-State: AOJu0YzjTcHOhozNY8rkbJdgnjCrQsAovdAbps2XMC3JL5QaRpLSyXRs
	n4ji3qHnajyPfgdK0kxZf9qJAC6G9rRA/0sDIujfym6nSQ8H4EhFcqXkpIqHM5xmDg==
X-Gm-Gg: ASbGncs8UWFeVqwN/ihbQ5O/y4JAlxsvlu/qYRku0eItwtqgcPkUkbJOxAqfg96WGPx
	aexCzjtjePpyv06+3a5CyYkVA1qMwmx3/yNZXJaLtUjmDYaflVb1BilUykJR6Cm0g+/D5fcylwF
	yfHCSIHc9iIJEru5eg34G8hlB17KRsg4ztXd1Zt4QFN5YE8qBPNFJNBAb0tMTkNZ2j0L7zo8uIc
	1j4e0QATVlgXn/3yxAVp87lITY9kve/n2ydKc48sOLJHKjGyibbuUMDnYSjIXLendSGBo/DdU6G
	rn5uA+BbSDf4DF3j2dNh3f9ogd4FdetBNyV2jaaMoJSYBmcamWh76ZJQEuNDP3DdytkLPffQEnR
	DdxzaWdamKNz39mU200nEyu1lB+ysu3xKK7qSBJ1NZmE0rHDgkjUEmH7NCcjqO0cWS6F2o3/4oX
	E1sKZHB2U=
X-Google-Smtp-Source: AGHT+IEJQcNsMEU96TbCtf1DQwSR6UxFle5gquwgY/P1j6ERZA+7+A0lc2B2YVV/C6Bi2FNkaVMMXg==
X-Received: by 2002:aa7:c993:0:b0:62a:82e8:e1f6 with SMTP id 4fb4d7f45d1cf-6349faa698dmr1440511a12.36.1758785800418;
        Thu, 25 Sep 2025 00:36:40 -0700 (PDT)
Message-ID: <6fb3e095-172e-4cd4-8c26-60be6c5de704@suse.com>
Date: Thu, 25 Sep 2025 09:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] symbols: discard stray file symbols
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
Content-Language: en-US
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
In-Reply-To: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 11:00, Jan Beulich wrote:
> By observation GNU ld 2.25 may emit file symbols for .data.read_mostly
> when linking xen.efi. Due to the nature of file symbols in COFF symbol
> tables (see the code comment) the symbols_offsets[] entries for such
> symbols would cause assembler warnings regarding value truncation. Of
> course the resulting entries would also be both meaningless and useless.
> Add a heuristic to get rid of them, really taking effect only when
> --all-symbols is specified (otherwise these symbols are discarded
> anyway).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I please ask for feedback here, so that hopefully we can have this
sorted in 4.21?

Jan

> ---
> Factor 2 may in principle still be too small: We zap what looks like
> real file symbols already in read_symbol(), so table_cnt doesn't really
> reflect the number of symbol table entries encountered. It has proven to
> work for me in practice though, with still some leeway left.
> 
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -213,6 +213,16 @@ static int symbol_valid(struct sym_entry
>  	if (strstr((char *)s->sym + offset, "_compiled."))
>  		return 0;
>  
> +	/* At least GNU ld 2.25 may emit bogus file symbols referencing a
> +	 * section name while linking xen.efi. In COFF symbol tables the
> +	 * "value" of file symbols is a link (symbol table index) to the next
> +	 * file symbol. Since file (and other) symbols (can) come with one
> +	 * (or in principle more) auxiliary symbol table entries, the value in
> +	 * this heuristic is bounded to twice the number of symbols we have
> +	 * found. See also read_symbol() as to the '?' checked for here. */
> +	if (s->sym[0] == '?' && s->sym[1] == '.' && s->addr < table_cnt * 2)
> +		return 0;
> +
>  	return 1;
>  }
>  


