Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDBCA5C6C4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908348.1315477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Wk-0002Nh-4C; Tue, 11 Mar 2025 15:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908348.1315477; Tue, 11 Mar 2025 15:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Wk-0002LN-16; Tue, 11 Mar 2025 15:28:18 +0000
Received: by outflank-mailman (input) for mailman id 908348;
 Tue, 11 Mar 2025 15:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ts1Wi-0002LH-DD
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:28:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 731c5e8b-fe8d-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:28:14 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so346178366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:28:14 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e5c7669a96sm8430066a12.62.2025.03.11.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 08:28:13 -0700 (PDT)
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
X-Inumbo-ID: 731c5e8b-fe8d-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741706894; x=1742311694; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bobDa9zVuiFRsIZywC1n7gWR7/ACXztzFw7ywuS60o=;
        b=GmC9Tjev/DhQ19VQykm5piF8CnPVHw9oHDUoybCO8toV9DL9F5JZj8fcskLAdr6Awi
         m+wVmCQ0QdlFYyRGDpA5Ogbu57gNfXI5TnaYLTDBCl97rXTENwQ47o4FTf+PAwLtuCk+
         cxmzQcyw0ItFwQRgXO8U+8J7r0rM6dH6yp8lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706894; x=1742311694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bobDa9zVuiFRsIZywC1n7gWR7/ACXztzFw7ywuS60o=;
        b=SciFV1WeR0dfBq+YnSmoxtwtP6B1+KnYIRWUcXNIKXgxfbgcRc3G+1QxWllwdLfS6M
         aafE6gcHYMsVfXuEQzStAvMoVtDVwO1/2w0Jz4S24HCpJuOrqWbGZV8mKn48teY0mUdT
         q+04tFNO/iFVfaYyGDGAfjTaGYRA1oRqnOa/m9KomsSlk45MsM9knxLxQAfu11MqirDd
         4vp6NC00WINYu8luFZmgogv9kam1kxrFs6ppdx4j6XPq4DPyfHiff8E74QV2FB95qPY7
         Yg8N9XoCoZY568sXOz+u0tWPgiZCa8tWCu/csdz/kAQMH+xn4D+rSCIR5qmOt21fLCxE
         c2/g==
X-Gm-Message-State: AOJu0YwjmB21qFfOtuDIyGuhFcJDnCHv88/cZLxWKyGxw99oNYJLIyie
	8kX3FQs8dJHi7vrp44I04JTe9J5E7UB3DcM4nq9GP5hUyWQXTozgo/BTI41c5y6ko2Uq1uwPWEq
	3
X-Gm-Gg: ASbGncuFgCXRxzGU4uCrUkUzELg4WRee4QIdp6xZ4CMAuxt08boKlIQ5BcGSxM0Gejz
	EwoMcrVxMr+6UCb4iUXSwjrW6VQgxaGKYyS/zgxb0/2Pj4mJq9R8mI32Y/8dxXy6ZdVTo4FTaUs
	sbVDg+AZ3JnqBSDB/3Dtwl85n2c65/bXSu/TE3JfRQh0yny2A0alhaZ0L/Pnk11JScr21LjQWBo
	CG9eCaoU888baZ2sE8ycBVcY+RJd/HX/qcB66m0E9w2l+NH23czp6KMyOFm7pWZ52uX1UfbqAIM
	fpvwIx2dEPpPrr3DMBdPdHgakpwJVuqTRlLB7evbZ79RQ/xdhA==
X-Google-Smtp-Source: AGHT+IHJEEiUH5UGW0jj+6BpyJs9m/qHuPk9qOGJtWA5YAu7aaOEtqTGhUYnqHFFz9cQK9HwJ/bi9w==
X-Received: by 2002:a05:6402:280d:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e5e2468800mr45797084a12.23.1741706893955;
        Tue, 11 Mar 2025 08:28:13 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 1/3] x86/vmx: fix posted interrupts usage of msi_desc->msg field
Date: Tue, 11 Mar 2025 16:27:54 +0100
Message-ID: <20250311152754.63912-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311120652.61366-2-roger.pau@citrix.com>
References: <20250311120652.61366-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current usage of msi_desc->msg in vmx_pi_update_irte() will make the
field contain a translated MSI message, instead of the expected
untranslated one.  This breaks dump_msi(), that use the data in
msi_desc->msg to print the interrupt details.

Fix this by introducing a dummy local msi_msg, and use it with
iommu_update_ire_from_msi().  vmx_pi_update_irte() relies on the MSI
message not changing, so there's no need to propagate the resulting msi_msg
to the hardware, and the contents can be ignored.

Additionally add a comment to clarify that msi_desc->msg must always
contain the untranslated MSI message.

Fixes: a5e25908d18d ('VT-d: introduce new fields in msi_desc to track binding with guest interrupt')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Initialize the local msi_msg with the contents of msi_desc->msg.

Changes since v3:
 - New in this version.
---
 xen/arch/x86/hvm/vmx/vmx.c     | 4 +++-
 xen/arch/x86/include/asm/msi.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0241303b4bf4..23b7ecd77f85 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -396,6 +396,7 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
     const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
     struct irq_desc *desc;
     struct msi_desc *msi_desc;
+    struct msi_msg msg;
     int rc;
 
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
@@ -410,12 +411,13 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
     }
     msi_desc->pi_desc = pi_desc;
     msi_desc->gvec = gvec;
+    msg = msi_desc->msg;
 
     spin_unlock_irq(&desc->lock);
 
     ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
 
-    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
+    return iommu_update_ire_from_msi(msi_desc, &msg);
 
  unlock_out:
     spin_unlock_irq(&desc->lock);
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 378b85ee947b..975d0f26b35d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -124,7 +124,7 @@ struct msi_desc {
     int irq;
     int remap_index;         /* index in interrupt remapping table */
 
-    struct msi_msg msg;      /* Last set MSI message */
+    struct msi_msg msg;      /* Last set MSI message (untranslated) */
 };
 
 /*
-- 
2.48.1


