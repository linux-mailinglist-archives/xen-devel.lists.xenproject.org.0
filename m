Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26098A71703
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 14:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927791.1330530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQML-0005Bn-Ao; Wed, 26 Mar 2025 12:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927791.1330530; Wed, 26 Mar 2025 12:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQML-00059V-8H; Wed, 26 Mar 2025 12:59:53 +0000
Received: by outflank-mailman (input) for mailman id 927791;
 Wed, 26 Mar 2025 12:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txQMK-00059P-2P
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 12:59:52 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ea75f8e-0a42-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 13:59:41 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-394780e98easo3890544f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 05:59:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac3ce3dd1sm8232396f8f.88.2025.03.26.05.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 05:59:40 -0700 (PDT)
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
X-Inumbo-ID: 2ea75f8e-0a42-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742993981; x=1743598781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sMYKhDSvHuz6t/xpBRG1y5nN7OnEyQtFFqQkND6a3G8=;
        b=YpZJOZOUDkB610MY+Gz5iIMOgmFdf6YVfhk4OoseVBR+NPFQ6R1zAY5yspuSoxr9Yk
         edL2H7KsRC3SLi5SGkZxe5W0iDB3WOZswQbNKDULaaP5tEZWtq3qw9kXkymQ3Iuu+dAE
         lRr7ylOKXaM+kkeFhazRhw8EeAO0zXZwenBzWhe1u3VintV/SSPAMYLjm3ZGpQSuc9X6
         3OjsYD0xnNDb8+DUgfi0+fU07YXX71VEN89uGhcuhKRx1k3iM7STM2DVTRfibb7oDbnu
         oLaWoN+hx3H4RSXM8jonByU44ymAP58zox/WqUudiANzxIizu3MQGfkV8VXt7qdBOKO0
         j39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742993981; x=1743598781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMYKhDSvHuz6t/xpBRG1y5nN7OnEyQtFFqQkND6a3G8=;
        b=DLZruAXikXYKUzhsktkTZbVoJhIvWnUCNTWzcTOdTvwyVUo6wc055QrQ2UZFyCNe70
         HH8FWLO/mKPFuouoOGiZdlLXR0ZeFs2g92v+GkNSzsE35m5h3gzORYhLykIpUt88HSW9
         O80T/D6Oz3yy3TkxGdJPi3ZC+xZw7h6Y/pFecWWuchatyJqzBd9ymU6AWwi9f5YI6MfR
         yOkUuh+jckSZAIi8Kol1XCcRebMSGwEUHCYlLaAAxadVKiAJgL9ett9rOuzYDENxig36
         A0svLQWd5Ahx7XXmRWSomO29jw1/StI+mGYIVhNNHLLL6Zdw7QagCTXlZCoD8MGYLHGH
         4nvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOs7BG1qxbjh0nKjGIcnMzFBB6O282Zpa1SLlqj8JeGuDdEZa/DR6m0WzIfH9iOHV/bMyv7UuNusU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7VZhW9bW+doQ9jaRwu90T8LVoVOeNfemEw1nbn9UT0hNszLAx
	P84rAX2T+BolJNEjjbl2DgnZ0mnvayy9unB9WXRnwk3yPalWmcHD61s6hFKuLQ==
X-Gm-Gg: ASbGncvnkjpMYQqlOQWlGfRvB4WzJMV1WmWK8Fzu/MpefBaaU6TYfK/PAwiptl4Ju5e
	5sgRygoHdzAGC6Sj7nkCflYe8epR9VClJHJkafD0QnGchGRv3uQflxUvLCB80VSwDt6yt4+SKva
	ykoZElG8fmruK93dxgL1lmF3m8gFD+W6/5dsK2IczhWdmJfsQdiVAIe5ZnLhpm3R1QyKde0bPBQ
	hALBNxW3PbFtYH2lTrtmUeXUhNi/jYco+pTQg4jIQHdvCcG18dCZ8qb2+k75jw5Pfk8kXIUXHNa
	lDQrJ3T4GKa0ZWTmDonLe1yYmae0DTdRyJ/56UxMrlLKUpfbLN4Z3q/e3fSe1aAZLHcEkjHzJrw
	UmOVk3IcnyICKR9tsPsC7XALv5jbpmg==
X-Google-Smtp-Source: AGHT+IFzdpi/2oMwWRYThQ4yRji4fQb0BtnjF6KjpYFKzYWz3IwVE6NsBXGcF8S+/uSK0A/jcaKvyw==
X-Received: by 2002:a5d:59ab:0:b0:38f:2ffc:1e99 with SMTP id ffacd0b85a97d-3997f938665mr17776687f8f.49.1742993981010;
        Wed, 26 Mar 2025 05:59:41 -0700 (PDT)
Message-ID: <300cb770-ec55-4ea5-b917-c21b6e87d320@suse.com>
Date: Wed, 26 Mar 2025 13:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: add H extenstion to -march
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <f03b414909751fd33bb42e984812396289b83b9e.1742992635.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f03b414909751fd33bb42e984812396289b83b9e.1742992635.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 13:42, Oleksii Kurochko wrote:
> H provides additional instructions and CSRs that control the new stage of
> address translation and support hosting a guest OS in virtual S-mode
> (VS-mode).
> 
> According to the Unprivileged Architecture (version 20240411) specification:
> ```
> Table 74 summarizes the standardized extension names. The table also defines
> the canonical order in which extension names must appear in the name string,
> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
> RV32IMACV is legal, whereas RV32IMAVC is not.
> ```
> According to Table 74, the h extension is placed last in the one-letter
> extensions name part of the ISA string.
> 
> `h` is a standalone extension based on the patch [1] but it wasn't so
> before.
> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
> and for that version, h is still considered a prefix for the hypervisor
> extension but the name of hypervisor extension must be more then 1 letter
> extension, a workaround ( with using `hh` as an H extension name ) is
> implemented as otherwise the following compilation error will occur:
>  error: '-march=rv64gc_h_zbb_zihintpause': name of hypervisor extension
>         must be more than 1 letter
> 
> After GCC version 13.1.0, the commit [1] introducing H extension support
> allows us to drop the workaround with `hh` as hypervisor extension name
> and use only one h in -march.
> 
> [1] https://github.com/gcc-mirror/gcc/commit/0cd11d301013af50a3fae0694c909952e94e20d5#diff-d6f7db0db31bfb339b01bec450f1b905381eb4730cc5ab2b2794971e34647d64R148
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



