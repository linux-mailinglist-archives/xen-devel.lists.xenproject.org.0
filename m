Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8541944BC8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 14:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769711.1180611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVKo-0001Bh-Jh; Thu, 01 Aug 2024 12:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769711.1180611; Thu, 01 Aug 2024 12:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVKo-00019o-GT; Thu, 01 Aug 2024 12:55:10 +0000
Received: by outflank-mailman (input) for mailman id 769711;
 Thu, 01 Aug 2024 12:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZVKn-0000yr-2m
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 12:55:09 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 479d3b81-5005-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 14:55:08 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6b7a0ef0e75so39737336d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 05:55:08 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8d8505sm84576846d6.7.2024.08.01.05.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 05:55:06 -0700 (PDT)
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
X-Inumbo-ID: 479d3b81-5005-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722516907; x=1723121707; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=034bLDCBYZdpmv6TZ9fSLZ9UYJjcNSKGwvE0ZYUk1w0=;
        b=okYkxb5EVNo1DESqSkmR+gm7BNwoUwsFwCB9HtJT6GAOhallM1MWmT/Xr+qoNhskuO
         kr5bYBWjwIdNwdZS4hBLrFe+eY0o4a7l/4qqS2ErD78BgjpjTI8dI0lo16kExMUWY6Dj
         jxsszSMuoZsxya2HXXq1jzQbrHTB+x8GGDzSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722516907; x=1723121707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=034bLDCBYZdpmv6TZ9fSLZ9UYJjcNSKGwvE0ZYUk1w0=;
        b=fBUcsuqgBBBr4vbCsBNt9PlHnA50TH6yb8Anw3HKAaxQc+gFy1HrimaFwPUx48R03Y
         Nx8W1JyhsEiTUgivLIIi+tHavb2qRICdSPQN2FwbaTxEPErw9WId9W2dPnHwIQxAytUg
         /rC3DndEXk+54xOMFBRB0fByDt4M4ViJFgT421K/t6H4F2K9sHG32ei7lidV2ZfOImCa
         dmfdbH4RavYdaocoJVTBq/llnkB320EBY/qKAPrDk8CO1a+N4iWCEoT/uBBbhOH6rp8t
         VOeCn+qy87yG0ES9gWkVe/ZFwYNazYyUi+368ff0yDLbQ3fhF4+mZCex1uwLZcUA25B7
         bohg==
X-Forwarded-Encrypted: i=1; AJvYcCUI/QwpXjxisluH+pPLESxl4NXqCU4xeYlSk6ZxwioTAnZ8+LZxKLWy3wNBFkuzuOpzblM0CUBIP7lhISnzVY/6mRgJmudlX02OLOtVc8I=
X-Gm-Message-State: AOJu0YwobQHb5/TBTNNZacTF+zjXvFDU7/akxBElSlt7R33EC2kpJ3WA
	aVX2V1LI1WxdhRo5R2EHECWjmwoGi4/1GSZwrzVqEbA4KzYBOgLB1GPLpOUJvVo=
X-Google-Smtp-Source: AGHT+IHitI3kQPF7ecjiRJVP1VyO8ntqhOGEAU30XZ2R9feIyByhzvAbM2JHoAo8EwV2Z25V85HirA==
X-Received: by 2002:a05:6214:469e:b0:6b5:a945:ec51 with SMTP id 6a1803df08f44-6bb8d85fc5dmr4606486d6.51.1722516907079;
        Thu, 01 Aug 2024 05:55:07 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:55:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [XEN PATCH v12 5/7] tools/libxc: Allow gsi be mapped into a free
 pirq
Message-ID: <ZquFqIfrironhEej@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-6-Jiqian.Chen@amd.com>
 <ef611901-03bf-4aa9-9de7-ac6d4fd82d05@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef611901-03bf-4aa9-9de7-ac6d4fd82d05@suse.com>

On Tue, Jul 09, 2024 at 03:26:31PM +0200, Jan Beulich wrote:
> On 08.07.2024 13:41, Jiqian Chen wrote:
> > Hypercall PHYSDEVOP_map_pirq support to map a gsi into a specific
> > pirq or a free pirq, it depends on the parameter pirq(>0 or <0).
> > But in current xc_physdev_map_pirq, it set *pirq=index when
> > parameter pirq is <0, it causes to force all cases to be mapped
> > to a specific pirq. That has some problems, one is caller can't
> > get a free pirq value, another is that once the pecific pirq was
> > already mapped to other gsi, then it will fail.
> > 
> > So, change xc_physdev_map_pirq to allow to pass negative parameter
> > in and then get a free pirq.
> > 
> > There are four caller of xc_physdev_map_pirq in original codes, so
> > clarify the affect below(just need to clarify the pirq<0 case):
> > 
> > First, pci_add_dm_done->xc_physdev_map_pirq, it pass irq to pirq
> > parameter, if pirq<0 means irq<0, then it will fail at check
> > "index < 0" in allocate_and_map_gsi_pirq and get EINVAL, logic is
> > the same as original code.
> 
> There we have
> 
>     int pirq = XEN_PT_UNASSIGNED_PIRQ;
> 
> (with XEN_PT_UNASSIGNED_PIRQ being -1) and then
> 
>     rc = xc_physdev_map_pirq(xen_xc, xen_domid, machine_irq, &pirq);
> 
> Therefore ...
> 
> > --- a/tools/libs/ctrl/xc_physdev.c
> > +++ b/tools/libs/ctrl/xc_physdev.c
> > @@ -50,7 +50,7 @@ int xc_physdev_map_pirq(xc_interface *xch,
> >      map.domid = domid;
> >      map.type = MAP_PIRQ_TYPE_GSI;
> >      map.index = index;
> > -    map.pirq = *pirq < 0 ? index : *pirq;
> > +    map.pirq = *pirq;
> >  
> >      rc = do_physdev_op(xch, PHYSDEVOP_map_pirq, &map, sizeof(map));
> 
> ... this very much looks like a change in behavior to me: *pirq is
> negative, and hence index would have been put in map.pirq instead. While
> with your change we'd then pass -1, i.e. requesting to obtain a new
> pIRQ.
> 
> I also consider it questionable to go by in-tree users. I think proof of
> no functional change needs to also consider possible out-of-tree users,
> not the least seeing the Python binding below (even if right there you
> indeed attempt to retain prior behavior). The one aspect in your favor
> is that libxc isn't considered to have a stable ABI.

FWIW, it seems this forced identity mapping was introduced to overcome
a regression in xend as a result of an XSA:

934a5253d932 fix XSA-46 regression with xend/xm

Not sure however if other tools have since then come to rely on this
behavior.

> Overall I see little room to avoid introducing a new function with this
> improved behavior (maybe xc_physdev_map_pirq_gsi()). Ideally existing
> callers would then be switched, to eventually allow removing the old
> function (thus cleanly and noticeably breaking any out-of-tree users
> that there may be, indicating to their developers that they need to
> adjust their code).

I'm fine with the naming.

Thanks, Roger.

