Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBAD1795E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 10:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201298.1516956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfacV-0004Qb-Hn; Tue, 13 Jan 2026 09:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201298.1516956; Tue, 13 Jan 2026 09:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfacV-0004Ni-F8; Tue, 13 Jan 2026 09:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1201298;
 Tue, 13 Jan 2026 09:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfacU-0004Nc-Mr
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 09:23:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80ce9336-f061-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 10:23:21 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47d5e021a53so53856025e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 01:23:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432dd78f5a8sm23323552f8f.27.2026.01.13.01.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 01:23:20 -0800 (PST)
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
X-Inumbo-ID: 80ce9336-f061-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768296201; x=1768901001; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtR/nz8wgGMX8gGZMJlyO/c1Tg8Ef9r9iiBmR57GcMo=;
        b=ZndAboNPTA5jg7dlN9bz0wBgNqRR3EydUvogmdhex1wQotQEEOAI2PdenJ0JmuIH0F
         EtBqczpnVLE5Ifj7IGD93OAZm68zBUfjt5JZH5FWEjX3eHrfoHGBmSfxiJnB7iaHGPYm
         leV1QpHmLtm7hZtfSY/IDORADTHKk1afoGkCVpKYLeZDuMYyHJcuMk+aJi0L/OBO/2lx
         LWbVoIiyE8gW9iZfxOResVQ5/FQ+pxEn+u5RLapsRJrFyaQPJlHkFUQ+JMmoGrGvKnY6
         jLbxrhQJl7JsFc3wsTyQUiy0NPbB8fpaBSjqtF8BaQSAmDZR1bSmelUHJ5E4IsHYG4v0
         uM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296201; x=1768901001;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtR/nz8wgGMX8gGZMJlyO/c1Tg8Ef9r9iiBmR57GcMo=;
        b=sA8T9D3cK9+c7BBTC5JDQ9LmuoBX/wliFSW9nH8U7H8OGcnkS5eHPFl+PgvFAwnga3
         /TRykjnBntiwQel8wIRhqWNjBUFG2Ow//2rFwLdn7WfzbAkBlvhhN+F+/8qR6wjkuk2l
         Qgof3FHoaNSaZNPSQRjnF14QbtdkgAOJOB6VXdZP8S7932vEHiCz0iMaSmac9XISpeNA
         yxzF7TC05fs0maZ9gdW/AeRBf7v8yQT2nzqHHMVYUg3z/ZYFNdDmrsQy94Kn6OAd7GDw
         n07XvrLU/yYJziLYc8m4whIIxN0sOIPiPfJfDo6EJ6wGip67niMf7UnxSAymFqNmDP0E
         2Ltg==
X-Gm-Message-State: AOJu0YzIoix353+I1tP7cJlOQUscq7JPMLXkkfB1ZeJBKMlFKw+sbFy4
	kfXuv0iUNbI3xso/cRI0jjdrnUISz61o6x8sY7BfJRzERtbEglgEeWYSRYPXCIb+fznpVx/0Cfi
	0Qms=
X-Gm-Gg: AY/fxX4fgOlIJibmVi3fnnIIO55/NfxyqfwkS3nZilPxkTzIVmbj7Nt243+vLdcivnM
	f/l6X/odmJ/TtW/FsJD46+DXiqnVxWiSJvh77hPsuBX462rhm0DKOf3XXCcT+LxpDxGUf30iMd4
	jiOhG5bjgvDiH4LY5tSN1iMsn1bekgzekeEQjJ14ljtVqJaQg4IDYNsMnQGYVFAZG1G7UFbDjRb
	Nky2pD69l4nNGqyVE8F1RHfHlShhV3mmH6VeQ6mGtl7w6STyHQpnVs669xnWoRbI0HBkzGshU2V
	zEtST67v9BVnFdolRvyRFRBUpGzaZ1czG+xcFABy1Io8VMyiQXF0ZczteVWshiWCyhNtywXI9GD
	cDjAZJ9fSI2XRF5GjPIeQYgIA6+s0/rJyfsJJPL8gxl4zup0tzOcdcNlYvig/PeBe2XUteCvjro
	zd6kMyxdxgIrWUXRu9PEcIwXZLNECbITHZDAMlfiTctzUsv0RS89PXyreAMvjb8VxAIoso2bqwG
	ss=
