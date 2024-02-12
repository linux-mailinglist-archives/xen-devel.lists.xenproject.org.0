Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C738516CB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 15:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679588.1057077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZX5j-0006gP-OK; Mon, 12 Feb 2024 14:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679588.1057077; Mon, 12 Feb 2024 14:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZX5j-0006e8-LH; Mon, 12 Feb 2024 14:15:27 +0000
Received: by outflank-mailman (input) for mailman id 679588;
 Mon, 12 Feb 2024 14:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZX5i-0006e2-A8
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 14:15:26 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a4af423-c9b1-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 15:15:25 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-410cb9315f6so7878815e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 06:15:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i5-20020a05600c290500b0040ef95e1c78sm8730015wmd.3.2024.02.12.06.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 06:15:24 -0800 (PST)
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
X-Inumbo-ID: 2a4af423-c9b1-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707747325; x=1708352125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+KMW4T5CXrIUyiSmI3rIXQ/wdpb/3grpC8b6xH+lVQ=;
        b=IcFJVmj0yGCLp0jhkCK/VngEximrav1vfpCTv+8eL2miRC2qEVoq4Vd26wTGmlXJly
         by+mQlHrXPY5zXaSlw/TEbQrSaFaYl77IIvbWwKrJGvE+9qbqabgwxVWv9jUMevcR1x4
         doec1t0i+ZEC5K+zGlNX3f/AALrzyyw/7ST5YzfoQXz2vLJfqFAPeRqYQm/wzzeGs9d7
         dMV/q+U2rJC550h44xebMmJt9aX49/4fCgmbHlh/k3+OoLz3EKZm+UCpcGapSdSFt1Az
         MAI+ARDmLElUBt06SNqDa4h7KVpcyrk15+QQSmhu/fywx2baIJ2wPy+Cp22q8PUwrDjg
         dVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707747325; x=1708352125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+KMW4T5CXrIUyiSmI3rIXQ/wdpb/3grpC8b6xH+lVQ=;
        b=iuhbkbrFJyqn2O0OwCuRzd4UdDa3/2bXvw9y75gA5ysUc/hdpiYRwQL6jvo2Y2UPcg
         EhCKVUNtrI9wFZZ6ol/J8uebDWkR0RyB0CdM07usWq0bL8BOSJPSxgOPFKkOCoYacRSL
         ZDtKFoB+OollPuHKxecVdbuitphOxa3hwgltqOO79m2uOq1dIkOT5bqPsfELYxqv0zCh
         /8jTbLccIw1SQwhHFt5qQIApb9FU7OsyEcXCSc7OOxllN2R7GHoRCAStlWMxG7HdzYeb
         DT0yADhsmKYn1iedBLJ4Hg7i9JprfntfutODmmpg6Xh2Gi6nlM16UKkyr+UOYZuZfzzR
         NhAw==
X-Forwarded-Encrypted: i=1; AJvYcCWPJVFK1FEMhmWrxyQisfYQQ6HXDbfVhXvRD/8pwtaRy3xGpnETrJnhGOhFummW8lSHEOJP1i3PVfIOfomSDT6nB7G38VbaODwZaeRnDQQ=
X-Gm-Message-State: AOJu0YyA6usNLzVxjHxJzOguvtfZXVgBWAdR8KdsepcWw8zQl9CDexCx
	qDRgqs94KFYiqGQhmajippODKjh6G4tCR8fv4s5jC+EAhy81pqNsYy5sVEixlQ==
X-Google-Smtp-Source: AGHT+IGFyUVQOyoozkrsjSw7+TkFJF7kEZL4SsDrnBm2NJ4BTiN5CrPoXlBjhDInwNXhvoNz6A5P8g==
X-Received: by 2002:a05:600c:4e52:b0:410:a0ef:75f9 with SMTP id e18-20020a05600c4e5200b00410a0ef75f9mr4668923wmq.5.1707747324755;
        Mon, 12 Feb 2024 06:15:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXX1bsjBSwgnrPb1mo+z8QhHhhYoB5PLGHNRVQTzfq6VlOcwCKvBl/AwKeZXJ2gwVgmuURp9EO91xDjBVO5GXhGyVtogsmVvRS3/a3Dbm+2ZUjrSBiEnn+v8T9QIrpVCjiE8gEv7qNsFtaE00p1p1GniZTZU0/NZe9w+hBHX/blaUypc/4KpryfqRicVfBSE3n3CfGgNo9v/ypWjJN4drlIs3QiBmP18YNSHcTG5yszzGR+NDyag6f3YhMIatZOUe1pjrP000cDqS45y6JWF4QaSg9i+zSWBlxf8A095rLNq07LMdaSluPkPLgUdxVs/BOiBvKjIpK7FoGlyUjTqzF8n+k4wUPTBwW0tg==
Message-ID: <f8534623-39bf-4c4a-9236-ed5bd3d655c2@suse.com>
Date: Mon, 12 Feb 2024 15:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/lib: introduce generic find next bit operations
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.02.2024 18:58, Oleksii Kurochko wrote:
> find-next-bit.c is common for Arm64, PPC and RISCV64,
> so it is moved to xen/lib.
> 
> PPC has been transitioned to generic functions from find-next-bit.c
> since it now shares the same implementation as the PPC-specific code.
> 
> The MISRA exclude list has been updated to verify
> lib/find-next-bit.c instead of Arm's find_next_bit.c,
> as Arm's find_next_bit.c has been relocated to xen/lib/.
> 
> Despite CONFIG_GENERIC_FIND_FIRST_BIT not currently being used in
> Xen and being removed from the Linux kernel [1], it could theoretically
> prove useful for Xen. This is because the Linux kernel transitioned
> Arm to the generic version of find_first_bit() and
> find_first_zero_bit() due to improvements [1] in both performance
> and .text size.
> It would be prudent to investigate whether [1] is applicable to Xen
> as well and, if so, implement the necessary changes in a separate patch.
> 
> [1] https://lore.kernel.org/linux-arch/20211005054059.475634-5-yury.norov@gmail.com/
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

A revision log would have been nice, though.

Jan

