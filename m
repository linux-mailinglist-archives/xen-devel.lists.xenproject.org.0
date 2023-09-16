Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D387A2ECA
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 10:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603542.940568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhQTZ-0006TI-Vt; Sat, 16 Sep 2023 08:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603542.940568; Sat, 16 Sep 2023 08:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhQTZ-0006Qj-T8; Sat, 16 Sep 2023 08:16:25 +0000
Received: by outflank-mailman (input) for mailman id 603542;
 Sat, 16 Sep 2023 08:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8KG6=FA=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qhQTY-0006Qd-8f
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 08:16:24 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5208d0fe-5469-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 10:16:22 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso25708575ad.2
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 01:16:22 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-203.hinet-ip.hinet.net.
 [211.75.219.203]) by smtp.gmail.com with ESMTPSA id
 ob6-20020a17090b390600b00274803c4c90sm3375365pjb.40.2023.09.16.01.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 01:16:20 -0700 (PDT)
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
X-Inumbo-ID: 5208d0fe-5469-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694852181; x=1695456981; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=znzxBn3XMW/AVPV60GAuf3cZnI47t+BFwyFxpeecC1w=;
        b=mSbSRLjsV18Azkbgtid68EhBhkSR+aTWWOrEpIPcH2UP+JxxPlZNzHfPQdS+C27sjs
         rl1NFWdzjSYhcescWW73QpY5JwQue8vPzI26UufOhViYeBKy9gpLNfUKJ6gU6R3svjOx
         VdEoQD5joRGABcAYVfJPozUPec5FDOkn9QrFe3qvonUKTFfHoJwJp1Tr1myBtB4/LCSQ
         ZndGHsN/LMCb2ethfBZ5DkOn+8SVIbk6zdpFagw6AHAfeNPZ7TxR9bMrXx2dYe+hsNDQ
         /eBZX2a3GvugPghZrBcnhuh6+pmzMqVRmO69ddbQY2aPSJ+qNFDZKBzRQcu6J26mnSpP
         OiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694852181; x=1695456981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znzxBn3XMW/AVPV60GAuf3cZnI47t+BFwyFxpeecC1w=;
        b=xONzSCL3b14LFZGfpS3yg+eJaCpi7TOpk8Qgg0le5wOgFs1zb9POmY8ZQvVi0nqCvx
         Agh63vhnsdayaLioW0O0nJbOC8EkziQ+qhfMMT0dKQVrNJcgTmyskhSOKNrMLQQZEY+5
         P2miIyy2OPq1kp11Vq2tjyogVUtlj3HI4EUMVoFHR/Qlwyf5Tg6z2eLgBkQ39S/9zr3m
         FdePMDxoHiizjFaqDwsovBAsEEfjMUqRZlQafA9pslru4CO25K2Kur0KBJPTvqEQS/LM
         JqDViJ/i6ZDUeZbPeI4vZc7ZoxQze269tfUI+TqesMkME5gQb/AUDxSWjlIKj6FAAoQ8
         03JA==
X-Gm-Message-State: AOJu0YxlXCQuFTJizp9slDzIxVNvOJAlm3pjK1ieZsaWLvxf06HS2UQm
	hZ54l5DgUKMYAEVusyQmkakXO+/sdCUo2Jv9PO8=
X-Google-Smtp-Source: AGHT+IFCGeiJEw8+LJM5viMxzLIJ5dDA6tRJQbOj5AiVpdJzZuNs8IYnYnEUFN09gdvkaXmIESLGpQ==
X-Received: by 2002:a17:90a:1347:b0:274:9823:b481 with SMTP id y7-20020a17090a134700b002749823b481mr3484649pjf.9.1694852181053;
        Sat, 16 Sep 2023 01:16:21 -0700 (PDT)
Date: Sat, 16 Sep 2023 16:16:15 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
Subject: Re: RFC: arm64: Handling reserved memory nodes
Message-ID: <20230916081541.GA3291774@leoy-huanghe.lan>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
 <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>

Hi Julien,

On Thu, Sep 14, 2023 at 10:37:05AM +0100, Julien Grall wrote:

[...]

