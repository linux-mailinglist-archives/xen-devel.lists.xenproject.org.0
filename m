Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D779975690E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564768.882477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLR17-0001QA-8d; Mon, 17 Jul 2023 16:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564768.882477; Mon, 17 Jul 2023 16:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLR17-0001Mn-4u; Mon, 17 Jul 2023 16:24:09 +0000
Received: by outflank-mailman (input) for mailman id 564768;
 Mon, 17 Jul 2023 16:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLR15-0001Me-M3
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:24:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59a92b12-24be-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:24:06 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so674324066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:24:06 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dk7-20020a170906f0c700b009931a3adf64sm9541063ejb.17.2023.07.17.09.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:24:05 -0700 (PDT)
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
X-Inumbo-ID: 59a92b12-24be-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689611045; x=1692203045;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XUIH2ZIe8VQsTXV7gRCJU6VoOH6iTYGs97G/4I4CzPc=;
        b=cJRYFoo0K2DpnQu3VCl09TnL+w6XAc2wP0y5h+I0Ev/l/PMvHTxVNAxOXVkMqID88a
         TsWOmyARtW+a9YgCkCIOltcrDGscubafrw5KlWcZxaBYtQHU93uifdRsc1N/s24hvWvd
         enfJrLoq1fFh1oBTk0/b/CrOtO5/LgphtxI5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611045; x=1692203045;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUIH2ZIe8VQsTXV7gRCJU6VoOH6iTYGs97G/4I4CzPc=;
        b=XNbjrowBKpZ2YZno52vjqwIfZ4wRShaQt07jpjcw6gTULo1pIXxlhOsvmBDI7c9SbU
         zcTARB8ssSRRSn5ZzAa690OnXGIIwgqOhbaddZ4fgC7c1ZgbeKjw83HjvWGTmZ8uYS/b
         YL/OL9sgnu5B5Ofx+fkv4X0eFxWCY5kEBprV7fJ6YUjGCB+YlMDrLeOLAuz4/oPP6Yle
         CNBHLcWhwQidObhazyCLKVbrnU/Qc+2L7N9u6cKhfiZydzYgzHsw6Rx8HXnm45cL0vhO
         TbawQqzceO9F1lIG1mE03VvUEXU0l7luiUf3zRFFzfpguvs0BaZmO7WrJS5BvpDS/Rar
         VZEA==
X-Gm-Message-State: ABy/qLZHp0X3l8wTfi/0ow5jMOB5c1haJoK+OafzjAPvrAsCU1WbNUP1
	BuqDBVbpONcMiXYN5ldmV/GU15gNUGmcIFK/7wo=
X-Google-Smtp-Source: APBJJlH6lWTRfn8QxE3FvhYjXRQPmYqtZuws9xYEumtn9jnhnQGPr2nrntxe/xTaIvZ592LJs/VgwA==
X-Received: by 2002:a17:906:4710:b0:994:4f6a:dbb with SMTP id y16-20020a170906471000b009944f6a0dbbmr8519754ejq.27.1689611045579;
        Mon, 17 Jul 2023 09:24:05 -0700 (PDT)
Message-ID: <64b56b25.170a0220.6a4ba.993c@mx.google.com>
X-Google-Original-Message-ID: <ZLVrJGBnCMQkGcIe@EMEAENGAAD19049.>
Date: Mon, 17 Jul 2023 17:24:04 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] pdx: Reorder pdx.[ch]
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-8-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717160318.2113-8-alejandro.vallejo@cloud.com>

On Mon, Jul 17, 2023 at 05:03:17PM +0100, Alejandro Vallejo wrote:
> The next patch compiles out compression-related chunks, and it's helpful to
> have them grouped together beforehand.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/common/pdx.c      | 58 +++++++++++++++++++++----------------------
>  xen/include/xen/pdx.h | 37 +++++++++++++++++++++------
>  2 files changed, 59 insertions(+), 36 deletions(-)
> 
> [snip]
>
> diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> index 5378e664c2..ce27177b56 100644
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -68,15 +68,41 @@
>   */
>  
>  extern unsigned long max_pdx;
> -extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
> -extern unsigned int pfn_pdx_hole_shift;
> -extern unsigned long pfn_hole_mask;
> -extern unsigned long pfn_top_mask, ma_top_mask;
>  
>  #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
>                           (sizeof(*frame_table) & -sizeof(*frame_table)))
>  extern unsigned long pdx_group_valid[];
>  
> +/**
> + * Mark [smfn, emfn) as allocatable in the frame table
> + *
> + * @param smfn Start mfn
> + * @param emfn End mfn
> + */
> +void set_pdx_range(unsigned long smfn, unsigned long emfn);
> +
> +/**
> + * Invoked to determine if an mfn has an associated valid frame table entry
> + *
> + * In order for it to be legal it must pass bounds, grouping and
> + * compression sanity checks.
> + *
> + * @param mfn To-be-checked mfn
> + * @return True iff all checks pass
> + */
> +bool __mfn_valid(unsigned long mfn);
> +
> +#define page_to_pdx(pg)  ((pg) - frame_table)
> +#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
> +
> +#define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
> +#define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
> +
> +extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
> +extern unsigned int pfn_pdx_hole_shift;
> +extern unsigned long pfn_hole_mask;
> +extern unsigned long pfn_top_mask, ma_top_mask;
> +
>  /**
>   * Validate a region's compatibility with the current compression runtime
>   *
> @@ -164,9 +190,6 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
>             ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
>  }
>  
> -#define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
> -#define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
> -
>  /**
>   * Computes the offset into the direct map of an maddr
>   *
> -- 
> 2.34.1
The latest rebase messed up this patch. set_pdx_range(), __mfn_valid() and
the page_to_pdx()/pdx_to_page() macros should be removed in order for the
additions to make sense. Re-running GitLab with that now...

Alejandro



