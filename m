Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18969B29AFC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 09:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085475.1443793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuVt-0004Ek-6M; Mon, 18 Aug 2025 07:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085475.1443793; Mon, 18 Aug 2025 07:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuVt-0004Bf-3R; Mon, 18 Aug 2025 07:42:41 +0000
Received: by outflank-mailman (input) for mailman id 1085475;
 Mon, 18 Aug 2025 07:42:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAy/=26=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1unuVr-0004BI-5r
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 07:42:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9a4ab16-7c06-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 09:42:38 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9e41101d4so2012910f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 00:42:38 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3bb6484ebfdsm11620505f8f.7.2025.08.18.00.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 00:42:36 -0700 (PDT)
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
X-Inumbo-ID: e9a4ab16-7c06-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755502957; x=1756107757; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yecjhFxDU+7ON3aoGiaI2+YdtwJIrs35dIO/yxBltB0=;
        b=EydYCCFn25vevSCg6USPTM0nTS0MaWNyhXhINZe/kMXYhfMZ4IwZ1jYxfgVnNifBGA
         1zlfYNvksVWCuERJgkOPpNVpoXTBSLAFmgVJIbAM18BRGe9qLQEY6f8+XMc1bcef6dCG
         Y9KmeM63i0yRBnOrg4II4ySUhiEwUjClAQTNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755502957; x=1756107757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yecjhFxDU+7ON3aoGiaI2+YdtwJIrs35dIO/yxBltB0=;
        b=CD1yZmlJor0k99Ld3MWNVMxOGR3eJ4uvr9xt9h6LEhdwR86b1r2s2rnzzX4suF7gs9
         0FA6rRQWnxbov9inytIthSafdyTM/eM0TNNtlkfA4F41yBHUrO//HB1VYEUT4Q0dJK8x
         kLNLVS2C4cESqvlaWyIRDakN7SsC2JEsviIV3K/EH90nLaN7LC4JjsBEMhuQc96LzXLn
         9CLPeUSX10K/aLNxD0TpWxlvOw9ntMX4YnQL192wO5Gs8tCvbtsiUjop72KvAWqBMHkz
         oZGXvxPzOCYDUWGh3X+jQhbwNqpBmVYBlGOUt9okA647v98WKcAxI9tYBjpvlmk3i8nJ
         HEUw==
X-Gm-Message-State: AOJu0YxBU1yuUORTlYbug364SMJdlhZqqZ9KuJjM/EkdC7YW5srrn05g
	/LaiiP5p3c4StiZF6w3djkyC2r8np5FtACG44F/Gwmg73D0NYDGfI1fiGKspU3OQARo=
X-Gm-Gg: ASbGncuR58XKkH12Wy6EebW22MInKpmUaP2+gKfgs6oXUQkTsacv21C8PuZj5TL4ruV
	Lon8f586NbUek1d2R1o5VKFnpTEcvuMoThFmIPokmUQkverGxVs5hHDSPH0kCHwxPG+iN1cYRPX
	/znDH5kTiiLWkt7SiWEfLYM4lZa72VCBVAUaV6NgOIQeM2WNtGeCJ+AJHSzXhGT7xhmMF8xVxc1
	wGH3+aVlSnwDEpn74uCO1rAceLrZERTQonB9rgvYOWQ0AtETXvAvzM2m8kUn/o6IZ7IdOYiA5nv
	4I9lE/7O0nRwPxI9Gn7AQyBEikyhPf1FNuEpTTxpHgbbu2rPLYalKkhBEa++/Inlfq5zfXgDYuk
	CUOdjZH+jNA4rHmMeIAi/XVZ0sw9Bo31eaR1Mt4jFi2wgaTSYE6zCEYaht1AICJ7IQw==
X-Google-Smtp-Source: AGHT+IHc4+fTiG8ca2srRKBQ7URCmrMhhdIBd5Z/Ki9XX7Lg3pkV+wNZYKKW3kmhMG/0OgbPoi2P0g==
X-Received: by 2002:a5d:5888:0:b0:3b7:820b:a830 with SMTP id ffacd0b85a97d-3bb676c93cdmr8682614f8f.25.1755502957480;
        Mon, 18 Aug 2025 00:42:37 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:42:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jiqian.Chen@amd.com, jbeulich@suse.com
Subject: Re: [PATCH 2/5] xen/vpci: make BAR mapping more resilient for the
 hardware domain
Message-ID: <aKLZbNSltqqbXWk0@macbook.local>
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
> 
> >              break;
> >          }
> >          ASSERT(rc < size);
> > @@ -213,28 +224,22 @@ bool vpci_process_pending(struct vcpu *v)
> >              return true;
> >          }
> >  
> > -        if ( rc )
> > +        if ( rc && !is_hardware_domain(v->domain) )
> >          {
> > -            spin_lock(&pdev->vpci->lock);
> > -            /* Disable memory decoding unconditionally on failure. */
> > -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> > -                            false);
> 
> This path could be taken for either map or unmap. Do we still want to disable
> memory decoding in case of unmap?

Does it make an effective difference?  For the hardware domain we
should never get here, and for domUs the domain will be destroyed, so
disabling memory decoding is not helpful?

Thanks, Roger.

