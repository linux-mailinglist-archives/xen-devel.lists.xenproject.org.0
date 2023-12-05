Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA48058C0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648035.1011952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXOg-0001LU-OF; Tue, 05 Dec 2023 15:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648035.1011952; Tue, 05 Dec 2023 15:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXOg-0001J1-Lc; Tue, 05 Dec 2023 15:31:42 +0000
Received: by outflank-mailman (input) for mailman id 648035;
 Tue, 05 Dec 2023 15:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAXOe-0001HY-Tp
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:31:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61f7ffc2-9383-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:31:39 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso36087195e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:31:39 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b0040b45282f88sm22495494wmq.36.2023.12.05.07.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:31:38 -0800 (PST)
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
X-Inumbo-ID: 61f7ffc2-9383-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701790298; x=1702395098; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3+uqWxErhzgehuMAHMjeWDwWx1J6qII9mSEKwAdnl4=;
        b=Wpayb/L7FtoXzmzTMRDTibi/M5nJQfxBGy+Zbny1LdTUIkkj4BBDOML+9MKCRz6f3M
         ClHgov/OIv7++lQkNzpbgFtdSjdp1qDjzdpwQL9o1d5nJG9CIVCclC64/pRm+CK8/hYi
         X7U+qBttfXq27F+yeyp3AYvknjhuXrVqU9gvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701790298; x=1702395098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3+uqWxErhzgehuMAHMjeWDwWx1J6qII9mSEKwAdnl4=;
        b=E/EHn7mGjJ/TezkXmSlnqKh91djSh6Uz9Fo4ZKt2tbKDH/lmOD8Ur6UButJLs1CkEp
         JsKdyASLZgAed3w6eI4GvONxoaTTdI3aCjhxKH4sTued5Hy4Axo2eIJO/8Rzn51obklT
         V6s8diI3wsyggSsvjU0TxAdU/HMy2MIIGL5kUNAOOyOPvOry3S2hMP6cp5f2LAXisMF9
         TlvwUS4KFsSkvhjNU5D/NWiqWEme5Y3nZvBynL2WLF4hXdNamKt5it4E2kB9WeVfQB84
         Ti4SUNAvhECO6iQNTnY7r9g2Gv/oKqCs/21kopBk9G9SdJ8/GyldjJjo0FihkAgQcepK
         aHSQ==
X-Gm-Message-State: AOJu0YzhGQiVDOL8rbfman8AfSm+53ORAit2zNp0sfIJ2NNUAC5hIhpe
	mFjWsAqJxoFfN28jiOGqm+Cotg==
X-Google-Smtp-Source: AGHT+IHDafa2JZglnuq3dYLxRyIyFA6k4CzGSIveC7Sf7z5IXH+7yO9c+12EdDgXzdHELovxxF7z7w==
X-Received: by 2002:a05:600c:a0b:b0:40b:5e4a:2344 with SMTP id z11-20020a05600c0a0b00b0040b5e4a2344mr655663wmp.70.1701790298511;
        Tue, 05 Dec 2023 07:31:38 -0800 (PST)
Date: Tue, 5 Dec 2023 16:31:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/6] x86/iommu: remove regions not to be mapped
Message-ID: <ZW9CWe3p_8BLUXs9@macbook>
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-5-roger.pau@citrix.com>
 <d94a20ea-67fa-4219-9184-3d7dd9bcf646@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d94a20ea-67fa-4219-9184-3d7dd9bcf646@suse.com>

On Tue, Dec 05, 2023 at 04:11:21PM +0100, Jan Beulich wrote:
> On 04.12.2023 10:43, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -2136,6 +2136,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
> >      return 0;
> >  }
> >  
> > +int __hwdom_init remove_xen_ranges(struct rangeset *r)
> > +{
> > +    paddr_t start, end;
> > +    int rc;
> > +
> > +    /* S3 resume code (and other real mode trampoline code) */
> > +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> > +                               PFN_DOWN(bootsym_phys(trampoline_end)));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    /*
> > +     * This needs to remain in sync with the uses of the same symbols in
> > +     * - __start_xen()
> > +     * - is_xen_fixed_mfn()
> > +     * - tboot_shutdown()
> > +     */
> 
> As you're duplicating this comment from xen_in_range(), you want to
> - also mention xen_in_range() here,
> - also update xen_in_range()'s comment,

xen_in_range() is going away in the last patch, hence I did bother tyo
update it.

> - also update the respective comments in __start_xen() that also mention
>   xen_in_range().

That's done in patch 6/6.

> Everything else here looks good to me.

Let me know if doing such changes in a later patch is OK.

Thanks, Roger.

