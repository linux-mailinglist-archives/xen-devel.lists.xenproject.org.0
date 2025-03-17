Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A855A6454E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 09:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916240.1321362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5ly-00082B-Ov; Mon, 17 Mar 2025 08:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916240.1321362; Mon, 17 Mar 2025 08:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5ly-0007zX-LQ; Mon, 17 Mar 2025 08:24:34 +0000
Received: by outflank-mailman (input) for mailman id 916240;
 Mon, 17 Mar 2025 08:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu5lw-0007zQ-PM
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 08:24:32 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f5aff8c-0309-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 09:24:30 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso11405415e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 01:24:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe65977sm99059805e9.36.2025.03.17.01.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 01:24:29 -0700 (PDT)
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
X-Inumbo-ID: 3f5aff8c-0309-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742199869; x=1742804669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xDV/fdfwlkv4EkU+vF6m/qh7088KsqU6vAAVNCNEpEk=;
        b=CRAjQYLloWlSfkrI4do79crnVxw4ltOTRgY5bP37ktOP5yMfOlwxGOuPTMo5oc9BH0
         ZCo4xulMBgpdMkkbEUBSi4icCDku+amURozRCTPEqz7YCgGXH7lxBpH9BsGH8ehTUev2
         EyCjBULAZlQhBUcSBDOomJslBbAdlb/Hcebi1O8M7bv/kmSmtq5syuM9N9e95x+hqjFh
         kyJre1VYLEq83EIcZjeZ2Z6IihEHf+9BXadmbdefoc7MVp9F5kQSGtzGETl3Xs5+xYYB
         7DBB5AiJIEcsG9OjAW8uwa8QmjJFeN5yLYFWm42Fu5HHaAYFsGHI+97tZsic7viKmYDR
         pBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199869; x=1742804669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDV/fdfwlkv4EkU+vF6m/qh7088KsqU6vAAVNCNEpEk=;
        b=LZ2Fr0WDnUnbvVpmP8MviX0wiKxZgwL5NCgbAMK/Stwi7oogHzZAPYU8IJNokG7E87
         Pv5OHKJiJrqsY4W9up7xRLRYnejrQuq+daxWv6myWB8sPtGJ3Mn19kbExAL0kSgBLrq1
         ZxsyLm7IDM/I/qeQX4gcIYWThcm8Z/cF3xETYFhP+247a0A4XWUj+h+T68qrq1miJDsr
         HlNxiv4GyCY9Vv/BDKfHWH9iotQegXpg9fcZJ53PljL2Dv0nTVwd6eJEsm0Uy1hag6yL
         blwCe5OnGvKqiRt4Ng+MuNlmLKeKUA/j7+Vk9yNBiYfuRR5Dtj+VsKOqrrSgs3E9jch+
         qCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCalDLdFn3fQfGcDssy8chbRXP6NaJuwtnb7yoOzkuwxVuG6xzI8zyMoNp9T8EOcmZ7doRE0s1HeM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9GvKjzXXGgfb8WLpWgAYJ9ot2SMiCiGhHux8cJn5lDUf+vSEE
	/1LCVe8NjTCZGCDEmAnz7sgspufvzWNbHoyC860xLxVGhGsgt54IWJevbZlhbQ==
X-Gm-Gg: ASbGncvYWINw4qPZ/RjQUD9MjlzuQJHT/cVbYKtASvlrF/lmlowh6q/bcWi6DnEXTMe
	9ufzLjkL9NHnRkmjq9MF4FpM28AB35bokXRraDT3XWdzltD7LREhIEsLSs8kVEInBrDEyJK5Q4+
	DSfyYUVPh+h0ZVLavSTRPr3/U+l2raM51SuW02g8SNMaxuhVg5nvqRmttLbF11PxKPF+NIhqZpR
	TqFo7YLIiLEiSnifucDFCLKY57hH5cHrlKvGLmB8Sv95rh+i8JaUYUKWjxo60uGwSLpWZumKimP
	waPo4L8dG5pwi4O+ZK3e4sCrDwN1IxLkVma55se/GTYYKCt7YmKJG34hwtEEgTSdz22Rqkakk9l
	Tav9jbPM4/cW+nvVqJSTjmR7QNRsHgQ==
X-Google-Smtp-Source: AGHT+IErh6Pbcx2sSVEWrqoj12FoyFkpCDXSWvBOpdvI2Y9jaGycR3LC8MqKqsuxH7q/fg8shqMD+A==
X-Received: by 2002:a05:600c:21d1:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-43d1f0a3936mr130097775e9.14.1742199869591;
        Mon, 17 Mar 2025 01:24:29 -0700 (PDT)
Message-ID: <ec2badc8-9adf-42d0-bbfb-71aec3360ec0@suse.com>
Date: Mon, 17 Mar 2025 09:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/irq: rename NR_ISAIRQS to NR_ISA_IRQS
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250315010033.2917197-1-dmukhin@ford.com>
 <20250315010033.2917197-2-dmukhin@ford.com>
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
In-Reply-To: <20250315010033.2917197-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2025 02:00, dmkhn@proton.me wrote:
> Rename NR_ISAIRQS to NR_ISA_IRQS to enhance readability.
> 
> No functional changes.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>

> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


