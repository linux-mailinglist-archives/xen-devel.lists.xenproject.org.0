Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D92FA687A8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 10:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920131.1324389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupWX-0002BV-3c; Wed, 19 Mar 2025 09:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920131.1324389; Wed, 19 Mar 2025 09:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupWX-00028N-0K; Wed, 19 Mar 2025 09:15:41 +0000
Received: by outflank-mailman (input) for mailman id 920131;
 Wed, 19 Mar 2025 09:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tupWV-00028H-Nx
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 09:15:39 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6b815ad-04a2-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 10:15:34 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so31325095e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 02:15:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df3506sm21036790f8f.11.2025.03.19.02.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 02:15:33 -0700 (PDT)
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
X-Inumbo-ID: b6b815ad-04a2-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742375734; x=1742980534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ+cjqpkJxs2A9nPaMIbDVk3QAEvewazzx/qumjYqwo=;
        b=VMv2h/Jl9HmsgLu9qKl6k9kMhF2IGjxov/9ugT9LDty9EPMf+cA+TrwN9OCS7tKYia
         ad8TgBjFqkk6CPhF3RTm1x5YtXzPGl0ITUy5VcdalzKaTcvzZBHO66Yl1APT3f9HYoBR
         kn9UrjuwWjpMH62QBqYjDFn7okNDYGD3211GTJC38Vb/Bc3NpfX8bb3738+JqBQ/as1+
         mKoorPF9nJTUeU5KhAnIy7lHQEZ0yN6kNEOet1+5vnJuog68ARbh/VXj93r71TltkS5U
         LjLmLo1kpiGZhMcwprxYn1293ZHSC8+Z4/mxpUBUB4ivdz2FU3oiuh8hNACW2+8/Ncdr
         r8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375734; x=1742980534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ+cjqpkJxs2A9nPaMIbDVk3QAEvewazzx/qumjYqwo=;
        b=NTo83+jMJ6YL/ulzXtKFQhIzvtDsgBARgtXc1BLO+kGvCo33VwA6j+ScXTnml3PoUE
         MVtnmhfAlMX4QJ5cX5KxOpErev2dxtBAyxVY3Ds7KmXC+h00j7GFhqT02qo1D+XL4CEX
         zNWBZ9nM+D/ME5yjx97kUcvBC+5v31vzmTpgtlmsxWI+NneuX0mnoFbgcNvNJES/l2T0
         go9HQVSCOP9zpZJlk9gP5SOWscfGZ0Lwba8U0vwgwFvATgBDeQQMvFI/k2sarLS4KhJm
         1fiUoUIrW+x+ffJfkOJZYCKw2PhW1sqiQWTfntfpuNEK+peCpxOdCa0mC5c97u2QBxly
         g5kg==
X-Forwarded-Encrypted: i=1; AJvYcCXOlBBnX1QpNq72Ise+Sp9defxS6gh9rg8G6ZuDF8EFYfVKN+8W+kan/CG2WC/DWSYJljDMmmIyEeE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxnmEgGTnN0X4rZUpkw/8qKBDiHRSnBhrmKzKKhoeGnjf2tVCB
	2AxClh+jHUTqIWUCgfVh9iOWL7UTpqx+GqIWAHaX1+EhetIUfGO3+VZV1jCeIA==
X-Gm-Gg: ASbGncvHTOedUwenF/mmfljS7LtGsnYJh935h+yH8MLbeAiLiTTboidpL5qnuD9y/Q5
	PYKu4Ssg8ZqxMPvPPGLHUHlVAIZy9s1fSB4wDJocYG1DMORLIt52yzu5PY4oSCuBzycunbg2lJY
	FEp+OoCW+s1jzQ+rZeKo79abE66M72A+h/iBucZ3Wr3fItfgh4Dk2XTlNC/UJEB31GGg6TTS/fK
	AiGavOZoMUe749kj8mtXISqOMKgLkgcNHO08ydCE3rZv0Uk3WX9fhAuvdUZcISDBiyI6u4NVTKz
	0aUAfAJdxWY6JuzYIkHYgrA2jWJjROeNrQHNvtmIhzhMKjCFYQ5FwKZ83hhyydt6ht1fIepoTAG
	vguvaNEEntXE0rGm4BRuorPtXk3deMA==
X-Google-Smtp-Source: AGHT+IFN17ZGGdT/cFwlTozS60HWpBgAzP6MwZrbuBAqLe41XpFhaBVO1FWtVpJ+Sm9QXf1kMSgLDQ==
X-Received: by 2002:a05:600c:3d96:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43d4378616fmr12864155e9.1.1742375734094;
        Wed, 19 Mar 2025 02:15:34 -0700 (PDT)
Message-ID: <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
Date: Wed, 19 Mar 2025 10:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 18:01, Marek Marczykowski-Górecki wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
>  CFLAGS += -Wa,--strip-local-absolute
>  endif
>  
> +$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)

This is lacking a comma:

$(call cc-option-add,CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)

Makes me wonder whether you tested this after wrapping in cc-option-add.

Jan

