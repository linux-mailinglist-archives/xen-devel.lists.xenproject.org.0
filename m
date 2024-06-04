Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CACA8FAABB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735160.1141330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENdy-0002po-4m; Tue, 04 Jun 2024 06:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735160.1141330; Tue, 04 Jun 2024 06:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENdy-0002nR-0x; Tue, 04 Jun 2024 06:27:38 +0000
Received: by outflank-mailman (input) for mailman id 735160;
 Tue, 04 Jun 2024 06:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQmQ=NG=redhat.com=mlureau@srs-se1.protection.inumbo.net>)
 id 1sENdw-0002nJ-EW
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:27:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 877b4719-223b-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 08:27:35 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-jOWUnELcMXG84PjIF3E6Hw-1; Tue, 04 Jun 2024 02:27:33 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-57a33a589b3so1383512a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:27:32 -0700 (PDT)
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
X-Inumbo-ID: 877b4719-223b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717482454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JVtdIWNto+KqDFiBlQzdZJhx14N17tSKBoZOMoyk4A=;
	b=jLv4t5rjJhvJaDdRYp/A9ePW1a7CpxMaYBH+bDF8L/Qa6e/xblTSvoa0pXecbyOagKJrUJ
	6Fh+x7NR2n/DvmG5tWj2hqgsVh0RIGOqR4oWXZ8Pv8CQpquNjLESIeFSjcDBAO15/xbW2l
	o1Ve7dmCMBpZJz9BjNSNQd45c2gRcDs=
X-MC-Unique: jOWUnELcMXG84PjIF3E6Hw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717482451; x=1718087251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JVtdIWNto+KqDFiBlQzdZJhx14N17tSKBoZOMoyk4A=;
        b=HtIgBk2Kdwb/9RTPui19PjWFfRY2z7fc9B4HPCVZ5t8B1HJZM9e60fO6KkmBxIS0D/
         jVRCEUn+/FLBIzIt9H5g1STS6crjSXDeqfU/JFmBTziudtoAmasaLDnRz1gasnDI8DTy
         /Qbyiyoyak3eQYjrtBS+pf0691VsfbxkbhMOJAv07CCV1u61mUZtsbp7U8hL/WmL7ded
         C17hAEQEC62/AR0UKYyvHN8/PhaBAmdSXAGJlQkHly56sT2z/8FFuTvIUo/wZ7XidsiO
         Lc3MkwTT7zXRxak6UImINpvxVKtribxi7E5WUGoj73n/zZNVJgQg5m14RErOXAY+0Kzi
         ub0g==
X-Forwarded-Encrypted: i=1; AJvYcCVTjRgNK+HSYKl9KtZQnV4aIWyJnhTRLJfz3+qrtJ0GRw/kt4p011vtI6L2AXPU9SfkPUepPZ8tW1zN2uPHGheQhqMPzPFbwy1PE1Lpx6E=
X-Gm-Message-State: AOJu0Yw3zilfJCoZCQWBlrJ/2k2bqPZVHq1A3578q72qAMs6MLXSvW0v
	HU0aXnE509UoFzPt8RA5hhMp0pnNIjGM+lAsb8+mNqL10InQC1xjzqQodAVm8xQBwSaefI9p9wl
	WD7XPnXCkafYRlhYlS0Uac/2C+b+sL+pDt8848hJ9F9GxHi8kyIUmsSWMPwmEIiDcselogt/zu3
	9j2M6Qrh+6jwzWB5p9KSfLzOkKA7GIKd/y0ztTLhOrVMJP4EE=
X-Received: by 2002:a50:9548:0:b0:57a:2ccf:ed2f with SMTP id 4fb4d7f45d1cf-57a363b4972mr7705408a12.3.1717482450705;
        Mon, 03 Jun 2024 23:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgCCSiWmq1QljOi/YHDSSxZ/u0tvY5jfAekfJZ3pRnQnD3+sRh5XAJAPUGxLID5iQcee+lK0g7D2RiA9UbizE=
X-Received: by 2002:a50:9548:0:b0:57a:2ccf:ed2f with SMTP id
 4fb4d7f45d1cf-57a363b4972mr7705397a12.3.1717482450320; Mon, 03 Jun 2024
 23:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240603151825.188353-1-kraxel@redhat.com> <20240603151825.188353-2-kraxel@redhat.com>
In-Reply-To: <20240603151825.188353-2-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 4 Jun 2024 10:27:18 +0400
Message-ID: <CAMxuvawqf-0dKPsZP2UTcDWPWQ+8FKbZ=S4KX02hQO1qeeGVMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] stdvga: fix screen blanking
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, qemu-stable@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 3, 2024 at 7:18=E2=80=AFPM Gerd Hoffmann <kraxel@redhat.com> wr=
ote:
>
> In case the display surface uses a shared buffer (i.e. uses vga vram
> directly instead of a shadow) go unshare the buffer before clearing it.
>
> This avoids vga memory corruption, which in turn fixes unblanking not
> working properly with X11.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2067
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/vga.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 30facc6c8e33..474b6b14c327 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -1762,6 +1762,12 @@ static void vga_draw_blank(VGACommonState *s, int =
full_update)
>      if (s->last_scr_width <=3D 0 || s->last_scr_height <=3D 0)
>          return;
>
> +    if (is_buffer_shared(surface)) {

Perhaps the suggestion to rename the function (in the following patch)
should instead be surface_is_allocated() ? that would match the actual
flag check. But callers would have to ! the result. Wdyt?

> +        /* unshare buffer, otherwise the blanking corrupts vga vram */
> +        surface =3D qemu_create_displaysurface(s->last_scr_width, s->las=
t_scr_height);
> +        dpy_gfx_replace_surface(s->con, surface);

Ok, this looks safer than calling "resize".

thanks

> +    }
> +
>      w =3D s->last_scr_width * surface_bytes_per_pixel(surface);
>      d =3D surface_data(surface);
>      for(i =3D 0; i < s->last_scr_height; i++) {
> --
> 2.45.1
>


