Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC59F77F5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:08:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860933.1272910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCWF-000613-HM; Thu, 19 Dec 2024 09:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860933.1272910; Thu, 19 Dec 2024 09:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCWF-0005yJ-Dj; Thu, 19 Dec 2024 09:08:31 +0000
Received: by outflank-mailman (input) for mailman id 860933;
 Thu, 19 Dec 2024 09:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOCWD-0005yC-Ts
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:08:29 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cedec0b4-bde8-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 10:08:27 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436341f575fso5551735e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 01:08:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832e1bsm1061010f8f.31.2024.12.19.01.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 01:08:27 -0800 (PST)
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
X-Inumbo-ID: cedec0b4-bde8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734599307; x=1735204107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mmpDynHtq8wSEdcCqCRwFVa1y5+fN3kXG9Thuv6Zy6c=;
        b=Rtgb54eqTwL1qPUWn9QsJpKmBvHrMwKT0QXDwl1ho3iSAWQY2aH2wB7jBXiErWY3a8
         aJZhAbQ1WbB/20VLlsj2pGVE4mGyYOfD3zTZ9lBQi+8XdnLd31sFrvZEr8kyG4twYsbT
         Ilz1iP+pldT15vaRWSHv1fvowp031ooXm5OAv1w1aLVJhD2gemKb8NsWtRxo7uMeIKwF
         BKp9vFjDcIwU+pQ9hliCmAQ6tjef8o/lkfzXYb7f3xC22R/dGfPT2j36vym9XOytVEu9
         Jrb6Y7sqB1xFT+Jxt+tWl5FMnYb+Z2PrR6C7BPnrwbUcro2EcuT+/zo+W9w06dpoxfKw
         ZysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599307; x=1735204107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmpDynHtq8wSEdcCqCRwFVa1y5+fN3kXG9Thuv6Zy6c=;
        b=PfjaO53xNdP2tODmkFnf0US+9tGQ2D+tEvAg4adeH9InOKFXQbJVyB8zkKFIa/bzav
         fdhSi6iH+rWyoemj8nVK/5ZRyFSAncTyHusX5sKjKhyxMyL52FViRxfTNGO/9dxJ0bGH
         B69LK+Tkbmmr8kiJDABMnT02Ta9veD8GyaIbiLx1okH/CAj6w2hZ7VeQejdGsGVirAwA
         g6/ew5NEc4NrtxSu7DvZOFTGpHVsKF4218mACP+kdA+Xre5cKXVoOTwqY0QRe4mPrlCo
         VizIcGIE6SNXqVpsgQbPpU6P0G951qXYHKzn3xLBLlwC9q1F0QdC4zrxh7o4PloSYU4M
         U65Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQMTjYTbscxGP43KMqX0ndYVY5dCBfeAh2CvuvUtQ/Ohs7mob9vQxLNVoBj9hed7cQZr9QkFV3Y7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbgyqjs1cLhZkywrxIKMx/EJ+ihPRVLq547mBZ3Hlvzj5AcxF6
	jt3974KUc4c5NdhUAKxcVWPW1+PuRzzEemHYevfo8ob2WPOxLI9uNHm0zXGA4w==
X-Gm-Gg: ASbGnct2Hs3dSKYYXFuaVgTIfGr1ym9wQTlLq1Jqgk4QkgxReXBpv4enmdaXaguFL7A
	x91xI+iuY+I1zaVvv1nTjBnE5snqAdvvPGolj6QKews+IDUCSDdODScUN238epkXAy0Gk1rAP3H
	03BtJ7VZPyU/Dfa8xLGpEDe8ZjFH+821lFueLTaqnm6KRe4p6QS9nHljThAGiVp6nscb0tSWyY7
	w2t73owYbZ8EylPwolu80umD3oSaW6f+jwT80wri8VSg68n9aCh0oYKN3gzlSFfOwAErbiFBu0S
	Qkek7WH9w6HIYSra4PRZ6CaSa6i0GXYuQZV7IEk0hQ==
X-Google-Smtp-Source: AGHT+IHIMs6kFOPzRksTaOhdZzSTJem0Ayft/07Kd285Rak/Nl/3Ywh+++FZ7IuMu2FutsZ1wvyR8Q==
X-Received: by 2002:a05:600c:1396:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-4365c55467bmr24149875e9.0.1734599307354;
        Thu, 19 Dec 2024 01:08:27 -0800 (PST)
Message-ID: <fb31bb49-8317-4323-baf9-49ca45e0c802@suse.com>
Date: Thu, 19 Dec 2024 10:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] xen/riscv: update layout table in config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
 <a5c8d62f7187fb54f6009306e1d2150a6d01f4fe.1734452721.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a5c8d62f7187fb54f6009306e1d2150a6d01f4fe.1734452721.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 17:32, Oleksii Kurochko wrote:
> Make all upper bounds (end addresses) for areas inclusive to align
> with the corresponding definitions.
> 
> For the Direct map region, the upper bound was calculated incorrectly
> in efadb18dd58aba ("xen/riscv: add VM space layout"). It should be
> 0x7f80000000 (considering that the value is exclusive, instead of
> 0x7f40000000). Therefore, the inclusive upper bound for that region
> is 0x7f80000000 - 1.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



