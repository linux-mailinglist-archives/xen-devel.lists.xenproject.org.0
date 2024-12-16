Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62CC9F37BB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 18:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858417.1270638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNF59-0002Nc-6E; Mon, 16 Dec 2024 17:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858417.1270638; Mon, 16 Dec 2024 17:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNF59-0002Ls-3R; Mon, 16 Dec 2024 17:40:35 +0000
Received: by outflank-mailman (input) for mailman id 858417;
 Mon, 16 Dec 2024 17:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zwKr=TJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNF57-0002KF-Bj
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 17:40:33 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d87efa06-bbd4-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 18:40:31 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso54187771fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 09:40:31 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034401ced1sm9949301fa.16.2024.12.16.09.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 09:40:30 -0800 (PST)
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
X-Inumbo-ID: d87efa06-bbd4-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734370831; x=1734975631; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADDGTTGFzOjt4E+s2bUznvpFAh6/ow/AK9pkcLFiubI=;
        b=iGmXJPO87HwKtLZ8J7DJVDJoKajXwJNpm7vMfuYLadb3Y4fgih1C/gaqZL/SXOIF6v
         t9O9IIgZJ7Nr1NPTtZK+qNLYwOsI8xU1axJf5RJbvn1q2jIt/c6+t1W2EyfXczl8/Cd+
         Hpu8Ro34MbVilVEk6gyuY/plIxDPZNtmOYl2JHu8h5sHuefxl8X0F89gGx9Mx1jRulWY
         F4w+xA8p8uCdVLq8FFiIgY74tKGkZ7XAW3gCPMT/5C3A04mly7eYxF8fc7ezP1Y0JM3Q
         dzKUGEDvsaCI4zfITdoICthUu6/D2r03GqJQpjXT7kJguvcpv9vzUjU7PVcgYDINbnZt
         UsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734370831; x=1734975631;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADDGTTGFzOjt4E+s2bUznvpFAh6/ow/AK9pkcLFiubI=;
        b=wsFIe7GW/lmqoghJ9Q7n6RIr5GrAJnjpJdh2iDP6pBX3U+DEgVW2ywJTtgWPkSAa4A
         4/CFe3BeO66aOYhwTY+AoigSnme9NpEJnmCAeIQi7twm0lj3dRu4jpoNw4v6PakJnKL0
         O6E4t3bDRAMiqSAVNjJ6Hs9nrHEDUfxEANl947sI5od8rOOHq6lrBTIvqZ4AGMaWTSzr
         WMMFzMhT/1cMHbBoCkATOVomowth7rLmkAit6cNxAaZ1XmBHZbzDJEo9STbB2xJ71S3S
         9Tu2JjK+nFRfLCMFF1kNqrvtLguIUVWH2paHzAp0rc70vuQOg1fzrNgNc0wIyuwfpwt3
         Smpg==
X-Forwarded-Encrypted: i=1; AJvYcCWPa3Gs5I0qTuyi/eeegu57W/ZDbf1zd3IkDQwYnaz0IFktenX0z42lKQjPWxKZM7SoKkS16pcvkiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbwX9Ct9esfeqD5bYA7HWw/ORxsyQZPeK8ZmIUHlWneTWa/5+X
	4FTbEUadcSmcFSKtvNEGQh1Oug3Zkc6Yybn7bdBCmVE9KWnh+Q2P
X-Gm-Gg: ASbGnctMae0DyEZT9Aq2mwIfTQYTvinG2/jFxYelCzsn8Tr9wcNvnGRhBbWwUaujgBr
	pohUlXoHNa+E9WR7RM0qxE6iHchreaJetmnfOulr5JWxGOnZs3pt9ai+1vVrrjhQeaUokm6YFO8
	JeR4gCUIMyq5nS24k8K7pQgfgNxhz3a3n/3u28OAHH1Kb/HR6l17b+LfKMjd3sn3KQ18zFo8z+D
	f5QWRFechs9qGNVMzjnIUWDpqvZlMQJ9y0w5iTK83Ajv2Vj91JUd8+I+rk3AWC6/JKd4Q==
