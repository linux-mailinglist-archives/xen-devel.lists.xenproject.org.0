Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F097EA84
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801958.1212039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssh0U-00021b-0P; Mon, 23 Sep 2024 11:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801958.1212039; Mon, 23 Sep 2024 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssh0T-0001zZ-Ty; Mon, 23 Sep 2024 11:13:29 +0000
Received: by outflank-mailman (input) for mailman id 801958;
 Mon, 23 Sep 2024 11:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MtUH=QV=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1ssh0R-0001z9-VH
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:13:27 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da64dacb-799c-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:13:26 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6c3552ce7faso34932356d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:13:26 -0700 (PDT)
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
X-Inumbo-ID: da64dacb-799c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727090005; x=1727694805; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=93WX7dNautSKAZPEiUH+4gMdnuFE7PlbaTvJHDr+Mdw=;
        b=dRMmWyvLKVKnyJWgkCTt3PhBdYYxrEBP68eNrj9Jc/0XeI69D3G6JRnd85DjZbBEmk
         QreZPGT3GNOvWnMAjmAaaofWcy5Fo+0wWuNZ7+S/ztayLHlIV6IJIAyhRvGsGVj0zNs8
         3FYzCI2yu4LHGBJdOE3SKucF0pXo3zi3s+cLS3ZfRfEA+Q42jp32mFyDF5CJKV3fwC3n
         6BGInUFaehST4/fLwsp4KgLeozlWA8OOK+NfNtIvR+THEQcgYpznJfgUKhGGl2GR9/Fm
         iV+me287lUrTEPpB2c/I499S1v3fnDPUj7mJ36dYiqithSNqjW4Yu0ReCZYUZZvIZ7rr
         fMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727090005; x=1727694805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93WX7dNautSKAZPEiUH+4gMdnuFE7PlbaTvJHDr+Mdw=;
        b=UGG4WpxVhlurKx4Aj8o0bb6EZKeEd6QGZJk62yas/dvH8dz/ux601WnFUNcNbQ0D9C
         MSXt4ZNxe1G0d/ggzQI5/aEejsAshCro5Q+Dqb93ljhM/wEZdIcd21Li3nJj5hbQMMkJ
         WNQ1ZY3/bLD1DAoGJvlEol33Q2hLWEWiZ+vuqxh1nuePZwkoG4K3CKshS4XRsCPUpC3+
         LMSy7xYUTRmkxtfhTefx/tpqmlgi9FguIR0IbY2orTISzZMSWRowLB2gL+OsKNZ14oJQ
         0dKXzXPqKjpXYyHxXlKWmSRdOTZ/im1aPBF2k2aEqNPhfP9oeQh4H27+NEBwucgvV4rX
         f1vQ==
X-Gm-Message-State: AOJu0YyyyVJmuaUDdqIvqKGWuaCEhWlh0FnW3SZ1BXBEIFPhzoVvQivc
	nTEK/0tfLaYoqj0ED+gYt03HnRY44oAzY0ravArD4GwZzc2n7qSatr7usrDJP4E2PhOZq1e9DXk
	XyrZzwDUrx2jFfVf2FXJmfoO7NNei5j7H
X-Google-Smtp-Source: AGHT+IHA+HoMSdUQgG9qGtyJPuuHU8YzJhox7V5SNKccdr5XO09k4pj+DkDeh6Y4rlxfifNzROI+8YV0Lm7qJayQzWI=
X-Received: by 2002:a05:6214:2348:b0:6c3:6344:d4e1 with SMTP id
 6a1803df08f44-6c6823a987dmr235496036d6.20.1727090005208; Mon, 23 Sep 2024
 04:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
 <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
 <CAKp59VFp8gNA6ndeK2DeE9EaRZJSup0ptYYPz4FwN4_Shx9SjA@mail.gmail.com>
 <CACHz=Zh7FB0h26zJDZnzkVRatwhTb=vWMA0TM+fpqZ=RtULTJA@mail.gmail.com>
 <CAKp59VEDE=9o4r_=n_bf_W=VOMvCpz5d_oBCDqkPSruO9ZUr=g@mail.gmail.com> <CACHz=ZiVgKSPvoHd645kcMgA6e=ZP-7LapnrVeSmgieh-poqqg@mail.gmail.com>
In-Reply-To: <CACHz=ZiVgKSPvoHd645kcMgA6e=ZP-7LapnrVeSmgieh-poqqg@mail.gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Mon, 23 Sep 2024 13:13:14 +0200
Message-ID: <CAKp59VGky3K9y83e9HnEJPuGVJ1JosqrQjYpK=ipGmvCV9RV7w@mail.gmail.com>
Subject: Re: [PATCH v2] x86/efi: Use generic PE/COFF structures
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com, 
	Nikola Jelic <nikola.jelic@rt-rk.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Milan Djokic <milan.djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"

>
> Not strong about, a change like
>
> $ git diff
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 286c003ec3..00ab091634 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -88,6 +88,8 @@ extra-y += xen.lds
> hostprogs-y += boot/mkelf32
> hostprogs-y += efi/mkreloc
>
> +$(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
> +
> # Allows usercopy.c to include itself
> $(obj)/usercopy.o: CFLAGS-y += -iquote .
>
> diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
> index 89c525d81e..7c9aac49ed 100644
> --- a/xen/arch/x86/efi/mkreloc.c
> +++ b/xen/arch/x86/efi/mkreloc.c
> @@ -9,7 +9,7 @@
> #include <sys/mman.h>
> #include <unistd.h>
>
> -#include "../../../include/efi/pe.h"
> +#include <efi/pe.h>
>
> #define PE_PAGE_SIZE 0x1000
>
>
> would work. Not sure the best place to put the option in the Makefile
> or I should change a different macro.
>
Much better solution than ours. We'll try out your suggestion and send
an updated patch. Thanks.

BR,
Milan

