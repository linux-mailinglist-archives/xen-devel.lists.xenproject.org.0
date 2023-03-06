Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AAA6ABDDF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 12:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506912.780128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8jq-0002l0-1W; Mon, 06 Mar 2023 11:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506912.780128; Mon, 06 Mar 2023 11:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8jp-0002hv-UM; Mon, 06 Mar 2023 11:10:41 +0000
Received: by outflank-mailman (input) for mailman id 506912;
 Mon, 06 Mar 2023 11:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOCg=66=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pZ8jo-0002hn-91
 for xen-devel@lists.xen.org; Mon, 06 Mar 2023 11:10:40 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 841a6e02-bc0f-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 12:10:36 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id y11so9899240plg.1
 for <xen-devel@lists.xen.org>; Mon, 06 Mar 2023 03:10:35 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 ke13-20020a170903340d00b0019ea9e5815bsm4457935plb.45.2023.03.06.03.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 03:10:33 -0800 (PST)
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
X-Inumbo-ID: 841a6e02-bc0f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678101034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzt81DQlpQsWvSvVQpEytEsQpJe9zI8mvbr2m91fVZY=;
        b=KkADiyumUMwnMwSZagTAmvDoqMmGCkviqQ5W3Ewa+3JcciWXtrok3LZkOQpgRqaWN8
         iIraLBPdCrkwyfvvxTfFWrMD07MuMxJtjKz1BdtSHYJjAASZUi+LNNR8UHlYM772k1Xl
         RTyo+wE8i4TbHbQVvuW9wwSRWTQWvdQMKB9oMvQVba+RPf18ATxFLtn/K0H5L8izMZsH
         solmldOc/veuoYtEIY84nID8jNwgdBcj7JlCmIRn5YFhnyLHrCIGn6zU+UaMDrgOBhYW
         xkluFP3sUtX1hyDtiqhgUKPV7wQ+Quody+t3OAoNMG6vOR8/9RjgiU9E/Jm1Wcrwgk04
         52VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678101034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzt81DQlpQsWvSvVQpEytEsQpJe9zI8mvbr2m91fVZY=;
        b=EsQVTgRo6Kwfao5b0cTgJMS6uwI76ztAbYBIUV0AWiy/48RqVNGcmzDt8GSHbikJYS
         AR+LWZILG/B4pQHqPDVKyB5YYZdlus8mtfLRzCtrj/0gv191VYa44pMXBsvVXdZ7CvKF
         rCApTa1+2L1akTo+iWYF3IIQNu1FttauDfVcCZG0uGGYp//qbVnv+Y7HofbBLpuYdyrD
         xc7QrufCKoa1DSqi0CRPCX3zBgLVSiYT+hAqwMH7naesiAIlf8LmohInMYnU7rFpyKm0
         dKpfWm5kgE2ve/YoJYaQwIlnMMMAYQ/Kuwp+qoV7NX/j1x7D0bV4BnDJhtZFKC7jomGx
         3IRg==
X-Gm-Message-State: AO0yUKVBZt12ICpO5OTHNXNHhtk55JvosfqeZqYXqDQYhCw8IvRxdrWh
	72K+3InAeRk9pnBIiI8A2aCGbw==
X-Google-Smtp-Source: AK7set9qaeII3L0WNlhjuyVZJGmfT1j/fje0bHum91rfnikT0gw6CnQ7u6ibmUuIG2PFTWVIbPGn4A==
X-Received: by 2002:a17:903:18e:b0:19a:75b8:f4ff with SMTP id z14-20020a170903018e00b0019a75b8f4ffmr13424289plg.35.1678101033802;
        Mon, 06 Mar 2023 03:10:33 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
	virtio-dev@lists.oasis-open.org,
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
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH V2] docs: vhost-user: Add Xen specific memory mapping support
Date: Mon,  6 Mar 2023 16:40:24 +0530
Message-Id: <7c3c120bcf2cf023e873800fd3f55239dd302e38.1678100850.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current model of memory mapping at the back-end works fine where a
standard call to mmap() (for the respective file descriptor) is enough
before the front-end can start accessing the guest memory.

There are other complex cases though where the back-end needs more
information and simple mmap() isn't enough. For example Xen, a type-1
hypervisor, currently supports memory mapping via two different methods,
foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
both these cases, the back-end needs to call mmap() and ioctl(), and
need to pass extra information via the ioctl(), like the Xen domain-id
of the guest whose memory we are trying to map.

Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
the back-end know about the additional memory mapping requirements.
When this feature is negotiated, the front-end can send the
'VHOST_USER_SET_XEN_MMAP' message type to provide the additional
information to the back-end.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
- Make the custom mmap feature Xen specific, instead of being generic.
- Clearly define which memory regions are impacted by this change.
- Allow VHOST_USER_SET_XEN_MMAP to be called multiple times.
- Additional Bit(2) property in flags.

 docs/interop/vhost-user.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424eb0..8be5f5eae941 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -258,6 +258,24 @@ Inflight description
 
 :queue size: a 16-bit size of virtqueues
 
+Xen mmap description
+^^^^^^^^^^^^^^^^^^^^
+
++-------+-------+
+| flags | domid |
++-------+-------+
+
+:flags: 64-bit bit field
+
+- Bit 0 is set for Xen foreign memory memory mapping.
+- Bit 1 is set for Xen grant memory memory mapping.
+- Bit 2 is set if the back-end can directly map additional memory (like
+  descriptor buffers or indirect descriptors, which aren't part of already
+  shared memory regions) without the need of front-end sending an additional
+  memory region first.
+
+:domid: a 64-bit Xen hypervisor specific domain id.
+
 C structure
 -----------
 
@@ -867,6 +885,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_XEN_MMAP             17
 
 Front-end message types
 -----------------------
@@ -1422,6 +1441,23 @@ Front-end message types
   query the back-end for its device status as defined in the Virtio
   specification.
 
+``VHOST_USER_SET_XEN_MMAP``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: Xen mmap description
+  :reply payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_XEN_MMAP`` protocol feature has been
+  successfully negotiated, this message is submitted by the front-end to set the
+  Xen hypervisor specific memory mapping configurations at the back-end.  These
+  configurations should be used to mmap memory regions, virtqueues, descriptors
+  and descriptor buffers. The front-end must send this message before any
+  memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_TABLE`` or
+  ``VHOST_USER_ADD_MEM_REG`` message types. The front-end can send this message
+  multiple times, if different mmap configurations are required for different
+  memory regions, where the most recent ``VHOST_USER_SET_XEN_MMAP`` must be used
+  by the back-end to map any newly shared memory regions.
+
 
 Back-end message types
 ----------------------
-- 
2.31.1.272.g89b43f80a514


