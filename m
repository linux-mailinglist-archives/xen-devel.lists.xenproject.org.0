Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B47942D44
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 13:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768483.1179310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7Wf-0000ec-0a; Wed, 31 Jul 2024 11:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768483.1179310; Wed, 31 Jul 2024 11:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7We-0000bP-UB; Wed, 31 Jul 2024 11:29:48 +0000
Received: by outflank-mailman (input) for mailman id 768483;
 Wed, 31 Jul 2024 11:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ7Wd-0000bJ-QZ
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 11:29:47 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd83a6f-4f30-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 13:29:40 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-44fedc06c03so28684611cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 04:29:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3faedcbasm72667786d6.124.2024.07.31.04.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 04:29:43 -0700 (PDT)
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
X-Inumbo-ID: 2cd83a6f-4f30-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722425384; x=1723030184; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mfjVkKzoK5YbrZBfFB9sf+nRfQTAY5ljtT5uPPCyv8=;
        b=WYEfRiYo0zEu0AIa2M4i56mbGwgm5PyZF6grLGc7zMnUZVyWXY2Jq0fKwGn1YAXOxJ
         JEy9OlKateM6r1uhnOwFrQ/Y/MfS234z6s0H/Yv2bdi1l4ecHc0fvVylZLDojxzcbDMe
         JLsq9N9kQkJMU6SWBb9J2XmrJTnMbVm3hQI28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722425384; x=1723030184;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mfjVkKzoK5YbrZBfFB9sf+nRfQTAY5ljtT5uPPCyv8=;
        b=C5cGbd7cBWGIXzWty4sD1Td0rgjZvM8JQ+qPE5S/fVNjU++8uRwE8BVxC1n2Gawzh4
         L3tla66a8SfHUWB42OCWQ2bfuFHjYgO4Wu2nYNm5/b4eN4IeGJxnhxUfVHePKQeTotJT
         O8UOZMtH6WKWSrHAhIZMBE5nKnSpDAXMtcktdiKARDr6//oXV3KAlYXHzu0LaWzwrejL
         tAbsQbkboIF2yeCeNA+1kVaDPClx4JQYgxYov/tcp1do1L1FuRTtInhicDWQKgBjSKHj
         xlLqC0XtAgLXr0g3m0NVPXW9/XeHymVzoUgMW+9a3MlKuh+iMi1+3FD5MHNtR7RkXh/Z
         +zpQ==
X-Gm-Message-State: AOJu0YySp/hROtIxD+XSDPeYD3U/jJPueBsBfWq48QIr065rjIvC/imP
	JJfCVUmJieIEKd+hkmleRpLyaavplmIiYGsdI1Ca1LapfHxXzdr+ZFOuiB6Vr+g=
X-Google-Smtp-Source: AGHT+IFNHtCILnmRagpKPlogs0xGFLDHP9CwWo6gzywias2XBguZKk2qhHIvPOB69mPjWKHm31dslg==
X-Received: by 2002:a05:6214:5014:b0:6b7:99f6:98b0 with SMTP id 6a1803df08f44-6bb559d535dmr157429376d6.17.1722425383699;
        Wed, 31 Jul 2024 04:29:43 -0700 (PDT)
Date: Wed, 31 Jul 2024 13:29:41 +0200
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
Message-ID: <ZqogJVHV36ytYVP1@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
 <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com>
 <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com>
 <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com>
 <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com>

On Wed, Jul 31, 2024 at 11:55:35AM +0200, Jan Beulich wrote:
> On 31.07.2024 11:37, Roger Pau Monné wrote:
> > On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
> >> On 31.07.2024 10:51, Roger Pau Monné wrote:
> >>> I agree with (a), but I don't think enabling PVH dom0 usage of the
> >>> hypercalls should be gated on this.  As said a PV dom0 is already
> >>> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
> >>> domU.
> >>
> >> Okay, I can accept that as an intermediate position. We ought to deny
> >> such requests at some point though for PVH domains, the latest in the
> >> course of making vPCI work there.
> > 
> > Hm, once physdev_map_pirq() works as intended against PVH domains, I
> > don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
> > against such domains.
> 
> Well. If it can be made work as intended, then I certainly agree. However,
> without even the concept of pIRQ in PVH I'm having a hard time seeing how
> it can be made work. Iirc you were advocating for us to not introduce pIRQ
> into PVH.

From what I'm seeing here the intention is to expose
PHYSDEVOP_{,un}map_pirq to PVH dom0, so there must be some notion of
pIRQs or akin in a PVH dom0?  Even if only for passthrough needs.

> Maybe you're thinking of re-using the sub-ops, requiring PVH domains to
> pass in GSIs?

I think that was one my proposals, to either introduce a new
hypercall that takes a GSI, or to modify the PHYSDEVOP_{,un}map_pirq
in an ABI compatible way so that semantically the field could be a GSI
rather than a pIRQ.  We however would also need a way to reference an
MSI entry.

My main concern is not with pIRQs by itself, pIRQs are just an
abstract way to reference interrupts, my concern and what I wanted to
avoid on PVH is being able to route pIRQs over event channels.  IOW:
have interrupts from physical devices delivered over event channels.

> I think I suggested something along these lines also to
> Jiqian, yet with the now intended exposure to !has_pirq() domains I'm
> not sure this could be made work reliably.

I'm afraid I've been lacking behind on reviewing those series.

> Which reminds me of another question I had: What meaning does the pirq
> field have right now, if Dom0 would issue the request against a PVH DomU?
> What meaning will it have for a !has_pirq() HVM domain?

The pirq field could be a way to reference an interrupt.  It doesn't
need to be exposed to the PVH domU at all, but it's a way for the
device model to identify which interrupt should be mapped to which
domain.

Thanks, Roger.

