Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F684BC1AAD
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 16:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138901.1474475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68S7-0002YN-7O; Tue, 07 Oct 2025 14:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138901.1474475; Tue, 07 Oct 2025 14:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68S7-0002Vq-4j; Tue, 07 Oct 2025 14:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1138901;
 Tue, 07 Oct 2025 14:14:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v68S6-0002Vi-Br
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 14:14:06 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0e081b6-a387-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 16:14:04 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-62fca216e4aso1441961a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 07:14:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63788110530sm12672054a12.38.2025.10.07.07.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:14:02 -0700 (PDT)
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
X-Inumbo-ID: e0e081b6-a387-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759846443; x=1760451243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5bkrGUAnE5bhZDPT0e0uGrQL4CthNNIXeH5BoN8gZhU=;
        b=gTWozEVn3DVMYx09fpGrwz2izJDYcn/fXDQ72ILBBoeh/3o5ysb8Fgx0FXHcCp9LJ4
         dcPLhmIOjE3spGAYAUV2Opg07lmzkbcWzlIaNiEjOneAlrbulLVkoUecDQjDYlRDlwMR
         BuAyP9yGzgfOvccvgquxspOs6/OcUwWozaHd5N9l4nxptrxWNopgb+cRM1g+RgmDF9EE
         zShG+Botxak8nlNa2DLT+pHvBbqQRLBony7uG/aNIuqfyp+ur5XbBs5hny+AxSg7PkAX
         Fr0l4YEyxFTGmoQ+dNTqFD5kq7YKM9pu4abNG8FKYNtghMZDRy3XqP1D9Um9JTAHNE0Y
         mSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846443; x=1760451243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bkrGUAnE5bhZDPT0e0uGrQL4CthNNIXeH5BoN8gZhU=;
        b=deADJ6cgevlAngYKiC9I0fTxNfYzTgp0Qyr1PA1VhW6Ci5qA3vRPu1c002Lh9q9sYL
         Wx9X6aP5M1Zx0vQB5hRBl4xzHzdiMVeS4hTTKXQK333jiXmtz7pMH0jj5tqlzBYXi5oK
         jZAP8kmfuMBbPR1EFweVeBUnFhWl5omb/zywGYYMFfxIsoV4ll8nXaS+DdScUH4mNxhR
         AD2rCdGdQ4/b11tP0ZjiLQRwd978m8GY8JPBsS43Fa6eH/D0iPdAz/P7hbIOaUppqJDD
         ExfQuUPCgcVIcJiBjd9IO4XRogGvGXs3udoksswgmLMW6xcu9l/fzSFYSo1DEkScuM1o
         EY3g==
X-Forwarded-Encrypted: i=1; AJvYcCUlKnRp6vLWjNBaimPLHDKPTvFF+WsWBbsxRxqXb1NIlRjWUl4EKEKfcjlE29pbhWQS7ippsMjBjEY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9nzurrxkwukDooBjvaeQr2r4YgX86EzwpqvoAhRKixMCcm20b
	qktv5qgRWJZ+3Z9nSiX6eHndinIkrjF4OVTVfIwVdGY8/SXcgLV4xBIf/SZrgywtzA==
X-Gm-Gg: ASbGnctn1olNcoO6K3KKMbzfZS0+x5jyk9b9oHm62V+vB4g/Y5uGNJM9QBywm2uJEIB
	0HtxmuC6aGRaKi+bE/IZ99t8EC0OfPUzjgEqZhC2oeNvsxLv97javosf1B0qQgo0E5zCUiT12D9
	t9t9+IY5+I4JoLtnrRCEgmwYoPUO9U8yq7ZbdqwcQ/XIGLfCrmTF4pdRvAsC0uFLq2AbYQCcJFg
	oz91V0JNd8HiiZgZtYLC/h555LMevHy5C/rRgA7Uv/MfHRDCaEnTSlQAEQGzUxRkZnnjm7bA3Z9
	Umkw+t7HX/rUOsJs0fUmh1mcVVUlVNn3OkDHjcXA6aKVxwnjqJrhEaD7QdvzLAWhTrZcF32LSXw
	hHjL/HiMYY059jsaBbW9xpopYFAB3jFTdvJBMuY4POTyspOeY0gkTssf8Df5na2ICnwI4baDVcg
	zcKDmMbcqwl3Vxn2sXe9OtH51v1NkBzRI=
X-Google-Smtp-Source: AGHT+IHWrzKBY8vgznVF68S3aQnzIUR3GGsTRJoLx9TZac4PWkRM3ckUVi0BvPqYfXzyaE6PsIJNow==
X-Received: by 2002:a05:6402:1e8a:b0:636:6e11:2fd1 with SMTP id 4fb4d7f45d1cf-639baf0c898mr4772093a12.4.1759846443313;
        Tue, 07 Oct 2025 07:14:03 -0700 (PDT)
Message-ID: <4dd83906-1985-4af4-8b61-980390fa31a0@suse.com>
Date: Tue, 7 Oct 2025 16:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251002234311.10926-1-jason.andryuk@amd.com>
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
In-Reply-To: <20251002234311.10926-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.10.2025 01:42, Jason Andryuk wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
>  F:	xen/include/acpi/
>  F:	tools/libacpi/
>  
> +AMD SVM
> +M:	Jan Beulich <jbeulich@suse.com>
> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
> +M:	Roger Pau Monné <roger.pau@citrix.com>
> +R:	Jason Andryuk <jason.andryuk@amd.com>
> +S:	Supported
> +F:	xen/arch/x86/hvm/svm/
> +F:	xen/arch/x86/cpu/vpmu_amd.c
> +
> +AMD IOMMU
> +M:	Jan Beulich <jbeulich@suse.com>
> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
> +M:	Roger Pau Monné <roger.pau@citrix.com>
> +R:	Jason Andryuk <jason.andryuk@amd.com>
> +S:	Supported
> +F:	xen/drivers/passthrough/amd/

Nit: These are the wrong way round, violating alphabetical sorting.

Jan

