Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A1A2AC03
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882899.1292982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3N3-0001bj-Gt; Thu, 06 Feb 2025 15:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882899.1292982; Thu, 06 Feb 2025 15:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3N3-0001a4-E4; Thu, 06 Feb 2025 15:00:49 +0000
Received: by outflank-mailman (input) for mailman id 882899;
 Thu, 06 Feb 2025 15:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czS3=U5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tg3N2-0001Yg-6h
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:00:48 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a60e78-e49b-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 16:00:45 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5dce3763140so2264333a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:00:45 -0800 (PST)
Received: from [192.168.209.47] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b739d7sm981115a12.9.2025.02.06.07.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 07:00:43 -0800 (PST)
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
X-Inumbo-ID: 24a60e78-e49b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738854045; x=1739458845; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/hW3cNrd4P3LODZHf9GLSvEdxv4bs7JwAvKwNd7l24=;
        b=fctHJgkRjVDHKLpU6b3UTkPS6J3teRRrBRbgF60f7cJ4b86HCyoQNlzl+C39rMx/7Y
         E5ZTF5U5riI752Rn5LdpCl/urux20oRaBw3jl4ElCKkLGBL2panIPNTLguGJ4r/VzOqr
         Cm2seDgkLQWFuXuVsshwD5UhpKSXozjP55j+3aRXGRiRsLZ+LHX/eUj7gxhfowCgJnMY
         hNbXaqZkF/YRDp+ZXwJwlwkZBZQr9nKhTiqUi/v2oSDlNJBENcGkztAZu+GgY34np6tz
         ZnNzAjR68ytgM7fm/+q1oKDNF+qqdiavgJ8hheodEYZi8gOqIhV50W+d3Y+VTovzstog
         sfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854045; x=1739458845;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/hW3cNrd4P3LODZHf9GLSvEdxv4bs7JwAvKwNd7l24=;
        b=GyTBvEV6579U0RhlJ5FjGwdFxBtThxMXvWn5WCDBFimAGINZVLBdtbw0SkXpujneMN
         wUkDC7uf47DLYigjkUSzONnrf9JaLfSa0xbFa9VeVU/qNght22sOD1HsoRW38H6xNBmv
         5pMkPxjZMXLyDYNfdLjM9SgW2OVXD+ilMQeXXiqal/xlbOJIDbHrLxgv66r3wLJivQ/M
         uCgjUT5WeQ85li2u4smcCm9VUZ739HgAOGFelkiJEPoPTTCkoARcj0Ms3MKBjnyr2v0d
         oc8texIJ3dyKQFE3ENLTJg+LthjEiX7dDtHt1RMUueUvIVxuyJq2GtKpdtcHOCFcMmnO
         V9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVGgTCQTWZbB8H90aNvnb0K404OfVjBmn4LQKqHwnX4e0IygfhjqCqsYhT/pqUwSoe7Lc7KI1RThnY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAogDWR28DIEc+ayJ9XlSoqdiNE1GfRWESXH2xDLrCvfvgRBel
	5j6kvON8S/e0+EKkx504XPf3LI3ZBT3nyXg5CSiQQz72M0mPzACQ
X-Gm-Gg: ASbGncuMXq/cPLhPlF2Ly/tnNSXtf0CuhjzfMU/Z94lfVnieb+6T+QsMV8k4qzxv/hM
	+m0y71nMbbrNF4m4GwadeeLxra7lU9Syj350y+2hoh7aZqN0G886bVlUvSyXLUn6NzYmOXJI1ep
	qVOsYYhcHukQN3qrBAyAAYkKpqRVPsNKZbas8PoEwlekuX4yO416LPPuRdtnKeiS4lEjg9pMg/h
	cPDgufkEcANCGxlXM9wbVISC4WX6toPuWTMPiYAIkHt5m173HN02BaF+y9SRhnhIVNUAnAidNxi
	sMg4BtEwaf9NNLnQV5WqkkAIiXU=
X-Google-Smtp-Source: AGHT+IG6lTLyiGgYDzL99SZSsN30pKjV6ALN8C0sQgKL94JOXRlZH5OV8NS6UfCqTVPJ1OmKLfOA6g==
X-Received: by 2002:a05:6402:34c4:b0:5d1:22c2:6c56 with SMTP id 4fb4d7f45d1cf-5dcdb732ad1mr8214670a12.17.1738854044046;
        Thu, 06 Feb 2025 07:00:44 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Ra4H47SRufhWC4DW097XifwD"
