Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691CA126EE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 16:09:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872713.1283696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY515-0005MJ-De; Wed, 15 Jan 2025 15:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872713.1283696; Wed, 15 Jan 2025 15:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY515-0005JQ-AU; Wed, 15 Jan 2025 15:09:11 +0000
Received: by outflank-mailman (input) for mailman id 872713;
 Wed, 15 Jan 2025 15:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o+i=UH=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tY514-0005JK-16
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 15:09:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aae0f255-d352-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 16:09:08 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436202dd730so49161075e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 07:09:08 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74d8e06sm26718535e9.31.2025.01.15.07.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 07:09:06 -0800 (PST)
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
X-Inumbo-ID: aae0f255-d352-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736953747; x=1737558547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FM1nUjDiePbUjnEKMcMFCsNEpDocEMi4X6ouoLCy73c=;
        b=k5twQMaOiqOUe/ZjdhWgj2d+Zn49JFA7B+PlK0XT3IyIRrlLLOnfgnV9mWfYiEMTj8
         /u0XAPC2A8ylg9ApRhouohQdXApN3pk0eNLnqHdF57zehgz/0xqBB9sLjLsgSWtyuomf
         YpB0nCLFjSM1LkR14kyKklPB4qTcBkjfJCac4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953747; x=1737558547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FM1nUjDiePbUjnEKMcMFCsNEpDocEMi4X6ouoLCy73c=;
        b=Ako9+nFe2b+kpG1F3NWwQd0Vxf4a/QF38U638OZKNXd+y4jcJQB8R/VHiVZeWgvjVt
         DHJTmE0b4ViM/MykGJ8X142KVva14VIydzFpPVnn+pH7Dksad9v6Nfk6EMsOse/MTf9h
         Mz816YD0OWD9gAzrfN8jZ+z1vdEtS2+D5YMu2hqx6KZ3BoorgYckgNqrhUEBAT6mTMHv
         vgIDQvmn7zW49/klJ0PmqmHUPXqZI2D3MHlaYkjPLvFRWPfZxUretOJTsCtAC5LDgn6f
         qsjj2mfwxf9NvxBUbfGwCN7Nzu1uPMfWCs7c8n5y3L7qSr7f6xq+IZQndu5yzIfhoPj/
         zw/A==
X-Gm-Message-State: AOJu0Yx45wgNIwhz6PnwwTaaIlWFVHG06VxCrbdss5BBHlii8rEUhPe1
	a+B/yvqMhCRKCILWie7UCx2vwkarn+Ow8FDeLdCaXxIwuz1mJ9QPgYMGnVUHHc0r0jSjHjBO7Qq
	JimEOWA==
X-Gm-Gg: ASbGncsJWvwWXcRoEmOAxdLp0MZxQkbapjhta/TsPR3OUskPqJSmNUaBFEnQ6HDPfUX
	HkmfN/WtZqE6qI157kowbvWZNTQipA5iatzHD3Ie6Da4VzJZz9F4vEPIYlKzUmXq65GOVYT9pDx
	4XhAFDsisOCTFq9ofW3Bqdf3k9ANCYfgj5XfLE6aK461uKorK+fVdA7bs8v0atp0JqT3NjP8ygm
	eMty7VX5g/+5jUSAGcrDkQjs5U+uZUBXTK6M9HMzX7u1IyrqEx3NHvrGi0UUQ==
X-Google-Smtp-Source: AGHT+IEWf3YrPFwQJP4KWvTSkEMRT7ziqadr9R1A2EpqwHuPg747bX7FzrNPeP4dc5Pi6K8sxIPFXA==
X-Received: by 2002:a05:600c:4586:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-436e26f4b91mr233179465e9.25.1736953747285;
        Wed, 15 Jan 2025 07:09:07 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs/misc: Fix a few typos
Date: Wed, 15 Jan 2025 16:09:04 +0100
Message-ID: <5ab7cdad0c275dc2de900568ae3105be60f32db5.1736953714.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While skimming through the misc docs, I spotted a few typos.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 docs/misc/livepatch.pandoc            |  8 ++++----
 docs/misc/netif-staging-grants.pandoc | 10 +++++-----
 docs/misc/printk-formats.txt          |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/misc/livepatch.pandoc b/docs/misc/livepatch.pandoc
