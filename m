Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGT/DI2fgGl2/wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F99CC8A8
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218572.1527394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVR-0005cN-H2; Mon, 02 Feb 2026 12:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218572.1527394; Mon, 02 Feb 2026 12:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVR-0005av-Df; Mon, 02 Feb 2026 12:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1218572;
 Mon, 02 Feb 2026 12:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lssc=AG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vmtVP-0005NS-R4
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 12:58:15 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b82926-0036-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 13:58:14 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so32497125e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 04:58:14 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbd0f043sm107954345e9.7.2026.02.02.04.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 04:58:12 -0800 (PST)
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
X-Inumbo-ID: d5b82926-0036-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770037093; x=1770641893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PCN+JMwSkisOaNF3qhnnL2HUsH6g8JJShv2LCENQeM=;
        b=YVlBgNaCVXNtD76XpGKsE6lEJ7z4OUjIrUDUIivzutuW6f/DHJUJ3hMnPf31qB4gpN
         gkHuB3ykpe+Ycc9gUaj+zg4BF8K2bKzntsGVHMoHxw+5OOGRBZol2VHaEz/1oF1m7alz
         bCqq2jP4WWVsJzj6h5QYLKI5bJx6dcYm5JluXQDubz0qQ055NMf799lH7vAf2S9r2k/S
         aSwfmTIn4calC5AUXyMsIuidw5O250md8x5iocUJM659y1x3R3DuQ2l3ip4K1VlqG0sv
         fPfyHuUoYsQYnqUOgz3n+z/mJVvzi3sJeuaN8cyiRIpuSk97VsdyKy6R+jdDjy3cYq2o
         Krog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770037093; x=1770641893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6PCN+JMwSkisOaNF3qhnnL2HUsH6g8JJShv2LCENQeM=;
        b=uQjBEb9dDuK4mhaZVpn0FTTryVivD6KtzOjEKQG9mcXWsL2TSlhohG3C8B+SQbfp4s
         ZIIn10p9k5dAnYT3ngfmzVtaJ7f8lQHtvVLB8NrPhIr5TR2p2PWw6Yj0cJ1QAMJRmeNk
         F6HLsJ3BkuoaDXZssImmhqYaWmpUSOkHAMMakgtt6R8FJQj7zAUvoAiBaERvF+cEzMMi
         ENALCY+zz/blRIrErXXj9tgsELJXliZqQ6Rw/LepCU8MctRydyubJtwwl7AD11wN5Hdd
         ByrvPEdkP0uxAmWXSsJEL5Jv6iuMlq6A9eSqK3vgzY+OiW2mcV7OFupbMlrKg3jpoBjl
         v7wQ==
X-Gm-Message-State: AOJu0Yw3/NQ47YT4wxmtvfBqZtNtSK+e4d+n7fpmxbRHuBW7AgdiNa6r
	Lr7dxOylN7fn5q4vQmK2MB2lbo2P0cyZjQmwMdFOH8YrVb0w+4MdJK9/aN5oIA==
X-Gm-Gg: AZuq6aKWE58m0fWF77oANglcQFAC/nVzdigvlE0bW745XT/23JM4OhaJ2E2eFNoOfYk
	IGCPHtj3HvRc9A5HXr+NrQKvwYrxJZv1/CGqE2pbIou1GUYNRvG0kHs251RY1pRL7LNt4phGTY1
	IZzFlRNCqpc7TDTxUKsw35ureDDEo6B8L8z70lpmZLxVzKpPtYafqBVNGq2+Kqqeuf6mchPp/TV
	baHnCiCGinpGBSZLJ4SKGnhEeKB5wD/81gHYyj70poNGmfs/ZK96FtEc3gr4JupEz7YdKYH797R
	vHp0roKE+Q+htv9USolQXlzG2NvKjGTFZWWq67ZAh0z60uZ2ePZ+hqmxK/gdclXw9Fucbc4zD5t
	wcZQo/ovbOrCBCCpW8gbCxqTtRsc2xWUpIBl9Otdv4zYccHW0eQpY0yqt1Ua6E3C9yjqKscgop4
	Wdb8C+sIyT7aqn9ZQaetp52/KYNx+XSSRfiY3KXXipyQTQbGV+dSOk3wXe3A==
X-Received: by 2002:a05:600c:1549:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-482db493944mr154293685e9.17.1770037093221;
        Mon, 02 Feb 2026 04:58:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/3] xen/riscv: implement p2m_ctx_switch_{to,from}_state()
