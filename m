Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C485A93F8EC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766867.1177403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRsa-0005mA-AM; Mon, 29 Jul 2024 15:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766867.1177403; Mon, 29 Jul 2024 15:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRsa-0005kg-7h; Mon, 29 Jul 2024 15:01:40 +0000
Received: by outflank-mailman (input) for mailman id 766867;
 Mon, 29 Jul 2024 15:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYRsY-0005kX-PZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:01:38 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b829bb-4dbb-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 17:01:36 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5b391c8abd7so845672a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:01:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23639sm520554066b.9.2024.07.29.08.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:01:35 -0700 (PDT)
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
X-Inumbo-ID: 73b829bb-4dbb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722265296; x=1722870096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nnGpzgEAON+HCynjBA54wewKN1M/X+qB/wBGCKcDNnw=;
        b=J3UffZ3Kmk1YSWbSutIqHdPv7WkO82AnVhRjrnyAijT02SSaggASIaHsfyF7nzxDaX
         +4IRjUfgsPjWYJzigjd9XE9nVeOzhC4+mKNzclEl1EuYqsLu8bMKX1TVzDqlLlaqZXv9
         VB/pLxRNIn4rx6+w2iNy8BrB+SeVJe6jyppS40zUqg3QDuCkqRTktgGIq6Xb4hbENA9s
         DAtNE9PLlpN5e9RaJrfjB4Z0iEvSBN5GxOxddaZB3Q2oC4ZjwXg1aikGNGl0C6qzgINB
         AO4+ZjLhquP6WUi6AM81p2soVja3oQiSbhMIYmP/qasPkEsK9NpFQ4zeAsxvaKLVkSkd
         h5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265296; x=1722870096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnGpzgEAON+HCynjBA54wewKN1M/X+qB/wBGCKcDNnw=;
        b=WnC2IOXcNntbDN+QIyRc86ZTut1s0Sac279IrICkJwulePZSvpbLXhX0WpM9ccKjUa
         Jv+rIZWnCkZzv70dBbgGzf7sPFTHLmKSCDLHmeCIkGMQAJ3Iysb4Fwx+PUR6RTN10NXy
         s6ekzN/PqokdCzEBpW8bpUPvCSAzwCxXOXwjNVxm0QnrruXWbR5yAIfe7gzdiAhk7QJ/
         KjUhtXJwx99T8YKY7q3Q/HO8DA2ABzULFqc0uLNfVd4Rp2vTSLOt0UKmF6fPlnQipX0+
         qLO8Jqv2ZQJX8Ld3xOWbp/o0l0oRpV4CdhPxb9b9IDCsl/0hLN75mLOkUXDdKIPRZsjw
         YrMA==
X-Forwarded-Encrypted: i=1; AJvYcCUFvKA+T056/kMQBQ6AM7Bi2N/k2LDY3iA9B65nK3VXHR9JNmrS+z4aPx6UuWFWem4aXwJTOTUTEzHEAlDxmBpPcJCJoN0KH2kkYTQOx/I=
X-Gm-Message-State: AOJu0Ywpbb9eoVqOCHMgz4DBfSTFn6y9sV3DRo4XYSkM/o3HGpvqsKT3
	rsQD8JWf/AVb+yMhYI1Lid3s8ExUBnaGs84wxBVOrdwh+cV6ZxWX2axngEvQ2g==
X-Google-Smtp-Source: AGHT+IGyFF3qGNtyaKkVMN/MtRe5w7OR4YqzzMnBBooAW4vj67OlMSZGS6IEVW/40VzFaRNxcmf1WA==
X-Received: by 2002:a17:907:9718:b0:a72:6375:5fc4 with SMTP id a640c23a62f3a-a7d3ffc17b7mr599057166b.11.1722265296125;
        Mon, 29 Jul 2024 08:01:36 -0700 (PDT)
Message-ID: <d313bf2f-a5af-4cd4-b9a4-5ad321c59519@suse.com>
Date: Mon, 29 Jul 2024 17:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240729142421.137283-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 16:24, Stewart Hildebrand wrote:
> RFC: Should we put this under its own config option instead of reusing
>      CONFIG_DEBUG?

I'd say yes, with it merely defaulting to DEBUG. And then have this in
generic code rather than ...

> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access
>  CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
>  CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
>  $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
> +CFLAGS-$(CONFIG_DEBUG) += -finstrument-functions

... here, with arches simply indicating whether the Kconfig is usable
(i.e. arch code had been suitably enabled).

Jan

