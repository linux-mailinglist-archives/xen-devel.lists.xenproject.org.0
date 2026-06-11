Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R6JQFEvVKmodxwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01929673196
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TjgqiEk1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335796.1597981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhPB-00061m-E2; Thu, 11 Jun 2026 15:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335796.1597981; Thu, 11 Jun 2026 15:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhPB-0005zU-9j; Thu, 11 Jun 2026 15:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1335796;
 Thu, 11 Jun 2026 15:33:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXhP9-0005ZV-7h
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:33:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhP8-0033fE-KS
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:33:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad52d-e002-0a2a0a5209dd-0a2a4507bebe-30
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:14 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad53a-229c-0a2a45070019-d155dd2aa95c-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:14 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so714997f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:33:14 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm80679900f8f.0.2026.06.11.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 08:33:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781191994; x=1781796794; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXGTQ7SY9zFCk1adwq1nZVphVofHiD/jgErtshVT0HE=;
        b=TjgqiEk1GcvWpRhq7wNZUMseW9OONgV1uCWQl9w+v0yXE67TspBN2sB85rB+GyZqnT
         hRCNpvuJItwFz2hx52j2dSpSHv3Wt2B/F26rbrW2FKKNzD77tmkPMm3PlmH5qEEZkVr3
         rwBIYAn5oZPLBAy8yUJtl5vWVkkfuSFzs8PVs+bvXVxtsG1/rOWWRo8Nsz372hTDhjA9
         Phk828kRdCbWUnf5XS4VgN3+F6zscu83pfaOiOXzzH/6u0fKsOSLiamVKz8LhauOV8tW
         rpLdJvDmdjWf4HePx3dP7LY1Z2tt8lzWT4OIyFo60vUDqFWlevQo8tMrzeAPdkdbWiYs
         uJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191994; x=1781796794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXGTQ7SY9zFCk1adwq1nZVphVofHiD/jgErtshVT0HE=;
        b=FuxVkiyh+s38bH/3PJD4tmnV7hJkjz1UPYjTxJPyiVDKvb/LZ6Wtbh8Ar6fRpxvGN9
         R1Or/LMP3TOGEUtvbPrVhec3wS/7rifvWICP01rb+ePhO/tcKTLB2oBAFSQWNCfPMTl8
         v74MTVNiIphjA2Y0YB4DwAvH66eKfrFHfDGHdaccO3okusUHuG/xIyrIqfH4X698FWdK
         IxACL1JDKRiq4rFLWanqL60RRkGyRtttOfdlU/XQZO36oIQIinAXNYf5mraISBts6glT
         djK9EkpbhMlgeoztCk1vgs2kr0IJlpR/LnSQlBP0F74NY0555BMw5IEMlWpVaSwr5iwo
         OSlg==
X-Gm-Message-State: AOJu0Yw41H9ihGa2EUB3MlirtOXbYNet+U178i/VcPsmSX9XS2dc9ctg
	Oly3j7IJ9ehuFjjWgsZQPpH7Vwx8cegf8dtGY0O9hjDWW0IWGuK6jQjgGSrBajbqmqc=
X-Gm-Gg: Acq92OEqfX5GrBcRq2X1KLpUD3M57gXkeTOrEDYBw/QRWTjP2N82+HlGoPmYFAnOMRR
	/ExcgAyJNajW3u8gW3ZZwIN3zX3sibMI9p7le2Qvn3Ibbg8uJNWwUxT3nNTPEOC68Ptjz+DxIgW
	dsr1QvXpiwV1DDS6v/ICqGOj2WBeqNk+/daqwK4cqyYfoKi1i8qObWMTIPHs75w4uLRh/2+B3X5
	UQ2NaNiLhjBeD8nr87/1pG4ePmN06SME5BUGlbS8tXV3FdsyScWmHj/JbcGUiyZ2eXifA0AqV0g
	t0f9sZRnzp0Wpo19AIA1GA8Y7WsQZHh2/YPPazTP3sxE8KGNjXnsDGPsLsBjri2iJ0SNjMrWSH2
	MtzN2DV6NDv4GXXJl8+B3/ZPnJcRl3/DmgSuTKv11dmseqqF4/NRpfcxcMf5cBB4VroYY8udM+u
	zofLUq28VqdETzKm3qyOJP69PkYy73cLkzZjAZ7n+n4M72dOuM5VgxIiaYJMU82Y8dUGIA49xgi
	tJ/yytfSqvGcntsvwiLZkp+9VrZXiq1vuFL
X-Received: by 2002:a05:6000:2085:b0:460:1c93:6eb6 with SMTP id ffacd0b85a97d-46067c21fa4mr4285861f8f.20.1781191993913;
        Thu, 11 Jun 2026 08:33:13 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v2 2/4] x86/efi: discard multiboot support for PE binary
Date: Thu, 11 Jun 2026 16:32:55 +0100
Message-ID: <20260611153257.650054-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611153257.650054-1-frediano.ziglio@cloud.com>
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781191994-22772C48-B9878073/0/0
X-purgate-type: clean
X-purgate-size: 3003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,cloud.com:mid];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01929673196

From: Roger Pau Monné <roger.pau@citrix.com>

The multiboot headers (.text.header section) are not consumed in the PE
binary, hence discard them in the linker script when doing a PE build.

The multiboot and PVH entry points are not used in the PE binary, hence
discard them in the linker script when doing a PE build.

That removes some relocations that otherwise appear due to the usage of the
start and __efi64_mb2_start symbols in the multiboot2 header.

Section discarding is not done updating DISCARD_SECTIONS definition as the
change is specific for x86.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v1:
- improve commit message;
- change section orders to avoid changing code order in final executable;
- merge 2 commits;
- removed deprecated documentation section.
---
 docs/hypervisor-guide/x86/how-xen-boots.rst | 6 ------
 xen/arch/x86/boot/head.S                    | 3 ++-
 xen/arch/x86/xen.lds.S                      | 5 +++++
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index 8b3229005c..b6d852050a 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -82,12 +82,6 @@ When a PEI-capable toolchain is found, the objects are linked together and a
 PE32+ binary is created.  It can be run directly from the EFI shell, and has
 ``efi_start`` as its entry symbol.
 
-.. note::
-
-   xen.efi does contain all MB1/MB2/PVH tags included in the rest of the
-   build.  However, entry via anything other than the EFI64 protocol is
-   unsupported, and won't work.
-
 
 Boot
 ----
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 77bb7a9e21..90faf411b9 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -152,7 +152,7 @@ vga_text_buffer:
 efi_platform:
         .byte   0
 
-        .section .init.text, "ax", @progbits
+        .section .init.multiboot, "ax", @progbits
 
 early_error: /* Here to improve the disassembly. */
 
@@ -710,6 +710,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        .section .init.text, "ax", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index f758940674..749d9719cc 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -57,6 +57,10 @@ SECTIONS
   __image_base__ = .;
 #else
   . = __image_base__;
+  /DISCARD/ : {
+    *(.text.header)
+    *(.init.multiboot)
+  }
 #endif
 
 #if 0
@@ -195,6 +199,7 @@ SECTIONS
   DECL_SECTION(.init.text) {
 #endif
        _sinittext = .;
+       *(.init.multiboot)
        *(.init.text)
        *(.text.startup)
        _einittext = .;
-- 
2.43.0


