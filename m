Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC4ABC3E2
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 18:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990052.1374003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH33P-0003l1-GQ; Mon, 19 May 2025 16:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990052.1374003; Mon, 19 May 2025 16:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH33P-0003ja-Dj; Mon, 19 May 2025 16:09:27 +0000
Received: by outflank-mailman (input) for mailman id 990052;
 Mon, 19 May 2025 16:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRlD=YD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uH33N-0003jU-My
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 16:09:25 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0d88536-34cb-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 18:09:23 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad5394be625so551749766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 09:09:23 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04aed7sm609812166b.9.2025.05.19.09.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 09:09:21 -0700 (PDT)
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
X-Inumbo-ID: a0d88536-34cb-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747670962; x=1748275762; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bg5mb81A6bM7YU+0LviaGY6QXJz6XtKaehihYECsyDg=;
        b=KGiRSUimcQCkC1fqEmDUJBnJMPNP37LS15Fl091y2lA5dLCHi/aFNON8Z2YWSslskS
         DgQSgYK4czopDZtozfS6a5SgwIqrUPmSrui6RVNuERuzCA19aS1IPPNUQsIJCNcUqZKY
         bwr5l7YNXBy86AnNFGROeaS4hj+D2JOX8TSp8nThSctNjxIBfvHvuXCdldZp6q/yE4FC
         QlZRiOX17uB5vry/7ftky8cD1iWZt2ztjImFIk2ONVgx9LHzL6vDBaEX42jl6oxlpGT0
         1APUrm+gBT7ckZbT70vPdPaFm9DXvwApoIdTcGiv78t8vkef4BtF902ulPtpbi3L9tZP
         Nf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670962; x=1748275762;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bg5mb81A6bM7YU+0LviaGY6QXJz6XtKaehihYECsyDg=;
        b=qOg+G2oEVsgI1JIGiuLsuEXw/H6k6o9Pi1HpGjl9/5AJtlrs8xYu/0WkSmrLHPxDNR
         cUb3+r56WWu/+6b7oNWSyo1ayn6DqyS0ZyWONgM/6v+y3qo5kWHikLvXqIs0ZhcQlw/8
         1QPyWAkZ/4HlBHL0kziR32JQvwEyJBuTdz518pPZDxpPxkG6njy1+PShXMK4/wZErl+a
         qN0aTlufSZF/e3Qktwe8PR9VrSRCJnIbb48spNCvo/UZlcq7araIoigPbSTiCHChcVO+
         0ne+PtIsbSRTt8wtdy7cLY34Mv2M4LJYCvO1T7P8JM3mhRN2gSTQtGQuUnljtGs249jI
         rN3w==
X-Forwarded-Encrypted: i=1; AJvYcCWKaCcmUvdSbRXgdJcCub5FY02dAR07Yw6GCwsCorP8n5NfOmYWfD6ATlxH+cpxQd8NpN50hUQUMvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMiJBwTcPSAZtRe/swsetYehZ5LZBiSjcF8ykr6CoVnRPXzAHL
	03AfwNritY8bpGDdmR66qYI6uB071bTenHI+ffGNKVvcIVJyIq5eaB/3
X-Gm-Gg: ASbGncvS9YEoNdXGhjD0Q4iytaoLKlh9wsJ9hvE+XyWTkd0+2sST8WzY0GfcHEpCTRM
	1j54kuoN76RsvuibtnWbk0wpLKrkbqLbJlDlLKh0NAqRy0yjGbh862icFaSu3SYdlNnGHdJGlpG
	IJx++KnSQY3IHS5jKg5oKMZ6Gvk9Q2XSsQ1qErq5sR8br9w5Dzd59qZDFPPoyIGY85cQ9GHeYGn
	meiRRX2VAP9W0viaQdN4aMHwkhwRn9vRzsji6UFZD0OW1EURuMSJWPPYdaYUbWqvJysp0lIADJt
	X40Jd9HiAOAhIlQoZcsqp+/eUeAVricjbTxXThMcibVgkDYBl/SzPujzsx+SZqE2wf/674n5ho9
	6gneIf+QLUX2li53RF7VtfSL7N9H3c//xviA=
X-Google-Smtp-Source: AGHT+IE7Qcskq+doyDIr6DYTFFajJaloDFJKuWkhhfJBgA0hHkLjZaj/hOuanixi07yq/J/reSlJ2w==
X-Received: by 2002:a17:906:c14d:b0:ad2:26f0:a76 with SMTP id a640c23a62f3a-ad536b7f1d2mr1170595666b.13.1747670961569;
        Mon, 19 May 2025 09:09:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------PMQ020XTGqPtvlBYXUp9Qtpu"
Message-ID: <e06a00d9-7cbd-416e-8e1e-f3aaaedccf77@gmail.com>
Date: Mon, 19 May 2025 18:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] xen/riscv: aplic_init() implementation
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
 <9129b10432dfc7ff8ba451842204342171da7dc1.1746530883.git.oleksii.kurochko@gmail.com>
 <057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com>