> > This error is caused by kernel using an invalid memory frame number
> > 0x1a02dc, we can convert it to the address:
> > 
> >    0x1a02dc << PAGE_SHIFT = 0x1_a02d_c000
> 
> This error is coming from get_page_from_gva(). The use of the function is
> usually an indication that Xen is trying to access the page. Can you use
> WARN() to provide a full trace?

With adding WARN(), I can get below trace log:

  (XEN) arch/arm/p2m.c:2206: d0v0: Failing to acquire the MFN 0x1a0171
  (XEN) Xen WARN at arch/arm/p2m.c:2208
  (XEN) ----[ Xen-4.18-unstable  arm64  debug=y  Tainted:      S ]----
  (XEN) CPU:    0
  (XEN) PC:     00007f000027540c get_page_from_gva+0x30c/0x334
  (XEN) LR:     00007f000027540c
  (XEN) SP:     00008002ffee7a20
  (XEN) CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
  (XEN)      X0: 00007f0000318038  X1: 0000000000000000  X2: 0000000000000000
  (XEN)      X3: 0000000000000001  X4: 00007f00002bf956  X5: 0000000000000000
  (XEN)      X6: 00008002ffff2150  X7: 00008002ffff2150  X8: 7f7f7f7f7f7f7f7f
  (XEN)      X9: 0000000000000080 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
  (XEN)     X12: 0000000000000008 X13: 0000000000000030 X14: 0000000000000000
  (XEN)     X15: 000000003be6b29d X16: 000000000000000c X17: 000000009c4542e5
  (XEN)     X18: 0000000000000014 X19: 00008002fffcd000 X20: 00008002ffeef000
  (XEN)     X21: 00007f08054050b8 X22: 0000000000000000 X23: 00000000001a0171
  (XEN)     X24: 00000001a0171d80 X25: 0000000000000004 X26: 0000000000000000
  (XEN)     X27: 00008002ffeef000 X28: 0000000000001000  FP: 00008002ffee7a20
  (XEN) 
  (XEN)   VTCR_EL2: 00000000800a3558
  (XEN)  VTTBR_EL2: 00010002fffca000
  (XEN) 
  (XEN)  SCTLR_EL2: 0000000030cd183d
  (XEN)    HCR_EL2: 00000000807c663f
  (XEN)  TTBR0_EL2: 0000000020251000
  (XEN) 
  (XEN)    ESR_EL2: 00000000f2000001
  (XEN)  HPFAR_EL2: 0000000000176800
  (XEN)    FAR_EL2: ffffffc011900000
  (XEN) 
  (XEN) Xen stack trace from sp=00008002ffee7a20:
  (XEN)    00008002ffee7a80 00007f000026cc44 0000000000000d80 0000000000000018
  (XEN)    0000000000000007 0000000000000018 00008002ffee7cf8 ffffffc01187bd80
  (XEN)    00008002ffee7ad0 00000000ffffffc8 00008002ffee7ab0 00007f000032211e
  (XEN)    00008002ffee7b00 00007f000026ce54 ffffffffffffffdf ffffffc01187bd80
  (XEN)    0000000000000007 0000000000000000 00008002fffcd000 ffffffc0117cc000
  (XEN)    00000001a01db000 0000000000000000 0000000000000000 0000000000000000
  (XEN)    0000000000000007 00007f00002b0018 00008002ffeefe16 0000000000000000
  (XEN)    00008002ffee7b10 00007f000021ab3c 00008002ffee7e40 00007f0000277c84
  (XEN)    00008002ffee7ea0 000000005a000ea1 00008002ffee7f20 00008002ffeef000
  (XEN)    000000005a000ea1 ffffffc0117cc000 00007f00003190a4 00007f0000319080
  (XEN)    000000000000001b 00008002ffee7c20 00008002ffee7b90 00007f000026e27c
  (XEN)    0000000000000000 00007f000026e384 00008002ffee7bd0 00007f0000269f88
  (XEN)    000000000000001b 00007f0000329000 00008002ffee7c20 0000000000000000
  (XEN)    0000000000001fff 0000000080000249 00008002ffee7c10 00007f00002797cc
  (XEN)    0000000000000010 000000005a000ea1 00008002ffee7d28 0000000080000249
  (XEN)    000000005a000ea1 ffffffc011603ba8 00008002ffee7d40 00007f000026232c
  (XEN)    00008002ffee7c50 00007f0000270a68 00008002fffcd000 00008002ffeef000
  (XEN)    00007f0800e4d0a8 00008002ffeef000 00008002ffee7c70 00007f0000223f48
  (XEN)    00008002ffee7c90 00007f0000224264 00007f00002bfa20 00008002ffee7dca
  (XEN)    0000000000000000 00008002ffee7dca 00008002ffee7cb0 00007f00002242dc
  (XEN)    00000000000002c0 00007f000024b068 00008002ffee7cd0 00007f000024b0c4
  (XEN)    000000000000000a 00007f000026ce54 00008002ffee7d40 00007f00002484c0
  (XEN)    000000000000000a 000000005a000ea1 00008002ffee7d20 00007f0000224264
  (XEN)    00007f00002bf950 000000005a000ea1 000000000000000a 000000000000000a
  (XEN)    00008002ffee7d40 00007f00002242bc 000000000000000a 00000000000002c0
  (XEN)    00008002ffee7d50 00007f000024946c 00008002ffee7e40 00007f0000277cc0
  (XEN)    00008002ffee7ea0 000000005a000ea1 00008002ffee7f20 00008002ffeef000
  (XEN)    000000005a000ea1 ffffffc011613d40 ffffffc011713878 0000000000000059
  (XEN)    00008002ffee7dc0 00007f0000223f48 00008002ffee7de0 00007f0000224264
  (XEN)    00008002ffee7de0 00007f0000223f48 00008002ffee7e00 00007f0000224264
  (XEN)    00008002ffeefe10 00008002ffeef000 00007f0000318288 0000000000000004
  (XEN)    00008002ffee7e20 00007f00002242dc 0000000000000240 00008002ffeef000
  (XEN)    00008002ffee7e40 00007f000027c484 0000000000000004 0000000000000000
  (XEN)    00008002ffee7e70 00007f0000279400 00008002ffee7ea0 000000005a000ea1
  (XEN)    00008002ffee7fa8 0000000080000005 ffffffc01187bd30 00007f0000262480
  (XEN)    0000000000000000 ffffffc0117d2000 ffffffc01187bd30 00007f0000262474
  (XEN)    0000000000000007 ffffffc01187bd80 00000000001a01db 0000000000000005
  (XEN)    0000000000000005 ffffffc011802880 ffffffc0118028e0 0000000000000018
  (XEN)    0000000020000000 ffffffc010021d1c ffffff81bfcabb90 0000000000000040
  (XEN)    0000000000000000 00000000000003da ffffffffffffffff 000000003be6b29d
  (XEN) Xen call trace:
  (XEN)    [<00007f000027540c>] get_page_from_gva+0x30c/0x334 (PC)
  (XEN)    [<00007f000027540c>] get_page_from_gva+0x30c/0x334 (LR)
  (XEN)    [<00007f000026cc44>] guestcopy.c#copy_guest+0x198/0x2ec
  (XEN)    [<00007f000026ce54>] raw_copy_from_guest+0x20/0x28
  (XEN)    [<00007f000021ab3c>] do_memory_op+0x1104/0x24c0
  (XEN)    [<00007f0000277c84>] traps.c#do_trap_hypercall+0x120/0x288
  (XEN)    [<00007f0000279400>] do_trap_guest_sync+0x448/0x63c
  (XEN)    [<00007f0000262480>] entry.o#guest_sync_slowpath+0xa8/0xd8
  (XEN) 

