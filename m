Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C360ABD704
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 13:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990662.1374598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLI8-00039l-AW; Tue, 20 May 2025 11:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990662.1374598; Tue, 20 May 2025 11:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLI8-00037U-7E; Tue, 20 May 2025 11:37:52 +0000
Received: by outflank-mailman (input) for mailman id 990662;
 Tue, 20 May 2025 11:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHLI6-00037O-Rc
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 11:37:50 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db0b0908-356e-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 13:37:48 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad574992fcaso347671066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 04:37:48 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad534ad59dasm682961566b.31.2025.05.20.04.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 04:37:44 -0700 (PDT)
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
X-Inumbo-ID: db0b0908-356e-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747741068; x=1748345868; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNe/Fdb8PGYy3I9kFDJYzbm8nvTAawrSVm3/nUL5ym0=;
        b=ZqUn6Eo9X5Y86QXVXdMhQM7Uf6nbyNuPNMAwzWegyFS3uQBuOIjqRh8z5w0AgK6syS
         tzNANLrbIS0GzfBxNWUhr1ikch1EnhL/Mhivnaz1nSQqfSraE+0XyDI8lsXg5M2z4B+u
         lfyr3/gpykHMdCDG0ea0XCexaPLa8YjUv+AIhMg+V0QfgWoVQfGs6Uxl5v1w3XoG8/bh
         GIR2zwz1+0niykQ+W9OiEFaqEcM5zpLoRUUjPMMidn1aJ+JH4oY2ekwe788JojTx5W/+
         P4miUVVrvjdSrFFZzN3PgDTMNMtiWr0nxk5MxB+ta657qUXhL9hwTu2pPooFGgE9GcHH
         KbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747741068; x=1748345868;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cNe/Fdb8PGYy3I9kFDJYzbm8nvTAawrSVm3/nUL5ym0=;
        b=PzZcZ0yS+ultTtxo21VV8LSR5Hx9AU5hOrCUVg058yooEevWCZ/UMhNmZ2DXgA6I3l
         babV4hg/6wmQ+7vtKg7D+D33P9BVaA6uOmnglT3BZBinXPWC9Z8BFULEKh1Tx32TLzpD
         lastLuaKIYPJhCrGn/5PeMVoq6YQmho2jy3ELBfAGubuPACO83bki3wRvifLwnfyON+X
         37V4L1dCps1OMLSvfjN/bO/PCqkJEzi3ydnqLj+U2UwOl0uA1Py7so7ujktz3/7VZb4g
         uu4SBaAPEXs1X3xdHsmpfonDeNoAE0hctYWc4SDyRROOoidIPaJlpa+PvxKPq5M6paO3
         YqZA==
X-Forwarded-Encrypted: i=1; AJvYcCWt9m6VxBqyMVXI8EQo2ObYU1S76i5kgb5xO+g1KVWzP74gXF8bridYZVHWf8Z3e6qtoG2hvwFUL4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3exqydoCbgXA/bUUAFjp4eVfPi9UiRK4zY4QXm9prL/IzQuoH
	GBl6klo9B+LZSOji57qQL2CbtwBLAeLiTSj5p7/trTkl6XrxiZ5SPFYX
X-Gm-Gg: ASbGncsvRqk18wV16guQdXvrpch35lNfO40BrBow1OrR86Al0o0GNRrLrYSydm5abJY
	qDX2SBG5cVirFR/ae4JI/cEazj6cNVGwAzUmXvVN3aAMKuJuKXS5GBdCK+qpoJXdfB+RDbIvoXE
	iZp7OTJvPqt8dqjCYKFq3HqayFlBOP/GIeS7UlkGkuT97/oEC8UO8XRqJ9fvAdU1yJSAMYJYIv6
	k2JG/Ws743g/tdzwQ94wN6hAuoIebikRjhOWRu2jJV0OJkJ0JpOoQkaErVGhXeJntMoRpMuhPse
	SRN9K9M8tCXtLMygI2x2DsETMWPa48zmEriFVwE3HxR+hmd4SOFZ8zWRo31V5nmm9Jip2ezccvH
	nWKtRJIZDyM2FWXzQJ1VKTxVR
X-Google-Smtp-Source: AGHT+IE/St+FkE95V27zPOdtNnbkkPwKcrxcZZ5vJBzCOzCd1drpaI/O5mwSlA26yPvnzMRDLa0jNw==
X-Received: by 2002:a17:906:dc93:b0:ad5:6ca3:c795 with SMTP id a640c23a62f3a-ad56ca3cb15mr695759866b.33.1747741067721;
        Tue, 20 May 2025 04:37:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VDfO9UbkA8u0Q20q29arCSXj"
Message-ID: <57765dd3-502a-4a28-8d15-2983b1f383ff@gmail.com>
Date: Tue, 20 May 2025 13:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] xen/riscv: add external interrupt handling for
 hypervisor mode
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
 <5688ed044febf734d9c75aa2e6f52affccd3fce9.1746530883.git.oleksii.kurochko@gmail.com>
 <1ca8df48-7e2d-4ad3-b1ad-8b4530fd22be@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1ca8df48-7e2d-4ad3-b1ad-8b4530fd22be@suse.com>