X-Google-Smtp-Source: AGHT+IFCBHBlQUh2TIVX4DemYik9xq+iV295GA273OyK0a/ppX/9hBR45NQISyN23QQ1KpAXOhI5xw==
X-Received: by 2002:a2e:a548:0:b0:2ff:bb68:4233 with SMTP id 38308e7fff4ca-302544cbb48mr59121311fa.33.1734370830533;
        Mon, 16 Dec 2024 09:40:30 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------dRqzdVVl9IHcSM567XfHN7ux"
Message-ID: <1c8c888e-bf59-4b4d-a3a5-cd2c0c7b6565@gmail.com>
Date: Mon, 16 Dec 2024 18:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/riscv: implement data and instruction cache
 operations
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <bb6191b21bd387f265e0e25322a30f4ade6e8b3b.1733937787.git.oleksii.kurochko@gmail.com>
 <19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com>

This is a multi-part message in MIME format.
--------------dRqzdVVl9IHcSM567XfHN7ux
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/16/24 3:23 PM, Jan Beulich wrote:
> On 11.12.2024 18:27, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/page.h
>> +++ b/xen/arch/riscv/include/asm/page.h
>> @@ -7,6 +7,7 @@
>>   
>>   #include <xen/bug.h>
>>   #include <xen/const.h>
>> +#include <xen/errno.h>
>>   #include <xen/types.h>
>>   
>>   #include <asm/atomic.h>
>> @@ -148,9 +149,27 @@ static inline bool pte_is_mapping(pte_t p)
>>       return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>>   }
>>   
>> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>> +{
>> +#ifdef CONFIG_QEMU
>> +    return 0;
>> +#else
>> +    return -EOPNOTSUPP;
>> +#endif
>> +}
>> +
>> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
>> +{
>> +#ifdef CONFIG_QEMU
>> +    return 0;
>> +#else
>> +    return -EOPNOTSUPP;
>> +#endif
>> +}
> So testing on real hardware will then effectively become impossible, until
> someone goes and implements these?

Yes...

I am not sure what better we can do. It seems like it will be the best one to check if CMO
extensions is supported and use instructions for this extensions to implement these functions as they
are in the specification and not expected to be changed.

But I want to back a little bit later to this implemntation as this not issue for QEMU as it doesn't model cache and
h/w on which I can ask to run Xen has IO cache coherency so for it will be needed just to add a new config
and implementation will still be 'return 0'. ( I thought to introduce instead of CONFIG_QEMU something like
CONFIG_HAS_CACHE_COHERENCY )

And also in the spec it is mentioned:
```
This suggests that RISC-V platforms prefer to support full 
cache-coherent I/O, but it isn't actually mandatory.
As a result, the PMBT and CMO extensions aren't mandatory either, 
meaning that some platforms might not
have instructions to properly flush, clean, or invalidate the cache.
``` Based on that I also think to implement that in the following way:
```
     #ifdef CONFIG_QEMU
     static inline int plat_clean_and_invalidate_dcache_va_range() { return 0; }
   static inline int plat_clean_dcache_va_range() { return 0; }
   #else /* !CONFIG_QEMU */
     static inline void plat_clean_and_invalidate_dcache_va_range()
   {
     printk_once("%s: should it be implemented for your platform?\n", __func__);
     return 0;
   }

   static inline void plat_clean_dcache_va_range()
   {
     printk_once("%s: should it be implemented for your platform?\n", __func__);
     return 0;
   }
   #endif

   static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
   {
       return plat_clean_and_invalidate_dcache_va_range();
   }
....
```
So we will have a notification for others none-QEMU platforms notification that probably some
changes are required.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/platforms/Kconfig
>> @@ -0,0 +1,5 @@
>> +config QEMU
>> +	bool "QEMU aarch virt machine support"
>> +	depends on RISCV_64
> I understand Arm has it like this, but: Is QEMU really a sufficiently non-
> ambiguous name to use?

Yes, it sounds good to me to have such naming for the platform which are running on top of QEMU.

The other option I thought about it is to use CONFIG_VIRT_PLATFORM.

>   Is the RISCV_64 dependency really needed?

At the moment , we are testing only RISCV_64 so not to have none-verified config I added RISCV_64 but

probably it is too much and `depends on` should be dropped at all.

Thanks.

~ Oleksii

