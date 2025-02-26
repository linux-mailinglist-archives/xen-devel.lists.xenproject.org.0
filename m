Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BFFA4609A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896592.1305340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHLf-0003oO-BS; Wed, 26 Feb 2025 13:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896592.1305340; Wed, 26 Feb 2025 13:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHLf-0003lg-7b; Wed, 26 Feb 2025 13:21:15 +0000
Received: by outflank-mailman (input) for mailman id 896592;
 Wed, 26 Feb 2025 13:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnHLd-0003la-Af
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:21:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c5a73f7-f444-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 14:21:12 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f5fc33602so581214f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:21:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5711fcsm22216685e9.28.2025.02.26.05.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:21:11 -0800 (PST)
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
X-Inumbo-ID: 8c5a73f7-f444-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740576072; x=1741180872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x8BqPxENUZmrZvHyBEhxzV+YSoO9Zqld3EFinDkKl8I=;
        b=GYeRoT+GRgip7/ROqheXE6h7++GthKXds6TYosQtH0xe3HOkeW4uF9uECUaz0yKUEg
         mntszVuaApo9ff8B3fBkIh/WBj42N3VA5AA6BJECFurrpfsrCBzdDxEoYM+04nY41pe7
         +69C6cxwU2rr/rfMvSDoNXfC+7PSSNyRazQe/rvLNyAGRYFiO7EAWEqJgIo05BLRFpex
         WdDGiVidSvH6Gg0fs3araDC/nt+ajMipTfm2CU/QeOERlhuc8WcW3uDaADvXzO4SjYAS
         S1/S3WaL3gDHl0WBfiak8AWEA6j6GHZgH9uLwd7/RHE9XFfQvw8hGLIN7yMahhKflwnd
         HXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740576072; x=1741180872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8BqPxENUZmrZvHyBEhxzV+YSoO9Zqld3EFinDkKl8I=;
        b=oSieifXoRXiL8lpecxQU78hRlObnei9+UdV/6nJqX4Iiph06q3g2b5U4pAgW8n47rp
         nDe31YYA/zEBQvRZxFEGXklchTLZUrcNJEvWNo+doYInXeuXTqUMeFtuDhNNmwA/3qTv
         XWHTIpWDE2MgzR1JkP9LJ0DOMXNeMgKxVIKyBXGLkr5rcEhv8NqBfY0HG/fUFCSdIXsI
         AH0rBkcyj77POEFnYASCtH5HHYPWo7lieGlv1qeHoClB1AashExEwDi3X8iHZ5MMwZEB
         OPr1nWSmcYF8LgnldruYkzYewUJ2JlKcm2CaRfYxqHOPYXaUpx53hqA3XJDEdI62u54L
         Mqjg==
X-Forwarded-Encrypted: i=1; AJvYcCWIBBrWvKvJ3QAt9DZ0QTKbMl24D96tkstdEloys3YEJZUhzuiU6yjoqmT+p9vntskKJTNUEAN/iMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLEQWdxeyRVYL2ekxt8UNJSD9NZi5phG4/tZGDpEYvtbjawTLo
	cfB1QW7XmSHlkdAyl3WVookEZbuh9eZMn9Lgr0oRGkdWkmWTy6Z9sb+P01l3Bw==
X-Gm-Gg: ASbGncsEyS/qV+2lHwoiz086L05aEOgZAAgflqdPJe43yCXZKO5+7NQIbGG7SGpCbis
	By1UhcF3evb230RnyLcL26v3tIgVvvv5xY/ocx5qLmH8fYicjUon/Fv315Zqp+n0cr61XeihNXL
	RfUhbZxGc/PkXj10RGAi+hh1OS5MILDlAXl6lp7/tsn3NMEwtZRjQ1G/0ZLI/x4KtAlJWppLIDj
	JbMUsHc0Fl5+VI9fJfTzqXin/F7/1vpH1Q95ORRckzeLIMSUuZnKbu+bCTM6P0bX/ybhrO3jE6+
	ucXzvUiYlv2lUI2FLDc0P3W5hDyYwijCY02GULsWzlpY5uG0p5DZR43XRzbHjJXqjf91ewYqBhj
	UyKigL3Xjbac=
X-Google-Smtp-Source: AGHT+IE9bFzQsfJui5GAwRVVondRV4frFoauAp7vxsIU3nvJtG2Z9kpA6KH/J1APT+FPA/9yPOS3FA==
X-Received: by 2002:a5d:6486:0:b0:38d:dffc:c14f with SMTP id ffacd0b85a97d-38f6149915fmr19764221f8f.1.1740576071318;
        Wed, 26 Feb 2025 05:21:11 -0800 (PST)
Message-ID: <afd7bc6a-e2d4-4734-9973-e7f6507fc2f3@suse.com>
Date: Wed, 26 Feb 2025 14:21:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] asm-generic: Introduce mm-types.h header
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <1d0826e88e95357979d74fb3702b35fdb0b75151.1739488487.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <1d0826e88e95357979d74fb3702b35fdb0b75151.1739488487.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 21:10, Shawn Anastasio wrote:
> Introduce a new header, mm-types.h, which will be used to define
> architecture-specific types pertinent to memory management. This will be
> used by a future commit to enable >32 bit PTE flags.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Perhaps implicit from the Suggested-by:, but nevertheless:
Acked-by: Jan Beulich <jbeulich@suse.com>

Just one nit: Tags generally want to be in chronological order.

Jan

