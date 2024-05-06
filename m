Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867B8BCA34
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:06:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717349.1119454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uIU-0003p6-Pt; Mon, 06 May 2024 09:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717349.1119454; Mon, 06 May 2024 09:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uIU-0003m7-Mg; Mon, 06 May 2024 09:06:10 +0000
Received: by outflank-mailman (input) for mailman id 717349;
 Mon, 06 May 2024 09:06:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3uIT-0003m1-54
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:06:09 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5267d8-0b87-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 11:06:06 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51fc01b6fe7so1332816e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:06:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a05600c1e0200b00418948a5eb0sm19179739wmb.32.2024.05.06.02.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:06:06 -0700 (PDT)
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
X-Inumbo-ID: df5267d8-0b87-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714986366; x=1715591166; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNbmiClhu3TCiYvFLpf5IzYM43ZV+ft5M+6hFSbisss=;
        b=Vfzdaq2W8O5q/tm8aeJz7E64bd2SkUoj7racLp88BTau4xRtl3l36kDsFcjtPkFbXL
         mzC4A1w0ifSjF7Ybn2WrsNm+rfeQvANfIcBRnT+Hc7i8FIhI3dUVb3hd7qpK+iN5DB59
         5dKDnbYma/V9ciq1Mj06BM2063F/pXLAPe0tBD9bjKu4RoHAdPZnqpMOLZT7VFzrme53
         CaTwvRPgLsOxx6JrEXvZsIga/dH6RrdSpwe+22ota0P6iObfFMDgJEDUWcPawrhuhFjp
         w+6wLj42GzJO8SUIDu7ok5B/c6aXNPophocJqMdp38gkd+DclpqyPTXqkpnUkJjOdmG+
         nRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714986366; x=1715591166;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNbmiClhu3TCiYvFLpf5IzYM43ZV+ft5M+6hFSbisss=;
        b=rrJdBCzZDxE+5g5h4D+tEfl/ihA9rAEGWmqbd4y4bMkZM6GcNIkinN3jNAa08w+jXI
         hY3CNIn2kxh6zbPzyPGDsg1T1/9KX+4nPx0+kZKxBFgUjEoJ/ONRKONuvBTXSj+Jtf2n
         GtiKU5Zfpk8ioD9BNisUexOpL4RA4xMhRTyPl5Rg3c1+H9ebowU0zeu9jWNg+240Su4x
         UReWqe7NPUvBHa2KJdCH/NV6N1yppSGE3BPw6lQy8w64P6EwXhI2lhutqIIim01OhO4A
         8zkrhjQimnfphACmZ0pPb3Z+/cETXNZCzUIHRtssBonLxRD1dpsqB02MgKDJiSw0ljP6
         SYiA==
X-Gm-Message-State: AOJu0Yw4ih1/jDSXrzf1+wFU22U+clIAHCiMugpK2RjdarA+hyYovPmY
	ggpy9CdyqJgLTUggM41SEEh1i4RIE8/sLQMwCWPkkrGDJrGwEjgSTjUxo3FXlbAoebyd5dZPkRI
	=
X-Google-Smtp-Source: AGHT+IHLqLekucEteWtsCFTcLedzrG+NyRzUN+rSt2f7qJXgWmjtThA5tMJzebd7PqqaUqHPt0bGOQ==
X-Received: by 2002:a2e:888b:0:b0:2e0:1414:5eb9 with SMTP id k11-20020a2e888b000000b002e014145eb9mr6578281lji.25.1714986366316;
        Mon, 06 May 2024 02:06:06 -0700 (PDT)
Message-ID: <92e5df23-0bdf-42d4-9ab0-c668110174f0@suse.com>
Date: Mon, 6 May 2024 11:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/platform: correct #undef in compat checking
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

A stray 'p' was there, rendering the #undef ineffectual.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -30,7 +30,7 @@ CHECK_pf_pcpu_version;
 
 #define xen_pf_ucode_revision xenpf_ucode_revision
 CHECK_pf_ucode_revision;
-#undef xen_pf_pucode_revision
+#undef xen_pf_ucode_revision
 
 #define xen_pf_enter_acpi_sleep xenpf_enter_acpi_sleep
 CHECK_pf_enter_acpi_sleep;

