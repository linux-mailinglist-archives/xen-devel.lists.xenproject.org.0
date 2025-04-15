Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1DA89E8E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 14:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953815.1348229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fjB-0004XC-Ox; Tue, 15 Apr 2025 12:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953815.1348229; Tue, 15 Apr 2025 12:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fjB-0004Vi-Kl; Tue, 15 Apr 2025 12:49:25 +0000
Received: by outflank-mailman (input) for mailman id 953815;
 Tue, 15 Apr 2025 12:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miIs=XB=bounce.vates.tech=bounce-md_30504962.67fe55cd.v1-146e237133204c16874ef6b3e76394f6@srs-se1.protection.inumbo.net>)
 id 1u4fj9-0004Va-Q0
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:49:23 +0000
Received: from mail177-19.suw61.mandrillapp.com
 (mail177-19.suw61.mandrillapp.com [198.2.177.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b21025b-19f8-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 14:49:18 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-19.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZcP9n0wqZzVr
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 12:49:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 146e237133204c16874ef6b3e76394f6; Tue, 15 Apr 2025 12:49:17 +0000
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
X-Inumbo-ID: 0b21025b-19f8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744721357; x=1744991357;
	bh=T+uWR1U245kDgORs/TtU3d1QO19OpHqdcUn8ysTT48g=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=CTsz1fQCDZHGiT8RGYKIOcDNN+TCj43f6SJIuz/ItSk6yv+tTw3hqgxpeZMX8cxqZ
	 pefAg+rdii1u9x5Px4JPAE6VDjuPUYuN7Bn+kn+fUGvW+VpPH1OJWUywo70O4KsZ3B
	 UmltnVftEuXCcKlfwoEstfNDtPHj26um2dd1UDNazSQVYwKukgsl5xiRduURNgSbau
	 C8QtnulHSmGtaycHWpWbcqpPpBQaPo4jEEFvFRRI2prMJVPIP/bSOwJ4chodUV/Os5
	 Fujk8gZWQ4tJna/uypTiYqTX6rqwK6AbTMM2VAHaoN5IuDZ2Yq8a4Y1xyGYs6H5keg
	 FmHSshX3bSEgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744721357; x=1744981857; i=teddy.astie@vates.tech;
	bh=T+uWR1U245kDgORs/TtU3d1QO19OpHqdcUn8ysTT48g=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=bYWSzIzbfwoxtD9PD25MBljyZYOZ6l3f/ius07Srgm4AZq5NDpPsZJPsOtaiqC/8+
	 LXO9ayb73aR67T4KAwPQXARaa4v4/Ku3R1+hU7uFtwSRXCBSmWAAVwbFRrurmmOR6E
	 LSFFrWMpCLPT4BeFzu8FxLAJ7DSKWbzPqRWaShX3krf1my9EmDp0eUJaieMgx2ZLql
	 uSCYdyIOmGyh561OFwQe3XcJ0RL9qOEUFrTNgqzdf/6sRsYiO8by1v4lgSY0z7IZPw
	 DnQ8MohnxKhhdLnsX+Aw5Ji3dMbMse+nL8GW0oMPDH99n5cF1XCA8UzQBca0F7aS27
	 TvrTotekN7HnQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/shadow:=20Fix=20UBSAN=20in=20hvm=5Femulate=5Finsn=5Ffetch?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744721356145
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Tim Deegan" <tim@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <91bd66eae876b940b09b3b650a21614e42ab0469.1744721279.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.146e237133204c16874ef6b3e76394f6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250415:md
Date: Tue, 15 Apr 2025 12:49:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

UBSAN complains when trying memcpy with a NULL pointer even if it's going to
copy zero bytes (which are the only cases where a NULL pointer is used).
Fix this by only doing the memcpy if the pointer is non-NULL.

(XEN) ================================================================================
(XEN) UBSAN: Undefined behaviour in arch/x86/mm/shadow/hvm.c:168:5
(XEN) null pointer passed as argument 1, declared with nonnull attribute
(XEN) ----[ Xen-4.21-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d0402f789c>] common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d1v0)
(XEN) rax: ffff82d040a82eb0   rbx: ffff83021b6e7808   rcx: 000000000000c458
(XEN) rdx: ffff83021b6e7fd0   rsi: 000000000000000a   rdi: ffff83021b6e7808
(XEN) rbp: ffff83021b6e77f8   rsp: ffff83021b6e77e8   r8:  00000000ffffffff
(XEN) r9:  00000000ffffffff   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 000000000000004d   r13: 0000000000000000   r14: ffff82d040a82eb0
(XEN) r15: 00000000002ffddc   cr0: 0000000080050033   cr4: 00000000001526e0
(XEN) cr3: 000000021b7f4000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0402f789c> (common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2):
(XEN)  89 e5 41 54 53 48 89 fb <0f> 0b 48 8d 3d 1b cf 36 00 e8 b4 94 00 00 48 85
(XEN) Xen stack trace from rsp=ffff83021b6e77e8:
(XEN)    ffff82d040a82ea0 000000000000004d ffff83021b6e7820 ffff82d0402f8435
(XEN)    0000000000000202 ffff83021b6e7d25 0000000000000000 ffff83021b6e7858
(XEN)    ffff82d040455cb6 00000000002ffddc ffff83021b6e7ef8 ffff83021fbf1010
(XEN)    0000000000000000 0000000000000000 ffff83021b6e7bd8 ffff82d0405b562b
(XEN)    ffffffff00200033 ffffffff0020874b 00007cfde4918743 ffff83021b6e7af0
(XEN)    0000000000000003 000000000000000a 0000000000000000 0000000440661f40
(XEN)    ffffffff00000000 0000000000000000 00007cfd000000e8 ffff83021b6e79a8
(XEN)    ffff83021b6e7980 ffff82d040d3fa90 00000000a00000e8 ffff82d0406904a0
(XEN)    ffff83021b6e7cd8 ffff8302159963f0 ffff83021b6e7998 ffff82d04052f592
(XEN)    fffffffa0000000a ffff83021b6e7b21 393082d040661f40 0000001000000033
(XEN)    ffffffff00307b39 ffffffffe491868b ffffffff00200d00 00007cfde491867b
(XEN)    ffff83021b6e7bb8 0000000000000003 0000000000000001 0000000000000000
(XEN)    0000000000000000 0000000000000067 ffff8302159963f0 aaaaaaaaaaaaaaaa
(XEN)    aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa
(XEN)    aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa ffff83021b7fc008
(XEN)    00000000000002ff ffff8302159963f0 0000000000000000 ffff830215994000
(XEN)    0000000715994000 0000000000000000 0000000000000003 0000000000000000
(XEN)    0000000000000000 8086000000008086 0000000000000000 0000000000000000
(XEN)    0000000400000002 00000000002ffddc 0000000000000000 8086000000008086
(XEN)    0000000000000000 0000000000000000 ffffffffffffffff 000000000000001f
(XEN) Xen call trace:
(XEN)    [<ffff82d0402f789c>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
(XEN)    [<ffff82d0402f8435>] F __ubsan_handle_nonnull_arg+0x7c/0xb3
(XEN)    [<ffff82d040455cb6>] F arch/x86/mm/shadow/hvm.c#hvm_emulate_insn_fetch+0xfb/0x100
(XEN)    [<ffff82d0405b562b>] F x86_emulate+0x17f6b/0x3b8e3
(XEN)    [<ffff82d0405dce4f>] F x86_emulate_wrapper+0x87/0x216
(XEN)    [<ffff82d040489847>] F arch/x86/mm/shadow/guest_4.c#sh_page_fault__guest_4+0x908/0x3b34
(XEN)    [<ffff82d0403ca3ac>] F vmx_vmexit_handler+0x1691/0x3439
(XEN)    [<ffff82d040204683>] F vmx_asm_vmexit_handler+0x103/0x220
(XEN)
(XEN) ================================================================================

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/mm/shadow/hvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 114957a3e1..298dd0f229 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -165,7 +165,8 @@ hvm_emulate_insn_fetch(unsigned long offset,
                         hvm_access_insn_fetch, sh_ctxt);
 
     /* Hit the cache. Simple memcpy. */
-    memcpy(p_data, &sh_ctxt->insn_buf[insn_off], bytes);
+    if ( p_data )
+        memcpy(p_data, &sh_ctxt->insn_buf[insn_off], bytes);
     return X86EMUL_OKAY;
 }
 
-- 
2.47.2



 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


