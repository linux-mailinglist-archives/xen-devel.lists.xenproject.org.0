Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C49A7041F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 15:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926585.1329421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5Xn-0001xk-8p; Tue, 25 Mar 2025 14:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926585.1329421; Tue, 25 Mar 2025 14:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5Xn-0001vn-5q; Tue, 25 Mar 2025 14:46:19 +0000
Received: by outflank-mailman (input) for mailman id 926585;
 Tue, 25 Mar 2025 14:46:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx5Xm-0001ve-Ab
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 14:46:18 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e83a3e70-0987-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 15:46:17 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e5b56fc863so8415865a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 07:46:17 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efbdecedsm874414366b.140.2025.03.25.07.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 07:46:15 -0700 (PDT)
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
X-Inumbo-ID: e83a3e70-0987-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742913976; x=1743518776; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubfnu9zPadwWKnVhmyyBplAaK3Mwmaf0IF/mk+Bq8lQ=;
        b=a4Gpkk9wUgcQlFlk2Tf+4A70wothydI1fuQuAq3SXotK+4elOfQN343xC/neTk6wgd
         vk0KR/gT9uuNrzvrM07bAuJIWHJAd8kAZJsoZQfHvgJ/g+FqT/05iiQvchF3G1y47ort
         jBRbCkAzNurGPbdhdVwnVhJ5e/AQCcssKE3IXqq1Io7RAPY9wSG2NSzJQByZCH+Xq2eh
         SnryF9t1ohtUkccNOOiMjNQ1bai52CVYY5K/9h+rhODebXRrRmevcCStqeNfVq15Zh8f
         0w/Bg2VkGLUDsTUqXDVZXNCPaQXjBnEqwVDRGE9UqPv7gxwt12alTIXPABcNq4BSj/HA
         2Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742913976; x=1743518776;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubfnu9zPadwWKnVhmyyBplAaK3Mwmaf0IF/mk+Bq8lQ=;
        b=aiLvOLr8RHb6tKALXsZgzOm+f5NaPr4e5uA79vud4Mdkp9bxhBWzzMMcc/y3/Wwdzt
         bG++akoXmf2fYX2Q64+cBW2dLuGHY4k0LBfRYINrwRS05S68eQzheihDhm68bKZzSa5R
         Hjt2pD8c1GkF/FV+uXn6G/CXJhbsGa7Vp0iWSDVMafaFo6lSRPN0SZ/vE1JGQ2zEmEhs
         IEtMRC2BjUov85zPHJ80V6C/RHJsdOUfr5Ngln/RT6nCAzqBk0An8OBiDTfpQcdseMKd
         7ZBK+lkKmy4dIjRSGc3dHt2ellomdlanV59I+PH5cbc9gBW2T0TzX8GwueRj6Orl07Eq
         Y+WA==
X-Forwarded-Encrypted: i=1; AJvYcCUjh3UxgbB18mRmJldDwcqS8n+n3DrXQVbc3MWE7A3SpK8pLUSLP4iRFjNWDQj+krIsKVkXcKr2Bf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysM0i55slooExK0a3xGmNVp3Aj3IN09m7pB7K4cfZjiMlf/SXg
	kAbYpLASfbsyyVni3cXUAHq/NsKPIHmizvv5s/V2/fm+JYz1dVQ/
X-Gm-Gg: ASbGncte07Oqx4CEEY/v0aoSKkme6QYOXUBMJeoZpEAPnleuJGLgglVPSRU29Gahich
	l0ZCDsEZoXv70uryuitftpPpAvq1HqTaJXtRlnppRRpuOtaHt3KpT4TLIS9WIgTEOOKgTrGXO+W
	q/qpRU48MXyIqjdWG/YAiB7BMxjIOSogaYKGB3pkSy0vmKu7dbDKWCTU8R7V/XWRgmWJAXnONBB
	Hn+EeZR350Kasqn5RAs3cOtPfEkvqZWh2K1MQMo06CcXEP0ONYbbVoCTEAPyNS+r3ZUZBm0T/5Z
	1QfZfyLUEc0k9gMtOrAUbSPDsBPpv/R8xEcjsIcRKHkwei8DEAhQTM26pJ7RP/XIOaXrBShcTaC
	Nv5/FuMKQwWcTkOLm+LWu
