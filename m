Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2303545CE7D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 21:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230546.398542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHB-0006Ld-VS; Wed, 24 Nov 2021 20:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230546.398542; Wed, 24 Nov 2021 20:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHB-0006Iz-SF; Wed, 24 Nov 2021 20:53:57 +0000
Received: by outflank-mailman (input) for mailman id 230546;
 Wed, 24 Nov 2021 20:53:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMcq=QL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpzHA-0006Ii-HV
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 20:53:56 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2c26a13-4d68-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 21:53:54 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id bi37so10547097lfb.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 12:53:54 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j11sm97608ljc.9.2021.11.24.12.53.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Nov 2021 12:53:53 -0800 (PST)
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
X-Inumbo-ID: a2c26a13-4d68-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wBAopcuMZHjciIHB7DxD67GWh0M8Q3KOr2lZGv2eaVQ=;
        b=EOVNOSIKB097eJDLI78+TDQKEJMxEAhF1DjiOYB9US8P5Va356lafZguv3Uj2gDwR4
         Ctqcqmf+EkIuST9RZXpJNWUWuM0WLuR4We3+2VVX2B427CziLBQwhCPTe4sOW7IRYuiC
         aClHOn6gzPx4TxcdaotH3Mb+V+iLHfmsb4Mrw3XSVMV+ASZz4ooCS+JHbWRG/qeGNKZZ
         xmDf1Xf8QaKbD1D5kVTyzLNQM98Pv7HX/2NPj3KFIAMgfmVocJXKKdJpkwdRxkk1RjSY
         duz585QyMLv+6U/BdYsBk1KWN0oe+TJrOkDvnyGQMq78HyPglrUGXtLW4ohb1+5f6XIG
         efhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wBAopcuMZHjciIHB7DxD67GWh0M8Q3KOr2lZGv2eaVQ=;
        b=vojmnyaFAZqz75zQlPqzz/TV6h11Wm9SII56VpAdweMqjz0dScdiRZaLxSzezNKx35
         akO1hLscw1XPAmyQjsX9sEWS035PPmJLYqwUnDrldpyuKPPAiDRycx2THuGnLYV+xhCu
         dD8erR9/jzcDz1n9nIGkHNqpGYhGNPRiHAN8v1wj+Hc/7tSAZJldDw72jjhfYA/ytHsP
         ZGRaGKO5W1w568qB0W77x/8bCUdur275n4f4PmqJLK7IYbv7TrNzjifM1Rnu0nCgSRW9
         tIgMTak5gKljSgX7/vLk5zH5s0QTICu87xsVBMmcRNR3pskASoq+hOk0WjGidE4uMMBZ
         pC0g==
X-Gm-Message-State: AOAM532h4CgDuKaj2f9O1I3ojCgOkRPdSXbpgLZ+HtuM3DZ1xD0je7lj
	H9OCS8dmmuZgR1l09NV1o8cy6zwnjiV1/Q==
X-Google-Smtp-Source: ABdhPJyichwpAJNMAkydxI87GKxoZRWxO8uoBVnYkUCHsGmrt0hZCYLPXfYtuT9M9aREjB1c6odbSA==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr18736716lfh.580.1637787233851;
        Wed, 24 Nov 2021 12:53:53 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V3 0/6] xen: Add support of extended regions (safe ranges) on Arm
Date: Wed, 24 Nov 2021 22:53:37 +0200
Message-Id: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

You can find the RFC-V2 patch series at [1],[2].

The corresponding Xen support (for both Dom0 and DomU) is already committed and
is available in mainline Xen since the following commit:
57f87857dc2de452a796d6bad4f476510efd2aba libxl/arm: Add handling of extended regions for DomU

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of ballooning out real RAM pages to obtain a physical address space for creating
these mappings (which simply results in wasting domain memory and shattering super
pages in P2M table).

The problem is that we cannot follow Linux advise which memory ranges are unused
on Arm as there might be some identity mappings in P2M table (stage 2) the guest is not
aware of or not all device I/O regions might be known (registered) by the time the guest
starts creating grant/foreign mappings. This is why we need some hints from the hypervisor
which knows all details in advance to be able to choose extended regions (which won't
clash with other resources).

The extended regions are chosen at the domain creation time and advertised to it via
"reg" property under hypervisor node in the guest device-tree [3]. As region 0 is reserved
for grant table space (always present), the indexes for extended regions are 1...N.
No device tree bindings update is needed, guest infers the presence of extended regions
from the number of regions in "reg" property.

Please note the following:
- The ACPI case is not covered for now
- patch series was created in a way to retain existing behavior on x86

The patch series is based on v5.16-rc2 and also available at [4], it was fully
tested on Arm64.

[1] https://lore.kernel.org/all/1627490656-1267-1-git-send-email-olekstysh@gmail.com/
    https://lore.kernel.org/all/1627490656-1267-2-git-send-email-olekstysh@gmail.com/
    
[2] https://lore.kernel.org/all/1635264312-3796-1-git-send-email-olekstysh@gmail.com/

[3] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob_plain;f=docs/misc/arm/device-tree/guest.txt;hb=refs/heads/master

[4] https://github.com/otyshchenko1/linux/commits/map_opt_ml6

Oleksandr Tyshchenko (6):
  xen/unpopulated-alloc: Drop check for virt_addr_valid() in fill_list()
  arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT
  xen/balloon: Bring alloc(free)_xenballooned_pages helpers back
  xen/unpopulated-alloc: Add mechanism to use Xen resource
  arm/xen: Read extended regions from DT and init Xen resource
  dt-bindings: xen: Clarify "reg" purpose

 Documentation/devicetree/bindings/arm/xen.txt |  12 ++-
 arch/arm/xen/enlighten.c                      | 132 ++++++++++++++++++++++++--
 drivers/xen/Kconfig                           |   2 +-
 drivers/xen/balloon.c                         |  20 ++--
 drivers/xen/unpopulated-alloc.c               |  84 ++++++++++++++--
 include/xen/balloon.h                         |   3 +
 include/xen/xen.h                             |  16 ++++
 7 files changed, 239 insertions(+), 30 deletions(-)

-- 
2.7.4


