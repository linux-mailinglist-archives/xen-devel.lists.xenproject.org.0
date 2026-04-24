Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHh7K8p262kQNAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:57:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480E545FE16
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293569.1571196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGiN-0002TJ-0l; Fri, 24 Apr 2026 13:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293569.1571196; Fri, 24 Apr 2026 13:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGiM-0002Ro-T6; Fri, 24 Apr 2026 13:37:02 +0000
Received: by outflank-mailman (input) for mailman id 1293569;
 Fri, 24 Apr 2026 13:37:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wGGiK-0002RW-PB
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 13:37:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGGiK-000jjh-65
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:37:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb71f6-5cb7-0a2a0a5109dd-0a2a4508ebfc-26
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:37:00 +0200
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb71fb-63b5-0a2a45080019-d155a735d18f-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:37:00 +0200
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5a283c44478so13340032e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 06:37:00 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a5241f6583sm3649078e87.39.2026.04.24.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 06:36:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777037819; x=1777642619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NnGgV5M3igXJCiYnxgULWkuy2e7zrxF4KNcDwNtdnc=;
        b=ekDjR4ftQ8AAi0XD/AGNmQ9aU0qs7MGjv5RuyYUWMX1ewbvGdq8m8yH0fY91LNDWBn
         jfdA75G+OSkCRB0OYmuFe6Nros5n8aSVLw+nusEX/v0YRuCwrdjCRxEf0z1FRgGBFbxZ
         tz8Wq5c6At+VLSH7bBIOEPuYtbDAWvmASL6ulQZQRl2W6uvd/GTMvGcBvBZfxRxpERPE
         NXQ7n1AmOk5kaH9w3KJCq94jgHv5w3DN6pacHo6AHj/LgDQOZO+SDYRar5zfV7PmGqXE
         Mlwwf1AFLzNGhx3IOuILRnWdzDhMcVITbG42wsfWjgRcrr1E8TS4b4+qcoTqcWWJy3zt
         urDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777037819; x=1777642619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NnGgV5M3igXJCiYnxgULWkuy2e7zrxF4KNcDwNtdnc=;
        b=CSc3Au8H7Tqf3zIBkL9m7dzkZjurV41NliyYixMYJlwoSQl9Uijdu7iitiS4PalLZR
         G3KYviVr48QWwdZh3SUI7YZCAQ8c+pnv4iiP2V/GwRuwFlTP+5xNFWdiuCLFY5fMW+UJ
         fKmxabrdXkY9MouXa9Cs0F0AQ3YrzbNGKl6R4/ijeQ/jE5mbS/8jFEi4cWPxjkh/4ZSF
         OFmJtlM8GwZl9v2xYhvDY8r/aZUe9mkQ55Eux6d8ioyTUrPCy1qp7k+hf1dvu7Bv8AXN
         yOPJU3lbf8Iq2E87RNDcRo5Z74zCG+woSVKe4aIea03a2RX8Z7dwG8LRb747H7lmP+rU
         A/Fw==
X-Gm-Message-State: AOJu0Ywz2mdifGlFjzVegAAYxGitaBDH8eGLfmM6XqNbjQcsPKxV/RWy
	kURS+2i2N8hp+LNGYS8PqQm4ud1mNdBXrgvgCk5WbxRWkC/2DUg68OLvoz2y5Q==
X-Gm-Gg: AeBDies3YjhS0kEGgZBIrpgcFQP0hNTOOLnltq8REGUhx7pniBh/X+/ArmAyIiI7e1B
	xh52L+EWt+Sp6GszjSF291zf91lxOfAYyuStZk0KXuvVK3f8XE7ZAVG7seQ0q2mwHoOa4h53a82
	afrGqVwmUs17GlGwq1VAL4quI+5b/6H6SrbnO8MuSqHc0SmvIZot3VkDDSUa8N4QP4tOqouQBN1
	MtlDYxsQ/Kk37iO4nEPolHxbHgRvTf//bW89cP1+t0qt9viY3xPS8av/TOCJisIC2/y8v4WceQu
	1VXt7cbNz8trNpN+elSJRPXR+ubCGoqvrrlCF++PFtdyRjD4XLrAd6rhHYe947ojtwzdbFcsIBs
	4NyoGdMraIfl6fVZimGWVWzeLs62/z+CGQCdee31/iBegUBwmAMAt9vTi488QMI/TTqC9EWpZn1
	YpKJa2w0L17h5+GSGlZ2L9pnAtHYgNSpvVJdac3SyqI33E0la0/Ta800rYdVAfvzuDf6TMuZCBx
	ooT
