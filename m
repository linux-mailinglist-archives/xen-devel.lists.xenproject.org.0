Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B0AA8DAC
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 09:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975886.1363184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqhS-00013A-El; Mon, 05 May 2025 07:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975886.1363184; Mon, 05 May 2025 07:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqhS-00011O-Bj; Mon, 05 May 2025 07:57:18 +0000
Received: by outflank-mailman (input) for mailman id 975886;
 Mon, 05 May 2025 07:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E8Me=XV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uBqhR-00011I-3o
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 07:57:17 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f82b6a2-2986-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 09:57:16 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so1975687f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 00:57:16 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b16f00sm9376659f8f.84.2025.05.05.00.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 00:57:15 -0700 (PDT)
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
X-Inumbo-ID: 8f82b6a2-2986-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746431835; x=1747036635; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SS0XKfa2BGFD92M7JF8I+ODFTaJnsxA4wXeJO2N0DmE=;
        b=nu0JL6rW7uXnvQnZS3QoaxVS44td+8CRrw/tupXFdr7sMcBp1xEY69rqP3Pbn7WXRQ
         acBDPw0b+NsIdOYkfCZKm8s5mFbw40733NAZxlxs4bi58KPptmePb3MQJw5LxTh2HC7g
         XOB3RqE+RuGWH12KZteGVf6rsR816UEqCZ7Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431835; x=1747036635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS0XKfa2BGFD92M7JF8I+ODFTaJnsxA4wXeJO2N0DmE=;
        b=NDeLq096Ez448s7z9RXLhu02InjehpvuLq2MuU6AR8xrL+aKdWP+9Nio917ftZQZ5f
         xws0Z8c3qX3ZFqjjviNCGMHKUPuk7uCv6rN02n+stGyzh65E71+ynN0KN1A8uiQohklI
         pyAY5R4WsLc4TZ1PIxiVXNyMl7PHeHahr1kaLv1nPvPl0oxfuvu6XRJja7qRnU8nrivk
         J18fdbb0Ckzl2xg6tV+4MldTk8p+VXDCjfUihIjqyTZgTz8YCBrQ0hiJctxRUOK+KgzE
         /Vt2OkIzrt9pbuFSyF19PhdTiT3ULAW+9SHJ7VtpgFBYhglelaax3hGVyPBtBAjF7Kj/
         xxMg==
X-Forwarded-Encrypted: i=1; AJvYcCXsulcPUcHjnTgzVOWTuItRpX+PTHPWZosGUbZJOIyeyUYa6lDriVpj2NhXkJr/hhqlqRDeTeczGgM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOQU4xjDC3LebOsA6uqrVHdJ3dvFwEnAQizt7lcjdBunyaIZMr
	aqQl+IbzHD/HprQYHH0UDz9yp4zcKRIfRwM3p+7r47wDxkULZ3Xybo7XJ6F6AWY=
X-Gm-Gg: ASbGncuQVzIzx2QagvOTAyr/+wd2wgspAy45jul0uNBJZmQ5a5ur0yZIRgdcvQTR3eH
	zp6ccmpy+B8wDC97G8KD5j5PbMgZWQkW7ZHtOum6sNiNrhpXJ5H/HLDQ1rURDHVAk1Q6CrS8JZe
	tzjCdPHPm4hp33/UFRUTInsoNy9gezdfdg3wpey+p1F+o8lpAIfu3qgedAEHS9kafbyEjPHCLPH
	fWE866ut22oTQwAsXxGKOB9Pnx1vW9prhv3Syf104OW2/yD3mlAMXkAlIEpsCTAHzqhxYFubQwT
	wpPnLIxGP2UjSFIwqlZ8MfGeeYttdMAaQJSsWNTbRLJfnw==
X-Google-Smtp-Source: AGHT+IEXWUJe30SHxGQ6YXrEAVv1mmhC8ZHAnjwp/t2acmZrTGCcxPvdPGg1OdgZSq8lRn23HO5KdA==
X-Received: by 2002:a05:6000:3113:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-3a099ad1aa7mr10310845f8f.1.1746431835381;
        Mon, 05 May 2025 00:57:15 -0700 (PDT)
Date: Mon, 5 May 2025 09:57:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, agarciav@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aBhvWl6TIAj4P2g3@macbook.lan>
References: <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
 <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop>
 <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com>
 <aBHUJjQk248aLi68@macbook.lan>
 <alpine.DEB.2.22.394.2504301715300.3879245@ubuntu-linux-20-04-desktop>
 <3e7b4b20-0127-4db2-806d-f142547f275a@amd.com>
 <773170d1-d8ba-4ba7-90b0-df0d160d8ba8@suse.com>
 <alpine.DEB.2.22.394.2505020948380.3879245@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2505020948380.3879245@ubuntu-linux-20-04-desktop>

