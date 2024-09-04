Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCD96B8A9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790095.1199807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnN2-0001uI-5r; Wed, 04 Sep 2024 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790095.1199807; Wed, 04 Sep 2024 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnN2-0001rb-2w; Wed, 04 Sep 2024 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 790095;
 Wed, 04 Sep 2024 10:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4DE=QC=bounce.vates.tech=bounce-md_30504962.66d83819.v1-7dbaa65eefb84c7ca7f0b69f7082cba2@srs-se1.protection.inumbo.net>)
 id 1slnMz-0001pn-S5
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:36:14 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fb50d67-6aa9-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 12:36:10 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WzJn51JwvzRKLqb6
 for <xen-devel@lists.xenproject.org>; Wed,  4 Sep 2024 10:36:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7dbaa65eefb84c7ca7f0b69f7082cba2; Wed, 04 Sep 2024 10:36:09 +0000
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
X-Inumbo-ID: 7fb50d67-6aa9-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725446169; x=1725706669;
	bh=1lN7njsB3pEnl85es1wvxrkYCJ8BJ58GrmcvmCwsBfI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Kmikft4aTVOTofSRHWICd9wsapg16zzUkG90a1rBfWtQBy/13eepWcM2myx0SZjAI
	 L9G7RfaWNFnSEa9yPD4YbwSMkqcL8HLhQQsu1IxhouX3Q9pTcFzEhqxav+r9REXtIU
	 WgLZIadxOSMJnLKV9ERUzYTHDBgWr1536jehuz+09fOGLA7AEiJH529DA3e205KyqL
	 a8gbG7c2iceKemclva/3PJhwfwpCbdSKiJIoMN7eTABJAMr43bhdpKNll4mdWKZlZb
	 aQt9DYAAaPWER/0Kt1A6nxD7vf4CN3BrLeWq43tAX9Hb4KNWzl/DcKQ/Q7iN1Vlek6
	 nS9Vj3IEywvIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725446169; x=1725706669; i=vaishali.thakkar@vates.tech;
	bh=1lN7njsB3pEnl85es1wvxrkYCJ8BJ58GrmcvmCwsBfI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BqRHvxVpcGue5C/xstsY9LXZSJea968ICCthSKVZlcu/3EyDf6abhddiVEkV6p61r
	 qwBA3fkFHpKqNMjHrHYYj15A7tPjvumBcrEWcbPeDrcdQ0bnRahtJOly3a5mT93N/K
	 Mcwtl7TXBtqVDn9A+KFlx73E+2KCNGVlELAN4Po2pfJIJPhYxsn3cgkxIHCDyz39HJ
	 yhwCnBwXBkJ3fFDnjVdUmszahwNmCMzFArdJ3WQMcLn9UBZM9sEaGYNPpFoHO2GDWs
	 miQ2e5/HCr1jTxm1vkCzIv5xxBJ33uA81M2UfDVhohsgsHWSjcGYX7v4d0R4Tzs2mG
	 4mLj5u6uUT28Q==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC-for-4.20=20v2=200/1]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20allocator?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725446168245
Message-Id: <813e1936-4904-4962-8364-32aef77ab4e1@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com
References: <cover.1723574652.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1723574652.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7dbaa65eefb84c7ca7f0b69f7082cba2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240904:md
Date: Wed, 04 Sep 2024 10:36:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi All,

Gentle ping, I would appreciate some reviews here. Especially because in v2
the whole domain liefcylce with the fixed ASID works. So, I would love to 
know if it's going in the right direction or not.

Thanks!

