Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929DF8B1AE2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 08:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711823.1112085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsVR-0008U1-T8; Thu, 25 Apr 2024 06:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711823.1112085; Thu, 25 Apr 2024 06:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsVR-0008Qs-Pf; Thu, 25 Apr 2024 06:22:53 +0000
Received: by outflank-mailman (input) for mailman id 711823;
 Thu, 25 Apr 2024 06:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzsVQ-0008Qk-Sj
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 06:22:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e85b731-02cc-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 08:22:52 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-346b146199eso474561f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 23:22:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b0033e9d9f891csm19124952wrb.58.2024.04.24.23.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 23:22:51 -0700 (PDT)
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
X-Inumbo-ID: 3e85b731-02cc-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714026171; x=1714630971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKBSd4Fg6gvUBt2JXRcCqdhlAfIUjPkKS4D9u8dHlvI=;
        b=FTBnkiWarUBDjrdOv/eEYlaCJKWcEVcHsyZUrUjcDDnbtzM/arXExfVQ6cWiE2ZTu1
         fq385kKqHrEbGfiTAR4ycE+3Z0Gq9LsIQFGAL4aCvwGdQnoC5Cq9poTP8HVL0z2Hb0Mo
         HBSsAEiEDXcc1uZH4orx8wUpgGVKoiGlep+ikIvsxi41eLXY6DsNOZynPu1V3n/Ikr4k
         RWdF2s2htkvXhGRG0GBPKsjzzqiqpZs4gBQGVbXrAY01xlfrTbD7L9ozu/jNg5hD9dKN
         lrlaAlER+KfBpRwDy3r2Vhmw/sGr/ZkQFhwIcUfb4I5KpT7JVIFyVPkAXK/8lKRiI+ib
         mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714026171; x=1714630971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKBSd4Fg6gvUBt2JXRcCqdhlAfIUjPkKS4D9u8dHlvI=;
        b=Rr3hWQQtQFYsFQYuzrGX7yrNo8gHruYTIRMeGy1Osne1ZZjgSJCA45heyIlPHu4R6s
         dB+zOvE9KiT7/9zDAODzq3nRiR1dOuxdJFwADg+8S+8iebuVV8HW1OaXojkr5y42844Y
         9TIWZoerLy6ghCz9PQXP8LNLoA143IygL5YQckESfrjw2MzsmvBDwcQPjzebFNq841UK
         CzNYr02EVLIPV8ieYLt3R041QTsn7RSCJ0EoEBpK4STQ5HLxJImPWqLno5vpG/l/K8ch
         /wSlU+UnzXLLCDMCoGNOKL6fOZjh1W/Z1o6KKk2jW58nAEWBmmZ0opnjHtpnbbM9MkJd
         SjTA==
X-Forwarded-Encrypted: i=1; AJvYcCVu5Cv8+tjGzznvpJEqC43j1LIaMfA7RLlD5ijKMNRe89N5M6eSwDA3VadNhF8OxDYxX+33x0BssFRkggx4FJgIrI6bUpK44HJZ0+GgQE8=
X-Gm-Message-State: AOJu0YxarpDQr8HsGZr3S8DRHJmA/6c63yymN2M4Zn2VR7OUd7Zd6Jt6
	7/I04f2P1Up5oUMZ7zsJSSFmpvFM++E66m2yNRJWPrRTZ+4nvIeKGs7XeUIojw==
X-Google-Smtp-Source: AGHT+IETDdyj/IJXoWiZVf9D5OEzRZlsfcqf68N92WJN+c6mKFKLj4HfPVAHjabvbq2C4e9xjRtUKA==
X-Received: by 2002:a5d:4dcf:0:b0:346:d2c0:7682 with SMTP id f15-20020a5d4dcf000000b00346d2c07682mr3025718wru.30.1714026171340;
        Wed, 24 Apr 2024 23:22:51 -0700 (PDT)
Message-ID: <d8c25ff5-213e-42ae-9040-d91840d4ad72@suse.com>
Date: Thu, 25 Apr 2024 08:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/hap: Refactor boolean field assignments
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w.benny@outlook.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713990376.git.w1benny@gmail.com>
 <8203e5e06e326ad320878439e5342f7f1acc685d.1713990376.git.w1benny@gmail.com>
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
In-Reply-To: <8203e5e06e326ad320878439e5342f7f1acc685d.1713990376.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 22:42, Petr Beneš wrote:
> From: Petr Beneš <w.benny@outlook.com>
> 
> No functional change.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



