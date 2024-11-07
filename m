Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A89C08C2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 15:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831840.1247219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93NQ-0006HZ-Q0; Thu, 07 Nov 2024 14:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831840.1247219; Thu, 07 Nov 2024 14:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93NQ-0006EP-My; Thu, 07 Nov 2024 14:20:48 +0000
Received: by outflank-mailman (input) for mailman id 831840;
 Thu, 07 Nov 2024 14:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mm4d=SC=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t93NP-0006EJ-38
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 14:20:47 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77d29b94-9d13-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 15:20:41 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so392037766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 06:20:41 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a18539sm101346366b.27.2024.11.07.06.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 06:20:38 -0800 (PST)
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
X-Inumbo-ID: 77d29b94-9d13-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc3ZDI5Yjk0LTlkMTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTg5MjQxLjM2NTU3OSwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730989240; x=1731594040; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/U9+72wMeDNxXeJVAep/L+/jFQ+DgDjK+lqlpXNaNg=;
        b=JsV4pLRNuF/oW3ygYZEY4qvJlaWrPrTO+8OIysA2+vdzqlK52cMTNYxwAruyym4CSE
         Mc5F9qzacfvhpcTZo5jiC+VDZnly66G8+qiTnOw4Ul8gjo+hbZlqEq4tlogpGnGyWL00
         YCS+KkDrU8h7GYeDjsn5s5rEX1GLKX90w4uUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989240; x=1731594040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/U9+72wMeDNxXeJVAep/L+/jFQ+DgDjK+lqlpXNaNg=;
        b=nxcMRxy3i2ES3S5stphJyTDYBeR85Vcl1HbOVu+bLXxGCQFbS6vvaIeN1MQc3PwXTO
         UBLlliiXAD8hnqu1zeTUXHxvLAACW13oPfU9iZtWoJ0gdtYnptwhYSmzEivfEWol9oYD
         QbW++F2OWn54eLu1iRfOggF1U58dCDyUlcSo/jFa3PwIKzOK9qmJwiBx/LWD7G+kQhzU
         9QhylGSDNEirmH18aAHBmbMSMrLYoP7KBMnsdJsA9qlrulQdbbBFlOn1SauzwANrJnjJ
         T/1z+3PolijfMSYb1e+zbwKbAgx1Im6N0dideqp7RfbjlArXlce/U+gntUwWLyq8xIzS
         3kvA==
X-Gm-Message-State: AOJu0Yzu/w5WMBJ7ruOVIq+2XvqkIBgSOj3L8l4EU6fZFSvqBZGHoYdB
	kOjzk5TUGOrZC8fXXwyMKPkDa7Jk5fN1Ii3X8G0WzSW3Vib5Xn6xK8fnYVGXNMmQt5LSUvlKg3U
	6RBo=
X-Google-Smtp-Source: AGHT+IEU6eVutiiVjD49o1Wr6cLP7PRKeraQQD66Z4rsPHFohI0Dx78LUHcYbdOv4Eg4+qdX8/yL5g==
X-Received: by 2002:a17:907:7b8e:b0:a99:ee26:f416 with SMTP id a640c23a62f3a-a9eeb0f94ffmr13039166b.14.1730989239080;
        Thu, 07 Nov 2024 06:20:39 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Victor Lira <victorm.lira@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Javi Merino <javi.merino@cloud.com>
Subject: [TEST_ARTIFACTS PATCH v1] scripts: add lzo to the x86_64 alpine rootfs
Date: Thu,  7 Nov 2024 14:19:33 +0000
Message-ID: <20241107142012.2593333-1-javi.merino@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the qemu-alpine-x86_64-gcc test, we want to test libxenguest built
with all libraries.  If we add lzo-dev to the alpine:3.18 container,
libxenguest is linked against it.  However, as the initrd in the
test-artifacts does not contain lzo, the qemu-alpine-x86_64-gcc gitlab
CI job fails with:

  + bash /etc/init.d/xencommons start
  Starting /usr/local/sbin/xenstored...
  /etc/xen/scripts/launch-xenstore: line 90: echo: write error: Invalid argument
  Setting domain 0 name, domid and JSON config...
  Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
  Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
  Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
  Starting xenconsoled...
  Starting QEMU as disk backend for dom0
  + xl list
  Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
  Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
  Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
  + xl create -c /root/test.cfg
  Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
  Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
  Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
   *   Execution of "/etc/local.d/xen.start" failed.

Add lzo to the initrd that becomes the rootfs to install liblzo2.so.2 .

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

Tested in https://gitlab.com/xen-project/people/javimerino/test-artifacts/-/jobs/8295092924

 scripts/x86_64-rootfs-alpine.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
index 28d8e30d8eac..f8b04c52f82e 100755
--- a/scripts/x86_64-rootfs-alpine.sh
+++ b/scripts/x86_64-rootfs-alpine.sh
@@ -12,6 +12,7 @@ apk add dbus
 apk add bash
 apk add python3
 apk add zlib
+apk add lzo
 apk add ncurses
 apk add yajl
 apk add libaio
-- 
2.47.0


