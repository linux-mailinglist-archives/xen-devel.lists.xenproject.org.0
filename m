Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E359C8DA96
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173698.1498714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYmT-0006nD-1V; Thu, 27 Nov 2025 09:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173698.1498714; Thu, 27 Nov 2025 09:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYmS-0006l4-V4; Thu, 27 Nov 2025 09:59:16 +0000
Received: by outflank-mailman (input) for mailman id 1173698;
 Thu, 27 Nov 2025 09:59:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOYmR-0006kw-E8
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:59:15 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba0d70ed-cb77-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 10:59:13 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42b3c965ca9so391048f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:59:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a6fesm2941210f8f.20.2025.11.27.01.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:59:12 -0800 (PST)
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
X-Inumbo-ID: ba0d70ed-cb77-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764237553; x=1764842353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YWWYoCn4AJLi5BeXC1DvuZZmF8MDTqcVqzLkIlvOaCU=;
        b=CU2poOAWHdxv1opASDPEkeabxeAw5UcJ/ycKl1BM19s1URnh6GQAxn/BAK7TGIr/bg
         EqWoa5WrFh1SnaSKs2SCKYwD8eVxOW/uqJDOn8YZ4wNw+kLs9dIFaMoYRcKG8OB/Og5o
         Sqtb3FTdKvJ5CUDVwZsgwGst6u3z2h/xqv6OOf9btFIdbnPdz0ZhMk53fdpkif2PvpIE
         FD8g376y7WI1E5H+3YQ7dpmoiHSuU73YWfHrmn9FL6dXMAtVggQGKwQDOVqIeBR8R8Tu
         IRxHdsifi4rQMH1GVzoODFdIdYaraJbhqYgs1CF1tKYvWCNu5BWYWb/CgnEa9BA/XjxA
         a5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237553; x=1764842353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWWYoCn4AJLi5BeXC1DvuZZmF8MDTqcVqzLkIlvOaCU=;
        b=na0sBgmT0XOcU9NNRdoJAnAPRPyOUQCxhAxpXZmi2uhSkMsrOpPlttgH7d0TL//7Cj
         vhe8bg0Zs1+Lb7utY/8qYB3DC2n2EVJaPjquYR78ux08Erc6UuedZx6K/CzMD4YfvM3M
         bkPSlR9BlNF4w+J9D5bWG+LPbwsYx4biH5nl6WdryvyoH6E3KWQ0xoLJeu+uruBQQIYJ
         ela5a/hGi7oSW8jtgXJ4Ogl4Dci7CKW6hVb3WG1ajrbnkJ19Y7uA425uyDJXL4opqNpH
         NmAfcc9pPWcBa7EutdjuINDzu6dzs8mKxi5BOXpkSzo0i7AqytYQMWnXfQJg/ynTRb8Y
         dPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9eq0KPZy7gTrp/p4GL7Xw91smSNRnTJ4LYaeIFvZbB4pKigjrRpy6xXOl5GTlkl/AvjWpjmbfjPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiDDdOOts0F6Y1u38Ls8Dk4ZW3wUroBHGRT+3Cez4KUotzrw9Z
	aF0oMW0wW8rj6tc4b55EPcgwCMKS6OZcUWMl91ud2nuHoSyNsuydll4KmUHsYjQtvw==
X-Gm-Gg: ASbGncuEVvWUOipMOKlC/7LQ3ctXdyGRgK7h9GbMaDclUGHVwVQQ3kanQKQ8agwh0Uf
	u4E0Zubmw/VmIzHLamHXRUCKpc70Crrkpv/wy0u391Q8EJtzDuJmvUP6JSvNnbJAN8JPcCy1PUr
	WgoIAVtH8cuzBkz9M3Pi+wDGYgNTBs1Yhssp6EgrBnWSVNBevKsFmn+CGOCBWT21BRL3shr/xkh
	UuMbaNtmcq+RKEebDF2Z2weIbMTIXC2eskMFR1kncArHn1KFZ4Ub8eGHXgWC79UhMTFATN9pbQD
	0NEIm9Uyjvq95Qg2auQ/u2oMx6ERG1KcQ4lOJX5zUVRXwKdl8gQoKnXQJKqbJuY4cXP4+j5qoSz
	rXd7124eu2tBmOA4Ft3KyoH5PSsNlHfYrJ8rngdg4eydteUbCSvCfAPu8COgxCSGy9mBG9XeJkB
	3nzqnUeHgDj4gXcaCy6cUDgyS27H6jkFuzKihIVhO7FnF5WRGpU0nTcUYq6arl7waKoUMC3YLnV
	xg=
X-Google-Smtp-Source: AGHT+IFmd8S2YBtgFN4IWrCYdYF+MW1qsdZZUT2YRDneacVDKSjLVtp38t4GJEM5/IopDihgf0xqJw==
X-Received: by 2002:a05:6000:1887:b0:42b:2f90:bd05 with SMTP id ffacd0b85a97d-42cc1d3571amr23224912f8f.45.1764237552664;
        Thu, 27 Nov 2025 01:59:12 -0800 (PST)
Message-ID: <178630e8-7986-4a35-863c-4559779d7390@suse.com>
Date: Thu, 27 Nov 2025 10:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 17:44, Alejandro Vallejo wrote:
> This enables very aggressive DCE passes on single-vendor builds in later
> patches, as it will allow most vendor checks to become statically chosen
> branches. A lot of statics go away and a lot more inlining is allowed.
> 
> In order to allow x86_vendor_is() to fold into constants, expand Kconfig
> to have the full set of vendors. Adds Hygon, Centaur, Shanghai and the
> default path.

Oh, one more thing: There's x86_vendor_is() yet, so what it is going to be
needs at least roughly explaining here.

Jan