Message-ID: <9a43296c-d78d-49bf-9a94-0b0699e4259d@gmail.com>
Date: Thu, 6 Feb 2025 16:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
 <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>
 <6c9baf46-bc0b-49a7-9cdd-bebb0fc71ee7@gmail.com>
 <4f16a3b9-3759-4bea-89cd-361b492e0133@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4f16a3b9-3759-4bea-89cd-361b492e0133@suse.com>

This is a multi-part message in MIME format.
--------------Ra4H47SRufhWC4DW097XifwD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/6/25 12:10 PM, Jan Beulich wrote:
>>>> +        case 's':
>>>> +            /*
>>>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU):
>>>> +             *   Before QEMU 7.1 it was an issue with misa to ISA string
>>>> +             *   conversion:
>>>> +             *https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
>>>> +             *   Additional details of the workaround on Linux kernel side:
>>>> +             *https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
>>>> +             *
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
>>>> +            fallthrough;
>>>> +        case 'z':
>>>> +            /*
>>>> +             * Before attempting to parse the extension itself, we find its end.
>>>> +             * As multi-letter extensions must be split from other multi-letter
>>>> +             * extensions with an "_", the end of a multi-letter extension will
>>>> +             * either be the null character or the "_" at the start of the next
>>>> +             * multi-letter extension.
>>>> +             *
>>>> +             * Next, as the extensions version is currently ignored, we
>>>> +             * eliminate that portion. This is done by parsing backwards from
>>>> +             * the end of the extension, removing any numbers. This may be a
>>>> +             * major or minor number however, so the process is repeated if a
>>>> +             * minor number was found.
>>>> +             *
>>>> +             * ext_end is intended to represent the first character *after* the
>>>> +             * name portion of an extension, but will be decremented to the last
>>>> +             * character itself while eliminating the extensions version number.
>>>> +             * A simple re-increment solves this problem.
>>>> +             */
>>>> +            for ( ; *isa && *isa != '_'; ++isa )
>>>> +                if ( unlikely(!isalnum(*isa)) )
>>>> +                    ext_err = true;
>>>> +
>>>> +            ext_end = isa;
>>>> +            if ( unlikely(ext_err) )
>>>> +                break;
>>> This, otoh, is an error. Which probably shouldn't go silently.
>> It is actually not an error, what it means that if version is mentioned or not, so
>> (1) rv32..._zbb_zbc
>> (2) rv32..._zbb1p2_zbc
>>
>> For (1), ext_err = true and it means that version isn't mentioned for _zbb and after it
>> immediately another extension name is going, so there is no any sense in ignoring (or parsing) version
>> numbers.
>> For (2), ext_err = false (because it ends on number ) so we have to ignore (or parse) version nubmers.
> I don't follow. Why would ext_err be true for (1)? That's a well-formed
> specifier, isn't it? rv32..._zbb.zbc (with the last dot meaning a literal
> one, unlike the earlier ...) is an example of what would cause ext_err to
> be true.

My fault, you are right, ext_err will be false for (1).

For your example, rv32..._zbb.zbc we have to do panic(), haven't we? It won't break algorithm and '.' will be
just ignored and algorithm will go to the next character. Probably, it would be enough to add:
   printk("%s: Ignore symbol %c; check your DTS\n", __func__, *isa);


