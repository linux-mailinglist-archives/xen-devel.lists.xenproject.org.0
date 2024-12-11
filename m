Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED19EC588
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853890.1267226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLH9V-0004hW-VE; Wed, 11 Dec 2024 07:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853890.1267226; Wed, 11 Dec 2024 07:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLH9V-0004fn-S4; Wed, 11 Dec 2024 07:28:57 +0000
Received: by outflank-mailman (input) for mailman id 853890;
 Wed, 11 Dec 2024 07:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLH9U-0004fg-Ei
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:28:56 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93ff1425-b791-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 08:28:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so1502955e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:28:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216796e213bsm20618955ad.126.2024.12.10.23.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:28:54 -0800 (PST)
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
X-Inumbo-ID: 93ff1425-b791-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733902135; x=1734506935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=01PaaWgxANIyZIvIY2UKbBezgzZGv6uv67val1nTgtE=;
        b=Xgo1dOhCicpyQbHnnuCeK+PpWfqDwLbGv4QF8QDo0FxzuSX+E+pBan45zhrpJsIGhr
         dD9ia2lCI/bvc0YSEoSLTBeD8X7xQF+bHGvDKMM0DgFwn3VGck+Fc9std7H/vLZpedq0
         NTV2rTcqOBWceKcrgqGmXkKKmUU2cqqgJBP4yFPnNc55ttE1Nhi8gi5l1hKTGSm2vbO0
         +pje7e7u+gzXkaM15V5Y6l6ShUBewuQWDLPIJUEh5Z4C5UTkvIO3UB5lwIheT39RenaE
         lozirXHYqCuybyNy4cxwmT5xa67W3sjWxulWnrqTZQ0aQx50SkvfVd47wd8G7rBjmg0C
         MBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733902135; x=1734506935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01PaaWgxANIyZIvIY2UKbBezgzZGv6uv67val1nTgtE=;
        b=HXon+I1ysJNyM3RPZDSr6CLg2yepdM5b60A06pB7Q9c0RZH/pCs1ipq8fEFWb2HTCP
         J4LHE4veMhYBmREtAWkv0kivO0+2gfez+3Ir5ngSe4XYi7X+/miBqUTHespHp/9irIGe
         EDZQT1KIJP5agBz2zxFMeq6eNzuMwQcopK95JTFVqTqKG7J6o46jVTwQTnD6V3peubJL
         BASDXW5vPqNBZVTrpnN8eJgpF9EjlU00MycXr9BFipfXiQWjd+FYWBfGL7Yuv2qy2U7o
         MQ9yKt4FGod57gLOjC7pSo79cgA08I4kQWQ2urYtqdUp03JbMZ7kAcL+fPPuya63DdKI
         bZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuqbeLgapyOx9sq2XuPq9i9lrBJYDpxXFNBZ114N4acOORxDQbSQqJi2QalCM22ilXSokq+pMfhIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1JbFSUQkxJFJe80lbenXqoUEzVg9vO5qoSkNOTawRi0Vtq4QL
	6S70AHbKwOLNKzXXylYsp/wyI+fpTIQu/FZAspVtn9hIg1JcMnjp/2tYQb/RCg==
X-Gm-Gg: ASbGnctFNHm9nlero0DVKnZasqGwuz+I/OeQiqnCmGjU4nqKngn1YqSJYTFoyoK/lIk
	sPLwYpnsyWyfk2BF1O+94feCnEWaN6N44hFJ4OpaFnk0mra2iePWkr+4AR8aQkEu8usWPOXtcYV
	hh8ZohVqY6ldEL+5a8jALkJ2Z9PExq3GhRpAfx2NX/n8dlc2GxTzYNqqiu1je9dsBiZkFJu98kC
	2iYG/9VOEvUrjFprkJaId5VwBXIPRtap5K+cCSS0piwNsoX11wn9urP7dyBqau7xyGjtCmMyIYz
	ClFKOW9GkWg3Ro7COn0FrZzVIYgWO+Fq+wDRCN0=
X-Google-Smtp-Source: AGHT+IHFOuHPWmuprje6fIwUTemXq+3Jp5ArCtETqJawgQh6kGYzFfSlitgtcwAnb6J6+nYvZ3f8oA==
X-Received: by 2002:a5d:5989:0:b0:386:3e0f:944b with SMTP id ffacd0b85a97d-3864cec582bmr1021468f8f.37.1733902134885;
        Tue, 10 Dec 2024 23:28:54 -0800 (PST)
Message-ID: <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
Date: Wed, 11 Dec 2024 08:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_owner_domid() is introduced to obtain the "console owner" domain ID.
> 
> The call is used in NS8250 emulator to identify the case when physical xen
> console focus is owned by the domain w/ NS8250 emulator, in which case,
> messages from guest OS are formatted w/o '(XEN)' prefix.

Such messages ought to be processed through guest_printk(), which wants a
domain pointer, not a domid_t anyway. Plus isn't that going to be
current->domain anyway at the callsite, eliminating the need for such a
helper altogether?

Jan

