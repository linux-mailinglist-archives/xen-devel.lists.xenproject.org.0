Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CCE828E99
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 21:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664985.1035133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNJ0N-00061M-7i; Tue, 09 Jan 2024 20:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664985.1035133; Tue, 09 Jan 2024 20:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNJ0N-0005zl-4x; Tue, 09 Jan 2024 20:47:23 +0000
Received: by outflank-mailman (input) for mailman id 664985;
 Tue, 09 Jan 2024 20:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNJ0L-0005uQ-J1
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 20:47:21 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 477bb3a4-af30-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 21:47:19 +0100 (CET)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4299a70d0a7so11201751cf.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 12:47:19 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 fh7-20020a05622a588700b00425442a2f32sm1181628qtb.16.2024.01.09.12.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 12:47:16 -0800 (PST)
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
X-Inumbo-ID: 477bb3a4-af30-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704833237; x=1705438037; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUfUodEymbZtEHWKt1nCEcn+QQzKCU0Kdpn57cnp3Go=;
        b=SJMrFJjKRvJRbMUIJyFtiiFl/TBKNIyDA6idXBWrVlmF1CEocxQLAOBEMcfRFkOgIB
         RMTUl7dtZUv5A6G2cDeXQDHHvVgIPrHUlUjis31fOmnF0qDFBPnRkHmKLb+JrbWbugRz
         6rUBVo+q8b/X6HnspDZ0smNVPWr+0ODMiP9hxBZfTrc4DIxaBP2kT04WVg6yXjIqwa8x
         /B2FCGcP9TGZMcXTY7Tzz4E3URYwE/xH3V0aNqMOVu2ETx5SrX0kxn8W3b0ciigXzQyX
         5xWxLhQRikGm2pEAy9Fmf/921YFVTvyLt82iom4aoOYUtzKkGUgog02QseJUDKMipaF0
         y5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704833237; x=1705438037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUfUodEymbZtEHWKt1nCEcn+QQzKCU0Kdpn57cnp3Go=;
        b=git5ve8PA/TUkVonBPQkLOoA1W+bKyIm491ad/EsZsVWGSajQ+mZwM2AznuDNMXb8V
         FQm0dH6ZWDWRmvj870wlSKx9z4ShessASYEcE0xzAk0fNwF9t6+1A7jilMzgeEtlwUIC
         uIgdwA51UXVzRRPGvehxQ/qMR3gUdl6dnxccuVLvCCGDJLfkGtqqfXJNoKkhDX1JVoSd
         HTcfwqfIeL+ZQsT6iJDSafkujt6thSk/l4RuU7Vp0UabPWzaIzemdJekxstD8DqFnlZq
         C22COn1vXlgYfjmrUeccRj6psPVTMlXqLdZ284Z/4mfsb65yY6nawQRmaG7N6tNQm0y9
         Jwlw==
X-Gm-Message-State: AOJu0YxrQ1hbw0aFOYEiAMCLdOLFzgGsVZMH6wsLhNX0GTuXTEri+Ivb
	+2fvKeSK4xsLr3uH8xKGtYozdpVP/cg=
X-Google-Smtp-Source: AGHT+IFgDrhdGTITMW4nXRBlXahwxOH/JWni8FmmJR8ibZvTRgK7YGCZpgxbwfqsjIhLue/+nHpgTg==
X-Received: by 2002:a05:622a:489a:b0:429:9ec8:386d with SMTP id fc26-20020a05622a489a00b004299ec8386dmr37369qtb.49.1704833237371;
        Tue, 09 Jan 2024 12:47:17 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] libxl: Stubdom cd-rom changing support
Date: Tue,  9 Jan 2024 15:46:53 -0500
Message-ID: <20240109204655.72063-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches enable cd-rom media changing for an HVM with a
linux stubdom.

The first patch allows use of non-QDISK drives with a stubdom.  The
second expands the cd-rom changing code to support the stubdom case.

To change the cd-rom medium, libxl will:
 - QMP eject the medium from QEMU
 - block-detach the old PV disk
 - block-attach the new PV disk
 - QMP change the medium to the new PV disk by fdset-id

The QMP change insert uses fdset-id STUBDOM_FDSET_CD + $disk - 'a'.
That is, hda -> 'a', so
STUBDOM_FDSET_CD + 'a' - 'a' = STUBDOM_FDSET_CD.
For hdc:
STUBDOM_FDSET_CD + 'c' - 'a' = STUBDOM_FDSET_CD + 2.

The stubdom must internally handle adding /dev/xvdc to the appropriate
fdset inside QEMU.

A script like this:
https://github.com/OpenXT/xenclient-oe/blob/master/recipes-core/initrdscripts/initramfs-stubdomain/qemu-xvdc-add-fd.sh

Can be called by busybox mdev configured like this:
https://github.com/OpenXT/xenclient-oe/blob/master/recipes-core/busybox/files/mdev.conf

Jason Andryuk (2):
  libxl: Remove cdrom forced QDISK w/ stubdom
  libxl: Enable stubdom cdrom changing

 docs/misc/stubdom.txt         |  16 ++
 tools/libs/light/libxl_disk.c | 302 ++++++++++++++++++++++++++++++----
 2 files changed, 287 insertions(+), 31 deletions(-)

-- 
2.43.0


