Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A487FB6F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 11:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695283.1084915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmWNO-0008Mp-AJ; Tue, 19 Mar 2024 10:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695283.1084915; Tue, 19 Mar 2024 10:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmWNO-0008Ke-7k; Tue, 19 Mar 2024 10:07:22 +0000
Received: by outflank-mailman (input) for mailman id 695283;
 Tue, 19 Mar 2024 10:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEhX=KZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmWNN-0008KW-90
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 10:07:21 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78ac37aa-e5d8-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 11:07:19 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-414645c349dso2528035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 03:07:19 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c458800b0041409cabb39sm9594865wmo.18.2024.03.19.03.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 03:07:18 -0700 (PDT)
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
X-Inumbo-ID: 78ac37aa-e5d8-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710842839; x=1711447639; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=22m8F5eHnsE6I2JCG0BhWJG1Y5otjS1Oa7T2DIPkqvQ=;
        b=aep+QgYuiYzfNl3pR1KfjiCaU8DNBl+OQXd89fsLIiXfa0z1nFOY6ejrBDFKTJhEaj
         kKw+8MU9vAC9CmOFnenVHBUcePER9DjXAonadFfprvofZievOaTkxUjCvYzr11XDHI04
         N8CWLg6oNQLVoF9JO+YDgOtKacH8UYksWVkPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710842839; x=1711447639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22m8F5eHnsE6I2JCG0BhWJG1Y5otjS1Oa7T2DIPkqvQ=;
        b=naCiEA85LFGhaxB3jej943lP0p8L/OXoMyhMGyhzc5E3786XMPvs/qj5o9KbV/IyvK
         Tuvjig3flC2KR5VFgkW6JgAZZr1G9ep1uFMbsQizhOyjARLfX47qlj+iae0ZBdn0jhaH
         fOY6yn6sPlGHIbU5ANCQcsy/8o7QOuahGsMGS++K5r6Cph8/JKBkcNosmwvr5nkq8aK8
         YjnrmliUZmppmhEUmPtMPal2rBCqLjwZUOK99cC7KuJqIcafNJ+1/U91XLHNAw4QznSf
         jtCJhSNhW0cISVgjWtJbXhlI137P/XimGrRI/QxEkJd359JAJuLOxpWwMyxhfuKd53CI
         kubQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwdZFiidprK9LOj70LVDsD/ahB8yXsI2DjwOGo66cRBv2CRKT/C9mg/cWTM3bEwwnQgjIR/vKbkLXVbo6qz+tZmD7zKqydVA4w9iGcX6Y=
X-Gm-Message-State: AOJu0Yz46WKZ1qfX0BpcqzktczhTdpafwB0y86UfEUCv0SS9j15ZwQKl
	G0lfBVCUOgmIMB/lbsKVz0VEri3PRsX+bNIj/88N7XsMvwMlU90Dz0LJYBGYQeU=
X-Google-Smtp-Source: AGHT+IECcFdhl0pRbNSvdU2cfGnY0CD+EqLRB7uBA/J+1I2E/bml/msXTE5CRyPb5CGdgRevL0VsUg==
X-Received: by 2002:a05:600c:5022:b0:414:e6e:756a with SMTP id n34-20020a05600c502200b004140e6e756amr2052727wmr.9.1710842839052;
        Tue, 19 Mar 2024 03:07:19 -0700 (PDT)
Date: Tue, 19 Mar 2024 11:07:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 2/7] multiboot2: Allow 64-bit entry tags
Message-ID: <Zflj1gEwdeAU45US@macbook>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-3-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313150748.791236-3-ross.lagerwall@citrix.com>

On Wed, Mar 13, 2024 at 03:07:43PM +0000, Ross Lagerwall wrote:
> Binaries may be built with entry points above 4G. While bootloaders may
> relocate them below 4G, it should be possible for the binary to specify
> those entry points. Therefore, extend the multiboot2 protocol such that
> 64 bit addresses are allowed for entry points. The extension is done in
> a backwards-compatible way.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  doc/multiboot.texi | 32 +++++++++++++++++++-------------
>  doc/multiboot2.h   |  6 +++++-
>  2 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/doc/multiboot.texi b/doc/multiboot.texi
> index d12719c744eb..049afab53c1f 100644
> --- a/doc/multiboot.texi
> +++ b/doc/multiboot.texi
> @@ -522,12 +522,12 @@ header.
>  
>  @example
>  @group
> -        +-------------------+
> -u16     | type = 3          |
> -u16     | flags             |
> -u32     | size              |
> -u32     | entry_addr        |
> -        +-------------------+
> +          +-------------------+
> +u16       | type = 3          |
> +u16       | flags             |
> +u32       | size              |
> +u32 / u64 | entry_addr        |
> +          +-------------------+

I might be confused, but this entry point is used in 32bit protected
mode, and hence a 64bit value is simply impossible to use according to
the protocol in "3.3 I386 machine state".

Unless that section is expanded to describe other protocols that use
the entry address in a way where 64bits could be meaningful it seems
pointless to expand the field.

>  @end group
>  @end example
>  
> @@ -538,7 +538,10 @@ The meaning of each is as follows:
>  
>  @item entry_addr
>  The physical address to which the boot loader should jump in order to
> -start running the operating system.
> +start running the operating system. @samp{entry_addr} may be specified
> +either as a @samp{u32} or @samp{u64}. The bootloader should use the
> +header size to determine the size of @samp{entry_addr}.
> +
>  @end table
>  
>  @subsection EFI i386 entry address tag of Multiboot2 header
> @@ -573,12 +576,12 @@ tag of Multiboot2 header are ignored.
>  
>  @example
>  @group
> -        +-------------------+
> -u16     | type = 9          |
> -u16     | flags             |
> -u32     | size              |
> -u32     | entry_addr        |
> -        +-------------------+
> +          +-------------------+
> +u16       | type = 9          |
> +u16       | flags             |
> +u32       | size              |
> +u32 / u64 | entry_addr        |
> +          +-------------------+

This does seem sensible.

Thanks, Roger.

