Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600AD950CB5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 21:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776561.1186721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdwkW-0003tT-Jw; Tue, 13 Aug 2024 19:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776561.1186721; Tue, 13 Aug 2024 19:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdwkW-0003qO-Gy; Tue, 13 Aug 2024 19:00:04 +0000
Received: by outflank-mailman (input) for mailman id 776561;
 Tue, 13 Aug 2024 19:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MCJY=PM=bounce.vates.tech=bounce-md_30504962.66bbad2d.v1-15a93eaf01c345ee8cefb9544269e0db@srs-se1.protection.inumbo.net>)
 id 1sdwkV-0003ct-HZ
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 19:00:03 +0000
Received: from mail135-25.atl141.mandrillapp.com
 (mail135-25.atl141.mandrillapp.com [198.2.135.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3da94242-59a6-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 21:00:01 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-25.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Wk10Y352Rz4f3k3f
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 18:59:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 15a93eaf01c345ee8cefb9544269e0db; Tue, 13 Aug 2024 18:59:57 +0000
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
X-Inumbo-ID: 3da94242-59a6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1723575597; x=1723836097;
	bh=jApk1oSyqSGAleIrGQXOfYFF3DlJnkMxjXzHJyQS17g=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=pJ1EaBZdZRqygP9lp2cEOUH4PqFZxUbx3BWVWOgItZv63aLaoDPpk3DbZciBfbnRx
	 ejy+Q0w+z06gMlPMrBzaqi5sipeTgx/9Roy8JXOJ7rWnz+0A1nJzel2b/L5udU+BLp
	 WV51hm9sdhsdq0LT1HvtgB9nfCHxWTa5q8srXe218vNSCBk7k9kpsh4dqKliAUlEcd
	 6U2niuwOYDQV6yVZGj3nfESW+/lm62/LGWazk+RufCqTy1sTFpoA6tEg04grtBbK6K
	 7+EwMMCr8unR1Yu9GAkVTzx6lyoFbZhNVLoiWLlwg+Az+Z5yM77n8OKrA0d078xNnn
	 IeNBw7oBVNckw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1723575597; x=1723836097; i=vaishali.thakkar@vates.tech;
	bh=jApk1oSyqSGAleIrGQXOfYFF3DlJnkMxjXzHJyQS17g=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZL6B1es2q/o/fvZxJ3L4X2kMB3PB6LW8mwS6wfvsoKOkGYm/IIh4FA1sjwzNikrs2
	 5u8QSvkKGn5PW/RW9zpYZMZl0ITvgbvUwuUl4bCqIrCnGN6MC/1m5/2RnHCoXIh/hh
	 JE/peRP5DmyqHVRVkBSUtqlVG8RlL0fn4v3qfk7iibsbG+12o6/1/kn+2V+p46VC67
	 nVDdGLedwaBjn85pHTE5fkOsJi/xYeH+DNOSpBoqUCKYncbRqJ4w0sy/sXg8YlcO8b
	 00CLbpz4ScO3+FLbyBnh2/qmoxwWR6Byi02GeIqmuk398pgn9Ri7Tnpr0YdNGcUCwm
	 ZZEZdoU72FhSw==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[RFC-for-4.20=20v2=200/1]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20allocator?=
X-Mailer: git-send-email 2.46.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1723575596514
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <cover.1723574652.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.15a93eaf01c345ee8cefb9544269e0db?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240813:md
Date: Tue, 13 Aug 2024 18:59:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Motivation:
-----------
This is part of the effort to enable AMD SEV technologies in Xen. For
AMD SEV support, we need a fixed ASID associated with all vcpus of the
same domain throughout the domain's lifetime. This is because for SEV/
SEV-{ES,SNP} VM, the ASID is the index which is associated with the
encryption key.

Currently, ASID generation and management is done per-PCPU in Xen. And
at the time of each VMENTER, the ASID associated with vcpus of the
domain is changed. This implementation is incompatible with SEV
technologies for the above mentioned reasons. In a discussion with
Andrew Cooper, it came up that it=E2=80=99ll be nice to have fixed ASIDs no=
t
only for SEV VMs but also for all VMs. Because it opens up the
opportunity to use instructions like TLBSYNC and INVLPGB (Section
5.5.3 in AMD Architecture manual[0]) for broadcasting the TLB
Invalidations.

Changes since v1:
-----------------
As discussed in v1 and at the Xen summit, this version changes the
flow of the asid assignment. I initialize asids by calling CPUID
on each cpu during the __start_xen. The assignment of the asid
happens at the domain creation time at HVM level and later it is
mapped to individual hardware fields ASID/VPID at the VMRUN. ASID
is flushed when the domain is destroyed. Please check the comment in
xen/arch/x86/hvm/asid.c to check the implemenmtation flow. Detailed
list of changes is mentioned in the patch.

Few questions I have:
---------------------
1. While in this version I keep using hvm_asid_flush_domain in svm_invlpg,
I'm wondering if we need to do hvm_asid_flush_vcpu in this case? If so,
what would be the preferred way to flush vcpu specific TLB entries here?
2. Currently I assign asid at the VCPU level at VMRUN. But is there any
way to do it more early in the process? I tried to do it after the
hvm_vcpu_initialize and hvm_vcpu_up but wasn't really successfull in
doing so.
3. While there is a plan to use TLBSYNC in the future. My understanding
is intel doesn't have an equivalent instruction. Do we need a separate
function that is able to do it?
4. How is the freeing of resources done when Xen is destroyed? I couldn't
find something equivalent of svm_hardware_unsetup in linux kernel.

Notes:
------
1. As discussed at Xen Summit, changes related to demonstrating the use
of TLBSYNC and INVLPGB won't be part of this patchset.
2. Changes are tested on AMD EPYC Genoa at the moment.

Vaishali Thakkar (1):
  x86/hvm: Introduce Xen-wide ASID allocator

 xen/arch/x86/domain.c                  |   7 ++
 xen/arch/x86/flushtlb.c                |   4 -
 xen/arch/x86/hvm/asid.c                | 136 +++++++++++++------------
 xen/arch/x86/hvm/hvm.c                 |   6 +-
 xen/arch/x86/hvm/nestedhvm.c           |   4 +-
 xen/arch/x86/hvm/svm/asid.c            |  37 ++++---
 xen/arch/x86/hvm/svm/nestedsvm.c       |   5 +-
 xen/arch/x86/hvm/svm/svm.c             |  32 ++----
 xen/arch/x86/hvm/svm/svm.h             |   3 -
 xen/arch/x86/hvm/vmx/vmcs.c            |   2 -
 xen/arch/x86/hvm/vmx/vmx.c             |  37 ++-----
 xen/arch/x86/hvm/vmx/vvmx.c            |   7 +-
 xen/arch/x86/include/asm/hvm/asid.h    |  24 ++---
 xen/arch/x86/include/asm/hvm/domain.h  |   7 ++
 xen/arch/x86/include/asm/hvm/hvm.h     |  11 --
 xen/arch/x86/include/asm/hvm/svm/svm.h |   2 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |   9 --
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |   3 +-
 xen/arch/x86/mm/hap/hap.c              |   5 +-
 xen/arch/x86/mm/p2m.c                  |   6 +-
 xen/arch/x86/mm/paging.c               |   3 +-
 xen/arch/x86/pv/domain.c               |   1 +
 xen/arch/x86/setup.c                   |  10 ++
 23 files changed, 173 insertions(+), 188 deletions(-)

-- 
2.46.0


