Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65106B0DB08
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 15:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052648.1421395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDCc-00008a-VV; Tue, 22 Jul 2025 13:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052648.1421395; Tue, 22 Jul 2025 13:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDCc-00005D-S1; Tue, 22 Jul 2025 13:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1052648;
 Tue, 22 Jul 2025 13:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNGt=2D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ueDCb-000057-9W
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 13:38:41 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3e92de-6701-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 15:38:38 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60707b740a6so7871388a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 06:38:38 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f36fb0sm6904138a12.21.2025.07.22.06.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 06:38:37 -0700 (PDT)
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
X-Inumbo-ID: 2c3e92de-6701-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753191518; x=1753796318; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5geEAXflaxtUemHK44HwTEep0NQfe9bdvgMgiThk4zQ=;
        b=kjmAePVnolIxxEj18ogiK0Xh0zW2N58p/JGMrF3nrqMmY4UNrIhbVcXbtCO/BKWCyB
         KSqGs/F5SHuaweRf9gFcCqaAwPyd3RcHTwMyK3zLBe+FYKnYYHpX5rprF8z1T4Q6/Quy
         vxeiiyKEIStUn2tVEsguW+0xz2nL2yWVltptYfRvXZi8AX6SkddYeVtzNclvNocKtxog
         3kAp3Fp6n4NxggAMn58gOh8Xs8vDyiGZp2hnBeeWBod/bO2hr90gVJJJAAyBrn72JBZh
         qjnBHRV7IRylijIE7twala6ao49UQ602RS6wF6lgoDvu7muZproG7MA2G/NuU2jlwJGP
         wQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753191518; x=1753796318;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5geEAXflaxtUemHK44HwTEep0NQfe9bdvgMgiThk4zQ=;
        b=VRloJWwDUNZ8l9habsgvbMX9Ca9di3KYxiGmch55nRk/y1VhbxpPNYAOvJGHPxps6J
         5vNPQTissEmJVf9XrU9K/7arSDCO+wsCE7fh3G6BcsLS4ClGIb3H3HkzXuzsacKMRtHt
         OQ6bvScW7DZ5WjKzldRZddxBiMI4IabIfBOhiz2OEkCGe4GYkiG8wVroArgguq6uqWeX
         Ac/0UXFJWHejXdM7Rf512Imm5WDka7awu0cikAHAZXBF3LW7GA2iJmwrCcnNX0JFejJ0
         GDGx9eHRXXBaK2QSKbABQ4LGC3jzGfs+mFdBb0nCe486oUzfZnpvj6JiTOEUay/HO3de
         hcmA==
X-Forwarded-Encrypted: i=1; AJvYcCXScdZhy42jUPewnCjMvIKZHDmIECtitRWAmGj0xCyyih66X1YdhdU3LrGqAfsfxvJ16zob1O5O0kc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfH7S6rWILI3MCvhQNxuv1C41DMmXcfA9FZLB6jWQSX5m0oK8i
	oSCADXBjwWpr/PA+rjI3ax5GN42Xr4ydUinDTpmoLj4IN5XSuWxsKIjz
X-Gm-Gg: ASbGncvKzkOIAUaKbd7rEgHNRt0pC3V4tO3ZFcIjnHBFJf5Dx0SRh9xJ6ZlB+3mAh9v
	yIwmpSRr/eXn9Qt5Dt9phx2kaiSvfhHFZz8RyTlo+yTyQ9LmbxferWL6gdJlxufJhFs86P+ninw
	BlKiry/vG7E8cAzhtqkOg3WLtve5m6H83vc6XdOVKEWiH2L+nEZrz+eaeMve40UsWxibDfzvHdB
	928jojtIvfjqU6hfL9C4wykE/AWdYQkKIZzvTHEniXs1C3TRNwap3T/foPyoUQoaUtr1KRsA0N3
	qI1WSI9HqG0KOi648s2iWxdvGuLE+Y+Ek56by2yZwfJk6dteKU42NxCFnQy/LkVPQ1UxwOjyU/6
	QJXJxilVS474jTLHOkY9D5PCfJOzpt/ALV1g8oEK6OS88Cb3q03AfJ2PrTk2k1AjFqoY/RlK3f2
	QMBXGM9A==
X-Google-Smtp-Source: AGHT+IG6RWnA79Aj1zwlvlxdx5XdKYct1dBAem7sMdDVvYBcUUen/r6yoRvgN9YvdDCyez2BgrwI7Q==
X-Received: by 2002:a05:6402:5247:b0:612:b723:8826 with SMTP id 4fb4d7f45d1cf-612b7238937mr14595992a12.24.1753191517509;
        Tue, 22 Jul 2025 06:38:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------XkFrAfUgtyg7Qkxb5LCxV97E"
Message-ID: <bf61c9c1-566f-4488-a4ad-d2548c240fbb@gmail.com>
Date: Tue, 22 Jul 2025 15:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
 <133e13bc-39a9-4691-b383-8c62c2775c01@gmail.com>
 <cd9c57e9-55e8-4663-8e15-b22619a3abf5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cd9c57e9-55e8-4663-8e15-b22619a3abf5@suse.com>

