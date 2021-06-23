Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E33B221F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 22:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146299.269157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lw9wC-00049z-8E; Wed, 23 Jun 2021 20:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146299.269157; Wed, 23 Jun 2021 20:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lw9wC-00046v-4r; Wed, 23 Jun 2021 20:57:32 +0000
Received: by outflank-mailman (input) for mailman id 146299;
 Wed, 23 Jun 2021 20:57:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqu9=LR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lw9wB-00046n-Cn
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 20:57:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0afca0c7-0c06-4544-8b13-2307501881fc;
 Wed, 23 Jun 2021 20:57:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5130B610C7;
 Wed, 23 Jun 2021 20:57:29 +0000 (UTC)
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
X-Inumbo-ID: 0afca0c7-0c06-4544-8b13-2307501881fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624481849;
	bh=YCJzZScTVuwY+INyiGZAOgJVxazgYAMNMs/LWeB4mds=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NvtcE2jHVWpNU3nXBZ1C/O5ZMb3RFrFtQPPMLXPib9ZaJBsKcYcdy7MYVXhTXNAzE
	 XB7VvUnqQI0uc013npZMhec0gXTUNzWq3fswwGPurTes91+DT+lSFYHHOM8G8+gyxh
	 gTp+HeS+9dEDBcsq9BIAuEJ/FSWryklTrVdnmkEtHKyb98NqMxj4k4Tk2KYwDOt1uH
	 tPho2HKHEuzPenlqm8YYzpWbFlo9mYC+R+B6JP9n2wXN8kyr6ENox/469GdgfKgOCV
	 sgc7AgDKeyL3+2yi/un531QwPq+NYaKlmOYhlQiL0oE6n3po1kPY5rhlgx779E5pya
	 lVzYeT3RqGJ6w==
Date: Wed, 23 Jun 2021 13:57:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    "fnuv@xilinx.com" <fnuv@xilinx.com>
Subject: Re: smmuv1 breakage
In-Reply-To: <6CBD56EF-7420-4A43-8EF6-6CB0532BF108@arm.com>
Message-ID: <alpine.DEB.2.21.2106231357040.24906@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2106141840150.24906@sstabellini-ThinkPad-T480s> <791BFC00-6A50-48D2-A208-E529B887441F@arm.com> <alpine.DEB.2.21.2106151756190.24906@sstabellini-ThinkPad-T480s> <alpine.DEB.2.21.2106221405220.24906@sstabellini-ThinkPad-T480s>
 <55ACE88F-F72C-4715-B3B1-B7B7F1B4CFFB@arm.com> <6CBD56EF-7420-4A43-8EF6-6CB0532BF108@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1939976230-1624481849=:24906"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1939976230-1624481849=:24906
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 23 Jun 2021, Rahul Singh wrote:
> Hi Stefano,
> 
> > On 23 Jun 2021, at 9:09 am, Rahul Singh <Rahul.Singh@arm.com> wrote:
> >
> > Hi Stefano,
> >
> >> On 22 Jun 2021, at 10:06 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>
> >> Hi Rahul,
> >>
> >> Do you have an opinion on how we should move forward on this?
> >>
> >> Do you think it is OK to go for a full revert of "xen/arm: smmuv1:
> >> Intelligent SMR allocation" or do you think it is best to go with an
> >> alternative fix? If so, do you have something in mind?
> >>
> >
> > Sorry for the late reply I was working on another high-priority task.
> > I will work on this will try to fix the issue. I will update you within 2-3 days.
> 
> I again checked my patches and found out that while allocating SMR I by mistake
> allocated one SMR for each SMMU device but we have to allocate the number of
> SMR based on supported stream matching register for each SMMU device.
> 
> This might be causing the issue. As I don’t have any Xilinx hardware and on
> QEMU/Juno issue is not reproducible.Can you please test the attached patch and
> let me know if it works.

