Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAFCACED5E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006514.1385700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7dc-0000Do-Pe; Thu, 05 Jun 2025 10:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006514.1385700; Thu, 05 Jun 2025 10:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7dc-0000CL-Lw; Thu, 05 Jun 2025 10:15:56 +0000
Received: by outflank-mailman (input) for mailman id 1006514;
 Thu, 05 Jun 2025 10:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uN7da-0000CF-Sd
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:15:55 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 102b7fcb-41f6-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:15:53 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60462e180e2so1488109a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:15:53 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6070e505199sm1463883a12.64.2025.06.05.03.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:15:52 -0700 (PDT)
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
X-Inumbo-ID: 102b7fcb-41f6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749118553; x=1749723353; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5EgnmYs7+hDLNHmIjVv1NhRqfs+w9AEvSvwUuMUpGI=;
        b=Y71RYJ+59py41O+NaO5/cPsZXI77EWDfyKb5CY4pERgBWz1q7Ave9tRcaLmGBJEEvC
         y/AhLJ4JsnkdNu88HSsiqmZFZLrm/xr/I14nWMyZ5ctWQijXjU8sfZSXQ0frnZs7dEZ2
         w0/KOQH2bkj4iYf3Bp8/hgShJhSednu9ubJ7CGqkvEQ/ShRoHSa71c2WhSa8sunFNV5A
         zxCvbzADr9qncDtoBldqFp5leJVTQrK/X+7+PPjKNTSzDBMZemF01PzhBkDuzaWoN7j9
         e0wRTX6npIhwnL+xOGm1hpgLARk+svALSqUCyaKXiptZyhaDxP1AC1TgteA70H4oWQUF
         0lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749118553; x=1749723353;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O5EgnmYs7+hDLNHmIjVv1NhRqfs+w9AEvSvwUuMUpGI=;
        b=EPxW2WvNgxhnnOXvNb2UQE1Wy1quGCSwaHj8ebOK8KXZDW3W3K3909YWTxCdBd/Zzm
         FG01N4ZzajE7oEmN0xW6rx5W3IgLbz3ThtqUbgw61jZlKh8UHsNTBwuJxDMCeMU6Kl5i
         Xr6cYg5w/wADhbWLFzwn0CAgyTL397plEGVbnnpffbj8CZlObC3QCJGXSVBvO99iPlWR
         re3OwjNcafeKyPFPJNlmpi5rHFvg16MMgtetoXXSme8pniMSvYUBrlO8U/Oar02d7apS
         eaoHTg06ObBJeB2FwCZX2yDQRoqZTiLd7SUpeZ4Zpf8wtcok0Sy4TiTtIeJ7buZrWP9q
         XADA==
X-Forwarded-Encrypted: i=1; AJvYcCWTrjLrP+UUBRQJxhfUvSb5A7+Hff/gpHCzmU9cRBZii+/v11XnLPeRjTBCaXYl78zDCYXnM0hrSHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBQF/wv+YTw2E9+wVIOVRoRXehprz5gzXKwURXp4EhnVdT4+tE
	DGcnQjqVD2qwtkcaVFlDY+mY2YVUx4d9glvn3CAPPqMzjceVfUEQPwKF
X-Gm-Gg: ASbGnctdIZjBhy0S2tYgdUxFiB8HAPUdSyHKnmzUKZa1uk9/5FB3l7+jk7UIYiLGYd2
	COKAthQTSxew0BgdZX1UWThSLt1n4mMFD6zxDaj4p011jCvCxhqVxbYeeX8ss7Vtf0W0cs73nqA
	vMghf35+UiAtx5IBkD/Aeidaj3/xEbetemCisqjjpXz0yOYMHHXhRBWv1/hRUfQsJH9WG3Mw4LW
	Fkr8OpDCyy7EOKZBGvdnOxuMvFVqEVpVDXAwg3V+0iWz0NKpSqXAtlrrQJpR5oOpIsCkPKj3NNj
	A3ZtdxMvhlEmOCpUjDaZJxR6P6daNMe1F7c8wYXETRv7v40d0TeAH4Zl5iI1d4NWsx0EvZwHw01
	sXKEtc4pvoDv3OAFfsk/Nf0p6G2EQTEbXv10=
