Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0412AE5CE7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023129.1399047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxGH-0003sL-Pi; Tue, 24 Jun 2025 06:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023129.1399047; Tue, 24 Jun 2025 06:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxGH-0003qD-Lx; Tue, 24 Jun 2025 06:36:05 +0000
Received: by outflank-mailman (input) for mailman id 1023129;
 Tue, 24 Jun 2025 06:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uTxGG-0003q6-Q8
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:36:04 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f9d802a-50c5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 08:36:03 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so4210377f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 23:36:03 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453646cb5a8sm133834135e9.7.2025.06.23.23.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 23:36:01 -0700 (PDT)
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
X-Inumbo-ID: 7f9d802a-50c5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750746962; x=1751351762; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lGzCSKb14mZMj9FzOXT7zB/agz3LVQjFAyPfpcymbc=;
        b=dfP8ZNAPduzsGm7nQeu+jKw0KDvvv1Q0AcQgtWFl+G/k4ITSP8/jwCIggsMoSYWthV
         MtQPI+Yq9NI2s60+sYSYZ5UHYZj67fIufhSRUKoRolExhncedtY0ge7IWfRCItGZ5d1T
         VITTLQxGlQ2wvJU18SQwiEwHZzRveAiShuZF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750746962; x=1751351762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lGzCSKb14mZMj9FzOXT7zB/agz3LVQjFAyPfpcymbc=;
        b=Oyx3ocNP8PwYRbRia8TQw3bT1zW+P1m/JK9K50rGHwk6Ff8oya4CCo2YP22/SKfW2F
         xPGkEJSkGhncq0sKcDBj0JgaFsjFmOi+3iJ8V9lj72NMyVpTPtDR9fRg8OhrZkgKKEDS
         kdtp2WeM796D7dL+St3bQA/UormjJKKqS0lnxrFBCVhd3TFMAi8jbwB5J0OLR7I0S9+l
         ziUyt1nvu1MYDs5k9cUDc40VPkiND1hK8ZmVXen/EY+hMYK9nF8o5Q3W7bB+OtS9v0Gd
         5s0c2SRskBCSHdBL+oVFsIyQ+ZqN8iBNu7FfHPty9X5AVNG7L/Oiv77mv5xderN4yC4d
         I5Vg==
X-Gm-Message-State: AOJu0YxSEP8Mb1D/aTFlXvEhQ/eaz1mmpy+oOP6SnxvHFxieSIxgzOKs
	68wKpgBMefopSR65vmnrJxFzAY5XuopbgKnyfNtKPdHxUdJHuq/711V3xmoQOZVmBqofofQEOfy
	8GiC76n7oJg==
X-Gm-Gg: ASbGncvJBjT7OMiBlgXAX5wvL6roMCP/Q/jtJ15BBNX7xelxQH58ZVGKWUAfcjkvAa8
	Jfm3p1Vw4UV9Uk3KW3VbsAa+pg+gGobUWq+uHkb9Uvy9usQ91g55wncSUFYQlhfwH7cz5mxLOvf
	nCboSIUM4IB6lkK6moMICKudgenin/qLHEEdwHFR4relg0vxn9GxpMK79cRp+G+knEZXXwayelP
	QQgdPpQ1D8fbkTty13JsGqXig2sMzQp64cNKyYrwal70oFp4lsYZAKciS276gVi8okwE76of61x
	9HuUteJiFwHlUaQ4UfYPmJcm9jEoVbrWcrwFZ/ZT5hyuDmvwUhCbSfbWdxzi1xStWVAtgnWWa3M
	sfiTui9v7oq/uGWryDOcVnYUXUyyvaQ==
X-Google-Smtp-Source: AGHT+IFJBhpZMr2nBpl6xVA7AGURxMbrnS5Qv5moQqiXV3g7Tl8ztvBt4m0eN5zYg8WwZE8L/5aaEA==
X-Received: by 2002:adf:9cc2:0:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3a6d131dd70mr11495780f8f.40.1750746962164;
        Mon, 23 Jun 2025 23:36:02 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/efi: Show error message for EFI_INVALID_PARAMETER error
Date: Tue, 24 Jun 2025 07:35:39 +0100
Message-ID: <20250624063541.236691-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Show string message instead of code.
This happened trying some different ways to boot Xen, specifically
trying loading xen.efi using GRUB2 "linux" command.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index fb3b120982..ded7cc129d 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -329,6 +329,9 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
     case EFI_BUFFER_TOO_SMALL:
         mesg = L"Buffer too small";
         break;
+    case EFI_INVALID_PARAMETER:
+        mesg = L"Invalid parameter";
+        break;
     default:
         PrintErr(L"ErrCode: ");
         DisplayUint(ErrCode, 0);
-- 
2.43.0


