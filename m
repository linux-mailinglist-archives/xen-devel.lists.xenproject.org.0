Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B249A0567F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 10:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867017.1278416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSAV-0001CR-IP; Wed, 08 Jan 2025 09:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867017.1278416; Wed, 08 Jan 2025 09:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSAV-0001AA-Fh; Wed, 08 Jan 2025 09:16:03 +0000
Received: by outflank-mailman (input) for mailman id 867017;
 Wed, 08 Jan 2025 09:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVSAU-0001A4-EZ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 09:16:02 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d1ccdc8-cda1-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 10:16:00 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so190392371fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 01:16:00 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082dd3sm62558621fa.105.2025.01.08.01.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 01:15:59 -0800 (PST)
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
X-Inumbo-ID: 2d1ccdc8-cda1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327760; x=1736932560; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3px2diIUjPy9BkBIZXLYbCve17wV4LOgKHr6yY87Q90=;
        b=H9j+o9CcEVlt8OPL3dIpp50EzZoiPnOi5+BjGzx94LaMn1JBt8y5MXjKp6VRMkzYdd
         MZh7i7nUDMeiTQ8qAbZxGXSvj0CH8UlYuXj0yTwDxhHYrn8IrgXTxg9itXeIKiYUfKyO
         X696SM/C/4CdYRfnIMsmKiawiVs7+rVqakCktU6QPIzChPXrk8+oEL7Mi4jT+GgsYXe1
         hBD2rShm3HwOQGFgdxM50MygmEe8pp17vnEqzDD9c5cthM6zaHUwDdpm8VFVFpOnb7cV
         RDLPmNDtB8Muxi3Vx2GYeZw6Z0arbKXfRBs+rBOUvLiSjK15DmSWwxJoIzNT5NwlkXJH
         Sw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327760; x=1736932560;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3px2diIUjPy9BkBIZXLYbCve17wV4LOgKHr6yY87Q90=;
        b=YK4opBkbAqLhF0dR036uNE7nCheJQkRi0jIoLKtcumd778PLyhuonF08/fqnnjsB3g
         YGs32J/UdI2BFDTkspGQ5p/Njz4ShjTaaijO5pAHLhlGfx46oX6WfZ15+hqsGeGOvBTq
         F85XCocUHJEl50bJSPvpvUfQsPZyUh5J2mVWwvNl5L9ZZIyP8YTsFX8PwgNtAW9M1vLd
         tODlXTD417g3GzHPOzzmvi6KGNQBXiLOiXvIpGdv+/YI+TB46va55B0mrNT39115pz+T
         9YKqH9ovgx/MYDpFFYb6MA2N9g4FpUDwJpPiH9zV8FlTewprfJg7ZOsy0s+n9bLmN6kP
         RCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPHDUmF/RfvM0Ie01lqBgwKJZPqBbUqzKH6qZA6w6EOAcfwEi2umxkZZMV+VyfQxCeYwoNS1QYA1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL4G11H8ZasTB/z/mRUdbtfBJso7NgkbcPb5ok8B8dVR6LMUvr
	bWAyOv/ybyRxwA8ZgQjambRPQLqvTXIAyb+fsA+FeoBd/sX8G60y
X-Gm-Gg: ASbGncuQy3P01ZwBlHrQmxYuCbgek/yA5f0LUD8iseZL1K/ngbyu5+kKpDLLfd4Zz3R
	LjXpb2LYqNyUW8tbjHwoZYh+rjZETYFC5lxJTjI3N8nqndv9sYpyOc7YneBdDrD2YPICoyYmE7e
	+YKvybfHHIMSmmpZ0a4JtCcSZs2YUnZoKwcMYoSaH8sq1FMd5i0HxUbd0yDag5fodD6r4ZZyjQB
	Bcxv4wEvAcTF05bfPtUFlrD84hclY/IhEkOtqiWZN5ViZlcLj2DzR9m+M7YfiY176DSgQ==
X-Google-Smtp-Source: AGHT+IF+fLUlmlqiyVLTt2OFaIY3IXVzg3mc/r+MVYa8382HJZ3N5pPgU5im8J/NTH9oPOkZ6TMzig==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id 38308e7fff4ca-305f45ba080mr5181721fa.27.1736327759324;
        Wed, 08 Jan 2025 01:15:59 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------LRVo0qqkPA0VKGdtFuLKT0D8"
