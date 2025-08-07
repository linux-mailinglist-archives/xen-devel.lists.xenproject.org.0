Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671F9B1D9F3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 16:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073141.1436062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1ba-0001i1-S5; Thu, 07 Aug 2025 14:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073141.1436062; Thu, 07 Aug 2025 14:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1ba-0001fd-Oi; Thu, 07 Aug 2025 14:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1073141;
 Thu, 07 Aug 2025 14:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk1bZ-0001fX-6z
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 14:28:29 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c655db7e-739a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 16:28:24 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af96d097df5so207306566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 07:28:24 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm1284455566b.101.2025.08.07.07.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 07:28:22 -0700 (PDT)
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
X-Inumbo-ID: c655db7e-739a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754576903; x=1755181703; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyHZDkliw5yShmO7mXh5tF1sO80g4mQYOybYvWhl1Zw=;
        b=cmyo5YDbYWjM6sEf295U4gHYW58TI7JdV9I8jhRFeKlkxLgx9q0dIdo0yZvNTlOEBs
         eTcK0um6bnyKgVF7DdfZ+AiaTmDGe0NkmpteLuXaO3H65HxPG1KJbr+Z9DGpLf0FC/7S
         DY69o+5Cfz6jc77Vh3u3DA+LpZmfOxXeum1MvzHFZmybJcOGBsdGWIRh47r/HTSRRvHV
         5oITCBW9hP17Ft4p3uJtJ+ozBdQMeDuFDr5NnUQSctxYqNaGZ6Dn0eV0SHIV9jO+tdtn
         pVFo00g2hrlL7xuOuu2JKyQxnLEXwhIoPzN7Cg2rSgB9K9wN5ZrB555MBOEtKImmXYvu
         imrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754576903; x=1755181703;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyHZDkliw5yShmO7mXh5tF1sO80g4mQYOybYvWhl1Zw=;
        b=pZx/G1K20mc+FdFxpxn49flafhCOPLdTFzTw84+fTNXV7FAN3bz9loGIye85WhJpe1
         GkciNC3yVRdbCLzOMSoS+L63tGs1M7WNWs7WmXvxPAqOCt8/EexN9ifiDaMEpSbwr+x1
         2mvyZ03jKGjD+KqtSPi+UyMJN5UstOlFmv9fyBKEc3qdrQvci0edUMrWARsQMcyrdk5g
         dKfD9+oaWnGEkGCQ5EC1xkETJszPy1c/GHD/dypV7hCtgVA8ov98z07puhw34k48VeYB
         rwUJUVFyug98HaHk8aQmO64yhf5zZ36ya1T/Qh2YPHosD0sKJMptiVq7TSpBq+/uHJvl
         3Ckw==
X-Forwarded-Encrypted: i=1; AJvYcCVWXWcQAOaXgF+EqytVJ9+gG0gjhSagorQc718BHVP2MnaiV7I6+Q0/wqcrdLNUgz37DnfTYYgc2a0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY0vUCHsxin6hh+lttIFDJ/0CnSv61MEofn9CAX7JCHJ7AFARW
	Q7aX+rzK/cL7brOXXJF8Tlbky4SBDrqboGUuNjZ5yJ30cpeXJy0MypIT
X-Gm-Gg: ASbGncsCjc01w0CMVY/or9uPT0z3LQAUBBiXwRSy26tFNBn2vvcpE6TrA4Ko8HmLDmx
	PY4FeSFz1VSJTPMUSFG8c7hRiZEPjB8V0Hnrn/k3HIEeE7cZX7V3gIee3emVInjw7QHiGdgVLin
	xSwcebO6j0I2nSusvxc0izxvVBcVtEjYE3xZuZc0qrnPv7XgbAbrWa5+AU0XTx74dcpVr1JM7o0
	ywRSDseoCmF3DOmWWg/MbhwjxaXk4a5sxSmpZDnu/akFwmkP9ztJkm9jns8eiG3LwZKVH8HerVu
	BcS5wwzA9JzYkJDLWxfc3aVbiCY9cJz144y23dOcFokeJOchyPElT7Jtk8S1U9l/JPryYQjdgZX
	c+SAhp0WYF4kHdU8H6HJER/gJf3usdtq8hCkPU214+zPKYFkT0Mn52YwsK3oYToSTg53/4q8=
