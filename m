Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMncI3KyGWrryQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333BF604DB8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322625.1588917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFi-00046M-0E; Fri, 29 May 2026 15:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322625.1588917; Fri, 29 May 2026 15:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFh-00044i-Sz; Fri, 29 May 2026 15:36:01 +0000
Received: by outflank-mailman (input) for mailman id 1322625;
 Fri, 29 May 2026 15:36:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSzFg-0003s3-Pb
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:36:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSzFg-005xlZ-6D
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:36:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b25d-e002-0a2a0a5209dd-0a2a450ceb80-10
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:00 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b260-62f1-0a2a450c0019-d1558033e08c-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:00 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso66630565e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:36:00 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm4196196f8f.11.2026.05.29.08.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:35:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780068959; x=1780673759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7y/l1jkvao4JMT1QOIgQemLNRAXdtSrjRi0t8AYbkM=;
        b=SszpiI2364pQlPHUk2HMyfcalgxKbZBzO0QJYS4LZ5XjxuyCLjHwkHRUMyXQrCghTv
         ucFU2JTCtX/40iTW4uHTE2YMuoyYcWEieCLXH4OSFRXXxeTODoK+jRXz5vGk8J/0Gjtu
         mhgch1SSKW7omRw7P62SZ1BtjAgU2r/GfqOWbIVC36WaUFKRxWbGa5HrEk74WFkCjoWH
         OY4AGi3EmC5mb4GKVMvzo7taqzojNXH+s+pU2q9HzR+8mbczmVYr/x9eeWzD12PXTNl1
         gOTn065L7eXvQa+KMun8Skh4f4fC3ya5Dp824OogBNmQMoKJqu/YhGd1lG3W44fSPrBf
         8N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068959; x=1780673759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7y/l1jkvao4JMT1QOIgQemLNRAXdtSrjRi0t8AYbkM=;
        b=ov7V40gwkk3cm5z3FJl89MTldiFQTkVWfEA2g9rNT7wLMMljaFs5qNE2CsxBDzC21Q
         xqvtMn8MlQP6Wtiz6exy7tKas0NIyOJ6LopSaET4LwmPgGidGZpeWXRyk47TFGsNDC7W
         LhDBf4porCrFQv1ILvuKRRwPlkHyLkbWSLpYAs7xeaWise6EE2vmznP54H0wfZqUlhr5
         r7qxRTVEVmbDwKgcqqPRfvJq+SCZwmQeUnhrhofWG8ufJQ0XiGmT+HrSoDSGu87pozAb
         V+IgAzG/neeTlVTI9LSF5kzKjXajte+qxe+KuDWZGDQ835KIFGQaPrq5wIhSfGNAApzw
         4wEQ==
X-Gm-Message-State: AOJu0Yw84hFq49HNi2LD4fTz3exn3kujJXbP385c8zTG+9YOWwXENAys
	+VGyK704IVkaNunwpZrijI7Zd0XddXHWxz41Pmwe+Dv2tqRhPibJxgn4zYfMlKaJ
X-Gm-Gg: Acq92OGt7Lrp7kJczY35DK9anyic15BzvSutGGaVmNHqCPXBYoCenpzmJPwO/Dmp1LK
	peazJsV4wWNi+jZ97GfNY0JV9dBRqG1zu0T2jTy/bF59WNuSx3ZzU7MfVV6wGi3Jaf7BuzxEVWQ
	nPNxo44cF9NK92M+b9E+M9FOavUZ27mMlPk5G/8ROnQalzjXU4SvpA0l47+297dS+SVXnaZrX8Q
	5jen2Wi3xu+nV0oUtE9p4yhLtppWnDLQNZwag+J8LSLDLpOpvojVpj4YQ37ho/fGj51LE1+iZyC
	ZYtHRwQGE5aePbdnlyrCdul6anCCyw7qZBT7b2xgdRbml9EfaucEAZeI0In65gU0grbmPk6k+OG
	R0+BajxGExFWk3nH6AoEsEeGs/pjJ/5x0T+8rSiBoC76la5CJxjV+Jfof5F03vUCXtnIeCNDOgW
	VRpuSwgBW6DYMxYpVFQp1Fac3KmCGbFOa7B3zV86pHSHozGwD3IhZ9gHVATyA9XZ6SKedll+dVm
	XHh4KEzMDcy6i2WLmad02cDndiK2lkOAiWb
X-Received: by 2002:a7b:c854:0:b0:490:9699:4428 with SMTP id 5b1f17b1804b1-490a2964057mr1043865e9.26.1780068959478;
        Fri, 29 May 2026 08:35:59 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 1/6] Add SBAT section to the PE binary
Date: Fri, 29 May 2026 16:35:26 +0100
Message-ID: <20260529153531.1341542-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780068960-D956FCF5-82D053DB/0/0
X-purgate-type: clean
X-purgate-size: 2794
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:gerald.elder-vass@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@cloud.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid,cloud.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 333BF604DB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>

The SBAT section provides a way for the binary to declare a generation
id for its upstream source and any vendor changes applied. A compatible
loader can then revoke vulnerable binaries by generation, using the
binary's declared generation id(s) to determine if it is safe to load.

More information about SBAT is available here:
https://github.com/rhboot/shim/blob/main/SBAT.md

Populate the SBAT section in the Xen binary by using the information
in xen/arch/x86/sbat.csv.

On XenServer, the version and release fields are populated by the spec
file during the build process.

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/Makefile     | 4 ++++
 xen/arch/x86/xen.lds.S    | 2 ++
 xen/include/xen/xen.lds.h | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 47dd6c50fe..a2bdcb6f44 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
 obj-y += hpet.o
 obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += xstate.o
+obj-y += sbat_data.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
@@ -275,6 +276,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
+$(obj)/sbat_data.o: $(src)/sbat.csv
+	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents --add-section .note.GNU-stack=/dev/null $(srcdir)/sbat.csv $@
+
 clean-files := \
     include/asm/asm-macros.* \
     $(objtree)/.xen-syms.[0-9]* \
diff --git a/xen/arch/x86/sbat.csv b/xen/arch/x86/sbat.csv
new file mode 100644
index 000000000000..1573604e2f10
--- /dev/null
+++ b/xen/arch/x86/sbat.csv
@@ -0,0 +1,1 @@
+sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..c2b9b5a893 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -354,6 +354,8 @@ SECTIONS
   PROVIDE(ALT_START = 0);
   VIRT_START &= 0;
   ALT_START &= 0;
+
+  .sbat (NOLOAD) : { *(.sbat) }
 #elif defined(XEN_BUILD_EFI)
   /*
    * Due to the way EFI support is currently implemented, these two symbols
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index ea11e3fb62..c9aa1b7fae 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -118,7 +118,8 @@
        *(.comment.*) \
        *(.note.*)
 #else
-#define DISCARD_EFI_SECTIONS
+#define DISCARD_EFI_SECTIONS \
+       *(.sbat)
 #endif
 
 /* Sections to be discarded. */
-- 
2.43.0


