Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19FA67675
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 15:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919201.1323707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuY0B-0001KJ-Fi; Tue, 18 Mar 2025 14:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919201.1323707; Tue, 18 Mar 2025 14:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuY0B-0001Hj-D2; Tue, 18 Mar 2025 14:33:07 +0000
Received: by outflank-mailman (input) for mailman id 919201;
 Tue, 18 Mar 2025 14:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuY09-0001Hd-Kk
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 14:33:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ee4548-0405-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 15:33:04 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso23772325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 07:33:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc49adsm136305095e9.24.2025.03.18.07.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 07:33:03 -0700 (PDT)
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
X-Inumbo-ID: e6ee4548-0405-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742308384; x=1742913184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kWA9quwjiUDcW9ulgdIQlkas+iF8cjFY2kUNlW5151U=;
        b=Muz1AAZzrSpg3q/IYeeFoGPIsxUOISiaIArWxpWbVimGE139H2WzvalkN2kCgi/9KB
         q0GGtHuClXn7fhrfBou28tr+uuQuZf1MYaNnb2VHByyv+UIfrOjHUcXy5bjY1yvF+Lso
         xa7fZlIUqmlmS6bHr+G9wZu/5GENwZMdYbbq8GAGUIgVpAlBVhnTiMm1bsNamIuGVb8d
         funb4CapxmSNymwoMfTxeMTxe/zfOBKVZgdalZ/8/AeOwgicoCnyHcPLARKrNEcu5BFt
         jgLFFED0Ktxf7fxSCqQTqVyPgnv8LkawhLDazszERgRpHLbydPHkj3l9wYhHgEpAXla3
         YksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308384; x=1742913184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWA9quwjiUDcW9ulgdIQlkas+iF8cjFY2kUNlW5151U=;
        b=aaD0PcjD18Ig0yJxJeITKEK2bNktne/C440LQ8d6Yr9FnP1YkVRh4NcSFr97sTuzmB
         CbuPEK8dFgCvxcSmnv0Yifg9mC7mlvMg0N/mnnZM6qo6aTV0+EJJ5YU2Ng0ij1hUr+QV
         sq41N139z8ni5ExmVG347oVEF3+z5MkNnjb9fMPUMUMCxLKBexfXnp8FJ5ZFl2vSFYp9
         xdIkUz3yk53nZU1dSxL7n2mP+k7el2+SlYXjsLahoa47f9R2nfqT+vY25Mg0LD2R2Rpa
         FDaHGdW+ReeS9cupW7Ukux/90V/zf+6xFEv60+dkWAG7DMl/fFKULSPanLoxZKBua456
         TbBw==
X-Forwarded-Encrypted: i=1; AJvYcCUTfEOaxk0frKpvgL1qTF2kggeiiDNnK6+Rbli7Tg2F07iz5fVpioux9TsNMQ00wMh4s1OuutQSGWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRkJM3LZbabM+3KB2iaLUkpurBenxp/zKUcO9xN1Utvlqrlm7t
	S64eYi+YRxnEkDI/xPVyD7Tg+IZakZwpeZ20cOcvRigD3YuWHbb7HZbgYxxyMg==
X-Gm-Gg: ASbGnct4LnGDwF6T6R0+NzHQDI/SnsF0XfXHcZMM5vOZI+ywPMZHOCHgTm/BO1SiYyD
	sM72lWfhjA5DrKZNH5yf103xc736S4kBzirc9gQXlku0OefHJ5yaEdhX+mT2N82ec7w19JZh+MB
	GDMiuzOhZRPLB31jHHkL9+UQLyRpvaYMnELTvBd+wPpmb9+xM55cs7SMGaw1NyVLZGPq8iyenBH
	2AS5hX7C6kp3IpuCqUdgJ0udsFsogCuQ/gJJdZK35Vh8Vbk3Z1LHLep2/qrEhJO22lfata/Vymm
	yrlRt9sS26e2Nmv+i/xTJgBK9YRimzpHdcWAiPAM2Xlc1tPDFfVqid2JjPQHsRouWBeLTR83qnD
	TUtri/zBKxwSABZ30yfTQd+KpEkdHbgqfKj7WX3Qn
X-Google-Smtp-Source: AGHT+IGkJuB50FQ1ML+79WLrtKnaAQ23boMZNTXDYbiJtcEk2gCHwmMGDDvHA6omFZoKcxq9w5yDlQ==
X-Received: by 2002:a05:600c:3d14:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43d3ba3ce0emr29811245e9.30.1742308384020;
        Tue, 18 Mar 2025 07:33:04 -0700 (PDT)
Message-ID: <8ad59d67-02f8-415c-93a0-2361e920c017@suse.com>
Date: Tue, 18 Mar 2025 15:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in
 COMPAT_ARG_XLAT_VIRT_BASE
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-4-roger.pau@citrix.com>
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
In-Reply-To: <20250318091904.52903-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 10:19, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/x86_64/uaccess.h
> +++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
> @@ -9,9 +9,9 @@
>   * a secondary mapping installed, which needs to be used for such accesses in
>   * the PV case, and will also be used for HVM to avoid extra conditionals.
>   */
> -#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
> -                                   (PERDOMAIN_ALT_VIRT_START - \
> -                                    PERDOMAIN_VIRT_START))
> +#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
> +                                   (PERDOMAIN_VIRT_START - \
> +                                    PERDOMAIN_ALT_VIRT_START))

Aren't we then (still) dependent on ordering between PERDOMAIN_VIRT_START
and PERDOMAIN_ALT_VIRT_START? Would

#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
                                   PERDOMAIN_VIRT_START + \
                                   PERDOMAIN_ALT_VIRT_START)

perhaps be less fragile?

Jan