Date: Mon,  2 Feb 2026 13:57:59 +0100
Message-ID: <2e4cd29f19945e90733ac85e023d53cecbe1d14d.1770036584.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770036584.git.oleksii.kurochko@gmail.com>
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B5F99CC8A8
X-Rspamd-Action: no action

Introduce functions required to perform a p2m context switch during
a vCPU context switch.

As no mechanism is provided to atomically change vsatp and hgatp
together. Hence, to prevent speculative execution causing one
guest’s VS-stage translations to be cached under another guest’s
VMID, world-switch code should zero vsatp in p2m_ctx_swith_from(),
then construct new hgatp and  write the new vsatp value in
p2m_ctx_switch_to().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/p2m.h |  4 ++
 xen/arch/riscv/p2m.c             | 81 ++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index f63b5dec99b1..1d8c97326565 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -255,6 +255,10 @@ static inline bool p2m_is_locked(const struct p2m_domain *p2m)
 struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                         p2m_type_t *t);
 
+
+void p2m_ctx_switch_from(struct vcpu *p);
+void p2m_ctx_switch_to(struct vcpu *n);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 0abeb374c110..af68497c4200 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1434,3 +1434,84 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
 
     return get_page(page, p2m->domain) ? page : NULL;
 }
+
+void p2m_ctx_switch_from(struct vcpu *p)
+{
+    /*
+     * No mechanism is provided to atomically change vsatp and hgatp
+     * together. Hence, to prevent speculative execution causing one
+     * guest’s VS-stage translations to be cached under another guest’s
+     * VMID, world-switch code should zero vsatp, then swap hgatp, then
+     * finally write the new vsatp value.
+     */
+    p->arch.vsatp = csr_read(CSR_VSATP);
+    csr_write(CSR_VSATP, 0);
+
+    /*
+     * No need for VS-stage TLB flush here:
+     *  Changing satp.MODE from Bare to other modes and vice versa also
+     *  takes effect immediately, without the need to execute an
+     *  SFENCE.VMA instruction.
+     * Note that VSATP is just VS-mode’s version of SATP, so the mentioned
+     * above should be true for VSATP.
+     */
+
+    /*
+     * Nothing to do with HGATP as it is constructed each time when
+     * p2m_ctx_switch_to() is called.
+     */
+}
+
+void p2m_ctx_switch_to(struct vcpu *n)
+{
+    struct vcpu_vmid *p_vmid = &n->arch.vmid;
+    uint16_t old_vmid, new_vmid;
+    bool need_flush;
+
+    if ( is_idle_vcpu(n) )
+        return;
+
+    old_vmid = p_vmid->vmid;
+    need_flush = vmid_handle_vmenter(p_vmid);
+    new_vmid = p_vmid->vmid;
+
+#ifdef P2M_DEBUG
+    printk(XENLOG_INFO, "%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
+           n, old_vmid, new_vmid, need_flush);
+#endif
+
+    csr_write(CSR_HGATP, construct_hgatp(p2m_get_hostp2m(current->domain),
+              new_vmid));
+
+    if ( unlikely(need_flush) )
+        local_hfence_gvma_all();
+
+    /*
+     * According to the RISC-V specification, speculation can happen
+     * during an update of hgatp and vsatp:
+     *   No mechanism is provided to atomically change vsatp and hgatp
+     *   together. Hence, to prevent speculative execution causing one
+     *   guest’s VS-stage translations to be cached under another guest’s
+     *   VMID, world-switch code should zero vsatp, then swap hgatp, then
+     *   finally write the new vsatp value. Similarly, if henvcfg.PBMTE
+     *   need be world-switched, it should be switched after zeroing vsatp
+     *   but before writing the new vsatp value, obviating the need to
+     *   execute an HFENCE.VVMA instruction.
+     * So just flush TLBs for VS-Stage and G-stage after both of regs are
+     * touched.
+     */
+    flush_tlb_guest_local();
+
+    /*
+     * The vsatp register is a VSXLEN-bit read/write register that is
+     * VS-mode’s version of supervisor register satp, so the following is
+     * true for VSATP registers:
+     *  Changing satp.MODE from Bare to other modes and vice versa also takes
+     *  effect immediately, without the need to execute an SFENCE.VMA
+     *  instruction. Likewise, changes to satp.ASID take effect immediately.
+     * Considering the mentioned above and that VS-stage TLB flush has been
+     * already done there is no need to flush VS-stage TLB after an update
+     * of VSATP from Bare mode to what is written in `n->arch.vsatp`.
+     */
+    csr_write(CSR_VSATP, n->arch.vsatp);
+}
-- 
2.52.0


