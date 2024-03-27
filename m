Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B217288DCA1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698454.1090123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRYW-00020Z-KM; Wed, 27 Mar 2024 11:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698454.1090123; Wed, 27 Mar 2024 11:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRYW-0001y3-Gf; Wed, 27 Mar 2024 11:34:56 +0000
Received: by outflank-mailman (input) for mailman id 698454;
 Wed, 27 Mar 2024 11:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpRYV-0001xx-2t
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:34:55 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07951c3d-ec2e-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:34:53 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56c36c67deaso1234672a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:34:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ef4-20020a05640228c400b0056c498c9c92sm5368edb.31.2024.03.27.04.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 04:34:52 -0700 (PDT)
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
X-Inumbo-ID: 07951c3d-ec2e-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711539293; x=1712144093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojLVLrJvL0DF+s1q9vHSVbghGXIXL8mZcVWJTiOzctA=;
        b=c7d82rEo2DNG5ejYHgK0ujjv/jKceYxJ5qH53eqeRPzzx6IWeRARKNoz0VPQB4XW6c
         RrJAHTVALc4UuMARorxHJTZJpNi0Wv+wg9RVTrD33pAEE0tWmgdhbx99uyBXv+TmZazD
         kIW/6ABR0IM//GC/HJ0AuYiYmdL0P+sqw8HYJ3B9n5Q5crEIDqPI+vIkdnX4P4PoJsCb
         QtmxBpSOF4LeItpTrRL0D4ZcgV9OLsG+EeN4oIb5EeeJDlGIKLaHj3f1y1kphJlWz3FW
         8zu0RcXO5HUTlN6g14MNtS5kP0w2zbfgMk0u8QUB1Ph0Q3Fx/dfcMvp9PMYlsxbguKX7
         HceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539293; x=1712144093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojLVLrJvL0DF+s1q9vHSVbghGXIXL8mZcVWJTiOzctA=;
        b=IcdeBoBkrZWsVHLbg4yPSvhvlT448yKVMEPwdsx5eWO0EqFjPB3m3L8rOZY+jZjoW7
         GnS9rrG9eDRhkSd4+WmB8hVXzfVInq7TJuiJVoe4y4m5p+EGp0dgWOjc5nLMhmIfL1Oe
         +JMUM8SEnsmUEHQekZM9/Eh9IoOgmlR8YlWJ+YmV//hKkQdgPR8ZGmX1KR4+3otp/G01
         vxKUekiLVdr7EafOh48TF/3/B/2IDuzf6lYipTch7tw1t4DGUkFDuATgqQGIyxrGvSpC
         9Ya5jMSoHQ9Z8TnN/PPfuGGbso+Tk4NE9xuqPmpOEwxVERfkojz37Mw8Op2am8aQ6JVU
         QZ5g==
X-Gm-Message-State: AOJu0YwrMdn1z1KULYtL0vSKxOtc802Nb6FP5yvzfVTW66ndHI1IZote
	YVbItjbHHvucT/fpSIp2v4Lcmo/HH6JBi9DfRQGYCLLurbtoHutkuiiVReELrA==
X-Google-Smtp-Source: AGHT+IFKtcMo1ylU4Vxluay9ykkwgXb0Rdk8YysDpsL8SZPPPBXmrViLIVOWywbFtfdeCv0pZrCDVQ==
X-Received: by 2002:a50:d497:0:b0:56c:189f:cf2f with SMTP id s23-20020a50d497000000b0056c189fcf2fmr585372edi.32.1711539293077;
        Wed, 27 Mar 2024 04:34:53 -0700 (PDT)
Message-ID: <a727c53f-6e0f-45df-96be-a58892d65f36@suse.com>
Date: Wed, 27 Mar 2024 12:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Backport request for 4.17
Content-Language: en-US
To: Anthony PERARD <anthony.perard@cloud.com>
References: <f9aed339-bcd2-4069-b3a7-1da71b0ce032@perard>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <f9aed339-bcd2-4069-b3a7-1da71b0ce032@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2024 18:02, Anthony PERARD wrote:
> Would it be possible to backport 18a36b4a9b08 ("tools: ipxe: update for
> fixing build with GCC12") to Xen 4.17 ?

Sure, now done.

Jan

> This would be to allow building Xen 4.17 on Debian Bookworm, and to allow
> osstest to test Xen 4.18 with Debian Bookworm. osstest always tries to
> migration from N-1 to N, so it would need to be able to build both 4.17
> and 4.18 to actually test 4.18. Otherwise, I can tell osstest to keep
> using Debian Buster to test 4.18.
> 
> For context:
>     https://lore.kernel.org/xen-devel/20240318165545.3898-36-anthony.perard@citrix.com/
> 
> That commit pulls a newer version of IPXE, I don't think there's be
> compatibility issue with Xen, and hopefully nothing breaks.
> 
> Thanks,
> 