On Fri, May 02, 2025 at 09:49:30AM -0700, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Jan Beulich wrote:
> > On 01.05.2025 15:44, Jason Andryuk wrote:
> > > On 2025-04-30 20:19, Stefano Stabellini wrote:
> > >> On Wed, 30 Apr 2025, Roger Pau Monné wrote:
> > >>> On Wed, Apr 30, 2025 at 08:27:55AM +0200, Jan Beulich wrote:
> > >>>> On 29.04.2025 23:52, Stefano Stabellini wrote:
> > >>>>> On Tue, 29 Apr 2025, Jan Beulich wrote:
> > >>>>>> On 28.04.2025 22:00, Stefano Stabellini wrote:
> > >>>>>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
> > >>>>>>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > 
> > >>>>>>>>> --- a/xen/common/memory.c
> > >>>>>>>>> +++ b/xen/common/memory.c
> > >>>>>>>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> > >>>>>>>>>               rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> > >>>>>>>>>                                           exch.out.extent_order) ?: rc;
> > >>>>>>>>>   
> > >>>>>>>>> -            if ( !paging_mode_translate(d) &&
> > >>>>>>>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
> > >>>>>>>>>                    __copy_mfn_to_guest_offset(exch.out.extent_start,
> > >>>>>>>>>                                               (i << out_chunk_order) + j,
> > >>>>>>>>>                                               mfn) )
> > >>>>>>>>
> > >>>>>>>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
> > >>>>>>>> it?
> > >>>>>>>
> > >>>>>>> One way or another Dom0 PVH needs to know the MFN to pass it to the
> > >>>>>>> co-processor.
> > >>>>>>
> > >>>>>> I see. That's pretty odd, though. I'm then further concerned of the order of
> > >>>>>> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
> > >>>>>> same upper bound. With both CPU and I/O side translation there is, in
> > >>>>>> principle, no reason to permit any kind of contiguity. Of course there's a
> > >>>>>> performance aspect, but that hardly matters in the specific case here. Yet at
> > >>>>>> the same time, once we expose MFNs, contiguity will start mattering as soon
> > >>>>>> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
> > >>>>>> make tightening of the presently lax handling prone to regressions in this
> > >>>>>> new behavior you're introducing. What chunk size does the PSP driver require?
> > >>>>>
> > >>>>> I don't know. The memory returned by XENMEM_exchange is contiguous,
> > >>>>> right? Are you worried that Xen cannot allocate the requested amount of
> > >>>>> memory contiguously?
> > > 
> > > In the case I looked at, it is 8 pages.  The driver defines a ring of 32 
> > > * 1k entries.  I'm not sure if there are other paths or device versions 
> > > where it might differ.
> > 
> > As per this ...
> > 
> > >>>> That would be Dom0's problem then. But really for a translated guest the
> > >>>> exchanged chunks being contiguous shouldn't matter, correctness-wise. That is,
> > >>>> within Xen, rather than failing a request, we could choose to retry using
> > >>>> discontiguous chunks (contiguous only in GFN space). Such an (afaict)
> > >>>> otherwise correct change would break your use case, as it would invalidate the
> > >>>> MFN information passed back. (This fallback approach would similarly apply to
> > >>>> other related mem-ops. It's just that during domain creation the tool stack
> > >>>> has its own fallback, so it may not be of much use right now.)
> > >>>
> > >>> I think the description in the public header needs to be expanded to
> > >>> specify what the XENMEM_exchange does for translated guests, and
> > >>> clearly write down that the underlying MFNs for the exchanged region
> > >>> will be contiguous.  Possibly a new XENMEMF_ flag needs to be added to
> > >>> request contiguous physical memory for the new range.
> > >>>
> > >>> Sadly this also has the side effect of quite likely shattering
> > >>> superpages for dom0 EPT/NPT, which will result in decreased dom0
> > >>> performance.
> > > 
> > > Yes, this appears to happen as memory_exchange seems to always replace 
> > > the pages.  I tested returning the existing MFNs if they are already 
> > > contiguous since that was sufficient for this driver.  It worked, but it 
> > > was messy.  A big loop to copy in the GFN array and check contiguity 
> > > which duplicated much of the real loop.
> > 
> > ... there may not be a need for the output range to be contiguous? In which
> > case - wouldn't a simple "give me the MFN for this GFN" hypercall do? I seem
> > to vaguely recall that we even had one, long ago; it was purged because of
> > it violating the "no MFNs exposed" principle (and because it not having had
> > any use [anymore]). XENMEM_translate_gpfn_list looks like is what I mean;
> > see commit 2d2f7977a052.
> 
> Unfortunately I don't think that would work because I am pretty sure
> that the PSP needs a consecutive range. In other words, I think the
> output needs to be contiguous.

The plan for AMD-SEV support was to place a PSP driver in Xen, and not
let dom0 interact with the PSP directly (or at least that was my
impression from the talks we had about implementing SEV support).

Is what you use from the PSP fully isolated from the functionality
needed by SEV, so that we could still expose the interface you require
to dom0 while letting Xen drive the SEV parts?

Otherwise I think we need an agreement about how to integrate your
usage of the PSP with the SEV work, as having both Xen and dom0
driving the PSP in parallel might not be a wise idea.

Thanks, Roger.

