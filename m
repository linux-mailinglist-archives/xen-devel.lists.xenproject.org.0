Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E751DC218A3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 18:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153898.1484135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEWgh-0007Tg-6M; Thu, 30 Oct 2025 17:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153898.1484135; Thu, 30 Oct 2025 17:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEWgh-0007RM-3P; Thu, 30 Oct 2025 17:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1153898;
 Thu, 30 Oct 2025 17:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lE71=5H=bounce.vates.tech=bounce-md_30504962.6903a3d1.v1-187a43d2bf3c47e690d129f2def4c201@srs-se1.protection.inumbo.net>)
 id 1vEWgg-0007RG-DS
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 17:43:50 +0000
Received: from mail132-29.atl131.mandrillapp.com
 (mail132-29.atl131.mandrillapp.com [198.2.132.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc41f853-b5b7-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 18:43:47 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-29.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cyBL94t8cz7lmCkC
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 17:43:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 187a43d2bf3c47e690d129f2def4c201; Thu, 30 Oct 2025 17:43:45 +0000
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
X-Inumbo-ID: fc41f853-b5b7-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761846225; x=1762116225;
	bh=cmG43eSdj//4sTwFfBTqyQmKleNXI2L5YH1aU7NWq+8=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RM1fk+zPjGphBfrYgGZiqPa7/jZ5/HqL94POSFXC1FAtvW1qthYFwUbwELuPDtxss
	 /w5dyGYChEbUEHS7ImnZFJ9B8E0zT7jk+T0+KExq4Noovz8tr6uEVSKzxMzjsYXbhh
	 kFD6N4hi3qc+8GOOgIbwcejVzruXPBZ1dMxMSMRAZxJAt3dCDXDFjItGWwovKbT5Jy
	 +mD5D38+OdIIzivuSSUu04pha3kO/kFNfdXHJLRo/tmoh0wk1XXeLQJ4oJdcynXYnG
	 tmU1NE+T5m/A2ksOb+1vaIFTmm8wqvONweVfYi13N/9AMOVEpGk/lrkcvKj9JWaHmg
	 yS+R+ujce9RSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761846225; x=1762106725; i=teddy.astie@vates.tech;
	bh=cmG43eSdj//4sTwFfBTqyQmKleNXI2L5YH1aU7NWq+8=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=mn52DhgQBB2ulqVUlf9ox9K7iKeyMXl4n/AUYEHUl2RqffhlpdtZnmhBNayjTT2hl
	 evmnol+XHxSGGK1eZt6txujIiBJklFXbY9q6p8f8j1U8moRcFO6AR8UyTqBBbrDggz
	 gGgK6eqbdV2Q9nH2kV2oZrsJ3cJB3LJ5k4rQTRGErxWpFefXvGeCA5GWcqjZKtcZgk
	 qe4GQTJQEI4/YZLBk3mCDnvdB0wEdadEcXZ2sVNsuuSxvsY8giSiASalJsuhqkLhKM
	 vhLfFWpxf+cYVQnkwx5y5MfRhr1j0o++l5TbZ9Kk8VRlloRDSc4tNAypWKTOu9PEyY
	 WLT0b1+pOOK5Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC]=20x86:=20Alternative=20AP=20bringup=20protocol=20(i.e=20SMP=20on=20SEV-ES)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761846224873
Message-Id: <c68013da-dde4-4073-9031-67b9a1fd87f0@vates.tech>
To: Xen-devel <xen-devel@lists.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.187a43d2bf3c47e690d129f2def4c201?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251030:md
Date: Thu, 30 Oct 2025 17:43:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

In order to implement SMP support in SEV-ES, things quickly gets quite 
complicated.

As a PVH guest under Xen, we have 2 ways of initializing a vCPU (aside 
BSP) :
- VCPUOP_initialise
- INIT-SIPI with vLAPIC

The first one is a hypercall that takes vcpu_hvm_context where provide 
some initial state for the vCPU. The second one works by initializing 
the vCPU at some cs.

This works, but for instance under SEV-ES (*), the vCPUs state (VMSA) 
must be measured then stays encrypted, which means that we can't set the 
vCPU state once the VM is started; which prevent both of the methods to 
work.

IOW, all vCPUs state must be known before the guest actually starts 
running (and ideally be defined as a part of boot ABI in order to be 
able to reconstruct the VMSA for remote attestation).

GHCB specification provide a way to deal with it ([1] SEV-ES GHCB 
standardization 4.3 SMP Booting).
It is mostly based on a "AP Jump Table" address that can be queried (and 
also modified by inside-guest UEFI firmware) by the guest through a GHCB 
operation to the hypervisor.
This AP Jump Table is the address of a IP:CS combination that will be 
used to initialize the vCPU (e.g as a part of a long jump instruction 
that the vCPU is initially pointing to).

But it's UEFI firmware centric, and is still relies on 
hypervisor-specific behaviors. And it relies on the hypervisor to give a 
proper "AP Jump Table" addresses (originally given by guest UEFI 
firmware) which could be tampered (defeating some of the security 
aspects of SEV-ES).
Another issue is that the CPU initially starts in real mode, which 
complicates the placement of such AP Jump Table.

Here is a idea on a alternative functionally similar to SEV-ES 
specification but more flexible and somewhat simpler to implement :

Introduce a new special page "Alternative AP bring-up page" which 
contains some header (similar to vcpu_hvm_x86_64) and some vcpu 
initialization logic that sets up some control registers, EFER, GPR, 
..., and then long jump to some guest-provided CS:EIP.

All !BSP vCPUs start at the entry point with a CPU state similar to the 
one defined in direct boot ABI, all vCPUs are initially stopped.

In order to initialize a vCPU :
- sets a appropriate vCPU state in bring-up page
- calls VCPUOP_up on this vCPU
- wait for vCPU initialization termination

This is similar to the one proposed in GHCB specification with some 
differences :
- vCPU starts in protected mode (instead of real mode), which avoids 
some of the AP Jump Table placement restrictions, as we now can put our 
spacial page along the other ones (xenstore, pv console, ...)
- we avoid potentially complicated initialization trampoline chains
- we can start the vCPU directly in long mode (from guest PoV) if 
appropriate EFER and control registers values are provided

And the "AP Jump Table" protocol can still be implemented on top of this 
proposal, given that the guest UEFI firmware supports it.

Given that this expands some aspects of the "direct boot ABI", I would 
like to gather some feedback on the idea.

Thanks

[1] 
https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf

* regarding SEV-SNP, a different (simpler) method for vCPU 
initialization is supported as the guest can directly provide a usable 
VMSA with the entire encrypted state of the vCPU through


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


