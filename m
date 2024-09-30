Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172598A828
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807448.1218925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI1z-0004dA-0O; Mon, 30 Sep 2024 15:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807448.1218925; Mon, 30 Sep 2024 15:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI1y-0004af-U4; Mon, 30 Sep 2024 15:09:46 +0000
Received: by outflank-mailman (input) for mailman id 807448;
 Mon, 30 Sep 2024 15:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svI1y-0004aR-2L
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:09:46 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0682b47c-7f3e-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:09:44 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so1021158766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:09:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c58fbsm541904766b.56.2024.09.30.08.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:09:43 -0700 (PDT)
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
X-Inumbo-ID: 0682b47c-7f3e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727708984; x=1728313784; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8xTNmOyFzMggTep3PFgSnEelCiRbcJAPtXf/Ol97fA=;
        b=AOMjdHD8YQLG6yoTDlS0m6PJDxFXE1NloRIwOU9ivKj0+ejDuAFHKi8AIjzpvDTG5y
         8A2z8pULZAhjLNZhF+YS924NqlCrUtJ9rlefCEFVGpHM6CjYoWVQBOYcDDEelJTpNjpW
         gE/K7GlIE6Le12p1mbYJpRgVB4LZ1B6X80KuGE7p9yjr45qrXoMjC1vn6o91E5O+7MIM
         LFyzHMOolbyFhDTnv3ELaSpjKUik+M4hiTQM7GUBvnkjLlf7KhcrU/ATRqlQiOL6kcWp
         PDptqEqPCDuXEZYhPGFRh7k/4CyvcPJ+5E11sjqjUsCKMc0RmyHdEbtQ3KgyiTsnScee
         jVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708984; x=1728313784;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8xTNmOyFzMggTep3PFgSnEelCiRbcJAPtXf/Ol97fA=;
        b=XMYwVk85MrfGK31kXzAamLYOZhhvMwzOKHHs5ufGDzgUiOzTUow0OXyqXF1F+9QAEp
         /ucToyRVJY7uRNqrVEaw/iZq3ssuU/bacpeu5/FG/0iiPBnTGCr/iqUz3IGnKDZbZ4ei
         d1XeNk0b9X4hTuI5L7vA5CK872IgrRvJC/62lrFvyWoRc4JyZrPMngJsCFuWPY8A06JN
         dihnjzCLMGGPD8i4A+ySPbG92eqtml9jl1IY6ZDfXgEJKl8zKrNEf/tkvaNprZCXJjnG
         PnPC4m61WX49IbhPABOw916MT0eT3K0lU3xq/kyxbMvY4OccD1kG76853jqmVZ6C4kqT
         N4ug==
X-Gm-Message-State: AOJu0YwuBpHVmUECDe9Dp87w4aY3ZjViUZZIpLqbL5Jc/k/nwy0iY+8q
	oASQoihgmEpcLGX90w54/tzhRM70hJxEA0/SC5DMsfJ8fCYNfQ4L4al+cLPy2/09tycevBjiTV0
	=
X-Google-Smtp-Source: AGHT+IGvHgJrOSy+4hQjqLETFvSLDeShTqtfTddWtSWMwyTmTbrGZ0iCFpfDoNjqUWBNvi2Gwe9XvQ==
X-Received: by 2002:a17:907:9815:b0:a8d:59d7:f92b with SMTP id a640c23a62f3a-a93b1679547mr1587623966b.30.1727708984247;
        Mon, 30 Sep 2024 08:09:44 -0700 (PDT)
Message-ID: <60fb1103-aef3-40dd-afd0-44f594753165@suse.com>
Date: Mon, 30 Sep 2024 17:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: use alternative_input() in cache_flush()
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

There's no point using alternative_io() when there are no outputs.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -286,11 +286,10 @@ void cache_flush(const void *addr, unsig
          * + prefix than a clflush + nop, and hence the prefix is added instead
          * of letting the alternative framework fill the gap by appending nops.
          */
-        alternative_io("ds; clflush %[p]",
-                       "data16 clflush %[p]", /* clflushopt */
-                       X86_FEATURE_CLFLUSHOPT,
-                       /* no outputs */,
-                       [p] "m" (*(const char *)(addr)));
+        alternative_input("ds; clflush %[p]",
+                          "data16 clflush %[p]", /* clflushopt */
+                           X86_FEATURE_CLFLUSHOPT,
+                           [p] "m" (*(const char *)(addr)));
     }
 
     alternative_2("",