This is a multi-part message in MIME format.
--------------XkFrAfUgtyg7Qkxb5LCxV97E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/21/25 3:42 PM, Jan Beulich wrote:
> On 18.07.2025 16:49, Oleksii Kurochko wrote:
>> On 7/2/25 12:09 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> Implement the mfn_valid() macro to verify whether a given MFN is valid by
>>>> checking that it falls within the range [start_page, max_page).
>>>> These bounds are initialized based on the start and end addresses of RAM.
>>>>
>>>> As part of this patch, start_page is introduced and initialized with the
>>>> PFN of the first RAM page.
>>>>
>>>> Also, after providing a non-stub implementation of the mfn_valid() macro,
>>>> the following compilation errors started to occur:
>>>>     riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
>>>>     /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
>>>>     riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
>>>>     /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
>>>>     riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>>>>     /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
>>>>     riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
>>>>     riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
>>>>     /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
>>>>     riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
>>>>     riscv64-linux-gnu-ld: final link failed: bad value
>>>>     make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
>>>> To resolve these errors, the following functions have also been introduced,
>>>> based on their Arm counterparts:
>>>> - page_get_owner_and_reference() and its variant to safely acquire a
>>>>     reference to a page and retrieve its owner.
>>>> - put_page() and put_page_nr() to release page references and free the page
>>>>     when the count drops to zero.
>>>>     For put_page_nr(), code related to static memory configuration is wrapped
>>>>     with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
>>>>     common code. Therefore, PGC_static and free_domstatic_page() are not
>>>>     introduced for RISC-V. However, since this configuration could be useful
>>>>     in the future, the relevant code is retained and conditionally compiled.
>>>> - A stub for page_is_ram_type() that currently always returns 0 and asserts
>>>>     unreachable, as RAM type checking is not yet implemented.
>>> How does this end up working when common code references the function?
>> Based on the following commit message:
>>       Callers are VT-d (so x86 specific) and various bits of page offlining
>>       support, which although it looks generic (and is in xen/common) does
>>       things like diving into page_info->count_info which is not generic.
>>       
>>       In any case on this is only reachable via XEN_SYSCTL_page_offline_op,
>>       which clearly shouldn't be called on ARM just yet.
> What commit message are you talking about? Nothing like the above is anywhere
> in this patch.

It's pretty old commit:
   commit 214c4cd94a80bcaf042f25158eaa7d0e5bbc3b5b
   Author: Ian Campbell<ian.campbell@citrix.com>
   Date:   Wed Dec 19 14:16:23 2012 +0000

But since that time page_is_ram_type() hasn't been changed for Arm.

>
>> There is no callers for page_is_ram_type() for Arm now, and I expect something similar
>> for RISC-V. As we don't even introduce hypercalls for RISC-V, we can just live
>> without it.
> If there's no caller, why the stub?

Because that parts of common code which are using it aren't under ifdef, for example, this
one function:
   int offline_page(mfn_t mfn, int broken, uint32_t *status)

And specifically this function is called when XEN_SYSCTL_page_offline_op is handled.

But I agree that it seems like nothing prevents to call XEN_SYSCTL_page_offline_op.

~ Oleksii

--------------XkFrAfUgtyg7Qkxb5LCxV97E
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
    <div class="moz-cite-prefix">On 7/21/25 3:42 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cd9c57e9-55e8-4663-8e15-b22619a3abf5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 18.07.2025 16:49, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/2/25 12:09 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Implement the mfn_valid() macro to verify whether a given MFN is valid by
checking that it falls within the range [start_page, max_page).
These bounds are initialized based on the start and end addresses of RAM.

As part of this patch, start_page is introduced and initialized with the
PFN of the first RAM page.

Also, after providing a non-stub implementation of the mfn_valid() macro,
the following compilation errors started to occur:
   riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
   /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
   riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
   /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
   riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
   /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
   riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
   riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
   /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
   riscv64-linux-gnu-ld: final link failed: bad value
   make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
To resolve these errors, the following functions have also been introduced,
based on their Arm counterparts:
- page_get_owner_and_reference() and its variant to safely acquire a
   reference to a page and retrieve its owner.
- put_page() and put_page_nr() to release page references and free the page
   when the count drops to zero.
   For put_page_nr(), code related to static memory configuration is wrapped
   with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
   common code. Therefore, PGC_static and free_domstatic_page() are not
   introduced for RISC-V. However, since this configuration could be useful
   in the future, the relevant code is retained and conditionally compiled.
- A stub for page_is_ram_type() that currently always returns 0 and asserts
   unreachable, as RAM type checking is not yet implemented.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">How does this end up working when common code references the function?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Based on the following commit message:
     Callers are VT-d (so x86 specific) and various bits of page offlining
     support, which although it looks generic (and is in xen/common) does
     things like diving into page_info-&gt;count_info which is not generic.
     
     In any case on this is only reachable via XEN_SYSCTL_page_offline_op,
     which clearly shouldn't be called on ARM just yet.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What commit message are you talking about? Nothing like the above is anywhere
in this patch.</pre>
    </blockquote>
    <pre>It's pretty old commit:
  commit 214c4cd94a80bcaf042f25158eaa7d0e5bbc3b5b
  Author: Ian Campbell <a class="moz-txt-link-rfc2396E" href="mailto:ian.campbell@citrix.com">&lt;ian.campbell@citrix.com&gt;</a>
  Date:   Wed Dec 19 14:16:23 2012 +0000

But since that time page_is_ram_type() hasn't been changed for Arm.

</pre>
    <blockquote type="cite"
      cite="mid:cd9c57e9-55e8-4663-8e15-b22619a3abf5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">There is no callers for page_is_ram_type() for Arm now, and I expect something similar
for RISC-V. As we don't even introduce hypercalls for RISC-V, we can just live
without it.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If there's no caller, why the stub?</pre>
    </blockquote>
    <pre>Because that parts of common code which are using it aren't under ifdef, for example, this
one function:
  int offline_page(mfn_t mfn, int broken, uint32_t *status)
</pre>
    <pre>And specifically this function is called when XEN_SYSCTL_page_offline_op is handled.

But I agree that it seems like nothing prevents to call XEN_SYSCTL_page_offline_op.

~ Oleksii
</pre>
  </body>
</html>

--------------XkFrAfUgtyg7Qkxb5LCxV97E--

