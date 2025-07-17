Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3AB08A60
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 12:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046508.1416849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLdq-0000S4-Px; Thu, 17 Jul 2025 10:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046508.1416849; Thu, 17 Jul 2025 10:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLdq-0000P4-NF; Thu, 17 Jul 2025 10:15:06 +0000
Received: by outflank-mailman (input) for mailman id 1046508;
 Thu, 17 Jul 2025 10:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucLdo-0000Oy-O0
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 10:15:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7309c1c-62f6-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 12:15:03 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso633595f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 03:15:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4bc51sm15535880b3a.116.2025.07.17.03.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 03:15:01 -0700 (PDT)
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
X-Inumbo-ID: e7309c1c-62f6-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752747302; x=1753352102; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0cPNOrVrngHH9v6EctdaaNUieY6XJCl1CRr4F/05Y0=;
        b=IdiASTVbVS6K+o71mE+GnUii7Wk7zvg1KDRe8xUAGYj8H22ARazLfaCZxVUuDxgJj4
         Pn2ueVeP8SZrxk33VH+bX3Fe+jmyMuKMnPeQJJRUlVaLq394Dz6h1DbSUns9fYlBD9n7
         6DDH9JtHDgrPHpHhfSSP8iTaD2rap59oQeAGyplzKQWxy8WVAkF3J1AEekcKlzGLgOhl
         SkKwSAIgoT3MAP25lrn87or0OvWNLageBjqp0PxAeOeG741ro32LVW6Urw4eoFK2AKcy
         AlE36nYhJkivkbrHVyXNdGgPhtdw5qxeQPAQXGWaxT99T34BLFhEAmNVM1N7kMUNNni1
         6ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752747302; x=1753352102;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0cPNOrVrngHH9v6EctdaaNUieY6XJCl1CRr4F/05Y0=;
        b=pZW7J9pjNVMECSZawHRPrVT0JG+vCwD5NQwww7tcwY6tMlp+2ZqP6tyxJiks68QglN
         BG6j+xJ2tuIAwIEsrZeY1MpnClwnE4e6fKdqzHYuOb6cuBR/MlSjZNjoS+eU7MPM7i0v
         PB47A9OYc5ka3f+RmWU6XnYtBZyCYv/I5PKdP/y/dTpScGGXD5SRmPU5EjPGExmCLJsv
         hfDW+XwQg2muTr8J8wditLcaWQPGEm4KgLo7FOu36ww9Kav69v41ZBgvBpfQE6jv59sr
         AbfWn9QxgQs+KgMBT1WytuWzEA+uHR3C3/uYDUquGf4Ng4mFD1saMQ6nJWC3wxn1Wh4o
         DszQ==
X-Gm-Message-State: AOJu0Yyk2bD7Oq770QhqtB98v5E4HO97urfgOS1bs30XAJVheVdLfX6K
	kMMTJTquq1cTWp6Z5x95GFLdM+zl9p9UdYpHXM5WN7Pz7+BbKQqUuJKVw6m15EyviKpoOHinoAV
	5ZQA=
X-Gm-Gg: ASbGncvIrUBYlmjR56wRWc50HIarhzXehgf62SBnuEs7jzPDuF73UatuK0Xw2Yi5w+U
	deK5Xa5fXh9gXQpuvzKH3gobKzvWPJZIiXJLJXvkV6XShA2wP5oQgNIy1qkSEnJOCFAVkOfOK+o
	LIqXuL5O47oHdzL3pxzVLKoG+m9Uvux6eDbT4iRUunSqWhOYbW1tIuIWSln4hphDxV7z7uuPgy/
	uK8gLsiP16KlqPEH1LsrTiOx1fcKrbjvDNPhGu1NV3RX4XZJUVhPxCvDGvaRvFCW+TKDRxnFgcv
	CcX2I8j51WeRrIt27sxB6EsVN9SJMsUX4A/Z9SfkBuwY1JoCm5L7hBcJX08l8nVqlFybLVhFqNp
	gPV/FcSLPjb7yzcQAjEOMOM0Oxdhjn7JPnQeoOE02GxvhDUm0ymiZPApZIVuc35hD0fWIMHLKA4
	GDtVQAudU=
X-Google-Smtp-Source: AGHT+IHefGfkoZe5ny8oMPSqcTY5pauMt1R1oo5smwMQXBg8f6ph23eExugdONBtghY80qw5SRMhoQ==
X-Received: by 2002:a05:6000:24c9:b0:3a5:1c0d:85e8 with SMTP id ffacd0b85a97d-3b60e4c219fmr4190888f8f.22.1752747302359;
        Thu, 17 Jul 2025 03:15:02 -0700 (PDT)
Message-ID: <662a4b19-1ea7-47e4-a89e-204fcef3a6f7@suse.com>
Date: Thu, 17 Jul 2025 12:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/S3: don't lose previously collected CPU data
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
hence it is wrong to overwrite APs' data using boot_cpu_data. With
7126b7f806d54 ("x86/CPU: re-work populating of cpu_data[]") this now
results in a crash, as the cpu_to_socket() use in smp_store_cpu_info()
then obtains a bad socket number, much like was already observed in [1].

[1] https://lists.xen.org/archives/html/xen-devel/2025-06/msg01879.html

Fixes: bb502a8ca5925 ("x86: check feature flags after resume")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -370,7 +370,9 @@ void asmlinkage start_secondary(void)
 
     cpu_init();
 
-    initialize_cpu_data(cpu);
+    /* During resume, must not clear previously collected data. */
+    if ( system_state != SYS_STATE_resume )
+        initialize_cpu_data(cpu);
 
     microcode_update_one();
 

