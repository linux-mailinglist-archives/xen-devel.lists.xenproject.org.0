Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F348A7A940
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937045.1338118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDZ-0000iU-Jq; Thu, 03 Apr 2025 18:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937045.1338118; Thu, 03 Apr 2025 18:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDZ-0000fz-GZ; Thu, 03 Apr 2025 18:23:09 +0000
Received: by outflank-mailman (input) for mailman id 937045;
 Thu, 03 Apr 2025 18:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0PDW-0000KX-Ux
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:23:07 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af87bf9a-10b8-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 20:23:05 +0200 (CEST)
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
X-Inumbo-ID: af87bf9a-10b8-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743704583; x=1743963783;
	bh=4s46GxMWhgvHm0rgQ170PYzaHXK6NdimNxre7vDtwbA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=hcCkmAN0K7QWL9/QTiLfzme/Vp8SxO3wPugckz1mCAGoW3KcGvCvN2ztCX3i+nlhe
	 RZipxVpoicJ+BuwT+53cgzpH9U72hTfbJa5qEchfsTsEcZsxlINGG37QN3KNUHJ9jC
	 XKklu2Qytvsp2/dJT3FzURU+IUw4umejq90h1rdM6wl4oVoQzl6moaPbUk+d93ppcW
	 Pj+TRJIjrmGND5h6DitUU8WdHhkkArc/cbn0nOsmLegCLsVjf6EbC97x3Yh+olkH/f
	 8R9g7i9eXSy8xPP36xUyq+0IekYgJwsYcMZ/BNkNXTYc1ECvm0ioVBu/cK/U8dDBcy
	 eo27uCGGaApRA==
Date: Thu, 03 Apr 2025 18:22:58 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 0/6] x86/asm: cleanups after toolchain baseline upgrade
Message-ID: <20250403182250.3329498-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d9d3b846cb5f0f8ce1df0778aed580181b1fd1d9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patches 1-5 remove various workarounds under HAVE_AS_XXX for older compiler=
s,
as the minimally required GCC 5.1 / Binutils 2.25, and Clang 11 natively
support instructions worked around in the hypervisor code.

Patch 6 cleans up error handling in VMX asm wrappers using `asm goto`.

[1] Link to v1: https://lore.kernel.org/xen-devel/20250401222105.79309-1-dm=
ukhin@ford.com/
[2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/17510=
06178=20

Denis Mukhin (6):
  x86/vmx: remove HAVE_AS_{EPT,VMX}, GAS_VMX_OP() and *_OPCODE
  x86/msr: remove HAVE_AS_FSGSBASE
  x86/asm: remove HAVE_AS_INVPCID
  x86/emulate: remove HAVE_AS_SSE4_2
  x86/emulate: remove HAVE_AS_RDRAND and HAVE_AS_RDSEED
  x86/vmx: rework VMX wrappers to use `asm goto()`

 xen/arch/x86/arch.mk                   |   9 +-
 xen/arch/x86/hvm/vmx/vmcs.c            |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 236 ++++++++-----------------
 xen/arch/x86/include/asm/invpcid.h     |  12 +-
 xen/arch/x86/include/asm/msr.h         |  22 ---
 xen/arch/x86/x86_emulate/0fc7.c        |  15 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |   7 +-
 7 files changed, 87 insertions(+), 216 deletions(-)

--=20
2.34.1



