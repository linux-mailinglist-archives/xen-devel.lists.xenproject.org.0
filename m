Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4368F813189
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 14:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654572.1021614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDlkG-0005jL-Vo; Thu, 14 Dec 2023 13:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654572.1021614; Thu, 14 Dec 2023 13:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDlkG-0005g9-SN; Thu, 14 Dec 2023 13:27:20 +0000
Received: by outflank-mailman (input) for mailman id 654572;
 Thu, 14 Dec 2023 13:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDlkF-0005g3-92
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 13:27:19 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80988236-9a84-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 14:27:17 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so10473010e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 05:27:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05640205c200b0055122551f98sm4313737edx.6.2023.12.14.05.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 05:27:17 -0800 (PST)
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
X-Inumbo-ID: 80988236-9a84-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702560437; x=1703165237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UW+LEd6alLWbY1UlBiK9EgrgI3DwgKwGv2EtAM42Pkg=;
        b=K24cEDqCEoahS7boyton4mfGKddFsyerr/0hPkGLmQA+lO8DwST7QXTU+aHfeRjUvP
         wWoqVY6U35X7axzOG/SHEp+AeDxn7fNi7xkmAYtM1X7x9Sj8wGQmvBF8SlCZbIZh6QEZ
         Y2VvT9Nni9TyEZ1GS1QXqqLoCxMpMMnegQsvCPi4Cozlu0SKDrzyIz7xOu+mxW/DGb0Y
         BVx6artqGDJY09qhpnzwTy0mbw8y2BPAr5ZMiXoEbEwCGya9qn0dikL0j/jrQpnE8lBc
         Ibp11pNusgrB3ToTIZaFvRV+Rjps+iKEbVUHIsvjx9e993sqDGsx/TbHZofYNMLaFpMt
         DnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560437; x=1703165237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UW+LEd6alLWbY1UlBiK9EgrgI3DwgKwGv2EtAM42Pkg=;
        b=vCnh1hvXEP2lYxqdZ3cmVdxTwvcOaQMjkt5iMT/lCE5cYiHK2gnp35AAPb7SZQewW7
         Et3cTd6P3Db1JXfzFxaz7FdhVKeJ/ChEgrZFcYUBP8jlCaO6bAu0P1HjpEZqlWtFtpkt
         n97Z4AYxtcTIh9IHrAlhhzMFFds5pHQIZCpdbF6VK9BzQEhvBU0adX3bLnnLGoMLn7md
         Z2IrnfzOuALXbXDHfTx4I43TtDaw50XCWmwptC4doDXu90cu30LutKGUzNQlDAr7H8W5
         XvHngVjR9obV/zK5YbJD7iCF0y9/1HE8ZI29zNvxUueIUgfFsfueVV/jkyZLDXWFrTZr
         9qWg==
X-Gm-Message-State: AOJu0YwJ3tT4Z2/C5VfEnoFCy3dnV8IWJZo83zb8dKJi+X8P2m28fs+j
	W1jfqalrxnrEGU1tu8DFZ22e
X-Google-Smtp-Source: AGHT+IG3ZOcMgNMoId/+MS4gdWQYMu+40a8MlIGUGo3E651c+XAyuYzdw6YakOZgSDzSDQWNbY92WQ==
X-Received: by 2002:a05:6512:689:b0:50d:1968:9f8e with SMTP id t9-20020a056512068900b0050d19689f8emr6766546lfe.100.1702560437525;
        Thu, 14 Dec 2023 05:27:17 -0800 (PST)
Message-ID: <ab8479db-b9f0-43b2-a751-349c7a59287d@suse.com>
Date: Thu, 14 Dec 2023 14:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/39] xen/riscv: introduce bit operations
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <20732007fb103115c0e01cefea7d113b8a7ad8e9.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <20732007fb103115c0e01cefea7d113b8a7ad8e9.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Did you write this code from scratch? If not, you need to at least point
out the origin. But: None of this looks RISC-V specific, so shouldn't it
instead be put under xen/lib/, as a fallback implementation for arch-es
not having optimized implementations? Looks also at least very similar
to Arm64's, so that one perhaps then will want dropping as well? We
surely don't want to carry two (almost) identical copies of the same
logic.

> --- /dev/null
> +++ b/xen/arch/riscv/lib/Makefile
> @@ -0,0 +1 @@
> +obj-y += find_next_bit.o

Dashes instead of underscores please in new file's names, whenever
possible.

Jan

