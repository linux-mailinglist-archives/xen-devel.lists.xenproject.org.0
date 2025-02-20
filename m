Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D0A3DA36
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 13:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893813.1302659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl5ni-00054w-1G; Thu, 20 Feb 2025 12:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893813.1302659; Thu, 20 Feb 2025 12:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl5nh-00052r-UT; Thu, 20 Feb 2025 12:37:09 +0000
Received: by outflank-mailman (input) for mailman id 893813;
 Thu, 20 Feb 2025 12:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ie4y=VL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tl5nh-00052l-0J
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 12:37:09 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f66467-ef87-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 13:37:07 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-220d601886fso12161245ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 04:37:07 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545d0a9sm118109075ad.151.2025.02.20.04.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 04:37:05 -0800 (PST)
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
X-Inumbo-ID: 64f66467-ef87-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740055026; x=1740659826; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tV5gknVESYVQ9d2LTtWONne+cfL3ZiDSeiDQ7lEQ3TA=;
        b=jRl+Z+PVhQMrLdiouFgUM5Y1A2O5M7bOpRP4kXOg3yLypHLcIrBlZWRciOKFHwNJQr
         X5vmV7wB4AAebo1ALNrPnkLEO0qI2dJhR1c9LXQ2tPl9ARnac1bNya848BLTdFuAd+fI
         zt/CYx+Erq/S1Hop+fUJDkw0G3ZUsRUSxuG4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740055026; x=1740659826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV5gknVESYVQ9d2LTtWONne+cfL3ZiDSeiDQ7lEQ3TA=;
        b=ok0KyHxD9FXfDWM274/NTVgxa+cCdH9Ku/6hnZR+tAdH8jRqGqML27OaiK2bzkqDub
         lkFHVO7edLU+jDSIbV5dxfLBGk7rsGYhZFema85TQAkdkLrIHBH+LchyhpJawW6oDZW6
         L6aSZF2WD85GkCdhHM68nfl9y0zhzXQOonshumVWJxnxWO2yvikJcLxGhSpD/MRqnpH8
         vXGAGSuvEOKxDRujNDpvXL31LvHQOX65Vh7BdVKkbPpggG/zVAR/4MTdn2CuFjL1b0CH
         BTTuJj2V030i7ADc9WPr2PJqBZafAZ+ksu7yy969OfZg2BH1VcsQtMwKJ6pt4xF9CGm9
         rn0A==
X-Forwarded-Encrypted: i=1; AJvYcCUylOC00rDLyzKvuCtvxb68WtoBaN/4AihUy7bL4ncEFHVPZtfqPFs36fvS9bLRp5dRKgW6ZB0htkw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJNRsyXWtIx1fhHcuG4fqM3s34Ys4oZUbZm7HXRCmIX4ics7YO
	G4GwbouLNR1XrO+dHgF9JC5QTejlPSWR3Qahf8vvigOdWedbimZH4BV1dKV3pK4=
X-Gm-Gg: ASbGnct1dX2FKldVikPB2rQ8GYhfvCeQ+H24dcv+f9LVCCMgW6YvFfLN8ii+4BID/Iq
	ArWLL//HFKYFPF12UK6pT9Cp79/ZUd/yC7jZ3E73DSaeFZqY98NQ9k7Aq6ytscKq5fXVlBXmTAn
	lmb5BL81/JH0wQyFRCW/Mx6W8VG/et9r/T2gOotOf/6YID2pyjkif2AR+WxcFE2n/+7OM6+ylVJ
	mijCwn2RKUIodKwFTQ2Ekkv6bzSJhXawBjrUWsr7YPJGTwQrqajTvERY0rUH++uX1nuugiRQI/K
	4GJs7ZK+tY9MvMbG6Kc+
X-Google-Smtp-Source: AGHT+IGnLfiN+9OyVcdiQQ7iTJn8jKRXGmncdQ0RmQiAzknf3bUN4IczClWpWXLQ+u35kGtMrJAeoQ==
X-Received: by 2002:a17:902:ce03:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22103f16850mr337065795ad.13.1740055026018;
        Thu, 20 Feb 2025 04:37:06 -0800 (PST)
Date: Thu, 20 Feb 2025 13:37:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: =?utf-8?B?UGF3ZcWC?= Srokosz <pawel.srokosz@cert.pl>,
	xen-devel <xen-devel@lists.xenproject.org>,
	andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
Subject: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
Message-ID: <Z7ch7Nk4Skibj-CN@macbook.local>
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
 <Z7RWdPpUde9ZoaZu@macbook.local>
 <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
 <Z7bzAeb4UQTQUOsk@macbook.local>
 <23b12ff3-717f-4321-b3be-9c39367b8d14@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23b12ff3-717f-4321-b3be-9c39367b8d14@suse.com>

