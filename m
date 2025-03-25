Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECFA7072A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926714.1329549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Lm-0000me-4z; Tue, 25 Mar 2025 16:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926714.1329549; Tue, 25 Mar 2025 16:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Lm-0000jw-1o; Tue, 25 Mar 2025 16:42:02 +0000
Received: by outflank-mailman (input) for mailman id 926714;
 Tue, 25 Mar 2025 16:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx7Lk-0000jq-80
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:42:00 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d1f81f0-0998-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 17:41:51 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a70so823826966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 09:41:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efbdc78esm890019066b.134.2025.03.25.09.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 09:41:49 -0700 (PDT)
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
X-Inumbo-ID: 0d1f81f0-0998-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742920910; x=1743525710; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0g96jhRPHha2UGiRt5bcCyitwiDAKf4aRv26RwN8Wo=;
        b=GA8mW4jEg7rdBU3ux3I1YtonCU9vPDEeOiYFNd1ujdVApyApy0z2dlLs3PetQQdBWk
         gUvmWU3dBYCJ/3Kwzb/oWXb9d13kMZ4rvScw8qwxbFooajQMl0N08Sm2I/9GYPYfyMNV
         qBjKdDrJvgMNrxX4WyhR6GUMFKD037R67ck/PLQLeZx68VNPBve+I8TP5W43S4k1O2+D
         kuz/FQ2KAYYHEcYxrbrr7osTduqnJbH6vq/iGzJITRRHc0M3v/o+oTi4e4plS7MTzBOl
         V8G2CSS9mfFxY9et4qyOk0KgRHfPhts5nbxokfVLmWOESfPeldP69srty+OLn9Ef9mAl
         x7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920910; x=1743525710;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0g96jhRPHha2UGiRt5bcCyitwiDAKf4aRv26RwN8Wo=;
        b=UGJeaUSZ/ph+7B7oHao1rIuLYwwRYs2f4NaRR4eLwUivwSASWAToFgJc4XHVjRs4jF
         06Du5N/ZLSsb6RheTWN7PXPj0EN578iXYJc06J3P8pqDlD/4W6pEwd1L6xqhaDdVXOcu
         fwpGUhWFTJkACFdfLOO1sjpvinfYp7RW3d5NbvqU9xpPkLMWwA0mixVQlf6B9H+pBekw
         jWYGYCJBso9zSeCRZUT25BFMJWqndh1vPYlP4/zKX8Cl6AbOTKIlR6GozxmLIMmF+mRF
         4MoeiBs6eAvAo4kmwru9DDIpMWv5J65KksYuQy9cutXu8mvJOWCJY3U7mDn6cjedzsr0
         IQcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxecuefm4U5Y3EJJsQ4E7qLdN8c+1wNWFqfqSjN4fyslUl/h+zkKsN6fDB4O7vBWbrU5V/z2VaMok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykplF/JDzFsEMyohvy2CCIbj11CuhtpnpTiKnZ0YzNN4+Umhqg
	bG7kLWA4wQWiopGPLVTQGLEmvloe7zb7QDlN+VcXYn5hEvVln8jF
X-Gm-Gg: ASbGncve4isbtS7ccNqhtpYP4myWzbGGmsRl6Pl+43NEgHdFkFNQxso4mcZ0UhDGA27
	oCpB7D/pvoBicUZRoQbKmJGIRyd/VRDKdzChvU30IzEu4n6ZstEt7/LfUgvZJ3m/PNUmwB4PUDT
	RO9w7NdBlniDeto/x7Q5CqIusbTqx368i3pj19/DcBtrhl9FbEtSJ+VmrBLdjS91Ht5mIV/a72W
	LoQsZb8OZa3/nRAoiIphwnt+MHWvxn38Cl6e/nI0eJCzbMJqNa1pte/q1YslN3PUn/Ige5RZtkR
	tarh8f0ScZS/kNcfUZnDP8PaWxt6Ip/G0RYjPUQGtujUqouxIsEgGiHReUfDRcTm0wr2v0NJJl8
	VjGYeqWoFDxcqqhmf7tvF
X-Google-Smtp-Source: AGHT+IE9M0YVeQmyneOjDz+BxNnoSVaPFohSfr7x/4GYQwuiELltO1sn1OorDHF5s9x/wMnRSAREug==
X-Received: by 2002:a17:907:a58c:b0:ac1:e332:b1e7 with SMTP id a640c23a62f3a-ac3f24164e1mr1915745366b.4.1742920909970;
        Tue, 25 Mar 2025 09:41:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0thxU0AzXDdkkcV7U2K9pCEn"
