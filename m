Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09185A81D11
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943351.1342122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2OwQ-0006t5-JC; Wed, 09 Apr 2025 06:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943351.1342122; Wed, 09 Apr 2025 06:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2OwQ-0006pU-GZ; Wed, 09 Apr 2025 06:29:42 +0000
Received: by outflank-mailman (input) for mailman id 943351;
 Wed, 09 Apr 2025 06:29:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2OwP-0006pO-5X
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:29:41 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01a694e8-150c-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:29:36 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so32427095e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 23:29:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2066d14fsm9521995e9.21.2025.04.08.23.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 23:29:35 -0700 (PDT)
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
X-Inumbo-ID: 01a694e8-150c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744180175; x=1744784975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6HsLzUwvbMsXzzw4Gct2bbVOcBIFF3CMMNBSqFOlzgE=;
        b=CbSCrsiAOOV5Ce4+OmzWkT0D8bDKyKNTgp5FpsUiIkF4umD7MFsD806kU27OXasnOG
         W/znpAPaQwsg4Tmnq/GZDH/UoxFGhdxMZNwjlOxSlrVTI6RFY487Nuhi9hgssKI8gnDK
         zFVUQN+rZ6YlXz9WkofyuE1TkcSfhA5I97CkIPl7b7FxDp1UKMcrFR9niInetCzQg9kU
         rjLRjRGKG0Zd7ySs05n20Lca7sCzmbPgs4glXunARaNNcKxN8GQyICY/YnFM/l1AAUDl
         rQQvwni/x6nUQVov7N6kM7XX1/obyDEd+Vp1lU4ONGmliSzq2awvct/HOOXKj9gd0mF6
         Vf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180175; x=1744784975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HsLzUwvbMsXzzw4Gct2bbVOcBIFF3CMMNBSqFOlzgE=;
        b=fPdwiqBDYolAecnu/pC+yR5Szrw+qgnHVQ2/tB1j+Zo72o89E9LeWQzZWyeMUBGB84
         jvdNYOGWgLq9GngfmQWjZoZIXRz/lNlICdCXkT+2JQciSC8ychvTyZK09cliUsPX16mS
         n6a7lfW7JKYwJhxw0/SdPkWOWGP6vwejuNL2kvB+w8qwA8m1YqcjDxJM/45wTJZuwV/J
         XOJ3cQd2ARqVo7bt/hLgfmFEDpxHhyBBGeb1FxHCBJWLqN52B95u+lwMX9HusNLGBg1s
         rTt7bfkonrca8xwiy/G0wFiG5rFSJ1HL6TLQmGiKZ+/p1uQ8EYZIAmx3MjNR+c+LOc2F
         EdGg==
X-Forwarded-Encrypted: i=1; AJvYcCUgSFJoh24VMqBW6AOXtQdzfMfNIaMG1QhYOdr1sK30JywU3gBmZ5suoMtLqlbF4uZ/BZtqUdav23c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK76u/QggwDDt0PRqATcP6KhxjA2Yt8+KudURKvtudvzD6KoLy
	YQuJ3C1sMgy3mvbaPsKY9k+6fEmvq1Ze4Klqlvb0WYQnyz6CCUSiUDH11YK+zkRNxd4m6lkdwDM
	=
X-Gm-Gg: ASbGnct8lgpdZFHVqw+++ssmvXSZRWDxjOclHZww4J3pb9JKRSiec4RijMPnRVbEkoC
	znnxXibiGPB+zEep3mrI7yi2077xhAgk9qaXSf7n3rUbFmOmBLULNT8ipVAvGoaewNcnNGI5Bgl
	lzaM0puF3AB9LNlrhb5Jhoiz9VTR/yWlhI25+p278Gmo8ay7/N0z3slbeRDCvX7QGyOtJAvqr1G
	6ZARYO76ZvvDFy7Am7KOeRu0ZDsqVaJL2QJcLvmFf+VsIJ4awVv1P4c+9C3hEslhzFqkb+59A2U
	0+yqManUlMRXlQELTQMYpaPHdJ9WUbq5T3xr+GrvNKUbdNlH6QHd1DowZeSfr6FlSVeb/9tOzuG
	9GlzLcuMfNTaPIihHUGdSlUyKGOm2swtm+3lX
X-Google-Smtp-Source: AGHT+IEpMhDLPia/XlPLrR341T5kUpybPCfatFlMOuIdQ5FheAD7pUQE3/demwMG5j8RJItEEUsMJA==
X-Received: by 2002:a05:600c:5025:b0:43c:e8ca:5140 with SMTP id 5b1f17b1804b1-43f1ff39c0cmr9200685e9.23.1744180175547;
        Tue, 08 Apr 2025 23:29:35 -0700 (PDT)
Message-ID: <1d809170-bef0-482e-bf6f-6da84204bfad@suse.com>
Date: Wed, 9 Apr 2025 08:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] Hyperlaunch device tree for dom0
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> I've purposefully not added my S-by on anything I haven't touched
> (besides rebasing) as most of the feedback had already been addressed by
> Jason by the time I looked at it and it would be utterly nonsensical to
> give myself authorship over it.

My understanding of it is that S-o-b doesn't indicate (only) authorship.
See docs/process/sending-patches.pandoc "Developer's Certificate of Origin
1.1" point (c). And what you would want to demonstrate with adding your
own one is agreement with (d) there. With this I'm not even sure I could
commit patches becoming ready in their present form.

Jan

