Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD89BC895
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 10:04:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830147.1245061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8FSx-0002iO-5G; Tue, 05 Nov 2024 09:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830147.1245061; Tue, 05 Nov 2024 09:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8FSx-0002ft-2T; Tue, 05 Nov 2024 09:03:11 +0000
Received: by outflank-mailman (input) for mailman id 830147;
 Tue, 05 Nov 2024 09:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vo3s=SA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8FSw-0002fn-H3
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 09:03:10 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a9ac3c-9b54-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 10:03:06 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9eaaab29bcso223017666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 01:03:06 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a30e8sm102407166b.3.2024.11.05.01.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 01:03:05 -0800 (PST)
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
X-Inumbo-ID: c5a9ac3c-9b54-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM1YTlhYzNjLTliNTQtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzk3Mzg2Ljk5OTcwNiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730797386; x=1731402186; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NgNdo/78kLx8xgxYNFPPqXWCif+sgKS9XB2pivzpSiI=;
        b=ivqfGRO6AFbhZcYfOT6tNsD7s7sN+GVy9ySrbb3z3+8vfQcAGmX4lMdNdE1kGe7Oc+
         S0O5KTp+wovCrQxH5LSts/Brn+IATHHf7X2gI/frw6FyUF3CaV1LelJE48meGj5A1a2+
         fRsqLc8b+DyR/5TlAUY2UdsF1jK7iMNhFqijw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730797386; x=1731402186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgNdo/78kLx8xgxYNFPPqXWCif+sgKS9XB2pivzpSiI=;
        b=RyAcJAg4meFGqGSW9du7Jl+gtVzmQl57dc/QQlTeQMklsaKr/SLX9EzAmOrXqMNeEG
         cFQxr/l9IfCe8koGIJdchpyyNZRaleCdb3SnXexPbEEE/N0JwxMv56q0KE/oKUoJqiaD
         jTCQFQRp7S0dbZKHP86w25UZY9sUJ3G31Lce82uo6xwysT4qfCXUavqZHEjPc9RqdMgz
         jkWT1rp3HP9Ipl/V18+UnHUwb9UxnPzuzXpc+yaXT0uGA2DoxyGgI5nbL/vTtiLcNsyR
         g/8vxAXB1QHiTdB3SsePk1MkhzU8IQV9/aN7LgMn8FLnjnOpL4wyv5orfcu+2dKPDdR5
         VlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLr93CjhhS5e0cekikzCfCX6y7vHnwJ5upVVbx/hqlGz9yEemWIm8kOZQfzSoKEQuOBWnkfsBRjSc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwthIPhcIFuiHf9qPtaBG8qYFSgpHgaxxggilh+yPWaVPw35KRa
	ejAar3LWkJ3vjAgzC0J+GozdIrHZbhbr4B7zV3ccN3Wid1r1LMYvR3kmIZxCHuk=
X-Google-Smtp-Source: AGHT+IF+HRw8cinGCUkZyHiH9CLB8Sz1oBrAl8kkKfQSdF4tJh9zhfQg0YqFiox6afysrzHTA5gZdw==
X-Received: by 2002:a17:907:7208:b0:a9a:15fb:727a with SMTP id a640c23a62f3a-a9e508ac2dcmr1930927766b.13.1730797386289;
        Tue, 05 Nov 2024 01:03:06 -0800 (PST)
Date: Tue, 5 Nov 2024 10:03:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
Message-ID: <ZynfSMUVEy71ZskR@macbook>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>

On Sat, Nov 02, 2024 at 11:18:24AM -0400, Daniel P. Smith wrote:
> On 11/1/24 16:16, Stewart Hildebrand wrote:
> > +Daniel (XSM mention)
> > 
> > On 10/28/24 13:02, Jan Beulich wrote:
> > > On 18.10.2024 22:39, Stewart Hildebrand wrote:
> > > > Add links between a VF's struct pci_dev and its associated PF struct
> > > > pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
> > > > dropping and re-acquiring the pcidevs_lock().
> > > > 
> > > > During PF removal, unlink VF from PF and mark the VF broken. As before,
> > > > VFs may exist without a corresponding PF, although now only with
> > > > pdev->broken = true.
> > > > 
> > > > The hardware domain is expected to remove the associated VFs before
> > > > removing the PF. Print a warning in case a PF is removed with associated
> > > > VFs still present.
> > > > 
> > > > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > ---
> > > > Candidate for backport to 4.19 (the next patch depends on this one)
> > > > 
> > > > v5->v6:
> > > > * move printk() before ASSERT_UNREACHABLE()
> > > > * warn about PF removal with VFs still present
> > > 
> > > Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
> > > just after an adjustment to the commit message. I'm instead actively
> > > concerned of the resulting behavior. Question is whether we can reasonably
> > > do something about that.
> > > 
> > > Jan
> > 
> > Right. My suggestion then is to go back to roughly how it was done in
> > v4 [0]:
> > 
> > * Remove the VFs right away during PF removal, so that we don't end up
> > with stale VFs. Regarding XSM, assume that a domain with permission to
> > remove the PF is also allowed to remove the VFs. We should probably also
> > return an error from pci_remove_device in the case of removing the PF
> > with VFs still present (and still perform the removals despite returning
> > an error). Subsequent attempts by a domain to remove the VFs would
> > return an error (as they have already been removed), but that's expected
> > since we've taken a stance that PF-then-VF removal order is invalid
> > anyway.
> 
> I am not confident this is a safe assumption. It will likely be safe for
> probably 99% of the implementations. Apologies for not following closely,
> and correct me if I am wrong here, but from a resource perspective each VF
> can appear to the system as its own unique BDF and so I am fairly certain it
> would be possible to uniquely label each VF. For instance in the SVP
> architecture, the VF may be labeled to restrict control to a hardware domain
> within a Guest Virtual Platform while the PF may be restricted to the
> Supervisor Virtual Platform. In this scenario, the Guest would be torn down
> before the Supervisor so the VF should get released before the PF.

The VF getting released before the PF is what we would usually expect?

I'm a bit confused because a guest being torn down doesn't imply that
the device is removed from Xen (iow: a call to pci_remove_device()).
Removing a device is hot-unplugging the PCI device from Xen, not
deassinging from a guest.

I would also be uneasy with assigning a PF to a non-privileged domain,
specially if VFs from that same device are being assigned to trusted
domains.

My assumption is that you generally want the PFs assigned to the
hardware domain, and the VFs assigned to any other domains (trusted or
not).

Thanks, Roger.

