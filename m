Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C8818C4D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657040.1025664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFczs-0006zO-QI; Tue, 19 Dec 2023 16:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657040.1025664; Tue, 19 Dec 2023 16:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFczs-0006x9-NF; Tue, 19 Dec 2023 16:31:08 +0000
Received: by outflank-mailman (input) for mailman id 657040;
 Tue, 19 Dec 2023 16:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFczr-0006x3-74
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:31:07 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01fdd684-9e8c-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 17:31:06 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33664b6d6d5so2250530f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:31:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d440e000000b00336768f52fesm802039wrq.63.2023.12.19.08.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:31:05 -0800 (PST)
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
X-Inumbo-ID: 01fdd684-9e8c-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703003466; x=1703608266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+zjVeCUsFo3PKPzAzmrXas7XesFFLYcmb23UddppXc=;
        b=BCHtnZXjYw/2W71ygeVitz0dLPbnDdEVqzAoxeyZ5mHyxdm0gPKmeLDolcMgdyYJw9
         APfzhaEkFYN784QvUVdjAS+8jpyUTJkIp3TwyyFGvrh0Us1oMyQtQXJkg0Z6rr7bfKwV
         7M2tBoX0rWXiO++YRZ3XGEW4BlVQCeD9yCmLe1ye8CuNZPwHUG1Dm9NVNXGRHZTnFYcy
         VPEMo1f+XEFE8TJBAN1KrG7Xjz9/FZLxWtbqyon6BY0mzylQy+FIHr2WIkAvavkZ260m
         mZNmTh30JRTykhUqa2SWRqfSYZNxBSgIOWqtUObiCcPTjqm10lSX1HvO5I7LvKT7o20H
         E3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003466; x=1703608266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+zjVeCUsFo3PKPzAzmrXas7XesFFLYcmb23UddppXc=;
        b=tsm0KTYWQIEcGEKxAuLdP+wOf9D+cBN/BXMAS7A241u7cqS6Zrw1mAOMje6rwfs5s5
         jDxdNqJOZwN8+CFApc435vEKA69l2rfa5JGFDiAiMADFFVcP362CsBwvarFN01fsIkkT
         5+GOkBZ64Ap9SjM8OWqxMfa6YNMFWzU4cW66HzB3YZrfo85T/Mogg1/adVwME3DZoi52
         xTqVWEDb9LUC+wSmVg6yf+/+sJb0B0MsFsu13lziVWaPvLbXlvP5Z6TTZlpzcUfYtiBf
         y8fzhdwYXpURvjwKV+/kpBpiqjkXCcQ8c8IHMCSDKRmxtDUGrQ1VKar/akzRQh/gPpnY
         s7/g==
X-Gm-Message-State: AOJu0YziW0MuMAEcKQn8ocqDQjrXSUrCflOoO9GilGH78u7S0g9UbXAZ
	DixXcFHG2cU92k8bmiSTE58d
X-Google-Smtp-Source: AGHT+IH2fjwQa75yNRn2Ap9aFQweKHyj/8mCaujMt7o2vvVkeAEi+EL3JjJBZEQCbxFFJbH9AHB6IA==
X-Received: by 2002:a5d:5287:0:b0:332:fefa:61e9 with SMTP id c7-20020a5d5287000000b00332fefa61e9mr9708343wrv.48.1703003465700;
        Tue, 19 Dec 2023 08:31:05 -0800 (PST)
Message-ID: <4cad003f-dda0-4e22-a770-5a5ff56f4d35@suse.com>
Date: Tue, 19 Dec 2023 17:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-2-roger.pau@citrix.com>
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
In-Reply-To: <20231215111842.8009-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 12:18, Roger Pau Monne wrote:
> The minimal function size requirements for livepatch are either 5 bytes (for
> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
> that distance between functions entry points is always at least of the minimal
> required size for livepatch instruction replacement to be successful.
> 
> Add an additional align directive to the linker script, in order to ensure that
> the next section placed after the .text.* (per-function sections) is also
> aligned to the required boundary, so that the distance of the last function
> entry point with the next symbol is also of minimal size.
> 
> Note that it's possible for the compiler to end up using a higher function
> alignment regardless of the passed value, so this change just make sure that
> the minimum required for livepatch to work is present.  Different compilers
> handle the option differently, as clang will ignore -falign-functions value
> if it's smaller than the one that would be set by the optimization level, while
> gcc seems to always honor the function alignment passed in -falign-functions.
> In order to cope with this behavior and avoid that setting -falign-functions
> results in an alignment inferior to what the optimization level would have
> selected force x86 release builds to use a function alignment of 16 bytes.
> 
> The compiler option -falign-functions is not available on at least clang 3.8,
> so introduce a Kconfig check for it and make the livepatch option depend on the
> compiler supporting the option.
> 
> The naming of the option(s) CONFIG_FUNCTION_ALIGNMENT is explicitly not
> mentioning CC in preparation for the option also being used by assembly code.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



