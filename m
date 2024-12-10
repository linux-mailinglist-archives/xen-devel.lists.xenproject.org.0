Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C959EB33E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852520.1266290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1DK-0001E1-Hq; Tue, 10 Dec 2024 14:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852520.1266290; Tue, 10 Dec 2024 14:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1DK-0001CP-F0; Tue, 10 Dec 2024 14:27:50 +0000
Received: by outflank-mailman (input) for mailman id 852520;
 Tue, 10 Dec 2024 14:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1DI-0001CJ-RZ
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:27:48 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edbaedde-b702-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 15:27:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so62502685e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:27:48 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f13f735csm106567245e9.16.2024.12.10.06.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:27:47 -0800 (PST)
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
X-Inumbo-ID: edbaedde-b702-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733840867; x=1734445667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vOfm/yyzMif7rTbZnMfCUGikliN+PsefgdIovXgOM8s=;
        b=bEaXM0lXAufVkkUnxgqxyuss5f5feTYQtL1fnHs4UgXggyowFF/dRJP2LNIt2HHbra
         Uf700HrQjGKwol6y07Bb4sgvKyrA+dZgiRkzACMnsY63powysnM2LID6EIMZs1S6AChK
         ncPgG5gWjPv+B2zLd40h6CfhTFgmEmaEdf69Srfa80tJ0Gn1Pa7/14KhFi2++x7fILSD
         D5jm8F03HJ+UQYR0sShEa3869b9Ttb8lsR/9yRHjY/kcdfHVFRGHWExoZ1mh4tovTxhD
         XLc3FXg4fOUDH33PUJAfaaPoD8LLv2Ds31bQ74nmmZLicYV1DSDG95V6c75KitLivo6p
         gypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840867; x=1734445667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOfm/yyzMif7rTbZnMfCUGikliN+PsefgdIovXgOM8s=;
        b=TNQngOHh+SJ5CzEklf7kp1i3GNZlBxGUZJwoUh5vZK+h6vYjPhnuJrTLll3Kcn/c+0
         ZY0X+lGuRvD5UwjkbFbDjASZCh+rZZWtmM/CuYBmcfiG3DUjtjlzM+NhlLILXF8Ni1O0
         BBNJruMSiOBAgCmhtCa/RWmL6VCm5BX9+GP199OMEaigELRxOAxdfu9lGwhzB+PeSHLA
         mIovKQio212vWFubY/3pMRU/3pGNK6BxxjHwBR79dTCthXmPEjIcMk1U7swGGXC1fcuj
         sEjnMio/FPgjUIfFMPbcXQIzgV3J1cLYCeuGt3EaO38mrKKr91Phroh2smU6UBzNPZx+
         6rWw==
X-Forwarded-Encrypted: i=1; AJvYcCWor4khDPIR1Or1gdtD/lbUAorEY4IPzYw/KwYz1zHkSwdOgYVByP5pLkrZ7J+TdvLBSI35ZhzgDgY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2G5sf3gpt/piOF/ND45Yc3/cE8hfP/EXFTqN94kkOwEmGUfFY
	maUIyqQPPaf+kG8T8i+MXtUN4OKJvqBnJtdxKJbhnZ5pEaPJV2vuJuSP34jVwQ==
X-Gm-Gg: ASbGnctDeB0aQAfwvXZ1XCdlRfffgukuihAGd2xTmwSRD3/zC3z9GD5mxJs9xUqcB7A
	JfJTK3cV9uniXVbhaFWLWjPnhNhVa5PI1C8WHwe14dWZKlnzwF+tmWTIuqMUJTOh+zR2Xyrz304
	KDUAUQmzSrnoRrI3k8NIL+HsvzmwvX5DcKpXcnmugZH33/heaZWjHdwl1EaYpwyDC0yPfKSRtDb
	V5Pcl8LViA4YxQWf4uPz91belBweYZ14cEO9LlaNP50FuS+N7tmrZI7661MmNixtWqtxaI+YyfR
	pnKp6oOtXjRawx16s60LpMzF4jXkxWPVCW/2/oet85C7o/Qp/A9ySZYf+Tyh0MuofEPZbMGyrpZ
	8lIUvh1PZeg==
X-Google-Smtp-Source: AGHT+IGSJmpfOgBa8eaJ1maR+aoW7hB4KKXHezkINdsXXzapSjcC2LG3rg+b5Or6rg8Echa5s6BjyA==
X-Received: by 2002:a05:600c:4447:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-434fff9c4fbmr48367715e9.24.1733840867409;
        Tue, 10 Dec 2024 06:27:47 -0800 (PST)
Message-ID: <9c9120f6-6291-43d1-93ac-deebdc222f3e@suse.com>
Date: Tue, 10 Dec 2024 15:27:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> Introduce new printk() variant for convenient printouts which skip '(XEN)'
> prefix on xen console. This is needed for the case when physical console is
> owned by a domain w/ in-hypervisor UART emulation enabled.

Imo it should still be guest_printk() which is then used from there.

> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -61,6 +61,9 @@ debugtrace_printk(const char *fmt, ...) {}
>  extern void printk(const char *fmt, ...)
>      __attribute__ ((format (printf, 1, 2), cold));
>  
> +extern void printk_common(const char *fmt, ...)
> +    __attribute__ ((format (printf, 1, 2)));

No "cold" attribute, compared to printk()?

Jan