index 43010227e5..cbd63d0af8 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -539,13 +539,13 @@ The type definition of the function are as follow:
 ### .livepatch.xen_depends, .livepatch.depends and .note.gnu.build-id
 
 To support dependencies checking and safe loading (to load the
-appropiate payload against the right hypervisor) there is a need
-to embbed an build-id dependency.
+appropriate payload against the right hypervisor) there is a need
+to embed a build-id dependency.
 
 This is done by the payload containing sections `.livepatch.xen_depends`
 and `.livepatch.depends` which follow the format of an ELF Note.
 The contents of these (name, and description) are specific to the linker
-utilized to build the hypevisor and payload.
+utilized to build the hypervisor and payload.
 
 If GNU linker is used then the name is `GNU` and the description
 is a NT_GNU_BUILD_ID type ID. The description can be an SHA1
@@ -639,7 +639,7 @@ The `name` could be an UUID that stays fixed forever for a given
 payload. It can be embedded into the ELF payload at creation time
 and extracted by tools.
 
-The return value is zero if the payload was succesfully uploaded.
+The return value is zero if the payload was successfully uploaded.
 Otherwise an -XEN_EXX return value is provided. Duplicate `name` are not supported.
 
 The `payload` is the ELF payload as mentioned in the `Payload format` section.
diff --git a/docs/misc/netif-staging-grants.pandoc b/docs/misc/netif-staging-grants.pandoc
index cb33028adc..d7ef4db63a 100644
--- a/docs/misc/netif-staging-grants.pandoc
+++ b/docs/misc/netif-staging-grants.pandoc
@@ -317,7 +317,7 @@ In essence the steps for receiving of a packet in a Linux frontend is as
  process the actual like the steps below. This thread has the purpose of
  aggregating as much copies as possible.]
 
-2) Checks if there are enough rx ring slots that can accomodate the packet.
+2) Checks if there are enough rx ring slots that can accommodate the packet.
 
 3) Gets a request from the ring for the first data slot and fetches the `gref`
    from it.
@@ -375,7 +375,7 @@ In essence the steps for receiving of a packet in a Linux frontend is as
 
 24) Call packet into the network stack.
 
-25) Allocate new pages and any necessary packet metadata strutures to new
+25) Allocate new pages and any necessary packet metadata structures to new
     requests. These requests will then be used in step 1) and so forth.
 
 26) Update the request producer index (`req_prod`)
@@ -391,7 +391,7 @@ In essence the steps for receiving of a packet in a Linux frontend is as
 
 This proposal aims at replacing step 4), 12) and  22) with memcpy if the
 grefs on the Rx ring were requested to be mapped by the guest. Frontend may use
-strategies to allow fast recycling of grants for replinishing the ring,
+strategies to allow fast recycling of grants for replenishing the ring,
 hence letting Domain-0 replace the grant copies with  memcpy instead, which is
 faster.
 
@@ -400,8 +400,8 @@ would need to aggregate as much as grant ops as possible (step 1) and could
 transmit the packet on the transmit function (e.g. Linux ```ndo_start_xmit```)
 as previously proposed
 here\[[0](http://lists.xenproject.org/archives/html/xen-devel/2015-05/msg01504.html)\].
-This would heavily improve efficiency specifially for smaller packets. Which in
-return would decrease RTT, having data being acknoledged much quicker.
+This would heavily improve efficiency specifically for smaller packets. Which in
+return would decrease RTT, having data being acknowledged much quicker.
 
 \clearpage
 
diff --git a/docs/misc/printk-formats.txt b/docs/misc/printk-formats.txt
index 8f666f696a..ce32829dae 100644
--- a/docs/misc/printk-formats.txt
+++ b/docs/misc/printk-formats.txt
@@ -11,7 +11,7 @@ Raw buffer as hex string:
        %*phN   000102 ... 3f
 
        Up to 64 characters.  Buffer length expected via the field_width
-       paramter. i.e. printk("%*ph", 8, buffer);
+       parameter. i.e. printk("%*ph", 8, buffer);
 
 Bitmaps (e.g. cpumask/nodemask):
 
-- 
2.43.0


