Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C38D3610
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 14:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731833.1137559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIAq-0000yA-4J; Wed, 29 May 2024 12:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731833.1137559; Wed, 29 May 2024 12:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIAq-0000vs-1N; Wed, 29 May 2024 12:12:56 +0000
Received: by outflank-mailman (input) for mailman id 731833;
 Wed, 29 May 2024 12:12:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCIAp-0000vm-9a
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 12:12:55 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c292fa46-1db4-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 14:12:46 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52ab1d7243fso1087326e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 05:12:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8d606sm721799666b.176.2024.05.29.05.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 05:12:45 -0700 (PDT)
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
X-Inumbo-ID: c292fa46-1db4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716984766; x=1717589566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fmRB6jrOdeLAvItV4kDL65wtkp1iX9xMxEWKsiF7NLc=;
        b=KKpAsr5JcRBdaiSpqjmlY5B1HGr8o+rWWEGr6/wbxZLFHxSDmBRDtmVSEVPmf4NfFo
         BaGTs+ynb0uFu6wW3DWY56ujIE3F2CrXqyPJ05GCxxeL6ADFxw1b3WUcSh8+kkk4m8JX
         oc5nDtiysWbOj2sDQsfeZA/O5fVD2j1bXP8DYLXDMffOqvlIOFbEtibO1uQGI1uFxmME
         5vy27JlhbnhyB1/DCY0STw4OGeP1wSIaDz/hCItLU3SMp4oeApsP5b0Pqwg0gWzt3EqU
         PVT9fPGl4E+IgM2mh6IEFVbqNM08Z6jCoWeMhQULXJKpiK1INMpxYaBzHCRQqq6e06xM
         A/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716984766; x=1717589566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmRB6jrOdeLAvItV4kDL65wtkp1iX9xMxEWKsiF7NLc=;
        b=lyrKjm7Fi70PtEZ2+O8dFGMvUZc52TwqYmWSZBsmYZotN6HGnhjASwglpiHTKx7F3S
         zBhyqrKm5lqUEMPVgvqpF/GHbev8qAiPvH0qXpQZu7vC+cebBeelin1f2kGDIMgad+TU
         Lkaet5LT2TobNlRHWFbBbCj8rtUQiMFgZxl0QdgScP2td2q1NbcRg5p1VB3wUJjQIfHx
         qq4KnTZmWtpgCyM0Sk5TCX/tyU+svJJE8lc/+UbH+Fne0LhdNaqxwkd0q6vcKL49DRtO
         /QKtTpKpRBN7ttHF4d0KmDf5Ka+8sz13SEINHdDhGHaQ96rHyeHib34D0Q5BUtArP7JT
         bcvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU29hqRkYOt246F5p32hCL1wYI9u6SZrhGXw7Yb787vcLvUxlusCM3O49ZsL1P3jNu2eIqB9NPrsqurx3lbr1YwIK/sv8zSA5DOzJrg6EQ=
X-Gm-Message-State: AOJu0YzxppiVjPJtjcKBYrwlq7izgvIKh8FJTlzpPKoy8N+rcoYOPA9N
	SIo10r8jFJ/hNgGWHO0uYvS9XUU8fMLwqG5Mo71SpC2uT7hRewcLzFlJOecBhw==
X-Google-Smtp-Source: AGHT+IHc6zNMy6fBtIKY22dplRV0lCweNsI+hKLE0IKrdJxQPIg4XCsVhuU1X1ZlR/SBxjXvpdS9kw==
X-Received: by 2002:a05:6512:ad6:b0:529:b717:2a14 with SMTP id 2adb3069b0e04-529b7172ebdmr5368906e87.14.1716984766206;
        Wed, 29 May 2024 05:12:46 -0700 (PDT)
Message-ID: <8b73306a-cb79-43b6-9da5-bb90c0bf8627@suse.com>
Date: Wed, 29 May 2024 14:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Partial revert of "x86/MCE: optional build of AMD/Intel
 MCE code"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240529103752.1431366-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240529103752.1431366-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 12:37, Andrew Cooper wrote:
> {cmci,lmce}_support are written during S3 resume, so cannot live in
> __ro_after_init.  Move them back to being __read_mostly, as they were
> originally.
> 
> Link: https://gitlab.com/xen-project/xen/-/jobs/6966698361
> Fixes: 19b6e9f9149f ("x86/MCE: optional build of AMD/Intel MCE code")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



