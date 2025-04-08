Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D417A7FF8D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 13:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941780.1341175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u271G-0000lO-0U; Tue, 08 Apr 2025 11:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941780.1341175; Tue, 08 Apr 2025 11:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u271F-0000jw-Tx; Tue, 08 Apr 2025 11:21:29 +0000
Received: by outflank-mailman (input) for mailman id 941780;
 Tue, 08 Apr 2025 11:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fLb=W2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u271E-0000jq-Ps
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 11:21:28 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bab774d-146b-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 13:21:26 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-736aa9d0f2aso6436162b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 04:21:26 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-739da0b2db4sm10244774b3a.126.2025.04.08.04.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:21:24 -0700 (PDT)
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
X-Inumbo-ID: 9bab774d-146b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744111285; x=1744716085; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qf0wy7L4O942D22Kbiabal5KHmDdSB8OgsY2GBka7Ko=;
        b=QFSsy2JaNwopNUW5ot4YUahjbPiVOlm7MxVZNGvvEJZbH1jh+Dk97ltZlKQZR2WYWh
         vEAG4QS6B3W/h8xFNkf8IMt8W+/ZkEFwo4WQDMfHF/c6esCHIFeRJJAqQzKzW5O2Pk0Q
         O25OpDXZKhDyleW1jLxL/O0pJp8oSVm0NU1y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111285; x=1744716085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf0wy7L4O942D22Kbiabal5KHmDdSB8OgsY2GBka7Ko=;
        b=NJ3T8E9dFQs03Zl7udDq6NPZc2zFZqBjEUt4q8/qfNdQEfjLtdOMnjb/6xRSMI0nYA
         Wbn/E7r3zE02K6n2xQF8slitR/A5R9tU4aTv2tkvIePU0A6pKQI0yYNCrrZz03AzcQ4w
         f8iDBc+7elvgT5IEpVR0lepTYCJtZ9YeW049Hhd8fCy9VE9QESWMiPMh+E+SP87PY9mp
         lpQPrOx9coItZMswuRdpsaYXDk8+utHrdtfvRAiC1zLj0TgcIeV6J4rwhNVA7+jKhBgh
         0EI8xbQg45O5VpTSAPO41s5+W4WDwAwst2BRZw7ycvxlYSkO6tgaiULbFUq/esIWYW5I
         hDkw==
X-Forwarded-Encrypted: i=1; AJvYcCX54qfDVArnUtYo++toAyDIt5yCSzY5ju6nAkw0mfcQJ+8Cdq63DFaZGHijmywBdUKQnuHJLlrK8LU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywBtbNThCuJzNnSY6lN4ypfhE1iXjdzTvUhZAJJgE8HGWHsPNp
	d9vuVp0H8GMdAH/g2F9+0VS4K8A6XGohjF9i/3jbhnF0GBDwwwyrQUnel9QTUd8=
X-Gm-Gg: ASbGncvUvoXtNeVs4aW56EMiZ/Xi5z4oKV/UXXJQjOuBTXG/qHjuSaW8G9shDqSWxho
	0E/w1hDQOKyIRaFO/KF7+aung995tvIRoml0XIUJiozm8oHN3XhdCfZtt/tuCE32KbBMpkHIKQa
	hOznOcBUFaZQ2ZwRm6C/T9C2uY+zfuIfP5KVWYkxk48o4HW6oxynihJQa55J8trK2xbx6Q5bfIL
	gUvAA/UhJdV9Rcr0AiRyi9n4bH9aRybHFHyUjNj41dVqRtpQaYlQXpv1CXJSOHKB7asKAUC01C9
	ggyrhcagb7b3xxB4jFR1Dnh/0VLmDpSF3wy76EPGcvrt3d2z3A==
X-Google-Smtp-Source: AGHT+IEjJJ4rOEF1asoT/6cfO01WLwUJrm2urETYpYKdML3wTFO1CX2lak3BUUxMnl1XefFjdc6jfA==
X-Received: by 2002:a05:6a21:8cc9:b0:1f8:d245:616d with SMTP id adf61e73a8af0-20113c71a02mr17951874637.21.1744111284790;
        Tue, 08 Apr 2025 04:21:24 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:21:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
Message-ID: <Z_UGr0A8LetHDJvB@macbook.lan>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-3-roger.pau@citrix.com>
 <6c37ad18-a830-453e-a7ff-fb4978e3f0df@suse.com>
 <a14a7a42-cf7e-463b-a87d-e302ce32371b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a14a7a42-cf7e-463b-a87d-e302ce32371b@suse.com>

