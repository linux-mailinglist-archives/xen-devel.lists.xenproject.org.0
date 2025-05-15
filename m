Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0AAB8463
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985227.1371171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFWCu-0000mQ-Sa; Thu, 15 May 2025 10:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985227.1371171; Thu, 15 May 2025 10:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFWCu-0000kl-Pm; Thu, 15 May 2025 10:52:56 +0000
Received: by outflank-mailman (input) for mailman id 985227;
 Thu, 15 May 2025 10:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFWCt-0000kf-48
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:52:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1006885-317a-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 12:52:54 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso7964295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:52:54 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442f39790afsm67884525e9.33.2025.05.15.03.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:52:53 -0700 (PDT)
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
X-Inumbo-ID: c1006885-317a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747306374; x=1747911174; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Bjpx8xeuIKdKe0E9Jue5bQGOeyoMaCdb+CniORXdxA=;
        b=UFeADO0cTrf0Cn5U0cPPtl8rWFiwdeDzWrRZT6o2/DWdpLxrSAozQQgRB8ee2//SWk
         q3e31ltGSqwd1qCxy3ag+di1q7DowDhhSNWPfK4FNFo1Mwm2NnsVjtgyfbM1bc6arYEt
         c3iE6WBA1Lx8jR+ufrmbjL2LDqndAZ6H+tVH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747306374; x=1747911174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Bjpx8xeuIKdKe0E9Jue5bQGOeyoMaCdb+CniORXdxA=;
        b=V4CYmj0A7Kx2EkiisTWwmVIp88cyVdy4b+VvLMe6qE51NpwWo3boLlunJVn/TBBYga
         9CrMZkDx7nKmIkQTUCNkcV7j8z1Csz1HBNsG8GAKUW5hacoDp/qIAfyFZuf4cSVDY3p1
         yn2ac2KjUj7gLEmnQYI/CcI1dn8aHPENutEAgAtAi9dGcBupKwHnjHYAs77UzRQ87GdO
         BNBz9zLvBXgkTi4rAQcaYATC/3exKjrA7+diZILq1ASS/V56oqTLQ7MGamSe4y2CdzQj
         JdEcaRWW3e8DhiehpEyOwBGQdexK72Cy7R1Yz+nsCmquDTs4lXjqA3nXfeVVVUND+OEX
         cB+w==
X-Gm-Message-State: AOJu0YyLWbzPPjzH/nPOPqyKkGZ2DynHjEYkwSJ0aslHpKS8kDEsa9J9
	ntw/kb9vYvI5bdfzL0ObFY8kYuso+ZwtxbQUumgqC5B2ckEMrbJAT+kYauOu1r0=
X-Gm-Gg: ASbGncsp0xd1XDdo2oIEaNSy6U/19gROYdiBGbe2DrddWMLDdSH4m70rXjtKkxbPAY9
	JSa9RXb3BhcWPH2UC+ZQbawYW2sGereIukG97VGUSSTRgHPZzfKq7lUh9ymI4Xosj6QTOCbu7EC
	EB3oRyPedCsb25sNdLp8pjuX3iy4vjo99NyxDQw8reN627gECuY2U/trcRVytBf8EmuM/Oz4zLQ
	GqS77QZsS/Ce6Gkxkc5w2QIqTJw8cvbBawwLDeI0wNrJ5i/Nc22kReKEa8GP/2R6Q4ntnnVzdwA
	VOXGixxENBkB+dN4JOWrtoKjuVXq+epzdGeqXy3l5ao0beROdQWJmgks
X-Google-Smtp-Source: AGHT+IFoIlvaDZtEjSlz1mEDOFQUxUYAUunagWi6gl1znQsJVyBfETmsffu9wkNRelMux2CT6mEGKA==
X-Received: by 2002:a05:600c:3b02:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-442f20bae1emr59186435e9.7.1747306373780;
        Thu, 15 May 2025 03:52:53 -0700 (PDT)
Date: Thu, 15 May 2025 12:52:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] xen/x86: track dirty pCPU caches for a given vCPU
Message-ID: <aCXHhAdc-Woyzf65@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-10-roger.pau@citrix.com>
 <cecf40ed-9cf2-4e86-aa82-e0c33643868d@citrix.com>
 <aBoGyekf9KZeZCrK@macbook.lan>
 <d9a960ba-9690-4d0c-8b1a-1fa9275bcf22@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9a960ba-9690-4d0c-8b1a-1fa9275bcf22@suse.com>

On Mon, May 12, 2025 at 05:38:07PM +0200, Jan Beulich wrote:
> On 06.05.2025 14:55, Roger Pau Monné wrote:
> > On Tue, May 06, 2025 at 12:16:00PM +0100, Andrew Cooper wrote:
> >> On 06/05/2025 9:31 am, Roger Pau Monne wrote:
> >>> When a guest is allowed access to cache control operations such tracking
> >>> prevents having to issue a system-wide cache flush, and rather just flush
> >>> the pCPUs where the vCPU has been scheduled since the last flush.
> >>>
> >>> Note that domain-wide flushes accumulate the dirty caches from all the
> >>> vCPUs, but clearing the vCPU masks will require pausing all vCPUs, which
> >>> seems overkill.  Instead leave the vCPU dirty masks as-is, worse case it
> >>> will result in redundant flushes in further calls.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> I'm afraid this doesn't work.
> >>
> >> Unlike TLBs, dirty cacheline can move sideways, e.g. by foreign or grant
> >> mapping, but also naturally because of how cache coherency works.
> > 
> > Does such sideway moving also imply that local WB{NO,}INVD on native
> > could be equally bogus?
> > 
> > According to the SDM, cache lines can indeed move between processor
> > caches, but the memory controller must always snoop such moves and
> > flush the data to memory:
> > 
> > "Here, the processor with the valid data may pass the data to the
> > other processors without actually writing it to system memory;
> > however, it is the responsibility of the memory controller to snoop
> > this operation and update memory."
> > 
> > So a cache line moving sideways will always be propagated to memory as
> > part of the move, and hence the data in the previous pCPU cache will
> > always hit memory.
> 
> But that's only one of the two aspects of a flush. The other is to ensure
> respective data isn't in any (covered) cache anymore. IOW dirty-ness (as
> the title has it) isn't a criteria, unless of course you mean "dirty" in
> a sense different from what it means in the cache coherency model.

Given the direct map, and the fact that the CPU can speculatively load
entries in the cache, I'm not sure there's much Xen can effectively do
ATM to ensure a certain cache line it's not in any cache anymore.

It would possibly get better if/when the direct map is removed, but
even then Xen (or dom0) might map guest memory for emulation or IO
purposes.  Then Xen/dom0 would need to issue a wbinvd after unmapping
the memory, to ensure the cache is clean in case a vCPU from a domain
is scheduled there.

IMO being realistic it is very unlikely for Xen to be able to ensure
that after a guest wbinvd there are no guest owned cache lines in any
CPU cache, even if such wbinvd is propagated to all host CPUs.

Thanks, Roger.

