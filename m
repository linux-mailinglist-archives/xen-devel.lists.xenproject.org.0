Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD7FAE3284
	for <lists+xen-devel@lfdr.de>; Sun, 22 Jun 2025 23:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021907.1397634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTSaM-0003UO-HN; Sun, 22 Jun 2025 21:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021907.1397634; Sun, 22 Jun 2025 21:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTSaM-0003SR-EL; Sun, 22 Jun 2025 21:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1021907;
 Sun, 22 Jun 2025 21:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTSaL-0003SL-2V
 for xen-devel@lists.xenproject.org; Sun, 22 Jun 2025 21:50:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0d00838-4fb2-11f0-b894-0df219b8e170;
 Sun, 22 Jun 2025 23:50:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8CA3660EDF;
 Sun, 22 Jun 2025 21:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E358C4CEE3;
 Sun, 22 Jun 2025 21:50:38 +0000 (UTC)
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
X-Inumbo-ID: f0d00838-4fb2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750629040;
	bh=w2eqZtNz3Hb/uDhj7Xf+kXbPo60Zn2SLlh+4f3k3GEc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NxcEixXyXz5dNH2YUXuOyLc76sVKAyNzU750MO7RQR9xkvfOd2TjVLe1yKu8LT3uN
	 5lu83niOGKFBBmLwzfdecn3wgioWSFB5jPWn2fyhr30HhIRvLKsZVLbFipXlUJTeWo
	 vx2lYsm3vKEY8PIfWAW4WMz6PDUqqDomRWw4CCFK0MlloUddSwXAIMo7WN7FrP79iu
	 x8GoWiZzAhxZygIJA3Tyhtq6P4lMw9dQaGYhOx54OnyEvB7mgxZZqiu1XYoGMnwRfE
	 x5tncbuKLnJ9oactmfMKtmWt90samr4rZZwQ07/KO5qDvaqaG3NyngvONWa22S9RJJ
	 0r1FW7Qnlrc8A==
Date: Sun, 22 Jun 2025 14:50:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
In-Reply-To: <90d57a47-56e6-4ddb-83fd-c5b5ee612d21@epam.com>
Message-ID: <alpine.DEB.2.22.394.2506221438250.8066@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop> <04B1F737-5E6B-47C0-B2B9-74288C68E68A@arm.com>
 <50ff5d2b-bd17-4833-b497-0dda6f75964a@epam.com> <alpine.DEB.2.22.394.2506171625110.1780597@ubuntu-linux-20-04-desktop> <538e4b45-74e7-4992-a9e2-7678756f7612@xen.org> <90d57a47-56e6-4ddb-83fd-c5b5ee612d21@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1219214540-1750628947=:8066"
Content-ID: <alpine.DEB.2.22.394.2506221449100.8066@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1219214540-1750628947=:8066
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2506221449101.8066@ubuntu-linux-20-04-desktop>

On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
> On 18/06/2025 10:22, Julien Grall wrote:
> > Hi,
> >
> > On 18/06/2025 00:38, Stefano Stabellini wrote:
> >> On Thu, 12 Jun 2025, Grygorii Strashko wrote:
> >>> On 02.06.25 10:17, Bertrand Marquis wrote:
> >>>>> On the other hand, if we also want to handle the case where the SCMI
> >>>>> server could be on a separate co-processor, then what this code is 
> >>>>> doing
> >>>>> is not sufficient because we also need a dcache flush, in addition to
> >>>>> the DSB.
> >>>>>
> >>>>> Bertrand, can you double-check?
> >>>>
> >>>> If we want to handle a case where the memory is accessible to a 
> >>>> coprocessor
> >>>> but there is no cache coherency, we need to flush the dcache 
> >>>> definitely.
> >>>>
> >>>> Seeing the amount of data here, I do agree with Stefano that it 
> >>>> would be a
> >>>> good
> >>>> idea to make the provision to flush the data cache in all cases. 
> >>>> Even if the
> >>>> data
> >>>> is accessed by a secure partition or the firmware coherently, 
> >>>> flushing in
> >>>> all cases
> >>>> would have very limited performance impact here.
> >>>>
> >>>> There is the other solution to have some kind of parameter to say 
> >>>> if the
> >>>> accessor
> >>>> has coherent cache access but I do not think the performance impact 
> >>>> here
> >>>> would
> >>>> justify such a complexity.
> >>>>
> >>> The SCMI shmem expected to be mapped as MT_NON_CACHEABLE in all cases.
> >
> > I can't find MT_NON_CACHEABLE anywhere in Xen or Linux. My 
> > interpretation is that the memory attribute would be normal memory non 
> > cacheable. However, this doesn't add up with ...
> >
> Sorry for the confusion. This define was taken from TF-A and it is the 
> same as Xen MT_NORMAL_NC.
> 
> The main idea was to mention that memory is non_cachable.
> 
> >>> The Linux does devm_ioremap() -> ioremap() ->
> >>> (ARM64)  __ioremap((addr), (size), __pgprot(PROT_DEVICE_nGnRE))
> >
> > ... this line. This is device nGnRE which is a lot more restrictive 
> > (for instance it doesn't allow unaligned access).
> >
> In Xen scmi memory is mapped using ioremap_nocache which is mapped as 
> MT_DEVICE_nGnRE (same as linux).
> 
> In TF-A SCMI shared memory is mapped as MT_DEVICE (which is 
> nGnRE: MAIR_DEV_nGnRE).
> 
> Again, sorry for the confusion.
> 
> >>>
> >>> There is also note in docs:
> >>> "+- shmem: shared memory for messages transfer, **Xen page aligned** 
> >>> with
> >>> mapping``p2m_mmio_direct_nc``."
> >>>
> >>> In the case of SCP - the SCMI shmem can be actually be in SRAM.
> >>>
> >>> So, are you sure cache manipulations are required here?
> >>
> >> No, if the memory is mapped as uncacheable everywhere then the cache
> >> manipulations are not needed. However, we probably still need a dsb.
> >>
> >> I understand now why they decided to use __memcpy_fromio in Linux: it is
> >> not MMIO but they needed a memcpy followed by DSB, so they decided to
> >> reuse the existing MMIO functions although the buffer is not MMIO.
> >
> > From my understanding, memcpy_fromio() is not just a mempcy() + dsb. 
> > It also guarantees the access will be aligned (this is not guarantee 
> > by our memcpy()).
> >
>  From my understanding Linux using memcpy_fromio() because memcpy 
> function is highly
> 
> optimized in linux and will produce exception,and looking into the 
> memcpy implementation
> 
> in Xen (xen/arch/arm/arm64/lib/memcpy.S) I'm not sure if it can be used 
> instead of memcpy_fromio. Could you please advise how to proceed?

If we map the memory in Xen as normal memory non-cacheable, then for
sure we should be able to use the regular memcpy plus a DSB at the end.
That's because unaligned accesses are allowed.

On the other hand, if we map the memory in Xen as device memory, then we
need to be careful about alignment.

Looking at xen/arch/arm/arm64/lib/memcpy.S, it seems to me that:
- it uses aligned accesses for size >= 16 bytes
- for size < 16 bytes, accesses might be unaligned depending on the
  alignment of the start address
- the start address, assuming it is the shared memory start address, is
  4K aligned, so we should be fine?

So it seems to me that we should be OK with using the regular memcpy
(plus a DSB at the end). It would be good for someone else to confirm.
--8323329-1219214540-1750628947=:8066--

