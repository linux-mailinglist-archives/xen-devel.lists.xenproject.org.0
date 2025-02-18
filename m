Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC467A39759
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 10:45:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891162.1300232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkK9V-0000uw-4O; Tue, 18 Feb 2025 09:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891162.1300232; Tue, 18 Feb 2025 09:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkK9V-0000sN-0e; Tue, 18 Feb 2025 09:44:29 +0000
Received: by outflank-mailman (input) for mailman id 891162;
 Tue, 18 Feb 2025 09:44:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkK9T-0000sH-NK
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 09:44:27 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee4daef6-eddc-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 10:44:22 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-abb7aecd39fso482929966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 01:44:21 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb93874686sm412472766b.0.2025.02.18.01.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 01:44:20 -0800 (PST)
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
X-Inumbo-ID: ee4daef6-eddc-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739871861; x=1740476661; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRS9tibPLxM6lgPTKy2ycKh3QhDVs9zbQaEx6sOh1rI=;
        b=bYQe10FHQv/zJB1w1vhNKbOpM+A3ALOUBkSUQYQ6ywo2I1Z+p6yAFPEdOgmf/gRE/5
         sacVNVvLmrbQP/uKVNAUNEejs9sDxQanVdSpYx2r+fSxFq6CxxFadocp/mUD5GhNpE2w
         iKyfsOUNVN8xtGUAj7jahauIfpHk7R+HUtfuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739871861; x=1740476661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRS9tibPLxM6lgPTKy2ycKh3QhDVs9zbQaEx6sOh1rI=;
        b=fTT0uDV8ZwmN80fWvo/GmC/gHg1FTowSAvDGnrJB2wyW6GF7IhwMQAaagteWMLQ17Y
         kRj6svT86S/9++Ad1ejwrDy2gL71h/mvrxaj8wAWox+TZRiAqNV/m7QEMVcxqipXgl+n
         d+phpFNvjp9avxx9z4IJ/99Y0BV17fy+2GRjAoXhRcAwMOZZYRCDE/kT+hQVLgEYjEAj
         482j9XSicL/sirSm0GvrHgy/nGfftZDjJoJs4/JF/zIkVTl7XxeyeNhLLyKNzYYFONHd
         lPYWHASk+B36m5Cxd0k9U7HBmo9nEckSNODB7NJSA8HY04Ips/gK7q6F/MIFxI7E8zW5
         YL1w==
X-Gm-Message-State: AOJu0YzxCnAqu7HrFgtuqIVGmhszK97eSLrPrln2q/YdeGQVDIOFvZLy
	IcgC6hg/JMRFxgpLZvBHuGtm6Ww0mI4FDatDZt+w6JcsPwzy3g08sYehS+PQyXw=
X-Gm-Gg: ASbGncvT4jDwxaIPtq4MDVsyY17LRa2D16L/yBRJ9ZAqVL4BmpMzYznc8xyIP6cKH9v
	Bb3XLkr+xTidOtttoQ3DCfZVKqfGZv6rjG9nq2K55zm659AU73/S8iSjt7vsGczTi7eX0f5lQgf
	UycMcImBLOuQVU2LdEOUpQNvlbBPtIz+IyZdvIaLDM7kiTN1rQS2jO5lXxH3KcrGuvp0YxFplPr
	QmA1ZFiJuDn2bN0dcMZOCHyN/gslCR6veugxf0naPQ8XJgf0nB5PXru/RCEdnFqh4MvYr6HHkEG
	vEOa4gD3NoVVz38mW0e1GdsVsQ==
X-Google-Smtp-Source: AGHT+IEqong8TKTFgKSZUtkKK+51fDNjpUMZJSHHDx8ZxCVKF3ffjk+vdtVbjXEE4ixoh6la45+M5g==
X-Received: by 2002:a17:906:c14c:b0:aba:620a:acf7 with SMTP id a640c23a62f3a-abb708aaf52mr1450451766b.10.1739871861193;
        Tue, 18 Feb 2025 01:44:21 -0800 (PST)
