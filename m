Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD02AED4B6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 08:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028857.1402530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW86c-0006az-QP; Mon, 30 Jun 2025 06:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028857.1402530; Mon, 30 Jun 2025 06:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW86c-0006ZN-Nk; Mon, 30 Jun 2025 06:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1028857;
 Mon, 30 Jun 2025 06:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uW86a-0006ZG-Or
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 06:35:04 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 598ad93d-557c-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 08:35:01 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso991627f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jun 2025 23:35:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b7915sm74513785ad.165.2025.06.29.23.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 23:35:00 -0700 (PDT)
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
X-Inumbo-ID: 598ad93d-557c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751265301; x=1751870101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qKgqytZU9Ouq64bKq0GpYaNbg79w/3qqqRxlDsF+hAw=;
        b=FunpqAZFg/yRZku6q50ciIxyRVIti2xhiaSp9ZT3ZSanmEZIoOP/g+cl+XMYp67rQJ
         uFtH5VieuOfy5pvpf0aUj9LAGkATqAjgruVkm22P9bo3uvgOpl8+aDWr357QPhXAthAS
         CYcJL9OTGv892Ub8DsmHS0Fv/6sDn6OdzMcPQuW6QDFr1VoTot0Z4Xl8elg7YL9ur5tc
         G+2L3ZdtnEOj3u0aakhHw17U/UgorpJpZuMgtJeuyjD5k2EPkDl03Fv60Gr3sznncRK+
         dUvQG2lbXmV2Z7Vdj+rotSnuxlE0Bks03HVUdHtSweB6Ich1H1aO02OPHcj4zRUrykLQ
         +y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751265301; x=1751870101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKgqytZU9Ouq64bKq0GpYaNbg79w/3qqqRxlDsF+hAw=;
        b=W1VZEKz0ZLdEhvNkkFEolmc9zPZxnOyH5xsYeUsV71jwFD0D7IanTqcJQEk0ck5HM+
         rNlitJ3ejLgUvmR7BMLTpgXmUY8XUnB0DgvUgOvckNbTfAHGIvQJ1qo9s0upECTdRoHb
         BwLfItJVNpukBujtEyNwqKvOIGNhXb1wDWw7XSQP8ummbo9+fzhDU37jCG+fA3DtaUJ8
         ykP+8O8iLhIB5eiKw6mUrd9LbtRamf6/lygRWnl3EMYFNzGlI1dz3hyXu4V+nDXFS+ql
         7oLmADYy6YUIrZsd6YJTu6U6FkN8J6UGpU4frLWk3fhEMzAQ7TIJdXPLdJMXrQNk+nJD
         A0lw==
X-Forwarded-Encrypted: i=1; AJvYcCWAEYjFRlQRGhB1UioIC94FvSs2iIZKN3Xg4W+PfY5Dg7uyJpi8eTHZgCejpiWwdNLFo1iDBNcQLM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCK4IPy54ikyTeCCzfYJShrFm89JyzN6RX0h+m0RlxnbJkbKpH
	OLJocHzrRvYyt8dPH6x8CiCSG2rad5Vd/mS8Vez6bAg7M7bIndHvIKymtBax40PBKcFo+Gl2oIF
	9MZo=
X-Gm-Gg: ASbGncvrJpFSP/W1OnbMMlkAEUyUrx5IgP095ClrOV2IMumstJWhW2D8gN1tH6h5eFA
	zqyrcS1XkbP3lVMFTzQPRUkCFbP87bG7PYPbdssja3GL1aIg5ky2caT81JEYPB50cRYADYSj42z
	9bncfM76ze0k2y2bhi5WM20ta+j9wPHDrl+n+vvgCzI8AswPUjQaFRS5bk1DoFxo79VG4me0nHR
	RGsMqKNCaxWaR76aBSeHd/t2/PyV2JNn1uF9Cbanr5jpcrYnKM/oxKlNgC8Zl6KFXmt54R0YVcq
	Kw5R0AJl8psfCWUo/JTsF6NTKHIp85lbRFPnR6YTF8RsL22p1aEakG0DV/vgHrsiZa/nu98dDKC
	WZ5mgLbciOKBXDIayQ79Fdzi67wfDiiP2HoGrRg7lByWkTLI=
X-Google-Smtp-Source: AGHT+IF5caMpYQpxzEvd7sUoovMc0KqsjGipVASCHD0Vbs60TPPpsq9SdxrW19OVEhOw36xYjzpQmw==
X-Received: by 2002:adf:e00b:0:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3a8ffeb43fbmr6490554f8f.58.1751265300999;
        Sun, 29 Jun 2025 23:35:00 -0700 (PDT)
Message-ID: <e895039e-48a3-4a46-907d-660555b95dcb@suse.com>
Date: Mon, 30 Jun 2025 08:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
> @@ -40,6 +41,8 @@ bool __mfn_valid(unsigned long mfn)
>  
>  #ifdef CONFIG_PDX_MASK_COMPRESSION
>      invalid |= mfn & pfn_hole_mask;
> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
> +    invalid |= mfn ^ pdx_to_pfn(pfn_to_pdx(mfn));
>  #endif
>  
>      if ( unlikely(evaluate_nospec(invalid)) )

In the chat you mentioned that you would add a check against max_pdx here. While
that feels sufficient, I couldn't quite convince myself of this formally. Hence
an alternative proposal for consideration, which imo is more clearly achieving
the effect of allowing for no false-positive results. In particular, how about
adding another array holding the PDX upper bounds for the respective region.
When naming the existing two arrays moffs[] and poffs[] for brevity, the new
one would be plimit[], but indexed by the MFN index. Then we'd end up with

	p = mfn - moffs[midx]; /* Open-coded pfn_to_pdx() */
	invalid |= p >= plimit[midx] || p < plimit[midx - 1];

Of course this would need massaging to deal with the midx == 0 case, perhaps by
making the array one slot larger and incrementing the indexes by 1. The
downside compared to the max_pdx variant is that while it's the same number of
memory accesses (and the same number of comparisons [or replacements thereof,
like the ^ in context above), cache locality is worse (simply because of the
fact that it's another array).

For the example in the description, i.e.

PFN compression using PFN lookup table shift 29 and PDX region size 0x10000000
 range 0 [0000000000000, 0x0000807ffff] PFN IDX  0 : 0000000000000
 range 1 [0x00063e80000, 0x0006be7ffff] PFN IDX  3 : 0x00053e80000
 range 2 [0x000c7e80000, 0x000cfe7ffff] PFN IDX  6 : 0x000a7e80000
 range 3 [0x0012be80000, 0x00133e7ffff] PFN IDX  9 : 0x000fbe80000

we'd end up with plimit[] holding

0, 0x10000000, 0x10000000, 0x10000000, 0x20000000, 0x20000000, 0x20000000,
0x30000000, 0x30000000, 0x30000000, 0x40000000, 0x40000000, 0x40000000.

For this example the 2nd of the comparisons could even be omitted afaict, but
I couldn't convince myself that this would hold for the general case.

Jan

