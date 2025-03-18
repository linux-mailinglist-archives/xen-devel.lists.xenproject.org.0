Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DE8A66F14
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 09:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918672.1323311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSiG-00039Y-Fp; Tue, 18 Mar 2025 08:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918672.1323311; Tue, 18 Mar 2025 08:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSiG-00036w-Cu; Tue, 18 Mar 2025 08:54:16 +0000
Received: by outflank-mailman (input) for mailman id 918672;
 Tue, 18 Mar 2025 08:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuSiF-00036q-1R
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 08:54:15 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90e198dc-03d6-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 09:54:13 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso24867925e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 01:54:14 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb7ebe3csm17777084f8f.99.2025.03.18.01.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 01:54:13 -0700 (PDT)
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
X-Inumbo-ID: 90e198dc-03d6-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742288053; x=1742892853; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IHoSelJhWGi3NtZe+OuN1bSso73DgMjMxoyxsvYlaN4=;
        b=Vxgp3yNZ/cxKxUswaSWfvG66zEnngEIQSArmoP7sDQgxviQuSVRKJY+pBf+E/+LUm0
         k9nuYA4ZKlbRQs4HtrpJIKMTKOfz9egWPXk2eedUwsWOp3gVZUQFodptFD6VXRqYCMi5
         ByvVqLdVgdhB97frBmPfGvTSC82MvpQEUnkr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288053; x=1742892853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHoSelJhWGi3NtZe+OuN1bSso73DgMjMxoyxsvYlaN4=;
        b=utvTxPmd9AWnRSqobJl0rN2McJgufOpcNl8qtiWV9Os/4qNtBiyB7q3ld7jLO7Q9TW
         hwi6NPsS40EC5LL2klSa5UVVwj1ZSVYaRArjHKjSgrVjReXVVH7UIhpMgj/Y91QudhY/
         cf7sSenBxlIbGQdXuEQauHkl4Ph0sce3w0QFI4FYa4hwjX/yRAXkGEqNSDLxL7fKEJ7L
         qB+kRIV6i/p7pa2d6s8v6/bvc0UFEzvvR+XkpSlxxQ0eWnq0tFBxNiYWDiEa2NPx/PBo
         vDfRs3xDEJV3XgwTdMoJcTy2CsZ89RTxi1E3J5P26aVJEtwjvwTsRJqgV6o+KI6fJCL3
         P9sw==
X-Forwarded-Encrypted: i=1; AJvYcCV2MMvUv2QHNNExmkqlCAtGkoL9TdLAjNfThk96ieX0h6O/4DRs22dWu74rsW5bLYrvIMAl/0TYIHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5FpIW9MXBGWC5D5G4wK5HE5Sftf+TihItR9VA1y6+sBBzVozn
	iDfMJPTFYoO6UV1w1hSFnVcfu51tM8VBjRp9ZTG0BDsmmVExI0ByWEzrDoGTe6TWWkf2n34deR4
	h
X-Gm-Gg: ASbGncuDOE1ryAnsyuvUaRfvcICfvLOwTm1srNF/HelJDxEgT6ZKr2HO0R0LHQXcZwH
	3lPqqoDAdZ3UXDCksZm1rR56L6YyLckW6Tf4Boxd2ILxsAzTJIgzsnhcXZ4NqzJNJ/knRiOfUrv
	B8aXpl5iTUUnkoFVdgqWfInD/AtxJgIA40rLRfr0A0i3okc+6NpEFgiMgYNr9/1FWXAFajqcQxd
	wOyk8/aeQI1LotRl1GTrcBkIONsjzP8RjG3d4ii7WjP9vyU8AOyyjHXDqxvZyGiRozijt94A3Pr
	Bm8E0imvywIOwnIBbsF7tWincbZsszFTviugbPBPheOfzC7qYg==
X-Google-Smtp-Source: AGHT+IFOZUBhGERXTYxWV1pGs52QINJ6o6RbZaaVyXOM7wTX+J4/p0z1lR1ItLa+WAXPX3mXNezlEw==
X-Received: by 2002:a05:600c:354a:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43d3b951e34mr10766995e9.2.1742288053486;
        Tue, 18 Mar 2025 01:54:13 -0700 (PDT)
Date: Tue, 18 Mar 2025 09:54:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/msi: always propagate MSI writes when not in active
 system mode
Message-ID: <Z9k0tL30_yLuj5kM@macbook.local>
References: <20250318082945.52019-1-roger.pau@citrix.com>
 <38076c0d-8e1a-4d16-b22c-b1db9460ed1c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38076c0d-8e1a-4d16-b22c-b1db9460ed1c@suse.com>

On Tue, Mar 18, 2025 at 09:36:37AM +0100, Jan Beulich wrote:
> On 18.03.2025 09:29, Roger Pau Monne wrote:
> > --- a/xen/drivers/passthrough/amd/iommu_intr.c
> > +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> > @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
> >      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> >                                              &msi_desc->remap_index,
> >                                              msg, &data);
> > -    if ( rc > 0 )
> > +    if ( rc >= 0 )
> >      {
> >          for ( i = 1; i < nr; ++i )
> >              msi_desc[i].remap_index = msi_desc->remap_index + i;
> 
> I understand that Marek's testing has made clear that this change is needed,
> yet I don't understand it. If we didn't allocate a new index, why would we
> need to update in-memory state, when memory is preserved across S3?

Is this always the case for device memory? (iow: contents of the BARs
and possibly the PCI config space?)

> (This
> lack of understanding on my part is why I didn't associate the last
> paragraph of the description with this extra change, when you first sent it
> in this shape on the original thread.)

At least for the AMD IOMMU driver it seems to be expected.  See how
amd_iommu_resume() performs a pair of disable_iommu() and
enable_iommu() calls, and in the enable_iommu() function there's a
call to set_{msi,x2apic}_affinity() that's expected to (re)set the
interrupts.  Or at least that would be my understanding.

This change reverts the behavior to what it used to be prior to
8e60d47cf011 for the suspend and resume paths.  I'm afraid I don't
have a sensible way to test changes in that area, so I cannot
investigate much.

Thanks, Roger.