Message-ID: <7482da8f-8bf1-4f0c-b15b-7a31b27b48f3@gmail.com>
Date: Wed, 8 Jan 2025 10:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/traps: Rework LER initialisation and support
 Zen5/Diamond Rapids
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241231192002.1753737-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20241231192002.1753737-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------LRVo0qqkPA0VKGdtFuLKT0D8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/31/24 8:20 PM, Andrew Cooper wrote:
> AMD have always used the architectural MSRs for LER.  As the first processor
> to support LER was the K7 (which was 32bit), we can assume it's presence
> unconditionally in 64bit mode.
>
> Intel are about to run out of space in Family 6 and start using 19.  It is
> only the Pentium 4 which uses non-architectural LER MSRs.
>
> percpu_traps_init(), which runs on every CPU, contains a lot of code which
> should be init-only, and is the only reason why opt_ler can't be in initdata.
>
> Write a brand new init_ler() which expects all future Intel and AMD CPUs to
> continue using the architectural MSRs, and does all setup together.  Call it
> from trap_init(), and remove the setup logic percpu_traps_init() except for
> the single path configuring MSR_IA32_DEBUGCTLMSR.
>
> Leave behind a warning if the user asked for LER and Xen couldn't enable it.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> For 4.20.  This is needed for Zen5 CPUs (already available) as well as Intel
> CPUs coming shortly.  It also moves some non-init logic to being init-only.

As a user can enable/disable LER and support for Zen5/Diamond Rapids is added, and this patch
is already in staging, I think we could mention that in CHANGELOG. If it makes sense I can do
that during finalization of CHANGELOG before release. Does it make sense?

~ Oleksii

> ---
>   xen/arch/x86/traps.c | 86 ++++++++++++++++++++------------------------
>   1 file changed, 39 insertions(+), 47 deletions(-)
>
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index fd8a4448e3f7..377194d7b620 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -114,7 +114,7 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_page, tss_page);
>   static int debug_stack_lines = 20;
>   integer_param("debug_stack_lines", debug_stack_lines);
>   
> -static bool __ro_after_init opt_ler;
> +static bool __initdata opt_ler;
>   boolean_param("ler", opt_ler); /* LastExceptionFromIP on this hardware. Zero if LER is 
> not in use. */ @@ -2092,56 +2092,10 @@ static void __init 
> set_intr_gate(unsigned int n, void *addr) __set_intr_gate(n, 0, addr); 
> } -static unsigned int noinline __init calc_ler_msr(void) -{ - switch 
> ( boot_cpu_data.x86_vendor ) - { - case X86_VENDOR_INTEL: - switch ( 
> boot_cpu_data.x86 ) - { - case 6: - return MSR_IA32_LASTINTFROMIP; - - 
> case 15: - return MSR_P4_LER_FROM_LIP; - } - break; - - case 
> X86_VENDOR_AMD: - switch ( boot_cpu_data.x86 ) - { - case 6: - case 
> 0xf ... 0x19: - return MSR_IA32_LASTINTFROMIP; - } - break; - - case 
> X86_VENDOR_HYGON: - return MSR_IA32_LASTINTFROMIP; - } - - return 0; 
> -} - void percpu_traps_init(void) { subarch_percpu_traps_init(); - if 
> ( !opt_ler ) - return; - - if ( !ler_msr ) - { - ler_msr = 
> calc_ler_msr(); - if ( !ler_msr ) - { - opt_ler = false; - return; - } 
> - - setup_force_cpu_cap(X86_FEATURE_XEN_LBR); - } - if ( 
> cpu_has_xen_lbr ) wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR); 
> } @@ -2201,6 +2155,42 @@ void __init init_idt_traps(void) 
> this_cpu(compat_gdt) = boot_compat_gdt; } +static void __init 
> init_ler(void) +{ + unsigned int msr = 0; + + if ( !opt_ler ) + 
> return; + + /* + * Intel Pentium 4 is the only known CPU to not use 
> the architectural MSR + * indicies. + */ + switch ( 
> boot_cpu_data.x86_vendor ) + { + case X86_VENDOR_INTEL: + if ( 
> boot_cpu_data.x86 == 0xf ) + { + ler_msr = MSR_P4_LER_FROM_LIP; + 
> break; + } + fallthrough; + case X86_VENDOR_AMD: + case 
> X86_VENDOR_HYGON: + ler_msr = MSR_IA32_LASTINTFROMIP; + break; + } + + 
> if ( msr == 0 ) + { + printk(XENLOG_WARNING "LER disabled: failed to identy MSRs\n");
> +        return;
> +    }
> +
> +    ler_msr = msr;
> +    setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
> +}
> +
>   extern void (*const autogen_entrypoints[X86_NR_VECTORS])(void);
>   void __init trap_init(void)
>   {
> @@ -2226,6 +2216,8 @@ void __init trap_init(void)
>           }
>       }
>   
> +    init_ler();
> +
>       /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
>       this_cpu(gdt_l1e) =
>           l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
--------------LRVo0qqkPA0VKGdtFuLKT0D8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/31/24 8:20 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20241231192002.1753737-1-andrew.cooper3@citrix.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">AMD have always used the arc=
hitectural MSRs for LER.  As the first processor
to support LER was the K7 (which was 32bit), we can assume it's presence
unconditionally in 64bit mode.

