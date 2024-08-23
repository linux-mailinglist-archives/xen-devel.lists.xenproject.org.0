Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5E95CD04
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 14:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782316.1191795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shTnL-0002u8-6Y; Fri, 23 Aug 2024 12:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782316.1191795; Fri, 23 Aug 2024 12:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shTnL-0002sN-3o; Fri, 23 Aug 2024 12:53:35 +0000
Received: by outflank-mailman (input) for mailman id 782316;
 Fri, 23 Aug 2024 12:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBLJ=PW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1shTnJ-0002sB-CG
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 12:53:33 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3395c8e-614e-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 14:53:31 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3718b5e9c4fso940964f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 05:53:31 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2206a1sm256626466b.6.2024.08.23.05.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 05:53:30 -0700 (PDT)
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
X-Inumbo-ID: b3395c8e-614e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724417611; x=1725022411; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yx0XNg8xoECMuJn9WM2rOE/TmZMMyglNPxekTQBAk80=;
        b=S6hMp1wFh5lqghrHDTDKNIB+sothwDvI7wVUV9+LML5CFgNnaL8C8IcoRkhC/GcoyL
         mO0+LOGtqoHobsC1DvW58NIK4GTsoah9d8ffZnCj768Ju9lfoS5OuteXdFaGhvbNytud
         OZrMblvg5Qp4Z7hj8HwpOIyUpx3af+0NkUBF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417611; x=1725022411;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx0XNg8xoECMuJn9WM2rOE/TmZMMyglNPxekTQBAk80=;
        b=D5sdni1jRECAHKk6pkY+ZZzVrw5BhEGCu5YBOEziZDlZqR2RSwcuEvpC0I2FVU+gPt
         NKNUccpwNSs4VBMVDrhICC2wFNMLvtYOWBh/DMu7LKpKg7DvSevMlYlqLHu9WTshYRfM
         wiI88qtDUCzPNjG5MlBeZfJn69AJWhJ3RQIpbwPpxF2gIUcUplHaQuzJt+87cXgdR+VS
         7qrQ8ebDvg6t+LRg3nHD+idKNhP3rxdBOqETQxfy5TjHowFFoFbUPdxPkdp9PBV8g5Mt
         AoJ9K/JbrROudCeg3BijB0CuAElsgnOzTNcMOhKPIMhPVFDTJDztTuWDZDSh2BHVwmAa
         LqYw==
X-Forwarded-Encrypted: i=1; AJvYcCVKMzGYI5hpYGuKk8DwKSCC+SIRHa5R63P6DZJAyR09i82nRqqe9jZRA3+SoxZHFfVnVg9Ox5r0qH0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzmsrt1wXgtNt8as+vKCksoiYbLyfisrE3cuBktAAI+K5h3h/Su
	yWgiTfrPkYQfGA0eiZNEmx2mMwYbAoSc+yL6W8zve/+F1qQPrJ+7iqKfC2cO7pk=
X-Google-Smtp-Source: AGHT+IF9ss6TjyIzXKW+P8Yqf1gvBdv2Riwaf5W4mSUyk9afnFZLlNFE0rw79kB7Uqfwi5YudXz8qA==
X-Received: by 2002:a5d:5648:0:b0:367:93b3:5d5a with SMTP id ffacd0b85a97d-3731191b577mr1391553f8f.57.1724417610691;
        Fri, 23 Aug 2024 05:53:30 -0700 (PDT)
Date: Fri, 23 Aug 2024 13:53:28 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v1] libxl: Fix nul-termination of the return value of
 libxl_xen_console_read_line()
Message-ID: <qradgiaxdibr44y5vklwgbqvvgymqufrpq2a3znadcgjeswqk6@3u3vgwvgiztm>
References: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com>
 <7b575ad5-c7c6-4054-8036-9d2961630d42@suse.com>
 <ZshhBoWZZVGZLUv+@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZshhBoWZZVGZLUv+@l14>

On Fri, Aug 23, 2024 at 10:14:32AM GMT, Anthony PERARD wrote:
> On Fri, Aug 23, 2024 at 08:31:50AM +0200, Jan Beulich wrote:
> > On 22.08.2024 15:13, Javi Merino wrote:
> > > When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> > > call in main_dmesg().  ASAN reports a heap buffer overflow: an
> > > off-by-one access to cr->buffer.
> > >
> > > The readconsole sysctl copies up to count characters into the buffer,
> > > but it does not add a null character at the end.  Despite the
> > > documentation of libxl_xen_console_read_line(), line_r is not
> > > nul-terminated if 16384 characters were copied to the buffer.
> > >
> > > Fix this by making count one less that the size of the allocated
> > > buffer so that the last byte is always null.
> > >
> > > Reported-by: Edwin Török <edwin.torok@cloud.com>
> > > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> >
> > Perhaps wants a Fixes: tag as well?
> 
> Seems to be:
> Fixes: 4024bae739cc ("xl: Add subcommand 'xl dmesg'")

Yes, I'll add it.

> > > --- a/tools/libs/light/libxl_console.c
> > > +++ b/tools/libs/light/libxl_console.c
> > > @@ -779,7 +779,7 @@ libxl_xen_console_reader *
> > >      cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
> > >      cr->buffer = libxl__zalloc(NOGC, size);
> > >      cr->size = size;
> > > -    cr->count = size;
> > > +    cr->count = size - 1;
> > >      cr->clear = clear;
> > >      cr->incremental = 1;
> >
> > While this looks to be addressing the issue at hand, I still wonder: Why
> > does the "count" field exist at all? It's certainly odd to be set right
> > here (when the buffer actually is empty). It's used solely in
> > libxl_xen_console_read_line(), so could be a local variable there.

True.  I just wanted to fix the actual bug, but I guess while we are
at it we can improve this piece of code.

> It isn't only odd to have "count" field, it is also used the wrong way.
> Once "cr->count" is set to 0, the next call to
> libxl_xen_console_read_line() will simply return an empty NULL, even if
> in the mean time more data is available to read from the string.
> Also, if the last call to libxl_xen_console_read_line() was shorter than
> the buffer size, none of the following call will use the full size of
> the buffer. This isn't really a problem for `xl dmesg`, but could be if
> we want to implement "--follow" option for example.
> 
> So Javi, could you remove that `cr->count` field and use a local
> variable instead?

Sure, I'll do that.

> And a comment in the code might be useful about why there's a "-1".
> 
> But I think a better way to address the issue would be to actually set
> '\0' at the end of the string after the call to xc_readconsolering(),
> and remove the not very useful memset(0). That way, it will be more
> explicite as to why we need "-1".

Right, I will get rid of the memset(0) and just nul-terminate the string.

> > Then, further, I wonder why struct libxl__xen_console_reader lives in
> > libxl_internal.h - it's used solely in libxl_console.c.
> 
> History? It actually use to live in libxl.h, 14 yr ago.
>
> > Finally - why libxl__zalloc() when libxl_xen_console_read_line() clears
> > the buffer anyway?
> 
> Overuse of libxl__zalloc when it was use to replace the open coding that
> was used to allocate "cr". While it doesn't seems necessary, I don't
> think it hurt to keep it there.

It used to be a malloc() that was changed to a zalloc() in
39eaabdf4131 (libxl: don't leak buf in libxl_xen_console_read_start
error handling, 2013-12-03).  The comment in the commit message is
wrong, the malloc+memset was being done for libxl_xen_console_reader
(the struct) not for the buffer.

It doesn't hurt to keep it, but if I'm making changes in this area, I
may as well just make it a libxl__malloc() .

Cheers,
Javi

