Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49238A85654
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946836.1344602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Yk-0005IF-SE; Fri, 11 Apr 2025 08:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946836.1344602; Fri, 11 Apr 2025 08:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Yk-0005Fh-P1; Fri, 11 Apr 2025 08:16:22 +0000
Received: by outflank-mailman (input) for mailman id 946836;
 Fri, 11 Apr 2025 08:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u39Yj-00056O-HR
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 08:16:21 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5bddc9-16ad-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 10:16:19 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso17997355e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 01:16:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c824bsm75708535e9.24.2025.04.11.01.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 01:16:18 -0700 (PDT)
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
X-Inumbo-ID: 3f5bddc9-16ad-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744359379; x=1744964179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4fRZ7QfsMr17EG/vuJ/EwZlyZHa0zUFcl/IsUD8t/8g=;
        b=dFAKTlpR8PoQL1Vv3+JsJDaJn1ZVdfhrxm8SuKO8uxld5LJvbIWIEW6Nf8wcFSdFfF
         bKtQqZI+4p8N9wGyXizRFKxtW1aNM73EtfRiuRhyheDuS65m1P6R4s6Ye1oftO4PJDgI
         +/wA0twaQPqZlVtmrwNyiwS9RW9lrM3bLG+cLM4MQ5TiSW/gls1udCK0q6RD0+OKLnDu
         PtAw+KLwXy4esQnR8nWcK39H73gE9a1NZhAaruUvHcpyT/FgCa3miituO2Ut0RMli6Wb
         lRUQR1/fKSbpAZaE20q6+vkYg6WOeuVh+6q8UDp4HdpyoyPhmloUNg9nOXIlQAHjDVjc
         Aifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359379; x=1744964179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fRZ7QfsMr17EG/vuJ/EwZlyZHa0zUFcl/IsUD8t/8g=;
        b=W9uN/6W4TcHAsVcTo3tBbD4tPBlsc0U83eSEbZNE5cRHFOo/AlI8KIZqoWLoFil/xU
         p9zjUUCNhAQQ8J91OfhwNk2EeLALjJCzRG486S2T9Ljx4U4xKIOpIFMai1MIFpOE3FCV
         bpR6hmq80REUbAOAXDBMKXTbxREk+6qnHKY3iBIq95Qk53t2dNqNeqEAJ6243c5e5pJd
         OtCVkabI6oUDH4Bx3xV9KGhwAViYI68oGGPTwlfK99bEziJ6IoliTxwuXAL17th2hD0m
         j+iCMWiGQCs9/1304F2UnZpSyRS3WWN0lhu2QBnpMXuxTE6xeqxXJlKMKJ7lk62L2s5e
         OeBg==
X-Forwarded-Encrypted: i=1; AJvYcCUlcNZPZvJvDapgQvgTr1iDbtNjDoZwN6Il5oUhsSsVEzwdxFmcR55LJi9AuK44pZ3q7AFhNMGrYXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKtVbe2x7AhJK73fpKWxOq+ZRktKGqAT0a90V5u+Y8kiOXgm6z
	rzGp1zlq/BJ9IwySk083xWZDvtglLH2y0wyE6zNJuDoNtKd7eanXGAOqoqwHrw==
X-Gm-Gg: ASbGncuuT7/SoN2ujTmbKtH3zsM7xvxXZ+Mra0odHc8MZeff8LeJEtZQL0AX4nSMyEL
	9t/TqSHqRLrraXCERqriTlLnn5DunKHUrmOVbzvUSZtTnuZ7MQY1lh4ssQDckx3oOwNkEVpksJh
	3aGTmp147ZIVnoL9kxTaualwXCEVHosjXb91JWTnN6pn4XpDwb2ch1lkxI80TIPBnebmR/tvOQr
	s2ek4KMoa1xsyQq8045tEVxp8lpxX+PsEe10CpBQvbpsf7K8DWBr+HT/tcY/PAuOf8cebKYRDVT
	YGtzgec/2EBuF/0WMGo5DVCs3phXk3D4rsGE5CFLrPEk9wXDnrz18dmIK27xCzPg9eFDTL7QceT
	nhLaKcI4MHfLfoMzfmK/dioJWeTAKTIXgu2d1
X-Google-Smtp-Source: AGHT+IHmFYuKedKUFop1hP073T1jhN2/bNx5hG7vDrgE3niVKR1nm/UmVDRL4R1kd1wcD8NPnAWtiw==
X-Received: by 2002:a05:600c:4ed1:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-43f3a9aa716mr9874145e9.26.1744359379241;
        Fri, 11 Apr 2025 01:16:19 -0700 (PDT)
Message-ID: <70599849-d010-48fe-922d-268e70cac410@suse.com>
Date: Fri, 11 Apr 2025 10:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/rangeset: fix incorrect subtraction
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250411075502.19926-1-roger.pau@citrix.com>
 <20250411075502.19926-2-roger.pau@citrix.com>
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
In-Reply-To: <20250411075502.19926-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2025 09:55, Roger Pau Monne wrote:
> Given the following rangset operation:
> 
> { [0, 1], [4, 5] } - { [3, 4] }
> 
> The current rangeset logic will output a rangeset:
> 
> { [0, 2], [5, 5] }
> 
> This is incorrect, and also has the undesirable property of being bogus in
> a way that the resulting rangeset is expanded.
> 
> Fix this by making sure the bounds are correctly checked before modifying
> the previous range.
> 
> Fixes: 484a058c4828 ('Add auto-destructing per-domain rangeset data structure...')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



