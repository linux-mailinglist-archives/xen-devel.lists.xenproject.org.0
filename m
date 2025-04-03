Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4AA7A1CA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936624.1337817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Ih0-00007c-As; Thu, 03 Apr 2025 11:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936624.1337817; Thu, 03 Apr 2025 11:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Ih0-00005c-8K; Thu, 03 Apr 2025 11:25:06 +0000
Received: by outflank-mailman (input) for mailman id 936624;
 Thu, 03 Apr 2025 11:25:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0Igy-00005V-Ir
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:25:04 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4956e003-107e-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 13:25:03 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so424548f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 04:25:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364ce6esm15468715e9.30.2025.04.03.04.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 04:25:02 -0700 (PDT)
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
X-Inumbo-ID: 4956e003-107e-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743679503; x=1744284303; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx59JCo0LwfdC32DVga3JPUiYnfn4tMcbLWyzRyISnA=;
        b=dTXSb0rNg76x9DLpbbn4+dqLiRtI72wuULxvrO7doZHmy739AEFcgvV4RTEVhPpg8y
         9ZIqui/teQJWLvLGWL7yt/T5Zd/46MTgawNqZ98gpYz1DYJHX0z3SIX379QGXqqsyVBW
         Mw74g3glUxZaGVkF6BtjdCEZw3x2SYC7OBdfj2OYDMDd1I/L2HbUucCxuAp5eegBzPc4
         2ouKB5nSXXVRzKbVhYDcvZyMzjJduQfXVvAk4s2QnROh9TxB9Oet5U9VHDLWlwUkevM7
         b5gN3unUDeZbfah9VurmwXNkQfK9dupzL0y0x0g4Hdtc4bP1L56nnbUU8AHUP8VD8jOM
         OQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679503; x=1744284303;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hx59JCo0LwfdC32DVga3JPUiYnfn4tMcbLWyzRyISnA=;
        b=FQAE/FLaT9/a4Y+3IEilS5EYX2ANGpFkyuCB1eqbbRjQ+mzJhA1apJnLwT8hX0/sTW
         BU2Ct7Z9Iel/h24RffR+5IyLjNq4UDeuYQ9rXAr7O2oKfeHZoefd6tfs7Dk1wEGrLOMR
         vxFV60Jltg1ECM/UHIIVJt3WvaOjyGTf2Ggc9+4gaXHPsQR+JJB/KGu3P6BGpdoMqVqK
         biS+ID/Jqk5FuGlThegL39ifNUZcfbqZ4kLBz9K4UgwaUmC3qVb4Q2zyHeZpehN+lehe
         Viy3VDcvAkw0NBEmX3Z70krKik08VWV+KEXKGSmP7hRcfaSYeOLj41/0Ti0xjzysabia
         qnJQ==
X-Gm-Message-State: AOJu0YyzKf17EuhmadAe6noZ/qu5bAH4WP9j3g9p54kVBUZuIOr8dLNf
	nuOGEKv9x31kDLx0L74s7y56VrElmeiK/momuKZZPH14orRAedzT5a05+SyaF7mpTPSIdTkspD4
	=
X-Gm-Gg: ASbGncuusLn1Q9F4WXrav1h1+/xBHvdbeC1rIfSNANgEG96/NfpNhbh0dGEJy5cPDaF
	8paGFWj0DK9pWm8LXREJQvhPvEBODN0NwJFvBCcNVOnGEDE1upe1qT8+izoLvF66anYvcNmIYc2
	OSltEJqaNomeSrb7TPO7ESWChSoDRCuyHN+fyQS6tBXRZZldjN9dGqnUuoYV0O4QGVqIgF5/8mB
	moAQguZw/HOnDcfq1PHpOlqpgbdlTJw148vNiy4OM1syqfUayBOjbyzxWXgRrp7PJCLOmkM+KPO
	Y6alD6VIQpLKU8JVdfrRxILK+Ewd0aKHD+e5sSuapYdfNoYo+pLvpv9xB7rBxCdB6cY3XhIj8uJ
	JT+taiCvI5R9LqJebc4J3RMNbGbILrAdL9rp400uo
X-Google-Smtp-Source: AGHT+IHUmqg7NAYc4XFHXhX+tyP5SgBETXrzu2ZG8Z3CFGWPLs7OXRU5fM4DDvLkUClUy5+lOQYM6g==
X-Received: by 2002:a05:6000:420a:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-39c2f8c787fmr2080108f8f.9.1743679502620;
        Thu, 03 Apr 2025 04:25:02 -0700 (PDT)
Message-ID: <e14bbf31-24cf-4b82-9b2e-a473ad16d008@suse.com>
Date: Thu, 3 Apr 2025 13:25:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] time: drop cast from NOW()
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

It gives the wrong impression of there being a type change, when
get_s_time() really returns s_time_t itself (kind of naturally given its
name).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/include/xen/time.h	2024-11-21 21:12:47.000000000 +0100
+++ unstable/xen/include/xen/time.h	2025-04-03 13:17:59.784804154 +0200
@@ -53,7 +53,7 @@ struct tm gmtime(unsigned long t);
 struct tm wallclock_time(uint64_t *ns);
 
 #define SYSTEM_TIME_HZ  1000000000ULL
-#define NOW()           ((s_time_t)get_s_time())
+#define NOW()           get_s_time()
 #define DAYS(_d)        SECONDS((_d) * 86400ULL)
 #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
 #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))

