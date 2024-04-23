Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03988AE997
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710690.1110072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHCG-0001YS-8e; Tue, 23 Apr 2024 14:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710690.1110072; Tue, 23 Apr 2024 14:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHCG-0001WG-4R; Tue, 23 Apr 2024 14:32:36 +0000
Received: by outflank-mailman (input) for mailman id 710690;
 Tue, 23 Apr 2024 14:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHCE-00082U-HQ
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:32:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52432252-017e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:32:33 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41a4f291f80so18825825e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:32:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fl18-20020a05600c0b9200b0041ae0048b5dsm481577wmb.45.2024.04.23.07.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:32:32 -0700 (PDT)
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
X-Inumbo-ID: 52432252-017e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713882752; x=1714487552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UqfbDwnUwSfB2mqt9VJQheXNCjV8uwEuyxbCPQDuBZg=;
        b=Y1psqdjsMqN0Us8SpXkgaoZqMXtZHpSLs65bx7v3Rzmp3hcTP5eO23qv+UQYIB6mOG
         4+u4vyzyxRIF0YE7JstSwfP6e9hbEiW/k5Zh2DZib1KZucmtUNkq5dr/TIBTAHil6IRK
         Vr3JNgKgfJg/T4/1tb2XE0mei6tMy4ERSi3vn9yty2S4dv74qvgX9EULqF4ADi9aBGws
         Z94qLkXma697DMP9rqo6l6aufGQ094Y+1otDg5+bWIk5/wFGezIxHPCGICcoPpUuIlGo
         rfxmH1fqN304rxDdMzYfI91tzHfh/nIvrD9fBoA4lybCiwt3PnuIqHtOGiUXqm6LHu+H
         07Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882752; x=1714487552;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqfbDwnUwSfB2mqt9VJQheXNCjV8uwEuyxbCPQDuBZg=;
        b=QEbuZvwE4aY4zd8vXu6LIKTZJDO+owZcUccbz6xDIJpswW6/4myo7vfZAZNJRZErfF
         BruBWfXU+MBk9MfXv8DFckTjE5PwrLYCFSmm8jSJ2YsnH/DOGmNEti07E516aGXn+S9b
         GdfrftcCom8ld3cIWDHMrsBrCmPgpN7eclMQq7ggf6UxrTV4EeLTIdP0QgjvsrN1LKI2
         7NQqBtxSaiqwjafVg6MVxAzOG1mdUVYVUqRQpD4j9pFW4wnLB0STjKK08eJlkBYgCcal
         DlpHVVBxMLQ5N9FR9VEdG3YN8emU+Ldt7vcu0w5+cENwE94E+ZxObJ2yMQ4mD68gBiND
         16Bg==
X-Gm-Message-State: AOJu0YzvVqzkXdZr2uLdRfEFoUkl5xjhbpGLD2h1hlNXfc3QvSPeqPCn
	5q3PU2eI4xTkR0ORuY0h96rdYA/mxqE1sdtZaYyGpUnj21kEtrzGKek+AFhOdi56J4+qTn2lHt0
	=
X-Google-Smtp-Source: AGHT+IHu3HP7wLmspoWlz+cFqPiemlWMuXgZIHW+cU9H0awHdI4caRRCQ1twIyPtsW28bc2DjudTKg==
X-Received: by 2002:a05:600c:1c0f:b0:41a:c170:701f with SMTP id j15-20020a05600c1c0f00b0041ac170701fmr1635411wms.38.1713882752571;
        Tue, 23 Apr 2024 07:32:32 -0700 (PDT)
Message-ID: <67805c1f-7187-446c-a5c4-14be8f170f11@suse.com>
Date: Tue, 23 Apr 2024 16:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] x86/paging: vCPU host mode is always set
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
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
In-Reply-To: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... thanks to paging_vcpu_init() being part of vCPU creation. Further
if paging is enabled on a domain, it's also guaranteed to be either HAP
or shadow. Drop respective unnecessary (parts of) conditionals.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -937,19 +937,12 @@ void paging_dump_vcpu_info(struct vcpu *
     {
         printk("    paging assistance: ");
         if ( paging_mode_shadow(v->domain) )
-        {
-            if ( paging_get_hostmode(v) )
-                printk("shadowed %u-on-%u\n",
-                       paging_get_hostmode(v)->guest_levels,
-                       paging_get_hostmode(v)->shadow.shadow_levels);
-            else
-                printk("not shadowed\n");
-        }
-        else if ( paging_mode_hap(v->domain) && paging_get_hostmode(v) )
+            printk("shadowed %u-on-%u\n",
+                   paging_get_hostmode(v)->guest_levels,
+                   paging_get_hostmode(v)->shadow.shadow_levels);
+        else
             printk("hap, %u levels\n",
                    paging_get_hostmode(v)->guest_levels);
-        else
-            printk("none\n");
     }
 }
 


