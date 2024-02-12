Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FCB8513DA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 13:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679570.1057057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVov-0003iH-Kp; Mon, 12 Feb 2024 12:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679570.1057057; Mon, 12 Feb 2024 12:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVov-0003g2-Go; Mon, 12 Feb 2024 12:54:01 +0000
Received: by outflank-mailman (input) for mailman id 679570;
 Mon, 12 Feb 2024 12:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZVot-0003YI-Dh
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 12:53:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9c20310-c9a5-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 13:53:58 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-410deab9c56so4679755e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 04:53:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b0033b843786e1sm1973101wrq.51.2024.02.12.04.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 04:53:58 -0800 (PST)
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
X-Inumbo-ID: c9c20310-c9a5-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707742438; x=1708347238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mbVyp1i6IDxX6RGOTJDic76W4aj3SGd/6f+hawIv8lU=;
        b=cw5W3Hbon3d3BuN1Uueb0qsFBRmqi37mbAM0O1VeADl7BxtAFGpjtc0/9tNYbPklNn
         Zbkt6FR5lqOFRpCtfwGpIByX2O0epYLG6Sx++DjIwy+b1BMJQogIcOW/rcL7WFHrrgPQ
         R9glZkiDDnbKp5VrS3HQFO7RULZ/u9NwY4EfLryJwYcBXtjKvg7BaqQi7uuUWm91rDLq
         4zfAvGx4lEK3nMfp+0zD9eL7ATR8psQbIBDt7jK3RpU9StBnTkTVxsnjLYeKjp1CY0PW
         beXfHHfwfViXR96e5BmQuQIBOcNZLQ+5l69foFPRmMSsxXkTI4T2KNQprgFKIWZSaVDi
         K4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707742438; x=1708347238;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbVyp1i6IDxX6RGOTJDic76W4aj3SGd/6f+hawIv8lU=;
        b=O0scs78ng9I42IiPlspWTlEE3QwU+3K3yINqzeRd3aZ0Y6x8BXNOH0iN/MhDUeBGMN
         wrhfZe9V16O7vK1hMkoYpHrPXeU9t4Fx9ayF40wzIUOGDZrP7EGAp5Wr6YXHzrmfHrjA
         WxdG+fcXAn4Jc267dQIMrItZu8i4yNEmcmFSMk2JfL/Q1qlbGZvyhaLgCCFq9HJQPbId
         Vq0WAb/lGZY0cmvFizrU7X3WxmiA9esdKzUD4aLqskbRrMH4pFPyoCeI8twpI2RxQLkF
         qnnb5dS4818dX2bZ9X/uXHsYpCnJ75srWuvSp8D+NwB/WoSFZnOam3v+hW5fLPEud4v1
         uMQw==
X-Gm-Message-State: AOJu0Yz1ohq+iaerwL8UPYeIz6+FTIAGNr3DWhRfV1epuCDUoQK5ajqj
	ePGDpI1cU1UldsKb+ghn/mwqRfH2EijVESRjD7zuEiG4Xo/iP+eyceWw9YgApLgHY3oj6nxzfTk
	=
X-Google-Smtp-Source: AGHT+IEemPcHCzneBQ2LN1NYHNpP9iPDwNmQ8qR5MtXty/HpN3B/rmFG+l3d+UAx6jbLaq0hJyG+AA==
X-Received: by 2002:a05:600c:3555:b0:410:61ce:f5c3 with SMTP id i21-20020a05600c355500b0041061cef5c3mr5453655wmq.19.1707742438328;
        Mon, 12 Feb 2024 04:53:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXD9gvlE/YKV/DqFTKJZ3cNvsnJambtTG3sUz1PYinFr9oBn8t7KnNa/npJJ2/PlH1JL2fswvNNo0RMPqJIC/YRrjUJjiFBzJbeDoyIzbp8qQ==
Message-ID: <53bb631d-134c-4670-8bc2-aa5b5c4b558a@suse.com>
Date: Mon, 12 Feb 2024 13:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/MCE: adjust x86_mc_get_cpu_info()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4c4ff91e-ce66-428f-a360-6ffc55659e79@suse.com>
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
In-Reply-To: <4c4ff91e-ce66-428f-a360-6ffc55659e79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move logic independent of c->apicid's initialization status out of
the if/else, leveraging that cpu_data[] now doesn't start out zero-
initialized. Constify c and have it have an initializer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -992,21 +992,14 @@ void x86_mc_get_cpu_info(unsigned cpu, u
                          unsigned *ncores, unsigned *ncores_active,
                          unsigned *nthreads)
 {
-    struct cpuinfo_x86 *c;
+    const struct cpuinfo_x86 *c = &cpu_data[cpu];
 
     *apicid = cpu_physical_id(cpu);
-    c = &cpu_data[cpu];
     if ( c->apicid == BAD_APICID )
     {
         *chipid = cpu;
         *coreid = 0;
         *threadid = 0;
-        if ( ncores != NULL )
-            *ncores = 1;
-        if ( ncores_active != NULL )
-            *ncores_active = 1;
-        if ( nthreads != NULL )
-            *nthreads = 1;
     }
     else
     {
@@ -1016,13 +1009,16 @@ void x86_mc_get_cpu_info(unsigned cpu, u
         else
             *coreid = 0;
         *threadid = c->apicid & ((1 << (c->x86_num_siblings - 1)) - 1);
-        if ( ncores != NULL )
-            *ncores = c->x86_max_cores;
-        if ( ncores_active != NULL )
-            *ncores_active = c->booted_cores;
-        if ( nthreads != NULL )
-            *nthreads = c->x86_num_siblings;
     }
+
+    if ( ncores )
+        *ncores = c->x86_max_cores ?: 1;
+
+    if ( ncores_active )
+        *ncores_active = c->booted_cores ?: 1;
+
+    if ( nthreads )
+        *nthreads = c->x86_num_siblings ?: 1;
 }
 
 #define INTPOSE_NENT 50


