Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB69A5065
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 21:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822661.1236619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2En9-00077a-JM; Sat, 19 Oct 2024 19:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822661.1236619; Sat, 19 Oct 2024 19:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2En9-00075a-Gh; Sat, 19 Oct 2024 19:07:11 +0000
Received: by outflank-mailman (input) for mailman id 822661;
 Sat, 19 Oct 2024 19:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jKr=RP=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1t2En8-00075U-ON
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 19:07:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 569610ab-8e4d-11ef-a0be-8be0dac302b0;
 Sat, 19 Oct 2024 21:07:09 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43155afca99so23370475e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 19 Oct 2024 12:07:09 -0700 (PDT)
Received: from localhost.localdomain ([91.85.47.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc88esm1928725e9.46.2024.10.19.12.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 12:07:07 -0700 (PDT)
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
X-Inumbo-ID: 569610ab-8e4d-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729364828; x=1729969628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k2G4BWrXzsillw6CXWZmHKEYScfoF2QkPHpWYHr5Z0I=;
        b=LlK1jR1QhOX1EIKIhwsuDCvMqV/HzkLhY6J886CMltzGdTNTWXgpoCgElPrziVQbGN
         bkKd80A/vAOrUiVmMku+70I5+cBV556uHajwUmRUVNlIH2lQMCqLHDfodfxxahNuWceS
         fQc60DCzlfPxGIUh3vmFVl/LIFn7qn36MuXIzbdfBYf6NPxU0PlegJyusHDaCmudJ5EZ
         TPor9oyMnwyuXmriGZnW+pq5H92hsJL+Ij+hIRSJFm6tjYHxKq/r7wiNIYm3oq+qxZjq
         DsDo4Np/uuIUyevGfaeISOvbtEivC7jOjVGId0ho6ue30qiDWMJUBUnSWQwFdKIy3IYM
         MVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729364828; x=1729969628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2G4BWrXzsillw6CXWZmHKEYScfoF2QkPHpWYHr5Z0I=;
        b=RFIA51yBYoD8BByP/uGMsHP70PaBNtec00/HhOl81OgTV2J1pntSKa94yfr+LkhRWI
         3lYSvQWP/95E8VeSAurrD1/l+5QTl0nwgKPwo4oMtYOAIdltE8O4V63RgyBTZOEEaeaZ
         nvRyroIHy7tmXzphbi8fEnQM+OnIDjs8o4gHeJJBmpPA1hQp9Cmed/zuLuPZTnLROoKe
         Nwo65Hl+ZGBtuUoGfFGjYW6BlVVZEnimReUruQf1N3spUGyjIn+IY+qFK24sOKUQ1t6N
         6GQ76XyhOehXmZVHG7XKT8mt18NmPlyONTUWPVunNlzAuttDF8jWcS7cWxhQetji16Pu
         VjNA==
X-Gm-Message-State: AOJu0YwUzc5j+ylahEJoK2WWk+PJT7dtMLVjylSQuhaphC59r/HHR0u2
	Q9QCdGLYbtNHAS7pXvwXukyCjmy32G3DfKIR7yjD6vpppuW8mJXeOUFhwyfdhLnaCw==
X-Google-Smtp-Source: AGHT+IEOAZgCBoX9AeTfNTe3zz9ZBzg7/QsmiCfhszUg+GNVAKqIN3ebVrhP6U4YDZ8ibGhXfAcRzg==
X-Received: by 2002:a05:600c:4ed2:b0:431:57cf:f13d with SMTP id 5b1f17b1804b1-4316161dcc1mr41128045e9.3.1729364827750;
        Sat, 19 Oct 2024 12:07:07 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Rich Persaud <persaur@gmail.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	openxt@googlegroups.com
Subject: [PATCH] SUPPORT.md: Argo: Upgrade status to Tech Preview
Date: Sat, 19 Oct 2024 20:06:52 +0100
Message-Id: <20241019190652.21559-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent patches to xen-devel indicate active interest in Argo within the Xen
community, and as the feature has been documented and in use by
OpenXT for multiple years, update the Xen SUPPORT.md statement of status.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 SUPPORT.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 23dd7e6424..4f56094356 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -848,7 +848,7 @@ This feature is not security supported: see https://xenbits.xen.org/xsa/advisory
 
 ### Argo: Inter-domain message delivery by hypercall
 
-    Status: Experimental
+    Status: Tech Preview
 
 ### x86/PCI Device Passthrough
 
-- 
2.25.1


