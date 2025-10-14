Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3326BD9B75
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 15:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142819.1476745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8f62-0001pc-Pz; Tue, 14 Oct 2025 13:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142819.1476745; Tue, 14 Oct 2025 13:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8f62-0001lJ-Ma; Tue, 14 Oct 2025 13:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1142819;
 Tue, 14 Oct 2025 13:29:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QInk=4X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v8f62-0001S7-0C
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 13:29:46 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d92f16e4-a901-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 15:29:45 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6399706fd3cso7917083a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 06:29:45 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d951cfe7sm1162940466b.73.2025.10.14.06.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 06:29:44 -0700 (PDT)
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
X-Inumbo-ID: d92f16e4-a901-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760448585; x=1761053385; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi+Lbw40+IKRRaPLAGKsWkBnluseHyKM0vAd4i2nrCo=;
        b=lB14P8dLrI/jIE7EuXQBb217Wz2xnyKYZFPdEIyU/YFYuIbPAaF4wID/vEWw3+qaS9
         81tlP5uK8rw5da2f+cZjtwQvGWO2jQVtdFGzKgFW3DDqFDkYLpaZ2SK7Lby4yVg2zsMc
         spmR1RHo71PwykcyEfNshNOUgW/sG7LZC3NohiospvjYhPv71rv+/DWS6XT42TvQtTTq
         ub+ObJQQgkrbt4zDM9ei9VeNHORsgmP04EXTqXOf8w7HfSBswVm4taxbCDJvE9evrqpB
         stEkxcuZ7WHsYVzhOLXms9Kk1IqP9TeEBvxteCr8/VqVpa7Xn86Os2UEmYCwMTOWspGQ
         o7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448585; x=1761053385;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zi+Lbw40+IKRRaPLAGKsWkBnluseHyKM0vAd4i2nrCo=;
        b=ZPAzUBxBVX8OtL/m3dWDrFTF2t4Gs4RMztatUv2RyIoZfE+g6Pp4Uzzth6B3p+qlUa
         MRQY4UaN2YPPPjWsfMJmPnp29mktSksP3ky5NWzxd83kPaGgmvxB4O4uSLisTP9ljSxM
         EcRTyhZldUycKy6Ij8V0sByJGsfKZjifsemOS5rUHet8zGTfVcffpqxsydavsF1coC6o
         w5iNmqv2EGtSLc5Gb8W/Q58/CaDo3cbZGNCH5apiefA3cHBUuTGfRgp4YHveLWXjaxXP
         ipraR9OYvA5Xby18vyizOFCxcu2pMHbKwHkiVdoLUw2b2A2fFsZpwHoINNwVR41JqdDB
         DCfw==
X-Forwarded-Encrypted: i=1; AJvYcCU0AyX9XeTNRnWjzJejXTNAfF//r5aBXGcv//zLojvdtZXtULDA/pCxaG+5dysbmYP9lkw0QOOejyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6VBrrfxygEhs1YasvE4+TRvr9Tp3QXRBQMcp2jv4s13lkrqaB
	75lc7eFN88uUGYTscQlG3lTZaGIaLo3rf56QGR9Ao9LOgO1pH9CPXPdv
X-Gm-Gg: ASbGncvsldPT0DC3GPk2gsAob1JH8qOGtsb4aM+HRzmWUaeGtJ+Usg3MMQEsDe0G/0d
	3XQRKT7h3ASM42hjQ8fC9LBOt+fvfQICT+RHI3B84v01ESIFqT86o+k2t9YpQQ9ys+ZpoGHHVqk
	Lx8IZM5YD5qNIodDn6AiYQaOrBiDLOO+SdfrrLPTy3cCpci1GGuj/kXaobQ0SfCTtkie/Fmw/rk
	40JeJFoT7/fxFN4HJuXIFqHkAksNxOQrpC9GehSzP3iR/jDQZKwjezmLCeB2HGwU9afS8Vq7925
	njER0FHXhkYJ/tEghSmhwBmy2yyoRJD39ON8cpSMMXOIsZVFoiUe5EuzXKMpf2ZxksQq45Gf/0m
	tosmUW0KG0g5X3PtPy3p15k2DFoy/XhUL+w390PyPdXKsmzIG9Mhl3XfX+3St8EogBVx1rsF22v
	JQvwykP99R+1gkIxvL5B7+Ww==
X-Google-Smtp-Source: AGHT+IEI0TCUWnWZJJcbUmTaLwZY2dM9x74qMGq//AzqQ+mG5UGFIOdzW/x6t7cg73Q/XTY7JBmuEg==
X-Received: by 2002:a17:907:d1d:b0:b41:873d:e226 with SMTP id a640c23a62f3a-b50aa48cabdmr2279861166b.1.1760448584415;
        Tue, 14 Oct 2025 06:29:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Sx1080vPSXFABen7ZFCZzeIC"