Intel are about to run out of space in Family 6 and start using 19.  It i=
s
only the Pentium 4 which uses non-architectural LER MSRs.

percpu_traps_init(), which runs on every CPU, contains a lot of code whic=
h
should be init-only, and is the only reason why opt_ler can't be in initd=
ata.

Write a brand new init_ler() which expects all future Intel and AMD CPUs =
to
continue using the architectural MSRs, and does all setup together.  Call=
 it
from trap_init(), and remove the setup logic percpu_traps_init() except f=
or
the single path configuring MSR_IA32_DEBUGCTLMSR.

Leave behind a warning if the user asked for LER and Xen couldn't enable =
it.

Signed-off-by: Andrew Cooper <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Jan Beulich <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:JBeulic=
h@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monn=C3=A9 <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Oleksii Kurochko <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ol=
eksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

For 4.20.  This is needed for Zen5 CPUs (already available) as well as In=
tel
CPUs coming shortly.  It also moves some non-init logic to being init-onl=
y.</pre>
    </blockquote>
    <pre>As a user can enable/disable LER and support for Zen5/Diamond Ra=
pids is added, and this patch
is already in staging, I think we could mention that in CHANGELOG. If it =
makes sense I can do
that during finalization of CHANGELOG before release. Does it make sense?=


~ Oleksii
</pre>
    <blockquote type=3D"cite"
      cite=3D"mid:20241231192002.1753737-1-andrew.cooper3@citrix.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">---
 xen/arch/x86/traps.c | 86 ++++++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index fd8a4448e3f7..377194d7b620 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -114,7 +114,7 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_page, tss_page=
);
 static int debug_stack_lines =3D 20;
 integer_param("debug_stack_lines", debug_stack_lines);
