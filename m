Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C18B9A6F
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 14:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715780.1117674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VEs-0006W5-AR; Thu, 02 May 2024 12:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715780.1117674; Thu, 02 May 2024 12:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VEs-0006Tj-6p; Thu, 02 May 2024 12:08:38 +0000
Received: by outflank-mailman (input) for mailman id 715780;
 Thu, 02 May 2024 12:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2VEq-0006Td-Nz
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 12:08:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2c7d51f-087c-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 14:08:34 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41dc9f98e8dso4647485e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 05:08:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm1753119wmq.7.2024.05.02.05.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:08:33 -0700 (PDT)
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
X-Inumbo-ID: b2c7d51f-087c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714651714; x=1715256514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zjTR5TfN761Kp62caqIjIcDClfoM4hNzhQzrtOmSxuA=;
        b=PwegUNA2y+0o0lqQV5xjuUjBEtTLuZeCHcb9pfQxgcBqCLGIq8cMsDzDO1WWOJAO9R
         N8DNkq/BrmcAGhjDX1DcnteEtJjoQOMnJcrojZd66RNdcqCsrCMbr8KH2OSLaOeJqNmw
         nQrqVoIxpMWd49FTb1MrwNtRKP6p2vtVYXPfKixJEuV5QxO8lN8RCNXkT9QVXjgaXgfk
         20q1uDZKjGggW+BZpSQBxaOHsS2hz2BhRgK/O1SspZqJlJU8tg7Xf06vfzqu4hqNSkN9
         AMnt2+XAkFZGuvEPnddTeA3PyA/Gmz+4ngTmDwiKTl/3mxhWULfNaqeiAD2rDhuiIlM9
         gSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714651714; x=1715256514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjTR5TfN761Kp62caqIjIcDClfoM4hNzhQzrtOmSxuA=;
        b=o0aeIUhJjW6L9g2hA8ClY470NCyjEcG1AXtBJKGXnocJd37zQ5NelnOcdB4Bbce4gN
         VbbYtmo0irqaBSf8RAbjRTD26+Sqm2uJrdBmL+qph4OCNKbCjBziEtUZZcK2RsDLB92o
         486odUsUcOZa1lQYUV1pnheYIPLPA3jGApnIWLWk33NGidnYswZgM/zqbmxBS0DbeQRO
         G5A83hwQOaEdnd9jjRnOVlR99ShzqOcWV6hKaZQZKOjr3q0td/u79xXhdDthM2+vAGWT
         9wPLRhHkPcsWJXNaYnhrZE0yHDYV7k/iowQXCIUC2MX68Wki8zfauYuL1llBMO9T0zIO
         Vkbw==
X-Forwarded-Encrypted: i=1; AJvYcCVByT+qhmdxWHHSDXH/Bx/H0DRP07or0l3o4DwLWT2e8WSPU8qvsuYmEbCyyYaGuQiGiplCsnOy9rB47QFsJ3yLS63Cc/DWQI4atO79gwU=
X-Gm-Message-State: AOJu0Yzstf0IHQ+wnxA6Wv/zAzwIN5L/haflJUO+IcSPt6E6ubOcb7Wo
	EfhvmXuIJfXlY/RY4AThPgUJfQUDxBuP/vG/S9KMIgVJndhqmu7+eMP4g+llqg==
X-Google-Smtp-Source: AGHT+IFKbwb3ty5b9VYfHFiyV5qEil3AmHHO9dSZekpjWiISW/7ZW5MYY5fNgvY5IfJZzvo+78A/Ig==
X-Received: by 2002:a05:600c:1c83:b0:41a:4623:7ee9 with SMTP id k3-20020a05600c1c8300b0041a46237ee9mr2069310wms.10.1714651714076;
        Thu, 02 May 2024 05:08:34 -0700 (PDT)
Message-ID: <1c4d8a69-9711-4f87-870b-38ec0f62aec1@suse.com>
Date: Thu, 2 May 2024 14:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/hvm: Defer the size calculation in
 hvm_save_cpu_xsave_states()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429182823.1130436-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 20:28, Andrew Cooper wrote:
> HVM_CPU_XSAVE_SIZE() may rewrite %xcr0 twice.  Defer the caluclation it until
> after we've decided to write out an XSAVE record.
> 
> Note in hvm_load_cpu_xsave_states() that there were versions of Xen which
> wrote out a useless XSAVE record.  This sadly limits out ability to tidy up
> the existing infrastructure.  Also leave a note in xstate_ctxt_size() that 0
> still needs tolerating for now.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a nit that there are a few spelling/grammar issues in the text above.

Jan


