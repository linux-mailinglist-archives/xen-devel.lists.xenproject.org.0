Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251BB5A087
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 20:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124799.1467003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyaSP-0005Cg-JA; Tue, 16 Sep 2025 18:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124799.1467003; Tue, 16 Sep 2025 18:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyaSP-0005Ad-Fw; Tue, 16 Sep 2025 18:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1124799;
 Tue, 16 Sep 2025 18:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ibD=33=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uyaSN-0005AX-Q0
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 18:31:11 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 509eff98-932b-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 20:31:10 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-25669596955so59838725ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 11:31:10 -0700 (PDT)
Received: from [10.10.151.246] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25eda9b0124sm119997295ad.72.2025.09.16.11.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 11:31:08 -0700 (PDT)
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
X-Inumbo-ID: 509eff98-932b-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758047469; x=1758652269; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TBGeBwXSx1uoROCbnURu50DazYBBHG6c4DxP1O6kH0=;
        b=UXBrVg1yxZ8pG6VvNxo71nYFRjjHi5dGV2UopYtcArpVr6yt69Su/POPYHF6YiTQvH
         EYl2C5P9FiJGgYYPV8uCYXUMhd4FjT84aqbFFiAQo1v9fbEMJPYZNjcKa1Pw7E/cNkY0
         R0/3YqruYr0wU6xK1EYOPaF23fNR+ILXmnzdedRKkvIzxrffRGjyu3UXei4roUjzXti7
         mnhai575APUXiQDzwoZKZmjJzrsaTMfgCGKaoZk/QJlrs7GaY4LZ9qr53mrQDpBJZKUE
         hVdAcmIFGTj67g1I6YcAO404ImLz/v8UDWAc8hDwzpoMnKKSbgiUKdJcK1YnRqsx4Ls/
         Mwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758047469; x=1758652269;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TBGeBwXSx1uoROCbnURu50DazYBBHG6c4DxP1O6kH0=;
        b=N7+pWmofjyJHKDNUDKmxR29MCOhtJ8E49yZYuIJ32UJWOOXMB5mZCmavVvntE+vCZt
         UlmR6p+PzCnx+uKnOB0I+PhsARslOtkLLUzT1ovk5XLszTBMBivtnTtJPXie3z9bpm6n
         nc0JhZVD7v23ZJgAMH5loshUOT/mN4gkvaJfQf7os8gt76Cy2dw93mzprQ7aBKwzlp+D
         W7ykvoPqcHQubNPLbcygzsXnatuAweeXJAwPhw0pFtaSc2dLY9RKRigRWFnhGXcwYwOZ
         w7XQUmkz+r9d08yBJwt/Bbd3AfAz32rlUBCwLOEZRPgh16B+qKWumMJZVpf7LTUBvhFw
         RysA==
X-Forwarded-Encrypted: i=1; AJvYcCXhr7WOmxCiFUxBJy0C+47piItCg6JgaLWuQ48VC8YX+tvYrUs4fGvv9dX+ZJBPe2AV6oYSQTrGlx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygPzWtGdCahopr1MWG5coDD1zk8MWEg43SVJxEUyxdRyxhLei2
	kmrFbv+qxtUz2JgVzc7LIJ5P2dd4KY3VI5SmlHh0qRwqNkdS8oRRgPK6
X-Gm-Gg: ASbGncthemCBZBXmCofAZPKZygt+Mihypo2xTinlCz9+9gKXtZa2AyoCXoNsP77z8Ae
	fjlmhus33JLrXVF+jlkCBf/ltwOPpqMt6P7mZcD2L2dRFk28DMeQBJ8K4WWpS57GXC/HaQJSIih
	w5EGTbR6Whillw1CcmdT6wYlQPHD/QxmHt1mzORl0pXP+77vAl+By7YokAxKUJKYOrcxUKSojz1
	4LvyXbi4vdQkXH7dMnVE0/am/A844wJxtpnnSrTrk4HlqilLpxC48wj6J8PL2Gr9Z8Rb5BQpYB7
	kAYwSIXcGUk51SUc0Jd2e/x3IKhowfgvMuUGjJUb7miKYoG08r7MJZwvR4AGYNxFvwR/It0/5M6
	X6FgHp/54jl4MJQysk0TFoXPpEg18HdPYkT4pBQ==
X-Google-Smtp-Source: AGHT+IH24HN0gRp38x/CwoPNtQwk77aV2jl8+TCzQmBTyUm+LGfWDkwSSUsKRYleiWpZuQg+1ojprg==
X-Received: by 2002:a17:902:dace:b0:264:f3ed:ee2c with SMTP id d9443c01a7336-264f3edf689mr128336455ad.12.1758047468522;
        Tue, 16 Sep 2025 11:31:08 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------xjFVMHajgA0MTdDKb0qO8m7v"
