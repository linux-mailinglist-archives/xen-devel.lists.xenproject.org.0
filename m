Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA046AABDE1
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976882.1363996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCE4P-000560-20; Tue, 06 May 2025 08:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976882.1363996; Tue, 06 May 2025 08:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCE4O-00053r-V3; Tue, 06 May 2025 08:54:32 +0000
Received: by outflank-mailman (input) for mailman id 976882;
 Tue, 06 May 2025 08:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCE4M-00053l-Kn
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:54:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b897d3c9-2a57-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:54:29 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so44676745e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:54:29 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b89cc480sm164539785e9.2.2025.05.06.01.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:54:28 -0700 (PDT)
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
X-Inumbo-ID: b897d3c9-2a57-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746521669; x=1747126469; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+0SajNHqz8FlHrvr6rdfNoWBqxUWnEZs/LJ4gSlGzr0=;
        b=J2a1mw63rnduitq/WHvJP5YOrq43zlaGFmpirhoES1IWn9R8uznLXkLNr7oNvD9PWb
         bdeInbJkGIP8M/K/dtd5LbuoVendlyrxdTcmUWCsJcCIwz6/m38rrBKiwm5k7IuyJB6p
         dIomP7wqRVBCh4yDw+chAe9Y9iWfGP5U8oWOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521669; x=1747126469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0SajNHqz8FlHrvr6rdfNoWBqxUWnEZs/LJ4gSlGzr0=;
        b=bqmLrYUKua5eyIXFHmsKXh+/jQXFipzCqu+t6sTbS6KSUtd7oYMrZjV3MTAPpmVEAG
         uKfbKjL8x4W6p76Rx+nX81+tIrOGncqwPdSXhNOsyc+6ADhi38G+VjPNUvllwxnXjKp6
         b7uFiIdm6kbPDtQ0cSfmWRXwlVEfu6Sm1s332kK1Akn+fuxeGTyrFQ8k2CDxObaeU8En
         lWF1NLD9uBo1wxRfgpthDd1rZ/i9UF/WlGkQjbBvUKjOs8xAc72ji1maS+CmmigHnjIM
         pjvoZnl485Qh8GDZK9hvRUnuSHC32CBUTG81MJNhu7t2rsNB8MFE+0L9cGzrjyTrqEt3
         mFYA==
X-Forwarded-Encrypted: i=1; AJvYcCVuz9MzIeJx93iTQ4Z/sxugI5c2fGHPyVtzf/A0VdlipuvEgKMsEIPCuzFFoxC+Ba3MTRB8ie1I5kA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6MERjMCUUfqdEKBtEhE4DJ3kkFhCMnHGNBDiJ7RjuxYntSsrl
	K7n26XFQWKTUVnfTP3JrBrH/cTPUDmLDzHRujb9Qnky2VM/4A8otQ0/LhtAJnqo=
X-Gm-Gg: ASbGnctYe3D6RwNdOYt+JO+cqo9afh7MdRCOkBlzFXlJMT+1k3xWsqJVFxPXXqeZB2r
	I4eZ9apLo1kPhoHqhDeS2us6a/BXkChp+RazVnnUnVIZS1WmxWVpPufqT6zhf4LbvrVE13dWYnS
	QCJoWwJEQSsROX2oiy6rWW7yMccEE7vDhEGjQZeIzcZZloXO0hNJuOcLw0iRD4hxPboCzFpqbwf
	Pp1Glo4qdIO7UYxRQ5T2i6iWHrYeRcvIsKoG3gkkLaV7RyxokEIh89gtEE6291nUBFuZE/riVXq
	f90iGNZkPZj4HvbM9J2eiRRVhB0CRYyE49T/kZmXwytPGQ==
X-Google-Smtp-Source: AGHT+IGcfeuMfQA6qm9TEp5NEI75xmqMffcPFN6YhQwISDTqYwB+9zrq9ETiFz9lGJmSic7d2JGQ9g==
X-Received: by 2002:a05:600c:83cd:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-441d00fa788mr25297895e9.14.1746521669092;
        Tue, 06 May 2025 01:54:29 -0700 (PDT)
Date: Tue, 6 May 2025 10:54:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
	agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aBnOQyXSz-j33Wux@macbook.lan>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <aBiVkw2SXJHxpieh@mail-itl>
 <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop>

On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
> On Mon, 5 May 2025, Roger Pau Monné wrote:
> > On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-Górecki wrote:
> > > On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> > > > On Mon, 28 Apr 2025, Jan Beulich wrote:
> > > > > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > > > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > > > > > 
> > > > > > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > > > > > addresses to firmware or co-processors not behind an IOMMU.
> > > > > 
> > > > > I definitely don't understand the firmware part: It's subject to the
> > > > > same transparent P2M translations as the rest of the VM; it's just
> > > > > another piece of software running there.
> > > > > 
> > > > > "Co-processors not behind an IOMMU" is also interesting; a more
> > > > > concrete scenario might be nice, yet I realize you may be limited in
> > > > > what you're allowed to say.
> > > > 
> > > > Sure. On AMD x86 platforms there is a co-processor called PSP running
> > > > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> > > > pass addresses to it.  See drivers/tee/amdtee/ and
> > > > include/linux/psp-tee.h in Linux.
> > > 
> > > We had (have?) similar issue with amdgpu (for integrated graphics) - it
> > > uses PSP for loading its firmware. With PV dom0 there is a workaround as
> > > dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
> > > expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
> > > the one I used for debugging this issue).
> > 
> > That's ugly, and problematic when used in conjunction with AMD-SEV.
> > 
> > I wonder if Xen could emulate/mediate some parts of the PSP for dom0
> > to use, while allowing Xen to be the sole owner of the device.  Having
> > both Xen and dom0 use it (for different purposes) seems like asking
> > for trouble.  But I also have no idea how complex the PSP interface
> > is, neither whether it would be feasible to emulate the
> > interfaces/registers needed for firmware loading.
> 
> Let me take a step back from the PSP for a moment. I am not opposed to a
> PSP mediator in Xen, but I want to emphasize that the issue is more
> general and extends well beyond the PSP.
> 
> In my years working in embedded systems, I have consistently seen cases
> where Dom0 needs to communicate with something that does not go through
> the IOMMU. This could be due to special firmware on a co-processor, a
> hardware erratum that prevents proper IOMMU usage, or a high-bandwidth
> device that technically supports the IOMMU but performs poorly unless
> the IOMMU is disabled. All of these are real-world examples that I have
> seen personally.

I wouldn't be surprised, classic PV dom0 avoided those issues because
it was dealing directly with host addresses (mfns), but that's not the
case with PVH dom0.

> In my opinion, we definitely need a solution like this patch for Dom0
> PVH to function correctly in all scenarios.

I'm not opposed to having such interface available for PVH hardware
domains.  I find it ugly, but I don't see much other way to deal with
those kind of "devices".  Xen mediating accesses for each one of them
is unlikely to be doable.

How do you hook this exchange interface into Linux to differentiate
which drivers need to use mfns when interacting with the hardware?

> Additionally, we could add a PSP mediator in Xen to provide best PSP
> support, and also for cases where both Xen and Dom0 need access, but I
> cannot fully assess the complexity involved, as I am not very familiar
> with the API. Probably it is not going to be simple.

For the specific PSP example, and kind of following from the question
above: if we add some mediation layer in Xen for PSP registers, how
could Linux differentiate whether it needs to use mfn of gfns when
interacting with the device?

Thanks, Roger.

