Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12CF944BA7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 14:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769694.1180591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVDB-0007Bm-JT; Thu, 01 Aug 2024 12:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769694.1180591; Thu, 01 Aug 2024 12:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVDB-0007AO-GS; Thu, 01 Aug 2024 12:47:17 +0000
Received: by outflank-mailman (input) for mailman id 769694;
 Thu, 01 Aug 2024 12:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZVDA-00079X-0e
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 12:47:16 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d0756c6-5004-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 14:47:13 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so9724108a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 05:47:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab52d51sm896014066b.79.2024.08.01.05.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 05:47:12 -0700 (PDT)
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
X-Inumbo-ID: 2d0756c6-5004-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722516433; x=1723121233; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8evH0/3g8bv9N/9tlqM2d85ER+N4y++tkzpYWUzUVA=;
        b=DcUAuoRSFIvU/8LzeQWtV3T4dzu7Q6yPMTYIYJ9XhvtCKeO5axPZez4HZpbF4pyO84
         26CixC5bOhYAW9nmG50U/jH/EBeuvns2P9W6YGV77oO9ezY/AeFfCEYwuA5t2Ll40gH2
         0EV6SvON4EvLJW0UbR2w+dc+uY/cXNY9AxC7IlfRKkUbvHs7FC6qm2c8FYX39bYNUbT5
         LOJ1162IhTg7b3bWfEvFtYR8WUp9Jfzx/6sdWLzLC7zqJXRLNfQ1JmWo0SeCaCQYV7af
         emjDGv+ypReYGWt59RQySTbdpYeAHAFTnPuF/V7KzG2/RHJdVpsMj4wcua39eM8aVfVq
         8S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722516433; x=1723121233;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8evH0/3g8bv9N/9tlqM2d85ER+N4y++tkzpYWUzUVA=;
        b=dju+Es0o37ZGSInTDiFplocvV+MW7rV+mlAautz+RjlavG0NohWr9jlNrgfhQCy9ZO
         MuJXp+Up+tj1r9a+9wQWj+4YaTFQ4l44EUVL0fTygn/K48BOhKOXhRa3jS0wubch+R8B
         DQEB1n0pVVr5Vq+JtqlJyZOOU6ydpAlZTYATtTT1bwhFMr8HKSlvTMedjn3xkiqbgQXo
         jyJAmRwS8lQm1nEes/Hl26VQ09Z98xsWZuXIio5UBJMmtzr9ZNuQllOvK+LNru04oOi7
         wlTc988wm8CZ8ukvWHeJ+wZ6uyVnCLfBu5LDcO9xFjxs29cjJG3MmjndyRIdcApo+MCp
         8Zuw==
X-Gm-Message-State: AOJu0YxiaEAqZaZSR0+OastpwfGLph857KaGNQAPjEfgzPlv+devYABX
	A7MyMzj05j7NrOKwRmWtgoUjQgt7sKajqPRDy4Tu24n/AodgqSdFjW3otImop2b0MBFlq5/BdSo
	=
X-Google-Smtp-Source: AGHT+IGmRPIm6Jf6lBR3vFK+MD5qMx+YJMdosH+DaC4T1EkfWUstxR+ahc3uuuoaWfW3mQEDOQLu+A==
X-Received: by 2002:a17:907:2d11:b0:a7a:a30b:7b93 with SMTP id a640c23a62f3a-a7dc4dbf253mr4232266b.2.1722516433108;
        Thu, 01 Aug 2024 05:47:13 -0700 (PDT)
Message-ID: <29b28ab7-a642-429c-80aa-d09d422ba6cc@suse.com>
Date: Thu, 1 Aug 2024 14:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] 9pfsd: fix release build with old gcc
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

Being able to recognize that "par" is reliably initialized on the 1st
loop iteration requires not overly old compilers.

Fixes: 7809132b1a1d ("tools/xen-9pfsd: add 9pfs response generation support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -196,7 +196,7 @@ static void fill_buffer_at(void **data,
 static void vfill_buffer_at(void **data, const char *fmt, va_list ap)
 {
     const char *f;
-    const void *par;
+    const void *par = NULL; /* old gcc */
     const char *str_val;
     const struct p9_qid *qid;
     const struct p9_stat *stat;