X-Google-Smtp-Source: AGHT+IGHmrU3Z3EtWomp4yvEcbiAt6VhTJS+oJSj3DAMbEuxrhw/F4tPwRKiZt1gh/q1dDg1fe17vA==
X-Received: by 2002:a05:600c:1991:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-47d84b40aa4mr267981935e9.35.1768296200788;
        Tue, 13 Jan 2026 01:23:20 -0800 (PST)
Message-ID: <54667383-d1ff-467f-9dfc-95d23aa600cc@suse.com>
Date: Tue, 13 Jan 2026 10:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/platform: adjust CONFIG_VIDEO usage
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

Switch to using IS_ENABLED() in both places, thus in particular making
sure XENPF_get_dom0_console handling doesn't take the "default" path: The
behavior better wouldn't differ between VIDEO=y and there not being VGA vs
VIDEO=n. For this to work, fill_console_start_info() needs to be
unconditionally declared; extend that to vga_console_info as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not quite certain whether to have Fixes: 11b4ff64841e ("x86/platform:
protect XENPF_get_dom0_console if CONFIG_VIDEO not set") here. Opinions?

--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -415,10 +415,9 @@ ret_t do_platform_op(
         }
         case XEN_FW_VBEDDC_INFO:
             ret = -ESRCH;
-#ifdef CONFIG_VIDEO
-            if ( op->u.firmware_info.index != 0 )
-                break;
-            if ( *(u32 *)bootsym(boot_edid_info) == 0x13131313 )
+            if ( !IS_ENABLED(CONFIG_VIDEO) ||
+                 op->u.firmware_info.index != 0 ||
+                 *(uint32_t *)bootsym(boot_edid_info) == 0x13131313 )
                 break;
 
             op->u.firmware_info.u.vbeddc_info.capabilities =
@@ -434,7 +433,6 @@ ret_t do_platform_op(
                  copy_to_compat(op->u.firmware_info.u.vbeddc_info.edid,
                                 bootsym(boot_edid_info), 128) )
                 ret = -EFAULT;
-#endif
             break;
         case XEN_FW_EFI_INFO:
             ret = efi_get_info(op->u.firmware_info.index,
@@ -905,20 +903,19 @@ ret_t do_platform_op(
         break;
     }
 
-#ifdef CONFIG_VIDEO
     case XENPF_get_dom0_console:
         BUILD_BUG_ON(sizeof(op->u.dom0_console) > sizeof(op->u.pad));
-        ret = sizeof(op->u.dom0_console);
-        if ( !fill_console_start_info(&op->u.dom0_console) )
-        {
-            ret = -ENODEV;
+
+        ret = -ENODEV;
+        if ( !IS_ENABLED(CONFIG_VIDEO) ||
+             !fill_console_start_info(&op->u.dom0_console) )
             break;
-        }
+
+        ret = sizeof(op->u.dom0_console);
 
         if ( copy_field_to_guest(u_xenpf_op, op, u.dom0_console) )
             ret = -EFAULT;
         break;
-#endif
 
     default:
         ret = -ENOSYS;
--- a/xen/include/xen/vga.h
+++ b/xen/include/xen/vga.h
@@ -11,9 +11,10 @@
 
 #include <xen/video.h>
 
-#ifdef CONFIG_VGA
 extern struct xen_vga_console_info vga_console_info;
 int fill_console_start_info(struct dom0_vga_console_info *ci);
+
+#ifdef CONFIG_VGA
 void vesa_init(void);
 void vesa_early_init(void);
 void vesa_endboot(bool keep);

