Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4AA97093
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963043.1354161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FW5-0001U9-Ig; Tue, 22 Apr 2025 15:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963043.1354161; Tue, 22 Apr 2025 15:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FW5-0001S8-G8; Tue, 22 Apr 2025 15:26:33 +0000
Received: by outflank-mailman (input) for mailman id 963043;
 Tue, 22 Apr 2025 15:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NnGu=XI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7FW3-0001BV-Q1
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:26:31 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2877fe4a-1f8e-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:26:27 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so39279615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:26:27 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acccdsm175431155e9.11.2025.04.22.08.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:26:26 -0700 (PDT)
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
X-Inumbo-ID: 2877fe4a-1f8e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745335586; x=1745940386; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i+b3sG20yNAfVUCtSo4JTOzMhUrm01QUTcDtC3O6a0=;
        b=U19urJKmQqAWqMtdtSz95eS+MClN1HvA+nYRDepdeA9Cn6X3Erh0k6gEtOEW2Lal11
         C6Y9fU7yuj8+7hDMrriorcpgQcGy8712fECMagh8INp+CeKi1gVx0txwdTbv6i/Kvvwo
         RqXiJGQaaOLGxmQ9YbBLZAuXkTfZWt3499teOxn7uJod8HjASEmtZh2BwDj+Cut9vzpc
         LN/vHAG8lBDHBm3mYpXzxiiKlvRmX75nu2VR3y1q+ZTWn9/PGiPY7sFstwtsjr6AmmUD
         clGhSVVAx5CDs5Uza4LoUoBoB70Ds+8XTaYSg0TuJEMDCmhrS9Fn04fsF41LqejbGmWf
         sAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335586; x=1745940386;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2i+b3sG20yNAfVUCtSo4JTOzMhUrm01QUTcDtC3O6a0=;
        b=oxklElPdNiMOHM0EeL0rg387RR1KvOxz+v9rsGwJMYKAQXgExOh1mR0pAOU7wJTj+B
         lbT91giC7CmVi2dNfLONGh8q8/7vlGFKMRUl3tVNCCZ2aHlyOu3Clfz87neComymPtyY
         hTeZVyXpJOTUe9qulDKs5ksmvCh54dAmusa+ViIju99YGleEQvq5HIfvL2AT5z+f0AKl
         kUIDEE2d4e6/fhBctx00ZPUBoAd+U97Wp4c1DUQ1RzNZ439c+hpWHpErDNbDgnE7MAaC
         B8Y3l1Axdnh0DhOYBSN+G80N+pIBb8UZnYFtw/lHcFAEjQWJq6gtP6hVTrZ/WoGe2d6k
         mPBw==
X-Forwarded-Encrypted: i=1; AJvYcCXaU2XHUi6N2TeY+LwlNVUaAcpfHunYq9PIZKF9glRjBGq5+ME2DGUabckQRwCWbrZ5f9h76GFRytw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtPArWXVHWpQ1ufHr2rxdq34FZMdNlw9GdwKhdc38/qZeJpN+t
	WVSybPybCzm4gxjI8ktDIsj2P1KMP1D5jSkEEbR0g42RrVj/yxmy
X-Gm-Gg: ASbGncubhaCs7nZ1dwzEH4fTcX3p76QrOi7Mn0NDk+QKHcmQW2bvw9EAHCowKs1wIpO
	fEPFbqf1byiIs9197QFwKVCouX0jd0AJ9e/JC5Mc069J/3vhR+W15DQ7Msyp59cWLxNArPsjxCa
	0uckDThOsk2mQwgdvrNEhQwtIk2lEScf8rJ7BgCCdtIBxPtywaULOZZmSoyl5KxWo5RgUTRVpTp
	AorrOpwqGHwmPM0zRBLabAzO+ea9GKcveplBSQ35AYtSmBS7wodrHQIh6FcfK+j05j0MG8ymZo/
	1rAHM2CDn+czxkSjeTQJFYqmHPi4/8/760IXd2+n+h1tESDALpHySvpwxqlCWhCI1CbROIlXp1p
	54vBqYP9VpDdXkrcX
X-Google-Smtp-Source: AGHT+IET30Bf3iJASEFOK54y1bumZUsTSU5F8JDqdnMgPzjpFnDysZ7tQv/69K1JXIkob+R1nOZrVw==
X-Received: by 2002:a05:6000:c08:b0:3a0:65bc:3543 with SMTP id ffacd0b85a97d-3a065bc358amr447562f8f.35.1745335586533;
        Tue, 22 Apr 2025 08:26:26 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------HNrnkjgiINFiv5zEhkZO2Fg5"
Message-ID: <6010658f-9e29-40d9-902c-890cb27a2a4b@gmail.com>
Date: Tue, 22 Apr 2025 17:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] xen/common: dom0less: introduce common
 domain-build.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <9dbf651ce177a7292f80879373e86a51305f216e.1744626032.git.oleksii.kurochko@gmail.com>
 <faa552cb-d933-492b-b3ed-e803856265ab@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <faa552cb-d933-492b-b3ed-e803856265ab@suse.com>

