Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F994A8ED
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773498.1183933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1x-0005Ct-1P; Wed, 07 Aug 2024 13:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773498.1183933; Wed, 07 Aug 2024 13:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1w-0005AU-U5; Wed, 07 Aug 2024 13:48:44 +0000
Received: by outflank-mailman (input) for mailman id 773498;
 Wed, 07 Aug 2024 13:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nE80=PG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sbh1u-0005AD-TV
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:48:42 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1361343-54c3-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 15:48:41 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ef32fea28dso20003881fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 06:48:41 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83960f353sm7017710a12.15.2024.08.07.06.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:48:39 -0700 (PDT)
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
X-Inumbo-ID: c1361343-54c3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723038520; x=1723643320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFxLqYHEKLum9CCtuJaF9+4IfFws5JZ6DONkQLdXj6E=;
        b=kinrW5Ge/7yOwYzIESa4NTIa2Hwspi5YVnBdznwwjDS4AjLiqTlo0nXIfHKs4xEuhS
         6DoL47Y+e2LmKUaIJ2iGQ3p66veB/PhBXvKOTM3kxT33im8WeffPQphO0/6ED/8rAUTs
         I8AvStIXY1n/XHlwtA+JseDNKPtk511yQiRPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038520; x=1723643320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFxLqYHEKLum9CCtuJaF9+4IfFws5JZ6DONkQLdXj6E=;
        b=onS1J03g5Z3WUnR2+tTVFTstwIg4ice/UemQE22EiSXvJFKwAXlbms1b25phTjJKem
         DnBexHAm0OsIu7+jH5vdc5D2S6u/KNxO4q8xRxaJyUtLMFqIstOquyNfbF3+Dh0Umo60
         Qb71sBGOAAYpPSVZizXINYY84ls2LSGzbWJ5v3Rc8zHNWfO0bD+OrPszRH977mJeChRR
         U4jWpwXjSGriLnLLRmJm+1r6ux5/Myc3Ho3yKLB6biuUdDUttpz4M8RfVmzc4ChStwLA
         5X95l9l0Y2Djd8faIANJSg7/qgfLzmz+CaO5OGo9exr0AyjevhvxSVpcvhrChNldGXcz
         nQJg==
X-Gm-Message-State: AOJu0YxC5jXkZBch7SRiSrwhQUG5Tvu6UiPA8xpaNQ8E3hgWDx+mj7i2
	CoUp7PTjojCkHA1nXCstV/EgjxQF30nJhNAYb9pxrB/xyOuh5WsVh7TDLgMCSJjOVgBq9md+qF0
	1
X-Google-Smtp-Source: AGHT+IF5+ckexxMB2mRk7r1dMYFDwYSzxoE8wfINleeNYXs9OThiii+pR8Mf2DxWcdrdhYir1H8ELw==
X-Received: by 2002:a2e:8683:0:b0:2ef:2d3d:3cc3 with SMTP id 38308e7fff4ca-2f15aa71865mr123964901fa.4.1723038519843;
        Wed, 07 Aug 2024 06:48:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/5] Improve support for EFI multiboot loading
Date: Wed,  7 Aug 2024 14:48:14 +0100
Message-ID: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

------------------------------------------------------------------------------
(This series is work from Frediano. He's having some issues with his dev
environment and asked me to push it to xen-devel on his behalf)
------------------------------------------------------------------------------

Testing this feature in preparation for UEFI CA memory mitigation
requirements I found some issues causing the loading to fail and
other minor issues.
Details in series commit messages.

Frediano Ziglio (5):
  x86: Put trampoline in .init.data section
  x86: Fix early output messages in case of EFI
  x86: Set xen_phys_start and trampoline_xen_phys_start earlier
  x86: Force proper gdt_boot_base setting
  x86: Rollback relocation in case of EFI multiboot

 xen/arch/x86/boot/head.S  | 81 ++++++++++++++++++++++++++++++---------
 xen/arch/x86/boot/reloc.c | 63 +++++++++++++++++++++++++++++-
 2 files changed, 125 insertions(+), 19 deletions(-)

-- 
2.45.2