This is a multi-part message in MIME format.
--------------PMQ020XTGqPtvlBYXUp9Qtpu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 11:06 AM, Jan Beulich wrote:
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -9,19 +9,121 @@
>>    * Copyright (c) 2024-2025 Vates
>>    */
>>   
>> +#include <xen/device_tree.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>> +#include <xen/mm.h>
>>   #include <xen/sections.h>
>>   #include <xen/types.h>
>> +#include <xen/vmap.h>
>> +
>> +#include "aplic-priv.h"
> Besides this, are there going to be any other files including this private
> header? If not, why have the header in the first place?

Yes, structure aplic_priv is going to be reused in vaplic.c (which isn't introduce yet):
   https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/vaplic.c#L56

>> +    /* Set interrupt type and default priority for all interrupts */
>> +    for ( i = 1; i <= aplic_info.num_irqs; i++ )
>> +    {
>> +        writel(0, &aplic.regs->sourcecfg[i - 1]);
> What guarantees the loop to not run past the array's size?

riscv,aplic binding:
   https://github.com/torvalds/linux/blob/a5806cd506af5a7c19bcd596e4708b5c464bfd21/Documentation/devicetree/bindings/interrupt-controller/riscv%2Caplic.yaml#L57
Should I add an ASSERT() or panic() at the moment where num_irqs are
initialized to double check a binding?

>
>> +        /*
>> +         * Low bits of target register contains Interrupt Priority bits which
>> +         * can't be zero according to AIA spec.
>> +         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
>> +         */
>> +        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i - 1]);
>> +    }
> Seeing the subtractions of 1 here, why's the loop header not simply
>
>      for ( i = 0; i < aplic_info.num_irqs; i++ )
>
> (i.e. the more conventional form)?

To follow the definition of aplic's binding mentioned about where minimum is 1.
But I think we can use convention form.

>
>> +    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
>> +}
>> +
>> +static int __init cf_check aplic_init(void)
>> +{
>> +    int rc;
>> +    dt_phandle imsic_phandle;
>> +    uint32_t irq_range[num_possible_cpus() * 2];
> Are you going to have enough stack space when num_possible_cpus() is pretty
> large?

When num_possible_cpus() will be pretty large then it will better to allocate irq_range[]
dynamically.

Does it make sense to re-write now?

>> +    const struct dt_device_node *node = aplic_info.node;
>> +
>> +    /* Check for associated imsic node */
>> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>> +    if ( !rc )
>> +        panic("%s: IDC mode not supported\n", node->full_name);
>> +
>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>> +    if ( !imsic_node )
>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>> +
>> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
>> +                                    irq_range, ARRAY_SIZE(irq_range));
>> +    if ( rc )
>> +        panic("%s: unable to find interrupt-extended in %s node\n",
>> +              __func__, imsic_node->full_name);
>> +
>> +    if ( irq_range[1] == IRQ_M_EXT )
> How do you know the array has had 2 or ...
>
>> +        /* Machine mode imsic node, ignore this aplic node */
>> +        return 0;
>> +
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(irq_range); i += 2 )
>> +    {
>> +        if ( irq_range[i + 1] != irq_range[1] )
>> +            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
>> +    }
> ... or even all of the slots populated? Anything not populated by the DT
> function will still have the stack contents that had been left by earlier
> call chains. (The loop also makes little sense to start from 0.)

Do you mean I asked allocated irq_range[8*2] but DT node has only irq_range[4*2]?
Then it will be really an issue. And out-of-range access will occur in
dt_property_read_variable_u32_array(). I need another way to check then...

>
> I'm also puzzled by there not being any further use of the values later
> in the function.

Yes, because we need this values only to check that DT node's property is
correctly created.

>
>> +    rc = imsic_init(imsic_node);
>> +    if ( rc )
>> +        panic("%s: Failded to initialize IMSIC\n", node->full_name);
>> +
>> +    /* Find out number of interrupt sources */
>> +    rc = dt_property_read_u32(node, "riscv,num-sources", &aplic_info.num_irqs);
>> +    if ( !rc )
> Assigning a bool return value to an int local var, which generally hold
> error codes, is confusing. I don't think you really need to use a local
> variable here.

Considering that I am panicing for all the case where rc is used and rc isn't printed
then we can really just drop rc.

~ Oleksii

--------------PMQ020XTGqPtvlBYXUp9Qtpu
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
    <div class="moz-cite-prefix">On 5/15/25 11:06 AM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,121 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include &lt;xen/device_tree.h&gt;
 #include &lt;xen/errno.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/irq.h&gt;
+#include &lt;xen/mm.h&gt;
 #include &lt;xen/sections.h&gt;
 #include &lt;xen/types.h&gt;