Message-ID: <942c8e1d-ea1e-4573-972d-d64144da98c0@gmail.com>
Date: Tue, 14 Oct 2025 15:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251013211106.8720-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251013211106.8720-1-jason.andryuk@amd.com>

This is a multi-part message in MIME format.
--------------Sx1080vPSXFABen7ZFCZzeIC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/25 11:11 PM, Jason Andryuk wrote:
> io_apic_level_ack_pending() will end up in an infinite loop if
> entry->pin == -1.  entry does not change, so it will keep reading -1.
>
> Convert to a proper for loop so that continue works.  Add a new helper,
> next_entry(), to handle advancing to the next irq_pin_list entry.
>
> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
> Signed-off-by: Jason Andryuk<jason.andryuk@amd.com>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> v2:
> continue (not break) for pin == -1.
>
> I added the next_entry() helper since putting the expression in the for
> loop is a little cluttered.  The helper can also be re-used for other
> instances within the file.
> ---
>   xen/arch/x86/io_apic.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index c384f10c1b..7b58345c96 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
>   }
>   custom_param("ioapic_ack", setup_ioapic_ack);
>   
> +static struct irq_pin_list *next_entry(struct irq_pin_list *entry)
> +{
> +    if ( !entry->next )
> +        return NULL;
> +
> +    return irq_2_pin + entry->next;
> +}
> +
>   static bool io_apic_level_ack_pending(unsigned int irq)
>   {
>       struct irq_pin_list *entry;
>       unsigned long flags;
>   
>       spin_lock_irqsave(&ioapic_lock, flags);
> -    entry = &irq_2_pin[irq];
> -    for (;;) {
> +    for ( entry = &irq_2_pin[irq]; entry ; entry = next_entry(entry) ) {
>           unsigned int reg;
>           int pin;
>   
> @@ -1609,9 +1616,6 @@ static bool io_apic_level_ack_pending(unsigned int irq)
>               spin_unlock_irqrestore(&ioapic_lock, flags);
>               return 1;
>           }
> -        if (!entry->next)
> -            break;
> -        entry = irq_2_pin + entry->next;
>       }
>       spin_unlock_irqrestore(&ioapic_lock, flags);
>   
--------------Sx1080vPSXFABen7ZFCZzeIC
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
    <div class="moz-cite-prefix">On 10/13/25 11:11 PM, Jason Andryuk
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251013211106.8720-1-jason.andryuk@amd.com">
      <pre wrap="" class="moz-quote-pre">io_apic_level_ack_pending() will end up in an infinite loop if
entry-&gt;pin == -1.  entry does not change, so it will keep reading -1.

Convert to a proper for loop so that continue works.  Add a new helper,
next_entry(), to handle advancing to the next irq_pin_list entry.

Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
Signed-off-by: Jason Andryuk <a class="moz-txt-link-rfc2396E" href="mailto:jason.andryuk@amd.com">&lt;jason.andryuk@amd.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251013211106.8720-1-jason.andryuk@amd.com">
      <pre wrap="" class="moz-quote-pre">
---
v2:
continue (not break) for pin == -1.

I added the next_entry() helper since putting the expression in the for
loop is a little cluttered.  The helper can also be re-used for other
instances within the file.
---
 xen/arch/x86/io_apic.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c384f10c1b..7b58345c96 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
 }
 custom_param("ioapic_ack", setup_ioapic_ack);
 
+static struct irq_pin_list *next_entry(struct irq_pin_list *entry)
+{
+    if ( !entry-&gt;next )
+        return NULL;
+
+    return irq_2_pin + entry-&gt;next;
+}
+
 static bool io_apic_level_ack_pending(unsigned int irq)
 {
     struct irq_pin_list *entry;
     unsigned long flags;
 
     spin_lock_irqsave(&amp;ioapic_lock, flags);
-    entry = &amp;irq_2_pin[irq];
-    for (;;) {
+    for ( entry = &amp;irq_2_pin[irq]; entry ; entry = next_entry(entry) ) {
         unsigned int reg;
         int pin;
 
@@ -1609,9 +1616,6 @@ static bool io_apic_level_ack_pending(unsigned int irq)
             spin_unlock_irqrestore(&amp;ioapic_lock, flags);
             return 1;
         }
-        if (!entry-&gt;next)
-            break;
-        entry = irq_2_pin + entry-&gt;next;
     }
     spin_unlock_irqrestore(&amp;ioapic_lock, flags);
 
</pre>
    </blockquote>
  </body>
</html>

--------------Sx1080vPSXFABen7ZFCZzeIC--