Message-ID: <364993ef-cff8-4967-8f0c-d7d3adf132d8@gmail.com>
Date: Tue, 16 Sep 2025 20:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/2] x86: hvm: svm: fix runtime svm presence check
 for !CONFIG_AMD_SVM case
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
 <20250916103251.2144449-2-grygorii_strashko@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250916103251.2144449-2-grygorii_strashko@epam.com>

This is a multi-part message in MIME format.
--------------xjFVMHajgA0MTdDKb0qO8m7v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/16/25 12:32 PM, Grygorii Strashko wrote:
> From: Grygorii Strashko<grygorii_strashko@epam.com>
>
> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
> AMD-V support can be gracefully disabled, but it still keeps SVM
> code partially built-in, because HVM code uses mix of:
>
> - "cpu_has_svm" macro, which doesn't account for CONFIG_AMD_SVM cfg
> - "using_svm()" function, which accounts for CONFIG_AMD_SVM cfg
>
> for runtime SVM availability checking. As result compiler DCE can't remove
> all, unreachable SVM code.
>
> Fix it by sticking to "cpu_has_svm" macro usage only which is updated to
> account CONFIG_AMD_SVM cfg.
>
> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> ---
> Hi
>
> It could be good to have it in 4.21.
>
> bloat-o-meter:
> add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-98 (-98)
> Function                                     old     new   delta
> guest_flush_tlb_flags                         71      62      -9
> init_speculation_mitigations               10024   10011     -13
> hvm_set_efer                                 364     288     -76
> Total: Before=3656835, After=3656737, chg -0.00%

It doesn't seem critical for the current release stage, so let's consider these
changes for 4.22.

Thanks.

~ Oleksii

>
>   xen/arch/x86/domain.c                 | 4 ++--
>   xen/arch/x86/hvm/hvm.c                | 2 +-
>   xen/arch/x86/hvm/nestedhvm.c          | 2 +-
>   xen/arch/x86/include/asm/cpufeature.h | 3 ++-
>   xen/arch/x86/include/asm/hvm/hvm.h    | 5 -----
>   5 files changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88d2..92661527eb75 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1824,7 +1824,7 @@ static void load_segments(struct vcpu *n)
>           if ( !(n->arch.flags & TF_kernel_mode) )
>               SWAP(gsb, gss);
>   
> -        if ( using_svm() && (n->arch.pv.fs | n->arch.pv.gs) <= 3 )
> +        if ( cpu_has_svm && (n->arch.pv.fs | n->arch.pv.gs) <= 3 )
>               fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
>                                          n->arch.pv.fs_base, gsb, gss);
>       }
> @@ -2142,7 +2142,7 @@ static void __context_switch(void)
>   
>   #ifdef CONFIG_PV
>       /* Prefetch the VMCB if we expect to use it later in the context switch */
> -    if ( using_svm() && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
> +    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
>           svm_load_segs_prefetch();
>   #endif
>   
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 57d09e02ed0f..330103ddf386 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -160,7 +160,7 @@ static int __init cf_check hvm_enable(void)
>   
>       if ( cpu_has_vmx )
>           fns = start_vmx();
> -    else if ( using_svm() )
> +    else if ( cpu_has_svm )
>           fns = start_svm();
>   
>       if ( fns )
> diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
> index c6329ba2e51a..d895a738448c 100644
> --- a/xen/arch/x86/hvm/nestedhvm.c
> +++ b/xen/arch/x86/hvm/nestedhvm.c
> @@ -157,7 +157,7 @@ static int __init cf_check nestedhvm_setup(void)
>        */
>       if ( cpu_has_vmx )
>           start_nested_vmx(&hvm_funcs);
> -    else if ( using_svm() )
> +    else if ( cpu_has_svm )
>           start_nested_svm(&hvm_funcs);
>   
>       return 0;
> diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
> index f42e95586966..ce7dc1ddad0a 100644
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -165,7 +165,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>   
>   /* CPUID level 0x80000001.ecx */
>   #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
> +#define cpu_has_svm             (IS_ENABLED(CONFIG_AMD_SVM) && \
> +                                 boot_cpu_has(X86_FEATURE_SVM))
>   #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
>   #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>   #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 0fa9e3c21598..24a7ed88567b 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -383,11 +383,6 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src);
>   
>   int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
>   
> -static inline bool using_svm(void)
> -{
> -    return IS_ENABLED(CONFIG_AMD_SVM) && cpu_has_svm;
> -}
> -
>   #ifdef CONFIG_HVM
>   
>   #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
--------------xjFVMHajgA0MTdDKb0qO8m7v
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/16/25 12:32 PM, Grygorii Strashko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250916103251.2144449-2-grygorii_strashko@epam.com">
      <pre wrap="" class="moz-quote-pre">From: Grygorii Strashko <a class="moz-txt-link-rfc2396E" href="mailto:grygorii_strashko@epam.com">&lt;grygorii_strashko@epam.com&gt;</a>

Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
AMD-V support can be gracefully disabled, but it still keeps SVM
code partially built-in, because HVM code uses mix of:

