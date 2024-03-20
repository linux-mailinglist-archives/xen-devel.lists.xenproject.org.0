Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B50B8812C8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695928.1086253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwSY-0000lM-DP; Wed, 20 Mar 2024 13:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695928.1086253; Wed, 20 Mar 2024 13:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwSY-0000jp-Aj; Wed, 20 Mar 2024 13:58:26 +0000
Received: by outflank-mailman (input) for mailman id 695928;
 Wed, 20 Mar 2024 13:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmwSW-0000jj-L7
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:58:24 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea4538bd-e6c1-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 14:58:23 +0100 (CET)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-430c32c04c7so27459821cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:58:23 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 ev15-20020a05622a510f00b00430ea220b32sm1976799qtb.71.2024.03.20.06.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 06:58:21 -0700 (PDT)
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
X-Inumbo-ID: ea4538bd-e6c1-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710943101; x=1711547901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PdPBqG47aaueb+ZzuI4mZsQ5oY2pC9/88VWb9N+cIZI=;
        b=OydYDUzL8B21PIfKzoRCOkcPhIlvoW7ONHjECbTN/+Aw/blh5nfITaEZ7NuNU8NOit
         nSCRL5Cg4lKdIWrR8sD+Z5VJ4rMxvqfSYBrWcxpUKrSWxU818NkGRFJLibl6dNUPoD/P
         upBTN7PuuCAfQKcAXBvzp1oicRO431o1SiMzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710943101; x=1711547901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdPBqG47aaueb+ZzuI4mZsQ5oY2pC9/88VWb9N+cIZI=;
        b=J8NazTdn5mcxkkk33jsFh6v5zIjeOM42A7qkh3q/FCDICaQM1JWg0IhiWPfK2KwTdD
         C5hgDwXx+vVhXvNEvI9Zne9/5AWeIiAHk03+RhAcdxayNzonO2wqVT/cWbMBC/7h8HHq
         XHFvHB37IS6I89cJgum0k1i1gmqXork5fK2H+eJSSqISFBkGq26HGBn374lMGGAtG2UM
         7ln93viTjh9x/siEgGuK9FgON2z6VyZA6fFxXT4Okht0IhBIjbHy57PGCgBsKHhhwTR9
         AD1uUMWhBJgKmuh2oD/C6UWyv05Uo+bnPXuwwKoZI/3XeJez7L6TvvgIubTRsowb3q+M
         djOg==
X-Gm-Message-State: AOJu0Yy3cex1ymLYMWCm+Hk/p0tCjjLX7I8USKLtmvKW4SmBJn1q6tUY
	VKlpiFdk3xJwe2vHPSYm4R+glymSByWXQ3lk/iUfnKxBz7bSO1DJzBz6WoamPbuKxOnrW2/3gSL
	E
X-Google-Smtp-Source: AGHT+IFRaC/mtYKrPH2Y8fC7/zgDT7MdTedS42YUk2f+z3XdWqpj+faQ7c+ve0RBbBIBmRe08BPR9g==
X-Received: by 2002:ac8:58d2:0:b0:430:ce8c:9581 with SMTP id u18-20020ac858d2000000b00430ce8c9581mr10706164qta.22.1710943101377;
        Wed, 20 Mar 2024 06:58:21 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV vCPUs
Date: Wed, 20 Mar 2024 14:57:20 +0100
Message-ID: <20240320135720.68894-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no reason to force HVM guests to have a valid vcpu_info area when
initializing a vCPU, as the vCPU can also be brought online using the local
APIC, and on that path there's no requirement for vcpu_info to be setup ahead
of the bring up.  Note an HVM vCPU can operate normally without making use of
vcpu_info.

Restrict the check against dummy_vcpu_info to only apply to PV guests.

Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/compat/domain.c | 2 +-
 xen/common/domain.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/compat/domain.c b/xen/common/compat/domain.c
index 7ff238cc2656..6b4afc823217 100644
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -49,7 +49,7 @@ int compat_common_vcpu_op(int cmd, struct vcpu *v,
     {
     case VCPUOP_initialise:
     {
-        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
+        if ( is_pv_domain(d) && v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
 #ifdef CONFIG_HVM
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f6f557499660..d956dc09eca0 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1817,7 +1817,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     switch ( cmd )
     {
     case VCPUOP_initialise:
-        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
+        if ( is_pv_domain(d) && v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
         rc = arch_initialise_vcpu(v, arg);
-- 
2.44.0