X-Google-Smtp-Source: AGHT+IFIoljogbjmBLwLC2Yyucm4iCx4mjY8P6kVJBdLHhkpiIoEf6sahx7w0kGWsoXzBWItAn1uig==
X-Received: by 2002:a17:906:d542:b0:ac3:ed56:86dc with SMTP id a640c23a62f3a-ac3f22d527fmr1678852866b.31.1742913976099;
        Tue, 25 Mar 2025 07:46:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------jzrVTekTF7oCKnyBkz7fX39l"
Message-ID: <238a9b67-a4f3-4f97-9d13-11a35884be0b@gmail.com>
Date: Tue, 25 Mar 2025 15:46:14 +0100
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
 <e6e64e58-a26a-44cc-b708-5bf510b041c8@gmail.com>
 <a6d511ec-38bc-4fad-9e08-462b7c10eac4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a6d511ec-38bc-4fad-9e08-462b7c10eac4@suse.com>

This is a multi-part message in MIME format.
--------------jzrVTekTF7oCKnyBkz7fX39l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/25/25 2:47 PM, Jan Beulich wrote:
> On 25.03.2025 14:02, Oleksii Kurochko wrote:
>> On 3/25/25 12:52 PM, Jan Beulich wrote:
>>> On 25.03.2025 12:48, Oleksii Kurochko wrote:
>>>> On 3/24/25 1:31 PM, Jan Beulich wrote:
>>>>> On 21.03.2025 17:17, Oleksii Kurochko wrote:
>>>>>> H provides additional instructions and CSRs that control the new stage of
>>>>>> address translation and support hosting a guest OS in virtual S-mode
>>>>>> (VS-mode).
>>>>>>
>>>>>> According to the Unprivileged Architecture (version 20240411) specification:
>>>>>> ```
>>>>>> Table 74 summarizes the standardized extension names. The table also defines
>>>>>> the canonical order in which extension names must appear in the name string,
>>>>>> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
>>>>>> RV32IMACV is legal, whereas RV32IMAVC is not.
>>>>>> ```
>>>>>> According to Table 74, the h extension is placed last in the one-letter
>>>>>> extensions name part of the ISA string.
>>>>>>
>>>>>> `h` is a standalone extension based on the patch [1] but it wasn't so
>>>>>> before.
>>>>>> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
>>>>>> and for that version it will be needed to encode H extensions instructions
>>>>>> explicitly by checking if __risv_h is defined.
>>>>> Leaving aside the typo, what is this about? There's no use of __riscv_h in
>>>>> the patch here, and ...
>>>> It is going to be used in future patches:https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32
>>> For this and ...
>>>
>>>>>> @@ -25,10 +24,13 @@ $(eval $(1) := \
>>>>>>     	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>>>>>     endef
>>>>>>     
>>>>>> +h-insn := "hfence.gvma"
>>>>>> +$(call check-extension,h)
>>>>> ... this, if it fails, will not have any effect on the build right now
>>>>> afaics.
>>>> No, it won't have any affect now as instruction from H extension isn't used now.
>>>> But it will beneededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/
>>>> and for p2m changes mentioned above.
>>> ... this both being future work, it might help if it could be made clear
>>> right here how things are going to work (with both gcc12 and up-to-date
>>> gcc).
>> I can update the commit message with the following:
>> ```
>> If 'H' extension is supported by compiler then __riscv_h will be defined by
>> compiler (for gcc version >= 13.1).
>> For gcc12 it will be needed to:
>> #ifdef __riscv_h
>>    asm volatile ("h extension instruction");
>> #else
>>    asm volatile ("|.insn ..."); #endif ```
> Okay, that's what I was concerned about. __riscv_h is a compiler indication.
> It means nothing about H extension insns being supported by the assembler
> (except perhaps for Clang's integrated one). The check-extension thing in
> the Makefile will actually check both in one go. Yet then the hfence.* insns
> have been in binutils since 2.38, i.e. pre-dating gcc12.

It is still needed to have or #ifdef-ing or workaround mentioned below ...

>
>> Or probably it will be easier not to ifdef-ing
>> everything with __riscv_h but just return back a workaround with the
>> following changes: ``` $ git diff diff --git a/xen/arch/riscv/arch.mk
>> b/xen/arch/riscv/arch.mk index f29ad332c1..3bd64e7e51 100644 ---
>> a/xen/arch/riscv/arch.mk +++ b/xen/arch/riscv/arch.mk @@ -24,13 +24,17
>> @@ $(eval $(1) := \ $(call as-insn,$(CC)
>> $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1))) endef -h-insn :=
>> "hfence.gvma" -$(call check-extension,h) +
>> +h-extension-name-$(CONFIG_CC_IS_GCC) := $(call cc-ifversion,-lt,1301,
>> hh, h) +h-extension-name-$(CONFIG_CC_IS_CLANG) := h +
>> +$(h-extension-name-y)-insn := "hfence.gvma" +$(call
>> check-extension,$(h-extension-name-y)) zihintpause-insn := "pause"
>> $(call check-extension,zihintpause) -extensions := $(h) $(zihintpause)
>> _zicsr_zifencei_zbb +extensions := $($(h-extension-name-y))
>> $(zihintpause) _zicsr_zifencei_zbb extensions := $(subst
>> $(space),,$(extensions)) ``` I prefer more a little bit the second
>> option with having the workaround for GCC version. ~ Oleksii |
> I fear this ended up unreadable.

... something happen with formatting:

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

~ Oleksii

--------------jzrVTekTF7oCKnyBkz7fX39l
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
    <div class="moz-cite-prefix">On 3/25/25 2:47 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a6d511ec-38bc-4fad-9e08-462b7c10eac4@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.03.2025 14:02, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/25/25 12:52 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 25.03.2025 12:48, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 3/24/25 1:31 PM, Jan Beulich wrote:
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
            <pre wrap="" class="moz-quote-pre">It is going to be used in future patches:<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32">https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32</a>
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">For this and ...

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
            <pre wrap="" class="moz-quote-pre">No, it won't have any affect now as instruction from H extension isn't used now.
But it will be <a class="moz-txt-link-abbreviated" href="mailto:neededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/">neededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/</a>
and for p2m changes mentioned above.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... this both being future work, it might help if it could be made clear
right here how things are going to work (with both gcc12 and up-to-date
gcc).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I can update the commit message with the following:
```
If 'H' extension is supported by compiler then __riscv_h will be defined by
compiler (for gcc version &gt;= 13.1).
For gcc12 it will be needed to:
#ifdef __riscv_h
  asm volatile ("h extension instruction");
#else
  asm volatile ("|.insn ..."); #endif ```
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Okay, that's what I was concerned about. __riscv_h is a compiler indication.
It means nothing about H extension insns being supported by the assembler
(except perhaps for Clang's integrated one). The check-extension thing in
the Makefile will actually check both in one go. Yet then the hfence.* insns
have been in binutils since 2.38, i.e. pre-dating gcc12.</pre>
    </blockquote>
    <pre>It is still needed to have or #ifdef-ing or workaround mentioned below ...
</pre>
    <blockquote type="cite"
      cite="mid:a6d511ec-38bc-4fad-9e08-462b7c10eac4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Or probably it will be easier not to ifdef-ing 
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I fear this ended up unreadable.</pre>
    </blockquote>
    <pre>... something happen with formatting:

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

~ Oleksii</pre>
  </body>
</html>

--------------jzrVTekTF7oCKnyBkz7fX39l--

