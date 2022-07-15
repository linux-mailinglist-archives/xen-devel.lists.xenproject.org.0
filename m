Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D9576746
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 21:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368516.599840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQrb-0008Gs-IF; Fri, 15 Jul 2022 19:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368516.599840; Fri, 15 Jul 2022 19:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQrb-0008Eo-FZ; Fri, 15 Jul 2022 19:20:35 +0000
Received: by outflank-mailman (input) for mailman id 368516;
 Fri, 15 Jul 2022 19:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oCQrZ-0008Ef-EM
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 19:20:33 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31f63b9a-0473-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 21:20:32 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id z25so9388883lfr.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jul 2022 12:20:32 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k3-20020ac257c3000000b0048159b43083sm1043178lfo.201.2022.07.15.12.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 12:20:31 -0700 (PDT)
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
X-Inumbo-ID: 31f63b9a-0473-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FaPwFj/RyF+5QWfOP5Acgw2pLkYCh6swXVii47zLS0I=;
        b=jsTgVWfwyu5bvzziBMqFPerEk1yuqiQUw2NZeXzAVF9atLNfyrov9YLnsdA5RlyhNR
         fEv2DvKI28I8a57h+vZ6UFZAyqJOM8Pj/FXmEFBMd+ZWIJXj9iEFNbeUha22u/4ybIbX
         XfyPLDUr8pIOmovYcOPLeCmez/bHaJGm4S6g88fgPrywVO6LWyS22qnIJ/O6ermXin/m
         LBnxnKJOg90C/7WhCjg1IiyZJWj6T3vXyStFGn0ptIOl2/bH5KgWYKAP5VyxVb3uYjlO
         lqbqJUBRFCofxieU5+bDclxzMNFi6/4m3f259UC46Uh0KFx712jm7H4QefRPwAnQ2kLU
         5cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FaPwFj/RyF+5QWfOP5Acgw2pLkYCh6swXVii47zLS0I=;
        b=tz+otgf/s3yB9eUSEkdawoclO1HbWpFIKeDzF7cfVpSs4eyvNpG8ZeR88rKkN95ozK
         +qK4TLLEhPhC2kqcPxF8B4DUevsaP6zsdTXCkE6HrpmsrLCq3ruFcEUCmjWU+N1yfvC0
         P4EfbZoHClISs0vSFjBC1nbI2Ui72uM11bFrzYfmY60pcCJ6WAQk5QBNQSl2EJU9du3z
         kMHIrz4aWyf/VtghYXKnyY61C9I0/Q5sFaTgwaBPw+G6eP7dtdihccgpnYcEiD0F6clU
         j+0VtG9Kc+4OIU5RgA9Si6+pVn2+903w99H/CT19OMrnpgC+JBQSuarrOAdDBmkRcXar
         wX8w==
X-Gm-Message-State: AJIora+AG6xDNWHRf8sfdGSH36+MM6zw6XhF+O2KmAHsxOvhwEPJfTXb
	uZV66vwp6HytdJLlPMqjH5wRbY739TEatQ==
X-Google-Smtp-Source: AGRyM1um1bamUWFLz0Z+t5BdkNIGW/BhIt/p1025yguHrB8xdq0iH/9TrgMm+E9eI+zt8L8hMCYwkg==
X-Received: by 2002:a05:6512:1283:b0:489:eed8:5414 with SMTP id u3-20020a056512128300b00489eed85414mr8992198lfs.532.1657912831592;
        Fri, 15 Jul 2022 12:20:31 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH V11 0/3] Virtio support for toolstack on Arm (Was "IOREQ feature (+ virtio-mmio) on Arm")
Date: Fri, 15 Jul 2022 22:20:23 +0300
Message-Id: <20220715192026.4013441-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add missing virtio-mmio bits to Xen toolstack on Arm.
The Virtio support for toolstack [1] was postponed as the main target was to upstream IOREQ/DM
support on Arm in the first place. Now, we already have IOREQ support in, so we can resume Virtio
enabling work. You can find previous discussions at [2].

Patch series [3] is based on recent "staging" branch
(bf2f989531ad3851685a1847cbc1e28901ed80a2 public/io: xs_wire: Document that new errors should be added at the end)
and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio based virtio-disk backend [4]
running in Dom0 (or Driver domain) and unmodified Linux Guest running on existing virtio-blk driver (frontend).
No issues were observed. Guest domain 'reboot/destroy' use-cases work properly.

!!! All patches except "libxl: Add support for Virtio disk configuration" have Stefano's and Anthony's R-b tags.
Anthony already gave his R-b and George already gave his A-b (golang changes) for
"libxl: Add support for Virtio disk configuration", but I dropped them due to the changes(s/other/standalone
for the backendtype).

Any feedback/help would be highly appreciated.

[1]
https://lore.kernel.org/xen-devel/1610488352-18494-24-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1610488352-18494-25-git-send-email-olekstysh@gmail.com/
[2]
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02403.html
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02536.html
https://lore.kernel.org/xen-devel/1621626361-29076-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1638982784-14390-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1654106261-28044-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1653944813-17970-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1654197833-25362-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1655143522-14356-1-git-send-email-olekstysh@gmail.com/

[3] https://github.com/otyshchenko1/xen/commits/libxl_virtio_next4
[4] https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

Julien Grall (1):
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (2):
  libxl: Add support for Virtio disk configuration
  libxl/arm: Create specific IOMMU node to be referred by virtio-mmio
    device

 docs/man/xl-disk-configuration.5.pod.in   |  38 +-
 tools/golang/xenlight/helpers.gen.go      |   8 +
 tools/golang/xenlight/types.gen.go        |  18 +
 tools/include/libxl.h                     |   7 +
 tools/libs/light/libxl_arm.c              | 164 +++-
 tools/libs/light/libxl_device.c           |  62 +-
 tools/libs/light/libxl_disk.c             | 146 +++-
 tools/libs/light/libxl_internal.h         |   2 +
 tools/libs/light/libxl_types.idl          |  18 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 959 +++++++++++-----------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   9 +
 tools/xl/xl_block.c                       |   6 +
 xen/include/public/arch-arm.h             |   7 +
 xen/include/public/device_tree_defs.h     |   3 +-
 17 files changed, 969 insertions(+), 483 deletions(-)

-- 
2.25.1


