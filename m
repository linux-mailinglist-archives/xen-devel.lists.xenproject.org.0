Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D42901CEC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 10:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737033.1143141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaOg-0005Hu-Fa; Mon, 10 Jun 2024 08:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737033.1143141; Mon, 10 Jun 2024 08:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaOg-0005GP-Bs; Mon, 10 Jun 2024 08:28:58 +0000
Received: by outflank-mailman (input) for mailman id 737033;
 Mon, 10 Jun 2024 08:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGaOf-0005F2-Sn
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 08:28:57 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79ee76d2-2703-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 10:28:55 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52bc1261f45so2585180e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 01:28:55 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421b905908asm33111905e9.20.2024.06.10.01.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 01:28:55 -0700 (PDT)
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
X-Inumbo-ID: 79ee76d2-2703-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718008135; x=1718612935; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tk0EtazRDnLiSQ09qxK61PlwAAEhoixNyO5SJIi56Bg=;
        b=eb7DtaE10Vb/SR2TyZgYCp5rh4zZ6X6R9oQWlpW79RvWkXCBdhhvfZ2t5vCPdBxfut
         /10MpQtii53UG06wjBza1Ts3eCLhGQGuVBJ7VMAWWxkP4yKpggp8FdbmeDPG8YO18oy/
         WQYsEpF/oABYoj+xEo1J2UF1MbiMa4csidflg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008135; x=1718612935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk0EtazRDnLiSQ09qxK61PlwAAEhoixNyO5SJIi56Bg=;
        b=CnJtRRJ5FJwvTiwWjy5W02r1ubZ4igxHe2AzG7MPQeE+51+Ipk2qwyR5Y87pdf0fAU
         bKGI/6Mlob/m+TpyTGz6ts5yT6GVmJhfchP33T7Fd4gwRLOdUOXh62HEEZEkeWGRZ8hn
         VJJCgkl8e1ixk8ov0nRiOvNjjr8udjjX4vcBciaDDVHXr0KvKkUmkAEc3L/GvtQLOcKm
         saJhkKG0g2shGUvH0Nh0x11Ch403zBdPALQAhCEr8NUOTw8sJe3R5Jg83E+GqebRWkNV
         XcBYA9ga/PUELZoeFyCZmeE4befkXv/uP44LXBEfUXsOiDZLiSXDlUcgqk2LtOUd/HF6
         iOQA==
X-Forwarded-Encrypted: i=1; AJvYcCWHz/sWNGtqG80PD9PkGWYzIJgw4RdiEREcQo/V4ExQDT6k2M0PJnvjp29+6S8JG0LOO0XTgmMJz4FKMfS0izX8XIdAw8uNW8QCIQI/ee4=
X-Gm-Message-State: AOJu0YygE/Hmbg9sIS40ruTZszueMQhcd093UhQ+3qapevBfvMPLIn2D
	cp9FOITRKgQp9JaEIOHrdGd5+iPR2pB+U3kQmKTtBTsFHRQhw4MnvxwDqGmlF/Q=
X-Google-Smtp-Source: AGHT+IFo+Lz1v9SpkOVGLo+aTKf5D9dA/hlMM0GpA6vz7w9aKnvAasLII4NZ7XW61n6c87e6doCUTQ==
X-Received: by 2002:ac2:5b92:0:b0:52c:87d7:4b3f with SMTP id 2adb3069b0e04-52c87d74df2mr1709780e87.54.1718008135332;
        Mon, 10 Jun 2024 01:28:55 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:28:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>, javi.merino@cloud.com
Subject: Re: Segment truncation in multi-segment PCI handling?
Message-ID: <Zma5Rj_cswrIYcD2@macbook>
References: <ZmNjoeFAwWz8xhfM@mail-itl>
 <9cbb6dce-b669-4237-8932-b5cd64eb7288@citrix.com>
 <b609eaab-0a0a-433b-81d3-84a0cd90ebc1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b609eaab-0a0a-433b-81d3-84a0cd90ebc1@suse.com>

On Mon, Jun 10, 2024 at 09:58:11AM +0200, Jan Beulich wrote:
> On 07.06.2024 21:52, Andrew Cooper wrote:
> > On 07/06/2024 8:46 pm, Marek Marczykowski-Górecki wrote:
> >> Hi,
> >>
> >> I've got a new system, and it has two PCI segments:
> >>
> >>     0000:00:00.0 Host bridge: Intel Corporation Device 7d14 (rev 04)
> >>     0000:00:02.0 VGA compatible controller: Intel Corporation Meteor Lake-P [Intel Graphics] (rev 08)
> >>     ...
> >>     10000:e0:06.0 System peripheral: Intel Corporation RST VMD Managed Controller
> >>     10000:e0:06.2 PCI bridge: Intel Corporation Device 7ecb (rev 10)
> >>     10000:e1:00.0 Non-Volatile memory controller: Phison Electronics Corporation PS5021-E21 PCIe4 NVMe Controller (DRAM-less) (rev 01)
> >>
> >> But looks like Xen doesn't handle it correctly:

In the meantime you can probably disable VMD from the firmware and the
NVMe devices should appear on the regular PCI bus.

> >>     (XEN) 0000:e0:06.0: unknown type 0
> >>     (XEN) 0000:e0:06.2: unknown type 0
> >>     (XEN) 0000:e1:00.0: unknown type 0
> >>     ...
> >>     (XEN) ==== PCI devices ====
> >>     (XEN) ==== segment 0000 ====
> >>     (XEN) 0000:e1:00.0 - NULL - node -1 
> >>     (XEN) 0000:e0:06.2 - NULL - node -1 
> >>     (XEN) 0000:e0:06.0 - NULL - node -1 
> >>     (XEN) 0000:2b:00.0 - d0 - node -1  - MSIs < 161 >
> >>     (XEN) 0000:00:1f.6 - d0 - node -1  - MSIs < 148 >
> >>     ...
> >>
> >> This isn't exactly surprising, since pci_sbdf_t.seg is uint16_t, so
> >> 0x10000 doesn't fit. OSDev wiki says PCI Express can have 65536 PCI
> >> Segment Groups, each with 256 bus segments.
> >>
> >> Fortunately, I don't need this to work, if I disable VMD in the
> >> firmware, I get a single segment and everything works fine.
> >>
> > 
> > This is a known issue.  Works is being done, albeit slowly.
> 
> Is work being done? After the design session in Prague I put it on my
> todo list, but at low priority. I'd be happy to take it off there if I
> knew someone else is looking into this.

We had a design session about VMD?  If so I'm afraid I've missed it.

> > 0x10000 is indeed not a spec-compliant PCI segment.  It's something
> > model specific the Linux VMD driver is doing.
> 
> I wouldn't call this "model specific" - this numbering is purely a
> software one (and would need coordinating between Dom0 and Xen).

Hm, TBH I'm not sure whether Xen needs to be aware of VMD devices.
The resources used by the VMD devices are all assigned to the VMD
root.  My current hypothesis is that it might be possible to manage
such devices without Xen being aware of their existence.

Regards, Roger.

