Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B07A93883
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959027.1351511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYI-00033B-Dn; Fri, 18 Apr 2025 14:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959027.1351511; Fri, 18 Apr 2025 14:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYI-00030i-BE; Fri, 18 Apr 2025 14:18:46 +0000
Received: by outflank-mailman (input) for mailman id 959027;
 Fri, 18 Apr 2025 14:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ic+s=XE=bounce.vates.tech=bounce-md_30504962.68025f3f.v1-d861420a82c744a2b764f6bbced4204d@srs-se1.protection.inumbo.net>)
 id 1u5mYG-00030I-RB
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 14:18:44 +0000
Received: from mail179-46.suw41.mandrillapp.com
 (mail179-46.suw41.mandrillapp.com [198.2.179.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06661741-1c60-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 16:18:40 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-46.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZfH1W1TYWz8XRqfS
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 14:18:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d861420a82c744a2b764f6bbced4204d; Fri, 18 Apr 2025 14:18:39 +0000
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
X-Inumbo-ID: 06661741-1c60-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744985919; x=1745255919;
	bh=xueNMDJgTSP5NK02VEV+nKr1/iu6F6Tlm4ltAoWCn1Q=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=xnBBln4zpT5P+Kw4HC2cCDxFPBn1RKgM5AlYetiYDcU4N2jhiYaJ4iIgA1PJh3fIf
	 o61JMjlCL0zaX/LjOfVCvS96wttxMeXP4+wnvk/NVHSJQsZ2bytTh1FI93VhkvuD8j
	 Avxw39hvhUtlpPry8PS08uUEgGJ0W/pasuJF1zrXeObYIxne5JG9mgPpNZk9YpsCGE
	 5rrJLFeIZiE3JzKjEddV52MymYbvgS22/EhHLjUX4qqiECiXi0lCePwq5CWpno0N53
	 g5k2hpA3G8Pg1BVktAHAdfEENxrlJQnGXiZlw5TV3uB7HlmFPr4qbVuKJWvLL2Ppg8
	 uMhydolPzJvlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744985919; x=1745246419; i=teddy.astie@vates.tech;
	bh=xueNMDJgTSP5NK02VEV+nKr1/iu6F6Tlm4ltAoWCn1Q=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ht9II0QUH3hrVzQp5F66tZPq1HGci9KUB86RZAfbRofgnutDBp6iDymTcXyi7L6z7
	 quBW5srCCOzuO7Lm5+VJlPoeYDuAe591wEPQU4sSfR7JKki1ivfqQvgr77thPY9DI8
	 jNYNv0zOCz0cUrM+es9KA9oyNQ1iYdy5Ja47tSAEE0d1jqde8TeTpfNAZrlcA4PD/V
	 o8ch3K9qDKHAp0K2JKX8zIqyTE9ERjDGny2fI68paVg5MzSn9LybfVwn8miSgIDmnY
	 yIYrte9+8Bje58cjIpJKLt6OzBYtHXC4OYlJnixN/ATqtx3dObatHTEBMshobnapNq
	 EnVywnSsvISTg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=200/4]=20Physical=20address=20hypercall=20ABI=20("HVMv2")?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744985917687
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>
Message-Id: <cover.1744981654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d861420a82c744a2b764f6bbced4204d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250418:md
Date: Fri, 18 Apr 2025 14:18:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In current HVM mode, when a hypercall references a structure in guest memory,
it is passed to the hypervisor as its "linear address" (e.g virtual address for
the x86 long mode).
One of the caveats is that this linear address (GVA) is generally not directly
usable by the Xen and needs to be translated from GVA to GPA then HPA. This
implies a complex and potentially expensive lookup of the pagetables inside the
guest. This can be significant, especially if the P2M cannot use efficiently
superpages (or with e.g XSA-304).

This proposal introduce a new mode where all addresses used for hypercalls are
GPADDR instead of GVADDR, therefore, looking up the HPA related to this GPA
only needs a P2M lookup and not looking through the inside-guest pagetables.

This mode is opt-in and must be enabled explicitely by the toolstack.

This is also mandatory for confidential-computing guests (e.g SEV) where the
guest pagetable are not visible to the hypervisor.

In a synthetic xtf-based hypercall benchmark (VCPUOP_get_runstate_info loop),
it gives broadly a 30% overhead reduction when tested on a AMD EPYC 9124.

This serie only implement support for x86 yet this ABI is also meaningful for
other architectures as well.
A separate patch for adding support in Linux is planned.

Teddy Astie (4):
  xen: Introduce physaddr_abi CDF flag
  x86/hvm: Consider phyaddr_abi when copying from/to guest memory
  x86/public: Expose physaddr_abi through Xen HVM CPUID leaf
  libxl: Add support for enabling physaddr_abi

 tools/include/libxl.h               |  5 +++++
 tools/libs/light/libxl_create.c     |  4 ++++
 tools/libs/light/libxl_types.idl    |  1 +
 tools/xl/xl_parse.c                 |  1 +
 xen/arch/x86/cpuid.c                |  3 +++
 xen/arch/x86/hvm/hvm.c              | 17 ++++++++++++++---
 xen/common/domain.c                 | 10 +++++++++-
 xen/include/public/arch-x86/cpuid.h |  2 ++
 xen/include/public/domctl.h         |  4 +++-
 xen/include/xen/sched.h             |  6 ++++++
 10 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


