Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6853EA7677E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 16:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932595.1334700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFsb-0006Wc-A3; Mon, 31 Mar 2025 14:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932595.1334700; Mon, 31 Mar 2025 14:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFsb-0006UN-78; Mon, 31 Mar 2025 14:12:45 +0000
Received: by outflank-mailman (input) for mailman id 932595;
 Mon, 31 Mar 2025 14:12:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzFsZ-0006UH-I4
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 14:12:43 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30730718-0e3a-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 16:12:33 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-399749152b4so1844529f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 07:12:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662c11sm11554645f8f.31.2025.03.31.07.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 07:12:32 -0700 (PDT)
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
X-Inumbo-ID: 30730718-0e3a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743430353; x=1744035153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PJlWxIq/RM31lJN5kKH1wKooAU9wWHAB4zio/FmhiLo=;
        b=LJwZFPb39ys1JZ95+wUovJqkV3RgPJElSF4Bgjk9Fsu5JEhSEOc/vcHZhZg2rnI3xc
         4rSSJIvxiTqjkZOAZnqZlyShqTZ+R4npKRKy3tCN9lfJ4oq04RYYpixxpozHIF1aqV/V
         8shEH9ID36gr4Mf1zt4VMFLtAn3zeF2973yqLND14MsLufiBl4uz4RiUSA4XRYlf4yJt
         aV22+sQyVOdywX9z4doN8pLeR6bnauoLJ1JLFc79TOpZPQcSmsWwugDqGHtfSzSqtU8C
         k8gp5SuPAWnT5RhmwhR9gX34zgQUf7Yw7OjpirIYEx4d3D5vpebHdIITzuyVDqdd3JkQ
         nTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430353; x=1744035153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJlWxIq/RM31lJN5kKH1wKooAU9wWHAB4zio/FmhiLo=;
        b=qqClb6Ov7SCCs6xAAVwgs9R8x3wvOcIcLeMAiFKOINuzz9eBDelpUq7yMt+swmfvTv
         6wm9Ug6+ZfR++LohNNCZIDLAVD6lsu7ol+YIPofSWjpuoJtb5wLOW0tHt0bG/r52DFoO
         rhd3llTTKABNB64VbrU5rQ4bY5Jl1oJR9CP7RMIowsqGMR3vqoG4nmHetBVe/YCIKoRM
         uqCRPpdxlOquOAEzxY3kRvDJojp6h4OLozKaRt+NQ7o/ZN7lkZCJh5oVhvGF6HKjvFdf
         VFxxudAw442LgQsJdLJ1bDcMdzn/wK3IfrqFQ0voEr3Gfj83u72jIs5PFm20YpKUEZ0u
         XKVA==
X-Forwarded-Encrypted: i=1; AJvYcCUKp9Y75DqQ3rnMwTEjHWU56zJoLivd4f72d1OcYfRkXkyFi2BJMxnjzpOCwrmtS6VmOKrz9j/+myo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy3XYadwl/6OXh/GQmdKlMObYY5pipL4048LUJ88nSy489oUMj
	wV7UCbpWXx9on/Nx8fZWtEz4aontMHobatvXPvAk411ESW3z6JZ07s2D714q0A==
X-Gm-Gg: ASbGncs/5EfF4t451YWeSoXiFy8nLc0/tA7G8kpXrmVMkSnMZNX29nRxsm4Pc6LE4SO
	8bbQjS9gqQIYHr32qinBRIuO0r8fBJdzWiUcLhs3VqTfSmTEizQqUOZRjBuSxFEdpWe0dWA/Amh
	z43FqyrYV2Q0oeuSOj8Dd+PvN84ncv2EnX6vLX3NVkdZ8agqzaeR8xzzVEdjgYCn8kIAz739VXd
	FT3rPtg2ctng3VqptM4zDHHJngBSi6K4DzoJ39wmJpvCXE6uo3R1AT+TwSp20fmJQ8yUEZDohC0
	MnyBQyBzbQ8LVYMzRUQBP5Wr5dmBw9cAEO6soxZnCPOStAvXLtVzYXmXhLTbrzDO4wDR4qO5dsS
	ej0konwFBXHI4HVYfOjLSc8MAkRKZUOoodNkeUex/
X-Google-Smtp-Source: AGHT+IE88scW2e5tOXuZem0+UvCSuP/mPRwHx8anXvVRDR6fcO4f5BmDxd0cRuWpXR7b878LOqMGng==
X-Received: by 2002:a05:6000:290f:b0:391:4231:40a with SMTP id ffacd0b85a97d-39c120e30a5mr8558887f8f.33.1743430352844;
        Mon, 31 Mar 2025 07:12:32 -0700 (PDT)
Message-ID: <6523b444-3479-47c6-99d7-16b1b8f0a5c8@suse.com>
Date: Mon, 31 Mar 2025 16:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] x86: Drop asm/byteorder.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Lin Liu <lin.liu@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-17-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-17-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> With the common code moved fully onto xen/byteorder.h, clean up the dregs.
> 
> It turns out that msi.h has not needed byteorder.h since the use of
> __{BIG,LITTLE}_ENDIAN_BITFIELD was dropped in commit d58f3941ce3f ("x86/MSI:
> use standard C types in structures/unions").
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