On 8/13/24 8:58 PM, Vaishali Thakkar wrote:
> Motivation:
> -----------
> This is part of the effort to enable AMD SEV technologies in Xen. For
> AMD SEV support, we need a fixed ASID associated with all vcpus of the
> same domain throughout the domain's lifetime. This is because for SEV/
> SEV-{ES,SNP} VM, the ASID is the index which is associated with the
> encryption key.
> 
> Currently, ASID generation and management is done per-PCPU in Xen. And
> at the time of each VMENTER, the ASID associated with vcpus of the
> domain is changed. This implementation is incompatible with SEV
> technologies for the above mentioned reasons. In a discussion with
> Andrew Cooper, it came up that it=E2=80=99ll be nice to have fixed ASIDs =
not
> only for SEV VMs but also for all VMs. Because it opens up the
> opportunity to use instructions like TLBSYNC and INVLPGB (Section
> 5.5.3 in AMD Architecture manual[0]) for broadcasting the TLB
> Invalidations.
> 
> Changes since v1:
> -----------------
> As discussed in v1 and at the Xen summit, this version changes the
> flow of the asid assignment. I initialize asids by calling CPUID
> on each cpu during the __start_xen. The assignment of the asid
> happens at the domain creation time at HVM level and later it is
> mapped to individual hardware fields ASID/VPID at the VMRUN. ASID
> is flushed when the domain is destroyed. Please check the comment in
> xen/arch/x86/hvm/asid.c to check the implemenmtation flow. Detailed
> list of changes is mentioned in the patch.
> 
> Few questions I have:
> ---------------------
> 1. While in this version I keep using hvm_asid_flush_domain in svm_invlpg=
,
> I'm wondering if we need to do hvm_asid_flush_vcpu in this case? If so,
> what would be the preferred way to flush vcpu specific TLB entries here?
> 2. Currently I assign asid at the VCPU level at VMRUN. But is there any
> way to do it more early in the process? I tried to do it after the
> hvm_vcpu_initialize and hvm_vcpu_up but wasn't really successfull in
> doing so.
> 3. While there is a plan to use TLBSYNC in the future. My understanding
> is intel doesn't have an equivalent instruction. Do we need a separate
> function that is able to do it?
> 4. How is the freeing of resources done when Xen is destroyed? I couldn't
> find something equivalent of svm_hardware_unsetup in linux kernel.
> 
> Notes:
> ------
> 1. As discussed at Xen Summit, changes related to demonstrating the use
> of TLBSYNC and INVLPGB won't be part of this patchset.
> 2. Changes are tested on AMD EPYC Genoa at the moment.
> 
> Vaishali Thakkar (1):
>    x86/hvm: Introduce Xen-wide ASID allocator
> 
>   xen/arch/x86/domain.c                  |   7 ++
>   xen/arch/x86/flushtlb.c                |   4 -
>   xen/arch/x86/hvm/asid.c                | 136 +++++++++++++------------
>   xen/arch/x86/hvm/hvm.c                 |   6 +-
>   xen/arch/x86/hvm/nestedhvm.c           |   4 +-
>   xen/arch/x86/hvm/svm/asid.c            |  37 ++++---
>   xen/arch/x86/hvm/svm/nestedsvm.c       |   5 +-
>   xen/arch/x86/hvm/svm/svm.c             |  32 ++----
>   xen/arch/x86/hvm/svm/svm.h             |   3 -
>   xen/arch/x86/hvm/vmx/vmcs.c            |   2 -
>   xen/arch/x86/hvm/vmx/vmx.c             |  37 ++-----
>   xen/arch/x86/hvm/vmx/vvmx.c            |   7 +-
>   xen/arch/x86/include/asm/hvm/asid.h    |  24 ++---
>   xen/arch/x86/include/asm/hvm/domain.h  |   7 ++
>   xen/arch/x86/include/asm/hvm/hvm.h     |  11 --
>   xen/arch/x86/include/asm/hvm/svm/svm.h |   2 +
>   xen/arch/x86/include/asm/hvm/vcpu.h    |   9 --
>   xen/arch/x86/include/asm/hvm/vmx/vmx.h |   3 +-
>   xen/arch/x86/mm/hap/hap.c              |   5 +-
>   xen/arch/x86/mm/p2m.c                  |   6 +-
>   xen/arch/x86/mm/paging.c               |   3 +-
>   xen/arch/x86/pv/domain.c               |   1 +
>   xen/arch/x86/setup.c                   |  10 ++
>   23 files changed, 173 insertions(+), 188 deletions(-)
>