X-Received: by 2002:ac2:4e0a:0:b0:5a4:1672:59d0 with SMTP id 2adb3069b0e04-5a4172c9267mr9627765e87.19.1777037818744;
        Fri, 24 Apr 2026 06:36:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/3] dom0less: various updates
Date: Fri, 24 Apr 2026 15:36:48 +0200
Message-ID: <cover.1776957840.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777037820-C0766DB1-20CA3D03/10/73395122804
X-purgate-type: spam
X-purgate-size: 3979
X-Rspamd-Queue-Id: 480E545FE16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.32 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.171.63.0:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,0.0.0.0:email,gitlab.com:url];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.320];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]

This patch series introduces a new field to track not-yet-used phandles as there
are some use cases where RISC-V needs to know which phandle number could
be used for generating a device tree node.

For example, on the RISC-V side in make_cpus_node() [1] it is necessary to know
which phandle number is unused to use it for device tree node generation.

Here is an example of generated guest DTB:
    cpus {
    ...
      cpu@0 {
    ...
        interrupt-controller {
          compatible = "riscv,cpu-intc";
          #interrupt-cells = <0x1>;
          interrupt-controller;
          phandle = <0xfdea>;
        };
      };
    };

    /soc/imsics@28000000 {

      interrupts-extended = <0xfdea 0x9 >;

      phandle = <0xfdeb>;
    };

    /soc/aplic@d000000 {
    ...
      msi-parent = <0xfdeb>;
      phandle = <0x1>;
    };

Note that phandles for imsic and riscv,cpu-intc are generated in this example
not by get_next_free_phandle(), that is why they have such big numbers.

For non-RISC-V people, APLIC is an interrupt controller (something like GIC in
Arm), IMSIC is an interrupt controller that provides MSI and connects to
each CPU.

So (based on the DTS above) for APLIC, kinfo->phandle_intc is reused, which
will also be re-used for the device node's interrupt property. For all others, I
just introduced GUEST_PHANDLE_LAST [2] and used it for generation [3]. But I expect
that it could be useful for other architectures too so I just moved it to common
and re-use pfdt to understand what the maximum used phandle is.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
[2] https://lore.kernel.org/xen-devel/ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com/
           *************************************

Another thing introduced in this patch series is moving domain type to common
code as several architectures (ARM and RISC-V for now) use them and it
looks pretty architecture-independent. Also, is_64bit_domain() is used by
dom0less common code, so I found it useful also to move is_{32,64}bit_domain
macros to common code.

           *************************************

And the last thing is changing the prototype of make_cpus_node() to be aligned
with other make_*_node() and since RISC-V will need access to the free_phandle field
(even if it will be moved to kinfo->arch.free_phandle) and for the reason that
this ->free_phandle is updated in make_*_node(), the kinfo argument is passed as
non-const.

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2471778654

---
Changes in v3:
 - Rebase on top of staging.
 - Address the comments.
---
Changes in v2:
 - Address the comments from ML.
---


Oleksii Kurochko (3):
  xen/dom0less: introduce next_phandle in struct kernel_info
  xen/dom0less: pass kernel_info struct instead of fdt to
    make_cpus_node()
  xen: introduce CONFIG_HAS_DOMAIN_TYPE

 xen/arch/arm/Kconfig                    |  1 +
 xen/arch/arm/arm64/domctl.c             |  4 +--
 xen/arch/arm/dom0less-build.c           | 14 --------
 xen/arch/arm/domain_build.c             | 17 +++++-----
 xen/arch/arm/include/asm/domain.h       | 12 -------
 xen/arch/arm/include/asm/kernel.h       |  4 ---
 xen/arch/arm/kernel.c                   | 16 ++++-----
 xen/common/Kconfig                      |  3 ++
 xen/common/device-tree/dom0less-build.c | 45 ++++++++++++++++++-------
 xen/include/xen/dom0less-build.h        |  2 --
 xen/include/xen/domain.h                | 13 +++++++
 xen/include/xen/fdt-domain-build.h      | 17 +++++++++-
 xen/include/xen/fdt-kernel.h            | 11 ++++++
 xen/include/xen/sched.h                 |  4 +++
 14 files changed, 98 insertions(+), 65 deletions(-)

-- 
2.53.0


