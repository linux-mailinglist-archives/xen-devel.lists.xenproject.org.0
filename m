Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C76A918D4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 12:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957307.1350453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MCZ-0005L7-8B; Thu, 17 Apr 2025 10:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957307.1350453; Thu, 17 Apr 2025 10:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MCZ-0005Iq-59; Thu, 17 Apr 2025 10:10:35 +0000
Received: by outflank-mailman (input) for mailman id 957307;
 Thu, 17 Apr 2025 10:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5MCX-0005Fz-RI
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 10:10:33 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 321c4956-1b74-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 12:10:32 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso1104027a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 03:10:31 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6637ec65sm34573866b.133.2025.04.17.03.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 03:10:30 -0700 (PDT)
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
X-Inumbo-ID: 321c4956-1b74-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744884631; x=1745489431; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+dLwzmxddVil/jrz8ZJf2ZSgXa2xg2o2YFYg6qTylA=;
        b=jStL4ZBwH3yG3Cx1BJJSOjqaWFYg1AnNE7VpnX0EsCSpofRf46zwDPUK2GczgVWFY9
         /r8X2rsuekEzDAkqe/ar+pIUoDIdAjn7kEdh7mQ6pakxQprFgQeZ3aoZXyfzPdciC7Ju
         YoBEWcc6luv0scB8qI5BopN21Ozj6qn12Lks/92+EZAFKTkzYuAFCuT+D4goLyBnse1u
         RXVx6lMN9Y/F4sga7GXkjXecQIs1dhb9VFk6niymrO+pM8I2mVNs1DXRs4t4FDSaJ8OU
         o3siv3OslGHKRFjqe3wcCUeXvtLg0ZpNdSk/5GUmkKpjhASE2tlWn3faWotPrIsCpvGU
         GWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744884631; x=1745489431;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+dLwzmxddVil/jrz8ZJf2ZSgXa2xg2o2YFYg6qTylA=;
        b=W+5kQnACvdT8N+BZufzDiAcmQXPphQtbM4+z1S1lWDOv695NGCuXhEZoPAz5Y/RZP4
         U1e09Bnr9svm+rM0/wd3GAKG1U4464dxDO1hTewm9K038eBhtpL3kKPR/uPPAUad7MKA
         UMkbxn2zwSWbxaR1DAK2H4DplrKk2UtZ42vJ0wi5jz7PN8yUtC9o5unq2Svc4WmOuh2a
         oO36QGkYDFgETzDiXgmrVdGrm3nu5YegZL2UmUYT3RpQ0j22JkbNlH+O+Vs2K+LVVivk
         NWN8a+opM0TTohoVNNmIG+KPaD+M3v9ozXBQW1W1SZcS1+00b8W41Dl/LfMSnEeXydhZ
         cDqg==
X-Forwarded-Encrypted: i=1; AJvYcCXN1B+pUshkznQVDZa+q32+D3PhaIfkunyYobqEugf4OwOkZYcWNcBXm9bITuyKfgLyG3B9gh1euJw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvDUP3Ggr3bYzcZdwdmSrQUE28wx0U9S1ezfxESqoBQn9e0sVp
	+2wdUpVJH1NFOIc/Eux5n3MuAAHymHYSAi9iuUA/z2SKolZgl7tF
X-Gm-Gg: ASbGnctFKZLrgYQWQGphrTTkuvI0MOgcZofHNwYVdnzv2eM/BK57xRh/ynoHbkMUaZb
	cEjY32ctZ57lEJbpFQWmu+veqEMHx1VsE0//6d7dpkwuFaLsEIIQ6zwXWyK6uRocT+LjapDpBi9
	kUgP5czNvZ2ujtEwdZ8Qq3ofhzzQUg6jHadrgorqBtagI0NQZRU7zzAkYzArXaw9fVMZQx8NOfV
	vhsZOK9kPPOVM7l+REn1FS/l9Eh/wSWMH0kLATOEODGTw88zBN3iHrUMDVPUBnRqpD+ojPkxiPX
	orOD3PO82qfHiKcbVdwPwxo/mHTgVCPdjCBnrLi6zFXdlibN6Ic+ZqL2XBa2jdn5R2aj0UOxD3q
	eJiWziXMsBLHU9YHq
