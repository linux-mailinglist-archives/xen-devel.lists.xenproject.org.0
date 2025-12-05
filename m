Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00870CA67CF
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 08:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178495.1502277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQPN-0003X2-5p; Fri, 05 Dec 2025 07:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178495.1502277; Fri, 05 Dec 2025 07:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQPN-0003Uu-35; Fri, 05 Dec 2025 07:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1178495;
 Fri, 05 Dec 2025 07:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRQPL-0003Uo-Pz
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 07:39:15 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f57bf3b-d1ad-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 08:39:14 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477770019e4so17583275e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 23:39:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4793092ba4fsm71518595e9.4.2025.12.04.23.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 23:39:13 -0800 (PST)
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
X-Inumbo-ID: 7f57bf3b-d1ad-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764920354; x=1765525154; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sWlmOGqUhu/GMWR46r3v6KrEuCIoV85Kwm4HmboGMbY=;
        b=UY0tkGf3dMWG4vV6Qzpy0Km71d0Fxn3blqClP5NTD9X4/ctDRxMZZ7QF/G+T15y9OF
         P9T9GWP404AQD1IRg75K0FED38e34PLA7JJGAOpOVGpoMqxvvGCQlD3RneYKFLRpbtnV
         uNzS+3Fq00Hzymin633tKRk1NzPmEQO7WxEis/ewKSX9cpl3JhN272H7bxhLsoR/tYI4
         6c6/R7VLkS9CiOricKkP0ME2aN9eNqvcKkW1Dnvof34dauXuT1JobZkLLYnXqvwYynHt
         If4Rybr2Lr3ZISAFOm5xnObHyuOnpsQkNUpDXEHnu/aNAp2ScrEo9FBB5Q55fwVId/lr
         QFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764920354; x=1765525154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWlmOGqUhu/GMWR46r3v6KrEuCIoV85Kwm4HmboGMbY=;
        b=lclb7UwRftxRAOVBTMjr/tM0Gi2otoATJ6sfBnR4OGy6FErlYgn3jrloUTEq4oZbcc
         38NbOQa6VfFeVIRXq4tvNAyVesCGrFVFva/aNU4KxKt7i35AAazDzAxXmFvl6yAW60Sn
         v3PpwllegztywrmGgIJernkOFB6ZyhpNHUGaELP6l53RcwfW1Pfr+JpUILkMBEJ5xBbS
         YwO35Bd+VytcGCaERmoBl4y2b0pWiiMOwEwm1D44ExMj3Lj7xx2geLVfbTkdGJ0sVUpR
         exV4S0gb/ikjaVWRpPE70T6clMcjES4gV+ed1bdAP82bOSBXZFfbsrXqD+PdFk58pUHD
         F0KA==
X-Forwarded-Encrypted: i=1; AJvYcCUmOvMUJu0avU2WlpQi3wc4ragNLoUoE9NtyNcWiDTeeG/+5UobgbuZmkvVEcVer0NZ4gCnvsHjYfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO6HxMa6iLrGwsJgKZS5XaMvu4jvn0m9UeQ0IBpsJFw0T99L+r
	0goXelXuPUjr2CG3nmjD56qVTeRXsS4TtoAqR5lgWAvplMz5V2JMFUURQmuI+pBZZw==
X-Gm-Gg: ASbGnctpJ8Aq4cJ/9KK+XYaZvOE7MgSswjdKZ4bGO9X7LSfrXxE/fXE3m4WH1DY+LYn
	zxG3iEf5Egq6n2p8me7MWbhLVkh60mifwh3RI8SWcqcGuHVzQomXNJYdZA45FkcAZbYFHufJ+Yk
	4NtSRiZdlSwSH3FhfhO7fRZcD9pyzTYfOi1MtYNWxH2DQqeZfd1zfZc2ddjFVdgGHSxBDc+dcl5
	7Y2zQi1WQ1P9NBCluAMWlimxdPbWJvt0PI6HMHNmF0QnRA/I2QtJdQVzSbd5oOcdrp0YGTd6ckn
	6Y7OuAOynXQj1hIBnMpS8VXpLX6ZcLd/J1f4xydMrHZxrAGtI08Lslh/0h8K7PlFKjM40oKXua2
	OV9b+iA7Lh+Qb6uKzUjrUdZj31W3UlbKTm/IxwPRrhxIuBK3Xl1Hq8hJ8go4+uBFnHOJIB/nCam
	2WXcYtFmEUJbOgs1CBAGovVONAKqLZFRxb/KgSHTd9/B6XejWJM4Vq+TIpGWH4+2aCCcywejGUq
	Lo=
X-Google-Smtp-Source: AGHT+IEJCWFDYO2jP3IdQ2g4AzpVfERkV33Rd37kyAbl/2Xq/5g2rH0IovLv0yNdYDSFJxtXvmJQZQ==
X-Received: by 2002:a05:600c:450d:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4792f28b9a0mr67155945e9.16.1764920353844;
        Thu, 04 Dec 2025 23:39:13 -0800 (PST)
Message-ID: <6e189be1-a7c6-44bc-91a8-84dec7ed47e4@suse.com>
Date: Fri, 5 Dec 2025 08:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] console/consoleio: account for xen serial input
 focus during write
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251204233211.980862-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251204233211.980862-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 00:32, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> When 2 or more domains are created and:
> - one is hwdom with "hvc0" (console_io) console
> - other DomUs with vpl011 or "hvc0" (console_io) console
> console output from hwdom may mix with output from other domains.
> 
> Example:
> [    2.288816] Key type id_legacy registered
> [    2.291894] n(XEN) DOM1: [    1.016950] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> fs4filelayout_init: NFSv4 File Layout Driver Registering...
> (XEN) DOM1: [    1.018846] audit: initializing netlink subsys (disabled)
> 
> This happens because for hwdom the console output is produced by domain and
> handled by Xen as stream of chars, which can be interrupted when hwdom is
> scheduled out and so, cause console output mix.
> The Xen consoleio code trying to mimic serial HW behavior for hwdom
> unconditionally by sending available data to serial HW on arrival.
> Xen consoleio code does not account for Xen console input focus, comparing
> to emulated serial hw, like vpl011, which does the same for domain with
> active Xen console input focus only.
> 
> Switching console input focus to Xen improves situation, but not enough.
> 
> This patch changes consoleio code to account for domain with active Xen
> console input focus - console output will be sent directly to serial HW
> only if domain has active Xen console input focus. For other domains -
> console output will be buffered and sync on per-line basis.
> 
> Example output:
> (d2) [    4.263417] Key type id_legacy registered
> (XEN) DOM1: [    4.658080] Advanced Linux Sound Architecture Driver Initialized.
> (d2) [    4.277824] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> This causes random multi-domain tests failures due to inter-domain console
> mixing which breaks console parsing checks.

This remark reads as if "here's a patch, but it breaks things". Instead of
merely "This", did you maybe mean "The original behavior" or some such?

Jan

