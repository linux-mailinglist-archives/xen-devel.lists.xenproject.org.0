Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF27AA505C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973754.1361807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9Sf-0003ql-6S; Wed, 30 Apr 2025 15:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973754.1361807; Wed, 30 Apr 2025 15:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9Sf-0003nf-3V; Wed, 30 Apr 2025 15:35:01 +0000
Received: by outflank-mailman (input) for mailman id 973754;
 Wed, 30 Apr 2025 15:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9NI=XQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uA9Sc-0003nX-Tk
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:34:59 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abfd80c6-25d8-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 17:34:57 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso1215082866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:34:57 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acebeca80a0sm360909766b.90.2025.04.30.08.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:34:56 -0700 (PDT)
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
X-Inumbo-ID: abfd80c6-25d8-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746027297; x=1746632097; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABavY/KIcAykhwbPpugvOHw/3GEOBiDZ2cLV3FkyCYk=;
        b=j91wmjUN034Q510atgEkDDT3tzY67UiM0DXZNb+qH8Kw7ocy+EGcFoWFbuPIIatJ93
         39kafo+bJnRzvRAHBtBnlkZF2LRC9WXyreKneRAXoW3xsrVuhMVwdohE4rT8nurHzsAF
         tW2gKG2hPI7/5mUdNcdKF4VUPrs2mUFLa0ApzmK1TpDewxZgLsKrfDV0i7M+GQwuhSXW
         BzOBTQ+QGJ47BWOD/o6lQe+VXTWUxppCD/FtRJhln/XNHgk1QItNIh6I8yb48HGqgAIK
         9V+MRxUwEgk1ADlSzgbNMD9lHUkjt4Mo/f7yLAlqBIC1oQiGiI09js2gJk8td19BKX3L
         jdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027297; x=1746632097;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABavY/KIcAykhwbPpugvOHw/3GEOBiDZ2cLV3FkyCYk=;
        b=bNwnb3CQaReUOgD7vlSLeAvWM5cTGfwjh43ZMY/8S9c1LQyajZ3AagmVqlqbAxY5FV
         4iQF8vd6MpaYOUR3wIG3foChIy4fBFHgExXxRplMwk/OcN30sWSn2xLRGRlcraiJsfaI
         YtxrrzkjUk2yt4PWiLxdLQR7Uw1xZGdidMrn0hyk6bZVdO9V97c9nkXa2o/IZyIZdyMz
         Is8A1Fv128VuL32dr6CcehLAoo8kr/SP8EcNWU3Mh/qdcYVa4/bC2lTivmTc4MCNdnPU
         iPYnkb/j8KgIYZKw+IbJo8hISa/ug+DqtmJLD6TRS9iBPFqNCrTzH2tXM6hOYFGx++00
         S8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTEoyCZe803jpGbPe9XjQ2IMPNA6LBtW9hR0h+IC0vSWLYwmwS0G9Mt/hj2LVEBvD+iV1tjAIqzIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRFTb2j9S7dfh06Ub0cXRCtd6Qcm5kMY9bYNFYLAEwDQtyUZXZ
	Q3nK1DWGMIDtZYrzkx2iPf6Q58tB1JMHxaAHtYZkKftRMgzYaMNl
X-Gm-Gg: ASbGncu16xIIdIhXifSPJvSPZuCjPXM4OEn4uMCiGgcRoM1W8WcnNl1JI9m86b60Nc6
	tkxLaPwY/i4Y8hXzbQH73T4our0kIvcpJHJJyQDXJJ6Xd3jgMcSGTy0dWs7ai6Tdeds58lfAhbI
	DRO0VMaC7AGMRs9aZdZtPPjrqfYg6I2kIljhg97iyWjasOmTc0QfRcAhPPlE/UmzTKnovw3/NO/
	E9LJt/7MnSrQjlwQE2DFrREzF7WHu7LxNeyK/aNTBtalrqnNBwhFT3396MZEG9QXo+NXfkJxYCS
	bhzqvO8snlEl8QpZXZDgYkXffLs+mHBJsgNCVax59/R5QRAix5WCgCUcYdSVo944TjvR4eTJR9S
	wNtcsqR5MSttPDt19
