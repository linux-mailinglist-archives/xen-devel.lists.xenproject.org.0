Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F556A2AF30
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 18:43:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883075.1293161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg5uS-0007cI-Ms; Thu, 06 Feb 2025 17:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883075.1293161; Thu, 06 Feb 2025 17:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg5uS-0007aZ-K6; Thu, 06 Feb 2025 17:43:28 +0000
Received: by outflank-mailman (input) for mailman id 883075;
 Thu, 06 Feb 2025 17:43:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg5uR-0007aT-Da
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 17:43:27 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dddddfb0-e4b1-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 18:43:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso12199725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 09:43:25 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd7f039sm2321610f8f.59.2025.02.06.09.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 09:43:20 -0800 (PST)
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
X-Inumbo-ID: dddddfb0-e4b1-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738863805; x=1739468605; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPOsA0SVCb2OgoBNEM8yQP2F+WVhHEBlKzlr8d60SSw=;
        b=TiyZKX+/eO0fD0OkyCcdXwuxEq7E728Tp+vFaRsHhC1FaxPT2iyfaq0S6ES4iKQXeI
         ea3FH0V2mUXq68h/tMo2p4p4ZdQkk1S35zVEHhveLdxpEDa3uUe//PnX8xmPUfaVoBP7
         3t9yeJauqIuG7f1iSFo/j/Z0qbFamimJCElB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863805; x=1739468605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPOsA0SVCb2OgoBNEM8yQP2F+WVhHEBlKzlr8d60SSw=;
        b=lYGaf089055OFBE3j9sCZ5wuDzLOyed/jlIce9awDfaVNYpXGKLucZM52z0js+TsVP
         42dDKvk1vKlF8O/tydhJZnXGW4wjpvfcTZmXxwSUXUOWg6YZdCxVLdrVQuipZVTI5wjj
         Q9cwYZTmnaJbs3ykHB5rC/awOnOlZGU4VoNl4U8B/DsVb5LjQts7Qu2bMsfphaP3554S
         Ga9sTZnA+mSsblNeMQXoS7V3AQAuVAbLCONhknkL6eFSyqBuF4MNRwELrGRC2pmhEjYM
         h0M6MVKN8SWV5VqpAbJR2MQfmOuSdt1vaNj1r+mmGDZJFHYwc6M6Gjx1hHyefZ+Cv6uI
         8Vzw==
X-Forwarded-Encrypted: i=1; AJvYcCUjHk9B6tzIMGV+0/GSRcxG+lHSUdm1Flw4D0+OjYe4ivaBz+tn76/ZywI9AvUBkOZpiTF1W/sYyd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyILLko1VhGWjio5C+E1AFGZLWC1tmERsrkwXq+pJHlhsM5ctpx
	xGW90Hg3a6M69O77DMFUor9KxtXO5sMoP+XhCGGkZZK9PEspna6lRKws/ThXd14=
X-Gm-Gg: ASbGncs106XyHRT+bRHpzRNmSf2efqZxq8/cLBWYmIp6q4m0nKTP19URnKJpMK0HqyB
	b19iZQp6BaAfry67GBjpdv3/dUNuf2B79pOwFbKFJsNCKGn0Rcq7sNGOmOu5689m6mz7FHfNN8k
	geB0fOEtfAm/mPQlp7SR32Ge876ZfYmfP3n3HYCM9E81tpU2pRNSvlJpZtjgOrGYX3vHXgDPXtk
	b/cjNlMXQkTQ1oLsERi9uumfsJEyfieogzzigmjDIQV/zrf77LJ9Sqh6VhxharVPUeZhgFrjUtG
	wsvXF4bDbqUFsGLVQ7Et
X-Google-Smtp-Source: AGHT+IFU4jwEb/bO/ShJPxLWINJiEecNyq6hYAc5n2NXQsIEvGTG67KFeNF1dtHNcxIthVTMwoiEdg==
X-Received: by 2002:a7b:cb88:0:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-43924a27b05mr2555695e9.31.1738863800775;
        Thu, 06 Feb 2025 09:43:20 -0800 (PST)
Date: Thu, 6 Feb 2025 18:43:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Lingshan Zhu <Lingshan.Zhu@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen memory management primitives for GPU virtualization
Message-ID: <Z6T0t4DMJeY6K18w@macbook.local>
References: <Z5794ysNE4KDkFuT@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z5794ysNE4KDkFuT@itl-email>

On Sun, Feb 02, 2025 at 12:08:46AM -0500, Demi Marie Obenour wrote:
> Cc: 
> Bcc: 
> Subject: Xen requirements for GPU virtualization via virtio-GPU
> Reply-To: 
> X-Mutt-Fcc: =INBOX,=xen-devel,=Sent
> X-Mutt-PGP: S
> 
> Recently, AMD submitted patches to the dri-devel mailing list to support
> using application-provided buffers in virtio-GPU.  This feature is
> called Shared Virtual Memory (SVM) and it is implemented via an API
> called User Pointer (userptr).  This lead to some discussion on
> dri-devel@lists.freedesktop.org and dri-devel IRC, from which I
> concluded that Xen is missing critical primitives for GPU-accelerated
> graphics and compute.  The missing primitives for graphics are the ones
> discussed at Xen Project Summit 2024, but it turns out that additional
> primitives are needed for compute workloads.
> 
> As discussed at Xen Project Summit 2024, GPU acceleration via virtio-GPU
> requires that an IOREQ server have access to the following primitives:
> 
> 1. Map: Map a backend-provided buffer into the frontend.  The buffer
>    might point to system memory or to a PCIe BAR.  The frontend is _not_
>    allowed to use these buffers in hypercalls or grant them to other
>    domains.  Accessing the pages using hypercalls directed at the
>    frontend fails as if the frontend did not have the pages.

