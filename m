Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E994B9C4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 11:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773811.1184246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzZn-0002QG-F8; Thu, 08 Aug 2024 09:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773811.1184246; Thu, 08 Aug 2024 09:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzZn-0002NI-Bi; Thu, 08 Aug 2024 09:36:55 +0000
Received: by outflank-mailman (input) for mailman id 773811;
 Thu, 08 Aug 2024 09:36:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vpfq=PH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sbzZl-0002NC-LZ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 09:36:53 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bddd4c8d-5569-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 11:36:52 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5d5c324267aso407750eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 02:36:52 -0700 (PDT)
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
X-Inumbo-ID: bddd4c8d-5569-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723109811; x=1723714611; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAaPz5K8D2s3Jt9n5ajrSs4DeRMUrIEj3bmYYi/KbZM=;
        b=IUF8Als1puJw5I4BkgBgclMDS2Bod6s0u8rb5QIN7X+v9oWTcK5ru6rV94eEqQJRGh
         Npe0h/cDnBVSntJY/spoomss2Lu9XJYwpviRx5Zul1HWvf0jG8ePUmZMQ3stozboLysj
         M/0XdHWHZsPR8eU1PXyJ/Iepoy0b020KOJrII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723109811; x=1723714611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAaPz5K8D2s3Jt9n5ajrSs4DeRMUrIEj3bmYYi/KbZM=;
        b=AQs24vjj1WFHpPT4IMieorXDDCJNfJT7gclFHu/7j2yNp9Kut1ixtfsiYy6EEP1K+T
         2fNNt2l6kFiXzPjNKzTi0OaoQibJUPdRd5jkTaWY/YZmah+UJyoRu41pjb6n9Z/TOT0Z
         nhS+HcasdWCewgYBr+Y3l/yMt+l5UFDJg5fepX4lTuPr3fWYSQlUquaa3/14Kh9k/Alk
         VPEWRlPPfDD2+rr3GwBFF64/GyelpmmtY2J8QKvtXk9Y9ApRUQCtpgB5qujLmQKXC2vp
         R7SkzQOmOXYI6964LZpr5eBZtun6g5qvIu9ONM1RdIML5yLuXgofCsrtjUCB+aGoKV18
         zofg==
X-Gm-Message-State: AOJu0Yz4E0F0xTa5ZVufyqv64MWq1YWyEfjCWUgL6zgk7G9UL70KXDu1
	G7/3E4P3bknpzXWawYQn0EEpay1iJpUePz0Sz6Z4EP9X0sMIbMwEo4PRPWpWOsVe3XHbb1hBNZw
	4OThmbRKuc+qJhdFeBap+j1xu+QnrSgFS4rONEg==
X-Google-Smtp-Source: AGHT+IF0BDU9dAFRJtIpY1RiU947qjI0XkobVCwvkMhhxD+ukjd0b12fUfZ24Vgg92HUKPhqqDcmPQesgmXOdNKCSmw=
X-Received: by 2002:a05:6820:1e8b:b0:5d8:750:21b with SMTP id
 006d021491bc7-5d8559e5bd7mr1283914eaf.1.1723109811101; Thu, 08 Aug 2024
 02:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
In-Reply-To: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 8 Aug 2024 10:36:40 +0100
Message-ID: <CACHz=ZiSJxdv_jVuE8sq6=JVcpXerKD0-TJxvium++8jpQEnsw@mail.gmail.com>
Subject: Re: [PATCH] x86: slightly simplify MB2/EFI "magic" check
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 9:49=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> A few dozen lines down from here we repeatedly use a pattern involving
> just a single (conditional) branch. Do so also when checking for the
> boot loader magic value.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I further question the placement of the clearing of vga_text_buffer,
> just out of context: Shouldn't that be placed with the increments of
> efi_platform and skip_realmode? Or else is the terminology in comments
> ("on EFI platforms") wrong in one of the two places? In the end, if we
> are entered at __efi64_mb2_start but the magic doesn't match, we simply
> don't know what environment we're in. There may or may not be a VGA
> console at the default address, so we may as well (try to) write to it
> (just like we do when entered at start).
>

I don't think __efi64_mb2_start should be ever get called by anything
else than multiboot2. Was EFI supported by multiboot version 1 maybe?
As far as I can see we will print an error and halt the machine so we
expect something really wrong to have happened.
We could indeed be in a position where we have VGA available. Or EFI?
Or not? As said something really weird and unexpected happened. Maybe
the safer way would be to print on serial and try to print on VGA in
this case. At the moment we mix the 2 prints (each character is
duplicated), printing all message to serial and then trying to print
all message to VGA and then halt could be an option.

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -233,13 +233,11 @@ __efi64_mb2_start:
>
>          /* Check for Multiboot2 bootloader. */
>          cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
> -        je      .Lefi_multiboot2_proto
>
>          /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. *=
/
>          lea     .Lnot_multiboot(%rip), %r15
> -        jmp     x86_32_switch
> +        jne     x86_32_switch
>

It looks good to me. Maybe a bit less readable.

> -.Lefi_multiboot2_proto:
>          /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. =
*/
>          xor     %esi,%esi
>          xor     %edi,%edi
>

Frediano

