Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B909AA0D95
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972646.1360966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lAY-0006CH-QC; Tue, 29 Apr 2025 13:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972646.1360966; Tue, 29 Apr 2025 13:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lAY-0006Ap-N5; Tue, 29 Apr 2025 13:38:42 +0000
Received: by outflank-mailman (input) for mailman id 972646;
 Tue, 29 Apr 2025 13:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9lAW-0006Ah-Qn
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:38:40 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42751db8-24ff-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 15:38:40 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5f4d6d6aaabso9680507a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 06:38:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7035464f1sm7424524a12.62.2025.04.29.06.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 06:38:38 -0700 (PDT)
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
X-Inumbo-ID: 42751db8-24ff-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745933919; x=1746538719; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNs7ZTeQWTzOD/l5UZsnMJCFN6To8IIhoeLjabp9pTE=;
        b=XPMQrhzswyMw7Evp3zI+Ob7Mul5V9+ymo/qdUP5/exgy9Ic+tfNpFwonUdiMIru9O8
         xChJdFGdIyDAI4EoIS/RbiwKR8b1KPMeExU4cAV2lR+qrADGlCPECKWadg09I8fqbdwz
         TjvsNE2EfVlqAPjd6JKtVZ5kS7c4Hnl0Q43AVCSj8bvyRRs9NqH87zC8l4VE7CQhJAPM
         0sLcnxmb0e6/nhW9zNibqZYbvQClobPnb4Cp6aHawzW1tU4iBmZi9dyzFXZ/8i7MX+6A
         7nlwjPEDtqOokvCu8jjnQ+grCRW7BGf5jalcDTFqYN3KVE5zAOOF5kI819+o2tFWS8c5
         3OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933919; x=1746538719;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNs7ZTeQWTzOD/l5UZsnMJCFN6To8IIhoeLjabp9pTE=;
        b=k/mOdlxXSS260rtU22EHtuPYTiBnfNNMOY6hnqu7Zo+lKfAnC208bfism3Jfz4+zqR
         YHlODxuyOVATxtsMAsM3fF/Wq/uNAsnUpjyIJubyx0PotC+FozBScaDkOO3tuWw0U9oN
         BfrwcaQ3nqZhvt8VzFZIZY/C2S0uuZlcuDcoMaxWxXiTpjXQF8h3eaaMRq3wE4ualtST
         EbHcp9Ar52CZxDKnEOlLFwdJjdiu3YLE6EbhUIj74bPSOA43EbLelH0PAIqgjrlHLGuD
         GUrr3o4nY4MRwOkceay11MB69vtDKUPeA2wb1tUlnYThuEggqeDXkDoRn2DV6Gl7Q0YL
         QVFw==
X-Gm-Message-State: AOJu0Yz8LmWmzWfam7kOqHGtnE5OFjhSftTBRqGM9v9ePuoZ2r065Zzd
	2psCB1VjYcWrATNuqQ4VoKomY55b9+oujK3JF7UYwXRPWKmS43LT0vUu/JyLAzVxC0opkolGETw
	=
X-Gm-Gg: ASbGnctaxfAnkszHuax1t7v6vGPR3rFuk3lj1npP6XajrPq4IBId7BEdf16EK1y6baF
	oaodFuyd02byHqo7Eqm+otVJusk0ZhH1MSRBRp/Vn0z8li7GohWX8x91LqpzDmGsjvVP19RGVsg
	gW6jDI+Qwd4B6treVdMJ0dtq4zEK3SqXAOJCXcfEeklIXf3TmiN7T/gyQimQqP2fn5RptCcb3mx
	jNxRpWYkvl6jjsWM7w2sK1q4VP3SKwHRRqgW+Is/a2WCNPu7MG3nFPJPm7w+jjpf5wXfIHGFnQf
	HrwYA938O1Ruzp8hNWSYKaYcc4014nFN2iQ3qa9LZEm4DEOA4FbIaak4hEg1x9e3j4XdwpOj1uL
	dPeO+xEbxYK/KoD3ZuNe9h2go+FPdaT7uMM7h
X-Google-Smtp-Source: AGHT+IEQ7+XLOGgGcIF1niBfRTTFI6l4fmVWvoHiZTFdwJmU26D0O5EY//ZNhOT43PIZ+aU+GM7qEQ==
X-Received: by 2002:a05:6402:234d:b0:5f8:36b2:dc1e with SMTP id 4fb4d7f45d1cf-5f83889e796mr3412022a12.33.1745933918952;
        Tue, 29 Apr 2025 06:38:38 -0700 (PDT)
Message-ID: <4054b780-2b42-4d56-ba3f-d56392c8ab4a@suse.com>
Date: Tue, 29 Apr 2025 15:38:37 +0200
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
Subject: [PATCH] cpufreq: use existing local var in cpufreq_statistic_init()
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

..., which actually also helps readability (imo).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -130,10 +130,10 @@ int cpufreq_statistic_init(unsigned int
         return -ENOMEM;
     }
 
-    pxpt->u.total = pmpt->perf.state_count;
-    pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
+    pxpt->u.total = count;
+    pxpt->u.usable = count - pmpt->perf.platform_limit;
 
-    for (i=0; i < pmpt->perf.state_count; i++)
+    for ( i = 0; i < count; i++ )
         pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
 
     pxpt->prev_state_wall = NOW();

