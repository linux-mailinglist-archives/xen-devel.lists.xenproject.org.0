Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B05268FE
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 20:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328676.551758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZju-0005nT-SI; Fri, 13 May 2022 18:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328676.551758; Fri, 13 May 2022 18:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZju-0005lC-P3; Fri, 13 May 2022 18:10:10 +0000
Received: by outflank-mailman (input) for mailman id 328676;
 Fri, 13 May 2022 18:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eu56=VV=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1npZjt-0005kx-Cb
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 18:10:09 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebb2818a-d2e7-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 20:10:07 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id j6so17685722ejc.13
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 11:10:07 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:07 -0700 (PDT)
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
X-Inumbo-ID: ebb2818a-d2e7-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+mnGzoN8dF8kZBDeMa+h7r+FYrqSgMHMidhuCTWTwI=;
        b=KQyMk8bzCjy0W1OsgrA0q4WybcDGmASfNSaP4NhbF5LFNZ0A2hOdi8gP/DomS8+9dO
         LOtlncXxSgCWY/yVRwqKmITN6LDQQHN4lDTe2BEwVzeS2Bo5DqdyfggEHTGDOKhnxoDx
         UWWqWoAaGdd0Hf+R50zigPdk255eeYJeETMTLpLprPojkA6nTPQhppqWkLirQ9mOECCu
         JnNA3pumn8jQ+zzVk9jEQpA6aMwE58GROOErTICDOHsi8QdTug0tQuTRamAQPOpwhE3t
         9YagHd8XqrwxN4bQN02sWW9uOU4i/zG/Yhv2qINbJzmYkJj9N/00IYn/RQrsgbng6wsn
         jc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+mnGzoN8dF8kZBDeMa+h7r+FYrqSgMHMidhuCTWTwI=;
        b=d/1hIXj9INurgaTtA63D9FAWRBSjyomDzTlMnrpvHRNHtEOVKzhn4cfe23M/TdRVdT
         dGF/WIH/Gyi0m8MxsW49wbJ41cW2a/p6kSizEI58RabBf87WD+UYmdx5nvNYFVicD9Qf
         QP6RvTQ2m4i9kh4pdsufZUopnHlA73sY6fh9Lz0XylRk8NLtTVk9vcedwEkX2P7eSRo8
         YY3y7rBIoWfK2PLdxbkKbtccpr8IIJHwNeJ8AbU7cDGFQlwDRL5CMTwHpqkrf7pfqxH1
         fXYPvZ9Yyxh65NvIvo0I6v3iGrjredXq8mobDh3WrfEylf1XmrDrhh6VmUrKBBSG3f5K
         MkjQ==
X-Gm-Message-State: AOAM530rXW0eCQ1/dqF+wkNzUA8jXxokMFQphP7msYW0mYggxe9/DgZ3
	95vUlVppih/JW0Yiyjr00Bk=
X-Google-Smtp-Source: ABdhPJxLNDiGt6mu8g/iIcRbxj5+FP6Ssv6g2I5vuL2XAJ6cqEhKgpSgehK74/8lZ6EnnQbrcXlRVA==
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id mp25-20020a1709071b1900b006f010221430mr5361497ejc.13.1652465407328;
        Fri, 13 May 2022 11:10:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/3] PIIX3-IDE XEN cleanup
Date: Fri, 13 May 2022 20:09:54 +0200
Message-Id: <20220513180957.90514-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
* Have pci_xen_ide_unplug() return void (Paul Durrant)
* CC Xen maintainers (Michael S. Tsirkin)

v1:
This patch series first removes the redundant "piix3-ide-xen" device class and
then moves a XEN-specific helper function from PIIX3 code to XEN code. The idea
is to decouple PIIX3-IDE and XEN and to compile XEN-specific bits only if XEN
support is enabled.

Testing done:
'qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022.05.01-x86_64.iso" boots
successfully and a 'poweroff' inside the VM also shuts it down correctly.

XEN mode wasn't tested for the time being since its setup procedure seems quite
sophisticated. Please let me know in case this is an obstacle.

Bernhard Beschow (3):
  hw/ide/piix: Remove redundant "piix3-ide-xen" device class
  hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
  include/hw/ide: Unexport pci_piix3_xen_ide_unplug()

 hw/i386/pc_piix.c          |  3 +--
 hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 42 ---------------------------------
 include/hw/ide.h           |  3 ---
 4 files changed, 48 insertions(+), 48 deletions(-)

-- 
2.36.1