On Wed, Apr 02, 2025 at 09:46:53AM +0200, Jan Beulich wrote:
> On 01.04.2025 16:17, Jan Beulich wrote:
> > On 01.04.2025 15:08, Roger Pau Monne wrote:
> >> The base address is in the pe32_opt_hdr, not after it.
> 
> Which is a result of pe.h munging both the optional and the NT header into
> a single structure.
> 
> >> Previous to commit f7f42accbbbb the base was read standalone (as the first
> >> field of pe32_opt_hdr).  However with the addition of reading the full
> >> contents of pe32_opt_hdr, such read will also fetch the base.  The current
> >> attempt to read the base after pe32_opt_hdr is bogus, and could only work
> >> if the file cursor is repositioned using lseek(), but there's no need for
> >> that as the data is already fetched in pe32_opt_hdr.
> > 
> > Yes, but: How did things work at all then with this bug?
> 
> It simply didn't. We got away only because apparently no-one tried a build
> with a linker old enough for this tool to come into play.
> 
> I'd like to suggest the replacement patch below, though.
> 
> Jan
> 
> x86/EFI: correct mkreloc header (field) reading
> 
> With us now reading the full combined optional and NT headers, the
> subsequent reading of (and seeking to) NT header fields is wrong. Since
> PE32 and PE32+ NT headers are different anyway (beyond the image base
> oddity extending across both headers), switch to using a union. This
> allows to fetch the image base more directly then.
> 
> Additionally add checking to map_section(), which would have caught at
> least the wrong (zero) image size that we previously used.
> 
> Fixes: f7f42accbbbb ("x86/efi: Use generic PE/COFF structures")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of the two checks added to map_section(), the 1st ends up being largely
> redundant with the 2nd one. Should we use just the latter?
> 
> Also sanity checking the image base would be possible, but more
> cumbersome if we wanted to check moret than just "is in high half of
> address space). Therefore I've left out doing so.

We could likely check that image_base >= XEN_VIRT_START?  However I'm
not sure how easy it is to make XEN_VIRT_START available to mkreloc.

> --- a/xen/arch/x86/efi/mkreloc.c
> +++ b/xen/arch/x86/efi/mkreloc.c
> @@ -28,14 +28,16 @@ static void usage(const char *cmd, int r
>  static unsigned int load(const char *name, int *handle,
>                           struct section_header **sections,
>                           uint_fast64_t *image_base,
> -                         uint32_t *image_size,
> +                         uint_fast32_t *image_size,
>                           unsigned int *width)
>  {
>      int in = open(name, O_RDONLY);
>      struct mz_hdr mz_hdr;
>      struct pe_hdr pe_hdr;
> -    struct pe32_opt_hdr pe32_opt_hdr;
> -    uint32_t base;
> +    union {
> +        struct pe32_opt_hdr pe;
> +        struct pe32plus_opt_hdr pep;
> +    } pe32_opt_hdr;
>  
>      if ( in < 0 ||
>           read(in, &mz_hdr, sizeof(mz_hdr)) != sizeof(mz_hdr) )
> @@ -54,31 +56,40 @@ static unsigned int load(const char *nam
>  
>      if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
>           read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
> -         read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
> -         read(in, &base, sizeof(base)) != sizeof(base) ||
> -         /*
> -          * Luckily the image size field lives at the
> -          * same offset for both formats.
> -          */
> -         lseek(in, 24, SEEK_CUR) < 0 ||
> -         read(in, image_size, sizeof(*image_size)) != sizeof(*image_size) )
> +         (read(in, &pe32_opt_hdr.pe, sizeof(pe32_opt_hdr.pe)) !=
> +          sizeof(pe32_opt_hdr.pe)) )
>      {
>          perror(name);
>          exit(3);
>      }
>  
>      switch ( (pe_hdr.magic == PE_MAGIC &&
> -              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr)) *
> -              pe32_opt_hdr.magic )
> +              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pe)) *
> +              pe32_opt_hdr.pe.magic )
>      {
>      case PE_OPT_MAGIC_PE32:
>          *width = 32;
> -        *image_base = base;
> +        *image_base = pe32_opt_hdr.pe.image_base;
> +        *image_size = pe32_opt_hdr.pe.image_size;
>          break;
>      case PE_OPT_MAGIC_PE32PLUS:
> -        *width = 64;
> -        *image_base = ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
> -        break;
> +        if ( pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pep) )
> +        {
> +            if ( read(in,
> +                      &pe32_opt_hdr.pe + 1,
> +                      sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe)) !=
> +                 sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe) )
> +            {
> +                perror(name);
> +                exit(3);
> +            }
> +
> +            *width = 64;
> +            *image_base = pe32_opt_hdr.pep.image_base;
> +            *image_size = pe32_opt_hdr.pep.image_size;
> +            break;
> +        }

Since you are already refactoring much of this code, won't it be
clearer to fetch the header inside of the switch cases.  So that
there's a single read call for each header type?

> +        /* Fall through. */
>      default:
>          fprintf(stderr, "%s: Wrong PE file format\n", name);
>          exit(3);
> @@ -108,11 +119,28 @@ static unsigned int load(const char *nam
>  static long page_size;
>  
>  static const void *map_section(const struct section_header *sec, int in,
> -                               const char *name)
> +                               const char *name, uint_fast32_t image_size)
>  {
>      const char *ptr;
>      unsigned long offs;
>  
> +    if ( sec->rva > image_size )

Strictly, should this be >=, as rva is a position, and image_size is a
size, so the last allowed bit would be image_size - 1?

Thanks, Roger.

