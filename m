Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA0D11FF6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200028.1516043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFS0-0003N6-Sm; Mon, 12 Jan 2026 10:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200028.1516043; Mon, 12 Jan 2026 10:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFS0-0003Kb-Q0; Mon, 12 Jan 2026 10:47:08 +0000
Received: by outflank-mailman (input) for mailman id 1200028;
 Mon, 12 Jan 2026 10:47:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfFRz-0003KV-I0
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:47:07 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09847b0c-efa4-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 11:47:06 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so3243523f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 02:47:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16f4sm38858048f8f.11.2026.01.12.02.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 02:47:05 -0800 (PST)
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
X-Inumbo-ID: 09847b0c-efa4-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768214826; x=1768819626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hSgzgogByJA0bhNgue5KWtK+QgUZVM56BoRqgl+g2ng=;
        b=NcypBjpfKm58R3jJZTHP7UDWfI7HZvMxOaY2FQMP3JyEDaqkPMV1jPoTLOQzQ42vcB
         kBifM+G5X3FJ4MypS0WgO4qjdwPsRawnY0D1Go4P7K8Wh9Gy5yXuEiZY1T//DJAHDthS
         Bo5zg07CU65SN2vg8DtmG3z/MqUzh+siqJE7ius/qez1cScIafpKQZBIoStJuITFkeTA
         XouMVic1mOCt0/kFdhl12hH3ShpW8HEA/K3wVQNWKZ9w/w3P0Mn5nWIttW3fzVw/u+Z2
         NrdXLII3qLbKrsPzoKLATCQGb9FFfn4tjJycOyGneExLsfAWKLajHtP/UNP2Ndli34E0
         XEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214826; x=1768819626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSgzgogByJA0bhNgue5KWtK+QgUZVM56BoRqgl+g2ng=;
        b=J3yxCAHQ8lYmeYtc58AXrUR7D24eTEVmtpULuWDyeUIczOyHpsxaPvlrgrDB09Bwz3
         aYTz1rfoCujVCzb5cos/XuStHfAD7Ltx8EFXJKFVR+HdzL4A7YkiKgIoNHbO6Swqf4nS
         yPRjwjvlfF3Pif5WU1Ae4ZsLix5gx2XEX9ATjPlfrNgE/Z8XgIxHLCn564T2XzyqaeCM
         lkwVpLC105y/XvlzUNyNJWVlhOaZ+eKI5aK1VgBeB/Dy5b/WLcneHE/NPKDwYZDvr3fA
         2mLWZeOc9GZFCdqOSrS4g/OBo+yp9w6qBkrO9IJnm6YMGkMuzWdO9t5abyfKneAIyAkp
         kHtw==
X-Forwarded-Encrypted: i=1; AJvYcCUmXH723TXWGw6nsvsFL7XyIP/tJ1+uzZSsOS2QgBrG2EmpfzdsSH8wPwE902gVSYNrQcZQ3Sm8Jl0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypMILnpawRin0xfrU7lRmJn4wFiNi8xBsl3a8sJuubMl2N9qtA
	OsKcRgeXo7gmugpxwgmE4M73VWeBBmBvPzfazP7JDyYnHUsP+6SlsJKJgLgSinZ9Kw==
X-Gm-Gg: AY/fxX7X/1NW32fx5HIZOuPOc8o8NrzTk8KOSYHk8+wdn6lfS5tHpg/0+Dn3q0+OuIW
	0bmseXh6dOToB7+mplQ+v0X2A+3X2MK1j0/kUFfn6xS1zjSVNhHQxZJjYuvgBd7fGrhTxwSWxFI
	JK2OgcQeqcyOlO858zCupRBp9BaKgBgCUC+O30iMY49659W4j2NwZ0BS6VqdH1EhVdfOEp7Vx3z
	Qwmbq5AUtEU9/Ye2VGb75rMp51SvdhBflnXPHfsxvUEhGR3/HKarIDxRUegDawMTPcP1Ig/xKzc
	M15uc25tYKQG5/GHaJkHPFWy4Mwao2yojhjJk19bT2p+im1j6XujJzUcB7HCWmT+AgQpKz6P0N5
	9e/nbbBWTlH1MIetkh/8RD+mmFZ0scZmZf0N2aKFMIbrSGYtCE9jwUsp/oY2A8ybsf7fd5+y3gY
	b5wAwUV+3+o9yTh4fJ4qEB0VMIZAW9contxyaYei9aNX6TjbNThl4QNNbXzSsZq8YMojJasxd6N
	Lc=
X-Google-Smtp-Source: AGHT+IHtmF67vVUWTm1s73XX0DZQ5BH0QcGols75jR7Cd4NJiGJIVsYT2I4KwpTi6f3xN8LaQ4iXIw==
X-Received: by 2002:a05:6000:4287:b0:432:851d:35ef with SMTP id ffacd0b85a97d-432c37a3b62mr23488201f8f.42.1768214825738;
        Mon, 12 Jan 2026 02:47:05 -0800 (PST)
Message-ID: <3b0d3397-cffd-4017-89da-6850101d5f9a@suse.com>
Date: Mon, 12 Jan 2026 11:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/nodemask: Remove _unused_nodemask_arg_
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260112104015.1001907-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260112104015.1001907-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2026 11:40, Andrew Cooper wrote:
> This only exists to have it's type taken, despite there being a perfectly good
> concrete type to use.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/xen/nodemask.h
> +++ b/xen/include/xen/nodemask.h
> @@ -67,8 +67,6 @@ typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
>  
>  #define nodemask_bits(src) ((src)->bits)
>  
> -extern nodemask_t _unused_nodemask_arg_;
> -
>  #define node_set(node, dst) __node_set((node), &(dst))
>  static inline void __node_set(int node, volatile nodemask_t *dstp)
>  {
> @@ -215,7 +213,7 @@ static inline int __last_node(const nodemask_t *srcp, int nbits)
>  
>  #define nodemask_of_node(node)						\
>  ({									\
> -	typeof(_unused_nodemask_arg_) m;				\
> +	nodemask_t m;							\
>  	if (sizeof(m) == sizeof(unsigned long)) {			\
>  		m.bits[0] = 1UL<<(node);				\
>  	} else {							\

Hard to see why Linux would have introduced that either. (It still has it, btw.)

Jan

