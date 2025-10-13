Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3274BD1D89
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 09:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141766.1475929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DB2-0002ys-9z; Mon, 13 Oct 2025 07:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141766.1475929; Mon, 13 Oct 2025 07:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DB2-0002vm-6h; Mon, 13 Oct 2025 07:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1141766;
 Mon, 13 Oct 2025 07:41:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmnp=4W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v8DB0-0002vg-Q7
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 07:41:02 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6beded6-a807-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 09:41:00 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6394938e0ecso6307155a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 00:41:00 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12a62sm872447566b.58.2025.10.13.00.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 00:40:59 -0700 (PDT)
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
X-Inumbo-ID: f6beded6-a807-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760341260; x=1760946060; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcbCkbQ5cFzK2uc6XL+jUj4r+Ud7B6ptIdAC0X+jUJ8=;
        b=m4MQsSfNcb6l3GMQFyJcT0IxiuylMPJBmjxQ9PabHcgI5O74bkoZy9a4+8PMoxasIU
         H6v385Nfw5WaK04qsw+vG+OeM5lx7gopdYMirhCqcAUTn4ZjqtPBUVeNpqNgccCgqyC4
         DFCoq+njRPPrX6syD5gOvsyY2QoBKKTFhdsbAmCceG+Y5EAB7BMGsjZCi1mF0DnuGjDh
         ZklhxJ35fd4uLalvXFyxo7Bliz4WimUbn4RXsWShGYz5a65w/GLU5qklawiDF/WED+l5
         2igfb8Jxz1WxBloj216JMzFBIDF94iHqX7bGYwRbtck7o3ESiIigpGkZVFUbWyTYqbF1
         fCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760341260; x=1760946060;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EcbCkbQ5cFzK2uc6XL+jUj4r+Ud7B6ptIdAC0X+jUJ8=;
        b=dwpCaaBuFSHaJ6arEwef+dLR7xZ0+Yta64+mmw124f3SnWEiX9xqTUb14vqPLdjv1T
         bQMvcdEkNvDYYf/lRCXLAEhaMC25J+YqvMvHDjPCr8UcbN5NHYCVK8OOHTQiAOZL+OrN
         rcqz32I6FUbIbHo1j/scrnG1Hz8N4F/X+FIkH6XbM8b8mix6TzFIou9x+XNjo9dh3Bou
         +BNNjOGPZuVpKm51dDDOdNq4g5xXWugwkVp1DJGofomLVc51bQ9YyZVqAEXzP3Nq2lVI
         eXteV8I0DSnSeua9REaxt+y6VCYNC4Zg9u/adpUvrXaOPuSMxWsBTM2hhZAvnNmVc83y
         bnLA==
X-Forwarded-Encrypted: i=1; AJvYcCVxoa/Qzy2oZ84SMaGgHAN4bxzQ4nmFM+8bzmp7CBytH1EdYAuF0UnLrhmtGBZz+VmDaaCaURENnqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/NvNoRrnbLR5omCvdV38pkcDJK6VHVvExGNlesF2o3IHDmDd8
	wMqcsKHpXKbZDtMMoM1GnuBMxvEID4aktKom55eKv6Uucsnsu178jDK6
X-Gm-Gg: ASbGncvAmmB/ZFlGmQr49YgFl5+qaJNcNZm4v0EnkQTQCHa5s6BRpIAXS5RUCCtAsf+
	02NHCofAIuH/AI8ajkmj7IOXvC40p4opdIBpVODmyaNIjUdyNM6opz6Yq7U94aNQivxcqzakk9s
	0HzTJcNAhO8HTsrZUmMPV7h9GolfcRkOK6QCDyGmlG4UcrKQGzMPMXhlwGlkXdb6aRPq++00R/P
	U0N0tVmFnxk3EvVcz67lITYbDo2q43rdxpLVj28aDxCMbvn80iJtLoCGj6mUHWNlfVp/skzjGGj
	t6fh9Hu2ex7BinH0cCC3VRZEYLQlA7Mhco8i1ROaNY4mZqooRD0qIvHLTwDHJYY3YHv1DBi+/ua
	7Pmxkyvlr6R0/BL4n6I8NJ9FJ6S5/ctbrLMx3dzMNu74mtzURmrAHvICd2kFmHbU1QQkxepPirX
	k3kJ4l3c/e9pkvED/Nd5VwOsylkEeDb+d/
X-Google-Smtp-Source: AGHT+IHP9Z0Twj6Ux2MuclP4RUwdvGDeVMm1CPJRSariFeyrjxrZq2rTaUgVJBrlsM3rMAkB9pgS4Q==
X-Received: by 2002:a17:906:c14c:b0:b30:431d:27ed with SMTP id a640c23a62f3a-b50aab9c5afmr1973309466b.14.1760341260058;
        Mon, 13 Oct 2025 00:41:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------IoUQ7HUEchxapz7Dk06vUOPb"
