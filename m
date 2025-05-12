Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E6AB3A92
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981570.1367979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU8D-0008AD-GW; Mon, 12 May 2025 14:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981570.1367979; Mon, 12 May 2025 14:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU8D-00088V-D0; Mon, 12 May 2025 14:27:49 +0000
Received: by outflank-mailman (input) for mailman id 981570;
 Mon, 12 May 2025 14:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEU8C-0007lA-I3
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:27:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4652ccd7-2f3d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:27:46 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad216a5a59cso488494466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:27:47 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad2193495bdsm625970566b.70.2025.05.12.07.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:27:46 -0700 (PDT)
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
X-Inumbo-ID: 4652ccd7-2f3d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747060066; x=1747664866; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or+r3MwJKV/Rk/FcE0NBVHWCY1awSXgGLUSkz63QNZ8=;
        b=Su/ll87rsNHFujnaCfdAS+edBqjsnibNMdHFRq56ekiPqll9Z3kW8DI1H6GvXD8uPk
         ZJA+9h6a6wL/qNpHcC8bzDozo9FS+iLuq9kQubZQnXRN0C9BJsfEu9huZD5eOUQgPcGy
         /EviF5au6Os0tAn/JtmGc8GIYP9zBoAHkPla0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060066; x=1747664866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=or+r3MwJKV/Rk/FcE0NBVHWCY1awSXgGLUSkz63QNZ8=;
        b=M5xRl7v+VFo1CpqYeIYZcN5msZQbuhfyPRMawVzbwqO9pUZ9TunbJT30Kn6RHR5t/g
         kfsiyv2VHIOqE6O4QIE/qJf30v6PfNuheZesCjS4zTccqzr64f1zoSGba1uADOW2lYsI
         ZzqS8o3OvC0fKTx3uehxUUBkr+5mexNW3/tgNpUwlMI34g2nR0qbf/E1KQo9Tr6L5iVo
         DtSVJ8m97fXwWixh42AtANncohWEPRMi2RFn+0oTfGzJVqgY7rjET9fM6j0bq3oI2sEp
         wNR8ytTz85ifXXvfekOelsxBx72KVbt1NikH1cmK19lXWurLhOUPopP14Se7VYBZN806
         aPfw==
X-Forwarded-Encrypted: i=1; AJvYcCXNAJP+4esMQrSIYqp4yktPisAJjnQfGVH0kN6FrInmknznPkd98oEbCCUI1f7BDwhsE4oONF/hAC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJQEhiwhNvAz4PDU/W4njgQxHSyTLVaemU6rWiyxtnuMteEiOM
	y2yY64CLKUS3sC1OHajaBzoudWhAtp8hl1pZTr9Qryj6aUlwVZHOQPU5w05vT8g=
X-Gm-Gg: ASbGncud8IfoTL6MdeEX0QLiAw3J0/5oTb0Qjgkzefg5S3fCJbKCht2G2ELtne3xL6G
	qougy7bbLwv/gnpgntyBr8jzkiecHAhk+yTxTr+Ch2XRx7M2JCXNcfCsEqNw+BPVl4QMJZu+Pj8
	PPjUCypHMpft8BkYOFAcJEfovly2Fn5YTt6R1QBaxcS3Z1zWQvOBHWjNIubIV0zyIBGYouHUO8+
	fzROUtOvieCgM1aSIWYowZtImKfxKMZkLSDyVVsnOcqscLANpQiVZbyiU4z+diR7BWp+E5X2IsE
	Kuww77u2UVKP6L5AL0X4aAvjEU/fXSjh/ztMPqwzr66sBwHnMvf9sTeaPfxE69vd3c4=
X-Google-Smtp-Source: AGHT+IGzR/W524pfd6gfbIKUYGOHr6G0/tATie6nfnbiSf8zm37FFvLMhQTaF6MtTtR57N8lNKOMcw==
X-Received: by 2002:a17:907:7f21:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-ad219002422mr1099979866b.26.1747060066465;
        Mon, 12 May 2025 07:27:46 -0700 (PDT)
Date: Mon, 12 May 2025 16:27:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] x86/pv: fix MMUEXT_FLUSH_CACHE to flush all pCPU
 caches
Message-ID: <aCIFYeHelzemACdZ@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-2-roger.pau@citrix.com>
 <81a5182a-19aa-437d-b575-f3d8e45e4ca9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81a5182a-19aa-437d-b575-f3d8e45e4ca9@suse.com>

On Mon, May 12, 2025 at 04:09:28PM +0200, Jan Beulich wrote:
> On 06.05.2025 10:31, Roger Pau Monne wrote:
> > The implementation of MMUEXT_FLUSH_CACHE is bogus, as it doesn't account to
> > flush the cache of any previous pCPU where the current vCPU might have run,
> > and hence is likely to not work as expected.
> > 
> > Fix this by resorting to use the same logic as MMUEXT_FLUSH_CACHE_GLOBAL,
> > which will be correct in all cases.
> > 
> > Fixes: 534ffcb416bb ("Fix WBINVD by adding a new hypercall.")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Alternatively, the hypercall could be made correct by keeping track of the
> > pCPUs the vCPU has run on since the last cache flush.  That's however more
> > work.  See later in the series.
> 
> Since, as iirc you indicated elsewhere, there's no actual user of this sub-op,
> doing as you do here is likely good enough. Just one concern:
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -3805,14 +3805,11 @@ long do_mmuext_op(
> >              break;
> >  
> >          case MMUEXT_FLUSH_CACHE:
> > -            if ( unlikely(currd != pg_owner) )
> > -                rc = -EPERM;
> > -            else if ( unlikely(!cache_flush_permitted(currd)) )
> > -                rc = -EACCES;
> 
> This error code will change to ...
> 
> > -            else
> > -                wbinvd();
> > -            break;
> > -
> > +            /*
> > +             * Dirty pCPU caches where the current vCPU has been scheduled are
> > +             * not tracked, and hence we need to resort to a global cache
> > +             * flush for correctness.
> > +             */
> >          case MMUEXT_FLUSH_CACHE_GLOBAL:
> >              if ( unlikely(currd != pg_owner) )
> >                  rc = -EPERM;
> 
> ... -EINVAL (sitting out of context). If we accept any error code change here,
> I think it wants to be the other way around, as EINVAL isn't quite appropriate
> to signal !cache_flush_permitted() to the caller. With that extra adjustment:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Oh, good catch.  I didn't realize the return code change.

Thanks, Roger.

