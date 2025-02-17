Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71FA37FDD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890100.1299157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyFR-00088W-Ha; Mon, 17 Feb 2025 10:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890100.1299157; Mon, 17 Feb 2025 10:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyFR-00086q-EZ; Mon, 17 Feb 2025 10:21:09 +0000
Received: by outflank-mailman (input) for mailman id 890100;
 Mon, 17 Feb 2025 10:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glRE=VI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tjyFQ-00085X-Kv
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:21:08 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e548b78e-ed18-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:21:06 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-220c665ef4cso61459745ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:21:06 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d53491c9sm67925855ad.15.2025.02.17.02.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:21:04 -0800 (PST)
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
X-Inumbo-ID: e548b78e-ed18-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739787665; x=1740392465; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DAXc28dTbbHT9qBq43rBMBAHQ0Rj1YpxB6dQoNSc+Bc=;
        b=eCa9FCvhJ0FbV336e3qlZdY0GVLVqLGQ1ATKCvu1lzibUHVOdYJn7y7EFBVOsy4WGC
         6Y77CmE9P+ceVrBY4Z03ZnWFxPJiaNkZpeQU2bdA68fd6ebZniLRpw+fLbdxIplEtnlK
         wS29UorN38FBCH9dJst6onnqsziafuYMBcwAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787665; x=1740392465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAXc28dTbbHT9qBq43rBMBAHQ0Rj1YpxB6dQoNSc+Bc=;
        b=Gs63jrknV5qlR8IXn1PoQjczBHMI93EZPcuaNrCnnce43p9cwYz+QY13cWVP1uT317
         oM4NaKzmQwtl+caMZrPlE4xqyOpULLzEWcTXzqQD5k7ofiKzqRDiSXLEDYZ4BDdukQ5e
         v3SZjrUqsDsQYfwwu+XPwiCa5ywRQv6Z49XRVvy8icHpiWlIFV+On7kaFuWYXA0Dt8iG
         uCcBGE/Pt6woFgYDOWSmV3CFZwAsVhgzUMEYH+gUpsiHlvTisjQ4H/93kBolGP0gmElA
         M4ZEvG8i8FPpgXTBm8D+C0/0/t0ceMPOsGmlQtf38XTgpqVNm9ql6Xknp+gNxe/KxgXq
         R4cg==
X-Forwarded-Encrypted: i=1; AJvYcCXBjRqJ4DybYFQHoRdfkNyujAnoh6ol81bnWlGZkrbDL7+ByeGzw6cYwf76fDEWoQBIRuftPVe75W0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+J9QCrpDMwC9g1iQU3yOQ1rmm8E+VBAeSAUJ7VrCH9A/c1bi1
	qnd12wZySSJLsik3BZ71mlJgggL/+a2oi8hlyICxtwctli8A1DEbI599kIPFrOQ=
X-Gm-Gg: ASbGnctFWqKVTBUO+3UPjTqnQP1LNP4pgXUv3mGLu1QCwH4MKiOGJQiEBl1bXc9CCqf
	/YauuHBVKbpRk+ullgU2b78VIKZOLpoq3EzsxbCbLpEC5cjm+tNmUBjQiULPMunrniDiSdbKVE+
	SAvt9rxE1K6kwMD/OFawHm48gRjbOCggEMntC7Fe9a5wL1K9ccRThEzJ9AYp7MBxeGzVL8gWUuW
	Ie+kTHfJGgqf6V772Ulowzjjc/RBSH8ljFZreBU04ndgzNUurc/pxDK8b8HpqHqYcJLLAEn0los
	O+tjKReD5SdO00/pkXZ0
X-Google-Smtp-Source: AGHT+IH/eJ/6o0CRD6yeFPFnmz60SaHf87Ni2o2CCiXjYd14FDuR6uzm7kAsbHWeP9dJDaxsnT9jHA==
X-Received: by 2002:a17:902:d502:b0:215:9ea1:e95e with SMTP id d9443c01a7336-22103f14b71mr141235585ad.13.1739787665167;
        Mon, 17 Feb 2025 02:21:05 -0800 (PST)
Date: Mon, 17 Feb 2025 11:20:59 +0100
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
Message-ID: <Z7MNi7bBdyAdMtQ6@macbook.local>
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-3-roger.pau@citrix.com>
 <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>
 <Z685StmNlL2d8iQT@macbook.local>
 <b1e87068-977d-45a6-b61f-e3c40876b947@suse.com>
 <Z7LyXcuTfuQpRPBd@macbook.local>
 <c5135f33-7e60-4195-80ad-cd6bc36b6321@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5135f33-7e60-4195-80ad-cd6bc36b6321@suse.com>

