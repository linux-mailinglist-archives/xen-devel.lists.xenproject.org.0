Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD5849FF6
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 17:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676392.1052552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2E5-00086W-ES; Mon, 05 Feb 2024 16:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676392.1052552; Mon, 05 Feb 2024 16:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2E5-00083q-BG; Mon, 05 Feb 2024 16:53:45 +0000
Received: by outflank-mailman (input) for mailman id 676392;
 Mon, 05 Feb 2024 16:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Hmw=JO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rX2E4-00082P-7H
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 16:53:44 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb7b2c2-c447-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 17:53:43 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so3242352f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 08:53:43 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4c48000000b0033afe816977sm15271wrt.66.2024.02.05.08.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 08:53:41 -0800 (PST)
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
X-Inumbo-ID: 1eb7b2c2-c447-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707152022; x=1707756822; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BdVtkLJg5fedcHtSRpvJksczWE/cqssw9PeeRwuokvo=;
        b=pjFUCueDGCNbJxP6RHwaBpzAPpNNDty/D6ipcwQs59qGER3a605YcXFdeJDriM6dM5
         kBAc+0R1AixenG+MpSKfA+k4jUK9yGhL/6f3ok4SU1FFp6mqLnAi9W2j+ogcHufiIe3+
         +aj/Dyy4DS/1+PGjV8+fLlgL1tEtJCU0nrfh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707152022; x=1707756822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdVtkLJg5fedcHtSRpvJksczWE/cqssw9PeeRwuokvo=;
        b=g2ke5kqrRQ1bBMKegc5UWLMdZBxvBnJO2dSRV9lECO1ZBvX24tlpKvqJixYl3AuPTy
         eDFYnFkX5dobzF2hslTE9LOgn1AvV2meeAwvjQXTSVAn1CDji8K+sniAPNX3jv3nyWTp
         EZcd4uPvnWcyD8RSBTuyyDbOl6wwAO2jIQ+zASH3lNw0cNvngLT5vNwF7e1KQ14+Y9cy
         WmozHnDwkl/Ddo4lbd4HgdKjMjd5jJaJ3PiEM2jYqPZg2ASXNKoQbYfyLkG1S7H7e7tl
         KJs3aSUykxL3mSFEooaCM6mDVLbKnEkq+w4FVC44I6ykfEQefW64/AQiRP1Fxy6pVDRu
         YGgg==
X-Gm-Message-State: AOJu0YwX3NUGHzTyHIPYqdamb/9SpmQXXKsclcZrkamNEhq/6c0Dh78H
	1hdoWXsqnp69Gy0dDfj2uKRdAQShwvFbWiq9Lki8HX4gIijVccsMrQlwVz2Cn/4tGHm2q5hyqZL
	o
X-Google-Smtp-Source: AGHT+IFM6k4OHVQk9zMrt5OiI+LAFFO4fPK7BpwB8rVwjwoLnolQq8TvkokNspvGRmZdfwykHDV19A==
X-Received: by 2002:a05:6000:1ca:b0:33a:fa97:7ca6 with SMTP id t10-20020a05600001ca00b0033afa977ca6mr60368wrx.10.1707152022011;
        Mon, 05 Feb 2024 08:53:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU5iyW4Bb/yGL3EYlRlOIOZgSwWumXNfhjk4MaSt8SfjNMBOdRLWK7yJgIyEbFMZDkmf+CAbBimb9SVnnbGcf+R1TnHOOy/+5sYvnMyEos1+/mcM6k06H30y+rgU/nhrzD2RPcJqlNzpaQ=
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] golang: Regen binding
Date: Mon,  5 Feb 2024 16:53:31 +0000
Message-Id: <20240205165331.18627-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 024e7131be5c ("tools: don't expose XENFEAT_hvm_pirqs by default")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/helpers.gen.go | 6 ++++++
 tools/golang/xenlight/types.gen.go   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 35e209ff1b..0f8e23773c 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1280,6 +1280,9 @@ return fmt.Errorf("converting field Rdm: %v", err)
 }
 x.RdmMemBoundaryMemkb = uint64(tmp.rdm_mem_boundary_memkb)
 x.McaCaps = uint64(tmp.mca_caps)
+if err := x.Pirq.fromC(&tmp.pirq);err != nil {
+return fmt.Errorf("converting field Pirq: %v", err)
+}
 return nil
 }
 
@@ -1613,6 +1616,9 @@ return fmt.Errorf("converting field Rdm: %v", err)
 }
 hvm.rdm_mem_boundary_memkb = C.uint64_t(tmp.RdmMemBoundaryMemkb)
 hvm.mca_caps = C.uint64_t(tmp.McaCaps)
+if err := tmp.Pirq.toC(&hvm.pirq); err != nil {
+return fmt.Errorf("converting field Pirq: %v", err)
+}
 hvmBytes := C.GoBytes(unsafe.Pointer(&hvm),C.sizeof_libxl_domain_build_info_type_union_hvm)
 copy(xc.u[:],hvmBytes)
 case DomainTypePv:
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 7907aa8999..9c8b7b81f6 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -651,6 +651,7 @@ SerialList StringList
 Rdm RdmReserve
 RdmMemBoundaryMemkb uint64
 McaCaps uint64
+Pirq Defbool
 }
 
 func (x DomainBuildInfoTypeUnionHvm) isDomainBuildInfoTypeUnion(){}
-- 
Anthony PERARD