Do you really need to strictly enforce failure of access when used as
hypercall buffers?

Would it be fine to just get failures when the p2m entries are not
populated?  I assume the point is that accesses to those guest pages
from Xen should never go into the IOREQ?

>    The only
>    exception is that the frontend _may_ be allowed to use the buffer in
>    a Map operation, provided that Revoke (below) is transitive.

The fact that the mapped memory can either be RAM or MMIO makes it a
bit harder to handle any possible reference counting, as MMIO regions
don't have backing page_info structs, and hence no reference counting.
I think that might be hidden by the p2m handling, but needs to be
checked to be correct.

Also when mapping MMIO pages, will those maps respect the domain
d->iomem_caps permission ranges, and then require modifications for
the mappings to succeed, or just ignore d->iomem_caps?

> 
> 2. Revoke: Revoke access to a buffer provided by the backend.  Once
>    access is revoked, no operation on or in the frontend domain can
>    access or modify the pages, and the backend can safely reuse the
>    backing memory for other purposes.

It looks to me that revocation means removing the page from the p2m?

(and additionally adjusting d->iomem_caps if required to revoke domain
permission to map the page)

>    Furthermore, revocation is not
>    allowed to fail unless the backend or hypervisor is buggy, and if it
>    does fail for any reason, the backend will panic.  Once access is
>    revoked, further accesses by the frontend will cause a fault that the
>    backend can intercept.

Such faults would translate into a new IOREQ type, maybe IOREQ_TYPE_FAULT.

I think that just having a rangeset on the ioreq to signal the
accesses that should trigger a IOREQ_TYPE_FAULT instead of an
IOREQ_TYPE_COPY should be enough?

The p2m type could be set as p2m_mmio_dm for those ranges.

> 
> Map can be handled by userspace, but Revoke must be handled entirely
> in-kernel.  This is because Revoke happens from a Linux MMU notifier
> callback, and those are not allowed to block, fail, or involve userspace
> in any way.  Since MMU notifier callbacks are called before freeing
> memory, failure means that some other part of the system still has
> access to freed memory that might be reused for other purposes, which
> is a security vulnerability.

This "revoke" action would just be an hypercall, I think that would
satisfy your requirements?

> 
> It turns out that compute has additional requirements.  Graphics APIs
> use DMA buffers (dmabufs), which only support a subset of operations.
> In particular, direct I/O doesn't work.  Compute APIs allow users to
> make malloc'd memory accessible to the GPU.  This memory can be used
> in Linux kernel direct I/O and in other operations that do not work
> with dmabufs.  However, such memory starts out as frontend-owned pages,
> so it must be converted to backend pages before it can be used by the
> GPU.  Linux supports migration of userspace pages, but this is too
> unreliable to be used for this purpose.  Instead, it will need to be
> done by Xen and the backend.
> 
> This requires two additional primitives:
> 
> 3. Steal: Convert frontend-owned pages to backend-owned pages and
>    provide the backend with a mapping of the page.

What does "owned" exactly mean in this context?

What you describe above sound very much like a foreign map, but I'm
not sure I fully understand the constrains below.

Does this "steal" operation make the pages inaccessible by the domain
running the frontend (so the orignal owner of the memory).

>    After a successful
>    Steal operation, the pages are in the same state as if they had been
>    provided via Map.  Steal fails if the pages are currently being used
>    in a hypercall, are MMIO (as opposed to system memory), were provided
>    by another domain via Map or grant tables, are currently foreign
>    mapped, are currently granted to another domain, or more generally
>    are accessible to any domain other than the target domain.

I think the above means that "stealed" pages must have the
"p2m_ram_rw" type in the frontend domain p2m.   IOW: must be strictly
RAM and owned by the domain running the frontend.

>    The
>    frontend's quota is decreased by the number of pages stolen, and the
>    backend's quota is increased by the same amount.  A successful Steal
>    operation means that Revoke and Map can be used to operate on the
>    pages.

Hm, why do you need this quota adjustment?  Aren't the "stolen" pages
still owned by the domain running the frontend (have
page_info->v.inuse._domain == frontend domain)?

> 
> 4. Return: Convert a backend-owned page to a frontend-owned page.  After
>    a successful call to Return, the backend is no lonter able to use
>    Revoke or Map.  The returned page ceases to count against backend
>    quota and now counts against frontend quota.
> 
> Are these operations ones that Xen is interested in providing?  There
> may be other primitives that are sufficient to implement the above four,
> but I believe that any solution that allows virtio-GPU to work must
> allow the above four operations to be implemented.  Without the first
> two, virtio-GPU will not be able to support Vulkan or native contexts,
> and without the second two also being present, shared virtual memory
> and compute APIs that require it will not work.

I'm sure Xen can arrange for what's required, but the Xen primitives
should be as simple as possible, offloading all possible logic to the
backend.

Thanks, Roger.