On Mon, Feb 17, 2025 at 09:44:28AM +0100, Jan Beulich wrote:
> On 17.02.2025 09:25, Roger Pau Monné wrote:
> > On Fri, Feb 14, 2025 at 02:07:05PM +0100, Jan Beulich wrote:
> >> On 14.02.2025 13:38, Roger Pau Monné wrote:
> >>> On Fri, Feb 14, 2025 at 12:53:01PM +0100, Jan Beulich wrote:
> >>>> On 14.02.2025 10:29, Roger Pau Monne wrote:
> >>>>> +{
> >>>>> +    unsigned long gfn = paddr_to_pfn(addr);
> >>>>> +    struct domain *currd = current->domain;
> >>>>> +    p2m_type_t type;
> >>>>> +    mfn_t mfn;
> >>>>> +    int rc;
> >>>>> +
> >>>>> +    ASSERT(is_hardware_domain(currd));
> >>>>> +    ASSERT(!altp2m_active(currd));
> >>>>> +
> >>>>> +    /*
> >>>>> +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
> >>>>> +     * having identity mappings for non RAM regions (gfn == mfn).
> >>>>> +     */
> >>>>> +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
> >>>>> +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
> >>>>> +        return -EPERM;
> >>>>> +
> >>>>> +    mfn = get_gfn(currd, gfn, &type);
> >>>>> +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
> >>>>> +        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;
> >>>>
> >>>> I understand this is to cover the case where two vCPU-s access the same GFN
> >>>> at about the same time. However, the "success" log message at the call site
> >>>> being debug-only means we may be silently hiding bugs in release builds, if
> >>>> e.g. we get here despite the GFN having had an identity mapping already for
> >>>> ages.
> >>>
> >>> Possibly, but what would be your suggestion to fix this?  I will think
> >>> about it, but I can't immediately see a solution that's not simply to
> >>> make the message printed by the caller to be gprintk() instead of
> >>> gdprintk() so catch such bugs.  Would you agree to that?
> >>
> >> My thinking was that it might be best to propagate a distinguishable error
> >> code (perhaps -EEXIST, with its present use then replaced) out of the function,
> >> and make the choice of gprintk() vs gdprintk() depend on that. Accompanied by a
> >> comment explaining things a little.
> > 
> > I think it would be easier if I just made those gprintk() instead of
> > gdprintk(), all with severity XENLOG_DEBUG except for the one that
> > reports the failure of the fixup function that is XENLOG_WARNING.
> > Would you be OK with that?
> 
> Hmm. Okay-ish at best. Even if debug+guest-level messages are suppressed by
> default, I think it wouldn't be nice if many of them might appear in release
> builds with guest_loglevel=all. What I find difficult is to predict how high
> the chances are to see any of them (and then possibly multiple times).

I think getting those messages even in non-debug builds might be
helpful for debugging purposes.  Sometimes it's difficult for users to
switch to a debug build of Xen if not provided by their upstream.

FWIW, on my Intel NUC I see three of those:

(XEN) [    5.418855] arch/x86/hvm/emulate.c:391:d0v0 fixup p2m mapping for page fedc7 added
(XEN) [    5.474574] arch/x86/hvm/emulate.c:391:d0v0 fixup p2m mapping for page fd6a0 added
(XEN) [    8.712784] arch/x86/hvm/emulate.c:391:d0v2 fixup p2m mapping for page fe410 added

Would you be fine with this approach:

bool __ro_after_init opt_dom0_pf_fixup;
static int hwdom_fixup_p2m(paddr_t addr)
{
    unsigned long gfn = paddr_to_pfn(addr);
    struct domain *currd = current->domain;
    p2m_type_t type;
    mfn_t mfn;
    int rc;

    ASSERT(is_hardware_domain(currd));
    ASSERT(!altp2m_active(currd));

    /*
     * Fixups are only applied for MMIO holes, and rely on the hardware domain
     * having identity mappings for non RAM regions (gfn == mfn).
     */
    if ( !iomem_access_permitted(currd, gfn, gfn) ||
         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
        return -EPERM;

    mfn = get_gfn(currd, gfn, &type);
    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
        rc = mfn_eq(mfn, _mfn(gfn)) ? -EEXIST : -ENOTEMPTY;
    else
        rc = set_mmio_p2m_entry(currd, _gfn(gfn), _mfn(gfn), 0);
    put_gfn(currd, gfn);

    return rc;
}
[...]
                    int inner_rc = hwdom_fixup_p2m(addr);

                    if ( !inner_rc || inner_rc == -EEXIST )
                    {
                        gdprintk(XENLOG_DEBUG,
                                 "fixup p2m mapping for page %lx %s\n",
                                 paddr_to_pfn(addr),
                                 !inner_rc ? "added" : "already present");
                        rc = X86EMUL_RETRY;
                        vio->req.state = STATE_IOREQ_NONE;
                        break;
                    }

                    gprintk(XENLOG_WARNING,
                            "unable to fixup memory %s to %#lx size %u: %d\n",
                            dir ? "read" : "write", addr, size, inner_rc);

Thanks, Roger.

