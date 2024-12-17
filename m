Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C49F4909
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 11:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858741.1270981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNUxT-0005MP-KS; Tue, 17 Dec 2024 10:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858741.1270981; Tue, 17 Dec 2024 10:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNUxT-0005JG-HY; Tue, 17 Dec 2024 10:37:43 +0000
Received: by outflank-mailman (input) for mailman id 858741;
 Tue, 17 Dec 2024 10:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNUxR-0005JA-PY
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 10:37:41 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f066ed85-bc62-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 11:37:39 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso45666921fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 02:37:39 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344043eb3sm12286361fa.27.2024.12.17.02.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 02:37:38 -0800 (PST)
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
X-Inumbo-ID: f066ed85-bc62-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734431859; x=1735036659; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBYYuypc/ElymR8HjBxJKWEs4+PQ6vYMe7CYNB06BIM=;
        b=b9LP73rzsb93qD5OfTDSdAckww7Hh3hT3VxeSwSTtHmgvOs27PoUBxHMwlyQrUeKDy
         c31Mms/NAPvpii9pATBIEFH6UWBpAME8eFlkMu0hQwiwkhHp4ZvRz8L/hIogDgHwATMw
         yIfdOFYIGHbZO6a3Utlcc8UfeF8nJYUDSHvrft7JGyniLnpb/EZkjdBC5rsZ0vONEQE7
         /TLHPMVmD517s6pmn9mjuJdbM4fUIpwhibKrB/Nfb/i5BjDeAfLEpbo4GeKDiUo9BCNG
         RjQv3ow6dITvAmSoZKVDZNzTj/ValomID+DQ03yoyag++3xFBFeEWxjcD5YvxUsOS4e8
         L8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734431859; x=1735036659;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBYYuypc/ElymR8HjBxJKWEs4+PQ6vYMe7CYNB06BIM=;
        b=fgCNoXZGJdbK2/4HymftY0dCURYnxNvjcVjZtnm+3gaFZz28ZLPJLagaS5qyXyjuNx
         kLj7cYSfzu6MiFEgJwAKjXQsbXRrb4Ly/vMnCmK8mC/y/SrG8/Quelf5JePd+odrijoW
         B3qUjQTaTUVWOoAhbduyjo1dQA9Oku8IOR0NHvZ/PLkKuNAVF4jYCCiiwBvuBLUt9S2i
         enb+y/Xj8/XihwK2TdCfABQ1cPiuCntfBQg3nyzWaDKG1WbqESHuegMQ/CRBhkOBUho4
         jkvYPJh4LtMUCZGg+xSG9cBDfDH+j7Lmdyjlcn44+qsyh4u51ZlrE/IoLxZ9pEOCnHQ2
         kd8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPLOFk4s8leNUODzYeE+XXalgQ3NF//Bh8F5p53pE+poPdAnJlBcL5dVzxcRbsXwpl33M2CE2BV/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOzCJKJFktEp+MoCobVCh30Rf5kjvm68342FoiTPxnpAnL7mSp
	nHEQlftZqa2ShJycPIjtrRG0rOB0JyB6qYZciv7eWSiJt5JJfO4K
X-Gm-Gg: ASbGncuCeA4qY2rp2pCY8PQi7JRjoYe6yFORT9ZY0N8L31825Nlm4qlioU+nGIatWhH
	UAtm+ca3QQMeBZTQGTDvo7L7rhPNYEvH5D+6oc5lqKbHkqRIXci0NqbCYTsOCJQeOmA0IgZaiPU
	QJ+9WMBM2+pKDYdy2kFFcITbBeuitG38V/DXrxQeXS6SehvYl69VmLWlt9PPXPd8RWDjHK+hQtO
	lhxHs/gkZ+Gv/QvtGb40rFw0tCf8HJRE3/jxo0QmC2U9d+nU63ThmWDqvIkfyZZY3t+EQ==
