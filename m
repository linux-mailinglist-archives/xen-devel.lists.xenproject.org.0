Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B93BB1C52A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 13:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071661.1435081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcYN-0006dh-J9; Wed, 06 Aug 2025 11:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071661.1435081; Wed, 06 Aug 2025 11:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcYN-0006b6-GJ; Wed, 06 Aug 2025 11:43:31 +0000
Received: by outflank-mailman (input) for mailman id 1071661;
 Wed, 06 Aug 2025 11:43:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQb=2S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujcYL-0006az-Uw
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 11:43:29 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90b859a1-72ba-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 13:43:26 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af96d097df5so584632166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 04:43:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243619sm1086193566b.129.2025.08.06.04.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 04:43:25 -0700 (PDT)
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
X-Inumbo-ID: 90b859a1-72ba-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754480606; x=1755085406; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2z1NWy90MQrNOFtwH9d1P6c8Po8accG5whFQh+upgG8=;
        b=GWrKA+00Ipk+n4g8ztUvLYr6I4GS0L3mP8SAV6iiLzC0iktNL6kXPbp2XFT/b6UX/d
         efx+uYELGQtIDGgALX5FxbEqUGKKhiaBb3Ge2ho5HcjIYYSARawOyQEtnQZRUwkrikzU
         5+a8KM0FWpaE8AJ2OhymGQn4I6NSXxu7q072NPpFBP/tJoRzZZK1RGXyiL5kl+1cU0t/
         WHNJgYTSNJvF0v550L3tz98l/KZ7+G0R/JC+Y7x4z9QIse/Tprvg7YKSkNQmsMnOYHZD
         NLZ/m5WKWYUQjMLrMt2x0JmOXNarAdnnF6/Xz1QPEg9+w2ahNqjUcFngajeQVRGJXiwD
         557g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480606; x=1755085406;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2z1NWy90MQrNOFtwH9d1P6c8Po8accG5whFQh+upgG8=;
        b=DxDeWfKVvEuiuk1dVQtWfKJzi786NPBGE3L/EvIzIUB+Mh7H2AWxEe1YOkBBndhqxV
         MtpBUpYcQ3a0l7oJ0fyiPwCxlG5Z+jxv/PI8kDOJHlC8Yh1HitEVeToKVGFXePzJMzAU
         hoElnQ+0b2sSEitimyYbA7vUl320x+iJbpsd9cX8tdkIdcHfxkDQ6d5JIxMwactnvYlG
         z7A1fNtt1sCbPU/5TNC8vI2437RjqPHOtTz4XKogc6v7Y1QNsRAVrV5j6okWgku8nZjz
         cuTydCXdiWa0DT1Hrgld1Pzwz+ABdNZ5lmSM3+BpsDxzelBuqvPOc4XLjcqpqtilF3Rt
         FMWA==
X-Forwarded-Encrypted: i=1; AJvYcCV+byJ2itTUEDp/9vUOrbyR/LdcQJBlOsNKP6ocvxvE0qIrk0oFdVdTGlTMaPg/spXda7oKnaZl1HY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvApIPQMuhScbHsRs94tZsUuiY5yVKI2IBrYdvvD+hzqR7KumV
	LdlYhBixqMHfA0gjqxk/T1vSryz+ACVU36PE7gbOCMWRNmR0Z6wcoyCW
X-Gm-Gg: ASbGnctX5ACpyuKvNh3zPUbzWn0G/m+VQ9dM1sJVNfYoKEBodsOv3v7oTCh046QRzXZ
	8khuEE0RNd4VgaJvrNSHSoTk4oYgxp0I0J6xT7E546J+4q/qQLLW7IqSqtQH589eR53BDGSdSzM
	ezqT3eWiRS14oal8JDn2rS/nhv24BN7GOxYDzhcxh0bhSjvObae6cIj9z45UoqXlj0DWjynSe+6
	gJB9N04WOWJKHVa2zTf8OOyhylv859rNDy3i5Kphlv0C65KnFqbw057U+WZ4v137/IQuykO8TaE
	f1qPZ1kdKQNvA8gMB5sUAvcdIsyCGn/eJk8M6OcC0bfBCZquKbxR1Y6nNo/oZj5u0Pj/oZXVTJ7
	1mJfhqoBvf5Zm7ovIpLTrNtzbmlc3tyL62jCbF+aQ9tGg0U9qVE/moNyRyFeNA1AjVC3KXek=
