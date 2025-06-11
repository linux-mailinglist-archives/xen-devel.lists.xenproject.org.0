Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED30BAD5242
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011476.1389916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIuU-0001WR-7q; Wed, 11 Jun 2025 10:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011476.1389916; Wed, 11 Jun 2025 10:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIuU-0001Tv-57; Wed, 11 Jun 2025 10:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1011476;
 Wed, 11 Jun 2025 10:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIuS-0001Tn-Vm
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:42:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf62e7e5-46b0-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 12:42:18 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2948639f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:42:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af7af0csm9171292b3a.62.2025.06.11.03.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:42:17 -0700 (PDT)
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
X-Inumbo-ID: bf62e7e5-46b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749638538; x=1750243338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LBRwkWwv0jbgKkcFjXltShuEDP54+5oP6Jd8d3RK15c=;
        b=MsbeRdPILcWZLaWX6caAuStGcEGy526OKGfNrLIiU6sHxsyXX/aVAb8HnM6PjZ/hOJ
         LkfWdZ7b9SoGx4awP72OXV/IKfgl4XvT2XfsQvojlJhJjHHfcNdo06LHmiEk3Yy+LGig
         9BVL88rm9bdRXB1Dnb6a1+bRR/VCX+urStn9nkEAOBs4DdH6Arpj0QUKq1NgPbi/0S88
         6eVozVYK0KgajyzkmqGNTzh9ECY7A1WqcCLkafVsmVPPLvMnxWwTMNtOcjT2VeJbMEHO
         AztVyF1VR7OS1RkzPbhaASHuj84BzUnsbyx6m/3sssiLOxr/Yl6YuJPGsVDES5Dba2bt
         xB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638538; x=1750243338;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBRwkWwv0jbgKkcFjXltShuEDP54+5oP6Jd8d3RK15c=;
        b=JQZYiZR/kdj1qg5UeHdmrH1wjcV4UFykB+7hQbVR+ViPfPQFSs0KqNkbxR6hve1Vq9
         64Z4C0mFQDY7+gxx4kkurmjLvUXj5+LbVU9CUbGgu+q84Lr7yLqbIMKoWQFbM93IF0Yz
         /a0KPXWbZ6b2qW0+aCZZR+Gerxeqtaa1H+BMyE5gXqvWJydvfleuRZCOupbVFWnodh8t
         4wFGsoLkFflDBHWVKELyRm5uSfJvTmZZCMleVB83GmwCZS5dPBrZ2RRCqajwuMjUaU+e
         ItNP+f91zypnnZay8poqAk5N30dkYtYlMeWCeJoGNKj0uIx0sUl4NAundFQ1E/We8qiA
         fzqQ==
X-Gm-Message-State: AOJu0Yzo1dPnRDv1l/tPQfFntG+fVqwul2zp8khrrcji2Eiz2EpKQCXD
	cp5btbrhirHlC3G793/KQCvUb2+8MTjyiCTzJJVEG7ezdPp8mwz3fnZ4pqSTX8h4nKwtMfFO3bY
	kRr8=
X-Gm-Gg: ASbGnctKH9BQAWmn/ho2Dnt0iQkUqnoNCwGMlFzkkI31NDynObJC6xddM2aV7GJdxG5
	979KDyeEqobxDyoEOhpuMO24QZ/LN/rP6aMSE6hAuhJkozqjQlB3wRpSu1h5LcIkcdpIoqqMtrz
	ujNMzI8pSgYmbU7W7/DgB04yPab3pl+uvVtZK9CDNByZTWvrQyr0+rxF8zRzxSKrG+3fIT7Lusa
	xjJgkqhSao1oFCoB4nPBlaW1e1yfQ57gn1uQj5TS2jh/vE60wZlmc7JtmPRB16TWe+UuBud2RAQ
	1qHVR3MJQrmCaS04EGr350GZeCM6pLCmKFWhpqLZAIyc0LuqY6vHZ09c7PRwnyEsB7IbT2XrKv8
	YPnNV5IWH3+FT4VGNGKFa5+cYd4tRw4GPtrs/C5FnuDy6cCM+MHt8TJXBtA==
X-Google-Smtp-Source: AGHT+IEsPGL3kWyZ20U0qudndcxOao26zAFUaeZAsz6mZnG3MsxSrDYLB5j9M4PNPkIBxAutomGKhw==
X-Received: by 2002:a05:6000:18a7:b0:3a4:f7e7:416b with SMTP id ffacd0b85a97d-3a558695570mr2021614f8f.16.1749638538373;
        Wed, 11 Jun 2025 03:42:18 -0700 (PDT)
Message-ID: <5f72b1c7-968f-49c6-831b-cfc4678b5923@suse.com>
Date: Wed, 11 Jun 2025 12:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/6] vVMX: use reg_read()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
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
In-Reply-To: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Let's avoid such open-coding. There's also no need to use
guest_cpu_user_regs(), when the function has a suitable parameter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2675,7 +2675,7 @@ int nvmx_n2_vmexit_handler(struct cpu_us
             {
             case VMX_CR_ACCESS_TYPE_MOV_TO_CR:
             {
-                val = *decode_gpr(guest_cpu_user_regs(), qual.gpr);
+                val = reg_read(regs, qual.gpr);
 
                 if ( qual.cr == 0 )
                 {


