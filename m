Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634CA671B8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 11:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918913.1323525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuUSH-0004Mp-Qb; Tue, 18 Mar 2025 10:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918913.1323525; Tue, 18 Mar 2025 10:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuUSH-0004K4-Ms; Tue, 18 Mar 2025 10:45:53 +0000
Received: by outflank-mailman (input) for mailman id 918913;
 Tue, 18 Mar 2025 10:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuUSG-0004Jy-7p
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 10:45:52 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2437cd69-03e6-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 11:45:44 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2239c066347so112540795ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 03:45:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-737116b13aasm9202112b3a.169.2025.03.18.03.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 03:45:42 -0700 (PDT)
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
X-Inumbo-ID: 2437cd69-03e6-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742294743; x=1742899543; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBLNeRl2TaqvkMzblnukNT37RWB/3hIwtQTOg/wpViw=;
        b=BMADqaGxQXtTbwFwayRBNRfrgeBbXiF9nA2U+1NJbZ6GcJCAVyXjzQ2TclO1H8f/So
         34kdf6FQknTYU8eRemZ+oJg+2henk1t5DVWZpzBIFrVJJAt7rL82EPCfc+Iu0JyEfzae
         lZpfF618NjL/3abuAJSKPqWe5IwStoc5UQdnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294743; x=1742899543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBLNeRl2TaqvkMzblnukNT37RWB/3hIwtQTOg/wpViw=;
        b=H+IlPj0DyWgYSWK6pOvhjfnnffZyz/6nXmSyTSNUuMZwThccwxOnlX2RU2abvP9No4
         Jzju+zWofsXrRxxDWKPNND9asitQBvQRv3bsxwm1NTK2FRR27Baj4S12WSYPEfG2WTMv
         mix7Xv1LXRfwGOtZC9RAaPq+M4WzEibho27BDNQaAo1sDK4w1dgAeObnbGLQJM2e8Dq1
         hjDCCLEY4RY1ww8uKwwk3CdBCa2onJfBL7w1qgO3RaUSlo3Uqw/kZY/48Q7YQlXW8thL
         V4nDc0yvFVCvQayJn3FrhYU3mPmF6GuD56vhI6YA9cBbyrMGlKPd+KuMWrALQo3cdn7V
         0VuA==
X-Forwarded-Encrypted: i=1; AJvYcCU00tILTDUnSiGO7cYp1Z8wqD5GDxh0SKksgjCZabFd4XnuW3BfUbknt2tL9RQIIgyuqdRELCRMV+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeToerOziE7mr/30b5H7f1DNbKGVAgnRcvOXHmlYwF4lSlRVYp
	gWTRSnpU5iTsSaL24unUhcvzOl8hVL/9+b+aCXTWhcA61YDvg+IwBy/PrnCwMs8=
X-Gm-Gg: ASbGncthn55JYRbdyW4s7vVGp7ANY9X+TYPrzfNOYEuzvLRZE5cSNdphljVyb4ERFs4
	LbkLanYQwSlX50YLXZFQ9AxD0NuH9FockGPaspMthWIJ1AiOZpk1flFKq2yq0LIBkDuO3FEmuoW
	8XxKU5Cd5QUHsHoxhdxo3tRL+vffV9SYsx2pkk5FXYpxNeFHSmE0C4E2LQT/eI0jaZlbp71Sp+Z
	tuaHotpdHOTSs/gsaVciOd/TxfPnzR92VDH1jhUVY1UQSnD7cU46NiSQCn+crs3FqK7vKeMgBZB
	Art4TpaeVqlt3L5IxeSDa26q6wkBmE5pbHhPcv+0pRjTHhqMYA==
X-Google-Smtp-Source: AGHT+IF4xdK2a2ipc83l9oSiAV3Z4GupYjs0fhBrNMpGLRLH5HmjdD+nb9VvjTmPktofrTp6/SFz3A==
X-Received: by 2002:a05:6a00:1888:b0:736:2d84:74da with SMTP id d2e1a72fcca58-7372239835dmr16512364b3a.10.1742294742626;
        Tue, 18 Mar 2025 03:45:42 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:45:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/msi: always propagate MSI writes when not in active
 system mode
Message-ID: <Z9lO0b7LkCFwmJZv@macbook.local>
References: <20250318082945.52019-1-roger.pau@citrix.com>
 <38076c0d-8e1a-4d16-b22c-b1db9460ed1c@suse.com>
 <Z9k0tL30_yLuj5kM@macbook.local>
 <2eabb7bc-0dca-4426-a6ee-49a6ef8968db@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2eabb7bc-0dca-4426-a6ee-49a6ef8968db@suse.com>

On Tue, Mar 18, 2025 at 11:14:59AM +0100, Jan Beulich wrote:
> On 18.03.2025 09:54, Roger Pau Monné wrote:
> > On Tue, Mar 18, 2025 at 09:36:37AM +0100, Jan Beulich wrote:
> >> On 18.03.2025 09:29, Roger Pau Monne wrote:
> >>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> >>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> >>> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
> >>>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> >>>                                              &msi_desc->remap_index,
> >>>                                              msg, &data);
> >>> -    if ( rc > 0 )
> >>> +    if ( rc >= 0 )
> >>>      {
> >>>          for ( i = 1; i < nr; ++i )
> >>>              msi_desc[i].remap_index = msi_desc->remap_index + i;
> >>
> >> I understand that Marek's testing has made clear that this change is needed,
> >> yet I don't understand it. If we didn't allocate a new index, why would we
> >> need to update in-memory state, when memory is preserved across S3?
> > 
> > Is this always the case for device memory? (iow: contents of the BARs
> > and possibly the PCI config space?)
> 
> Of course not. But msi_desc[] is in RAM.

Sorry, I think I didn't understand your earlier question, and hence
the reply I provided didn't make any sense to you.

> >> (This
> >> lack of understanding on my part is why I didn't associate the last
> >> paragraph of the description with this extra change, when you first sent it
> >> in this shape on the original thread.)
> > 
> > At least for the AMD IOMMU driver it seems to be expected.  See how
> > amd_iommu_resume() performs a pair of disable_iommu() and
> > enable_iommu() calls, and in the enable_iommu() function there's a
> > call to set_{msi,x2apic}_affinity() that's expected to (re)set the
> > interrupts.  Or at least that would be my understanding.
> > 
> > This change reverts the behavior to what it used to be prior to
> > 8e60d47cf011 for the suspend and resume paths.  I'm afraid I don't
> > have a sensible way to test changes in that area, so I cannot
> > investigate much.
> 
> So how did you end up considering this may have been the reason for the
> failure Marek was still seeing with the earlier form of the patch? I'm
> simply hesitant to ack something that I don't understand at all.

Oh, I think I know what you are missing, and it's because it's out of
patch context.  The adjusted chunk in amd_iommu_msi_msg_update_ire()
does:

    if ( rc >= 0 )
    {
        for ( i = 1; i < nr; ++i )
            msi_desc[i].remap_index = msi_desc->remap_index + i;
        msg->data = data;
    }

Note how it sets msg->data, as otherwise the field won't be properly
set, and hence the caller propagating the contents of `msg` to the
registers would be incorrect.

The change forces msg->data to be correctly set when returning either
0 or 1, so that propagation to the hardware can be done in both
cases.  Previously the contents of msg->data where only correct when
returning 1 on AMD.

Hope this makes more sense, sorry for not understanding your question
initially.

Thanks, Roger.