>
>> +	help
>> +	  Enable all the required drivers for QEMU riscv64 virt emulated machine.
> This line looks to be slightly too long now (after you apparently unwrapped
> what Arm has).
>
> Jan
--------------dRqzdVVl9IHcSM567XfHN7ux
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/16/24 3:23 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.12.2024 18:27, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,6 +7,7 @@
 
 #include &lt;xen/bug.h&gt;
 #include &lt;xen/const.h&gt;
+#include &lt;xen/errno.h&gt;
 #include &lt;xen/types.h&gt;
 
 #include &lt;asm/atomic.h&gt;
@@ -148,9 +149,27 @@ static inline bool pte_is_mapping(pte_t p)
     return (p.pte &amp; PTE_VALID) &amp;&amp; (p.pte &amp; PTE_ACCESS_MASK);
 }
 
+static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
+{
+#ifdef CONFIG_QEMU
+    return 0;
+#else
+    return -EOPNOTSUPP;
+#endif
+}
+
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+#ifdef CONFIG_QEMU
+    return 0;
+#else
+    return -EOPNOTSUPP;
+#endif
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So testing on real hardware will then effectively become impossible, until
someone goes and implements these?</pre>
    </blockquote>
    <pre><pre>Yes...

I am not sure what better we can do. It seems like it will be the best one to check if CMO
extensions is supported and use instructions for this extensions to implement these functions as they
are in the specification and not expected to be changed. 

But I want to back a little bit later to this implemntation as this not issue for QEMU as it doesn't model cache and
h/w on which I can ask to run Xen has IO cache coherency so for it will be needed just to add a new config
and implementation will still be 'return 0'. ( I thought to introduce instead of CONFIG_QEMU something like
CONFIG_HAS_CACHE_COHERENCY )

And also in the spec it is mentioned:
```
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">This suggests that RISC-V platforms prefer to support full cache-coherent I/O, but it isn't actually mandatory.</span>
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">As a result, the PMBT and CMO extensions aren't mandatory either, meaning that some platforms might not</span>
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">have instructions to properly flush, clean, or invalidate the cache.</span>
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">```

</span><span
style="color: rgb(29, 28, 29); font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Based on that I also think to implement that in the following way:</span>
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">```</span>
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">    #ifdef CONFIG_QEMU</span>
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">    static inline int plat_</span>clean_and_invalidate_dcache_va_range<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span>() { return 0; }
  static inline int plat_clean_dcache_va_range() { return 0; }
  #else /* !<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">CONFIG_QEMU</span> */
<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">    static inline void plat_</span>clean_and_invalidate_dcache_va_range<span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span>()
  {
    printk_once("%s: should it be implemented for your platform?\n", __func__);
    return 0;
  }

  static inline void plat_clean_dcache_va_range()
  {
    printk_once("%s: should it be implemented for your platform?\n", __func__);
    return 0;
  }
  #endif

  static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
  {
      return plat_clean_and_invalidate_dcache_va_range();
  }
....
```
So we will have a notification for others none-QEMU platforms notification that probably some
changes are required.
</pre></pre>
    <blockquote type="cite"
      cite="mid:19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/platforms/Kconfig
@@ -0,0 +1,5 @@
+config QEMU
+	bool "QEMU aarch virt machine support"
+	depends on RISCV_64
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I understand Arm has it like this, but: Is QEMU really a sufficiently non-
ambiguous name to use?</pre>
    </blockquote>
    <pre>Yes, it sounds good to me to have such naming for the platform which are running on top of QEMU.</pre>
    <pre>The other option I thought about it is to use CONFIG_VIRT_PLATFORM.

</pre>
    <blockquote type="cite"
      cite="mid:19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com">
      <pre wrap="" class="moz-quote-pre"> Is the RISCV_64 dependency really needed?</pre>
    </blockquote>
    <pre>At the moment , we are testing only RISCV_64 so not to have none-verified config I added RISCV_64 but</pre>
    <pre>probably it is too much and `depends on` should be dropped at all.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	help
+	  Enable all the required drivers for QEMU riscv64 virt emulated machine.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This line looks to be slightly too long now (after you apparently unwrapped
what Arm has).

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------dRqzdVVl9IHcSM567XfHN7ux--

