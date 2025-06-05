Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D719ACEC12
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 10:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006382.1385560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN64T-0005N5-NQ; Thu, 05 Jun 2025 08:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006382.1385560; Thu, 05 Jun 2025 08:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN64T-0005K4-Ja; Thu, 05 Jun 2025 08:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1006382;
 Thu, 05 Jun 2025 08:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uN64S-0005Jx-8F
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 08:35:32 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a32057d-41e8-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 10:35:30 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-addfe17ec0bso278720966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 01:35:30 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e8780besm1239295266b.94.2025.06.05.01.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 01:35:29 -0700 (PDT)
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
X-Inumbo-ID: 0a32057d-41e8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749112530; x=1749717330; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKCS6idbb1RjJfLA+bREsLVqXVOzL5UH+BkPlFq3J88=;
        b=AtceF6imiLH40onegaXkwQKZWdlCRYDXb5fIwtHtFC6NCrsbn9Diw/MdkemzeKXHa3
         oRMZ3+gFQlNhGN4u4TKvorDFMUJEg2pFA1T4lahGqpC9EEZzubpjCZmmZeMuukVv/Ncr
         OGQym5wSY+TUmRgigttZjtNzLUsWPQJLlt4vmRuykqM84a1cC+N4VUslqoJ80Pav0yEv
         mkfpZfrBp0VAV7LyVsKo6JvTIoJi5fXF8zW1ny9aGqJmJcAVj1TnZ2jMYEx/a1jsxs5P
         nNMkk87y7/XuTKh6a7m93XDWTaQhE1LNGIWTanuPEE3CsaN0W9vdvPajNXQ6oSRd/UbI
         yjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112530; x=1749717330;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKCS6idbb1RjJfLA+bREsLVqXVOzL5UH+BkPlFq3J88=;
        b=wVqRcX6zlUfB87pAWSAAd5Oq9gDYZ3jErjrVGh2/j0O49Hqh7DIxbod4/DB8O9S6+b
         HL1WHVgqr163Na37C8BZ6YLbKlynT/BlVVQWP+cz7WatLxzPwzRxRCMs+Q/WfAYb+W6K
         0AFhdy9vUBaRydQaUyF3pc605mbqo3ReaBabbUUGCpLixr+5voCb99BAMQ12SmOSX0X4
         5XM3bWUyQliwBI6a/FHal6YCh5AmBa2RzpKj5jCfnHwsdFSb/RwyWwnl9kqjmgFR3j6K
         X1RjG0Mrq2diFA3XdsrVyZvf7/GxqcL4mLrtwslR8jqW4dz3eea8CMFCTRCM6+8+dimh
         gfKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSzK5O/3J9py+2mqZBZCEizlhfePKDy44MycMAuH3QeMP1QfYPkUhcJb7ZmaoTQ7y2K1Fczv8gREw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyec5tx2d4PxFDjY8lK+vfoNft8qrnS/jxGbup/kEtEoJO85Lgc
	H8k2bBr3E13WjapiT8/IgGxp0Snvdc9idf6/9Y6MaWlyJpYikWwhqnVv
X-Gm-Gg: ASbGnctMr4w2VsGQ9dauEXW0bzxj8FoyBAxfQGl+fpB6MTsfWP4f5Si/1vGpnIc+AcW
	uyHih63PSLp7r7+G575wiy6lsCD6/UxsCgxF0EjYcLlzuMOK9ZfCIcdo4puu6roAKDa7DcgxQGd
	92drQUi5Bd5BY9kZ4nQTsBo8qq/tS/3QpKnhUyGO48X4QbG/dkFzDKIc8n6rqqLScXoOlqUm9Vv
	lRrFt2u2C+LtkOgMvdYUxAwQ8DqFvWs2V/Cf1qEOpyQ2WysHjIMPBXQQdLU9ZZgAf2uboOpRyTS
	JuEQeRq+4RLyHlxAFM+w+LVFoBr4D1RR8F2lYxG9z3+dthCTEXlEBIZdjtd13sdtjwiOzit83r8
	B1I+4lAF323+LiHHHGDsJQ387
X-Google-Smtp-Source: AGHT+IF8ufuiMBNJcfMFmLqTxeZwgaBPme29wY0NHCBcsjGNRPUqjgiTKkHPUdxo+Ka+c4vYzKdYhg==
X-Received: by 2002:a17:907:2d9f:b0:ad5:6258:996f with SMTP id a640c23a62f3a-ade07828858mr246206866b.19.1749112530017;
        Thu, 05 Jun 2025 01:35:30 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UAtzJz0SzDZu9np20vv0ePEj"
Message-ID: <cc209be4-106b-4089-bd5f-2476afb9f67d@gmail.com>
Date: Thu, 5 Jun 2025 10:35:28 +0200
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
 <63d8882d-bd54-4cbd-8c48-24b296ce4a50@gmail.com>
 <7c487a6e-474b-417e-a120-2d097eb3d178@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7c487a6e-474b-417e-a120-2d097eb3d178@suse.com>

