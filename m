Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OTV/BfElommM0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF01BEEF4
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243139.1543144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74h-00011c-KA; Fri, 27 Feb 2026 23:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243139.1543144; Fri, 27 Feb 2026 23:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74h-0000yy-Fg; Fri, 27 Feb 2026 23:16:47 +0000
Received: by outflank-mailman (input) for mailman id 1243139;
 Fri, 27 Feb 2026 23:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74g-0008WD-0E
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:46 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62230be6-1432-11f1-b164-2bf370ae4941;
 Sat, 28 Feb 2026 00:16:45 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso1836355f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:45 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:43 -0800 (PST)
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
X-Inumbo-ID: 62230be6-1432-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234205; x=1772839005; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TX7N+xBo3CKWjKGYcEu3yVytP4MNoG1haUKZc0lx4fI=;
        b=j04eYEweWDmZHEcA/r2rrbSeC2I3fwjS6PA6ycF2hylZhU1yY6/YT6xczlGJC5b2FB
         e+RNfvrQ+WX8JrpF7xS/Gvmriel20JQjAtkF+zWqR6tBz3pZGec/nmmK+cyeY3dwlu84
         yKHqg/mllapkc0BsRO/7B3sWKxR7BmrH23qj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234205; x=1772839005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TX7N+xBo3CKWjKGYcEu3yVytP4MNoG1haUKZc0lx4fI=;
        b=mpLnU3o9SP2p57dwKSibpFkbN/N7sfG6uG1TylbLQNF5EMbsi9Gwpe51rYojOrjRrs
         t87EzUM8/2/fFaUtd7n2N29ZKt3Mc59J739TR2zT1kfjbmbZNHXA8bjYDlfuIQ5w9i72
         TlSzFrkWGmhGuxvBWDmtMexqqvBCuOtkQYKw7iSRwIp1sYLgRr8QznJ+cQbFMPg5DuW2
         Ts1QeyslYJOgZk4FxBRSCMNw9ps4ErMMn8dCZ6FVYBmqJP656MvYLUWMecF+5k7hSBfq
         dLMWPcjw7lpJ+v+cc+MENU1UzV9ZP0/RDjYJ2zEbakt3W3PolfoSJatCuVquz6KeAUJM
         rRYA==
X-Gm-Message-State: AOJu0YwCMOgIkoqFepmQNOEtJO1Au+D+YdtJHA7vcpKkCkPxNtl44FQK
	Qgu/nzwhSKjfbiLJW412eBZaPTrWzcni+NB0pDoQhS/+K0i1k6lMSWcEyxLEYzMkUGeXz9wm7rM
	UCSUSD+2pUg==
X-Gm-Gg: ATEYQzwt0uZ+xr3rLVe8irA//00e6Tq6juKNP1r/uFaxI0329402343fKBjKDjgKkvT
	Q+HhNLRtPoXPV8tw9+fes6vGPshQYkwenE5hEe3s0LkZXPnUIQr0KcUDKFW9prWSSEkMz7UcXJj
	ppDF1iD2zMLZGagF/PqwoiHeBwNKugbGGhOIyNnZax6paV9RgDBOhW8KH16M6MKtoVJ4mtmyOFN
	JORI9JScVG5lzqZyedMevH7JD4Kp6o62D9Jz3Ul0SbMZ8IgOe7RWBrr8E8nLdSAdWiTlfvpRKew
	3zZInYtKtL7tJzkA+NndJzj+TM5jdx30g8YFP/EioJhzAqj3tRqZT/nwsxmV1uY/EBN8kqLE2QF
	whoDW9vlBEqcCkDfn01p11yw7S8//YjSSyTvGnBQSbKUJEL+9HE3YAOKiT4QLK/yEfodfuw6Kaj
	TKF6b0j5TQzkcs7PHP4qvnkEu3LOZxhXFeAYvJ1DMSLw4MX/ZKGHpDgk0tAqddMrPUMacpJAE=
X-Received: by 2002:a05:6000:310a:b0:437:6f0c:2ed with SMTP id ffacd0b85a97d-4399de2b59dmr8038457f8f.34.1772234204503;
        Fri, 27 Feb 2026 15:16:44 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 03/14] x86/boot: Move gdt_l1e caching out of traps_init()
Date: Fri, 27 Feb 2026 23:16:25 +0000
Message-Id: <20260227231636.3955109-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7DAF01BEEF4
X-Rspamd-Action: no action

Commit 564d261687c0 ("x86/ctxt-switch: Document and improve GDT handling") put
the initialisation of {,compat_}gdt_l1e into traps_init() but this wasn't a
great choice.  Instead, put it in smp_prepare_cpus() which performs the BSP
preparation of variables normally set up by cpu_smpboot_alloc() for APs.

This removes an implicit dependency that prevents traps_init() moving earlier
than move_xen() in the boot sequence.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * New

I'm on the fence about the ASSERT(), but I'm getting rather tired of unstated
dependencies.  For a PV64 guest using SYSEXIT to enter the guest, it's the
first interrupt/exception which references the GDT, which could be after the
guest is running.
---
 xen/arch/x86/domain.c      |  2 ++
 xen/arch/x86/smpboot.c     | 11 +++++++++++
 xen/arch/x86/traps-setup.c |  7 -------
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8eb1509782ef..e658c2d647b7 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2029,6 +2029,8 @@ static always_inline bool need_full_gdt(const struct domain *d)
 
 static void update_xen_slot_in_full_gdt(const struct vcpu *v, unsigned int cpu)
 {
+    ASSERT(per_cpu(gdt_l1e, cpu).l1); /* Confirm these have been cached. */
+
     l1e_write(pv_gdt_ptes(v) + FIRST_RESERVED_GDT_PAGE,
               !is_pv_32bit_vcpu(v) ? per_cpu(gdt_l1e, cpu)
                                    : per_cpu(compat_gdt_l1e, cpu));
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 961bdf53331c..491cbbba33ae 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1167,6 +1167,17 @@ void __init smp_prepare_cpus(void)
     initialize_cpu_data(0); /* Final full version of the data */
     print_cpu_info(0);
 
+    /*
+     * Cache {,compat_}gdt_l1e for the BSP now that physically relocation is
+     * done.  It must be after physical relocation of Xen, and before the
+     * first context_switch().
+     */
+    this_cpu(gdt_l1e) =
+        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
+    if ( IS_ENABLED(CONFIG_PV32) )
+        this_cpu(compat_gdt_l1e) =
+            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
+
     boot_cpu_physical_apicid = get_apic_id();
     x86_cpu_to_apicid[0] = boot_cpu_physical_apicid;
 
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index d77be8f83921..c5fc71c75bca 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -341,13 +341,6 @@ void __init traps_init(void)
 
     init_ler();
 
-    /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
-    this_cpu(gdt_l1e) =
-        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
-    if ( IS_ENABLED(CONFIG_PV32) )
-        this_cpu(compat_gdt_l1e) =
-            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
-
     percpu_traps_init();
 }
 
-- 
2.39.5


