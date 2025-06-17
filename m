Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22EADD3C2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 18:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018328.1395239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYl4-0008HP-Ih; Tue, 17 Jun 2025 16:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018328.1395239; Tue, 17 Jun 2025 16:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYl4-0008FQ-G9; Tue, 17 Jun 2025 16:01:58 +0000
Received: by outflank-mailman (input) for mailman id 1018328;
 Tue, 17 Jun 2025 16:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRYl3-00088u-Ij
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 16:01:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f9fd46-4b94-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 18:01:57 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so3346563f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 09:01:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23692e44fcesm15327245ad.169.2025.06.17.09.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 09:01:55 -0700 (PDT)
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
X-Inumbo-ID: 64f9fd46-4b94-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750176116; x=1750780916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kbK8A6UfhnsYfm+d2Zb2+HPRhtyajycOq9heJRLUnAo=;
        b=U9vru15wWlEjVchU6yC3JVz2j0jh07gN2B5AjPpzNIg5KX5tjh5BUND3Qk8e+yCx5Y
         8zTjvg3BAp3CnyCTgoMqyyqnrSu0Xh1VBMh8o/k2FRarP0Qfsq5s4RCPvzuKm2A7xlf9
         CVXhUMU0u8hWYVqw+Nd6RgaYsoO8xl8WdbdL+ERszcLMHfrOE09kegtEXlf0BwkR0hE5
         NamRwoBD9tGevePeotXPVAEvIL/8gc+A94SCIJU8zRPFXRhaujbhwh2MzRnT2WqQnHd/
         JhFA0WG3pSrbFyvPUatCuBkkjPdtkHQqDODTVAPLfQF011PsAel8z6dw5Eowhf2NBHrQ
         lu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176116; x=1750780916;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbK8A6UfhnsYfm+d2Zb2+HPRhtyajycOq9heJRLUnAo=;
        b=JVExQ484HmBlySk9rOT2i3/bvDKvQ0x6fSwmQ5WWO5+OQ7trHTmLO3mb4vfJv4OC28
         LzoJ57dTR/yqXmnNyW33ye+J1naFqOgEji/xIvez3j7vgb4p6+81ZBMCoALe2PBWsUtG
         PPN9+QsuYY/UY98u3O1RkaYGJqdVan0f3pTeQXX91Aa2BjSnZB/mZ/Eva4pRZV3HZ0oo
         YqVIfwm75iHCsrndQEmM5GH+Z1aIm9P5zjI0JKr/o94X9YLAkE8PAGkfCHBnowvkSTJO
         Np8nut5RBZ/qU+OXFDoeOtZSvj0WK38vl6RvHMYViApOrwk3mCG5Hw+/pjTxm9+Od9nF
         3b0A==
X-Gm-Message-State: AOJu0Yyk0zvc1WavNYpIfm5SnxDXFdOGVbmNecL3OZ95QqnnizpXM2IL
	miuN4ivK9NZinzZmc0cP3KqC6IYaReW6Tb6VSyUYwuSQ9SUGCk4rKB3Q3u8fcw29t/yZp4R7Atp
	P3d4=
X-Gm-Gg: ASbGncsO/wT2aUp1v1N1v2C/OdvZnAPl4T+gk/4/RZlrknj//lZOXikzs+fUK0AsOJ3
	XIXzPE4EMc8imfzoXz650ZV6SaehtJKNlmsDC7hd2H/goFklSO7bVtJu8P6z4lIrEMOY4AbBlfO
	WNxoQXjExhHL2p3su+4UGjDmrYR0ThWsg6m/sS9OIYTBsFCBv6VSZRH/uVDFSdMB//dUoQ2a7/0
	8R90Zp/DSyd4qiKqRD7uyr0Szcrv5ZRb2chVW+raAaf4zZ2U36LL5pn6Ye8gQ1tX++R3/y6plMG
	WehrycvcxVOzntDzftM4JEOMDmRHtvLDvt+JUbmCRMWTRqnZhTC6QoDT5MsEj+8d/5cmSKi2dpZ
	wFOPKoebMESrr+ggIzU8ebOtryX3u7YrrmlbgXjpKLJ1Kf2I=
X-Google-Smtp-Source: AGHT+IFQloxc1HO51Alt+gIn4xw7hcnYk6sIpicZjdJHPtrOPiDNlAJ3k7VsgBmyqCoSBTTUM9cC0w==
X-Received: by 2002:a5d:5f87:0:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a572e588d7mr10765151f8f.56.1750176116374;
        Tue, 17 Jun 2025 09:01:56 -0700 (PDT)
Message-ID: <23dc1582-0e24-41ed-9433-787c7ef6f658@suse.com>
Date: Tue, 17 Jun 2025 18:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/5] vVMX: prefer hvm_long_mode_active() in
 decode_vmx_inst()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
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
In-Reply-To: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All affected VMX insns are invalid to use from compatibility mode,
and hence the more expensive vmx_guest_x86_mode() doesn't need
using here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -430,7 +430,7 @@ static int decode_vmx_inst(struct cpu_us
     }
     else
     {
-        bool mode_64bit = vmx_guest_x86_mode(v) == X86_MODE_64BIT;
+        bool mode_64bit = hvm_long_mode_active(v);
 
         decode->type = VMX_INST_MEMREG_TYPE_MEMORY;
 


