Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180EA26DD3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 09:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881195.1291318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfEjq-0002xi-1m; Tue, 04 Feb 2025 08:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881195.1291318; Tue, 04 Feb 2025 08:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfEjp-0002wF-VL; Tue, 04 Feb 2025 08:56:57 +0000
Received: by outflank-mailman (input) for mailman id 881195;
 Tue, 04 Feb 2025 08:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNR/=U3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tfEjo-0002w7-MM
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 08:56:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb3e1b7d-e2d5-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 09:56:54 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38dada77686so208726f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 00:56:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff968sm888019166b.111.2025.02.04.00.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 00:56:53 -0800 (PST)
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
X-Inumbo-ID: fb3e1b7d-e2d5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738659414; x=1739264214; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZcg5bPXjrYs8q8+fRCLDx9NwIncphf0Zlgjxgh0gT8=;
        b=tILEzyO8Ky0hqnwzJmEwNBvzGRIbgmu4tmfwmTxzcf9Fe+GM+iTW2ZvSxFy27X0jJF
         8cg0GDyiesN7Kv0MFi6X6z6m7/XJyYb+EaWH9abfwn+8qnsql0aNA0Tkrr3g2monoYMP
         pKHTlVv7DP8fsYy2fPQEUL89eSkuWsl5qQzXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659414; x=1739264214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZcg5bPXjrYs8q8+fRCLDx9NwIncphf0Zlgjxgh0gT8=;
        b=aHoIpyY3Kc9ZEYVZ18Yd0EiiBavDnZYnqMVKaYC9EM9uq6UTVTBN00YWeYpEw+RRnt
         GHsUfv2EZ4n0C6US2dKGgIWOqiHyAue1phc/IlsZyHvGA1sEks7ypUEYvsuuZSKuQYx8
         pc/udQwkuW9NKCTNFlFzI0qBYyar/BRTRQZxZgjcXoC3i7xHx/n4Xac323NXxMnXe16x
         Az78Bu53I+aIXzQc0aj9g6RRyUh9rBBQTiX6ZobxacNO/OLT/D13wdi9ejzKsA4YMHKJ
         jTIzLlrBDxbgulL218FvmTXQd3ZVVEIwM5ZOeevJbIUKOxnIihOojpO8I2YHYUggtiwV
         qCrw==
X-Forwarded-Encrypted: i=1; AJvYcCUGsQAC07xxWPf83/7gM8dqItYpUxNSrt0DuK3oTZNa3MLK8TRcN0DsqZjD88r1Ye5r3D+qroqudis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXFhSEobuSnnJPRBo+nEMhLwbn3sR6RDHPa1oPHCB/lSK0CouF
	LnBxCQT9MCdA6hVHzoUOQTGF8c3LOoswkEgeDRTWp+wmTg/iiwkJxiig3iW+Efo=
X-Gm-Gg: ASbGnct3Q/QKdUFkHFJZE0PU0P/NBElGO2aktsB3S8VhtppxBZXjwoEXwnihlOUmUz8
	JlkIrgYPJIh8ZSVPL1724z9/R5DYEOYFe5mIAaK8S1CpLK3MeInS785/egrUy6yH3Ka/f+X5fjL
	HIBCubOVTUwrRp40eMMzHMng0/0l8vUZnx/pGlLL+u1s0URw596JB5STPky6i/NiuJ/RN5gfflp
	8J2Y7QEbitOi3F4sp0Qj3CPYMJZupGcTtl1RE/49ZVdvlbvWVQqreee2JLDgUonoKIstzsyejye
	ZtvGIZ7gN6tkEb2Mj2uu
X-Google-Smtp-Source: AGHT+IF8OVp1wrlh3puf6UnVxBRB9f9yDIeqt3K2BRDXjSv8v5JpvZ0h6u6GK2iGLbyr6z5lMXf1TQ==
X-Received: by 2002:a05:6000:1fac:b0:38d:af14:cb1 with SMTP id ffacd0b85a97d-38daf140ef5mr636086f8f.54.1738659413657;
        Tue, 04 Feb 2025 00:56:53 -0800 (PST)
Date: Tue, 4 Feb 2025 09:56:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 for-4.20? 6/6] PCI: drop pci_segments_init()
Message-ID: <Z6HWVDP3lL0-Y38T@macbook.local>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>
 <Z6D6c69hJrxUdnJG@macbook.local>
 <8b0d0446-04d9-4aab-8ede-d12f3442ac1b@suse.com>
 <afaff8bf-41c5-4c80-a24d-3ce748b52a6a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afaff8bf-41c5-4c80-a24d-3ce748b52a6a@suse.com>

On Tue, Feb 04, 2025 at 08:51:10AM +0100, Jan Beulich wrote:
> On 04.02.2025 08:45, Jan Beulich wrote:
> > On 03.02.2025 18:18, Roger Pau Monné wrote:
> >> On Mon, Feb 03, 2025 at 05:27:24PM +0100, Jan Beulich wrote:
> >>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> >>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> >>> @@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
> >>>  {
> >>>      bool valid = true;
> >>>  
> >>> +    if ( pci_add_segment(0) )
> >>> +        panic("Could not initialize PCI segment 0\n");
> >>
> >> Do you still need the pci_add_segment() call here?
> >>
> >> pci_add_device() will already add the segments as required, and
> >> acpi_parse_mcfg() does also add the segments described in the MCFG.
> > 
> > Well, in principle you're right. It's more the action in case of
> > failure that makes me want to keep it: We won't fare very well on
> > about every system if we can't register segment 0.

pci_add_segment() should only fail due to being out of memory, and I'm
quite sure if pci_add_segment() was to fail here due to out of memory
issues Xen won't be able to complete booting anyway.

Note the usage of "should only fail", as it's possible for
radix_tree_insert() to return -EEXIST, but that shouldn't be possible
given alloc_pseg() checks whether the segment is already added.

> Thinking about it: Your question may be more applicable on Arm, as I'm
> entirely uncertain whether there segment 0 is always going to be needed.
> I could well imagine system designers deliberately putting all the
> devices elsewhere. Segment 0 always being in use on x86 is more a
> heritage thing, after all.

I guess I would leave that one to the Arm maintainers, but from my
knowledge I got the impression is fairly common for Arm to have
multiple segments, not sure whether it's also common to start at
segment 0.

I'm not strongly opposed to leaving the pci_add_segment(0) call on
x86, but I would recommend prepending a small comment to note adding
the segment is not strictly required; it's just done for better error
reporting, as other callers that add PCI segments might silently
ignore the failure to add segment 0.

An unrelated question: looking at MCFG handling I've noticed that
calling PHYSDEVOP_pci_mmcfg_reserved doesn't seem to result in the
segment being added.  Is it on purpose that pci_mmcfg_reserved()
doesn't attempt to allocate the hardware domain discovered segment?

Thanks, Roger.

