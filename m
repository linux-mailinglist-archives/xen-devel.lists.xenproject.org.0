Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86373A3DB4F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 14:29:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893879.1302724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6cR-0006EH-TN; Thu, 20 Feb 2025 13:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893879.1302724; Thu, 20 Feb 2025 13:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6cR-0006CP-Pk; Thu, 20 Feb 2025 13:29:35 +0000
Received: by outflank-mailman (input) for mailman id 893879;
 Thu, 20 Feb 2025 13:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ie4y=VL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tl6cQ-0006Bz-85
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 13:29:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b88a3633-ef8e-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 14:29:33 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5ded6c31344so1412515a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 05:29:33 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8190d1b6sm976456966b.36.2025.02.20.05.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 05:29:31 -0800 (PST)
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
X-Inumbo-ID: b88a3633-ef8e-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740058173; x=1740662973; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kK9ZeIiqvTlzqrQGBT86llVuZIMylbTGu5o38YXL3ss=;
        b=v6PUwe1qgWmbp9lHH11+T6K6KmzNWJ3TTNomcbAkHR2y0s1Lx+iEmZPDkvqaWe0rvS
         IzfqCD80iRAwDFYkQ2LfAmlWjNoA/mOjE5KP3HhQJhXzmyCv5rT9kFodw9T3WNVB5sAN
         C3gWB34FqL0RpciIFHwdw3/OozWwX/akNIIFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058173; x=1740662973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kK9ZeIiqvTlzqrQGBT86llVuZIMylbTGu5o38YXL3ss=;
        b=GI3mIY6AwV6lKQTgEqx3BeYAgdbOjWN6nKXYFZasleMMQWbRkSmFJjC0vaAH50x+AR
         G4ecDawuCyfg7gCMtTa//f3Daz32EreQnco9/y0WzjK4dcnxgtDG/7Bd/XmXr+e5P57R
         +OmpS0AnnbI7xMvZKatozhlDaixLJx4f1V21A6JlQ1McZX4JcgQvU21thD+JjzWApdGl
         pfy9+GKvHbp9yhbdgcxpCFYM5Sps1cDlkNMfnnv0eTsNgl+djKIQ4SXkBL/SM2FckdLN
         dAioGfjzQqKhYK1bFp7aihiH6V648LgBAOozh3xMBb7ofKXtio6u+BuMgN+NfMwfWO5/
         8xRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYj4A8nzXk4NAYpfSlCB8PYgWfcW5namqcUJkvtv5+YKJ3ifc4prvZ09W7AS4gzE3KAQSbhnuQuwo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJJXe0rxNM6EpW5kGSUrMMtgMlbfVnjE3ldNu3HrWA7Hs4L4M5
	id8UA998zPTFmh32wMFIY7WRucxtV4YYl28RpTTeP9JRxpPRISGM79DxKDr29RKWzX5aEq8CCLF
	/
X-Gm-Gg: ASbGncvKs7eiw0RNgbdg5deuopfZf36AnTfKR/chzW7nWF3Q6o08X+cVU0xFXRRHwxW
	wrlB8Sed6LuPKcgMdXzzIlwrYNoNtNzPkhlnUsiIxN6b7dKetBlVXNpPLX2PIJgWjjeQqRYCz5P
	t7gEJQZeji0885J6yuRdOlVj+taTUom/XLjrcPHWAqO2S/L52GOE+c+sSy3yTS779yZ8pKNhP6D
	FsXwT4+0bBH3/dzWYRyPS0AHMZHtmjAjlT6sQJUuBX6iNRLHjLk23JMGAvR90XlCq9UKlV8/47x
	GR/FK0CqiDkFjK+Mzrb4uImK6g==
