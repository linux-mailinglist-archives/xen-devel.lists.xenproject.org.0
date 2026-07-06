Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id riZsKdHQS2o4awEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:59:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7B712F16
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:59:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=E8cmFWT9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355572.1610481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliq-0006VV-7f; Mon, 06 Jul 2026 15:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355572.1610481; Mon, 06 Jul 2026 15:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglio-0006Ee-UF; Mon, 06 Jul 2026 15:59:02 +0000
Received: by outflank-mailman (input) for mailman id 1355572;
 Mon, 06 Jul 2026 15:58:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wglif-0004OB-Ov
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglif-009yrN-5A
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd074-e002-0a2a0a5209dd-0a2a450cca90-44
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:53 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0bc-f399-0a2a450c0019-d155802cada0-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:53 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493ce08a75bso13625345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:53 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:52 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783353532; x=1783958332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxRXEnbnwcKwLoBQXvU2u8JCcaQ998O7uU3S4PznH3Q=;
        b=E8cmFWT97x4lrt1ZPiQ+amgj+VkUa+G++KeSAiYqHDuaWMkdWiCFzqNE8UgjWG+f4O
         iJC/qLVdxJk5KvP4gE4HoyO0L3gUn+UOv/l7decVRabxp65FHZvLe/uVVvwt4X/EBAy8
         B4SiHpGg2J+564XRMtZVflCXKq/FYlN1Yvsbi86udHNd7ZQ6lTYxzEX9B41MG5HL12fL
         Bs0kum6nu2OEYHvjZ3wC8OrFcC0DCfGlfbOB/IbHWzsjkHyArXaT3hQGDIClKfL9JJfy
         U2ExOzlBltSNeUfcy7IPJzmn6hi7JLsDuN0LdPsNBtxrgkw0ruiFrPx4mKoVdPSRe8XD
         CIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353532; x=1783958332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IxRXEnbnwcKwLoBQXvU2u8JCcaQ998O7uU3S4PznH3Q=;
        b=LR4ph/7195WOJfg/c5bGDWrg1FD0U/VkittpKrhARa0M6QC1KEdDOT4ioBew+dg6MG
         h4lKztJu8hPzYrCamvYxiC3tIJNs0fBgm909spl4pz/aX/XdTOORmyXusHiLQqVurF+A
         WqrWcI/3IUd2EJgHRztM/yB7ifmC9VT07gXDgadplCGpMJfRDPIUasqAt2ATzFtcE5zy
         Per+V1/xkvnYeWRQp/5xHBmmme9Ip7oajCzbBgt+LNbpUo4+/xXvchyNDoCy4liLo0RM
         dqW8qcJ17K6HQpOkctAl0SxDrGULbkvK3pNsrWELuDeHlwZLt0x+yhaW1ViSuCTwvVL3
         /Lsw==
X-Gm-Message-State: AOJu0Yyj+b3xxGqAZNUmk/3p6u/kIjpG6YsIbthYrDxPL7fxhoXKWEBq
	bdBoF/FE9s/Grm2rn36ZH2veHlmGad601K4pD3O+YOlnW6qc1DxYqRR3AnBM2A==
X-Gm-Gg: AfdE7ckZAK8R1BCDds72LcuB5GIwW7XZX7ZxX1MTJVHRm5SKrIFUwY75TYresYfRRA4
	ezZf08dGi7N+/WnVN0cO3LcjvBg8f3SUU74DA2JnHhwrCR3IO9NtQl51lhcw8PjKpwwd+Wsfpxq
	rJuGrzx+CFkEvZV6X9mxqdk8s3A24BL4Hp8Ub6/id0IHsvVTHV3NPn9d/YrpoAyLVAhwZLnc4kV
	ULAgpDm3yzlUZSYaGjj4/4cJQ+fvTfn7bo7HbDEVasc8w8j5oUL3BAWYg4oxn3ZW6Iu2iprKei6
	E3uAwuRxZdtb2zkBPI73iAW25LORrYd5kjp1X8Owe1HlaTVKzsROkfoPmWThutHH+0w2VqrZhIa
	Ds6X9k/VcVtMaxDfJT8pGh0VJiALSyUYcOCzbjzyHg88HypPSc39jcPGsEsf8y6a7eIMePSBZWG
	Y6oWQaY2Yb9qebmI2EiIRFytbqTQpDkSG4GRfxB0bpOmOlr3nj55+dzzm/4w==
X-Received: by 2002:a7b:cc81:0:b0:493:cc01:807b with SMTP id 5b1f17b1804b1-493df0a0861mr10510525e9.38.1783353532508;
        Mon, 06 Jul 2026 08:58:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v5 26/26] xen/riscv: do a 4th linking pass if necessary
Date: Mon,  6 Jul 2026 17:58:07 +0200
Message-ID: <ba3b7e3197ae90c9f0e5190ba34de174b86090ac.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783353533-93934D51-2DB467E5/10/73395122804
X-purgate-type: spam
X-purgate-size: 5835
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DA7B712F16

Embedding the symbol table can shift sections and flip relaxation
decisions, changing code size and thus the set of emitted symbols
(e.g. gap end markers).  Re-link with a regenerated table when its
size differs from the previous pass.

