Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A8B0C039
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051260.1419574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmm4-0002xT-F3; Mon, 21 Jul 2025 09:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051260.1419574; Mon, 21 Jul 2025 09:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmm4-0002ux-Bs; Mon, 21 Jul 2025 09:25:32 +0000
Received: by outflank-mailman (input) for mailman id 1051260;
 Mon, 21 Jul 2025 09:25:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udmm2-0002ur-Tm
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:25:30 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a45f2522-6614-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:25:29 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso3982036f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:25:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b60ed72sm53952625ad.77.2025.07.21.02.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 02:25:28 -0700 (PDT)
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
X-Inumbo-ID: a45f2522-6614-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753089929; x=1753694729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kFpczLs2ZqJnrPPcoBFcnE7YN4yALQLlHH+pESUBy+0=;
        b=Ey7uy//JIw2G/J/lLjDkC5vXucVAe3COCaFqex9ZfoxVGyd9JrHwbnfBuF9Z5LekNc
         1okf9yt6ucVIKMd5d6/CReBzRYjtylr6O8dTSs1NVOVK2o01SiNPtZ4ZjX4Ejer7Dj0H
         +tiLy7XVBZewWKhodXB/8pjTfIQ7ZowSenNQ+ah9SmTAbruPHGHcd0pGLcRh5b1z67FT
         S3oBUF3jCvicvIjtbSTK+5cPv+Bb6JuaoQ7BtkpQbueYUKpwFzciQe74ClfS0YnNNAnu
         4lpTyLIJqWK+vqCMK0evSxlyqkh88gNyp909BLzR6DNsKKBF+bzWyId+OcBfSflQNREm
         FmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089929; x=1753694729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFpczLs2ZqJnrPPcoBFcnE7YN4yALQLlHH+pESUBy+0=;
        b=ez9ilna+37VP8rqrh5pCNslRVVlcmUTQufB6ZXPom/0XdhqxiZXC7LwDaGyd1auDl5
         XQzFetBMpPflNQKQ5NKf8/L4cYtHV1RH1ZUsMRMz0ERldFzrmmVSNCPHBSl6eUvkCrt6
         6BUbJnKEZgH1asXm4AeqznnxVy/r2I43o9LDcgJ+8oMuAQzhex4Qm5wCE3MUHmtWoQ3J
         xP4P3PO4VGlOyWdmUxsGVDbAB943V2Aq1cfJWeSjldtTxLzujl1Mf++RMcZWhujDihgN
         auu2NJRSGzOVdDYWRFqrBBZqJfSj9rO9vTh0YRvDauWtSuvpTA7loWXXAzien0Oj6Lvm
         F9ug==
X-Forwarded-Encrypted: i=1; AJvYcCWBnoxOukcIM48T/oqpHJPnNdI1rJuvo8WgLPxyztJuq+nyRe6Xbp2yMMiHYmpkwt1kuhgFp2hRO6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywvom7cJvc/n33iRiUvDG3hE79M7fxdDCo2WASQVuP6od8jOfia
	hxLZ0dhh5kD8j0ba09Wl3pnQms+E/xwEGy+F4M6FaI7DI9IHekRE8Cru+qW5fvd/DA==
X-Gm-Gg: ASbGncsCrwSGLCqxsmof/Er/QMnG+7hcsJmT3LNR9uGzwRrnSYb9P/F7A9XJ/rGxZ6m
	+VFvtS37RXRx6xr4niSTI0k5FO3dw6uECbN8xFp7d6Be+6GgA3AzcvKn/JpBVB59ffF9dXezcSb
	cGWyqKmHKKyfD+NSfYXwU4JZE8dMyW7mCNStxu+SVTGFO1N1E6uef8es6LK/al5jVteWcLvqzeG
	kzggCfGHB2J6kztAns6tjBvLxh1im/7EhRLoGv7QrPO5WQsDBCeM9tKPij5Lv8U/pYj/G8M3V9F
	cXB25H1gcQsRBTav1EdYYS0gjzceuQ59MpK6trZBAOluZdsa6SHGGuGOeTyXGV6uDqX4oX1lm+j
	SLJTaBaYrhILRU292taGUxqjmdJ/NV1RWoyfLV6/NpbSHtfSVvgCrKsdONaIE1zUOiDuxn7y5sG
	IMchKInV8=
X-Google-Smtp-Source: AGHT+IFH8YF5ik9l8S4UXQbsZ7eaDjGDYyJk1UiZRXRLkdUqKupCU4WolE9h172x+Fi3F/0xgDDwMQ==
X-Received: by 2002:a05:6000:1882:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b60dd731damr16660535f8f.34.1753089928603;
        Mon, 21 Jul 2025 02:25:28 -0700 (PDT)
Message-ID: <ce45f10e-f8cc-4f34-a148-8cc69df16f8e@suse.com>
Date: Mon, 21 Jul 2025 11:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Rework TRY_LOAD_SEG() to use asm goto()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250718202548.2834921-1-andrew.cooper3@citrix.com>
 <dd20bc85-e5b3-480a-aaeb-4248a427f6ff@suse.com>
 <714047917162481454c4cce050386125@bugseng.com>
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
In-Reply-To: <714047917162481454c4cce050386125@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.07.2025 10:16, Nicola Vetrini wrote:
> On 2025-07-21 08:41, Jan Beulich wrote:
>> On 18.07.2025 22:25, Andrew Cooper wrote:
>>> This moves the exception path to being out-of-line within the 
>>> function, rather
>>> than in the .fixup section, which improves backtraces.
>>>
>>> Because the macro is used multiple times, the fault label needs 
>>> declaring as
>>> local.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Slightly RFC.  I haven't checked if Eclair will be happy with 
>>> __label__ yet.
>>
>> Even if it is, I guess you'd need to update the list of extensions we
>> use (docs/misra/C-language-toolchain.rst)?
> 
> Only for using the __label__ token in 
> automation/eclair_analysis/ECLAIR/toolchain.ecl. The extension itself is 
> already documented in 5590c7e6590d ("eclair: allow and document use of 
> GCC extension for label addresses")

Except that it's not the address taking that is the point in question here.
We have meanwhile gained a number of asm-goto (and for the uses there I'm
not even sure they count as "address taking"). It's really the __label__
extended keyword (and the thus possible declaration of a scope-restricted
label) that my remark was about. But yes, toolchain.ecl looks to need a
change, too.

Jan

