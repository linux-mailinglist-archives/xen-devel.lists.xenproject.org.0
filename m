Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394579408DE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 08:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767284.1177888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgfE-0003NA-LQ; Tue, 30 Jul 2024 06:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767284.1177888; Tue, 30 Jul 2024 06:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgfE-0003MC-Is; Tue, 30 Jul 2024 06:48:52 +0000
Received: by outflank-mailman (input) for mailman id 767284;
 Tue, 30 Jul 2024 06:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYgfC-0003M6-Rg
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 06:48:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6bbbc92-4e3f-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 08:48:49 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7a9e25008aso544897766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 23:48:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de6fsm605084466b.63.2024.07.29.23.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 23:48:48 -0700 (PDT)
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
X-Inumbo-ID: c6bbbc92-4e3f-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722322129; x=1722926929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb7QeYB4jrltSR1X1h+r+HsYjyWy/W7WT9zzF8QC3c4=;
        b=MMPxTCCGuNtEKehsE3XXQ58lURoHVXeH7l6gEJOiGZlk5+mUyDPjUow6gtIpr/CH+1
         W+yFAyr+EF0kEe9LAGrm+chlYuUe7LkEfZl1kT/iV9VuTkUP5+xnnYI3rQA2MdbvGpcU
         sfK7oZjYyq8KXFqOkhn8bNVgczXQbyWRbooTrRIW742Z83PDYGwMaTuA8l5+DSXLZJi7
         ahm8fiYRXdjX87k/WaLi70CyIGzts9HrmQSovdj0y4gVxUze23RhxiFqXNdhcYutfSiy
         Zg9uWiImz6VC29zJdHV6ALNpU7GKnaBCowPtdVsdp/OjlOofqEzxQkDhTccyv0iaTrKb
         AIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722322129; x=1722926929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb7QeYB4jrltSR1X1h+r+HsYjyWy/W7WT9zzF8QC3c4=;
        b=g+n8GgclQXf35BvE6de/u4OSfkbdwSzuFL1QUn9idlrDqJ+a2ILm6mwQZewVPl1dq3
         piLj+wUXeC+OYiG81MBlaz2zA5raPBw0oNb53dezKbozweIEmRy+Ubl1tZwDC/ftu7h6
         H0SGlsOVL8+XCHbUt0ojfYIgk6xMoaNgmc4p9xQMGDB1lXPr7qhO2Gtchvsu+M0Kup8O
         EET5lJyS+tDRxW1wH0taWuN1hLLFh18TNC/LVTj1LaE2GP13ECy62d2Ts6my6dXaRB0F
         2LaBwVr38Fd8c9IFTnQY2Ne2kTY2IqkAQsrI+PhV2neJgUj+wy0mI9foHIZKcvalFhpF
         vF0g==
X-Forwarded-Encrypted: i=1; AJvYcCXYkyoqcW4BgyP6weYqGldIU+gewB7q3aadaFsRtzwVhhYLvngUzD363jES6gT4gZOv9tJNiOhYnVCr4gEhydXQTlUjRRZc1+PyezkpQXU=
X-Gm-Message-State: AOJu0YzFit7mhA315S84vHpoEIKhdoL2/ymuJYorrOTRMqfgz1JiD7t7
	Gwgtd3nsANgTbd+RauIy5lE/K0DNfPfjPgToKINIuYmYb82EFudiOoWkQpb0ag==
X-Google-Smtp-Source: AGHT+IE6PMGNc9ucX7Nyz8rHSmkEG1Da6kLPK2uhDsmQGNGs6wR4P/HVMWvjpXYlGnpskDo8L73cCg==
X-Received: by 2002:a17:907:2da8:b0:a7a:a7b8:ada7 with SMTP id a640c23a62f3a-a7d400746d3mr728961166b.24.1722322129245;
        Mon, 29 Jul 2024 23:48:49 -0700 (PDT)
Message-ID: <680f461a-fd84-4d93-9dde-f524120d6522@suse.com>
Date: Tue, 30 Jul 2024 08:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
 <d313f39a-f5aa-4611-975e-bc64759bbd01@xen.org>
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
In-Reply-To: <d313f39a-f5aa-4611-975e-bc64759bbd01@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 20:36, Julien Grall wrote:
> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>> Use the -finstrument-functions option to check that the stack pointer is
> 
> Is the feature supported by both clang and GCC? If so, which from versions?
> 
>  From README, this is what we currently support.
> 
>        - For ARM 32-bit:
>          - GCC 4.9 or later
>          - GNU Binutils 2.24 or later
>        - For ARM 64-bit:
>          - GCC 5.1 or later
>          - GNU Binutils 2.24 or later
> 
> We don't mention Clang, but I would expect a clang from 4-5 years should 
> still be Arm (not cross-compile as we never fully added the support).

I was wondering the same, but already on patch 1 and with other architectures
also in mind, as there's common (XSM) code gaining respective attributes. For
gcc I checked that even 4.1 supports that attribute, so I expect we're fine
here (and double checking with godbolt, Clang 3.0.0 also supports the option).

Jan

