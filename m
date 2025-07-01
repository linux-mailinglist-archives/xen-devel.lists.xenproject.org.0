Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546E7AEEC3D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 03:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029330.1403079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWQ9B-00018L-3N; Tue, 01 Jul 2025 01:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029330.1403079; Tue, 01 Jul 2025 01:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWQ9A-00015u-TQ; Tue, 01 Jul 2025 01:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1029330;
 Tue, 01 Jul 2025 01:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8i3=ZO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uWQ99-00015o-26
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 01:50:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13247b4-561d-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 03:50:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 322B75C5F90;
 Tue,  1 Jul 2025 01:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C69C4CEE3;
 Tue,  1 Jul 2025 01:50:47 +0000 (UTC)
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
X-Inumbo-ID: d13247b4-561d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751334649;
	bh=W8sxzwk/Vfk2i1j2r2VdNkeRLZCAYgMW5kGs4a+gbH0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Gl3xuJBQ7TY5Qy8/ix1I9IPIahBZR/qiLNI/iC/jykKWIVsSYhnGysApLrM2CEks3
	 7x2Aen1zDlPYuL1g/g+74ceJZYY24mAD/83y6yJUfVdNCwut1Qe8RFGK82UiIRJXO4
	 OEjmXtcALZ5h9oXmjjeEexsDAQP2Qmf5oMP8H19DfLAl5gFbM8HNeYf3uQGHB8agpv
	 cxEOqhMiwARcxkTroUV+eZ5Esqqpb5DUGyYBSFQhBHJuBdK5/wwMp1vNnSNSC/9Qy6
	 2VWBUCR+zaw3SslBqTNHie8B0Kkbxs5T8AR1lbIf/I8nXw/w1AIQS7mzBLihZ4xuVe
	 P52T694BmwKZg==
Date: Mon, 30 Jun 2025 18:50:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
In-Reply-To: <aGKnDHtRD5OLGaYj@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
References: <20250620111130.29057-1-roger.pau@citrix.com> <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop> <aGKnDHtRD5OLGaYj@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-107501406-1751330070=:862517"
Content-ID: <alpine.DEB.2.22.394.2506301747160.862517@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-107501406-1751330070=:862517
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2506301747161.862517@ubuntu-linux-20-04-desktop>

On Mon, 30 Jun 2025, Roger Pau Monné wrote:
> On Fri, Jun 27, 2025 at 07:08:29PM -0700, Stefano Stabellini wrote:
> > Hi Roger,
> > 
> > We have an ARM board with the following memory layout:
> > 
> > 0x0-0x80000000, 0, 2G
> > 0x800000000,0x880000000, 32GB, 2G
> > 0x50000000000-0x50080000000 5T, 2GB 
> > 0x60000000000-0x60080000000 6T, 2GB 
> > 0x70000000000-0x70080000000 7T, 2GB 
> 
> With the current PDX mask compression you could compress 4bits AFAICT.
> 
> > It looks like your PDX series is exactly what we need.  However, I tried
> > to use it and it doesn't seem to be hooked properly on ARM yet. I spent
> > some time trying to fix it but I was unsuccessful.
> 
> Hm, weird.  It shouldn't need any special hooking, unless assumptions
> about the existing PDX mask compression have leaked into ARM code.
> 
> > As far as I can tell the following functions need to be adjusted but I
> > am not sure the list is comprehensive:
> > 
> > xen/arch/arm/include/asm/mmu/mm.h:maddr_to_virt
> 
> At least for CONFIG_ARM_64 this seems to be implemented correctly, as
> it's using maddr_to_directmapoff() which should have the correct
> translation between paddr -> directmap virt.
> 
> Also given the memory map above the adjustments done in ARM to remove
> any initial memory map offset should be no-ops, since I expect
> base_mfn == 0 in setup_directmap_mappings() in that particular case,
> and then directmap_mfn_start = directmap_base_pdx = 0 and
> directmap_virt_start = DIRECTMAP_VIRT_START.  FWIW, if ARM uses offset
> compression the special casing about removing the initial gap can be
> removed, as the compression should already take care of that.
> 
> > xen/arch/arm/mmu/mm.c:setup_frametable_mappings
> > xen/arch/arm/setup.c:init_pdx
> 
> I've attempted to adjust init_pdx() myself so it works with the new
> generic PDX compression setup, it seemed to work fine on the CI, but I
> don't have any real ARM machines to test myself.
 
> Is there a way I could reproduce the issue(s) you are seeing with
> QEMU?

Maybe. You can see how we run QEMU from gitlab-ci, but I don't know on
top of my head how to force QEMU to emulate multiple RAM banks at
specific addresses.


> I'm already working on v3, as this version implementation of
> mfn_valid() is buggy.  Maybe that's what you are hitting?
> 

This is the error:

