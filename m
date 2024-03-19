Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE005880062
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695441.1085181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbBo-0005V7-Mi; Tue, 19 Mar 2024 15:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695441.1085181; Tue, 19 Mar 2024 15:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbBo-0005T5-Io; Tue, 19 Mar 2024 15:15:44 +0000
Received: by outflank-mailman (input) for mailman id 695441;
 Tue, 19 Mar 2024 15:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zn5i=KZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmbBn-0005Sx-4x
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:15:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c3c2958-e603-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 16:15:40 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41463132ab1so6988225e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:15:40 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 bw11-20020a0560001f8b00b0033e7a204dc7sm1958672wrb.32.2024.03.19.08.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 08:15:39 -0700 (PDT)
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
X-Inumbo-ID: 8c3c2958-e603-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710861340; x=1711466140; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BiG0UhNIs2usMao99OGoLhSPN2huqVq8x8SIKyBwiU=;
        b=GL0jX7AVAqe0drXeKotsOtZzgO89TA31UcxtdHzc/lmu9xnfY7kj9ILEJjH6UTA0v3
         tVHCDp12ksbEiGknped8aQsfr38OYB5WN86rm8Io7LGQ33DrHX3PD8k1VsvYcw9adIca
         eKDUtBUlar3ZdHYkQai2Ei/V035v2IdkwiD7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710861340; x=1711466140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BiG0UhNIs2usMao99OGoLhSPN2huqVq8x8SIKyBwiU=;
        b=mAtDqGzgAZPOA/GN8KUlK5Fa+eF1i3YfOgCwazUDjag0kKeI7GOGUCshXrBnoUylEo
         OWdMNPODWSKvKuMpw/YV08BjW99XUYDG2JB2OtiBYREf9XTkd0Ny32hAKxnMSidMnh/J
         89nngGfXa/syt0uLQJj3xihwDDwI7UFn335S14sUs0YGZlkiab2o2GN1nVRiXYndAPAN
         YlOjS9eVhP2XxRCU6Ff+/bVtzNqyjS3LF89X27XBI91xkTRshuGpupSPBaKxrM++dRWj
         HP7yxDUiEkQUld+V6mFuD5fqpta01qv/WlBZhXrHweb94CphSHf9R2cqCzTA8rSFXFlV
         jwPg==
X-Gm-Message-State: AOJu0YyGBwVQ6RuN0J/IS5YpZyQW/FF2/t81R9t5ljMJMpxQdPUGzwDz
	J44OzByeNlkq3D6mVjQI1v6otdLiUfyuhXsKNzfM89dSTLOK/okef6ZX//nZGvH2EOtoigCu9jp
	S
X-Google-Smtp-Source: AGHT+IFRuUeHTWVi5QdQLzXq7JuucKwHi/eLfywf0g3ysnSUEwEm3tp81Li9K/tBKQw1u8qchVortQ==
X-Received: by 2002:a05:600c:474c:b0:414:c42:e114 with SMTP id w12-20020a05600c474c00b004140c42e114mr5648183wmo.39.1710861340135;
        Tue, 19 Mar 2024 08:15:40 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] docs/parse-support-md: Handle BulletList
Date: Tue, 19 Mar 2024 15:15:09 +0000
Message-Id: <20240319151509.8937-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d638e304f13a introduced a bullet list, but parse-support-md
choke on it as it doesn't know what to do about it.

Introduce ri_BulletList() so that r_content() will find this new
function and call it instead of calling process_unknown().

Reported-by: Julien Grall <julien@xen.org>
Fixes: d638e304f13a ("SUPPORT.MD: Fix matrix generation after 43c416d0d819 and 77c39a53cf5b")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/parse-support-md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/parse-support-md b/docs/parse-support-md
index a397637639..b04f62da37 100755
--- a/docs/parse-support-md
+++ b/docs/parse-support-md
@@ -218,6 +218,13 @@ sub ri_DefinitionList {
     }
 }
 
+sub ri_BulletList {
+    # Assume a paragraph introduce this bullet list, which would mean that
+    # ri_Para() has already been called, and there's nothing else to do about
+    # the caveat.
+    return;
+}
+
 sub process_unknown {
     my ($c, $e) = @_;
     $had_unknown = Dumper($e);
-- 
Anthony PERARD


