Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088028858DE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 13:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696374.1087260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnHG6-00079i-0j; Thu, 21 Mar 2024 12:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696374.1087260; Thu, 21 Mar 2024 12:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnHG5-00076f-Tq; Thu, 21 Mar 2024 12:10:57 +0000
Received: by outflank-mailman (input) for mailman id 696374;
 Thu, 21 Mar 2024 12:10:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnHG4-00076Q-53
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 12:10:56 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10d435fb-e77c-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 13:10:54 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4715d4c2cbso58111066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 05:10:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a46647b6496sm8399681ejb.155.2024.03.21.05.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 05:10:53 -0700 (PDT)
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
X-Inumbo-ID: 10d435fb-e77c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711023053; x=1711627853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO9k/htEkRMqn/gfxjgK3aNYoKETEQEK/Fl7s4Vm5ws=;
        b=IthY04j0ZcrynIQY41OS8kQA0c/2GHYHsyqpx72DkF8Ms0aeSbbD8iq6TDa9ZSF31r
         3liCb/7PTySdXd5yi9BDVFaNCju4vIEwftZ4RXFpuwDUExU5Ikv233AcXflUSrhTMvfl
         ZujK9NLpe63anrZV53g1lwe6KMzW4SWWU2oflZWcmZCRrTjSq+kCJz50XE4qKWoUnc1W
         iTlLiXcALaeKTowPpsVSqhD46Ud4Zq+5Sk/XxQvLYBTcBFY6NqBOLeg9VEwVY/EgY0aP
         h+kA5MuPqK9xZhrd1DxVOC5L6Xt6nCytocCkvPqCHEnAZS4p2zgJf01MpoFgqDOTvayR
         aaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711023053; x=1711627853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XO9k/htEkRMqn/gfxjgK3aNYoKETEQEK/Fl7s4Vm5ws=;
        b=EX+LkHsfWdOJpqaCwdqRkqbp7Hg7/AHh2fGqV+jbZWpJwfeUPfafHQch7Dv/CqSMd8
         rF3gMAU1lDFCRh1EQuRUIznRgbVs0mrUoASWQMpkeufHeFCkJ8HsDuIl2PaJLRSuMsvV
         H7Kb7xHxEm9iQ5J+phd8S0ZW57sKVr6aEEAWQjcroZjkMcWcpC4PpBllylAiNjyqFZXL
         4aPkkqdk+E1LGuhIw1pdmDAs/xSz9BTnbcdAr94sWsclhXOnrvrOUy3/J1mMizjDqlkf
         xPoSMtDBuHEwiFAjJPDHil7PkuBS+RJG208OiVxlWspvsEyuj4dzueBUAFDmHLwe+2YK
         BWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVILik1zwbaBrM8GdklhQK7mdecM5Ep8FZ5rtRWFUNLA07VKrbMNbfLKbfARddd0Dkc3f96XY7YZ9khdbFT7TFBpNq55c/ARyrg6cmR88=
X-Gm-Message-State: AOJu0YzmaRtFOieuUUkYevQfJb82NV7oecVAdDzxpCAZedBA2m33wqfI
	Xj33Aoqhy8MW21hvACdFFAd9lG9ri/On/4q0H2gO6/gkQ1087gkORnBx5a9qOA==
X-Google-Smtp-Source: AGHT+IHz+gxleuGA1bMk/ILOUZ4m4koPgH5hSk8CX9Fcw/msQb6Y13nt8hYNoNsE1RNdBH6gRHqjLw==
X-Received: by 2002:a17:907:86a5:b0:a46:967b:7c94 with SMTP id qa37-20020a17090786a500b00a46967b7c94mr14371351ejc.18.1711023053670;
        Thu, 21 Mar 2024 05:10:53 -0700 (PDT)
Message-ID: <c0abc6ed-c6b0-4591-8f6a-24c750b77fc1@suse.com>
Date: Thu, 21 Mar 2024 13:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: add comment about external console lock
 helper
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240321110503.72916-1-roger.pau@citrix.com>
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
In-Reply-To: <20240321110503.72916-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 12:05, Roger Pau Monne wrote:
> The current console_lock_recursive_irqsave() implementation is not speculation
> safe, however it's only used to prevent interleaved output.  Note this in the
> function declaration in order for callers to be aware of the limitation.
> 
> No functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