X-Google-Smtp-Source: AGHT+IF2U/UvKp0sogEO2ZogBOafuvKBc5yqwJ8k8iTC+xrPrDiqZN2aDcXUIeupJwx0u0bCdf2i2g==
X-Received: by 2002:a17:906:f5aa:b0:aeb:fc49:3f56 with SMTP id a640c23a62f3a-af9900788c6mr740296966b.15.1754576903076;
        Thu, 07 Aug 2025 07:28:23 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Q5V8Rsyu7TwJ3uZXcu2Ct4XT"
Message-ID: <5b604ac0-c832-496f-85b4-6261cbe06fcd@gmail.com>
Date: Thu, 7 Aug 2025 16:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] xen/domain: introduce common emulation flags
To: dmkhn@proton.me, Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-2-dmukhin@ford.com>
 <f2be5a00-63e6-489d-a26a-7d48d6ae41ad@suse.com> <aJFWQByvktADgYKu@kraken>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aJFWQByvktADgYKu@kraken>

This is a multi-part message in MIME format.
--------------Q5V8Rsyu7TwJ3uZXcu2Ct4XT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/25 2:54 AM, dmkhn@proton.me wrote:
> + Cc: Oleskii
>
> On Mon, Aug 04, 2025 at 11:46:36AM +0200, Jan Beulich wrote:
>> On 31.07.2025 21:21,dmkhn@proton.me wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -652,6 +652,8 @@ struct domain
>>>       unsigned int *llc_colors;
>>>   #endif
>>>
>>> +    uint32_t emulation_flags;
>> Just one further remark: The field probably never should have been of this
>> type; unsigned int will do, and imo will want switching to while the field
>> is being moved. (Before giving an x86 ack, I want to convince myself though
>> that this is moving us in the right direction.)
> Hi Jan,
>
> I can definitely use different mechanism for virt ns16550: add a new field in
> xen_arch_domainconfig. That will also simplify some of the emulation_flags
> checks on x86 and will be more flexible wrt emulator configuration (e.g. I can
> allow passing I/O ports ranges).
>
> Hi Arm/RISC-V maintainers,
>
> Do you foresee any need in bubbling up emulation_flags to the common `struct
> domain`?

At the moment, in RISC-V's downstream branches emulation_flags isn't used. And,
for now, I am not really sure that it's going to be used in the nearest future.

~ Oleksii

--------------Q5V8Rsyu7TwJ3uZXcu2Ct4XT
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
    <div class="moz-cite-prefix">On 8/5/25 2:54 AM, <a class="moz-txt-link-abbreviated" href="mailto:dmkhn@proton.me">dmkhn@proton.me</a>
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aJFWQByvktADgYKu@kraken">
      <pre wrap="" class="moz-quote-pre">+ Cc: Oleskii

On Mon, Aug 04, 2025 at 11:46:36AM +0200, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 31.07.2025 21:21, <a class="moz-txt-link-abbreviated" href="mailto:dmkhn@proton.me">dmkhn@proton.me</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -652,6 +652,8 @@ struct domain
     unsigned int *llc_colors;
 #endif

+    uint32_t emulation_flags;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Just one further remark: The field probably never should have been of this
type; unsigned int will do, and imo will want switching to while the field
is being moved. (Before giving an x86 ack, I want to convince myself though
that this is moving us in the right direction.)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hi Jan,

I can definitely use different mechanism for virt ns16550: add a new field in
xen_arch_domainconfig. That will also simplify some of the emulation_flags
checks on x86 and will be more flexible wrt emulator configuration (e.g. I can
allow passing I/O ports ranges).

Hi Arm/RISC-V maintainers,

Do you foresee any need in bubbling up emulation_flags to the common `struct
domain`?
</pre>
    </blockquote>
    <pre>At the moment, in RISC-V's downstream branches emulation_flags isn't used. And,
for now, I am not really sure that it's going to be used in the nearest future.

~ Oleksii</pre>
  </body>
</html>

--------------Q5V8Rsyu7TwJ3uZXcu2Ct4XT--

