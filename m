Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA838973A9A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795758.1205243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2EI-0002Jz-0i; Tue, 10 Sep 2024 14:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795758.1205243; Tue, 10 Sep 2024 14:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2EH-0002IQ-TT; Tue, 10 Sep 2024 14:52:29 +0000
Received: by outflank-mailman (input) for mailman id 795758;
 Tue, 10 Sep 2024 14:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so2EG-0002I6-I9
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:52:28 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b8a6f38-6f84-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:52:26 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42cbface8d6so11724115e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:52:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf6a88sm487533766b.182.2024.09.10.07.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:52:25 -0700 (PDT)
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
X-Inumbo-ID: 4b8a6f38-6f84-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979946; x=1726584746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CnSkeptj05D9Sz4fhtAJdyYofegUAFpyI1beArrS6tM=;
        b=EvB0D/EA/KJUBrj0e7VItx219anRZnpNCvQxh2vX3MeuNo6skHZRXWG4l+KIYbeEUn
         stx0yP7EtFPreDs4XUMovDlCGlLUFkLLaRYyjzEBeXgH+5l37nh8DMnh6RnFxt1oZg8k
         wCAfEUrueNxw2lxuj4jd6FbdotZimgPqfghoElozXdZNpeZ1CfrPbtJbqYM96E1WADnq
         ywx18DBWDeVI3A3SU9DLgKCuIu/4yPM0GYeAmbAUt37pU4gFMcWDS2dElWSx8VVouEN3
         30riujyqAQ8F6sHZyRm1D5xO3zpCMGkiGCsTG3Rk3oh8a3VSbT00WwPTt2VecbIPtRAM
         /6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979946; x=1726584746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnSkeptj05D9Sz4fhtAJdyYofegUAFpyI1beArrS6tM=;
        b=v5sNtm35NTvNdsZMezf+jnBFvxizmuo7zyPwBeO/7okdyNNx1YKF+GqzrvoHNL3uLN
         G9MT82860tspuX2Xf7HnenofnX8KSRqSwXEcD+VA+KEpw0yP/onnyeIbu/ztzGMwqt5G
         xrJbhJkTNfsJ8PHGZ9G3FliZmp7CPL6ES6zoyvS5Ngafz11nIMKE19WdhwHA07EXfLk3
         o/n7DSTx5PLm8fKDtCsLXMqS0ls0ttTXbb0KIxXdwUqJOF4WOaPO65iaVQNZFX12cNbu
         d8orO+P7PRQ8Wb2OIJSAVUOPKooBQru/wH4tNewQDaZdeLUuiGp9mfFfwGZPuST0dXiQ
         pvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoin2cnTgjeg2V88gnhzIQZwn2oBxhwcWVxsdEgYlUh/eqTJv7yMtX9gw0eDwj6KIPW3ZXs7PlnmQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGIydR5NcCmYLMR85zM3Uhd22X01gqm8QSD3n4VfiCi9bk+xeF
	ysqlXjstLXiDurk1xFGhdE+Ujds3nF7LHBivSL60BxH4bGftzB+qqj7+bsI24A==
X-Google-Smtp-Source: AGHT+IESu97wEAc6xOYJjCC7SWIbYX5UV9MSOt7xENmNRJknQvGU5sLCcgLW7e9V09a16XHsfP4C1w==
X-Received: by 2002:adf:f247:0:b0:374:c8b7:63ec with SMTP id ffacd0b85a97d-378922a6c62mr9985863f8f.21.1725979946057;
        Tue, 10 Sep 2024 07:52:26 -0700 (PDT)
Message-ID: <6b5d700c-d38e-44d3-af6d-510f9c646ad7@suse.com>
Date: Tue, 10 Sep 2024 16:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/12] x86/hypercall: address violations of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <ae38faae9ea48c86f001040e854d5e6acbd41d26.1725958416.git.federico.serafini@bugseng.com>
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
In-Reply-To: <ae38faae9ea48c86f001040e854d5e6acbd41d26.1725958416.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:08, Federico Serafini wrote:
> Address violations of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



