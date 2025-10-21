Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF355BF5DBD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 12:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147003.1479329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB9qJ-0003rn-Db; Tue, 21 Oct 2025 10:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147003.1479329; Tue, 21 Oct 2025 10:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB9qJ-0003pv-AO; Tue, 21 Oct 2025 10:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1147003;
 Tue, 21 Oct 2025 10:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=End2=46=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vB9qH-0003pp-RZ
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 10:43:50 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1d91ff1-ae6a-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 12:43:46 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63c4f1e7243so4629569a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 03:43:46 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48a91e93sm9117147a12.6.2025.10.21.03.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 03:43:44 -0700 (PDT)
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
X-Inumbo-ID: d1d91ff1-ae6a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761043425; x=1761648225; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54zEdGo/N/tkR8qg833ClVdCVpczJjRqXLjYtVkiHoc=;
        b=MHa0u14SpFllysnTWN5DOQ2CROH50qGFZqPlSetkYUc7jzCIXYpfT1bet1s/tGGiwl
         pXvyEs3Uxf6yGMFKRuRVZiVTfKSUjvlPyLpUWfwFJm2zQtvG140ulBJZ30sV4VWWrtF1
         xKVrtC0ynniyw3LhPjyvD/DvwnUsqRL0RCHZkblTv4VM6yWLEC2GeSSp7K3AOldjAfvb
         YAORmgMR17q5qf6BBq41Jxs207e+VcvDmmQYLAEzHiWJGZ5h7jNjU6Mgnm0YTmCK6xNp
         P36F57H1hlOuNWAbng2d1JY5DI9ErtJifxKwI8H7G+zbXgE+FICZ/jmt/JHzLqFUb2UJ
         kqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043425; x=1761648225;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=54zEdGo/N/tkR8qg833ClVdCVpczJjRqXLjYtVkiHoc=;
        b=r1c27c33de/Q6MZ7rHzQQMRiQEv6KnOnAh6+dMv72OWyTTLEifoSPY6M/c/EKUqn1q
         pMMCwV6aye0HardaRNnyVGA0bzOGla4oLG6e/g7QhfIK6KT68g1yRJQux1MrfWosGAEA
         TD1W294NPvqVYqrFc9kd+BwiD+JPJSfmHKLVUhgSYG9MpX+C9mgufu6irUC/Q5nPV6Sa
         l2Q9iDIZNp/78kVoPBKr20JS9Rs87ec0jNHdZGIIaT5UALJad2Exq+5/gn+GxPzDd0I0
         A9Eg/99hix3fWeTQMrLIinF6zviM+Wkv/4mghqIeUgMQq2Evx/JXpV+A4H2eNAU6afyv
         gf3w==
X-Forwarded-Encrypted: i=1; AJvYcCXx+uWFS6o6ls7vdA3RGc+PxC7Rt0LDz0ibaO2UgCfnCzbtzIVE/6IHra6WrVSkgk0SGJVn1Wa03u0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpaXabZGxA2jkv4H2Dc4m9mgtjE5+jNJBQMhYW2OGtdYmIuclm
	UZJDs5l0SoYcIWEiz/W4nN/OoTPMDndgMIOBpax+FkUEufAnVLX8bzbj
X-Gm-Gg: ASbGncsnwv2FJ0vdM6ipZxRj5YM0+i/b3QpUb+biAyDCUbKNV4kane/YRzOb2s1qwTH
	Yia6+MzXdwyybNgBlbiyHshDsV5qTSsdAxkrszcgAzn5KkDbW4qbT9jv1jpRB+4gNOf1lYY0d4h
	na7aorj+NoGGGjIbK1Och+OWJf1pxOM5/a+Nhcrqk2lVBYq4IUjWsz1/NvJilL/nUUzsak62VUH
	Tu9PFzFPWonC3m6AHK9jeSqoeNPEL8p+cdz7D26HsYpYJY6aiiw3x5yUYs1l0Nag7dEWiWr+WjA
	aRKB+jXev82+UkJUcLUW+hSUi3KM4v4maFbX9sC5rvE7b8MUXgT07NphIIgD9VUEjeeosIr+/c+
	zI6fa7YrMPuulhZSDOcrNk/dGUOTTCpZMWaOsMJ9sNPP5q/Y41Me1NvlOkkpxAjvhO/7kFAJJJc
	sj481b8R7sfaR8OQwYJAcWZgiEfSv0pnnqRpWDy73dzEzfrNutlBdiphkb
