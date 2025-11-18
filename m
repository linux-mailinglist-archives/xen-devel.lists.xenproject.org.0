Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0FC69D02
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 15:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164855.1491719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLML5-0007vZ-3T; Tue, 18 Nov 2025 14:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164855.1491719; Tue, 18 Nov 2025 14:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLML5-0007sS-0i; Tue, 18 Nov 2025 14:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1164855;
 Tue, 18 Nov 2025 14:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NGhq=52=bounce.vates.tech=bounce-md_30504962.691c7d32.v1-933f98d3ebb747559bd5c245d8f0847e@srs-se1.protection.inumbo.net>)
 id 1vLML3-0007sM-Hv
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 14:05:45 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a97fa3b1-c487-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 15:05:40 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4d9mbk2YBHzPm14yB
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 14:05:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 933f98d3ebb747559bd5c245d8f0847e; Tue, 18 Nov 2025 14:05:38 +0000
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
X-Inumbo-ID: a97fa3b1-c487-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763474738; x=1763744738;
	bh=0pgxcerppOl/qwYG/Nkwun2tEMKb9oNJ5epfmApEBXA=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C9wcrB0l4qwOisBRSmPLU4mGlm309hc1UZ2uaWbg7hDMjXjQsS7xl43szNi050Cp6
	 ElUP4v0KzxiL0LFklFJ/XhbdhqAlVCR++RE8VWRCVC5ikqAN2bBjPtWX5LeI6Eso7I
	 GQUHOUGMJPE7sq/5ZS9GtlMxBV8aCDcwaR/4OcWShrGZ81VFic0TJKlZkDrr3JSuiJ
	 0F6jl2WrUucsqN3R2a4nxfzvEzVsWLuQymmGxk8Z+a3bdxPQgZwPMXBniWflHF4Gzd
	 5ROJhbOUEAAuOCc9ocCx8U6NEq/idQJYob3YGvC13ODBiuxM7aWKQQD2K8/KufWpS8
	 bCFgvUY4UreaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763474738; x=1763735238; i=teddy.astie@vates.tech;
	bh=0pgxcerppOl/qwYG/Nkwun2tEMKb9oNJ5epfmApEBXA=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Zm7u19MuA7OwppNIJUIeiSvZJg3kGXkVEJKAa5rkXlr7kz2E8tgol+HrEyuTDy7gw
	 e/oZrj7SuTI3h3N9MY9kgsR04+WofFPh020u29srf4dLNAirYEtekxr8mqW3IWaH0o
	 M4cypyWzOZhkGOtFE2eX7EAtTYl3B+UAlE+EreVJjC6bTrx8vF/xkklxJ+QOwcGics
	 DqnfYBaYCw1gGIcqne7UMtZ+uSAVhOlP+eqaMm79AB2x2qyZITODc+C8K7sfDHOzPM
	 WzqQ/OjEXdquhFRAW98WXlM6SrgZ0gGch+qy37C5xlHBa+k3bugfejovQoMjx2GNSa
	 qJB4r0N9KrUMA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC]=20x86:=20Alternative=20AP=20bringup=20protocol=20(i.e=20SMP=20on=20SEV-ES)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763474737721
Message-Id: <3b43d1a7-b1b2-4c5e-861d-16a89a973034@vates.tech>
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <c68013da-dde4-4073-9031-67b9a1fd87f0@vates.tech>
In-Reply-To: <c68013da-dde4-4073-9031-67b9a1fd87f0@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.933f98d3ebb747559bd5c245d8f0847e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251118:md
Date: Tue, 18 Nov 2025 14:05:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/10/2025 =C3=A0 18:46, Teddy Astie a =C3=A9crit=C2=A0:
> Hello,
> 
> In order to implement SMP support in SEV-ES, things quickly gets quite
> complicated.
> 
> As a PVH guest under Xen, we have 2 ways of initializing a vCPU (aside
> BSP) :
> - VCPUOP_initialise
> - INIT-SIPI with vLAPIC
> 
> The first one is a hypercall that takes vcpu_hvm_context where provide
> some initial state for the vCPU. The second one works by initializing
> the vCPU at some cs.
> 
> This works, but for instance under SEV-ES (*), the vCPUs state (VMSA)
> must be measured then stays encrypted, which means that we can't set the
> vCPU state once the VM is started; which prevent both of the methods to
> work.
> 
> IOW, all vCPUs state must be known before the guest actually starts
> running (and ideally be defined as a part of boot ABI in order to be
> able to reconstruct the VMSA for remote attestation).
> 
> GHCB specification provide a way to deal with it ([1] SEV-ES GHCB
> standardization 4.3 SMP Booting).
> It is mostly based on a "AP Jump Table" address that can be queried (and
> also modified by inside-guest UEFI firmware) by the guest through a GHCB
> operation to the hypervisor.
> This AP Jump Table is the address of a IP:CS combination that will be
> used to initialize the vCPU (e.g as a part of a long jump instruction
> that the vCPU is initially pointing to).
> 
> But it's UEFI firmware centric, and is still relies on
> hypervisor-specific behaviors. And it relies on the hypervisor to give a
> proper "AP Jump Table" addresses (originally given by guest UEFI
> firmware) which could be tampered (defeating some of the security
> aspects of SEV-ES).
> Another issue is that the CPU initially starts in real mode, which
> complicates the placement of such AP Jump Table.
> 
> Here is a idea on a alternative functionally similar to SEV-ES
> specification but more flexible and somewhat simpler to implement :
> 
> Introduce a new special page "Alternative AP bring-up page" which
> contains some header (similar to vcpu_hvm_x86_64) and some vcpu
> initialization logic that sets up some control registers, EFER, GPR,
> ..., and then long jump to some guest-provided CS:EIP.
> 
> All !BSP vCPUs start at the entry point with a CPU state similar to the
> one defined in direct boot ABI, all vCPUs are initially stopped.
> 
> In order to initialize a vCPU :
> - sets a appropriate vCPU state in bring-up page
> - calls VCPUOP_up on this vCPU
> - wait for vCPU initialization termination
> 
> This is similar to the one proposed in GHCB specification with some
> differences :
> - vCPU starts in protected mode (instead of real mode), which avoids
> some of the AP Jump Table placement restrictions, as we now can put our
> spacial page along the other ones (xenstore, pv console, ...)
> - we avoid potentially complicated initialization trampoline chains
> - we can start the vCPU directly in long mode (from guest PoV) if
> appropriate EFER and control registers values are provided
> 
> And the "AP Jump Table" protocol can still be implemented on top of this
> proposal, given that the guest UEFI firmware supports it.
> 
> Given that this expands some aspects of the "direct boot ABI", I would
> like to gather some feedback on the idea.
> 
> Thanks
> 
> [1]
> https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/spec=
ifications/56421.pdf
> 
> * regarding SEV-SNP, a different (simpler) method for vCPU
> initialization is supported as the guest can directly provide a usable
> VMSA with the entire encrypted state of the vCPU through
> 
> 
> --
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
> 

Ping.

I still looking for a feedback on this.


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



