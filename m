Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E6914EC4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 15:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746624.1153736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjqb-0006W4-C7; Mon, 24 Jun 2024 13:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746624.1153736; Mon, 24 Jun 2024 13:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjqb-0006Sx-9K; Mon, 24 Jun 2024 13:35:05 +0000
Received: by outflank-mailman (input) for mailman id 746624;
 Mon, 24 Jun 2024 13:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLjqZ-0006Sr-ND
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 13:35:03 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eb575e2-322e-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 15:35:01 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so52804951fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 06:35:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70690b37fabsm505209b3a.1.2024.06.24.06.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:35:00 -0700 (PDT)
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
X-Inumbo-ID: 8eb575e2-322e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719236101; x=1719840901; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U019brr9NgH/q5MYR/FzuT2DxJ+abEquW+fZ4qJ26tc=;
        b=V3Pt+IUfU8Wpf4C1vnByh8gaerH642WJLHkEgvJ62P1S5syYSdSOQ4Jnnf5KX+Kae8
         OMAJzvgllQxXu76VMkmqypx01SoMMXnlUyX/wDmMM+jrvVJT3ryFRrMvyvikqY5u4WzT
         QPNm7FtM83BeCYdBMAqAD8UGGosNekuaIZ5dj4zgqmNFH7jV8+Gs5c5BBuWWfoz1scW5
         WGSHRmvasFqD/l3humCN3yP1kMGLMLxP9gWs/EihimGxoxfOP2fmBuFudeBAmU1nMYcJ
         7aTwtvvEogXc422zm/7hvs6yICn3TH5l940yq0LjQA1FrtFu4HxyqmXLnE3fkWWJujCW
         HXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719236101; x=1719840901;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U019brr9NgH/q5MYR/FzuT2DxJ+abEquW+fZ4qJ26tc=;
        b=MDLPiF3GrZ8r8e0ed6M1Aauan8rq4kS+khaly6H5w196O0xt5pB17zbybh5Jy1LXfM
         WGn5YYFcFrhdj6BfLYE6KjamQ2Biw+nu3tE0Ou3UImu8+SW0Q9EODe5ib/e0mVdWOyar
         /k0GYrzFRK/5e5y+xJ/Qj8SEplsXNd2Pk7s5a4oFq1Icy/5q4NO2aOubVQeJm+PYfQ6g
         fuEIHR/MUI0SWtH6g01Hjy7ttDaxwnFMzYmb5pm4SDgD2okek2C6n3tjQ0cLd1GiZFWz
         RpMUE6FzpISHQFlOwZjdb/urYSZecrcX6xtfYzj/zizyNi0UVAIMJN37pttR8uZC7Csr
         Jbzw==
X-Forwarded-Encrypted: i=1; AJvYcCXGnSj5Fv62TAU2mqFGypepXrY1vOY7lkcJTX6YG0P8i2+j9KbNg7gYY6NHSEEimf8FN+V5EqvVcfMgZhHlkIB6YukQFBTKnzuWfoJdqHg=
X-Gm-Message-State: AOJu0YyFrwUi/DdqKX9yidvlRne2O4fhNP7vS71D9l+zjKwyTeYDOyCh
	vF0dGfhoeHNuGd7UNDQErGzUowMH2ujyJ7hmoTr4bE+ffanVGd9JBbCzSbyFOg==
X-Google-Smtp-Source: AGHT+IEGwEP1Smx0qT5AMcJSAl8roOthr1MTgaaGJ/0WVFjT+wg4k4ldidCsrjDxqnL1v+6TUT4xRA==
X-Received: by 2002:a2e:7d15:0:b0:2ec:5a85:66ec with SMTP id 38308e7fff4ca-2ec5b30786cmr28120701fa.48.1719236101145;
        Mon, 24 Jun 2024 06:35:01 -0700 (PDT)
Message-ID: <e25f5cd4-9130-488c-8294-22bd9fbd76ff@suse.com>
Date: Mon, 24 Jun 2024 15:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Minios-devel <minios-devel@lists.xenproject.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: {PATCH mini-os] mman: correct m{,un}lock() definitions
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

From: Charles Arnold <carnold@suse.com>

gcc14 no longer (silently) accepts functions with no return type
specified.

Signed-off-by: Charles Arnold <carnold@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/include/posix/sys/mman.h
+++ b/include/posix/sys/mman.h
@@ -16,7 +16,7 @@
 
 void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset) asm("mmap64");
 int munmap(void *start, size_t length);
-static inline mlock(const void *addr, size_t len) { return 0; }
-static inline munlock(const void *addr, size_t len) { return 0; }
+static inline int mlock(const void *addr, size_t len) { return 0; }
+static inline int munlock(const void *addr, size_t len) { return 0; }
 
 #endif /* _POSIX_SYS_MMAN_H */

