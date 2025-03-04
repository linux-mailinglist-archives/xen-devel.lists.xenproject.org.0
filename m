Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441EA4DA36
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 11:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900900.1308874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPR8-0001eS-1P; Tue, 04 Mar 2025 10:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900900.1308874; Tue, 04 Mar 2025 10:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPR7-0001bv-US; Tue, 04 Mar 2025 10:23:41 +0000
Received: by outflank-mailman (input) for mailman id 900900;
 Tue, 04 Mar 2025 10:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFsD=VX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpPR6-0001bN-Tz
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 10:23:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd0976cb-f8e2-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 11:23:39 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so902234066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 02:23:39 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf6c405547sm416311166b.110.2025.03.04.02.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 02:23:38 -0800 (PST)
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
X-Inumbo-ID: bd0976cb-f8e2-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741083818; x=1741688618; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ClaL8Do55cIQoSM4WuzsH+NIE0YrTrF4w8j07C/BDM4=;
        b=XnM4yW0nq2ZwkNkgpWrC6qBOFhYsAPZLv9Vov4gry71hMhLWPLVt6+r0vaxYjsyHmh
         N80loCM1Z03/kSdft+we7hNgjZf0p2Qdw617hWKGTNMnFy8w3ALSUVc1CtVjQQ/koo/T
         UP6SusOqgjwlS3n32j1nkdmXbP+nxfoYFdmYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741083818; x=1741688618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClaL8Do55cIQoSM4WuzsH+NIE0YrTrF4w8j07C/BDM4=;
        b=Uqwa48lX28KOQ4F3Pknq8+xW6N736HUxbLAfXFpLmeK76GrGHxrb1A5OyTHedGaqRz
         EWu6QlpXpmK+P+QhU/Aet9eLdoBnat96LzSl7X135Rx/pQckpriRHtY2EW0CR4ZmwEwR
         phsW4NXeTlWdC0ChX6hrqYtEVOEJ8YglNhnMTs3N67CM3UcM6T2D4O9dyVdSjc+kru8G
         bZx04nzSkGYTgltMaBWI2MLXGcHhdfoLtg3qaZ90Q4SNJ9NzA1mqN0gA3zlTqJ9G3Bdr
         FaYhkS+hchaSssSGY4S9KQRNodp8iEpmgelfR95yRIxCgau2wX+bWUhI2eYl4VnDKB6a
         grxA==
X-Gm-Message-State: AOJu0YzwI4yxSeSt6bL8wOHqxQk5QmZqlHHXiXOO1/8Lu6DqexCdCKeT
	wufZD9KZVEKEU10QW+lmZ+6hg66CmOBxJBFKJteS8w897OTjzRIv6mQGc+VVWww=
X-Gm-Gg: ASbGncteA6mcrmcV6e8YWZo4rAODOfDWpP/P4f4B7ehFQSdyPbdsEFr0cQ1PDWTtC2J
	UdsatVmCm7R7cTkdjYMhFJsRi6+pHGG4F4zo57ZbcIX1GLbB3dBLI6eTv8aF44Y69/T+HdXH63x
	7sGpq7qxoDHrpEJdQseaaeX6NitaoZs2X+9+FIS9shprcVo7ghCVfYqrzuJFckSWUnRlmefZaHm
	YBj9AjZEVv6WSkPVcnOLlAvWZ6oCRWSduJGOnnRr7Y3uiVCQPd/+E9E7/2NDw4SPWYYxamEdPsY
	VoRMAhj3j186iVU4w9SGqO3nUk3RdoLw9THW6mzyJccAZagIxWXMQdM=
X-Google-Smtp-Source: AGHT+IEXZZHYcZM/8tUnsO1IJ9DnzNzpMtL1g57mQ8KngXIS5qp4uv7jzSfXjSOFjO2Oew1Se/4v9g==
X-Received: by 2002:a17:907:7b89:b0:abf:6455:343b with SMTP id a640c23a62f3a-abf64553a2cmr1055798466b.3.1741083818519;
        Tue, 04 Mar 2025 02:23:38 -0800 (PST)