- "cpu_has_svm" macro, which doesn't account for CONFIG_AMD_SVM cfg
- "using_svm()" function, which accounts for CONFIG_AMD_SVM cfg

for runtime SVM availability checking. As result compiler DCE can't remove
all, unreachable SVM code.

Fix it by sticking to "cpu_has_svm" macro usage only which is updated to
account CONFIG_AMD_SVM cfg.

Signed-off-by: Grygorii Strashko <a class="moz-txt-link-rfc2396E" href="mailto:grygorii_strashko@epam.com">&lt;grygorii_strashko@epam.com&gt;</a>
---
Hi

It could be good to have it in 4.21.

bloat-o-meter:
add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-98 (-98)
Function                                     old     new   delta
guest_flush_tlb_flags                         71      62      -9
init_speculation_mitigations               10024   10011     -13
hvm_set_efer                                 364     288     -76
Total: Before=3656835, After=3656737, chg -0.00%</pre>
    </blockquote>
    <pre>It doesn't seem critical for the current release stage, so let's consider these
changes for 4.22.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250916103251.2144449-2-grygorii_strashko@epam.com">
      <pre wrap="" class="moz-quote-pre">

 xen/arch/x86/domain.c                 | 4 ++--
 xen/arch/x86/hvm/hvm.c                | 2 +-
 xen/arch/x86/hvm/nestedhvm.c          | 2 +-
 xen/arch/x86/include/asm/cpufeature.h | 3 ++-
 xen/arch/x86/include/asm/hvm/hvm.h    | 5 -----
 5 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88d2..92661527eb75 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1824,7 +1824,7 @@ static void load_segments(struct vcpu *n)
         if ( !(n-&gt;arch.flags &amp; TF_kernel_mode) )
             SWAP(gsb, gss);
 
-        if ( using_svm() &amp;&amp; (n-&gt;arch.pv.fs | n-&gt;arch.pv.gs) &lt;= 3 )
+        if ( cpu_has_svm &amp;&amp; (n-&gt;arch.pv.fs | n-&gt;arch.pv.gs) &lt;= 3 )
             fs_gs_done = svm_load_segs(n-&gt;arch.pv.ldt_ents, LDT_VIRT_START(n),
                                        n-&gt;arch.pv.fs_base, gsb, gss);
     }
@@ -2142,7 +2142,7 @@ static void __context_switch(void)
 
 #ifdef CONFIG_PV
     /* Prefetch the VMCB if we expect to use it later in the context switch */
-    if ( using_svm() &amp;&amp; is_pv_64bit_domain(nd) &amp;&amp; !is_idle_domain(nd) )
+    if ( cpu_has_svm &amp;&amp; is_pv_64bit_domain(nd) &amp;&amp; !is_idle_domain(nd) )
         svm_load_segs_prefetch();
 #endif
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 57d09e02ed0f..330103ddf386 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -160,7 +160,7 @@ static int __init cf_check hvm_enable(void)
 
     if ( cpu_has_vmx )
         fns = start_vmx();
-    else if ( using_svm() )
+    else if ( cpu_has_svm )
         fns = start_svm();
 
     if ( fns )
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index c6329ba2e51a..d895a738448c 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -157,7 +157,7 @@ static int __init cf_check nestedhvm_setup(void)
      */
     if ( cpu_has_vmx )
         start_nested_vmx(&amp;hvm_funcs);
-    else if ( using_svm() )
+    else if ( cpu_has_svm )
         start_nested_svm(&amp;hvm_funcs);
 
     return 0;
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index f42e95586966..ce7dc1ddad0a 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -165,7 +165,8 @@ static inline bool boot_cpu_has(unsigned int feat)
 
 /* CPUID level 0x80000001.ecx */
 #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
-#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
+#define cpu_has_svm             (IS_ENABLED(CONFIG_AMD_SVM) &amp;&amp; \
+                                 boot_cpu_has(X86_FEATURE_SVM))
 #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
 #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
 #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 0fa9e3c21598..24a7ed88567b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -383,11 +383,6 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src);
 
 int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
 
-static inline bool using_svm(void)
-{
-    return IS_ENABLED(CONFIG_AMD_SVM) &amp;&amp; cpu_has_svm;
-}
-
 #ifdef CONFIG_HVM
 
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
</pre>
    </blockquote>
  </body>
</html>

--------------xjFVMHajgA0MTdDKb0qO8m7v--

