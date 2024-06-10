Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D3901E90
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 11:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737090.1143228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGbbY-0006C8-F8; Mon, 10 Jun 2024 09:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737090.1143228; Mon, 10 Jun 2024 09:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGbbY-00069a-C1; Mon, 10 Jun 2024 09:46:20 +0000
Received: by outflank-mailman (input) for mailman id 737090;
 Mon, 10 Jun 2024 09:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGbbW-00069U-W1
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 09:46:19 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47cbfb34-270e-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 11:46:16 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-627ebbe7720so42885197b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 02:46:17 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b07b867db7sm10024006d6.144.2024.06.10.02.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:46:15 -0700 (PDT)
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
X-Inumbo-ID: 47cbfb34-270e-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718012776; x=1718617576; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nXoHdGhpLM+SDnEOJBdw2O0WiRmYlBzKC+6UP7Leex8=;
        b=X5ovzayx3tRIAGkEWSuCmYhodPTxd1WBWI8/RWBFvwUiRXX6mEbml/xAaW0zSt4GNR
         5q/kHIwEd+UrOfPGINj6eGB4CPa2R0hzJjkBf8RJa5wFKPjdIrkUZ5hM6eGo1lVtCn+8
         2oJeHcVae3uzZNvWDAZbT4JXSSX8yADj+q4Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718012776; x=1718617576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXoHdGhpLM+SDnEOJBdw2O0WiRmYlBzKC+6UP7Leex8=;
        b=AC0PYdt+sIxMr5cN4Pnm7RhBjd5CGrCiiDBG2zJFHG1Dzr905jVLXpIoKSe7CxZTvb
         InIDP2tyj2L6Zd+GkqEgBGF2MLxE5oK3tExg9/X7dJf526fR2S21Yl/9lse2uZ+ZDp3J
         9xiUMy7SHXw0IJEaHArLPhEwSgRB7PpeXqsOiyU9IM+hkJVc4k50eJxbaOqiZMwaZa2u
         qYEHpZi6qN1j1W/OhSsHGYK+yemZttzd2fTvC1qeSdqKm6NixCvKSgsAWa6GnSalu/2B
         yedbES52hKqMEbsBk90ObLwKJlWWpl+cmvAZeKV30gZhVtjnRRfuSQuwUjMzb2c0r9TO
         CuWg==
X-Forwarded-Encrypted: i=1; AJvYcCW4zQTWIYoIE0UsFm40sd8GqKabxBr7L1xKyQeyqCJca9dmBt6IvbMVmucwKXf3AklIK+EUwb/hje4KkwQYGJBSgAXorG0VTn/3QuUIUAg=
X-Gm-Message-State: AOJu0YxLIwXnw+vhP6eVHTTjErK0l5quKbyp0769a+BEGKWOEhCEt/AD
	EmJTtxsFUWKyOZ3zVxYk5N72C8MykRfXASrd5aMSW1jL1HEVJ+cB87P1R2hUS9E=
X-Google-Smtp-Source: AGHT+IEQwCZ7QEfFMfDPcfeYAn+xFaH3900sOchlGctQEt8L+DQkIl5lY57HUs1Gf6KYhUdlyqv6rQ==
X-Received: by 2002:a05:690c:fca:b0:62d:354:98ce with SMTP id 00721157ae682-62d03549a96mr34821147b3.51.1718012775470;
        Mon, 10 Jun 2024 02:46:15 -0700 (PDT)
Date: Mon, 10 Jun 2024 11:46:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>, javi.merino@cloud.com
Subject: Re: Segment truncation in multi-segment PCI handling?
Message-ID: <ZmbLZHSOg8KuRvAw@macbook>
References: <ZmNjoeFAwWz8xhfM@mail-itl>
 <9cbb6dce-b669-4237-8932-b5cd64eb7288@citrix.com>
 <b609eaab-0a0a-433b-81d3-84a0cd90ebc1@suse.com>
 <Zma5Rj_cswrIYcD2@macbook>
 <a8225a94-54ed-4b24-8867-b9da65cb0a14@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8225a94-54ed-4b24-8867-b9da65cb0a14@suse.com>