Message-ID: <023e9bb5-85f7-4080-929d-8d3b07f89a24@gmail.com>
Date: Mon, 13 Oct 2025 09:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools/libs/light: fix BAR memory address truncation
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20251010080029.29328-1-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251010080029.29328-1-Jiqian.Chen@amd.com>

This is a multi-part message in MIME format.
--------------IoUQ7HUEchxapz7Dk06vUOPb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/10/25 10:00 AM, Jiqian Chen wrote:
> 64-bit BAR memory address is truncated when removing a passthrough pci
> device from guest since it uses "unsigned int".
>
> So, change to use "unsigned long long" to fix this problem.
>
> Signed-off-by: Jiqian Chen<Jiqian.Chen@amd.com>
> ---
> cc: Anthony PERARD<anthony.perard@vates.tech>
> cc: Juergen Gross<jgross@suse.com>
> cc: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
>   tools/libs/light/libxl_pci.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

With getting proper Ack(s) from maintainers, the patch could be considered
to be in 4.21:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 2ea2caeb6624..88ffbbf08abe 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -2001,7 +2001,8 @@ static void pci_remove_detached(libxl__egc *egc,
>   {
>       STATE_AO_GC(prs->aodev->ao);
>       libxl_ctx *ctx = libxl__gc_owner(gc);
> -    unsigned int start = 0, end = 0, flags = 0, size = 0, irq = 0;
> +    unsigned long long start = 0, end = 0, flags = 0, size = 0;
> +    unsigned int irq = 0;
>       int i, stubdomid = 0;
>       const char *sysfs_path;
>       FILE *f;
> @@ -2031,7 +2032,7 @@ static void pci_remove_detached(libxl__egc *egc,
>       }
>   
>       for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
> -        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
> +        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
>               continue;
>           size = end - start + 1;
>           if (start) {
> @@ -2040,7 +2041,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                    size, 0);
>                   if (rc < 0)
>                       LOGED(ERROR, domid,
> -                          "xc_domain_ioport_permission error 0x%x/0x%x",
> +                          "xc_domain_ioport_permission error 0x%llx/0x%llx",
>                             start,
>                             size);
>               } else {
> @@ -2050,7 +2051,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                   0);
>                   if (rc < 0)
>                       LOGED(ERROR, domid,
> -                          "xc_domain_iomem_permission error 0x%x/0x%x",
> +                          "xc_domain_iomem_permission error 0x%llx/0x%llx",
>                             start,
>                             size);
>               }
--------------IoUQ7HUEchxapz7Dk06vUOPb
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
    <div class="moz-cite-prefix">On 10/10/25 10:00 AM, Jiqian Chen
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251010080029.29328-1-Jiqian.Chen@amd.com">
      <pre wrap="" class="moz-quote-pre">64-bit BAR memory address is truncated when removing a passthrough pci
device from guest since it uses "unsigned int".

So, change to use "unsigned long long" to fix this problem.

Signed-off-by: Jiqian Chen <a class="moz-txt-link-rfc2396E" href="mailto:Jiqian.Chen@amd.com">&lt;Jiqian.Chen@amd.com&gt;</a>
---
cc: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
cc: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
cc: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 tools/libs/light/libxl_pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)</pre>
    </blockquote>
    <pre>With getting proper Ack(s) from maintainers, the patch could be considered
to be in 4.21:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251010080029.29328-1-Jiqian.Chen@amd.com">
      <pre wrap="" class="moz-quote-pre">

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2ea2caeb6624..88ffbbf08abe 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -2001,7 +2001,8 @@ static void pci_remove_detached(libxl__egc *egc,
 {
     STATE_AO_GC(prs-&gt;aodev-&gt;ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned int start = 0, end = 0, flags = 0, size = 0, irq = 0;
+    unsigned long long start = 0, end = 0, flags = 0, size = 0;
+    unsigned int irq = 0;
     int i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
@@ -2031,7 +2032,7 @@ static void pci_remove_detached(libxl__egc *egc,
     }
 
     for (i = 0; i &lt; PROC_PCI_NUM_RESOURCES; i++) {
-        if (fscanf(f, "0x%x 0x%x 0x%x\n", &amp;start, &amp;end, &amp;flags) != 3)
+        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &amp;start, &amp;end, &amp;flags) != 3)
             continue;
         size = end - start + 1;
         if (start) {
@@ -2040,7 +2041,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                  size, 0);
                 if (rc &lt; 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_ioport_permission error 0x%x/0x%x",
+                          "xc_domain_ioport_permission error 0x%llx/0x%llx",
                           start,
                           size);
             } else {
@@ -2050,7 +2051,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                 0);
                 if (rc &lt; 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_iomem_permission error 0x%x/0x%x",
+                          "xc_domain_iomem_permission error 0x%llx/0x%llx",
                           start,
                           size);
             }
</pre>
    </blockquote>
  </body>
</html>

--------------IoUQ7HUEchxapz7Dk06vUOPb--

