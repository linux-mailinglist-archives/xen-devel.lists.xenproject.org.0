Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10554968A65
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 16:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788065.1197496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8TL-0006Vj-U0; Mon, 02 Sep 2024 14:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788065.1197496; Mon, 02 Sep 2024 14:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8TL-0006Sz-QY; Mon, 02 Sep 2024 14:56:03 +0000
Received: by outflank-mailman (input) for mailman id 788065;
 Mon, 02 Sep 2024 14:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1sl8TL-0006St-8W
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 14:56:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 781d53df-693b-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 16:56:01 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so2212566a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 07:56:01 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989092143sm570785666b.96.2024.09.02.07.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 07:56:00 -0700 (PDT)
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
X-Inumbo-ID: 781d53df-693b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725288961; x=1725893761; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNSPRzbpZotMSBVCtE6W7wIwPhdI71w2vqsgwD3Esik=;
        b=E2zqqWCwYZVgXLEFaIGTn/TRyMwsDovkGDqOaUBHPpOsRQaTVhYH8zB+Wi5Rr0/wbt
         SVJ2dMaxn1L/KIxHSu05/lhjMrzlB9O2ODnHy9oddjCOyPjAP6cLDDMFkrKv0qHQ+cmd
         7LPY3TSDr/12UI9YMHAztBeURQvtHJ83TwRdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725288961; x=1725893761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNSPRzbpZotMSBVCtE6W7wIwPhdI71w2vqsgwD3Esik=;
        b=asy4qgUQ8oHVuEMY9kYqQgBw+9DPdoS4W8hb1aFgqaeMfmnJbaiurYRCwjo7Uv8Ua1
         F7yPj2DqgjlTIFrZI6Dv8rEFcgRsuyvhBzUFFLOpxulSMuzVufD8cHB5lbVidQ/lQgYJ
         g5Yij0w17ToIJBNWFlC7cYjZgtzR5o774cb/FQvlOJDwHH9rJzuPTHTxOF+p+nD3luQl
         JCjaTI5LE3ZrdulUIfuhHgqEwk3qo3dPlBLnibJk+6MKJD/fil30sLfo0OSctxEuXHkL
         GnUjHdLkfzuCyXWyCTiQ7atbduq0OVWMlGiQXd8Vh+90NpAExImfHLg0X3YtweNlrU+/
         myxQ==
X-Gm-Message-State: AOJu0Yz9cqOvAc+bmrUYM+XVISr746xyq0Oz5IXLvEM16b+OFx42aLsA
	Beuv8dNhkeq/xK5SVseNRoyaJtYAUWiYBRhTI9qM8x/AmBca1wUZQefILEbqlXc=
X-Google-Smtp-Source: AGHT+IGpRztX0kbKpK+5fx91Ay/rbUKArk6AZB1WslRnhkRKV0mZ6sX9Ush5cqAV2cSXlS+7lTW8WA==
X-Received: by 2002:a17:906:6a12:b0:a80:c0ed:2145 with SMTP id a640c23a62f3a-a89a24af193mr1023892966b.2.1725288960639;
        Mon, 02 Sep 2024 07:56:00 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:55:58 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
	andrew.cooper3@citrix.com, Juergen Gross <jgross@suse.com>, 
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>
Subject: Re: [XEN PATCH v2 1/3] libxl: Fix nul-termination of the return
 value of libxl_xen_console_read_line()
Message-ID: <td7k2nx3pewpndpwbz3s6axm6jdqfpnronxnlbdpiusqnudaw2@gnh3wfjhxjph>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>
 <Zs3uqKNTV1601s9j@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zs3uqKNTV1601s9j@l14>

On Tue, Aug 27, 2024 at 03:20:10PM GMT, Anthony PERARD wrote:
> On Fri, Aug 23, 2024 at 06:05:03PM +0100, Javi Merino wrote:
> > diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> > index a563c9d3c7f9..012fd996fba9 100644
> > --- a/tools/libs/light/libxl_console.c
> > +++ b/tools/libs/light/libxl_console.c
> > @@ -774,12 +774,14 @@ libxl_xen_console_reader *
> >  {
> >      GC_INIT(ctx);
> >      libxl_xen_console_reader *cr;
> > -    unsigned int size = 16384;
> > +    /* We want xen to fill the buffer in as few hypercalls as
> > +     * possible, but xen will not nul-terminate it.  Leave one byte at
> > +     * the end for the null */
> > +    unsigned int size = 16384 + 1;
> 
> This comment doesn't really explain why the size choosen is 16k+1, it
> kind of explain the +1 but that's about it.
> 
> 16k seems to be the initial size
>     https://elixir.bootlin.com/xen/v4.19.0/source/xen/drivers/char/console.c#L110
> But then, it is changed to depend on $(nproc) and loglevel
>     https://elixir.bootlin.com/xen/v4.19.0/source/xen/drivers/char/console.c#L1095
> with 16k been the minimum it seems:
>     https://elixir.bootlin.com/xen/v4.19.0/source/xen/drivers/char/console.c#L1061
> 
> So, I think a useful comment here would reflect that 16k is default size
> of Xen's console buffer.

Ok, I'll add a line that explains this.

> Also, multi-line comments are normally expected to be with begin and end
> markers on separated lines:
>     /*
>      * Comments.
>      */

In this file, there were more comments that didn't have the end marker
in a separate line, so I was just trying to be consistent.  For
example:

- https://elixir.bootlin.com/xen/v4.19.0/source/tools/libs/light/libxl_console.c#L454
- https://elixir.bootlin.com/xen/v4.19.0/source/tools/libs/light/libxl_console.c#L752
  (this one is mixed actually)
- https://elixir.bootlin.com/xen/v4.19.0/source/tools/libs/light/libxl_console.c#L790

Sure, I will make all comments I introduce have an end marker on a separate line

> It be nice to fix both comments, but otherwise the patch looks good:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks for the review!
Javi

