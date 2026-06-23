Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JvaYAM6MOmrI/gcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:40:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E06B7837
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:40:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="NH//JcAu";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344278.1603380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1MR-000237-Nq; Tue, 23 Jun 2026 13:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344278.1603380; Tue, 23 Jun 2026 13:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1MR-00021S-Kt; Tue, 23 Jun 2026 13:40:19 +0000
Received: by outflank-mailman (input) for mailman id 1344278;
 Tue, 23 Jun 2026 13:37:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ranquet.guillaume@gmail.com>) id 1wc1Jg-0000rU-Hl
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:37:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc1Jf-00BJ51-UQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:37:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ranquet.guillaume@gmail.com>)
 id 6a3a8c13-e002-0a2a0a5209dd-0a2a45089920-8
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:37:27 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <ranquet.guillaume@gmail.com>)
 id 6a3a8c17-9ee7-0a2a45080019-d155dd35cda4-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:37:27 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-462ebd5d37dso5469191f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 06:37:27 -0700 (PDT)
Received: from [192.168.0.191] (lfbn-tou-1-1549-180.w109-220.abo.wanadoo.fr.
 [109.220.140.180]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46667221de7sm34853939f8f.33.2026.06.23.06.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 06:37:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782221847; x=1782826647; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUyTTFBSUX+r+HizyOVTDJk3MbqSrTM8hBaLvD/x8xQ=;
        b=NH//JcAumI+N48H1iwl+g9m/bNL0kXbJyeDWh9l8Ds9Qk7PF99JFoFn2pLiql+nRTV
         SSBITrfeTe1grh2Cpwkpfdi6+Dk+QYsrmS8AALvKw6iJ0f2bq/KrhRWoXg9oGnGein2W
         S4r7++g9Czg26brI5Nau11Arss8h36E5proHTcKvt94Vy/PNkpwN1rtPBoMXFFKPuEyc
         F5rb4B41V1xkAhENvDRUgEYRePwfLTl+lWTxgXlit635WFsVQW4+VeR1P1+VE8UYtkJA
         5zLWPEDwOHedDiPMoaghZKhRF/AZ5dVLaKgX8hR6vUwZtq4euyJ9fAM0yIHxLsuFchrg
         IXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782221847; x=1782826647;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUyTTFBSUX+r+HizyOVTDJk3MbqSrTM8hBaLvD/x8xQ=;
        b=MPY4xV3nlzSd4dezqfbVgXrBxyhAL+D2lsxPvZCsQJhAQ2/X1TuYLK0cZDUFG/N1f0
         P9GjNy7FTgI0uICLB5khRKBZpzfmncJn9BcJoTb8PCtcTCv0urYfFUOb7JLGwwuZ7UEH
         RJMJuJb+cI8kADElA24dlv1DW4QV3yHdZvigQEGfJqWYzVq6LCsvq7RxcaeqmpLJVoa8
         ZDdlLp/Dy/9m+jv3qzFZVyq2eQ24XQLmSlWs8WEix0ABmjYzsJpqA7z7Xd0umVmQ3yI1
         qjzFC7I6QhWrFhzrjqBf2j3H2/xd2EQHesu3FYWF/b8upAgsBgYqmj2VkvE7WZsFH+vJ
         JZIA==
X-Forwarded-Encrypted: i=1; AHgh+Roe0iuAEhn20o2xr+6nAIBv3AjKRQPeIU6pMOWWuajk39gJbYAaKjegOtZdw7UYxag+MnXzH0CYMb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5rnQPj4OsqWoyFl0LN7Cd/FD6lG2j0wqcbq7gLux1efDVAyoP
	LAM4qk2ggt3tb+HpmuvBZhBeYPfhx+ZlhlCDi7mTk0EjnKntUWEKKftj
X-Gm-Gg: AfdE7ckD1uW3Uk6RvEte+jUaefjtowWaik+dRQPF+OCSt3pVOzWuUa8sMoy2MaH7n2q
	vdNim/ON2YcoIA/rxvqUIHi7BQbDpJc7hvNoJUwV+sJZtB3h2Pwx4CkRrDrntf4GqUwLV+GJcM1
	/es3Qkk2EZz3HWLX6efxn5xPsINlLYw7g8/xT2IZskJmC/PUjjUlQOuNCej6YS1Z21JjPNAl3vy
	UqtlE+KaTqi05iW9aHoMzjeMpP6GKOE4X0CkIpNZHK8DwJb+v9n7ymz/oM9iGUGA2zT5xKuRXVk
	HNkyBOOE/UF+GYY4YYpVbpkAwt2c7TEc/+ys4eZ7jMELZHygRHp21tbHCiikbnNalFjbDHNb9Qe
	7DphLy1QhWcEjgtgM1S5jtvToOz7MQ0xxgXO280XDzlHIoQ4rR8B8ZKPQzvRXXSBzDrTk9NGyi6
	h/p0ZXjnZvpyidUYc/weC0iLkg5yQbr6TmnfBdcbJK1mC6LFnRDF9v1WOytrfopaitHez9Uo7iI
	Q==
X-Received: by 2002:a05:6000:2681:b0:460:3210:4347 with SMTP id ffacd0b85a97d-46addd120aemr4249109f8f.40.1782221847046;
        Tue, 23 Jun 2026 06:37:27 -0700 (PDT)
From: Guillaume Ranquet <ranquet.guillaume@gmail.com>
X-Google-Original-From: Guillaume Ranquet <granquet@missingno.tech>
Date: Tue, 23 Jun 2026 15:37:14 +0200
Subject: [PATCH RFC] x86/xen/pvh: Disable KASAN in early pvh boot stages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-xen_kasan-v1-1-d963df2233d7@missingno.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNj3YrUvPjsxOLEPF1TU3PDRGOLNKMk01QloPqCotS0zAqwWdFKQW7
 OSrG1tQBAogg0YAAAAA==
X-Change-ID: 20260623-xen_kasan-5571a38f2b5e
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
 Guillaume Ranquet <granquet@missingno.tech>
X-Mailer: b4 0.14.3
X-purgate-ID: tlsNG-c1860d/1782221847-662270FA-ACF37B9E/0/0
X-purgate-type: clean
X-purgate-size: 3548
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:granquet@missingno.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[missingno.tech:mid,missingno.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[ranquetguillaume@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ranquetguillaume@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 087E06B7837

Running a xen pvh guest under KASAN results in a triple fault as the
KASAN shadow region is not initialized this early in the boot flow.

(XEN) [ 2.018691] d0v0 Triple fault - invoking HVM shutdown action 1
(XEN) [ 2.018693] *** Dumping Dom0 vcpu#0 state: ***
(XEN) [ 2.018695] ----[ Xen-4.20.1-pre x86_64 debug=n Not tainted ]----
(XEN) [ 2.018697] CPU: 0
(XEN) [ 2.018698] RIP: 0008:[<ffffffff842be38b>]
(XEN) [ 2.018698] RFLAGS: 0000000000000006 CONTEXT: hvm guest (d0v0)
(XEN) [ 2.018700] rax: dffffc00072775d7 rbx: 00000000072775d7 rcx: 0000000000000000
(XEN) [ 2.018702] rdx: ffffffff843b56c0 rsi: 00000000336ec578 rdi: ffffffff8368c1ec
(XEN) [ 2.018703] rbp: 00000000393baff0 rsp: 00000000393baeb8 r8: 00000000393bb000
(XEN) [ 2.018704] r9: 00000000393bb00c r10: 0000000000000000 r11: 0000000000000000
(XEN) [ 2.018706] r12: ffffffff843b56c0 r13: 00000000393bb008 r14: 00000000393bb000
(XEN) [ 2.018707] r15: 0000000040000000 cr0: 0000000080000011 cr4: 0000000000000020
(XEN) [ 2.018708] cr3: 00000000393bc000 cr2: 0000000000000000
(XEN) [ 2.018709] fsb: 0000000000000000 gsb: 00000000393b7020 gss: 0000000000000000
(XEN) [ 2.018711] ds: 0010 es: 0010 fs: 0000 gs: 0000 ss: 0010 cs: 0008
(XEN) [ 2.018712] Hardware Dom0 shutdown: rebooting machine
(XEN) [ 2.180946] Resetting with ACPI MEMORY or I/O RESET_REG.

Signed-off-by: Guillaume Ranquet <granquet@missingno.tech>
---
The KASAN shadow region is not initialized this early in the boot stage,
so disable instrumentation of the early boot.

Though I'm wondering if disabling KASAN for `arch/x86/kernel/cpu/common.c` is the right move.
There's a single call to `get_cpu_vendor()` from `arch/x86/xen/enlighten.c`.

I haven't looked if there's a solution to avoid disabling KASAN for
everyone in `common.c`.

Opinions welcome?

Also note that I haven't tested HVM/PV or PVHVM.
---
 arch/x86/kernel/cpu/Makefile | 2 ++
 arch/x86/xen/Makefile        | 4 ++++
 drivers/xen/Makefile         | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index d2e8a849f180..8d1d45c231bc 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -17,6 +17,8 @@ KMSAN_SANITIZE_common.o := n
 # As above, instrumenting secondary CPU boot code causes boot hangs.
 KCSAN_SANITIZE_common.o := n
 
+KASAN_SANITIZE_common.o := n
+
 obj-y			:= cacheinfo.o scattered.o
 obj-y			+= topology_common.o topology_ext.o topology_amd.o
 obj-y			+= cpuid_parser.o
diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index 717264ae269b..940284eb9835 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -7,6 +7,10 @@ CFLAGS_REMOVE_time.o = -pg
 CFLAGS_REMOVE_irq.o = -pg
 endif
 
+KASAN_SANITIZE_enlighten_pvh.o := n
+KASAN_SANITIZE_enlighten.o := n
+KASAN_SANITIZE_efi.o := n
+
 # Make sure early boot has no stackprotector
 CFLAGS_enlighten_pv.o		:= -fno-stack-protector
 CFLAGS_mmu_pv.o			:= -fno-stack-protector
diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
index c0503f1c7d5b..d71742c382dd 100644
--- a/drivers/xen/Makefile
+++ b/drivers/xen/Makefile
@@ -5,6 +5,8 @@ obj-y	+= mem-reservation.o
 obj-y	+= events/
 obj-y	+= xenbus/
 
+KASAN_SANITIZE_efi.o := n
+
 CFLAGS_features.o			:= -fno-stack-protector
 
 dom0-$(CONFIG_ARM64) += arm-device.o

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260623-xen_kasan-5571a38f2b5e

Best regards,
-- 
Guillaume Ranquet <granquet@missingno.tech>


