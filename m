Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0D94BE8C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774139.1184627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3EM-0008U3-Re; Thu, 08 Aug 2024 13:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774139.1184627; Thu, 08 Aug 2024 13:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3EM-0008S0-P2; Thu, 08 Aug 2024 13:31:02 +0000
Received: by outflank-mailman (input) for mailman id 774139;
 Thu, 08 Aug 2024 13:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc3EL-0008Rq-49
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:31:01 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c74ea5-558a-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:30:59 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f16d2f2b68so13222491fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:30:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec8860sm731607066b.209.2024.08.08.06.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 06:30:58 -0700 (PDT)
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
X-Inumbo-ID: 72c74ea5-558a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723123859; x=1723728659; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7yswg46iYRjmCAQDqekaVXbZBIqwIPJAVVIJjaG0+c=;
        b=Dw9czV8vXNd+f6Urp2YisuJE9iMnhpr3vwO6y6pULaqtb8tv9U6lcMaedh2HLg+guW
         BbYR3mhS0v+eHbp+vaIRGWg4/n+WwGrE+lIdTb3DjTvzLp+aiWREc8xod4Q6erWZZOEI
         DasixbedX/lIUR68lD3XfnOdKZxeaV54pSHEO5BGF/sgCaMEf2a8X947uuRhpUbZLGaX
         EZfHTJRYjhvCyCA2QV7LbuItkvSmCJnmE0895sMc4qhvgz8EePbVOteB6H6HypuWZp0I
         A4Ty0pQWwIP8GxuUDG7ZAL2YBypt+6MDL2yZ0/3r2IVcEoxaA+kKt7LaD0uGkYg78ug4
         1xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723123859; x=1723728659;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7yswg46iYRjmCAQDqekaVXbZBIqwIPJAVVIJjaG0+c=;
        b=PMa0nloKmy9Wrsf6t4Pvkj64bIon0a0v4ir/5KPZqXIUprqueSsUDvDuT/IRYA7Jk8
         hohc5tYxwjZV0z70Spx6ZNZycQfKozYhowGASxYSDyQfGQh5IFJqeGjuBE3T/gWJM0ax
         Li1DMOgUDCgo8AmOxtZCMsljid7Gdkw+1RdRe5n4puHkfm9no/fE8nzxlY2EEaGDyfCo
         36ULcXMyQis4zqt433zxFMZN3Sn/em3VPQD8iQJZyd8QC1QjLm4z/jh4wf4kYa0eWxpZ
         +50H0i9dfFAZ/B0cni7DHLmXomrwCK+kxWwDC6gK41h/T501MXfMojCg5EH7SJ7aCvvT
         3l6w==
X-Gm-Message-State: AOJu0YzZuW9jZy1WSjedTypL3V7VK3TaCy+wY4eP/vOzeiRprDGTLumd
	ovvlt0gf8CbR1FWjfO1oIehEpI57cS9iJ6Wc1Bs66MAgiy3KugKieO2cQ5MUqCdMgDSUFGrGa/4
	=
X-Google-Smtp-Source: AGHT+IFp2j1Q/KHB3Y0cT90mPoKS97XyvSAx2TSuwzQp4oqfRUfa1y8CB284P7J5K1u3evF4IZe9lw==
X-Received: by 2002:a05:651c:19a6:b0:2f1:922f:8751 with SMTP id 38308e7fff4ca-2f19dd85aa8mr20555571fa.0.1723123858519;
        Thu, 08 Aug 2024 06:30:58 -0700 (PDT)
Message-ID: <0a082833-3d52-4c9d-8ea4-5be01986cd2c@suse.com>
Date: Thu, 8 Aug 2024 15:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/x2APIC: correct cluster tracking upon CPUs going down for
 S3
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
Content-Transfer-Encoding: 8bit

Downing CPUs for S3 is somewhat special: Since we can expect the system
to come back up in exactly the same hardware configuration, per-CPU data
for the secondary CPUs isn't de-allocated (and then cleared upon re-
allocation when the CPUs are being brought back up). Therefore the
cluster_cpus per-CPU pointer will retain its value for all CPUs other
than the final one in a cluster (i.e. in particular for all CPUs in the
same cluster as CPU0). That, however, is in conflict with the assertion
early in init_apic_ldr_x2apic_cluster().

Note that the issue is avoided on Intel hardware, where we park CPUs
instead of bringing them down.

Extend the bypassing of the freeing to the suspend case, thus making
suspend/resume also a tiny bit faster.

Fixes: 2e6c8f182c9c ("x86: distinguish CPU offlining from CPU removal")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -228,7 +228,8 @@ static int cf_check update_clusterinfo(
     case CPU_UP_CANCELED:
     case CPU_DEAD:
     case CPU_REMOVE:
-        if ( park_offline_cpus == (action != CPU_REMOVE) )
+        if ( park_offline_cpus == (action != CPU_REMOVE) ||
+             system_state == SYS_STATE_suspend )
             break;
         if ( per_cpu(cluster_cpus, cpu) )
         {