X-Google-Smtp-Source: AGHT+IFPS62oeWzxTuWUHI7zO0Xkr/rIukhTjQ4oOpRzVTLHlET6bI7CvO+l+BVbutgcV0tWN37mvw==
X-Received: by 2002:a05:6402:a001:b0:5e0:922e:527a with SMTP id 4fb4d7f45d1cf-5e0922e53admr12534937a12.0.1740058172079;
        Thu, 20 Feb 2025 05:29:32 -0800 (PST)
Date: Thu, 20 Feb 2025 14:29:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: =?utf-8?B?UGF3ZcWC?= Srokosz <pawel.srokosz@cert.pl>,
	xen-devel <xen-devel@lists.xenproject.org>,
	andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
Subject: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
Message-ID: <Z7cuOl0um1XG0t74@macbook.local>
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
 <Z7RWdPpUde9ZoaZu@macbook.local>
 <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
 <Z7bzAeb4UQTQUOsk@macbook.local>
 <23b12ff3-717f-4321-b3be-9c39367b8d14@suse.com>
 <Z7ch7Nk4Skibj-CN@macbook.local>
 <c6e37d70-6d27-4857-8541-f522a48915a3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6e37d70-6d27-4857-8541-f522a48915a3@suse.com>

On Thu, Feb 20, 2025 at 01:43:39PM +0100, Jürgen Groß wrote:
> On 20.02.25 13:37, Roger Pau Monné wrote:
> > On Thu, Feb 20, 2025 at 10:31:02AM +0100, Jürgen Groß wrote:
> > > On 20.02.25 10:16, Roger Pau Monné wrote:
> > > > On Wed, Feb 19, 2025 at 07:37:47PM +0100, Paweł Srokosz wrote:
> > > > > Hello,
> > > > > 
> > > > > > So the issue doesn't happen on debug=y builds? That's unexpected.  I would
> > > > > > expect the opposite, that some code in Linux assumes that pfn + 1 == mfn +
> > > > > > 1, and hence breaks when the relation is reversed.
> > > > > 
> > > > > It was also surprising for me but I think the key thing is that debug=y
> > > > > causes whole mapping to be reversed so each PFN lands on completely different
> > > > > MFN e.g. MFN=0x1300000 is mapped to PFN=0x20e50c in ndebug, but in debug
> > > > > it's mapped to PFN=0x5FFFFF. I guess that's why I can't reproduce the
> > > > > problem.
> > > > > 
> > > > > > Can you see if you can reproduce with dom0-iommu=strict in the Xen command
> > > > > > line?
> > > > > 
> > > > > Unfortunately, it doesn't help. But I have few more observations.
> > > > > 
> > > > > Firstly, I checked the "xen-mfndump dump-m2p" output and found that misread
> > > > > blocks are mapped to suspiciously round MFNs. I have different versions of
> > > > > Xen and Linux kernel on each machine and I see some coincidence.
> > > > > 
> > > > > I'm writing few huge files without Xen to ensure that they have been written
> > > > > correctly (because under Xen both read and writeback is affected). Then I'm
> > > > > booting to Xen, memory-mapping the files and reading each page. I see that when
> > > > > block is corrupted, it is mapped on round MFN e.g. pfn=0x5095d9/mfn=0x1600000,
> > > > > another on pfn=0x4095d9/mfn=0x1500000 etc.
> > > > > 
> > > > > On another machine with different Linux/Xen version these faults appear on
> > > > > pfn=0x20e50c/mfn=0x1300000, pfn=0x30e50c/mfn=0x1400000 etc.
> > > > > 
> > > > > I also noticed that during read of page that is mapped to
> > > > > pfn=0x20e50c/mfn=0x1300000, I'm getting these faults from DMAR:
> > > > > 
> > > > > ```
> > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200000000
> > > > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200001000
> > > > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200006000
> > > > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200008000
> > > > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200009000
> > > > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 120000a000
> > > > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 120000c000
> > > > > (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> > > > > ```
> > > > 
> > > > That's interesting, it seems to me that Linux is assuming that pages
> > > > at certain boundaries are superpages, and thus it can just increase
> > > > the mfn to get the next physical page.
> > > 
> > > I'm not sure this is true. See below.
> > > 
> > > > > and every time I'm dropping the cache and reading this region, I'm getting
> > > > > DMAR faults on few random addresses from 1200000000-120000f000 range (I guess
> > > > > MFNs 0x1200000-120000f). MFNs 0x1200000-0x12000ff are not mapped to any PFN in
> > > > > Dom0 (based on xen-mfndump output.).
> > > > 
> > > > It would be very interesting to figure out where those requests
> > > > originate, iow: which entity in Linux creates the bios with the
> > > > faulting address(es).
> > > 
> > > I _think_ this is related to the kernel trying to get some contiguous areas
> > > for the buffers used by the I/Os. As those areas are being given back after
> > > the I/O, they don't appear in the mfndump.
> > > 
> > > > It's a wild guess, but could you try to boot Linux with swiotlb=force
> > > > on the command line and attempt to trigger the issue?  I wonder
> > > > whether imposing the usage of the swiotlb will surface the issues as
> > > > CPU accesses, rather then IOMMU faults, and that could get us a trace
> > > > inside Linux of how those requests are generated.
> > > > 
> > > > > On the other hand, I'm not getting these DMAR faults while reading other regions.
> > > > > Also I can't trigger the bug with reversed Dom0 mapping, even if I fill the page
> > > > > cache with reads.
> > > > 
> > > > There's possibly some condition we are missing that causes a component
> > > > in Linux to assume the next address is mfn + 1, instead of doing the
> > > > full address translation from the linear or pfn space.
> > > 
> > > My theory is:
> > > 
> > > The kernel is seeing the used buffer to be a physically contiguous area,
> > > so it is _not_ using a scatter-gather list (it does in the debug Xen case,
> > > resulting in it not to show any errors). Unfortunately the buffer is not
> > > aligned to its size, so swiotlb-xen will remap the buffer to a suitably
> > > aligned one. The driver will then use the returned machine address for
> > > I/Os to both the devices of the RAID configuration. When the first I/O is
> > > done, the driver probably is calling the DMA unmap or device sync function
> > > already, causing the intermediate contiguous region to be destroyed again
> > > (this is the time when the DMAR errors should show up for the 2nd I/O still
> > > running).
> > > 
> > > So the main issue IMHO is, that a DMA buffer mapped for one device is used
> > > for 2 devices instead.
> > 
> > But that won't cause IOMMU faults?  Because the memory used by the
> > bounce buffer would still be owned by dom0 (and thus part of it's IOMMU
> > page-tables), just probably re-written to contain different data.
> > 
> > Or is the swiotlb contiguous region torn down after every operation?
> 
> See the kernel function xen_swiotlb_alloc_coherent(): it will try to
> allocate a continuous region from the hypervisor on demand and give it
> back via xen_swiotlb_free_coherent() after the I/O.
> 
> > That would seem extremely wasteful to me, I assume the buffer is
> > allocated during device init, and stays the same until the device is
> > detached.
> 
> Yes, that is the normal use case for xen_swiotlb_alloc_coherent(). Whether
> all users are doing it that way is another question.
> 
> For normal I/O the standard case is to use either SG-list, a pre-allocated
> contiguous region, or the swiotlb (implicitly done via xen_swiotlb_map_page()).
> 
> As the observation was that there are DMAR messages NOT related to dom0 MFNs,
> I ruled out normal swiotlb buffers, which are indeed pre-allocated and as such
> known to belong to dom0 when taking the mfndump.

Do you have any suggestion about how to debug this further, is there
some way to trace swiotlb operation to detect this case?

I wonder whether the above scenario won't trigger on native, as it's
also possible to have non-aligned buffers in that case, and hence the
premature relinquish of the bounced memory should also cause issues
there?

Thanks, Roger.

