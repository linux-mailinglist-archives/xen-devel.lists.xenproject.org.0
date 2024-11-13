Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A79C6E30
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:52:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835478.1251356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBud-0001gf-SI; Wed, 13 Nov 2024 11:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835478.1251356; Wed, 13 Nov 2024 11:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBud-0001f2-PO; Wed, 13 Nov 2024 11:51:55 +0000
Received: by outflank-mailman (input) for mailman id 835478;
 Wed, 13 Nov 2024 11:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1B9J=SI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBBuc-0001eg-0K
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:51:54 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa96de4d-a1b5-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 12:51:50 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-718066adb47so3985809a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:51:50 -0800 (PST)
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
X-Inumbo-ID: aa96de4d-a1b5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC1vdDEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFhOTZkZTRkLWExYjUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk4NzEwLjMzOTg0MSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731498709; x=1732103509; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu3IFfHQGHllMRCuqwncJai+I0EOdojfXwX97kR2jJQ=;
        b=jXUmsrt1iCKjeRa3AjMi1tNVHOh+5StSffbhWYnVsAcqzPh56oj+I+5sRQORqGGb7W
         kOBmAgiWMo7JODm37i5MG9ombp0PGXN5dVJ+F2l5Qn/tz8/KnLghXHkqq/eLrnTompZV
         acrUJDIhRg3HUjCwtVNuIAbi6JseSu4d6tTPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731498709; x=1732103509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu3IFfHQGHllMRCuqwncJai+I0EOdojfXwX97kR2jJQ=;
        b=G1tKi28Wb9yU2wulfpO+dOfeROXzfzOpkka9AWjsc7I1r/Hj9mQbs9boebu9JAMu7K
         mwD/h9FNHvOGX7wPMfeEOx/f/Tx2ouhI0d8ZITc+TvyPI/AVz8y5OQFUtJBa7SzUUELm
         MAFjRG0WXsYrheXcdHnMtN3jmDrLs7/pQopNZn5b1durR4u/9fWxlJZAlPDJWeehiHRH
         eKr1ek8+jcCGfTrF6e32w+jBU9Nq0gICP4YSRdAm1nMo55msb3Z3k6brs6X+ROX3TkAG
         ISfo35s+JQ0zp/4aUapCDOz5FwGGDLKFgqKbLNgsJUfPZ24iV2Q8yW4rQZ13B0PjeBiC
         Sd0Q==
X-Gm-Message-State: AOJu0YywpVCUgegaQhPlyMAnz+i7O7Qynfbo430ZdKVsB9Gy3mdz94hX
	2pLmLbzYG1jN/9JxoBlkdqla2JSAgk3fjbdS2nibNEgOgcZeyY4zZHykVCF3mfn+oWxW5EnEKX9
	oAC2GjhqUICQAVurodJFrQG2vrG3byOaWv4o73g==
X-Google-Smtp-Source: AGHT+IFB9NmCTwz2/7TzHHsv8iYl8WB8oiAvtN0ASD1COWAWLazn8NwwFb6bhvsk6SHsWPDZUJQEWhrfzmZ9C6vsfkk=
X-Received: by 2002:a05:6820:983:b0:5e5:c517:4d88 with SMTP id
 006d021491bc7-5ee57a23ddcmr13806986eaf.0.1731498708939; Wed, 13 Nov 2024
 03:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-3-andrew.cooper3@citrix.com> <8217032f-c5ec-4f93-b69f-42ceeae06073@citrix.com>
In-Reply-To: <8217032f-c5ec-4f93-b69f-42ceeae06073@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 13 Nov 2024 11:51:38 +0000
Message-ID: <CACHz=ZhN+W6aLghG-PzguWnhbE2qBdf_chKS-nca1JnpT+dkNQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/trampoline: Rationalise the constants to describe
 the size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 11:36=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 13/11/2024 9:30 am, Andrew Cooper wrote:
> > diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> > index 7930b7c73892..9d3f2b71447e 100644
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -633,7 +633,7 @@ static void __init efi_arch_memory_setup(void)
> >      if ( efi_enabled(EFI_LOADER) )
> >          cfg.size =3D trampoline_end - trampoline_start;
> >      else
> > -        cfg.size =3D TRAMPOLINE_SPACE + TRAMPOLINE_STACK_SPACE;
> > +        cfg.size =3D TRAMPOLINE_SIZE;
>
> Something I forgot to mention.
>
> The EFI_LOADER side of this conditional means that the heap isn't valid.
>
> This includes modelist, vesa_glob_info and vesa_mode_info from video.S,
> but I can't find where they're used at all.
>
> There's a separate struct vesa_mode_info in reloc.c but that is a
> representation of the MB2 vbe_mode_info tag and not the same thing AFAICT=
.
>

I think MBI data on EFI path is parsed in another path.

Frediano

