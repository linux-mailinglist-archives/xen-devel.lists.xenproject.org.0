Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B83679838
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483549.749775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIce-0000Q6-4i; Tue, 24 Jan 2023 12:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483549.749775; Tue, 24 Jan 2023 12:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIce-0000Nc-0J; Tue, 24 Jan 2023 12:41:56 +0000
Received: by outflank-mailman (input) for mailman id 483549;
 Tue, 24 Jan 2023 12:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOcK=5V=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pKIcc-0008Um-FQ
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:41:54 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a554de8-9be4-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 13:41:52 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id kt14so38689985ejc.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 04:41:52 -0800 (PST)
Received: from uni.router.wind (adsl-208.109.242.227.tellas.gr.
 [109.242.227.208]) by smtp.googlemail.com with ESMTPSA id
 bj10-20020a170906b04a00b0086b0d53cde2sm825419ejb.201.2023.01.24.04.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:41:51 -0800 (PST)
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
X-Inumbo-ID: 7a554de8-9be4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2olX0nzQBjitvSin0uiejmf+7loZKGT4TX0YsAFXQ0=;
        b=WXd780q1ocBcbk6sCNzF6Xey6SZmr18KWI+2TiUMqD3MK3Smf3q7iku4p7K+kUGgHU
         CjkjZf248ClmEFSAhMA63gEUAcOyL2+yvG4XlRLuIRMODcMtebpNvez7gV/+2XTA6ZYW
         2VGlerwlLet7vqZyh0enwE2RjGhubyeOggTp3uAyQ35WYi+jxSFxa6ys5QLy8opFKC9h
         0JPKwd4X62elZPmnUccB/dXc8I9zY5SHsvhL9Ii7hjUTQDobLqXg0dV+tFA38K+Zxl0S
         X6tAdUGC30ndH+2ahdZtAgekYpf7alUYP97U/dwk2vtnWmCnbGtfBCQ9JMV83XjpvPpa
         DDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2olX0nzQBjitvSin0uiejmf+7loZKGT4TX0YsAFXQ0=;
        b=xvMQOLOyFr4rAnNEhWjiF52IAqb1lIdhaFHXgLh7c4Wtnmw2WGjt41ye/pmKv/55J3
         bbzRnmc9nXM6MzhhDy/6qijhhxNx+2+VxZMk/Py8D0OeHl+2U+bG2RMFjsRiMPq4NE9/
         8pzLN/PVUJEs3KJ8egQiZp/cYv6Jjom89nX0XPPzUyw++T1Uj7WCLc1wRchqX1+VJ8zj
         Z2unpDImMWT0arFSHXFGdskR8skccm1BN+epC674ZMG0jlHWPvy5084sDya7kLWnnhwj
         H6fzuQXRYRqjMF0dEO7WTb6mDZmxeUSV8VnCPQH6guG3baeVHRYBdEBQbcNwK/UyeYha
         ec2Q==
X-Gm-Message-State: AFqh2koYLLYYXI9bhItxYziIQ+JjIyMABC04ju4x/FQMhWyBSC1OoV1e
	o4UvpO+U07i9ghaZo02+BiiyghVnsB4=
X-Google-Smtp-Source: AMrXdXuoIBMj013AoW65KBsYxEJXpnwAVaZyigFL3YJLPK2E8PyP0ab2oH+ARij84GXj+pgKmauWyQ==
X-Received: by 2002:a17:907:3ad0:b0:870:7c88:4668 with SMTP id fi16-20020a1709073ad000b008707c884668mr25029985ejc.68.1674564111992;
        Tue, 24 Jan 2023 04:41:51 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/5] x86/iommu: make code addressing CVE-2011-1898 no VT-d specific
Date: Tue, 24 Jan 2023 14:41:39 +0200
Message-Id: <20230124124142.38500-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230124124142.38500-1-burzalodowa@gmail.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable untrusted_msi indicates whether the system is vulnerable to
CVE-2011-1898 due to the absence of interrupt remapping support.
Although AMD iommus with interrupt remapping disabled are also affected,
this case is not handled yet. Given that the issue is not VT-d specific,
and to accommodate future use of the flag for covering also the AMD iommu
case, move the definition of the flag out of the VT-d specific code to the
common x86 iommu code.

Also, since the current implementation assumes that only PV guests are prone
to this attack, take the opportunity to define untrusted_msi only when PV is
enabled.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Changes in v4:
  - in vtd code, guard with CONFIG_PV the use of untrusted_msi
  - mention in commit log that CVE-2011-1898 currently is not addressed for
    AMD iommus with disabled intremap
  - add Jan's Reviewed-by tag

 xen/drivers/passthrough/vtd/iommu.c | 5 ++---
 xen/drivers/passthrough/x86/iommu.c | 5 +++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 62e143125d..e97b1fe8cd 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -54,9 +54,6 @@
                                  ? dom_iommu(d)->arch.vtd.pgd_maddr \
                                  : (pdev)->arch.vtd.pgd_maddr)
 
-/* Possible unfiltered LAPIC/MSI messages from untrusted sources? */
-bool __read_mostly untrusted_msi;
-
 bool __read_mostly iommu_igfx = true;
 bool __read_mostly iommu_qinval = true;
 #ifndef iommu_snoop
@@ -2770,6 +2767,7 @@ static int cf_check reassign_device_ownership(
         if ( !has_arch_pdevs(target) )
             vmx_pi_hooks_assign(target);
 
+#ifdef CONFIG_PV
         /*
          * Devices assigned to untrusted domains (here assumed to be any domU)
          * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
@@ -2778,6 +2776,7 @@ static int cf_check reassign_device_ownership(
         if ( !iommu_intremap && !is_hardware_domain(target) &&
              !is_system_domain(target) )
             untrusted_msi = true;
+#endif
 
         ret = domain_context_mapping(target, devfn, pdev);
 
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index f671b0f2bb..c5021ea023 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -36,6 +36,11 @@ bool __initdata iommu_superpages = true;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
 
+#ifdef CONFIG_PV
+/* Possible unfiltered LAPIC/MSI messages from untrusted sources? */
+bool __read_mostly untrusted_msi;
+#endif
+
 #ifndef iommu_intpost
 /*
  * In the current implementation of VT-d posted interrupts, in some extreme
-- 
2.37.2


