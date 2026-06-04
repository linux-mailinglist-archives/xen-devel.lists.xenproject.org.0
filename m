Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XO7/OBQQImpbSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:53:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE646440D6
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:53:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=UljWAXkC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1328777.1593103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHsf-0005JD-3L; Thu, 04 Jun 2026 23:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328777.1593103; Thu, 04 Jun 2026 23:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHsf-0005Gy-0m; Thu, 04 Jun 2026 23:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1328777;
 Thu, 04 Jun 2026 23:53:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgg@ziepe.ca>) id 1wVHsc-0005Gn-K2
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:53:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVHsc-002qi2-0p
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:53:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgg@ziepe.ca>)
 id 6a220fee-e002-0a2a0a5209dd-0a2a4509db16-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:53:41 +0200
Received: from [209.85.219.47] (helo=mail-qv1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgg@ziepe.ca>)
 id 6a221004-2497-0a2a45090019-d155db2fcc8a-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:53:41 +0200
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-8ce3876a50cso12686016d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:53:41 -0700 (PDT)
Received: from ziepe.ca
 (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net.
 [47.54.130.67]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecd051facsm64970176d6.32.2026.06.04.16.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:53:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1wVHsZ-0000000A3UP-0kpK;
 Thu, 04 Jun 2026 20:53:39 -0300
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780617220; x=1781222020; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmt/JkLWWliz/NxTk163pbkZkRgDeZpSMIwPpktcw8U=;
        b=UljWAXkCCRjZWaAwBsM9jdxodxongKnkm8mszssCxvrV+t6zIav2sYrk44WgEtdhza
         3v+V2G+rKUS1ged8UIDh57LNNkjfCYf88hGlFOHEOsGzkNUXNNBgX+ZWd3C8p3WHKxrd
         Ylj4dpJ6oMJxKPrb/7iv+VtmKS5Is6KsZmRmWfrrXzxpLXq2wc8bCZnqBcLpp+gmOPnn
         187a/+PWPnYfQDRAAmO4T/tQWXlegi91GgUEnkgTB7HFM0vH8cOC7mKVEpN97i1+kD80
         kFzjsrV6I5KV1rurwIqqx2SxCamlTVciZZwdHhGj+MqkY63Hx40gQw1etQpngxumH+HB
         ZW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780617220; x=1781222020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmt/JkLWWliz/NxTk163pbkZkRgDeZpSMIwPpktcw8U=;
        b=BnklsfHHuVEmZjKzqcN2IMxEguW4Mjh9mJM7KvwFTcu7bJtM89GOcW/J5R5AKiCX2f
         xS3zf1G8HO+/POeSW42eCruDsNdTTabL9DG2Le2qn1cdPoD9tYiK+aFSERzHXLTlidZn
         u+wGQI/nyekyzCY7lpRU2YZ7Ei1bPslq/2UgQMVYoAfh/8t1aWACBM4OvQmC5Swg38SL
         zxPt2DZU0qUwpmsIvg2t9TNNrrXHyHtVs1ubiH81rfYqX/Tagmw2wCOBX2VGff9udJco
         VGH94S8u52/ZiTHbebaNAjx/X0k9g0oBl2F8MoOoT9GPdYuCe7IzVrTpkrUIswiZY4Ag
         0JxA==
X-Forwarded-Encrypted: i=1; AFNElJ9MEBiQ+oW86cmrY6wmL35UntUfdjVbOwqMtpv0RcJ/NVekbGdL+lgmS3Hrm7W4rm7/8DzguoFQLiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziBsrljr45AleO3zjFnm6EsTZHAN2FDoYRGV+HxTr6RTlp6ol0
	JPPoZzuZe9jtb/37zcv4OPepK8L6FKyYZpxB8gjne9NRfS+R8e4rycUwCk8Tv6uVTrc=
X-Gm-Gg: Acq92OFTc/TjnC/9Z5PKIpZwUwkgzSHJjrKpleaffajr4Vx55MvfJBKFGCy6OchUWt+
	s0J3jSMd2kYOb3cDnKHB5aGSCG23tk5YyBLKVm2Nl4QMe9oMOvpS6dOwjU6xceUChrJWdGXTXLl
	Te8MTDsmcwc7SOlNuNBeREXRiYb2a1L4kCHNj1e3yheOgY4tDRM4ut+ITHoXL23bH9hPKIO9Vj4
	pV1GPwINjARvk10XfZi/OMmxDb7nx3qD2uVEl2BoORbE+FnGOwgjZual1GfyAI4GO/VkaSNAexA
	mUjcXSgkeIc7gdXDl33jflo5dD0at8F5IL/M0UK+foVAGoWW53CLYkMUgssBTDxbrSkAda3tEwU
	M7cs7AnkooUYj4MUQhLfbj0KohuavPg5/zFnAbMv020XCBukY/ok7eXQyhA0mMO70tljzT5ZYzc
	IQUXMWODIyDTF9YFFQZedcxVsy7/WJKpFbl4NcO4LX6WoHHjh7r2qw03pQD8kSFlF3lmi3BEYbe
	iTF2iIjax9V+RD/
X-Received: by 2002:a05:622a:6187:b0:517:6b31:8048 with SMTP id d75a77b69052e-51795bccda6mr17320401cf.35.1780617220214;
        Thu, 04 Jun 2026 16:53:40 -0700 (PDT)
Date: Thu, 4 Jun 2026 20:53:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Keith Busch <kbusch@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC 00/12] PCI: Add support for Scalable I/O Virtualization
Message-ID: <20260604235339.GE2487554@ziepe.ca>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
 <20260604182031.GB2487554@ziepe.ca>
 <a07763e2-aff3-4468-83c2-d50a9e1605c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a07763e2-aff3-4468-83c2-d50a9e1605c8@gmail.com>