X-Google-Smtp-Source: AGHT+IE0Ea4sSWF+lBfmwsxiXyQysgNk4NDBma26OK8fD0k9si483BXdkSlGV4m9xekyJ7aPvLgnMw==
X-Received: by 2002:a05:651c:1023:b0:300:f5bc:95b3 with SMTP id 38308e7fff4ca-302544e2ebamr33263091fa.41.1734431858840;
        Tue, 17 Dec 2024 02:37:38 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------00kLxmFgqjVCpE4HujugYm15"
Message-ID: <a3046737-2414-4862-a75b-ed0e2080df22@gmail.com>
Date: Tue, 17 Dec 2024 11:37:37 +0100
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
 <1c8c888e-bf59-4b4d-a3a5-cd2c0c7b6565@gmail.com>
 <3579b3ca-3634-4537-8981-fd68c60d5c6a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3579b3ca-3634-4537-8981-fd68c60d5c6a@suse.com>

This is a multi-part message in MIME format.
--------------00kLxmFgqjVCpE4HujugYm15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/17/24 9:32 AM, Jan Beulich wrote:
> On 16.12.2024 18:40, Oleksii Kurochko wrote:
>> On 12/16/24 3:23 PM, Jan Beulich wrote:
>>> On 11.12.2024 18:27, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/page.h
>>>> +++ b/xen/arch/riscv/include/asm/page.h
>>>> @@ -7,6 +7,7 @@
>>>>    
>>>>    #include <xen/bug.h>
>>>>    #include <xen/const.h>
>>>> +#include <xen/errno.h>
>>>>    #include <xen/types.h>
>>>>    
>>>>    #include <asm/atomic.h>
>>>> @@ -148,9 +149,27 @@ static inline bool pte_is_mapping(pte_t p)
>>>>        return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>>>>    }
>>>>    
>>>> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>>>> +{
>>>> +#ifdef CONFIG_QEMU
>>>> +    return 0;
>>>> +#else
>>>> +    return -EOPNOTSUPP;
>>>> +#endif
>>>> +}
>>>> +
>>>> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
>>>> +{
>>>> +#ifdef CONFIG_QEMU
>>>> +    return 0;
>>>> +#else
>>>> +    return -EOPNOTSUPP;
>>>> +#endif
>>>> +}
>>> So testing on real hardware will then effectively become impossible, until
>>> someone goes and implements these?
>> Yes...
>>
>> I am not sure what better we can do. It seems like it will be the best one to check if CMO
>> extensions is supported and use instructions for this extensions to implement these functions as they
>> are in the specification and not expected to be changed.
> Yes, using CMO when available is certainly the route to go. The main
> question there is what the behavior ought to be when CMO is unavailable.

If CMO ( or SoC specific extension for cache operation ) isn't available then IMO it means that memory is
coherent and nothing specific should be done in the mentioned above functions what means returning 0 should
be fine. Then implementation of these functions could look like:
```

static inline int <.....>(....)
{
#if !defined(CONFIG_QEMU)

    #warning should implementation of <....>  be updated? 

#endif

    return 0; 

}
```

Or just to be sure that user see the message change #warning -> #error.

~ Oleksii