On Mon, Jun 10, 2024 at 10:41:19AM +0200, Jan Beulich wrote:
> On 10.06.2024 10:28, Roger Pau Monné wrote:
> > On Mon, Jun 10, 2024 at 09:58:11AM +0200, Jan Beulich wrote:
> >> On 07.06.2024 21:52, Andrew Cooper wrote:
> >>> On 07/06/2024 8:46 pm, Marek Marczykowski-Górecki wrote:
> >>>> Hi,
> >>>>
> >>>> I've got a new system, and it has two PCI segments:
> >>>>
> >>>>     0000:00:00.0 Host bridge: Intel Corporation Device 7d14 (rev 04)
> >>>>     0000:00:02.0 VGA compatible controller: Intel Corporation Meteor Lake-P [Intel Graphics] (rev 08)
> >>>>     ...
> >>>>     10000:e0:06.0 System peripheral: Intel Corporation RST VMD Managed Controller
> >>>>     10000:e0:06.2 PCI bridge: Intel Corporation Device 7ecb (rev 10)
> >>>>     10000:e1:00.0 Non-Volatile memory controller: Phison Electronics Corporation PS5021-E21 PCIe4 NVMe Controller (DRAM-less) (rev 01)
> >>>>
> >>>> But looks like Xen doesn't handle it correctly:
> > 
> > In the meantime you can probably disable VMD from the firmware and the
> > NVMe devices should appear on the regular PCI bus.
> > 
> >>>>     (XEN) 0000:e0:06.0: unknown type 0
> >>>>     (XEN) 0000:e0:06.2: unknown type 0
> >>>>     (XEN) 0000:e1:00.0: unknown type 0
> >>>>     ...
> >>>>     (XEN) ==== PCI devices ====
> >>>>     (XEN) ==== segment 0000 ====
> >>>>     (XEN) 0000:e1:00.0 - NULL - node -1 
> >>>>     (XEN) 0000:e0:06.2 - NULL - node -1 
> >>>>     (XEN) 0000:e0:06.0 - NULL - node -1 
> >>>>     (XEN) 0000:2b:00.0 - d0 - node -1  - MSIs < 161 >
> >>>>     (XEN) 0000:00:1f.6 - d0 - node -1  - MSIs < 148 >
> >>>>     ...
> >>>>
> >>>> This isn't exactly surprising, since pci_sbdf_t.seg is uint16_t, so
> >>>> 0x10000 doesn't fit. OSDev wiki says PCI Express can have 65536 PCI
> >>>> Segment Groups, each with 256 bus segments.
> >>>>
> >>>> Fortunately, I don't need this to work, if I disable VMD in the
> >>>> firmware, I get a single segment and everything works fine.
> >>>>
> >>>
> >>> This is a known issue.  Works is being done, albeit slowly.
> >>
> >> Is work being done? After the design session in Prague I put it on my
> >> todo list, but at low priority. I'd be happy to take it off there if I
> >> knew someone else is looking into this.
> > 
> > We had a design session about VMD?  If so I'm afraid I've missed it.
> 
> In Prague last year, not just now in Lisbon.
> 
> >>> 0x10000 is indeed not a spec-compliant PCI segment.  It's something
> >>> model specific the Linux VMD driver is doing.
> >>
> >> I wouldn't call this "model specific" - this numbering is purely a
> >> software one (and would need coordinating between Dom0 and Xen).
> > 
> > Hm, TBH I'm not sure whether Xen needs to be aware of VMD devices.
> > The resources used by the VMD devices are all assigned to the VMD
> > root.  My current hypothesis is that it might be possible to manage
> > such devices without Xen being aware of their existence.
> 
> Well, it may be possible to have things work in Dom0 without Xen
> knowing much. Then Dom0 would need to suppress any physdevop calls
> with such software-only segment numbers (in order to at least not
> confuse Xen). I'd be curious though how e.g. MSI setup would work in
> such a scenario.

IIRC from my read of the spec, VMD devices don't use regular MSI
data/address fields, and instead configure an index into the MSI table
on the VMD root for the interrupt they want to use.  It's only the VMD
root device (which is a normal device on the PCI bus) that has
MSI(-X) configured with real vectors, and multiplexes interrupts for
all devices behind it.

If we had to passthrough VMD devices we might have to intercept writes
to the VMD MSI(-X) entries, but since they can only be safely assigned
to dom0 I think it's not an issue ATM (see below).

> Plus clearly any passing through of a device behind
> the VMD bridge will quite likely need Xen involvement (unless of
> course the only way of doing such pass-through was to pass on the
> entire hierarchy).

All VMD devices share the Requestor ID of the VMD root, so AFAIK it's
not possible to passthrough them (unless you passthrough the whole VMD
root) because they all share the same context entry on the IOMMU.

Thanks, Roger.

