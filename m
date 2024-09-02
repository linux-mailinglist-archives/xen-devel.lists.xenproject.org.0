Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B844E968BF1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788250.1197723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9m9-0005Zi-KB; Mon, 02 Sep 2024 16:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788250.1197723; Mon, 02 Sep 2024 16:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9m9-0005XS-HK; Mon, 02 Sep 2024 16:19:33 +0000
Received: by outflank-mailman (input) for mailman id 788250;
 Mon, 02 Sep 2024 16:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1sl9m8-0005XM-2b
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:19:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 219ee7a6-6947-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 18:19:30 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a1d78e7b0so27861966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:19:30 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891daebcsm587594166b.170.2024.09.02.09.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:19:29 -0700 (PDT)
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
X-Inumbo-ID: 219ee7a6-6947-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725293969; x=1725898769; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ux2XRYgDvOHD192A1vlenCYv8Z8AyR7uq81fR4gikt4=;
        b=GuU8hrW/0ewbQPPNMpBepvmPwDoXl8GjwuOvfjDXyMxLI3mS9h2tYbgmA3JKGII+fb
         ipzhXq0tIa3cyrBY8LWtKvDfWOJRbk2UVuhvfClDevsuem4sHoRiUCQfUY5Q3Vh75q1+
         +1B4BpfYAdaQQ/WHpcd/R8kNFyMlD1lDDsVzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725293969; x=1725898769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux2XRYgDvOHD192A1vlenCYv8Z8AyR7uq81fR4gikt4=;
        b=rpv5zS5vRkPvpux/PyDKp6OGmlaru/bjvMO07EtMTFvLW87WvESKfHKWr7bk4GXcMt
         Y91Ughgj8rVum4ybUSysykt0VyX/3NiltU5oO99nfgb6QGLZHQcffb2jAEqg5R2iHRdS
         Hjd+0Tmorj2lV8LlZvV7TnQn9dmCYoHR2Xx25dy7rydQM47mmwfYvOtGpeKPIPdVHDKX
         P3RuuWdxkoc/PObLi/JND6CpumKMGgIa3Bx8L/U/SYN0lsw40Bnl33mdvpFOEI/GInAv
         5nuyb6WQHXNkfBVqkw1TbWg0PoWcnhaQsQGj0Gj9TFu3ALS/04dBJjhHlPD1HThu5snp
         9Z9A==
X-Gm-Message-State: AOJu0Yzz7PoF0grbd5TPF3ed/8tkaeZzOVd4UPzxKdR41xR30TUR7OaH
	G70kGzagojJaMP6/SFsaR1+dtMPkZaDlv2XGuboikv6fMmM16Yfwt/kVwFNQHhE=
X-Google-Smtp-Source: AGHT+IGUmNsOA6m7MIqHaQe9esIWnVnDLJX2jf3ILMXOhsOToC0MBUW/9cdm8DT+1uSYtbp80q0lmg==
X-Received: by 2002:a17:907:a04:b0:a77:e55a:9e87 with SMTP id a640c23a62f3a-a89faf98533mr349883666b.48.1725293969333;
        Mon, 02 Sep 2024 09:19:29 -0700 (PDT)
Date: Mon, 2 Sep 2024 17:19:27 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
	andrew.cooper3@citrix.com, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 3/3] libxl: Update the documentation of
 libxl_xen_console_read_line()
Message-ID: <qs3mklkkjjvysdkt76wxbjkmiy3idysjpdgujtcmg6hskranc7@5j4d7j4v53yh>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
 <Zs3wEK1HjdgkqVwE@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zs3wEK1HjdgkqVwE@l14>

On Tue, Aug 27, 2024 at 03:26:09PM GMT, Anthony PERARD wrote:
> On Fri, Aug 23, 2024 at 06:05:05PM +0100, Javi Merino wrote:
> > Despite its name, libxl_xen_console_read_line() does not read a line,
> > it fills the buffer with as many characters as fit.  Update the
> > documentation to reflect the real behaviour of the function.  Rename
> > line_r to avoid confusion since it is a pointer to an array of
> > characters.
> > 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >  tools/libs/light/libxl_console.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> > index f42f6a51ee6f..652897e4ef6d 100644
> > --- a/tools/libs/light/libxl_console.c
> > +++ b/tools/libs/light/libxl_console.c
> > @@ -789,17 +789,19 @@ libxl_xen_console_reader *
> >      return cr;
> >  }
> >  
> > -/* return values:                                          *line_r
> > - *   1          success, whole line obtained from buffer    non-0
> > - *   0          no more lines available right now           0
> > - *   negative   error code ERROR_*                          0
> > - * On success *line_r is updated to point to a nul-terminated
> > +/* Copy part of the console ring into a buffer
> > + *
> > + * Return values:
> > + *   1: Success, the buffer obtained from the console ring an
> > + *   0: No more lines available right now
> > + *   -ERROR_* on error
> > + *
> > + * On success, *line_r is updated to point to a nul-terminated
> >   * string which is valid until the next call on the same console
> > - * reader.  The libxl caller may overwrite parts of the string
> > - * if it wishes. */
> > + * reader. */
> >  int libxl_xen_console_read_line(libxl_ctx *ctx,
> >                                  libxl_xen_console_reader *cr,
> > -                                char **line_r)
> > +                                char **buff)
> 
> You may want to update "tools/include/libxl.h" as well.

Sure, I will change this in "tools/include/libxl.h".

> I don't know why
> this comments is here instead of in the public header. At least there's
> some documentation I guess.

Cheers,
Javi