This is a multi-part message in MIME format.
--------------VDfO9UbkA8u0Q20q29arCSXj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/15/25 11:54 AM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> +static void cf_check aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
>> +{
>> +    /*
>> +    * Interrupt 0 isn't possible based on the spec:
>> +    *   Each of an APLIC’s interrupt sources has a fixed unique identity number in the range 1 to N,
>> +    *   where N is the total number of sources at the APLIC. The number zero is not a valid interrupt
>> +    *   identity number at an APLIC. The maximum number of interrupt sources an APLIC may support
>> +    *   is 1023.
>> +    *
>> +    * Thereby interrupt 1 will correspond to bit 0 in sourcecfg[] register,
>> +    * interrupt 2 ->sourcecfg[1] and so on.
>> +    *
>> +    * And that is the reason why we need -1.
>> +    */
>> +    unsigned int irq_bit = desc->irq - 1;
>> +
>> +    spin_lock(&aplic.lock);
>> +
>> +    switch(type)
> Nit: style
>
>> +    {
>> +    case IRQ_TYPE_EDGE_RISING:
>> +        writel(APLIC_SOURCECFG_SM_EDGE_RISE, &aplic.regs->sourcecfg[irq_bit]);
>> +        break;
>> +
>> +    case IRQ_TYPE_EDGE_FALLING:
>> +        writel(APLIC_SOURCECFG_SM_EDGE_FALL, &aplic.regs->sourcecfg[irq_bit]);
>> +        break;
>> +
>> +    case IRQ_TYPE_LEVEL_HIGH:
>> +        writel(APLIC_SOURCECFG_SM_LEVEL_HIGH, &aplic.regs->sourcecfg[irq_bit]);
>> +        break;
>> +
>> +    case IRQ_TYPE_LEVEL_LOW:
>> +        writel(APLIC_SOURCECFG_SM_LEVEL_LOW, &aplic.regs->sourcecfg[irq_bit]);
>> +        break;
>> +
>> +    case IRQ_TYPE_NONE:
>> +        fallthrough;
> This is pointless (and hampering readability) when there are no other statements.

Oh, okay, it should be:
   case IRQ_TYPE_NONE:
   case IRQ_TYPE_INVALID:
I thought fallthrough should be used always in such cases.
Anyway, I'll drop it.

>
> With both taken care of:
> Acked-by: Jan Beulich<jbeulich@suse.com>

Thanks.

I am going also to add "ASSERT(spin_is_locked(&desc->lock));" at the start of this
function to be algined with other callbacks which uses spin_{un}lock(&aplic.lock).

~ Oleksii

--------------VDfO9UbkA8u0Q20q29arCSXj
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
    <div class="moz-cite-prefix">On 5/15/25 11:54 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1ca8df48-7e2d-4ad3-b1ad-8b4530fd22be@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void cf_check aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
+{
+    /*
+    * Interrupt 0 isn't possible based on the spec:
+    *   Each of an APLIC’s interrupt sources has a fixed unique identity number in the range 1 to N,
+    *   where N is the total number of sources at the APLIC. The number zero is not a valid interrupt
+    *   identity number at an APLIC. The maximum number of interrupt sources an APLIC may support
+    *   is 1023.
+    *
+    * Thereby interrupt 1 will correspond to bit 0 in sourcecfg[] register,
+    * interrupt 2 -&gt;sourcecfg[1] and so on.
+    *
+    * And that is the reason why we need -1.
+    */
+    unsigned int irq_bit = desc-&gt;irq - 1;
+
+    spin_lock(&amp;aplic.lock);
+
+    switch(type)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: style

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    {
+    case IRQ_TYPE_EDGE_RISING:
+        writel(APLIC_SOURCECFG_SM_EDGE_RISE, &amp;aplic.regs-&gt;sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_EDGE_FALLING:
+        writel(APLIC_SOURCECFG_SM_EDGE_FALL, &amp;aplic.regs-&gt;sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_LEVEL_HIGH:
+        writel(APLIC_SOURCECFG_SM_LEVEL_HIGH, &amp;aplic.regs-&gt;sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_LEVEL_LOW:
+        writel(APLIC_SOURCECFG_SM_LEVEL_LOW, &amp;aplic.regs-&gt;sourcecfg[irq_bit]);
+        break;
+
+    case IRQ_TYPE_NONE:
+        fallthrough;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is pointless (and hampering readability) when there are no other statements.</pre>
    </blockquote>
    <pre>Oh, okay, it should be:
  case IRQ_TYPE_NONE:
  case IRQ_TYPE_INVALID:
I thought fallthrough should be used always in such cases.
Anyway, I'll drop it.

</pre>
    <blockquote type="cite"
      cite="mid:1ca8df48-7e2d-4ad3-b1ad-8b4530fd22be@suse.com">
      <pre wrap="" class="moz-quote-pre">

With both taken care of:
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.

I am going also to add "ASSERT(spin_is_locked(&amp;desc-&gt;lock));" at the start of this
function to be algined with other callbacks which uses spin_{un}lock(&amp;aplic.lock).</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------VDfO9UbkA8u0Q20q29arCSXj--