This mirrors commit 35de7285d508 ("Arm: do a 4th linking pass if
necessary"), which riscv didn't receive when the underlying
pass-2-vs-pass-3 check was extended to it in commit aa786d6e3467
("non-x86/symbols: check table sizes don't change between linking
passes 2 and 3").

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
I faced this issue again in downstream:
  https://gitlab.com/xen-project/people/olkur/xen/-/jobs/15171254706

It was found that the difference between .xen-syms.0 and .xen-syms.1 is in
alignment(?) gap between turn_on_mmu() and the end of simple_strtoull.
Specifically 0xffffffffc00c05b0 is present in pass 1 but not present in
pass 2 (where end of simple_strtoull() is just equal to ffffffffc00c05c0)
because code was shifted:

```
.xen-syms.0:     file format elf64-littleriscv

...

ffffffffc00c0534:       f2e794e3                bne     a5,a4,ffffffffc00c045c <simple_strtoull+0x18>
ffffffffc00c0538:       00280813                addi    a6,a6,2
ffffffffc00c053c:       f21ff06f                j       ffffffffc00c045c <simple_strtoull+0x18>
ffffffffc00c0540:       00068813                mv      a6,a3
ffffffffc00c0544:       00800613                li      a2,8
ffffffffc00c0548:       f15ff06f                j       ffffffffc00c045c <simple_strtoull+0x18>
ffffffffc00c054c:       00277713                andi    a4,a4,2
ffffffffc00c0550:       04070463                beqz    a4,ffffffffc00c0598 <simple_strtoull+0x154>
ffffffffc00c0554:       fe06869b                addiw   a3,a3,-32
ffffffffc00c0558:       0ff6f693                zext.b  a3,a3
ffffffffc00c055c:       fc96879b                addiw   a5,a3,-55
ffffffffc00c0560:       04c7f263                bgeu    a5,a2,ffffffffc00c05a4 <simple_strtoull+0x160>
ffffffffc00c0564:       02a60533                mul     a0,a2,a0
ffffffffc00c0568:       00f50533                add     a0,a0,a5
ffffffffc00c056c:       00180813                addi    a6,a6,1
ffffffffc00c0570:       00084683                lbu     a3,0(a6)
ffffffffc00c0574:       0006879b                sext.w  a5,a3
ffffffffc00c0578:       00d30733                add     a4,t1,a3
ffffffffc00c057c:       00074703                lbu     a4,0(a4)
ffffffffc00c0580:       04477893                andi    a7,a4,68
ffffffffc00c0584:       02088063                beqz    a7,ffffffffc00c05a4 <simple_strtoull+0x160>
ffffffffc00c0588:       00477893                andi    a7,a4,4
ffffffffc00c058c:       fc0880e3                beqz    a7,ffffffffc00c054c <simple_strtoull+0x108>
ffffffffc00c0590:       fd07879b                addiw   a5,a5,-48
ffffffffc00c0594:       fcdff06f                j       ffffffffc00c0560 <simple_strtoull+0x11c>
ffffffffc00c0598:       fc97879b                addiw   a5,a5,-55
ffffffffc00c059c:       fc5ff06f                j       ffffffffc00c0560 <simple_strtoull+0x11c>
ffffffffc00c05a0:       00000513                li      a0,0
ffffffffc00c05a4:       00058463                beqz    a1,ffffffffc00c05ac <simple_strtoull+0x168>
ffffffffc00c05a8:       0105b023                sd      a6,0(a1)
ffffffffc00c05ac:       00008067                ret
        ...

ffffffffc00c05c0 <turn_on_mmu>:
ffffffffc00c05c0:       12000073                sfence.vma
ffffffffc00c05c4:       00800293                li      t0,8
ffffffffc00c05c8:       03c29293                slli    t0,t0,0x3c
ffffffffc00c05cc:       000fc317                auipc   t1,0xfc
ffffffffc00c05d0:       a3430313                addi    t1,t1,-1484 # ffffffffc01bc000 <stage1_pgtbl_root>
ffffffffc00c05d4:       00c35313                srli    t1,t1,0xc
ffffffffc00c05d8:       00536333                or      t1,t1,t0
ffffffffc00c05dc:       18031073                csrw    satp,t1
ffffffffc00c05e0:       00050067                jr      a0

ffffffffc00c05e4 <_ident_end>:
ffffffffc00c05e4:       0000                    .insn   2, 0x0000
        ...
```

So the tool (symbols.c) emits an entry at start+size only when a gap
follows; the gap closed in pass 2.  (look at the code of want_symbol_end()
in symbols.c) what leads to difference in one entry in symbols table between
passes.
---
 xen/arch/riscv/Makefile | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index fc6b34661111..046f73f4d87c 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -50,9 +50,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
+	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
+	then \
+		set -e; \
+		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+		    $(dot-target).2.o -o $(dot-target).2; \
+		$(NM) -pa --format=sysv $(dot-target).2 \
+			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+			> $(dot-target).3.S; \
+		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
+		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
+	else \
+		ln -sf $(dot-target).2.o $(dot-target).3.o; \
+	fi
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).2.o -o $@
+	    $(dot-target).3.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-- 
2.54.0


