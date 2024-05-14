Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6AE8C5757
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721535.1125005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sV9-0006W0-SW; Tue, 14 May 2024 13:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721535.1125005; Tue, 14 May 2024 13:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sV9-0006TS-P2; Tue, 14 May 2024 13:47:31 +0000
Received: by outflank-mailman (input) for mailman id 721535;
 Tue, 14 May 2024 13:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6sV8-0006TK-U3
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:47:30 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8119555d-11f8-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 15:47:28 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51f0b6b682fso6081548e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:47:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179263d9sm728477466b.95.2024.05.14.06.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 06:47:28 -0700 (PDT)
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
X-Inumbo-ID: 8119555d-11f8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715694448; x=1716299248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gXJutPpaMImNmnLoQy2AAn0UxkAqLU8P2eGlEX6wDQ=;
        b=bnulQbXExi9ue1bkWshncHj8dG+rOQ5kkf9s0nnmoTi27SSy7k9xD+JyZCxqMJWr93
         eRH3vsd8OQIwI3QIYaTanqr02uTA4j0XVRg6N6uSK1YwyVDjyDpbn3efrcdIxj9DPB9k
         +Sxr5/A7ZAoobLcZbXkDRyrgLgk79R/0umfTLGeLARAESwVl8/5jmR3sfRMla2sxcWLh
         UyuDX3MStX+9Z8cn/KjW9LRlOBXuyrcb3PUX0r3z0X9YPyCK7iWLltkfR9ElAGCihNnt
         N9j4IkuTZls46kw7xSwOy00cJpWpWwGJGXFgHIeC7WVQt0TYni3Jrw5XssJTi9yko2nA
         wa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715694448; x=1716299248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gXJutPpaMImNmnLoQy2AAn0UxkAqLU8P2eGlEX6wDQ=;
        b=gGOPcmRsZSAQyoDscEin+8sfJL17sLE9cM42OZLjWNaz+7N7M1utdur71Aq4s3v/TX
         BZJ08V+tjhRszDJFKKWpD1pdPIH45ywOAt/XUmk2UhmbBk2LOrtkef23qmZ1+YSXHJgi
         NZrAzTTRQ74KsBJ3Tjt8EBzBrLoRkzN81mDhv487TAR9Ao9AfrbNusw2MJ7mu9scb41P
         3TLxsJLXis1prvI+0rmPBO9/Ae56kPYeSHM79vykLvRIeQfnv3WtKLA0/LWS8BENkjaT
         2QuvjyP6XjXTfa0ONHKZHK9L0MupddmUpdyqx5e4GhnnA3A/3qNyPDR+Dcl8sNykmD5i
         uuaA==
X-Forwarded-Encrypted: i=1; AJvYcCWzAjGOa3P91mJ8QCbyj4NZhU3VEjMXeOAeEWi3Lta00d/L8rqLUqyb7PHBI4UvYiwpamJT5P+w3YXtw7xFNdXCegNQjaUY/rRIzIydkL4=
X-Gm-Message-State: AOJu0YxG5T7v+AMf46UJCXLLwrhiwrgSNq+vtdwxcXhdFkB5DyJsmtXx
	YJp0nFUNd7HnwSC4mZQ3mMJhDjmNwbO5WmpwuP5Mysbrm1+t3BmlE9fP+cxohA==
X-Google-Smtp-Source: AGHT+IG735Iwwspnulg1QVlfLn8ujVWOlPAiIcH7zwTga1L4cgCKJr7z2b9ShHqiU8wC1CVlPIqJrA==
X-Received: by 2002:a05:6512:3c87:b0:51d:5ffd:efe4 with SMTP id 2adb3069b0e04-5220fc6df22mr15365916e87.1.1715694448234;
        Tue, 14 May 2024 06:47:28 -0700 (PDT)
Message-ID: <369a3c75-2e71-4fb8-8373-aae737099e3b@suse.com>
Date: Tue, 14 May 2024 15:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: replace R13.1 with R13.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2405101625470.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405101625470.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.05.2024 01:32, Stefano Stabellini wrote:
> After looking closely at the R13.1 violations and potential fixes or
> deviations, upon further reflection and discussions, we realized that it
> is R13.2, limited to initializers list, that we want to comply with.
> 
> Link: https://marc.info/?l=xen-devel&m=170751643325805

The mail you point at is a reply to one where I raised an aspect that was
never really addressed: 'I'm afraid I don't understand the "eventually
limiting" part.' Therefore I also don't follow why we'd want to limit
applicability of this rule to just initializer lists. I'm pretty sure we
do not want expressions the result of which or any side effects of which
are unpredictable, no matter where such an expression is used.

Jan

