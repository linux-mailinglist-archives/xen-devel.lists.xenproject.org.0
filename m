Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880FD80378E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647090.1009805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAIc-0002Ka-1K; Mon, 04 Dec 2023 14:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647090.1009805; Mon, 04 Dec 2023 14:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAIb-0002HS-U0; Mon, 04 Dec 2023 14:51:53 +0000
Received: by outflank-mailman (input) for mailman id 647090;
 Mon, 04 Dec 2023 14:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAAIa-0001Q8-Bm
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:51:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a2037d-92b4-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 15:51:51 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40bda47c489so25198965e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:51:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b0040c08567bbfsm6274349wmq.17.2023.12.04.06.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 06:51:51 -0800 (PST)
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
X-Inumbo-ID: a8a2037d-92b4-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701701511; x=1702306311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjOdG3wuffTyVvy9BYMeUZ43lJdjY7OuszqYTsw5Z5c=;
        b=PlcTot3WhIlBOiP2RapcieIOpYBXn3hN5v5seI2WocsTL2Ficd3yYeWmxsrZMoAVEN
         N2dkt/7PPQBYrJ9yIE9S7PjIaN7fG47CIxZ0L0VOSf2Fi2pC7wF32nYGxzLI0B9BcdgY
         Js9nKvysPTM8HvVKAKKjui7ZgdobE7btXNiJ3oaeA3cKZnv70GK8cGBpNxeCZeFjyH3f
         xK3sQ3Ri/hr+cbwgteM6MSgXXKIZMwZOI7wH2oPxjYwmQXEgTM03U6fyK/sGzOfU/wDA
         ICBjsu+P2u79RAqkDy4NwbB6GW9ND1J0MTfi2APw+mKSVL7SGqBahQKyFJ5agqmCljLd
         NWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701511; x=1702306311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjOdG3wuffTyVvy9BYMeUZ43lJdjY7OuszqYTsw5Z5c=;
        b=CYHuUh1B9mNonzwhLU57UxSNEWJJg6N1ZDu6WjGBNULP1Gq/wxI3hPyWUZQ0XxewLr
         x84alKL6UvzXEwzIjwj9tX6XEXUh4XWXwZXYB6rVcBepjqK9ZnmRr5TM3LC2GJrZND9n
         PwPI2JwVDGjKGijLWRK75jaO6EvueCiiSRZRkHZBOz66QKw1bBOARE0tCSxGK345RqQ8
         6PIN/cIhfRdX2T5V/XPnNYSX0ZOvlG9Owl8PDJVanAdNQUp/8EAcbLKk8FWv506d4jmb
         OBtlxSZCl3w4bU6Cw7f5/i2PnNOJyFhAxdaO/cj0WMcHbA00oAL+WIpDeJgUSCXgRp7i
         c06g==
X-Gm-Message-State: AOJu0YyMAymK4mocm8pdf+JLp0l9yZewU/0FtR+VEAUZe/FrRpMjSw0H
	cffH+SrMkeMmjHzpOa21yXfBB/FLtKH2jnxL/+MR
X-Google-Smtp-Source: AGHT+IGyZaoRPqsBDcqgVOQHwqQ1NyiG7wswiID66shHF711NODk4yYtctqrtQgnURBi1ppWPgWFvg==
X-Received: by 2002:a05:600c:601a:b0:40b:5e59:c557 with SMTP id az26-20020a05600c601a00b0040b5e59c557mr2510343wmb.129.1701701511284;
        Mon, 04 Dec 2023 06:51:51 -0800 (PST)
Message-ID: <43513284-c28a-407b-9567-2f120b2e322f@suse.com>
Date: Mon, 4 Dec 2023 15:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] x86/p2m: preparation work for
 xenmem_add_to_physmap_one()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1701344917.git.federico.serafini@bugseng.com>
 <aeafaee0fc4a507f6ba0c10e8fed90ed73a6bd6d.1701344917.git.federico.serafini@bugseng.com>
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
In-Reply-To: <aeafaee0fc4a507f6ba0c10e8fed90ed73a6bd6d.1701344917.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2023 16:48, Federico Serafini wrote:
> The objective is to use parameter name "gfn" for
> xenmem_add_to_physmap_one().
> Since the name "gfn" is currently used as identifier for a local
> variable, bad things could happen if new uses of such variable are
> committed while a renaming patch is waiting for the approval.
> To avoid such danger, as first thing rename the local variable from
> "gfn" to "gmfn".

"..., in line with XENMAPSPACE_gmfn which is the only case it is used
with."

This is to justify the name not matching our generally aimed at "gfn"
and "mfn" scheme.

> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

