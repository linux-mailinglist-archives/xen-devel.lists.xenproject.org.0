Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D5CCB767
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 11:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189413.1510157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBW8-0005aP-Sy; Thu, 18 Dec 2025 10:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189413.1510157; Thu, 18 Dec 2025 10:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBW8-0005YG-Pq; Thu, 18 Dec 2025 10:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1189413;
 Thu, 18 Dec 2025 10:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWBW7-0005YA-Ee
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 10:45:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b976ef3b-dbfe-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 11:45:53 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so229153f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 02:45:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244934d6esm4150101f8f.6.2025.12.18.02.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 02:45:47 -0800 (PST)
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
X-Inumbo-ID: b976ef3b-dbfe-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766054752; x=1766659552; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWC0nrRzsa6mIqtXp24qnU0cVNs7rBKT/88XZbzKfaY=;
        b=Ntpw73DAGI5po8hd+ceBHQ3di34GwJF1YBkTapYexhVPAh64+J3BQr3T71fM7+EVnm
         CniAqHo9F7/vw+x6PQObEjZaUUzJYb17jMl1Pu3M8OPxSzUr2KMKMGRNLEjraNrcAQx0
         iuDbOp7KnkuDq9wvWpIjfvJXb0xvvv4ov09emB0nauLDFbST6WHW0z9Vcu3fM0jySjmE
         FfZ36ktANBFjwvKYa6EOScdNSG1CkLSsqxZRziZYmVISXesm6eDF0yAymwzrOyPePhTI
         gCTl9AL96usB21UK8IuIJa2XdaJR9L2yxKbZ4LhE/c+NXlJy3bfHucWLwPpIkIiiyWpc
         lKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054752; x=1766659552;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWC0nrRzsa6mIqtXp24qnU0cVNs7rBKT/88XZbzKfaY=;
        b=ChWaeVfjQZUnNEm1/dRkNu00mNJDEfaoejZ+e2CJZLFGiB8FP/wOiWeIlEfR3pD7U+
         JFF8ZIyH3qthPaJdBNTwBz3AEt4kQ10Akb+aYmIIdCaD/aeme2lTWpXg4HptsOZUB0J+
         tLKDHaPv3wFg0/9BuUK2ukHUh78TntR7MSpKrZv5FMZZKbRoHbOAmYnyGQG4morFTh2z
         byDosGC03GG49EHCaPED/i1x6ddJaMTPXaawk0Kafy4eusKOqLkRDgPN+msf9V++StQF
         PF0eb5UuAwHkwPz87ThonqBom0KmVKB2EQmx7gSrpw8HPlnL6g30CQKo5WweA3Scn2zS
         qVhA==
X-Gm-Message-State: AOJu0Yyh83zAtRRcGihbI22hEuCfUxQgLKNs3sQP8vFzyjPXaQ4yap/0
	g4PPt9LI1qf2CfKe7CVK0BZiVU/iqOJ66orTjWTUVZfNrkLlwYXnD7fDbzVFktKBFcGDMC8/u3/
	2d4M=
X-Gm-Gg: AY/fxX7MY7qXVc834TPrY9CfJLP0jWhK1PjaBmnQUTgwsMYFTShlJkqUSXZo9GZwSFr
	i5w4TxGFDI+m+xt7JiEkgQ9MGPQfOgq+PWwxb1n6GHlRQ8/M1/nL18mXBzERteuNScIIXCrdQEt
	LHsppRAVUmy/Jc56Q9jfAVF/vHplMF280uxjd0Zh4EoFyfz6dTiExAp25n3KuQMd2Ak4yATLLYA
	MUhSRGKRPPwQUlj/1CTTQwUYYhiLQ/7QtNnUr6FygM/WAxqaIdEOVygrLwkZWn5R4cuUrcMEyhJ
	i1e7Gj+RqukckLEfWTYs8SLeUI2k7r91Q7m9j7RgmodraNjhT9ODtwucGSOPpCOYgHAFbljLj+v
	gsKS/0gpf15nfycymaO+jSq/rcm3htiHxJUmrhmPOWTLfBbgS0QMUace3J1gSWpLp6+RlTV0fVK
	KHaZ1evp4GPE7hI6Aom9Jfn7vPG4ALrtGClB3fk0gE6vODaRKrwS1ZvT1CGOwmqY+PphxrkhkXT
	UE=
X-Google-Smtp-Source: AGHT+IELfD00hJ9zHojcvx4CDhvcQTfI0GUJhKYrKn1ayyo7vkJXc5gNU6CVwMouuknCiNEboXWE4w==
X-Received: by 2002:a05:6000:2586:b0:430:fd60:940f with SMTP id ffacd0b85a97d-430fd609543mr13750180f8f.14.1766054747611;
        Thu, 18 Dec 2025 02:45:47 -0800 (PST)
Message-ID: <70e156e1-c51f-40a7-83b4-2d228a102367@suse.com>
Date: Thu, 18 Dec 2025 11:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] vPCI: make vpci_add_register() an out-of-line function
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

Calling a function with 10 arguments is inefficient on many architectures:
x86-64 allows for up to 6 register parameters, Arm64 for up to 8.
Everything else needs passing on the stack, i.e. forcing the compiler to
emit stack manipulation insns at every call site.

Shrinks generated code on x86 (with gcc15) by over 250 bytes. The gains on
Arm64 are a little less.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Why is it, btw, that the declarations live in xen/vpci.h? These functions
aren't supposed to be called from outside xen/drivers/vpci/, are they? In
which case their decls may better live in a private header?

--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -573,6 +573,14 @@ int vpci_add_register_mask(struct vpci *
     return 0;
 }
 
+int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                      vpci_write_t *write_handler, unsigned int offset,
+                      unsigned int size, void *data)
+{
+    return vpci_add_register_mask(vpci, read_handler, write_handler, offset,
+                                  size, data, 0, 0, 0, 0);
+}
+
 int vpci_remove_registers(struct vpci *vpci, unsigned int start,
                           unsigned int size)
 {
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -60,15 +60,11 @@ int __must_check vpci_add_register_mask(
                                         void *data, uint32_t ro_mask,
                                         uint32_t rw1c_mask, uint32_t rsvdp_mask,
                                         uint32_t rsvdz_mask);
-static inline int __must_check vpci_add_register(struct vpci *vpci,
-                                                 vpci_read_t *read_handler,
-                                                 vpci_write_t *write_handler,
-                                                 unsigned int offset,
-                                                 unsigned int size, void *data)
-{
-    return vpci_add_register_mask(vpci, read_handler, write_handler, offset,
-                                  size, data, 0, 0, 0, 0);
-}
+int __must_check vpci_add_register(struct vpci *vpci,
+                                   vpci_read_t *read_handler,
+                                   vpci_write_t *write_handler,
+                                   unsigned int offset, unsigned int size,
+                                   void *data);
 
 int vpci_remove_registers(struct vpci *vpci, unsigned int start,
                           unsigned int size);

