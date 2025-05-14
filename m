Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F4AB67C9
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 11:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984122.1370297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF8b8-0006RE-Ra; Wed, 14 May 2025 09:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984122.1370297; Wed, 14 May 2025 09:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF8b8-0006Pj-Oi; Wed, 14 May 2025 09:40:22 +0000
Received: by outflank-mailman (input) for mailman id 984122;
 Wed, 14 May 2025 09:40:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7agW=X6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uF8b6-0006PZ-TF
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 09:40:21 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 732c8f9b-30a7-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 11:40:19 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54b166fa41bso8478812e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 02:40:19 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc644fa78sm2172536e87.32.2025.05.14.02.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 02:40:18 -0700 (PDT)
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
X-Inumbo-ID: 732c8f9b-30a7-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747215619; x=1747820419; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTZv9xz8utWEC72UJb52B2n2tOeCs396jJK9ywvIQTU=;
        b=bD3Azx+rO5Ub3wx6Y7lJEC6N6Vb3bfmrGjrAi82NoxmKTGyUvZtLCsBH+9herRxZqF
         vtrZyvFX+SXI9+RLLF4DSRPaaFoG8bjBfRY/AQMib1R2osAy9igRQEpEZHGI74iuIDem
         ZVWXalj360xlLE6HEHFiFNrokQq4PhceDR+GbrpxGE4R263g1WPctHzYV1NvH+h2lKaW
         gNN6tlK1OrN2/+fPPbMsi0MpZ/lnhDsqo7y01dsX6dTgqCiGX1nbAMRqk4QngVt18AaQ
         hrATf1ubG8kK2y/WcDkUpH01eol5k+lMzdsUXAM/Zgnr/ZtTFM+WHA+xq+n+MXLke1Q1
         k20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747215619; x=1747820419;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTZv9xz8utWEC72UJb52B2n2tOeCs396jJK9ywvIQTU=;
        b=P5C+Yi/b+xyyyQwBRwcGCC8hTbZRhI7Rh5bE0pCr/qnqlq19uAI7bZhgEwFx3qcxSp
         ItXm8g+mPXE3VZ7/1UurZxT4u6CWaGFHdSseJdlP7ZfCCoVbGqxOvv5F6x6sdV6dD2cO
         0XKZFU7vG52T+h+NBMYnjWh4V49G62ddDunMknI31VrRViDgyGTH14f3R01+baiYf7W+
         StHMUl04gU1sG98ArT2AGuuzd5ia6qcNUsjhSgsgDsxcMCpdon9a8eliwroP30M7sGyY
         FuFADSEusry8lZ3xWa0tG0yaReon4hoH1iLzU51C8xVO0XBlbjEk98xJgC2t+h7f4dCI
         fV+g==
X-Gm-Message-State: AOJu0YzWttIMSTmf3U1e/jhrtVLcxJxDh4Gi4AoZztLBKW/JJH0G6dY2
	dZfA7nH0Xu3h+WkGJeob7Rqp86u3bbAdlKF6s/F2wjt86wOB52Iu
X-Gm-Gg: ASbGnct8eBlWag/lP8YKu15rzyGQhCiY4bAnjshNZlSCCzsuVOnpDwyG06gF6RF2tE6
	LyARnfygHxMX5/SHuPNTZcpNh8LsZIRCc3gwzT97wYDZk6RzXnOgwmR5UBoG7tq+m+/d3qpdRTa
	3aIrX+cXWCuYFao+e8uNzKoADGy6nfYAkiBUgWrMLp/Bvrg6H9yLdUk/CfW68EkQexmG0V8KMPb
	bawhUT1+AzyS7FQNyz86zvk8dMwLov9l9Iy0wTmxuT4oDDhpRanYj2ac89wRfaECt/iKhLuYQPm
	dr74130B9NqMB165bgDRhMjC6N8ujwn05Yq/NfZcNLyEyLi3wh1eRmf09epYOPQDc0mVhcojPkC
	/FUE2Q8yzCn4qUJSadIeYS2aA
