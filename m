Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC26B1EAB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508184.782567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBzZ-0007D7-A0; Thu, 09 Mar 2023 08:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508184.782567; Thu, 09 Mar 2023 08:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBzZ-00075F-6T; Thu, 09 Mar 2023 08:51:17 +0000
Received: by outflank-mailman (input) for mailman id 508184;
 Thu, 09 Mar 2023 08:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFGn=7B=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1paBzY-0006zN-Gz
 for xen-devel@lists.xen.org; Thu, 09 Mar 2023 08:51:16 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a139105-be57-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 09:51:12 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id bo22so1450936pjb.4
 for <xen-devel@lists.xen.org>; Thu, 09 Mar 2023 00:51:11 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 v18-20020aa78092000000b00597caf6236esm10571382pff.150.2023.03.09.00.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:09 -0800 (PST)
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
X-Inumbo-ID: 8a139105-be57-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i0w9WqIL9ZPbYW/Yv5TskuJR8MxXHPruOqgSTtE0fY=;
        b=iItvA+MzNT8mtvCs1pj16AOETtyxbqTr+dOV2gyWwiGrlDOUIbmxTiVtMssA8AGSe0
         ssXoV06reFUqYX2L4ZPPv+dz1lqMKrTx/PmWKAVmXdGbnIPKewkh+WMrQqAfgB2QnUmE
         6pce2D05X0M5Rm2lNGjZv2+sO2UvA6ycCKlOZAoJ7oKmBRYWtg8+kWW4FNwwe9mg6PdC
         LrPJ7WaEqhbB1p9bzfp1xqEVNvIMjvFwn0LyF53RZDubZ8foPyhpJUEygKc8wzSNPnj6
         pJJ4ZeIPwh9sx//Y+qpgWODeO8siuMaVzploDGKCpQBmmMn0zcZb5j2UYyaA7qG3sx61
         VU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+i0w9WqIL9ZPbYW/Yv5TskuJR8MxXHPruOqgSTtE0fY=;
        b=PlwDVkniaDhtkY5cAsRakc9LlX3XzHPwLjGEt7uSt3SMJuzwTRI1C63jVxRQDKJAoR
         1bRYyFgpMBZKozsOIvcqfJ0DmfDlFlrVccBqlofBMu/KSrmIASX2BiSE6a1E6+WtvT4a
         H2Q7jZQ0Dv5C06gRF/m8SoeVfUJFvNX2JUnYDYryd7Qw3HgvJSRf/YMDgcVwEZlgIv+J
         DoPUUgjtUeNz1KInA+LOmUJm+WTRql5UcLWSNYL0JSI2vbMI/ohxNmQkBWz8/KiSyOWq
         3AgQsXHXUJzu7sboWISkLv1PERtSmcvAwybV2DBSfatHrShaPW4uPpUqlyjlQbIFiMuG
         EOzQ==
X-Gm-Message-State: AO0yUKXg8m2hftUWbacbiJwOeXPWOnEUZH3pbtWnBgbk0lmOrXJLdRz3
	RBaMWmUskd4/h1SSG4VeLSmWCQ==
X-Google-Smtp-Source: AK7set8ftWQHv1D5/0RoFpnuh7BmT9reUnqkwdpkJf4bmvLnd2t//tccurlO9OTQd3vpqPWi5PediQ==
X-Received: by 2002:a05:6a20:6a9e:b0:cc:f047:afaf with SMTP id bi30-20020a056a206a9e00b000ccf047afafmr18297962pzb.11.1678351869994;
        Thu, 09 Mar 2023 00:51:09 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
	virtio-dev@lists.oasis-open.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH V3 1/2] docs: vhost-user: Define memory region separately
Date: Thu,  9 Mar 2023 14:21:00 +0530
Message-Id: <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The same layout is defined twice, once in "single memory region
description" and then in "memory regions description".

Separate out details of memory region from these two and reuse the same
definition later on.

While at it, also rename "memory regions description" to "multiple
memory regions description", to avoid potential confusion around similar
names. And define single region before multiple ones.

This is just a documentation optimization, the protocol remains the same.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 8a5924ea75ab..1720d681264d 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -130,18 +130,8 @@ A vring address description
 Note that a ring address is an IOVA if ``VIRTIO_F_IOMMU_PLATFORM`` has
 been negotiated. Otherwise it is a user address.
 
-Memory regions description
-^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-+-------------+---------+---------+-----+---------+
-| num regions | padding | region0 | ... | region7 |
-+-------------+---------+---------+-----+---------+
-
-:num regions: a 32-bit number of regions
-
-:padding: 32-bit
-
-A region is:
+Memory region description
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 +---------------+------+--------------+-------------+
 | guest address | size | user address | mmap offset |
@@ -158,19 +148,26 @@ Memory regions description
 Single memory region description
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-+---------+---------------+------+--------------+-------------+
-| padding | guest address | size | user address | mmap offset |
-+---------+---------------+------+--------------+-------------+
++---------+--------+
+| padding | region |
++---------+--------+
 
 :padding: 64-bit
 
-:guest address: a 64-bit guest address of the region
+A region is represented by Memory region description.
 
-:size: a 64-bit size
+Multiple Memory regions description
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-:user address: a 64-bit user address
++-------------+---------+---------+-----+---------+
+| num regions | padding | region0 | ... | region7 |
++-------------+---------+---------+-----+---------+
 
-:mmap offset: 64-bit offset where region starts in the mapped memory
+:num regions: a 32-bit number of regions
+
+:padding: 32-bit
+
+A region is represented by Memory region description.
 
 Log description
 ^^^^^^^^^^^^^^^
@@ -952,8 +949,8 @@ Front-end message types
 ``VHOST_USER_SET_MEM_TABLE``
   :id: 5
   :equivalent ioctl: ``VHOST_SET_MEM_TABLE``
-  :request payload: memory regions description
-  :reply payload: (postcopy only) memory regions description
+  :request payload: multiple memory regions description
+  :reply payload: (postcopy only) multiple memory regions description
 
   Sets the memory map regions on the back-end so it can translate the
   vring addresses. In the ancillary data there is an array of file
-- 
2.31.1.272.g89b43f80a514


