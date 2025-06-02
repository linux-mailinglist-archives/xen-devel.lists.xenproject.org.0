Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5660FACAF26
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003324.1382887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LX-00018g-J5; Mon, 02 Jun 2025 13:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003324.1382887; Mon, 02 Jun 2025 13:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LX-00016G-E7; Mon, 02 Jun 2025 13:36:59 +0000
Received: by outflank-mailman (input) for mailman id 1003324;
 Mon, 02 Jun 2025 13:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MT+=YR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uM5LV-00009x-B6
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:36:57 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0776e5c-3fb6-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 15:36:45 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-606741e8e7cso1199296a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:36:45 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82becbsm801962166b.39.2025.06.02.06.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:36:44 -0700 (PDT)
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
X-Inumbo-ID: a0776e5c-3fb6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748871405; x=1749476205; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yy53j1DOU6WWUw+PBhTlbtLkLrjDWtoXUpgaf2G0MZI=;
        b=fAvRw2IZl3fv5MEP+1gQDTRCWvotG4ZIh+GBdr7K3c8/EH0DkrF62WGpO/4v2AFt2e
         6tDx9DjlIg6i/IdwJ0SuLAclrflYBJLZw2r/KpDGwZ+QwGNOAnnR+GJs/ZQczfzzEx48
         QT/Hf9Irxn6t8IZzBZG5PDyVhVsyIkKy9OyaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871405; x=1749476205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy53j1DOU6WWUw+PBhTlbtLkLrjDWtoXUpgaf2G0MZI=;
        b=Hn4H+G0bEgnouTSPE/EzSex14JlkFs9mUR6aGn6YujW/G6qZi0t06TbsbBRYqTzzug
         fpAlZJqjL1ENEMEcm5KCdiOAB5fSFznEFscfh2p54tVaDk8blX2EsLYr3g2WsjM0urnb
         SKdDDAYXwxn2z2dIDydFA2C4p4reYJ4jQ3Ofy2PWt48+BxS/TVHV7keX1rZ6GZzo6aMG
         GneBkkWwLTJcGMg+0k7ol7sH0j7ehRSUKuPULahMdosbuoaVMwq2CnpCezgdITWz/ghz
         zicQDWhbFcHnNvYZb7J+0GMyUm/Jucs6JNqvl7b+teeVKSGrGv11qn3r7jrKNgVH75VG
         UGiQ==
X-Gm-Message-State: AOJu0YzZoED1lkIEsNklWbAqcSgxQkMWQPUuicGz/uBZn/xa3GQpozUV
	MtSlRxvmbTOrhhwTF1PpLebtMoum2juhFbmLCH+xCanGaSj9Ubpc4jB4dvs6o32HMVKVtH7K7un
	8f7I=
X-Gm-Gg: ASbGncsyWZcqm+/UujpDiFU2/1JkW6usuJ1GbIiLiq9jsKPgDskDgiHF7aL1Dglpt7u
	Cn4fTfPCVghg7P4f0gAokUfnAUHEIgUDVQnZyekbLpXwBbG1ESWTpGSow0bCfuybtv4XXeDy8cf
	h5k9MiKQXI1n4M2bYWWvqrem2A3kdZ3fCNjxRcu97o0y+cC+mvOfGhEHHYgxP+tVxZSejipCFL5
	qJxepJISq3/aLmXs+ODIwC7Ujp1a1XlCj7c7KY18Rw5apsu+arP/yF/IoGwT3zjcqwY6MfyzrJS
	0S+hNBzMYbFyLsRGRiPX+jUaQoZvTTvhb6OS3K2bhmT9OihGTguQrcxKe12BwquzuPI6UCCNcL6
	Gvm/bDph15A==
X-Google-Smtp-Source: AGHT+IFpP/DPyjJsrVxJduaDWmB2TXpnjhtrBnEJgFtvQkMmvBFskmlVj4MaJ6HCh10KwIxdPLIVMw==
X-Received: by 2002:a17:907:3f12:b0:ad8:9d41:371e with SMTP id a640c23a62f3a-adb322fe389mr1448220566b.36.1748871405037;
        Mon, 02 Jun 2025 06:36:45 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/5] LivePatch signing support
Date: Mon,  2 Jun 2025 14:36:32 +0100
Message-ID: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Live patch signing support was mentioned as future work in the design
document several years ago. This series finally implements support for
it since it is a requirement of Secure Boot to prevent loading unsigned
code into Xen.

See the individual patches for what has changed in v3.

Jennifer Herbert (1):
  livepatch: Verify livepatch signatures

Kevin Lampis (1):
  livepatch: Embed public key in Xen

Ross Lagerwall (3):
  docs: Introduce live patch signing
  crypto: Add RSA support
  livepatch: Load built-in key during boot

 docs/misc/livepatch.pandoc      |  106 +-
 xen/common/Kconfig              |   18 +
 xen/common/livepatch.c          |  139 +++
 xen/common/livepatch_elf.c      |   55 +
 xen/crypto/Makefile             |   12 +
 xen/crypto/rsa.c                |  196 ++++
 xen/include/xen/livepatch.h     |   15 +
 xen/include/xen/livepatch_elf.h |   18 +
 xen/include/xen/mpi.h           |   68 ++
 xen/include/xen/rsa.h           |   74 ++
 xen/lib/Makefile                |    1 +
 xen/lib/mpi.c                   | 1729 +++++++++++++++++++++++++++++++
 xen/tools/extract-key.py        |   40 +
 13 files changed, 2419 insertions(+), 52 deletions(-)
 create mode 100644 xen/crypto/rsa.c
 create mode 100644 xen/include/xen/mpi.h
 create mode 100644 xen/include/xen/rsa.h
 create mode 100644 xen/lib/mpi.c
 create mode 100755 xen/tools/extract-key.py

-- 
2.49.0


