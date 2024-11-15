Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8A9CE130
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 15:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837675.1253596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBxGA-0000jP-J4; Fri, 15 Nov 2024 14:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837675.1253596; Fri, 15 Nov 2024 14:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBxGA-0000hY-Ep; Fri, 15 Nov 2024 14:25:18 +0000
Received: by outflank-mailman (input) for mailman id 837675;
 Fri, 15 Nov 2024 14:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olWw=SK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBxG8-0000hS-N8
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 14:25:16 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a8fe386-a35d-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 15:25:08 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so115449666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 06:25:08 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df571a1sm183404966b.80.2024.11.15.06.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 06:25:07 -0800 (PST)
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
X-Inumbo-ID: 6a8fe386-a35d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZhOGZlMzg2LWEzNWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjgwNzA4Ljg1ODU1NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731680708; x=1732285508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U3a7bqY0M5GXsIjJULfc5P4F8rVpTjsajCX20UNpYJc=;
        b=FHxXcO44qJcRlMWPidRnDFuiZQxcOLkqitszl4zHxVnLIyyisvyPuKRUiHL/4C/+6C
         W+37OBuIwathURXby8UwxZQEJUc1i143cm1Wu0/7ayQR8E9VKLWZOxU3T51DoVjJMJhc
         o9WreIt1HEN5wUSHQuwPRypKmiMhlN7HjFVKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731680708; x=1732285508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3a7bqY0M5GXsIjJULfc5P4F8rVpTjsajCX20UNpYJc=;
        b=SxDIEWg7KiDQF85NQ90X/QQVkV8HBohHE4CLA775ceeqxSTPm96qWGfsu2IMJtdNvO
         qYZqFEFuwrmln0DdTbbnnd5GIC63sy2G4ttHG6P+9SD7Qpr+hsH0KW/Xe7f0D2NSN43+
         o4WXZa2EI94KirGegm9brAx6dQcZRG/Y1RlhbHtSSa2wQmyF86jgk6RytX9j4IIMBqYN
         lRH1fi4HDvk39h9wSMzIHGI+Q8/ZtnHiPt6aqNXgX8hFqur/WlnnAePNIXk24RAsVwJK
         Xp4bbhW4bfq+QS6t5CjS4rvjZ4dSqBEfRLvoYCicbsBeiwxTOK7gnmz2IXczS/blJyLJ
         +kfg==
X-Forwarded-Encrypted: i=1; AJvYcCUgncMdhD3y62tukHqSByWihVDGRCkQGQzePXyvK+3Gzxr1Jl0wypbQdIEtuHzmNpVK2tCAj/c847E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweKwjX23avMaNX8N53GpFmxNdxhOEA1aeKMVzFHoVB9zuai/DO
	+GA8CgNnJdYMU2U839MnQahFyycnXCHpIATsF+eR3IgJEzy6iC1heteEZpjbyJc=
X-Google-Smtp-Source: AGHT+IE6iWyxjfJ85GjH9iVFD6dLX6Bk9qzKUQ0aCcKSx/Bd/EJ3jDEpae3b6Msp6h64n6Pv/D06Ag==
X-Received: by 2002:a17:907:7f23:b0:a9e:f28c:374a with SMTP id a640c23a62f3a-aa4834544a3mr217812466b.32.1731680708281;
        Fri, 15 Nov 2024 06:25:08 -0800 (PST)
Message-ID: <305651e4-1567-4675-867e-94fc5bf9caf8@citrix.com>
Date: Fri, 15 Nov 2024 14:25:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] x86/boot: convert domain construction to use boot
 info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-2-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241115131204.32135-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2024 1:11 pm, Daniel P. Smith wrote:
> With all the components used to construct dom0 encapsulated in struct boot_info
> and struct boot_module, it is no longer necessary to pass all them as
> parameters down the domain construction call chain. Change the parameter list
> to pass the struct boot_info instance and the struct domain reference.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

There are two minor things needing noting in the commit message.

1) dom0_construct() turns i from being signed to unsigned.  This is
necessary for it's new use, and compatible with all pre-existing uses.