I can match the hypervisor trap with the Linux kernel function
xen_guest_init() in arch/arm/xen/enlighten.c:

  static int __init xen_guest_init(void)
  {
    struct xen_add_to_physmap xatp;
    ...

    shared_info_page = (struct shared_info *)get_zeroed_page(GFP_KERNEL);

    if (!shared_info_page) {
            pr_err("not enough memory\n");
            return -ENOMEM;
    }
    xatp.domid = DOMID_SELF;
    xatp.idx = 0;
    xatp.space = XENMAPSPACE_shared_info;
    xatp.gpfn = virt_to_gfn(shared_info_page);

    if (HYPERVISOR_memory_op(XENMEM_add_to_physmap, &xatp))
            BUG();
    ...
  }

My understanding is the local variable 'xatp' is located in the stack
and the stack is located in the intermediate physical address
0x1_a017_1000. Thus, when copies the structure 'xatp' from Dom0 to the
Xen hypervisor, the hypervisor detects the IPA is not managed by its
frame table.

This is because the memory range [00000001a0000000 - 00000001bfffffff]
is the reserved region so Xen hypervisor doesn't populate this region
and the frame table doesn't initialize for it.  On the other hand,
this memory range is passed to Dom0 Kernel as _normal_ memory region
and the kernel allocates pages from this memory region, same with
other memory regions.

