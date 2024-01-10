Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC6829936
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 12:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665386.1035594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNWr1-0008TG-PC; Wed, 10 Jan 2024 11:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665386.1035594; Wed, 10 Jan 2024 11:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNWr1-0008QR-Lz; Wed, 10 Jan 2024 11:34:39 +0000
Received: by outflank-mailman (input) for mailman id 665386;
 Wed, 10 Jan 2024 11:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sd/G=IU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNWr0-0008QL-Te
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 11:34:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aa138b1-afac-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 12:34:35 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2be2148777so44665466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 03:34:35 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 gl21-20020a170906e0d500b00a2b034c35b5sm1975054ejb.198.2024.01.10.03.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 03:34:34 -0800 (PST)
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
X-Inumbo-ID: 3aa138b1-afac-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704886474; x=1705491274; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NA39UWRKBVk5nsJsH63/avnH4btqGtj4dS+KEzaOXO0=;
        b=fuZPkKdrcuPld5gyO/3RoWYM3CSpyL7IYcKvDpJ5OaAJlgqlwOPa7iV2OK1e87v0pZ
         q/qq8u5/tjyAv09l7+SiT2XJmfr6K9t0IUvpwK8o9wigHtmqeWazJAwIhKJvgAjHMvY4
         /qKn1t8dxoLjPJvc846eRx8CKyvhkoTS4oW3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704886474; x=1705491274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NA39UWRKBVk5nsJsH63/avnH4btqGtj4dS+KEzaOXO0=;
        b=mI5SekXiVp/h7GnavSWvtBkm9lS0UPu0Xp1a6EyAkXId2hCV4XnvQyaN2YMUWvLK8o
         IVrzp/a+nazDB7yAa7c8Lq329HW7c5rnMHdoWNw+NMvXQ3ZpKPFUX/Z56i/mjKznrwe8
         sxAR8KZ1uTHxRjYGqxsOVF1jgxdxHWwcuOziigrQaIrLkM6+3+0BlLc572kXzy3PLW/0
         Qt1dJnjmFeX/WEkqbVTNQWUa+LsUhGFqnKIcpIcL9mzqbyBMGk8Yv4rXklbOsvqxWujm
         vO7F6oOqJOf83STFNnC5jxcL3lhkjYEMAYL6FUnGSDPu0F22PKTgu5qgui1iFBS7n51Q
         hOUg==
X-Gm-Message-State: AOJu0YxtQ4QmUuCvur8Ei2pgyqvgXRGf9VM9q69TJxPtiYR3zqlECpmc
	Uhs26NgRLICbrNAq7FMWQC4WR8w2q+A2ew==
X-Google-Smtp-Source: AGHT+IEvWYcaeGsByGPADCI5r/LqcJ/4uwRUUP0RLu1RonMm+0DC1HiL/qqhbToUHk6WIUzMVHyPaw==
X-Received: by 2002:a17:906:d141:b0:a28:ac5d:ffe with SMTP id br1-20020a170906d14100b00a28ac5d0ffemr546507ejb.122.1704886474314;
        Wed, 10 Jan 2024 03:34:34 -0800 (PST)
Date: Wed, 10 Jan 2024 12:34:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Message-ID: <ZZ6AyeAdOZ9Dx-AK@macbook>
References: <20240110095311.61809-1-roger.pau@citrix.com>
 <238b79f5-0510-4306-9c32-19dade08e819@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <238b79f5-0510-4306-9c32-19dade08e819@suse.com>

On Wed, Jan 10, 2024 at 11:26:02AM +0100, Jan Beulich wrote:
> On 10.01.2024 10:53, Roger Pau Monne wrote:
> > The HVM pirq feature allows routing interrupts from both physical and emulated
> > devices over event channels, this was done a performance improvement.  However
> > its usage is fully undocumented, and the only reference implementation is in
> > Linux.  It defeats the purpose of local APIC hardware virtualization, because
> > when using it interrupts avoid the usage of the local APIC altogether.
> 
> So without sufficient APIC acceleration, isn't this arranging for degraded
> performance then? IOW should the new default perhaps be dependent on the
> degree of APIC acceleration?

Maybe, I certainly have no figures, but given the feature is not
working as expected I don't think we should block disabling it on
performance reasons.  Reliability should always be first to
performance.

> > It has also been reported to not work properly with certain devices, at least
> > when using some AMD GPUs Linux attempts to route interrupts over event
> > channels, but Xen doesn't correctly detect such routing, which leads to the
> > hypervisor complaining with:
> > 
> > (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
> > 
> > When MSIs are attempted to be routed over event channels the entry delivery
> > mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
> > inject the interrupt following the native MSI path, and the ExtINT delivery
> > mode is not supported.
> 
> Shouldn't this be properly addressed nevertheless?

There's no documentation at all about how the HVM PIRQ interface, so
every time I had to deal with it I had to guess and reverse engineer
how it's supposed to work.

> The way it's described
> it sounds as if MSI wouldn't work at all this way; I can't spot why the
> issue would only be "with certain devices". Yet that in turn doesn't look
> to be very likely - pass-through use cases, in particular SR-IOV ones,
> would certainly have noticed.

I think it has to do with when/how the MSI is updated.  I can't repro
myself, which makes fixing even more complicated.

TBH, I think the feature is simply broken, and I don't feel like
spending more time fixing it.  The fact that it was added in the first
place, and enabled by default was IMO a mistake.

If someone is willing to fix the issue, I'm fine with that, but I
certainly don't want to spend more time fixing issues for an
undocumented feature, the more that going forward such feature is
likely to be even less relevant with hardware APIC virtualization
being more widely available.

FWIW, this patch has an issue in libxl with PV guests, so will need to
send v2.

Thanks, Roger.

