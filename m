Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A0AA715EC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:39:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927648.1330369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP61-0004AA-EB; Wed, 26 Mar 2025 11:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927648.1330369; Wed, 26 Mar 2025 11:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP61-00048N-BD; Wed, 26 Mar 2025 11:38:57 +0000
Received: by outflank-mailman (input) for mailman id 927648;
 Wed, 26 Mar 2025 11:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txP5z-00048H-Fy
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:38:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e53bd5f3-0a36-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:38:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso42802025e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:38:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f33237sm232100225e9.4.2025.03.26.04.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:38:53 -0700 (PDT)
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
X-Inumbo-ID: e53bd5f3-0a36-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742989133; x=1743593933; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aXxR3hXL+VeKHVX9AtNaLzjk3a+vjAHfbpLeqoQkPY=;
        b=Ky238BiQal+NEMLTQCMHYRXNYMwvKfJiEABdStVbv+9wZkOjl4sGD1YifQQw+sA4V8
         4Szm11Yub9Gl59/MrqmwX44bvRoFrzsW9uDJlNqGs4LvdD07NHH8ysfAIpiYKWg8cedf
         YZn5Bllwsl9kO67GrUuvU5pftXjZ5fJaz6IGIBbfJ3mh/O4LNWS4TCmiZFeVz+VxiTAh
         9fEhjfE9Ei/SNyZwYL1CoPSTB7XXWdspIAUsxE0jgMDS4CxjVwzA9jEGrn1Vd2peszCW
         8qj8os3oAahlX8ZzIAVhZpK2Ch7GdRaBqZey1yB6coragmem7yDwc6IK6ITWKuvR0xcw
         pq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989133; x=1743593933;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6aXxR3hXL+VeKHVX9AtNaLzjk3a+vjAHfbpLeqoQkPY=;
        b=gzyW0ERKHrOJz6NDjBjtjlcJcfCAno3R/j9JfGBvXeGqB7OwZCvLTmpd0DL0LLb3jT
         0tJUlnX33BRtkaE3xGeysvdMYcG1qGBeacQcZT2bgGiBSvyrgpDJNj5mY+16wEWTaEOM
         sNijf/UcYDqS/smOg7jTT30/Daa98hYQ7ZgmtXQ9fhpqcSE5o/F1CzhNvRqhX6pLmOeg
         8Ozhlw4Ma2bS3WCYan8oNnbxbDeJD+B7vsTXFSw9HVOrUT69oV1MiqaelkmxPzArKg1W
         MOGozh4X7VL8p7B6QI4J3cOpVqgjgn/McERiSy/sYhV5nCu5NhP0uZylVwkITXzhy0h3
         R4Qw==
X-Gm-Message-State: AOJu0YxUdSEmsuPHtAaljNjCsIb1YwNsQdq5lsHVEN+yk/RslukKe9kI
	m1UMA8JDks88R6lfC6klNC5Fn7dAnX9Qu7ueNqQk+1esgxcnNtiLQTpde2PS7mN/SEuZmgVOofo
	=
X-Gm-Gg: ASbGnctZO52FjsmhKknQxEtCQ0mHpDAb8jDbcbktLt3GRmuNv+Yy+Dc7Yas6lTILfM4
	DzL1OmEFcULb97dEPd3W7aTQX4S9lHCVEJEcdaQuRcQDCHgisOnb/M9F7DyKi0D+vNdjRTnJb+P
	UcnY7btitM4S5h4eDOFoCsa2P+q/WQnoG2g2lM1XXa6r52O+kZkZeqAtc8mJHOinHwiXMf5l+je
	Um4M8x/RIq+3CZ+fBv8X4GMGNJ9oS4p3mLbDlasZxpLykEEuB7g5hf9pCzuIU5AVW01DzjyCEGx
	LoShzOc5p9qDbWaWvjCyIoDuIYX1l6S72JzGrN3G0G/owVYtnwPRVioHUs6msNxYO3bacLsb18h
	Pexqozw5M6BYzitMk0WjWMgCyczcW+Q==
X-Google-Smtp-Source: AGHT+IH5erneXS5jGtt5+YeZwJ338HyKZeXGoAKm7Hf/prj863Eplc4VPqIo7q5iDdSSwLi+elYkgw==
X-Received: by 2002:a05:600c:1d1a:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-43d509e43d8mr189981345e9.5.1742989133358;
        Wed, 26 Mar 2025 04:38:53 -0700 (PDT)
Message-ID: <59051630-3843-400d-9127-a6eff15a2b5d@suse.com>
Date: Wed, 26 Mar 2025 12:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/pmstat: correct get_cpufreq_para()'s error return value
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

copy_to_guest() returns the number of bytes not copied; that's not what
the function should return to its caller though. Convert to returning
-EFAULT instead.

Fixes: 7542c4ff00f2 ("Add user PM control interface")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -230,12 +230,12 @@ static int get_cpufreq_para(struct xen_s
 
     for ( i = 0; i < op->u.get_para.freq_num; i++ )
         data[i] = pmpt->perf.states[i].core_frequency * 1000;
-    ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
-                        data, op->u.get_para.freq_num) ?: ret;
+    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
+                         data, op->u.get_para.freq_num);
 
     xfree(data);
     if ( ret )
-        return ret;
+        return -EFAULT;
 
     op->u.get_para.cpuinfo_cur_freq =
         cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
@@ -272,7 +272,7 @@ static int get_cpufreq_para(struct xen_s
                             gov_num * CPUFREQ_NAME_LEN);
         xfree(scaling_available_governors);
         if ( ret )
-            return ret;
+            return -EFAULT;
 
         op->u.get_para.u.s.scaling_cur_freq = policy->cur;
         op->u.get_para.u.s.scaling_max_freq = policy->max;