X-Google-Smtp-Source: AGHT+IHH4eepg5IwdHWjo9384H2bYDtRz5x/EI7O5AjXUa2XH++pKAG483IIjOp4V0R5EkVVLWCNDA==
X-Received: by 2002:a05:6402:510b:b0:63b:f157:bc2d with SMTP id 4fb4d7f45d1cf-63c1f62af3emr16004077a12.1.1761043425201;
        Tue, 21 Oct 2025 03:43:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ZIyejUv1SEd5ycsgR7xZfFzn"
Message-ID: <2b49df90-ac99-4bf7-bf60-fc8358b63eb2@gmail.com>
Date: Tue, 21 Oct 2025 12:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21?] AMD/IOMMU: unshare IRQ .ack and .disable
 handlers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>

This is a multi-part message in MIME format.
--------------ZIyejUv1SEd5ycsgR7xZfFzn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/20/25 4:16 PM, Jan Beulich wrote:
> A .disable handler can't typically be re-used for .ack: The latter needs
> to deal with IRQ migration, while the former shouldn't. Furthermore
> invoking just irq_complete_move() isn't enough; one of
> move_{native,masked}_irq() also need invoking.
>
> Fixes: 487a1cffd71a ("x86: Implement per-cpu vector for xen hypervisor")
> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -428,8 +428,6 @@ static void cf_check iommu_msi_mask(stru
>       unsigned long flags;
>       struct amd_iommu *iommu = desc->action->dev_id;
>   
> -    irq_complete_move(desc);
> -
>       spin_lock_irqsave(&iommu->lock, flags);
>       amd_iommu_msi_enable(iommu, IOMMU_CONTROL_DISABLED);
>       spin_unlock_irqrestore(&iommu->lock, flags);
> @@ -442,6 +440,13 @@ static unsigned int cf_check iommu_msi_s
>       return 0;
>   }
>   
> +static void cf_check iommu_msi_ack(struct irq_desc *desc)
> +{
> +    irq_complete_move(desc);
> +    iommu_msi_mask(desc);
> +    move_masked_irq(desc);
> +}
> +
>   static void cf_check iommu_msi_end(struct irq_desc *desc, u8 vector)
>   {
>       iommu_msi_unmask(desc);
> @@ -455,7 +460,7 @@ static hw_irq_controller iommu_msi_type
>       .shutdown = iommu_msi_mask,
>       .enable = iommu_msi_unmask,
>       .disable = iommu_msi_mask,
> -    .ack = iommu_msi_mask,
> +    .ack = iommu_msi_ack,
>       .end = iommu_msi_end,
>       .set_affinity = set_msi_affinity,
>   };
--------------ZIyejUv1SEd5ycsgR7xZfFzn
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
    <div class="moz-cite-prefix">On 10/20/25 4:16 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com">
      <pre class="moz-quote-pre" wrap="">A .disable handler can't typically be re-used for .ack: The latter needs
to deal with IRQ migration, while the former shouldn't. Furthermore
invoking just irq_complete_move() isn't enough; one of
move_{native,masked}_irq() also need invoking.

Fixes: 487a1cffd71a ("x86: Implement per-cpu vector for xen hypervisor")
Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E"
      href="mailto:jbeulich@suse.com" moz-do-not-send="true">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com">
      <pre class="moz-quote-pre" wrap="">

--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -428,8 +428,6 @@ static void cf_check iommu_msi_mask(stru
     unsigned long flags;
     struct amd_iommu *iommu = desc-&gt;action-&gt;dev_id;
 
-    irq_complete_move(desc);
-
     spin_lock_irqsave(&amp;iommu-&gt;lock, flags);
     amd_iommu_msi_enable(iommu, IOMMU_CONTROL_DISABLED);
     spin_unlock_irqrestore(&amp;iommu-&gt;lock, flags);
@@ -442,6 +440,13 @@ static unsigned int cf_check iommu_msi_s
     return 0;
 }
 
+static void cf_check iommu_msi_ack(struct irq_desc *desc)
+{
+    irq_complete_move(desc);
+    iommu_msi_mask(desc);
+    move_masked_irq(desc);
+}
+
 static void cf_check iommu_msi_end(struct irq_desc *desc, u8 vector)
 {
     iommu_msi_unmask(desc);
@@ -455,7 +460,7 @@ static hw_irq_controller iommu_msi_type
     .shutdown = iommu_msi_mask,
     .enable = iommu_msi_unmask,
     .disable = iommu_msi_mask,
-    .ack = iommu_msi_mask,
+    .ack = iommu_msi_ack,
     .end = iommu_msi_end,
     .set_affinity = set_msi_affinity,
 };</pre>
    </blockquote>
  </body>
</html>

--------------ZIyejUv1SEd5ycsgR7xZfFzn--

