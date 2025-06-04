Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED96ACDF81
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 15:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005562.1385013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMoNu-00038X-OW; Wed, 04 Jun 2025 13:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005562.1385013; Wed, 04 Jun 2025 13:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMoNu-00036e-Lw; Wed, 04 Jun 2025 13:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1005562;
 Wed, 04 Jun 2025 13:42:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFxl=YT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uMoNt-00036Y-Fl
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 13:42:25 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf0ee6cf-4149-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 15:42:24 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so36365775e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 06:42:24 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451e505d40csm48115035e9.0.2025.06.04.06.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 06:42:22 -0700 (PDT)
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
X-Inumbo-ID: bf0ee6cf-4149-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749044544; x=1749649344; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF00C3kY/+mRujOxew52RXLgbaZA6/tfQkWDEf1jLfk=;
        b=G/eCLH/WPynDT7vyJpCvycIkP9rz4zpb4MpmEwpmdxvzSogFnfcRJwLy+9/+Yt3FQW
         pI/GXz1ENci9yDG/kdoTDWny6zevAHd5hQpF0/TkjXnfvoLwHMnXWzOX05uNxh/VFDi3
         1yLsna2m8IO0hbgrKZ1SYuy8dN55laVqNtdfzEGtjYNcGHBS/nzaPq814f+xdFT5rx1y
         16g2rwFRd7dBYwvGbt/NtA0G0cN27CvFZxWWm12QJ9nY7HguzhGyo24lrgXe4MmvHFEi
         rgw+IEUctCiQ7fsGUfnVlwiHkPAH1x3WK0NYp62bFALrH3yDoZgNpUrICT1MpdpwhVtf
         XVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044544; x=1749649344;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PF00C3kY/+mRujOxew52RXLgbaZA6/tfQkWDEf1jLfk=;
        b=INaIbp09NcSVZ/MqOF/rskI/QtwfkHOsKyxQz6Q9PdhYd964vdxyDjcuzonOpt9Z1E
         H+Rv4nVri96+RQ0X0mlTpowKIMbaYxnsTb8XU8guYuxlfFJNMNRzGKtpQkEHL9BHe7Jp
         L0DRHSZRwL+i8K3ERTkRrNkxan6IY3EXCxdp4wCKjWFhEKaW6osGlQerkr4khcnLCzlX
         7oPqqXaL7R2k+hyI5DIQ5DwKQIdNckvwW7cOlyo9VtzHs6ck/Fi1fEa8RnENvOnM5V+P
         7O8TjRaYUmFx9LIN3Yd5z2Mg3NAw7WC4BFW2FQMO0d2s6a2zhelFeZE0JTwD1/ifc43m
         uC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIdl/2nOrIZwzdTpKpngjO5PPJYrPuGmLAjLBnO4a2fDiBRgW1ecsZuev85+w6tPmRY/PxBMLdhLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmZrVX7vlbeHcNDiF9jsMBnQzKw5fXz+ju2rua/nvjupyFz1yt
	K0zXq7G9pqC1mc0/XEKzoI6qOmwuwQa0QVdx4dUYCLsN9KJZsJSWwf4n
X-Gm-Gg: ASbGncudgOmowemzDnX+yi9XwwM7aXiEu7Q/eqV5Dfa5TYQA3DNtWgVs0L9WI7Rmar5
	Dnu+oq4kdN8VWLwHizBzOkwAbMf4G7+idXWaGR4ZFaldxoyOU3TwFlD5PYdC8HKk/Ni7Yw/5s1Y
	u+bgxq58hV86yu/9wX1oxJmYddNSyiKbr02COyxJPMvLzSu1uOD8VrJU3DjfpNQ3/J7EMtV2dvi
	mXtYNr7t3Ge1IVIOjIYVmWZgF0wZRjd0cqyMflXt8pFAdOpApDit4XgGqoA7SmXdncg2AOwSNfJ
	6AQG2K81ZhAmJzvnBOhtjoJb4uZcwwGWQ1xbbeSzczWw4C3ZNPxdJFyscAa6Yy28W8wUMMiCAY+
	nZhXC/uc5HuCfZ233vqd1jGkn
X-Google-Smtp-Source: AGHT+IEN9mJdEqFGYwbNLgvBdx6zyqxxwExmwYHzZgQy9vDh1al1HP4mXTi03WpEPZpCjJJT3vPzAw==
X-Received: by 2002:a05:600c:a015:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-451f0a74191mr27040095e9.13.1749044543371;
        Wed, 04 Jun 2025 06:42:23 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------jLUq03l8pT5mI1PrASgE0rXy"
Message-ID: <aa1e4b21-beae-4b60-8a24-b6227cb8027e@gmail.com>
Date: Wed, 4 Jun 2025 15:42:21 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9ab65452-497c-47b5-af18-92a7b2a86d9e@suse.com>

This is a multi-part message in MIME format.
--------------jLUq03l8pT5mI1PrASgE0rXy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/2/25 12:22 PM, Jan Beulich wrote:
> On 27.05.2025 13:30, Oleksii Kurochko wrote:
>> On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
>>>>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>>>>> +                               &imsic_cfg.guest_index_bits) )
>>>>> +        imsic_cfg.guest_index_bits = 0;
>>>>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>>>>> +    if ( tmp < imsic_cfg.guest_index_bits )
>>>>> +    {
>>>>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>>>>> +               dt_node_name(node));
>>>>> +        rc = -ENOENT;
>>>>> +        goto cleanup;
>>>>> +    }
>>>>> +
>>>>> +    /* Find number of HART index bits */
>>>>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>>> +                               &imsic_cfg.hart_index_bits) )
>>>>> +    {
>>>>> +        /* Assume default value */
>>>>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>>>>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>> +            imsic_cfg.hart_index_bits++;
>>>> Since fls() returns a 1-based bit number, isn't it rather that in the
>>>> exact-power-of-2 case you'd need to subtract 1?
>>> Agree, in this case, -1 should be taken into account.
>> Hmm, it seems like in case of fls() returns a 1-based bit number there
>> is not need for the check:
>>    (2) if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>
>> We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
>> checking *nr_parent_irqs is power-of-two or not, and then just leave the
>> check (2).
>> And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
>> I amn't mistaken something. And if I'm not mistaken, then probably it make
>> sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
>> case is so special.
>>
>> Does it make sense?
> Can't easily tell; I'd like to see the resulting code instead of the textual
> description.

Here is the code:
     /* Find number of HART index bits */
     if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
                                &imsic_cfg.hart_index_bits) )
     {
         /* Assume default value */
         imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) +
                                     (*nr_parent_irqs == 1);
     }

It seems like it covers all the cases.

~ Oleksii

--------------jLUq03l8pT5mI1PrASgE0rXy
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
    <div class="moz-cite-prefix">On 6/2/25 12:22 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9ab65452-497c-47b5-af18-92a7b2a86d9e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.05.2025 13:30, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
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
        <pre wrap="" class="moz-quote-pre">
Hmm, it seems like in case of fls() returns a 1-based bit number there
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
      <pre wrap="" class="moz-quote-pre">
Can't easily tell; I'd like to see the resulting code instead of the textual
description.</pre>
    </blockquote>
    <pre>Here is the code:
    /* Find number of HART index bits */
    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
                               &amp;imsic_cfg.hart_index_bits) )
    {
        /* Assume default value */
        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) +
                                    (*nr_parent_irqs == 1);
    }

It seems like it covers all the cases.

~ Oleksii</pre>
  </body>
</html>

--------------jLUq03l8pT5mI1PrASgE0rXy--

