Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98C832AAC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 14:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669056.1041652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQp9e-0002dz-8H; Fri, 19 Jan 2024 13:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669056.1041652; Fri, 19 Jan 2024 13:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQp9e-0002bc-4i; Fri, 19 Jan 2024 13:43:30 +0000
Received: by outflank-mailman (input) for mailman id 669056;
 Fri, 19 Jan 2024 13:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xVsr=I5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQp9c-0002bU-TG
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 13:43:28 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b903264b-b6d0-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 14:43:27 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3387ef9fc62so675219f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 05:43:27 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 q9-20020adff789000000b00337d6aa3912sm3107801wrp.10.2024.01.19.05.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 05:43:26 -0800 (PST)
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
X-Inumbo-ID: b903264b-b6d0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705671806; x=1706276606; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cHVXDrHsrue1kpxD3c+cDLtoqNC4QjTpLB8mCj2VBAQ=;
        b=QrthPVgWFkzpmhuM6aTY4fgOWcQ/tlPplq7mam8PNtYtMHULJs7n4MCo/8IkMtCm2m
         n0C1Z4WrGyyurZhWdLwXNrPgNhyr/5AwU+SQQ0fUFxJYXmHsh0KaIztWnT95i/TvFmFE
         NeTTVuPdVNF7lfgY+cBQuZkUw8F5yNlAfiQic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705671806; x=1706276606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHVXDrHsrue1kpxD3c+cDLtoqNC4QjTpLB8mCj2VBAQ=;
        b=P/KQeJZ0vp+8bLe4hJLwPIg5+PETGsAHM/DNfaRsPtY1BOywvAu8gYX2Cgi7RulUl3
         8LGxsiWeuZ0MbiadRv2ob7SdlaJ0tGkBNhPwQmHAspd0UhteYBXhk79XodKsCDifI6uO
         ZraDdVt1tcfR3hHEfeairG9/9vIRuxc10teymh7z5fh+CwOOv2IAfhBbmTfK+LtsB8jN
         I7Q28awVDDeaZCmipUNNcBnNsb6vQDxSJ+kkaS7G+JkgOLKqm0bTmZKqDiR/U2+xTwqN
         dKW9dUB2wzrDEgVOaw/c1QLbX3fCcxmblGxazQIhTKCjINKiepTzzpXPtuDRNPkE7WOt
         mO4A==
X-Gm-Message-State: AOJu0YwMMedKpBh53kphOvQuphmnyDdLsxLC52dIpi7vn6mes1bodea3
	VzuYK8Au2+5ckCuX3AFByuHmL+OhbsYgrSXw7W8bGs9PTmE48HplACio33Q7g/k=
X-Google-Smtp-Source: AGHT+IGmqfutxua1VXCg4x0Vi1g6ObFbzX8v00gLWTRPwJ9xyeHagFZGjZMOl/orTylT9ia3b+95LA==
X-Received: by 2002:a5d:5187:0:b0:337:c0cb:38cd with SMTP id k7-20020a5d5187000000b00337c0cb38cdmr1461038wrv.71.1705671806509;
        Fri, 19 Jan 2024 05:43:26 -0800 (PST)
Date: Fri, 19 Jan 2024 14:43:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v12.2 09/15] vpci/header: program p2m with guest BAR view
Message-ID: <Zap8fUPGTa0P5reU@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-10-stewart.hildebrand@amd.com>
 <20240115194406.45711-1-stewart.hildebrand@amd.com>
 <05298b1e-118d-41ed-8b6d-45c69bb09ea9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05298b1e-118d-41ed-8b6d-45c69bb09ea9@amd.com>

On Tue, Jan 16, 2024 at 10:01:24PM -0500, Stewart Hildebrand wrote:
> On 1/15/24 14:44, Stewart Hildebrand wrote:
> > diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> > index feccd070ddd0..8483404c5e91 100644
> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -41,13 +42,24 @@ static int cf_check map_range(
> >      unsigned long s, unsigned long e, void *data, unsigned long *c)
> >  {
> >      const struct map_data *map = data;
> > +    /* Start address of the BAR as seen by the guest. */
> > +    unsigned long start_gfn = PFN_DOWN(map->bar->guest_addr);
> > +    /* Physical start address of the BAR. */
> > +    unsigned long start_mfn = PFN_DOWN(map->bar->addr);
> >      int rc;
> >  
> >      for ( ; ; )
> >      {
> >          unsigned long size = e - s + 1;
> > +        /*
> > +         * Ranges to be mapped don't always start at the BAR start address, as
> > +         * there can be holes or partially consumed ranges. Account for the
> > +         * offset of the current address from the BAR start.
> > +         */
> > +        unsigned long map_mfn = start_mfn + s - start_gfn;
> > +        unsigned long m_end = map_mfn + size - 1;
> >  
> > -        if ( !iomem_access_permitted(map->d, s, e) )
> > +        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
> 
> Nit: since this check will now use map_mfn and m_end...
> 
> >          {
> >              printk(XENLOG_G_WARNING
> >                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
> >                     map->d, s, e);
> 
> ... I'd like to also update the arguments passed to this print statement.

Indeed.  You will need a new version.

Thanks, Roger.

