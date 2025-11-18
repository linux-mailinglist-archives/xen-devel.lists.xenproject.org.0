Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556AC6A33B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164904.1491757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNH7-0001qY-4q; Tue, 18 Nov 2025 15:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164904.1491757; Tue, 18 Nov 2025 15:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNH7-0001oe-27; Tue, 18 Nov 2025 15:05:45 +0000
Received: by outflank-mailman (input) for mailman id 1164904;
 Tue, 18 Nov 2025 15:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNH6-0001oV-4F
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:05:44 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d9fec03-c490-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:05:43 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b736ffc531fso718723066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:05:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed90c0sm1387633666b.65.2025.11.18.07.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:05:42 -0800 (PST)
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
X-Inumbo-ID: 0d9fec03-c490-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478343; x=1764083143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pgIgBRyiwOjy12i+6dPUnzqpZO6a+/apZ7nKGk1jXJ4=;
        b=fhzV+UEwSuV90Ps+qM2iWY8y/q8SnJNeFHI6kAHJA8EywDq5x/OLbzOz5D5XRRRcd7
         ikuu9ESA070puRnoKM94TPkrO4Ss1FOL5Pg61XFeACb4UtRzmO4AUhzECew51L0XmB/z
         lQZ9uEJieFoYFME6/AV06cYEsKiTY6YWBC/Td0ABzOcCcVEHQQFsYcWChiXcaZGktTue
         H9qDuIwuF+OpImnFA6FY0YdT7QT72VNKjBlSg4LaD8mruHJGPZ+JGT+V3B4m4apTf/ry
         w6wIkyK2XpSu/OKafuveLHrVtBLIBLFWgNnvEQCTypBjNbxtzzLYHkkDRVzUTy0/7cqe
         2lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478343; x=1764083143;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgIgBRyiwOjy12i+6dPUnzqpZO6a+/apZ7nKGk1jXJ4=;
        b=PO0T0EyO7cxHxrSMZOwBpE43da/iyqSN/hjtY+4VV/soTTp0GdvbjvoDPek/Cmfhy7
         rf91QHThPfGDI5lrecm8T2tMAB+TZnKQWbEwO/DWdMlzxsfXU3DulwaUv2ncsyfD0QF8
         tVtUezJvDXMZZAhweuu/eE5KW8wQlWMiCPp9cO0xD2tjT0xn52KIAgQOUV4gfNMtZ7eb
         fExlJQ6UCZcnUxR9kqQSDBc9Mo0ScVCH9ncAPBW+hSU6wD/jrgtPv2u3YVeHortLGME6
         zo7KFiWXX6Z5HmC103+HQZJ+bXzuNEIVCVp+4kc7RNkUjcEWcXLwfVjfFk5uc0gzDfzY
         Uj+g==
X-Gm-Message-State: AOJu0YwLYBgkmlB9rO7MGHeIgjUQL57iysJJROS/WMINAPURsgiSDBzg
	UkiIqubHHVmjgWfw2iFEbHaUgVJdmFSIbyc3LIKTPnTrVngxeJ9Ld0DdTkJ59ZAlRw+piIhRDX+
	wbjA=
X-Gm-Gg: ASbGnct7WWWD+9EPR7yJHtCVuPLiDj+7Xc6rzUbdi1sNm34GfMkeVXXN6uoUZrPj7Ob
	2uVhPpuhg+pYJe27j5L3EnaZoQZaTFvCfAIuQYjomrlpvEYEFltFYYAov+6eQnZpvobc+Nhc6O8
	2Fr4XGswKg5kcIQePED/om173bm3vOe09V/WzvGaBihb7snEuDDcF+FKZpCHyKyLOfoH+wdKyIK
	jXxYvDeZg3vdHhP+9LJvKjpmYN9Ji/om2jSFh+nHzQEAlhWkbcWE70ayeXLIlaF9dK2QeSBrPMi
	JwGSQb6jR58kYvBCjlzBgvpbknnOM880hikIAjd8NQmhZ6bwPMDMYIIVOR/A32KisrHUWSs/k6t
	tbJvX3IRAVWhBaRxeN6QlszczyyWJ8kx6zhf+G9+xYB86QdfGHVHKhKbyBrv41+SFmusHjhkMUw
	yeTUV9PeY+P0unIcHhTaGJDglptR+IbpJ0huhBEu+Hs5vxBLIFzoiiIAskVywbmYlnasprKa/GK
	PWSKvZE50wDSg==
X-Google-Smtp-Source: AGHT+IFpf6pTRBLI+R8S1l7vTgZNNT3iCQA3US4G+aR+ZYIXjj2+t2wNhkPnHMWteSDiMYPU3RSJ6A==
X-Received: by 2002:a17:906:9fd0:b0:b72:b8a9:78f4 with SMTP id a640c23a62f3a-b73678f4f66mr1837416166b.39.1763478342628;
        Tue, 18 Nov 2025 07:05:42 -0800 (PST)
Message-ID: <ea7237e2-9026-4c79-8cd6-7b62094aab1c@suse.com>
Date: Tue, 18 Nov 2025 16:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/8] x86/cpu-policy: move invocation of recalculate_misc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
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
In-Reply-To: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The function is about guest exposure of features / leaves. There's no need
for it to be applied on the host policy. In fact doing so gets in the way
of using the host policy in certain places.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -383,7 +383,6 @@ static void __init calculate_host_policy
 
     x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
-    recalculate_misc(p);
 
     /* When vPMU is disabled, drop it from the host policy. */
     if ( vpmu_mode == XENPMU_MODE_OFF )
@@ -634,6 +633,7 @@ static void __init calculate_pv_max_poli
     unsigned int i;
 
     *p = host_cpu_policy;
+    recalculate_misc(p);
 
     guest_common_max_leaves(p);
 
@@ -736,6 +736,7 @@ static void __init calculate_hvm_max_pol
     const uint32_t *mask;
 
     *p = host_cpu_policy;
+    recalculate_misc(p);
 
     guest_common_max_leaves(p);
 


