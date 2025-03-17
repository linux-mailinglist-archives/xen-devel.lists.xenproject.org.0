Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EAA64B11
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 11:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916527.1321602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu86f-0002ud-Ey; Mon, 17 Mar 2025 10:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916527.1321602; Mon, 17 Mar 2025 10:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu86f-0002sh-CK; Mon, 17 Mar 2025 10:54:05 +0000
Received: by outflank-mailman (input) for mailman id 916527;
 Mon, 17 Mar 2025 10:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu86e-0002sb-Ah
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 10:54:04 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2334d6e8-031e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 11:54:02 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-399676b7c41so327178f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 03:54:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b70sm14814357f8f.30.2025.03.17.03.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 03:54:01 -0700 (PDT)
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
X-Inumbo-ID: 2334d6e8-031e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742208842; x=1742813642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx1TDa9qN3/BWfDw4u3C1fNpdjFuOEnm+dAVvqol/+Q=;
        b=V3fnfVpifP+JuXDHUkW6RWSGr72AIiUaE6QMgh6Frc3Eh510phH429jexHePTgK2v+
         pJFkJXlYJhg07ff1chHMJffOzuAEAJyQdFTKvdh0Npw/jVUUACTakD9b7e8Kaf7b0uRu
         A23YSEJqqIEdxMv2MUAGRUNFajUmAYs12g/JN+dS918GYGX85D3wMM9nLohY+ma3gryD
         LmD9PBK7LJFgCBQlHys7NYXSY9SG2D0VwtdGqAh2mYZDwy21y/GN8g8lyBt/1RD9WvYo
         Z1sDVzgLATlaKyMXVsZHWoeWcqmchwp3hA2EqsllkqrwQ/gsnWiXmJ6T/M+ycQSxMrI+
         OIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208842; x=1742813642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx1TDa9qN3/BWfDw4u3C1fNpdjFuOEnm+dAVvqol/+Q=;
        b=h9pbZCU+AH1nI6PqyXqBADfFRYxEsFiqFgoO0nnHgS/3tpDqJKdjaEcRr14pCQKyzu
         cDw7rad9T4h3WF4TBxeVkHX+lnylUkFQIPUB0rfoUTOpaH9MrGKuzYa4ba6YMYOJwJRV
         1SQ6svgQs4w+6vhYlkxMdXBXRe2IjnNguij8kbjS7dRk4eAZvquCyiCEmh3sQKVxglvZ
         aMaymBiNKXYWpIHhfsrVfkHpPvYyigWhk3WFBc9ZrcgCaD8Jfji0Exgr/K5Q/vIMa0zz
         To8KO/jO1DhWUhi5Rf7pl2gywzTEVJxIIg5l5c9n0xmQKX2vsvEdJOjAf4398l0zmtnW
         NQbw==
X-Forwarded-Encrypted: i=1; AJvYcCU88t+uo5xX9JhhbHbjLIhLdmzUZs3DyksxUiMYQy1vgPgQ95xGw/mdQZcPtFQlotArFJL5sB9fowA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzQLUNi/F8nLWtOptwyKLXh/uzCXRN5zIhe/MRvODYJO6AtL31
	D1pZxLSmOpvlTI8fGMm8EqiTG4zk/Z+qzsww6I6dpgYGFJ0Tj8UJRh4uaBjbfA==
X-Gm-Gg: ASbGnctylMspNxMQlhpyYptGzOLMRcnMajdL3TGcNMkExO938UNko19F+tGj7FuSlN4
	7PfsIDoiPQrssVkG9w/Ubu0v3h9dITMt8LH+C/h86X3+aIOnH/xKrUo/5K9y74NUlx4wdPxdomm
	yV5t5rgH6PLLoryPV6ertkd3F0ManoDgrxCMmSiJBY2B/ok4px3C+twvNjqNmCgWbhAbXewqCS6
	PCPXtE41+KSa9vSuaOpnpVKGyBlP2fO9SHGWnykSQCI9exm6imfmta96Qp2r3ElWhm1cveGUop/
	1uzWUreX0ErODf9Su3MExAHzaxM7FR7lCTrUwWxeN2IGI8JsTu4ssGlEBKTSHTLxfkY2M7LzMbH
	yR/5W9RcS1lqin8KEH6X4MtGp4RPEbQ==
X-Google-Smtp-Source: AGHT+IGK9ctn8wttlNISvM6fCIjA8he5IxrrniOGauu5xcueVq9sv8uII2ZuEoK+ei7HFmAHmMbEXg==
X-Received: by 2002:a5d:5d82:0:b0:38f:3c01:fb1f with SMTP id ffacd0b85a97d-3971e3a576fmr7850750f8f.30.1742208841908;
        Mon, 17 Mar 2025 03:54:01 -0700 (PDT)
Message-ID: <3301f86d-f47d-4078-8279-89e442bab40c@suse.com>
Date: Mon, 17 Mar 2025 11:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/traps: Rework register state printing to use a
 struct
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> ... in preference to the crs[8] array.  This avoids abusing crs[5..7] for the
> fs/gs bases, giving them proper named fields instead, and avoids storage for
> cr1 which is unused in the x86 architecture.
> 
> In show_registers(), remove a redundant read_cr2().  read_registers() already
> did the same, and it is only the PV path which needs to override with
> arch_get_cr2().
> 
> In vcpu_show_registers(), express the gsb/gss decision using SWAP().  The
> determination is going to get even more complicated under FRED.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



