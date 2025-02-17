Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B4DA37D21
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 09:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889798.1298838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwRH-0007fQ-Lp; Mon, 17 Feb 2025 08:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889798.1298838; Mon, 17 Feb 2025 08:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwRH-0007dk-JB; Mon, 17 Feb 2025 08:25:15 +0000
Received: by outflank-mailman (input) for mailman id 889798;
 Mon, 17 Feb 2025 08:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glRE=VI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tjwRF-0007db-GL
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 08:25:13 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b21c5724-ed08-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 09:25:08 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2fc0026eb79so7650276a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 00:25:08 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b324asm9503509a91.3.2025.02.17.00.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:25:06 -0800 (PST)
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
X-Inumbo-ID: b21c5724-ed08-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739780707; x=1740385507; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PsC5XnGE8+IvSFqsbAnkaNghk+tRxgASKQf1Q198+nY=;
        b=sNabvL5P7ikHVISnc4pPZnEzKI/BBrnOEdvPah9nKhxRtl7vlMWvNlr9k2irikcIjt
         udRAz4VnrGRjHcTtfKaE07O2VpD8mT1TMYrD9nozuZHm799Xty4u+AbWYSJ3wt2KA7++
         GpJMHNJH3OZrabp5/ey72SX9D+h0aP06DfKp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739780707; x=1740385507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsC5XnGE8+IvSFqsbAnkaNghk+tRxgASKQf1Q198+nY=;
        b=baiVfPI7TfzkQMgLRxichGgyXNlMVjNcb8RmO+GIpX8gDCJFUANQ/t5zYN3ILdjR/W
         Ve5FEk8lvd4WOYP1tVevTH5DklMtPWudDpGdr16GFL+0IwTahI5IKoAloqRo0pi23zj7
         8rAxr7AJV5dV4NJYonrgrwkRHthswabtkLz2wUHfEe1D/LZKvvWWYEG/mp6i17WZAHpT
         9CLpCQP5L6psUn8mjm2CGVCKYMTaMd5++EMPLIy66HmOMw5Aa2kMKO1+Sl3vTOyIEiLK
         mWDGB5ruBlwSmY6H9G7rLg83HIk/3Y7eDgfCHctyNc8UuyESCQLMAPCB8MfBKjpWdc5B
         x0GA==
X-Forwarded-Encrypted: i=1; AJvYcCUj+zf770Ur0z+MewV9lTc7mTHbh864vwVJ7fZpGeWHXd52xlGOMAJrR9+oSmbNdCU4wjC1oOvbhbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuZKA3tVh8RxXb5MHOljJf8OXNAF2HpG01kMVTM4nBOe9d/uzg
	nCU4tURQcXMOdtqOJcrAz1iyE9QVut0JdEHOpichQiQqkpU9vGKmH03Ke8WAEhg=
X-Gm-Gg: ASbGncvU9l7rYmJwBG26MUudAyA5f38v3MLndn3sbCoXYEiVpNaYTTCqfvQvVdcn4j7
	i79Vo9pwBHrz+cXnwkH/N/iXi41zfDFbEzmLfugxfDI2QiK721AALuPgBjKC2Uk23Mg0+Nenz5K
	qalb4tMdAEo3+A7WLuNqJvijsTyOGptyYDfifiBG0RKLhPE38v9EEFtmfpIu9Y/GEzUWKv1WieR
	eP9Y+mKfDVxIHnEw6t4IYy+Nodet/qy5vONeAD5wput6LqRnq+q4pP2uGSIisJjhssA2yTRJDnZ
	BaJU9FaJ0tnm3IQ8hxUx
X-Google-Smtp-Source: AGHT+IFXGIGRcoODwWFt3/Ys10qcoX6aMXA3fpHuE28SqCVbgMmFrJBirWF5N/K0NO+ETw2m6gXugw==
X-Received: by 2002:a17:90b:2248:b0:2fa:17d2:166 with SMTP id 98e67ed59e1d1-2fc4116bec9mr12433451a91.31.1739780706914;
        Mon, 17 Feb 2025 00:25:06 -0800 (PST)
Date: Mon, 17 Feb 2025 09:25:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
Message-ID: <Z7LyXcuTfuQpRPBd@macbook.local>
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-3-roger.pau@citrix.com>
 <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>
 <Z685StmNlL2d8iQT@macbook.local>
 <b1e87068-977d-45a6-b61f-e3c40876b947@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1e87068-977d-45a6-b61f-e3c40876b947@suse.com>

On Fri, Feb 14, 2025 at 02:07:05PM +0100, Jan Beulich wrote:
> On 14.02.2025 13:38, Roger Pau Monné wrote:
> > On Fri, Feb 14, 2025 at 12:53:01PM +0100, Jan Beulich wrote:
> >> On 14.02.2025 10:29, Roger Pau Monne wrote:
> >>> +{
> >>> +    unsigned long gfn = paddr_to_pfn(addr);
> >>> +    struct domain *currd = current->domain;
> >>> +    p2m_type_t type;
> >>> +    mfn_t mfn;
> >>> +    int rc;
> >>> +
> >>> +    ASSERT(is_hardware_domain(currd));
> >>> +    ASSERT(!altp2m_active(currd));
> >>> +
> >>> +    /*
> >>> +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
> >>> +     * having identity mappings for non RAM regions (gfn == mfn).
> >>> +     */
> >>> +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
> >>> +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
> >>> +        return -EPERM;
> >>> +
> >>> +    mfn = get_gfn(currd, gfn, &type);
> >>> +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
> >>> +        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;
> >>
> >> I understand this is to cover the case where two vCPU-s access the same GFN
> >> at about the same time. However, the "success" log message at the call site
> >> being debug-only means we may be silently hiding bugs in release builds, if
> >> e.g. we get here despite the GFN having had an identity mapping already for
> >> ages.
> > 
> > Possibly, but what would be your suggestion to fix this?  I will think
> > about it, but I can't immediately see a solution that's not simply to
> > make the message printed by the caller to be gprintk() instead of
> > gdprintk() so catch such bugs.  Would you agree to that?
> 
> My thinking was that it might be best to propagate a distinguishable error
> code (perhaps -EEXIST, with its present use then replaced) out of the function,
> and make the choice of gprintk() vs gdprintk() depend on that. Accompanied by a
> comment explaining things a little.

I think it would be easier if I just made those gprintk() instead of
gdprintk(), all with severity XENLOG_DEBUG except for the one that
reports the failure of the fixup function that is XENLOG_WARNING.
Would you be OK with that?

Thanks, Roger.

