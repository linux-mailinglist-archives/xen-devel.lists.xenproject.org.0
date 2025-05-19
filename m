Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B7ABB86A
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 11:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989679.1373673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGwba-0004ur-82; Mon, 19 May 2025 09:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989679.1373673; Mon, 19 May 2025 09:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGwba-0004tT-5O; Mon, 19 May 2025 09:16:18 +0000
Received: by outflank-mailman (input) for mailman id 989679;
 Mon, 19 May 2025 09:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRlD=YD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uGwbY-0004tN-Ta
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 09:16:17 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9859a97-3491-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 11:16:14 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad52d9be53cso454396466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 02:16:14 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d071c36sm567178966b.64.2025.05.19.02.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 02:16:13 -0700 (PDT)
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
X-Inumbo-ID: e9859a97-3491-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747646174; x=1748250974; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20mE0g/uZDF4lu6y+z9YNWj+qRxx9iPCZda5fVdY4pY=;
        b=cqublEH7gSJe4p4OYGoZQV54FKshyEa5FlAZ3TXUhpEh3cEMUlpQdS1gnEW6nfdbYD
         eWsUCl73qIpqHTKZI+mwCJ/gLux+mjjlLFaBJT+GQZigMX/qp7aUKZD6qtIKG19Gan4E
         DMMa0sm8v81WYy0YF8LCquBxsAP9cc34EFj2c9lVQTjB9HkA+cd0SVb+avYkbIqTBC7P
         EMKlSHFXBJakuGYRbFY99x6wqv97Y7A9B7fTxNeWM3LQz+ue1cl6pA59GH7ew4lJt8eq
         MsShubdJsoxxr50lJJLcz8QEblyy+T4rQ+H2rDcSQtsvIGmE1FoBEBxsYfZzdVmVQX+S
         JHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747646174; x=1748250974;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20mE0g/uZDF4lu6y+z9YNWj+qRxx9iPCZda5fVdY4pY=;
        b=h4goUyp5Vl/oU8dvxul8/77VDTJgs2SZp7tQhivg9zyNDKsqnWyJyyS0s3zEFP9n7i
         9IOljNtCze+NMFQ5s9uZ1dLgLGPf8ef3vJqzbhgtjdtbyXnCUc4RagYTywGh/3RO2txr
         OeOU5MLXS+rU6P3/Kx85XS0N+sQtLwZQqsWUPMYs3Muw5ywMpVJ0CWb91qbablsrpVAS
         EOQ7Jfc403LU0jnWjHEOQXaBZ6g+e3MwjCInCjEJ/+A13i7KXlHoWEPx/D9M5OqWkbtO
         LGmFBe/mvLLCoGd5paHEa+9Wrcc7S2Pdp1eS1zadOCOLSXCvnwloAemNhPto9pYwKeGZ
         3kOA==
X-Forwarded-Encrypted: i=1; AJvYcCXq9szXWkt1Pny5rCPgm5UqoCs32ZLqKFA+snANeYh2p0MAepfV8mjF2y1qgjqxRxcq8x6MUTSuFco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM6Uqq0dR7agyOlNpFk3cOQ/+u6ArxxD8HHysOOKxFyO6Un9ik
	deNIcGRrbagARDfRIDNgMk8BPOHuZcgyTGtohwNPEYsrVRSvlA8o0FJH
X-Gm-Gg: ASbGncvNQHJV0Q3oiPTQwwKPW5rg2aD9Aa2P/34mrcieU50E9xA/u8m8wx5ahFBV4MS
	WHv2rKdndsEbSyXyI599+L90DlIOvPYpJckXjqPzPf2BNLVW39zM5GxaNlgwPK613v6SYck2Kpx
	fMX8qK1GzKNfkj1tpfcoaLVrPnOjqTnxMjUy8NLA7F7RyKeDVrV/Zk225Fs8plsrpWWOmv4rcJ/
	jTcK/6LDEkJ7m1ke75MR7D9qqIh8ahwWVNinEV1ZG8bk2m/unbQtXYgxQbieLWVbdgTvIT9tuls
	U4JVSBSEiOUkGF1Bx7DhXBL+Vfm+xWaoOE7ckhF99h7i48hJsAKEZbZx2FHo1PxwHAbJNjnt4R5
	0jPXcs3z2fKqI5duYw3RBN5a4
X-Google-Smtp-Source: AGHT+IGkFNsI5fPDtlRu1rHiPkYVTbl5vWbWaz7pqvGdEWa18AwG1ShRJcLo1pO+W4Y/zpWimczWhA==
X-Received: by 2002:a17:907:8dc3:b0:ac7:d7f3:86c6 with SMTP id a640c23a62f3a-ad52d467cccmr889322766b.9.1747646173305;
        Mon, 19 May 2025 02:16:13 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------zaSulQ0JkwlEazr1WB8980pE"
Message-ID: <9c202b56-ad59-481b-924a-addefcea84cd@gmail.com>
Date: Mon, 19 May 2025 11:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce register_intc_ops() and
 intc_hw_ops.
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <7cd7d3780bb6db45b92c971ff8bcf2634570431f.1746530883.git.oleksii.kurochko@gmail.com>
 <2436be2e-28d4-4e48-a391-84b21651b339@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2436be2e-28d4-4e48-a391-84b21651b339@suse.com>

