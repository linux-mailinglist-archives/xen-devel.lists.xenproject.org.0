Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A39BFC07D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148048.1480175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBYaz-0008OI-PM; Wed, 22 Oct 2025 13:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148048.1480175; Wed, 22 Oct 2025 13:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBYaz-0008Lf-M3; Wed, 22 Oct 2025 13:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1148048;
 Wed, 22 Oct 2025 13:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBYay-0008LZ-Aj
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:09:40 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c7a321d-af48-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 15:09:37 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-471131d6121so52249295e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 06:09:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496b09bc4sm38635745e9.2.2025.10.22.06.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 06:09:36 -0700 (PDT)
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
X-Inumbo-ID: 5c7a321d-af48-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761138577; x=1761743377; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk8Ho/nnBl7Unpb04ZHhRa2lZ43sIUqwJ2r5W2K6E0Y=;
        b=BHIHtpSyfEohBGgUC6LLooI9IFf+hmwTomhDHKEKOrB3EDodzowftVolGo+VS/OWEq
         GPNoNZPXqSiwgVe6GV0VBJUy3urLpOw6YBH435XmsIRNAfnR7VOqKUn1xEjzLfw/tMMq
         XEMJorPIoePn8VO8pbFdPradISOjcxrHPCad2iTBZWDzG2GSx5CQfKlTK/5rsdQe6/iN
         m+xpp7QtX1D4z1SnyQ8TFZtqFsz7SUEKPBK9dbFtA3jl0d20HPG7PCcxyfKdnDSDHZW0
         SIOMidlH19M6V50wK1HWgqFmAXn/yBer2HmgTQZcjj6ockX4DfMNqaAxJG7MubcvrHY/
         isog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138577; x=1761743377;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk8Ho/nnBl7Unpb04ZHhRa2lZ43sIUqwJ2r5W2K6E0Y=;
        b=ijCgy9fe+SeR6nhE/hwLzxoj0D+hvXLHHZ69c6g4MKN3BxU/xq0qQzX/laVxL5wumw
         uirILAB/wy2vr00QQh3YYgcZ14brI7capS6nny5v53xo6nUKrZMWgs2VmfPMAoF8aTmd
         LMkKBe3pNE8swT1vpQArFikHmkoKqgPto9msmyUDj8L9Ul0appL0uGF8EW5/jdevJx/6
         ULy8geizUVByh1m4gL1z8VrwfRC7OwR5JTDFNOpuss44HFjHZ/dLtergpqOidZopAs1l
         xBPuQBImGbQo3049+8m+iFD7XJ+1PxqqO+KZPUVDzdWbtYghq2LQjQvGkfLih84w8/27
         kYbw==
X-Gm-Message-State: AOJu0YzV93AAdkfA8al3Xe3oMKy0nsUaEdT1hmUKSxBeVlVJBrgdFn8E
	F/GFZIgKEbjkIVMvSDxgrfz7eH0InoSCa3QACw7R8gwUvl4wAxHGciWtTOGZb1AJldmI8JvBN1X
	3QOQ=
X-Gm-Gg: ASbGncsV+5ehV0cA8lpoujsqqWGEXVDkERweJ4NklNTCH8aUlAkTg2xJMoGzbEhdOtY
	OT0xaHjJVfU+0ESYlDnVrW7MNce+JQwvjA2eZrSHk9vlfEV1ixL57jJppPjgQjNnF+TCkcrXATz
	AJ6NbQR8gUa1o9B/zoVRiiSqKmUfb3RcDCUHcYz+jvRQQvF2evqRXQ9LhGJF3fVTzgz1zunHhdr
	U5vDz4tuFvecqe8Bm54PKHqs+v4+Ykbq3bnKpzrQwm19O83ZUEqKhZ52cQZuwYJ8p70avMki0C9
	n03qtUkGAEdCeWfjlHxVYaGJe+j0Nt0XM/A+kNeW8RBO05oPJBSq+f6sqD7itipuG+f4aaA+2Mg
	jFlz67s9/p+Icmh1HmTil3NBq5URkYODs88YDBa1s3Yz1p1rcymu9WoSRdAUKX+pw09Dq45fHLo
	g/jo9Y667xNqAKQQ1Ctx9DPk2FpunHHWWw2zqoZ9gFbtKC8jnknVvTyimW7ygE
X-Google-Smtp-Source: AGHT+IF1bIF89c8TkbudzLMY5is1SmjjZfZu7SwkOvZwLM6hX/hD6ikYW7j41vVwUhX140zzauTrbA==
X-Received: by 2002:a05:600c:3b03:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-471178a3ff6mr149052565e9.18.1761138576792;
        Wed, 22 Oct 2025 06:09:36 -0700 (PDT)
Message-ID: <b579b375-c1d3-4ee0-b2fe-21ed02af74a3@suse.com>
Date: Wed, 22 Oct 2025 15:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Xen: limit XEN_ACPI further
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Most of what it controls is strictly Dom0-only. Exception being the PCI
backend driver, which in principle could also run in a driver domain.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -317,7 +317,7 @@ config XEN_AUTO_XLATE
 
 config XEN_ACPI
 	def_bool y
-	depends on X86 && ACPI
+	depends on X86 && ACPI && (XEN_DOM0 || XEN_PCI_STUB)
 
 config XEN_SYMS
 	bool "Xen symbols"