X-Google-Smtp-Source: AGHT+IH1PCoadJD5EXYOsZAaxI/TCJj50tqw18u4Tm1wbMAa/VBg3LSGchScDmVOGQpQLDtal5aC/Q==
X-Received: by 2002:a17:906:6a19:b0:ac6:fcdd:5a97 with SMTP id a640c23a62f3a-acedc72f834mr430718466b.48.1746027297001;
        Wed, 30 Apr 2025 08:34:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------QJBBg9o5U0y0rBXLrqNR0jkB"
Message-ID: <ee057161-6f24-44f2-a009-fec5885c6f11@gmail.com>
Date: Wed, 30 Apr 2025 17:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] xen/riscv: initialize interrupt controller
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <cb730a1293f14dd7fd58f98f5ecda4e2523b2d90.1744126720.git.oleksii.kurochko@gmail.com>
 <bcffc56a-5518-4bcc-9124-d49a98ae727a@suse.com>
 <4851cd30-73a5-4d97-b506-850d67c285d7@gmail.com>
Content-Language: en-US
In-Reply-To: <4851cd30-73a5-4d97-b506-850d67c285d7@gmail.com>

This is a multi-part message in MIME format.
--------------QJBBg9o5U0y0rBXLrqNR0jkB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 12:11 PM, Oleksii Kurochko wrote:
>
>
> On 4/15/25 5:59 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> Call intc_init() to do basic initialization steps for APLIC and IMISC.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich<jbeulich@suse.com>
>> yet ...
>>
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>   
>>>       intc_preinit();
>>>   
>>> +    intc_init();
>>> +
>>>       printk("All set up\n");
>>>   
>>>       machine_halt();
>> ... this being everything here I wonder if this can't be folded with the
>> patch where the function is introduced.
> Sure, it can be folded. I will do that to reduce patch series.

I doubled checked and, at the moment, when intc_init() is introduced:
void __init intc_init(void)
{
     ASSERT(intc_hw_ops);

     if ( intc_hw_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
}

intc_hw_ops isn't registered as they are registered in the next two patches after
intriduction of intc_hw_ops.

~ Oleksii

--------------QJBBg9o5U0y0rBXLrqNR0jkB
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
    <div class="moz-cite-prefix">On 4/17/25 12:11 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4851cd30-73a5-4d97-b506-850d67c285d7@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 4/15/25 5:59 PM, Jan Beulich
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:bcffc56a-5518-4bcc-9124-d49a98ae727a@suse.com">
        <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Call intc_init() to do basic initialization steps for APLIC and IMISC.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E"
          href="mailto:oleksii.kurochko@gmail.com"
          moz-do-not-send="true">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Acked-by: Jan Beulich <a
        class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com"
        moz-do-not-send="true">&lt;jbeulich@suse.com&gt;</a>
yet ...

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    intc_init();
+
     printk("All set up\n");
 
     machine_halt();
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">... this being everything here I wonder if this can't be folded with the
patch where the function is introduced.</pre>
      </blockquote>
      <pre>Sure, it can be folded. I will do that to reduce patch series.</pre>
    </blockquote>
    <pre>I doubled checked and, at the moment, when intc_init() is introduced:
void __init intc_init(void)
{
    ASSERT(intc_hw_ops);

    if ( intc_hw_ops-&gt;init() )
        panic("Failed to initialize the interrupt controller drivers\n");
}

intc_hw_ops isn't registered as they are registered in the next two patches after
intriduction of intc_hw_ops.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:4851cd30-73a5-4d97-b506-850d67c285d7@gmail.com"> </blockquote>
  </body>
</html>

--------------QJBBg9o5U0y0rBXLrqNR0jkB--

