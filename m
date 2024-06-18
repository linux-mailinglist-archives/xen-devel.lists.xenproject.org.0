Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF7690C5E8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742952.1149841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVmD-0000nF-Lx; Tue, 18 Jun 2024 10:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742952.1149841; Tue, 18 Jun 2024 10:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVmD-0000kU-ID; Tue, 18 Jun 2024 10:09:21 +0000
Received: by outflank-mailman (input) for mailman id 742952;
 Tue, 18 Jun 2024 10:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJVmC-0000kJ-NE
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 10:09:20 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d318c4d2-2d5a-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 12:09:18 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00b97so4077101a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 03:09:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db61a3sm599205466b.85.2024.06.18.03.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 03:09:17 -0700 (PDT)
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
X-Inumbo-ID: d318c4d2-2d5a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718705358; x=1719310158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/po8wEE6YUYLe87jzJ8jnbUrBoqdLLA+3OtQ8amLD9Y=;
        b=drKX0aL9DKtQsYIT3UmgSunCmg8ZjD5Cv5Ihze6JJsGSLdqQXtkNWQHIU5DpNLTWxm
         re6yYtcaMYQqIuzCrKyo4ZMN6Pv86iPknkNB6ZTBiP6WBA7x94ZPTUQRkGQAR+wCqikJ
         V/kKFAnTx7oox9/2GwVxk02XrZaYHHoCdMh/qT7YZsyCaTbJzdhU7KvZRybjk1erDeDi
         Gbng1VSxkUyUkbWSPUCzKllTvBT1fXL0ZqlJ0Ob4gO7x5rrG4umhH03bvKmxxf4zBPf+
         AZaeOeUC2MSh/tej8GcECtqpuBzaihukhzeE6UPaTiJZlR8J9M2+ST4hk9cWw+WejfYf
         Yqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705358; x=1719310158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/po8wEE6YUYLe87jzJ8jnbUrBoqdLLA+3OtQ8amLD9Y=;
        b=MRU9AAiinUMJTNCVEf6M7DgEngLiAh7bJ4/Z5zvZ87wwTIhQce4Gl30r9TrZPnKo32
         +dvjuf2eBZ3aoYuItJ0IqzP5rsjPzLLG7WBYIBG3u7oGaEQ5HLRLlCB2cC9lAkqTOomV
         XiGyg6IWCruR393Qt0WKErEo1W8DIS5HEE0MlYvsUR0/gjnBVRWECw5eilMlQYj4N7ot
         8X9MZBYLZqYEMN14RjD1vyM2taJNTSbDVCCPCYh4iJFpTTwgUm0AQPMN3qyKv+LwCtO/
         Yi99MJmKnERZRq+iuUict4fPo26jbL4N2fH8bPiHcGgxuQgDIsIXzTj25adXGA+vYgkX
         byNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Hzs5/kMgMNi7akB/mSMUyX8IbKuyCg3ry91r+LwiCmgqWqZR+BmhUus5cHbIkD5Y/OIxBIZ8+DbPWWRI1zGDpPcmoh6/Tud/BasdS0M=
X-Gm-Message-State: AOJu0YyOQUbwc5AKrdpomWQv66X8gdujrfNPDVfSftNBOMckba16N0U9
	AzGELQS7HM1tSXMWOztFbVWVqcNb9NHMsQFMFIh1d7nN7nXRh1mCDmXfv91iziA1t1jRfhXdxcQ
	=
X-Google-Smtp-Source: AGHT+IGLl9tZMK/x7+Px3RA8WsGFEHIGZ3NkHoxybOxs0UbfCLse4TMCiqwg8VNzjTnBidpSA4ppeA==
X-Received: by 2002:a17:906:f2da:b0:a6f:5562:167 with SMTP id a640c23a62f3a-a6f60d42710mr776464666b.38.1718705357939;
        Tue, 18 Jun 2024 03:09:17 -0700 (PDT)
Message-ID: <63d11da5-4a5a-4354-ab57-67fbb7110f45@suse.com>
Date: Tue, 18 Jun 2024 12:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair_analysis: deviate common/unlzo.c for
 MISRA Rule 7.3
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20342a68627d5fe7c85c50f64e9300e9a587974b.1718704260.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <20342a68627d5fe7c85c50f64e9300e9a587974b.1718704260.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2024 11:54, Alessandro Zucchelli wrote:
> The file contains violations of Rule 7.3 which states as following: The
> lowercase character `l' shall not be used in a literal suffix.
> 
> This file defines a non-compliant constant used in a macro expanded in a
> non-excluded file, so this deviation is needed in order to avoid
> a spurious violation involving both files.

Imo it would be nice to be specific in such cases: Which constant? And
which macro expanded in which file?

Jan

