Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C7597BA3D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800245.1210174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqrBr-0007Wy-10; Wed, 18 Sep 2024 09:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800245.1210174; Wed, 18 Sep 2024 09:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqrBq-0007US-Ti; Wed, 18 Sep 2024 09:41:38 +0000
Received: by outflank-mailman (input) for mailman id 800245;
 Wed, 18 Sep 2024 09:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEL5=QQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sqrBp-0007UM-Cx
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:41:37 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31d33048-75a2-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 11:41:35 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d3e662791so377319266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 02:41:35 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb497adsm4649331a12.14.2024.09.18.02.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 02:41:33 -0700 (PDT)
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
X-Inumbo-ID: 31d33048-75a2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726652495; x=1727257295; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YO3cDQq39aMezn7Ys3MsC12Kfa6QFXtNUWY5ggJ4Crk=;
        b=sIonn+wIQ/lQbODu+mvU01YOzy3HH0LwwyvBd7dKVQoZa1DhAzH8ND89t5iFVaFAgS
         4N/QRg3PYmP0NMkiD7jJRxHUVxYFOHTBzIMLmhn+7NCBd0JUROIu889eO0QbCVKoexOe
         yYrZ6sMlYYlMLzy6JSOPkj/yK4X1zzBXx9W1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726652495; x=1727257295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YO3cDQq39aMezn7Ys3MsC12Kfa6QFXtNUWY5ggJ4Crk=;
        b=FliGeqyLaSi1UpQ1ynILjOrYhj+mxf4+DbDYJ5LnAhqe4M+9w/85httnVrJwNSMnZi
         AnzYe428UA3Vi2HAcA+pKavFMBIsuXY4ShsE3de6OA/XkSX0F5n+6gXFl0VTHU0ZmRCD
         ol79xdBHzXhcqkhcgAGZzZfyqCEgWXpvwp1ejCDBMVgxsqczYKetTwYw9RX+b4029J8Q
         ndYqhZ47OJ8Usy6YAKMwyg3vjaTqMelOl0Ik95xipeP1scmgoUYmStrKCWlcSSvdtcDy
         7X1s+hYlQhZGQYgsttaQVN0PzoPz5CIFpecPBulspzDXtdQhtO6RkTzzy2bWJd5aZCeO
         goyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNLJ23WO55p8wDZQel8aizGMAngnsmLrpgatreEn0FUV/NCqcGVRAEgxtu/9L/n4HVHtXReKa4A/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9U0v9dj8IkruduErUg3SHrRx4hXVkd0uMJuALCV3TLduNZ7cN
	8Ukd3ZIcaHYziAtZmFsoThg7t+3pUuSd4y6G7wPf8OR1LRngdvS2hZfi4gHGDQk=
X-Google-Smtp-Source: AGHT+IENxIVBPkcqxMESmoUT2ik/awqzJN+t17fu5L56pd9Cp1NC9e91He9swhQ22bUvkna/uDZX4w==
X-Received: by 2002:a05:6402:e9a:b0:5c4:14ff:8a7 with SMTP id 4fb4d7f45d1cf-5c41e18bd36mr26946837a12.14.1726652494384;
        Wed, 18 Sep 2024 02:41:34 -0700 (PDT)
Date: Wed, 18 Sep 2024 11:41:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
Message-ID: <ZuqgTKqaUDWC_I-u@macbook.local>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>

On Wed, Sep 18, 2024 at 12:29:39PM +0300, Sergiy Kibrik wrote:
> 16.09.24 22:57, Stefano Stabellini:
> > On Mon, 16 Sep 2024, Roger Pau Monné wrote:
> > > On Mon, Sep 16, 2024 at 09:37:57AM +0300, Sergiy Kibrik wrote:
> > > > Introduce config option X86_PMTIMER so that pmtimer driver can be disabled on
> > > > systems that don't need it.
> > > 
> > > Same comment as in the VGA patch, you need to handle the user passing
> > > X86_EMU_PM.  It's not OK to just ignore the flag if the hypervisor is
> > > built without ACPI PM timer support.
> > 
> > I also think that the flag should not be ignored. I think that Xen
> > should return error if a user is passing a domain feature not supported
> > by a particular version of the Xen build. I don't think that libxl needs
> > to be changed as part of this patch necessarily.
> 
> It looks like toolstack always leaves X86_EMU_PM bit enabled, so that part
> may also require changes.

I think you will be unable to create HVM guests, but that's kind of
expected if ACPI PM emulation is removed from the hypervisor (it won't
be an HVM guest anymore if it doesn't have ACPI PM).

PVH guest don't set X86_EMU_PM so you should be able to create those
fine.

Thanks, Roger.

