Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927392CE8C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756701.1165407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTw4-00008d-OQ; Wed, 10 Jul 2024 09:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756701.1165407; Wed, 10 Jul 2024 09:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTw4-000062-Kl; Wed, 10 Jul 2024 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 756701;
 Wed, 10 Jul 2024 09:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRTw2-00005t-EE
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:48:26 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cae187b-3ea1-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 11:48:24 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso29040801fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 02:48:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d682b4611sm2622216a12.84.2024.07.10.02.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 02:48:23 -0700 (PDT)
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
X-Inumbo-ID: 8cae187b-3ea1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720604904; x=1721209704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PblYWG/fi19LmVlDeof8dw2FSZ4eHEex5InFw4qLNrE=;
        b=c1Kiq7GmFl1CBHuuuXePP7WLtdqGhQBi67LVu1CweUbCtC8ACNABtzj3kUQ3ACNttO
         v61bXib6LAlwO0lWvZoFMOYcjtcj3d83GkD37Pw/z10vymabw3ideO4siZWSHc9w+K+P
         sugsqZl+WQyXjvaHM4eXwX5BYJL3LoyogdptFtn3+AvtvLUb/npsp6cFpnEeqoggkgr/
         jNDnz0IPSO4fqOpMPP/Bnd8hl74af2T3Tax+vWtP8hoRYlsib3dWXjkIZh+7/RabfgIN
         84bRO/NjrP1FzyXWJABmjhcdds/rptjInE8D746hrsgeofXlAj/o0wZQ+6MuPwltO3gE
         7KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720604904; x=1721209704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PblYWG/fi19LmVlDeof8dw2FSZ4eHEex5InFw4qLNrE=;
        b=UzAivV1kaqEeIA5M/VAW60eP5NxgltuufsmOvEqt9QsZp7NvsqE7gPssFdvLY1g3Ed
         9BEs2SKohKZoGPQH3WlQ0BIk2eAaGnxaRwAgddGGgYxt+nw7K9jlIkeT1jGP8Vlq/HGy
         ghCfeLurfGT+u+QqQ6XM8xZNrWZSkSr0KH9S5MY3I+01W6/NIAJ0YtfLM3PR/+W2AG3K
         Ov225+C8N3X17XLE8ctekBpQxL2U26nnGKuO/OGfuCzAa5VxM/6O7ClfjgSKFgITYp5s
         i75HxuS+VFEjbXKQ835XABtdw4EheUg47HJAbBDBWXBOyDFH0CD0Rx3+Tj7b3O56bKwq
         tLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPszdXwLt+EJ8JBxLYAQH+xiXzca8y1HMm5V7oRiEAQofIJPgeYRVAIvs0Lc1sc9MQcyWWbT6eeXEAJYueTCxIaFsHI/7/XElyuS5jkbc=
X-Gm-Message-State: AOJu0Ywyqx4BbjhLiaY9FaTW4Ju2dFimrT63a1/WtqCEYfsTWn2vBOJs
	SlfmZBQeai95L0jN+w7N7V+D8nQmlZ45ceyvonuk13h9MMMOTimLZR9Z9ewe3M7vEJumRcV/BzE
	=
X-Google-Smtp-Source: AGHT+IGsrYTOb2PD2JGohDV/ptKtX3MqGRXkTOebqNserA61Vhj3HUfH9B2s9Lvg0TULBn9rukjjXg==
X-Received: by 2002:a05:651c:90:b0:2ee:8573:eb51 with SMTP id 38308e7fff4ca-2eeb318878bmr32251741fa.34.1720604903830;
        Wed, 10 Jul 2024 02:48:23 -0700 (PDT)
Message-ID: <8a2f8ed2-28a9-49fb-8c5b-5b0b8e7000d3@suse.com>
Date: Wed, 10 Jul 2024 11:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] xen/riscv: introduce decode_cause() stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <3b93bb33b42cb6e86a38cd95a098e60447666e2e.1719918148.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3b93bb33b42cb6e86a38cd95a098e60447666e2e.1719918148.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:23, Oleksii Kurochko wrote:
> The patch introduces stuff needed to decode a reason of an
> exception.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



