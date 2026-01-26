Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bfVgF1Gqd2k8kAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC528BC50
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213844.1524410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmu-0007mA-8J; Mon, 26 Jan 2026 17:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213844.1524410; Mon, 26 Jan 2026 17:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmt-0007Wm-Dr; Mon, 26 Jan 2026 17:54:07 +0000
Received: by outflank-mailman (input) for mailman id 1213844;
 Mon, 26 Jan 2026 17:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmp-0004HW-Ks
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:54:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff44c60d-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:54:01 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee9817a35so36683265e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:54:01 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:54:00 -0800 (PST)
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
X-Inumbo-ID: ff44c60d-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450041; x=1770054841; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM0AV4MNuYAd316Xwda7bgSZwEFUvVU+olFepXiLw+U=;
        b=NdKv04Phlgl8+qr4D8xRyxT6YieLWJuAXAXkzoeysG5z/fVBjJ8mkbQRR0UbZ1qpmb
         c1baY6rfChBrqO5zB3qMpHj+kr/7nsApgDRGTvcWw9XUl2AsE2YTEU76AGp35Ut/8U+f
         G0cmrqPklJajSZYsubPRVJXUNyHbfQwRWlIvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450041; x=1770054841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AM0AV4MNuYAd316Xwda7bgSZwEFUvVU+olFepXiLw+U=;
        b=f7CxMO1MFJJnSWwqB8qoI9rrnzfMa6CYbnKnLXn+gCfvgBaUiJhBsjYvj/RZvAwoeo
         dWyLP/RZpl/o8607qtbE4YxScsToJlHmMWywHZEryo2RYX1SdTTxoe3yzomESrtuW1E5
         2OT1cs89kRKRwKYKfKsy2Bj1oyNtOUICo6fjtdoizxaNfupMtVZVeUSoua6l421BE/Cs
         MV2PY4gnhT1JC8u1uJmE4H+4B2YbOFipJy/yg9Ri25THbyGB6gwsfeQlnpkQB8PR562z
         VaY1tEhtt3Nqb/ufr3z/Ffb6kLGDbnZ+SbLGV6ueV/8C1A75Zh1gQ9rbVohlSXXSVhs/
         vTrA==
X-Gm-Message-State: AOJu0YxQeIo2GoOteneGq/RmJOg2R52f/ufMTm10re3Q9n9K9NylDA6z
	iNWfX6sMU50pGt1sco24xEDsXUOlO5N8hEJ0IOLbR2nZDhkc1vt825EOnRdpK7ZF58tFYmD8HEs
	wRcas
X-Gm-Gg: AZuq6aL6hvXCSY8QncMB3AQ1c3kzsfnUZIUEzVeWgMXHxA/0PUcOKFAMuDJtxcEjjxJ
	V5ZdS//a0s8O2S2fwAlb6hi9o3rCx176vZRqnJwDAL8l1CZbFE9/zAGkUOzIq07DXtts4VIBKeT
	gS5sLL63Am69xJCM/bjK8qgJpgdj+aMkvrG2m6u0eD3SrwBxapPCRi+UXufGssfsg0raTclod20
	3HoeqgYluLIRrmrAIfg9OKz1A/h+WF+8Y+4UoSSEic9ZS3I9O6HtjdtpoysDgFHpfB2wVOiwA7G
	FQHkiqqtwclQREA8XBuuyKd/7JlFfyAFAvm9xreK3AUY0I7oQttHN3m2KnPys/2+h15MBZN73pt
	jIhkhCjuAZaH4oMD7qGNyXDlM/wuVojhNlcT354DNZyYthpUZzeghlZZf2PVQYWHix+kp9+MH5N
	b++wl58JfnS7/wwVQHSxi6yJyoNin6oMJhOmIUPRqmhAKLeFyUteurIJBbjysVAw==
X-Received: by 2002:a05:600c:358d:b0:47e:e61d:b8d2 with SMTP id 5b1f17b1804b1-4805d0645fcmr91718615e9.27.1769450040383;
        Mon, 26 Jan 2026 09:54:00 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 16/16] x86/cpuid: Drop the include of public/sysctl.h
Date: Mon, 26 Jan 2026 17:53:45 +0000
Message-Id: <20260126175345.2078371-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 3EC528BC50
X-Rspamd-Action: no action

Following the removal of XEN_SYSCTL_get_cpu_levelling_caps, asm/cpuid.h
doesn't need to include public/sysctl.h, but several other header files were
picking up their includes transitively through asm/cpuid.h.  Untangle them.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/cpuid.h      | 2 --
 xen/arch/x86/include/asm/hvm/hvm.h    | 2 ++
 xen/arch/x86/include/asm/hvm/vlapic.h | 2 ++
 xen/arch/x86/include/asm/hvm/vpt.h    | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index c7ee1d54bc7e..774cfdf86894 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -7,8 +7,6 @@
 #include <xen/kernel.h>
 #include <xen/percpu.h>
 
-#include <public/sysctl.h>
-
 extern const uint32_t known_features[FSCAPINTS];
 
 /*
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index af042ae858af..ede685d030bd 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -19,6 +19,8 @@
 #include <asm/x86_emulate.h>
 
 struct pirq; /* needed by pi_update_irte */
+struct hvm_hw_cpu;
+struct xen_domctl_createdomain;
 
 #ifdef CONFIG_HVM_FEP
 /* Permit use of the Forced Emulation Prefix in HVM guests */
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index c38855119836..f442dec3d975 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -12,6 +12,8 @@
 #include <xen/tasklet.h>
 #include <asm/hvm/vpt.h>
 
+#include <public/hvm/save.h>
+
 #define vcpu_vlapic(x)   (&(x)->arch.hvm.vlapic)
 #define vlapic_vcpu(x)   (container_of((x), struct vcpu, arch.hvm.vlapic))
 #define const_vlapic_vcpu(x) (container_of((x), const struct vcpu, \
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 0b92b286252d..24f0918280cd 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -12,6 +12,8 @@
 #include <xen/list.h>
 #include <xen/rwlock.h>
 
+#include <public/hvm/save.h>
+
 /*
  * Abstract layer of periodic time, one short time.
  */
-- 
2.39.5


