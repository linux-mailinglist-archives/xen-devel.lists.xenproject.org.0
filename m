Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65FA4F8B4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 09:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901806.1309740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpk2w-0003lw-7p; Wed, 05 Mar 2025 08:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901806.1309740; Wed, 05 Mar 2025 08:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpk2w-0003jL-4s; Wed, 05 Mar 2025 08:24:06 +0000
Received: by outflank-mailman (input) for mailman id 901806;
 Wed, 05 Mar 2025 08:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpk2u-0003Fq-BU
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 08:24:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3269ef11-f99b-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 09:24:03 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so42102625e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 00:24:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c4c8sm10343825e9.7.2025.03.05.00.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 00:24:02 -0800 (PST)
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
X-Inumbo-ID: 3269ef11-f99b-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741163043; x=1741767843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QPHlNUdygfDBRG0dAx1GMtB352XI9KOZCfbmCuX9d2M=;
        b=RPlJ/nro35DZuE4Vj+WMICdzOUdaW9IRB2F45sv4dsihfhDqrNjDXADosIwm3wbF85
         A8HHKGMaRd7CQr9XsVx+93dc46pRty+KDQ9ucUpQoiHs1FC9YQkYDpfLNBToSLAdedty
         jqvFMvFhvXsJUDl++bmBAXR5y67rAasKQr18+IX9Y6V9/PaxudFSvJuqH3HTL24ptPRJ
         HSq3o7Z+1/F5uRGC7ZPunZmOcxkO/vLpKuBjM0V7QSA/7bqoJNgI2aZLXP4nMuMR0zFl
         wKeWpTjjBjvNyeDYqki6yxPQCBwYih7b5G60ghDHmNeBHkbUf5B3+5qIJEO/0iL1V0hx
         idxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163043; x=1741767843;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPHlNUdygfDBRG0dAx1GMtB352XI9KOZCfbmCuX9d2M=;
        b=wrue5b6c/3BV3V3REOGLt3TbMcJHZUZAU0qNuBDl3bkQu/d+aM/s9IKqTOsHt6MbPU
         aseEBiVLn4wMiyQHT1kjUlKVbkKLwgiZvRa0TYWI+T18NHr17o7Bq3pZR+esq+v1S+i1
         0C11DFmf/rDWzqaGwdCQHHAdncWBXsTRKyLgAETC3pJY9FG655ybk9BpCK9o1YhQYRJ1
         iS/8HYoP3fEZC1xROnx0HMQdijy07a9MwFMZ9dzEgi9BYze2zg57Hyu0G0mepjJPEVCz
         pObMVeF+Ax7M/dvm3gUue0K13O4dz3wIvXYc2dNoLP5UnnadVp7Jn5Gmwm/6iosgKCCf
         ywug==
X-Forwarded-Encrypted: i=1; AJvYcCVaI6AgyjK/lnDu1pjz6kiExgZa6inaQufyMjSiu0OkpkYT3svlS0rip0auqZmF+l9wbz3OO+nxacw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/CR24xffyPYpLzSzTVnfh5PSK/+Ttbxamcy1ZxrRVI6vJwRAc
	sPWR//iJ19iejPxjoKoCZmEjsGz00KVvVQC3ca3QVIhpJE66sP8Kpi7dOc8I0w==
X-Gm-Gg: ASbGncu9ZP+4bSwY3HkvzSQj01kL4F4plLz7Otgx5QGLLN/yDG33Fso27SgEjO2qs/g
	peQnnB9YvooSTLPDsE2LcyNw2fSq7Nel4ITPMCc9v3hfpqXevzy7/dKp5PfDdlV80wNm1rzTpm7
	ixBb0eQTIcIyvl/5vkkF5NfwNkDMotnp96A813VSZ7ENc2KQ/+CbWz7RuffgYW8hr+MkJFY8POm
	ff47N+hO2A8KKONSvCk68h9cPBO8T0HN/84tuYwazaw0s9HsRuYYTpOJKzV0qVvr1Q7zbl3Kwx1
	6X4fdVAU+gjA0k2HV+dMEYJMebCLeANTRBKzrIO20QUUlWQO4L8MycY7SyvUK6HkPee9CH352ct
	Q2YhR9zJOJQKw4YKBe7w+aJ01H0GkNQ==
X-Google-Smtp-Source: AGHT+IGMucRD/6n1CRCZ90ISQ/mCWyguDVLT0SXbiNwWV6EVQNPicshaAko9i3dNATwund1s2MboNA==
X-Received: by 2002:a05:600c:46ca:b0:43b:cb09:13e9 with SMTP id 5b1f17b1804b1-43bd299e4bemr13427325e9.17.1741163042866;
        Wed, 05 Mar 2025 00:24:02 -0800 (PST)
Message-ID: <c3d7e47a-9fa6-4f3f-9ab9-f348c24788c3@suse.com>
Date: Wed, 5 Mar 2025 09:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] xen/README: add compiler and binutils versions for
 RISCV-64
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740764258.git.oleksii.kurochko@gmail.com>
 <eb86d40b2e3091c829d08a83d43a383f7cc82d1f.1740764258.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <eb86d40b2e3091c829d08a83d43a383f7cc82d1f.1740764258.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2025 21:07, Oleksii Kurochko wrote:
> Considering that the Zbb extension is supported since GCC version 12 [1]
> and that older GCC versions do not support Z extensions in -march (I haven't
> faced this issue for GCC >=11.2), leading to compilation failures,
> the baseline version for GCC is set to 12.2 and for GNU binutils to 2.39.
> 
> The GCC version is set to 12.2 instead of 12.1 because Xen's GitLab CI uses
> Debian 12, which includes GCC 12.2 and GNU binutils 2.39.

As before, I view this as an insufficient reason to exclude 12.1. Nevertheless
(to now further keep this from going in) ...

> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=149e217033f01410a9783c5cb2d020cf8334ae4c
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