X-purgate-ID: tlsNG-bad1c0/1780617221-41D6FA53-9EF946ED/0/0
X-purgate-type: clean
X-purgate-size: 2255
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dimitri.daskalakis1@gmail.com,m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:schnelle@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:alex@shazbot.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:leon@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:kbusch@kernel.org,m:alexanderduyck@fb.com,m:kuba@kernel.org,m:daskald@meta.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:dimitridaskalakis1@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[google.com,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,shazbot.org,intel.com,nvidia.com,suse.com,epam.com,fb.com,meta.com,lists.ozlabs.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EE646440D6

On Thu, Jun 04, 2026 at 04:49:05PM -0700, Dimitri Daskalakis wrote:
> 
> On 6/4/26 11:20 AM, Jason Gunthorpe wrote:
> > On Thu, Jun 04, 2026 at 08:01:41AM -0700, Dimitri Daskalakis wrote:
> >> With this patchset core enumarates the SIOV capability and can identify
> >> SIOV PFs. But there is no central mechanism to allocate/manage SIOV VFs.
> >> To support device pass through, devices will need to add a vfio-mdev
> >> driver with IOMMUFD support (or something similar).
> > 
> > There is an enormous amount of missing work to do something useful
> > with the SIOVr2 stuff. IIRC there is even supposed to be BIOS
> > components in this plan and there are some missing PCI SIG topics too
> > IIRC.
> > 
> > So, I'm not sure how much value there is in merging just the cap
> > discovery without a roadmap for the missing parts..
> > 
> > Also, I'm quite surprised to see this out of the blue, there is an OCP
> > workstream that was building out a standard that outlines how all the
> > different components have to act to successfully implement it.  What
> > is in PCI SIG was just some minor foundational adjustments without any
> > context on how to form them into a solution.
> > 
> > I think it is extremely premature to merge anything related to SIOV to
> > the kernel. Join the OCP work stream if you are interested. I think
> > the general feeling was there is not sufficient interest in the
> > industry to do this and it has gone quiet.
> > 
> > Jason
> 
> Hey Jason, thanks for the feedback. We (at Meta) are definitely
> interested in SIOV-like capabilities for device passthrough to containers.
> 
> For those scenarios, having PCIe transactions per RID plus IOMMU
> isolation is enough, but I can imagine hypervisors/VMs requiring more
> platform support.
> 
> I hear you on the broader support story being premature. But on the
> other hand, this series unblocks experimentation at the driver level
> for basic data path validation.

And you can do your experimentation OOT :)

Go to the OCP workstream and finish the standard if you want to get
something merged.

There is zero need for SIOV if all you want is containers. containers
do not require iommu isolation or unique RIDs.

Jason