X-Google-Smtp-Source: AGHT+IG1/UAKD89XEg9V3ghefhO37V5l9WrE5rh5jTYb7KtSbJvU+JTj1WEmrPl1QAgaVozJXHLyhQ==
X-Received: by 2002:a17:907:7b9d:b0:af9:34de:e4a1 with SMTP id a640c23a62f3a-af9902e4aacmr251430366b.33.1754480605822;
        Wed, 06 Aug 2025 04:43:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------kFn1ez3xxd0GXSXEdwVb3pDl"
Message-ID: <3bcb1402-37ba-4982-889d-9d1f58bce691@gmail.com>
Date: Wed, 6 Aug 2025 13:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/20] xen/riscv: introduce things necessary for p2m
 initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <c526512aeda09527421e2d60bac7955a8c7c7c56.1753973161.git.oleksii.kurochko@gmail.com>
 <cff0fc63-f5f6-464e-b738-0de03661084a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cff0fc63-f5f6-464e-b738-0de03661084a@suse.com>

This is a multi-part message in MIME format.
--------------kFn1ez3xxd0GXSXEdwVb3pDl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/4/25 5:53 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -3,11 +3,45 @@
>>   #define ASM__RISCV__P2M_H
>>   
>>   #include <xen/errno.h>
>> +#include <xen/mm.h>
>> +#include <xen/rwlock.h>
>> +#include <xen/types.h>
>>   
>>   #include <asm/page-bits.h>
>>   
>>   #define paddr_bits PADDR_BITS
>>   
>> +/* Get host p2m table */
>> +#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
>> +
>> +/* Per-p2m-table state */
>> +struct p2m_domain {
>> +    /*
>> +     * Lock that protects updates to the p2m.
>> +     */
>> +    rwlock_t lock;
>> +
>> +    /* Pages used to construct the p2m */
>> +    struct page_list_head pages;
>> +
>> +    /* Indicate if it is required to clean the cache when writing an entry */
>> +    bool clean_pte;
> I'm a little puzzled by this field still being here, despite the extensive
> revlog commentary. If you really feel you need to keep it, please ...

I think still it could be useful to have clean_pte, but likely not in this patch.
I will move an introduction of it to one of the next patch where it is started
really to be used.

>
>> +    /* Back pointer to domain */
>> +    struct domain *domain;
>> +
>> +    /*
>> +     * P2M updates may required TLBs to be flushed (invalidated).
>> +     *
>> +     * Flushes may be deferred by setting 'need_flush' and then flushing
>> +     * when the p2m write lock is released.
>> +     *
>> +     * If an immediate flush is required (e.g, if a super page is
>> +     * shattered), call p2m_tlb_flush_sync().
>> +     */
>> +    bool need_flush;
> ... group booleans together, for better packing.

I will take that into account. Thanks.

~ Oleksii

--------------kFn1ez3xxd0GXSXEdwVb3pDl
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
    <div class="moz-cite-prefix">On 8/4/25 5:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cff0fc63-f5f6-464e-b738-0de03661084a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,11 +3,45 @@
 #define ASM__RISCV__P2M_H
 
 #include &lt;xen/errno.h&gt;
+#include &lt;xen/mm.h&gt;
+#include &lt;xen/rwlock.h&gt;
+#include &lt;xen/types.h&gt;
 
 #include &lt;asm/page-bits.h&gt;
 
 #define paddr_bits PADDR_BITS
 
+/* Get host p2m table */
+#define p2m_get_hostp2m(d) (&amp;(d)-&gt;arch.p2m)
+
+/* Per-p2m-table state */
+struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Indicate if it is required to clean the cache when writing an entry */
+    bool clean_pte;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm a little puzzled by this field still being here, despite the extensive
revlog commentary. If you really feel you need to keep it, please ...</pre>
    </blockquote>
    <pre>I think still it could be useful to have clean_pte, but likely not in this patch.
I will move an introduction of it to one of the next patch where it is started
really to be used.

</pre>
    <blockquote type="cite"
      cite="mid:cff0fc63-f5f6-464e-b738-0de03661084a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Back pointer to domain */
+    struct domain *domain;
+
+    /*
+     * P2M updates may required TLBs to be flushed (invalidated).
+     *
+     * Flushes may be deferred by setting 'need_flush' and then flushing
+     * when the p2m write lock is released.
+     *
+     * If an immediate flush is required (e.g, if a super page is
+     * shattered), call p2m_tlb_flush_sync().
+     */
+    bool need_flush;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... group booleans together, for better packing.</pre>
    </blockquote>
    <pre>I will take that into account. Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------kFn1ez3xxd0GXSXEdwVb3pDl--

