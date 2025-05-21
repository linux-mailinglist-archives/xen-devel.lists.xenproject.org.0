Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13442ABF31A
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 13:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991723.1375550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhoc-00014B-3G; Wed, 21 May 2025 11:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991723.1375550; Wed, 21 May 2025 11:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhob-00012O-Uj; Wed, 21 May 2025 11:40:53 +0000
Received: by outflank-mailman (input) for mailman id 991723;
 Wed, 21 May 2025 11:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHhob-00012I-0q
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 11:40:53 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 721d8d88-3638-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 13:40:51 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad5574b59c0so694264466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 04:40:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04af35sm889539466b.32.2025.05.21.04.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 04:40:49 -0700 (PDT)
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
X-Inumbo-ID: 721d8d88-3638-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827650; x=1748432450; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpFJCKcCrT4E6iFxkrqzaSnB0yEpCDzQJhLI9suyxwY=;
        b=bJDbMt58qBK8aqycQQKBgjqnX1xkBxhdlV2cSoGjf6Uv2SmP4Cdwgh0m1b4ys999Ga
         ex5ThNjfQJLPZDUtn8bddqKSmDg3I9Z91zQ2d4bB3dgW+OPvydTaDiTUITngRq+V1osY
         AiJvlhd8TfcYVpY4r2N3eRcMjGVretbZtSUNkZbH/6IkyacZfWguRFIsL8mLcJe7eTMe
         E5x2E723H287MCRRYuL5UwoU1abmuwhUxhGUw303HFBYJ1YcJgmGqpVtErwbESoqg6Ko
         b0aKPLZqjCHgW+h0YtPbhjbJVZ/HL8QaMjAzwuDMAgdY9ol9C1qfkbupxs0TMqn8KekR
         SJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827650; x=1748432450;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jpFJCKcCrT4E6iFxkrqzaSnB0yEpCDzQJhLI9suyxwY=;
        b=Lnvy4bMLYnKHVpdBSFTjiQPT/BGHLuyZFASNjpZ92FalL3c2sqp4MqaaNnMZxS1K3v
         zHw6obg4SodoF9vptm5SClWNRN+FYP9af+rJDAzQycIhnchCrQBvi1309LnKPvwG0laX
         b+v87QI3zomb+xCMR71uQPGGrdtIx3x2OulbPuP7H5mmfGI2uBqjara1KGY0HMeDznAb
         5NXhzgUiZWaxFJWBVCUjtaUR3aKsbwMntuzxO/tIYlLq9iTrO8wyXRX8iMFkznBMC/e+
         xaKsncAkWqQHB/11Hgk7q4j0mQp5nenAZp+puE8ezD288xRxzBkXTJDzNcbivoez0a9z
         U79Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQRW/SQQNhg4kzSct5fT2vTdXKkihqa7lCq7qfYKHS7YY8kY+ZceReiaQsmb5jFA2tSlxkUrN9plY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsJtnqPzdau/IM0usiAtz+Zw7Ha1udVnkRIsXbR68xjhyLZtvQ
	hzgWCwKp3xKQK3Cs+PjfrTpJGDRigNZsgmgpdmFQWZmKhp0VG5d79voW
X-Gm-Gg: ASbGnctiGrRQpYp5j8Sb/QRGG4uh2j2Mnb46zlAyG70r6OChMp9LZneQpYgiCNL6wTr
	uU3j9MNf50PxST+dGwf/170vKQVeGq0+6KVyeV1A+8IiblyvxKU6oAop/A/uo3VVL4oYZOkm+z0
	fCWySbiZIgWGwNRX+jGrePdg9L3HiZ71TJJizFFQ7DyUNiOwfRaiMbep+DkTxztZwvapX+3ZxNU
	qF/sYZd90Nill/JxHppQk1py/PHPSJpicTVsTtX5+2d8Bgqo8av/rb/TevnZO0JRGsHBF5DEXZf
	Mq6gT5yKH/DWc9nKwJOOFfesgKJLEYLrPtGCJJrd25hqAQtLL4RXWcrezof2oJq3KfX4Otm1ZKv
	DGc2lrm1wQcRx7bPetp0K8cmX
X-Google-Smtp-Source: AGHT+IGn7tG7D/2Ld4pT+XMP4CzTONeqOZQGTz8NA1Vs8c9RW5/qikwXoItcSOtvvEt0+O5N/aoH5g==
X-Received: by 2002:a17:906:f1c6:b0:ad5:2e5b:d16b with SMTP id a640c23a62f3a-ad536c1a81emr1625199666b.27.1747827650265;
        Wed, 21 May 2025 04:40:50 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------toL00BL1Do6yBuvY8isHmULQ"