Date: Tue, 4 Mar 2025 11:23:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
Message-ID: <Z8bUqTKSJ8rpMX8R@macbook.local>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
 <Z8GDpJ8G8qMz4uYD@macbook.local>
 <09a8e9dd-2839-49d5-9fff-d2c12c0dd3ed@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09a8e9dd-2839-49d5-9fff-d2c12c0dd3ed@amd.com>

On Fri, Feb 28, 2025 at 03:25:52PM -0500, Jason Andryuk wrote:
> On 2025-02-28 04:36, Roger Pau Monné wrote:
> > On Thu, Feb 27, 2025 at 01:28:11PM -0500, Jason Andryuk wrote:
> > > On 2025-02-27 05:23, Roger Pau Monné wrote:
> > > > On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
> > > > > To work around this, we can, for per-device IRTs, program the hardware
> > > > > to use the guest data & associated IRTE.  The address doesn't matter
> > > > > since the IRTE handles that, and the Xen address & vector can be used as
> > > > > expected.
> > > > 
> > > > All this work on AMD because when interrupt remapping is enabled all
> > > > MSIs are handled by the remapping table, while on Intel there's still
> > > > a bit in the MSI address field to signal whether the MSI is using a
> > > > remapping entry, or is using the "compatibility" format (iow: no
> > > > remapping).
> > > 
> > > So, on Intel, if the guest hands the device the MSI address, it can decided
> > > to bypass remapping?
> > > 
> > > Thanks for providing insight into the Intel inner workings.  That's why I am
> > > asking.
> > 
> > Yes, sorry, I'm afraid I don't have any good solution for Intel, at
> > least not anything similar to what you propose to do on AMD-Vi.  I
> > guess we could take a partial solution for AMD-Vi only, but it's
> > sub-optimal from Xen perspective to have a piece of hardware working
> > fine on AMD and not on Intel.
> 
> I only need AMD to work ;)
> 
> But yeah, I thought I should make an effort to get both working.

Kind of tangential to this approach.  Do you know which register(s)
are used to store the non-architectural MSI address and data fields?

I'm wondering if it simply would be easier to introduce a quirk for
this device in vPCI (and possibly QEMU?) that intercepts writes to the
out of band MSI registers.  That should work for both Intel and AMD,
but would have the side effect that Xen would need to intercept
accesses to at least a full page, and possibly forward accesses to
adjacent registers.

> > > > > e.g. Replace amd_iommu_perdev_intremap with something generic.
> > > > > 
> > > > > The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
> > > > > dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
> > > > > all that has been tested.
> > > > 
> > > > DYK why it fails to enable 32?
> > > 
> > > Not exactly - someone else had the card.  msi_capability_init() failed. If
> > > it ends up in arch_setup_msi_irqs(), only 1 MSI is supported.  But precisely
> > > where the mutiple nvecs was denied was not tracked down.
> > 
> > Does it also fail on native?  I'm mostly asking because it would be
> > good to get to the bottom of this, so that we don't come up with a
> > partial solution that will break if multi-msi is used later in Linux.
> 
> My understanding is native and PV dom0 work with 32, and it's Linux deciding
> not to use multiple MSI.
> 
> It might be this:
> static int xen_hvm_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> {
>         int irq, pirq;
>         struct msi_desc *msidesc;
>         struct msi_msg msg;
> 
>         if (type == PCI_CAP_ID_MSI && nvec > 1)
>                 return 1;
> 
> I'll have to look into this more.

That shouldn't apply to PVH because it never exposes
XENFEAT_hvm_pirqs, and I would expect xen_hvm_setup_msi_irqs() to not
get used (otherwise we have a bug somewhere).

Thanks, Roger.

