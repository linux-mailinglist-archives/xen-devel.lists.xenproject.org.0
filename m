Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF395CD0D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 14:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782324.1191805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shTrM-000420-LM; Fri, 23 Aug 2024 12:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782324.1191805; Fri, 23 Aug 2024 12:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shTrM-000403-Ig; Fri, 23 Aug 2024 12:57:44 +0000
Received: by outflank-mailman (input) for mailman id 782324;
 Fri, 23 Aug 2024 12:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBLJ=PW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1shTrL-0003zx-9Y
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 12:57:43 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4827c2b4-614f-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 14:57:41 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bed68129a7so2618678a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 05:57:41 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3cbdeasm2074481a12.33.2024.08.23.05.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 05:57:40 -0700 (PDT)
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
X-Inumbo-ID: 4827c2b4-614f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724417861; x=1725022661; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGWiPQqaoQ/kIw9bPLvZMDmoTAFueMrOHJBno+Db4Ns=;
        b=ij83vz6Qt3nAAauAfL4lBA9D618bUC6g+H7U1cMCXSS09MfQdotvft8HDYsvU6V2qq
         fTUuZ7eisIZkAWk47Pafxj+bZEeH1h1pewTLRQIz5+cqjC87+adunEzrNI1zIxPQ5Wg9
         XtTZBy0l17gJzG7266Jp0YnX0KwIzuzaO1RPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417861; x=1725022661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGWiPQqaoQ/kIw9bPLvZMDmoTAFueMrOHJBno+Db4Ns=;
        b=wZlYXb80o7QNm6vMxBARDNaHZlAXMKNn8sw7vTo8c/56SsKn5BEEI2evXedcPMxpeW
         Y/6oApLLeR6VJlcvy8yCuP/LEaThrauT8NI1HyIw0y7TTFE8tWGjSG0BXR1XF/JWO4KB
         cMjanoEvh9Gv/jd22oTrAjD+d/ZPlGIW2XnMLVFRqWuKKhUl+11uhzx8kPGNfLjEe5GN
         mmlvOJ/5eERZHpohhWVmRE0ackCsASGckWqzTj7FxKwGbTEy8IHiJhoQbb4Y/DtyUuFr
         k4lYlcck+y/D1HWI1b1WcHyKO6WqvNNT5aTPppTvog6yxFXm+X8EuxiiZ+1ThgFez2+B
         lB4Q==
X-Gm-Message-State: AOJu0YyB5KO1q+5LqQEx6Ib148ij02YNZfAHGhBPc+JMNnmFBj1yc6Rd
	j9Qn2N+Ph1HRK/PscJaNbCXlN+ghnGS+GUKf+QOAn9+GH3NmNmkB8vt/26GA7FM=
X-Google-Smtp-Source: AGHT+IHoaXFUwMWdkMrVppA9B4WOb1pZ5hKLc0TbFv9/0HKU+xPusEt6cTpDZuGv6suVNK4tUfKXMQ==
X-Received: by 2002:a05:6402:4281:b0:5bf:2569:f8eb with SMTP id 4fb4d7f45d1cf-5c0891aafb1mr1298107a12.36.1724417860622;
        Fri, 23 Aug 2024 05:57:40 -0700 (PDT)
Date: Fri, 23 Aug 2024 13:57:38 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>
Subject: Re: [XEN PATCH v1] libxl: Fix nul-termination of the return value of
 libxl_xen_console_read_line()
Message-ID: <zofuedoeupcmu44zcfcloeryvro3femjss6fuadbl43vbinzdo@oi4pejy2ez5t>
References: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com>
 <925ae2fb-6f6f-4825-8469-c410b7bb89fc@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <925ae2fb-6f6f-4825-8469-c410b7bb89fc@citrix.com>

On Fri, Aug 23, 2024 at 10:34:05AM GMT, Andrew Cooper wrote:
> On 22/08/2024 2:13 pm, Javi Merino wrote:
> > When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> > call in main_dmesg().  ASAN reports a heap buffer overflow: an
> > off-by-one access to cr->buffer.
> >
> > The readconsole sysctl copies up to count characters into the buffer,
> > but it does not add a null character at the end.  Despite the
> > documentation of libxl_xen_console_read_line(), line_r is not
> > nul-terminated if 16384 characters were copied to the buffer.
> >
> > Fix this by making count one less that the size of the allocated
> > buffer so that the last byte is always null.
> >
> > Reported-by: Edwin Török <edwin.torok@cloud.com>
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >  tools/libs/light/libxl_console.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> > index a563c9d3c7f9..fa28e2139453 100644
> > --- a/tools/libs/light/libxl_console.c
> > +++ b/tools/libs/light/libxl_console.c
> > @@ -779,7 +779,7 @@ libxl_xen_console_reader *
> >      cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
> >      cr->buffer = libxl__zalloc(NOGC, size);
> >      cr->size = size;
> > -    cr->count = size;
> > +    cr->count = size - 1;
> >      cr->clear = clear;
> >      cr->incremental = 1;
> >  
> 
> This looks like it will fix the ASAN issue, but I think a better fix
> would be:
> 
> -        printf("%s", line);
> +       printf("%.*s", cr->count, line);
> 
> because otherwise there's a world of sharp corners once Xen has wrapped
> the buffer for the first time.
> 
> 
> Which brings us a lot of other WTFs in this code...
> 
> First, libxl_console.c describes it's functionality in terms of lines,
> and line_reader() in the API.  Yet it's not lines, it's a 16k buffer
> with generally multi-line content.  It's too late to fix the naming, but
> we could at least rewrite the comments not to be blatant lies.
> 
> 
> Just out of context above the hunk is:
> 
>     unsigned int size = 16384;
> 
> which isn't accurate.  The size of Xen's console ring can be changed at
> compile time (like XenServer does), and/or by command line variable.
> 
> Because the dmesg ring is never full (it just keeps producing and
> overwriting tail data), it's impossible to get a clean copy except in a
> single hypercall; the incremental/offset parameters are an illusion, and
> do not function correctly if a new printk() has occurred between
> adjacent hypercalls.
> 
> And that is why setting count to size - 1 probably isn't wise.  It means
> that, even in the ideal case where Xen's ringbuffer is 16k, you've still
> got to make 2 hypercalls to get the content.

You are right, having to do 2 hypercalls in the ideal case is not
good.  I'm going to get rid of cr->count, and make
libxl_xen_console_read_line() honour its documentation of returning a
nul-terminated string.  I'll just make the allocation one char bigger,
which was the fix I originally had.

Cheers,
Javi