X-Google-Smtp-Source: AGHT+IF1TaC8qYOKC9g0zpa14eMMbL/vyMMjV5msM/JCJ9yU1+CwhMWi3KSaTKzA6CSm6bLIpwcliQ==
X-Received: by 2002:a05:6512:228e:b0:545:f1d:6f2c with SMTP id 2adb3069b0e04-550d5fa35b5mr1043551e87.18.1747215618935;
        Wed, 14 May 2025 02:40:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uGiua9zkPM0WYozkwo5Ku0Ml"
Message-ID: <3f1ad6d6-a03f-4f3a-85f7-a154f1aa7852@gmail.com>
Date: Wed, 14 May 2025 11:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505131657301.368682@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2505131657301.368682@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------uGiua9zkPM0WYozkwo5Ku0Ml
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/14/25 1:58 AM, Stefano Stabellini wrote:
> On Tue, 13 May 2025, Oleksii Kurochko wrote:
>> Refactor construct_domU() to improve architecture separation and reduce
>> reliance on ARM-specific logic in common code:
>> - Drop set_domain_type() from generic code. This function is specific
>>    to ARM and serves no purpose on other architectures like RISC-V,
>>    which lack the arch.type field in kernel_info.
>> - Introduce arch_construct_domU() to encapsulate architecture-specific
>>    DomU construction steps.
>> - Implement arch_construct_domU() for ARM. This includes:
>>    - Setting the domain type for CONFIG_ARM64.
>>    - Handling static memory allocation if xen,static-mem is present in
>>      the device tree.
>>    - Processing static shared memory.
>> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>>    this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>>    at least, now.
>>
>> This cleanup avoids empty stubs on other architectures and moves
>> ARM-specific logic into arch code where it belongs.
>>
>> Also, don't loose  a return value of functions called in
>> Arm's make_arch_nodes().
>>
>> Suggested-by: Michal Orzel<michal.orzel@amd.com>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/arm/dom0less-build.c            | 42 +++++++++++++++++-------
>>   xen/common/device-tree/dom0less-build.c  | 30 ++---------------
>>   xen/include/asm-generic/dom0less-build.h |  3 +-
>>   3 files changed, 36 insertions(+), 39 deletions(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index a49764f0ad..592173268f 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -220,9 +220,14 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
>>   {
>>       int ret;
>>   
>> +    ret = make_resv_memory_node(kinfo, GUEST_ROOT_ADDRESS_CELLS,
>> +                                GUEST_ROOT_SIZE_CELLS);
>> +    if ( ret )
>> +        return ret;
>> +
>>       ret = make_psci_node(kinfo->fdt);
>>       if ( ret )
>> -        return -EINVAL;
>> +        return ret;
>>   
>>       if ( kinfo->arch.vpl011 )
>>       {
>> @@ -230,26 +235,41 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
>>           ret = make_vpl011_uart_node(kinfo);
>>   #endif
>>           if ( ret )
>> -            return -EINVAL;
>> +            return ret;
>>       }
>>   
>>       return 0;
>>   }
>>   
>> -/* TODO: make arch.type generic ? */
>> -#ifdef CONFIG_ARM_64
>> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>> +int __init arch_construct_domU(struct kernel_info *kinfo,
>> +                               const struct dt_device_node *node)
>>   {
>> +    int rc = 0;
>> +    struct domain *d = kinfo->d;
>> +
>> +#ifdef CONFIG_ARM_64
>>       /* type must be set before allocate memory */
>>       d->arch.type = kinfo->arch.type;
>> -}
>> -#else
>> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>> -{
>> -    /* Nothing to do */
>> -}
>>   #endif
> NIT: I think it would be nicer to do
>
> if ( is_hardware_domain(d) )
>      return rc;
>
> but it is also OK as below
>
> Reviewed-by: Stefano Stabellini<sstabellini@kernel.org>

Thanks.

It would be really nicer, I'll update  that in the next one version.

~ Oleksii

>
>
>> +    if ( !is_hardware_domain(d) )
>> +    {
>> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
>> +        {
>> +            if ( !is_domain_direct_mapped(d) )
>> +                allocate_static_memory(d, kinfo, node);
>> +            else
>> +                assign_static_memory_11(d, kinfo, node);
>> +        }
>> +
>> +        rc = process_shm(d, kinfo, node);
>> +        if ( rc < 0 )
>> +            return rc;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>>   int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
>>                         const struct dt_device_node *node)
>>   {
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index 2c56f13771..f6aabc2093 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -28,14 +28,6 @@
>>   #include <asm/dom0less-build.h>
>>   #include <asm/setup.h>
>>   
>> -#if __has_include(<asm/static-memory.h>)
>> -#   include <asm/static-memory.h>
>> -#endif
>> -
>> -#if __has_include(<asm/static-shmem.h>)
>> -#   include <asm/static-shmem.h>
>> -#endif
>> -
>>   #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>>   
>>   static domid_t __initdata xs_domid = DOMID_INVALID;
>> @@ -507,12 +499,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>       if ( ret )
>>           goto err;
>>   
>> -#ifdef CONFIG_STATIC_SHM
>> -    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
>> -    if ( ret )
>> -        goto err;
>> -#endif
>> -
>>       /*
>>        * domain_handle_dtb_bootmodule has to be called before the rest of
>>        * the device tree is generated because it depends on the value of
>> @@ -787,7 +773,9 @@ static int __init construct_domU(struct domain *d,
>>       if ( rc < 0 )
>>           return rc;
>>   
>> -    set_domain_type(d, &kinfo);
>> +    rc = arch_construct_domU(&kinfo, node);
>> +    if ( rc )
>> +        return rc;
>>   
>>       if ( is_hardware_domain(d) )
>>       {
>> @@ -799,18 +787,6 @@ static int __init construct_domU(struct domain *d,
>>       {
>>           if ( !dt_find_property(node, "xen,static-mem", NULL) )
>>               allocate_memory(d, &kinfo);
>> -#ifdef CONFIG_STATIC_MEMORY
>> -        else if ( !is_domain_direct_mapped(d) )
>> -            allocate_static_memory(d, &kinfo, node);
>> -        else
>> -            assign_static_memory_11(d, &kinfo, node);
>> -#endif
>> -
>> -#ifdef CONFIG_STATIC_SHM
>> -        rc = process_shm(d, &kinfo, node);
>> -        if ( rc < 0 )
>> -            return rc;
>> -#endif
>>   
>>           rc = init_vuart(d, &kinfo, node);
>>           if ( rc < 0 )
>> diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
>> index e0ad0429ec..78142e71ca 100644
>> --- a/xen/include/asm-generic/dom0less-build.h
>> +++ b/xen/include/asm-generic/dom0less-build.h
>> @@ -56,7 +56,8 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
>>   int make_intc_domU_node(struct kernel_info *kinfo);
>>   int make_arch_nodes(struct kernel_info *kinfo);
>>   
>> -void set_domain_type(struct domain *d, struct kernel_info *kinfo);
>> +int arch_construct_domU(struct kernel_info *kinfo,
>> +                        const struct dt_device_node *node);
>>   
>>   int init_intc_phandle(struct kernel_info *kinfo, const char *name,
>>                         const int node_next, const void *pfdt);
>> -- 
>> 2.49.0
>>
--------------uGiua9zkPM0WYozkwo5Ku0Ml
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
    <div class="moz-cite-prefix">On 5/14/25 1:58 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505131657301.368682@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Tue, 13 May 2025, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Refactor construct_domU() to improve architecture separation and reduce
reliance on ARM-specific logic in common code:
- Drop set_domain_type() from generic code. This function is specific
  to ARM and serves no purpose on other architectures like RISC-V,
  which lack the arch.type field in kernel_info.
- Introduce arch_construct_domU() to encapsulate architecture-specific
  DomU construction steps.
- Implement arch_construct_domU() for ARM. This includes:
  - Setting the domain type for CONFIG_ARM64.
  - Handling static memory allocation if xen,static-mem is present in
    the device tree.
  - Processing static shared memory.
- Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
  this call is specific to CONFIG_STATIC_SHM which is ARM specific,
  at least, now.

This cleanup avoids empty stubs on other architectures and moves
ARM-specific logic into arch code where it belongs.

Also, don't loose  a return value of functions called in
Arm's make_arch_nodes().

Suggested-by: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 xen/arch/arm/dom0less-build.c            | 42 +++++++++++++++++-------
 xen/common/device-tree/dom0less-build.c  | 30 ++---------------
 xen/include/asm-generic/dom0less-build.h |  3 +-
 3 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a49764f0ad..592173268f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -220,9 +220,14 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     int ret;
 
+    ret = make_resv_memory_node(kinfo, GUEST_ROOT_ADDRESS_CELLS,
+                                GUEST_ROOT_SIZE_CELLS);
+    if ( ret )
+        return ret;
+
     ret = make_psci_node(kinfo-&gt;fdt);
     if ( ret )
-        return -EINVAL;
+        return ret;
 
     if ( kinfo-&gt;arch.vpl011 )
     {
@@ -230,26 +235,41 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
         ret = make_vpl011_uart_node(kinfo);
 #endif
         if ( ret )
-            return -EINVAL;
+            return ret;
     }
 
     return 0;
 }
 
-/* TODO: make arch.type generic ? */
-#ifdef CONFIG_ARM_64
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+int __init arch_construct_domU(struct kernel_info *kinfo,
+                               const struct dt_device_node *node)
 {
+    int rc = 0;
+    struct domain *d = kinfo-&gt;d;
+
+#ifdef CONFIG_ARM_64
     /* type must be set before allocate memory */
     d-&gt;arch.type = kinfo-&gt;arch.type;
-}
-#else
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* Nothing to do */
-}
 #endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
NIT: I think it would be nicer to do 

if ( is_hardware_domain(d) )
    return rc;

but it is also OK as below

Reviewed-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a></pre>
    </blockquote>
    <pre>Thanks.

It would be really nicer, I'll update  that in the next one version.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505131657301.368682@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !is_hardware_domain(d) )
+    {
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+        {
+            if ( !is_domain_direct_mapped(d) )
+                allocate_static_memory(d, kinfo, node);
+            else
+                assign_static_memory_11(d, kinfo, node);
+        }
+
+        rc = process_shm(d, kinfo, node);
+        if ( rc &lt; 0 )
+            return rc;
+    }
+
+    return rc;
+}
+
 int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
                       const struct dt_device_node *node)
 {
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 2c56f13771..f6aabc2093 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -28,14 +28,6 @@
 #include &lt;asm/dom0less-build.h&gt;
 #include &lt;asm/setup.h&gt;
 
-#if __has_include(&lt;asm/static-memory.h&gt;)
-#   include &lt;asm/static-memory.h&gt;
-#endif
-
-#if __has_include(&lt;asm/static-shmem.h&gt;)
-#   include &lt;asm/static-shmem.h&gt;
-#endif
-
 #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
 
 static domid_t __initdata xs_domid = DOMID_INVALID;
@@ -507,12 +499,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-#ifdef CONFIG_STATIC_SHM
-    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
-    if ( ret )
-        goto err;
-#endif
-
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
@@ -787,7 +773,9 @@ static int __init construct_domU(struct domain *d,
     if ( rc &lt; 0 )
         return rc;
 
-    set_domain_type(d, &amp;kinfo);
+    rc = arch_construct_domU(&amp;kinfo, node);
+    if ( rc )
+        return rc;
 
     if ( is_hardware_domain(d) )
     {
@@ -799,18 +787,6 @@ static int __init construct_domU(struct domain *d,
     {
         if ( !dt_find_property(node, "xen,static-mem", NULL) )
             allocate_memory(d, &amp;kinfo);
-#ifdef CONFIG_STATIC_MEMORY
-        else if ( !is_domain_direct_mapped(d) )
-            allocate_static_memory(d, &amp;kinfo, node);
-        else
-            assign_static_memory_11(d, &amp;kinfo, node);
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-        rc = process_shm(d, &amp;kinfo, node);
-        if ( rc &lt; 0 )
-            return rc;
-#endif
 
         rc = init_vuart(d, &amp;kinfo, node);
         if ( rc &lt; 0 )
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
index e0ad0429ec..78142e71ca 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -56,7 +56,8 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
 int make_intc_domU_node(struct kernel_info *kinfo);
 int make_arch_nodes(struct kernel_info *kinfo);
 
-void set_domain_type(struct domain *d, struct kernel_info *kinfo);
+int arch_construct_domU(struct kernel_info *kinfo,
+                        const struct dt_device_node *node);
 
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
-- 
2.49.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------uGiua9zkPM0WYozkwo5Ku0Ml--