X-Google-Smtp-Source: AGHT+IGQWwLRVyLMO/INhpCtFu7WNpD3X+7WQxptfd+l12vJ6lYHckJNwRhgRdS+TXUQI7WB/38RFg==
X-Received: by 2002:a05:6402:1d53:b0:602:1d01:2883 with SMTP id 4fb4d7f45d1cf-606e98b0c65mr5905664a12.1.1749118553049;
        Thu, 05 Jun 2025 03:15:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0VKZK6KrDGQgAgTG8WIl40B8"
Message-ID: <fc13f204-91ea-4639-8b37-5d1ea022fa3d@gmail.com>
Date: Thu, 5 Jun 2025 12:15:51 +0200
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
 <8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com>
 <d3dd9f90-4bef-4f75-b36c-0a5834a5a0ae@gmail.com>
 <f0166994-be40-4210-b110-554d46535c85@suse.com>
 <e5434c6d-599c-4b7b-b67a-43ae7830eb0c@gmail.com>
 <2de0a33e-75ff-449c-a0db-6a2279b9e484@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2de0a33e-75ff-449c-a0db-6a2279b9e484@suse.com>

This is a multi-part message in MIME format.
--------------0VKZK6KrDGQgAgTG8WIl40B8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/5/25 11:42 AM, Jan Beulich wrote:
> On 05.06.2025 11:13, Oleksii Kurochko wrote:
>> On 6/5/25 8:50 AM, Jan Beulich wrote:
>>> On 04.06.2025 17:36, Oleksii Kurochko wrote:
>>>> On 6/2/25 12:21 PM, Jan Beulich wrote:
>>>>> On 26.05.2025 20:44, Oleksii Kurochko wrote:
>>>>>> On 5/22/25 4:46 PM, Jan Beulich wrote:
>>>>>>> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>>>>>>>> +    /* Check MMIO register sets */
>>>>>>>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>>>>>>>> +    {
>>>>>>>> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
>>>>>>>> +        {
>>>>>>>> +            rc = -ENOMEM;
>>>>>>>> +            goto imsic_init_err;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
>>>>>>>> +                                   &imsic_cfg.mmios[i].size);
>>>>>>>> +        if ( rc )
>>>>>>>> +        {
>>>>>>>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>>>>>>>> +                   node->name, i);
>>>>>>>> +            goto imsic_init_err;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        base_addr = imsic_cfg.mmios[i].base_addr;
>>>>>>>> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>>>>>>>> +                           imsic_cfg.hart_index_bits +
>>>>>>>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>>>>>>>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>>>>>>>> +                       imsic_cfg.group_index_shift);
>>>>>>>> +        if ( base_addr != imsic_cfg.base_addr )
>>>>>>>> +        {
>>>>>>>> +            rc = -EINVAL;
>>>>>>>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>>>>>>>> +                   node->name, i);
>>>>>>>> +            goto imsic_init_err;
>>>>>>>> +        }
>>>>>>> Maybe just for my own understanding: There's no similar check for the
>>>>>>> sizes to match / be consistent wanted / needed?
>>>>>> If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
>>>>>> provide, IMO.
>>>>>> So I don't what is possible range for imsic_cfg.mmios[i].size.
>>>>> Well, all I can say is that's it feels odd that you sanity check base_addr
>>>>> but permit effectively any size.
>>>> Okay, I think I have two ideas how to check the size:
>>>> 1. Based on guest bits from IMSIC's DT node. QEMU calculates a size as:
>>>>        for (socket = 0; socket < socket_count; socket++) {
>>>>            imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>>>>            imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
>>>>                         s->soc[socket].num_harts;
>>>>        ...
>>>>       where:
>>>>         #define IMSIC_MMIO_PAGE_SHIFT          12
>>>>         #define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
>>>>         
>>>>         #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
>>>>                 (1U << (__guest_bits))
>>>>         #define IMSIC_HART_SIZE(__guest_bits)                 \
>>>>                 (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
>>>>
>>>> 2. Just take a theoretical maximum for S-mode IMSIC's node:
>>>>        16,384 * 64 1(S-mode interrupt file) + 63(max guest interrupt files)) * 4 KiB
>>>>       Where,
>>>>         16,384 - maximum possible amount of harts according to AIA spec
>>>>         64 - a maximum amount of possible interrupt file for S-mode IMSIC node:
>>>>              1 - S interupt file + 63 guest interrupt files.
>>>>         4 Kib - a maximum size of one interrupt file.
>>>>
>>>> Which option is preferred?
>>> I would have said 2, if your outline used "actual" rather than "maximum" values.
>> In option 2 maximum possible values are used. If we want to use "actual" values then
>> the option 1 should be used.
> Actually I was wrong with request "actual" uniformly. It's only the hart count where
> I meant to ask for that. For interrupts we should allow the maximum possible unless
> we already know their count.

Do you mean 'interrupt file' here? If yes, then an amount of them shouldn't be bigger
then 1 + BIT(guest_bits).

~ Oleksii

--------------0VKZK6KrDGQgAgTG8WIl40B8
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
    <div class="moz-cite-prefix">On 6/5/25 11:42 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2de0a33e-75ff-449c-a0db-6a2279b9e484@suse.com">
      <pre wrap="" class="moz-quote-pre">On 05.06.2025 11:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 6/5/25 8:50 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 04.06.2025 17:36, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 6/2/25 12:21 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 26.05.2025 20:44, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 5/22/25 4:46 PM, Jan Beulich wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i &lt; nr_mmios; i++ )
