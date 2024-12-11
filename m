Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829569ECAF1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854623.1267786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKif-0005mk-2r; Wed, 11 Dec 2024 11:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854623.1267786; Wed, 11 Dec 2024 11:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKie-0005kd-W4; Wed, 11 Dec 2024 11:17:28 +0000
Received: by outflank-mailman (input) for mailman id 854623;
 Wed, 11 Dec 2024 11:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLKic-0005kX-Q5
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:17:26 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f743e05-b7b1-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 12:17:24 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38637614567so1967895f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 03:17:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e7efb381sm5832019b3a.117.2024.12.11.03.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 03:17:23 -0800 (PST)
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
X-Inumbo-ID: 7f743e05-b7b1-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733915844; x=1734520644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V6HeZY8oKnERKqJlkDSm77F1uu3Cub+TrzX0rtTybfE=;
        b=GKWscZyWJjT0ZYkAT4W8zeDq5n+V0tYry+5IFwBqig0TrsbtIGyAzkOZInVrUKnYKL
         zqT486uetSI5PIA9Y44Iqh0ye70TZE+rV8ao11kUj9uAaST6KW2A4vsn0H/j8KQwYltj
         Mf8GRQaaBhLpQjBCFnXBjNrlOWN4LU3rpPMfFp/njN+hKVJB8hF5Zb/DBZMGc7yAKBDQ
         c3Tb24jKOqRnll9EeRJNqSDonXHGKJZZFnPDK+2PMw8DmtzJtEv+E3jLVBE9eehsA5du
         Fpxf+s1lKvLPSwFlxEZK/uoQB1pLFFznlWH8qp9z/7JNAuaKqs99aVOiDASTXMdUrmJo
         3axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733915844; x=1734520644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6HeZY8oKnERKqJlkDSm77F1uu3Cub+TrzX0rtTybfE=;
        b=rsjieLhVK1t+0BweOjwUwFv3PL3pBaXPmbLUd7ybpHUpumEIpFSkSUWNeSKQg9sVk4
         bHbmToVQ6BB8e7Yy6sk49umDFKKadW61/AQDa3CBj3E531OgVD8VRc9tu/rBEkGrKqVp
         3W0Gq17PEcFr8h7TzgeH9bRcSv5vVnaq4lPZhbwGBGDZpDdRGtsbODYd5PfqG0e8AOaU
         ZxC3mdzhppzGcY2qGyCNMDmsKQnUm3g+9O+k049THzvLx5yGfNy4LW4CNjXxImFY8AbC
         QB+KEDovPwW6uQF/hu5XNnVhNoVGFnpSjiHRs4rxL3PaHLQaSEXA6YZDjL7ybykhbFJj
         JaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCURh64xcsnxQpCNnDwsZPdfa5uCNYSqQ3mK12GuDiiAsMcAXhVIwtzuGhxTKPH0OKV0XoRHs5PLLZI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5r0OxeKFLAlGfla2EaKgXoN4Isjahe408FHLaWCay4hV6WviQ
	GQ7xw/gf14nON8m0ionn3HlYZkEMj8ii3CV0MnzSQef/xbqVTjkEd+KposP+Dg==
X-Gm-Gg: ASbGncupnf/J2Xlatz8yMTwfrDePz+2X2CEk2v5S7BNVOlMro4fyandeFmqEn0lZSBQ
	++QzAw9Jcx/XIQWII/8QPPTCrR7e2UKWEEayXceshgt6xBEUMw5zJrdQoDbGPgDDSNcBhvhRUi/
	fj58iSAdKxoK/3qIzEtCTaR/1oY3U+B8gCDYPJlpMl1U0WT9HNFjkAno0YLcKSPfaYimS0n2wYg
	lmtN1ErC4wiUaRUuCyPQs8dMFZuSxDG+TZo2Vnjl1vFwNVhNiMpghMLWafO79hCnn/VhkpoZvfT
	BXjSMCSadrb6UPCYvSQDQ++f3pOoIsBhTO0A+vY=
X-Google-Smtp-Source: AGHT+IGBA81eJaPEYhr2B8xEx9gTIr9BwlfSsIFjW4M4dBpyQUv8IWTzLOmJEjx4Uc/49Bkx/z6Mog==
X-Received: by 2002:a05:6000:188e:b0:385:f847:aa40 with SMTP id ffacd0b85a97d-3864cec5c19mr1642931f8f.38.1733915844253;
        Wed, 11 Dec 2024 03:17:24 -0800 (PST)
Message-ID: <bded3d90-0644-46c2-a43e-d6b06faa5650@suse.com>
Date: Wed, 11 Dec 2024 12:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: address violation of MISRA C Rule 11.1
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 12:02, Alessandro Zucchelli wrote:
> Rule 11.1 states as following: "Conversions shall not be performed
> between a pointer to a function and any other type".
> 
> Functions "__machine_restart" and "__machine_halt" in "x86/shutdown.c"
> and "halt_this_cpu" in "arm/shutdown.c" are defined as noreturn
> functions and subsequently passed as parameters to function calls.
> This violates the rule in Clang, where the "noreturn" attribute is
> considered part of the function"s type.

I'm unaware of build issues with Clang, hence can you clarify how Clang's
view comes into play here? In principle various attributes ought to be
part of a function's type; iirc that's also the case for gcc. Yet how
that matters to Eclair is still entirely unclear to me.

> By removing the "noreturn"
> attribbute and replacing it with uses of the ASSERT_UNREACHABLE macro,
> these violations are addressed.

Papered over, I'd say. What about release builds, for example?

Deleting the attribute also has a clear downside documentation-wise. If
we really mean to remove them from what the compiler gets to see, I think
we ought to still retain them in commented-out shape.

Jan

