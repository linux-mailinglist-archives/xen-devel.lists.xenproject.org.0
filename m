Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C7B0906B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 17:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047012.1417394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQNv-0004Ub-MD; Thu, 17 Jul 2025 15:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047012.1417394; Thu, 17 Jul 2025 15:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQNv-0004Rm-Jd; Thu, 17 Jul 2025 15:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1047012;
 Thu, 17 Jul 2025 15:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucQNu-0004Rg-N7
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 15:18:58 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bc46298-6321-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 17:18:57 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so720551f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 08:18:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f8f343sm16301036b3a.161.2025.07.17.08.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 08:18:56 -0700 (PDT)
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
X-Inumbo-ID: 5bc46298-6321-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752765537; x=1753370337; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Gnfomx3X2pAFzFU6MDRocaMhyxthavaez674R7uHAs=;
        b=AxCj0maIFe4ZBwnrilwlYQ9zdbGvv4vYp6vsJRB7eA6gYmcKQcAlV1Kd0c+iFplSQs
         Wv4H2NU0WFCd5cUOk+KuDrdFYnqEHg+ko6hAcTx6QMyGjpFHkS/bPWJEQ3CtuxqgSga/
         XsZJ8P/9MTH89Z/nC358yT1bJ47pUyTlyF6oci1kuHxqM30A1HEJbUN3A/GjIj/a7cRS
         cGsrv/CqVntIc5WbBWbNvIcvXBnvLW2tPWnB/o4QbaVILLicDmL53aTzxKuqOmsdsPN3
         nqI2zenbxyI05CocqruAhrrWTRCouum0RnDQwENBSVlwIaerw6Pf652cMuAesKCjp5ju
         mNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765537; x=1753370337;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Gnfomx3X2pAFzFU6MDRocaMhyxthavaez674R7uHAs=;
        b=EPbLSWzSevd3IpbflLuZbMtzEns25ydRf8UTGvNk7MCJJdh7n2mRsVS5WDqLddWxvs
         roaHJj2p0sS/1XPZPKYgrq1NvN98b+MVUehM+xp6NDieqoRGMne80X1zro7p6J8f8/W0
         cZySTabCR/PQ0+Z3EzF1eOnYqdkEmda9zs2Zx3CPGFeSYu4OVpiKkbXrHWrCYUTI2lKr
         Wo4NSaYDpW3eQsZs1qs6lJEVXc57tkqVfIWkt+BmS3oDvuNNe7XALQbH4Gr1EMhnSqnu
         fdeG4Kx96ToQZyONS/AsPV8xz4/vBoDQGaFP8L0cTvWTVWdHiCWG+0e8CNxFptDxK/y3
         Hk0A==
X-Gm-Message-State: AOJu0Yz8ODhEXhfEQCcsEJYqSxhJicZLnnZ6iTHdL9u/Jx5VWiyObJiH
	Bnu5Z9WcfjP4fXonNdFajbO05CfZp+MyNpY1ciAEBd2cXEipte+AuniG9VLFcXjX8jQ/EZKgTD1
	a4Kw=
X-Gm-Gg: ASbGnctOtrXuJZF7lvyySL9of0mUmv3uwwYSRZD8VpbYx/1DfBS+nJf56GkzAT9x2RH
	BbHoQ7hMTp1rVRorzVENcRpwWT9q/eQ3dX3DszsjmB8tfoqth252xmBedjtdUriH4qBVi/5m6Ca
	04OS3uJvgPjfnXhcwyS9AjpAuPMHCVqS1cTTEYvq+vJDuZtlQkVvNAaU9FOc/krgdxkQPGKEA/2
	p90u1TfOggkhBCEk+UnfoQvoUQIy+dQKvs3W2iIiIPzdb1CAhnmYAj4mFSzKp0yb2tEbG330WLG
	5qzD9vmbgjuK37a5SiL3TeboMQcEPXaOVKUnyB1ccPuoD8Daob3UX5brpI/8KViYLHf4PtcaLzt
	LE6rCC8kBeXo9tn8+K0ZtZUFt+3l0Uh1NUyBONlTo4GMoSzrWqGOuSYzDxDbQh4uaCOOc9C2Q+M
	0FwpBrjJ0=
X-Google-Smtp-Source: AGHT+IHaGxvr5hiYdpWdD5l+NlByKScYtcoGKhBoF7Aadi2HAzIK/gS/Ei5GiYizcuv2b1JvRYpLdQ==
X-Received: by 2002:a05:6000:26d1:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3b619cc0de2mr215278f8f.18.1752765536844;
        Thu, 17 Jul 2025 08:18:56 -0700 (PDT)
Message-ID: <40ea8cc6-d5f0-4e3f-97ba-2e35ef4c5698@suse.com>
Date: Thu, 17 Jul 2025 17:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/S3: don't lose previously collected CPU data (AMD extra)
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

smp_store_cpu_info() doesn't call identify_cpu() again during S3 resume,
hence it is wrong to zap APs' data while bringing them down (and we're
not just parking them there) during suspend.

Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -982,7 +982,8 @@ static void cpu_smpboot_free(unsigned in
 
     if ( remove )
     {
-        reset_cpuinfo(&c[cpu], false);
+        if ( system_state != SYS_STATE_suspend )
+            reset_cpuinfo(&c[cpu], false);
 
         FREE_CPUMASK_VAR(per_cpu(cpu_sibling_mask, cpu));
         FREE_CPUMASK_VAR(per_cpu(cpu_core_mask, cpu));

