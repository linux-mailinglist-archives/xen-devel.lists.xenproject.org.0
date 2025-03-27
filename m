Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDDA73672
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929697.1332451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpqe-0001BK-FD; Thu, 27 Mar 2025 16:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929697.1332451; Thu, 27 Mar 2025 16:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpqe-00018e-By; Thu, 27 Mar 2025 16:12:52 +0000
Received: by outflank-mailman (input) for mailman id 929697;
 Thu, 27 Mar 2025 16:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txpqc-00018Y-GH
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:12:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 533b2e47-0b26-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:12:48 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so211444266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:12:48 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7196dd9a5sm14758766b.166.2025.03.27.09.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:12:46 -0700 (PDT)
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
X-Inumbo-ID: 533b2e47-0b26-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743091968; x=1743696768; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f+PX97m0wAD9lVa2TpcwcBB3ZVYwmVgx7e7KfcGm6o=;
        b=jkY4aZtYTTjzxicoUoYK6POehDHgUMgIQJHYPQCYU0IfU9o5O73uyD0f6GHrf3UK7w
         06kf9j2SBE/VqrgwVoTMRUc1bQmqaWPdAZ9Mk2fpaLm3uXpk2hS1KQ1oij49KXx8BEXV
         x1WyH5xuaCCISiNxuDr3AAQsvQH5j6tD/m6l81MO3WAkz4nRGKuk3lJCU9+Zwf+T11gX
         ymHJkcO9VOr/RYEnwLhZWGSnL3Dmr6L9sNMujQ/7ezHiJkxlz7i2P/le0Nqrq/mqcVFf
         iywsiGVb8jrrMR2UTQxb6Ej3VVd1keHl/Y7VLZdziJPV4EfZ2jvByZ2P1GbeVLaW5ZoB
         MgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091968; x=1743696768;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/f+PX97m0wAD9lVa2TpcwcBB3ZVYwmVgx7e7KfcGm6o=;
        b=vi53wloJIcqdtFtoaQkzQ71rLJM3fcfCOrD9et6aPuQUS5NhwuH/Q6B8WEHWZfIM3y
         U5ZyOM4YegJ2d1xcDkn+W1Bf/XvaCG1S2sUul9q/4+92aW8n/GAHv0gkOaPGbhq7gVbn
         0Ee+gpjdJEnfYqSo2c2GnxzWXmIL13urxRD+El3RzgmVVufgIWy9tu32DhHOk6DqGMYe
         L9u6kaqGIxDzN6fNCrl4exGykysZjbzcnkXgs1ZtuQXdvlybEhK85eGw5foUzyuaLHEh
         fDGzeCVSjsOi34rxyBHB5E/+MKrOqA6ejSc0T3NK8J2RYW0dbZnq7suU8ZC/wxl+bOC2
         91xA==
X-Forwarded-Encrypted: i=1; AJvYcCXpjkK/BJWyTqZew0c36dYF1CJKmyg1LN4oODg/H915n3k7FzBVCKV34W5RzMI3x6frN8wiFqFYC/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynFQJP2jSnuynsqOO3syaBqaMolhhMS1O/WXnB/ISpFgC9tWVP
	uC3+2M/ENgc4Bbm5INURFaUa3v0QQ78rjXAQ5qgSnltns/kYBHiE
X-Gm-Gg: ASbGncvTTpAFWV1sMlLJNHlKepyblnoO0aEX91uEHwYX0347PU0CeQX2+IVqmnjvrHo
	MKMlyItVzH8jwBqfGSiHuwfgr/ErTqoOHKT3UEZCtF0vFSIUU40hPjyGjskOJKBY/i4VIPWH9TE
	sVb0MB/0uEbdq2Hl8bWgaEkIAPHB0F4Jq2ufx3ivdTegiC4OIBUwj+Bv9gzQWXnoJkvo/aXoGQN
	OvnoelqiAy4QJv4sTCa2i3n3qQfFb9+5PUv7tVutRH+pZn9xdHZMwTDuFLiJflwTeRr0SmofHs7
	0xe9lbF0zJQTAiGmdNeeXNNM1EYW/urBqJ6c+2ec3mflB/R6ZCXiWYz5cXLV0e2zwPCBv7hp/et
	YX3/a1MJJTIOQaOq4bjsJ
X-Google-Smtp-Source: AGHT+IHIiaJgy8IHnFscNLO9K6hBv4sLYHzbe8uEVE/Vokx8HWjPjbs8sJUj8z5ZZ/lrmKNrBAg9iw==
X-Received: by 2002:a17:907:94c5:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-ac6faf0a6a9mr338900366b.31.1743091967227;
        Thu, 27 Mar 2025 09:12:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------AGIQZNPJ7s21CtpCZb5IztaY"
