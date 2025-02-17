Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63A6A380B8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890245.1299248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyiz-0002Sy-Ro; Mon, 17 Feb 2025 10:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890245.1299248; Mon, 17 Feb 2025 10:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyiz-0002Qh-O7; Mon, 17 Feb 2025 10:51:41 +0000
Received: by outflank-mailman (input) for mailman id 890245;
 Mon, 17 Feb 2025 10:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glRE=VI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tjyiy-0001g0-6i
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:51:40 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f208e3-ed1d-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:51:39 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-220dc3831e3so59028195ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:51:39 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242546177sm7804600b3a.5.2025.02.17.02.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:51:37 -0800 (PST)
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
X-Inumbo-ID: 29f208e3-ed1d-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739789498; x=1740394298; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y8dC9p4svHiFijmD8hyBT+hfc7pbkqoi4+ANqjmMaP0=;
        b=lItXLR621pHb6icHTdBpLedqfBAoG0N1SrCNSRg9vesNpLmDBR5kz0EVIesPcqSU5N
         Z8gJ/Iyz4HGeXnxZ49IX6QwScxzFaoycAnLU2Kq2z7HVaFBFfXSLVISI2BcUQl6J4Tz5
         zV83j3+2ZWc2Ym6nR/9QyrbcGUB6ElmiFH17E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789498; x=1740394298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8dC9p4svHiFijmD8hyBT+hfc7pbkqoi4+ANqjmMaP0=;
        b=VLqXrLeERY24cqVHb/Vuu4sf/b/1CIayxcD/4qTwEbShJZCgMQVEPkWLbwMfVN9Mpo
         jJL0gwe8mfaXOeBFqidaXkri6ZrzgK32MnClUoRpiMUUpTMkT2NaX/RTySUvsLJOWYGI
         fboEVvra6ftW6+uFEE5IlbxLIEm+MzazcRNhmxHetnlxKZp3IcgfBaw0IUz4983tVfOK
         wiHt3qvxeDVivIzRl4oXcc/NZyoEhl2WAOBUiUxWLrtQSeu0ydhZfl6kd6GG81Gx6vT6
         DZV4OR7FAB1vjED5rzRbrRUoWstBjCXtei07UYMPOADaTsDRQGwJQzj6GjvySVMV47j5
         2fgg==
X-Forwarded-Encrypted: i=1; AJvYcCVlmh14MQ5DEQltDace9MFaEIAp2XDrnMSZfacQAHK4O4n+LOe4ucROr6kWCL5tE5tKLvi9ZKMmxc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3N8VNI65DI6AmegAZ0m4Mo5OrX9CgR3qjDjhJ19rPKcA7+FP8
	KAlAN18f2XFU7fERX+SubfsXprohrQ1TFXoBHvuRZIoA+83XPfLfA9+DYZNS0yM=
X-Gm-Gg: ASbGncv9XcntUo2o0uLOUl7HezFXawvf2zVqMkAnTvx5veo7HiIwzxZOgmfstBXCVQQ
	1uejy3dP4UuXI/0e0m8YqeOTUYpNhr6rFUMbC3JdRHmjGnQPNJDakM0ZdxvizjMs7f5CwD5rYrw
	bOnpQZ+6WBswB0OYJ4VEk0FUkHPcZgUd0M0hm1JT053Lrid709xBlfQ4SyxZEBaGaFYs2/UsxQM
	/TDGKByxjyG4gPaIFPya4nVC7RZMXVuXNTuhfgzuCQbVuynj+K4ZoUkCC+Gub8EJg5a3Am8LhER
	ZNeJUkgiom0OPt4JqG9r
X-Google-Smtp-Source: AGHT+IFeOrZunyrkHH7q3makjqZy9eGUOuTLF63j/ObPjZ0PicgtRlu/BD30iFrnKhJhDPmYTqstOw==
X-Received: by 2002:a05:6a21:6b04:b0:1e1:a48f:1212 with SMTP id adf61e73a8af0-1ee8d67ee5amr16505977637.4.1739789497858;
        Mon, 17 Feb 2025 02:51:37 -0800 (PST)
Date: Mon, 17 Feb 2025 11:51:32 +0100
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
Message-ID: <Z7MUtN2J6juBSCnZ@macbook.local>
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-3-roger.pau@citrix.com>
 <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>
 <Z685StmNlL2d8iQT@macbook.local>
 <b1e87068-977d-45a6-b61f-e3c40876b947@suse.com>
 <Z7LyXcuTfuQpRPBd@macbook.local>
 <c5135f33-7e60-4195-80ad-cd6bc36b6321@suse.com>
 <Z7MNi7bBdyAdMtQ6@macbook.local>
 <a8816d5e-dea5-4267-a6f4-d4d2aa9daad7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8816d5e-dea5-4267-a6f4-d4d2aa9daad7@suse.com>

