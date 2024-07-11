Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CE92E435
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 12:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757267.1166076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqid-0001Vm-38; Thu, 11 Jul 2024 10:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757267.1166076; Thu, 11 Jul 2024 10:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqic-0001TL-Vm; Thu, 11 Jul 2024 10:08:06 +0000
Received: by outflank-mailman (input) for mailman id 757267;
 Thu, 11 Jul 2024 10:08:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRqia-0001Ru-S7
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 10:08:04 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7616d0c8-3f6d-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 12:08:03 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso5879931fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 03:08:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ad55b4sm46890845ad.293.2024.07.11.03.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 03:08:02 -0700 (PDT)
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
X-Inumbo-ID: 7616d0c8-3f6d-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720692483; x=1721297283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4g8+S+YbuKqqSHo2iZBiUwb/lsd1u9Z17blCpHpPRFw=;
        b=RKWeuIqsInOwBuOnDODBVcJxfFiGR2ppdYAAUcKwhO4x25XIzfz8TCbq4RTc4ttes4
         Ae8svLpuWehsQ6nClTdzNkWKNwm08e3iGnxJ32FINtqrFUte1Ybe/TTWcz7UDQGW7Rj9
         KT04zhG56SUQDiBOSvckd9PBodGimcnPgUZHovpMjC8rCFPpsK89Zd1Skp+9zxLbxFUl
         vXnfoQV6I5LOfddm7+jpC37pCtxUDmM+0o55yPwSP5VdDhXIV9sS4x/pBX4MoTs6b5Uo
         6F0LQnhnsaSQGYKoAmG59jxzNJjVDonXz32HFnZqgruVTazpHxZmMnF11XmqgeIvngtG
         CrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720692483; x=1721297283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g8+S+YbuKqqSHo2iZBiUwb/lsd1u9Z17blCpHpPRFw=;
        b=L1TRhqYBjonMPSpfc7HvBwmEpRIAdyYzK3pWiVszCwQcKUU63XrTKxPJkub8gOrFOB
         Up+d1ntK4w1zkovDMDMQ2PhPMmhFUqyDTP9enYxlU8qflRnfl2WHjuNs9w1siVZhhuup
         e+HUguqBinBfAWiCiibvqOP3EfUAppugOE6XYv3fMiaBHw2iPanSNRuIeFUuPnMaohxh
         c+C6nPmH7MNdOh9U1iF7mGigFjmlVMAYB9jNAg6IAHd+JPFg2D0fwIiaeIKh1vuAN4T1
         FKPkk1wmkbBi8ZOsQbq4Iltpq/NMeVU7IIcVxX9ew9xZrBUwHpU5fs2FOJcrNauicxJo
         9s9A==
X-Forwarded-Encrypted: i=1; AJvYcCWuo+x2yV+nt3jYmyquK2WOlzDQT77j27Ajwm2MUOzwjsZ0eITJ72YEyYUJgXr14u821psN4E3lrvXpY0iGPYjZndlATMX9VznGbzsQ4Dc=
X-Gm-Message-State: AOJu0Yx+D4ob+QBvaG9V1GpYsK5LCorSAcTOppvwXTWA89PlAc+vwdws
	eNSa94HJJz8WAEwlNg07Rom4bGbUGSOP8IkiYWCwuiBCZt3u9x/kZ0gCkUdZJBujMyAyxNgbAeo
	=
X-Google-Smtp-Source: AGHT+IGW9o/2tsuZjn82sumZ10VP6MkZXwO1afRJwbwUrCBxjUbhXHq4AfQiEek2xV+R/zqu2O3ZNQ==
X-Received: by 2002:a2e:9259:0:b0:2ec:5843:2fbd with SMTP id 38308e7fff4ca-2eeb3188e5cmr48685581fa.41.1720692483148;
        Thu, 11 Jul 2024 03:08:03 -0700 (PDT)
Message-ID: <3fdce63b-097b-4fcd-9b69-1f82dae71340@suse.com>
Date: Thu, 11 Jul 2024 12:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug] Xen build doesn't fail when required tools are missing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <jgrall@amazon.com>, Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony Perard <anthony@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <73ac0930-828c-4873-a65e-e7c5ad2fbc9d@citrix.com>
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
In-Reply-To: <73ac0930-828c-4873-a65e-e7c5ad2fbc9d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.07.2024 11:55, Andrew Cooper wrote:
> So I was playing with rebuilding the OpenSUSE Tumbleweed container from
> scratch.  (I've ~halfed it's size by correcting the dependencies).
> 
> When diffutils is missing (package containing the `cmp` utility), a
> build of Xen proceeds as:
> 
> make: Entering directory '/build/xen'
> make: hostname: No such file or directory
>   UPD     include/xen/compile.h
>  Xen 4.19-rc
> /bin/sh: line 1: cmp: command not found
>   UPD     include/compat/.xlat/xen.lst
> /bin/sh: line 1: cmp: command not found
>   UPD     include/compat/.xlat/arch-x86/pmu.lst
> /bin/sh: line 1: cmp: command not found
> /bin/sh: line 1: cmp: command not found
> 
> without failing.

Build-wise that's correct behavior: "cmp" missing means the filechk
rule will update the file, even if in reality it may not need updating.
The resulting build therefore is going to be correct. The error messages
may be irritating, yet if we silenced them you wouldn't have noticed the
missing tool.

Jan