>
>>>> +        default:
>>>> +            /*
>>>> +             * Things are a little easier for single-letter extensions, as they
>>>> +             * are parsed forwards.
>>>> +             *
>>>> +             * After checking that our starting position is valid, we need to
>>>> +             * ensure that, when isa was incremented at the start of the loop,
>>>> +             * that it arrived at the start of the next extension.
>>>> +             *
>>>> +             * If we are already on a non-digit, there is nothing to do. Either
>>>> +             * we have a multi-letter extension's _, or the start of an
>>>> +             * extension.
>>>> +             *
>>>> +             * Otherwise we have found the current extension's major version
>>>> +             * number. Parse past it, and a subsequent p/minor version number
>>>> +             * if present. The `p` extension must not appear immediately after
>>>> +             * a number, so there is no fear of missing it.
>>>> +             */
>>>> +            if ( unlikely(!isalpha(*ext)) )
>>>> +            {
>>>> +                ext_err = true;
>>>> +                break;
>>>> +            }
>>> Like above this also looks to be a situation that maybe better would be
>>> left go entirely silently. I even wonder whether you can safely continue
>>> the parsing in that case: How do you know whether what follows is indeed
>>> the start of an extension name?
>> Lets consider examples:
>> (1) riscv,isa=im
>> (2) riscv,isa=i1p2m
>> (3) riscv,isa=i1m
>>
>> (4) riscv,isa=i1_m1
>>
>> Note: Underscores "_" may be used to separate ISA extensions to improve readability
>> and to provide disambiguation, e.g., "RV32I2_M2_A2".
>>
>> (1) isa="i" so ext = "m" => no minor and major version between "i" and "m" => `ext` contains the name
>>       of the next extension name, thereby we will break a loop and go for parsing of the next extension
>>       which is "m" in this example
>> (2) isa="i" => ext="1" => algorithm will go further and will just skip minor and major version for
>>       this extension (1p2 => 1.2 version of extension "i")
>> (3) just the same as (2) but will stop earlier as minor version isn't set.
>>
>> Note: having "_" is legal from specification point of view, but it is illegal to use it between single letter
>>         extension from device tree binding point of view.
>> (4) just the same as (2) and (3) but using "_" separator, so the if above will just skip "_" and the next
>>       after "_" is an extension name again.
>>
>> Considering that "_" is illegal from device tree point of view between single letter extensions we should have
>> ASSERT(*ext != "_") and then only cases (1) - (3) will be possible to have.
>> Probably it also will make a sense to have an array with legal single letter extensions and check that *ext is
>> in this array.
>>
>> Interesting that device tree binding doesn't cover this case:
>> ```
>> Because the "P" extension for Packed SIMD can be confused for the decimal point in a version number,
>> it must be preceded by an underscore if it follows a number. For example, "rv32i2p2" means version
>> 2.2 of RV32I, whereas "rv32i2_p2" means version 2.0 of RV32I with version 2.0 of the P extension.
>> ```
>> if I correctly interpreted the pattern:pattern:^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
>> And it also doesn't support versions for single letter extensions.
>> So "rv32i2_m2_a2" or with using "p" is impossible?
>> Then riscv_isa_parse_string() could be simplified ( probably when it was implemented in Linux kernel they don't have the binding for riscv,isa and they
>> just tried to follow RISC-V specification ) for the case of single letter extensions (or just keep it as is to be in sync with Linux kernel).
> All fine, but what about e.g.
>
> (5) riscv,isa=i?m1

It is impossible from device tree point of view:
1. According to DT's patter after single letter extension couldn't be version.
2. Between "ima" can't be anything.

But it shouldn't break an algorithm because:
(1) parse "i" and nothing wrong with that.
(2) "?" will be ignored because we have a check at the start of single letter extension case:
        if ( unlikely(!isalpha(*ext)) )
     so ext_err will be set to true
(3) "?" will be ignored and go just to "m" because of set ext_err=true at the step (2).
(4) Then "m" will be parsed successfully and 1 will be just ignored.

Does it make sense?

~ Oleksii

--------------Ra4H47SRufhWC4DW097XifwD
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
    <div class="moz-cite-prefix">On 2/6/25 12:10 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4f16a3b9-3759-4bea-89cd-361b492e0133@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+        case 's':
+            /*
+             * Workaround for invalid single-letter 's' &amp; 'u' (QEMU):
+             *   Before QEMU 7.1 it was an issue with misa to ISA string
+             *   conversion:
+             *<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587">https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587</a>
+             *   Additional details of the workaround on Linux kernel side:
+             *<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t">https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t</a>
+             *
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
+            fallthrough;
+        case 'z':
+            /*
+             * Before attempting to parse the extension itself, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             *
+             * Next, as the extensions version is currently ignored, we
+             * eliminate that portion. This is done by parsing backwards from
+             * the end of the extension, removing any numbers. This may be a
+             * major or minor number however, so the process is repeated if a
+             * minor number was found.
+             *
+             * ext_end is intended to represent the first character *after* the
+             * name portion of an extension, but will be decremented to the last
+             * character itself while eliminating the extensions version number.
+             * A simple re-increment solves this problem.
+             */
+            for ( ; *isa &amp;&amp; *isa != '_'; ++isa )
+                if ( unlikely(!isalnum(*isa)) )
+                    ext_err = true;
+
+            ext_end = isa;
+            if ( unlikely(ext_err) )
+                break;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This, otoh, is an error. Which probably shouldn't go silently.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is actually not an error, what it means that if version is mentioned or not, so
(1) rv32..._zbb_zbc
(2) rv32..._zbb1p2_zbc