Message-ID: <9c37f0d7-f26a-4a53-b9a3-84cad82d6cef@gmail.com>
Date: Tue, 25 Mar 2025 17:41:47 +0100
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
 <238a9b67-a4f3-4f97-9d13-11a35884be0b@gmail.com>
 <5a0e1f5f-c08b-4045-98df-dec73ece028c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5a0e1f5f-c08b-4045-98df-dec73ece028c@suse.com>

This is a multi-part message in MIME format.
--------------0thxU0AzXDdkkcV7U2K9pCEn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/25/25 5:26 PM, Jan Beulich wrote:
> On 25.03.2025 15:46, Oleksii Kurochko wrote:
>> On 3/25/25 2:47 PM, Jan Beulich wrote:
>>> On 25.03.2025 14:02, Oleksii Kurochko wrote:
>>>> On 3/25/25 12:52 PM, Jan Beulich wrote:
>>>>> On 25.03.2025 12:48, Oleksii Kurochko wrote:
>>>>>> On 3/24/25 1:31 PM, Jan Beulich wrote:
>>>>>>> On 21.03.2025 17:17, Oleksii Kurochko wrote:
>>>>>>>> H provides additional instructions and CSRs that control the new stage of
>>>>>>>> address translation and support hosting a guest OS in virtual S-mode
>>>>>>>> (VS-mode).
>>>>>>>>
>>>>>>>> According to the Unprivileged Architecture (version 20240411) specification:
>>>>>>>> ```
>>>>>>>> Table 74 summarizes the standardized extension names. The table also defines
>>>>>>>> the canonical order in which extension names must appear in the name string,
>>>>>>>> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
>>>>>>>> RV32IMACV is legal, whereas RV32IMAVC is not.
>>>>>>>> ```
>>>>>>>> According to Table 74, the h extension is placed last in the one-letter
>>>>>>>> extensions name part of the ISA string.
>>>>>>>>
>>>>>>>> `h` is a standalone extension based on the patch [1] but it wasn't so
>>>>>>>> before.
>>>>>>>> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
>>>>>>>> and for that version it will be needed to encode H extensions instructions
>>>>>>>> explicitly by checking if __risv_h is defined.
>>>>>>> Leaving aside the typo, what is this about? There's no use of __riscv_h in
>>>>>>> the patch here, and ...
>>>>>> It is going to be used in future patches:https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32
>>>>> For this and ...
>>>>>
>>>>>>>> @@ -25,10 +24,13 @@ $(eval $(1) := \
>>>>>>>>      	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>>>>>>>      endef
>>>>>>>>      
>>>>>>>> +h-insn := "hfence.gvma"
>>>>>>>> +$(call check-extension,h)
>>>>>>> ... this, if it fails, will not have any effect on the build right now
>>>>>>> afaics.
>>>>>> No, it won't have any affect now as instruction from H extension isn't used now.
>>>>>> But it willbeneededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/
>>>>>> and for p2m changes mentioned above.
>>>>> ... this both being future work, it might help if it could be made clear
>>>>> right here how things are going to work (with both gcc12 and up-to-date
>>>>> gcc).
>>>> I can update the commit message with the following:
>>>> ```
>>>> If 'H' extension is supported by compiler then __riscv_h will be defined by
>>>> compiler (for gcc version >= 13.1).
>>>> For gcc12 it will be needed to:
>>>> #ifdef __riscv_h
>>>>     asm volatile ("h extension instruction");
>>>> #else
>>>>     asm volatile ("|.insn ..."); #endif ```
>>> Okay, that's what I was concerned about. __riscv_h is a compiler indication.
>>> It means nothing about H extension insns being supported by the assembler
>>> (except perhaps for Clang's integrated one). The check-extension thing in
>>> the Makefile will actually check both in one go. Yet then the hfence.* insns
>>> have been in binutils since 2.38, i.e. pre-dating gcc12.
>> It is still needed to have or #ifdef-ing or workaround mentioned below ...
>>
>>>> Or probably it will be easier not to ifdef-ing
>>>> everything with __riscv_h but just return back a workaround with the
>>>> following changes: ``` $ git diff diff --git a/xen/arch/riscv/arch.mk
>>>> b/xen/arch/riscv/arch.mk index f29ad332c1..3bd64e7e51 100644 ---
>>>> a/xen/arch/riscv/arch.mk +++ b/xen/arch/riscv/arch.mk @@ -24,13 +24,17
>>>> @@ $(eval $(1) := \ $(call as-insn,$(CC)
>>>> $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1))) endef -h-insn :=
>>>> "hfence.gvma" -$(call check-extension,h) +
>>>> +h-extension-name-$(CONFIG_CC_IS_GCC) := $(call cc-ifversion,-lt,1301,
>>>> hh, h) +h-extension-name-$(CONFIG_CC_IS_CLANG) := h +
>>>> +$(h-extension-name-y)-insn := "hfence.gvma" +$(call
>>>> check-extension,$(h-extension-name-y)) zihintpause-insn := "pause"
>>>> $(call check-extension,zihintpause) -extensions := $(h) $(zihintpause)
>>>> _zicsr_zifencei_zbb +extensions := $($(h-extension-name-y))
>>>> $(zihintpause) _zicsr_zifencei_zbb extensions := $(subst
>>>> $(space),,$(extensions)) ``` I prefer more a little bit the second
>>>> option with having the workaround for GCC version. ~ Oleksii |
>>> I fear this ended up unreadable.
>> ... something happen with formatting:
>>
>> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
>> index f29ad332c1..3bd64e7e51 100644
>> --- a/xen/arch/riscv/arch.mk
>> +++ b/xen/arch/riscv/arch.mk
>> @@ -24,13 +24,17 @@ $(eval $(1) := \
>>           $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>    endef
>>    
>> -h-insn := "hfence.gvma"
>> -$(call check-extension,h)
>> +
>> +h-extension-name-$(CONFIG_CC_IS_GCC) := $(call cc-ifversion,-lt,1301, hh, h)
> It all else fails, that's an option. The downside is that such version checks
> break if someone backports the respective change to an older version. Probing
> support for the actual command line option would be better. Why would
>
> $(call check-extension,hh)
> $(call check-extension,h)
>
> not work, btw? (Of course, if the above was an option, something slightly
> smarter may still want using, so that e.g. we avoid probing both in the more
> common case [going forward] that "h" is what is supported.)

It will work, I just decided to do in the way mentioned above because clang doesn't have this issue with having single 'h' at all
so for clang it isn't needed to have $(call check-extension, hh) at all.

I have similar patch somewhere. I will re-apply it.

Thanks.

~ Oleksii

>> +h-extension-name-$(CONFIG_CC_IS_CLANG) := h
>> +
>> +$(h-extension-name-y)-insn := "hfence.gvma"
>> +$(call check-extension,$(h-extension-name-y))
>>    
>>    zihintpause-insn := "pause"
>>    $(call check-extension,zihintpause)
>>    
>> -extensions := $(h) $(zihintpause) _zicsr_zifencei_zbb
>> +extensions := $($(h-extension-name-y)) $(zihintpause) _zicsr_zifencei_zbb
>>    
>>    extensions := $(subst $(space),,$(extensions))
>>
>> ~ Oleksii
>>
--------------0thxU0AzXDdkkcV7U2K9pCEn
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
    <div class="moz-cite-prefix">On 3/25/25 5:26 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5a0e1f5f-c08b-4045-98df-dec73ece028c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.03.2025 15:46, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/25/25 2:47 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 25.03.2025 14:02, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 3/25/25 12:52 PM, Jan Beulich wrote:
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
But it will <a class="moz-txt-link-abbreviated" href="mailto:beneededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/">beneededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/</a>
and for p2m changes mentioned above.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">... this both being future work, it might help if it could be made clear
right here how things are going to work (with both gcc12 and up-to-date
gcc).
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I can update the commit message with the following:
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
          <pre wrap="" class="moz-quote-pre">Okay, that's what I was concerned about. __riscv_h is a compiler indication.
It means nothing about H extension insns being supported by the assembler
(except perhaps for Clang's integrated one). The check-extension thing in
the Makefile will actually check both in one go. Yet then the hfence.* insns
have been in binutils since 2.38, i.e. pre-dating gcc12.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is still needed to have or #ifdef-ing or workaround mentioned below ...

</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">I fear this ended up unreadable.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It all else fails, that's an option. The downside is that such version checks
break if someone backports the respective change to an older version. Probing
support for the actual command line option would be better. Why would

$(call check-extension,hh)
$(call check-extension,h)

not work, btw? (Of course, if the above was an option, something slightly
smarter may still want using, so that e.g. we avoid probing both in the more
common case [going forward] that "h" is what is supported.)</pre>
    </blockquote>
    <pre>It will work, I just decided to do in the way mentioned above because clang doesn't have this issue with having single 'h' at all
so for clang it isn't needed to have $(call check-extension, hh) at all.

I have similar patch somewhere. I will re-apply it.

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:5a0e1f5f-c08b-4045-98df-dec73ece028c@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+h-extension-name-$(CONFIG_CC_IS_CLANG) := h
+
+$(h-extension-name-y)-insn := "hfence.gvma"
+$(call check-extension,$(h-extension-name-y))
  
  zihintpause-insn := "pause"
  $(call check-extension,zihintpause)
  
-extensions := $(h) $(zihintpause) _zicsr_zifencei_zbb
+extensions := $($(h-extension-name-y)) $(zihintpause) _zicsr_zifencei_zbb
  
  extensions := $(subst $(space),,$(extensions))

~ Oleksii

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------0thxU0AzXDdkkcV7U2K9pCEn--

