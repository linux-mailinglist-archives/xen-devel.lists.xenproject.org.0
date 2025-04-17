Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF0A9195F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 12:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957359.1350493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MX4-0002qx-F7; Thu, 17 Apr 2025 10:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957359.1350493; Thu, 17 Apr 2025 10:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MX4-0002p0-CZ; Thu, 17 Apr 2025 10:31:46 +0000
Received: by outflank-mailman (input) for mailman id 957359;
 Thu, 17 Apr 2025 10:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5MX3-0002ou-0w
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 10:31:45 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27d142d0-1b77-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 12:31:43 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so89147166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 03:31:43 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb682a7e81sm23498766b.68.2025.04.17.03.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 03:31:42 -0700 (PDT)
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
X-Inumbo-ID: 27d142d0-1b77-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744885902; x=1745490702; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZD866hPPvpIHOORCAo/z+NWDbdq3M9E/7/XIxPCvj0=;
        b=fSUyiI6DFzdxo5mUUK9Ndn/cPkKdVsCFsUUOTdBsJwnRQw7H3k4ItJoD3UeF9eHpxw
         eVDjesf6y0Kq7xxVxjFhlEoCC5lajCPjUf9QUaiywxf06LCsWzHG9a7TdKNE3aKyNxq2
         wabCcpIOF+WYpDyxzY81abvYlrLF+KSIvTVEnmuD6A9T2cfBh1zlekrUEnBZQrJ3oG59
         YSis0UR/nTQU3H2QePOk8HPeMZNcrgCEIeoJLi/LMZgKMfUBPSXDV+TvbOQirjypRizH
         Mp2eTTS9chTjMBGVA6IvQBPC6+DZi/nlz7TeTxnsRw7R62XFmzqLq6XYPCljo2s1WmwM
         V2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885903; x=1745490703;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZD866hPPvpIHOORCAo/z+NWDbdq3M9E/7/XIxPCvj0=;
        b=UP2WQITaLqS02YqjGaYJU+wx9z4XRfVlXHrnpK4lFk0ZuF/Bp7LSP3DkOYtnUAh7C4
         bFiSeNCdKtdTmUIVpX2y+4YM2CeDxESKq21a/LV3ZppzsZKIhzpWrjgHoCqBkhdjSM05
         B0vXF5EFcNULpQ1lneqMWamfPJYqeXDeuKq9ZoknulmnpqL0gPrzZSZ/LZZX9g9+voTR
         nC3AkGKnnPk9roCyIFaTOV12vk0ZI92eUFbZdne1f3YHebEbVIR/82z4RgCV0TBCAojQ
         pVhPIC31AW7lMiCbIeT7KtKRCA1eBErN6FwWb5ijfTAkSe4sdrZZm7yoCUhBXMxugXfd
         1n/A==
X-Forwarded-Encrypted: i=1; AJvYcCU5Rd2ta2kyBjTNYVVu675NL5sDb5pZAUqs6R2AHmLZtpqVHqOmkyvh7zEmIIr0d95/aJYSohf9+0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKQMxU5fR/K7D4WbiWkxAj21dbBZ/MdrrIzgq8StdupwQxeH15
	9VXaMyCOR1DABlLDCG2LtctGD9zELGMuokALovf6uRmJOlIrq0ZS
X-Gm-Gg: ASbGncu0QBVgJig26gp7TOBqfuQ0Af/ZRn1gdWBBHINO+YkvlidyIdMnL8KIVxcnQ2e
	yJMIIJBgs/M6W2kYxiNpaFh7LEH2Ih/MUcaf4RSP4Xvuj4RIHhna7uk0l/966EI2Oi3Y6RPfl0H
	nXtbjzdhnRCgK+qZP3jrHib2zGVIw9UspaHYt9jE+BgcshY9Ikp9RK0hPfO1JV0IXfrvxW+/9ft
	VWjJO5uHQlco2uZY2wlf8NOenkfli8JfcOr42QdrwvtjY3qIsBO5oV8v8HFNyk00nD4SOX4VDUp
	XwJ+gMAes5apBhMB6dD3kNN0jgEtExcUSXlPDIt7Ty7FQ0yYGv3FyYug/Nw1gk8k3Pxg4+XmKLY
	t37fQh41EWzOshz+q
X-Google-Smtp-Source: AGHT+IFxNif8IfO+mkb4k4lIKxd6bJ/NrRxJIBctPBqdIm6yxm0EjW7KquKNKOXY6aupEDxk2Z0DpQ==
X-Received: by 2002:a17:907:788:b0:aca:cb18:9ad0 with SMTP id a640c23a62f3a-acb42aeda26mr486931966b.45.1744885902394;
        Thu, 17 Apr 2025 03:31:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------xIhZXccIN8RvXdn3rwYPOpQZ"
