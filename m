Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C089578A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 16:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700182.1092901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfWD-0001hZ-FB; Tue, 02 Apr 2024 14:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700182.1092901; Tue, 02 Apr 2024 14:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfWD-0001eG-BG; Tue, 02 Apr 2024 14:53:45 +0000
Received: by outflank-mailman (input) for mailman id 700182;
 Tue, 02 Apr 2024 14:53:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrfWB-0001e6-4t
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 14:53:43 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc15c6e0-f100-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 16:53:42 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4161b7d15c0so5202035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 07:53:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r7-20020adfab47000000b0033e43756d11sm14477935wrc.85.2024.04.02.07.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:53:41 -0700 (PDT)
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
X-Inumbo-ID: cc15c6e0-f100-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712069622; x=1712674422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZ3AkmtJCFCb0vYZlX14FdmIoXjJYTOwkamGysIzNlI=;
        b=AJHlTymkjkHp15YrPsxV8AsPyy6uWhaSS7g6DV/eSlloZaVXYArTHYl+AZBtggOjbd
         /ZKWdNVWcd4dXnwHZR4IB0JEFXwJAoOav4OdD+Mdbigm2YMm12jjqQRJs6ULMCQnimdU
         7lXJe0ygNSkpgi3v45A4+LjeThblM3mntsxsvWHxdJggld2cTyC83lTCnjetFNJHTi78
         ucxTytke1fbXTCG1ytofWcBTyGFCYw2wh0LfHD2B8ylH5NqIeVnXyE83hxinU3t8Q+B0
         e+mIh3vIwc8X+sHQVhwOIA03e6URTNWMCapZJxpw96LB5BtN9qOGqkHALFWx9pe+EUcW
         pLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712069622; x=1712674422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ3AkmtJCFCb0vYZlX14FdmIoXjJYTOwkamGysIzNlI=;
        b=Vrmnt9gyKSFXVU9D4RPfcOqqq0014QvEo/n4Y0BQYraDX7HZv5qAcaahV6nLTO6EvF
         ONWZeaYP6KwuTgT0fden83+W9z+Go/33QEqUx0v+J82UpFy51kY2IJN3nvQWNu0h9aLt
         83agPUWyL7kDvK+IEuxQZvSX9b4bEtPzTQbBsOu2V0CMWJI96B0iKW9ELk0ip+4lp+4F
         yce8njgRhUA1wLzwMoUGkU9+eMWNQeHg64pgdeLu5XSueK5Ejz1PHqWmD+mkvtcw399o
         XbMCiby7KMD0GmImUbcjn+a4RhvlDa21cy8xDpa6hOarBjP35zOioVWtzXBhxyml3oXQ
         uCAw==
X-Forwarded-Encrypted: i=1; AJvYcCUv6oZzfycZ7aDwVvNrK+a3vMavf8mwoWUz+YBdZzXf+lZuHrt7+1sliQlnwcc/UXlZVYx2PPK9qJ18HLmJKhyCkhW3hHLXbL6oKx9XjsQ=
X-Gm-Message-State: AOJu0Yz8Ef6RC484RonjEbozJXt6TYNabaiCrq/LJEvHVyGxcXlD5GaB
	zEqKgomeOgdwn+X3VgfaM+Y2d7HZ4Efq54s6QmO3hArPnxrIKtgdqUie1O8bpA==
X-Google-Smtp-Source: AGHT+IG8aHMl2FHyQdVYGLFQqXVKMyTP7Bi6kHBf6o18hiow6oX6yT0beIaYaNRtYQDIGrh3COCk7Q==
X-Received: by 2002:a05:6000:52:b0:343:826a:7a36 with SMTP id k18-20020a056000005200b00343826a7a36mr109489wrx.58.1712069621840;
        Tue, 02 Apr 2024 07:53:41 -0700 (PDT)
Message-ID: <86a662e6-712f-4eb3-954e-49cbbb968fe9@suse.com>
Date: Tue, 2 Apr 2024 16:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 3/7] x86/vPMU: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
 <b7d750f92da63893e9699e2924eb12d3efa251b2.1711700095.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <b7d750f92da63893e9699e2924eb12d3efa251b2.1711700095.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2024 10:11, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



