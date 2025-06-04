Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F371ACE1AA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005707.1385134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMqFV-0006zR-Id; Wed, 04 Jun 2025 15:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005707.1385134; Wed, 04 Jun 2025 15:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMqFV-0006xU-Dn; Wed, 04 Jun 2025 15:41:53 +0000
Received: by outflank-mailman (input) for mailman id 1005707;
 Wed, 04 Jun 2025 15:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFxl=YT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uMqFT-0006xO-S7
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:41:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6deb51c1-415a-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 17:41:49 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad89f9bb725so1383988266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:41:49 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad39e15sm1120304566b.149.2025.06.04.08.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 08:41:48 -0700 (PDT)
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
X-Inumbo-ID: 6deb51c1-415a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749051709; x=1749656509; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PAiwpQjSuqDljXiId6xFvX/8pkDamWfADCpZlqFGx4=;
        b=Q8q0VZHq2RMVlpIXH0i8U5Z9yBsn1x8eOAs4Y0abMalm+oH+HIVFf1DLCZxZqAGyi9
         QUQ0iPmkRpfTKRvOEsTYUGvg/Ochv223y800bbdZoEmUU0LsaGKostshWCuc/rRA2/jL
         sbJMo23n/ILo9a4amWbDFUypPuya/FqA0TqdwA6Ia3Ooms4Rkd1RbRPPzB0OKxN1354z
         8ocLZyT2vwxzpGsZw/1dKgguuS4SEwjmYio/1Ss3YqKjwDbQiqVqFj6ajkUOjn25Zent
         oEyu2yczULGIxjVUztvKKIIoALU+zmGpdM5TzzbInjGHIGBzc8ELDJlX3YERQCPvfkQv
         BNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051709; x=1749656509;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PAiwpQjSuqDljXiId6xFvX/8pkDamWfADCpZlqFGx4=;
        b=EeSaviH70I1IceTe7137zkNQjqZM4HvPmFly9HCFBqZJ3+UMX7W9+o9wm6z0AIWte6
         xEzD+yogpjcva/RIfLN9L63ghIkU10MCqbmY8t2FWOjpNohzZ3eAV1M9jhS0xkSSiWfz
         faNDnROmOy1VyIq2HFKAyiP5DuiIXePF0c/5HI/btZ7EuuZRZAaWak6orgOMrfjqj7Be
         S/HPsBMZ8hGLTh+/vQde6Ad7RRvv+rKssdTb8KcAXYCmynQlKkXvkm9xlviIbo0d3EqO
         NfGVcOZHHiyujffujbvGKuyM2SOCnDHJkBGsBIDxv2B1rgeugFw7QCcKBAneJfX8EV9n
         hDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfzuKGHMqQ3o6qP87gDshoI/+FQnPdA1id4iEMPB4rt6QckHsPgobW8Ksh08+IwicNZi/mMjejMeg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA0lK8TewuBAG1gmxbqbWs+pJgpHJG/Sylg8L0lE0qh4PIEc8m
	ddGp5K37MUaKpmYZ6ot3oxpR6pzmWC76MqIkFF7kuxPr1LsFncswpITY
X-Gm-Gg: ASbGncuLsBtwI21zHuZyjMjZeBinGXhEPyTYO/oIywLHm4uTZUgDRI8VDGNDwlolH+F
	sf692Iiax2DRMvJ3nVmXBALXkqcpIUoKzs/YAPTB8oT8HaN2L+78RVtYeSdt9JzHsrnFns3tkyB
	vnsANeU6Y4e3SEAUXwYJQpjB5L8yAd1T3u2IF/Jm73cOC8py/6Xw6h/AOUnKvkwKciDiCXQxgQS
	1nZS5YzvZNKEgAT6FRnaO50AwYJIGHB2q4bO/g40JRgdH+UPOZtFvCbo/WCkEuW86v+mvK/TiDJ
	4h92/2M8XX7tmWw7wticXmhTuT9Rq6db4rDRqkNnOE+zw6DdzWtXFLGE93/2XkUxt0MQW+Q8hp4
	uy+zveeGyt9vVcVp/yVXIUOsv
X-Google-Smtp-Source: AGHT+IGisFwpTKMJPaS2OeNRrVuPDIiYNgYjOPh70rEPDpw7ZhHD43alxzsQigNYuDmDexMXAhdd6g==
X-Received: by 2002:a17:907:3f1a:b0:ada:4b3c:ea74 with SMTP id a640c23a62f3a-addf904cb61mr321971566b.59.1749051708911;
        Wed, 04 Jun 2025 08:41:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Zf7zaXotRFKOUI97rdkYMQrA"
Message-ID: <63d8882d-bd54-4cbd-8c48-24b296ce4a50@gmail.com>
Date: Wed, 4 Jun 2025 17:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
 <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>
 <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>
 <84c9f65a-b278-4be4-b053-5bfa410f9a97@gmail.com>
 <9ab65452-497c-47b5-af18-92a7b2a86d9e@suse.com>
 <aa1e4b21-beae-4b60-8a24-b6227cb8027e@gmail.com>
 <85d6f812-784a-4959-a1e6-589ebac8887c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <85d6f812-784a-4959-a1e6-589ebac8887c@suse.com>

