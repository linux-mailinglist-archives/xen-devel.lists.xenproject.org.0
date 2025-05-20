Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13800ABD788
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 13:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990689.1374628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLbW-0006qF-AF; Tue, 20 May 2025 11:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990689.1374628; Tue, 20 May 2025 11:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLbW-0006nb-6l; Tue, 20 May 2025 11:57:54 +0000
Received: by outflank-mailman (input) for mailman id 990689;
 Tue, 20 May 2025 11:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHLbU-0006Na-Mt
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 11:57:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a86840cf-3571-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 13:57:52 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6021b8b2c5fso566262a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 04:57:52 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d438c3csm714514766b.88.2025.05.20.04.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 04:57:51 -0700 (PDT)
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
X-Inumbo-ID: a86840cf-3571-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747742272; x=1748347072; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcRo7hM/qL07m0qM3hsPwDo4G3dgTyKl9/oWDlAmqBs=;
        b=nhXaJiXJ3Ybe2Id8Nnc/fAEjJ/PLA9ZM3tivcBIqx/dN6pwg0o1xas3ODlUKq54Gg/
         Q6+hxW9hOTey2oLq0HGdCeGwKdEssNUQCRevlqqLHYTBq7vxMsXM/1Mli6pJlqdHR9RF
         +dNGXgWB2/fJt1OQ5/hqTGTzbj0ZLyP7PjKadVjtAppWSo+df4PQqoRLB6Dmrru1S3mI
         E3MDJK7DKF/9ZcsvCk2LTGJ8FfnXngTBH/3NxrEjN+Ky55f2+43K9KscDgb/fridKaYo
         8XauiWRmF4Zbqd0My/AnVVZIs24l4hq+HHbVLafd1qbGL8PluReUyFCMklaudmkio3t4
         /XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747742272; x=1748347072;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcRo7hM/qL07m0qM3hsPwDo4G3dgTyKl9/oWDlAmqBs=;
        b=GeNpgjGPVVXNDS0RzrLyxm0hI9+VnLPt/Ey1osCvX/YO+0fLRuQ5gmi9LZYTeay6qF
         ecPJEM64332ISAqXOxzhTcOnbtA68R9Ghc5sxXfYbZEPv/3FifjwTHMoX6FLNLluVYmk
         GP3cPJhFnHCL0TAfQuteQH/4uY6G6D/NVq6NRXFH0HqanbmgJf14ye97xymuEndr+WhP
         NOQ6H1E+EGYo7d7fsZ1I9j9zWindl8LMUSwSiXb6t3pKj4p8+T8iNvGqVHBZTC7eMmOk
         QFC3WNDSFHjOZ/EUC7WoSQ40dM/4KTSq2pyNiaKynUYtcqiUIeE6RSe10Z8WpGDbqZS6
         q+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVGfB60G73jTS95BOZXFz2fvhGjxQT7NGs5PDFnWLCiovqXeac9NHRSr7LfjVE4dWg5CRbR8ZvajxQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2mh9N50bmPgBQcSJA66wk1S6pQlOE1Ztp6MxZHyMvy+OWED52
	sk48i43U7fhwKrflHiicbnbEQ+/nCqA0cwyy3TxyFmjpOV6+a6w7j5Dr
X-Gm-Gg: ASbGncvts7J6WnlMYUacSwr8ekBAMDq7bsuVuMc6p23Wesv1mfO8+wA0euObj4L7xQD
	yOv6X3b/0BoQgupRFBKujVIzgUe9fvOn9SGtkAA7SyNBONuY7cGG2BUL7Fe7MUf7M+bpAXoXvC5
	T+Zont4qRjxqtvQ+kqQtKcLJBeeqysaC18jRPNZlXxAXjGNeCVGLAE5SMDGjJAO8TsVaJA0HbrD
	xSjyGg3P8vc4ZgqayCqAUG9tFub1okqTc5YawlXykKIlJJOJWBoMdp0etjj7phEhWbJh07BFaE4
	QATWkYKFRTn8F6MfBu4eA1IcldnxhC1+PvPvONXiBQ4VHzG0CMIsPFno3Z0HCmJkA8xyQzaWZI3
	E2lNcE4K3usK3OwPBeySbbrJaQ9o6mXR7V54=
