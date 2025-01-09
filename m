Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A184AA07CDC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 17:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868954.1280463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVv3k-00051H-Dz; Thu, 09 Jan 2025 16:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868954.1280463; Thu, 09 Jan 2025 16:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVv3k-0004yF-BR; Thu, 09 Jan 2025 16:07:00 +0000
Received: by outflank-mailman (input) for mailman id 868954;
 Thu, 09 Jan 2025 16:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq9x=UB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVv3j-0004y9-4q
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 16:06:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0cf40cf-cea3-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 17:06:58 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso216851166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 08:06:58 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90d9a7dsm85367866b.50.2025.01.09.08.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 08:06:55 -0800 (PST)
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
X-Inumbo-ID: c0cf40cf-cea3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736438818; x=1737043618; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ZxKJHt4USamZY7CSfghkQfPog5+4zXIN2+IyM4b7Rk=;
        b=Kb3Mo6QrnPSZpsAToM5R5yovqwgBP+9/sbKMbxNE1M85KrZ84WOhLkjf3ZRu4hBOru
         Iut8qVdKVC3QsJTw0jaddEF7Xbf1tsuKf2SvRmvwLixmXIM086bBprG69wsd1ezGR/Ki
         /OlML+B70CIpFuRVogSGLuQEY2+l9MURS3vPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438818; x=1737043618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZxKJHt4USamZY7CSfghkQfPog5+4zXIN2+IyM4b7Rk=;
        b=JF/fi/VHpGe/oFj75yKf26/mevv9Y19eVtLZaxGB3JqCwIIvHOh8BubMO9HH0fVD/c
         i9UsIvW4grsiPRlRU6Sz7LxsDu1Lg7VeNqW/vHE4Amo+RT8nIwt6C3uhk71CsF17a/B3
         XIKmbuTjMGXkkt5gb5H4VL9OUNIgrXp0HlM/md2BUGqpOXib78IIwJdwh1+07GcTqx0J
         sP0sKhqQeRnnA211aWXuxZm5Y8dIA1/Pnmal91QfiUl4+KbWqEXmrJzMpvP4BFUTik3A
         r3lC3ZNsmQv3Rzc/Ik9xKr1W3f1QqDWfBKusMsB/+T3Fz5SOoY9yliKpkjikk2Abnrlo
         Xqqg==
X-Forwarded-Encrypted: i=1; AJvYcCVYdF+bPuw+IpU3SqR7FVP1WkhOQWffa3XIGaDPKSPhh5l+fjDbpxaYcg8fn1i5PBJ8lbRwFUMKBCs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHZNvaLe+asRIy+dJuHYIsGZldudcKAxySW463CKjCDkHPmZY+
	kU3Qshy4AqFA+FfcgGE2UUtQNW8nphhT6bKoOMO5ddxo8woVWNwFTryOY23O1qI=
X-Gm-Gg: ASbGnctGdO4AIrPopFnw4SkH0flEcHi4trnaTy2SC1/jGkzy+mj0SQoG3AYCBPeS7gG
	616xjTGi9goKtyVcJrDfEcIIXIy0wKv3JwV5Qe8vn65O/WZKpC9mW2k7t4xVej+n4nHuTNpZtyH
	jSP2wdUfS6l37SbQWvA6Se7Hq4nzBZk1cfkAZnN8Rn6vrMfDC932T7dhO6ffKVMLoytzoT5fOgC
	4gll++VBtR7JUL2ldtaI9P/sMDD4QWc6/hxBdVpRs0b7KlDn8qDe4Ptjx7QwA==
X-Google-Smtp-Source: AGHT+IHQCbfJqFT4KaXgnMxTnLcFPSKLuLtytVYJU6DTW8em42L3L0fV3PFS9oWX2MaUMz24eWnApg==
X-Received: by 2002:a17:907:2d94:b0:aa6:7de9:2637 with SMTP id a640c23a62f3a-ab2ab6bfe70mr614603966b.46.1736438816006;
        Thu, 09 Jan 2025 08:06:56 -0800 (PST)
Date: Thu, 9 Jan 2025 17:06:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] xen/console: fix error handling in
 xen_console_device_create()
Message-ID: <Z3_0HpmfpSM3Xw5Q@macbook.local>
References: <20250107093140.86180-1-roger.pau@citrix.com>
 <20250107093140.86180-2-roger.pau@citrix.com>
 <Z3-hWRLyMldV4ZZD@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3-hWRLyMldV4ZZD@l14>

On Thu, Jan 09, 2025 at 11:13:45AM +0100, Anthony PERARD wrote:
> On Tue, Jan 07, 2025 at 10:31:39AM +0100, Roger Pau Monne wrote:
> > The usage of error_prepend() in some of the error contexts of
> > xen_console_device_create() is incorrect, as `errp` hasn't been initialized.
> > This leads to the following segmentation fault on error paths resulting from
> > xenstore reads:
> > 
> > Program terminated with signal SIGSEGV, Segmentation fault.
> > Address not mapped to object.
> >     fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50)
> >     at ../qemu-xen-dir-remote/util/error.c:142
> > 142         g_string_append(newmsg, (*errp)->msg);
> > [...]
> > (gdb) bt
> >     (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50) at ../qemu-xen-dir-remote/util/error.c:142
> >     (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ")
> >     at ../qemu-xen-dir-remote/util/error.c:152
> >     (backend=0x43944de00660, opts=0x43944c929000, errp=0x15cd0165ae10)
> >     at ../qemu-xen-dir-remote/hw/char/xen_console.c:555
> > 
> > Replace usages of error_prepend() with error_setg() where appropriate.
> > 
> > Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  hw/char/xen_console.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> > index ef0c2912efa1..af706c7ef440 100644
> > --- a/hw/char/xen_console.c
> > +++ b/hw/char/xen_console.c
> > @@ -551,7 +551,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
> >      }
> >  
> >      if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
> > -        error_prepend(errp, "failed to read console device type: ");
> > +        error_setg(errp, "failed to read console device type: ");
> 
> According to error_setg() doc, *errp must be NULL but xs_node_scanf may
> set it. Looking at the implementation, error_setg() seems to simply
> discard this new error message if *errp is already set.
> 
> Currently, when there's an I/O error, we get something like:
>     failed to read console device type: failed to read from /xenstore/path: doesn't exist
> and when the format scan failed:
>     SEGV
> 
> With this patch, when there's an I/O error, I think we get something
> like:
>     failed to read from /xenstore/path: doesn't exist
> and when the format scan failed:
>     failed to read console device type: 
> 
> 
> So I think we'll want to distiguish between IO error from
> xs_node_scanf() and format error, first one returns EOF (like vsscanf)
> and second one returns a value >= 0 but we expect exactly 1.

The call to xs_node_scanf() will go away in the next patch replaced by
qemu_xen_xs_read(), at which point errp will never be initialized.

I can change the order of the patches if that makes it easier.

> 
> >          goto fail;
> >      }
> >  
> > @@ -582,7 +582,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
> >      } else if (number) {
> >          cd = serial_hd(number);
> >          if (!cd) {
> > -            error_prepend(errp, "console: No serial device #%ld found: ",
> > +            error_setg(errp, "console: No serial device #%ld found: ",
> >                            number);
> 
> This change looks correct, ableit we could remove ":  " from the end of
> the string since they shouldn't be anything after it.

Thanks, Roger.

