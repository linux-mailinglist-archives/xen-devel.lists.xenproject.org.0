Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B3A443BD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 16:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895847.1304490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmwPq-0000Z2-JC; Tue, 25 Feb 2025 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895847.1304490; Tue, 25 Feb 2025 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmwPq-0000WT-Fb; Tue, 25 Feb 2025 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 895847;
 Tue, 25 Feb 2025 15:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmwPp-0000WL-8O
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 15:00:09 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33778be3-f389-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 16:00:07 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43996e95114so37835575e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 07:00:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce65dsm143701675e9.1.2025.02.25.07.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 07:00:05 -0800 (PST)
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
X-Inumbo-ID: 33778be3-f389-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740495607; x=1741100407; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVzKevVPF+DMbCFVqjrYtPejjhj5f0GQLOrMkNCQnMY=;
        b=NCjQU/EpAWdZMQ2uozlSzJ2ht+g74/OHbNe0Z8Zp55ArbrW9y3FJSrI1KstxDOVcrs
         2CGBIKnyclqcCRgapVAsH5Kk4C7WNSOfnnnoYo6/jRP8l6YVVw8An3iZKQ5/JioMTWcR
         C9mV0TE5Ow81ECK7nkmpu4/Xho6fGDuoLxZZgntNUT15ZbtgoxDiFul2tvJJZE9m3kvl
         KBo/6AHdUTazyCeCWJHIPRi0aMH5RY4jepMGUJD6mR+ucJZDZEGtHf+AVLs4CbbCsuAh
         JwUNxLr4GdiEm0dTHd5T6rbIDgK6Bq/tZ8RP7XdcsLFm96ngh25NG7jK88y2/1zUZiL4
         CpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495607; x=1741100407;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVzKevVPF+DMbCFVqjrYtPejjhj5f0GQLOrMkNCQnMY=;
        b=tyDB4IFSkayiAK12giYRcuUHdzLzCqUXZ+oiarVmBIBuWI7EJdAoHmBVuQKMwFlO2p
         zFI2MwI3Mp+ZGhPv3ZGnUZQX7bl8GaZ+jWTkEsavtOK1IS1bvchhB7Zb+xKRyFo3azd3
         fFFwvdihjJEZ2kH1MMOHdsbAMZix3MCnCm1aYZoDrmhGcboOfflLOLOvYeBNAt1mPMvB
         R6YJgLSFfIGBrsVFyeeq1pduK+tGuta4ZtX4/O4x+jU8ND4PWXPKApPrszti5/jvinF2
         T8oYiOOWWUPG+QUE1pVs4Ej224yKwDFPVtrf2bqcr7lhJ06g+gZ+SDfThSEjhvrv2x5t
         K28w==
X-Gm-Message-State: AOJu0Yxi+qKwxhL2QvixrArkfVA618mNys/3Foe0Su9yyCI2mISGSY4S
	SvAJmx96JOo5ioPnhsM1uqWTvAh4zjlx8jYKpUrqrX52dBZUPS2fIN7Bd1QO1hjyJii75/Cafcw
	=
X-Gm-Gg: ASbGncvtniYSuIoq2411+EPHhO33xCLLhoCdsL7lWjgt9Wc7DJxDq2y+7ulm4SNSu3Y
	YadxDwh8jolsx3zYeMs0SR9rTVBXPuBHuWlR5WXV+FzPAahNcgNRDFBasi8P61OnV+3z/vjq33Q
	7UYgyYjbHegyT7E5JBV1WBrRHxW/U4eQYMe3uN/ZApiZrPYG0qQ7cpRAh+WSG8us2lqFMCbdZ6+
	3cTLE/aqy/uwMuHsXsYwDUQy/DqDUIH7U+QCgD3qXvwgH3zVrQW+yQfj6DPgz7/xlK3k+1OvssD
	m402fubLc4NNYC7h4NnqnP1xd6zzSFbELA9xLT2uizsrnIg8p553kqjHn+v/GiLdPxlOdAYJpMs
	A9FNklc1zBFc=
X-Google-Smtp-Source: AGHT+IG/bsHMPtKRSO80GdN4YGWK+JJfUBwaFGY1qqRWw3NTg9CTM0/2TJovEW18KLQVtZkgXzNZMQ==
X-Received: by 2002:a05:600c:500e:b0:439:8e46:ee73 with SMTP id 5b1f17b1804b1-439aeb2b5d6mr147217375e9.15.1740495606015;
        Tue, 25 Feb 2025 07:00:06 -0800 (PST)
Message-ID: <4a40f0ea-2ce0-4485-aa70-b23634f73dc1@suse.com>
Date: Tue, 25 Feb 2025 16:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/DM: slightly simplify set_mem_type()
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

There's no need to access the static array twice per iteration, even
more so when that's effectively open-coding array_access_nospec().
Along with renaming the "new type" variable, rename the "old type" one
as well, to clarify which one is which.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -219,7 +219,8 @@ static int set_mem_type(struct domain *d
                         struct xen_dm_op_set_mem_type *data)
 {
     xen_pfn_t last_pfn = data->first_pfn + data->nr - 1;
-    unsigned int iter = 0, mem_type;
+    unsigned int iter = 0;
+    p2m_type_t nt;
     int rc = 0;
 
     /* Interface types to internal p2m types */
@@ -239,16 +240,16 @@ static int set_mem_type(struct domain *d
          unlikely(data->mem_type == HVMMEM_unused) )
         return -EINVAL;
 
-    mem_type = array_index_nospec(data->mem_type, ARRAY_SIZE(memtype));
+    nt = array_access_nospec(memtype, data->mem_type);
 
-    if ( mem_type == HVMMEM_ioreq_server )
+    if ( nt == p2m_ioreq_server )
     {
         unsigned int flags;
 
         if ( !hap_enabled(d) )
             return -EOPNOTSUPP;
 
-        /* Do not change to HVMMEM_ioreq_server if no ioreq server mapped. */
+        /* Do not change to p2m_ioreq_server if no ioreq server mapped. */
         if ( !p2m_get_ioreq_server(d, &flags) )
             return -EINVAL;
     }
@@ -256,22 +257,22 @@ static int set_mem_type(struct domain *d
     while ( iter < data->nr )
     {
         unsigned long pfn = data->first_pfn + iter;
-        p2m_type_t t;
+        p2m_type_t ot;
 
-        get_gfn_unshare(d, pfn, &t);
-        if ( p2m_is_paging(t) )
+        get_gfn_unshare(d, pfn, &ot);
+        if ( p2m_is_paging(ot) )
         {
             put_gfn(d, pfn);
             p2m_mem_paging_populate(d, _gfn(pfn));
             return -EAGAIN;
         }
 
-        if ( p2m_is_shared(t) )
+        if ( p2m_is_shared(ot) )
             rc = -EAGAIN;
-        else if ( !allow_p2m_type_change(t, memtype[mem_type]) )
+        else if ( !allow_p2m_type_change(ot, nt) )
             rc = -EINVAL;
         else
-            rc = p2m_change_type_one(d, pfn, t, memtype[mem_type]);
+            rc = p2m_change_type_one(d, pfn, ot, nt);
 
         put_gfn(d, pfn);
 

