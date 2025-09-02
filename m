Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A5B3FAED
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105979.1456786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNXl-0002Zw-33; Tue, 02 Sep 2025 09:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105979.1456786; Tue, 02 Sep 2025 09:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNXk-0002YQ-Vc; Tue, 02 Sep 2025 09:43:12 +0000
Received: by outflank-mailman (input) for mailman id 1105979;
 Tue, 02 Sep 2025 09:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utNXj-0002Xs-Ef
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:43:11 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c53a397-87e1-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 11:43:09 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61e930b27bcso2479691a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:43:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4e5229sm9123380a12.39.2025.09.02.02.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:43:08 -0700 (PDT)
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
X-Inumbo-ID: 3c53a397-87e1-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756806189; x=1757410989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m3fV4yIS9C9DVX/71GkHfa70EEstn3BwvJUSc5TN/nA=;
        b=OsJqd/DWy0LmIV5fvchb/DXWUICLc78TY+W19s1ox+fFi1awcA6aXnDPaw0+ilCLx9
         /PHFGO7hrwxO3dvaY/aPQOyk9dKa7xIbw5RdA+8PmVuFy8mjn59MDGoB9+9eqE+wrDGj
         7PJNvfREKIBFFmhPXmu/TV82kYJUV8wr7985tLvfsOEMUrtuJbiBDo1G5UFJLrpR3YWY
         GQs2o5BUt3+7Qnw9nWV/+J648gIfAyyQNZ00zhKKql17+xexlXOAbrpfHwupDmiDv5S7
         IN3hwG/0Q6wtBKvMwsAelRcI2vpa+aIJCnFbCl3NJVjeahE143B+G8Zqj0p9mCSMNLRo
         R17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806189; x=1757410989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3fV4yIS9C9DVX/71GkHfa70EEstn3BwvJUSc5TN/nA=;
        b=pcUxo4ZTreKng8Ts5vHjtki/I1Bz9zFXVKSENxfktsQj5P2UiH16JvFBh4EmZWHB9U
         lv9QjkEsfgOh1qI4oKL7RndZNlZ/tsAE3bG9pHs8mbs9ppKLTuQ/rbUT8w6cnPersl2o
         qIFc/LfA9hwrfLzkOcoh21AxDayPrqFHlVUjaNFK+7dbkA+cGqqVOdd2R3WZ3kLN9Bv1
         bKNodMpWnUbb63nVBcnoMrylh43OioGe5PFGvOWP1Lq+nzvCeIl4j8BoyzM4XgWacal3
         7VDUbPtyOsfa2iycvio5UIG0Az7qZZJVigUz3AiRroODV0oAr+urRPhTjqLzVUDdXFwG
         ibag==
X-Forwarded-Encrypted: i=1; AJvYcCUXuTyQnW9gege3oZPcjD80WsYVQUWT0cI3m2XvRSOAkDitCLiMs224PjnDlu8TcPXqV9GMDLjZUYo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtTlv6Zdx3AkS5bskCDX5Hkt/nhQZbu5yyFb74oItuA+fa1VLx
	1bYsKwurlvV0dm1Cw1GTK4FtNNmodW0omeEZpGCJ2ya4/TJHfyPJbUFR7P8ZrGS4JA==
X-Gm-Gg: ASbGncvP3kz1a0D7a6IoaSje+K0tScuhLP1iakFbii/+Pq2+Z+D6w0kx2hb3US4m58A
	0VOYC18NOZarXp75YP0C/Y1kIrAq42AsOGcHNlaTzqXAlyy0re972T6Wo56qTPNYe7gEJsAIulU
	XeGHMIbq8f1zMCmyRd5ufmLsF1HWt8twzb2tuXSXJG3tnTc5Nwqi9dpI/WttqWQq193R+kN1NFI
	Y+K4VM2stzAa5THwoWtSrfe4qgaTQjm8wPWX3Zo0s+Z7ygnTHcqgtaCfBwk/1t5optT9kYeNSJ+
	FVefSQ+fM0ezN1HxHE7bwcf+1T9TA0VcMPwmTZkqa1xOO80OuCJ85fEP1oJX3HMsM7Qw79TSISJ
	AS0n3LQSrJLFyGToJkeyNWH/qHiz+uvH4yNIbkwRAOvP6Wf9lBM8ZfntFPsn5SVLUiAl+kJtRIh
	ioPs6aeLg=
X-Google-Smtp-Source: AGHT+IHjv8M9OAyRDGGw+4jLnGYUb70sekq3UdBbMnqccZmXGPfXsgFWywXzseCXlC4A9ISi+FUZIA==
X-Received: by 2002:a05:6402:23d4:b0:61d:24b4:aa6 with SMTP id 4fb4d7f45d1cf-61d26d8512bmr9150548a12.30.1756806189279;
        Tue, 02 Sep 2025 02:43:09 -0700 (PDT)
Message-ID: <bb5adeae-d950-4369-9bc1-f98d1e942477@suse.com>
Date: Tue, 2 Sep 2025 11:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: Fix AMD_SVM and INTEL_VMX dependency
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250902074048.12094-1-michal.orzel@amd.com>
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
In-Reply-To: <20250902074048.12094-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 09:40, Michal Orzel wrote:
> Commit e3ed540f2e9f was meant to make AMD_SVM dependent on AMD and
> INTEL_VMX on INTEL. This dependency was reflected using 'if' next to a
> prompt which is incorrect as it that deals only with the visibility of the
> given Kconfig option. This makes it impossible to e.g. disable INTEL_VMX
> when INTEL is disabled (option is hidden). Fix it while keeping the
> possibility of e.g. enabling INTEL_VMX when INTEL is disabled.
> 
> Fixes: e3ed540f2e9f ("x86/hvm: add HVM-specific Kconfig")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