[...]

> > ## Fixes
> > 
> > I think it's wrong to add the reserved memory regions into the DT
> > binding as normal memory nodes for Dom0 kernel.  On the other hand, we
> > cannot simply remove these reserved memory regions and don't pass to
> > Dom0 kernel - we might reserve memory for specific purpose, for example,
> > ramoops [1] for kernel debugging.
> > 
> > The right thing to do is to keep these reserved memory nodes to Dom0
> > kernel.  So one task is to record properties for these reserved memory
> > node name and properties and pass to Dom0 kernel.
> > 
> > The difficulty is how we can avoid allocate these reserved memory
> > regions in Xen hypervisor.  We cannot register the reserved memory
> > into the boot pages, otherwise, the reserved memory might be allocated
> > in the early phase.  But we need to register these pages into the
> > frame management framework and reserve them in the first place, so
> > that we can allow Dom0 kernel to use them.  (I checked a bit the static
> > memory mechanism, seems to me we cannot use it to resolve this issue).
> 
> From my understanding reserved region are normal RAM which have been carved
> out for specific purpose. They may expect different caching policy (e.g.
> non-cachable).

Yes, I agree, but we cannot assume the mapping attribution is always
non-cachable. It can be mapped as normal type, or device type (with and
different variants, like strong ordered, write-combined, etc).

> AFAIK, Xen doesn't have the capability to know the memory
> attribute (the DT binding only tell whether the region should not mapped.
> See the property "no-map"), hence why they were excluded from the memory
> management.

I think it's right to exclude the reserved memory regions from the
normal memory management.

Here the problem is these reserved memory regions are passed as normal
memory nodes to Dom0 kernel, then Dom0 kernel allocates pages from
these reserved memory regions.  Apparently, this might lead to conflict,
e.g. the reserved memory is used by Dom0 kernel, at the meantime the
memory is used by another purpose (e.g. by MCU in the system).

Here I am a bit confused for "Xen doesn't have the capability to know
the memory attribute".  I looked into the file arch/arm/guest_walk.c,
IIUC, it walks through the stage 1's page tables for the virtual
machine and get the permission for the mapping, we also can get to
know the mapping attribute, right?

Another question for the attribute for MMIO regions. For mapping MMIO
regions, prepare_dtb_hwdom() sets the attribute 'p2m_mmio_direct_c'
for the stage 2, but in the Linux kernel the MMIO's attribute can
be one of below variants:

- ioremap(): device type with nGnRE;
- ioremap_np(): device type with nGnRnE (strong-ordered);
- ioremap_wc(): normal non-cachable.

If Xen hypervisor can handle these MMIO types in stage 2, then we should
can use the same way to map stage 2 tables for the reserved memory.  A
difference for the reserved memory is it can be mapped as normal memory
with cacheable.

> It would be good to understand why Xen may try to get a reference on the
> page.

I think the above log can answer this question.

> Also, can you find the associated reserved-region and content of the
> Device-Tree?

The DT binding is something like (I tweaked a bit for readable):

	memory@20000000 {
		#address-cells = <0x02>;
		#size-cells = <0x02>;
		device_type = "memory";
		reg = <0x00 0x20000000 0x00 0xa0000000>,
                      <0x01 0xa0000000 0x01 0x60000000>;
	};


	reserved-memory {
		#address-cells = <0x02>;
		#size-cells = <0x02>;
		ranges;

		reserved_mem1 {
			reg = <0x00 0x20000000 0x00 0x00010000>;
			no-map;
		};

		reserved_mem2 {
			reg = <0x00 0x40000000 0x00 0x20000000>;
			no-map;
		};

		reserved_mem3 {
			reg = <0x01 0xa0000000 0x00 0x20000000>;
			no-map;
		};

		reserved_mem4 {
			reg = <0x00 0x2e000000 0x00 0x02000000>;
			no-map;
		};
        };

Thanks,
Leo

