Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C5B0DFD4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 17:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052821.1421608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEWR-0006pX-OQ; Tue, 22 Jul 2025 15:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052821.1421608; Tue, 22 Jul 2025 15:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEWR-0006nC-LC; Tue, 22 Jul 2025 15:03:15 +0000
Received: by outflank-mailman (input) for mailman id 1052821;
 Tue, 22 Jul 2025 15:03:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D4NL=2D=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ueEWQ-0006n6-Sh
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 15:03:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id facbc324-670c-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 17:03:09 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-455b002833bso22209235e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 08:03:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b61ca2bb96sm13765546f8f.30.2025.07.22.08.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 08:02:59 -0700 (PDT)
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
X-Inumbo-ID: facbc324-670c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753196589; x=1753801389; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKPV93cZxEbv1wAf5E5HZMfoaN0JxE1EwUko6LnYg2s=;
        b=Gkey1nAwvLFxoLnYsLEaGR4x2do/xKwo5qJqYlmjFtFLifW+TcogFnFChSqhTA+fJF
         NsqQqEjDyMqum+IWETgd1BHtRyUjwohGYwxynRrKRFBGYF7OANqVdw33VMJbvQZx8fQ1
         A4mJnbGA0yL7akw1NvyGWli7Eq5iTTWhnYX4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196589; x=1753801389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKPV93cZxEbv1wAf5E5HZMfoaN0JxE1EwUko6LnYg2s=;
        b=Sjx5Tk1KESkXq8+Q/48DgYEqzH137flRjidZTCL4b9rDEbHV2oBRjutBPZw3NHCgTi
         /6i/CS8Bwfmx7QRwiGKJluDSdrorqq8H7QvJkIFbJ4tE7T2IcVOMkiSzS84/yJY6Ig61
         vMBEJzefSlzi6GnjeBXTAYrNSiBeg6dvDikU2flxOxUySHz0n2sylOCZP2uzxy3sFHRg
         DSnxp+3rIh0uSUVEOGSioZ+bxbmqpDrsoKo5ujwgFJ01TYpuA69AW/GpIQdRV1yQWTI6
         1UbGIKGk9KgTW2yTKIotGu7ViriEwVFNJtXdrcL9G1zLrseNmaIya8ks8vgg0dew+hVD
         OWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1MVpxWPq/DCEX40NSPFA0g3OzHpKzZr00alrWh+9SdhHXX5YMGUU1Wil97QClzlTikH8UiyuvCIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywv1JtAn70Leqvfd6Ak/Ypcla8kjnMfIFSQ4m5zsYigxa+1Jwqb
	5lyLsLY8SZLiY3TZKleo7DN645NSkhA2MlLoUMVkyhzRokfqrUE9z8XuIf5PKmUeTeA=
X-Gm-Gg: ASbGnctH8D2ux1s4J6lSBsRpzJCgovTKyLH0k2VLJI5/aGehwO2ODNwzaI3C0QzLl9z
	s1E99JlW2nFjsfbaVy7uUdsTjRiolUtX+IWzNbkHHspGbdaGy+kl1ZV1JIg8AcJMKNEmnPMk3Cs
	PZwFVFwCT1BNYzoZ+XYk5QCspHdfBOXh6z0u0q/I1omU1EEWQozIW8vG41EKA0hCMkapkHoUYV6
	vqAdWiou0tdtDp9/GBnkei/46fUMlna1PCM6g+afj3AgFJQo7bRZDB7w2PxtoiRF221VokO4+TN
	s+t9aqu54UajL4eJrmkvn3gTzuDF0oVMGHrxaBGZQOMAk6wH4nol/7TfDURr2kNa0JfLKPjtmwv
	FVC3vwC0SqJl6sBrUGPVJs7Fy/TLOcjWgEpPGWi8TznEKG21y6IMEFUaiyGEni5Nf8A==
X-Google-Smtp-Source: AGHT+IEzS3gGK1U2r2g/HlieQDyimH2GJj1eGIZdKYL5+B6nHW6G5g+ABiLtlbucTnr6eX/+nAB8hg==
X-Received: by 2002:a5d:5d85:0:b0:3a5:39a8:199c with SMTP id ffacd0b85a97d-3b60dd88792mr21189244f8f.53.1753196580372;
        Tue, 22 Jul 2025 08:03:00 -0700 (PDT)
Date: Tue, 22 Jul 2025 17:02:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/livepatch: fixup relocations to replaced symbols
Message-ID: <aH-oIqnKwEv3p6Hl@macbook.local>
References: <20250716160007.92461-1-roger.pau@citrix.com>
 <4bffb6b1-ebe7-444f-905d-092e69a2d8ef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bffb6b1-ebe7-444f-905d-092e69a2d8ef@suse.com>

On Wed, Jul 16, 2025 at 06:31:03PM +0200, Jan Beulich wrote:
> On 16.07.2025 18:00, Roger Pau Monne wrote:
> > In a livepatch payload relocations will refer to included functions.  If
> > that function happens to be a replacement for an existing Xen function, the
> > relocations on the livepatch payload will use the newly introduced symbol,
> > rather than the old one.  This is usually fine, but if the result of the
> > relocation is stored for later use (for example in the domain struct),
> > usages of this address will lead to a page-fault once the livepatch is
> > reverted.
> > 
> > Implement a second pass over relocations once the list of replaced
> > functions has been loaded, and fixup any references to replaced functions
> > to use the old symbol address instead of the new one.  There are some
> > sections that must be special cased to continue using the new symbol
> > address, as those instances must reference the newly added livepatch
> > content (for example the alternative patch sites).
> 
> This is what I was fearing, when you first mentioned the problem (and the
> plan) to me. What I don't see is why you do your fixing up regardless of
> relocation type. Relative relocations within the payload ought to be fine
> to not override? At which point some of the special casing may already no
> longer be necessary.
> 
> (Later) Except that if code uses PC-relative addressing to determine a
> pointer to store into some struct, that'll appear as a relative relocation
> type, too. But then you may have a bigger problem: When referencing and
> referenced code are in the same section and in the same translation unit,
> the assembler could avoid emitting a relocation altogether. You would see
> nothing to fix up ...

The only way for the referencing and referenced code to be in the same
function would be for the function to reference itself, which should
be quite rare?  I don't recall seeing any code in Xen where a function
stores a pointer to itself.

Otherwise each function is in a separate section, and hence references
to functions should always use a relocation.

Thanks, Roger.

