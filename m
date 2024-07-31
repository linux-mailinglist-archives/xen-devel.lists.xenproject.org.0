Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56700942FAA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 15:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768652.1179576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8zl-00070M-Ko; Wed, 31 Jul 2024 13:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768652.1179576; Wed, 31 Jul 2024 13:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8zl-0006yB-He; Wed, 31 Jul 2024 13:03:57 +0000
Received: by outflank-mailman (input) for mailman id 768652;
 Wed, 31 Jul 2024 13:03:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ8zj-0006y1-OX
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 13:03:55 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56e5af3e-4f3d-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 15:03:54 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7a1d024f775so364550485a.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 06:03:54 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1fc0a04a3sm223399185a.18.2024.07.31.06.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 06:03:52 -0700 (PDT)
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
X-Inumbo-ID: 56e5af3e-4f3d-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722431033; x=1723035833; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAVdmlTYZ1Uk4pYSOcVvTJTpIhudSsftIlI6WZ/jnGk=;
        b=FTKCr9BXuXXOSfEk/HgMatcWMfPV/85hqzQDND0MJ3vPZtXPzroImfrABCIuudz1J6
         X0a9r7V4CNGgyAEo8zWISl07ResO+h/YSpsBbxWl3ecZRs82I8YyMRrFsy8z1K5A08F8
         ZAaeOteRBdktYhWyLhpHVHG/zKmyt9mw+58Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431033; x=1723035833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAVdmlTYZ1Uk4pYSOcVvTJTpIhudSsftIlI6WZ/jnGk=;
        b=VihiOerC3IkzCoORLLgr+6CFThMdqUNcISCRZ+Ldtx5Vjt/oxhsl3848rtnorgcp1v
         7jBrK6smxfQgtzUfN6jnbzv2G2/zaj6Ph+uXM5nSGDzvabDNW0lIjLf28BvrbFU0GPld
         doxZMnvyaF32aeBeLLQZ4qPfBQ4R5Qzy2s61w5MQJH+tQVyR2DFQYyW3iBdeo/u+DD9y
         lU5xkpeaNdkc+6I+dbaprh9tY2C35X6MN15nAxPf4J8CTIJqwgPrV594DLpd4tSpLNe6
         w9L3gmssJfNpfLjBpMFeqT14PMti/HZFfVSIri08cWDjaK9eBwHqqSwQCK4StB4ZId/M
         WhTQ==
X-Gm-Message-State: AOJu0Yw9yQrA3hewsmJ35RNH5DsaYBuENUK99fs9uOuJfMnSesXiv7fO
	yFIvU+EMmfLSaJsy8RPCuXx7Fjcu/L4+NXNdcj2kDZSYakWe1OX1gfnZUV37b8A=
X-Google-Smtp-Source: AGHT+IE7Key7ukTATcE5lzwiGcjjRzus4ikYMQXkQoAaDZLf1wNhNWgEJTJIYgQxBemmqc4F4hKcug==
X-Received: by 2002:a05:620a:4310:b0:79f:12e9:1e6e with SMTP id af79cd13be357-7a1e522a534mr1543690785a.12.1722431033387;
        Wed, 31 Jul 2024 06:03:53 -0700 (PDT)
Date: Wed, 31 Jul 2024 15:03:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Message-ID: <Zqo2N7CDshL7ZoMK@macbook>
References: <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com>
 <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com>
 <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com>
 <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com>
 <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com>

On Wed, Jul 31, 2024 at 01:39:40PM +0200, Jan Beulich wrote:
> On 31.07.2024 13:29, Roger Pau Monné wrote:
> > On Wed, Jul 31, 2024 at 11:55:35AM +0200, Jan Beulich wrote:
> >> On 31.07.2024 11:37, Roger Pau Monné wrote:
> >>> On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
> >>>> On 31.07.2024 10:51, Roger Pau Monné wrote:
> >>>>> I agree with (a), but I don't think enabling PVH dom0 usage of the
> >>>>> hypercalls should be gated on this.  As said a PV dom0 is already
> >>>>> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
> >>>>> domU.
> >>>>
> >>>> Okay, I can accept that as an intermediate position. We ought to deny
> >>>> such requests at some point though for PVH domains, the latest in the
> >>>> course of making vPCI work there.
> >>>
> >>> Hm, once physdev_map_pirq() works as intended against PVH domains, I
> >>> don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
> >>> against such domains.
> >>
> >> Well. If it can be made work as intended, then I certainly agree. However,
> >> without even the concept of pIRQ in PVH I'm having a hard time seeing how
> >> it can be made work. Iirc you were advocating for us to not introduce pIRQ
> >> into PVH.
> > 
> > From what I'm seeing here the intention is to expose
> > PHYSDEVOP_{,un}map_pirq to PVH dom0, so there must be some notion of
> > pIRQs or akin in a PVH dom0?  Even if only for passthrough needs.
> 
> Only in so far as it is an abstract, handle-like value pertaining solely
> to the target domain.
> 
> >> Maybe you're thinking of re-using the sub-ops, requiring PVH domains to
> >> pass in GSIs?
> > 
> > I think that was one my proposals, to either introduce a new
> > hypercall that takes a GSI, or to modify the PHYSDEVOP_{,un}map_pirq
> > in an ABI compatible way so that semantically the field could be a GSI
> > rather than a pIRQ.  We however would also need a way to reference an
> > MSI entry.
> 
> Of course.
> 
> > My main concern is not with pIRQs by itself, pIRQs are just an
> > abstract way to reference interrupts, my concern and what I wanted to
> > avoid on PVH is being able to route pIRQs over event channels.  IOW:
> > have interrupts from physical devices delivered over event channels.
> 
> Oh, I might have slightly misunderstood your intentions then.

My intention would be to not even use pIRQs at all, in order to avoid
the temptation of the guest itself managing interrupts using
hypercalls, hence I would have preferred that abstract interface to be
something else.

Maybe we could even expose the Xen IRQ space directly, and just use
that as interrupt handles, but since I'm not the one doing the work
I'm not sure it's fair to ask for something that would require more
changes internally to Xen.

> >> I think I suggested something along these lines also to
> >> Jiqian, yet with the now intended exposure to !has_pirq() domains I'm
> >> not sure this could be made work reliably.
> > 
> > I'm afraid I've been lacking behind on reviewing those series.
> > 
> >> Which reminds me of another question I had: What meaning does the pirq
> >> field have right now, if Dom0 would issue the request against a PVH DomU?
> >> What meaning will it have for a !has_pirq() HVM domain?
> > 
> > The pirq field could be a way to reference an interrupt.  It doesn't
> > need to be exposed to the PVH domU at all, but it's a way for the
> > device model to identify which interrupt should be mapped to which
> > domain.
> 
> Since pIRQ-s are per-domain, _that_ kind of association won't be
> helped. But yes, as per above it could serve as an abstract handle-
> like value.

I would be fine with doing the interrupt bindings based on IRQs
instead of pIRQs, but I'm afraid that would require more changes to
hypercalls and Xen internals.

At some point I need to work on a new interface to do passthrough, so
that we can remove the usage of domctls from QEMU.  That might be a
good opportunity to switch from using pIRQs.

Thanks, Roger.

