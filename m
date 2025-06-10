Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B3AD4043
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 19:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011138.1389475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP2Zn-0004Sp-Q4; Tue, 10 Jun 2025 17:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011138.1389475; Tue, 10 Jun 2025 17:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP2Zn-0004Po-Md; Tue, 10 Jun 2025 17:15:55 +0000
Received: by outflank-mailman (input) for mailman id 1011138;
 Tue, 10 Jun 2025 17:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uP2Zm-0004Pi-E9
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 17:15:54 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bb742bb-461e-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 19:15:45 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2475611f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 10:15:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a532463905sm12957824f8f.92.2025.06.10.10.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 10:15:44 -0700 (PDT)
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
X-Inumbo-ID: 8bb742bb-461e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749575745; x=1750180545; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DiiAb7JJp8lJMcfFcA9s7YnFQ7otp3aPVYVYcuqE0oI=;
        b=qSWj6wY9XtCxRl6RqZWEuBxzsT73Cy0EK4jHytDHUEFXF95qZXlp230Jj7yCkLt21q
         iiy9AhHZ8/XPzeS+CAcWCvzv82e7OrNJvGvJamLmKJHs2Opv7PH4aJwYBZpUa7Q0VDZh
         nPcyY6i1oA7mrBsQCtWHbpgeF4Yj2cU//ZtCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749575745; x=1750180545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DiiAb7JJp8lJMcfFcA9s7YnFQ7otp3aPVYVYcuqE0oI=;
        b=RMzvlQhEEVuj7d1lCygPAZ1fRJA6eHPmJdDQmZ5ttk3OggTLh/pz8DLCDr1Hs9lyrE
         rTxGimecs2rtSY3/y+v5nIKeXRzBRXP6oJnHtp3I0xBcPLGP1EJ0KSiY+hiuVZ3OytSP
         1g7tEGsrRy1UWZ2rEQE5dSQ4hcjdKL2SHXE1oql1TGuMrdxRJIO2gkDOLI4W1J029Cj0
         x0f65shLM2Czm3aDbH36EloMh0foBGAtTmMS0qPlgP7PRhjvN3UjleedNeNfj78ejBQp
         v/FBAYQp3er/PuhHkYeMwED+4zRz6c0lQCB3ex3R3D+6JletKTKn1u84FGsFTIWkhMa5
         joyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDxiaMVkl4lIM7aKlGqN68a/SHpJJnkurHoP5lR0qD/qFnIrhv3fGkefxoM7Cuq8Z+2zH2wfSxpUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmlmNOqlv2+3maFfAkv0AQJekcnFvB5dOPUoAJGKpi+Mh8fYY6
	UX6FdaxOsU0RIij+oKFysZaj0CskXGinbWdoBVbHXAsYxWJ4zt3+LBtiy5NSABY4ikg=
X-Gm-Gg: ASbGncvsCaHLcgDPjhSFx80f8E5XcrAY0TQR8bcglGU2HFpFQMLR1jPLg4ZjxCPiRTz
	w3MYq26nwaclFAFOboE3lDWsT36KYIiOWKMIFtO+N6kEVJnOa6oxwraM3YIdhRtpU3rIAyvQTjk
	qJeeIYlhegQR/ZX5wqFBvuP5K3kaO8dR81TOMLWa1YfgneBPNX0fkjU14ihzYLRbsqM6wwdUYeJ
	IwmBx79HU425Zrfdpt5cm8LioJeeEnxhrjlGztWytx2TGzSBdIx6ltuA2W0p3obszEAhgMscTmQ
	BLbYruT6wRVuhomXQR8z5t/34qRzLhvZHFJF7uAXhNL1zdXW4fcLHXS7vl5Sy+cZbN/GXmI1T8/
	OVvjoAETVdeJOycmWdpENKikvE9nwCA==
X-Google-Smtp-Source: AGHT+IEOBthVeqZ+mdJjlEM0X9jn9qz7Rdl6+dSpwMqw+H/jXQYt9o72kQ3Yr17J04dI3giItxWC/g==
X-Received: by 2002:a05:6000:2313:b0:3a5:2cf3:d6af with SMTP id ffacd0b85a97d-3a5522bf78amr3303794f8f.45.1749575744969;
        Tue, 10 Jun 2025 10:15:44 -0700 (PDT)
Date: Tue, 10 Jun 2025 19:15:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: fix build with HAS_PCI
Message-ID: <aEhoP1dFzDyLsuSR@macbook.local>
References: <20250610142300.197599-1-stewart.hildebrand@amd.com>
 <aEhUe30Hojo8CoeP@macbook.local>
 <aceed733-37d5-4a34-9645-33d7bf27642f@amd.com>
 <aEheAyAMMTi87IZS@macbook.local>
 <57c9c8b6-eb06-4793-871e-9120982097a3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57c9c8b6-eb06-4793-871e-9120982097a3@citrix.com>

On Tue, Jun 10, 2025 at 05:37:41PM +0100, Andrew Cooper wrote:
> On 10/06/2025 5:32 pm, Roger Pau Monné wrote:
> > On Tue, Jun 10, 2025 at 12:16:42PM -0400, Stewart Hildebrand wrote:
> >> On 6/10/25 11:51, Roger Pau Monné wrote:
> >>> On Tue, Jun 10, 2025 at 10:22:57AM -0400, Stewart Hildebrand wrote:
> >>>> In file included from ./include/xen/pci.h:72,
> >>>>                  from drivers/pci/pci.c:8:
> >>>> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> >>>>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
> >>>>       |                                                  ^~~~~~~~
> >>>> cc1: all warnings being treated as errors
> >>>>
> >>>> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
> >>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>> Sorry, it was my fault.
> >> No worries, it's pretty hard to catch when it can't be built without
> >> extra patches.
> >>
> >>> Would it make sense to introduce a Gitlab build that has HAS_PCI
> >>> enabled?  Or it won't build either without extra patches?
> >> It requires one extra patch ("xen/arm: pci: introduce PCI_PASSTHROUGH
> >> Kconfig option"):
> >>
> >> https://lore.kernel.org/xen-devel/20231113222118.825758-1-stewart.hildebrand@amd.com/T/#t
> >>
> >> It has an ack, although it needs a rebase and we would probably want to
> >> add HAS_VPCI_GUEST_SUPPORT now that upstream has that config too.
> > I think it would be helpful to be able to do a Gitlab build with
> > HAS_PCI enabled on ARM, otherwise it's inevitable for build issues to
> > creep in sadly.
> 
> This is what randconfig is for, and randconfig is active for arm64.
> 
> If something is preventing this configuration from being picked, that
> ought to be fixed.

But CONFIG_HAS_PCI is not user-selectable, it's one of those options
that (usually?) gets selected as part of the per-arch Kconfig.

> But, ARM already has a lot (too many) unconditional builds of specific
> feature combinations, and I don't think we want more.

Either it gets added to the default selection of ARM Kconfig options,
or exposed there using a user-selectable option that would then be
picked up by randconfig.

Thanks, Roger.