2) dom0_construct() also splits some 3-way assignments to placate MISRA,
on lines which are modified.

> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 3dd913bdb029..d1bdf1b14601 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -642,15 +643,15 @@ static bool __init check_and_adjust_load_address(
>      return true;
>  }
>  
> -static int __init pvh_load_kernel(struct domain *d, const module_t *image,
> -                                  unsigned long image_headroom,
> -                                  module_t *initrd, void *image_base,
> -                                  const char *cmdline, paddr_t *entry,
> -                                  paddr_t *start_info_addr)
> +static int __init pvh_load_kernel(
> +    struct domain *d, struct boot_module *image, struct boot_module *initrd,
> +    paddr_t *entry, paddr_t *start_info_addr)
>  {
> -    void *image_start = image_base + image_headroom;
> -    unsigned long image_len = image->mod_end;
> -    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
> +    void *image_base = bootstrap_map_bm(image);
> +    void *image_start = image_base + image->headroom;
> +    unsigned long image_len = image->mod->mod_end;
> +    unsigned long initrd_len = initrd ? initrd->mod->mod_end : 0;
> +    const char *cmdline = __va(image->cmdline_pa);

This isn't safe.  __va(0) != NULL, so later between ...

>      struct elf_binary elf;
>      struct elf_dom_parms parms;
>      paddr_t last_addr;
> @@ -725,8 +726,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,

... these two hunks in the calculation for last_addr, we have:

    ... cmdline ? ROUNDUP(strlen(cmdline) + 1, ...

which does the wrong thing.  (And includes the 16bit IVT onto the
guest's cmdline.)


I'd suggest doing the same as we do with initrd_len/etc, and having:

    const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) :
NULL;

to maintain the prior semantics.

>  
>      if ( initrd != NULL )
>      {
> -        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
> -                                    initrd_len, v);
> +        rc = hvm_copy_to_guest_phys(
> +            last_addr, mfn_to_virt(initrd->mod->mod_start), initrd_len, v);

This is a temporary adjustment, ending up shorter than it starts by
patch 3.  I've tweaked it to reduce the churn overall.  I can live with
83 chars width for a commit or two...

> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index cc882bee61c3..6be3d7745fab 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -354,13 +355,10 @@ static struct page_info * __init alloc_chunk(struct domain *d,
>      return page;
>  }
>  
> -static int __init dom0_construct(struct domain *d,
> -                                 const module_t *image,
> -                                 unsigned long image_headroom,
> -                                 module_t *initrd,
> -                                 const char *cmdline)
> +static int __init dom0_construct(struct boot_info *bi, struct domain *d)
>  {
> -    int i, rc, order, machine;
> +    unsigned int i;
> +    int rc, order, machine;
>      bool compatible, compat;
>      struct cpu_user_regs *regs;
>      unsigned long pfn, mfn;
> @@ -374,10 +372,13 @@ static int __init dom0_construct(struct domain *d,
>      unsigned int flush_flags = 0;
>      start_info_t *si;
>      struct vcpu *v = d->vcpu[0];
> -    void *image_base = bootstrap_map(image);
> -    unsigned long image_len = image->mod_end;
> -    void *image_start = image_base + image_headroom;
> -    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
> +    struct boot_module *image;
> +    struct boot_module *initrd = NULL;
> +    void *image_base;
> +    unsigned long image_len;
> +    void *image_start;
> +    unsigned long initrd_len = 0;
> +    const char *cmdline;

I'm tempted to put in some newlines here, just to break up the giant
block of variables.

This use of cmdline in principle needs a similar adjustment to the pvh
case, but it's only used once, so I suggest this instead:

@@ -984,8 +982,8 @@ static int __init dom0_construct(struct boot_info
*bi, struct domain *d)
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( cmdline != NULL )
-        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
+    if ( image->cmdline_pa )
+        strlcpy((char *)si->cmd_line, __va(image->cmdline_pa),
sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )


[edit] Turns out you do this in patch 6 anyway, so this way around will
reduce churn.

Happy to fix on commit.

~Andrew

