Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CE86FB58
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688194.1072103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3PT-0004wF-FA; Mon, 04 Mar 2024 08:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688194.1072103; Mon, 04 Mar 2024 08:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3PT-0004th-CN; Mon, 04 Mar 2024 08:10:55 +0000
Received: by outflank-mailman (input) for mailman id 688194;
 Mon, 04 Mar 2024 08:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh3PR-0004tb-Ny
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:10:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7639295-d9fe-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 09:10:51 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so6226968a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 00:10:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tk3-20020a170907c28300b00a3f20a8d2f6sm4474836ejc.112.2024.03.04.00.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:10:51 -0800 (PST)
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
X-Inumbo-ID: b7639295-d9fe-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709539851; x=1710144651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6WKhzC0sAZwLswUBzI6C0o1JuG1W1Ipgq1JvFRQZ8s=;
        b=cf8evjn9QFtlkGt7V55GmOaw/GWWe+kJyhN+LNvoeqZ+8COyc7pxuuYWK0PLWrpxae
         RFr4zPcK/ScTbyNzr2Gu3A0HEnjbs5AXiMxItcaJ1tXpqax9b2cw28WHAYgNRxtUX7dU
         JAR0KvAuzaVU8u3HzKekvJezU/ltN0og/8XHao95GTQtm+k2ElrSSWWz7J4z9mR/9wKj
         fJqk39H00irTzmb3YizcZ50F2xDfGlXC79lXpLZPyfwvqOJxDUlT3ABw1COzsBsjgAay
         +fFHHHaueDmjgD/0uUWEnoN+L2NpDnRqb+VLUSmOIMu0oQR5f+7bZTIOLlwhApnex0c+
         5Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539851; x=1710144651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6WKhzC0sAZwLswUBzI6C0o1JuG1W1Ipgq1JvFRQZ8s=;
        b=QfngDzQtGg47FjJtYliIJadmW8BmneqTWhcnbKAsC7oWIL4Ftj8oaD9Wi4BmR1PRhe
         tJoBu30ZKDwrG5Zts5TIfvkfEtEvMjBzwGAwTXJyH/6QPffLoB287S6Sn/+TCZDaKS/N
         xt7jNqcmfM4PmpB+iTjS8H6cBskQuD8ar0K1Eg1pqqTBBOosC7wjBp+p6NeT3biVhjHE
         ZvV4QZBsTsuNdWQwJ1W7LikdHupaa+a6hVKR1mk3QBsOEmr2QVhJMoiBfueyJoeDOnrG
         Xvl1G8FjVSnh/jw4Zb6wRMBusqnVxf9O1Ps0D5gbzvrg85rOLqd1t/N163lrRITvE3jD
         RCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbDDI0Mo0qo1dVL/eryOuyPq2CPzAIah8LFthcawkYCCmXE6ty4Xq7SeSVITuYxexvTdkoM71hISI9oLYquNZEm6MAAHFM+W9AoG1Ml7c=
X-Gm-Message-State: AOJu0YwYZVWJmL3ybo1itPxuaDOE2uZFThbptlKsQ46ZpBgNsi4BxnVQ
	+0+Oc7Z1gvQKIt3VUzzV435RV+Le2iiTQD4sz+YseDDrWJ8O//68QpHG9osu9Q==
X-Google-Smtp-Source: AGHT+IESWFnrQBOjraZIeYzr/ic+NauLuU9cFr9kLvOoe9ETzLBScq6wKfDu9+SNgMzt+BjObz/69A==
X-Received: by 2002:a17:906:eb0b:b0:a45:740:250a with SMTP id mb11-20020a170906eb0b00b00a450740250amr2278170ejb.68.1709539851227;
        Mon, 04 Mar 2024 00:10:51 -0800 (PST)
Message-ID: <af5f2886-3456-40e3-8477-980f6e342a37@suse.com>
Date: Mon, 4 Mar 2024 09:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release status tracking list [ March ]
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
References: <91cc3f76029357f34bd5ca21966c42f0acb73720.camel@gmail.com>
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
In-Reply-To: <91cc3f76029357f34bd5ca21966c42f0acb73720.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 18:21, Oleksii wrote:
>   * limit passing around of cpu_user_regs [
> https://lore.kernel.org/xen-devel/ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com/
> ]:
>     new patch series version was sent.

This was committed already a while ago.

>   * [PATCH v2 0/5] xen/livepatch: fixes for the pre-apply / post-revert
> hooks [
> https://lore.kernel.org/xen-devel/20240227112528.4540-1-roger.pau@citrix.com/T/#m620c827bd097522d9d87b7f6511bc1599f6a8c84
> ]

This went in last week, I think?

> Please reply with items you would like to see in 4.19 so that people
> know what is happening and prioritize accordingly.
> You're welcome to provide a description and use cases of the feature
> you're working on.

"x86/spec-ctrl: IBPB improvements"

Jan


