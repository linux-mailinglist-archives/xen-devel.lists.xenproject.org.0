Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96A380CBA
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 17:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127411.239491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZaD-0001JG-Md; Fri, 14 May 2021 15:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127411.239491; Fri, 14 May 2021 15:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZaD-0001H1-IK; Fri, 14 May 2021 15:18:33 +0000
Received: by outflank-mailman (input) for mailman id 127411;
 Fri, 14 May 2021 15:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRnq=KJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lhZaC-0001EX-9a
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 15:18:32 +0000
Received: from mail-qt1-x832.google.com (unknown [2607:f8b0:4864:20::832])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70d4fa47-0c2a-442d-9ff7-0e339ff3929b;
 Fri, 14 May 2021 15:18:31 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id j11so22400214qtn.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 08:18:31 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 d84sm4665216qke.131.2021.05.14.08.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:18:30 -0700 (PDT)
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
X-Inumbo-ID: 70d4fa47-0c2a-442d-9ff7-0e339ff3929b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nh+jCgVuPFnj2BoQMYGoLMwy+VkOph0GjRVVSgE5efg=;
        b=ZOmkwW/bFyNIHI05xkLPtSDEvC1OPoc75C28XkQ84+XTskYg6wPiqMZwAHmvhwWkHi
         kkQ8XIflzSP89lnUmMBZVL8F/2EV3h6ArpBDgxcoom4ZdS1fOtTjskHmjaZOwcYKbjy/
         ae+NH0FKbHf0pl6em6UHLBOP0popR0JRt+ckrNtDjmT0yJ4eshXXmMLNWoF0L+pM78gj
         Cw1VHXreZUKbRRaGIV37FpBAPQpnmqCLOL1j9JM6z5H/qaAHp1nDrhSyx82S4Egxj8vO
         fMYaudBzPc54XYo9wZwQLs97bt4nnKQ0EUcpR2AG1EwkAJFGBK5aKnlqz5d3OWZJhUHv
         6yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nh+jCgVuPFnj2BoQMYGoLMwy+VkOph0GjRVVSgE5efg=;
        b=DFzmmE3YX6GxPO8/BqBX0YvSq8bDbFBLIejlaVt2u4T3AVCiZN+j/tNJiTaSabH8D0
         3ilCvNjFKGS6pBAlhjg0kSpvXswSwcRfgOE8ttpfbUrfywpRlLoKveFVPxWMc5uu5SNh
         m/k+gxS4K5RbCJORnPX88Z+W8Ohv4fmmxdscP3aO51sJtAymuuJ5X9xtEB1HuNoVuEZe
         HB6u6UmKDFaYWzKRVJqkfccQNhuIBV1CeAh1I+3mnWh11ypPgKjDFH6lhGgV5mC8bIHh
         yM1DXCy9uAXeJ+kPKJesvAr9azB1yVC6OpqQIKEUFIskp4saBRY0rGXldBbDAJwWdOnM
         eKOw==
X-Gm-Message-State: AOAM533iPKFR0mfmmp5GTSlrhvebbYh2O+w0HMbFuW3nQXt43XnxdUz/
	WkgShrKGd0JYAs/95FvimBM=
X-Google-Smtp-Source: ABdhPJyMb6Di3mioBzyhrGqHD/bdqfVMeTa2/2V9mdVQrLSj2cSnWYptCJ7yPSaREQyAAKM5E9+qCw==
X-Received: by 2002:a05:622a:14d0:: with SMTP id u16mr40942492qtx.42.1621005511431;
        Fri, 14 May 2021 08:18:31 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: jandryuk@gmail.com,
	xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	wl@xen.org
Subject: [RFC PATCH 3/3] libelf: PVH: only allow elf_paddr_offset of 0
Date: Fri, 14 May 2021 11:17:31 -0400
Message-Id: <20210514151731.19272-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514151731.19272-1-jandryuk@gmail.com>
References: <CAKf6xpsyzazbY_mA0QtAuAqpOPkpuhjrZ1wid0khWy1urh4iBg@mail.gmail.com>
 <20210514151731.19272-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modern Linux and FreeBSD hardcode it to 0.  Just drop its use for PVH.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/hvm/dom0_build.c      | 2 +-
 xen/common/libelf/libelf-dominfo.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 552448ce5d..335321ed3e 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -574,7 +574,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     }
 
     /* Copy the OS image and free temporary buffer. */
-    elf.dest_base = (void *)parms.phys_kstart - parms.elf_paddr_offset;
+    elf.dest_base = (void *)parms.phys_kstart;
     elf.dest_size = parms.phys_kend - parms.phys_kstart;
 
     elf_set_vcpu(&elf, v);
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 13eb39ec52..12feb8755e 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -433,6 +433,12 @@ static elf_errorstatus elf_xen_addr_calc_check_pvh(struct elf_binary *elf,
             parms->phys_kend = elf->bsd_symtab_pend;
     }
 
+    if ( parms->elf_paddr_offset != 0 ) {
+        elf_err(elf, "ERROR: ELF elf_paddr_offset (0x" PRIx64 ") is non-zero\n",
+                parms->elf_paddr_offset);
+        return -1;
+    }
+
     elf_msg(elf, "ELF: addresses:\n");
     elf_msg(elf, "    phys_kstart      = 0x%" PRIx64 "\n", parms->phys_kstart);
     elf_msg(elf, "    phys_kend        = 0x%" PRIx64 "\n", parms->phys_kend);
-- 
2.31.1


