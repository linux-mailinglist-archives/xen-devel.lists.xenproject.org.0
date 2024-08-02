Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95E945CE6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 13:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770998.1181579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqAg-0006vg-TR; Fri, 02 Aug 2024 11:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770998.1181579; Fri, 02 Aug 2024 11:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqAg-0006tU-Q5; Fri, 02 Aug 2024 11:10:06 +0000
Received: by outflank-mailman (input) for mailman id 770998;
 Fri, 02 Aug 2024 11:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZqAf-0006kJ-Il
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 11:10:05 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c42640fd-50bf-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 13:10:03 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52efbc57456so7964363e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 04:10:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83a152e41sm968711a12.47.2024.08.02.04.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 04:10:02 -0700 (PDT)
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
X-Inumbo-ID: c42640fd-50bf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722597003; x=1723201803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VQVTKoyS6NDUODlV2oYjuCieTKBHODztz3IrYmLdUMc=;
        b=NgFII3UqPJ2xrL47m+WBm11O+qHziAwW5YWMF9bs6sQ9nTzvid10kq/s9rkpZBZ7QT
         x6Z18OHejN6uMRkVcDM9IQA/uAMVva7F9Z6yE9hJr7zkHojjOs656HBCuf7c2sFXY0oG
         H5j+EMREnHlDYn7iGbXcm2Spe8NMhxmLo5Lv377gkdkD2VisCczXEc7V7Su6q1vgyDQB
         XgFUhBrGemM3mM63M8Gyi43VvQ+Ty7yLgscmQfYnsh857bMNNp/1DNWa+UHK4IVgh4KF
         yAgMTwtiQML0jFGddB3ea06P7xMt7V3v2EfDidYoY+5x8QOQCX0cwz2CfvhvE1sqRxdD
         ME2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597003; x=1723201803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQVTKoyS6NDUODlV2oYjuCieTKBHODztz3IrYmLdUMc=;
        b=BVtLbBZhQTFVr/m0rl2vkCVY7Yoj6ndZLk7Dy/B/yg0dNAn4lhhuaWNdejkzCvdrx2
         W3I19lQIzHGg+plySLr93E1ZIxZGpRrbWN6eRvW2TBHktsj9RS1DNhnCg9BtCAfL28+W
         g8j2AIH8U7hOznDXuADobZz412aISLnQ36w3sIZNr8+Py+99+r8DdoY54HKQSDhDNjop
         v70Rdznvw44yXomSnPpDUH+vcVKo2TlVhs2SogqY7vdeGtDScPrLIyx8dhpiFqyecZPS
         IMnRQKQVRQF3uQFQs/4XboJob6EtxN5tgghPTU3Z7GA4Nwyxzd1tuMSO75NhoWl57ulD
         qK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVNmmVXF13d6yNTrW1VOJjF50UTnt13WH9TTwURm3Zu9kPL0Sw0HXvBkPBDWxTP2j24EF4xDnZes2HUIRX7QHUv1Y/j8SXGKw9yNySM48=
X-Gm-Message-State: AOJu0YwrwNbd3JL4VVvufVvJPV4IoyALU7OTaB+ECkSwsgaRMHQwQC3N
	vWk1FuzgEEHsLmnlRzWbciIRRBF2ozTggT9CV7wLROMHLFGEtv/Z+ypTqZwaSQ==
X-Google-Smtp-Source: AGHT+IHlyvBwRwMVhXponBmYBkh+X9Sp1H8HkMTR7Ul9m7+U/Wh6UAH+JChmzr+G8vPGeSEn3umSBQ==
X-Received: by 2002:a05:6512:3e06:b0:52e:9a91:bba3 with SMTP id 2adb3069b0e04-530bb36ba51mr2065994e87.15.1722597002496;
        Fri, 02 Aug 2024 04:10:02 -0700 (PDT)
Message-ID: <fc8de47e-1b67-4dad-a01a-714fe0005de0@suse.com>
Date: Fri, 2 Aug 2024 13:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 09/13] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <c2961c8b67041883ce5a5f6d0511a31dc7fbe22d.1722333634.git.Sergiy_Kibrik@epam.com>
 <cc92ed50-89f7-48c9-b0e1-cd61a020001c@suse.com>
 <ccd77283-4b88-4351-a3f9-bd4240b9b845@epam.com>
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
In-Reply-To: <ccd77283-4b88-4351-a3f9-bd4240b9b845@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 12:53, Sergiy Kibrik wrote:
> 31.07.24 15:23, Jan Beulich:
>> On 30.07.2024 12:33, Sergiy Kibrik wrote:
>>> There're several places in common code, outside of arch/x86/hvm/vmx,
>>> where cpu_has_vmx_* get accessed without checking whether VMX supported first.
>>> These macros rely on global variables defined in vmx code, so when VMX support
>>> is disabled accesses to these variables turn into build failures.
>>>
>>> To overcome these failures, build-time check is done before accessing global
>>> variables, so that DCE would remove these variables.
>>>
>>> Signed-off-by: Sergiy Kibrik<Sergiy_Kibrik@epam.com>
>>> Acked-by: Paul Durrant<paul@xen.org>
>>> CC: Andrew Cooper<andrew.cooper3@citrix.com>
>>> CC: Jan Beulich<jbeulich@suse.com>
>>> ---
>>> changes in v5:
>>>   - change kconfig option name VMX -> INTEL_VMX
>>>   - do not change .c files, only modify macros in vmcs.h
>> Better, yet still not going far enough, as indicated earlier:
> 
> I must've misunderstood your earlier suggestion. Are we talking about 
> modifying all of cpu_has_vmx_* macros -- even though most of them used 
> internally to VMX code and don't cause any trouble in common code?

Yes. Where exactly they're used can change any moment (in principle at
least).

Jan

