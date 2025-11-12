Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56DAC52AD1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 15:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159949.1488212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBjC-0001wQ-72; Wed, 12 Nov 2025 14:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159949.1488212; Wed, 12 Nov 2025 14:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBjC-0001ud-4L; Wed, 12 Nov 2025 14:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1159949;
 Wed, 12 Nov 2025 14:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOna=5U=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vJBjA-0001eo-JL
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 14:21:40 +0000
Received: from mail-yx1-xb12a.google.com (mail-yx1-xb12a.google.com
 [2607:f8b0:4864:20::b12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6bd2067-bfd2-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 15:21:39 +0100 (CET)
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-63e16fbdd50so843997d50.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 06:21:39 -0800 (PST)
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
X-Inumbo-ID: e6bd2067-bfd2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762957298; x=1763562098; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6/bWzIkTQbzHmrTJlxqJKqiprn96CBsLf7XFab00P5A=;
        b=TChmxlvivyqI/7LZ/JmX90OjzNH7hmUbkdXWaG3rt1I9sgO8ydzpDywVbzJ8ScENTE
         1O+e0j+Z0gVbo9PxXS79R8Sn5eqauG49H6iiqzCM6jR5V7PGIBEPbFllhi9dqPxJXJ6r
         mvNixr8Kk6qJH9WsNtpv8CFG1jqojWg8x6+vrfuO7D/FfKgyG5DNP6HSE5lkO2Q12nZx
         3bEt5VcZ+FhQLgmn7yk/N3H6DldPtzor89QqdXuSvKUuRFG1GKwkXBy+UkoA0PpeBhNk
         c38f0dcKxQaq/c0wIs8SF+KLzKp8227omnDT7vRw4vDYpr9K/w0eQxylIuEh0qoqudUF
         l5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762957298; x=1763562098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/bWzIkTQbzHmrTJlxqJKqiprn96CBsLf7XFab00P5A=;
        b=aMrvh+B1BNGsYhznUWradSIGPJ9me/uCZlWZ/SHwnDKbG+jWK2u62G7Qab/UJdVipX
         /f8jokvoV7lWEetTICUrzVDHmY5XFRq4eDi866odoOBGfizO22Imphy0s4qfLWWI87vO
         PBRfE1c9ogqgt9XRdZ1oBlt3SUuXILnzoZq/IYCC06RU1Bo1XtvTM/pWaeViNp4VrBRk
         V9dP79vJl7O+2oj9BsLqhXhcw/xK3n0vQe2AZZWYZAQn4yx60bknnzBjGWiyJ3wNVpjM
         ZQZJJ5komHvXAAwPqYtNFgL3W/AwCPNRfIR5w+NvuQ5nn2k3lJRegnLMXzHMVK4xGn8Z
         ztog==
X-Forwarded-Encrypted: i=1; AJvYcCV2BL/5FLqqQH3iemyRU2nCU0119PDRIphqy6H1VUJdonISN6vQUX12xNfJQY1vvGJJg3Kq9o9ydMQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBjeKwXdYuJJ09ZV2VlP1gm85D8doVC2BgMKz9bLq8Hbf/eyjo
	ezIv7TfcOl/jiMJD03xhw93pBEJPp6RvPrjWGYo9mngkGI9QFhHClOUCrz3/hYZssX7thuRX0/q
	QgiTqm3lWyAAKbtzNjAsffagWr94+4Cc=
X-Gm-Gg: ASbGnctMZ22JGhPrgZ47BfJZhVO3b9etDk5kDjZ7MovLY/d+xVQfpxgnrWzRRqM4qd1
	dGnIYmk1diHDW1sElEkXEAVchwNxFblCXkNUS2lvHxoIgbLwO3KlESnUoPNCi489SQKREz5j1Xv
	EtVunFzbsyy7bLRbU3prSIKewlOHrzAxgebxnCTPpGL5aHthrt6/3Qe69vIxBqlkICUAeRMchyK
	aFrT1ThToRMwaUHLr415IboVczgZE56W51lXXo29g9ULweaM91htLkd3fzY
X-Google-Smtp-Source: AGHT+IH/cR01kRSKyI94vcVB7mJo0PEKHexuNZ5cMasFIbDX95wIlGhSLKCmYnckLOqkNXRrvXgb77nJLfO8O3UEjco=
X-Received: by 2002:a05:690c:d0c:b0:787:c9a1:13f0 with SMTP id
 00721157ae682-78813610f44mr25172497b3.8.1762957297684; Wed, 12 Nov 2025
 06:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20251110153551.84813-1-frediano.ziglio@citrix.com> <4ac8284c-e7f1-4d6a-9241-d6c30155551b@suse.com>
In-Reply-To: <4ac8284c-e7f1-4d6a-9241-d6c30155551b@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 12 Nov 2025 14:21:25 +0000
X-Gm-Features: AWmQ_bkxICBKmYqknrHT_nb1_4imFiMIBh7r47VmdCEIqeaANBfR_t4EahOKWio
Message-ID: <CAHt6W4eJi2hPjwyd5nQM3RKi3+pyw7LMiZA9WQMdFa1vp0i+Rw@mail.gmail.com>
Subject: Re: [PATCH v5] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 16:01, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.11.2025 16:35, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms.efi file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
> > xen-syms.efi can be used for debugging.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - avoid leaving target if some command fails.
> >
> > Changes since v2:
> > - do not convert type but retain PE format;
> > - use xen-syms.efi for new file name, more consistent with ELF.
> >
> > Changes since v3:
> > - update documentation;
> > - do not remove xen.efi.elf;
> > - check endbr instruction before generating final target.
> >
> > Changes since v4:
> > - simplify condition check;
> > - avoid reuse of $@.tmp file.
> > ---
> >  docs/misc/efi.pandoc  |  8 +-------
> >  xen/Kconfig.debug     |  9 ++-------
> >  xen/Makefile          | 19 -------------------
> >  xen/arch/x86/Makefile | 16 ++++++++++------
> >  4 files changed, 13 insertions(+), 39 deletions(-)
> >
> > diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> > index 11c1ac3346..c66b18a66b 100644
> > --- a/docs/misc/efi.pandoc
> > +++ b/docs/misc/efi.pandoc
> > @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
> >  Once built, `make install-xen` will place the resulting binary directly into
> >  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
> >  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> > -match your system). When built with debug info, the binary can be quite large.
> > -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> > -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> > -to any combination of options suitable to pass to `strip`, in case the default
> > -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> > -unless `EFI_DIR` is set in the environment to override this default. This
> > -binary will not be stripped in the process.
> > +match your system).
>
> This behavioral change likely also calls for a ChangeLog entry, btw.
>
> Jan

Hi,
  I'm not familiar with the format/style of this file.

Could it be simply

### Removed
- ...current list ...
- INSTALL_EFI_STRIP environment was removed, xen.efi will be stripped.

?

For simplicity, should we always strip xen.efi and provide also
xen-syms.efi only if debug info is enabled?
It would probably be more consistent.

Regards,
   Frediano

