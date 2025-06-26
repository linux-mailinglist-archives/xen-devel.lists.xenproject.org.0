Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC96EAE9FB7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026456.1401661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnAp-00016P-KU; Thu, 26 Jun 2025 14:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026456.1401661; Thu, 26 Jun 2025 14:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnAp-0000zv-Fv; Thu, 26 Jun 2025 14:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1026456;
 Thu, 26 Jun 2025 14:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Z5=ZJ=bounce.vates.tech=bounce-md_30504962.685d52cb.v1-8194c57ddcf2475c99955f729ca8d011@srs-se1.protection.inumbo.net>)
 id 1uUnAo-0000rM-J3
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:01:54 +0000
Received: from mail187-29.suw11.mandrillapp.com
 (mail187-29.suw11.mandrillapp.com [198.2.187.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0bce55-5296-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 16:01:49 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-29.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4bSgNC5kTXz7lmZNy
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 14:01:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8194c57ddcf2475c99955f729ca8d011; Thu, 26 Jun 2025 14:01:47 +0000
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
X-Inumbo-ID: 1a0bce55-5296-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1750946507; x=1751216507;
	bh=D//ZFc6UoOgONIbmthT1nBmp9LrwkgeSRqu/qNbCOso=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ayQIMBCHRIhaLqrMuOnp2uKxB7hLenYWdkJTJC9yRDSGCncijLq8vkINwqZVtA/Rb
	 JLkqRlcs8D+b7DbOn/oBz2Pr22QmWx29bKYdYXifPjUOC921YApMJUzrOSj3o9yJVO
	 QF+HjcG2QZ+0+gL2lWHXWU2oYwtY1caY0rr87PjhMW6Z5bvMCF8OAtATYR52159EKj
	 kGOvBP5R9k/M7vPFK0xJ1FQLiWMTC0lWr0S2m8r3mrjVcGfOtvXQuIu00fRy7Na2fo
	 5FLyfmFThBgN9Wwip2mgJMnsVicZKFzu+s+w9RfAI990dFWUBorT7buOS1uJSULEg3
	 cHMznu/RbGUPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1750946507; x=1751207007; i=teddy.astie@vates.tech;
	bh=D//ZFc6UoOgONIbmthT1nBmp9LrwkgeSRqu/qNbCOso=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=NQmADtk13iQYLh4XfzP2ihOks0gOVQCeBXjPVeACM0aH8Ur0HoPdLEkBn/SCHL9wC
	 z6zhEwszt9HzcxGV3QeasDWyOfNLqXI1Srn7wC2+VldA3UfDIUjtO/lvd1unuFfNmo
	 aqusrc39PTMSplFb7sJfWpwStPkli+pKwDLMrpEpi2CbPzTO1eOsrhYaildEcPtqF9
	 fvz7hRv3K4PQs0BO5HjTfKXorwrzH1BEJhCoOO18vTWd7PMSSYQnayLVaafAIUDYyw
	 1T1wQv+13de1XytyDwtNmNoaMJhlKgT12fcL8FMGrI44pNaOaGH8m2e3rt/34gDU5Q
	 H8kam+NNWOacw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3=200/3]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20allocator?=
X-Mailer: git-send-email 2.50.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1750946504564
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <cover.1750770621.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8194c57ddcf2475c99955f729ca8d011?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250626:md
Date: Thu, 26 Jun 2025 14:01:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Vaishali Thakkar <vaishali.thakkar@suse.com> (formely vates.tech)
original v2: https://lore.kernel.org/xen-devel/cover.1723574652.git.vaishali.thakkar@vates.tech/

This is part of the effort to enable AMD SEV technologies in Xen. For
AMD SEV support, we need a fixed ASID associated with all vcpus of the
same domain throughout the domain's lifetime. This is because for SEV/
SEV-{ES,SNP} VM, the ASID is the index which is associated with the
encryption key.

Currently, ASID generation and management is done per-PCPU in Xen. And
at the time of each VMENTER, the ASID associated with vcpus of the
domain is changed. This implementation is incompatible with SEV
technologies for the above mentioned reasons. In a discussion with
Andrew Cooper, it came up that it'll be nice to have fixed ASIDs not
only for SEV VMs but also for all VMs. Because it opens up the
opportunity to use features like TLBSYNC/INVLPGB (Section
5.5.3 in AMD Architecture manual[0]) and Intel RAR [1] for broadcasting
the TLB Invalidations.

Changes since v2:
-----------------
A lot has changed since v2, though the concept is still the same.
The asid management logic is a lot simpler, by relying a bitmap to track
all used ASIDs, and freeing them individually instead of using a ASID
reclaim strategy.

When a vCPU needs to be flushed, it is signaled through vcpu.needs_tlb_flush,
indicating that the next time the guest is re-entered, a TLB flush will have
to be issued (either using per-context invvpid on Intel or flush-by-asid
tlb_control on AMD).

Changes were tested on Intel Haswell, KVM AMD virtual machine and AMD EPYC Genoa.

Teddy Astie (3):
  vmx: Rewrite vpid_sync_vcpu_gva
  vmx: Introduce vcpu single context VPID invalidation
  x86/hvm: Introduce Xen-wide ASID allocator

 xen/arch/x86/flushtlb.c                |  31 +++---
 xen/arch/x86/hvm/asid.c                | 148 +++++++++----------------
 xen/arch/x86/hvm/emulate.c             |   2 +-
 xen/arch/x86/hvm/hvm.c                 |  14 ++-
 xen/arch/x86/hvm/nestedhvm.c           |   6 +-
 xen/arch/x86/hvm/svm/asid.c            |  77 ++++++++-----
 xen/arch/x86/hvm/svm/nestedsvm.c       |   1 -
 xen/arch/x86/hvm/svm/svm.c             |  36 +++---
 xen/arch/x86/hvm/svm/svm.h             |   4 -
 xen/arch/x86/hvm/vmx/vmcs.c            |   5 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  68 ++++++------
 xen/arch/x86/hvm/vmx/vvmx.c            |   5 +-
 xen/arch/x86/include/asm/flushtlb.h    |   7 --
 xen/arch/x86/include/asm/hvm/asid.h    |  25 ++---
 xen/arch/x86/include/asm/hvm/domain.h  |   1 +
 xen/arch/x86/include/asm/hvm/hvm.h     |  15 +--
 xen/arch/x86/include/asm/hvm/svm/svm.h |   5 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |  10 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  44 ++++----
 xen/arch/x86/mm/hap/hap.c              |   6 +-
 xen/arch/x86/mm/p2m.c                  |   7 +-
 xen/arch/x86/mm/paging.c               |   2 +-
 xen/arch/x86/mm/shadow/hvm.c           |   1 +
 xen/arch/x86/mm/shadow/multi.c         |  12 +-
 xen/include/xen/sched.h                |   2 +
 25 files changed, 249 insertions(+), 285 deletions(-)

-- 
2.50.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