This is a multi-part message in MIME format.
--------------Zf7zaXotRFKOUI97rdkYMQrA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/25 5:05 PM, Jan Beulich wrote:
> On 04.06.2025 15:42, Oleksii Kurochko wrote:
>> On 6/2/25 12:22 PM, Jan Beulich wrote:
>>> On 27.05.2025 13:30, Oleksii Kurochko wrote:
>>>> On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
>>>>>>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>>>>>>> +                               &imsic_cfg.guest_index_bits) )
>>>>>>> +        imsic_cfg.guest_index_bits = 0;
>>>>>>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>>>>>>> +    if ( tmp < imsic_cfg.guest_index_bits )
>>>>>>> +    {
>>>>>>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>>>>>>> +               dt_node_name(node));
>>>>>>> +        rc = -ENOENT;
>>>>>>> +        goto cleanup;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Find number of HART index bits */
>>>>>>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>>>>> +                               &imsic_cfg.hart_index_bits) )
>>>>>>> +    {
>>>>>>> +        /* Assume default value */
>>>>>>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>>>>>>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>>>> +            imsic_cfg.hart_index_bits++;
>>>>>> Since fls() returns a 1-based bit number, isn't it rather that in the
>>>>>> exact-power-of-2 case you'd need to subtract 1?
>>>>> Agree, in this case, -1 should be taken into account.
>>>> Hmm, it seems like in case of fls() returns a 1-based bit number there
>>>> is not need for the check:
>>>>     (2) if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>
>>>> We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
>>>> checking *nr_parent_irqs is power-of-two or not, and then just leave the
>>>> check (2).
>>>> And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
>>>> I amn't mistaken something. And if I'm not mistaken, then probably it make
>>>> sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
>>>> case is so special.
>>>>
>>>> Does it make sense?
>>> Can't easily tell; I'd like to see the resulting code instead of the textual
>>> description.
>> Here is the code:
>>       /* Find number of HART index bits */
>>       if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>                                  &imsic_cfg.hart_index_bits) )
>>       {
>>           /* Assume default value */
>>           imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) +
>>                                       (*nr_parent_irqs == 1);
>>       }
>>
>> It seems like it covers all the cases.
> *nr_parent_irqs		imsic_cfg.hart_index_bits
> 	 1			1 (0 + 1)
> 	 2			1
> 	 3			2
> 	 4			2
> 	 5			3
> 	 6			3
>
> IOW why the special casing of *nr_parent_irqs == 1?

If we don't have "... + (*nr_parent_irqs == 1)" then for the case when *nr_parent_irqs == 1,
we will have imsic_cfg.hart_index_bits = fls(1-1) = fls(0) = 0 because:
   #define arch_fls(x)     ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
and imsic_cfg.hart_index_bits = 0 doesn't seem correct because I expect that if I have only
1 hart then at least 1 bit will be needed to point to it.

~ Oleksii




--------------Zf7zaXotRFKOUI97rdkYMQrA
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
    <div class="moz-cite-prefix">On 6/4/25 5:05 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:85d6f812-784a-4959-a1e6-589ebac8887c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 04.06.2025 15:42, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 6/2/25 12:22 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 27.05.2025 13:30, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">+    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
+                               &amp;imsic_cfg.guest_index_bits) )
+        imsic_cfg.guest_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
+    if ( tmp &lt; imsic_cfg.guest_index_bits )
+    {
+        printk(XENLOG_ERR "%s: guest index bits too big\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    /* Find number of HART index bits */
+    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
+                               &amp;imsic_cfg.hart_index_bits) )
+    {
+        /* Assume default value */
+        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
+        if ( BIT(imsic_cfg.hart_index_bits, UL) &lt; *nr_parent_irqs )
+            imsic_cfg.hart_index_bits++;
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Since fls() returns a 1-based bit number, isn't it rather that in the
exact-power-of-2 case you'd need to subtract 1?
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Agree, in this case, -1 should be taken into account.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Hmm, it seems like in case of fls() returns a 1-based bit number there
is not need for the check:
   (2) if ( BIT(imsic_cfg.hart_index_bits, UL) &lt; *nr_parent_irqs )

We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
checking *nr_parent_irqs is power-of-two or not, and then just leave the
check (2).
And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
I amn't mistaken something. And if I'm not mistaken, then probably it make
sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
case is so special.

Does it make sense?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Can't easily tell; I'd like to see the resulting code instead of the textual
description.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Here is the code:
     /* Find number of HART index bits */
     if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
                                &amp;imsic_cfg.hart_index_bits) )
     {
         /* Assume default value */
         imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) +
                                     (*nr_parent_irqs == 1);
     }

It seems like it covers all the cases.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
*nr_parent_irqs		imsic_cfg.hart_index_bits
	 1			1 (0 + 1)
	 2			1
	 3			2
	 4			2
	 5			3
	 6			3

IOW why the special casing of *nr_parent_irqs == 1?
</pre>
    </blockquote>
    <pre>If we don't have "... + (*nr_parent_irqs == 1)" then for the case when *nr_parent_irqs == 1,
we will have imsic_cfg.hart_index_bits = fls(1-1) = fls(0) = 0 because:
  #define arch_fls(x)     ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
and imsic_cfg.hart_index_bits = 0 doesn't seem correct because I expect that if I have only
1 hart then at least 1 bit will be needed to point to it.

~ Oleksii



</pre>
    <p><br>
    </p>
  </body>
</html>

--------------Zf7zaXotRFKOUI97rdkYMQrA--