(XEN) [0000000179e5f96b] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
(XEN) [0000000179e90619] ----[ Xen-4.21-unstable  arm64  debug=y  Not tainted ]----
(XEN) [0000000179e9ee58] CPU:    0
(XEN) [0000000179eac907] PC:     00000a00002da5fc setup_mm+0x174/0x200
(XEN) [0000000179ed3ed0] LR:     00000a00002da580
(XEN) [0000000179edc486] SP:     00000a0000327e10
(XEN) [0000000179ee6b3a] CPSR:   00000000200003c9 MODE:64-bit EL2h (Hypervisor, handler)
(XEN) [0000000179ef5b4f]      X0: 0000050000000000  X1: 0000000050000000  X2: 0000000000080000
(XEN) [0000000179f05de3]      X3: 0000000000000017  X4: 0000000000000000  X5: 0000000050000000
(XEN) [0000000179f19396]      X6: 000000004fffffff  X7: 0000000000000000  X8: 0000000000020400
(XEN) [0000000179f2d797]      X9: 000000000001b808 X10: 0000000000000080 X11: 00000000000186de
(XEN) [0000000179f3d492]     X12: 000000000001a7df X13: 000000000001214f X14: 0000000000017275
(XEN) [0000000179f50f4c]     X15: 00000a00002b48bc X16: 00000a0000291478 X17: 0000000000000000
(XEN) [0000000179f60902]     X18: 000000007be9bbe0 X19: 0000000000000002 X20: 0000000000000000
(XEN) [0000000179f6fde5]     X21: 0000050080000000 X22: 00000a00002f8008 X23: 00000a00002b5c90
(XEN) [0000000179f7eeea]     X24: 0000000180000000 X25: 00000a00002b5e90 X26: 0000000000000000
(XEN) [0000000179f8ee55]     X27: 0000000000000000 X28: 000000007bff2f70  FP: 00000a0000327e10
(XEN) [0000000179fa6deb] 
(XEN) [0000000179fadf84]   VTCR_EL2: 0000000000000000
(XEN) [0000000179fb9994]  VTTBR_EL2: 0000000000000000
(XEN) [0000000179fc689d] 
(XEN) [0000000179fcc1a0]  SCTLR_EL2: 0000000030cd183d
(XEN) [0000000179fd95e3]    HCR_EL2: 0000000000000038
(XEN) [0000000179fe7082]  TTBR0_EL2: 0000000022148000
(XEN) [0000000179ff0d00] 
(XEN) [0000000179ff6d07]    ESR_EL2: 00000000f2000001
(XEN) [000000017a0003fe]  HPFAR_EL2: 0000000000000000
(XEN) [000000017a00c8f4]    FAR_EL2: 0000000000000000
(XEN) [000000017a018511] 
(XEN) [000000017a01fbe5] Xen stack trace from sp=00000a0000327e10:
(XEN) [000000017a02aa88]    00000a0000327e60 00000a00002e40c4 0000000022200000 000000000000f000
(XEN) [000000017a03e578]    00000a0000c0a5c0 00000a0000332000 00000a0000a00000 0000000000000000
(XEN) [000000017a04e676]    0000000000000000 0000000000000000 000000007be89ea0 00000a00002001a4
(XEN) [000000017a0636e1]    0000000022000000 fffff60021e00000 0000000022200000 0000000000001710
(XEN) [000000017a072ae0]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a084bf8]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a097ced]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a0a6829]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a0b8e71]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a0cdb4b]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a0e44b9]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a0f6a2b]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a1074a2]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a1178b3]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a128463]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [000000017a13a015]    0000000000000000 0000000000000000
(XEN) [000000017a144d66] Xen call trace:
(XEN) [000000017a14bcee]    [<00000a00002da5fc>] setup_mm+0x174/0x200 (PC)
(XEN) [000000017a15db0a]    [<00000a00002da580>] setup_mm+0xf8/0x200 (LR)
(XEN) [000000017a167dbb]    [<00000a00002e40c4>] start_xen+0x118/0x9d0
(XEN) [000000017a171724]    [<00000a00002001a4>] arch/arm/arm64/head.o#primary_switched+0x4/0x24
(XEN) [000000017a18abb4] 
(XEN) [000000017a19a465] 
(XEN) [000000017a19ffed] ****************************************
(XEN) [000000017a1aad66] Panic on CPU 0:
(XEN) [000000017a1b2757] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
(XEN) [000000017a1daedf] ****************************************
(XEN) [000000017a1eb0a9] 
(XEN) [000000017a1f2b27] Reboot in five seconds...


If I remove the ASSERT:

(XEN) [00000003bc65c616] parameter "debug" unknown!
(XEN) [00000003bc70915a] 
(XEN) [00000003bc70fd14] ****************************************
(XEN) [00000003bc71afec] Panic on CPU 0:
(XEN) [00000003bc724d03] The frametable cannot cover the physical region 0000000000000000 - 0x00070080000000
(XEN) [00000003bc73786c] ****************************************
(XEN) [00000003bc741a19] 
(XEN) [00000003bc747833] Reboot in five seconds...


I think the issue (or one issue) is the implementation of
setup_frametable_mappings on ARM which is ignoring the pdx_group_valid
bitmap. I am attaching a work-in-progress patch from Michal to add
support for it for your reference. Remove commit fe6a12a08 to apply the
patch without conflict.

With Michal's patch, I can boot *without* your patches on the
problematic board.