+    {
+        if ( !alloc_cpumask_var(&amp;imsic_cfg.mmios[i].cpus) )
+        {
+            rc = -ENOMEM;
+            goto imsic_init_err;
+        }
+
+        rc = dt_device_get_address(node, i, &amp;imsic_cfg.mmios[i].base_addr,
+                                   &amp;imsic_cfg.mmios[i].size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
+
+        base_addr = imsic_cfg.mmios[i].base_addr;
+        base_addr &amp;= ~(BIT(imsic_cfg.guest_index_bits +
+                           imsic_cfg.hart_index_bits +
+                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &amp;= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) &lt;&lt;
+                       imsic_cfg.group_index_shift);
+        if ( base_addr != imsic_cfg.base_addr )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Maybe just for my own understanding: There's no similar check for the
sizes to match / be consistent wanted / needed?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
provide, IMO.
So I don't what is possible range for imsic_cfg.mmios[i].size.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Well, all I can say is that's it feels odd that you sanity check base_addr
but permit effectively any size.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Okay, I think I have two ideas how to check the size:
1. Based on guest bits from IMSIC's DT node. QEMU calculates a size as:
      for (socket = 0; socket &lt; socket_count; socket++) {
          imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
          imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
                       s-&gt;soc[socket].num_harts;
      ...
     where:
       #define IMSIC_MMIO_PAGE_SHIFT          12
       #define IMSIC_MMIO_PAGE_SZ             (1UL &lt;&lt; IMSIC_MMIO_PAGE_SHIFT)
       
       #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
               (1U &lt;&lt; (__guest_bits))
       #define IMSIC_HART_SIZE(__guest_bits)                 \
               (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)

2. Just take a theoretical maximum for S-mode IMSIC's node:
      16,384 * 64 1(S-mode interrupt file) + 63(max guest interrupt files)) * 4 KiB
     Where,
       16,384 - maximum possible amount of harts according to AIA spec
       64 - a maximum amount of possible interrupt file for S-mode IMSIC node:
            1 - S interupt file + 63 guest interrupt files.
       4 Kib - a maximum size of one interrupt file.

Which option is preferred?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I would have said 2, if your outline used "actual" rather than "maximum" values.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
In option 2 maximum possible values are used. If we want to use "actual" values then
the option 1 should be used.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Actually I was wrong with request "actual" uniformly. It's only the hart count where
I meant to ask for that. For interrupts we should allow the maximum possible unless
we already know their count.</pre>
    </blockquote>
    <pre>Do you mean 'interrupt file' here? If yes, then an amount of them shouldn't be bigger
then 1 + BIT(guest_bits).</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------0VKZK6KrDGQgAgTG8WIl40B8--

