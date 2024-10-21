Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6A9A5D4B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 09:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823205.1237165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2n1I-0004ls-U6; Mon, 21 Oct 2024 07:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823205.1237165; Mon, 21 Oct 2024 07:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2n1I-0004jZ-PA; Mon, 21 Oct 2024 07:40:04 +0000
Received: by outflank-mailman (input) for mailman id 823205;
 Mon, 21 Oct 2024 07:40:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cz9x=RR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1t2n1H-0004Lr-Dw
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 07:40:03 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7397fc-8f7f-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 09:40:00 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-539e59dadebso5242777e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 00:40:00 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a224313fbsm411183e87.219.2024.10.21.00.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 00:39:59 -0700 (PDT)
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
X-Inumbo-ID: ad7397fc-8f7f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729496400; x=1730101200; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnVZgiNfswIw7OgFquKKUJodllKwremLFomd7GhQzKY=;
        b=nbjAzIRoH77WKpvZiI8eG4nD5CbTceN9t7AIwe9bpp/JQnxBPNqFqffXtP4bTA4J3u
         xws7cyofw+1D88c0RyTV46+nSN3woPtR1ou30+XJg7aelfnJxKP1DEiYtl2Lvw1NMK2Q
         sOsvl7WJxpFdcULXRlg4vvoqTC+B9qguTrNMOBdEBDiS6IFdgLANQubgfQnvBgoTvWHY
         arZ+f77oPaC3+khX+P771wn7Vxl3ya5gh1LYJReHih/Wk+GmgtQU5wBxIMdVYxuhQvL4
         2g7JOH9h8hcmEqokbpWMLobur8cr8MbirZ4UKDrxlx7lVAQ/VbSHtJkTunJdc+OejFSX
         F9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496400; x=1730101200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnVZgiNfswIw7OgFquKKUJodllKwremLFomd7GhQzKY=;
        b=KYMRSTxLF1GdTgvHEeezL37NU3oIzfGvFpt3Q5YBWT4R1lVxhPyfKatHQitnj8sdva
         irdYTxx4epACc7p9pXGmENuwKtcG4fps0Mj69KPqqTBdzfA9861Ra8lcqCSnzy1ziFWu
         GFC7FgwW7hUBemJSKgkMO3ZGg8LCzn8pR41Kk/DHrswwdVm1kA/GoZ1f8vmyweuVKLPP
         YCq4BqNH4XRp17bMJdJToYcPZwF2ecO4SrD0JzDrkFzZMDmhjTg7Q+ZRoeLcFy6exkSg
         fe4wtrtGQw4CGkS6Bc4BuSjkgIpRA/9WoTPyFsIwDzCSY06Z0cZ3fiPC6CtHg2HQO2Nv
         DDgg==
X-Forwarded-Encrypted: i=1; AJvYcCXJba00dQF9V4/YkOjTh0MM1BtbudHiqFU951E7IkUTB3Je6QZiu/UKazb813svjezBf9WyH1mrXZ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZjbWLzIpXd6C5stNvnKjP0dAPnjf2AB1W0IN2+9UgDUkQGTWn
	n53befapaNUS5h0CLxS4lmXd2ZJgkLKwcKi1VGarcc7ObamYEhKv
X-Google-Smtp-Source: AGHT+IFaCtOXhq99BOX5U08lfOxTiedEUSHJvwsz8f8iv4Hr3cpYh8DzUX4+obfzdliyy3EL8K9qlQ==
X-Received: by 2002:a05:6512:b08:b0:535:3ca5:daa with SMTP id 2adb3069b0e04-53a1520bd21mr4456242e87.7.1729496399802;
        Mon, 21 Oct 2024 00:39:59 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 0/1] Xen Queue
Date: Mon, 21 Oct 2024 09:39:56 +0200
Message-ID: <20241021073957.1851500-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The following changes since commit f1dd640896ee2b50cb34328f2568aad324702954:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2024-10-18 10:42:56 +0100)

are available in the Git repository at:

  https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-10-21.for-upstream

for you to fetch changes up to 676a68fd4850924db73548c9cb20ea484709708c:

  hw/xen: Avoid use of uninitialized bufioreq_evtchn (2024-10-21 07:53:21 +0200)

----------------------------------------------------------------
Edgars Xen queue.

----------------------------------------------------------------
Edgar E. Iglesias (1):
      hw/xen: Avoid use of uninitialized bufioreq_evtchn

 hw/xen/xen-hvm-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