On Thu, Feb 20, 2025 at 10:31:02AM +0100, Jürgen Groß wrote:
> On 20.02.25 10:16, Roger Pau Monné wrote:
> > On Wed, Feb 19, 2025 at 07:37:47PM +0100, Paweł Srokosz wrote:
> > > Hello,
> > > 
> > > > So the issue doesn't happen on debug=y builds? That's unexpected.  I would
> > > > expect the opposite, that some code in Linux assumes that pfn + 1 == mfn +
> > > > 1, and hence breaks when the relation is reversed.
> > > 
> > > It was also surprising for me but I think the key thing is that debug=y
> > > causes whole mapping to be reversed so each PFN lands on completely different
> > > MFN e.g. MFN=0x1300000 is mapped to PFN=0x20e50c in ndebug, but in debug
> > > it's mapped to PFN=0x5FFFFF. I guess that's why I can't reproduce the
> > > problem.
> > > 
> > > > Can you see if you can reproduce with dom0-iommu=strict in the Xen command
> > > > line?
> > > 
> > > Unfortunately, it doesn't help. But I have few more observations.
> > > 
> > > Firstly, I checked the "xen-mfndump dump-m2p" output and found that misread
> > > blocks are mapped to suspiciously round MFNs. I have different versions of
> > > Xen and Linux kernel on each machine and I see some coincidence.
> > > 
> > > I'm writing few huge files without Xen to ensure that they have been written
> > > correctly (because under Xen both read and writeback is affected). Then I'm
> > > booting to Xen, memory-mapping the files and reading each page. I see that when
> > > block is corrupted, it is mapped on round MFN e.g. pfn=0x5095d9/mfn=0x1600000,
> > > another on pfn=0x4095d9/mfn=0x1500000 etc.
> > > 
> > > On another machine with different Linux/Xen version these faults appear on
> > > pfn=0x20e50c/mfn=0x1300000, pfn=0x30e50c/mfn=0x1400000 etc.
> > > 
> > > I also noticed that during read of page that is mapped to
> > > pfn=0x20e50c/mfn=0x1300000, I'm getting these faults from DMAR:
> > > 
> > > ```
> > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200000000
> > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200001000
> > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200006000
> > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200008000
> > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200009000
> > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 120000a000
> > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 120000c000
> > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > ```
> > 
> > That's interesting, it seems to me that Linux is assuming that pages
> > at certain boundaries are superpages, and thus it can just increase
> > the mfn to get the next physical page.
> 
> I'm not sure this is true. See below.
> 
> > > and every time I'm dropping the cache and reading this region, I'm getting
> > > DMAR faults on few random addresses from 1200000000-120000f000 range (I guess
> > > MFNs 0x1200000-120000f). MFNs 0x1200000-0x12000ff are not mapped to any PFN in
> > > Dom0 (based on xen-mfndump output.).
> > 
> > It would be very interesting to figure out where those requests
> > originate, iow: which entity in Linux creates the bios with the
> > faulting address(es).
> 
> I _think_ this is related to the kernel trying to get some contiguous areas
> for the buffers used by the I/Os. As those areas are being given back after
> the I/O, they don't appear in the mfndump.
> 
> > It's a wild guess, but could you try to boot Linux with swiotlb=force
> > on the command line and attempt to trigger the issue?  I wonder
> > whether imposing the usage of the swiotlb will surface the issues as
> > CPU accesses, rather then IOMMU faults, and that could get us a trace
> > inside Linux of how those requests are generated.
> > 
> > > On the other hand, I'm not getting these DMAR faults while reading other regions.
> > > Also I can't trigger the bug with reversed Dom0 mapping, even if I fill the page
> > > cache with reads.
> > 
> > There's possibly some condition we are missing that causes a component
> > in Linux to assume the next address is mfn + 1, instead of doing the
> > full address translation from the linear or pfn space.
> 
> My theory is:
> 
> The kernel is seeing the used buffer to be a physically contiguous area,
> so it is _not_ using a scatter-gather list (it does in the debug Xen case,
> resulting in it not to show any errors). Unfortunately the buffer is not
> aligned to its size, so swiotlb-xen will remap the buffer to a suitably
> aligned one. The driver will then use the returned machine address for
> I/Os to both the devices of the RAID configuration. When the first I/O is
> done, the driver probably is calling the DMA unmap or device sync function
> already, causing the intermediate contiguous region to be destroyed again
> (this is the time when the DMAR errors should show up for the 2nd I/O still
> running).
> 
> So the main issue IMHO is, that a DMA buffer mapped for one device is used
> for 2 devices instead.

But that won't cause IOMMU faults?  Because the memory used by the
bounce buffer would still be owned by dom0 (and thus part of it's IOMMU
page-tables), just probably re-written to contain different data.

Or is the swiotlb contiguous region torn down after every operation?
That would seem extremely wasteful to me, I assume the buffer is
allocated during device init, and stays the same until the device is
detached.

Thanks, Roger.

