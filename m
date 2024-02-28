Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F9786B0C6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686637.1068878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKLi-0000gv-N0; Wed, 28 Feb 2024 13:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686637.1068878; Wed, 28 Feb 2024 13:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKLi-0000el-Ja; Wed, 28 Feb 2024 13:51:54 +0000
Received: by outflank-mailman (input) for mailman id 686637;
 Wed, 28 Feb 2024 13:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfKLh-0000eZ-Iy
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:51:53 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8656b08a-d640-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 14:51:51 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so7149996a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:51:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s24-20020a170906bc5800b00a3efa4e033asm1870713ejv.151.2024.02.28.05.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 05:51:50 -0800 (PST)
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
X-Inumbo-ID: 8656b08a-d640-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709128311; x=1709733111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w+KEn+hcWSFN2S28B1lVdeEMQiVbpABucnYzaxqMQm8=;
        b=Qux/xgWvGZjujzYDSY9JylKPOdCk9vfXcDbtCRNcu/qhlMpWSRfq/YKSiostT2hCqL
         ENy3V6+6Xzot+bPS/zjeWFY+MqpUHaBwkkISI9qBZcdMo0SLjCOAhExVbYKs8x0BRu7u
         B1/8Q2gv8+2ntl+CBI23f2cXMWbXHr6Q+Hzb2pgf3mlpaBTKVWHu/SUmh982igB9+uBo
         +latjEivpfsyuZMqYROVfk+jKmUPbZi5oSTDMAyXYGsqTaslaG/izfx5Th52IemrIGOn
         A6X/YSgK11Hg1TSPqKlAKlGR3BBZ2iQZGkjvkEym7KriRmBFed9wxi3B9Rstz1Z7QB1f
         T/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128311; x=1709733111;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+KEn+hcWSFN2S28B1lVdeEMQiVbpABucnYzaxqMQm8=;
        b=xClN4FF4yGscz0hTU+E0GgX9MEu8xab0dtU3VLJJtHXZ+Av4lUxkjCUA6dtp28Ojz0
         4gt89nlgM/npsL+HKSY2xZ1rIFCRREavpeg+8i/DXgdMRLEqAWnVGIWs0Q/daoB546i0
         4i8EcJWSqYabUQAVUZvqHBVDk5ISCjKn90o0W2qB+9JNg05oTsa+5isTs+Qj+adKGiZT
         YaQM0mKmcCUQefDuJPfQFrD64L2ythphe/qBtl7ejPgn2mwWI2e3IEpNJDi8zJNkYk5e
         uz7zKTx7N45IIVhNhzQDhMDoAal3gprc9aghyhqeLA1L21FKblUX7BZGwu4JzbR3gUch
         Edig==
X-Gm-Message-State: AOJu0YxC2X+kkMDIJmlauChEoMrqqaPhrBWQWVCFoVwPKjfsjlzkSw4E
	TIfycmr6rZxzt8/MCEts6SJSIInDZlStu69Lsxb6DRe2Cw7JrAnuyQW3UU5p1uDANtpgjU1d2r8
	=
X-Google-Smtp-Source: AGHT+IGEAk3oZI5VJ2IkQIs92O6kgtOshVr0bXPkF4PYNTxa8IWW377FE7w/kvyHwVWECxGBjJJyOw==
X-Received: by 2002:a17:907:bb99:b0:a44:15c3:c8e9 with SMTP id xo25-20020a170907bb9900b00a4415c3c8e9mr714367ejc.28.1709128311157;
        Wed, 28 Feb 2024 05:51:51 -0800 (PST)
Message-ID: <b1cde647-3319-4363-962e-35f716b5c03b@suse.com>
Date: Wed, 28 Feb 2024 14:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] x86: remove redundant XEN_SHSTK check from
 reinit_bsp_stack()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
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
In-Reply-To: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As of 72d51813d631 ("x86: amend cpu_has_xen_{ibt,shstk}") this has been
integrated into cpu_has_xen_shstk.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -810,7 +810,7 @@ static void __init noreturn reinit_bsp_s
     if ( rc )
         panic("Error %d setting up PV root page table\n", rc);
 
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
+    if ( cpu_has_xen_shstk )
     {
         wrmsrl(MSR_PL0_SSP,
                (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);


