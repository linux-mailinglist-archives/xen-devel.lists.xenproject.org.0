Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA379B775D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828528.1243432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RQV-0003AU-Dh; Thu, 31 Oct 2024 09:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828528.1243432; Thu, 31 Oct 2024 09:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RQV-00037i-A9; Thu, 31 Oct 2024 09:25:11 +0000
Received: by outflank-mailman (input) for mailman id 828528;
 Thu, 31 Oct 2024 09:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6RQT-00037c-LP
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:25:09 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0427d3db-976a-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 10:25:06 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so7539195e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:25:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e8471sm50009015e9.4.2024.10.31.02.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:25:05 -0700 (PDT)
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
X-Inumbo-ID: 0427d3db-976a-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA0MjdkM2RiLTk3NmEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzY2NzA2LjU2ODg1Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730366706; x=1730971506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hkf7lG1zWO8DO93RD+O3P9VXv5hCLPLpU6OE5KDrcP8=;
        b=HAqtTfkYSbZUiP89SvTgFOszmVPXfcKSzALTN2kho5PrtUZ3baWS2IFBi8yVlftNoG
         NF5FcK+LSEcVUONXZqE4YOzqM5hrgwqrwpzeu24CBvCUx0F7gtnI0nK0Cj22L1faeknY
         SvQfBecJmCW4FV3qpAEaafXu+A8L3GvNjks/w1Oaf2A+AuErff0DWGFPeI/J85ZBJOrn
         VVpYn1WHY6KSbmS/pcIaNqW0kgqko36/X42awKm7F7tkeha+xXaCQRW/wnZIK7RNJfLs
         m3TKPf4rn7r/5dY5O5LwD9yrotJ4Jv7Q54gkI9zaaHibAQ9+nIgDXaJmBBI9Rj1/0tcU
         bxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366706; x=1730971506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkf7lG1zWO8DO93RD+O3P9VXv5hCLPLpU6OE5KDrcP8=;
        b=FHMQVthBKNm2FxMSUMcWi303bzrh5iPYnlqvGq/aO1+n/cUqzVyGoYpbCASIk6q2d5
         PeZQ29fjz24X0sbT1zuBOIaMAWsZBw2llcHYupRwFQV2Jy01YPvjxw3BGkAJIu7bDROM
         jo47wbpqBqzcxcvKPeNSG6NSGqirjoicx2CkWHutc0sXCGLhix1Paqa5TekYjpRM/QNp
         EN7V35puUeI9jgzqXAahuGoqjNT/dZfAtll5z2g9MFWe1YciIuz/FKVBM8kXRi+asBNw
         xE9mXLSlYONos84ZeDCeX9Pk16G5q+sDMLOQQw8eSVh5ekQtdQgfjvxwqp+FTLjKvjfU
         MrCA==
X-Forwarded-Encrypted: i=1; AJvYcCXqh9kP9i0wIccqJq/c7dY6wP06DucKA0xaKjvPpk5WEtFVRr/jIY0jYhq97WZBwsN/RYfzNfb5iUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2WmIYIqgpPxNjlonF+FvrX/9FEqVnYeo//rlTvZdJxRBnURYc
	xXiiU1mXi7bmNJ9qvkzBY12oZ2VmfJ4GUG0B8pAeIMDc/ta1MoN7hWG2nRJ9Eg==
X-Google-Smtp-Source: AGHT+IFDOW6LLAxpKccukgXQWnMeODNqR5AIvIVpjNMnVUiRdpaaLrmDLLUyynKv3NG71Gk7dftVPg==
X-Received: by 2002:a05:600c:4f4a:b0:431:4b88:d407 with SMTP id 5b1f17b1804b1-4319ac6f874mr205247235e9.5.1730366706055;
        Thu, 31 Oct 2024 02:25:06 -0700 (PDT)
Message-ID: <a76d84a3-d150-4836-8ad2-ee0eeabe557b@suse.com>
Date: Thu, 31 Oct 2024 10:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] Config: Update MiniOS revision
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241030180332.2726909-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241030180332.2726909-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2024 19:03, Andrew Cooper wrote:
> A new branch from xen-RELEASE-4.19.0, for now containing commit
> a400dd517068 ("Add missing symbol exports for grub-pv").
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Juergen Gross <jgross@suse.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  Config.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 03a89624c77f..aa3d5843f1ed 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
>  QEMU_UPSTREAM_REVISION ?= qemu-xen-4.19.0
>  
>  MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
> -MINIOS_UPSTREAM_REVISION ?= xen-RELEASE-4.19.0
> +MINIOS_UPSTREAM_REVISION ?= xen-stable-4.19

Wouldn't we better use a hash here, like we do on staging? There had been
cases where it wasn't safe for the used commit to move "automatically", and
the same could occur on a stable branch. The hash would then be replaced by
a release tag when a release is being prepared (again like on staging).

Jan

