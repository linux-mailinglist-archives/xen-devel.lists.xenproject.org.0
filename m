Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ABF975211
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796512.1206126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMRk-0004gm-HZ; Wed, 11 Sep 2024 12:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796512.1206126; Wed, 11 Sep 2024 12:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMRk-0004df-EU; Wed, 11 Sep 2024 12:27:44 +0000
Received: by outflank-mailman (input) for mailman id 796512;
 Wed, 11 Sep 2024 12:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMRj-0004dX-5Y
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:27:43 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d0c02e5-7039-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:27:41 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-374c3eef39eso3834299f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:27:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46909sm5605302a12.25.2024.09.11.05.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:27:40 -0700 (PDT)
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
X-Inumbo-ID: 3d0c02e5-7039-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057661; x=1726662461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RRgULabzxyRKI4iO19jmq0n/El/qBMMV7z8yj44mMJk=;
        b=OKaPduzZlO/3ac6CYe/eCn686LM0Oyly0BoqMYkSoJxaxRaQIw0fNIEbfS4RAWCfcM
         Klu3iOOEtArqjy589xcM6B1BwJEOz2PIIrO7ZqiqEEuyF4LQXXvV58jmVXVQNVc1mt31
         7DQYeSsZ5kxzIi9GG2boixccqtpyTnhrHpmKG8G8MX2L3DZ8iqsOnHVoE/Ij0nDWM+OX
         fA53UZYLGUxBqyNPiJYyyq+creXtFi6GDMlx8jrJd+icSUda161NzvnFV4Frj8uWu+fz
         /XnX8AYebRcHCstTw4np6zMi/a+4UwCfE/YomEytV5JnhqREozBmXWwJtS7jJ2q426rH
         5/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057661; x=1726662461;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRgULabzxyRKI4iO19jmq0n/El/qBMMV7z8yj44mMJk=;
        b=asSYfeCfwRUlpJ26e5K4S0t6HsaTs9H2eXMeD1qsqrkHqDgIbJ1SyJupulNYnFmu5O
         H2ce3VqlNkLtQ/aCAhjgeOH5OalFbJq3nFMfSwLYdIQAViIJ1q/gxl+a/0W/2ea8ZMlU
         dEpwjTVPs+QzXpVynIvX1j1+2GO9XbPjM/NYmxT54L7jET7HNKY5s5cLO3xUY84cMq+E
         tNqyVIhdEQmaTqOfIkS3wGitTii/qvlUGsxZUtU6QJ7yDu1NAFbXB1A7CIvuWm2WYHCt
         Lz6fFkXYdRcjJPkPKBH+DA/xvptsIJNor91X/M2M8GJ66Yvfpf4ICDI5XViwFz9SijZp
         A7FQ==
X-Gm-Message-State: AOJu0Yy+ML1Y1BbyHcuOozYOiXElPiw+Z73eQeVNKTo5eVMm1wVulIBg
	gaCErFCWXE1qtlbTgulG4BdnsShG4WlRMIe3XQkvZIm5sOhjpWQd2TcwBq74zLeX/rg2n320bLg
	=
X-Google-Smtp-Source: AGHT+IE5mzHyz7nheTFsBnpSbeZhj7wVHdSvNmXxNq3897bSDLfO1OkmQph7oLqEesXOgXko74E6aw==
X-Received: by 2002:a05:6000:1143:b0:371:87d4:8f12 with SMTP id ffacd0b85a97d-378895ca2e1mr11114735f8f.17.1726057660682;
        Wed, 11 Sep 2024 05:27:40 -0700 (PDT)
Message-ID: <c1ddb1fb-70c3-4ca4-a2cc-acdba9c9a035@suse.com>
Date: Wed, 11 Sep 2024 14:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/9] x86/HVM: properly reject "indirect" VRAM writes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
Content-Language: en-US
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
In-Reply-To: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While ->count will only be different from 1 for "indirect" (data in
guest memory) accesses, it being 1 does not exclude the request being an
"indirect" one. Check both to be on the safe side, and bring the ->count
part also in line with what ioreq_send_buffered() actually refuses to
handle.

Fixes: 3bbaaec09b1b ("x86/hvm: unify stdvga mmio intercept with standard mmio intercept")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -498,13 +498,13 @@ static bool cf_check stdvga_mem_accept(
 
     spin_lock(&s->lock);
 
-    if ( p->dir == IOREQ_WRITE && p->count > 1 )
+    if ( p->dir == IOREQ_WRITE && (p->data_is_ptr || p->count != 1) )
     {
         /*
          * We cannot return X86EMUL_UNHANDLEABLE on anything other then the
          * first cycle of an I/O. So, since we cannot guarantee to always be
          * able to send buffered writes, we have to reject any multi-cycle
-         * I/O.
+         * or "indirect" I/O.
          */
         goto reject;
     }


