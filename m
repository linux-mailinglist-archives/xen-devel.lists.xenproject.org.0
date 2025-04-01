Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BBA77B18
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933992.1335839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzar8-0005iS-6k; Tue, 01 Apr 2025 12:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933992.1335839; Tue, 01 Apr 2025 12:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzar8-0005fk-3s; Tue, 01 Apr 2025 12:36:38 +0000
Received: by outflank-mailman (input) for mailman id 933992;
 Tue, 01 Apr 2025 12:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzar7-0005fe-ER
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:36:37 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f353f9aa-0ef5-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:36:36 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso37696155e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 05:36:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e6a532sm197628825e9.9.2025.04.01.05.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 05:36:35 -0700 (PDT)
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
X-Inumbo-ID: f353f9aa-0ef5-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743510995; x=1744115795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Py943HeTv7E45c0XDZ90PGc7uXDHukAZFFuNRvjoeIc=;
        b=aKRAXhbAAvFGqV+ry5HxgV7n2oRYXoHIZlA9adXSciG3qHumSislq6PjSmeO5V/jAo
         sI9dWybKqEUd6Z8rJa+our8j5wFbBRYXx90VEG6q18wOtj8hPJeKGUQhc4w+eopoNm1G
         g47h2oV6c7wjHmIXh7OIpDEzC2J8DgB9QIb/jjZE403ezXJ9lKs1Ge6MJgLInFjBxcOg
         5ptCmGOaajii3TWbNPTfB1UK2olAwgXTtQIha2JygpMP12QWXt6QklV4pQS4mTsM4MPq
         rbuxFgY7actxN4Oxwjt0xF6egMcwtR0Wshf5oHFa5i3aeJRdVrIw3CPf2tfOZK2RKfr4
         kmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510995; x=1744115795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Py943HeTv7E45c0XDZ90PGc7uXDHukAZFFuNRvjoeIc=;
        b=VIMjvVrHTmwGR4rP0cb4gU2ZNrh7LM3ZVS9bOLq9mQujNeBks2m5HCZ4kP7PNgsM0K
         yPxbKSW+HwIGqLtZfC0ofsI4wr717XLZ3RAPmMw7TMdQO6IvsfY5g8h9v1RD04mj5wBq
         Gb32T0CPGsJY66JPEGOPd8z8eAFHUXBufBn2xai4REPlwEYYk8C40dNlYG38hBcthXyF
         LdpOJV4tPDxG9BGQpZLXyWuMy0jJwZmuc9sQDc0AIOxcPO37B3WYMXth/XvOtJClCuCd
         ULyQEP3kSq0ut5i1PremUni+UJXqRKW3+5F9ch0c2KkMlqKZYwxj5Nprt1UnAhdjpesl
         6d8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwwtE6/vkOEgighS7nRZlcY7DLR6zJRJAii8bQn2OqtN3ie0AMO0bN17zXTHmvOfS+Jq0h3z//9Ew=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRkVJmWGXXAV4XkXXEJk4oNSCIsoDUJk0xZLR+en+sVXwJVL6P
	qNlUp1P4oX5HD53n0PQGwALHEjNKcASFaMeerl2WlE20IRp5yqB3+M3WKr0Bdg==
X-Gm-Gg: ASbGncvG9K202GTiAYINWzt1K6bZFxro+qdHLlv0tKDPjRoL1becip9gykJ1i8rvH7W
	zq7uvnwn0pxpTg5dOt89xf6B5dR4h4v9Cmo2Aptq/bIvE7io91AHP7CZgFY82mBCgBTLROoK6CR
	VE6kNOFEcp21dxq6yvYoJceuS1dm8REZgCXODLzhvfBG051URjDKcYaKtkWlrW1MdSo6JO1PO9s
	FtH/rxSBqmRS9x3k18va9RDc/u31IHHUidzDLepR4/YyixVnrP1FfV5VvtqSVxbhIg7DFuBCK35
	KpRAHkRwU79h7YW1GlyxAPONTFFlx/m21wrLua4kh9NmL9wwM13N7Hk89X5kn2Qx+ixcVekNjVo
	tagMxksMZBMZbYqJiaSHhPu9uZrXn3Q==
X-Google-Smtp-Source: AGHT+IEG91Bfd3zpZkHZzw3OGw/digGM0Cs19qkAdpIvTr/psUx7ubjEmP4U3PnKhQ1M5ULl6PQC1g==
X-Received: by 2002:a05:600c:4e87:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43db61d5fd2mr106441985e9.5.1743510995641;
        Tue, 01 Apr 2025 05:36:35 -0700 (PDT)
Message-ID: <eb6d841c-7972-4b2e-a28b-3a5ebed733a0@suse.com>
Date: Tue, 1 Apr 2025 14:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -123,13 +123,13 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          ret = perfc_control(&op->u.perfc_op);
>          break;
>  #endif
> -#endif /* CONFIG_SYSCTL */
>  
>  #ifdef CONFIG_DEBUG_LOCK_PROFILE
>      case XEN_SYSCTL_lockprof_op:
>          ret = spinlock_profile_control(&op->u.lockprof_op);
>          break;
>  #endif
> +#endif /* CONFIG_SYSCTL */
>      case XEN_SYSCTL_debug_keys:

In such a situation please take the opportunity and add the blank line
that was missing ahead of the subsequent case label.

Jan

