Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A596A107CC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 14:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871349.1282373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXgyq-0002Bf-P9; Tue, 14 Jan 2025 13:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871349.1282373; Tue, 14 Jan 2025 13:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXgyq-000296-MG; Tue, 14 Jan 2025 13:29:16 +0000
Received: by outflank-mailman (input) for mailman id 871349;
 Tue, 14 Jan 2025 13:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXgyp-000266-MT
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 13:29:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bc51aed-d27b-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 14:29:14 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436249df846so37952785e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 05:29:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9d8fc67sm177401795e9.8.2025.01.14.05.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 05:29:13 -0800 (PST)
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
X-Inumbo-ID: 8bc51aed-d27b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736861353; x=1737466153; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pe4VQOgveIX4YHbU5WTRdB4IC8dE1/l1IYjxf4I6CWs=;
        b=TM7FGRiwYETHUhF4OZfp8wTyLwvCJP4mcZ6zydtxzv74vfyP1nelz3x8z8CVLAhqHj
         Wa/AQQOiVtsJBZeCjuyG45vrldPyp3Mto68hbClb5icNrm8DsAFiJ3OIuAG9+/mxfmA1
         tIPqng/sKwSAXnlRS3rYt76xZmDn1OyPWQJpEMWIQXALvD0y9oXwaTBxrDTUI8jxQkzS
         EgVP7GBdmUs7/Fe6F5P4NZZBuVuxRLS4x6aWuXFOUcBjLOhQvcvJp9uYI9zKsqvkHOpX
         d8d/NBnanAgdHS9hJlNkSnw1c2oH07CGdIkpp2gvfJzwOiuGxngDEYsngquK7+9D41ch
         MrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736861353; x=1737466153;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pe4VQOgveIX4YHbU5WTRdB4IC8dE1/l1IYjxf4I6CWs=;
        b=Y+M6ngymWIe7zL2brvshTvay+jZ5oQxeTY6FdSIll1HIPBqvbdp+0nKv3Og+sTo9yv
         xEBmONZ4V5TKjvxu/KFlTFbYEBk1hY6vS6vASQDZ7t3iR3+Szv3tMAyGZtBDQwJr3TjV
         drAymiaiy2osCjaPewvfq63KE8WryBuAHE3KGoCbqak1o779FViXrwbIhFhysMXzOjOi
         /sMvUCGkVEw88QDDpHHRtN7IVMOyIkoL0WQ8PE7D+X2vRULBnnY5QG3/709UY9c0jTeH
         J2pGq4KcUjyE2ENO2EBLTCg9ncd/jQObSPnRf/1RvQM/muHXYPnBuvsCKjnNvS9S+NCr
         FVWg==
X-Gm-Message-State: AOJu0Yw28oE0DoB19/Ag7W9KX5k7GQiL3aO6QuHTcrYKscOXi2s7WuRh
	3KBZuFbBtCY7ioFJdYyF/6R2wlcpycY5eEG2VqSKgl9UoCGb6jVu//B6hUP6dsq3w1arMj+CEf8
	=
X-Gm-Gg: ASbGncturTaI+D/JRSPBc0AdyjjPYRdwINA74koe0P7CXy1BCGSd0RlIzmO+hUyKzMA
	voKSz9ExceIDDdKlNC3uSPXwYNDXVBGrMYXf7QtH9rOhBml06nFx96Lp87+oSI/mnhWm+iQDndd
	UNSfC1yeq+a0TIiY+OTN37zDKCnriFL3iZQa7WtPodCo7qR1cwu4JluSU9+IEjSM1wqdbOJx20e
	ARpnFTE+IVB5aDxdJFBQLgGSBVFJCLT/4ePUiTZMD6jVE+3ET33x8hXJb0FVmI4imdBAFGBbpCq
	KTasNX0kqWb8aSXGIiBSRxgT8qC87bJBuPMhiKtwNA==
X-Google-Smtp-Source: AGHT+IEyAmgL/Yj6E9y7uylZ4geMqW3DfcOVDcZkLoO7C4L2BwUTprk5Be9QSoyNhp0uT1N4V9zQVQ==
X-Received: by 2002:a05:600c:468f:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-436e26ebe46mr232191055e9.31.1736861353542;
        Tue, 14 Jan 2025 05:29:13 -0800 (PST)
Message-ID: <4460f13b-03bc-4ca0-aa97-facde3122be4@suse.com>
Date: Tue, 14 Jan 2025 14:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xl: properly dispose of libxl_dominfo struct instances
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The ssid_label field requires separate freeing; make sure to call
libxl_dominfo_dispose() as well as libxl_dominfo_init(). Since vcpuset()
calls only the former, add a call to the latter there at the same time.

Coverity-ID: 1638727
Coverity-ID: 1638728
Fixes: c458c404da16 ("xl: use libxl_domain_info to get the uuid in printf_info")
Fixes: 48dab9767d2e ("tools/xl: use libxl_domain_info to get domain type for vcpu-pin")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
v2: Add call to libxl_dominfo_init() to vcpuset().

--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -45,8 +45,10 @@ void printf_info_sexp(int domid, libxl_d
     /* retrieve the UUID from dominfo, since it is probably generated
      * during parsing and thus does not match the real one
      */
+    libxl_dominfo_init(&info);
     if (libxl_domain_info(ctx, &info, domid) == 0) {
         fprintf(fh, "\t(uuid " LIBXL_UUID_FMT ")\n", LIBXL_UUID_BYTES(info.uuid));
+        libxl_dominfo_dispose(&info);
     } else {
         fprintf(fh, "\t(uuid <unknown>)\n");
     }
--- a/tools/xl/xl_vcpu.c
+++ b/tools/xl/xl_vcpu.c
@@ -286,6 +286,8 @@ int main_vcpupin(int argc, char **argv)
     if (!ignore_masks && hard) {
         libxl_dominfo dominfo;
 
+        libxl_dominfo_init(&dominfo);
+
         if (libxl_domain_info(ctx, &dominfo, domid)) {
             fprintf(stderr, "Could not get domain info\n");
             goto out;
@@ -293,6 +295,8 @@ int main_vcpupin(int argc, char **argv)
 
         /* HVM and PVH domains use the same global affinity mask */
         apply_global_affinity_masks(dominfo.domain_type, hard, 1);
+
+        libxl_dominfo_dispose(&dominfo);
     }
 
     if (force) {
@@ -348,6 +352,7 @@ static int vcpuset(uint32_t domid, const
         unsigned int online_vcpus, host_cpu = libxl_get_max_cpus(ctx);
         libxl_dominfo dominfo;
 
+        libxl_dominfo_init(&dominfo);
         if (libxl_domain_info(ctx, &dominfo, domid))
             return 1;
 