I still cannot boot with your patches, even with Michal's patch. I still
hit the same ASSERT. If I remove the ASSERT I go further and hit:

(XEN) [00000001bccbd3ab] Panic on CPU 0:
(XEN) [00000001bccc4c3e] Frametable too small

I added some debug messages (see
attached stefano-debug.patch). Something seems to be wrong with the
pdx_group_valid bitmap after 0x880000, as we start getting MFN ranges
such as 0x254c0000-0x25500000 which don't make any sense to me.

(XEN) [00000001563012a8] DEBUG init_pdx 294 start=0 end=80000000
(XEN) [000000015630d6d9] DEBUG init_pdx 294 start=800000000 end=880000000
(XEN) [000000015631c73c] DEBUG init_pdx 294 start=50000000000 end=50080000000
(XEN) [000000015632947b] DEBUG init_pdx 294 start=60000000000 end=60080000000
(XEN) [00000001563365a8] DEBUG init_pdx 294 start=70000000000 end=70080000000
(XEN) [000000015637c6aa] DEBUG init_frametable 65 start=0 end=80000
(XEN) [00000001563898e1] DEBUG init_frametable_chunk 28 virt=a0800000000 base_mfn=7007e000 pfn_start=0 pfn_end=80000
(XEN) [000000015692ed1f] DEBUG init_frametable 65 start=800000 end=880000
(XEN) [00000001569399fe] DEBUG init_frametable_chunk 28 virt=a081c000000 base_mfn=7007c000 pfn_start=800000 pfn_end=880000
(XEN) [00000001573bad45] DEBUG init_frametable 65 start=254c0000 end=25500000
(XEN) [00000001573dee6a] DEBUG init_frametable_chunk 28 virt=a1028a00000 base_mfn=7007a000 pfn_start=254c0000 pfn_end=25500000
(XEN) [00000001578ad5c2] DEBUG init_frametable 65 start=25700000 end=257c0000
(XEN) [00000001578b841d] DEBUG init_frametable_chunk 28 virt=a1030800000 base_mfn=70076000 pfn_start=25700000 pfn_end=257c0000
(XEN) [000000015853b121] DEBUG init_frametable 65 start=27400000 end=27440000
(XEN) [00000001585470fe] DEBUG init_frametable_chunk 28 virt=a1096000000 base_mfn=70074000 pfn_start=27400000 pfn_end=27440000
(XEN) [0000000158880a59] DEBUG init_frametable 65 start=27480000 end=27500000
(XEN) [000000015888d583] DEBUG init_frametable_chunk 28 virt=a1097c00000 base_mfn=70072000 pfn_start=27480000 pfn_end=27500000
(XEN) [0000000158eacf55] DEBUG init_frametable 65 start=27580000 end=27a40000
(XEN) [0000000158eb7f8e] DEBUG init_frametable_chunk 28 virt=a109b400000 base_mfn=70060000 pfn_start=27580000 pfn_end=27a40000
(XEN) [000000015cac7416] DEBUG init_frametable 65 start=27a80000 end=27ac0000
(XEN) [000000015cad6818] DEBUG init_frametable_chunk 28 virt=a10acc00000 base_mfn=7005e000 pfn_start=27a80000 pfn_end=27ac0000
(XEN) [000000015cb26b99] arch/arm/mmu/pt.c:360: Changing MFN for a valid entry is not allowed (0x70071800 -> 0x7005e000).
(XEN) [000000015cb80f94] Xen WARN at arch/arm/mmu/pt.c:360
(XEN) [000000015cbabedc] ----[ Xen-4.21-unstable  arm64  debug=y  Not tainted ]----
--8323329-107501406-1751330070=:862517
Content-Type: text/x-diff; NAME=stefano-debug.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2506301842331.862517@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=stefano-debug.patch

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbXUvbW0u
aCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbXUvbW0uaA0KaW5kZXgg
N2Y0ZDU5MTM3ZC4uODE5ZmU5MjNhNCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9tbXUvbW0uaA0KKysrIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL21tdS9tbS5oDQpAQCAtNjksOCArNjksNiBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgKm1hZGRyX3RvX3ZpcnQocGFkZHJfdCBtYSkNCiAg
Ki8NCiBzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRyX3RvX3ZpcnQocGFkZHJf
dCBtYSkNCiB7DQotICAgIEFTU0VSVCgobWZuX3RvX3BkeChtYWRkcl90b19t
Zm4obWEpKSAtIGRpcmVjdG1hcF9iYXNlX3BkeCkgPA0KLSAgICAgICAgICAg
KERJUkVDVE1BUF9TSVpFID4+IFBBR0VfU0hJRlQpKTsNCiAgICAgcmV0dXJu
ICh2b2lkICopKFhFTkhFQVBfVklSVF9TVEFSVCAtDQogICAgICAgICAgICAg
ICAgICAgICAoZGlyZWN0bWFwX2Jhc2VfcGR4IDw8IFBBR0VfU0hJRlQpICsN
CiAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3RvX2RpcmVjdG1hcG9mZiht
YSkpOw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbXUvbW0uYyBiL3hl
bi9hcmNoL2FybS9tbXUvbW0uYw0KaW5kZXggNjk2MTdhNDk4Ni4uZTI0ZmNh
OGM3MCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9tbXUvbW0uYw0KKysr
IGIveGVuL2FyY2gvYXJtL21tdS9tbS5jDQpAQCAtMjUsNiArMjUsNyBAQCBp
bml0X2ZyYW1ldGFibGVfY2h1bmsodW5zaWduZWQgbG9uZyBwZHhfcywgdW5z
aWduZWQgbG9uZyBwZHhfZSkNCiAgICAgYmFzZV9tZm4gPSBhbGxvY19ib290
X3BhZ2VzKGNodW5rX3NpemUgPj4gUEFHRV9TSElGVCwgMzIgPDwgKDIwIC0g
MTIpKTsNCiANCiAgICAgdmlydCA9ICh1bnNpZ25lZCBsb25nKXBkeF90b19w
YWdlKHBkeF9zKTsNCisgICAgcHJpbnRrKCJERUJVRyAlcyAlZCB2aXJ0PSVs
eCBiYXNlX21mbj0lbHggcGZuX3N0YXJ0PSVseCBwZm5fZW5kPSVseFxuIixf
X2Z1bmNfXyxfX0xJTkVfXywodW5zaWduZWQgbG9uZyl2aXJ0LG1mbl94KGJh
c2VfbWZuKSxtZm5feChwZHhfdG9fbWZuKHBkeF9zKSksbWZuX3gocGR4X3Rv
X21mbihwZHhfZSkpKTsNCiAgICAgcmMgPSBtYXBfcGFnZXNfdG9feGVuKHZp
cnQsIGJhc2VfbWZuLCBjaHVua19zaXplID4+IFBBR0VfU0hJRlQsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICBQQUdFX0hZUEVSVklTT1JfUlcgfCBf
UEFHRV9CTE9DSyk7DQogICAgIGlmICggcmMgKQ0KQEAgLTUxLDEyICs1Miw5
IEBAIHZvaWQgX19pbml0IGluaXRfZnJhbWV0YWJsZSh2b2lkKQ0KIA0KICAg
ICBtYXhfcGR4ID0gcGZuX3RvX3BkeChtYXhfcGFnZSAtIDEpICsgMTsNCiAN
Ci0gICAgaWYgKCBtYXhfcGR4ID4gRlJBTUVUQUJMRV9OUiApDQotICAgICAg
ICBwYW5pYygiRnJhbWV0YWJsZSB0b28gc21hbGxcbiIpOw0KLQ0KICAgICBt
YXhfaWR4ID0gRElWX1JPVU5EX1VQKG1heF9wZHgsIFBEWF9HUk9VUF9DT1VO
VCk7DQogDQotICAgIGZvciAoIHNpZHggPSAoZnJhbWV0YWJsZV9iYXNlX3Bk
eCAvIFBEWF9HUk9VUF9DT1VOVCk7IDsgc2lkeCA9IG5pZHggKQ0KKyAgICBm
b3IgKCBzaWR4ID0gMDsgOyBzaWR4ID0gbmlkeCApDQogICAgIHsNCiAgICAg
ICAgIGVpZHggPSBmaW5kX25leHRfemVyb19iaXQocGR4X2dyb3VwX3ZhbGlk
LCBtYXhfaWR4LCBzaWR4KTsNCiAgICAgICAgIG5pZHggPSBmaW5kX25leHRf
Yml0KHBkeF9ncm91cF92YWxpZCwgbWF4X2lkeCwgZWlkeCk7DQpAQCAtNjQs
NiArNjIsNyBAQCB2b2lkIF9faW5pdCBpbml0X2ZyYW1ldGFibGUodm9pZCkN
CiAgICAgICAgIGlmICggbmlkeCA+PSBtYXhfaWR4ICkNCiAgICAgICAgICAg
ICBicmVhazsNCiANCisgICAgICAgIHByaW50aygiREVCVUcgJXMgJWQgc3Rh
cnQ9JWx4IGVuZD0lbHhcbiIsX19mdW5jX18sX19MSU5FX18sbWZuX3gocGR4
X3RvX21mbihzaWR4ICogUERYX0dST1VQX0NPVU5UKSksbWZuX3gocGR4X3Rv
X21mbihlaWR4ICogUERYX0dST1VQX0NPVU5UKSkpOw0KICAgICAgICAgaW5p
dF9mcmFtZXRhYmxlX2NodW5rKHNpZHggKiBQRFhfR1JPVVBfQ09VTlQsIGVp
ZHggKiBQRFhfR1JPVVBfQ09VTlQpOw0KICAgICB9DQogDQpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAu
Yw0KaW5kZXggYzlhZDZiYmFiNi4uMWY1YzE4NjZjNCAxMDA2NDQNCi0tLSBh
L3hlbi9hcmNoL2FybS9zZXR1cC5jDQorKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYw0KQEAgLTI5MSw2ICsyOTEsNyBAQCB2b2lkIF9faW5pdCBpbml0X3Bk
eCh2b2lkKQ0KICAgICAgICAgYmFua19zaXplID0gbWVtLT5iYW5rW2Jhbmtd
LnNpemU7DQogICAgICAgICBiYW5rX2VuZCA9IGJhbmtfc3RhcnQgKyBiYW5r
X3NpemU7DQogDQorICAgICAgICBwcmludGsoIkRFQlVHICVzICVkIHN0YXJ0
PSVseCBlbmQ9JWx4XG4iLF9fZnVuY19fLF9fTElORV9fLGJhbmtfc3RhcnQs
YmFua19lbmQpOw0KICAgICAgICAgc2V0X3BkeF9yYW5nZShwYWRkcl90b19w
Zm4oYmFua19zdGFydCksDQogICAgICAgICAgICAgICAgICAgICAgIHBhZGRy
X3RvX3BmbihiYW5rX2VuZCkpOw0KICAgICB9DQo=