On Mon, Feb 17, 2025 at 11:27:52AM +0100, Jan Beulich wrote:
> On 17.02.2025 11:20, Roger Pau Monné wrote:
> > On Mon, Feb 17, 2025 at 09:44:28AM +0100, Jan Beulich wrote:
> >> On 17.02.2025 09:25, Roger Pau Monné wrote:
> >>> On Fri, Feb 14, 2025 at 02:07:05PM +0100, Jan Beulich wrote:
> >>>> On 14.02.2025 13:38, Roger Pau Monné wrote:
> >>>>> On Fri, Feb 14, 2025 at 12:53:01PM +0100, Jan Beulich wrote:
> >>>>>> On 14.02.2025 10:29, Roger Pau Monne wrote:
> >>>>>>> +{
> >>>>>>> +    unsigned long gfn = paddr_to_pfn(addr);
> >>>>>>> +    struct domain *currd = current->domain;
> >>>>>>> +    p2m_type_t type;
> >>>>>>> +    mfn_t mfn;
> >>>>>>> +    int rc;
> >>>>>>> +
> >>>>>>> +    ASSERT(is_hardware_domain(currd));
> >>>>>>> +    ASSERT(!altp2m_active(currd));
> >>>>>>> +
> >>>>>>> +    /*
> >>>>>>> +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
> >>>>>>> +     * having identity mappings for non RAM regions (gfn == mfn).
> >>>>>>> +     */
> >>>>>>> +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
> >>>>>>> +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
> >>>>>>> +        return -EPERM;
> >>>>>>> +
> >>>>>>> +    mfn = get_gfn(currd, gfn, &type);
> >>>>>>> +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
> >>>>>>> +        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;
> >>>>>>
> >>>>>> I understand this is to cover the case where two vCPU-s access the same GFN
> >>>>>> at about the same time. However, the "success" log message at the call site
> >>>>>> being debug-only means we may be silently hiding bugs in release builds, if
> >>>>>> e.g. we get here despite the GFN having had an identity mapping already for
> >>>>>> ages.
> >>>>>
> >>>>> Possibly, but what would be your suggestion to fix this?  I will think
> >>>>> about it, but I can't immediately see a solution that's not simply to
> >>>>> make the message printed by the caller to be gprintk() instead of
> >>>>> gdprintk() so catch such bugs.  Would you agree to that?
> >>>>
> >>>> My thinking was that it might be best to propagate a distinguishable error
> >>>> code (perhaps -EEXIST, with its present use then replaced) out of the function,
> >>>> and make the choice of gprintk() vs gdprintk() depend on that. Accompanied by a
> >>>> comment explaining things a little.
> >>>
> >>> I think it would be easier if I just made those gprintk() instead of
> >>> gdprintk(), all with severity XENLOG_DEBUG except for the one that
> >>> reports the failure of the fixup function that is XENLOG_WARNING.
> >>> Would you be OK with that?
> >>
> >> Hmm. Okay-ish at best. Even if debug+guest-level messages are suppressed by
> >> default, I think it wouldn't be nice if many of them might appear in release
> >> builds with guest_loglevel=all. What I find difficult is to predict how high
> >> the chances are to see any of them (and then possibly multiple times).
> > 
> > I think getting those messages even in non-debug builds might be
> > helpful for debugging purposes.  Sometimes it's difficult for users to
> > switch to a debug build of Xen if not provided by their upstream.
> > 
> > FWIW, on my Intel NUC I see three of those:
> > 
> > (XEN) [    5.418855] arch/x86/hvm/emulate.c:391:d0v0 fixup p2m mapping for page fedc7 added
> > (XEN) [    5.474574] arch/x86/hvm/emulate.c:391:d0v0 fixup p2m mapping for page fd6a0 added
> > (XEN) [    8.712784] arch/x86/hvm/emulate.c:391:d0v2 fixup p2m mapping for page fe410 added
> 
> For my understanding: Did Xen with a PVH Dom0 not work on the NUC before? Or
> else how come it survived without this fixing up of mappings?

I've got no idea what's in those addresses.  It did survive and seems
to work fine without those identity mappings in the p2m.  I assume
that returning ~0 for reads and ignoring writes what good enough.

> 
> > Would you be fine with this approach:
> > 
> > bool __ro_after_init opt_dom0_pf_fixup;
> > static int hwdom_fixup_p2m(paddr_t addr)
> > {
> >     unsigned long gfn = paddr_to_pfn(addr);
> >     struct domain *currd = current->domain;
> >     p2m_type_t type;
> >     mfn_t mfn;
> >     int rc;
> > 
> >     ASSERT(is_hardware_domain(currd));
> >     ASSERT(!altp2m_active(currd));
> > 
> >     /*
> >      * Fixups are only applied for MMIO holes, and rely on the hardware domain
> >      * having identity mappings for non RAM regions (gfn == mfn).
> >      */
> >     if ( !iomem_access_permitted(currd, gfn, gfn) ||
> >          !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
> >         return -EPERM;
> > 
> >     mfn = get_gfn(currd, gfn, &type);
> >     if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
> >         rc = mfn_eq(mfn, _mfn(gfn)) ? -EEXIST : -ENOTEMPTY;
> >     else
> >         rc = set_mmio_p2m_entry(currd, _gfn(gfn), _mfn(gfn), 0);
> >     put_gfn(currd, gfn);
> > 
> >     return rc;
> > }
> > [...]
> >                     int inner_rc = hwdom_fixup_p2m(addr);
> > 
> >                     if ( !inner_rc || inner_rc == -EEXIST )
> >                     {
> >                         gdprintk(XENLOG_DEBUG,
> >                                  "fixup p2m mapping for page %lx %s\n",
> >                                  paddr_to_pfn(addr),
> >                                  !inner_rc ? "added" : "already present");
> 
> As before, I think the "already present" message wants to be present also in
> release build logs. As opposed to the "added" one. Yet at the same time, if
> e.g. you and Andrew agree on the shape above, I won't stand in the way.

I didn't want to add yet another level of indentation, as it then
becomes:

                    int inner_rc = hwdom_fixup_p2m(addr);

                    if ( !inner_rc || inner_rc == -EEXIST )
                    {
                        if ( !inner_rc )
                            gdprintk(XENLOG_DEBUG,
                                     "fixup p2m mapping for page %lx added\n",
                                     paddr_to_pfn(addr));
                        else
                            gprintk(XENLOG_INFO,
                                     "fixup p2m mapping for page %lx already present\n",
                                     paddr_to_pfn(addr));

Would you be OK with the above proposal then?

Thanks, Roger.

