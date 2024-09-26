Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ECA9871DB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805330.1216416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlya-0006qh-Qo; Thu, 26 Sep 2024 10:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805330.1216416; Thu, 26 Sep 2024 10:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlya-0006pA-Ny; Thu, 26 Sep 2024 10:44:00 +0000
Received: by outflank-mailman (input) for mailman id 805330;
 Thu, 26 Sep 2024 10:43:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stlyZ-0006lm-Hl
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:43:59 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3be030a2-7bf4-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:43:58 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso144588166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:43:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae73sm331487366b.105.2024.09.26.03.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 03:43:57 -0700 (PDT)
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
X-Inumbo-ID: 3be030a2-7bf4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727347437; x=1727952237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9iEnOmqf8Jd3xWwxBuu+ehmXZ6k6Hu83Bj9ihD6HJBs=;
        b=Fgslmmuz4m0MxavFQL1JDvMJwzzr7KLiD/NtTwZHAJw5RQBWQKQNJzGVRuUAILVf+H
         fpWTUiRQjwUZOH1MgzNQNGrCmmSYnySEqYJM/CmaSGZNvFYSV7zXPzGt0ZTD9zfO2678
         s8p0hzmWeZCn8J+H6lliEugGv1ZbMSAV1Tm7hgJ7oSlu9n4pSQMfQlQhvg+ZlUmAbHf4
         FiYLA3q/Hp+B1osgbWo2OwIRPqgIpQJ1GxcgGlA4mWjBVQUvQZRQYVikSfWAEXVNBsu4
         gK92L4arfc2FByffn5VEKDlHXypIjLpIuVhElJo5oFyALvfHN8qQY7HdGaqXpy+AGP0l
         1rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347437; x=1727952237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iEnOmqf8Jd3xWwxBuu+ehmXZ6k6Hu83Bj9ihD6HJBs=;
        b=rOaR4g+1wwDxt3sMeYar8vqNO3veGR9mC4/e7SNL1gyuZYrweG5MC1nQCXDuubifTl
         V18aIubDwWcFUxw4jR8jJLrYmo1CNZo8hhxv7GNmSoMJNwEw8k4SvToFma0PoQnLxCkE
         +7TrRwYm1RWKlRDNpBTHRW0WxB0Zu4AhhMNPOED5wpy3OmADfwWVC80QQ1fTMwKjD4uA
         Yg9YzeOow1m5PmA0OSCsc5q2xk84ZSrqiHwF/RnW8/C7HpfpT+nFiH+uO9yI4N+65bF/
         5DnJe3+SphQiYGws7IbDOYlJDKPCAmZWgdoiLWIDGK7ws7ifh2PxDDueaLcbwhSWiBoK
         +wiA==
X-Forwarded-Encrypted: i=1; AJvYcCUsOa2QDjsCparYgYpqN43eQImKfW1RvAhILu34Cy+nPYHXs8nOA8OLMO7P99WCPYofoGscPBNzE0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFDJ314aq46zoZCmE1xQjPPRSo3yPj05XDUlGRkj1Hta5RAhqH
	SPEmHQ7o78QYBHL0XiFfzYPrKnQp/YpDIm7q7svSvbpCO2tDk4ApwEUa+IaceA==
X-Google-Smtp-Source: AGHT+IGgVpufPAnaJYn3HILrJouGkvUke7KON38ZVGq9XeTdxCTm7UUbzYeq3X8BFesfnT3J097bbA==
X-Received: by 2002:a17:907:9488:b0:a75:7a8:d70c with SMTP id a640c23a62f3a-a93b15a7b94mr313174866b.4.1727347437366;
        Thu, 26 Sep 2024 03:43:57 -0700 (PDT)
Message-ID: <d25c534d-ebd4-4fb5-8a07-9b1c8205c03d@suse.com>
Date: Thu, 26 Sep 2024 12:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] x86/boot: Reduce assembly code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240926092109.475271-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 11:21, Frediano Ziglio wrote:
> This series came from part of the work of removing duplications between
> boot code and rewriting part of code from assembly to C.
> First patch rework BIOS/PVH paths to reuse some code.
> Second patch rewrites EFI code in pure C.
> 
> Changes since v1, more details in specific commits:
> - style updates;
> - comments and descriptions improvements;
> - other improvements.
> 
> Changes since v2:
> - rebased on master, resolved conflicts;
> - add comment on trampoline section.
> 
> Changes since v3:
> - changed new function name;
> - declare efi_multiboot2 in a separate header;
> - distinguish entry point from using magic number;
> - other minor changes (see commens in commits).
> 
> Changes since v4:
> - rebase on staging;
> - set %fs and %gs as other segment registers;
> - style and other changes.
> 
> Changes since v5:
> - fixed a typo.

That's probably fine, yet may I ask that you slow down some with submissions
of new versions (not just here)? Multiple versions a day are odd, even more
so when the discussion on the earlier version hasn't fully settled yet. If
after several days (maybe a week) you find that the discussion doesn't move
forward anymore, then of course it's fine to go ahead with a new version
despite there perhaps having been some loose ends.

Jan

