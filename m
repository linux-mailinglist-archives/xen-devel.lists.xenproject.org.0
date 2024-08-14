Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98195161E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776805.1186970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se91u-0005MT-AB; Wed, 14 Aug 2024 08:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776805.1186970; Wed, 14 Aug 2024 08:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se91u-0005J8-7O; Wed, 14 Aug 2024 08:06:50 +0000
Received: by outflank-mailman (input) for mailman id 776805;
 Wed, 14 Aug 2024 08:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se91s-000545-84
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:06:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 256197ce-5a14-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 10:06:44 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5bb477e3a6dso6187323a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:06:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd196a82cesm3633721a12.58.2024.08.14.01.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:06:45 -0700 (PDT)
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
X-Inumbo-ID: 256197ce-5a14-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723622806; x=1724227606; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I79eO9TCWK956QNgk+vrMtrj9fe/jcJEZ7S1Xjtke50=;
        b=aB36BrtRLcDoLVpa2f79Sfi1qX00GoMjjDi/3HFG7eXlIISyBAIyHjgq1c+c8Lc0h4
         wcSMg2kPXbeH0JXIFNTSvHUeA60SttXVwOwa0OwkoIdGFCBUp6AV6IphGTCVRxZw5gD6
         bRH9BU1C/t0d9RHG4y2I9ZcJmk6txQ5RVVIUJ01Mg2PkjlEuXCTeGcDWO2i3BdTm07LW
         ffyZ7ulvWngwNz4WPcPHLBTIUWeTHLXWwDFgJ3u4/YR8subWXQvJOH5K1TrjuIxVw+vl
         wVqzETlapoEkt0we2pbwfjupYUPIO3ND8qcIb7LFX8iG6dTvZdEniCjuHVig79pvrrQi
         pWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723622806; x=1724227606;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I79eO9TCWK956QNgk+vrMtrj9fe/jcJEZ7S1Xjtke50=;
        b=AyAmaY/3kDYyk9v6p38EF8ZUiFG960JmBj5p30TuFqXh02RXKIgNyCWwGBQ/HWuXbe
         le/18Ts4a+JMltZPKFrGrRfXGxIwUyFGnaObCGkXiKc4XW3nn9Bpvbfz5hGgSoVOg9dD
         8gc0Ojb6jUt90dgZ74RGZvu4oC0rlL91GvWRadRZyAmtpfrbfNNCGUbnjwRRSXBCcom9
         QbQpsMqmG4TzHlktRBhUcVm8znfjuKN3u8S9NkLkybvdSfzDt6RLGkyMVHhPlOOzbTeI
         cWbDoyMAC67iamwLbjypP4UDzf2lTufJalaYSoRriyLEJdzU2vQO1OwyMYT6PaDmPegp
         vbWw==
X-Gm-Message-State: AOJu0YyHGCMAyYK7kWoLG8+/gSydtFbL+Eq/jM27UoTMWZnVOa4eE6bp
	w3v2MJPBqX1d5Tz4tpDeACALixlTrfUmClWj6EF7k/5pRe2Wa/7GaSbNfOCMyrmv5YoG7eFc3UQ
	=
X-Google-Smtp-Source: AGHT+IFSCy2PeKrGRy0EMkPA+t7dcRoibYN0pvGFO+qPlambEGLJrGJdCLFCgWLJVqBxZI6y3POz4Q==
X-Received: by 2002:a05:6402:5204:b0:5a3:af31:9ae4 with SMTP id 4fb4d7f45d1cf-5bea1c6aa4cmr1237414a12.5.1723622805982;
        Wed, 14 Aug 2024 01:06:45 -0700 (PDT)
Message-ID: <02755b04-844b-464c-966f-d4fa6068315e@suse.com>
Date: Wed, 14 Aug 2024 10:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xvmalloc: please Misra C:2012 Rule 8.2
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

The cloning from xmalloc.h happened long before Misra work started in
earnest, leading to the missing parameter name having been overlooked
later on.

Fixes: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -41,7 +41,7 @@
                              __alignof__(typeof(*(ptr)))))
 
 /* Free any of the above. */
-void xvfree(void *);
+void xvfree(void *va);
 
 /* Free an allocation, and zero the pointer to it. */
 #define XVFREE(p) do { \