Message-ID: <4c16e34b-10b1-4320-b031-e26a883426a0@gmail.com>
Date: Thu, 17 Apr 2025 12:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/14] xen/riscv: add basic UART support
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <3e96851da8751ac17cbf0cb5a649c0d86259460a.1744126720.git.oleksii.kurochko@gmail.com>
 <49889d22-55b6-4dd4-b497-13b50d19d607@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <49889d22-55b6-4dd4-b497-13b50d19d607@suse.com>

This is a multi-part message in MIME format.
--------------xIhZXccIN8RvXdn3rwYPOpQZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 6:03 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -4,11 +4,16 @@
>>   #include <xen/bug.h>
>>   #include <xen/bootfdt.h>
>>   #include <xen/compile.h>
>> +#include <xen/console.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>> +#include <xen/keyhandler.h>
> Why's this one needed?

It isn't needed anymore, just missed to drop.
I thought that it would be needed to test UART working fine by checking if Ctrl+AAA is working.

>
>>   #include <xen/mm.h>
>> +#include <xen/percpu.h>
>> +#include <xen/serial.h>
>>   #include <xen/shutdown.h>
>> +#include <xen/timer.h>
>>   #include <xen/vmap.h>
>>   #include <xen/xvmalloc.h>
>>   
>> @@ -73,6 +78,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       remove_identity_mapping();
>>   
>> +    percpu_init_areas();
> I'll trust you that it's needed now, but the addition looks unrelated here,
> and also isn't mentioned as intentional in the description.

I had  this patch when I used polling mode for UART, for this case percpu is used to receive
serial port info:
   struct serial_port *port = this_cpu(poll_port);

So percpu isn't really needed at the current development state. I'll drop this change or as an option
move to separate patch.

>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -3,7 +3,6 @@ config GENERIC_UART_INIT
>>   
>>   config HAS_NS16550
>>   	bool "NS16550 UART driver" if ARM
>> -	default n if RISCV
>>   	default y
> Just to double-check: Unlike Arm you don't want this to be user-(un)selectable
> on RISC-V?

Thanks for noticing that. I want to have this selectable by user. I will add RISC-V here.

~ Oleksii

--------------xIhZXccIN8RvXdn3rwYPOpQZ
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
    <div class="moz-cite-prefix">On 4/15/25 6:03 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:49889d22-55b6-4dd4-b497-13b50d19d607@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -4,11 +4,16 @@
 #include &lt;xen/bug.h&gt;
 #include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/compile.h&gt;
+#include &lt;xen/console.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/irq.h&gt;
+#include &lt;xen/keyhandler.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why's this one needed?</pre>
    </blockquote>
    <pre>It isn't needed anymore, just missed to drop.
I thought that it would be needed to test UART working fine by checking if Ctrl+AAA is working.

</pre>
    <blockquote type="cite"
      cite="mid:49889d22-55b6-4dd4-b497-13b50d19d607@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> #include &lt;xen/mm.h&gt;
+#include &lt;xen/percpu.h&gt;
+#include &lt;xen/serial.h&gt;
 #include &lt;xen/shutdown.h&gt;
+#include &lt;xen/timer.h&gt;
 #include &lt;xen/vmap.h&gt;
 #include &lt;xen/xvmalloc.h&gt;
 
@@ -73,6 +78,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     remove_identity_mapping();
 
+    percpu_init_areas();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'll trust you that it's needed now, but the addition looks unrelated here,
and also isn't mentioned as intentional in the description.</pre>
    </blockquote>
    <pre>I had  this patch when I used polling mode for UART, for this case percpu is used to receive
serial port info:
  struct serial_port *port = this_cpu(poll_port);

So percpu isn't really needed at the current development state. I'll drop this change or as an option
move to separate patch.

</pre>
    <blockquote type="cite"
      cite="mid:49889d22-55b6-4dd4-b497-13b50d19d607@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -3,7 +3,6 @@ config GENERIC_UART_INIT
 
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
-	default n if RISCV
 	default y
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Just to double-check: Unlike Arm you don't want this to be user-(un)selectable
on RISC-V?</pre>
    </blockquote>
    <pre>Thanks for noticing that. I want to have this selectable by user. I will add RISC-V here.

~ Oleksii
</pre>
  </body>
</html>

--------------xIhZXccIN8RvXdn3rwYPOpQZ--

