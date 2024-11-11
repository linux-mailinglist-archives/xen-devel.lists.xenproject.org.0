Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C359C3EC0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833706.1248900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATvI-0003Dq-AW; Mon, 11 Nov 2024 12:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833706.1248900; Mon, 11 Nov 2024 12:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATvI-0003CM-7o; Mon, 11 Nov 2024 12:53:40 +0000
Received: by outflank-mailman (input) for mailman id 833706;
 Mon, 11 Nov 2024 12:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tATvG-0003CE-FI
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:53:38 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f637e1cf-a02b-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 13:53:34 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso3096378f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:53:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed997391sm12975712f8f.45.2024.11.11.04.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:53:33 -0800 (PST)
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
X-Inumbo-ID: f637e1cf-a02b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY2MzdlMWNmLWEwMmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzI5NjE0Ljg3OTY2NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731329614; x=1731934414; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2K8ajky7VvKSbH7HaGTHDR3nI6ATcT1GssVFep9MCu8=;
        b=ZzFT1Z+IVQl6KSOKXP8CM8Ffa9XTUsIuf/6HcONqUnj/TOBkaJiWpPg2Kqs2jHkOoN
         6lLz2Nn00k5CN+XLTOsWr3NlnhpHbl4lj16lx1g0xeuv52jvzPffHLLJyRFK15FOatKg
         6gX9L1+bT0O5lnsGR2Lxer96u3HF6lM1fhp3nzQNLBwfPTEE3PGjb5KrnIDomEZ/8xt/
         3E77Bx1FxuDd5gxzg0XlIe7x8hrAlv93bDho6D4OxnOMGX/Af4DB+IpNa1wLG8ZnIEgi
         6mQu4ZYrNauoSXQYKlO252A0a4WfBGtk+CI3rY0AQWxS4tsFIZA0fLCgXKrCDH1CbdFV
         mUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731329614; x=1731934414;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2K8ajky7VvKSbH7HaGTHDR3nI6ATcT1GssVFep9MCu8=;
        b=h5aXu6eVgCkZ5Lk8GE7vCb5Oc1U9dGuiOak4ma6JF3ZLNo9RAICHN5Tho7IkTELXYp
         OZO5MQX7ceLOSCyeSA5JpBTlCG1DbpTcZOI6o5Z06uj9OxzD0xJUMC9fnomD7GNw6Ug6
         F7Vt66SJCSoJh0bF3HPbaweZdDceGc0v4wObUm9d3y/acC9kTxtzQx4lcwjQ9yxMxUpD
         3J/HGOIku7PK+6nyFk199Q46RFnjWXeTJywWzYb5MS48oysJXAEpxbCVSFleYqEXzZLl
         IBO0sUV7U0yVpcDY9QToiRGVMzowy1H0wzoKw/JRdaangvOfcUICfZw1S85xbHvFGaWF
         1oBw==
X-Gm-Message-State: AOJu0YxvcUN9kzElucSdE6gxVVvIuXlK8/1Xg0eHOC4wAOAiEUbiuXVd
	N9R+/R9z4+QdGc/zXwuCgwWyhL5Tn75crIkWBra4WnjQs0opzq2efLKoa53oYkQPN4Yo9o5E2Nc
	=
X-Google-Smtp-Source: AGHT+IGIZuBpffT5/xYfsCDMGfeLlC90dhRotiiwRJILSDmcus0w2W1BQM5ow8K2uyLlS5YNbBWRqg==
X-Received: by 2002:a05:6000:1a85:b0:37d:4fe9:b6a4 with SMTP id ffacd0b85a97d-381f1885e89mr11583137f8f.50.1731329614274;
        Mon, 11 Nov 2024 04:53:34 -0800 (PST)
Message-ID: <a62146c9-ca82-4024-b5fa-fd3129f308fd@suse.com>
Date: Mon, 11 Nov 2024 13:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] mm: adjust _xvrealloc() declaration
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

... to match its definition parameter-name-wise, to please Misra C:2012
Rule 8.3.

Fixes: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While this gets the decl out of sync with _xrealloc(), changing the
definition instead would be a more intrusive change to make: The
function already has a "ptr" local variable, which would then need
renaming first.

--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -52,7 +52,7 @@ void xvfree(void *va);
 /* Underlying functions */
 void *_xvmalloc(size_t size, unsigned int align);
 void *_xvzalloc(size_t size, unsigned int align);
-void *_xvrealloc(void *ptr, size_t size, unsigned int align);
+void *_xvrealloc(void *va, size_t size, unsigned int align);
 
 static inline void *_xvmalloc_array(
     size_t size, unsigned int align, unsigned long num)

