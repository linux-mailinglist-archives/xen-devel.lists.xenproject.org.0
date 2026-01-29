Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPxsMZVxe2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:41:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FAB1121
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216664.1526603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTCj-0001DE-TQ; Thu, 29 Jan 2026 14:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216664.1526603; Thu, 29 Jan 2026 14:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTCj-0001A4-PD; Thu, 29 Jan 2026 14:41:05 +0000
Received: by outflank-mailman (input) for mailman id 1216664;
 Thu, 29 Jan 2026 14:41:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1BJ=AC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vlTCh-00019y-RN
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:41:03 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 884cf30d-fd20-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:41:01 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so8064525e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 06:41:01 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce564f9sm142288155e9.14.2026.01.29.06.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 06:41:00 -0800 (PST)
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
X-Inumbo-ID: 884cf30d-fd20-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769697661; x=1770302461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9It+LgUBP+HQMboZ37j1eEcPa8t6CGcqjlQAntYPfIo=;
        b=fdF7mkXd0S4UhaGoSeraMprWpYxmgb82OLqBdcDeV506EdqhXWQhzwc1PEYiqAFv9j
         yZrhq6eZmo5ustZAyqwxiBEDqJc/xGipNwJbhSu1JJuowkTBJVbwKvzKdh2x8de1taSq
         WY8vmMHpHXsGzC37dCNKxR5wWQZrwQkQBto+Hd06RP8hFxH2ZH5iDbI95UjEUW87/pp6
         0YcI/ql8HZZp3qcWF1Gk2E942T7iD63IMrEPGdu7NG9dEM9bThnNswN2MNBqyQu9fKKj
         kVsxy63qBbVxbZnxAGQ6hDMdG4brvoIXNur+nwlCn0eYLUp9vh87Z5HCrn/AUlDsESYE
         P4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769697661; x=1770302461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9It+LgUBP+HQMboZ37j1eEcPa8t6CGcqjlQAntYPfIo=;
        b=GY1Hb5UNOZq72DYB3W5oG6+yY4btpHVxAgaURzlvfEhB2q/Fo/VUsoZZGpqt8d3qmf
         Fw5IyzJi2DNO0Yn9F/YcvLpSSAcg3VpQykGUFqgzf4ogsJiuCqqiA7h9NuQXTIjB64Vo
         nhzuVDiZqSV0tVoVoQbPemBUTzUpjNCeEPTqWma7sNZf0taNCQcN3aAlcYWqlbVS8dfv
         cy1wMgrFT33tb20OLsZ80EjMjN9z3kJe7gxnrH5XRmVe+rZQ/iAnlsgZxjbNYHdQ0Lso
         sOV/IoOkFgt46W6h3UVOhH46NgnB1CzXOyohpWsj4Nqyk3t57HRpMIoE03eJTXundsVP
         mgkw==
X-Gm-Message-State: AOJu0YyrnDlRMGsGKi4tsjpIgz6DQw4xoEgsEE+IXHNdwJnB1mITMACG
	S4I3jhK2LswmPfXfK7IFYYx/5IZNHTmujkYLF5nLsYoVGldlnjODGjADuGEDcA==
X-Gm-Gg: AZuq6aKAAmZBUOUPh/6odu6rl7kTd/12usV+G99hVkarlryanO2ejEWGbTOKGw1vYfv
	FbrNNtou5t5CFe+5zwfWstDL20/UFYmVDtUNSTolKxKjSvT+Ky+yYPKMwk2Xsltu0Gz8qsTKhYm
	cyTH1+f0ULbJjMdtuBGVLeQOWbcX5vX4cZYks0/fcHVEJQrDpXEDCkIX5yZ44kmcRvALLd+17jh
	N1341ARyrEWGbOT6dyKxmDOCYTV7v7l5bypCGmH0UJ9K5oF/ALO54j3h8wQ7ulRizEFAT2hIG+1
	feRIQpwyC6K0ooZUGYxvvol84KuqogiTecxI0vh4HpddZcj610VCFBXnXbd7vYYrvX1wcp+rUkR
	eX/z+92df/CQorwdC5OnKGalJ2GgCzc5z18M25PQ8Gm3gyHnNvv0f2rwOu16iYV7PFkwfnjlnEv
	TPkISInRFMfeHawHeir290IM8A+v+6JW8bFEsRzGjTG0yyuiTz7fm0+Q==
X-Received: by 2002:a05:600c:3b96:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-48069c37e2dmr126208425e9.9.1769697660684;
        Thu, 29 Jan 2026 06:41:00 -0800 (PST)
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
Subject: [PATCH v1] xen/riscv: route unhandled interrupts to do_unexpected_trap()
Date: Thu, 29 Jan 2026 15:40:52 +0100
Message-ID: <f6d0cc1a6d960acf96d0f43813bfe6a62ca9a041.1769697450.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7A9FAB1121
X-Rspamd-Action: no action

Currently, an interrupt cause which is not explicitly handled is silently
ignored, and execution resumes without reporting the fault. This is
incorrect and do_unexpected_trap() should be called in the case of
unhandled interrupt.

Fixes: a8b85fabf6090 ("xen/riscv: add external interrupt handling for hypervisor mode")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/traps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 84b5ab4142f6..34920f4e5693 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -196,6 +196,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         {
             /* Handle interrupt */
             unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
+            bool intr_handled = true;
 
             switch ( icause )
             {
@@ -204,10 +205,12 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 break;
 
             default:
+                intr_handled = false;
                 break;
             }
 
-            break;
+            if ( intr_handled )
+                break;
         }
 
         do_unexpected_trap(cpu_regs);
-- 
2.52.0