Message-ID: <bb5b3f79-317e-4977-b941-21c655fa23ee@gmail.com>
Date: Wed, 21 May 2025 13:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: add initialization support for virtual SBI
 UART (vSBI UART)
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
 <d923a7dc-f850-4256-8639-310243a26736@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d923a7dc-f850-4256-8639-310243a26736@suse.com>

This is a multi-part message in MIME format.
--------------toL00BL1Do6yBuvY8isHmULQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 12:08 PM, Jan Beulich wrote:
> On 12.05.2025 17:55, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -1,5 +1,6 @@
>>   obj-y += aplic.o
>>   obj-y += cpufeature.o
>> +obj-y += dom0less-build.o
> Arm uses
>
> obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
>
> Why the two differences?

Missed that. I have to understand why Arm uses *.init.o, but likely I should do the same for RISC-V.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/dom0less-build.c
>> @@ -0,0 +1,30 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/bug.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/init.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/vsbi-uart.h>
>> +
>> +int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
>> +                      const struct dt_device_node *node)
>> +{
>> +    int rc = -EINVAL;
>> +
>> +    kinfo->arch.vsbi_uart = dt_property_read_bool(node, "vsbi_uart");
>> +
>> +    if ( kinfo->arch.vsbi_uart )
>> +    {
>> +        rc = domain_vsbi_uart_init(d, NULL);
>> +        if ( rc < 0 )
>> +            return rc;
>> +    }
>> +
>> +    if ( rc )
>> +        panic("%s: what a domain should use as an UART?\n", __func__);
> Is this a reason to panic()? Isn't it possible for domains to be fine
> without any UART?

Good point.
I think that it is possible to leave without UART. At this stage,
of development I need UART for debug, so automatically the panic() was added.
But I agree, it should be dropped.

>> +    domain_vsbi_uart_deinit(d);
>> +
>> +    return rc;
>> +}
>> +
>> +void domain_vsbi_uart_deinit(struct domain *d)
>> +{
>> +    struct vsbi_uart *vsbi_uart = &d->arch.vsbi_uart;
>> +
>> +    if ( vsbi_uart->backend_in_domain )
>> +        printk("%s: backed in a domain isn't supported\n", __func__);
> Is this relevant in a de-init function?

Probably not, it was just added to not forget to update domain_vsbi_uart_deinit().

Thanks.

~ Oleksii

--------------toL00BL1Do6yBuvY8isHmULQ
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
    <div class="moz-cite-prefix">On 5/15/25 12:08 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d923a7dc-f850-4256-8639-310243a26736@suse.com">
      <pre wrap="" class="moz-quote-pre">On 12.05.2025 17:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += dom0less-build.o
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Arm uses

obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o

Why the two differences?</pre>
    </blockquote>
    <pre>Missed that. I have to understand why Arm uses *.init.o, but likely I should do the same for RISC-V.

</pre>
    <blockquote type="cite"
      cite="mid:d923a7dc-f850-4256-8639-310243a26736@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/dom0less-build.c
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include &lt;xen/bug.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/fdt-kernel.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/sched.h&gt;
+
+#include &lt;asm/vsbi-uart.h&gt;
+
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
+{
+    int rc = -EINVAL;
+
+    kinfo-&gt;arch.vsbi_uart = dt_property_read_bool(node, "vsbi_uart");
+
+    if ( kinfo-&gt;arch.vsbi_uart )
+    {
+        rc = domain_vsbi_uart_init(d, NULL);
+        if ( rc &lt; 0 )
+            return rc;
+    }
+
+    if ( rc )
+        panic("%s: what a domain should use as an UART?\n", __func__);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this a reason to panic()? Isn't it possible for domains to be fine
without any UART?</pre>
    </blockquote>
    <pre>Good point.
I think that it is possible to leave without UART. At this stage,
of development I need UART for debug, so automatically the panic() was added.
But I agree, it should be dropped.

</pre>
    <blockquote type="cite"
      cite="mid:d923a7dc-f850-4256-8639-310243a26736@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    domain_vsbi_uart_deinit(d);
+
+    return rc;
+}
+
+void domain_vsbi_uart_deinit(struct domain *d)
+{
+    struct vsbi_uart *vsbi_uart = &amp;d-&gt;arch.vsbi_uart;
+
+    if ( vsbi_uart-&gt;backend_in_domain )
+        printk("%s: backed in a domain isn't supported\n", __func__);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this relevant in a de-init function?</pre>
    </blockquote>
    <pre>Probably not, it was just added to not forget to update domain_vsbi_uart_deinit().

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------toL00BL1Do6yBuvY8isHmULQ--

