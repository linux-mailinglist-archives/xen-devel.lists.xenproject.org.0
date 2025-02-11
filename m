Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A700A30835
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885284.1295074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnIC-0001yx-MY; Tue, 11 Feb 2025 10:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885284.1295074; Tue, 11 Feb 2025 10:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnIC-0001xK-IZ; Tue, 11 Feb 2025 10:15:00 +0000
Received: by outflank-mailman (input) for mailman id 885284;
 Tue, 11 Feb 2025 10:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thnIA-0001xE-UC
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:14:58 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b99567d-e861-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 11:14:58 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab7e80c4b55so49878166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 02:14:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7e0a6af6bsm97719166b.99.2025.02.11.02.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 02:14:56 -0800 (PST)
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
X-Inumbo-ID: 0b99567d-e861-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739268897; x=1739873697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aHYl7eYE6wufgRmIXTc/astSC5E89JjInHJZoEyF1UA=;
        b=Tw54lBGW0mvLeCehwpfxrb/JoVmA2BHSPfJezwpA36C/7nGRw3SLTWQZ3QL9TgB9BT
         MKvKw1cHb1UGFVUJx+wtpzyI2BrYafgON9nCi2SAL+jO6Bar8kY8JRVgVIlJ5RryCZZF
         LfJ+wbTs6g5K/X03GPA5xEwSs6xWvBnmDJVyqZab32txzQGNdUAS0XWE1CxpH+MKPqP3
         aSbfa5Xl0grTf/OlgfhTKwPS+150NlUADkOjayiBwknBTpBT5z8da0ZAqT6Va7H3lnqY
         GefrkB86uTNR9tdaOpxWhiEmmx8RGAxtW/4v5G2twEupOIoqXc7mJg+BXAH86JFcaY25
         wotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739268897; x=1739873697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHYl7eYE6wufgRmIXTc/astSC5E89JjInHJZoEyF1UA=;
        b=Jh1tcayF3fxY9Wd8ZSAhhPjebiaugbnU4p1aCLQFgP05XRpCHQUV1QeQgrmPb1ZLzr
         nkWPkINuvy/Vk+v0ifZtVA/5xZv1DcaENf6G2fIeYygeqIireHhFGhGRA/aoXabXdSZC
         s05X4lMt/BbeHnR2FQMjm3EdSejPY1UQex3Chk/TbjddIZh73wZJx21xloqs6VFTdcY1
         CoE/dPS09fUtdcvVd+5jWWTB/HVsr1k8ne6MnUSSSA35Oh5Lesu8IOv5RKvp9lnzJDbG
         UILivlV4frOFJ+misNaGU//KYflEtZ6EXXKXIrvvvb2szO2pAKsqIXHA+8GYhziSWvW7
         LbGg==
X-Gm-Message-State: AOJu0Yz/4SPbi0YNF/CeCdeN7HWccT+cyOjuIaVUwin1SRvJFI2c/XFw
	avbkcHDE+gHbB815r/de/Mm3Jb60m4mANWutw37yF4NH2o0WUPUeO3nXwalSbw==
X-Gm-Gg: ASbGncsQe7NOlwjMkeNOMe5y5IZMCoi5JXB+/JcyoJ6rOfJN5hiSBkc3l/PieoMdAKU
	tk5tfxGIq+DKyVDpCqFufSWHxiQnGvI1JgD3Aihz5a15szx5vHIwolK6il02B0MytnJvxD6/DW5
	13mgBDeMtqqF5AkNcumDVxx+SA/sfutp5shb0w2JwKT3MuCApLsHPRGUS6CtrTD01Tf+zV2DOE2
	GImi9rhYHelRWLu1+HwEe/qLCyNraZbfHLMxEA+ftHJ4RezsDBH3b+eOJgB7hBEcUOm994vEsCP
	VtYtFA8PKA7QFg9fenahrFU1kbtdMYz8l2QCtmib4vqgR3lp3aLsYAEJ6oRuMJBAEaC/QRZDi99
	1
X-Google-Smtp-Source: AGHT+IGxxzze3tNsxb+HVVrTwN+GLPoHIudi2YUqR+YdX03itlLI5kXP0L/rLd1g6JdeaXcTxa/41g==
X-Received: by 2002:a17:907:7d8d:b0:ab7:9a65:bb56 with SMTP id a640c23a62f3a-ab79a65bd0cmr1427322366b.48.1739268897045;
        Tue, 11 Feb 2025 02:14:57 -0800 (PST)
Message-ID: <e70af3df-d581-4f6e-bfc1-55484eff5d40@suse.com>
Date: Tue, 11 Feb 2025 11:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Coding Style Review and Automation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
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
In-Reply-To: <Z6sR87FrKcOhgEqX@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2025 10:01, Roger Pau Monné wrote:
> Is it possible for clang-format to be applied exclusively to newly
> added chunks of code, while keeping the surroundings untouched?

I, too, was wondering about this, at least as a data point. However,
especially for files that aren't in a single style (e.g. where we're
slowly transitioning from Linux to Xen style) this would then mean
(at least) three styles in a single file.

Jan

