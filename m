Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB108C7AED
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 19:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723546.1128495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7efd-0003UY-NC; Thu, 16 May 2024 17:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723546.1128495; Thu, 16 May 2024 17:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7efd-0003Sx-KY; Thu, 16 May 2024 17:13:33 +0000
Received: by outflank-mailman (input) for mailman id 723546;
 Thu, 16 May 2024 17:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7efc-0003Sr-5y
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 17:13:32 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e7868fb-13a7-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 19:13:31 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e27277d2c1so14616691fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 10:13:31 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee9335sm273119305e9.29.2024.05.16.10.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 10:13:30 -0700 (PDT)
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
X-Inumbo-ID: 9e7868fb-13a7-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715879611; x=1716484411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9YH3Talo0JKHHZ8DSNTWBh0/kHsJ5KxWgJ4aT1Vo8AU=;
        b=nrU4bPpDJJJR4MJj1X9TLgJ0RcDeevVyYpi6FgiIpvtvj5yFcNHSf12kWDC8En8Ynw
         hxdK2kzO2EBjYNjSZvrnKTQNtUrA0OB3btqA23FrEv3we1Lmj6xo8IIX/fDI9TyN+t79
         BW8W3LE5OIUwqxcG/Ixm2c1ebWIyzoK30t3y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715879611; x=1716484411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YH3Talo0JKHHZ8DSNTWBh0/kHsJ5KxWgJ4aT1Vo8AU=;
        b=duZjD3it9nCarl2m+QOkuctX644mUuS6ngPx4L4QL8F0kOh7VyawCs0aoV+Y2QTAP/
         jC+D+qIb7mZk/GUeg8/4SYLd8ZTFbyWjGpa42oFtqZt3ziBOjzroG9mY2NzoaGmsyiQt
         62gyttoP+oac2lNEbZ6fZXwygJpFTc13/336tDIVmt2XSVuQSwLCAFxZqQv3MW3+vtbh
         mUZh2G95DQJ/ylu1xheCJX9tKFE7IoLtL9z0uZDkBLfBPlwfwxoDF6aJ70+8VY6xJLIp
         Jp8pbAHMwrePAWqasxXIKuPP5CgbjBm6DmnZqDTYGzTNRzds0P1orCfE3B+YN/EN1MJY
         FZXA==
X-Forwarded-Encrypted: i=1; AJvYcCUqe7BJL/z4lIqkYxDYEUFTd3Ke8FL5I8jr0dCFgW0mKCqmDB4pVKveiOk3SGC111SXSr4+B+RTX06NMddjkJdWg1wUabZjKFmW4HOZzH8=
X-Gm-Message-State: AOJu0YwJkhYlqSWzROLX5dh4LMT+II6CaFT2BvI9G4yuDOB454g3FC/Z
	KlIVCwYnghQFqRARds8DSURORm5LEKuCHiXyL/49Wain0rnEOuB2980q3WrU3hM=
X-Google-Smtp-Source: AGHT+IFUwIISMRFIOPH+Jc0/vqr6ceYlVmRJoaiSAaJFHYaKfB889HtTIq/ikAb8r7BBvKSruUeqEw==
X-Received: by 2002:a2e:a98a:0:b0:2e6:f769:5124 with SMTP id 38308e7fff4ca-2e6f769532emr47748271fa.39.1715879610595;
        Thu, 16 May 2024 10:13:30 -0700 (PDT)
Message-ID: <06844367-cc1d-42f7-b925-ba78b4532b11@citrix.com>
Date: Thu, 16 May 2024 18:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] xen/x86: pretty print interrupt CPU affinity
 masks
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240515152925.77197-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240515152925.77197-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/05/2024 4:29 pm, Roger Pau Monne wrote:
> Print the CPU affinity masks as numeric ranges instead of plain hexadecimal
> bitfields.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/irq.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 80ba8d9fe912..3b951d81bd6d 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1934,10 +1934,10 @@ void do_IRQ(struct cpu_user_regs *regs)
>                  if ( ~irq < nr_irqs && irq_desc_initialized(desc) )
>                  {
>                      spin_lock(&desc->lock);
> -                    printk("IRQ%d a=%04lx[%04lx,%04lx] v=%02x[%02x] t=%s s=%08x\n",
> -                           ~irq, *cpumask_bits(desc->affinity),
> -                           *cpumask_bits(desc->arch.cpu_mask),
> -                           *cpumask_bits(desc->arch.old_cpu_mask),
> +                    printk("IRQ%d a={%*pbl}[{%*pbl},{%*pbl}] v=%02x[%02x] t=%s s=%08x\n",

Looking at this more closely, there's still some information obfuscation
going on.

How about "... a={} o={} n={} v=..."

so affinity, old and new masks are all stated explicitly, instead of
having to remember what the square brackets mean, and in particular that
the masks are backwards?

Happy to adjust on commit.

~Andrew

