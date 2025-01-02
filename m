Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C39FF713
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863736.1275149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpx-00063m-US; Thu, 02 Jan 2025 08:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863736.1275149; Thu, 02 Jan 2025 08:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpx-0005wG-Pl; Thu, 02 Jan 2025 08:45:49 +0000
Received: by outflank-mailman (input) for mailman id 863736;
 Thu, 02 Jan 2025 08:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3RT=T2=bounce.vates.tech=bounce-md_30504962.67765234.v1-1b49e4c8739a434284ff6632279899b6@srs-se1.protection.inumbo.net>)
 id 1tTGpw-0004rS-U2
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:48 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4b2d03b-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:45 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fD4yH2zCf9LfB
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1b49e4c8739a434284ff6632279899b6; Thu, 02 Jan 2025 08:45:40 +0000
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
X-Inumbo-ID: f4b2d03b-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807540; x=1736068040;
	bh=K9neGUeA0LQSacXkzSY79Yfv3A+07pQNOtWsOKGXlJQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=h0fdNRxBPHbQiEHR6YhD/L52oY1Z8+TW/7f0EVeUcQWXvCqcGRN4Ok4Ht8JHopEzT
	 TwYhcShUWIg7UnSJ8r5YZfbVIwh/WDm9NyfP7DhJIXQ8AeFn4QFkRzDgiIaJdt96jL
	 ohVeIu9kfhKdH6BqgHxK1PntqpfeIR9MlUlWFupCdgyM+piAV7c5Y6N8okKzbpjHto
	 0Myznh1ClDP1OUczfH5Oc/KduRpmwW1B0vc2zWqUnTgXaK76sDOcvb+Ci6tokRLPaW
	 QctohNo7fZJ3hE0+dxmA88/6lJVHIQd1D6DmtERB6wxqoDzW/01uZKX0HBEMUCWBs2
	 2HYRMOv58cJFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807540; x=1736068040; i=ngoc-tu.dinh@vates.tech;
	bh=K9neGUeA0LQSacXkzSY79Yfv3A+07pQNOtWsOKGXlJQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=09Dmq86DkHrQZ0zHCgfLTErCy0FG84uRw4+xIVYsVDeytEUkxL5JSW+y1jIsL+7lj
	 9K3W0sRb6O4IPX9w64wktcOiJALOY62i4PrzegV6z+RMHk8CizBdtzraE+yKida7U0
	 W5+xnFVZHcKC+oP+/T+5tdrX4UZ6L5j1+DivJk3l+iHEUcmxOtZx1q8YSP+3t5/xfp
	 4oNkg7iVU3tvO3CW9pFKVIi9aCDSWnCZ8h4VhOCviFmQhaxbtlY+rJtAzq9T4OYxFd
	 n3KcHTSmqz7K6u1OhTQKD1+3QApdcc0wOt8zBFUb6zL6IZpRSu87/w25ZE9qIhDsyP
	 1P2KGUEdDCe+w==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2000/10]=20Virtualize=20architectural=20LBRs?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807538103
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1b49e4c8739a434284ff6632279899b6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Intel model-specific last branch records (LBRs) were replaced by
architectural LBRs (see Chapter 20 of Intel SDM volume 3B). This
patchset implements virtual LBRs for HVM guests using Intel's "load
guest IA32_LBR_CTL" and "clear IA32_LBR_CTL" VMX controls. It
dynamically intercepts accesses to LBR state to translate between linear
and effective IP depending on the current host CPU core type.

The v2 patchset implements LBR state support in Xen's xstate handling.
Additionally, it adds XSAVES/XRSTORS support to the x86 emulator.
Finally, migration is handled by adding a new HVM save code
CPU_XSAVES_CODE containing a vCPU's compacted xstates as written by
XSAVES.

I'm looking for feedback on emulator handling of XSAVES/XRSTORS,
especially concerning FPU bits as it's not clear to me what should be
done in these cases.

Tu Dinh (10):
  x86: Add architectural LBR definitions
  x86: Define arch LBR feature bits
  tools: Add arch LBR feature bits
  x86: Calculate arch LBR CPUID policies
  x86: Keep a copy of XSAVE area size
  x86: Enable XSTATE save/restore for arch LBR
  x86/hvm: Don't count XSS bits in XSAVE size
  x86/emulate: Implement XSAVES/XRSTORS for arch LBR
  x86/vmx: Implement arch LBR
  x86/hvm: Enable XSAVES LBR save/restore

 tools/libs/light/libxl_cpuid.c              |   3 +
 tools/misc/xen-cpuid.c                      |   3 +
 tools/tests/x86_emulator/x86-emulate.h      |   2 +
 xen/arch/x86/cpu-policy.c                   |  28 +++
 xen/arch/x86/cpu/common.c                   |   7 +
 xen/arch/x86/domain.c                       |   7 +
 xen/arch/x86/hvm/emulate.c                  |  11 +
 xen/arch/x86/hvm/hvm.c                      |  70 +++++-
 xen/arch/x86/hvm/vmx/vmcs.c                 |  11 +-
 xen/arch/x86/hvm/vmx/vmx.c                  | 203 +++++++++++++--
 xen/arch/x86/include/asm/cpufeature.h       |   5 +
 xen/arch/x86/include/asm/domain.h           |   1 +
 xen/arch/x86/include/asm/hvm/hvm.h          |   3 +
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h     |  11 +
 xen/arch/x86/include/asm/msr-index.h        |  12 +
 xen/arch/x86/include/asm/msr.h              |   5 +
 xen/arch/x86/include/asm/xstate.h           |  22 +-
 xen/arch/x86/msr.c                          |  89 ++++++-
 xen/arch/x86/x86_emulate/0fc7.c             | 260 ++++++++++++++------
 xen/arch/x86/x86_emulate/blk.c              | 142 +++++++++++
 xen/arch/x86/x86_emulate/private.h          |   8 +
 xen/arch/x86/x86_emulate/util-xen.c         |  14 ++
 xen/arch/x86/x86_emulate/x86_emulate.c      |  19 ++
 xen/arch/x86/x86_emulate/x86_emulate.h      |  33 +++
 xen/arch/x86/xstate.c                       |  83 +++++--
 xen/include/public/arch-x86/cpufeatureset.h |  28 ++-
 xen/include/public/arch-x86/hvm/save.h      |   4 +-
 xen/include/xen/lib/x86/cpu-policy.h        |  51 +++-
 xen/lib/x86/cpuid.c                         |   6 +
 29 files changed, 1013 insertions(+), 128 deletions(-)

-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

