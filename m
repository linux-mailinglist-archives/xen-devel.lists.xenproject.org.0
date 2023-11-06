Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EDE7E281B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628133.979256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AE-0008JK-MF; Mon, 06 Nov 2023 15:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628133.979256; Mon, 06 Nov 2023 15:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AE-0008BE-GN; Mon, 06 Nov 2023 15:05:18 +0000
Received: by outflank-mailman (input) for mailman id 628133;
 Mon, 06 Nov 2023 15:05:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r01AD-000892-0u
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:05:17 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e39219c9-7cb5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:05:14 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso32313555e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:05:14 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm12507392wmo.40.2023.11.06.07.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:05:13 -0800 (PST)
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
X-Inumbo-ID: e39219c9-7cb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699283114; x=1699887914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxkVS4hBSJv6X7HlZm/O6maHe61jzX44hOr03J+Zv60=;
        b=Hp5fJYZqVFhKh1upbu/mARsyNOFDsVIsXDG4i2cllh2xoZyr9D0wuJ4DgqXbZqU+KQ
         vLvmqOO++8DubvoEQq+Ay7GnyDYefyTDd/7/E0LwTMAmHBwMTK9xOVKhQ36dhUHVG7A0
         3pW3eq6qloksvX7Ge3xXRBOwD/t92SXdKvhrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283114; x=1699887914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxkVS4hBSJv6X7HlZm/O6maHe61jzX44hOr03J+Zv60=;
        b=vqDp8FzflJrY0LzqRMdifTRY9Wo0dqM9lK1gu+sNKPJ/eQR1FXYcKWaFh6xf5EMkbR
         TiZ1zjuMMT+64XC43DBYBlCpDPKGaqq97upuS834Rm/pTuGsRmqgrqbPXxsnLZzNaaU2
         U7xj2O1EGQh4wVKzxH/DW5g5Su5MDCg9SdmxJFz3vdn7UgqIcSGzNP5sb3qpzAEYpa6P
         BrRX2NtCjkNoiHYl4nxOIckcGX3NE1Oiw8n4wjpUXr3IKehlUDHVZ15Arq9rx6HuAt0q
         WTduexXb/OjdN0avakyTC6QrD9wWM3MjZcLMhdbDMONhcXr4pLRldFw7Z2QNDD31EY4A
         8l0g==
X-Gm-Message-State: AOJu0YwqzbrBRDtNk3Wx6niMaAis0XlCVE/JVrDLxaWeCFuz1wZuRA7q
	whrsgKjCNEmIjNPP297u4W51L59cak9ENoZ4k3I=
X-Google-Smtp-Source: AGHT+IHK5/VVMvkWkg0o/sGZuDH2oGFdVWlv421KRFLy61nmtP55QYZaQVd3uX7wVa/c5bsIloEYnA==
X-Received: by 2002:a05:600c:470e:b0:408:4f50:9602 with SMTP id v14-20020a05600c470e00b004084f509602mr25649437wmo.12.1699283113467;
        Mon, 06 Nov 2023 07:05:13 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/6] tools/pygrub: Set mount propagation to private recursively
Date: Mon,  6 Nov 2023 15:05:03 +0000
Message-Id: <20231106150508.22665-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is important in order for every mount done inside a mount namespace to
go away after the namespace itself goes away. The comment referring to
unreliability in Linux 4.19 was just wrong.

This patch sets the story straight and makes the depriv pygrub a bit more
confined should a layer of the onion be vulnerable.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/pygrub/src/pygrub | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index 541e562327..08540ad288 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -55,6 +55,12 @@ def unshare(flags):
     if unshare(flags) < 0:
         raise OSError(ctypes.get_errno(), os.strerror(ctypes.get_errno()))
 
+    # It's very typical for systemd to mount / with MS_SHARED. That means
+    # any events in the new namespace get propagated back to the parent.
+    #
+    # Undo it so that every mount done in the NS stay confined within it.
+    subprocess.check_output(["mount", "--make-rprivate", "/"])
+
 def bind_mount(src, dst, options):
     open(dst, "a").close() # touch
 
@@ -113,11 +119,9 @@ def depriv(output_directory, output, device, uid, path_kernel, path_ramdisk):
             if rc != 0 or os.path.getsize(path) == 0:
                 os.unlink(path)
 
-        # Normally, unshare(CLONE_NEWNS) will ensure this is not required.
-        # However, this syscall doesn't exist in *BSD systems and doesn't
-        # auto-unmount everything on older Linux kernels (At least as of
-        # Linux 4.19, but it seems fixed in 5.15). Either way,
-        # recursively unmount everything if needed. Quietly.
+        # Unshare(CLONE_NEWNS) ensures this is not required, but that's not
+        # present on *BSD, so recursively unmount everything if needed.
+        # Quietly.
         with open('/dev/null', 'w') as devnull:
             subprocess.call(["umount", "-f", chroot + device_path],
                             stdout=devnull, stderr=devnull)
-- 
2.34.1


