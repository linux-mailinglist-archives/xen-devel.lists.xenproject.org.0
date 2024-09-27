Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F36987E83
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 08:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806044.1217348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4cF-0001TI-S7; Fri, 27 Sep 2024 06:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806044.1217348; Fri, 27 Sep 2024 06:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4cF-0001Rn-PK; Fri, 27 Sep 2024 06:38:11 +0000
Received: by outflank-mailman (input) for mailman id 806044;
 Fri, 27 Sep 2024 06:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su4cE-0001Rf-H0
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 06:38:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f7c3e67-7c9b-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 08:38:09 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so234860766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 23:38:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c70dfsm88007166b.52.2024.09.26.23.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 23:38:08 -0700 (PDT)
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
X-Inumbo-ID: 0f7c3e67-7c9b-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727419089; x=1728023889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HN702yu+Wq+pRfujzx1CtByaTy+YzI7Ahs/FZAsW5j8=;
        b=Fc2Ut7l8heR/36WNrKUHWGLBHqVcci8Yv2zsHlvVX+hP7cMAKo6KYlRaE5vraK4PeM
         vEMSeaX3ESj2iu4JGb3P3VNp+P94cmwGxDtZ/yaEb3IZxiNtLYnZTzFVFiZ0/5PzzTH2
         cg27kTn4IeQ+JpOKDXv9/gdYG+uRR5nO0p9jtwjThEXiP+m5Nlvx4EI246DZpeiS5l+6
         dmnMWR3zl2tOoKeBfSKFL5d51J5uz1N0fl83WC9gmX9y+PqDDnvC8f5FaRHCmqAm/OjL
         YZhvixy0vOZmTpOyhUggipzvrlVphb1nwRT0d8zikKv2MLmgGtj5kDDGsnyuu9JLcy8h
         FkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727419089; x=1728023889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN702yu+Wq+pRfujzx1CtByaTy+YzI7Ahs/FZAsW5j8=;
        b=wFWb3iiNrkuzw7Hbrypz9A1YhwnjveD3fZDUAGs7RSuIAo/PG6aqPOFmKU+DvOsul6
         1v2Eu+j1BwnsaG/1WgZ6d785YufjiSxbtotf0D1caN46U+YFMhpu480rTSLxRIxOvKT2
         mIZxnIMqq7iBiSPiROg878Z+GnT3NMvrbZcMeLDkdKptssJEGgnCGz0V5URjO2KgpbiN
         4KOZUxVxs60jMzJbD0CMRX4t0RFhrguFo0JeKx+t+ACcFso1TOcThL9sB5y9KXa3/Vcp
         I7KRItaFt0u6vfJUirIb+p8/Nv1hpzVnCd++ZE5N9w9bD7ib3OsZHiMYnk8NcO2+0Cqw
         s9hA==
X-Forwarded-Encrypted: i=1; AJvYcCUGWd5OK1qyHOShHUWtUFSWPkRAUGcdkBI9F1cSncNJR7k/56Aaw/Tbi/yZhH3UD9l2kbVlhEXbZ2w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQLrZwOSC7xP35UGjfZHGSHIDUVLaNHdVROJcFlImnNKweB0Ek
	KQUu1+M8NUwAq+nHEa2N4lW2Ig6gR9YFmnyA3DFnE8Gksqpw3vJVWvCeYi1DYg==
X-Google-Smtp-Source: AGHT+IEdSC1Lr2tIswxT8ZAjo9n4wHetS6GApCyGhJQkwGBPK7ncjrIV8SfqKPesCaHWHzj4LY4sHA==
X-Received: by 2002:a17:906:7946:b0:a8e:a578:29d8 with SMTP id a640c23a62f3a-a93c4acab60mr156697066b.64.1727419088970;
        Thu, 26 Sep 2024 23:38:08 -0700 (PDT)
Message-ID: <f86eda2e-43eb-4f93-8d79-c615212baafc@suse.com>
Date: Fri, 27 Sep 2024 08:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] xen: define ACPI and DT device info sections
 macros
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <c5fd649a4ccd3a65a81dfab505fc99b2a679cda6.1727365854.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c5fd649a4ccd3a65a81dfab505fc99b2a679cda6.1727365854.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 18:54, Oleksii Kurochko wrote:
> Introduce macros to define device information sections based on
> the configuration of ACPI or device tree support. These sections
> are required for common code of device initialization and getting
> an information about a device.
> 
> These macros are expected to be used across different
> architectures (Arm, PPC, RISC-V), so they are moved to
> the common xen/xen.lds.h, based on their original definition
> in Arm.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> @@ -137,6 +145,14 @@
>      *(.bug_frames.3)                            \
>      __stop_bug_frames_3 = .;
>  
> +#define DT_DEV_INFO(secname)    \
> +  . = ALIGN(POINTER_ALIGN);     \
> +  DECL_SECTION(secname) {       \
> +       _sdevice = .;           \
> +       *(secname)              \
> +       _edevice = .;           \
> +  } :text

... the trailing backslashes all aligned here (can likely be taken care of
while committing).

Jan

