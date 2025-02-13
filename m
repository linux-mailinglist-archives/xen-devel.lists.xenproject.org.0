Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D90A34F40
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 21:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888018.1297434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tifeR-0003De-QR; Thu, 13 Feb 2025 20:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888018.1297434; Thu, 13 Feb 2025 20:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tifeR-0003Bu-Nu; Thu, 13 Feb 2025 20:17:35 +0000
Received: by outflank-mailman (input) for mailman id 888018;
 Thu, 13 Feb 2025 20:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=horU=VE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tifeQ-0003Bo-VI
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 20:17:35 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f3b5816-ea47-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 21:17:34 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-308eebd4938so12938871fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 12:17:34 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309102bb8b1sm2891741fa.108.2025.02.13.12.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 12:17:32 -0800 (PST)
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
X-Inumbo-ID: 8f3b5816-ea47-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739477853; x=1740082653; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gX52Am58shGyvGb31h+gPjQAdGtzrmJAS4WPb4sMdCE=;
        b=Z9WGzZTN6Q20wuL6X+iqaj8Y32J8jvAZl96OS/YzuJ1Ze/3ACiwkXvq0fGURf+godN
         nSGxOFLQuOKDKQrwJZtYDuIYmpdAljsVwtOdOc4GwDAPoqwnxGsw5K2r4Ccz+bKB3u28
         ifLzXzEhR5WVWM9ZdoV7nq1MAS9myluVAK8px4AQTgdBy0UzeMEAyfI+KPxTEOF5BybA
         J+35jjGMCk/wqZKlWhmMAvn27zZQstrRuqGreyVsBnwgoZOnEmKlX1eISQnPPd8Y3pOn
         1t9fV760NwW7PunDdFtrKnezcKygzrOrBaxYRCgbrY8rFOcv/6MOYLh22/qefBiNakF6
         cS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739477853; x=1740082653;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gX52Am58shGyvGb31h+gPjQAdGtzrmJAS4WPb4sMdCE=;
        b=jBSKoOHcrgjkUOLn/nRCcjCi9pJVNdKLzy2dPtLe/0DRzBeBkrMpFoALwW2BivDYke
         IN9xVb9cBanbNyxoWoArchfbVjrL0hL8MtVMibyZNwsDxpF0tdO8iXAM+5+avDZex2iY
         wTbHA5t/OuWQq/dEglKt5U4RaylKAKsPJeVHRcUrbaZ+PhR5gTAZlMpbjmbq+i4sfvzR
         MLEU5vKwZJMWvRWM/UZE5inkDPIrIfOWUsy1Mp8t74d2TBqYapCPNRZ9cSl0YDd0TMd6
         LH4REO2Zdjs9oz2Cy/LpawzHTJc4JbcLG8RZCAZVKGos6qK931Ph8uzIfQ4AC5/28xmo
         5ajw==
X-Forwarded-Encrypted: i=1; AJvYcCWzm4/83iG0usj9MybgV3yFe+pB+CUKtWF2uobdQX93FyxtzxOumyWhLW6YYJnr9o6tTQMtCYReHAs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyXDsoxEhrfGNVoXDKHIjrl2GDRfKIWTv2n3tAqvF/7cRIH43Q
	DqPs6Paedrph6GJF7obKiURdQq88H4LQBNY/xPXQmV0LSHlcP9t5ChSckA==
X-Gm-Gg: ASbGncvV7iO/tcUnPsTqRPI5RjoqdKrfC717RmTq5vyzlFdTaeB26UXTY0YPytHeO/K
	h15OFq5ldjXVylzb7kUYtRfBWNMYaOpdJCPEey9XuQK2hBKnG2hpFXXvpF+8AMnUZZY0zXan0tQ
	j7iELdpQzH2KB1XPsQWRdnGbvmY3C42jV2N7CHJsCinLCHduLXYEreQKtUMNKZgTMejBU8VnIZz
	MkLLrf5JH2v/io3YXJi2tm05pSUZfWdSgDK8bsxAVLw/3fQhKiB/Grm9dY9XyLM4aIoWl28fBEl
	ycZjbA2Cc8hvawyDtXyVVSExku8=
