Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D403819B7D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657541.1026455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFszG-0004xq-66; Wed, 20 Dec 2023 09:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657541.1026455; Wed, 20 Dec 2023 09:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFszG-0004vW-20; Wed, 20 Dec 2023 09:35:34 +0000
Received: by outflank-mailman (input) for mailman id 657541;
 Wed, 20 Dec 2023 09:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFszE-0004vQ-FP
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:35:32 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e03c3af-9f1b-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:35:31 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3363aa1b7d2so5239803f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:35:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q18-20020adff952000000b0033609b71825sm31080360wrr.35.2023.12.20.01.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 01:35:30 -0800 (PST)
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
X-Inumbo-ID: 1e03c3af-9f1b-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703064931; x=1703669731; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0+4DyYHpqxtRBRAGmbnBXM2G0azwXeKsGEMYSWsqjks=;
        b=Dehr8miOWSnhx+LHGK2Cn5Ukp+YGtwB+CP4XTTcll92u37PQnfaqtnAZuLlEJSyU0/
         ydZGjgloC2K4y4TFZUyec0ek/HzPyGExQVTvslTRXE7nQBOI+wj0PvdZDd7+HR8zxwcA
         Q5uVxz75n8pqQ0AIKcvFtIBYatZofbuFp//Bklgna42Q4VS/SFfWPhM+Is4RAH18AnEO
         3U1tlC6suhrAo88vMviJQgL0KRArCe1cC3KguV5Ku4W6bmQIy0o9FaZ5lB4sD2fcKH+F
         6beeG+nyO/bG+Pus3Ur5g+82YXpMVyZqd/UnNf5tECcqmJ9HA76I4wcPj/1hr9zXoAtE
         pJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703064931; x=1703669731;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+4DyYHpqxtRBRAGmbnBXM2G0azwXeKsGEMYSWsqjks=;
        b=Jz9R5ZX085pNwvJtJQLIlTIRj/0b+CW9wQDa/ay27iVddM+PQfe7T/q7VHTH8gEdON
         V0gnThoG+vzsNTaGynnwBd8O5JmzgTC5mHpRsOxCSz77t6lA1+yXp5mvGj7DmyJW44Jx
         bDYM9cFVdTCHVL8oAjNsLXmDMlzGDKNoEPOKCzuUSqjiKtW4NVFVSxcAAD2DyDblrNH/
         77nxPFvuKxXikgUXEdPta5qm6sAgGi1B6VFZf92Z6kPQwbq/ctMS9tKkY8uOYVgif/yN
         b1FO8WS+n/lTq3BcMYZ4undn1GS8WPkzYCu7ujMyUR7KpuM66nd4YLw9QZrKrsNJCoTW
         zSpg==
X-Gm-Message-State: AOJu0Yxr6kDZE9RUg2UToWtlBKm1C+9tUMGKHRz3uuCT0vUrQzMa46QP
	hvPC033g50A6wBlOGd3BmicAx/8OoLxwgosBG3Em
X-Google-Smtp-Source: AGHT+IHmD7HrN2nZBA8GEzH1zlOBCI4gQO/vf7O3w03hPRJJahJ9Ntbh4mNvNXOXJVGxd0XKGUIYLA==
X-Received: by 2002:a05:600c:4747:b0:40c:3e56:6cb6 with SMTP id w7-20020a05600c474700b0040c3e566cb6mr6601720wmo.179.1703064930789;
        Wed, 20 Dec 2023 01:35:30 -0800 (PST)
Message-ID: <bd72ab26-2258-4a11-9b8d-b69c60ee5b8c@suse.com>
Date: Wed, 20 Dec 2023 10:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/platform: tidy do_platform_op() a little
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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

The function has a few stray scopes and inconsistent use (indentation)
of break statements. Drop the stray braces and bring all the break-s in
line with one another. This in particular means dropping a redundant
break from XENPF_cpu_offline handling, pleasing Misra C:2012 rule 2.1.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2023-12/msg01540.html.

A few more scopes could be eliminated if the various "cpu" variables
were consolidated to switch() of function scope.
---
v2: Also move an inconsistently indented break of an inner switch() (in
    XENPF_set_processor_pminfo handling).