Date: Tue, 18 Feb 2025 10:44:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?UGF3ZcWC?= Srokosz <pawel.srokosz@cert.pl>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
	andrew.cooper3@citrix.com, JBeulich@suse.com
Subject: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
Message-ID: <Z7RWdPpUde9ZoaZu@macbook.local>
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>

On Mon, Feb 17, 2025 at 09:19:41PM +0100, Paweł Srokosz wrote:
> Hello everyone,

Adding the x86 maintainers plus the Linux Xen maintainer to the email.

> for few months I'm struggling with a very weird memory corruption issue in 
> Xen PV Dom0 and storage backed by BOSS-S1 RAID-1 card. I noticed it when I tried 
> to copy huge ISO file on Dom0 file system and use it for DomU installation.
> Everything was fine while its contents were cached in the memory, but when I
> rebooted the system and file was read, some parts of the file changed their
> contents. In the same time fsck doesn't report any problems with the
> filesystem.
> 
> In the same time I'm able to reproduce it only when I'm reading and writing
> files onto storage backed by two SSDs in hardware RAID-1 (BOSS-S1 SATA AHCI
> RAID-1 fw ver. 2.5.13.3024) and only under Xen PV. Without Xen or with PVH Dom0 
> everything works correctly. I have reproduced the bug on three servers
> with the same hardware/software specification:

We had similar reports, and IIRC also with software RAID.

