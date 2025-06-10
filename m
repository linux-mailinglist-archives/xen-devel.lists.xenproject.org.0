Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA6AD3F03
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 18:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011122.1389454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1tU-0006Yz-BD; Tue, 10 Jun 2025 16:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011122.1389454; Tue, 10 Jun 2025 16:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1tU-0006XI-8X; Tue, 10 Jun 2025 16:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1011122;
 Tue, 10 Jun 2025 16:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uP1tS-0006XB-5V
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 16:32:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71cc4437-4618-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 18:32:05 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so73749375e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 09:32:05 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-452730d1686sm142476155e9.36.2025.06.10.09.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 09:32:04 -0700 (PDT)
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
X-Inumbo-ID: 71cc4437-4618-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749573124; x=1750177924; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ5zMImTrGbCacpXytEnWARBBlNEOagkT1kAlaMqFY4=;
        b=nmiF7Ppxld4oba7m+/eUSDGPkSaW7vpTxL0iE9MgJ3GuDZ6Z0HvEYxPMiDg7l0WzKu
         aBvnbB6jNzdSPwfkHMAJki35UeChsnplmPr821BApuqUcgEyeIp4aHCxNpgKsfWCDs7r
         2jCeUkox8kkIYgU2ud4HpufypfH8zryMxyXdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573124; x=1750177924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZ5zMImTrGbCacpXytEnWARBBlNEOagkT1kAlaMqFY4=;
        b=e+X+F8n3h5ELm/LP/DqnyEz7cTYz90bybzC5h2raOGQKuKHLskf54X3G8W6piyPrTT
         Hsjr2sMALPE6raTtPjYbvG1i+n55efptAZa1QFt6uOqJBQh9Kur0+7ChnwI3eL73B2+/
         prCkz/9ZcsI64MVh/uddFBZXfTS3yyHbnQszc0xaJXBgO9CMI5vjat9nL8zLxcQntuOv
         ViWrFF3nb5ymjIbdDEUU7Z+X2u04WfhNhpG4BUdLr9aMNOFqEfBuRj2mx3nPyCBXPFSf
         5fxIFRN15Q4/1uZdDo7s8eJn+J7lKSf8c2dieJsmUxuQZoU/bi403MOdw+GpHfJMjkAr
         En+w==
X-Gm-Message-State: AOJu0YyHddGCcm2p9krIU9qE8+dHOXnv0sSVR5kSjT95jQTlqkJhbSYa
	BD15xI7MFge690Z8EWMcNit7ZVVYsP3JU7nQM5Or8sEQrF/cYMx/s2fUDrfDVKdHRww=
X-Gm-Gg: ASbGncvEKUhgdXhnhU97fctAV6/bqK6WOs6h/3gnUe+E5MZFmJPYV3p5Cg/ynoh2TI6
	BXeJLQQoxfDVbDzq3MtwCUXCP/SVG3UJrkUJ25W/uA3MN+/93UVgcH3hnky1oZliduTXMwtysXS
	/75pORGOdOYdayWHRt5RpAGguxip198IK7YIqVRjpAVsIIyaRTWy14nF6//qq5qwf8DHPjaqDm6
	5WcyCGca4OERWsSMHMi0/7RUCs1KFUi/rcj5+Dh65znl0AYS2YHhkZk+7HN/YuYvXAwqXN/2fo0
	c8zTdhCzJsny5a8J6UTNpamo/9/gw63RqB/AlHGYmqo8Jkbm1Wmj1gYZ9CubyDOAx9Vkj0bimCU
	gDi+gVIoOAM2dtH9FwSyt0LYOK7ZbXtgXTbY=
X-Google-Smtp-Source: AGHT+IHzijZoYtpN4xT/77jJRmPlAKHqK8yAzDFu43O5hNNdjctWcc7slU7dkIY5QskBrGQ1aRJJnQ==
X-Received: by 2002:a05:600c:6986:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45320664b3bmr30446655e9.16.1749573124562;
        Tue, 10 Jun 2025 09:32:04 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:32:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: fix build with HAS_PCI
Message-ID: <aEheAyAMMTi87IZS@macbook.local>
References: <20250610142300.197599-1-stewart.hildebrand@amd.com>
 <aEhUe30Hojo8CoeP@macbook.local>
 <aceed733-37d5-4a34-9645-33d7bf27642f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aceed733-37d5-4a34-9645-33d7bf27642f@amd.com>

On Tue, Jun 10, 2025 at 12:16:42PM -0400, Stewart Hildebrand wrote:
> On 6/10/25 11:51, Roger Pau Monné wrote:
> > On Tue, Jun 10, 2025 at 10:22:57AM -0400, Stewart Hildebrand wrote:
> >> In file included from ./include/xen/pci.h:72,
> >>                  from drivers/pci/pci.c:8:
> >> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> >>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
> >>       |                                                  ^~~~~~~~
> >> cc1: all warnings being treated as errors
> >>
> >> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
> >> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > 
> > Sorry, it was my fault.
> 
> No worries, it's pretty hard to catch when it can't be built without
> extra patches.
> 
> > Would it make sense to introduce a Gitlab build that has HAS_PCI
> > enabled?  Or it won't build either without extra patches?
> 
> It requires one extra patch ("xen/arm: pci: introduce PCI_PASSTHROUGH
> Kconfig option"):
> 
> https://lore.kernel.org/xen-devel/20231113222118.825758-1-stewart.hildebrand@amd.com/T/#t
> 
> It has an ack, although it needs a rebase and we would probably want to
> add HAS_VPCI_GUEST_SUPPORT now that upstream has that config too.

I think it would be helpful to be able to do a Gitlab build with
HAS_PCI enabled on ARM, otherwise it's inevitable for build issues to
creep in sadly.

Thanks, Roger.