X-Google-Smtp-Source: AGHT+IFeoT5qefTQ8xEUUswPvD8G/yrIViZSIjs77zcbXsL83YsJEYW+6Kpenf0SHlIf2VcO1nBNYA==
X-Received: by 2002:a17:907:1b0d:b0:ace:c518:1327 with SMTP id a640c23a62f3a-ad52d496a42mr1448877866b.14.1747742271511;
        Tue, 20 May 2025 04:57:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------bOIgjCPENvRSl8K0409gah00"
Message-ID: <24733cab-d34a-4baf-bc04-e99b0f61a283@gmail.com>
Date: Tue, 20 May 2025 13:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] xen/riscv: add basic UART support
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <9fbcd17751fb0b7925d622631acb0030ee110465.1746530883.git.oleksii.kurochko@gmail.com>
 <b032b85f-df45-4711-a852-a430d0f41044@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b032b85f-df45-4711-a852-a430d0f41044@suse.com>

This is a multi-part message in MIME format.
--------------bOIgjCPENvRSl8K0409gah00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 11:59 AM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -4,12 +4,16 @@
>>   #include <xen/bug.h>
>>   #include <xen/bootfdt.h>
>>   #include <xen/compile.h>
>> +#include <xen/console.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>>   #include <xen/mm.h>
>> +#include <xen/percpu.h>
> Why's this needed? I can't spot anything ...

It should be dropped. This rudiment left when I called percpu_init_areas().

>
>> +#include <xen/serial.h>
>>   #include <xen/shutdown.h>
>>   #include <xen/smp.h>
>> +#include <xen/timer.h>
>>   #include <xen/vmap.h>
>>   #include <xen/xvmalloc.h>
>>   
>> @@ -136,8 +140,17 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       intc_preinit();
>>   
>> +    uart_init();
>> +    console_init_preirq();
>> +
>>       intc_init();
>>   
>> +    timer_init();
>> +
>> +    local_irq_enable();
>> +
>> +    console_init_postirq();
>> +
>>       printk("All set up\n");
>>   
>>       machine_halt();
> ... relevant here. With the need clarified or with the #include dropped:
> Acked-by: Jan Beulich<jbeulich@suse.com>

Thanks.

~ Oleksii

--------------bOIgjCPENvRSl8K0409gah00
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
    <div class="moz-cite-prefix">On 5/15/25 11:59 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b032b85f-df45-4711-a852-a430d0f41044@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -4,12 +4,16 @@
 #include &lt;xen/bug.h&gt;
 #include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/compile.h&gt;
+#include &lt;xen/console.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/irq.h&gt;
 #include &lt;xen/mm.h&gt;
+#include &lt;xen/percpu.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why's this needed? I can't spot anything ...</pre>
    </blockquote>
    <pre>It should be dropped. This rudiment left when I called percpu_init_areas().</pre>
    <blockquote type="cite"
      cite="mid:b032b85f-df45-4711-a852-a430d0f41044@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#include &lt;xen/serial.h&gt;
 #include &lt;xen/shutdown.h&gt;
 #include &lt;xen/smp.h&gt;
+#include &lt;xen/timer.h&gt;
 #include &lt;xen/vmap.h&gt;
 #include &lt;xen/xvmalloc.h&gt;
 
@@ -136,8 +140,17 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    uart_init();
+    console_init_preirq();
+
     intc_init();
 
+    timer_init();
+
+    local_irq_enable();
+
+    console_init_postirq();
+
     printk("All set up\n");
 
     machine_halt();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... relevant here. With the need clarified or with the #include dropped:
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------bOIgjCPENvRSl8K0409gah00--