>
>> But I want to back a little bit later to this implemntation as this not issue for QEMU as it doesn't model cache and
>> h/w on which I can ask to run Xen has IO cache coherency so for it will be needed just to add a new config
>> and implementation will still be 'return 0'. ( I thought to introduce instead of CONFIG_QEMU something like
>> CONFIG_HAS_CACHE_COHERENCY )
>>
>> And also in the spec it is mentioned:
>> ```
>> This suggests that RISC-V platforms prefer to support full
>> cache-coherent I/O, but it isn't actually mandatory.
>> As a result, the PMBT and CMO extensions aren't mandatory either,
>> meaning that some platforms might not
>> have instructions to properly flush, clean, or invalidate the cache.
>> ``` Based on that I also think to implement that in the following way:
>> ```
>>       #ifdef CONFIG_QEMU
>>       static inline int plat_clean_and_invalidate_dcache_va_range() { return 0; }
>>     static inline int plat_clean_dcache_va_range() { return 0; }
>>     #else /* !CONFIG_QEMU */
>>       static inline void plat_clean_and_invalidate_dcache_va_range()
>>     {
>>       printk_once("%s: should it be implemented for your platform?\n", __func__);
>>       return 0;
>>     }
>>
>>     static inline void plat_clean_dcache_va_range()
>>     {
>>       printk_once("%s: should it be implemented for your platform?\n", __func__);
>>       return 0;
>>     }
>>     #endif
>>
>>     static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>>     {
>>         return plat_clean_and_invalidate_dcache_va_range();
>>     }
>> ....
>> ```
>> So we will have a notification for others none-QEMU platforms notification that probably some
>> changes are required.
> Yet failing to get cache management right can easily result in data corruption.
> I don't think a on-time printk() is appropriate to handle the lack of respective
> implementation. At least not anymore once RISC-V leaves "experimental" status.
>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/platforms/Kconfig
>>>> @@ -0,0 +1,5 @@
>>>> +config QEMU
>>>> +	bool "QEMU aarch virt machine support"
>>>> +	depends on RISCV_64
>>> I understand Arm has it like this, but: Is QEMU really a sufficiently non-
>>> ambiguous name to use?
>> Yes, it sounds good to me to have such naming for the platform which are running on top of QEMU.
>>
>> The other option I thought about it is to use CONFIG_VIRT_PLATFORM.
> I don't think QEMU should be fully omitted from the name. Nor do I think that
> you can generally infer from "virtual platform" that caches aren't modeled.
> What I was rather getting at is to perhaps add some qualifier to QEMU, e.g.
> QEMU_PLATFORM.
>
> Jan
--------------00kLxmFgqjVCpE4HujugYm15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/17/24 9:32 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3579b3ca-3634-4537-8981-fd68c60d5c6a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 16.12.2024 18:40, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 12/16/24 3:23 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">So testing on real hardware will then effectively become impossible, until
someone goes and implements these?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes...

I am not sure what better we can do. It seems like it will be the best one to check if CMO
extensions is supported and use instructions for this extensions to implement these functions as they
are in the specification and not expected to be changed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes, using CMO when available is certainly the route to go. The main
question there is what the behavior ought to be when CMO is unavailable.</pre>
    </blockquote>
    <pre>If CMO ( or SoC specific extension for cache operation ) isn't available then IMO it means that memory is
coherent and nothing specific should be done in the mentioned above functions what means returning 0 should
be fine. Then implementation of these functions could look like:
```
</pre>
    <pre>static inline int &lt;.....&gt;(....)
{
#if !defined(CONFIG_QEMU)<blockquote>#warning should implementation of &lt;....&gt;  be updated?
</blockquote>#endif

<blockquote>return 0;
</blockquote>}
```
</pre>
    <pre>
Or just to be sure that user see the message change #warning -&gt; #error.

</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:3579b3ca-3634-4537-8981-fd68c60d5c6a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">But I want to back a little bit later to this implemntation as this not issue for QEMU as it doesn't model cache and
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yet failing to get cache management right can easily result in data corruption.
I don't think a on-time printk() is appropriate to handle the lack of respective
implementation. At least not anymore once RISC-V leaves "experimental" status.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/platforms/Kconfig
@@ -0,0 +1,5 @@
+config QEMU
+	bool "QEMU aarch virt machine support"
+	depends on RISCV_64
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I understand Arm has it like this, but: Is QEMU really a sufficiently non-
ambiguous name to use?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, it sounds good to me to have such naming for the platform which are running on top of QEMU.

The other option I thought about it is to use CONFIG_VIRT_PLATFORM.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't think QEMU should be fully omitted from the name. Nor do I think that
you can generally infer from "virtual platform" that caches aren't modeled.
What I was rather getting at is to perhaps add some qualifier to QEMU, e.g.
QEMU_PLATFORM.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------00kLxmFgqjVCpE4HujugYm15--