This is a multi-part message in MIME format.
--------------zaSulQ0JkwlEazr1WB8980pE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 10:06 AM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -8,6 +8,8 @@
>>   #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
>>   #define ASM__RISCV__INTERRUPT_CONTOLLER_H
>>   
>> +#include <xen/irq.h>
> If you need this include anyway, why ...
>
>> @@ -17,6 +19,26 @@ struct intc_info {
>>       const struct dt_device_node *node;
>>   };
>>   
>> +struct irq_desc;
> ... this "forward" decl for something that's then already fully defined?
> I can't, however, spot why xen/irq.h would be needed for anything ...

forward decl for irq_desc could be really dropped.

Inclusion of xen/irq.h was added because of hw_irq_controller which is defined as:
   typedef const struct hw_interrupt_type hw_irq_controller;

And I'm not sure how to do forward declaration properly in this case. Just use
an explicit definition of hw_irq_controller for host_irq_type member of struct
intc_hw_operations seems as not the best one option:
   struct hw_interrupt_type;
  
   struct intc_hw_operations {
       ...
       // const hw_irq_controller *host_irq_type;
       const struct hw_interrupt_type *host_irq_type;

It seems like the best one option is to do the following:
   typedef const struct hw_interrupt_type hw_irq_controller; in asm/intc.h.
I will follow it then.

>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -5,6 +5,15 @@
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>>   
>> +#include <asm/intc.h>
>> +
>> +static struct __ro_after_init intc_hw_operations *intc_hw_ops;
> Nit: Attributes between type and identifier please. Also shouldn't both
> this and ...
>
>> +void __init register_intc_ops(struct intc_hw_operations *ops)
> ... the parameter here be pointer-to-const?

Then|intc_hw_ops| should also be marked as|const| (with the removal of|__ro_after_init|),
otherwise a compilation error will occur (something like/"assignment discards 'const' qualifier"/).

Additionally,|__ro_after_init| should be replaced with|const| for|aplic_ops| in future
patches.

Let me know which approach you prefer. I prefer using|const|, as
|intc_hw_operations| and|aplic_ops| are not expected to change after initialization.

~ Oleksii

--------------zaSulQ0JkwlEazr1WB8980pE
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
    <div class="moz-cite-prefix">On 5/15/25 10:06 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2436be2e-28d4-4e48-a391-84b21651b339@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,6 +8,8 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
+#include &lt;xen/irq.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you need this include anyway, why ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -17,6 +19,26 @@ struct intc_info {
     const struct dt_device_node *node;
 };
 
+struct irq_desc;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this "forward" decl for something that's then already fully defined?
I can't, however, spot why xen/irq.h would be needed for anything ...</pre>
    </blockquote>
    <pre>forward decl for irq_desc could be really dropped.

Inclusion of xen/irq.h was added because of hw_irq_controller which is defined as:
  typedef const struct hw_interrupt_type hw_irq_controller;

And I'm not sure how to do forward declaration properly in this case. Just use
an explicit definition of hw_irq_controller for host_irq_type member of struct
intc_hw_operations seems as not the best one option:
  struct hw_interrupt_type;
 
  struct intc_hw_operations {
      ...
      // const hw_irq_controller *host_irq_type;
      const struct hw_interrupt_type *host_irq_type;

It seems like the best one option is to do the following:
  typedef const struct hw_interrupt_type hw_irq_controller; in asm/intc.h.
I will follow it then.

</pre>
    <blockquote type="cite"
      cite="mid:2436be2e-28d4-4e48-a391-84b21651b339@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -5,6 +5,15 @@
 #include &lt;xen/init.h&gt;
 #include &lt;xen/lib.h&gt;
 
+#include &lt;asm/intc.h&gt;
+
+static struct __ro_after_init intc_hw_operations *intc_hw_ops;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Attributes between type and identifier please. Also shouldn't both
this and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+void __init register_intc_ops(struct intc_hw_operations *ops)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the parameter here be pointer-to-const?</pre>
    </blockquote>
    <pre data-start="59" data-end="252" class="">Then <code
    data-start="64" data-end="77">intc_hw_ops</code> should also be marked as <code
    data-start="103" data-end="110">const</code> (with the removal of <code
    data-start="132" data-end="149">__ro_after_init</code>),
otherwise a compilation error will occur (something like <em
    data-start="209" data-end="250">"assignment discards 'const'
qualifier"</em>).</pre>
    <pre data-start="254" data-end="352" class="">Additionally, <code
    data-start="268" data-end="285">__ro_after_init</code> should be replaced with <code
    data-start="310" data-end="317">const</code> for <code
    data-start="322" data-end="333">aplic_ops</code> in future
patches.</pre>
    <pre data-start="354" data-end="523" class="">Let me know which approach you prefer. I prefer using <code
    data-start="413" data-end="420">const</code>, as
<code data-start="438" data-end="458">intc_hw_operations</code> and <code
    data-start="463" data-end="474">aplic_ops</code> are not expected to change after initialization.</pre>
    <pre>
~ Oleksii</pre>
  </body>
</html>

--------------zaSulQ0JkwlEazr1WB8980pE--

