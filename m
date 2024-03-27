Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD288D72C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 08:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698317.1089870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNeG-000574-0d; Wed, 27 Mar 2024 07:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698317.1089870; Wed, 27 Mar 2024 07:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNeF-00053r-Th; Wed, 27 Mar 2024 07:24:35 +0000
Received: by outflank-mailman (input) for mailman id 698317;
 Wed, 27 Mar 2024 07:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpNeD-00053l-P2
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 07:24:33 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e8c1935-ec0b-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 08:24:32 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so882012a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 00:24:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c36-20020a509fa7000000b0056bdec673c3sm5168594edf.38.2024.03.27.00.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 00:24:32 -0700 (PDT)
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
X-Inumbo-ID: 0e8c1935-ec0b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711524272; x=1712129072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bgk+4v2Dk2hXBC3aWBgG3RLvIadqLM5wfcRiQudpROU=;
        b=R50XraI39JasjePmSON6OxF7GlCSIX/0V9Syxfj121sCL0Xu9aaghc0Ym9Gm+2XNwF
         72UTpm8R3u+lWjllbGITOe0J56k6nko2LW5XYfqcGE5UTH3UZ4e26rgylvePG9fDNic7
         HI6LKsr9HSwFBOqROE5JnPhBfeAPYxz7qScQQ/+OeRIW47AHyibUjZn/iP/nRmpcmZVK
         EbS4tHsXHdq1LSaTHMnxnECwfg5w3HZOozjYHHTA7U2PnJwpN+d7vuCt7xGw4r+CIsR7
         HN1/WD27m0RFE2KbFpJhMU6ZeR6btoj8aDZppLKFKGII+KMxzrLaQDAUsfzwf5il3EeG
         UZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711524272; x=1712129072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgk+4v2Dk2hXBC3aWBgG3RLvIadqLM5wfcRiQudpROU=;
        b=vPUm0a9NUEt+aeflQPrDWe9uzGrlRw4kxGU5TqWnEa4LqtQLajSk5srDnonrVsQUnl
         YGBbKTmMQkwGryFvXUZ79IKlUh3W2iaitvDVXmnfLmM7XRKG0c8kDWJNfMpJxuW6Yxzn
         346WdCADb3zKm4O7TIyBKqJR36xdAFubp36IabHbDnzS5itj55frApfCpqaKPm5ho2NA
         QQ64uhraEk4AgoB9aXSXV0mW0fqSqeOwc6hAhu6XhUioCPECzlJtCkCm/g1azMrTEpFm
         eglJWoI8D+g7y3mRNeAFs7f24C8u7N2Yo1djBi/zFxBaUq3Ve1scOeFqunEdx6x1PtiI
         rKiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq5jk79RkcxgPBAfxH9z6uHIBNpaACfEA0YAN+iigXULu5S9ZPEABgZShe8d7BNC76p0frMGKg9oy10GWeXWXbnDgwlaLJ7BZ6cmhXQiU=
X-Gm-Message-State: AOJu0YzNCrvs5Hfg9YwjxgN4p+2wB1aHAniyo3EwNiEoixdwHf5Fa09b
	ASGQ06ry7pO9X2S1W8M5FdElPoGkvSz73j1/o8xnFg3IYYzXv9gz9xLlS6cN0A==
X-Google-Smtp-Source: AGHT+IHYBHbOY+xO2iNf75TaJhKNA7zr0xcee7WRLG293hA0Xu30Gfbzvy15lXzJDcVRre536H1fBA==
X-Received: by 2002:a50:d506:0:b0:56b:e535:6b01 with SMTP id u6-20020a50d506000000b0056be5356b01mr3182051edi.4.1711524272460;
        Wed, 27 Mar 2024 00:24:32 -0700 (PDT)
Message-ID: <c68cb323-b616-48de-939b-2309b69ce4bc@suse.com>
Date: Wed, 27 Mar 2024 08:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] xen/elfnote: Specify ELF Notes are x86-specific
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326213847.3944-6-jason.andryuk@amd.com>
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
In-Reply-To: <20240326213847.3944-6-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 22:38, Jason Andryuk wrote:
> The Xen ELF Notes are only used with x86.  libelf's elf_xen_note_check()
> exits early for ARM binaries with "ELF: Not bothering with notes on
> ARM".
> 
> Add a comment to the top of elfnote.h specifying that Notes are only used
> with x86 binaries.  This is to avoid adding disclaimers for individual
> notes.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



