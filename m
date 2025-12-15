Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E12CCBD2DC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 10:33:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186714.1508137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV4ww-00022P-AG; Mon, 15 Dec 2025 09:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186714.1508137; Mon, 15 Dec 2025 09:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV4ww-00020F-7B; Mon, 15 Dec 2025 09:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1186714;
 Mon, 15 Dec 2025 09:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV4wv-000209-8F
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 09:33:01 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b2dda51-d999-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 10:32:59 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so36171725e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 01:32:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f3240fasm180321395e9.0.2025.12.15.01.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 01:32:58 -0800 (PST)
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
X-Inumbo-ID: 0b2dda51-d999-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765791178; x=1766395978; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/E4FB7x/uTf8pnNGSlOKXsHWWuP5IaAQChJaRB6VYKA=;
        b=QmmFnswiDQewDJO8JSFT6xHy8g/LZrcPWezqv3oFaVgPkxucDKqXPm0K2X7UQONnbp
         RmGl+MLuuWN7mI5KKlnjxcvdUggc5Ub4Y5SXUR4FyDVWPDNddTwsJKnUFU26PHGm+BS3
         d1WigUbQ/DtRy5IFlp8pT2t1FkmL4LxWOq5F/g35jfNRm3fVIxxmKMWMQoNput2IR2XI
         Fm9LEQJBYy6fOHHgNBuR4gLv6TKPXydbHX46KIOYAhts9Y71AD5/i7nhJ4NhcRxGEkJ1
         8X5E/tSvv75BlDdpGlhNRPMkrE4My45SFcMlnzE22yP9GmzTbjsjLOHBRNngYU4POHs+
         01eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791178; x=1766395978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E4FB7x/uTf8pnNGSlOKXsHWWuP5IaAQChJaRB6VYKA=;
        b=gTYfWtkiiS4+mYQbpXHMlg7AV0ayTsx/WJ8BP32yTvsqoez03PgDmbI0/xYhayUVfR
         gjPR4GlIHcA5Y9NprcdCDnlVbqZ//2lHp3CSablLrBHcZa2ZdHuSMgo0gmWOvIvMoE8N
         /JZ12xfJwJyOhGT12UiSPgOxLbYoIEmIuykddxIdmb2PxlpdtRrV+LvVELtzO+ydPC+O
         KLJuEqsmTeYtxpFh9TL7JIQz2q3edPCwI4FBkpr3GOoz9Cf153FC++z80DM71GFMcQbe
         tprxJUSnpL4O6pauUN+NYswXdjwAuNzuR0xfSPQIqYJwR7Y9guWBCQ7gJ4jyDv1OHVS8
         52CA==
X-Forwarded-Encrypted: i=1; AJvYcCUWWOXTe4Dn0WA10zIFAZTAYJdk2JGdnPW8l5EX3FJnm+PsJ8NcBPdilZo3p+CKpcmxF5Xz8y17G0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpAqmKhktHnZpCBVp4UDdfny3659DsL+hyCeeOp0vU6SfYrodB
	1sPvTIiIASr2bEZGrnPqvIN/ctgnYyucD3cOW1OZqIeWErJe2EM6h1ReKsY6l9IP/Q==
X-Gm-Gg: AY/fxX7h+Em1z9XIJ/CEsIou/mkfYyWKzjgW7MzX0kNDEqahQYFnRPdwLi5ahgHVohl
	u29SB0RkKnTxXG5tKQRV1Ix4ZhZnhZmAV6hmYWfmJNcG5PrLPLMkjbob9RT2DeQZvKBPvVPZAN5
	C0qpR5vsB/9UffiviVwQbOZLtYmd/wiTlV5v99fJv//jiO+27gLGYXu0Yxwp2ueMjtcSFIBcK+Q
	xJUQ9PItw/lWlMdjUdUsHB/yLzfSN+rtv34rQY66g6HI8qiqHp9mGBlUpX7PvSOpXFBilGZuwMl
	+nr+uLNkgffcmtsKvUkCziE+3lwAnJN67sMK3P7Pzum7vHTUz1PDxOI14fGUYZQ05qU5TJ9KCJ6
	1ehxDWi64iKtz8GMzGfv6N0dUMUDeoAtKjkW0fUxzavkgyy/jjDGAMNOaiq+v2d2T+UDU/mW4Nn
	xUxGmhZ5gcLp5i1m+SJeoICLOLpkVqpGOPX7pnHpPk6wfRBZtHt5H/OA9VPR5PbpEVBqTby6BDo
	Hk=
X-Google-Smtp-Source: AGHT+IFkOW5eH4a+B0qNFOruyjS05RwtJuCaBXHcjZI8kHXUe/cM0K4QtOoGv/cXIu9LhU/hAWu74Q==
X-Received: by 2002:a05:600c:4751:b0:479:3a87:2090 with SMTP id 5b1f17b1804b1-47a8f916cfbmr93027855e9.37.1765791178376;
        Mon, 15 Dec 2025 01:32:58 -0800 (PST)
Message-ID: <fa50aa9f-2b65-41ef-a88e-a073c9902439@suse.com>
Date: Mon, 15 Dec 2025 10:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Move GUEST_PTE_SIZE defines into types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251212160615.2486055-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251212160615.2486055-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 17:06, Andrew Cooper wrote:
> GUEST_PTE_SIZE are only used by multi.c, but private.h gets used by code that
> doesn't have GUEST_PAGING_LEVELS defined.  Eclair notes that this is a
> violation of MISRA Rule 20.9.
> 
> Move it into types.h with the rest of the level-dependent logic lives.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Okay with me, yet I wonder if we shouldn't go a step further and simply drop
the constant, replacing uses of it by sizeof(guest_intpte_t).

Jan

