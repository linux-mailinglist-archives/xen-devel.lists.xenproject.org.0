Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCA8A10772
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 14:11:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871319.1282342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXggS-0007UA-LX; Tue, 14 Jan 2025 13:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871319.1282342; Tue, 14 Jan 2025 13:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXggS-0007S0-Ip; Tue, 14 Jan 2025 13:10:16 +0000
Received: by outflank-mailman (input) for mailman id 871319;
 Tue, 14 Jan 2025 13:10:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXggR-0007Ru-1e
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 13:10:15 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3665fa1-d278-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 14:10:12 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-304d757a9c1so50244901fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 05:10:12 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0fa064sm17709761fa.66.2025.01.14.05.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 05:10:10 -0800 (PST)
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
X-Inumbo-ID: e3665fa1-d278-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736860212; x=1737465012; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCYk/FDIZ1PIGvnaue940QtDZOzM9d25xWtruLovZt4=;
        b=RY8gM4H4hV3ddeycboUQU/drcZl1HrXZxf0qvR9lczYg0lWPOlSkxQlCmcy8eVUN/M
         yev+jnYlAQxD1CLSIVEwSMM7aZFb5H6FmDe3rYklrmFRqDqHwKlEg1OnByblfPuHAQXh
         bG0RYxsFuhA5h6VHo6qIQoVWqrjF10sAO1xOxKTXa/xDfxXdTORkpG2fJLP06KJLl2kx
         CQLQSzN2ZQhxizQvvyJqXTIXLIh96OMJz30Syokb5rXL5phzNwZ73G1vk/BUQSl9B3pa
         ubkijvyJsWTiNKqCKqs9s318NSgbEk7vyQKhlRfLsPd5mFB4pYi5YXDw+Yu7VzoZ8ZeO
         oOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736860212; x=1737465012;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XCYk/FDIZ1PIGvnaue940QtDZOzM9d25xWtruLovZt4=;
        b=gg8NHdHCWfl6nqW8/ss7ZeyrxJv/3lLDgOx1SQWP38Q4K7idjKXurOafQLuIaoy8q6
         1HuHmeFvD5Q9NtCROkU51uKsy3bmm2l++CjtyQp28XAPm7gC4ulR/rloWjwRGfxXlLYI
         4eC6YWoxUryqtx75D3Gyh9VGDgTDQXwqay4klSGbBsFmGZBuIpn0ozE6+8hn3cThtYUA
         tqpYkc5/J3ygCOQNBu4wyaW12/cw0Z2C9VvoFNzUQEqLcznircsJHMjLghRQsy3P8VEj
         H0Btm7wcql5mltKeld1IDU/2t9iE1zdMohQDujALQarOSnwstTx8M8TSca+T3wMozN4l
         4y+A==
X-Forwarded-Encrypted: i=1; AJvYcCVnHYulnIMsliWgZ/oWwYm21GW0MkPuJLSHLCsPLsu3Lg25scHk49jjEDg+/UnSos/MuTGwZ1kPU1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytbLYBiZ8aJaPvyEfRwRM1AL7ZCxdXtRa+J2jKNXFecJYi1TgZ
	7lMs7SsCYXt5P2EgxV+ITfEjGDPNkjxVynucZXhsqNMcbeiW4unO
X-Gm-Gg: ASbGncuamjxnqbh2TfXvW7wiekeOv624batIwWoV6pO1G/7rzk0i751ycz3RjbYYgdZ
	GxEl0BRlhUBau23CbQnfvWvo7O/jf9+hU7wRZyTh19yX3ms2t36vVWFO4eC8WTuHAHwDFFUrZiw
	7VdP3NAYBdJJtPX1NbFvdRbWCs01OznPvbdAM/C6uDaODlfMyy1h3HhBmWffCGalxS/mU0ymOhE
	pbaHsefdAeefQ8xrlgReAzSd2SnajtDm1C/mmpL23vuKJDW4KlIlRwMLW7YD5FYxXmxEQ==
X-Google-Smtp-Source: AGHT+IGJ9plYS4K6RRrzZyp7ubjYF7yB/j6PG35YTj/znwZQf7xq6Th3fGweNwIk2eVy1sgRSZZAkA==
X-Received: by 2002:a05:651c:4ca:b0:302:2097:392f with SMTP id 38308e7fff4ca-305fcfa3b96mr64728341fa.7.1736860210895;
        Tue, 14 Jan 2025 05:10:10 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------kP9can0595io0wr0tFwwwTop"
