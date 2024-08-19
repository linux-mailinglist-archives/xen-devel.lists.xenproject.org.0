Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9608956AEB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779622.1189332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1Y1-0003dM-2A; Mon, 19 Aug 2024 12:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779622.1189332; Mon, 19 Aug 2024 12:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1Y0-0003ah-VP; Mon, 19 Aug 2024 12:31:44 +0000
Received: by outflank-mailman (input) for mailman id 779622;
 Mon, 19 Aug 2024 12:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg1Xz-0003ab-6B
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:31:43 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd42f0c3-5e26-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 14:31:42 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso3214021a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:31:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbde7cd4sm5560594a12.39.2024.08.19.05.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 05:31:41 -0700 (PDT)
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
X-Inumbo-ID: fd42f0c3-5e26-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724070702; x=1724675502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=haOCps7ggVu9u+LeYF6RYqtaDJSDRpLps7AkVHNZHUc=;
        b=JW67/XhigM7BcpNtVH4IY5G7gLU1nXcqfODkRYbLmtWYjhlsa536Cdqci/hYFCkL2F
         86U8FbtQEleaYBNq0p2U6qZtsldhU7kdezkM+Lp+BkSxej34Gq7dHl7wf0Z/df7KDEIW
         Ih5QzNNFP1vyiFzQONlzsh3JrwQv+gjxSASF2qdJQfvGAOPIA0xfmIjyPnh7HbpoDdtq
         WP6D3N+sP345WqlVd50iTu64dz44PBxvm5fcbpej/YMjx6pyx8gPUPNY1y2dmHWDIhs0
         dsI24FSLBNsLiJhX8287UhcuA1PjKLEDiKeBg1Q7F8KjdY0RGMUSKK0VwMu8SsKWMYrD
         ZpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724070702; x=1724675502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haOCps7ggVu9u+LeYF6RYqtaDJSDRpLps7AkVHNZHUc=;
        b=WiseuDnzYsJHFu5cq5TsJtJqNxheGbJy1klX5ody8zZRazk5GMF0m7JE9rJz4LIo1u
         g83aQCVbuvI2TaHtfvdkNH/c5PnD5fFGJjxkUxuvb/9sJRBQbZd7lQyn0rwOyvPNdwxo
         Edbj0JVbHhatSbxeSt/XT0Bf8mBYqzl3791Zb4TApmTxNj21RMQgfNmtO/7eSCpNgWsC
         8Jy3H5Q70Sa902MImj9VVHuLTswF+Yry7VVxLmt2g8tf2vPcevucrsdSrhEr/nWknjnO
         Y7Q2fAmPfSVQy3MjsRKe4QcVAxnyrewyP7Gms2ZlPjFqX4iUmj2V13uHWvrMz484CA+r
         WRGw==
X-Forwarded-Encrypted: i=1; AJvYcCUbxUVK7f96xUFEq1VXIBbC46UQyVpf52amoH0T5ZeeRTCkypzUMK4hVvf/i7UkADnWCAffmgXsiGdLHm4WPJBEOVvFszbzwnSiwkZPVDw=
X-Gm-Message-State: AOJu0YxDBiqw6wVc2fJnzUYHKDUcit4toHFqjJTRAtg2QAYU8sq9FBEK
	MdJBvHrmDO6CoN5q1v/Kho5ciFsMYL+0wd4UG/CgS5/bkZhqmPIcLlHgH3rJyQ==
X-Google-Smtp-Source: AGHT+IG3PKCsbNrU/lD0j45YEOuhYTnXvIUwr57MmKLWV7gHa3/tiPLbZgQV7TZcBs+Gytas+N4rrg==
X-Received: by 2002:a05:6402:1ece:b0:5b9:462d:c538 with SMTP id 4fb4d7f45d1cf-5beca4be005mr8392143a12.3.1724070701716;
        Mon, 19 Aug 2024 05:31:41 -0700 (PDT)
Message-ID: <96af19a7-4f0f-457c-bba9-b4678c0bfa1b@suse.com>
Date: Mon, 19 Aug 2024 14:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 4/5] x86/intel: optional build of intel.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <ce06eff2060c94ebf659d11f7390c577a3c6a24e.1723806405.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <ce06eff2060c94ebf659d11f7390c577a3c6a24e.1723806405.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:17, Sergiy Kibrik wrote:
> With specific config option INTEL in place and most of the code that depends
> on intel.c now can be optionally enabled/disabled it's now possible to put
> the whole intel.c under INTEL option as well. This will allow for a Xen build
> without Intel CPU support.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



