Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE37772AA1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578724.906369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT341-00010M-NK; Mon, 07 Aug 2023 16:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578724.906369; Mon, 07 Aug 2023 16:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT341-0000yc-Jy; Mon, 07 Aug 2023 16:26:37 +0000
Received: by outflank-mailman (input) for mailman id 578724;
 Mon, 07 Aug 2023 16:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JzBl=DY=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qT340-0000yV-7v
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:26:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c691d46-353f-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 18:26:34 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb727cso28853975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 09:26:34 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c294400b003fc05b89e5bsm11133310wmd.34.2023.08.07.09.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:26:33 -0700 (PDT)
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
X-Inumbo-ID: 2c691d46-353f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691425593; x=1692030393;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EKUUe6jb+Vbb+siDjVhEDsYJmexMFcVsomt1hi6nWb0=;
        b=KztarhwQevvRnwR6xL8VRN5V5NjUCfXfP9wHA1xtm6bduIynv4tHT/M1hYk8VpsUUz
         5xCID/x50mYl14bsoX601fW3nXfI6u1MkZgeM9LKrrWMtr/vdBRCw/r/9wJvGVughiNV
         bbaQRfWk3CcoLrYvhn2gId/Wg4+NaJ+tGbe0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691425593; x=1692030393;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKUUe6jb+Vbb+siDjVhEDsYJmexMFcVsomt1hi6nWb0=;
        b=Tae7jo/oyTvxsaqeNZkTh69iaycPe6/fLIztlNrQpmI3kojXezgQTqB4huzRJ1NAYi
         rcEApNACPVN5mKkf4tx9M6KYcM5qA6M5rN7ohVibjgv2gq06QngxaTu8UA+YSjpMMNvY
         jMtEH134WNK0EQVYy1uIp02/NyyVLDtXVxdJq1B4pshvnR2rU/LYUyhlCiciqnBN7dNP
         W7zbvgksf4PE8I5uLr7XsZKlqx4Ek+4tnNH7FVJq0xOcbEjbb09oDL0CErqCkQdQTKl6
         5VH0HVOaTRjkHaJl7TD4X1D23eNAtZjr3m4/vltakaisen5bfbwwQiSh7bPGkSpy0PVw
         PHNQ==
X-Gm-Message-State: AOJu0YzJzn3q5ync0cEjV9XzO99WYhL9A4fF5vDOzhyGvP4iGM87mf3m
	ZwBFU7dVd4qLHKMzMxYmUkEydg==
X-Google-Smtp-Source: AGHT+IFZukGiP8qBs7KGp9gFHntXWyu4NdJeckuiNmydV3RA13Ebaek9HmFOh+ijakcj3EwsY8xiBw==
X-Received: by 2002:a1c:7c03:0:b0:3fe:43b4:55c with SMTP id x3-20020a1c7c03000000b003fe43b4055cmr7770688wmc.30.1691425593468;
        Mon, 07 Aug 2023 09:26:33 -0700 (PDT)
Message-ID: <64d11b39.050a0220.2ab40.c2cc@mx.google.com>
X-Google-Original-Message-ID: <ZNEbN+HYukpholoi@EMEAENGAAD19049.>
Date: Mon, 7 Aug 2023 17:26:31 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/5] mm: Factor out the pdx compression logic in ma/va
 converters
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-3-alejandro.vallejo@cloud.com>
 <db533ea3-8b1f-fb36-a0b8-d196f3a84f33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db533ea3-8b1f-fb36-a0b8-d196f3a84f33@suse.com>

On Mon, Jul 31, 2023 at 05:15:19PM +0200, Jan Beulich wrote:
> On 28.07.2023 09:59, Alejandro Vallejo wrote:
> > --- a/xen/include/xen/pdx.h
> > +++ b/xen/include/xen/pdx.h
> > @@ -160,6 +160,31 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
> >  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
> >  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
> >  
> > +/**
> > + * Computes the offset into the direct map of an maddr
> > + *
> > + * @param ma Machine address
> > + * @return Offset on the direct map where that
> > + *         machine address can be accessed
> > + */
> > +static inline unsigned long maddr_to_directmapoff(uint64_t ma)
> 
> Was there prior agreement to use uint64_t here and ...
> 
> > +{
> > +    return ((ma & ma_top_mask) >> pfn_pdx_hole_shift) |
> > +           (ma & ma_va_bottom_mask);
> > +}
> > +
> > +/**
> > + * Computes a machine address given a direct map offset
> > + *
> > + * @param offset Offset into the direct map
> > + * @return Corresponding machine address of that virtual location
> > + */
> > +static inline uint64_t directmapoff_to_maddr(unsigned long offset)
> 
> ... here, not paddr_t?
The whole file uses uint64_t rather than paddr_t so I added the new code
using the existing convention. I can just as well make it paddr_t, it's
not a problem.

> 
> Also you use unsigned long for the offset here, but size_t for
> maddr_to_directmapoff()'s return value in __maddr_to_virt().
> Would be nice if this was consistent within the patch.
That's fair. I can leave it as "unsigned long" (seeing that a previous nit was
preferring that type over size_t).

> Especially since the names of the helper functions are longish,
> I'm afraid I'm not fully convinced of the transformation.
In what sense? If it's just naming style I'm happy to consider other names,
but taking compression logic out of non-pdx code is essential to removing
compiling it out.

> But I'm also not meaning to stand in the way, if everyone else wants to
> move in that direction.
> 
> Jan

Thanks,
Alejandro

