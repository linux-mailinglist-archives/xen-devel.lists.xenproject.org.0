Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604BA6894D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 11:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920202.1324439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqWv-00013K-KV; Wed, 19 Mar 2025 10:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920202.1324439; Wed, 19 Mar 2025 10:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqWv-00011T-GZ; Wed, 19 Mar 2025 10:20:09 +0000
Received: by outflank-mailman (input) for mailman id 920202;
 Wed, 19 Mar 2025 10:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuqWt-0000yb-EO
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 10:20:07 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b05b78-04ab-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 11:20:05 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso42670515e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 03:20:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43ed6sm14306825e9.13.2025.03.19.03.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 03:20:04 -0700 (PDT)
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
X-Inumbo-ID: b9b05b78-04ab-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742379604; x=1742984404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jNB+YHOJD5RvgbOIaQ0GO3asgERYQzvnxUzosDsaqMY=;
        b=aR8470tqM8+99lMrGOLYenpjWt7nom+pLo0P6XDX+TwIaqbTV6blSq2hkzaSemNA9g
         bVI0k6J1J7RvYYSerwKIDSjCPCJSrWtA8HWwRx+H2ix2VvGB4D3bTBNWjylw2j2UFiA+
         JEuhovPYP29n2ssqRWUmXxrXEX2Hri0U8VqGbdjHT8wAtHv8MdJVjcoyo03UCQykY2P/
         o7pmslwDcjObOEmV5iKffXnKPA6UO64OHMQqQq2WpO0LjoW9lOA+SBwes+cWdC2n5j71
         wDiWCmgJbSxgg4XCR9THbucFeu0uHcQVa0FtP/dnJphgMtNLUpkXa6P8MQYaywGbzNIz
         Lt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379604; x=1742984404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNB+YHOJD5RvgbOIaQ0GO3asgERYQzvnxUzosDsaqMY=;
        b=O96IJ3BWz/djz3dcdYXp6UBtpi4+q9MOKfKxAVNjPF98ivrP9897brSnczdjcnF2wK
         gHab+S+c73BNgfkdM9XMRQxVL25uoWKQ8Md9mEW6RpFRzT+wVSjOKADookzVq1fr2jWu
         UTvSwvFRAROduzGDTKU3oqI7ZkfwrIWU+G5u6sPlxFL3tvga0SfKZRu8LusDhmppoJBn
         jdaBSduEogHef/C4znkmuLta5K90vVjhUc8Vi0qyxYhQEJAAWEOu4HSZFyfNmXP7HE7X
         phwr7Shp8NWYl95pF5h7I4PsKa+0s/R5cHb2q8Z33o+CG5TMFg5IIjkZMyL1UO69kkdI
         ihnw==
X-Forwarded-Encrypted: i=1; AJvYcCUVeHytRyqv4x9Q0IqRSzb3rFKfsrU3QZN8uMYGLDWwTCpxDg7fG+rJVBfkVJGbR2YvM5cTUsjeRK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPr/yyXiMV+xa9UfRbQhzeNcwmQwKcnYsHrY7iHBonYBk3ZLLv
	TSfkycQD9j/0m5Mvybt+YBBBrK2vC1rQ25JGoQ000O/sP52tQTYeQ81mmelOuQ==
X-Gm-Gg: ASbGncvPxXwr0oZmY3JklmSCUVn098maBP5U0HLBnpT+jTq/RCHK5LugR6VNdQ51esv
	LsNFTTntEvcrlZCZDk5jmr2S0FhneIM19AEdn80D/VH1HJzpeRd8hOMrq+t3i/U78/Tq2u+apBC
	x3Ji9fwMunhj5KlUBbWDbKVNHu3vmSY6k9nzNo1nq4AkUGklgKoOErvvf0yySuF/7WXUGpzdo18
	cMUcmxXtxNDLhOe81tNrEqyUa9ZbiqgztJ10fzaxEZTVQArSG8/2IZhvR9wK0JwsqyR3EyHz3/u
	Fh8oChraUXtPGb2NgtWUg7JTAMBgNGM0myaPuVF0CExHbXoXL9E1vgR70Fxpuolqit9/Ju+Ao7e
	LQxxYsBmaQS5QjcOkh2Gy1ylWmpRinA==
X-Google-Smtp-Source: AGHT+IHHHJqYLYktvyKzg4P2tcSVeTY9etDsMyP6xshvkOvn8Zu6tTzrJAiYxz039FFzjCrN2toraQ==
X-Received: by 2002:a05:600c:8486:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43d438a2157mr14181905e9.28.1742379604460;
        Wed, 19 Mar 2025 03:20:04 -0700 (PDT)
Message-ID: <b8ff0d6c-af56-41b2-925d-962902038df0@suse.com>
Date: Wed, 19 Mar 2025 11:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen: remove -N from the linker command line
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-4-roger.pau@citrix.com>
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
In-Reply-To: <20250318173547.59475-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 18:35, Roger Pau Monne wrote:
> It's unclear why -N is being used in the first place.  It was added by
> commit 40828c657dd0c back in 2004 without any justification.

Not really, no. That only moved it from LDFLAGS to an explicit use. Several
hops earlier it looks to be 4676bbf96dc8 (from 2002) where it was introduced,
when the linker script also first appeared.

> When building a PE image it's actually detrimental to forcefully set the
> .text section as writable.  The GNU LD man page contains the following
> warning regarding the -N option:
> 
>> Note: Although a writable text section is allowed for PE-COFF targets, it
>> does not conform to the format specification published by Microsoft.

There's also "Also, do not page-align the data segment, and disable linking
against shared libraries." None of this should be relevant with a script
either, so just to have mentioned it.

> Remove the usage of -N uniformly on all architectures, assuming that the
> addition was simply done as a copy and paste of the original x86 linking
> rune.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

With the commit ref corrected:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

