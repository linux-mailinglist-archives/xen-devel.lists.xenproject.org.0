Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170C7A7F518
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 08:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941445.1340931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22at-0007L7-F8; Tue, 08 Apr 2025 06:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941445.1340931; Tue, 08 Apr 2025 06:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22at-0007Hx-Bg; Tue, 08 Apr 2025 06:37:59 +0000
Received: by outflank-mailman (input) for mailman id 941445;
 Tue, 08 Apr 2025 06:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u22as-0007Hq-7t
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 06:37:58 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00edf685-1444-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 08:37:55 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso2202598f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 23:37:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226acfsm13708470f8f.88.2025.04.07.23.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 23:37:54 -0700 (PDT)
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
X-Inumbo-ID: 00edf685-1444-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744094275; x=1744699075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nL4Fa4P0oibNm+iaL9u3gz0ABY3w+PD5Vis4yz/rmmc=;
        b=J8d2NRbCB+LSRhO9BppvLNh0xXZQ5t4Xzdf/rMSTb2pZHeUtYAglxpfneK8drp8Dga
         yBywdMO2amaxzIpUeWiqnc27R31E6LI2e6+vEuGjAe9IYAd+xoBJdrhpYopZX/ZZcuIx
         +rZ0uLvFwP5DDSM+9m0SmluYu7yxzIoZb3AKz5Cq4PYpwWFyOT0TxIMZo+eFE+18tIuG
         nLw/qSKMM2+crLLBhivgSLy9m2M9I9g11PFnsFa6PgChsIXfN+TmqEiuy8BLCXh4OMma
         emiVy6b/3SD35Rgbwutgj5Nl9iJeQ+zYUG7ML2d81Pktc/kChnroqqyo+YiPd3gkfaUw
         jfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094275; x=1744699075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nL4Fa4P0oibNm+iaL9u3gz0ABY3w+PD5Vis4yz/rmmc=;
        b=l04tXSVlnfx7Z/V3apmJZGkChaFMbnNDSf/v+C52WdrYZWn12VUd41LlLTvwexTxeZ
         e/qq5CQP/O4a35bLiRLNmu4gmknDa2sa9xZwwH6T1nUo1WoIooKhy2jPq0CfB/u4bwdC
         1zma/FBJlX46lYoTnoe78IDchUvsYxWAguFce5iMsxPRO1Sc2xGROp28FZiXMBbikl1x
         Yx1VfyFyu8h4ps8MZ8jDX9qr7Auw8x7T+4iekokvvdpGt+tjvXlWlLKbw0Zut8fX13fo
         Wlib8Cxnwp9xcpXrjBGiDBgfCQu7B2NxTlR6YUfGE8JwQ7XglJ+aGgg2fmsiVgz50BYa
         xo7w==
X-Forwarded-Encrypted: i=1; AJvYcCVCAUdxJOwFypBRXKJof1h2ocNWEqpydf5//RWSCRcE/Qv0MErwBzMakl6endfYQ12/BEuGwcdDTi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZs9oMqs+0VGm7hYs4NgIhaYxEgdjYJrA/gegwt2wIGcCk+g75
	9RpnmuPKL2vGxl1UpMlFvCTxJDPcJOayVpXuyr4b2S8x6cxmONtWrd8CjbhXfQ==
X-Gm-Gg: ASbGncuTGfQwajcZWAKuTF/BGTtX07Pb6s2AWwpM3vpEV2tycxWIUY/Tn3GQHgWT4DJ
	FVSz5LQld9U7lF5Ei6dA27QWWg8XKbKCeWiqXEUS11sJ394Cnvovo+TnL73BJBrL5Bb3rVnNE9T
	BjyuT8Wy6JvopJ6Wc0KknkYhWCsg4P2A9mnxbsZ2pkwrLPrDEb+2t/PbXOnPlujH7cT/RpzR/Ie
	ELK9KciAjZ5+ykI5mN598KHhmL/dwTMy+JyTDGuSiqeWfQZTvIGCux5hJLbLHDKre7KScbG1CsO
	FsJm+ZspVM9tV4tLUiwzuW4vW7FosdJAAWEIiNOml2yxKl6p4crEEIhqqAi8SuKZ7QEmewHG/l4
	AH80U3bKJqK2aIzbNixc4mD2iAJGwsQ==
X-Google-Smtp-Source: AGHT+IHukJAQ1bq0zKGZ1df/H597yz3DfO2sluZPPdBT6tvNUCPNhycLqHIJKmgjqCBYOx4UHqC6Ww==
X-Received: by 2002:a05:6000:2506:b0:38f:3073:708 with SMTP id ffacd0b85a97d-39d6fc00b6dmr10278100f8f.3.1744094275043;
        Mon, 07 Apr 2025 23:37:55 -0700 (PDT)
Message-ID: <b032e7bc-61a4-4dac-97c1-171771869156@suse.com>
Date: Tue, 8 Apr 2025 08:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250407194038.83860-1-jason.andryuk@amd.com>
 <20250407194038.83860-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250407194038.83860-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 21:40, Jason Andryuk wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Add and use a new internal create domain flag to specify the hardware
> domain.  This removes the hardcoding of domid 0 as the hardware domain.
> 
> This allows more flexibility with domain creation.
> 
> The assignment of d->cdf is moved later so CDF_hardware is added for the
> late_hwdom case.  Also old_hwdom has the flag removed to reflect the
> change.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
i.e. ...


> ---
> v4:
> Move d->cdf assignment later

... despite my earlier concern this movement looks fine to me.

Jan

