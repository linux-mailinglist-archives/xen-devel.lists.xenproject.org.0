Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8BA3D460
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893652.1302520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2g2-0004T5-GN; Thu, 20 Feb 2025 09:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893652.1302520; Thu, 20 Feb 2025 09:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2g2-0004Q4-DJ; Thu, 20 Feb 2025 09:17:02 +0000
Received: by outflank-mailman (input) for mailman id 893652;
 Thu, 20 Feb 2025 09:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ie4y=VL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tl2g0-0004Py-Uj
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:17:00 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d77b441-ef6b-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 10:16:55 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2fc32756139so1092665a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 01:16:55 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7327eb20b98sm7282833b3a.147.2025.02.20.01.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:16:53 -0800 (PST)
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
X-Inumbo-ID: 6d77b441-ef6b-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740043014; x=1740647814; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQONPwbTG+QYAIKUBVC8gCShzCoUPb7Ok01XCRCbOPg=;
        b=oyKz1YdI+MF9SuOLgQKceBP596ZjTuK5chkpsObucIB4BFUTW5VU3GNLYkCALVcKmL
         5e8XuopNpKzl1akHa3DwEmPkw+FpQaRAWIY3A+NSUSXW/ev+CDQ3pZh+wLuOevCRseNa
         88K6h7e94fmH9cf2yqShRa4BgrnDL7qBjcpBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043014; x=1740647814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQONPwbTG+QYAIKUBVC8gCShzCoUPb7Ok01XCRCbOPg=;
        b=KqDzebYr8CJ1sFdkTL/3eycH38z6GDdt+6R5BRF6mBtzFpxe4FZVZwX9GvtdodqXk8
         yNIuvKYMQvqt88Ar2yVF1x/HUUb6mEKv1PE/b8/nZ3eiUWrX+FssPO1eQu44QaSHk2mv
         6528LRKxKswMKJSaaaUXHZVAt1B3h2jHuoRd8xm4lCoCoiIUL2BxSlVMMs184hkFFt0d
         UADsifP4IHfc8v1GTDu26E9ETIyFN/h643OQ1ugSKp/6gtXCaZPLMU8UEpYDZvB/lt5T
         e9bnoVeObV6kokPUZ1gDmtcOU9AXVDJ801Pe0XVp4Uu0JAY0LVibhAVsPFRv31jr6ylB
         2GOA==
X-Gm-Message-State: AOJu0YzObz9TgyoYaPHGLw0vQpmPsFV6+4+E1h3wTazPAgHwJoGlTA+B
	6LXn24Wi7RfSzYA/XQrY5vDsyXmzK4TT/eQKRBi9W4hXLUh1zFREdDiKf4UmcTg=
X-Gm-Gg: ASbGncuhdvAiZdtpUsQi3Ueh1cpNnbpl+X9awtryCvv5zxH/ZIsw8EtCjPEHYCm74Tr
	etFf1VAr0EJ9FE59eQOkOqLrCOBzaqpiYsBgrNsqGDYFvQsIjP/IdrN7llKK5a7HwBn0uLly8Ds
	ZT2l+LCAuuIGv8DekTsCu5OwXIogbev3IqKA6BK5h3dxkkm00vZcRItxjS8uS8SnCSnVTEb9WrD
	CM2VawrmOs27o73TGaq9VwbyKQ8O/dfNqujMdSe3AN54jlUEbGuPFJujBfmjRzmG0Wv0ipCqN3J
	430NlvbRkefDxl3z2E1oOKdVFQ==
X-Google-Smtp-Source: AGHT+IFLFZSvkaGiBv4PilracK41xrFGvOHQSmC334ppuPZ8SH0dVkpHSO2Md2qXa0jGz7UGsrQqWA==
X-Received: by 2002:a05:6a00:124e:b0:732:23ed:9470 with SMTP id d2e1a72fcca58-73261901144mr30979194b3a.23.1740043014156;
        Thu, 20 Feb 2025 01:16:54 -0800 (PST)
Date: Thu, 20 Feb 2025 10:16:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?UGF3ZcWC?= Srokosz <pawel.srokosz@cert.pl>
Cc: xen-devel <xen-devel@lists.xenproject.org>, jgross@suse.com,
	andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
Subject: Re: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
Message-ID: <Z7bzAeb4UQTQUOsk@macbook.local>
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
 <Z7RWdPpUde9ZoaZu@macbook.local>
 <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>

On Wed, Feb 19, 2025 at 07:37:47PM +0100, Paweł Srokosz wrote:
> Hello,
> 
> > So the issue doesn't happen on debug=y builds? That's unexpected.  I would
> > expect the opposite, that some code in Linux assumes that pfn + 1 == mfn +
> > 1, and hence breaks when the relation is reversed.
> 
> It was also surprising for me but I think the key thing is that debug=y
> causes whole mapping to be reversed so each PFN lands on completely different
> MFN e.g. MFN=0x1300000 is mapped to PFN=0x20e50c in ndebug, but in debug
> it's mapped to PFN=0x5FFFFF. I guess that's why I can't reproduce the
> problem.
> 
> > Can you see if you can reproduce with dom0-iommu=strict in the Xen command
> > line?
> 
> Unfortunately, it doesn't help. But I have few more observations.
> 
> Firstly, I checked the "xen-mfndump dump-m2p" output and found that misread
> blocks are mapped to suspiciously round MFNs. I have different versions of
> Xen and Linux kernel on each machine and I see some coincidence.
> 
> I'm writing few huge files without Xen to ensure that they have been written
> correctly (because under Xen both read and writeback is affected). Then I'm
> booting to Xen, memory-mapping the files and reading each page. I see that when 
> block is corrupted, it is mapped on round MFN e.g. pfn=0x5095d9/mfn=0x1600000, 
> another on pfn=0x4095d9/mfn=0x1500000 etc.
> 
> On another machine with different Linux/Xen version these faults appear on
> pfn=0x20e50c/mfn=0x1300000, pfn=0x30e50c/mfn=0x1400000 etc.
> 
> I also noticed that during read of page that is mapped to
> pfn=0x20e50c/mfn=0x1300000, I'm getting these faults from DMAR:
> 
> ```
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200000000
> (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200001000
> (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200006000
> (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200008000
> (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 1200009000
> (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 120000a000
> (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 120000c000
> (XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
> ```

That's interesting, it seems to me that Linux is assuming that pages
at certain boundaries are superpages, and thus it can just increase
the mfn to get the next physical page.

> and every time I'm dropping the cache and reading this region, I'm getting
> DMAR faults on few random addresses from 1200000000-120000f000 range (I guess 
> MFNs 0x1200000-120000f). MFNs 0x1200000-0x12000ff are not mapped to any PFN in
> Dom0 (based on xen-mfndump output.). 

It would be very interesting to figure out where those requests
originate, iow: which entity in Linux creates the bios with the
faulting address(es).

It's a wild guess, but could you try to boot Linux with swiotlb=force
on the command line and attempt to trigger the issue?  I wonder
whether imposing the usage of the swiotlb will surface the issues as
CPU accesses, rather then IOMMU faults, and that could get us a trace
inside Linux of how those requests are generated.

> On the other hand, I'm not getting these DMAR faults while reading other regions.
> Also I can't trigger the bug with reversed Dom0 mapping, even if I fill the page
> cache with reads.

There's possibly some condition we are missing that causes a component
in Linux to assume the next address is mfn + 1, instead of doing the
full address translation from the linear or pfn space.

Thanks, Roger.

