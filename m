Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDEA6FF48
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 14:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926478.1329321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3vO-0007pG-UQ; Tue, 25 Mar 2025 13:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926478.1329321; Tue, 25 Mar 2025 13:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3vO-0007nK-QS; Tue, 25 Mar 2025 13:02:34 +0000
Received: by outflank-mailman (input) for mailman id 926478;
 Tue, 25 Mar 2025 13:02:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx3vM-0007nE-Mw
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 13:02:32 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6953f439-0979-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 14:02:31 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5e1a38c1aso7327385a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 06:02:31 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef93e0e5sm852356266b.86.2025.03.25.06.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 06:02:27 -0700 (PDT)
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
X-Inumbo-ID: 6953f439-0979-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907751; x=1743512551; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zmRbtL8RoNuggtFGTA2AuglwecttOEm0IOJpafj3Xo=;
        b=WTzYwMKEa5ybauubA9QeY01zHKInhqgdClUqBkqWgdnRZO0CM+UUssycQ+woFEvVnN
         CjxH8Y+AT3zg0fQN0izxa0oVwkJQ//Gj9HkX2RQc/Tl7wbN0bB/UVJGF8NOXiwBiNM8y
         CrfYrFaVqgEIn5P2SGAYnMCWcYngZM5XrztDEmUBXqDctEXp6nFqlj9sig9aZWQnDtdd
         bph5wwdTIujvTJtNv9VK6kFl8YFFy+v4tKir3mI+tVYKsxACzPJteR08Hp5irMzUPiLG
         Ycjo3HBEWxVtEgu2CJyzwfw+rF1P9eG4KMCageFfRdvHy5WCzElPfj5DyztK4k66r2PH
         oYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907751; x=1743512551;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1zmRbtL8RoNuggtFGTA2AuglwecttOEm0IOJpafj3Xo=;
        b=G8IduAhl6RGHdXV9HRY1IGHXCFpyOjQ6m/exMVX+8hV8iubBIeF0seFzAphByeoCoO
         4Rev7R94B25xM4e0npy75Iv2jEPPdLi2H87b996SnQEw98/a8+Nsh9tXWZvnyFyqO5pL
         WulFium10obvMk/TB1vTgKX7gYsNbpnLkvDz2VAbQDmH4v8Jrem/CZWnDH6rXA3BFLKi
         OIMuJi0vEmIZDJoneAwhJbboE9l3cFTItLc/q8P7ZJGjlh6ATDO9Z8IE7aHmktQkIWUp
         nQorgN6ss9ZOyuSvPfE2OFSzZPPxtojCLWshj71bxBWcN2btLJ1Qh4IlON/KgaKpz1T4
         eFzg==
X-Forwarded-Encrypted: i=1; AJvYcCXAtKw75wuJoEWfbMi5tOhC76iN984vKozJTJPmK+gn7uay71s6HODqQAWe/LMq2kLg22QdZM0OkjA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxiqo+6GTcsa5yp1FEB+A6Bn0XpPMjAs1enPp27I4NuAJwH29Zg
	lnJyGZfJCr1ucZBTjKomDidZhcWrnsdiL0KexutvSH4oltZc7cGH
X-Gm-Gg: ASbGncuwSlVGyq9vyHYkGzlNChtYIX/806ISye8RMrZQVj2vnKkPeSMgKdGHRE4SK0I
	3GkSpDhzJes+26pW2rOOLLhPl7ru5Tl/R2lZbOJf/MiHgQw8AxvbKkQ2n8Nuyfnra/4/seNd5pL
	IRPOTWvluahTUEZNROJoEHci2ad6rMgf8OdRqFg6w1QWfEyz7D2FsIljPktqRz5NDq2lN/bAyVF
	mNtIwFDTXMW2o2Wbc0UqbOifTLVGJr8/869Sl1gmRe2emC46fBDj9dZIP0trAnx8oQ+IsUOy1uu
	nQoNgeyGBb+nquGawFLxoGIlAOcDY+Sra4a0gaCpYe6TPA8QMKDs1J47OGK1LNwmeG00ierEo6j
	8AluPbJvrMoRabYefh7eDGaVTNUzuN7g=
