Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BACE402D7D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 19:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181246.328318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNebc-0002lB-5Y; Tue, 07 Sep 2021 17:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181246.328318; Tue, 07 Sep 2021 17:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNebc-0002i3-2O; Tue, 07 Sep 2021 17:09:56 +0000
Received: by outflank-mailman (input) for mailman id 181246;
 Tue, 07 Sep 2021 17:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjNB=N5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mNebb-0002hx-9x
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 17:09:55 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c53e1a52-308e-47af-b219-550dd6532ed3;
 Tue, 07 Sep 2021 17:09:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m28so20870217lfj.6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Sep 2021 10:09:53 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t20sm1059533lfk.157.2021.09.07.10.09.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Sep 2021 10:09:52 -0700 (PDT)
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
X-Inumbo-ID: c53e1a52-308e-47af-b219-550dd6532ed3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Eb3nTuViuxkM2u25OPGYlL8g/e8tL46q5jZZVa4g28I=;
        b=KP6THAg3j2h3laFCwGL5cczIeTLwtChwkQPOmjuYWuwXVJm4iCDbMNWljxQJsS51V9
         U3QfumpMjey7dx9fzCA33igvERXlRiqcS5hQOMLSdRW1inlq9p+2Jdroz4Ysv1y5uw/d
         IgE4zEBsFvGfq4iDslJ/TuWV1T72ct9WtyozmWBWwyxwO7XLhULP92KcQa0ZvFs8/G4y
         R8w3VoT3fmYcQYXhiL4Pab9DpIxC8Ie5CnTuPBVViXdWfklFFZ3JTp9AjifpBphL33YA
         bwG+qQs+po0ALxhyPPzAYPU9apCnC0AI2bBO+oNmNMsyDXu1FG7KbY50ERp5NdOKkYzX
         PuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Eb3nTuViuxkM2u25OPGYlL8g/e8tL46q5jZZVa4g28I=;
        b=rCbKOLEQfKWv88OJ5NCLMptP3XtGvZmm+Q4VrWI2eWNsVmX+xE60PFXXaegJkMKV2l
         6fQCDqeAa0esEXcdfihoGAiZU8a/o8wFcJdGvkGWESIeCa+ytHKH9daER6KRnVWwSg/v
         +GS6KfUqaQto6W2XNA7I68iTNamfOuyDgkJ92OI0vgsBFg0mxfbz8HnlBtABBfXkfs1G
         PQz7i2NAKbFJ3f0w7Mstcg+0tLYHIbXtp2B3Sd1ch8tcPZQfBwktHr9XlcYwOtzY5WEP
         oSlzUjqd0Y7Pi+bEDPcu1Xzw3y8h535vY91RehsUgcvUcZFoqRcyv9guKlBuig+GxBkS
         ik2Q==
X-Gm-Message-State: AOAM531X23uxe2uClcDe7vWmU0+xElO2HGQe7g6wYy173CivB8EilEPz
	71SwsOQPOPCiEfrja29rhXjQRBL7Ewg=
X-Google-Smtp-Source: ABdhPJzrrQuBHf/px86brxNUtIXtsL3f4TvChuTwFU0eFe8bl8AjmS+1W0LXx6/jcCJ7EOw5P8BGsA==
X-Received: by 2002:ac2:551a:: with SMTP id j26mr13864021lfk.354.1631034592707;
        Tue, 07 Sep 2021 10:09:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 0/3] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
Date: Tue,  7 Sep 2021 20:09:35 +0300
Message-Id: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find an initial discussion at [1].

The extended region (safe range) is a region of guest physical
address space which is unused and could be safely used to create
grant/foreign mappings instead of wasting real RAM pages from
the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and
advertised to it via "reg" property under hypervisor node in
the guest device-tree.

The extended regions are calculated differently for direct mapped
Dom0 (with and without IOMMU) and non-direct mapped DomUs.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain.
- The ACPI case is not covered.

Also please note that we haven't figured out yet how to properly 
extend the Xen hypervisor device-tree bindings on Arm (either via new
compatible or via new property). I decided to go with new property
for now, but this can be changed. This uncertainty is the main reason
why this series is marked as RFC.

Patch series is also available at [2].

The corresponding Linux changes is not in a good shape now (require
some cleanup and refactoring), I will publish them once put them
in order (I hope, it will be in a few days).

[1] https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
[2] https://github.com/otyshchenko1/xen/commits/map_opt_ml2

Oleksandr Tyshchenko (3):
  xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
  xen/arm: Add handling of extended regions for Dom0
  toolstack/arm: Add handling of extended regions for DomU

 tools/include/libxl.h            |   7 ++
 tools/libs/light/libxl.c         |   2 +
 tools/libs/light/libxl_arm.c     |  92 +++++++++++++++-
 tools/libs/light/libxl_types.idl |   2 +
 xen/arch/arm/domain_build.c      | 233 ++++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/sysctl.c            |   2 +
 xen/arch/x86/sysctl.c            |   2 +
 xen/include/public/sysctl.h      |   3 +-
 8 files changed, 338 insertions(+), 5 deletions(-)

-- 
2.7.4


