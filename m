Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ6HDpgd9WlqIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 23:39:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B04AFD5A
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 23:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298928.1573864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIvZ8-00086c-WF; Fri, 01 May 2026 21:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298928.1573864; Fri, 01 May 2026 21:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIvZ8-00083c-So; Fri, 01 May 2026 21:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1298928;
 Fri, 01 May 2026 21:38:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wIvZ7-00083W-Gr
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 21:38:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIvZ5-00AT3D-AC
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 23:38:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f51d33-2eae-0a2a0a5409dd-0a2a4502dc1a-16
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 23:38:28 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f51d54-af86-0a2a45020019-d1558035d46c-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 23:38:28 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so18648615e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 14:38:28 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822c3422sm137436495e9.8.2026.05.01.14.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 14:38:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1777671508; x=1778276308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CcrVhPKL924+HX0LUqaF9tbfBrxLJHzpVSLiSNTCUME=;
        b=WeUPjyZg3muJqydiM/zUlYgvCYOGDx8H9Zr0v0SNUp9MnDX6ZpHwdbHS97ZRVmajTp
         9gnugnBr4bJvdW4Um5zCXt0GPtUBsgJfICF0LcxEOQZFMeU1zJL389zGpQ9jwriuyMpR
         /u4rAJXLE+weFViyY8aJDBadgctruA98QuAJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777671508; x=1778276308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcrVhPKL924+HX0LUqaF9tbfBrxLJHzpVSLiSNTCUME=;
        b=aHftFpdk02x0dFGrAWJfNIfdWe8w7JpFX0FX/j8JfXc2fK5zuYZ3WcBgvNrFd0W/Nu
         FS1UVCGKc4xzBQTWlml+t7KPLtkjSxvqas7Mp1NyeNh6cJWQzkGWnmy6+yJpxMQUhrza
         vvk8+8f2vmQ73kzpEhUG6lz2dq6u2nrDXTql8xDrUI+MqgNCA/0CjB/KSDBQhaPA5Gl6
         BCXUuOB4bPaYFPIEEoFuHu3WdVHIKl73XdBTbvJFCy7+nQjV7lMCnXu/O89q/DPN8JGw
         xNTKw4pVC9m9cEHBlAmFl26gVlU54fwxlelFHUsqPk0hHjEWlixp5UtLV+My+2UZzsyK
         YagQ==
X-Gm-Message-State: AOJu0YzkHPB1JcG+4bSryRC40/ztzZmj7iglHMBMrMoSB6aEVedX9BaV
	rHB9j972MHAevAH8JckpCEZXGoycSdfTWqG+wq3UonlfrHPze5urHUyII6DXDHkxck2gPi9N9Bj
	2g4RD/yA=
X-Gm-Gg: AeBDietmFabkXjZbNLT+8o+fpewcR/H3dM+2mEQLPuvhJQZ/F0bpNp+pCgb8iLBnFPu
	yieluak7f0LeDo0hNqeszqi8ICEkQl6wdN5R/vTi3bZPIxYKvgHnVnYSPKvaC/aQbOIXdCjqKE8
	rq5c9HVymol8/AEvW3RNQATi4Ir+xTPjjoWRmj2s79XAWb85G68eV5hwt44mlyKqXDK0+tk6Y0e
	Qd4G/9lre+SOAkvw0hvXCPC5WqociGENBn00/IukohFifNoR77iPwSakYBBxTOnaFZPHm1bgGmk
	U3fVNq22y9Xs3o3Hf7vBZQGwIx2zNu46NyWO8tSUDn8Xe/C/uoxzc9JYi1UegF4Ne3/21CAP/42
	/++5SGW8QIscr/G5hMBFPbSmsqXHen5h292r3NfcgJc6egaQSJPijjX/nL3OlXRiKlqJFmR94l+
	86djlRvdws6MwZpYuiH1UF5AaH3Jlla9plr+UCXP5Ur6pBSl4iz6qYXKnhM6I2nL5pbknO1QnRE
	xcU2HfZY2cV2UQ=
X-Received: by 2002:a05:600c:a118:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-48a9865daacmr7747625e9.13.1777671507797;
        Fri, 01 May 2026 14:38:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/svm: Always sync guest CR2 on VMExit
Date: Fri,  1 May 2026 22:38:26 +0100
Message-Id: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777671508-894CD161-47778207/0/0
X-purgate-type: clean
X-purgate-size: 1761
X-Rspamd-Queue-Id: C87B04AFD5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Under SVM, there are two copies of guest CR2.  One is v->arch.hvm.guest_cr[2]
and one is in the VMCB.

Xen doesn't intercept CR2 accesses, so this mostly goes unnoticed; hardware
loads and saves the guest CR2 across VMRUN/VMExit.

For HAP guests (where #PF is not intercepted, and therefore we don't typically
inject #PF either), this causes the guest CR2 value to be lost on migrate.  As
migration is cooperative and not done from the #PF handler, this also goes
unoticed by guests.

It also means that an emulated MOV-from-CR2 reads a stale value.

Reported-by: Stefano Stabellini <sstabellini@kernel.org>
Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>

It also also works around the QEMU bug that triggered the investigion, where
the CR2 intercepts trigger despite Xen requesting CR2 not to be intercepted.
---
 xen/arch/x86/hvm/svm/svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ced616684732..f49d2ebbfdd5 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2505,6 +2505,7 @@ void asmlinkage svm_vmexit_handler(void)
     hvm_sanitize_regs_fields(
         regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
 
+    v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
     if ( paging_mode_hap(v->domain) )
         v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
 

base-commit: 61f957d48c78df6c5254b6f54d6170d3bd3d717e
-- 
2.39.5


