Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CDD048BF
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 17:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197849.1515241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdtDu-0001AY-28; Thu, 08 Jan 2026 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197849.1515241; Thu, 08 Jan 2026 16:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdtDt-000191-UW; Thu, 08 Jan 2026 16:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1197849;
 Thu, 08 Jan 2026 16:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6BE0=7N=bounce.vates.tech=bounce-md_30504962.695fe06b.v1-88b4e5ae6d504fd791c0d9c8375d1a50@srs-se1.protection.inumbo.net>)
 id 1vdtDs-00018v-Hi
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 16:50:56 +0000
Received: from mail8.us4.mandrillapp.com (mail8.us4.mandrillapp.com
 [205.201.136.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3183e0b3-ecb2-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 17:50:53 +0100 (CET)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail8.us4.mandrillapp.com (Mailchimp) with ESMTP id 4dn9rq6vzbz2K1rpT
 for <xen-devel@lists.xenproject.org>; Thu,  8 Jan 2026 16:50:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 88b4e5ae6d504fd791c0d9c8375d1a50; Thu, 08 Jan 2026 16:50:51 +0000
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
X-Inumbo-ID: 3183e0b3-ecb2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767891052; x=1768161052;
	bh=7kSvgUZqq9JTtIB6SajetgP7V7nPzBwjE5AJMGZLkWE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l2EzbbAKnVCnT5X/nosRmCQO1n2jzAhVKdlCVOmaBhbel7DncXRcDBzi5jurkLvfJ
	 TemQYYxISDLbDs4S2QG2XF21K3IHOaOHNLM+lQ5Xwqq6k+GXSu4qm4IN0ewtoiSY7i
	 2kffvqBiYTsCF2tPZN7Md24/rnDHDZEF5aFgLWltaS/wJ4AsdyX7QBA7dSSA5d81pc
	 Pwtx85d2EM4mxR9tMh/Ks3pPC/d2Sdi4Kfes3DfzYpOSnpbY7HvMLC781PPIspYvlM
	 AlklGZdhkGlXazzlvQL0oiHXfmCUEhvSqxrM1Gux8EAdJut9FjrWta7TbsO9le7fdT
	 1PNog47QDs4yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767891052; x=1768151552; i=teddy.astie@vates.tech;
	bh=7kSvgUZqq9JTtIB6SajetgP7V7nPzBwjE5AJMGZLkWE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RYa3d/lfAOiIYkNR3lvTfojOZQMgjaWIKEasREHtIMARu6lsaOep58aATYoHILw2C
	 pKg62iaWEzcvHgx186VSn3bK+KlK5dpQu9BS0fk4HUyKOIOzkfcl0zXUzIiItEO5ow
	 6eIyQWEs3DavfwsMdvBEcKqb71dRCExVRWzPJMmyKjUNneSUEdvn4FsoDBnZOs8aEV
	 NAp5/WifaIeTnitSTOxc1/6C9cbFvlq0Ea35VEp+ACGh2coObzZNNKMIUSv6gpy/dV
	 bsfri85zESm3gimI4jIroZZ3WUVfcB99NIPc25gYYSAfjrEhihRJrlxWhHqJ+3Zk7w
	 BBJv/03avSulQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20pvh:=20Introduce=20SIF=5FHVM=5FGHCB=20for=20SEV-ES/SNP=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767891049478
Message-Id: <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
In-Reply-To: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.88b4e5ae6d504fd791c0d9c8375d1a50?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260108:md
Date: Thu, 08 Jan 2026 16:50:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/12/2025 =C3=A0 13:54, Teddy Astie a =C3=A9crit=C2=A0:
> Under SEV, the pagetables needs to be post-processed to add the C-bit
> (to make the mapping encrypted). The guest is expected to query the C-bit
> through CPUID. However, under SEV-ES and SEV-SNP modes, this instruction
> now triggers #VC instead. The guest would need to setup a IDT very early
> and instead use the early-GHCB protocol to emulate CPUID, which is
> complicated.
> 
> Alternatively, we can signal to the guest that it is a SEV-ES/SNP through
> start_info structure, which is visible to the guest early on. All SEV-ES/=
SNP
> guests have the GHCB MSR available, which can be trivially [1] used to ge=
t the
> C-bit and proceed with the initialization avoiding CPUID instruction.
> 
> We integrate that to the PVH ABI and expect all SEV-enabled domain builde=
rs
> to honor this flag for simplifying the PVH entry point logic of guests.
> 
> [1] Initial GHCB MSR value contains the C-bit. The guest can trivially re=
ad this
> MSR and skip CPUID logic.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Actually, C-bit itself cannot be a part of ABI as it is hardware-dependan=
t
> (and even firmware configuration dependant).
> ---
>   docs/misc/pvh.pandoc     | 5 +++++
>   xen/include/public/xen.h | 2 ++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/docs/misc/pvh.pandoc b/docs/misc/pvh.pandoc
> index 3e18789d36..6453ee21eb 100644
> --- a/docs/misc/pvh.pandoc
> +++ b/docs/misc/pvh.pandoc
> @@ -44,6 +44,11 @@ using HVMPARAMS, just like it's done on HVM guests.
>   The setup of the hypercall page is also performed in the same way
>   as HVM guests, using the hypervisor cpuid leaves and msr ranges.
>   
> +## SEV-ES/SNP guests ##
> +
> +The domain builder must set `SIF_HVM_GHCB` in start_info if the guest us=
es
> +SEV-ES or SEV-SNP technologies; i.e requires the use of GHCB protocol.
> +
>   ## AP startup ##
>   
>   AP startup can be performed using hypercalls or the local APIC if prese=
nt.
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 7f15204c38..9b84df573b 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
>   #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
>   #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. m=
apped */
>                                      /* P->M making the 3 level tree obso=
lete? */
> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that re=
quires */
> +                                   /* use of GHCB. */
>   #define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm option=
s */
>   
>   /*

As requested, here is how it could be used for Linux (the patch also 
contains plain SEV support).

We check here for SEV-ES with

mov 8(%ebx), %edx (start_info->flags)
bt $5, %edx       (SIF_HVM_GHCB)

If checked, we then read GHCB MSR and extract C-bit from it and skip the 
CPUID checks.
---
Subject: [RFC PATCH] pvh: Add SEV/SEV-ES support for PVH boot

When running as a SEV guest with PVH entrypoint, we need
to fixup the page tables to add the C-bit. Otherwise, the
transition to long mode fails as the pagetables are invalid
under SEV.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
  arch/x86/platform/pvh/head.S | 74 ++++++++++++++++++++++++++++++++++++
  include/xen/interface/xen.h  |  2 +
  2 files changed, 76 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 1d78e5631bb8..2b4d58350346 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -91,6 +91,64 @@ SYM_CODE_START(pvh_start_xen)

  =09leal rva(early_stack_end)(%ebp), %esp

+#ifdef CONFIG_AMD_MEM_ENCRYPT
+=09/* Check SIF_HVM_GHCB flag in start_info informing us on SEV-ES/SNP */
+=09mov 8(%ebx), %edx
+=09bt $5, %edx
+=09jnc .no_ghcb
+
+=09/* Get C-bit through GHCB MSR. */
+=09movl $MSR_AMD64_SEV_ES_GHCB, %ecx
+=09rdmsr
+=09/* C-bit is in EAX[31:24] */
+=09shr $24, %eax
+=09mov %eax, %ebx
+=09jmp .sev_prepare_pgt
+
+.no_ghcb:
+=09/* Check CPUID highest leaf */
+=09mov $0x80000000, %eax
+=09cpuid
+=09cmp $0x8000001f, %eax
+=09jb .skip_sev_prepare_pgt
+
+=09/* Check for SEV support */
+=09mov $0x8000001f, %eax
+=09cpuid
+=09bt $1, %eax
+=09jnc .skip_sev_prepare_pgt
+
+.sev_prepare_pgt:
+=09/* Check if SEV is enabled */
+=09mov $MSR_AMD64_SEV, %ecx
+=09rdmsr
+=09bt $MSR_AMD64_SEV_ENABLED_BIT, %eax
+=09jnc .skip_sev_prepare_pgt
+
+=09mov %ebx, %ecx
+=09and $0x3f, %ecx /* Get C-bit position */
+=09sub $0x20, %ecx
+=09mov $1, %eax
+=09shl %cl, %eax
+
+=09leal rva(pvh_init_top_pgt)(%ebp), %esi
+=09call set_pgtable_cbit
+
+=09leal rva(pvh_level3_ident_pgt)(%ebp), %esi
+=09call set_pgtable_cbit
+
+=09leal rva(pvh_level3_kernel_pgt)(%ebp), %esi
+=09call set_pgtable_cbit
+
+=09leal rva(pvh_level2_ident_pgt)(%ebp), %esi
+=09call set_pgtable_cbit
+
+=09leal rva(pvh_level2_kernel_pgt)(%ebp), %esi
+=09call set_pgtable_cbit
+
+.skip_sev_prepare_pgt:
+#endif
+
  =09/* Enable PAE mode. */
  =09mov %cr4, %eax
  =09orl $X86_CR4_PAE, %eax
@@ -223,6 +281,22 @@ SYM_CODE_START(pvh_start_xen)
  #endif
  SYM_CODE_END(pvh_start_xen)

+#ifdef CONFIG_AMD_MEM_ENCRYPT
+SYM_FUNC_START_LOCAL(set_pgtable_cbit)
+=09.code32
+=09mov $512, %ecx
+=09xor %edx, %edx
+.L2:
+=09testl $_PAGE_PRESENT, 0(%esi,%edx,8)
+=09jz .L3
+=09or %eax, 4(%esi,%edx,8)
+.L3:
+=09inc %edx
+=09loop .L2
+=09RET
+SYM_FUNC_END(set_pgtable_cbit)
+#endif
+
  =09.section ".init.data","aw"
  =09.balign 8
  SYM_DATA_START_LOCAL(gdt)
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 0ca23eca2a9c..c1a4e3dca0a3 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -654,6 +654,8 @@ struct start_info {
  #define SIF_MOD_START_PFN   (1<<3)  /* Is mod_start a PFN? */
  #define SIF_VIRT_P2M_4TOOLS (1<<4)  /* Do Xen tools understand a virt. 
mapped */
  =09=09=09=09    /* P->M making the 3 level tree obsolete? */
+#define SIF_HVM_GHCB        (1<<5)  /* Domain is SEV-ES/SNP guest so 
require */
+                                    /* use of GHCB protocol. */
  #define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm 
options */

  /*
-- 
2.52.0




--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