Message-ID: <1c1307a2-9c62-4103-bf91-a587664e764a@gmail.com>
Date: Tue, 14 Jan 2025 14:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v1 1/1] xen/riscv: identify specific ISA
 supported by cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734957957.git.oleksii.kurochko@gmail.com>
 <ee14c485c6c6402a2d1706278b21bf3fcf821af9.1734957957.git.oleksii.kurochko@gmail.com>
 <bc636259-5586-428c-8a57-f97ba16a14b8@suse.com>
 <255b0079-4516-404c-81c1-a49e6f7bf5b4@gmail.com>
 <7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com>

This is a multi-part message in MIME format.
--------------kP9can0595io0wr0tFwwwTop
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/25 8:33 AM, Jan Beulich wrote:
>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>>>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>>>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>> Isn't it kind of implied that with the presence of Zbb, B should also be
>>> present?
>> My interpretation of the RISC-V Bitmanip Extension spec is that the 'B' extension is essentially a collection of
>> the Zba, Zbb, Zbs, and other extensions, but it isn't an extension by itself.
>> The following is mentioned in the spec:
>>     The bit-manipulation (bitmanip) extension collection is comprised of several component extensions to the base
>>     RISC-V architecture that are intended to provide some combination of code size reduction, performance
>>     improvement, and energy reduction. While the instructions are intended to have general use, some instructions
>>     are more useful in some domains than others. Hence, several smaller bitmanip extensions are provided, rather
>>     than one large extension. Each of these smaller extensions is grouped by common function and use case, and
>>     each of which has its own Zb*-extension name.
> Still the doc has '"B" Extension for Bit Manipulation' as the title of the
> chapter.
> And gas accepts B as an extension (e.g. ".option arch, +b").

I think it is fine.
B, in this case, just represents Zba, Zbb, Zbc, Zbs and that all of them are supported at the same time.
But I see chips that doesn't have B because it doesn't have one of those extensions.

>
>>>> +            /*
>>>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU).
>>>> +             * No need to set the bit in riscv_isa as 's' & 'u' are
>>>> +             * not valid ISA extensions. It works unless the first
>>>> +             * multi-letter extension in the ISA string begins with
>>>> +             * "Su" and is not prefixed with an underscore.
>>>> +             */
>>>> +            if ( ext[-1] != '_' && ext[1] == 'u' )
>>>> +            {
>>>> +                ++isa;
>>>> +                ext_err = true;
>>>> +                break;
>>>> +            }
>>> I'm afraid I don't understand this; the comment raises more questions
>>> than it answers.
>> Some details could be found here about these QEMU workaround from LK view:
>> https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
>>
>> This leads to the following fix in QEMU:
>> https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
>>
>> Considering QEMU's patch, these workaround isn't needed anymore since QEMU 7.1 ( it has been released30 Aug 2022 ) probably we could update the
>> QEMU version on our CI and just drop these changes.
>> Or, at least, update the comment with the links mentioned above and add a message that these changes are needed only for QEMU < 7.1.
>> Am I right that we don't have something like GCC_VERSION in Xen but for QEMU?
> How could there be? At the time of building Xen we know what compiler
> version is in use, but we clearly don't know under what qemu versions
> it might later be run.

Agree with that, there is no any sense for having something similar as GCC_VERSIOB but
for QEMU. Then I will just update the comment around this workaround with some clarifications.

>
>>>> +        riscv_isa_parse_string(isa, this_isa);
>>>> +
>>>> +        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
>>>> +            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>>>> +        else
>>>> +            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>>> What if the first instance had no extensions at all? You'll then copy what
>>> the second instance say, ending up with extensions not supported by one of
>>> the CPUs.
>> I think that it's impossible that there is no extensions at all and it should be
>> considered as a bug of provided riscv,isa property. Thereby it should be enough to
>> add BUG_ON(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX)) before if-condition.
> Well, you can of course make such an assumption. I don't think though that
> it's technically impossible to have an extension-less environment. Xen
> won't be able to run there, though (we'll require H at the very least aiui,
> and I'm sure we really also require Zicsr).

I would like to clarify some things. I think we are counting by word 'extension' different things.
I am including to this `Base ISA` ( and likely it is incorrect to do so ( or,at least, confusing )
and I will try not to do that in the future. I am using it in this manner because `Base ISA` is
included to the table 74. Standard ISA extension names in Unpriv spec ) then it is impossible to
have an extension-less environment because the spec mentions the following:

     A RISC-V ISA is defined as a base integer ISA, which must be present in any implementation, plus
     optional extensions to the base ISA.

So, at least, r{32,64,128}i should written in riscv,isa property of DTS file and that is the reason why
this_isa can't be empty, and thereby riscv_isa will be initialized with, at least, `i` ending up with only `i`
supported by all CPUs.

But if not count `I` as an extension and just as base ISA then it is really technically possible to come up with
extension-less environment. But anyway as you mentioned we still need for Xen some extensions. ( btw, thanks, I missed to
add Zicsr to required_extensions[] ).

