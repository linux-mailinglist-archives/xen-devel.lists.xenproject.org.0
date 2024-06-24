Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A066E91517B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:10:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746730.1153874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlKJ-0004Hp-Q6; Mon, 24 Jun 2024 15:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746730.1153874; Mon, 24 Jun 2024 15:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlKJ-0004GL-Mo; Mon, 24 Jun 2024 15:09:51 +0000
Received: by outflank-mailman (input) for mailman id 746730;
 Mon, 24 Jun 2024 15:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlKI-0004Fz-8z
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:09:50 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccb8cce9-323b-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 17:09:49 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso47831471fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:09:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70663a7974fsm4756422b3a.133.2024.06.24.08.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:09:48 -0700 (PDT)
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
X-Inumbo-ID: ccb8cce9-323b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719241789; x=1719846589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GUhmYKvgkD89e1fWh/3reK688Z1jgxOIAvlXsPexvf0=;
        b=Oyi1D3qS2euqrp1mKxJ+z7HTq086J4aSbv0t1uQ04yA6awgoLavqCfAYRUj2iHGno1
         elSSIWhoubQQeXdD+e8UM05yS9WOWhAMDcKLuugtgI2gl/E/VKGo7UEV5bpQpR5fg57E
         TBPvkC9/WgmpU+8PDviWEzlMS5WIDOJuNnqXw6Jc8Ai3EW9tyaqup9d+T4KJ5g7wr3dv
         mZ7ivNDLIerJ19ZalGaZ3FHrVSJhU5BT5HirKSxMNXbpsm++P3LARhPyNzTMshUh7JKq
         rL8qUTvy4PDL/C/wmzOfah1DeVPbS6rFNej/igdT3wwo5fPuG46wuRzx7q6QTWHaQ7G0
         9a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719241789; x=1719846589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUhmYKvgkD89e1fWh/3reK688Z1jgxOIAvlXsPexvf0=;
        b=tj7KTKmLttUmSMSicwO21qR0Qtkb6XV7R/Ck/Gx1UI6dMOlbrsz6Kc8xHYylAOEX71
         mG4kLrHO/J48z84n//UeS+XfmcwvVa1ruydRMENQYWYoyTIkUQiGlqaeLnfos3gmKP7T
         O1bARby7vaSa+To9vHvf54/+ruyD+49VJaOOQebEFT5JDMYoUvO22qnss9tZJJHFXpQG
         CMQ0EAAa2bkxwnaTqYy2oQE9g6eQFEMl9Z5nQ7qcnpKr9pG4uYefiw/8mmdCdITg643v
         7HVbtlrysnJv5XYQucaquwjmCgOvwNpYKMZoUCPhBl3yHI7q5rPF1VsTdqaQmkMTjeOe
         2+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWWmUgiHEsFdYvdjHiLj2QTE1uUj/g9hgAkrSxXKwVfIKk27N35lSPOqPXx0chUVQpxVzqhAdz7xf0gnq5SUT9jLGcX4w8TklsQv/YcnBo=
X-Gm-Message-State: AOJu0Yz2D7zS5XrfDqy5t6F3hg+a1hfJhEcbIF7nWixex4XlmhxFwbaj
	5dTF7xW6CTMxJpEhJHIZKu+nsMc7/L7Zja8QJYrM2Xj8+bg+BAih9bb0r4EsuA==
X-Google-Smtp-Source: AGHT+IEx+Ta2MuxM85ACa47QeQwamSSbcCZP/Ynq2Y6otJ5Krpe+cR6YSff0VqlChrdWDpTDmc4vvg==
X-Received: by 2002:a2e:9e09:0:b0:2ec:528:6a16 with SMTP id 38308e7fff4ca-2ec59401878mr31659761fa.24.1719241788661;
        Mon, 24 Jun 2024 08:09:48 -0700 (PDT)
Message-ID: <0dcc3162-dd67-4fbf-9bb3-8e0d66e96b8b@suse.com>
Date: Mon, 24 Jun 2024 17:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 03/13] x86/domctl: address a violation of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <d46b484c99f858d7bfd10c6956a88ba46ac60815.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <d46b484c99f858d7bfd10c6956a88ba46ac60815.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> Add missing break statement to address a violation of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



