Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96867A790B8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935817.1337196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzylv-0003Eb-C6; Wed, 02 Apr 2025 14:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935817.1337196; Wed, 02 Apr 2025 14:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzylv-0003Bz-8u; Wed, 02 Apr 2025 14:08:51 +0000
Received: by outflank-mailman (input) for mailman id 935817;
 Wed, 02 Apr 2025 14:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzylt-0003Br-RA
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:08:49 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff4f69fb-0fcb-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 16:08:48 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso31681775e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:08:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5fcf42asm21941685e9.15.2025.04.02.07.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:08:48 -0700 (PDT)
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
X-Inumbo-ID: ff4f69fb-0fcb-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602928; x=1744207728; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Tf+vyRuessvExbURnykkCoocQawVoLUKda5jgwwcM=;
        b=clfvZ9Aea78gNZC0fBYmZYM/WsHY/0iGcUBCUOZMsseUNEkcAZ+TYppgamUGFstGOj
         J8xX8HXQA1TxvnIpq4j5VoZDyDdPEZpcQkYfPHEikHcIM2bKoKzwRWL2f30/T+yb0mUX
         psFgxzBGMZf+tjUTYNiqWXBokJAYw+R2+VvbLk6I8owJ5zmPrnlCW0RZUKD2C1jAG6Gy
         BJKAWm+R39v2cAuOw7HsFHI6ImALK2X7AoGH4AvSeZrX/2heOb0pMsMGhYs6+UXl82pc
         Hplhb0giWAqXBj19V6nPr5Hbt3yA9pPJoPySg4zaYmwIa02pLqYiOrKpj6pc9ly6BUXa
         Q6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602928; x=1744207728;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Tf+vyRuessvExbURnykkCoocQawVoLUKda5jgwwcM=;
        b=vx7WRTDv1CM8pcgQDSfhThzIUY9p9ZsQJ/gdYbsPbyIN4jqi4V2KzfkaMnS+bNz1pY
         4cquo5EOY67f2HNpMIqwz2JS1V1o28QOt9vgRawiDCVXXaxYYpIWE05YJdsHiI988atW
         Avo20gdT6O23+udYZdc34/U33m8hUVnYHhroZwZYASVocIUmsc6W07gbLoC8heiLBqRM
         dDU/M1dSVzGyp/F8/HV11lWUCti/KF4IfQ4Mq73yPnKclDe4c0YSCBVlthmAcPl/NoFB
         dMnwh7+mFieXZAigsmRsQEGq08vnLJhI/4WbuuSL0eqKZFOV5ZurVBdxWqChuw/pUPzE
         9QTw==
X-Gm-Message-State: AOJu0YxsvdJwbMmSHFakwh+oV0b0RLqLnO08gMjQv2rhzNM8VatS0NJO
	XQfPm8Pjjt5xLmN6N/lQKmtgLDCd3JpERuXCdg4Rc7NJ7UhTuI+6Jkw7d2pqdgXuQ0qZKyoN7R0
	=
X-Gm-Gg: ASbGnct9wMAUKczfvlrC5SPBYncfJbiQBFHiZe+Ol4kf4iwdMjrUztBbuk5fRk1JBru
	KcINPuDqLsDmSnw6iv3MSLEyoac1/OmENEND29b8f/DjSOJYkLDtDmVyr2d5P5TS9TtX5K4q9O4
	dOdBHBugM735cqiboONTMBQZC/13OOTW1sVFiltAFTUZMgmaboNtjgAnzGIlTQ50hStHyz60qbs
	nS3LIP24FCMZbbL37iP3nT53YLk+DP5BdezDYNunnO6vJALkdnk2kU7osGGecN/rXfu3NRUGqUQ
	VU4jZ5TBjnHprIPEYlC/Ir/5/ZinYJ1DD07YHX3ZEWp405lRgcc1xYUB4sDP1KY9u1clc1UKL7/
	caG1b3cKN624S6EQgQXushB6cTh0RYw==
X-Google-Smtp-Source: AGHT+IHXrBIEdAz8Ufpjv2r4Z3PDNfUacDh+ULRDT8MD61NisaNchvS87gpgKN+Lh8Fvp60ZrQxutg==
X-Received: by 2002:a05:600c:1e1f:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-43dabe18000mr201059325e9.0.1743602928254;
        Wed, 02 Apr 2025 07:08:48 -0700 (PDT)
Message-ID: <b42aa0a9-c622-4fc9-83d9-a14811169e6d@suse.com>
Date: Wed, 2 Apr 2025 16:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] symbols: arrange to know where functions end
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
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
In-Reply-To: <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 15:58, Jan Beulich wrote:
> When determining the symbol for a given address (e.g. for the %pS
> logging format specifier), so far the size of a symbol (function) was
> assumed to be everything until the next symbol. There may be gaps
> though, which would better be recognizable in output (often suggesting
> something odd is going on).
> 
> Insert "fake" end symbols in the address table, accompanied by zero-
> length type/name entries (to keep lookup reasonably close to how it
> was).
> 
> Note however that this, with present GNU binutils, won't work for
> xen.efi: The linker loses function sizes (they're not part of a normal
> symbol table entry), and hence nm has no way of reporting them.

And, just for reference:
https://sourceware.org/pipermail/binutils/2025-March/140252.html

Jan

