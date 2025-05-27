Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E72AC4D62
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 13:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998259.1379042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJsVY-0003Yr-FA; Tue, 27 May 2025 11:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998259.1379042; Tue, 27 May 2025 11:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJsVY-0003Vn-BW; Tue, 27 May 2025 11:30:12 +0000
Received: by outflank-mailman (input) for mailman id 998259;
 Tue, 27 May 2025 11:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQZn=YL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uJsVW-0003Vh-QU
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 11:30:10 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0110930-3aed-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 13:30:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6049431b409so3343918a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 04:30:06 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60451d367cfsm4440534a12.22.2025.05.27.04.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 04:30:04 -0700 (PDT)
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
X-Inumbo-ID: f0110930-3aed-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748345405; x=1748950205; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GQfAaP+lLUrK5yrJj9zn8WsI4xfEXBm9NfT0JYhQ6o=;
        b=KsPwsMCiO1gw9b/DmcF/4gJWBJrQjIuVaDrDY0WW1wA+0tvYtrEiwGiyvb8/n0QHbF
         nd5fFPzcwGgTTeEZBjrQiHedvSDsqyh5Xxv4BDwqU7pum8I3ZRJrWtWb4votTXbDwXI1
         E+IbrRm6T8+7FSpFrL2LO1V2qgTYNcAv8b54f1WZ7nPQqw0z6YGnoQn5caNCiBFAOHDq
         9piKfkXfzj0+0R4B6Ns+LfLLeFZ3YavvA/qFbAJLoGBdju7VBUhDNFGIDGWq4LfnYzl3
         p02gWeeJWUGn4RTI1wHwrmk4hMuIHw7k5BaJof8a5mxVV4RFjpPovlfb6FtEX2i6ZclD
         Y5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345405; x=1748950205;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1GQfAaP+lLUrK5yrJj9zn8WsI4xfEXBm9NfT0JYhQ6o=;
        b=DX2KtgNkDphKi996h+cKBomx+CwMrZ5EcPPMU1+LlygPuRz8SGKtfOjziBYzui42rF
         uFaGqkLckxwCl5GPuSuEo/+WlNm6yVTLdwNvRdlv9dhmAHrFLi8CmGm9Pjk1B2itCrOY
         gkA7CEy/XKHLpEqAzb4Mfz/eTcexffsP1rXI2qRGT6kOnKmvqtGw4v9w4ggp2BBJdxPP
         JJlPXXGY5y7B6zDk2r8GNF+Wk9cFwAlzMQA+Y5+yLcH7NmVbrdHYEFygd8im77PVfi1s
         zkqFRKUTV1D4o0VzKjVMSzOBt0NIr61D6xsctDGB98udPmsm7l09IWveLGh+iZOjOShk
         bpOg==
X-Forwarded-Encrypted: i=1; AJvYcCW0LT977i1xpuPYtbgErwZxYwTMwaiRAvdhNgVtwTowla+rwsMF8UOBodov3f7Col8tqKw61LpSqK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqAy5WwNftDUHSg58hEinELdP4M3GhT4RxGfT9OfHnleL0mr5y
	8wVrN9S2cucr1gclY4Z9LUOu3fXGb4MvYRvkEnaZmXggr7wITXZgr9G4
X-Gm-Gg: ASbGnctmUccQLUlNWOhb3dDuedjpS76Y9ik1FF5rHYnXjDUcrSCFM3qkqoS+dnnvaRv
	8KhvpHLFC55kD3fF2XkGUCMdhJ4kpibxPpeZL6Mc1nEnukLYh/dhOh7lb8yB3MNQNVQh4UGQbEU
	jrGeLpCuFjoGxtIh306lHDjx5PZYs4L5eMrw22MlC5jvxSQcrfWemkNdGt1gL78PsgkpONSRdsT
	DKvP5ts5KxOCAzaAcO2WzOBgcvGbrFFQQnWwz+CTEWCRy1b4/1GFShf5mGTpVdgXAlgpbFLWDWj
	bByfcpr26b8cyqHrJ+DHzrJaZ3YadGgqSGeWk7tABsMUalnvc61gMz2OzCv6LX+2p2BsGYly7Lj
	dCWDN6gh34w+LwpSx9Nmq6BPq
X-Google-Smtp-Source: AGHT+IHaxnl3Dfkx0Do1O/z3xSjAT/Xe64liVkJCAfXwRpUIVDj7vgNrKWpkMAL8HleLV7usLg/d7w==
X-Received: by 2002:a05:6402:35c7:b0:601:9943:2eb9 with SMTP id 4fb4d7f45d1cf-602da5f8c2cmr10001492a12.24.1748345405103;
        Tue, 27 May 2025 04:30:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------m9za0OYIcoAqlIfaLFoZTiUk"
Message-ID: <84c9f65a-b278-4be4-b053-5bfa410f9a97@gmail.com>
Date: Tue, 27 May 2025 13:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>

This is a multi-part message in MIME format.
--------------m9za0OYIcoAqlIfaLFoZTiUk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
>>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>>> +                               &imsic_cfg.guest_index_bits) )
>>> +        imsic_cfg.guest_index_bits = 0;
>>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>>> +    if ( tmp < imsic_cfg.guest_index_bits )
>>> +    {
>>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>>> +               dt_node_name(node));
>>> +        rc = -ENOENT;
>>> +        goto cleanup;
>>> +    }
>>> +
>>> +    /* Find number of HART index bits */
>>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>> +                               &imsic_cfg.hart_index_bits) )
>>> +    {
>>> +        /* Assume default value */
>>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>> +            imsic_cfg.hart_index_bits++;
>> Since fls() returns a 1-based bit number, isn't it rather that in the
>> exact-power-of-2 case you'd need to subtract 1?
> Agree, in this case, -1 should be taken into account.

Hmm, it seems like in case of fls() returns a 1-based bit number there
is not need for the check:
  (2) if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )

We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
checking *nr_parent_irqs is power-of-two or not, and then just leave the
check (2).
And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
I amn't mistaken something. And if I'm not mistaken, then probably it make
sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
case is so special.

Does it make sense?

~ Oleksii

--------------m9za0OYIcoAqlIfaLFoZTiUk
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
    <div class="moz-cite-prefix">On 5/26/25 8:44 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com">
      <blockquote type="cite"
        cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
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
exact-power-of-2 case you'd need to subtract 1?</pre>
      </blockquote>
      <pre>Agree, in this case, -1 should be taken into account.</pre>
    </blockquote>
    <pre>Hmm, it seems like in case of fls() returns a 1-based bit number there
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

~ Oleksii
</pre>
  </body>
</html>

--------------m9za0OYIcoAqlIfaLFoZTiUk--

