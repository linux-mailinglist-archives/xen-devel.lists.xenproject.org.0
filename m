Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421581740E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656092.1024056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEsd-0006mp-8r; Mon, 18 Dec 2023 14:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656092.1024056; Mon, 18 Dec 2023 14:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEsd-0006kP-6A; Mon, 18 Dec 2023 14:46:03 +0000
Received: by outflank-mailman (input) for mailman id 656092;
 Mon, 18 Dec 2023 14:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEsc-0006Yh-1u
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:46:02 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28f802ec-9db4-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 15:46:00 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3365752934bso2400477f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:46:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j29-20020a5d6e5d000000b003364e437577sm10175351wrz.84.2023.12.18.06.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:45:59 -0800 (PST)
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
X-Inumbo-ID: 28f802ec-9db4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910760; x=1703515560; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mSNK+9XQWf+R3LH3HgTsPh5as0gnPF6qZgvItnNd83s=;
        b=FflDt0PSBk3VOVWOFUltWuX1eKmlY2BEs9gTPGClRKpQSosjCXLQgdJChldQ3IjxP8
         dpv+BjUfc2PgPwZjx0oa4sD6kkgpmKugxX8e7FOfjZKMVDlmRAU4/S38X1+RyuHwky/V
         AdW0G1+h97/+kRxM4Wulm30b1MQYrXakY5zhm0H0QkUGg/X4V0c70/lh9pqLHfX0ub04
         v1MRdIBB6VJSaozLGUeOukedGNtQRN6Wqnd4si+I0bidAAJYWZVjS5AVR8u05pm3oshK
         FOKqFltoBRx8OMUZO1j9aG7IfkLCOdvRWdMXJvxqOMlSYmK3CZYqQkW2qUTbpThrICIe
         lraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910760; x=1703515560;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSNK+9XQWf+R3LH3HgTsPh5as0gnPF6qZgvItnNd83s=;
        b=SbsAgFtuKiB5zgD3egVI79QWHvQPAKcBotnsQlQUm+4IMzjbEnpNArlJpZ+Kq1MSvc
         Oogdd32VcMRh38TWjqCBObX8TE7llh/L9HXUL+edJMFoaktlZ/X/8+aE2+T7jqAJFepR
         2F6RNzYt/FAtVXS7rebj5LJJxqviJOFZzvDHA+W481Dd8R5cZXuww7gfCTfpnXjuIdca
         ZwUpb6KejnogNHQIGVNtUB8fBCagK+kwBAF3faqzJLjGouEOIaRuCVgiMwznqhe/mBiD
         5zG9z4BXLuo/Doxy98tspPwB7P+R+pB85nPRwsJrmQkFdtZ3HGDsPnBCu+6HK6Q9CDvP
         AwPg==
X-Gm-Message-State: AOJu0YwuOaLKRlU4jobgVyyhfq97vp2n+XTaeyGNzYS5Lbeo7Ostd08b
	fYgN4nLYiP2GvwMXbF2gmglbk6dACTO+hqOiH+K+
X-Google-Smtp-Source: AGHT+IFv2PFXpvWKKPsKQtZbGQAVYfz1vBcbaQ1IXvVKO7NFA3Bj2nv79Y5k1WuGXFa4zm1TQD7ZPw==
X-Received: by 2002:a5d:6584:0:b0:336:5f10:6c85 with SMTP id q4-20020a5d6584000000b003365f106c85mr1993588wru.122.1702910759508;
        Mon, 18 Dec 2023 06:45:59 -0800 (PST)
Message-ID: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
Date: Mon, 18 Dec 2023 15:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86: Dom0 I/O port access permissions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Following on from the CMOS/RTC port aliasing change, there are some
more missing restrictions; in particular there's more port aliasing to
be aware of. But first of all introduce a command line option to allow
suppressing this probing of aliases, as was requested.

Of course an alternative to all of this would be to do away with all
policy-only ioports_deny_access() in dom0_setup_permissions(), leaving
in place only ones which are truly required for functionality reasons.

1: allow to suppress port-alias probing
2: detect PIC aliasing on ports other than 0x[2A][01]
3: detect PIT aliasing on ports other than 0x4[0-3]

Jan

