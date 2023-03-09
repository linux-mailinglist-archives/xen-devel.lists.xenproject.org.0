Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34146B1EAF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508183.782560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBzY-00074x-WE; Thu, 09 Mar 2023 08:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508183.782560; Thu, 09 Mar 2023 08:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBzY-00072m-T0; Thu, 09 Mar 2023 08:51:16 +0000
Received: by outflank-mailman (input) for mailman id 508183;
 Thu, 09 Mar 2023 08:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFGn=7B=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1paBzX-0006nh-49
 for xen-devel@lists.xen.org; Thu, 09 Mar 2023 08:51:15 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bb1fc1b-be57-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 09:51:14 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id h8so1235545plf.10
 for <xen-devel@lists.xen.org>; Thu, 09 Mar 2023 00:51:14 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 kt16-20020a170903089000b0019a7385079esm11058153plb.123.2023.03.09.00.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:12 -0800 (PST)
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
X-Inumbo-ID: 8bb1fc1b-be57-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETLRpO4UaRJv+Jq2cQ1jDXzLWWERHBPOjdPoPBs2HQY=;
        b=kaY7yb4BgtrBRVTJaGL5YIn9l8IoTa4lyVgMiGE+LSI7rvLuSg3awOMLMnJLOKt+lH
         W6d6qR1BZdYIAWI86ipKF6SAvHJt12FDfZXzQex6uuHUqOU7GSMF4kJO+V+fxbDxpS9X
         1dJ3CqLWQIk1MgmIX8taEexVVxGkBm/1PAv3hF+VF4Dlx80Hf3qHflMdy/POb2dqLAQn
         i69WPePj9IV5csX+pp+JjQj9I7BQIWVsygdYSUfiVRefrtYWhnYRgXKGdJIOd+6SyfKz
         C27SGThUJCnUOCTvUfZydDQw+hvdAW4FM7Ke9ONCK8itnaWY98VCIDjqH3mAa3AaK+0A
         026g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETLRpO4UaRJv+Jq2cQ1jDXzLWWERHBPOjdPoPBs2HQY=;
        b=bb3Ui6ubpIkJokpN6QE8HXIdtxxjChW9KclDwjhshlHb7LdXwIgPMpi6s2/EXozJIk
         ESwX86wVecZTO9bbZ9bra9MXMuSPHh19IpI730w0ZB4gxhBMM0JVcz3gx+CEiJ4U2kYn
         wdSv6Kmb7O6SOw2gVlqibJWLisZFobkM+/ptdtAE95qhSrAOOG//kpp6dENGSJq1g+Yg
         UEcP+4n4umfm/XZ5t3VoRLnfd9DouPbhFtghqo2geAlkoFNc2HbhA8vMFz4eApKpOXfH
         4esuYwY3xTeU85CabOQ7RZbO6wA4yFVM7pO/EWnNn7Vu7ll+SI7MoGID7ASNSQr0rqlS
         4aXA==
X-Gm-Message-State: AO0yUKXkf/dFMCCcOZeuqINOm5b700xOPyJDPoWK1Vs5jxouKwtfxVsj
	YBFEZKTKEX4VYmt5qB+92VMA1g==
X-Google-Smtp-Source: AK7set/6Djb1zMP9YhPTkWppkZDJ0L3CO0duyd+NyeHjm4Zil4YeTAqUaIBzL/6AzT6fjqaHkZW0kA==
X-Received: by 2002:a17:902:c14c:b0:19d:74c:78e4 with SMTP id 12-20020a170902c14c00b0019d074c78e4mr18866811plj.55.1678351872801;
        Thu, 09 Mar 2023 00:51:12 -0800 (PST)
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
Subject: [PATCH V3 2/2] docs: vhost-user: Add Xen specific memory mapping support
Date: Thu,  9 Mar 2023 14:21:01 +0530
Message-Id: <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current model of memory mapping at the back-end works fine where a
standard call to mmap() (for the respective file descriptor) is enough
before the front-end can start accessing the guest memory.

There are other complex cases though where the back-end needs more
information and simple mmap() isn't enough. For example Xen, a type-1
hypervisor, currently supports memory mapping via two different methods,
foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
both these cases, the back-end needs to call mmap() and ioctl(), with
extra information like the Xen domain-id of the guest whose memory we
are trying to map.

Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
the back-end know about the additional memory mapping requirements.
When this feature is negotiated, the front-end will send the additional
information within the memory regions themselves.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 1720d681264d..5a070adbc1aa 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -145,6 +145,26 @@ Memory region description
 
 :mmap offset: 64-bit offset where region starts in the mapped memory
 
+When the ``VHOST_USER_PROTOCOL_F_XEN_MMAP`` protocol feature has been
+successfully negotiated, the memory region description contains two extra
+fields at the end.
+
++---------------+------+--------------+-------------+----------------+-------+
+| guest address | size | user address | mmap offset | xen mmap flags | domid |
++---------------+------+--------------+-------------+----------------+-------+
+
+:xen mmap flags: 32-bit bit field
+
+- Bit 0 is set for Xen foreign memory mapping.
+- Bit 1 is set for Xen grant memory mapping.
+- Bit 8 is set if the memory region can not be mapped in advance, and memory
+  areas within this region must be mapped / unmapped only when required by the
+  back-end. The back-end shouldn't try to map the entire region at once, as the
+  front-end may not allow it. The back-end should rather map only the required
+  amount of memory at once and unmap it after it is used.
+
+:domid: a 32-bit Xen hypervisor specific domain id.
+
 Single memory region description
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -864,6 +884,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_XEN_MMAP             17
 
 Front-end message types
 -----------------------
-- 
2.31.1.272.g89b43f80a514