X-Google-Smtp-Source: AGHT+IGuWAsZa3TquW0AFtPGlbwBeVZiFuZljf+6cPzlWHv1YkMHeVDXqElBdpLeZD9PtltfX4Hgzg==
X-Received: by 2002:a17:907:7f0d:b0:ac7:3595:56df with SMTP id a640c23a62f3a-acb42b2d4d4mr439040366b.47.1744884631024;
        Thu, 17 Apr 2025 03:10:31 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------cD033S6Vg7CTJ4h8fI9uEp2t"
Message-ID: <7b1f5d89-2be9-450f-a4db-381df42942e6@gmail.com>
Date: Thu, 17 Apr 2025 12:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/14] xen/riscv: implement setup_irq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <2bc37c3996978129a5b2c888917307ea32448651.1744126720.git.oleksii.kurochko@gmail.com>
 <47492663-5832-49e7-af4d-ee536206e641@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <47492663-5832-49e7-af4d-ee536206e641@suse.com>

This is a multi-part message in MIME format.
--------------cD033S6Vg7CTJ4h8fI9uEp2t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 5:55 PM, Jan Beulich wrote
>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>> +    new->next = desc->action;
>> +    smp_mb();
>> +#endif
>> +
>> +    desc->action = new;
>> +    smp_mb();
> Aren't smp_wmb() sufficient on both places? If not, I think comments
> want adding.

smp_wmb() will be sufficient but I think the barrier could be dropped at all
as __setup_irq() is called only in setup_irq() and __setup_irq() call is wrapped
by spinlock_{un}lock_irqsave() where spinlock_unlock_*() will put barrier.

