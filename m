Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D499432FD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 17:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768902.1179789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZB7N-0007sA-J2; Wed, 31 Jul 2024 15:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768902.1179789; Wed, 31 Jul 2024 15:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZB7N-0007qQ-GP; Wed, 31 Jul 2024 15:19:57 +0000
Received: by outflank-mailman (input) for mailman id 768902;
 Wed, 31 Jul 2024 15:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZB7M-0007qK-1F
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 15:19:56 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 572fe8bb-4f50-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 17:19:55 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so9021789e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 08:19:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb82e7sm780166366b.208.2024.07.31.08.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 08:19:54 -0700 (PDT)
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
X-Inumbo-ID: 572fe8bb-4f50-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722439194; x=1723043994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/1lUWIL+edaBpysgiGZ67saAxLjMFNlM7sI0uabuQZE=;
        b=Vyle27g5Q0dxY17YnrRM9+IusPdqjtaqsWM7T3mwNAfNC9/yVYiWz8Q69FoSlQm518
         kPuH0coQntitHGmCntefg0Qjju6aAlPjDMgNdgW+DeP18mtHeHSpMc+b6lARdYuzcuyl
         jiWEM2IK0Qqiwq6NcQHN3axGh92e2o9AYyhkoArJC3vsUIv6s1BoLvr+RoT67brdbh+t
         HEmbF6AqdwIRMWeg8Ss1yK2bKEruokv9dfV41Kf9joReWasV8H8gT1P0WoT2/lsL9G6T
         inPNJnyuJ9THOsklsE8ML/Z9kI+DF/44V5bzUtdBd0A3+LtIRodlppgxIBUFGU7yGxgU
         BrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439194; x=1723043994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1lUWIL+edaBpysgiGZ67saAxLjMFNlM7sI0uabuQZE=;
        b=uR/famtgzJ/Co4iAOWEkRM0GmXmXHmbcu07OZ1fftNS+sLQoCgEjcGEzm8PT2sSj0x
         iTDBKj/T1Cu5JMBcB/WruQJ2ou33+Xn5djOwCFzhZr75Y4Gywb1lYVgm7Jh7/jQG/InT
         jvTuw1IOAo0yyfBZKPXJqQWQgPRUzOIq8ay6TxrIqB1YeHyGSez4XS8XHyyAFkQn7uGC
         XgMztdxqCJUZ/YqQmnWSSa3A2fwsqM1DXTfpwxX4iQpzhYkH2GCkSr4L5YIYff7QjBYV
         hA7fgP3CW0I+EZFd6aHwhXtYvPP2t7XbNTFRND7gT2iVAJ8fgpySDZNL4j4pScZg+zqW
         Zq0A==
X-Forwarded-Encrypted: i=1; AJvYcCU+Fz0srnYVvAAW7CF0puenijunCCOjSW63ggbQzFurvbJPUlXscbjwGtcGJbDl5IUFoc60hFCDtS3pKSgVF6kAw3LIKtJAD2Q9OYmCIC0=
X-Gm-Message-State: AOJu0Yyo5I0M5htdtHXnjIUO6MpA0HWGTuUx2cBNUwn31OmRIGs+9ltX
	gxJerTIjtOXp4Lwg2W+Hw+ZMyz+x1gBchDGslApip++wkBWJ5T/KwHmDRIR5Vw==
X-Google-Smtp-Source: AGHT+IGOKk755PdBc4BcYq/N9PHafIjTiVTY9Wg/UUw0FYaIsSfoAH/g+7mJbUj+ktY4I6atSnKSvA==
X-Received: by 2002:a05:6512:1d2:b0:52e:d0f8:2d43 with SMTP id 2adb3069b0e04-5309b27a1demr11437457e87.17.1722439194496;
        Wed, 31 Jul 2024 08:19:54 -0700 (PDT)
Message-ID: <575d4796-deea-45b1-a7a2-94e662408fbf@suse.com>
Date: Wed, 31 Jul 2024 17:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix build issue for bullseye-riscv64 container
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240731150708.122778-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20240731150708.122778-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2024 17:07, Oleksii Kurochko wrote:
> Address compilation error on bullseye-riscv64 container:
>    undefined reference to `guest_physmap_remove_page`
> 
> Since there is no current implementation of `guest_physmap_remove_page()`,
> a stub function has been added.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'll commit this with the description unchanged, just the tags switched
around. But really I think sooner or later I'm simply not going to
comment on patches anymore when you repeat the same patterns over and
over again, despite having been given clear guidelines on how to write
patch descriptions (and there are ample of good examples to pick from
the list).

I'm sorry for the rant, Jan

