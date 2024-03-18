Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4187E9E2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694686.1083690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCl8-0005mM-6P; Mon, 18 Mar 2024 13:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694686.1083690; Mon, 18 Mar 2024 13:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCl8-0005jX-3I; Mon, 18 Mar 2024 13:10:34 +0000
Received: by outflank-mailman (input) for mailman id 694686;
 Mon, 18 Mar 2024 13:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmCl7-0005jP-C1
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:10:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5a4c373-e528-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 14:10:31 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a46cf8f649dso51086766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:10:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v15-20020a1709061dcf00b00a46cf83216csm298369ejh.120.2024.03.18.06.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:10:30 -0700 (PDT)
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
X-Inumbo-ID: e5a4c373-e528-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710767430; x=1711372230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjILFo13bCOElL9oZ/z9R73yH+FFeKVq0zNPOrbcw9o=;
        b=KHqbBpIhjecTku/dap1Dcw77Zkz8YxvTOU7suebh8JXB2jTNYpu2C4zHI/Io9pAALB
         u1TpYRtatG6+E1aYgJYLMaZ/xunk6YgrfN+nq0vc8nAPTRxavMNsA9PzgS9MikpNaOM7
         slnodGjn9T+63VBrW6QoN1sIZ0UD/Fdj2GWiQVGkVQ7AOSECOdzP0SU2C+agHw1h7hr6
         cM7piigHDL8BrjrdPzcZyzPs6MLoabb7BchXvv5RL/k+/I7QvWA60CFQVWCNbvHZkNbs
         HwQoqGtqfD4kt6SeGSEuF1GNheqO7EW7FIMizZY9b3G5ixWj3jcBZ3dihk2usw0SwKzY
         XXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710767430; x=1711372230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjILFo13bCOElL9oZ/z9R73yH+FFeKVq0zNPOrbcw9o=;
        b=o0A41TeULIYmKXLSIgwEwk4sC9rKZlWDLX0fUfW+stDm4myyOhJoZaNcFcet+oomGl
         i5PF0NsjTC+JrgD+/Prgf3Ac4DCuVL49WqGfbtT9mVSijTMm4sNlKmetMgMHw9kNFStv
         cGBzmCMSwWABtar+DgEZwSjuuIr7UJ9oGdqcxVd3GHHrCufIp9bd9QPa6FMwYP0PBkdp
         4+Vz082NiO9wl3hGN9UB6qqg/btUVOznWc0U249CndBgO8QBddqvvjCyUkrQ4uENhctr
         4CqIKmHnIKdIKDMUkwhwEHQyhAWwtw4CeUjWQYGBvZ902oGeMnAPbiZivSBZ0guT8Oxe
         LcuA==
X-Forwarded-Encrypted: i=1; AJvYcCURFWRw0gJZjiul030LSWcXlWBmG+zbjY7820GjJy07i7jdXCg4DRPOUuPv0K6HiqX77wD1Y+PdSamvNelGBGXcvwcWGm6qBzpcvdyIplc=
X-Gm-Message-State: AOJu0YxkFx4V/FY7dO5iHPiXEWlM44ZTW0oLYgqXZnnyomiZ8IUoqdiy
	SlXFRnNJW/vKesRdPsRgU+ZmIh4xoMkj8Xie1N2U7bWmnNtZUOUXOeadEe6x8g==
X-Google-Smtp-Source: AGHT+IGaqVUMv2Zp+HJqWL/U8nJA4cHByVyaBtIaSgjd5fORAizKl5XvTHFASFh0zU8gvSnBrEZUzw==
X-Received: by 2002:a17:906:6607:b0:a46:5da0:7c09 with SMTP id b7-20020a170906660700b00a465da07c09mr8073580ejp.28.1710767430559;
        Mon, 18 Mar 2024 06:10:30 -0700 (PDT)
Message-ID: <c4866ad1-4c35-4f7b-93c1-ece463f8a8ad@suse.com>
Date: Mon, 18 Mar 2024 14:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/link: Introduce a common BUGFRAMES definition
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318110442.3653997-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 12:04, Andrew Cooper wrote:
> Bugframe linkage is identical in all architectures.  This is not surprising
> given that it is (now) only consumed by common/virtual_region.c
> 
> Introduce a common BUGFRAMES define in xen.lds.h ahead of rearranging their
> structure.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


