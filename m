Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89841A6A0FA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 09:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921442.1325288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvB3A-0006Ow-8k; Thu, 20 Mar 2025 08:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921442.1325288; Thu, 20 Mar 2025 08:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvB3A-0006M4-5w; Thu, 20 Mar 2025 08:14:48 +0000
Received: by outflank-mailman (input) for mailman id 921442;
 Thu, 20 Mar 2025 08:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvB39-0006Ly-Ch
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 08:14:47 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61a87780-0563-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 09:14:44 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso115662166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 01:14:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3147e9bb0sm1111363866b.47.2025.03.20.01.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 01:14:43 -0700 (PDT)
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
X-Inumbo-ID: 61a87780-0563-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742458484; x=1743063284; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T83K98I45SKLpJn1+/nHyZAc90DqpRFYQkMcM9cqnRM=;
        b=R/8L7r2rFWvACLM3vn+O2mwWtwDM63NNSfJYTJoc5eUiwRdcwjGPG8BFmUbOV24lJZ
         HojnK+/SjgKFa2h2XLToDYO5ZXthgNTX4p1jroS3/QC4rx/zbeyCLtObusMRcJ72OyR+
         LdDYVeY4kgLxOrtH3gbnbkAgfb5WGGxicfkTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458484; x=1743063284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T83K98I45SKLpJn1+/nHyZAc90DqpRFYQkMcM9cqnRM=;
        b=CRmFnvuTAhTTJPURrGbvntc6ZeCOl6Y41zeZAWywvsn9/SUzyWP75Ig9o+Gki7Qsr5
         0tTQ3+bZLpGE0r8ynbwlsBe6gN+NMxsA9QUEPDvIWHT6NX1wFmbZojo9zy/LNJQnBLNF
         fPqaN0z+zwDIpxNW63V4VrDnFD5F4JENDJbE/Um85P0pzTj4Xx7XamsJ1n96b1KH4eKE
         N703JEq6q/lRMr2uRxH8gI9gBDj7nhX2V9sQ7h/sOn8AcqlciNJ5brpWXleQ9DA8ZKds
         Hpa/YzzfV/wdnyTNxOSINh3vaazm/Nd/At5rzLo3cztkng44V1Tvnp2/ZFOcTCil4rC+
         SNTA==
X-Forwarded-Encrypted: i=1; AJvYcCWLY0fqqh6SFMpCYNqOzCa0v0FvTDRKtUJLHjWXKo4RyapveWvK3Wo8atFnOaMvmcgVU+VOQ4iveZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7wlelvzbPWCEBu+v35sGnrqD1xiJD8mAJpbnU1rCFo3zcfDjC
	oGwDWzdbUlrIx51kWR7ALy9xjNFiwpBGQmpgke5wS/CDBDso31Sie7lxPvYxHaw=
X-Gm-Gg: ASbGncvB3eN0GkTgE0TCfQ/Rnpd4RCgPBrVtqOedE5kxeqK3YU4ZAs4Klkwuuhm7ons
	6Bxzp8idRZD3B9oMe0RJv1VZIhiUbf2sriraz5ZZuajCTGO6xonIobXIwmFNJqFK33teEIYMD90
	BqhNX6mF0/FYMk7GIQGLDUxuo8ABSJOkMA9vCnnqBc7jbKMpLBSpWQf8tnGPCyeDJhMkJw6n5/Y
	bjhK43PLSQOSZBZjUC5s5tJyqHcn91PqpVW8wyiV3cDmCbR158gKAK7Lgsu2aqtoURw1wDOerqb
	wbpB1WOvPUJ87uOvqpZl3sbnE0U/KUa/Dc/BBM9Z+n2yf8yZOxHImXLm5kKxpRZQyA==
X-Google-Smtp-Source: AGHT+IH/VPP0dxcrOjD6kH5A0ePWy3DUPNT2L0dig/5bdxBFnp5hveWVYyGJzyr5cZXplxBGsQngSg==
X-Received: by 2002:a17:907:3d86:b0:ac2:7fd5:774 with SMTP id a640c23a62f3a-ac3b7fc2d52mr527581766b.56.1742458484177;
        Thu, 20 Mar 2025 01:14:44 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:14:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
Message-ID: <Z9vOc5I828aV49rI@macbook.local>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
 <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>

On Wed, Mar 19, 2025 at 11:46:22AM +0100, Jan Beulich wrote:
> On 19.03.2025 11:32, Jan Beulich wrote:
> > On 18.03.2025 18:35, Roger Pau Monne wrote:
> >> Relocations are now applied after having moved the trampoline,
> > 
> > That's two entirely different sets of relocations, isn't it? 

Right, this is the plain .reloc, while the trampoline one is
.trampoline_{rel,seg}

> > What we generate
> > here is what is to be encoded in the PE binary's .reloc section, for the PE
> > loader to process. And for us to then process again once we move Xen back to
> > its linked position (by virtue of leaving physical mode). Therefore what
> > matters here is whether these relocations are still carried out while on the
> > page tables to boot loader created, or when already on page tables we control.
> > In the former case any relocation to a non-writable section would be liable
> > to fault when applied.
> 
> And yes - both calls to efi_arch_relocate_image() are ahead of switching page
> tables. The first call is benign - no writes occur there. The second call
> would cause #PF though for any relocs applied to .text or .rodata or .init.text
> or whatever else is non-writable.

I wonder how this worked then, as I've tested with the xen.efi smoke
test in gitlab CI.  Maybe ovmf doesn't acknowledge the RX sections and
unconditionally sets all mappings as writable?

Thanks, Roger.

