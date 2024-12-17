Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EDF9F4B74
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859099.1271246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXDv-0005mU-0e; Tue, 17 Dec 2024 13:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859099.1271246; Tue, 17 Dec 2024 13:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXDu-0005l0-U0; Tue, 17 Dec 2024 13:02:50 +0000
Received: by outflank-mailman (input) for mailman id 859099;
 Tue, 17 Dec 2024 13:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNXDu-0005ks-41
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:02:50 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36fbe1ca-bc77-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 14:02:48 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so2652166f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 05:02:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c804d573sm10991914f8f.64.2024.12.17.05.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 05:02:47 -0800 (PST)
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
X-Inumbo-ID: 36fbe1ca-bc77-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734440568; x=1735045368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7FBOKs1vwKmgkMl368FToP1FVr+qWeiLCajGPVa87uY=;
        b=e9fZ20SiGZBfYVQU5/6AbS/652GEHvuSHnGqPJW8fzNxqBkHbGZCZMxumbcOdNMj6k
         BVeA4FOEqaYr+39Ay+TzvYqBnNcFb4YlcEf2t8oAm8F0SEmpBlVTKS10sQwF8/Qfrjju
         JjF4ziogW4x7QthECyJXbdil2Y8W7bihE6heKTWHm+kGJlHiY41xr4fqfG76tM+61oKD
         Y8muyNlLsxkYfntdv259dnInVCakTAvP2BCRvKTvNug4tcyYTRdpRO5ghF2in6TW/xil
         yJlIR7pmbZuFP+Z+nFYizqyi3Uu3Oi0fV8L/FBK2dMgcnRi6BIkVsEyupdH+MIsndmbo
         XlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440568; x=1735045368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FBOKs1vwKmgkMl368FToP1FVr+qWeiLCajGPVa87uY=;
        b=Z1bN4n7wNhtQTFAG0LzmRTWINxe42IkPayJ5wsno69UQ3sO/zYjApS/c5Rzu2ktNGo
         9S/o4lzFYK4zeyaGBZtE+oRMSst199GwPE8ykD4ItWMZhbQkmc/9HPEjiNEBfpfPHnqC
         uIImPb4JUBzhpcwYG6ljmZRu0o008oLluEkkDkTR1NE/egJkbIGy0NfeCmLxLwDGmT6O
         De54UchQ7/h4NuQC6Lwj4TOoRqKXUjbPHAv7ETg0u7OgMZa1TRnhoEDY6RWCIwdIw5xG
         w3Bzjm+2br5blRUYj8R1XdRuoTRiA54+Hxb5S+bvnsDlPhw3V+r478DfhqOr7c/4ECtp
         4JIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjA4C74lRAZnio9GKywkzQO3FQWGxrRfplxy/8AUR2BhtAGtnvUFtw0vHngdPgZMvpGwaZxDxpD44=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjftrLCE6LA6TEQBKjcqrd08fejhxcNaTzEVXMTdrX3YN1PNNG
	xCqBV56InuWP6Bu6bBXk5lLw/nImjQJI7J6PuorhlEBb6SIw4FVeH7PFvwf2Qg==
X-Gm-Gg: ASbGncvxbMbCyaZXVcJ5aobqQs6UUbkBjwczZm0QBzslYh0MuzePIb/9tinY2e8Tqob
	0ICOkXvQ6v0LobCi9QAS812343klkcE0/sbiQ94g7AqV8tDI6grQ/85ikZGMqmQ0uMlJDocvoeV
	3tE6WQve4roCLONmVSbJA83agiciAuggmy24Rbw34g2rHzh9vAU8jnc83xRELyLtGbq/xjIdDLF
	2QNIfn6hGTEp+zIozf8cVuZv5Z5F00N1/WzO9ziWAMLlTPB3m2j4pItXwWOvt2YtIddWRQ56kdu
	pEAJVYnx9lAjc1+8FMTq8WeShZ195NSAF++CywQM3A==
X-Google-Smtp-Source: AGHT+IE7kKCjE+juJl70Fi2bSM4TW/DaJzGvutodi9e/4GxjmOLrdeftoOLuGr0Jx5sbZmuPyDYHnQ==
X-Received: by 2002:a05:6000:400b:b0:385:e30a:e0f7 with SMTP id ffacd0b85a97d-388da3940c6mr2973669f8f.22.1734440567346;
        Tue, 17 Dec 2024 05:02:47 -0800 (PST)
Message-ID: <9003a677-e78b-4cf8-b890-c6cf432d5837@suse.com>
Date: Tue, 17 Dec 2024 14:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 12:47, Sergiy Kibrik wrote:
> Allow to build ARM configuration with support for initializing hardware domain.
> On ARM it is only possible to start hardware domain in multiboot mode, so
> dom0less support is required.

I don't follow this. Late hwdom is supposed to be started by a (minimal)
toolstack iirc.

Jan

