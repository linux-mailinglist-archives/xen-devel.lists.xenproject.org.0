Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C28C6430
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722122.1126009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7BGG-0001yI-6G; Wed, 15 May 2024 09:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722122.1126009; Wed, 15 May 2024 09:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7BGG-0001vc-3P; Wed, 15 May 2024 09:49:24 +0000
Received: by outflank-mailman (input) for mailman id 722122;
 Wed, 15 May 2024 09:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7BGE-0001vE-9K
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:49:22 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 678f7763-12a0-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:49:21 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a5a88339780so150790966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 02:49:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17cd0sm830766866b.214.2024.05.15.02.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 02:49:20 -0700 (PDT)
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
X-Inumbo-ID: 678f7763-12a0-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715766561; x=1716371361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMIoX1C6AAf1aqGV3Zp/glLRSmmmteOWja094gIAFXU=;
        b=ZGVksqJtKFgGUbKe9V1xRhVjF2D3TjQboi2FIR4QsdCZ5fw4ID/pmZ8ho72dUNu5LA
         YdhQAhfx0uu6fuzm84Exz1YoGLx7ebJA37Qn49otEBXrI3un7pWkFp9Ocp/9ZOymEEFS
         WhdmDRe5zcerTHeiQKq61GsE7wU70GG8eUo+vVyUvQ5to5ZK1/4/X6cdSxXz5jUHwcVR
         ltxet2sjZ94ynYCm1WABdmcdzQbFhdq0LKuoLA2zLGUWfbzxiq4isDkY3vZGDbkx6/q+
         XhU85uDcH5DkvzJKMufkYhMBvkJRnyH4nMOVUWOmzE8UdLh4QjqzQnKW0RIVqwPfjsml
         ICOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766561; x=1716371361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMIoX1C6AAf1aqGV3Zp/glLRSmmmteOWja094gIAFXU=;
        b=I9Bjqz2sVqVo/Y9+L3xsCFBhLnGg9KSbAKm8oUbSNdB5fSv+hdiRuOE9jLF8aYU8TI
         eNhDWmPmM+bDQnPZ1348hUVytqsgGM9SJB2ssMgXiEoUORhI5VMOH75eorin3Zd5DGrw
         J/siM/RKIvXiL1j9oeu3G6Hx/UMAWD2j0iUXqANM+RzR5o8/wy4VHmDBRUYQTSRmsnuT
         D1jf2eD50Q2WXVlWONpmeqPfpwiPp7FYaXj1VuJTpHyV692qLleFdmLkC7reipE/BgIZ
         q25pgaEk60mvCbcXfAplb/vg2Y8fey9VlrwvRlRXUL0F/i9LSiXiAkv0MQyQucZ68BwN
         I9jA==
X-Forwarded-Encrypted: i=1; AJvYcCW/n4i9x7qxjdjJzZiB+qg6OVrKaM49cjGv7gq+xFdn2TSMrmH0GFTor9hulSGUDpiNquznUyFly28DBXcxlGTbduCXp7IpM+q/1tkv0fQ=
X-Gm-Message-State: AOJu0YzCi4N9R8Vm8YyECMyafbFmQvoR1vE5oLYcwZRTd0j2uFmRPF5m
	+ZC49Fr3oKrhvNddSFUnBtWOOipkJYztR7W66L9PStHGz1Hic1SUjKhIg7fwww==
X-Google-Smtp-Source: AGHT+IENfqmBIg3MHEvj7+UWx2aIl3QCPOZk8d7eEDCwliMr8LNdf9Cnaocnqk4NpKgNucv68Z/4/w==
X-Received: by 2002:a17:906:134d:b0:a59:9eab:162b with SMTP id a640c23a62f3a-a5a2d5d01abmr1016382266b.35.1715766560927;
        Wed, 15 May 2024 02:49:20 -0700 (PDT)
Message-ID: <7a4e4b99-bedc-4742-9119-2bad9bf468de@suse.com>
Date: Wed, 15 May 2024 11:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/15] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <1b8d0d3e665adc10222a9e07cedab7bcb40d88f2.1714988096.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1b8d0d3e665adc10222a9e07cedab7bcb40d88f2.1714988096.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2024 12:15, Oleksii Kurochko wrote:
> Changes in V9:
>  - update the defintion of write_atomic macros:
>    drop the return value as this macros isn't expeceted to return something
>    drop unnessary parentheses around p.

Yet then what about add_sized()? With that also tidied
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

