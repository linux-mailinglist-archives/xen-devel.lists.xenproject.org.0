Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512FAF051D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 22:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030081.1403740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWhs4-0003ZK-69; Tue, 01 Jul 2025 20:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030081.1403740; Tue, 01 Jul 2025 20:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWhs4-0003WZ-2n; Tue, 01 Jul 2025 20:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1030081;
 Tue, 01 Jul 2025 20:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8i3=ZO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uWhs2-0003WT-Uq
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 20:46:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72efb95f-56bc-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 22:46:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60D194547B;
 Tue,  1 Jul 2025 20:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595DAC4CEEB;
 Tue,  1 Jul 2025 20:46:20 +0000 (UTC)
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
X-Inumbo-ID: 72efb95f-56bc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751402782;
	bh=lRHYEb8G2s4BTKrWPm+e2GBkLAKqo8rLazauOJpgIGo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T3ZK1rge+eH38exat+gcwa7RHPF9CvUHWUnROijp5HIYxhT3FCQPDkfxOiXLbhzii
	 6H3UDeR3jBGhvIoEoUcod9QdRNhrd0e99huKlm1DkmXUQc+ZClXvUJLo05GUIYuHCd
	 xQMiGpanc4c1bg+fbblQ87zmLlP5x6UCpnlVD06Aff1phRy4vnV0SKTOsQphj/sg/T
	 DEFCIdsvyDTy5BVuLnSYYcV3hmDBO+/VXGFwgi32budHMYenAjV7Y4EqUL+zfjjPzE
	 L9NqzB9OebBrxvznmKLETGFEl34GSLFI5XuqQxZenEwxDuGofvJJhNo3hGfgTbrVup
	 P/DP49hSWgIPg==
Date: Tue, 1 Jul 2025 13:46:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
In-Reply-To: <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
References: <20250620111130.29057-1-roger.pau@citrix.com> <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop> <aGKnDHtRD5OLGaYj@macbook.local> <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1140790467-1751402782=:862517"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1140790467-1751402782=:862517
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Jul 2025, Jan Beulich wrote:
> Sadly from this you omitted the output from the setup of the offsets
> arrays. Considering also your later reply, I'd be curious to know what
> mfn_to_pdx(0x50000000) is.
 
Full logs here, and debug patch in attachment.