Message-ID: <b9e191b5-9ed6-41bd-b8ec-9843df10d5d1@gmail.com>
Date: Thu, 27 Mar 2025 17:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
 <c3d6a46c-c372-43f2-81d4-8128ebcb1b2b@gmail.com>
 <14d9be78-39c9-44b2-b6d8-6ff5fe1b8409@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <14d9be78-39c9-44b2-b6d8-6ff5fe1b8409@suse.com>

This is a multi-part message in MIME format.
--------------AGIQZNPJ7s21CtpCZb5IztaY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/27/25 2:16 PM, Jan Beulich wrote:
> On 27.03.2025 13:50, Oleksii Kurochko wrote:
>> On 3/27/25 1:44 AM, Andrew Cooper wrote:
>>> On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
>>>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>>>> index d888b2314d..dbbf2fce62 100644
>>>> --- a/xen/include/xen/config.h
>>>> +++ b/xen/include/xen/config.h
>>>> @@ -98,4 +98,13 @@
>>>>    #define ZERO_BLOCK_PTR ((void *)-1L)
>>>>    #endif
>>>>    
>>>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>>>> +
>>>> +#define BITS_PER_BYTE   __CHAR_BIT__
>>>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>>>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>>>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>>>> +
>>>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
>>> See how much nicer this is.  This patch possibly wants to wait until
>>> I've fixed the compiler checks to update to the new baseline, or we can
>>> just say that staging is staging and corner case error messages are fine.
>> Do you mean this patch:https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/?
>>
>> I haven't checked clang but if to look at gcc then these builtin macros was introduced in
>> 024a85aeb6a("c-cppbuiltin.c (builtin_define_type_sizeof): New function.") and it seems like even older then gcc5
>> contains this patch:
>> $ git tag --contains 024a85aeb6a912811d917f737eaad39140c2fb0c
>>     ...
>>     releases/gcc-4.3.0
>>     ...
>>
>> Am I missing something?
> The check yet to be adjusted is looking for 4.1, so 4.3 would already be "too new".

I guess you mean this one check:
   check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")

Could I ask then why in the link above it is checked different version?
-#if !defined(__GNUC__) || (__GNUC__ < 4) -#error Sorry, your compiler 
is too old/not recognized. -#elif CONFIG_CC_IS_GCC -# if 
defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900 -# error Sorry, 
your version of GCC is too old - please use 4.9 or newer. -# elif 
defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100 -/* - * 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293 - * 
https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk - 
*/ -# error Sorry, your version of GCC is too old - please use 5.1 or 
newer. -# endif ~ Oleksii

--------------AGIQZNPJ7s21CtpCZb5IztaY
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
    <div class="moz-cite-prefix">On 3/27/25 2:16 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:14d9be78-39c9-44b2-b6d8-6ff5fe1b8409@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.03.2025 13:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/27/25 1:44 AM, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index d888b2314d..dbbf2fce62 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -98,4 +98,13 @@
  #define ZERO_BLOCK_PTR ((void *)-1L)
  #endif
  
+#define BYTES_PER_LONG  __SIZEOF_LONG__
+
+#define BITS_PER_BYTE   __CHAR_BIT__
+#define BITS_PER_INT    (__SIZEOF_INT__ &lt;&lt; 3)
+#define BITS_PER_LONG   (BYTES_PER_LONG &lt;&lt; 3)
+#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ &lt;&lt; 3)
+
+#define POINTER_ALIGN   __SIZEOF_POINTER__
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">See how much nicer this is.  This patch possibly wants to wait until
I've fixed the compiler checks to update to the new baseline, or we can
just say that staging is staging and corner case error messages are fine.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Do you mean this patch:<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/</a>?

I haven't checked clang but if to look at gcc then these builtin macros was introduced in
024a85aeb6a("c-cppbuiltin.c (builtin_define_type_sizeof): New function.") and it seems like even older then gcc5
contains this patch:
$ git tag --contains 024a85aeb6a912811d917f737eaad39140c2fb0c
   ...
   releases/gcc-4.3.0
   ...

Am I missing something?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The check yet to be adjusted is looking for 4.1, so 4.3 would already be "too new".</pre>
    </blockquote>
    <pre>I guess you mean this one check:
  check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")

Could I ask then why in the link above it is checked different version?
<span class="del"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(153, 0, 0);">-#if !defined(__GNUC__) || (__GNUC__ &lt; 4)
-#error Sorry, your compiler is too old/not recognized.
-#elif CONFIG_CC_IS_GCC
-# if defined(CONFIG_ARM_32) &amp;&amp; CONFIG_GCC_VERSION &lt; 40900
-#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
-# elif defined(CONFIG_ARM_64) &amp;&amp; CONFIG_GCC_VERSION &lt; 50100
-/*
- * <a href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    class="moz-txt-link-freetext">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293</a>
- * <a
href="https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    class="moz-txt-link-freetext">https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk</a>
- */
-#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
-# endif

</span><span class="del"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">~ Oleksii</span></pre>
  </body>
</html>

--------------AGIQZNPJ7s21CtpCZb5IztaY--