--8323329-107501406-1751330070=:862517
Content-Type: text/x-diff; NAME=pdx-groups.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2506301850370.862517@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=pdx-groups.patch

RnJvbSBtaWNoYWwub3J6ZWxAYW1kLmNvbSBNb24gSnVuIDMwIDAyOjIyOjQ2
IDIwMjUNCkRhdGU6IE1vbiwgMzAgSnVuIDIwMjUgMTE6MjI6MjcgKzAyMDAN
CkZyb206IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQpT
dWJqZWN0OiBbUEFUQ0hdIHhlbi9hcm06IFRha2UgaW50byBhY2NvdW50IFBE
WCBncm91cGluZyBmb3Igc2V0dGluZyB1cCBmcmFtZXRhYmxlDQoNCkF0IHRo
ZSBtb21lbnQgd2UgZG9uJ3QgcmVhbGx5IHRha2UgaW50byBhY2NvdW50IHBk
eF9ncm91cF92YWxpZCBiaXRtYXANCmNvbnRhaW5pbmcgcmFuZ2VzIHdpdGgg
dmFsaWQgUkFNIHJhbmdlcy4gV2UgcG9wdWxhdGUgdGhlIGJpdG1hcCB1c2lu
Zw0Kc2V0X3BkeF9yYW5nZSgpIGJ1dCB3ZSBzZXQgdXAgZnJhbWV0YWJsZSB0
byBjb3ZlciBhbGwgUkFNIGluY2x1ZGluZw0KaG9sZXMgd2FzdGluZyBhIGxv
dCBvZiBtZW1vcnkgKGV2ZW4gZ2lnYWJ5dGVzIG9uIHNvbWUgcGxhdGZvcm1z
IHdpdGgNCmxhcmdlIGhvbGVzKS4gVGFrZSBleGFtcGxlIGZyb20geDg2IHdo
ZXJlIHRoaXMgYml0bWFwIGlzIHVzZWQgdG8gaW5pdA0KZnJhbWV0YWJsZSBm
b3IgdmFsaWQgUkFNIHJhbmdlcyBpbiBjaHVua3MuIE9uIEFybSB3ZSBhbHNv
IGFwcGx5IG9mZnNldA0KKHNpbWlsYXIgYXMgd2l0aCBkaXJlY3QgbWFwKSwg
d2hlcmUgdGhlIHN0YXJ0aW5nIGluZGV4IGZvciB0aGUgYml0bWFwDQpjb21l
cyBmcm9tIGZyYW1ldGFibGVfYmFzZV9wZHguIE1hcHBpbmcgc2l6ZSByZW1h
aW5zIHRoZSBzYW1lIGFzIGJlZm9yZQ0KaS5lLiAyTUIgb3IgMzJNQi4NCg0K
U2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1k
LmNvbT4NCi0tLQ0KIHhlbi9hcmNoL2FybS9hcm0zMi9tbXUvbW0uYyAgIHwg
IDQgKy0NCiB4ZW4vYXJjaC9hcm0vYXJtNjQvbW11L21tLmMgICB8ICAzICst
DQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmggfCAgNCArLQ0KIHhl
bi9hcmNoL2FybS9tbXUvbW0uYyAgICAgICAgIHwgNjkgKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0NCiA0IGZpbGVzIGNoYW5nZWQsIDUw
IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2FybTMyL21tdS9tbS5jIGIveGVuL2FyY2gvYXJt
L2FybTMyL21tdS9tbS5jDQppbmRleCA5NTY2OTMyMzJhMWIuLjgwYjM1NzJl
MDA0MSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9tbXUvbW0u
Yw0KKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL21tdS9tbS5jDQpAQCAtMTg4
LDEwICsxODgsMTAgQEAgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkNCiAN
CiAgICAgc2V0dXBfZGlyZWN0bWFwX21hcHBpbmdzKG1mbl94KGRpcmVjdG1h
cF9tZm5fc3RhcnQpLCB4ZW5oZWFwX3BhZ2VzKTsNCiANCi0gICAgLyogRnJh
bWUgdGFibGUgY292ZXJzIGFsbCBvZiBSQU0gcmVnaW9uLCBpbmNsdWRpbmcg
aG9sZXMgKi8NCi0gICAgc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncyhyYW1f
c3RhcnQsIHJhbV9lbmQpOw0KICAgICBtYXhfcGFnZSA9IFBGTl9ET1dOKHJh
bV9lbmQpOw0KIA0KKyAgICBpbml0X2ZyYW1ldGFibGUoKTsNCisNCiAgICAg
LyoNCiAgICAgICogVGhlIGFsbG9jYXRvcnMgbWF5IG5lZWQgdG8gdXNlIG1h
cF9kb21haW5fcGFnZSgpIChzdWNoIGFzIGZvcg0KICAgICAgKiBzY3J1YmJp
bmcgcGFnZXMpLiBTbyB3ZSBuZWVkIHRvIHByZXBhcmUgdGhlIGRvbWhlYXAg
YXJlYSBmaXJzdC4NCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQv
bW11L21tLmMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbW11L21tLmMNCmluZGV4
IGMxZWZhMTM0OGFlZS4uOGJmYTI2M2JlOTFlIDEwMDY0NA0KLS0tIGEveGVu
L2FyY2gvYXJtL2FybTY0L21tdS9tbS5jDQorKysgYi94ZW4vYXJjaC9hcm0v
YXJtNjQvbW11L21tLmMNCkBAIC0yNzcsOSArMjc3LDEwIEBAIHZvaWQgX19p
bml0IHNldHVwX21tKHZvaWQpDQogICAgIGRpcmVjdG1hcF9tZm5fc3RhcnQg
PSBtYWRkcl90b19tZm4ocmFtX3N0YXJ0KTsNCiAgICAgZGlyZWN0bWFwX21m
bl9lbmQgPSBtYWRkcl90b19tZm4ocmFtX2VuZCk7DQogDQotICAgIHNldHVw
X2ZyYW1ldGFibGVfbWFwcGluZ3MocmFtX3N0YXJ0LCByYW1fZW5kKTsNCiAg
ICAgbWF4X3BhZ2UgPSBQRk5fRE9XTihyYW1fZW5kKTsNCiANCisgICAgaW5p
dF9mcmFtZXRhYmxlKCk7DQorDQogICAgIGluaXRfc3RhdGljbWVtX3BhZ2Vz
KCk7DQogICAgIGluaXRfc2hhcmVkbWVtX3BhZ2VzKCk7DQogfQ0KZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCmluZGV4IGEwZDhlNWFmZTk3Ny4u
NWY0MWRhNGIxYzMyIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL21tLmgNCisrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9t
bS5oDQpAQCAtMjExLDggKzIxMSw4IEBAIGV4dGVybiB2b2lkICplYXJseV9m
ZHRfbWFwKHBhZGRyX3QgZmR0X3BhZGRyKTsNCiBleHRlcm4gdm9pZCByZW1v
dmVfZWFybHlfbWFwcGluZ3Modm9pZCk7DQogLyogUHJlcGFyZSB0aGUgbWVt
b3J5IHN1YnlzdGVtIHRvIGJyaW5nLXVwIHRoZSBnaXZlbiBzZWNvbmRhcnkg
Q1BVICovDQogZXh0ZXJuIGludCBwcmVwYXJlX3NlY29uZGFyeV9tbShpbnQg
Y3B1KTsNCi0vKiBNYXAgYSBmcmFtZSB0YWJsZSB0byBjb3ZlciBwaHlzaWNh
bCBhZGRyZXNzZXMgcHMgdGhyb3VnaCBwZSAqLw0KLWV4dGVybiB2b2lkIHNl
dHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MocGFkZHJfdCBwcywgcGFkZHJfdCBw
ZSk7DQorLyogTWFwIGEgZnJhbWUgdGFibGUgKi8NCit2b2lkIGluaXRfZnJh
bWV0YWJsZSh2b2lkKTsNCiAvKiBtYXAgYSBwaHlzaWNhbCByYW5nZSBpbiB2
aXJ0dWFsIG1lbW9yeSAqLw0KIHZvaWQgX19pb21lbSAqaW9yZW1hcF9hdHRy
KHBhZGRyX3Qgc3RhcnQsIHNpemVfdCBsZW4sIHVuc2lnbmVkIGludCBhdHRy
aWJ1dGVzKTsNCiANCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW11L21t
LmMgYi94ZW4vYXJjaC9hcm0vbW11L21tLmMNCmluZGV4IDljNTA0NzljNjM3
My4uNjk2MTdhNDk4NmE1IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL21t
dS9tbS5jDQorKysgYi94ZW4vYXJjaC9hcm0vbW11L21tLmMNCkBAIC0xMCwx
NiArMTAsMzUgQEANCiANCiB1bnNpZ25lZCBsb25nIGZyYW1ldGFibGVfdmly
dF9lbmQgX19yZWFkX21vc3RseTsNCiANCi0vKiBNYXAgYSBmcmFtZSB0YWJs
ZSB0byBjb3ZlciBwaHlzaWNhbCBhZGRyZXNzZXMgcHMgdGhyb3VnaCBwZSAq
Lw0KLXZvaWQgX19pbml0IHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MocGFk
ZHJfdCBwcywgcGFkZHJfdCBwZSkNCitzdGF0aWMgdm9pZCBfX2luaXQNCitp
bml0X2ZyYW1ldGFibGVfY2h1bmsodW5zaWduZWQgbG9uZyBwZHhfcywgdW5z
aWduZWQgbG9uZyBwZHhfZSkNCiB7DQotICAgIHVuc2lnbmVkIGxvbmcgbnJf
cGR4cyA9IG1mbl90b19wZHgobWZuX2FkZChtYWRkcl90b19tZm4ocGUpLCAt
MSkpIC0NCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX3Bk
eChtYWRkcl90b19tZm4ocHMpKSArIDE7DQotICAgIHVuc2lnbmVkIGxvbmcg
ZnJhbWV0YWJsZV9zaXplID0gbnJfcGR4cyAqIHNpemVvZihzdHJ1Y3QgcGFn
ZV9pbmZvKTsNCi0gICAgbWZuX3QgYmFzZV9tZm47DQotICAgIGNvbnN0IHVu
c2lnbmVkIGxvbmcgbWFwcGluZ19zaXplID0gZnJhbWV0YWJsZV9zaXplIDwg
TUIoMzIpID8gTUIoMikNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBNQigzMik7
DQorICAgIHVuc2lnbmVkIGxvbmcgbnJfcGR4cyA9IHBkeF9lIC0gcGR4X3M7
DQorICAgIHVuc2lnbmVkIGxvbmcgY2h1bmtfc2l6ZSA9IG5yX3BkeHMgKiBz
aXplb2Yoc3RydWN0IHBhZ2VfaW5mbyk7DQorICAgIGNvbnN0IHVuc2lnbmVk
IGxvbmcgbWFwcGluZ19zaXplID0gY2h1bmtfc2l6ZSA8IE1CKDMyKSA/IE1C
KDIpIDogTUIoMzIpOw0KKyAgICB1bnNpZ25lZCBsb25nIHZpcnQ7DQogICAg
IGludCByYzsNCisgICAgbWZuX3QgYmFzZV9tZm47DQorDQorICAgIC8qIFJv
dW5kIHVwIHRvIDJNIG9yIDMyTSBib3VuZGFyeSwgYXMgYXBwcm9wcmlhdGUu
ICovDQorICAgIGNodW5rX3NpemUgPSBST1VORFVQKGNodW5rX3NpemUsIG1h
cHBpbmdfc2l6ZSk7DQorICAgIGJhc2VfbWZuID0gYWxsb2NfYm9vdF9wYWdl
cyhjaHVua19zaXplID4+IFBBR0VfU0hJRlQsIDMyIDw8ICgyMCAtIDEyKSk7
DQorDQorICAgIHZpcnQgPSAodW5zaWduZWQgbG9uZylwZHhfdG9fcGFnZShw
ZHhfcyk7DQorICAgIHJjID0gbWFwX3BhZ2VzX3RvX3hlbih2aXJ0LCBiYXNl
X21mbiwgY2h1bmtfc2l6ZSA+PiBQQUdFX1NISUZULA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgUEFHRV9IWVBFUlZJU09SX1JXIHwgX1BBR0VfQkxP
Q0spOw0KKyAgICBpZiAoIHJjICkNCisgICAgICAgIHBhbmljKCJVbmFibGUg
dG8gc2V0dXAgdGhlIGZyYW1ldGFibGUgbWFwcGluZ3NcbiIpOw0KKw0KKyAg
ICBtZW1zZXQoJmZyYW1lX3RhYmxlW3BkeF9zXSwgMCwgbnJfcGR4cyAqIHNp
emVvZihzdHJ1Y3QgcGFnZV9pbmZvKSk7DQorICAgIG1lbXNldCgmZnJhbWVf
dGFibGVbcGR4X2VdLCAtMSwNCisgICAgICAgICAgIGNodW5rX3NpemUgLSBu
cl9wZHhzICogc2l6ZW9mKHN0cnVjdCBwYWdlX2luZm8pKTsNCit9DQorDQor
dm9pZCBfX2luaXQgaW5pdF9mcmFtZXRhYmxlKHZvaWQpDQorew0KKyAgICB1
bnNpZ25lZCBpbnQgc2lkeCwgZWlkeCwgbmlkeDsNCisgICAgdW5zaWduZWQg
aW50IG1heF9pZHg7DQogDQogICAgIC8qDQogICAgICAqIFRoZSBzaXplIG9m
IHBhZGRyX3Qgc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIHRoZSBjb21wbGV0
ZSByYW5nZSBvZg0KQEAgLTI4LDI3ICs0NywyNyBAQCB2b2lkIF9faW5pdCBz
ZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHBhZGRyX3QgcHMsIHBhZGRyX3Qg
cGUpDQogICAgIEJVSUxEX0JVR19PTigoc2l6ZW9mKHBhZGRyX3QpICogQklU
U19QRVJfQllURSkgPCBQQUREUl9CSVRTKTsNCiAgICAgQlVJTERfQlVHX09O
KHNpemVvZihzdHJ1Y3QgcGFnZV9pbmZvKSAhPSBQQUdFX0lORk9fU0laRSk7
DQogDQotICAgIGlmICggZnJhbWV0YWJsZV9zaXplID4gRlJBTUVUQUJMRV9T
SVpFICkNCi0gICAgICAgIHBhbmljKCJUaGUgZnJhbWV0YWJsZSBjYW5ub3Qg
Y292ZXIgdGhlIHBoeXNpY2FsIHJlZ2lvbiAlIyJQUklwYWRkciIgLSAlIyJQ
UklwYWRkciJcbiIsDQotICAgICAgICAgICAgICBwcywgcGUpOw0KKyAgICBm
cmFtZXRhYmxlX2Jhc2VfcGR4ID0gbWZuX3RvX3BkeChkaXJlY3RtYXBfbWZu
X3N0YXJ0KTsNCiANCi0gICAgZnJhbWV0YWJsZV9iYXNlX3BkeCA9IG1mbl90
b19wZHgobWFkZHJfdG9fbWZuKHBzKSk7DQotICAgIC8qIFJvdW5kIHVwIHRv
IDJNIG9yIDMyTSBib3VuZGFyeSwgYXMgYXBwcm9wcmlhdGUuICovDQotICAg
IGZyYW1ldGFibGVfc2l6ZSA9IFJPVU5EVVAoZnJhbWV0YWJsZV9zaXplLCBt
YXBwaW5nX3NpemUpOw0KLSAgICBiYXNlX21mbiA9IGFsbG9jX2Jvb3RfcGFn
ZXMoZnJhbWV0YWJsZV9zaXplID4+IFBBR0VfU0hJRlQsIDMyPDwoMjAtMTIp
KTsNCisgICAgbWF4X3BkeCA9IHBmbl90b19wZHgobWF4X3BhZ2UgLSAxKSAr
IDE7DQogDQotICAgIHJjID0gbWFwX3BhZ2VzX3RvX3hlbihGUkFNRVRBQkxF
X1ZJUlRfU1RBUlQsIGJhc2VfbWZuLA0KLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgZnJhbWV0YWJsZV9zaXplID4+IFBBR0VfU0hJRlQsDQotICAgICAg
ICAgICAgICAgICAgICAgICAgICBQQUdFX0hZUEVSVklTT1JfUlcgfCBfUEFH
RV9CTE9DSyk7DQotICAgIGlmICggcmMgKQ0KLSAgICAgICAgcGFuaWMoIlVu
YWJsZSB0byBzZXR1cCB0aGUgZnJhbWV0YWJsZSBtYXBwaW5ncy5cbiIpOw0K
KyAgICBpZiAoIG1heF9wZHggPiBGUkFNRVRBQkxFX05SICkNCisgICAgICAg
IHBhbmljKCJGcmFtZXRhYmxlIHRvbyBzbWFsbFxuIik7DQorDQorICAgIG1h
eF9pZHggPSBESVZfUk9VTkRfVVAobWF4X3BkeCwgUERYX0dST1VQX0NPVU5U
KTsNCisNCisgICAgZm9yICggc2lkeCA9IChmcmFtZXRhYmxlX2Jhc2VfcGR4
IC8gUERYX0dST1VQX0NPVU5UKTsgOyBzaWR4ID0gbmlkeCApDQorICAgIHsN
CisgICAgICAgIGVpZHggPSBmaW5kX25leHRfemVyb19iaXQocGR4X2dyb3Vw
X3ZhbGlkLCBtYXhfaWR4LCBzaWR4KTsNCisgICAgICAgIG5pZHggPSBmaW5k
X25leHRfYml0KHBkeF9ncm91cF92YWxpZCwgbWF4X2lkeCwgZWlkeCk7DQor
DQorICAgICAgICBpZiAoIG5pZHggPj0gbWF4X2lkeCApDQorICAgICAgICAg
ICAgYnJlYWs7DQogDQotICAgIG1lbXNldCgmZnJhbWVfdGFibGVbMF0sIDAs
IG5yX3BkeHMgKiBzaXplb2Yoc3RydWN0IHBhZ2VfaW5mbykpOw0KLSAgICBt
ZW1zZXQoJmZyYW1lX3RhYmxlW25yX3BkeHNdLCAtMSwNCi0gICAgICAgICAg
IGZyYW1ldGFibGVfc2l6ZSAtIChucl9wZHhzICogc2l6ZW9mKHN0cnVjdCBw
YWdlX2luZm8pKSk7DQorICAgICAgICBpbml0X2ZyYW1ldGFibGVfY2h1bmso
c2lkeCAqIFBEWF9HUk9VUF9DT1VOVCwgZWlkeCAqIFBEWF9HUk9VUF9DT1VO
VCk7DQorICAgIH0NCiANCi0gICAgZnJhbWV0YWJsZV92aXJ0X2VuZCA9IEZS
QU1FVEFCTEVfVklSVF9TVEFSVCArIChucl9wZHhzICoNCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
b2Yoc3RydWN0IHBhZ2VfaW5mbykpOw0KKyAgICBpbml0X2ZyYW1ldGFibGVf
Y2h1bmsoc2lkeCAqIFBEWF9HUk9VUF9DT1VOVCwgbWF4X3BkeCk7DQogfQ0K
IA0KIC8qDQotLSANCjIuMjUuMQ0K

--8323329-107501406-1751330070=:862517--

