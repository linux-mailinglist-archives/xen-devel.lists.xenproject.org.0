Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72495B14F78
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062801.1428538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglZZ-0004VT-1r; Tue, 29 Jul 2025 14:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062801.1428538; Tue, 29 Jul 2025 14:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglZY-0004U2-Uq; Tue, 29 Jul 2025 14:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1062801;
 Tue, 29 Jul 2025 14:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uglZX-0004Tq-Mo
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:44:55 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94b79a9c-6c8a-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 16:44:50 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b791736d12so557374f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 07:44:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640adfe78asm8343294b3a.70.2025.07.29.07.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:44:49 -0700 (PDT)
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
X-Inumbo-ID: 94b79a9c-6c8a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753800290; x=1754405090; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MBD/rnbnoNWDPYNXRSFFGBYXd7pDjK7PBJ4DoHTJgIM=;
        b=eYt41t5KX1yPe/JVW40QZAGfXU709k8uXbzCeF3yed032gl0UwseYMHDbMrftvpfgn
         TqXI+0Tsdd4AbLXXKeWqih93VKsZ6Nl93LlboopD41n4r/gOoWp7ShxMlVY9sdKft1Xo
         PR2ZdKjTS+X+tjUwdF5Gjua245TOzjI/SHz6HmoXpfys713TMkoVJ9WI+kqPaCVdb8E4
         dUhsjAM9ekat6gALoWGfnwH6VxrUwcAJlOCZYylOJH3yZUUieYFKeUfIe5VxeoDA5/rL
         1jAoAoK9VHxcUEYWUMh1DD93MpRZvlxuFGohwKIJmk1eJNkyZdXs7IEuwABH0bI4xMeu
         yAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800290; x=1754405090;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBD/rnbnoNWDPYNXRSFFGBYXd7pDjK7PBJ4DoHTJgIM=;
        b=gTxs4Tdfbw1Equgr1ey3EGL13/xRiA32TaMW0D3Swm12J+imAt5OYTOUs8WHWNDWyz
         yvjEuvXBww4Y9T7rrlwEsFULkDfvUmbCk2Gh1L7MDzkDHkB9qL/PCTHg+9Gnl7gzjQfb
         QpJOCB3A77IWAQ9hX3+pAavr3pPGm3lIQPvxGH9EOOcU9vIKO8BStgvILMYA2VA4bkuG
         nrFAJCeSLMW+TdtqBqYxjG+vFP+iHrpjwuYhWrcD4LQZ7bz3c/R5NH702NTRWb8I/uFz
         Au9yHo4TomU/8WTrarGBmnZAiL3bGtrYkOkQ5O7/rz6pRSLC/IfKrgeCnauAT+Y+RW8s
         vHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/UvLAa+j8Z/zU+x97cJlPdHfg8JmaxWvXfNZSLzwzLK2BqJVp1iJof1LNHCXod0gIOmyFcWkWw5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEaFYvQ1ZoKaX+V5SRjkyfxVFsM1OQ/4SzjOwLaYZnVZTHYL7Y
	4X+RxzFlMQcKrkS92cdFkLm/ptbpZpT/PXFjtgNckTgrpGbrWjYIqlHPihbzh2yTLg==
X-Gm-Gg: ASbGncvinwTaFeZ4GLwRs/1V19f7f05Lj2sfIA4eGhFFz97AhdKzFrj1FWOgDSCk6sX
	7vGFpTYzzJ81DdAlcf/zUgNxJyv15wD7/4m9ibiekhMcR/PsFP6DbZdvTYagVGducE++5qM4fZe
	/CnlLjL8MiplWXc2HdJhdS0Rq+VOusNkVfg+vYwdcaWOvpTFvs6sjPo6JCCDFd7PqncYQvs20UE
	wJP76BnaK1i/Mr6yPiIjZvYbQfuM8ibJHCFvBtTOhoJY+CZhwwWJmVKio/ETEclVUtkBIjIlf3o
	/ekYJO8jxFXnTRjLCzQkKOgM1S0nv7MRYSrwIL9+1btWHLMiHYR/2aUfLzfUsrSG/5TeqsXFNld
	OZGBMqzLFd0X6bWo0tgkvigw0prNOLC5qcXURgJ+v7Q66hhs3w+KKkgKmiSb8T38huM4ItUp5L1
	Sbijm43PU=
X-Google-Smtp-Source: AGHT+IFqiAolpmTIJSmR06W1tRroAtpfu2HaNsWZjAX4dZXcN1mx5EiVqPMPkge3qTHN/xgTFQCY9w==
X-Received: by 2002:a05:6000:2883:b0:3a5:2e9c:edb with SMTP id ffacd0b85a97d-3b77668d454mr12995027f8f.47.1753800289958;
        Tue, 29 Jul 2025 07:44:49 -0700 (PDT)
Message-ID: <d59dc52b-257c-4b41-a6e8-4f56955d6ed2@suse.com>
Date: Tue, 29 Jul 2025 16:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: drop size parameter from sort()'s swap callback
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
 <94ca0714-ee52-4d6c-ba4d-717594e83179@citrix.com>
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
In-Reply-To: <94ca0714-ee52-4d6c-ba4d-717594e83179@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 16:29, Andrew Cooper wrote:
> On 29/07/2025 3:26 pm, Jan Beulich wrote:
>> This was needed only for generic_swap(), which disappeared in
>> 8cb0341a61fa ("xen/sort: Switch to an extern inline implementation").
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Oh, nice.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> I'd expect there to be no change in generated code here, as everything
> gets inlined.

Not really, no. With the change in place, both gcc7 and gcc14 consider the
inlining of swap_ex() (in x86'es extable.c) as less beneficial, and hence
(like cmp_ex()) an out-of-line function appears, while overall code size
reduces. I expect that's because inlining decisions are taken based on
some intermediate internal representation rather than based on the code
that would ultimately be generated. And that intermediate internal
representation now changes, resulting in less of a win by doing the
inlining.

Jan