X-Google-Smtp-Source: AGHT+IG7X8OEaUQtwEaInKUgyLLCoC0UhoJeBl78I9Dhf+QTbtjtQudMAedFU47LkaWQaXH9Iyde9g==
X-Received: by 2002:a17:907:72c5:b0:ac3:2368:9a12 with SMTP id a640c23a62f3a-ac3f24f6d46mr1678357966b.27.1742907748331;
        Tue, 25 Mar 2025 06:02:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------A6j2a03kqSpF5WqD04UpRxiD"
Message-ID: <e6e64e58-a26a-44cc-b708-5bf510b041c8@gmail.com>
Date: Tue, 25 Mar 2025 14:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: add H extenstion to -march
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <0a072ab36b54ea7c4f9a6f94465fb7b79f9f49b2.1742573085.git.oleksii.kurochko@gmail.com>
 <c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com>
 <ee8b8e09-9b0b-4757-989c-b7d81721c325@gmail.com>
 <3d9e8e8c-2e09-43d6-a254-2f081c9e5eb1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3d9e8e8c-2e09-43d6-a254-2f081c9e5eb1@suse.com>

This is a multi-part message in MIME format.
--------------A6j2a03kqSpF5WqD04UpRxiD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/25/25 12:52 PM, Jan Beulich wrote:
> On 25.03.2025 12:48, Oleksii Kurochko wrote:
>> On 3/24/25 1:31 PM, Jan Beulich wrote:
>>> On 21.03.2025 17:17, Oleksii Kurochko wrote:
>>>> H provides additional instructions and CSRs that control the new stage of
>>>> address translation and support hosting a guest OS in virtual S-mode
>>>> (VS-mode).
>>>>
>>>> According to the Unprivileged Architecture (version 20240411) specification:
>>>> ```
>>>> Table 74 summarizes the standardized extension names. The table also defines
>>>> the canonical order in which extension names must appear in the name string,
>>>> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
>>>> RV32IMACV is legal, whereas RV32IMAVC is not.
>>>> ```
>>>> According to Table 74, the h extension is placed last in the one-letter
>>>> extensions name part of the ISA string.
>>>>
>>>> `h` is a standalone extension based on the patch [1] but it wasn't so
>>>> before.
>>>> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
>>>> and for that version it will be needed to encode H extensions instructions
>>>> explicitly by checking if __risv_h is defined.
>>> Leaving aside the typo, what is this about? There's no use of __riscv_h in
>>> the patch here, and ...
>> It is going to be used in future patches:https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32
> For this and ...
>
>>>> @@ -25,10 +24,13 @@ $(eval $(1) := \
>>>>    	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>>>    endef
>>>>    
>>>> +h-insn := "hfence.gvma"
>>>> +$(call check-extension,h)
>>> ... this, if it fails, will not have any effect on the build right now
>>> afaics.
>> No, it won't have any affect now as instruction from H extension isn't used now.
>> But it will be neededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/
>> and for p2m changes mentioned above.
> ... this both being future work, it might help if it could be made clear
> right here how things are going to work (with both gcc12 and up-to-date
> gcc).

I can update the commit message with the following:
```
If 'H' extension is supported by compiler then __riscv_h will be defined by
compiler (for gcc version >= 13.1).
For gcc12 it will be needed to:
#ifdef __riscv_h
  asm volatile ("h extension instruction");
#else
  asm volatile ("|.insn ..."); #endif ``` Or probably it will be easier not to ifdef-ing 
everything with __riscv_h but just return back a workaround with the 
following changes: ``` $ git diff diff --git a/xen/arch/riscv/arch.mk 
b/xen/arch/riscv/arch.mk index f29ad332c1..3bd64e7e51 100644 --- 
a/xen/arch/riscv/arch.mk +++ b/xen/arch/riscv/arch.mk @@ -24,13 +24,17 
@@ $(eval $(1) := \ $(call as-insn,$(CC) 
$(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1))) endef -h-insn := 
"hfence.gvma" -$(call check-extension,h) + 
+h-extension-name-$(CONFIG_CC_IS_GCC) := $(call cc-ifversion,-lt,1301, 
hh, h) +h-extension-name-$(CONFIG_CC_IS_CLANG) := h + 
+$(h-extension-name-y)-insn := "hfence.gvma" +$(call 
check-extension,$(h-extension-name-y)) zihintpause-insn := "pause" 
$(call check-extension,zihintpause) -extensions := $(h) $(zihintpause) 
_zicsr_zifencei_zbb +extensions := $($(h-extension-name-y)) 
$(zihintpause) _zicsr_zifencei_zbb extensions := $(subst 
$(space),,$(extensions)) ``` I prefer more a little bit the second 
option with having the workaround for GCC version. ~ Oleksii |

--------------A6j2a03kqSpF5WqD04UpRxiD
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
    <div class="moz-cite-prefix">On 3/25/25 12:52 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3d9e8e8c-2e09-43d6-a254-2f081c9e5eb1@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.03.2025 12:48, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/24/25 1:31 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 21.03.2025 17:17, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">H provides additional instructions and CSRs that control the new stage of
address translation and support hosting a guest OS in virtual S-mode
(VS-mode).

According to the Unprivileged Architecture (version 20240411) specification:
```
Table 74 summarizes the standardized extension names. The table also defines
the canonical order in which extension names must appear in the name string,
with top-to-bottom in table indicating first-to-last in the name string, e.g.,
RV32IMACV is legal, whereas RV32IMAVC is not.
```
According to Table 74, the h extension is placed last in the one-letter
extensions name part of the ISA string.

`h` is a standalone extension based on the patch [1] but it wasn't so
before.
As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
and for that version it will be needed to encode H extensions instructions
explicitly by checking if __risv_h is defined.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Leaving aside the typo, what is this about? There's no use of __riscv_h in
the patch here, and ...
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is going to be used in future patches:<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32">https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For this and ...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -25,10 +24,13 @@ $(eval $(1) := \
  	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
  endef
  
+h-insn := "hfence.gvma"
+$(call check-extension,h)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... this, if it fails, will not have any effect on the build right now
afaics.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
No, it won't have any affect now as instruction from H extension isn't used now.
But it will be needed <a class="moz-txt-link-abbreviated" href="mailto:forhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/">forhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/</a>
and for p2m changes mentioned above.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this both being future work, it might help if it could be made clear
right here how things are going to work (with both gcc12 and up-to-date
gcc).</pre>
    </blockquote>
    <pre>I can update the commit message with the following:
```
If 'H' extension is supported by compiler then __riscv_h will be defined by
compiler (for gcc version &gt;= 13.1).
For gcc12 it will be needed to:
#ifdef __riscv_h
 asm volatile ("h extension instruction");
#else
 asm volatile ("<code>.insn ...");
#endif
```

Or probably it will be easier not to ifdef-ing everything with __riscv_h but just return back a workaround
with the following changes:
```
$ git diff
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index f29ad332c1..3bd64e7e51 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -24,13 +24,17 @@ $(eval $(1) := \
        $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
-h-insn := "hfence.gvma"
-$(call check-extension,h)
+
+h-extension-name-$(CONFIG_CC_IS_GCC) := $(call cc-ifversion,-lt,1301, hh, h)
+h-extension-name-$(CONFIG_CC_IS_CLANG) := h
+
+$(h-extension-name-y)-insn := "hfence.gvma"
+$(call check-extension,$(h-extension-name-y))
 
 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)
 
-extensions := $(h) $(zihintpause) _zicsr_zifencei_zbb
+extensions := $($(h-extension-name-y)) $(zihintpause) _zicsr_zifencei_zbb
 
 extensions := $(subst $(space),,$(extensions))
```

I prefer more a little bit the second option with having the workaround for GCC version.

~ Oleksii
</code></pre>
  </body>
</html>

--------------A6j2a03kqSpF5WqD04UpRxiD--