This is a multi-part message in MIME format.
--------------HNrnkjgiINFiv5zEhkZO2Fg5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 4:45 PM, Jan Beulich wrote:
> On 14.04.2025 17:56, Oleksii Kurochko wrote:
>> --- a/xen/include/xen/fdt-domain-build.h
>> +++ b/xen/include/xen/fdt-domain-build.h
>> @@ -5,6 +5,7 @@
>>   #include <xen/bootfdt.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/fdt-kernel.h>
>> +#include <xen/mm.h>
>>   #include <xen/types.h>
>>   
>>   #if __has_include(<asm/domain_build.h>)
>> @@ -32,7 +33,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>>                        int sizecells, const struct membanks *mem);
>>   int make_timer_node(const struct kernel_info *kinfo);
>>   
>> -unsigned int get_allocation_size(paddr_t size);
>> +
>> +static inline int get_allocation_size(paddr_t size)
>> +{
>> +    /*
>> +     * get_order_from_bytes returns the order greater than or equal to
>> +     * the given size, but we need less than or equal. Adding one to
>> +     * the size pushes an evenly aligned size into the next order, so
>> +     * we can then unconditionally subtract 1 from the order which is
>> +     * returned.
>> +     */
>> +    return get_order_from_bytes(size + 1) - 1;
>> +}
>> +
>> +typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
>> +                                               paddr_t gpa,
>> +                                               void *buf,
> This very much looks like the latest now, when the code is made common,
> it wants to be const void *. Even if this may require another prereq
> patch.
>
> However, instead of using a function pointer, couldn't the now common
> code call copy_to_guest_phys_flush_dcache() conditionally upon
> IS_ENABLED(CONFIG_<whatever>)?

I thought about having IS_ENABLED(CONFIG_ARM) as, at the moment, this is necessary to
be called only for Arm as guest domain on Arm could be ran with cache disabled so to be sure
that DTB, kernel and initrd is fully in RAM this function should be called.

For RISC-V, it isn't possible case as guest domain won't run with cache disabled.

> Or provide a weak
> copy_to_guest_phys_flush_dcache() which would simply call
> copy_to_guest_phys()?

Could it be a weak function with empty implementation?
Is copy_to_guest_phys() implemented for other archs?


~ Oleksii

--------------HNrnkjgiINFiv5zEhkZO2Fg5
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
    <div class="moz-cite-prefix">On 4/17/25 4:45 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:faa552cb-d933-492b-b3ed-e803856265ab@suse.com">
      <pre wrap="" class="moz-quote-pre">On 14.04.2025 17:56, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -5,6 +5,7 @@
 #include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
+#include &lt;xen/mm.h&gt;
 #include &lt;xen/types.h&gt;
 
 #if __has_include(&lt;asm/domain_build.h&gt;)
@@ -32,7 +33,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
 int make_timer_node(const struct kernel_info *kinfo);
 
-unsigned int get_allocation_size(paddr_t size);
+
+static inline int get_allocation_size(paddr_t size)
+{
+    /*
+     * get_order_from_bytes returns the order greater than or equal to
+     * the given size, but we need less than or equal. Adding one to
+     * the size pushes an evenly aligned size into the next order, so
+     * we can then unconditionally subtract 1 from the order which is
+     * returned.
+     */
+    return get_order_from_bytes(size + 1) - 1;
+}
+
+typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
+                                               paddr_t gpa,
+                                               void *buf,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This very much looks like the latest now, when the code is made common,
it wants to be const void *. Even if this may require another prereq
patch.

However, instead of using a function pointer, couldn't the now common
code call copy_to_guest_phys_flush_dcache() conditionally upon
IS_ENABLED(CONFIG_&lt;whatever&gt;)? </pre>
    </blockquote>
    <pre>I thought about having IS_ENABLED(CONFIG_ARM) as, at the moment, this is necessary to
be called only for Arm as guest domain on Arm could be ran with cache disabled so to be sure
that DTB, kernel and initrd is fully in RAM this function should be called.

For RISC-V, it isn't possible case as guest domain won't run with cache disabled.
</pre>
    <blockquote type="cite"
      cite="mid:faa552cb-d933-492b-b3ed-e803856265ab@suse.com">
      <pre wrap="" class="moz-quote-pre">Or provide a weak
copy_to_guest_phys_flush_dcache() which would simply call
copy_to_guest_phys()?</pre>
    </blockquote>
    <pre>Could it be a weak function with empty implementation?
Is copy_to_guest_phys() implemented for other archs?


~ Oleksii</pre>
  </body>
</html>

--------------HNrnkjgiINFiv5zEhkZO2Fg5--

