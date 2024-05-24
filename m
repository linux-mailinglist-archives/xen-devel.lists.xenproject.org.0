Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33C98CE562
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 14:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729462.1134609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAU53-000552-1G; Fri, 24 May 2024 12:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729462.1134609; Fri, 24 May 2024 12:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAU52-00052s-Ud; Fri, 24 May 2024 12:31:28 +0000
Received: by outflank-mailman (input) for mailman id 729462;
 Fri, 24 May 2024 12:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/Vf=M3=bounce.vates.tech=bounce-md_30504962.6650889a.v1-b9480d857674453791d98acf668f11dd@srs-se1.protection.inumbo.net>)
 id 1sAU51-00051V-6z
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 12:31:27 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8867d8cf-19c9-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 14:31:24 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Vm4CZ55cDzPm0PRK
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 12:31:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b9480d857674453791d98acf668f11dd; Fri, 24 May 2024 12:31:22 +0000
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
X-Inumbo-ID: 8867d8cf-19c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1716553882; x=1716814382;
	bh=tlJyPYKFhaSXXv4BnrdLWt4xxrI76gRAyevGwxWPheE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=JF4TV6zbXv9jcw8mX6ePjox7oAR+1V+12cSJD+KrFlg8wzNlvMwFpH6oBQ48Sg8RG
	 2OVYFnhFaDGtOWpqLQ/be4d43YzcusyP3gpaZxtVI/uAQlYxaeoYp8MmouY6PODs5F
	 h8ukRZRxSSaM/P1mapiYW1FouGOf7hkefNa7nqkTO1Z0QYS7kijMf3n7qsevTsuwRJ
	 mqvnQNvUReVy4ktDr9yPPzG6Yvxa0Ug3bEGo20TJW7bC7tRlBJHVHQmbo4KtuD6DLY
	 RtE3KGFuyw/f4iGM1KW9r6XAb/FgXpGRFXAwh/60QtNHXsbfdWE0T4OOlji725YzaJ
	 hMtIEPquMkPWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1716553882; x=1716814382; i=vaishali.thakkar@vates.tech;
	bh=tlJyPYKFhaSXXv4BnrdLWt4xxrI76gRAyevGwxWPheE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=b4Qlf5nZ+7sZ7vuIQWbHEjgN0ZmWdslRHeXkrd+ofgSJnRXkBr60i2WrmTigpMA7r
	 v7b5S3QjakYog3TWZXzxNzwcQ7xzIgA371qmPbt5xBEXBjaG+VoARSM1hAqdS3xfcC
	 vOg8g1LKKp9jFNW+uRzeC2jMboDD694G226SCgtSDRgQV6TIOHZPYIgxeLSi5sGtPB
	 9jE7QhtSw87tNqJvs4rg5kL0oOcJPI4BVLhffUnhd0WphPJzdaZ+vmgXoP+mQSFVU+
	 go2kbVhhFCfAyQJ4CG4IQAG2tbnfptz0ciUFSywJcBjBtFxY8yy1ISNKroAE2kA7bH
	 VzsDJ7X1crAUA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[RFC=20for-4.20=20v1=200/1]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20allocator?=
X-Mailer: git-send-email 2.45.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1716553881342
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, george.dunlap@citrix.com, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <cover.1716551380.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b9480d857674453791d98acf668f11dd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240524:md
Date: Fri, 24 May 2024 12:31:22 +0000
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

Why is this RFC?
----------------
This is only tested on AMD SVM at the moment. There are a few points
that I would like to discuss and get a feedback on from the community
before further development and testing. I=E2=80=99ve also submitted a desig=
n
session for this RFC to discuss further at the Xen Summit.

Points of discussion:
---------------------
1. I=E2=80=99m not sure how this should be handled for the nestedhvm. To st=
art
with, at the moment all the values seem to be handled via struct
nestedvcpu. Do we want to keep it that way or do we want to have
something like nestedhvm_domain to associate certain values like asid?
I=E2=80=99ve not handled this as part of this RFC as I would like to know t=
he
opinions and plans of those working on nested virtualization.

2. I=E2=80=99m doing initialization of xen-wide asids at the moment in setu=
p.c
but is that the right place to do it? I=E2=80=99m asking this because I=E2=
=80=99ve
been seeing a weird bug with the code in this RFC. Dom0 is able to
have a fixed asid through the lifecycle of it. But if I start a domU
with 2/4 vcpus via xl, sometimes it only brings up the one vcpu and
shows =E2=80=98tsc: Unable to calibrate against PIT=E2=80=99 while booting =
the kernel.

Notes:
-----
1. Currently the RFC doesn=E2=80=99t demonstrate the use of TLBSYNC and INV=
LPGB.
It can further be added if required. I'm not sure if it should be part
of the same patch series or not.

2. This is a basic RFC to start the discussion on the above points but
I further plan to add a logic to reclaim the asids that are no longer
in use and add a check to pick the asid from such stack before doing
hvm_asid_flush_all.

[0] https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/pr=
ogrammer-references/24593.pdf



Vaishali Thakkar (1):
  x86/hvm: Introduce Xen-wide ASID Allocator

 xen/arch/x86/flushtlb.c                |  1 -
 xen/arch/x86/hvm/asid.c                | 61 ++++++++++++++------------
 xen/arch/x86/hvm/emulate.c             |  3 --
 xen/arch/x86/hvm/hvm.c                 |  2 +-
 xen/arch/x86/hvm/nestedhvm.c           |  4 +-
 xen/arch/x86/hvm/svm/asid.c            | 28 +++++++-----
 xen/arch/x86/hvm/svm/nestedsvm.c       |  2 +-
 xen/arch/x86/hvm/svm/svm.c             | 33 ++++++--------
 xen/arch/x86/hvm/svm/svm.h             |  1 -
 xen/arch/x86/hvm/vmx/vmcs.c            |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c             | 15 +++----
 xen/arch/x86/hvm/vmx/vvmx.c            |  6 +--
 xen/arch/x86/include/asm/hvm/asid.h    | 19 ++++----
 xen/arch/x86/include/asm/hvm/domain.h  |  1 +
 xen/arch/x86/include/asm/hvm/hvm.h     |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h |  1 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |  6 +--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  3 +-
 xen/arch/x86/mm/hap/hap.c              |  4 +-
 xen/arch/x86/mm/p2m.c                  |  6 +--
 xen/arch/x86/mm/paging.c               |  2 +-
 xen/arch/x86/setup.c                   |  7 +++
 22 files changed, 108 insertions(+), 101 deletions(-)

-- 
2.45.0


