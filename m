Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7F687FE80
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:19:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695369.1085051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZMP-0005I9-41; Tue, 19 Mar 2024 13:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695369.1085051; Tue, 19 Mar 2024 13:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZMP-0005Gc-0j; Tue, 19 Mar 2024 13:18:33 +0000
Received: by outflank-mailman (input) for mailman id 695369;
 Tue, 19 Mar 2024 13:18:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEhX=KZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmZMN-0005DG-5Y
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:18:31 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cbf5615-e5f3-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 14:18:29 +0100 (CET)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-69145fc4265so38007266d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 06:18:29 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 cz8-20020a056214088800b00691663dbd4csm5984370qvb.78.2024.03.19.06.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:18:27 -0700 (PDT)
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
X-Inumbo-ID: 2cbf5615-e5f3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710854308; x=1711459108; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eEZL8Wp7PtGZZCztHBKQg2DIByzevBllOdV4RD3XbXA=;
        b=QuoEsKSq/14CIeCbGnzE/8S+H9zGJIaEALQOtABrEHoYqCTiFVVzMZtoBT7IeH82QU
         496o+gtF1jUp+qfHcARRj7dF5arSw5/IqNigODynrOEYA4esMG4m/pwTICxKLT6c8h1u
         q62EG+ZslwYDkXs57bcCoSPW+E6M91ZeMBhFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854308; x=1711459108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEZL8Wp7PtGZZCztHBKQg2DIByzevBllOdV4RD3XbXA=;
        b=B83oHzndhJbS+6BMdzMwn+56Vv7NrPxlYlL+xrUJ5zFrczcq/XDF4s5wEBXBICs2UC
         gkIab4+ZPtvUusIurgZpXaKHECbTYkecLUNqILfivMOEtAg4urlkmqfp5+FmNCc/5Udm
         /YPsNtT06d4GppQyZBcY0zBPXN5+j/yfGJOj12+9x0x6/9xZLP3+M+4dTGt+sFk7YUWe
         u/x/VaTahUmzZsNJbNdhbvUD5+NGjPuyNp2ndASZ+UgfseYqi0QXYFWGYY1bybS2nFtm
         s3IwNHsZ2m9uCXec9daUW5jqgiQL4pprHQfVp+8kiwzWYQru5mRdUS0wUmsPQsUrr/uM
         qXew==
X-Forwarded-Encrypted: i=1; AJvYcCVKWms+wQ52ibn92FKoqY1duULDWT7ztCrJsUC3svGmTGTnEghr4Vrlm7VW09fLEv9CS5vNL+t1jzBUotONtCakA4/UUDYnGJGoGUCklDs=
X-Gm-Message-State: AOJu0Yy8o823hbtUYeuhDV8/ZcwpqXXFMAuTXou8GwOy0uJ8IC+lSVpl
	1gOzOcCs5KdUSJY4dME24ZTErSiJOyJ35vjiDVa6u8wlcfKzzz9nUGicsgygQ7U=
X-Google-Smtp-Source: AGHT+IHSRYQ/BxWWIyxOaaI9zA/WImLgEQdIFCzGFXrRn7xOf6XttcNfvOdEZOc/Xl3c1FD9rTWCdg==
X-Received: by 2002:ad4:58a4:0:b0:691:698e:9299 with SMTP id ea4-20020ad458a4000000b00691698e9299mr1938874qvb.61.1710854307946;
        Tue, 19 Mar 2024 06:18:27 -0700 (PDT)
Date: Tue, 19 Mar 2024 14:18:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
Message-ID: <ZfmQf03uKe5DW0L-@macbook>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313150748.791236-2-ross.lagerwall@citrix.com>

On Wed, Mar 13, 2024 at 03:07:42PM +0000, Ross Lagerwall wrote:
> Currently, multiboot2-compatible bootloaders can load ELF binaries and
> a.out binaries. The presence of the address header tag determines
> how the bootloader tries to interpret the binary (a.out if the address
> tag is present else ELF).
> 
> Add a new load type header tag that explicitly states the type of the
> binary. Bootloaders should use the binary type specified in the load
> type tag. If the load type tag is not present, the bootloader should
> fall back to the previous heuristics.
> 
> In addition to the existing address and ELF load types, specify a new
> optional PE binary load type. This new type is a useful addition since
> PE binaries can be signed and verified (i.e. used with Secure Boot).
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  doc/multiboot.texi | 39 ++++++++++++++++++++++++++++++++++-----
>  doc/multiboot2.h   | 13 +++++++++++++
>  2 files changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/doc/multiboot.texi b/doc/multiboot.texi
> index df8a0d056e76..d12719c744eb 100644
> --- a/doc/multiboot.texi
> +++ b/doc/multiboot.texi
> @@ -511,11 +511,12 @@ assumes that no bss segment is present.
>  
>  Note: This information does not need to be provided if the kernel image
>  is in @sc{elf} format, but it must be provided if the image is in a.out
> -format or in some other format. When the address tag is present it must
> -be used in order to load the image, regardless of whether an @sc{elf}
> -header is also present. Compliant boot loaders must be able to load
> -images that are either in @sc{elf} format or contain the address tag
> -embedded in the Multiboot2 header.
> +format or in some other format. If the load type tag is not specified
> +and the address tag is present it must be used in order to load the
> +image, regardless of whether an @sc{elf} header is also present.
> +Compliant boot loaders must be able to load images that are either in
> +@sc{elf} format or contain the address tag embedded in the Multiboot2
> +header.
>  
>  @subsection The entry address tag of Multiboot2 header
>  
> @@ -732,6 +733,34 @@ and @samp{2} means load image at highest possible address but not
>  higher than max_addr.
>  @end table
>  
> +@node Load type tag
> +@subsection Load type tag
> +
> +@example
> +@group
> +        +-------------------+
> +u16     | type = 11         |
> +u16     | flags             |
> +u32     | size = 12         |
> +u32     | load_type         |
> +        +-------------------+
> +@end group
> +@end example
> +
> +This tag indicates the type of the payload and how the boot loader
> +should load it.
> +
> +The meaning of each field is as follows:
> +
> +@table @code
> +@item load_type
> +Recognized load types are @samp{0} for address (i.e. load a.out using
> +the address tag), @samp{1} for ELF, and @samp{2} for PE. Compliant
> +bootloaders should implement support for a.out and ELF as a minimum.  If
> +this tag is not specified, the boot loader should attempt to load the
> +payload using the information specified in the address tag if present,
> +else it should load the payload as an ELF binary.  @end table

I wonder if it would be simpler to use the following order instead:

1. Address tag
2. Load type tag
3. ELF header

It's pointless to add a Loader type tag with load_type == 0, as that's
already mandated by the Address tag.  IOW: signaling the use of the
Address tag here is kind of pointless, if the fields in the Address
tag are set, that's the only signaling required for the data in the
Address tag to be used.

Or are we attempting to support images that set Address tag and Load
type tag != 0 in order to use the Address tag when the loader doesn't
recognize the Load type tag, and otherwise use a different format?

Would it be sensible for multiboot2 to use PE in preference to ELF if
present on the image?  (without requiring any signaling).  I would
think this could be troublesome if kernels are so far expecting the
ELF header to be used with multiboot2, even if they also expose a PE
header.

Thanks, Roger.

