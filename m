Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBBFB29B1F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 09:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085498.1443815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuaW-0005Lb-Vc; Mon, 18 Aug 2025 07:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085498.1443815; Mon, 18 Aug 2025 07:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuaW-0005J0-Sk; Mon, 18 Aug 2025 07:47:28 +0000
Received: by outflank-mailman (input) for mailman id 1085498;
 Mon, 18 Aug 2025 07:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAy/=26=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1unuaW-0005Fu-7T
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 07:47:28 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957d28b7-7c07-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 09:47:26 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9edf504e6so1730051f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 00:47:26 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c6ce764sm160067735e9.10.2025.08.18.00.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 00:47:21 -0700 (PDT)
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
X-Inumbo-ID: 957d28b7-7c07-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755503246; x=1756108046; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJVH+bWoszW05bZZxori3hPMjhrOcUefb8rm7OOztU8=;
        b=S9bjNR5N/qFGlvg1KnjZLW6c7sTNmdUfwD9l1ClYhe8o13c9KOwcGT5F1odEGo1D4K
         tsK8IdBeuwduUaC4AAWYAukYhHtfG5UJF2KOUZzEYr0vACqXXjZX01oeNMJYR+I6WzDG
         rqp44/8QDhWj2adiMvLXSE9TVUeMorBqXdsEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503246; x=1756108046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJVH+bWoszW05bZZxori3hPMjhrOcUefb8rm7OOztU8=;
        b=ZgRshKDtkOnkJ6O78jdFMKOXdLs4o7EJPWJeBPoR2ZOOBLHdy/MbII9M5ayaS6WbHS
         ykK0XtnBuSNAI6fbiu4kmSVd5QiFkoxnU5G2pJk6cyq4opOUOXbLKncfRSqs4ZgBs/Fv
         tKALkrvXP1DqpNM9onBSNBiZCMCYUtcam1Yyu6Dvt0b4E0uiomt6Pz8dunRvyhO9G8N0
         N0h7DMYTP4gyh0J0HWyBQPAF/x9PCjq1eeGHjDZ3TbQ5m00e/x58eg73BDOg7kHwUBrR
         EK4RYiFntdxVpTK1TU5Pl9B/+qVOEUFuZli2nLa+Qy6D2DZLo+qRnVcZgAAJ1tua3dTV
         d0/Q==
X-Gm-Message-State: AOJu0Yy6l+mMN0+irbc97aMQblPWXCduXBgLDbP7dPt0wraorueLJMUB
	us0z1Ge+28qM674Uq6AHH9Zvn7JJBXam6SWf0uMWYw/zjYv2E+a3kG2yM/poBwx6nP0=
X-Gm-Gg: ASbGncu7WTGcoNI9/g0r8Rb21h/Vog82VZYAMAEwwdsMR88MwKCbLyyvSgIki0IPDZ8
	jHVDDUFDm4qRz2rtxu0mwhRj6ThA7aDhVshpi8LD+l9mSjVUF0WCiavmBWestL6E1qpy+wo0i0P
	QBcCpfUA0nCL01KB7qRe1NJL58rekLy4aXWrNYqNfOQQbmZ3dEeKkDwSmLIJ5Ze/tqHK8oaA3fs
	m/I+pZxvDAM1iDFiChTECjuPl4L912I5bODZ7DOcvcQ4fvtOa9onMW8u9CJT6+dGgshDb0RGk+9
	pDBnr3chDR8FNCNbjusjEkK73g4Ton3Vww5wLSgnDYJr7xBsLtYrSnkOMhCxdEqbGh1YwwD57eE
	7xdQIA6gxXdAaDmUBYggyZ8raeQYZhtPxAPSmwU3E6BKYXvGr0+J1JVp9hOPXYsVBiQ==
X-Google-Smtp-Source: AGHT+IF8ao7qhRrS0c8MZaQdJBJewoUcCurGJKqO/6C5LB79oyG3B6SG98yaOyLTEAOQj2EkY0tWMQ==
X-Received: by 2002:a05:6000:430c:b0:3b7:8984:5134 with SMTP id ffacd0b85a97d-3bb66a3b2ddmr8050979f8f.16.1755503241742;
        Mon, 18 Aug 2025 00:47:21 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:47:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jiqian.Chen@amd.com, jbeulich@suse.com
