Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842C8D34DD
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 12:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731788.1137489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCGp4-00012K-Ht; Wed, 29 May 2024 10:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731788.1137489; Wed, 29 May 2024 10:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCGp4-00010a-F6; Wed, 29 May 2024 10:46:22 +0000
Received: by outflank-mailman (input) for mailman id 731788;
 Wed, 29 May 2024 10:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCGp3-00010Q-5o
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 10:46:21 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af13c275-1da8-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 12:46:20 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57a033c2ec2so709417a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 03:46:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579bfc697c6sm5605444a12.70.2024.05.29.03.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 03:46:19 -0700 (PDT)
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
X-Inumbo-ID: af13c275-1da8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716979580; x=1717584380; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrABS7SjAcs27w1VQMkqKccqeT9vVGVOfZ3FokQbsNI=;
        b=b3BBoHnSFDmD6T57/18dC8whkkFnLgxRtgAlMwk3NUj8ic+KNN/LacptkGaRNlFgN0
         H5JmQpLsM9OCORCJhRAPM5JkopUT+OqL9xnrUmbrSc12T3YshteY4m0aIcXT8eCmJs6I
         Xsu1bAwsDK++TVEIX9wKu6v8Zks1gLDip+bJjlP5LWhF/F/XdrcQIrJfRqQBPZQTwUlx
         5K8Fki6X/aG45qNlXdaQBgbzcPLgAmcIs6x6vZRovw1UM73qPW8RQC8gGxHCnbgHbJ+1
         wOP2jHiMgqStyfLyLryK2yISGLz38IGIwKEb7A1Z+yHjx9pkSGeWehNrMb2jHqzd6vvU
         6eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716979580; x=1717584380;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrABS7SjAcs27w1VQMkqKccqeT9vVGVOfZ3FokQbsNI=;
        b=cNJe4OcUfO/gcDgcjLuN0BCb9H8t2zRK8hJpiHBUpbwEIxoZ4FdY/a/83thtlh2mxZ
         pjIAJg2Zg6eT6nxK/zC8QCot6gRO0OaslGd51jw24PmwsnIcsSZ4YofpHh7wQuhXEzTG
         QwopfeCvgVT8jf73zvJ593ex70YuU53Vp1KUewa0wDxkvy0iGO9eLdEDukipqpd2AmwL
         u6baNwySpw8qZywb0WUBYNMmIjjBVYpUws9FCyjJmoP60oiMzo7+0TJRsBrMXuF70Su8
         Zz1akX0JGuU5z98KO57xQfIbt715eqqAmhhxElU6932ztqofo98kVYUclUsip+OE5au4
         GPfg==
X-Gm-Message-State: AOJu0Yz2YbjMt4AMJr1cnZ9QZrxM1F1yPwB/+XA7OdZ4w5ItpbblnyhD
	eKmnhs82Y1jx2Q0K7ZuPox7QVNJs0HdwdTqZVbDGdC9n+VXzzZ5rvLEUyb16DDw4fGpUbiHbVlc
	=
X-Google-Smtp-Source: AGHT+IEmHKE6bnkaXLkG2f7doWQitoSbKyfK4Ff031bt/HTsQgez4z0TLxTgfC7BQFCcXfvXo7vlnw==
X-Received: by 2002:a50:cc9b:0:b0:572:d1e1:b4bf with SMTP id 4fb4d7f45d1cf-57851970370mr9171889a12.9.1716979579664;
        Wed, 29 May 2024 03:46:19 -0700 (PDT)
Message-ID: <740c940c-f651-4d7d-954f-78b7d9a31a90@suse.com>
Date: Wed, 29 May 2024 12:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE: don't treat S3 resume the same as boot
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

Checks for running on CPU0 are bogus; they identify S3 resume the same
as being the BSP while booting. Replace with the same check we use
elsewhere to properly limit things to just the BSP.

Link: https://gitlab.com/xen-project/xen/-/jobs/6966698361
Fixes: 19b6e9f9149f ("x86/MCE: optional build of AMD/Intel MCE code")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -767,7 +767,7 @@ static void intel_init_mca(struct cpuinf
         lmce = intel_enable_lmce();
 
 #define CAP(enabled, name) ((enabled) ? ", " name : "")
-    if ( smp_processor_id() == 0 )
+    if ( c == &boot_cpu_data )
     {
         dprintk(XENLOG_INFO,
                 "MCA Capability: firstbank %d, extended MCE MSR %d%s%s%s%s\n",

