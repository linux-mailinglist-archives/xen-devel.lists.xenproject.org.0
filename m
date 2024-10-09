Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D25996529
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814035.1227118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySuP-0005Ql-Ii; Wed, 09 Oct 2024 09:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814035.1227118; Wed, 09 Oct 2024 09:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySuP-0005OB-FJ; Wed, 09 Oct 2024 09:23:05 +0000
Received: by outflank-mailman (input) for mailman id 814035;
 Wed, 09 Oct 2024 09:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sySuO-0004IZ-2Z
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:23:04 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15ac6623-8620-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 11:23:03 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99543ab209so410363666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:23:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bb23bsm631027366b.34.2024.10.09.02.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 02:23:02 -0700 (PDT)
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
X-Inumbo-ID: 15ac6623-8620-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728465783; x=1729070583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ztKKNRdazt+hQvk49PZFem2qqn49Q1QaFTJERIwQniE=;
        b=JhlBX9b0+3aEHqobABZrthI3Ucq2eizf/btUWxmpR9FmwUbljjeZGY7fW0YY7OiTYR
         dv/maqxu0nxDA0gm1CSMYjRogSa4w3gRw73jHRabtNJbwdRqaUHDyqh7viifcS2beA5Q
         2pnF0JWpks7l4hsIHr822715ZIn2+E5PhVBY1aTn7wU7tkvRto9nd1SDs4ncrOZHw5ol
         lZ9yL8nNyfKp6SsMmBKseqYFpURcLmB2P7/MY1LDs7J5Z6JxCfeAVSFTqOAC4SK2d+Dk
         dGxl5J3Ho1KSseVSkyMdPp3o1nonX0UGTJ05cyeLj3QMdqRRgD0G8dpJ2+lEcwuSVDgL
         D2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465783; x=1729070583;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztKKNRdazt+hQvk49PZFem2qqn49Q1QaFTJERIwQniE=;
        b=gGPx9MVphwGN+hHhuMqtGjcD3JAZ1RSZF7WTL58AQOeXum6LOoqAdZ4IC8QIBdUkS6
         1EiykwfbNFAhC2gr8HEhwx5Y6RdedwJMyOmjGZ3gijxKRubg9EQ/pG/KdVp5JUfG/Gvr
         X/rxRqxcasQnnyiWBFsxfydJHPSbKZu0ESyN/7I0FKjOKzC66N2TUXGgpEkMCHlCBaPK
         zNNsaO8P99ren44N+IxAyG+rd04rDHuCBZL1XxSLXgYYjgfRSarjLH2nM9nG/cMI1dy0
         VZ5DjuQe70g1T2XqL8lqMzmAJSpUSBbM3sxnu0or2rX1z3QOfkD3+jS4yJU1L3XdahKL
         rd/Q==
X-Gm-Message-State: AOJu0YzzQvMfUZIitRuzECXrJlleHp/yj71LVf0wkjuhctzqv33+kP63
	NdQzzPpS4R5/nBy20VQpFOqO7S0T8b379XTA7e8mHnXXx/HJz5Velruy3IncjeH9Df+jStazgg8
	=
X-Google-Smtp-Source: AGHT+IGgfaHKwCHARGavcTVjouTGH6n2acn/einTMyTMQZCrnKjp1N13YFdE8PwP+JF5pNSqJoS4Jg==
X-Received: by 2002:a17:907:9487:b0:a99:5c0e:e3ca with SMTP id a640c23a62f3a-a998d201507mr104814866b.34.1728465782814;
        Wed, 09 Oct 2024 02:23:02 -0700 (PDT)
Message-ID: <868d803c-0a88-4080-99b1-68e6f8b92c25@suse.com>
Date: Wed, 9 Oct 2024 11:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/7] Flask: replace uses of __u32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
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
In-Reply-To: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... by uint32_t.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Uses of bool_val look suspicious; I looked at them because by its name
I would have hoped I can switch it to bool instead.

--- a/xen/xsm/flask/ss/conditional.h
+++ b/xen/xsm/flask/ss/conditional.h
@@ -29,8 +29,8 @@ struct cond_expr {
 #define COND_EQ        6 /* bool == bool */
 #define COND_NEQ    7 /* bool != bool */
 #define COND_LAST    COND_NEQ
-    __u32 expr_type;
-    __u32 bool_val;
+    uint32_t expr_type;
+    uint32_t bool_val;
     struct cond_expr *next;
 };
 
--- a/xen/xsm/flask/ss/policydb.h
+++ b/xen/xsm/flask/ss/policydb.h
@@ -131,7 +131,7 @@ struct range_trans {
 
 /* Boolean data type */
 struct cond_bool_datum {
-    __u32 value;        /* internal type value */
+    uint32_t value;        /* internal type value */
     int state;
 };
 


