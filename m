Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410C8812BA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:55:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695924.1086244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwP6-0000BW-WB; Wed, 20 Mar 2024 13:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695924.1086244; Wed, 20 Mar 2024 13:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwP6-00008X-T7; Wed, 20 Mar 2024 13:54:52 +0000
Received: by outflank-mailman (input) for mailman id 695924;
 Wed, 20 Mar 2024 13:54:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmwP5-00008Q-Ns
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:54:51 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bd5d1cd-e6c1-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 14:54:50 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso163661066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:54:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 xj4-20020a170906db0400b00a46aba003eesm4886584ejb.215.2024.03.20.06.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 06:54:50 -0700 (PDT)
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
X-Inumbo-ID: 6bd5d1cd-e6c1-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710942890; x=1711547690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qm21WwCwGeW+W2XQIszmwXT848dJr4l2ZZCaVHgRCVo=;
        b=CtmU+Z5uEc+3iXOt+rFV7Ios8nadZx3AaPeVtes3c7jpynO73nIpBlmFaVScVMd9hX
         eTPEB5pNz2TmOw6tXs+g+r087vmcvOV+3isy4gb1HQBVnqxst1iTQVP0kyPt4/BYCK1H
         1v8jLIVNAOJMq1bZRvK3HO3puxXPd11y1n8HnygCvjv92Cunif32hBiQYT0DoL0exQIO
         hLDyR/oOi7TKTQTGDQlOCOHG+wRFNpKWrbXFr2WG3/rjF0pfAzlzJXE9VANP1G5Oe6pi
         FtdrVCTj2Bz9NcihzAYdVKazMb5/1RiJWcabgI/o96XzDZgpoQKcBmDRV476BHNHF+W3
         wv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942890; x=1711547690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm21WwCwGeW+W2XQIszmwXT848dJr4l2ZZCaVHgRCVo=;
        b=WM1znAKKl5+zpLNlWVGnkydkD69xL+4LI+R98mYbGbSFlrhGKdEesM6RuJhBendzQU
         DlxvMaa7ofU92S2ZBPkceb64unMBvl1UyX3s2apjv8EBtfPCZ/G21mjwG+x4VfSDgQ5e
         0ygjR5L8dtPaWTc1Yy9h4watqj8ei8eEKC360LX1FqohFzOvApS9/+ungDYucT5afYUo
         48Pp2Uz4Q2c5sqLAIIPHENOdTOQMEmVzRkvol/GnxHG5venSuuT34BWhkCZnYknecerL
         BIrcrDQ0E62P050XFx1z6+x+mQX47jyrJuHihI/zNXsMGi2othMWuXFUSTFPctPa0Pz+
         k4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUiKzJ7cqyMpcm+8ckkgO62z58KfjHQzm9HDgRqjBdh2YZsTce4Hfgmv5iq4rRGc876ohy9uiHYwf6++VkTPaF3P6A1lMQFqVnjrnhQYrg=
X-Gm-Message-State: AOJu0Yw20lB8cyxbwHYQreHbtDtZLpNpmxVHdbLS2z3kzzIs31bjS2KW
	NpcOQUawkviC9kXZ54JimN17JeDnX7uQ/lSI+BOrAcmCNov3E39lTLAo0Gbgag==
X-Google-Smtp-Source: AGHT+IG75MirnZzKoOTf8EhJ/2m8xB+4LrjHAxI+IekJhpZ+2OK+j/7AGaqNKkgI2v9/v5MIXTIIig==
X-Received: by 2002:a17:906:2317:b0:a46:d759:d531 with SMTP id l23-20020a170906231700b00a46d759d531mr2132941eja.34.1710942890356;
        Wed, 20 Mar 2024 06:54:50 -0700 (PDT)
Message-ID: <0ae49632-3e14-425b-9140-826264fae14f@suse.com>
Date: Wed, 20 Mar 2024 14:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] xen/trace: Drop old trace API
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318163552.3808695-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2024 17:35, Andrew Cooper wrote:
> With all users updated to the new API, drop the old API.  This includes all of
> asm/hvm/trace.h, which allows us to drop some includes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> v2.1:
>  * New
> v3:
>  * Extend to drop __trace_var() too

And still
Acked-by: Jan Beulich <jbeulich@suse.com>
(with the never responded to remark in [1] still holding)

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-09/msg02154.html

