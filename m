Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFaiDm7WmGl7NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E217816B0A1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237618.1539933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLD-0001vP-2X; Fri, 20 Feb 2026 21:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237618.1539933; Fri, 20 Feb 2026 21:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLC-0001jf-PB; Fri, 20 Feb 2026 21:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1237618;
 Fri, 20 Feb 2026 21:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYLA-0008IG-If
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:12 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5bfbbb9-0ea5-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 22:47:10 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-480706554beso28511075e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:10 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:09 -0800 (PST)
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
X-Inumbo-ID: b5bfbbb9-0ea5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624030; x=1772228830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTqLwQAs0U3ktqAPOv0GkFeeIfrNLrDf4DIWmemjfFQ=;
        b=MzIwYoLRbmbdwpCrrCbztLj/pWlkZ9t4vfFHzj0ck/GsHrQ+fkwerOXzK3dKGYHcdU
         /UbtN7WFb5sOtM/u2FSQDG27a5w9E4bvakUueUVK2pL1outtQPgQ7UaPL2+Cd/dg1/Il
         rKpXhk8uVJwvlmOKB8W8I57Pr/+mFdGoOkCqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624030; x=1772228830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZTqLwQAs0U3ktqAPOv0GkFeeIfrNLrDf4DIWmemjfFQ=;
        b=d5Ru0EOGlSSUdHXeoasujpwK2U/7JC8Dz7MYLieEzN6wSkytWjGZZTmmFMe2DxIxDj
         jIvWcPDf3Nln8FyxK8rCyN0/bvIix2lK69EreEHX5b6mMJxbB1dJnwqzkv66CoV4RNQJ
         fnPRXUiL5Is0CrqlucD+X1AJ8bRa+UlyoLTUFj2Y+dK6nHCvaEKjEYj5AkjTPRR+DdVQ
         5/8CshpFw8zFxXVBzJtkwCHeykMhG4ZfY62Ex+e18l7+eqpymz21Dku3za4OKN7Wc6fw
         CGdmMWMqkmRmo3mM1a9l67GMV7iaEa7aDic0JgX88xCM1Zc7bx+P+dK5emh0PkWGHcy/
         jfhA==
X-Gm-Message-State: AOJu0YwEp0DxA8NvlPRox6g8ZPoiEwTfjNKLPs9Su049oXvGIXBFTSDw
	78upR2XSqvbzcLDu51Lr5WsDAw1uW1kKBmKMlit9oJGJP78Bbf8EyE6XtNwOW8whq+C+n5PaNel
	RQw8OSnbGlw==
X-Gm-Gg: AZuq6aI4WT1609B3Kf/CKsizJgAismUXO4nr6tN3+vPhIDusvX/z0JUKqEE/pJLRLvv
	+Rp3/Li4uEpkP1c498ZtimSwtAotVtkLOIGILfmu2x/nXlV7MtSeDYb9mVi9vGaW9m4uK3JZ9Ee
	GFLBAfnl85Q9c04UDKgyIYRTDomEZZhRZpKNdJGIXYQ6mJjEeIpThf2ygh5bg5KUJahuEfrI+aq
	aN0aUEMaI8LD9pe4JzGsQRqww6fWT6Bp1/kK3dWU509x3kiD/S3uE9U56Y6VVRvU/WtDc+ualkz
	QNvXjTv6fVOSrrOc+rGSJ55pPIX/6b/4iJtwuy/64rcDff5hGpwRf1Argcl8rXkTVF6Cy+aHBsC
	CFVwhhNNc4DrEptTwBHuHo1+Qmb8AJ8zoM5rtkqIwNO1mNKi3nEbsnzc99JE/kbo11aBDmApXdU
	qelvh9/148pGV6FXdTEno5hpP+XApymwkFc35iPLAXnXrqAcyWoZZ6bNA1tU9jsQ4i3PVNV2E=
X-Received: by 2002:a05:600c:64ce:b0:483:7432:a761 with SMTP id 5b1f17b1804b1-483a9637502mr16333205e9.24.1771624029745;
        Fri, 20 Feb 2026 13:47:09 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 10/12] xen: Adjust break/fallthrough statements
Date: Fri, 20 Feb 2026 21:46:51 +0000
Message-Id: <20260220214653.3497384-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E217816B0A1
X-Rspamd-Action: no action

sh_destroy_shadow() has a spelling of fallthrough which doesn't match the
permitted pattern.  Convert it to a real fallthrough (psedo)keyword.

Elsewhere, insert breaks at the end of the default statements.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/pci/pci-access.c     | 2 ++
 xen/arch/arm/pci/pci-designware.c | 2 ++
 xen/arch/arm/tee/optee.c          | 1 +
 xen/arch/x86/mm/shadow/common.c   | 2 +-
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index c0533c00c9a5..2b23d552bbfb 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -63,6 +63,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
         break;
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     return 0;
@@ -89,6 +90,7 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
         break;
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     return 0;
diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-designware.c
index 6b85213f637b..902da19e8c98 100644
--- a/xen/arch/arm/pci/pci-designware.c
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -48,6 +48,7 @@ static int dw_pcie_read(void __iomem *addr, unsigned int len, uint32_t *val)
         break;
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     return 0;
@@ -71,6 +72,7 @@ static int dw_pcie_write(void __iomem *addr, unsigned int len, uint32_t val)
         break;
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     return 0;
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 699e8d536862..f719d9d767ab 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -1206,6 +1206,7 @@ static void do_call_with_arg(struct optee_domain *ctx,
     default:
         /* Free any temporary shared buffers */
         free_shm_buffers(ctx, call->xen_arg);
+        break;
     }
 
     put_std_call(ctx, call);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 96986ee2553d..5834c265f76d 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1213,7 +1213,7 @@ void sh_destroy_shadow(struct domain *d, mfn_t smfn)
 #ifdef CONFIG_PV32
     case SH_type_l2h_64_shadow:
         ASSERT(is_pv_32bit_domain(d));
-        /* Fall through... */
+        fallthrough;
 #endif
     case SH_type_l2_64_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l2_shadow, 4)(d, smfn);
-- 
2.39.5


