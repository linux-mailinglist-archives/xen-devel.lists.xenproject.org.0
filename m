Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC43968A95
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788092.1197525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8aS-0001jA-4d; Mon, 02 Sep 2024 15:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788092.1197525; Mon, 02 Sep 2024 15:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8aS-0001h4-1m; Mon, 02 Sep 2024 15:03:24 +0000
Received: by outflank-mailman (input) for mailman id 788092;
 Mon, 02 Sep 2024 15:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1sl8aQ-0001gq-8y
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:03:22 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e7f7016-693c-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 17:03:21 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so2223236a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:03:21 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c25f35c514sm1063381a12.25.2024.09.02.08.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 08:03:19 -0700 (PDT)
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
X-Inumbo-ID: 7e7f7016-693c-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725289401; x=1725894201; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lr9gK5ygkjL6CwNj+ussYSBDuIMNtNKGsOkP+se3JzE=;
        b=GlgV9HO6yDkkRHRbOYUfvEJrynts+uOGZU/Z6tmYqgfrS02S7Tb+QB5Z7/iCC8DPxv
         QAQ5dUPfuNxhPZVKwF/XMhduFxXITxPQSVbwZWN6W0d0ZXS5ouVVojwRtijkY7h+a/LU
         V4Y3S3Zo9rWI1T6/VohGI1xkPE8iXIBoGWm/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289401; x=1725894201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lr9gK5ygkjL6CwNj+ussYSBDuIMNtNKGsOkP+se3JzE=;
        b=aAblArnBbS/id7cbv0hreT9PIQgzixAwZ+mYvb0PjBSUDGVHlRpFOeZJ8INcI0ly+O
         +MtD6A44YPq4kpZH9M2l52pFXGg0uvPcExgYoHsGVw0pCa0TKr7+ihcGa2JwflG6sE9m
         nVOls5ECOpu2k77F3nrE4ddGDIa8jwcMZ92eg38WBOcA0zNPBAvr8mdBbl8XuZndepme
         byewkLf3VSsKHRS/8YPzfMIl4SfeYXekeh4YVCWqBi9GpVzF70HPpkEIrDjxufRfuzxx
         0ni5Mol5WvGnjj6lFD3LIos9pjQ6SlyLz28abTje++XJYgYagcr8/l5jg7Byd8DDRknm
         rJKw==
X-Forwarded-Encrypted: i=1; AJvYcCUWihCRJADMlhBBK4WB7rd3h3fE5+6KsXcizXlkiaxtKAdzc2aLA2cWkOToAXbkmSvKjG+4lTGNkuk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz47izK2HWTXLel3d0mvgXfTBY9doZgOr7BepLdRnqp31OpwxZq
	cgTk+7feHt7PxfUH1NqKVjWGLq2B5GK1ACwUyFUC5+C2VH+uYsh3C9Wrz7aJXXs=
X-Google-Smtp-Source: AGHT+IEZaYjhV+ZbWtnBBtLg26Hg+QUvpvMVvC+mrHi26M6a0LKq+DQFbIMzCw2NeWkUO5ncodO76g==
X-Received: by 2002:a05:6402:2186:b0:5c2:2b1f:f75a with SMTP id 4fb4d7f45d1cf-5c22b1ff83fmr15158198a12.11.1725289400667;
        Mon, 02 Sep 2024 08:03:20 -0700 (PDT)
Date: Mon, 2 Sep 2024 16:03:13 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel@lists.xenproject.org, jbeulich@suse.com, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>
Subject: Re: [XEN PATCH v2 1/3] libxl: Fix nul-termination of the return
 value of libxl_xen_console_read_line()
Message-ID: <vg5m3i54mmaulwdhgp3h7dz3en2kuycsbaglpgjwy22relzrou@hr3t2ujgoart>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>
 <ZtCZjJVG-7daxcxb@macbook.local>
 <dc7d8179-b2c9-4ec8-99e5-5a901b751832@citrix.com>
 <ZtVuRHJbx_syQgdN@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtVuRHJbx_syQgdN@macbook.local>

On Mon, Sep 02, 2024 at 09:50:28AM GMT, Roger Pau Monné wrote:
> On Fri, Aug 30, 2024 at 08:22:29PM +0100, Andrew Cooper wrote:
> > On 29/08/2024 4:53 pm, Roger Pau Monné wrote:
> > > On Fri, Aug 23, 2024 at 06:05:03PM +0100, Javi Merino wrote:
> > >> When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> > >> call in main_dmesg().  ASAN reports a heap buffer overflow: an
> > >> off-by-one access to cr->buffer.
> > >>
> > >> The readconsole sysctl copies up to count characters into the buffer,
> > >> but it does not add a null character at the end.  Despite the
> > >> documentation of libxl_xen_console_read_line(), line_r is not
> > >> nul-terminated if 16384 characters were copied to the buffer.
> > >>
> > >> Fix this by asking xc_readconsolering() to fill the buffer up to size
> > >> - 1.  As the number of characters in the buffer is only needed in
> > >> libxl_xen_console_read_line(), make it a local variable there instead
> > >> of part of the libxl__xen_console_reader struct.
> > > Instead of playing games with the buffer size in order to add an extra
> > > NUL character, we could possibly use libxl_write_exactly(ctx,
> > > STDOUT_FILENO,...) in main_dmesg(), using cr->count as the buffer
> > > length?
> > 
> > Sadly no.
> > 
> > struct libxl__xen_console_reader (which has the count field) is a libxl
> > private (opaque) type which `xl` can't access.
> 
> I was fooled by the libxl_xen_console_reader typedef.
> 
> > Otherwise this would be a oneline fix already...
> 
> Hm, maybe the easiest way is to introduce a new function that returns
> the buffer and the number of characters?
> (libxl_xen_console_dump_buffer() or similar?)

Even if we did that, this function needs to be fixed as it are part of
the library and doesn't do what its documentation say: return a
nul-terminated string.

Personally, I would introduce a function as you suggest and call this
interface deprecated.  But I think it is overkill in this case, as
this is just `xl dmesg`.

Cheers,
Javi

