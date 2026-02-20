Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLCGJZ2JmGlwJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015216944C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237341.1539768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE5-0002Z6-5i; Fri, 20 Feb 2026 16:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237341.1539768; Fri, 20 Feb 2026 16:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE4-0002QD-Pf; Fri, 20 Feb 2026 16:19:32 +0000
Received: by outflank-mailman (input) for mailman id 1237341;
 Fri, 20 Feb 2026 16:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTE2-0000Q4-SE
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:30 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee5bc87b-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:29 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4362c635319so2097773f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:29 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:27 -0800 (PST)
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
X-Inumbo-ID: ee5bc87b-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604368; x=1772209168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6aGuGPcNuPDYPCV7GwkHM9t8Lc+qUdl4ib7PfisxG8=;
        b=UtCZMvNsUewN3dl7b484fGEpmCpA5wx7N4zu4EhoBBFEK+CUQGuW4oYuAin2jb3Yhh
         s11yDClK1e1mCwSFc78C4XBcrKRjZw3SNPkt9uDhFP1D+xjnIl339svmw6KScnlN06sT
         aUpxuGZehKXQU36t9SELH2py8QXeoEpAmlYm5As4Y1PAcUfd23jkg/fnflNWsJqX/0Zi
         Oxxd4RdBllPkWpW/NUsDAhFez3g/p3K3p/zmTgnht5PzRJ9rmA6G5eTVtOWw9aIArPiJ
         R/VnLPq7eTdyVldEB+5tj4dfn4YmFVE+L8/FPZpmirgKSDgvKE948njRHiKt7peyD4ky
         F59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604368; x=1772209168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6aGuGPcNuPDYPCV7GwkHM9t8Lc+qUdl4ib7PfisxG8=;
        b=HEvvL+ScUAm2asxJuuZc+8vEmiprZpXF0j9PPEVhtsT4PQafjhZdffCfJ/dHK9AYxc
         tFw/rhS6KarIwbkLpepguUtq7Qh3c1/Bncz1/pkfLOB04n/29W9A7nPIqjP07BH6wYNh
         eRSCHQ3nM+dzGFa9JWhAln2WwlIFHHMb9Yg+5y8w8KK+6kEyRK0nvKZ9JhOCwJJVI+LJ
         2u+2640xlgmqyjDDggEhlhNr7Am2LvJo1cypIwGYnac87mj/5OY1B4J0UozxON3gyu7B
         ylC3MdU3Rz+NPQO3Pkd55C1lODeFZ0czvqxziLSZ+PZ6LP4cuVFQXDdfnfNEzbpGMK73
         lUng==
X-Gm-Message-State: AOJu0YwI18DZ8F2bkwshYkqRXAK8UfGEdTY9fzjLi3GTXXcP7izWepZ2
	YTm9C7nA6xTQOeHymEqLshjs3fgycJpgi1TTTAPrOD+GE+Gc92kLcyxuhmnlbw==
X-Gm-Gg: AZuq6aJ7yAh0kcl2lmAyy5zsMGicxQeLs0NU11MhyoNTmZffxvdC9fc9DhpJbYMOg7k
	pJ4JVQOJmQMlmdsN77nPOzsaWruY02mufnv2cFOikVuNb0rGBbeG7UY6ijvgw6kPfl2dbrpCWhB
	6xMpTl8y3sm4GN5pRyVHxJXc2oTrWHkYad4K+kVdTJRP9IwH0l5vnJVnXyMVArfXjuvtrQyzmYp
	WAXKjT/XzHvBnm1BtpUQ73rJILUclotcI8nheti20/RSRfa9w07b8Al0S5KnNdpGMhiLcQhH/PR
	GyVa7CNTtxEX9qUUrbtB5iYymp8SF6wyok0R0uGK7QjkGYHv39uiM9HPbDGyMXaoeAEaqbxoO7u
	xtRaYYxkpKiJU25o6vqybjcg15ZPx4nQQpulDEXDwCY/Rsu/RrKR29Q4O1zOvEWdZJZ9Soxcx6n
	1xGOobJ/Dwq30lxlmonJ3idtsQZDTyTzoNbTTxsniUdy9mD+98prv4hz5paeIm73Owuw==
X-Received: by 2002:a5d:64e5:0:b0:437:6806:994f with SMTP id ffacd0b85a97d-4396f14cb6fmr908975f8f.12.1771604367888;
        Fri, 20 Feb 2026 08:19:27 -0800 (PST)
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
Subject: [PATCH v5 09/14] xen/riscv: implement SBI legacy SET_TIMER support for guests
Date: Fri, 20 Feb 2026 17:19:04 +0100
Message-ID: <ce624ecca7d725c1abb195177b48e8197322cfac.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 9015216944C
X-Rspamd-Action: no action

Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
extension ecall handler. The handler now programs the vCPU’s virtual
timer via vtimer_set_timer() and returns SBI_SUCCESS.

This enables guests using the legacy SBI timer interface to schedule
timer events correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3 - v5:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/vsbi/legacy-extension.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
index 2e8df191c295..090c23440cea 100644
--- a/xen/arch/riscv/vsbi/legacy-extension.c
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -7,6 +7,7 @@
 
 #include <asm/processor.h>
 #include <asm/vsbi.h>
+#include <asm/vtimer.h>
 
 static void vsbi_print_char(char c)
 {
@@ -44,6 +45,11 @@ static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
         ret = SBI_ERR_NOT_SUPPORTED;
         break;
 
+    case SBI_EXT_0_1_SET_TIMER:
+        vtimer_set_timer(&current->arch.vtimer, regs->a0);
+        regs->a0 = SBI_SUCCESS;
+        break;
+
     default:
         /*
          * TODO: domain_crash() is acceptable here while things are still under
-- 
2.53.0


