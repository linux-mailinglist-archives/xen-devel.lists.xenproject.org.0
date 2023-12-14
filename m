Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F72581360E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654681.1021866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoRy-0004tg-3X; Thu, 14 Dec 2023 16:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654681.1021866; Thu, 14 Dec 2023 16:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoRx-0004rd-W9; Thu, 14 Dec 2023 16:20:37 +0000
Received: by outflank-mailman (input) for mailman id 654681;
 Thu, 14 Dec 2023 16:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDoRw-0004rX-EA
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:20:36 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5fda806-9a9c-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 17:20:35 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a22ed5f0440so434019666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:20:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hw18-20020a170907a0d200b00a1cbe52300csm9605591ejc.56.2023.12.14.08.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:20:34 -0800 (PST)
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
X-Inumbo-ID: b5fda806-9a9c-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702570835; x=1703175635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+TauTi0WTTFqG4aaGELHLCGA518s+1bbBSvABtqpQ0=;
        b=TyqTsGke+5GtPa2oWtaWCJ3y7tzQA+BsxwAOYEs2V1viX1UW6+Gv3pSxzYOVPAVyMo
         KeMD/vNxb3hTSJQ4Bbq3hLzJ0USuM8pA9zaLY6qvqpRNxSP/mGE/93XcYwlbFbaYria5
         OI8XVr4hSzTuAWntWneUXVbriNlxVcw2nWBqh6YM7mwmykCbmH1yEhw9B1AuJBwlWvmy
         Upb4XTbmGYnHNlGlZeapPdtHkahbsQmig1NNm11CCdTbZ0TnEOt4m/ZlsRfc9+OyrGb1
         Znq5/NFP1WUi2QRsABdLJ4sxR5HzM0Mj+GVOM6jDjO1iUFwR5nfV1884nkb9Udv6fHG5
         OdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702570835; x=1703175635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+TauTi0WTTFqG4aaGELHLCGA518s+1bbBSvABtqpQ0=;
        b=Gh2yybrklR0Q5jDuS0kX5kM5GNIkoiqNfPW8c6wW/RiWIkv2z1lkMGNke64BDr5xDy
         wxMAIEABozV0CrNjG//47z+OcmQ27cLTfFGQBds2UPDxZi4lnIGFjifOOb+3w1MLq1ag
         WKeue4lKPnYAche6SzqZnyh9oqbgm5Yo3g9xBvQMmIirDdeoG/8iJvbUP3swKYji3MpM
         io4xeuI/pUfgYWeeeWDBzPre+BnxVwcKv0bATnxf9aLBPkVdR2tc4lC0NlOuOFDPX9us
         jQBnAluWtxzGf9UPZAIeRhKTDyarZcrVO6estVZo/SbPpp2QVCjw4JuRJhoyYJ9PdAXF
         wYYg==
X-Gm-Message-State: AOJu0YypU6mgVTc7Qc3PuQJ2rXIe8vvnGCHQ63FDcnxy3Nrb5k+ZMJ36
	rpIVkfRmMc0odj+DkhF8gqB2
X-Google-Smtp-Source: AGHT+IEnBdXQcDnKrMb1gsXaaKx6qCMUpg4FSsnmBg4/Le3fCjWJCS1dLRzvDUI3lYn5AGuL4kK8pw==
X-Received: by 2002:a17:906:225b:b0:a1f:8ffa:15af with SMTP id 27-20020a170906225b00b00a1f8ffa15afmr3087894ejr.130.1702570835093;
        Thu, 14 Dec 2023 08:20:35 -0800 (PST)
Message-ID: <2f79370e-ba6d-4796-a375-c4e19126fef9@suse.com>
Date: Thu, 14 Dec 2023 17:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 35/39] xen: add necessary headers to common to build
 full Xen for RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <88bab81d8412588dab82bb53193105ff4993961a.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <88bab81d8412588dab82bb53193105ff4993961a.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With an empty description it is hard to judge whether this is really needed.
I would sincerely hope we can get away without. Note how there already a few
struct xen_domctl_* forward declarations there, which - if the #include
really needs adding - should be dropped in exchange.

As a nit on the subject - it's only singular (now?) and could hence do with
being more precise on what the specific change is.

Jan

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -4,6 +4,7 @@
>  
>  #include <xen/types.h>
>  
> +#include <public/domctl.h>
>  #include <public/xen.h>
>  
>  struct guest_area {


