Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA838C3D7E
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 10:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720757.1123666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6RIw-0006M5-96; Mon, 13 May 2024 08:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720757.1123666; Mon, 13 May 2024 08:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6RIw-0006JB-5A; Mon, 13 May 2024 08:45:06 +0000
Received: by outflank-mailman (input) for mailman id 720757;
 Mon, 13 May 2024 08:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6RIu-0006J5-Sq
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 08:45:04 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16aefc01-1105-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 10:45:03 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-792b8bf806fso367419385a.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 01:45:03 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f17960csm41294326d6.25.2024.05.13.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 01:45:01 -0700 (PDT)
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
X-Inumbo-ID: 16aefc01-1105-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715589902; x=1716194702; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0s0EUv5cog85v5AgtMuY3qUfBWjAdPaBPvTqMQMicw=;
        b=cSxHxxX68/0l3nocPI1YXpSjEWKdUd5N4MBHxYj9CPvq+jYsqjPOdclWxiyqlUoIzP
         0+WcicYWBirw+/+2xTstnyF56Se1cfoufzfjvuIH15gLi1o/JJIw9EHoCpHCOeGxd9WG
         PRRcEhtLPGx9lV4FhA4EKJcM+gai1Shkn4cyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715589902; x=1716194702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0s0EUv5cog85v5AgtMuY3qUfBWjAdPaBPvTqMQMicw=;
        b=V7Mwxif2KREm8GYwc5B2tppAk8nQ3OX1jeBYFgGJSlnXnmKGfJ99vXeo7Qg3PMUEC4
         dio12msyalt4DFPayLz4N/pohk0oGZCjcadjDDqpa2InK6PECJfcwEUmNNBdsozCi6v1
         Tt3RRK1mpozlPuQvV0pws8IcfkmBEW62mF4/7xkSOyAheC8enlcRHWXe1TCBHFVgT43n
         YbK5S0FkrjztEesMtYAdXVGNk5AY94zQmNRIn5AMLE553+X0z1bA1H/qApXG61gZYpI5
         kPluPCL2cYsAR8YvkvVWGiI2KLtSM185IV87PAekENNoiwh6Bx+SInLsE4DeNF2z2/o8
         91vw==
X-Forwarded-Encrypted: i=1; AJvYcCXaRuBb40ijZujyYlxNNSc2bmKjpyr9upnQz1QeD1+OLPedsNO89y1hTxQoejkccpho+dKQOqM96dlLhhl7Gg5aWcTLawqcuMlCCefbH8Q=
X-Gm-Message-State: AOJu0Yxeu0yHcJvjqNGY3IiDiIthhzliQX2cbv8/uOTAv16fPDnBMjbP
	G+fszl0Fiq7ZMv/MqWZxCNobae4LVFiNNRX4/kYrN4dqFCmrBk4bsxqazPWoAnQ=
X-Google-Smtp-Source: AGHT+IHqJuVytQ/+x1PNmWqL4v4BXle3O3RBSKqX4kVJRaxl9Tpmg+MluGlU+42vBK3g10nFo8jpgg==
X-Received: by 2002:a05:6214:4a8e:b0:6a0:d9fa:9a95 with SMTP id 6a1803df08f44-6a16822df5bmr133301956d6.44.1715589901913;
        Mon, 13 May 2024 01:45:01 -0700 (PDT)
Date: Mon, 13 May 2024 10:44:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZkHTC4RpUSpKj4wf@macbook>
References: <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
 <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
 <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>

On Fri, May 10, 2024 at 09:09:54PM -0700, Elliott Mitchell wrote:
> On Thu, Apr 18, 2024 at 09:33:31PM -0700, Elliott Mitchell wrote:
> > 
> > I suspect this is a case of there is some step which is missing from
> > Xen's IOMMU handling.  Perhaps something which Linux does during an early
> > DMA setup stage, but the current Xen implementation does lazily?
> > Alternatively some flag setting or missing step?
> > 
> > I should be able to do another test approach in a few weeks, but I would
> > love if something could be found sooner.
> 
> Turned out to be disturbingly easy to get the first entry when it
> happened.  Didn't even need `dbench`, it simply showed once the OS was
> fully loaded.  I did get some additional data points.
> 
> Appears this requires an AMD IOMMUv2.  A test system with known
> functioning AMD IOMMUv1 didn't display the issue at all.
> 
> (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr fffffffdf8000000 flags 0x8 I

I would expect the address field to contain more information about the
fault, but I'm not finding any information on the AMD-Vi specification
apart from that it contains the DVA, which makes no sense when the
fault is caused by an interrupt.

> (XEN) DDDD:bb:dd.f root @ 83b5f5 (3 levels) dfn=fffffffdf8000
> (XEN)   L3[1f7] = 0 np

Attempting to print the page table walk for an Interrupt remapping
fault is useless, we should likely avoid that when the I flag is set.

> 
> I find it surprising this required "iommu=debug" to get this level of
> detail.  This amount of output seems more appropriate for "verbose".

"verbose" should also print this information.

> 
> I strongly prefer to provide snippets.  There is a fair bit of output,
> I'm unsure which portion is most pertinent.

I've already voiced my concern that I think what yo uare doing is not
fair.  We are debugging this out of interest, and hence you refusing
to provide all information just hampers our ability to debug, and
makes us spend more time than required just thinking what snippets we
need to ask for.

I will ask again, what's there in the Xen or the Linux dmesgs that you
are so worried about leaking? Please provide an specific example.

Why do you mask the device SBDF in the above snippet?  I would really
like to understand what's so privacy relevant in a PCI SBDF number.

Does booting with `iommu=no-intremap` lead to any issues being
reported?

Regards, Roger.