Thanks.

~ Oleksii

--------------kP9can0595io0wr0tFwwwTop
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
    <div class="moz-cite-prefix">On 1/14/25 8:33 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
+    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Isn't it kind of implied that with the presence of Zbb, B should also be
present?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
My interpretation of the RISC-V Bitmanip Extension spec is that the 'B' extension is essentially a collection of
the Zba, Zbb, Zbs, and other extensions, but it isn't an extension by itself.
The following is mentioned in the spec:
   The bit-manipulation (bitmanip) extension collection is comprised of several component extensions to the base
   RISC-V architecture that are intended to provide some combination of code size reduction, performance
   improvement, and energy reduction. While the instructions are intended to have general use, some instructions
   are more useful in some domains than others. Hence, several smaller bitmanip extensions are provided, rather
   than one large extension. Each of these smaller extensions is grouped by common function and use case, and
   each of which has its own Zb*-extension name.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Still the doc has '"B" Extension for Bit Manipulation' as the title of the
chapter. </pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com">
      <pre wrap="" class="moz-quote-pre">And gas accepts B as an extension (e.g. ".option arch, +b").</pre>
    </blockquote>
    <pre>I think it is fine.
B, in this case, just represents Zba, Zbb, Zbc, Zbs and that all of them are supported at the same time.
But I see chips that doesn't have B because it doesn't have one of those extensions.</pre>
    <blockquote type="cite"
      cite="mid:7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+            /*
+             * Workaround for invalid single-letter 's' &amp; 'u' (QEMU).
+             * No need to set the bit in riscv_isa as 's' &amp; 'u' are
+             * not valid ISA extensions. It works unless the first
+             * multi-letter extension in the ISA string begins with
+             * "Su" and is not prefixed with an underscore.
+             */
+            if ( ext[-1] != '_' &amp;&amp; ext[1] == 'u' )
+            {
+                ++isa;
+                ext_err = true;
+                break;
+            }
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I'm afraid I don't understand this; the comment raises more questions
than it answers.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Some details could be found here about these QEMU workaround from LK view:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t">https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t</a>

This leads to the following fix in QEMU:
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587">https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587</a>

Considering QEMU's patch, these workaround isn't needed anymore since QEMU 7.1 ( it has been released30 Aug 2022 ) probably we could update the
QEMU version on our CI and just drop these changes.
Or, at least, update the comment with the links mentioned above and add a message that these changes are needed only for QEMU &lt; 7.1.
Am I right that we don't have something like GCC_VERSION in Xen but for QEMU?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How could there be? At the time of building Xen we know what compiler
version is in use, but we clearly don't know under what qemu versions
it might later be run.</pre>
    </blockquote>
    <pre>Agree with that, there is no any sense for having something similar as GCC_VERSIOB but
for QEMU. Then I will just update the comment around this workaround with some clarifications.</pre>
    <blockquote type="cite"
      cite="mid:7cf45091-bf3f-4497-a6e2-72571d7e745e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+        riscv_isa_parse_string(isa, this_isa);
+
+        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
+            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+        else
+            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What if the first instance had no extensions at all? You'll then copy what
the second instance say, ending up with extensions not supported by one of
the CPUs.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that it's impossible that there is no extensions at all and it should be
considered as a bug of provided riscv,isa property. Thereby it should be enough to
add BUG_ON(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX)) before if-condition.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, you can of course make such an assumption. I don't think though that
it's technically impossible to have an extension-less environment. Xen
won't be able to run there, though (we'll require H at the very least aiui,
and I'm sure we really also require Zicsr).</pre>
    </blockquote>
    <pre>I would like to clarify some things. I think we are counting by word 'extension' different things.
I am including to this `Base ISA` ( and likely it is incorrect to do so ( or,at least, confusing )
and I will try not to do that in the future. I am using it in this manner because `Base ISA` is
included to the table 74. Standard ISA extension names in Unpriv spec ) then it is impossible to
have an extension-less environment because the spec mentions the following:</pre>
    <pre>    A RISC-V ISA is defined as a base integer ISA, which must be present in any implementation, plus
    optional extensions to the base ISA.

So, at least, r{32,64,128}i should written in riscv,isa property of DTS file and that is the reason why
this_isa can't be empty, and thereby riscv_isa will be initialized with, at least, `i` ending up with only `i`
supported by all CPUs.

But if not count `I` as an extension and just as base ISA then it is really technically possible to come up with
extension-less environment. But anyway as you mentioned we still need for Xen some extensions. ( btw, thanks, I missed to
add Zicsr to required_extensions[] ).

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------kP9can0595io0wr0tFwwwTop--

