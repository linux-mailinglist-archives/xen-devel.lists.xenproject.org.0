Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB8BA71D32
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 18:35:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928183.1330931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txUfE-0002s9-2T; Wed, 26 Mar 2025 17:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928183.1330931; Wed, 26 Mar 2025 17:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txUfD-0002pw-VN; Wed, 26 Mar 2025 17:35:39 +0000
Received: by outflank-mailman (input) for mailman id 928183;
 Wed, 26 Mar 2025 17:35:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mf06=WN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txUfC-0002po-3K
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 17:35:38 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba06f07f-0a68-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 18:35:36 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so895415e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 10:35:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3997f9b3dd5sm17343839f8f.45.2025.03.26.10.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 10:35:35 -0700 (PDT)
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
X-Inumbo-ID: ba06f07f-0a68-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743010536; x=1743615336; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oG25p543/2ftOJOEOYaggVJ63ukTSMfAAAdVzulfvKU=;
        b=pf/HuHSPiLY2jbasqDhdGk/b1PgnQKxeKbZiIqo86xmFe9LKxoruHh7xrfWN4fr/Ii
         qVNmbZHw5nKSmkhjEfzt9OcYoZYH1VR6SOIZC2YQeqmMx7+Kqoi2u8ndZEAbnbjAa+h+
         8zbWbu7hxXWXiT120u61Fhh9UjLzS4ugFoZ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010536; x=1743615336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oG25p543/2ftOJOEOYaggVJ63ukTSMfAAAdVzulfvKU=;
        b=Iv9mfnU8MButQ6eUtOyXKdg8ASkNSh49oGAYghucCYAe9iwTnTb6uyyEsVuHGyNvFQ
         0gaDkvNvBkdgmReckxGu47vHtYXKxes4/W+5J+KPlAe7FwMZ7vy6GfzmNpDMOIy9/vn2
         2Vlkuah7/FhaoNZVJW+hUI6w8UgQIP3qUZRkUfJmA1LXfqCzIClrkYzyZhXP+9xue2Rg
         cBhUUdcnPhafUekkKlNMr69ZT+aDtgmSRgFzJiGaBmBp4Fe4+SgAw9jUc+TKsQWOS/1C
         Z+mWZPVuCI5iA4hwo1ZAIBSTYjXRgXyY1mEWFFemRwwnIkgxMXYGKJnWkB2OJmz3SqYR
         1pNA==
X-Forwarded-Encrypted: i=1; AJvYcCXec3wxIFakwxcf4yDAL6YGdB08Pm+eRPf8dzCrS+948i/st7dbgqAbjIRo59mqwearyWrYCqeUnq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwquYzFqfWa0zynDdfFq88sRaISbaQqmLqt+8oBaflMv2+Vt9kX
	djMK4WPP8FrdEbD8PfOpuZmZQdXKQlWwcESPqeYdNqy8KVMCuFYnApuWrjC576s=
X-Gm-Gg: ASbGncsTJ2x6PsMxHEosYPIIc/lmEP8bgKMzrKboPdnxSbRKUDHGnCKSEaJ3r1N8hNP
	vXsqIe437OmSyLWpazr+Xw7wreh6fQLJ/vtH9FbfDNEb9FUs5fyXnBP3EfbLL2IrxVaxjHF1zni
	ygSionsyC498mXLF64mqzjL/m76roVTHJEDR3Z1eJ+OFLGjDkR3MaBzxTuIrDaeYU399S78TgU7
	bL1Z2d+pOemzy+wStYyIDOEBFxPDLszBx+kGrobaAj7KgpjpMXbBfWnz1ApNlMXLprAGC33g2fs
	dPgQBvewy82gvXabHWRK0fVRoyp8j0dtP7FTZKmwQ9w6aC6ZXA==
X-Google-Smtp-Source: AGHT+IFsdsKlY2ttS9T7OdjEjxAY55Np+3rZNue7Ym54PW0WTeaNUWLZ8dK2NPK3Rntpx7mORwz7yw==
X-Received: by 2002:a05:6000:40ce:b0:391:2dea:c9a5 with SMTP id ffacd0b85a97d-39ad175c444mr233777f8f.20.1743010535620;
        Wed, 26 Mar 2025 10:35:35 -0700 (PDT)
Date: Wed, 26 Mar 2025 18:35:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools: Remove support for qemu-trad's battery reporting
Message-ID: <Z-Q65qHssG4GTmXR@macbook.local>
References: <20250325174110.467-1-alejandro.vallejo@cloud.com>
 <Z-QIOJax7of-y79f@mail-itl>
 <D8QBAOE8U497.UAKETQOU3D2Y@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8QBAOE8U497.UAKETQOU3D2Y@cloud.com>

On Wed, Mar 26, 2025 at 03:44:05PM +0000, Alejandro Vallejo wrote:
> On Wed Mar 26, 2025 at 1:59 PM GMT, Marek Marczykowski-Górecki wrote:
> > On Tue, Mar 25, 2025 at 05:41:10PM +0000, Alejandro Vallejo wrote:
> > > The way this undocumented feature works is via qemu-trad (who nobody
> > > uses anymore), by intercepting 3 magic PIOs. 0x88 is one of them, and
> > > it's probed by hvmloader as a means of detecting support for this (so,
> > > on qemu-upstream this check always fails). If hvmloader detects the
> > > feature, it appends an SSDT with AML inherited from some laptop ~20y
> > > ago. QEMU then communicates with a userspace daemon (xenpmd) via an
> > > undocumented xenstore key ("refreshbatterystatus") in order to report
> > > battery levels.
> > > 
> > > Seeing how no one uses, mantains or cares about qemu-trad anymore, rip
> > > it all out. The hvmloader check, the SSDT generation logic and xenpmd.
> >
> > Oh, I didn't know something like this existed!
> 
> In retrospect, it might've been for the best. I really dislike the way it's put
> together. Using xenstore feels really pointless.
> 
> > We needed a feature like this, and solved it via extra kernel module +
> > PV-like interface to feed it with data from dom0:
> > https://github.com/QubesOS/qubes-dummy-psu/
> 
> I did wonder (after learning how this all works) how you guys did it without
> qemu-trad. I guess that explains it. FWIW, it's not hard to do this properly on
> QEMU upstream. We could create a new field under a BAR of the Xen platform
> device and instruct some (much, much, much simpler) AML to read the battery
> level from there. Then QEMU can ask the real system what the battery level is
> and Bob's your uncle.

I think some OSes (Linux? Possibly Windows?) like to use the xenpci
device BAR to put the grant table and as scratch space to map grants,
so we need to be careful with putting real registers there, as older
guests might not know about them.

Also that would mean adding QEMU (even if just for a limited usage) if
we want the feature for PVH guests.

It might be safer to place those registers in a physmap reserved
region, but not correlated with any device BAR.  Otherwise if the
guest decides to turn memory decoding off (which it shouldn't do in
the first place), the related AML will stop working properly.

I wonder if we could find a way to do this nicely from ACPI (so not
using a side band PV interface) and not have to involve QEMU.

Thanks, Roger.