Yes this solves the issue for me, thank you!!


Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> >
> > Regards,
> > Rahul
> >
> >>
> >>
> >> On Tue, 15 Jun 2021, Stefano Stabellini wrote:
> >>> On Tue, 15 Jun 2021, Rahul Singh wrote:
> >>>> Hi Stefano
> >>>>
> >>>>> On 15 Jun 2021, at 3:21 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>>>
> >>>>> Hi Rahul,
> >>>>>
> >>>>> Unfortunately, after bisecting, I discovered a few more breakages due to
> >>>>> your smmuv1 series (commits e889809b .. 3e6047ddf) on Xilinx ZynqMP. I
> >>>>> attached the DTB as reference. Please note that I made sure to
> >>>>> cherry-pick "xen/arm: smmuv1: Revert associating the group pointer with
> >>>>> the S2CR" during bisection. So the errors are present also on staging.
> >>>>>
> >>>>> The first breakage is an error at boot time in smmu.c#find_smmu_master,
> >>>>> see log1. I think it is due to the lack of ability to parse the new smmu
> >>>>> bindings in the old smmu driver.
> >>>>>
> >>>>> After removing all the "smmus" and "#stream-id-cells" properties in
> >>>>> device tree, I get past the previous error, everything seems to be OK at
> >>>>> early boot, but I actually get SMMU errors as soon as dom0 starting
> >>>>> using devices:
> >>>>>
> >>>>> (XEN) smmu: /smmu@fd800000: Unexpected global fault, this could be serious
> >>>>> (XEN) smmu: /smmu@fd800000:     GFSR 0x80000002, GFSYNR0 0x00000000, GFSYNR1 0x00000877, GFSYNR2 0x00000000
> >>>>
> >>>> This fault is "Unidentified stream fault” for StreamID “ 0x877” that means SMMU SMR is not configured for streamID “0x877"
> >>>>
> >>>>
> >>>>> [   10.419681] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> >>>>> [   10.426452] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> >>>>>
> >>>>> Do you think you'll be able to help fix them?
> >>>>>
> >>>>>
> >>>>> You should be able to reproduce the two issues using Xilinx QEMU (but to
> >>>>> be honest I haven't tested it on QEMU yet, I was testing on real
> >>>>> hardware):
> >>>>> - clone and compile xilinx QEMU https://github.com/Xilinx/qemu.git
> >>>>> ./configure  --target-list=aarch64-softmmu
> >>>>> make
> >>>>> - clone and build git://github.com/Xilinx/qemu-devicetrees.git
> >>>>> - use the attached script to run it
> >>>>>  - kernel can be upstream defconfig 5.10
> >>>>>
> >>>>
> >>>> I tried to reproduce the issue on Xilinx QEMU as per the steps shared above
> >>>> but I am not observing any issue on Xilinx QEMU.
> >>>
> >>> I tried on QEMU and it doesn't repro. I cannot explain why it works on
> >>> QEMU and it fails on real hardware.
> >>>
> >>>
> >>>> I also tested and confirmed on QEMU that SMMU is configured correctly
> >>>> for specifically StreamID “ 0x877” and for other streamIDs.
> >>>>
> >>>> I check the xen.dtb shared by you and found out the there is no "stream-id-cells”
> >>>> property in the master device but the "mmu-masters" property is present in the
> >>>> smmu node. For legacy smmu binding we need both "stream-id-cells” and "mmu-masters”.
> >>>> If you need to add the new smmu binding please add the "iommu-cells”
> >>>> property in the smmu node and the “iommus” property in the master device.
> >>>
> >>> In regards to the missing "stream-id-cells" property, I shared the wrong
> >>> dtb before, sorry. I was running a number of tests and I might have
> >>> picked the wrong file. The proper dtb comes with "stream-id-cells" for
> >>> the 0x877 device, see attached.
> >>>
> >>>
> >>>
> >>>> Can you please share the xen boot logs with me so that I can debug further why the error is observed?
> >>>
> >>> See attached. I did some debugging and discovered that it crashes while
> >>> accessing master->of_node in find_smmu_master. If I revert your series,
> >>> the crash goes away. It is very strange because your patches don't touch
> >>> find_smmu_master or insert_smmu_master directly.
> >>>
> >>> I did a git reset --hard on the commit "xen/arm: smmuv1: Add a stream
> >>> map entry iterator" and it worked, which points to "xen/arm: smmuv1:
> >>> Intelligent SMR allocation" being the problem, even if I have the revert
> >>> cherry-picked on top. Maybe the revert is not reverting enough?
> >>>
> >>> After this test, I switched back to staging and did:
> >>> git revert 9f6cd4983715cb31f0ea540e6bbb63f799a35d8a
> >>> git revert 0435784cc75dcfef3b5f59c29deb1dbb84265ddb
> >>>
> >>> And it worked! So the issue truly is that
> >>> 9f6cd4983715cb31f0ea540e6bbb63f799a35d8a doesn't revert "enough".
> >>> See "full-revert" for the patch reverting the remaining code. That on
> >>> top of staging fixes boot for me.
> >
> 
> 
> 
--8323329-1939976230-1624481849=:24906--