Subject: Re: [PATCH 2/5] xen/vpci: make BAR mapping more resilient for the
 hardware domain
Message-ID: <aKLaiJYqIcC9Rr6r@macbook.local>
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-3-roger.pau@citrix.com>
 <269db2aa-9ca1-446b-98f7-60ea2386fc03@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <269db2aa-9ca1-446b-98f7-60ea2386fc03@amd.com>

On Fri, Aug 15, 2025 at 02:53:35PM -0400, Stewart Hildebrand wrote:
> On 8/14/25 12:03, Roger Pau Monne wrote:
> > The logic in map_range() will bubble up failures to the upper layer, which
> > will result in any remaining regions being skip, and for the non-hardware
> > domain case the owner domain of the device would be destroyed.  However for
> > the hardware domain the intent is to continue execution, hopping the
> > failure to modify the p2m could be worked around by the hardware domain.
> > 
> > To accomplish that in a better way, ignore failures and skip the range in
> > that case, possibly continuing to map further ranges.
> > 
> > Since the error path in vpci_process_pending() should only be used by domUs
> > now, and it will unconditionally end up calling domain_crash(), simplify
> > it: there's no need to cleanup if the domain will be destroyed.
> > 
> > No functional change for domUs intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/drivers/vpci/header.c | 51 +++++++++++++++++++++------------------
> >  1 file changed, 28 insertions(+), 23 deletions(-)
> > 
> > diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> > index b9756b364300..1035dcca242d 100644
> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -64,7 +64,8 @@ static int cf_check map_range(
> >              printk(XENLOG_G_WARNING
> >                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
> >                     map->d, map_mfn, m_end);
> > -            return -EPERM;
> > +            rc = -EPERM;
> > +            goto done;
> >          }
> >  
> >          rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end, map->map);
> > @@ -73,7 +74,7 @@ static int cf_check map_range(
> >              printk(XENLOG_G_WARNING
> >                     "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
> >                     map->d, map_mfn, m_end, rc);
> > -            return rc;
> > +            goto done;
> >          }
> >  
> >          /*
> > @@ -87,17 +88,27 @@ static int cf_check map_range(
> >  
> >          rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
> >                        : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
> > -        if ( rc == 0 )
> > -        {
> > -            *c += size;
> > -            break;
> > -        }
> >          if ( rc < 0 )
> >          {
> >              printk(XENLOG_G_WARNING
> >                     "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
> >                     map->map ? "" : "un", s, e, map_mfn,
> >                     map_mfn + size, map->d, rc);
> > +            goto done;
> > +        }
> > +        if ( rc == 0 )
> > +        {
> > + done:
> > +            if ( is_hardware_domain(map->d) )
> > +            {
> > +                /*
> > +                 * Ignore failures for the hardware domain and skip the range.
> > +                 * Do it as a best effort workaround to attempt to get the
> > +                 * hardware domain to boot.
> > +                 */
> > +                rc = 0;
> 
> If we return success and size is zero, we will potentially attempt to map/unmap
> the same region again in an infinite loop. rangeset_consume_ranges would invoke
> map_range again directly without returning to vpci_process_pending.
> 
> > +                *c += size;
> 
> This line is now only executed for hwdom, but ...
> 
> > +            }
> 
> ... it should go outside of the hwdom check because domUs still need it.

Indeed, this should be:

            if ( is_hardware_domain(map->d) )
                /*
                 * Ignore failures for the hardware domain and skip the range.
                 * Do it as a best effort workaround to attempt to get the
                 * hardware domain to boot.
                 */
                rc = 0;

            *c += size;
            break;

Otherwise domU won't make progress.  It would be helpful to have some
domU testing in the CI loop, otherwise I have no way to test the domU
side when modifying vPCI.

Thanks, Roger.

