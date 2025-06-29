Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCAAED396
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 06:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028767.1402510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW6Tu-0002ak-Ch; Mon, 30 Jun 2025 04:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028767.1402510; Mon, 30 Jun 2025 04:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW6Tu-0002Yn-A0; Mon, 30 Jun 2025 04:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1028767;
 Sun, 29 Jun 2025 20:42:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibX3=ZM=gmail.com=abinashlalotra@srs-se1.protection.inumbo.net>)
 id 1uVyrU-0007XF-Pc
 for xen-devel@lists.xenproject.org; Sun, 29 Jun 2025 20:42:52 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ea3c55f-5529-11f0-a312-13f23c93f187;
 Sun, 29 Jun 2025 22:42:50 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-748feca4a61so832940b3a.3
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jun 2025 13:42:50 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS..
 ([2401:4900:88e3:d68:d7d3:6fa0:fee9:8056])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e301f704sm6348327a12.18.2025.06.29.13.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:42:48 -0700 (PDT)
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
X-Inumbo-ID: 9ea3c55f-5529-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751229769; x=1751834569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DirJRH7MmziZYdVMjQqFRTAlkdP6s2rnfn3J0zzduXE=;
        b=kyo+W/dsCaQievwswDQ35wjiyYMzkfh0X5cZQZxYnZ5TxYChh1VQWFVtDk1x/eXnOm
         o7WEvjJlUVSydpBXFU/YZmEMj4uofVOvLKNx0JsSzq9tziTgQl3u7xd2PCMsiCrpVlHY
         gqaYXvvTHuw6k33jurafA7QWbAyvDGITpcE8+qVr3p9SnCnEtDxRaLG3cYP2IfSjC+ex
         QdMl8sPwMBoZ1xNoroplAeSv1U1ISJOlM6c6drFjAiTcEWdC82+jtDvh6wkCi9YLoAPT
         FAVrCOJDVk68lfGPvq9QlVVVeym/FX3W/ROhEAbVsxdexTk3PrhwJUx1LDNAePAF7G5b
         aLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751229769; x=1751834569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DirJRH7MmziZYdVMjQqFRTAlkdP6s2rnfn3J0zzduXE=;
        b=DWlYnY2CwLhFMu3IcXBd9oNw0NBLb6yhXbJvwSAHocK3fJWDh/ttEJIxAPMdvTb5mz
         KGMUwbcYGXU5k6cKjLFoHuMlykOqaRieE+g4QhCYUub1jzF0KI9CpZz5HXtuzZMpYBpU
         g5vXForyJONFa4rte3dpCe9SwYwVlADLncq8DIoAZEAE6SG+sgDcIO0dnbUoELpLDPxD
         DWlKqj61zxQcfei0O1C50zVu6TW5ZAxhPYzsqSZSMzvfpk9LCF+9qLrCrKQma4pzaLIH
         Wz55bGOdOOzowrMp+b/8hsejot1n19ouVIFNwRmP13F78qSqR97r/Qy7Vhoy33jxHLKI
         n1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXlKzX2xpYcMj5Dam1EgBtjuaRIbJwFv68bRaGlNl5Txmy6bPV9oAKUvhNnMor8yvB927EnV89hVqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrPHdSTFNDEhjH/3355Xetlo/h8dBHTC6wyeMywug4jHhPGsGX
	o0yNP/dcwYFZMRuZOOUOJuLXv9K78fWNTlWSYnRC9NIvDfnuQW0MpBOJ
X-Gm-Gg: ASbGncsDACN3FLzplzecBycuPbLAl1G0VErBw5BGz6cGVM9G14wZ9+x3lbjbJ6o/ugc
	57b+EduLTan6b9/EDhvbdGHAp8/raPnPw9yYKaRoVxZL0pezdu1i89ZyuvkSlN3t2+qDp/dNPdn
	nHlGNNZWS/XhRyEN/us+6GUO8ZJwbdyLzLB7fazcNdjKAgFnS3mukHdh+Dk5BaqnMdiQ4SS7vBG
	yTPXkHalDhZxXQzSY1DS8LTHxtFYJiRU9zU8Bn0DAYrTnuJijYeQ2tO7sshdgJowonJaiP9zFYT
	YNQ5kslWJbDv7DxQANzVdSsoD25pFlfSj2aoayZoOrCms0UIcYSH0vL/qzMlsijfLSt0RWECDMW
	oKm6qJqJqVYC8NKMrd58=
X-Google-Smtp-Source: AGHT+IE4jl+a6y/SeKsfFaCxOplJiF004IBZL8OwquCVNHRD2+gPLNctbva44/6kHL7gLJq8LE+UVg==
X-Received: by 2002:a05:6a20:3d08:b0:218:9b3e:e8bd with SMTP id adf61e73a8af0-220a12a662fmr16637049637.10.1751229768632;
        Sun, 29 Jun 2025 13:42:48 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically allocating gntdev_copy_batch
Date: Mon, 30 Jun 2025 02:12:15 +0530
Message-ID: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While building the kernel with LLVM, a warning was reported due to
excessive stack usage in `gntdev_ioctl`:

	drivers/xen/gntdev.c:991: warning: stack frame size (1160) exceeds limit (1024) in function 'gntdev_ioctl'

Further analysis revealed that the large stack frame was caused by
`struct gntdev_copy_batch`, which was declared on the stack inside
`gntdev_ioctl_grant_copy()`. Since this function was inlined into
`gntdev_ioctl`, the stack usage was attributed to the latter.

This patch fixes the issue by dynamically allocating `gntdev_copy_batch`
using `kmalloc()`, which significantly reduces the stack footprint and
eliminates the warning.

This approach is consistent with similar fixes upstream, such as:

commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selftest device struct")

Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
The stack usage was confirmed using the `-fstack-usage`  flag and mannual analysis, which showed:

  drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
  drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes

Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`, the total
frame size exceeded 1024 bytes, triggering the warning.

This patch addresses the warning and keeps stack usage within acceptable limits.
Is this patch fine or kmalloc may affect performance ?
---
 drivers/xen/gntdev.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 61faea1f0663..9811f3d7c87c 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_copy_batch *batch,
 static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
 {
 	struct ioctl_gntdev_grant_copy copy;
-	struct gntdev_copy_batch batch;
+	struct gntdev_copy_batch *batch;
 	unsigned int i;
 	int ret = 0;
 
 	if (copy_from_user(&copy, u, sizeof(copy)))
 		return -EFAULT;
-
-	batch.nr_ops = 0;
-	batch.nr_pages = 0;
+
+	batch = kmalloc(sizeof(*batch), GFP_KERNEL);
+	if (!batch)
+		return -ENOMEM;
+
+	batch->nr_ops = 0;
+	batch->nr_pages = 0;
 
 	for (i = 0; i < copy.count; i++) {
 		struct gntdev_grant_copy_segment seg;
@@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
 			goto out;
 		}
 
-		ret = gntdev_grant_copy_seg(&batch, &seg, &copy.segments[i].status);
+		ret = gntdev_grant_copy_seg(batch, &seg, &copy.segments[i].status);
 		if (ret < 0)
 			goto out;
 
 		cond_resched();
 	}
-	if (batch.nr_ops)
-		ret = gntdev_copy(&batch);
-	return ret;
+	if (batch->nr_ops)
+		ret = gntdev_copy(batch);
+	goto free_batch;
 
   out:
-	gntdev_put_pages(&batch);
+	gntdev_put_pages(batch);
+  free_batch:
+	kfree(batch);
 	return ret;
 }
 
-- 
2.43.0