This is a multi-part message in MIME format.
--------------UAtzJz0SzDZu9np20vv0ePEj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/5/25 8:52 AM, Jan Beulich wrote:
> On 04.06.2025 17:41, Oleksii Kurochko wrote:
>> On 6/4/25 5:05 PM, Jan Beulich wrote:
>>> On 04.06.2025 15:42, Oleksii Kurochko wrote:
>>>> On 6/2/25 12:22 PM, Jan Beulich wrote:
>>>>> On 27.05.2025 13:30, Oleksii Kurochko wrote:
>>>>>> On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
>>>>>>>>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>>>>>>>>> +                               &imsic_cfg.guest_index_bits) )
>>>>>>>>> +        imsic_cfg.guest_index_bits = 0;
>>>>>>>>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>>>>>>>>> +    if ( tmp < imsic_cfg.guest_index_bits )
>>>>>>>>> +    {
>>>>>>>>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>>>>>>>>> +               dt_node_name(node));
>>>>>>>>> +        rc = -ENOENT;
>>>>>>>>> +        goto cleanup;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    /* Find number of HART index bits */
>>>>>>>>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>>>>>>> +                               &imsic_cfg.hart_index_bits) )
>>>>>>>>> +    {
>>>>>>>>> +        /* Assume default value */
>>>>>>>>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>>>>>>>>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>>>>>> +            imsic_cfg.hart_index_bits++;
>>>>>>>> Since fls() returns a 1-based bit number, isn't it rather that in the
>>>>>>>> exact-power-of-2 case you'd need to subtract 1?
>>>>>>> Agree, in this case, -1 should be taken into account.
>>>>>> Hmm, it seems like in case of fls() returns a 1-based bit number there
>>>>>> is not need for the check:
>>>>>>      (2) if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>>>
>>>>>> We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
>>>>>> checking *nr_parent_irqs is power-of-two or not, and then just leave the
>>>>>> check (2).
>>>>>> And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
>>>>>> I amn't mistaken something. And if I'm not mistaken, then probably it make
>>>>>> sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
>>>>>> case is so special.
>>>>>>
>>>>>> Does it make sense?
>>>>> Can't easily tell; I'd like to see the resulting code instead of the textual
>>>>> description.
>>>> Here is the code:
>>>>        /* Find number of HART index bits */
>>>>        if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>>                                   &imsic_cfg.hart_index_bits) )
>>>>        {
>>>>            /* Assume default value */
>>>>            imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) +
>>>>                                        (*nr_parent_irqs == 1);
>>>>        }
>>>>
>>>> It seems like it covers all the cases.
>>> *nr_parent_irqs		imsic_cfg.hart_index_bits
>>> 	 1			1 (0 + 1)
>>> 	 2			1
>>> 	 3			2
>>> 	 4			2
>>> 	 5			3
>>> 	 6			3
>>>
>>> IOW why the special casing of *nr_parent_irqs == 1?
>> If we don't have "... + (*nr_parent_irqs == 1)" then for the case when *nr_parent_irqs == 1,
>> we will have imsic_cfg.hart_index_bits = fls(1-1) = fls(0) = 0 because:
>>     #define arch_fls(x)     ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>> and imsic_cfg.hart_index_bits = 0 doesn't seem correct because I expect that if I have only
>> 1 hart then at least 1 bit will be needed to point to it.
> No, why? To pick 1 out of 1 you need no bits at all to represent.

It seems you are right, I thought that DT's binding requires it to be minimum 1, but it could
be zero.
Then it is okay just to initialize hart_index_bits without extra " + (*nr_parent_irqs == 1)":
   imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1);

~ Oleksii

--------------UAtzJz0SzDZu9np20vv0ePEj
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
    <div class="moz-cite-prefix">On 6/5/25 8:52 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7c487a6e-474b-417e-a120-2d097eb3d178@suse.com">
      <pre wrap="" class="moz-quote-pre">On 04.06.2025 17:41, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 6/4/25 5:05 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 04.06.2025 15:42, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 6/2/25 12:22 PM, Jan Beulich wrote:
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
            <pre wrap="" class="moz-quote-pre">Here is the code:
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
          <pre wrap="" class="moz-quote-pre">*nr_parent_irqs		imsic_cfg.hart_index_bits
	 1			1 (0 + 1)
	 2			1
	 3			2
	 4			2
	 5			3
	 6			3

IOW why the special casing of *nr_parent_irqs == 1?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
If we don't have "... + (*nr_parent_irqs == 1)" then for the case when *nr_parent_irqs == 1,
we will have imsic_cfg.hart_index_bits = fls(1-1) = fls(0) = 0 because:
   #define arch_fls(x)     ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
and imsic_cfg.hart_index_bits = 0 doesn't seem correct because I expect that if I have only
1 hart then at least 1 bit will be needed to point to it.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No, why? To pick 1 out of 1 you need no bits at all to represent.</pre>
    </blockquote>
    <pre>It seems you are right, I thought that DT's binding requires it to be minimum 1, but it could
be zero.
Then it is okay just to initialize hart_index_bits without extra " + (*nr_parent_irqs == 1)":
  imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1);
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------UAtzJz0SzDZu9np20vv0ePEj--