(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000000000000 - 000000007fffffff
(XEN) RAM: 0000000800000000 - 000000087fffffff
(XEN) RAM: 0000050000000000 - 000005007fffffff
(XEN) RAM: 0000060000000000 - 000006007fffffff
(XEN) RAM: 0000070000000000 - 000007007fffffff
(XEN) 
(XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
(XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
(XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
(XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
(XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
(XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
(XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
(XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
(XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
(XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
(XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
(XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
(XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
(XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
(XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
(XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
(XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
(XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
(XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
(XEN) 
(XEN) 
(XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
(XEN) [00000006bfc302ec] parameter "debug" unknown!
(XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
(XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
(XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
(XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
(XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
(XEN) [00000006bfd1444f] DEBUG setup_mm 252
(XEN) [00000006bfd3dc6f] DEBUG setup_mm 273 start=0 size=80000000 ram_end=80000000 directmap_base_pdx=0
(XEN) [00000006bfd5616e] DEBUG setup_directmap_mappings 229 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=0
(XEN) [00000006bfd7d38a] DEBUG setup_directmap_mappings 237 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0
(XEN) [00000006bfd92728] DEBUG setup_mm 273 start=800000000 size=80000000 ram_end=880000000 directmap_base_pdx=0
(XEN) [00000006bfdaba3b] DEBUG setup_directmap_mappings 229 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=800000
(XEN) [00000006bfdcd79c] DEBUG setup_directmap_mappings 237 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0
(XEN) [00000006bfde4d82] DEBUG setup_mm 273 start=50000000000 size=80000000 ram_end=50080000000 directmap_base_pdx=0
(XEN) [00000006bfdfaef0] DEBUG setup_directmap_mappings 229 base_mfn=50000000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=50000000
(XEN) [00000006bfe35249] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
(XEN) [00000006bfe68507] ----[ Xen-4.21-unstable  arm64  debug=y  Not tainted ]----
(XEN) [00000006bfe766bf] CPU:    0
(XEN) [00000006bfe832e0] PC:     00000a00002da70c setup_mm+0x284/0x308
(XEN) [00000006bfea5b1a] LR:     00000a00002da6b0
(XEN) [00000006bfeb1032] SP:     00000a0000327e00
(XEN) [00000006bfebf403] CPSR:   00000000200003c9 MODE:64-bit EL2h (Hypervisor, handler)
(XEN) [00000006bfed4634]      X0: 0000000000000017  X1: 0000000000000000  X2: 0000000050000000
(XEN) [00000006bfee4d11]      X3: 000000004fffffff  X4: 0000000000000020  X5: 0000000000000000
(XEN) [00000006bfef48cf]      X6: 0000000000000000  X7: 0000000000000000  X8: ffffffffffffffff
(XEN) [00000006bff047ac]      X9: fefefefefefeff09 X10: 0000000000000080 X11: 0101010101010101
(XEN) [00000006bff153b4]     X12: 0000000000000008 X13: 0000000000000009 X14: 0000000000000030
(XEN) [00000006bff2620d]     X15: 00000a0000a00000 X16: 00000a0000291478 X17: 0000000000000000
(XEN) [00000006bff35c41]     X18: 000000007be9bbe0 X19: 00000a0000292c40 X20: 00000a00002ade68
(XEN) [00000006bff465a5]     X21: 0000050080000000 X22: 0000000000000000 X23: 0000000180000000
(XEN) [00000006bff57a51]     X24: 0000000000000002 X25: 00000a0000292c50 X26: 0000000050000000
(XEN) [00000006bff67d91]     X27: 0000000000080000 X28: 0000050000000000  FP: 00000a0000327e00
(XEN) [00000006bff76ebe] 
(XEN) [00000006bff7c3e3]   VTCR_EL2: 0000000000000000
(XEN) [00000006bff8501a]  VTTBR_EL2: 0000000000000000
(XEN) [00000006bff8f616] 
(XEN) [00000006bff94c4a]  SCTLR_EL2: 0000000030cd183d
(XEN) [00000006bff9e3f7]    HCR_EL2: 0000000000000038
(XEN) [00000006bffaac9c]  TTBR0_EL2: 0000000022148000
(XEN) [00000006bffb6794] 
(XEN) [00000006bffbc972]    ESR_EL2: 00000000f2000001
(XEN) [00000006bffcb424]  HPFAR_EL2: 0000000000000000
(XEN) [00000006bffd7c69]    FAR_EL2: 0000000000000000
(XEN) [00000006bffe3719] 
(XEN) [00000006bffecd4b] Xen stack trace from sp=00000a0000327e00:
(XEN) [00000006bfff9321]    00000a0000327e60 00000a00002e4378 0000000022200000 000000000000f000
(XEN) [00000006c000e3e1]    00000a0000c0a5c0 00000a0000332000 00000a0000a00000 0000000000000000
(XEN) [00000006c001f69c]    0000000000000000 0000000000000000 0000000000000000 000000007bff2f70
(XEN) [00000006c0031b91]    000000007be89ea0 00000a00002001a4 0000000022000000 fffff60021e00000
(XEN) [00000006c0041c20]    0000000022200000 0000000000001710 0000000000000000 0000000000000000
(XEN) [00000006c0052629]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c0065bde]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c00752d1]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c00858cc]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c0096b34]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c00a72f3]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c00b8357]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c00ce60f]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c00e2ee4]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c00f53e7]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c01091f3]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [00000006c011cd30] Xen call trace:
(XEN) [00000006c01264b7]    [<00000a00002da70c>] setup_mm+0x284/0x308 (PC)
(XEN) [00000006c01348a8]    [<00000a00002da6b0>] setup_mm+0x228/0x308 (LR)
(XEN) [00000006c0144263]    [<00000a00002e4378>] start_xen+0x118/0x9d0
(XEN) [00000006c01529c3]    [<00000a00002001a4>] arch/arm/arm64/head.o#primary_switched+0x4/0x24
(XEN) [00000006c0165f60] 
(XEN) [00000006c0176bd8] 
(XEN) [00000006c017c5cf] ****************************************
(XEN) [00000006c018964c] Panic on CPU 0:
(XEN) [00000006c0190b79] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
(XEN) [00000006c01af78d] ****************************************
--8323329-1140790467-1751402782=:862517
Content-Type: text/x-diff; name=debug.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2507011346190.862517@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: attachment; filename=debug.patch

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9tbXUvbW0uYyBiL3hl
bi9hcmNoL2FybS9hcm02NC9tbXUvbW0uYw0KaW5kZXggMjczMjdiMTFkYi4u
YzFlYjEzMjE5YyAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9t
bXUvbW0uYw0KKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L21tdS9tbS5jDQpA
QCAtMjI2LDYgKzIyNiw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9k
aXJlY3RtYXBfbWFwcGluZ3ModW5zaWduZWQgbG9uZyBiYXNlX21mbiwNCiAg
ICAgICAgICAgICAoYmFzZV9tZm4gLSBtZm5fZ2IpICogUEFHRV9TSVpFOw0K
ICAgICB9DQogDQorICAgIHByaW50aygiREVCVUcgJXMgJWQgYmFzZV9tZm49
JWx4IG5yX21mbnM9JWx4IGRpcmVjdG1hcF9iYXNlX3BkeD0lbHggbWZuX3Rv
X3BkeD0lbHhcbiIsX19mdW5jX18sX19MSU5FX18sYmFzZV9tZm4sbnJfbWZu
cyxkaXJlY3RtYXBfYmFzZV9wZHgsKHVuc2lnbmVkIGxvbmcpbWZuX3RvX3Bk
eChfbWZuKGJhc2VfbWZuKSkpOw0KICAgICBpZiAoIGJhc2VfbWZuIDwgbWZu
X3goZGlyZWN0bWFwX21mbl9zdGFydCkgKQ0KICAgICAgICAgcGFuaWMoImNh
bm5vdCBhZGQgZGlyZWN0bWFwIG1hcHBpbmcgYXQgJWx4IGJlbG93IGhlYXAg
c3RhcnQgJWx4XG4iLA0KICAgICAgICAgICAgICAgYmFzZV9tZm4sIG1mbl94
KGRpcmVjdG1hcF9tZm5fc3RhcnQpKTsNCkBAIC0yMzMsNiArMjM0LDcgQEAg
c3RhdGljIHZvaWQgX19pbml0IHNldHVwX2RpcmVjdG1hcF9tYXBwaW5ncyh1
bnNpZ25lZCBsb25nIGJhc2VfbWZuLA0KICAgICByYyA9IG1hcF9wYWdlc190
b194ZW4oKHZhZGRyX3QpX19tZm5fdG9fdmlydChiYXNlX21mbiksDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICBfbWZuKGJhc2VfbWZuKSwgbnJfbWZu
cywNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfSFlQRVJWSVNP
Ul9SVyB8IF9QQUdFX0JMT0NLKTsNCisgICAgcHJpbnRrKCJERUJVRyAlcyAl
ZCBiYXNlX21mbj0lbHggbnJfbWZucz0lbHggZGlyZWN0bWFwX2Jhc2VfcGR4
PSVseFxuIixfX2Z1bmNfXyxfX0xJTkVfXyxiYXNlX21mbixucl9tZm5zLGRp
cmVjdG1hcF9iYXNlX3BkeCk7DQogICAgIGlmICggcmMgKQ0KICAgICAgICAg
cGFuaWMoIlVuYWJsZSB0byBzZXR1cCB0aGUgZGlyZWN0bWFwIG1hcHBpbmdz
LlxuIik7DQogfQ0KQEAgLTI0Nyw2ICsyNDksNyBAQCB2b2lkIF9faW5pdCBz
ZXR1cF9tbSh2b2lkKQ0KIA0KICAgICBpbml0X3BkeCgpOw0KIA0KKyAgICBw
cmludGsoIkRFQlVHICVzICVkXG4iLF9fZnVuY19fLF9fTElORV9fKTsNCiAg
ICAgLyoNCiAgICAgICogV2UgbmVlZCBzb21lIG1lbW9yeSB0byBhbGxvY2F0
ZSB0aGUgcGFnZS10YWJsZXMgdXNlZCBmb3IgdGhlIGRpcmVjdG1hcA0KICAg
ICAgKiBtYXBwaW5ncy4gQnV0IHNvbWUgcmVnaW9ucyBtYXkgY29udGFpbiBt
ZW1vcnkgYWxyZWFkeSBhbGxvY2F0ZWQNCkBAIC0yNjcsMTkgKzI3MCwyNCBA
QCB2b2lkIF9faW5pdCBzZXR1cF9tbSh2b2lkKQ0KICAgICAgICAgcmFtX3N0
YXJ0ID0gbWluKHJhbV9zdGFydCwgYmFuay0+c3RhcnQpOw0KICAgICAgICAg
cmFtX2VuZCA9IG1heChyYW1fZW5kLCBiYW5rX2VuZCk7DQogDQorICAgICAg
ICBwcmludGsoIkRFQlVHICVzICVkIHN0YXJ0PSVseCBzaXplPSVseCByYW1f
ZW5kPSVseCBkaXJlY3RtYXBfYmFzZV9wZHg9JWx4XG4iLF9fZnVuY19fLF9f
TElORV9fLGJhbmstPnN0YXJ0LGJhbmstPnNpemUscmFtX2VuZCwgZGlyZWN0
bWFwX2Jhc2VfcGR4KTsNCiAgICAgICAgIHNldHVwX2RpcmVjdG1hcF9tYXBw
aW5ncyhQRk5fRE9XTihiYW5rLT5zdGFydCksDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUEZOX0RPV04oYmFuay0+c2l6ZSkpOw0KICAg
ICB9DQorICAgIHByaW50aygiREVCVUcgJXMgJWRcbiIsX19mdW5jX18sX19M
SU5FX18pOw0KIA0KICAgICB0b3RhbF9wYWdlcyArPSByYW1fc2l6ZSA+PiBQ
QUdFX1NISUZUOw0KIA0KICAgICBkaXJlY3RtYXBfdmlydF9lbmQgPSBYRU5I
RUFQX1ZJUlRfU1RBUlQgKyByYW1fZW5kIC0gcmFtX3N0YXJ0Ow0KICAgICBk
aXJlY3RtYXBfbWZuX3N0YXJ0ID0gbWFkZHJfdG9fbWZuKHJhbV9zdGFydCk7
DQogICAgIGRpcmVjdG1hcF9tZm5fZW5kID0gbWFkZHJfdG9fbWZuKHJhbV9l
bmQpOw0KKyAgICBwcmludGsoIkRFQlVHICVzICVkXG4iLF9fZnVuY19fLF9f
TElORV9fKTsNCiANCiAgICAgbWF4X3BhZ2UgPSBQRk5fRE9XTihyYW1fZW5k
KTsNCiANCisgICAgcHJpbnRrKCJERUJVRyAlcyAlZFxuIixfX2Z1bmNfXyxf
X0xJTkVfXyk7DQogICAgIGluaXRfZnJhbWV0YWJsZSgpOw0KKyAgICBwcmlu
dGsoIkRFQlVHICVzICVkXG4iLF9fZnVuY19fLF9fTElORV9fKTsNCiANCiAg
ICAgaW5pdF9zdGF0aWNtZW1fcGFnZXMoKTsNCiAgICAgaW5pdF9zaGFyZWRt
ZW1fcGFnZXMoKTsNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW11L21t
LmMgYi94ZW4vYXJjaC9hcm0vbW11L21tLmMNCmluZGV4IDY5NjE3YTQ5ODYu
LmMzMWVmMzI1NWIgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vbW11L21t
LmMNCisrKyBiL3hlbi9hcmNoL2FybS9tbXUvbW0uYw0KQEAgLTI1LDYgKzI1
LDcgQEAgaW5pdF9mcmFtZXRhYmxlX2NodW5rKHVuc2lnbmVkIGxvbmcgcGR4
X3MsIHVuc2lnbmVkIGxvbmcgcGR4X2UpDQogICAgIGJhc2VfbWZuID0gYWxs
b2NfYm9vdF9wYWdlcyhjaHVua19zaXplID4+IFBBR0VfU0hJRlQsIDMyIDw8
ICgyMCAtIDEyKSk7DQogDQogICAgIHZpcnQgPSAodW5zaWduZWQgbG9uZylw
ZHhfdG9fcGFnZShwZHhfcyk7DQorICAgIHByaW50aygiREVCVUcgJXMgJWQg
dmlydD0lbHggYmFzZV9tZm49JWx4IHBmbl9zdGFydD0lbHggcGZuX2VuZD0l
bHhcbiIsX19mdW5jX18sX19MSU5FX18sKHVuc2lnbmVkIGxvbmcpdmlydCxt
Zm5feChiYXNlX21mbiksbWZuX3gocGR4X3RvX21mbihwZHhfcykpLG1mbl94
KHBkeF90b19tZm4ocGR4X2UpKSk7DQogICAgIHJjID0gbWFwX3BhZ2VzX3Rv
X3hlbih2aXJ0LCBiYXNlX21mbiwgY2h1bmtfc2l6ZSA+PiBQQUdFX1NISUZU
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9IWVBFUlZJU09S
X1JXIHwgX1BBR0VfQkxPQ0spOw0KICAgICBpZiAoIHJjICkNCkBAIC02NCw2
ICs2NSw3IEBAIHZvaWQgX19pbml0IGluaXRfZnJhbWV0YWJsZSh2b2lkKQ0K
ICAgICAgICAgaWYgKCBuaWR4ID49IG1heF9pZHggKQ0KICAgICAgICAgICAg
IGJyZWFrOw0KIA0KKyAgICAgICAgcHJpbnRrKCJERUJVRyAlcyAlZCBzdGFy
dD0lbHggZW5kPSVseFxuIixfX2Z1bmNfXyxfX0xJTkVfXyxtZm5feChwZHhf
dG9fbWZuKHNpZHggKiBQRFhfR1JPVVBfQ09VTlQpKSxtZm5feChwZHhfdG9f
bWZuKGVpZHggKiBQRFhfR1JPVVBfQ09VTlQpKSk7DQogICAgICAgICBpbml0
X2ZyYW1ldGFibGVfY2h1bmsoc2lkeCAqIFBEWF9HUk9VUF9DT1VOVCwgZWlk
eCAqIFBEWF9HUk9VUF9DT1VOVCk7DQogICAgIH0NCiANCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
DQppbmRleCBjOWFkNmJiYWI2Li4xZjVjMTg2NmM0IDEwMDY0NA0KLS0tIGEv
eGVuL2FyY2gvYXJtL3NldHVwLmMNCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1
cC5jDQpAQCAtMjkxLDYgKzI5MSw3IEBAIHZvaWQgX19pbml0IGluaXRfcGR4
KHZvaWQpDQogICAgICAgICBiYW5rX3NpemUgPSBtZW0tPmJhbmtbYmFua10u
c2l6ZTsNCiAgICAgICAgIGJhbmtfZW5kID0gYmFua19zdGFydCArIGJhbmtf
c2l6ZTsNCiANCisgICAgICAgIHByaW50aygiREVCVUcgJXMgJWQgc3RhcnQ9
JWx4IGVuZD0lbHhcbiIsX19mdW5jX18sX19MSU5FX18sYmFua19zdGFydCxi
YW5rX2VuZCk7DQogICAgICAgICBzZXRfcGR4X3JhbmdlKHBhZGRyX3RvX3Bm
bihiYW5rX3N0YXJ0KSwNCiAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJf
dG9fcGZuKGJhbmtfZW5kKSk7DQogICAgIH0NCg==

--8323329-1140790467-1751402782=:862517--

