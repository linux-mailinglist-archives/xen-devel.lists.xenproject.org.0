Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C14B25CBF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080855.1441027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS7N-00048E-84; Thu, 14 Aug 2025 07:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080855.1441027; Thu, 14 Aug 2025 07:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS7N-00046k-5T; Thu, 14 Aug 2025 07:11:21 +0000
Received: by outflank-mailman (input) for mailman id 1080855;
 Thu, 14 Aug 2025 07:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umS7K-00045n-Tq
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:11:18 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd74f70e-78dd-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 09:11:14 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6188b7949f6so1215458a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:11:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076409sm2550469366b.12.2025.08.14.00.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:11:13 -0700 (PDT)
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
X-Inumbo-ID: dd74f70e-78dd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755155474; x=1755760274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wyYlXB18yaiNjwnT+bjGlECIE93KlMEzpy41rp5dXdU=;
        b=HyOfKPg1iS3fDA0vrvny4dhtHWqbXINUokGhf3b5Qm+vOJKZJ+D6kAzZfqrN4zbrVu
         530iJRuTw/yAUkcFBKWPpH6/X98p/OFcSRjvXCwVWCdBoZdYVwOkaCtaH8zkxEP7DEl0
         t2XgqIw1V9lHjN2WBOo0TNbnUswMQveSyj8Hj0kImPwXeaPuCvbE+wu5C0sUghmEwupw
         A2Mgpw8OHy6f0tnY3c+iQ+MtZ3oUFS1ZrZMEmehmNh4SZK7ymjxiioRpbOWtnybFsYEG
         IWFchfKh8CU9cLdDVEibUpgbdC4C3Gfsd5ub+N6OjDw8l9WA8U0tq4G05pdch1I4Y1Zq
         9odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155474; x=1755760274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyYlXB18yaiNjwnT+bjGlECIE93KlMEzpy41rp5dXdU=;
        b=BLtLPHLDhM1rej4ZyqUcgDkiwlaU3SCo6HdBjUzfB43Rb3BHabkmep/DKolMQOLckR
         M0b9TUlGBcRa67Mmedj5txM3CFaW4yA8+HyHVLNz2wW0OyN7ohtyM2zsnPX5mPx3SJrW
         J1E4XhV/s8Bf2mc/89RV4COBj7Wx7CSobgN9NUpPqh1xxIS7dIYceDXW/Z10ewWKSw7b
         U8DHpUYuNzEVru2rte3vepn/8ohUlU4SewJ8MAfwYzJXfNmf47KmZ5bZpMWt1n7GlGfC
         /q/mYnSKhAcS08T+tDNWeFoOvvk4mkNPCRR8wGbaL2fplEA+yzLv+aXvB4jlbir+TzPo
         zbAg==
X-Forwarded-Encrypted: i=1; AJvYcCXv4dXm63nit6i8wJePL7/l1hv6nFWlgdYwOXHlwGCUBWjGcWcHzLn0EZAdM4WbBPZbV+yKzlibsJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB2hQL/umj73pWjnne1YgsxfTFfOBua3yoV0bFLyZIwCGG662s
	IGUpfKZhHZmy1wWQ9DnLn5TR2+3axSQ28dVsL/A39D/g7Hqm61LQo6svUY0duZX8PQ==
X-Gm-Gg: ASbGncsY4NRnp5QYB10El/8wiwk3IIHVbsrdjE8PioBucaldIxmUVDYA1Az5vCz2vRG
	RJyTukZDTCmdjt1sO05B0sdSzVHrMDp8vjRZzct1dempY4q6IfrQueMjursEDwX+uG6I/m2zPDG
	F6YXtQWARBnXJPMeBui0AVEeCqiIshMBPtTQ7F24ELqkDQl4PosKWAblExpwn9XTZuLiz6joHCG
	VPQ0uPWNLVIfDYHxYBhu/sdqhJXXYo3ra4MrcrQ6y6OI/1UqmyIJ03QfJ1O+nIcFAw4RXNTexoV
	08FEHYmEwlR5m6rRhjG9tqQIyHcz+VS0i0YaoDXIqRDkndm66F7J8+LL96JLmSQkizE6tzLh5/v
	FQyeIJE0cATjTTyZXYij9KvOY70tMyuP/dbKMD3yzT61OxXL+oOiHzb624ft6P9LDcoM3g1aQmK
	7/YDsC2tR7412M31p5nQ==
X-Google-Smtp-Source: AGHT+IFGnl2LS0eh0NSkiG2btAa33pt21zCgUoCDAEvybqOjsXP5hwUk8uVEC18v3X9m4mM8EZwS0Q==
X-Received: by 2002:a17:907:6d11:b0:ae3:bb0a:1cd8 with SMTP id a640c23a62f3a-afcbe095f40mr136878066b.19.1755155474197;
        Thu, 14 Aug 2025 00:11:14 -0700 (PDT)
Message-ID: <f85ae718-0243-4426-a555-327afffe7148@suse.com>
Date: Thu, 14 Aug 2025 09:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, Julien Grall <jgrall@amazon.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250812223024.2364749-1-dmukhin@ford.com>
 <20250812223024.2364749-2-dmukhin@ford.com>
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
In-Reply-To: <20250812223024.2364749-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2025 00:30, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Currently, there are two different domain ID allocation implementations:
> 
>   1) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
> 
>   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>      max_init_domid (both Arm and x86).
> 
> The domain ID allocation covers dom0 or late hwdom, predefined domains,
> post-boot domains, excluding Xen system domains (domid >=
> DOMID_FIRST_RESERVED).
> 
> It makes sense to have a common helper code for such task across architectures
> (Arm and x86) and between dom0less / toolstack domU allocation.
> 
> Note, fixing dependency on max_init_domid is out of scope of this patch.
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> new common/domid.c based on the bitmap.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and use it if
>   ID is not used;
> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED-1],
>   starting from the last used ID.
>   Implementation guarantees that two consecutive calls will never return the
>   same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
>   excluded from the allocation range.
> 
> Remove is_free_domid() helper as it is not needed now.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> Changes since v15:
> - fixup for check after the first pass in the bitarray in domid_alloc()
> - trivial renaming for the local variable in domid_alloc()
> - kept Julien's R-b, added Alejandro's R-b

Just to mention: My take is that this kind of a fix ought to invalidate all
earlier R-b. It's not just a cosmetic change, after all.

Jan