X-Google-Smtp-Source: AGHT+IHs34Ub59sAYv1wVtI/9EmIPI7OMUoWiDT210r1u7zc3svcejEwWGKxvy1TH7IYgVK1pXVjRg==
X-Received: by 2002:a2e:bc84:0:b0:308:ffa1:8915 with SMTP id 38308e7fff4ca-309037ac73fmr28298641fa.5.1739477853029;
        Thu, 13 Feb 2025 12:17:33 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------aHSA0egpD0kiyIM3PG0748PO"
Message-ID: <d75455fe-f588-4389-9ac2-a3004189adaf@gmail.com>
Date: Thu, 13 Feb 2025 21:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix build with CONFIG_HVM=n and -Og
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250213185055.711703-1-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250213185055.711703-1-stewart.hildebrand@amd.com>

This is a multi-part message in MIME format.
--------------aHSA0egpD0kiyIM3PG0748PO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/13/25 7:50 PM, Stewart Hildebrand wrote:
> When building with CONFIG_HVM=n and -Og, we encounter:
>
> prelink.o: in function `pit_set_gate':
> xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'
>
> Add an IS_ENABLED(CONFIG_HVM) check to assist with dead code
> elimination.
>
> Fixes: 14f42af3f52d ("x86/vPIT: account for "counter stopped" time")
> Signed-off-by: Stewart Hildebrand<stewart.hildebrand@amd.com>

With proper review:
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

> ---
>   xen/arch/x86/emul-i8254.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
> index 144aa168a3f0..7bc4b31b2894 100644
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -191,7 +191,7 @@ static void pit_set_gate(PITState *pit, int channel, int val)
>           case 3:
>           case 4:
>               /* Disable counting. */
> -            if ( !channel )
> +            if ( IS_ENABLED(CONFIG_HVM) && !channel )
>                   destroy_periodic_time(&pit->pt0);
>               pit->count_stop_time[channel] = get_guest_time(v);
>               break;
>
> base-commit: b5b2f9877a8777af6b78944407527e0a450389a2
--------------aHSA0egpD0kiyIM3PG0748PO
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
    <div class="moz-cite-prefix">On 2/13/25 7:50 PM, Stewart Hildebrand
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250213185055.711703-1-stewart.hildebrand@amd.com">
      <pre wrap="" class="moz-quote-pre">When building with CONFIG_HVM=n and -Og, we encounter:

prelink.o: in function `pit_set_gate':
xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'

Add an IS_ENABLED(CONFIG_HVM) check to assist with dead code
elimination.

Fixes: 14f42af3f52d ("x86/vPIT: account for "counter stopped" time")
Signed-off-by: Stewart Hildebrand <a class="moz-txt-link-rfc2396E" href="mailto:stewart.hildebrand@amd.com">&lt;stewart.hildebrand@amd.com&gt;</a></pre>
    </blockquote>
    <pre>With proper review:
  Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250213185055.711703-1-stewart.hildebrand@amd.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/x86/emul-i8254.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 144aa168a3f0..7bc4b31b2894 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -191,7 +191,7 @@ static void pit_set_gate(PITState *pit, int channel, int val)
         case 3:
         case 4:
             /* Disable counting. */
-            if ( !channel )
+            if ( IS_ENABLED(CONFIG_HVM) &amp;&amp; !channel )
                 destroy_periodic_time(&amp;pit-&gt;pt0);
             pit-&gt;count_stop_time[channel] = get_guest_time(v);
             break;

base-commit: b5b2f9877a8777af6b78944407527e0a450389a2
</pre>
    </blockquote>
  </body>
</html>

--------------aHSA0egpD0kiyIM3PG0748PO--

