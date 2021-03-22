Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511AA3445CE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 14:33:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100208.190786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOKg9-0001XD-WB; Mon, 22 Mar 2021 13:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100208.190786; Mon, 22 Mar 2021 13:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOKg9-0001Wo-T7; Mon, 22 Mar 2021 13:33:09 +0000
Received: by outflank-mailman (input) for mailman id 100208;
 Mon, 22 Mar 2021 13:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lOKg8-0001Wj-Gg
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 13:33:08 +0000
Received: from mail-qv1-xf32.google.com (unknown [2607:f8b0:4864:20::f32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fb2aa84-6827-43a6-b9e6-d2844e411a9b;
 Mon, 22 Mar 2021 13:33:07 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id cx5so8571609qvb.10
 for <xen-devel@lists.xenproject.org>; Mon, 22 Mar 2021 06:33:07 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1322:1f91:8356:c0dd])
 by smtp.gmail.com with ESMTPSA id
 k4sm10969035qke.13.2021.03.22.06.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:33:06 -0700 (PDT)
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
X-Inumbo-ID: 6fb2aa84-6827-43a6-b9e6-d2844e411a9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FQPB8K9PrmdKAV92Jc/Bf3qOZoqSuvhFC01n7H41QLE=;
        b=o0OH2/UcTaXjiQQM1TkArTdytlCWeCuPXSzjY9KSueBTnhzR7ZDXYDric7SkI8moFI
         lPNbrUNdr/ZivENdhSs9P4drNETY895eocMsPqU++hqmVgNovDuepbT2dwCNZ+MrUxAm
         TaarQ4pyfTv0aRls1emvJGClsiwDS8red2IBV3O49c8VVPRi7v4CLHT06KaF7lNclpdh
         4oi59tk3L70zsuN+0/QbpD0lTEqAEHcpZRKQWNXhMYttpHY98qPGeLnVqruHfh6ELLvY
         UQNHiCbU6ezxAzzk1rtAKhR1RzedCsiCCfycl/saDaqVgI3gz+TToSOo7UaaI2qNhDeX
         uJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FQPB8K9PrmdKAV92Jc/Bf3qOZoqSuvhFC01n7H41QLE=;
        b=bIKrv3q+rMWd+202ZxDKFUuYAbYwLDFxK4EYHW1yA8leDUvrDqzCYJ4dTBRY0wgG03
         F8us6fsYeDL13GCy+n01St8kI6AVW17gAki5fw5dPkpp7YdnXUHrd/pUl/2PjTfUon8S
         DAbdtYMc3gtR5z9oMwxIjTuPuor9UaliwzAS0Dq9+IPAD1eZfOhPMHvHpacPsTt91720
         w/i8kIm9AB2KwClsjGXhxm8HMJUFIpxSW71yhoHj/V1ZDTs0on4HK5DeT617RA/5A1RE
         Fk5vxT+++DC9egrZBgNk+Mtb2AAXCfV/XKPYNAzUzsrc3+/11YA1zzf554nIbtKTUsnX
         C+9A==
X-Gm-Message-State: AOAM530QLXVM5o3PwBNzzpzcGj/QfpyEHWZl3JsZE14LKqdJ+NwgBHJk
	jDqzkPkTfL6CgJ/zo2Ak+a7HCn+B9y8=
X-Google-Smtp-Source: ABdhPJy6BKHEK5AUYST4TUCw1SxNYltZ6z4A5LPZ6VUsyAYE+Q9Lh347gQ1+vftNtMxpYesM5iqI8g==
X-Received: by 2002:a0c:f9cc:: with SMTP id j12mr21059219qvo.15.1616419987147;
        Mon, 22 Mar 2021 06:33:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen: Create EFI_VENDOR directory
Date: Mon, 22 Mar 2021 09:33:01 -0400
Message-Id: <20210322133301.11308-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make install-xen fails when EFI_VENDOR is set (=fedora) with:
install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory

Create the EFI_VENDOR directory so xen.efi can be installed within.

This removes the need for Fedora and Qubes xen.spec files to manually
create the directory in advance.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/Makefile b/xen/Makefile
index 0b97e459e2..f372b44de3 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -289,6 +289,7 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
+			$(INSTALL_DIR) $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR); \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
-- 
2.30.2


