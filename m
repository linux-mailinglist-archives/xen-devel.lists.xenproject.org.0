Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D603B08C6E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046706.1417090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNMu-0001aT-1L; Thu, 17 Jul 2025 12:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046706.1417090; Thu, 17 Jul 2025 12:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNMt-0001Yw-Td; Thu, 17 Jul 2025 12:05:43 +0000
Received: by outflank-mailman (input) for mailman id 1046706;
 Thu, 17 Jul 2025 12:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucNBR-0001Ft-S3
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:53:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c06c84-6304-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 13:53:53 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1030941f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:53:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4286d71sm147721835ad.16.2025.07.17.04.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:53:51 -0700 (PDT)
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
X-Inumbo-ID: b5c06c84-6304-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752753232; x=1753358032; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG5fISwhYTTvlkJ4wL7+gjhUo/XKqFG7Qr6TfbRB4rA=;
        b=Sw2dqr/JepYV4p4bRnfSS8rql8531h0tz50gOTpZ+BdnjL9f9Lxq6VNkhkRNWhSSeo
         7KtEkyzSlFcMlciLXOrzlz4IRW+zkzzPLfDpr9uD4qa6604tM/TENZEYh9wqiz3WLyq9
         4C7fV/CPPUCajnCGMES/ioyDXh/WsXXcl+OYdpjl5MlrZ2A4frOuQW3s1F8P+qEQkjf4
         HId3UO2sCB4qOAjm2hQdUTzoe+dQ+mS3OsaNU9pUCKla/AQl+8UOaWEaJRuOOeqPLAQt
         8z0BjDgr0AujzPTlUHGC30rAHMNaESa8eZORn5uNq6A43rf2bPKXzIHgdR5t37pK/xRz
         glIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753232; x=1753358032;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qG5fISwhYTTvlkJ4wL7+gjhUo/XKqFG7Qr6TfbRB4rA=;
        b=fbcNkzeB/2JUdauPrqpgeAnpePWKU1nR1IOXzSW2CqOyoqzPzdHShRB2aKQps1vQjN
         5hW6rYip2t/OHoDz+JY5rNpzIf5wGFacmQXyxAfo+qORGATcbTJ+SsI12CThXxe0Un79
         Uno4TlYsgIRehfYqtwQIVXaX9IAkct07GGxzfg2eQofKYJczucvq3qiB/bsyWiNv2LE3
         05K35B8RGM0iAF8Jgnm2gaLQlvNyiG8m/nyDqaOCUYoJyT8I1q0NWX8DcT8mL2klLTs/
         KtuyKG1cUWKA+M3kVdLxo2tJS8dXK/7HWQ29rqfKzXzRCeOylaE4Kee5giMal0gRTL1s
         Jocw==
X-Gm-Message-State: AOJu0Yy8Ai3iLn8lC6W8Us/LlxDv+NZjDwM1H/7VYap13bT+lCrWZ1bS
	+n4PKCpfnRqFJZw2izwMI5RwBxKFCYoG9TFEzEwMUpGbjg9dxEwCfEvfPQHoIzfXMg==
X-Gm-Gg: ASbGncv99DUzCT3EHC8OURBw4b8cwXrkzPoq/Q09joROEPxKP3BMBr0udv0tYSn6DAZ
	4TcN3rynXvcwsOC+Gs+nc5o1nNRaelXkwlnpHiEAaM+Vt2Mc4x5KIn8+wBnNDDaPQvR2CMwPk4n
	og98mivPyzBz+BuoQ5yiAytnGUfnBOHrHLMLblQ8rksNj7NtFjYWLjVOyvoj9NNSqfi9HNWFwZe
	v/h/2r4OyDLdZZ7Rt+tLVt8f39mst+9o1Z3i2vSPjRN0y6sstzhe1OzMgQXMqihtR5kEVlcQfDx
	WZT632Mb7dOWc9W5fUDXz83ZrJURsCyifusY8K0NmN+9ymnvDEDkHl2UBcufBVmjNZ5GqbYk007
	KnSBP3j/+oN02M+F4rc7yK8Th1U2ZnuuCMQqS8E/YYy+bsgxrOD9ZFAF73xVBu689wYpQwO9TMw
	fBzw2ec9U=
X-Google-Smtp-Source: AGHT+IEMkdLp5woadsyibzhTDCWBnPe58129JPz+8JtUkzencrvbkvTKBCZv09DEMHTRks0CosPQxQ==
X-Received: by 2002:adf:ed06:0:b0:3a5:5136:bd25 with SMTP id ffacd0b85a97d-3b613a0896bmr2378868f8f.1.1752753232302;
        Thu, 17 Jul 2025 04:53:52 -0700 (PDT)
Message-ID: <b96d2109-6c84-495c-8efe-f2fcfa95608d@suse.com>
Date: Thu, 17 Jul 2025 13:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Minios-devel <minios-devel@lists.xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] kexec: initialize kexec_page in kexec()
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

For the error patch to not see it uninitialized.

Fixes: 560c2a5584c4 ("mini-os: kexec: do the final kexec step")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In the meantime I'll revert the MiniOS commit update in the main tree.

--- a/kexec.c
+++ b/kexec.c
@@ -168,7 +168,7 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 {
     int ret;
     unsigned long *func;
-    void *kexec_page;
+    void *kexec_page = NULL;
 
     ret = analyze_kernel(kernel, kernel_size);
     if ( ret )