> - Platform: Dell PowerEdge R640
> - CPU: 1x Intel(R) Xeon(R) Gold 6132 CPU @ 2.60GHz
> - RAM: 4x Multi-bit ECC DDR-4 32 GB
> - Storage:
>  - 2xSSD 240GiB with BOSS-S1 SATA AHCI RAID-1 fw ver. 2.5.13.3024 (where
>  files corrupt)
>  - 1xSSD 4TiB SAS PERC H330 Mini JBOD fw ver. 25.5.9.0001 (where files
>  doesn't corrupt)
> 
> I reproduced the same situation by writing a file, flushing dirty pages to
> the storage (`sync`) and dropping cached pages (`echo 3 > /proc/sys/vm/drop_caches`).
> 
> ```
> # sha256sum Win10_22H2_Polish_x64v1.iso
> 96aad9e4b20b6e3f5fea40b981263e854f6c879472369d5ce8324aae1f6b7556 Win10_22H2_Polish_x64v1.iso
> 
> # echo 3 > /proc/sys/vm/drop_caches
> 
> # sha256sum Win10_22H2_Polish_x64v1.iso
> 0ba05ee38c0f2755bce4ccdf6b389963d9177b261505cbc2b41f8198e9f3bc60 Win10_22H2_Polish_x64v1.iso
> 
> # echo 3 > /proc/sys/vm/drop_caches
> 
> # sha256sum Win10_22H2_Polish_x64v1.iso
> 972a7f363e48b72a612efe85cc6a2c8ce7314858ec0e7ef08d9d7578c9a10ddc Win10_22H2_Polish_x64v1.iso
> ```
> 
> Same effect occurred on two other machines with the same hardware. Only files
> written under Xen PV Dom0 were affected. When these files (written under Xen Dom0)
> were read without Xen, they were consistently corrupted in affected
> parts. When these files are read with Xen, the corruption changed every time
> we dropped the page cache.
> 
> I found that file is corrupted within 4kB page boundaries, so it looked like
> memory issue. So I wrote a script that writes a huge file with specific
> pattern on each 4kB block (matching the page size) and after
> flush/drop_caches, it mmap's the file and checks the integrity of each block.
> When block mismatch occurs, it prints the VA and GFN from
> `/proc/<pid>/pagemap` (using https://github.com/dwks/pagemap). Each page is
> filled with numbers depending on the file offset, so I'm able to correlate
> the contents with the specific offset in case they're shifted or out of
> order.
> 
> In terms of file offset, corruption is usually aligned up to 0xffff boundary
> e.g. mismatched blocks can be found within these file offset ranges:
> - 0x248f000-0x248ffff
> - 0xd4944000-0xd494ffff
> - 0xc1fb000-0xc1fffff
> 
> My wild guess is that 0xffff is a Linux boundary for readahead operation.
> When I try to load two or more files into page cache, I start to see some
> patterns on Dom0 Linux PFN (GFN?):
> 
> ```
> Block mismatch 0x4f577000 read -0x1
> 7f664ec00000-7f6742e40000 r--s 00000000 fe:00 397029 /home/pawelsr/testfile1
>  00007f669e177000 pm a18000000030e50c pc 0000000000000001 pf 000000040000082c cg 0000000000000be5
> 
> <... redacted series of similar entries for ...8000, ...9000, ...a000>
> 
> Block mismatch 0x4f57f000 read -0x1
> 7f664ec00000-7f6742e40000 r--s 00000000 fe:00 397029 /home/pawelsr/testfile1
>  00007f669e17f000 pm a18000000030e514 pc 0000000000000001 pf 000000040000082c cg 0000000000000be5
> ```
> 
> ```
> Block mismatch 0xc1fb000 read 0x4f577000
> 7f0552600000-7f0646840000 r--s 00000000 fe:00 399642 /home/pawelsr/testfile2
>  00007f055e7fb000 pm a18000000020e50c pc 0000000000000001 pf 000000040000082c cg 0000000000000be5
> 
> <... redacted series of similar entries for ...c000, ...d000, ...e000>
> 
> Block mismatch 0xc203000 read 0x4f57f000
> 7f0552600000-7f0646840000 r--s 00000000 fe:00 399642 /home/pawelsr/testfile2
>  00007f055e803000 pm a18000000020e514 pc 0000000000000001 pf 000000040000082c cg 0000000000000be5
> ```
> 
> which means that when I try to read from `20e50c-20e514` GFN, I'm getting
> contents that should land in `30e50c-30e514` GFN. On the other hand
> `30e50c-30e514` contain only zeroes, but sometimes I see something that looks
> like a random portion of some memory. When I'm able to correlate the
> contents, very often it comes from GFN offseted by multiply of 0x100000.
> 
> Corruption isn't limited to page cache but makes whole system unstable and
> from time to time results in kernel panic or random segmentation faults. 
> It's also not easy to reproduce, I need to read/write a lot of blocks to trigger 
> it and bug looks to be time-sensitive.
> 
> All three servers behave the same and it doesn't look like problem is caused
> by simple hardware issue. All healthchecks and tests on RAM/storage/other
> components pass.
> 
> Our BOSS-S1 PCI card uses the following SATA controller: Marvell Technology
> Group Ltd. 88SE9230 PCIe 2.0 x2 4-port SATA 6 Gb/s RAID Controller (rev 11).
> There are well-known problems with this family of controllers and Linux
> contains a fixup for DMA function 1
> (https://github.com/torvalds/linux/blob/2408a807bfc3f738850ef5ad5e3fd59d66168996/drivers/pci/quirks.c#L4316).
> This bug is known to cause some issues on Xen with IOMMU
> (https://github.com/QubesOS/qubes-issues/issues/5968). I'm not sure if it's
> somehow correlated and causes problems with PV as well.
> 
> By testing the bug in different conditions I also spotted few more
> correlations:
> 
> - bug occurs on Xen PV Dom0 and was reproduced on Xen versions from 4.16.0 to
>  4.19.2-pre (up to git:4803a3c5b5 from stable-4.19) and Debian 10 to 12
>  (both stable and backports kernel). Somehow that specific commit
>  git:4803a3c5b5 makes the bug harder to trigger but it may be just a
>  coincidence.

I think it's more likely to be a Linux bug than a Xen (hypervisor)
bug.

> - I was unable to reproduce it when Xen was compiled from master branch, but
>  I'm not sure if once again - it wasn't just a bad timing to trigger the
>  bug.
> - bug occurs only on ext4 file system with hardware RAID backed by BOSS-S1
> - bug DOESN'T occur without Xen
> - bug DOESN'T occur on Xen PVH Dom0
> - bug DOESN'T occur on Xen PV Dom0 when Xen was compiled with excluded
>  `NDEBUG` in file `xen/arch/x86/pv/dom0_build.c`. When I played with it, I
>  found that I'm unable to reproduce the issue when the code that reverses
>  MFN<->PFN mapping for Dom0 is active.

So the issue doesn't happen on debug=y builds?

That's unexpected.  I would expect the opposite, that some code in
Linux assumes that pfn + 1 == mfn + 1, and hence breaks when the
relation is reversed.

> - bug DOESN'T occur when using different storage than one backed by BOSS-S1.
> - bug was tested in few additional conditions and reproduction is not
>  dependent on these:
>  - -O1/-O2/no optimization behaves the same
>  - PAT patch to use Linux PAT layout instead of Xen's choice doesn't
>  change anything
>  (https://github.com/QubesOS/qubes-vmm-xen/blob/main/1018-x86-Use-Linux-s-PAT.patch)
>  - different Linux kernel version doesn't change anything
>  - vCPU pinning (e.g. single vCPU pinned to Dom0) doesn't change anything
> - bug was tested only with smt=1 because Xen doesn't boot properly on our
>  machines with smt=0 (hangs with "(XEN) CPU X still not dead", similar to
>  https://lists.xen.org/archives/html/xen-devel/2019-08/msg00138.html)

Hm, from that thread it seems like the original bug should already be
fixed.

> `xl info` for my testbed:
> 
> ```
> # xl info
> host : <redacted>
> release : 6.12.9+bpo-amd64
> version : #1 SMP PREEMPT_DYNAMIC Debian 6.12.9-1~bpo12+1 (2025-01-19)
> machine : x86_64
> nr_cpus : 28
> max_cpu_id : 27
> nr_nodes : 1
> cores_per_socket : 14
> threads_per_core : 2
> cpu_mhz : 2593.905
> hw_caps : bfebfbff:77fef3ff:2c100800:00000121:0000000f:d29ffffb:00000008:00000100
> virt_caps : pv hvm hvm_directio pv_directio hap shadow iommu_hap_pt_share vmtrace gnttab-v1 gnttab-v2
> total_memory : 130562
> free_memory : 96501
> sharing_freed_memory : 0
> sharing_used_memory : 0
> outstanding_claims : 0
> free_cpus : 0
> xen_major : 4
> xen_minor : 19
> xen_extra : .2-pre
> xen_version : 4.19.2-pre
> xen_caps : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
> xen_scheduler : credit2
> xen_pagesize : 4096
> platform_params : virt_start=0xffff800000000000
> xen_changeset : Tue Jan 21 09:21:01 2025 +0100 git:4803a3c5b5
> xen_commandline : placeholder dom0_mem=32G,max:32G dom0_max_vcpus=16 dom0_vcpus_pin=1 no-real-mode edd=off
> cc_compiler : gcc (Debian 12.2.0-14) 12.2.0
> cc_compile_by : root
> cc_compile_domain : <redacted>
> cc_compile_date : Mon Feb 17 17:31:08 UTC 2025
> build_id : 410ba653f1f1fc13770b5d2a8cdf5e4d285b6783
> xend_config_format : 4
> ```
> 
> After collecting all of these information I'm on a roadblock. Effects of this
> bug on memory constistency are pretty serious, but on the other hand, they occur 
> in very specific conditions, which makes them difficult to track. I would appreciate 
> any help in finding the root cause of this issue.

Can you see if you can reproduce with dom0-iommu=strict in the Xen
command line?

Thanks, Roger.

