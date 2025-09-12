Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED95B5520C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122088.1465983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50u-0004Wa-Vw; Fri, 12 Sep 2025 14:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122088.1465983; Fri, 12 Sep 2025 14:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50u-0004Nu-QV; Fri, 12 Sep 2025 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1122088;
 Fri, 12 Sep 2025 14:44:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50t-0004JT-32
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:35 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc6a8dc-8fe6-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 16:44:34 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45de287cc11so17162865e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:34 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:33 -0700 (PDT)
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
X-Inumbo-ID: ffc6a8dc-8fe6-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688274; x=1758293074; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+5OeQGcDbnAwz67GRXnivaacN6ERwJk9ywsk5rSdw4=;
        b=dCqui4viqM1c84yjGZkveW210vB3q+QTBKUKaXdqmjT17zX8uQ5o4/Rol5b9uN+DrJ
         orFU7j1aTofiP6bNSB1tJFflB+OP8Q9AsCj3GSv0Eh3J7ljedcccPhjNAaKUddrXTL7h
         PcCHYe/UiotiHZ9EHRxvqp4p9A4THKdUgjAoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688274; x=1758293074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+5OeQGcDbnAwz67GRXnivaacN6ERwJk9ywsk5rSdw4=;
        b=htfviTbXifgmijw6ALsSipobSeQB3XGYprI+0BbxgDrn9p9SE2HHwL+1fz2LI1gm1I
         MHLF90VhEIvXQNQXeaJtEv+ikuhLhai/NgLon7pwu3tjjuLmVvbzGtSF7LP5EE2R0N44
         6E6Z7WBjIOyq8peGCteI1E01D3wuSx9DTT/+RnYnSY53Wv3TF1SU0jIQqB8+rEsJ7CJG
         6whUJQSvNmwZQOJGHoqDtJ73+MIhqQzCqaqfaJBW73bbg5UJzpVYNNeqVQK2x4giaEW3
         QgxJBnOoDdhP17kpri25Fyrv9O3rjCh48UysdqZLTGgDinqy46wYW3pXXSDjw1qn9CNo
         Z/VQ==
X-Gm-Message-State: AOJu0YwCzh5KSVPKoZxRzA0tWIbH7WckRe7KuyjP96F6/bxxuCi3tHFC
	wcT+svkWNo7mO8Cf9hAWmnTZgfbeQidUbOlbY8nWOMU9fvoSMjZ7DfJIAw5sT1j+51MxegSTIAf
	QojBj
X-Gm-Gg: ASbGncvzudsSf2dEfYxMRTWYBxoaJCH4c87mNC7KtpBgNKl79BEdhWDP7AoUwpH06ZQ
	aPZ5aj+gWR83avCM98FqX/K64BEyHM0yCccVLZB+kBEecSNF5u6M/ricDrsyi4jE8Ft642oxl28
	g79laSBFZtgGwjQjsOVDzOO3g6ll2KTcz/iqWBut10R2sm4VU/+Ky2m8211E4/ahNvbjHYnwbWl
	EiT2CKbEVo591fYBgXnXQK8AMAaEh3WFA/TXIoGIGJoawtIA/lGug1MXKbCn4PkdebNj2PR8kPO
	/kFk0pnmCRo7d1+b4lKgcBF9Qe+6wI8pjxkY/GAreKT3yY7k0Uh4SUHgAVC37ghAF09rHm95vpH
	Hpjj2PriQ9jFS1ay9zvSI0gzWstMyRO8z2Yqql08F+vgm3qK4UJI1p2LXJZcZJGZ6DHZiF34ftK
	Pt
X-Google-Smtp-Source: AGHT+IEDBDTcLKQZMymHxnkL0ZmqZP2tyEPSSEWgGE5dHxDEL754J1+bNZLH27HK2yeITyRAGaGXWw==
X-Received: by 2002:a05:600c:40c4:b0:45d:e775:d8b8 with SMTP id 5b1f17b1804b1-45dfd5aaff0mr55189765e9.1.1757688273755;
        Fri, 12 Sep 2025 07:44:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH v4 3/8] CI: Merge categories in debian/12-x86_64.dockerfile
Date: Fri, 12 Sep 2025 15:44:22 +0100
Message-Id: <20250912144427.1905141-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpio needs to be in Tools (general) now that it's used by the general build
script.  Merge the rest of the test phase jobs into one group, to avoid being
overly fine-grain.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>

Prep for making a Debian Trixie derivative.

v3:
 * New
---
 automation/build/debian/12-x86_64.dockerfile | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
index 3cf99c730b61..4e533ee879fd 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -23,6 +23,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         pkg-config
         wget
@@ -52,19 +53,14 @@ RUN <<EOF
         ocaml-nox
         ocaml-findlib
 
-        # for test phase, qemu-smoke-* jobs
+        # for test phase, qemu-* jobs
+        busybox-static
         expect
+        ovmf
         qemu-system-x86
 
         # for build-each-commit-gcc
         ccache
-
-        # for qemu-alpine-x86_64-gcc
-        busybox-static
-        cpio
-
-        # For *-efi jobs
-        ovmf
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
-- 
2.39.5