>
>> +    return 0;
>> +}
>> +
>> +void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
>> +{
>> +    if ( desc != NULL )
> Can desc really be NULL here?

It can't as irq_desc[] isn't dynamically allocated.

>   Isn't desc->lock required to be held?

It is and it is called in setup_irq() which calls spin_lock_irqsave().
Anyway, I think it could be dropped at all and use 'desc->handler->set_affinity(desc, cpu_mask);'
explicitly in setup_irq().

>> +    spin_lock_irqsave(&desc->lock, flags);
>> +
>> +    disabled = (desc->action == NULL);
>> +
>> +    if ( test_bit(_IRQ_GUEST, &desc->status) )
>> +    {
>> +        spin_unlock_irqrestore(&desc->lock, flags);
>> +        /*
>> +         * TODO: would be nice to have functionality to print which domain owns
>> +         *       an IRQ.
>> +         */
>> +        printk(XENLOG_ERR "ERROR: IRQ %u is already in use by a domain\n", irq);
>> +        return -EBUSY;
>> +    }
>> +
>> +    rc = __setup_irq(desc, irqflags, new);
>> +    if ( rc )
>> +        goto err;
>> +
>> +    /* First time the IRQ is setup */
>> +    if ( disabled )
>> +    {
>> +        /* disable irq by default */
>> +        set_bit(_IRQ_DISABLED, &desc->status);
> Shouldn't this be set when we make it here?

It should be. I'll drop the setting of _IRQ_DISABLED.

>
>> +        /* route interrupt to xen */
>> +        intc_route_irq_to_xen(desc, IRQ_NO_PRIORITY);
>> +
>> +        /*
>> +         * we don't care for now which CPU will receive the
>> +         * interrupt
>> +         *
>> +         * TODO: Handle case where IRQ is setup on different CPU than
>> +         * the targeted CPU and the priority.
>> +         */
>> +        irq_set_affinity(desc, cpumask_of(smp_processor_id()));
>> +        desc->handler->startup(desc);
>> +        /* enable irq */
>> +        clear_bit(_IRQ_DISABLED, &desc->status);
> Now it turns out this is really done twice: Once in aplic_irq_enable(),
> and once here.

Agree, this is a job of *_startup()->*_aplic_irq_enable(). I'll drop that too.

~ Oleksii


--------------cD033S6Vg7CTJ4h8fI9uEp2t
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
    <div class="moz-cite-prefix">On 4/15/25 5:55 PM, Jan Beulich wrote</div>
    <blockquote type="cite"
      cite="mid:47492663-5832-49e7-af4d-ee536206e641@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    new-&gt;next = desc-&gt;action;
+    smp_mb();
+#endif
+
+    desc-&gt;action = new;
+    smp_mb();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Aren't smp_wmb() sufficient on both places? If not, I think comments
want adding.</pre>
    </blockquote>
    <pre>smp_wmb() will be sufficient but I think the barrier could be dropped at all
as __setup_irq() is called only in setup_irq() and __setup_irq() call is wrapped
by spinlock_{un}lock_irqsave() where spinlock_unlock_*() will put barrier.

</pre>
    <blockquote type="cite"
      cite="mid:47492663-5832-49e7-af4d-ee536206e641@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return 0;
+}
+
+void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
+{
+    if ( desc != NULL )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can desc really be NULL here?</pre>
    </blockquote>
    <pre>It can't as irq_desc[] isn't dynamically allocated.

</pre>
    <blockquote type="cite"
      cite="mid:47492663-5832-49e7-af4d-ee536206e641@suse.com">
      <pre wrap="" class="moz-quote-pre"> Isn't desc-&gt;lock required to be held?</pre>
    </blockquote>
    <pre>It is and it is called in setup_irq() which calls spin_lock_irqsave().
Anyway, I think it could be dropped at all and use 'desc-&gt;handler-&gt;set_affinity(desc, cpu_mask);'
explicitly in setup_irq().
</pre>
    <blockquote type="cite"
      cite="mid:47492663-5832-49e7-af4d-ee536206e641@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    spin_lock_irqsave(&amp;desc-&gt;lock, flags);
+
+    disabled = (desc-&gt;action == NULL);
+
+    if ( test_bit(_IRQ_GUEST, &amp;desc-&gt;status) )
+    {
+        spin_unlock_irqrestore(&amp;desc-&gt;lock, flags);
+        /*
+         * TODO: would be nice to have functionality to print which domain owns
+         *       an IRQ.
+         */
+        printk(XENLOG_ERR "ERROR: IRQ %u is already in use by a domain\n", irq);
+        return -EBUSY;
+    }
+
+    rc = __setup_irq(desc, irqflags, new);
+    if ( rc )
+        goto err;
+
+    /* First time the IRQ is setup */
+    if ( disabled )
+    {
+        /* disable irq by default */
+        set_bit(_IRQ_DISABLED, &amp;desc-&gt;status);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't this be set when we make it here?</pre>
    </blockquote>
    <pre>It should be. I'll drop the setting of _IRQ_DISABLED.</pre>
    <blockquote type="cite"
      cite="mid:47492663-5832-49e7-af4d-ee536206e641@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        /* route interrupt to xen */
+        intc_route_irq_to_xen(desc, IRQ_NO_PRIORITY);
+
+        /*
+         * we don't care for now which CPU will receive the
+         * interrupt
+         *
+         * TODO: Handle case where IRQ is setup on different CPU than
+         * the targeted CPU and the priority.
+         */
+        irq_set_affinity(desc, cpumask_of(smp_processor_id()));
+        desc-&gt;handler-&gt;startup(desc);
+        /* enable irq */
+        clear_bit(_IRQ_DISABLED, &amp;desc-&gt;status);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Now it turns out this is really done twice: Once in aplic_irq_enable(),
and once here.</pre>
    </blockquote>
    <pre>Agree, this is a job of *_startup()-&gt;*_aplic_irq_enable(). I'll drop that too.

~ Oleksii
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------cD033S6Vg7CTJ4h8fI9uEp2t--

