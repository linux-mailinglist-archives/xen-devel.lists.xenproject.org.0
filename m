Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645089B87C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701764.1096209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjUe-0002gv-5B; Mon, 08 Apr 2024 07:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701764.1096209; Mon, 08 Apr 2024 07:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjUe-0002fO-2O; Mon, 08 Apr 2024 07:32:40 +0000
Received: by outflank-mailman (input) for mailman id 701764;
 Mon, 08 Apr 2024 07:32:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtjUc-0002fI-Eb
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:32:38 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b6889fc-f57a-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 09:32:36 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3458b699d6cso249807f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:32:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b00343e760c637sm7808952wrn.84.2024.04.08.00.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:32:35 -0700 (PDT)
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
X-Inumbo-ID: 2b6889fc-f57a-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712561555; x=1713166355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKK6WW+8+cFZLTvP3CyUXXoH7eOOAUR1fyQl9c1iEy0=;
        b=dCHhcge/qRTBWM7bpZB2t3q2DHUAsbaNzt0q5VRrByYfO6CmAsSd7QBIds4WLn7FTd
         le3Hn+IvdUYRMzYZ5TzgtF5TyfiW/u2rDmcSOY4xxqXD6Oxy3nodqBQacCSDJJ0q2twz
         AiSCiu+cZrx8NmuIyxfBbn/rFcPXadXTRpSwy0tsbroK6JAD+ns8tKqIRJn9FiVyR1Tm
         Cj3SYrOelvOJE7eKhamRpnBDOklYd4IVIma2nSyn6z8i32Oi7gk4SEHyXxxtlaLoEGEz
         MXuK1/UY+5K5p/X1Ft8bZjrL614mAZvOwLgjKC5zWz//aHKlRNa5icC+GvirpsXShkrM
         P4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712561555; x=1713166355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKK6WW+8+cFZLTvP3CyUXXoH7eOOAUR1fyQl9c1iEy0=;
        b=xDUmDQtDqXMOJhy4I8vsljKrNWI1HJ1hajNLlMfKdZZeY3Jj2q3UPLFvieEGYwy55b
         2eA5eU1q1dA7rsonZV3GB+dm5LpQSiKuey9HlTmdPnEG7wdAkmUzL6ZU4fs7MGYu8Kyb
         +iDiStseHPh+EcxWzmLXOUKCJWN35PQrn8TtWm7sxur1e8c5YblZ1a4L+CFhOM+rwz9z
         IE8GscwMrwpfRxniLjwkFbwWiClQlEo0ifQJKwvpAsIgwOoMw61mWOygpYR5tCMdclIq
         538JoIIqma7Pdth6FN53FKx06VmXXNK4vAriyxAAK0gbRc9DLQqiW6rrD5hpwU+jkXTu
         oCEg==
X-Forwarded-Encrypted: i=1; AJvYcCUBi6laDHHC50w5C83IKVl4mXU2ugd7rcsexH8CeNPnStooRBuwMMNHpz/ERWdxqXUFsc6/CD7wFrkup2hcqX7G1yN+YmR0ArWnozuzThk=
X-Gm-Message-State: AOJu0YwKm7CZKKKYId5QvfrYsEWU0QeEkFk76a8LbUuDaDF0+qWYjdIx
	mSxUgs8yavQEcOoCuJGwuagAfV6izBD2Fb0vo7yd34G1vzixcgRNflzWTdye7Q==
X-Google-Smtp-Source: AGHT+IGgnZ1sRNSydNmwP49uCL0oG6t7MUejrDIETZ23CYh/UP7kCD6GpH2V6d8o9FkPHY67xZHG0g==
X-Received: by 2002:a05:6000:1864:b0:343:617e:26ba with SMTP id d4-20020a056000186400b00343617e26bamr7001442wri.54.1712561555432;
        Mon, 08 Apr 2024 00:32:35 -0700 (PDT)
Message-ID: <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
Date: Mon, 8 Apr 2024 09:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/9] x86/vlapic: tidy switch statement and address
 MISRA violation
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 11:14, Nicola Vetrini wrote:
> Remove unneded blank lines between switch clauses.

"Unneeded" based on what? We're carefully trying to improve readability of
large switch() statements by adding such blank lines (at least) between non-
fall-through case blocks, and you go and remove them?

Jan

