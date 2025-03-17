Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92230A645FE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 09:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916290.1321401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu64C-0005fK-VF; Mon, 17 Mar 2025 08:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916290.1321401; Mon, 17 Mar 2025 08:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu64C-0005dE-Sc; Mon, 17 Mar 2025 08:43:24 +0000
Received: by outflank-mailman (input) for mailman id 916290;
 Mon, 17 Mar 2025 08:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu64B-0005d8-H5
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 08:43:23 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff0ba71-030b-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 09:43:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so10464975e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 01:43:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe755b0sm71046705e9.1.2025.03.17.01.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 01:43:17 -0700 (PDT)
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
X-Inumbo-ID: dff0ba71-030b-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742200998; x=1742805798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KFl+YR32faWS6Q1TMpMHRmTazPN0t48c7iJDqzyKw1M=;
        b=EbJTy/+Vy0b5fkJ35gD8AvYZFL3la4BlOgXzIuZQub9XXrj17oHRdC7OkydMx4sniZ
         hm5Egya+ookpeealPzZiyvEuhIKKlGY9trJygXipAtgvqMgDnwYdOSvHqHY58QlRF0Wu
         V7b6m9r9vdEndVX3suEQ1iZ3UYmud9Z7crRBfJgliLeQGoUg3jG83FPOIrXGT+TF52rz
         3iKyWpuhE5qHoor4r2WThNvoXqLPVp8vRZ7WETLZJtEZakA7T0XYgpr0MdVnokCVBwzo
         IamE2ubn3YxLBsea3cjgK+5ECfUhE0a+9U6092rknE6V9PyJsDePt38PZHa2WYuiwXlT
         BmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200998; x=1742805798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFl+YR32faWS6Q1TMpMHRmTazPN0t48c7iJDqzyKw1M=;
        b=iuGbFQneqTbMGJlINuJTLnaaVfOaZvKg6quJw/2sXMBUVTCq344Hh819+GZfxW1zzT
         5Mt/0nh/fQ5VdZ77L1ttyKxQ1x+qbCsVQrQPMGehnZxR2/TL5eOpXw/0DV/YN6w2umNF
         N8dsdUtxyzU59bnmeKogg+nhacoz3MEAhzOPrSNDy6CKWasQyTyohjmTJJW0SsXEWTxH
         a8qb2VobIPxdV6f1CxddN5W5HGlBbuzGTC4C4EiCvIyIJqbCbmnOeA0CDBlkcw0EsQc+
         HnDuvuWalMQ+wMgC2jzRJxUmytclphHLe6DKeOnFGdcsgoY8JRLf8H2Wq/pyDOH2EdGi
         uOeA==
X-Forwarded-Encrypted: i=1; AJvYcCXDuXdKuItI+OOmTNOxcal2RFN9nVa+tKHfajW7X9o8JHP6vWmpW91yWD/CJrWulll+rF30d+u1mYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOhz0rbUXpBvTIuxpmL6bBjvvWaOn955PI18wGlMRDlD8TlhmR
	57D9qMp+WOqOh2rt0DpJEfID33RGl4iykJn54t4fY6ZAIgPpVzeCzAXnp8B4YA==
X-Gm-Gg: ASbGnctraKJ61tVDQF8GgfGz5U42CQY6Sr797cXB33ZV4hDpCBsEGqYuHFswXGmfIS2
	QmH3TtR3MAN0LzBgvr73S06tHAINY9gOjvyQUYFk90+9tIehMI91rfzt+x//7d4rPNY0lanOMoa
	37I5muFD83aviMpaAdEjEHE7W29RGiQ54NJ/lM6wHbIug+p7xZvnRcwHorn3e59kzM0/04Bki7u
	m40zgHWaNbeki9joKxlUzAaFnFOjHv3RR0ntKQf9tJPKlYx9sTO3NvROwhaEZb/iwUZj0uDgRat
	2CWhrkWkhXylzvdPN+S4RNieyK9SvXPYaVNypafLxRpyIV2HswA+Fj/GAJTGl0msqDn+dxli6kh
	PHD8etFGnJu6b7tG9X5jSUv3BC89uUNTyHRY6Yi6z
X-Google-Smtp-Source: AGHT+IHm6UhrVF2ytviE6MYOXsWKLq/lbCwBxVlM1Yjj3qmcNeV1iDQuLjkMxa2dVb60gI49zSNf0w==
X-Received: by 2002:a05:600c:3512:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-43d35695097mr3664405e9.0.1742200998055;
        Mon, 17 Mar 2025 01:43:18 -0700 (PDT)
Message-ID: <83894b99-54ca-460c-8463-9d6854987935@suse.com>
Date: Mon, 17 Mar 2025 09:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop __text_section()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314175933.67422-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250314175933.67422-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 18:59, Andrew Cooper wrote:
> This is an unnecessary indirection.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



