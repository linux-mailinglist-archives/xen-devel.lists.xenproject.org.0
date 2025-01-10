Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7894A09329
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869693.1281146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFnI-0005Pv-36; Fri, 10 Jan 2025 14:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869693.1281146; Fri, 10 Jan 2025 14:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFnI-0005Nt-0D; Fri, 10 Jan 2025 14:15:24 +0000
Received: by outflank-mailman (input) for mailman id 869693;
 Fri, 10 Jan 2025 14:15:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWFnG-0005Nn-K2
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:15:22 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 532d303b-cf5d-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 15:15:20 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so340461866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:15:20 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90e3f54sm169885766b.81.2025.01.10.06.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:15:19 -0800 (PST)
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
X-Inumbo-ID: 532d303b-cf5d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736518520; x=1737123320; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fC5Oc6Gac22Agkm0SWitel5gVMu0x+T+FUciEGk4Umo=;
        b=uPHcmo0hcLiGMqxwGou41nkj6+IHddTy1ABwbgnt8UmaqVNJTaXW4DoAwbNa2C33Uu
         Jdm1hltkz5YgE83OuJ2LNpyhKXGQqe+FO+tJiNkzGQjsAH61SSfO3gs+ETSUNi094TAn
         YSGQtbN4WZvUiGyXF9uB8Bb2dKH1yolJ8/4xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518520; x=1737123320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC5Oc6Gac22Agkm0SWitel5gVMu0x+T+FUciEGk4Umo=;
        b=GAPAtpX812Q8WE5taOzMrCPd9mwdKj2wdBco4bWM90BjD12NPghpJrkw9sbk7RPaXs
         IjGeecckMTJV5tCx0Lc3cbtfek+Qem7AJoeEi8Hv96i9WhXxr3jlOoGKI3eusLQkN6eG
         9+usvCA7LHUTsSyYBl9CEvOvjlfynoONk+TNuyfQYHM+IEiLkFk/qJ/RkzoHhANcnfj0
         WZWvZUfUEyfUeX/VXNjZ2D18CJyOjDqVITaanft955LzIK8U3Bn56yLYYHnXbScruYfv
         mmXahC8urj1BaTnGatQCPTsEc2dcO23AvFO7zqv3rHatxK4MAX+ZfdzJW7LEdA/sZB/p
         35mg==
X-Forwarded-Encrypted: i=1; AJvYcCUxga2le4JjMGRZqekBXJp4uKj+wz5EORpskltmZfB2f6mOBgfVLs/6XloTIJizy9Lk2hKrcqfUEu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxasU/NVy+5b00F/5d83odKPG/at+qoLu7TX/5b/Z3NDCfdA0kz
	x3GUQULeZPIaOw4I9sFIeNM2nE6SQYrqF5cIiDhtAgtSuJH61vmAJpdi5LGvj6EqZldfM1Erm9Z
	H
X-Gm-Gg: ASbGncsAyFiSWOsfnW9/cBLfn19wpyYzjXK2aw3YYXKKGoHf+pf4eEv9B5V6vXHdBxv
	9EUnZjmaGOPgd2BCVwrNrLzyx/eBf2pLQ+DtJmvqrqksvWDZ3qP6y/tJyZFkRfOw2Zhq/gWhp2f
	3h9R4HrgkWEatYglRWmDU7C9EXsj61/3fwnqep1OL+g2k+OOvDksjJ0yJ+PdLbVwqyJWILOIOLl
	mQmYE5zT7TogK+tqbN9CpJsDCEoqJTBEWyKT4ciqYUtc+ARKnqAEPZJbbITXV/wCic=
X-Google-Smtp-Source: AGHT+IFuf+JCFti89VlW1nKFznhG3hsua6f/izKUid67fvzcXflAECfSIqn8EdL3NDABpTJvdQAjjQ==
X-Received: by 2002:a17:907:d87:b0:aa6:7ec4:8bac with SMTP id a640c23a62f3a-ab2ab709c68mr1118536466b.17.1736518520009;
        Fri, 10 Jan 2025 06:15:20 -0800 (PST)
Date: Fri, 10 Jan 2025 15:15:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 04/18] x86/pv: introduce function to populate
 perdomain area and use it to map Xen GDT
Message-ID: <Z4ErduC-Nmzttbkf@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-5-roger.pau@citrix.com>
 <031ce31b-0ab5-4964-96eb-642fbea67bfb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <031ce31b-0ab5-4964-96eb-642fbea67bfb@suse.com>

On Thu, Jan 09, 2025 at 10:10:20AM +0100, Jan Beulich wrote:
> On 08.01.2025 15:26, Roger Pau Monne wrote:
> > The current code to update the Xen part of the GDT when running a PV guest
> > relies on caching the direct map address of all the L1 tables used to map the
> > GDT and LDT, so that entries can be modified.
> > 
> > Introduce a new function that populates the per-domain region, either using the
> > recursive linear mappings when the target vCPU is the current one, or by
> > directly modifying the L1 table of the per-domain region.
> > 
> > Using such function to populate per-domain addresses drops the need to keep a
> > reference to per-domain L1 tables previously used to change the per-domain
> > mappings.
> 
> Well, yes. You now record MFNs instead. And you do so at the expense of about
> 100 lines of new code. I'm afraid I'm lacking justification for this price to
> be paid.

Oh, I should have been more explicit on the commit message probably.
The cover letter kind of covers this, the objective is to remove the
stashing of L1 page-table references in the domain struct.  Currently
the per-vCPU GDT L1 are stored in the domain struct, so PTEs can be
easily manipulated.

When moving the per-domain slot to being per-vCPU this stashing of the
L1 tables will become much more complex, and hence I wanted to get rid
of it.

With the introduction of populate_perdomain_mapping() I'm attempting
to get rid of all those L1 references in the domain struct, by having
a generic function that allows modifying the linea address range that
belongs to the per-domain slot.

See for example how patch 8 gets rid of all the l1_pgentry_t GDT/LDT
references in the domain struct.  And how patch 9 simplifies the
create_perdomain_mapping() interface to be much simpler.  All this is
built upon the addition of the populate_perdomain_mapping() helper and
the dropping of the l1_pgentry_t references in the domain struct.

Hope this helps clarify the intent of the change here.

> > @@ -2219,11 +2219,9 @@ void __init trap_init(void)
> >      init_ler();
> >  
> >      /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
> > -    this_cpu(gdt_l1e) =
> > -        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
> > +    this_cpu(gdt_mfn) = _mfn(virt_to_mfn(boot_gdt));
> >      if ( IS_ENABLED(CONFIG_PV32) )
> > -        this_cpu(compat_gdt_l1e) =
> > -            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
> > +        this_cpu(compat_gdt_mfn) = _mfn(virt_to_mfn(boot_compat_gdt));
> 
> The comment's going stale this way.

Right, the cache is still there but using a different field name.  I
can adjust to:

/* Cache {,compat_}gdt_mfn now that physically relocation is done. */

Thanks, Roger.