+#include &lt;xen/vmap.h&gt;
+
+#include "aplic-priv.h"
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Besides this, are there going to be any other files including this private
header? If not, why have the header in the first place?</pre>
    </blockquote>
    <pre>Yes, structure aplic_priv is going to be reused in vaplic.c (which isn't introduce yet):
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/vaplic.c#L56">https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/vaplic.c#L56</a>
</pre>
    <blockquote type="cite"
      cite="mid:057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Set interrupt type and default priority for all interrupts */
+    for ( i = 1; i &lt;= aplic_info.num_irqs; i++ )
+    {
+        writel(0, &amp;aplic.regs-&gt;sourcecfg[i - 1]);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
<pre>What guarantees the loop to not run past the array's size?</pre></pre>
    </blockquote>
    <pre>riscv,aplic binding:
  <a class="moz-txt-link-freetext" href="https://github.com/torvalds/linux/blob/a5806cd506af5a7c19bcd596e4708b5c464bfd21/Documentation/devicetree/bindings/interrupt-controller/riscv%2Caplic.yaml#L57">https://github.com/torvalds/linux/blob/a5806cd506af5a7c19bcd596e4708b5c464bfd21/Documentation/devicetree/bindings/interrupt-controller/riscv%2Caplic.yaml#L57</a>
Should I add an ASSERT() or panic() at the moment where num_irqs are
initialized to double check a binding?

</pre>
    <blockquote type="cite"
      cite="mid:057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        /*
+         * Low bits of target register contains Interrupt Priority bits which
+         * can't be zero according to AIA spec.
+         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
+         */
+        writel(APLIC_DEFAULT_PRIORITY, &amp;aplic.regs-&gt;target[i - 1]);
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Seeing the subtractions of 1 here, why's the loop header not simply

    for ( i = 0; i &lt; aplic_info.num_irqs; i++ )

(i.e. the more conventional form)?</pre>
    </blockquote>
    <pre>To follow the definition of aplic's binding mentioned about where minimum is 1.
But I think we can use convention form.

</pre>
    <blockquote type="cite"
      cite="mid:057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &amp;aplic.regs-&gt;domaincfg);
+}
+
+static int __init cf_check aplic_init(void)
+{
+    int rc;
+    dt_phandle imsic_phandle;
+    uint32_t irq_range[num_possible_cpus() * 2];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are you going to have enough stack space when num_possible_cpus() is pretty
large?</pre>
    </blockquote>
    <pre>When num_possible_cpus() will be pretty large then it will better to allocate irq_range[]
dynamically.

Does it make sense to re-write now?

</pre>
    <blockquote type="cite"
      cite="mid:057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    const struct dt_device_node *node = aplic_info.node;
+
+    /* Check for associated imsic node */
+    rc = dt_property_read_u32(node, "msi-parent", &amp;imsic_phandle);
+    if ( !rc )
+        panic("%s: IDC mode not supported\n", node-&gt;full_name);
+
+    imsic_node = dt_find_node_by_phandle(imsic_phandle);
+    if ( !imsic_node )
+        panic("%s: unable to find IMSIC node\n", node-&gt;full_name);
+
+    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
+                                    irq_range, ARRAY_SIZE(irq_range));
+    if ( rc )
+        panic("%s: unable to find interrupt-extended in %s node\n",
+              __func__, imsic_node-&gt;full_name);
+
+    if ( irq_range[1] == IRQ_M_EXT )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How do you know the array has had 2 or ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        /* Machine mode imsic node, ignore this aplic node */
+        return 0;
+
+    for ( unsigned int i = 0; i &lt; ARRAY_SIZE(irq_range); i += 2 )
+    {
+        if ( irq_range[i + 1] != irq_range[1] )
+            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... or even all of the slots populated? Anything not populated by the DT
function will still have the stack contents that had been left by earlier
call chains. (The loop also makes little sense to start from 0.)</pre>
    </blockquote>
    <pre>Do you mean I asked allocated irq_range[8*2] but DT node has only irq_range[4*2]?
Then it will be really an issue. And out-of-range access will occur in
dt_property_read_variable_u32_array(). I need another way to check then...

</pre>
    <blockquote type="cite"
      cite="mid:057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com">
      <pre wrap="" class="moz-quote-pre">

I'm also puzzled by there not being any further use of the values later
in the function.</pre>
    </blockquote>
    <pre>Yes, because we need this values only to check that DT node's property is
correctly created.

</pre>
    <blockquote type="cite"
      cite="mid:057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    rc = imsic_init(imsic_node);
+    if ( rc )
+        panic("%s: Failded to initialize IMSIC\n", node-&gt;full_name);
+
+    /* Find out number of interrupt sources */
+    rc = dt_property_read_u32(node, "riscv,num-sources", &amp;aplic_info.num_irqs);
+    if ( !rc )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Assigning a bool return value to an int local var, which generally hold
error codes, is confusing. I don't think you really need to use a local
variable here.</pre>
    </blockquote>
    <pre>Considering that I am panicing for all the case where rc is used and rc isn't printed
then we can really just drop rc.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------PMQ020XTGqPtvlBYXUp9Qtpu--