For (1), ext_err = true and it means that version isn't mentioned for _zbb and after it
immediately another extension name is going, so there is no any sense in ignoring (or parsing) version
numbers.
For (2), ext_err = false (because it ends on number ) so we have to ignore (or parse) version nubmers.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't follow. Why would ext_err be true for (1)? That's a well-formed
specifier, isn't it? rv32..._zbb.zbc (with the last dot meaning a literal
one, unlike the earlier ...) is an example of what would cause ext_err to
be true.</pre>
    </blockquote>
    <pre>My fault, you are right, ext_err will be false for (1).

For your example, rv32..._zbb.zbc we have to do panic(), haven't we? It won't break algorithm and '.' will be
just ignored and algorithm will go to the next character. Probably, it would be enough to add:
  printk("%s: Ignore symbol %c; check your DTS\n", __func__, *isa);

</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:4f16a3b9-3759-4bea-89cd-361b492e0133@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+        default:
+            /*
+             * Things are a little easier for single-letter extensions, as they
+             * are parsed forwards.
+             *
+             * After checking that our starting position is valid, we need to
+             * ensure that, when isa was incremented at the start of the loop,
+             * that it arrived at the start of the next extension.
+             *
+             * If we are already on a non-digit, there is nothing to do. Either
+             * we have a multi-letter extension's _, or the start of an
+             * extension.
+             *
+             * Otherwise we have found the current extension's major version
+             * number. Parse past it, and a subsequent p/minor version number
+             * if present. The `p` extension must not appear immediately after
+             * a number, so there is no fear of missing it.
+             */
+            if ( unlikely(!isalpha(*ext)) )
+            {
+                ext_err = true;
+                break;
+            }
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Like above this also looks to be a situation that maybe better would be
left go entirely silently. I even wonder whether you can safely continue
the parsing in that case: How do you know whether what follows is indeed
the start of an extension name?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Lets consider examples:
(1) riscv,isa=im
(2) riscv,isa=i1p2m
(3) riscv,isa=i1m

(4) riscv,isa=i1_m1

Note: Underscores "_" may be used to separate ISA extensions to improve readability
and to provide disambiguation, e.g., "RV32I2_M2_A2".

(1) isa="i" so ext = "m" =&gt; no minor and major version between "i" and "m" =&gt; `ext` contains the name
     of the next extension name, thereby we will break a loop and go for parsing of the next extension
     which is "m" in this example
(2) isa="i" =&gt; ext="1" =&gt; algorithm will go further and will just skip minor and major version for
     this extension (1p2 =&gt; 1.2 version of extension "i")
(3) just the same as (2) but will stop earlier as minor version isn't set.

Note: having "_" is legal from specification point of view, but it is illegal to use it between single letter
       extension from device tree binding point of view.
(4) just the same as (2) and (3) but using "_" separator, so the if above will just skip "_" and the next
     after "_" is an extension name again.

Considering that "_" is illegal from device tree point of view between single letter extensions we should have
ASSERT(*ext != "_") and then only cases (1) - (3) will be possible to have.
Probably it also will make a sense to have an array with legal single letter extensions and check that *ext is
in this array.

Interesting that device tree binding doesn't cover this case:
```
Because the "P" extension for Packed SIMD can be confused for the decimal point in a version number,
it must be preceded by an underscore if it follows a number. For example, "rv32i2p2" means version
2.2 of RV32I, whereas "rv32i2_p2" means version 2.0 of RV32I with version 2.0 of the P extension.
```
if I correctly interpreted the pattern:pattern:^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
And it also doesn't support versions for single letter extensions.
So "rv32i2_m2_a2" or with using "p" is impossible?
Then riscv_isa_parse_string() could be simplified ( probably when it was implemented in Linux kernel they don't have the binding for riscv,isa and they
just tried to follow RISC-V specification ) for the case of single letter extensions (or just keep it as is to be in sync with Linux kernel).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
All fine, but what about e.g.

(5) riscv,isa=i?m1</pre>
    </blockquote>
    <pre>It is impossible from device tree point of view:
1. According to DT's patter after single letter extension couldn't be version.
2. Between "ima" can't be anything.

But it shouldn't break an algorithm because:
(1) parse "i" and nothing wrong with that.
(2) "?" will be ignored because we have a check at the start of single letter extension case:
       if ( unlikely(!isalpha(*ext)) )
    so ext_err will be set to true
(3) "?" will be ignored and go just to "m" because of set ext_err=true at the step (2).
(4) Then "m" will be parsed successfully and 1 will be just ignored.

Does it make sense?

~ Oleksii
</pre>
  </body>
</html>

--------------Ra4H47SRufhWC4DW097XifwD--