--- unstable.orig/xen/arch/x86/platform_hypercall.c	2023-12-20 10:27:41.690558632 +0100
+++ unstable/xen/arch/x86/platform_hypercall.c	2023-12-20 10:30:48.234533379 +0100
@@ -258,7 +258,6 @@ ret_t do_platform_op(
         break;
 
     case XENPF_add_memtype:
-    {
         ret = mtrr_add_page(
             op->u.add_memtype.mfn,
             op->u.add_memtype.nr_mfns,
@@ -273,11 +272,9 @@ ret_t do_platform_op(
             if ( ret != 0 )
                 mtrr_del_page(ret, 0, 0);
         }
-    }
-    break;
+        break;
 
     case XENPF_del_memtype:
-    {
         if (op->u.del_memtype.handle == 0
             /* mtrr/main.c otherwise does a lookup */
             && (int)op->u.del_memtype.reg >= 0)
@@ -288,8 +285,7 @@ ret_t do_platform_op(
         }
         else
             ret = -EINVAL;
-    }
-    break;
+        break;
 
     case XENPF_read_memtype:
     {
@@ -306,8 +302,8 @@ ret_t do_platform_op(
             ret = __copy_field_to_guest(u_xenpf_op, op, u.read_memtype)
                   ? -EFAULT : 0;
         }
+        break;
     }
-    break;
 
     case XENPF_microcode_update:
     {
@@ -316,8 +312,8 @@ ret_t do_platform_op(
         guest_from_compat_handle(data, op->u.microcode.data);
 
         ret = microcode_update(data, op->u.microcode.length);
+        break;
     }
-    break;
 
     case XENPF_platform_quirk:
     {
@@ -340,8 +336,8 @@ ret_t do_platform_op(
             ret = -EINVAL;
             break;
         }
+        break;
     }
-    break;
 
     case XENPF_firmware_info:
         switch ( op->u.firmware_info.type )
@@ -521,8 +517,8 @@ ret_t do_platform_op(
 
         if ( ret == 0 && __copy_field_to_guest(u_xenpf_op, op, u.getidletime) )
             ret = -EFAULT;
+        break;
     }
-    break;
 
     case XENPF_set_processor_pminfo:
         switch ( op->u.set_pminfo.type )
@@ -560,8 +556,8 @@ ret_t do_platform_op(
 
             guest_from_compat_handle(pdc, op->u.set_pminfo.u.pdc);
             ret = acpi_set_pdc_bits(op->u.set_pminfo.id, pdc);
+            break;
         }
-        break;
 
         default:
             ret = -EINVAL;
@@ -601,8 +597,8 @@ ret_t do_platform_op(
         put_cpu_maps();
 
         ret = __copy_field_to_guest(u_xenpf_op, op, u.pcpu_info) ? -EFAULT : 0;
+        break;
     }
-    break;
 
     case XENPF_get_cpu_version:
     {
@@ -637,8 +633,8 @@ ret_t do_platform_op(
 
         if ( __copy_field_to_guest(u_xenpf_op, op, u.pcpu_version) )
             ret = -EFAULT;
+        break;
     }
-    break;
 
     case XENPF_get_ucode_revision:
     {
@@ -666,8 +662,8 @@ ret_t do_platform_op(
 
         if ( __copy_field_to_guest(u_xenpf_op, op, u.ucode_revision) )
             ret = -EFAULT;
+        break;
     }
-    break;
 
     case XENPF_cpu_online:
     {
@@ -725,7 +721,6 @@ ret_t do_platform_op(
             0, cpu_down_helper, (void *)(unsigned long)cpu);
         break;
     }
-    break;
 
     case XENPF_cpu_hotadd:
         ret = xsm_resource_plug_core(XSM_HOOK);
@@ -735,7 +730,7 @@ ret_t do_platform_op(
         ret = cpu_add(op->u.cpu_add.apic_id,
                       op->u.cpu_add.acpi_id,
                       op->u.cpu_add.pxm);
-    break;
+        break;
 
     case XENPF_mem_hotadd:
         ret = xsm_resource_plug_core(XSM_HOOK);
@@ -775,8 +770,8 @@ ret_t do_platform_op(
             ret = -EINVAL;
             break;
         }
+        break;
     }
-    break;
 
     case XENPF_resource_op:
     {
@@ -842,8 +837,8 @@ ret_t do_platform_op(
             ret = ra.nr_done;
 
         xfree(ra.entries);
+        break;
     }
-    break;
 
     case XENPF_get_symbol:
     {
@@ -870,8 +865,8 @@ ret_t do_platform_op(
             ret = -EFAULT;
         if ( !ret && __copy_field_to_guest(u_xenpf_op, op, u.symdata) )
             ret = -EFAULT;
+        break;
     }
-    break;
 
 #ifdef CONFIG_VIDEO
     case XENPF_get_dom0_console:

