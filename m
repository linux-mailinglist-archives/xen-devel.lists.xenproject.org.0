Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F58174E6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656127.1024127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFJ3-00086H-RG; Mon, 18 Dec 2023 15:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656127.1024127; Mon, 18 Dec 2023 15:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFJ3-00084R-OM; Mon, 18 Dec 2023 15:13:21 +0000
Received: by outflank-mailman (input) for mailman id 656127;
 Mon, 18 Dec 2023 15:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFFJ2-000837-Ku
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:13:20 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9fdf044-9db7-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 16:13:19 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d12ade25dso17945915e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 07:13:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d1-20020adfe841000000b00333404e9935sm5893196wrn.54.2023.12.18.07.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 07:13:18 -0800 (PST)
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
X-Inumbo-ID: f9fdf044-9db7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702912399; x=1703517199; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKyIHACRia97J7Bd6I0jfvQXW42r6xNI6IA+Nbk/jb4=;
        b=KyKUGytHdvBqzF9ZwCymrrxo7SrvTnq78F0jT1eQCJG2rnVpa8XlxdPkKZUqd9lER0
         mOAskzOR46GAjHHX1huWwTNjen4JSPM2KTm60ZueQ/jKHXOcPH3LSt/AGWe2YNFgmqkB
         YjdLdYEMZS52slWw50fqDdHL/m4ftuKly+Usrd3ATbLV2MutLgOI3W/nSJAY2Id75f3c
         6KyBTxLrPlfDwmVXscqeewGdPdlrBUBduLLwZlwhDxS7U8YzMjNzjpyYmgLihtEb5Mgx
         t8YeccEXkBIPddQ3mvaRI/nm3l/v93Z1A/SNo2THCdUXUBPDObz9NAlk1dWYtptFr7Gb
         35JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702912399; x=1703517199;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKyIHACRia97J7Bd6I0jfvQXW42r6xNI6IA+Nbk/jb4=;
        b=e4PAQb8u3wPfrN+7Dha9znprtDmNxeYkJBnEQMb6cJUlT9GeP2T7WH+XDGUqagxOOn
         i6GY6vqwoaJAXpkxKNfy1+Tzt1I1jGklbai+VkXf1qbjoXz5FIm30T7fn4d764pa08ne
         Ah0F6CXPrni/PDM+8MqV74gXidTqK/kY/MAlJhCZ6Jc2tDAqU8m3kMpcYOyYFNuLOnv3
         G6h24o2J08SZin1Akbuumd4o73a28O3oMAWjj4wlIlrP4dDLicNs9fkX+fEyxkGPKktQ
         SFTkzMmFo8VT91CzKRYlQUe0GJVkqUK8YFc2uhlGbVD6Es0c3X97tBKv+fL2CmhFjLHX
         476w==
X-Gm-Message-State: AOJu0YzX5LAq2/W3hrHuPxN9Ua2C4r7wdpCobwKmSLrpMk5OQ2I28bma
	gwpUTOX7BCKuVgSqMoZcJundjckpkLzdwEV9+iWw
X-Google-Smtp-Source: AGHT+IH6DUQgj0qemM0y5jm7NyruBMvE/mZXci0tZlMSX57cQLg1eOyXx7Fc5Gp+0WXcSfrIGF0iPg==
X-Received: by 2002:a7b:c846:0:b0:40c:5f0b:d62e with SMTP id c6-20020a7bc846000000b0040c5f0bd62emr4702634wml.83.1702912398895;
        Mon, 18 Dec 2023 07:13:18 -0800 (PST)
Message-ID: <6ecac5e1-2131-44b0-af07-eeacfbd6b522@suse.com>
Date: Mon, 18 Dec 2023 16:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: don't open-code max_page calculation nor pfn_to_paddr()
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

As observed by Roger while reviewing a somewhat related change, there's
no need here either to open-code the (largely, i.e. once setup_max_pdx()
was called) fixed relationship between max_pdx and max_page. Further we
can avoid open-coding pfn_to_paddr() here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1569,7 +1569,7 @@ void asmlinkage __init noreturn __start_
                 continue;
             }
             map_e = e;
-            e = (pdx_to_pfn(max_pdx - 1) + 1ULL) << PAGE_SHIFT;
+            e = pfn_to_paddr(max_page);
             printk(XENLOG_WARNING "Ignoring inaccessible memory range"
                                   " %013"PRIx64"-%013"PRIx64"\n",
                    e, map_e);