=20
-static bool __ro_after_init opt_ler;
+static bool __initdata opt_ler;
 boolean_param("ler<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:,opt=
_ler);/*LastExceptionFromIPonthishardware.ZeroifLERisnotinuse.*/@@-2092,5=
6+2092,10@@staticvoid__initset_intr_gate(unsignedintn,void*addr)__set_int=
r_gate(n,0,addr);}-staticunsignedintnoinline__initcalc_ler_msr(void)-{-sw=
itch(boot_cpu_data.x86_vendor)-{-caseX86_VENDOR_INTEL:-switch(boot_cpu_da=
ta.x86)-{-case6:-returnMSR_IA32_LASTINTFROMIP;--case15:-returnMSR_P4_LER_=
FROM_LIP;-}-break;--caseX86_VENDOR_AMD:-switch(boot_cpu_data.x86)-{-case6=
:-case0xf...0x19:-returnMSR_IA32_LASTINTFROMIP;-}-break;--caseX86_VENDOR_=
HYGON:-returnMSR_IA32_LASTINTFROMIP;-}--return0;-}-voidpercpu_traps_init(=
void){subarch_percpu_traps_init();-if(!opt_ler)-return;--if(!ler_msr)-{-l=
er_msr=3Dcalc_ler_msr();-if(!ler_msr)-{-opt_ler=3Dfalse;-return;-}--setup=
_force_cpu_cap(X86_FEATURE_XEN_LBR);-}-if(cpu_has_xen_lbr)wrmsrl(MSR_IA32=
_DEBUGCTLMSR,IA32_DEBUGCTLMSR_LBR);}@@-2201,6+2155,42@@void__initinit_idt=
_traps(void)this_cpu(compat_gdt)=3Dboot_compat_gdt;}+staticvoid__initinit=
_ler(void)+{+unsignedintmsr=3D0;++if(!opt_ler)+return;++/*+*IntelPentium4=
istheonlyknownCPUtonotusethearchitecturalMSR+*indicies.+*/+switch(boot_cp=
u_data.x86_vendor)+{+caseX86_VENDOR_INTEL:+if(boot_cpu_data.x86=3D=3D0xf)=
+{+ler_msr=3DMSR_P4_LER_FROM_LIP;+break;+}+fallthrough;+caseX86_VENDOR_AM=
D:+caseX86_VENDOR_HYGON:+ler_msr=3DMSR_IA32_LASTINTFROMIP;+break;+}++if(m=
sr=3D=3D0)+{+printk(XENLOG_WARNING">", opt_ler);
=20
 /* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
@@ -2092,56 +2092,10 @@ static void __init set_intr_gate(unsigned int n, =
void *addr)
     __set_intr_gate(n, 0, addr);
 }
=20
-static unsigned int noinline __init calc_ler_msr(void)
-{
-    switch ( boot_cpu_data.x86_vendor )
-    {
-    case X86_VENDOR_INTEL:
-        switch ( boot_cpu_data.x86 )
-        {
-        case 6:
-            return MSR_IA32_LASTINTFROMIP;
-
-        case 15:
-            return MSR_P4_LER_FROM_LIP;
-        }
-        break;
-
-    case X86_VENDOR_AMD:
-        switch ( boot_cpu_data.x86 )
-        {
-        case 6:
-        case 0xf ... 0x19:
-            return MSR_IA32_LASTINTFROMIP;
-        }
-        break;
-
-    case X86_VENDOR_HYGON:
-        return MSR_IA32_LASTINTFROMIP;
-    }
-
-    return 0;
-}
-
 void percpu_traps_init(void)
 {
     subarch_percpu_traps_init();
=20
-    if ( !opt_ler )
-        return;
-
-    if ( !ler_msr )
-    {
-        ler_msr =3D calc_ler_msr();
-        if ( !ler_msr )
-        {
-            opt_ler =3D false;
-            return;
-        }
-
-        setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
-    }
-
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
 }
@@ -2201,6 +2155,42 @@ void __init init_idt_traps(void)
         this_cpu(compat_gdt) =3D boot_compat_gdt;
 }
=20
+static void __init init_ler(void)
+{
+    unsigned int msr =3D 0;
+
+    if ( !opt_ler )
+        return;
+
+    /*
+     * Intel Pentium 4 is the only known CPU to not use the architectura=
l MSR
+     * indicies.
+     */
+    switch ( boot_cpu_data.x86_vendor )
+    {
+    case X86_VENDOR_INTEL:
+        if ( boot_cpu_data.x86 =3D=3D 0xf )
+        {
+            ler_msr =3D MSR_P4_LER_FROM_LIP;
+            break;
+        }
+        fallthrough;
+    case X86_VENDOR_AMD:
+    case X86_VENDOR_HYGON:
+        ler_msr =3D MSR_IA32_LASTINTFROMIP;
+        break;
+    }
+
+    if ( msr =3D=3D 0 )
+    {
+        printk(XENLOG_WARNING "</a>LER disabled: failed to identy MSRs\n=
");
+        return;
+    }
+
+    ler_msr =3D msr;
+    setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
+}
+
 extern void (*const autogen_entrypoints[X86_NR_VECTORS])(void);
 void __init trap_init(void)
 {
@@ -2226,6 +2216,8 @@ void __init trap_init(void)
         }
     }
=20
+    init_ler();
+
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. *=
/
     this_cpu(gdt_l1e) =3D
         l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
</pre>
    </blockquote>
  </body>
</html>

--------------LRVo0qqkPA0VKGdtFuLKT0D8--

