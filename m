Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id olh+GxJlJmpQVwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 08:45:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE565337E
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 08:45:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NVm6BicM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1331401.1593966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWTis-0002IJ-Jk; Mon, 08 Jun 2026 06:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331401.1593966; Mon, 08 Jun 2026 06:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWTis-0002FW-GJ; Mon, 08 Jun 2026 06:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1331401;
 Mon, 08 Jun 2026 06:44:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wWTiq-0002FQ-NJ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 06:44:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWTip-008cA7-LW
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 08:44:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a2664c3-bab6-0a2a0a5309dd-0a2a4508c7be-26
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 08:44:31 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a2664cf-63b5-0a2a45080019-d155da31b8c9-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 08:44:31 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bec450b950dso543451666b.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jun 2026 23:44:31 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.204])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051e9aa33sm815061566b.24.2026.06.07.23.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 23:44:30 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780901071; x=1781505871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6S7JrmdgSdxCu8BfAjbSToCwMHMLi8JebgsSdsEiakI=;
        b=NVm6BicMBMBTKrQ+HM6oTN43Qh9sQNhaawYWIwmhStqJBkDo/UC/EyJ4iqYiUOS0/Y
         zEoRzdksTF1moTAxt/ialzkk07jrXbtzrElm4pMnSmLyn+d0DEODBDypWS+e0Lq4eKzu
         1z5lsftt5XoMdzmO9U6XBpvURlyU1MzgRk18f4rWPaZMI8n9NaSeHFk2V2V3/s3II9Fh
         F2gbYnK55q2904qx81csV5GmfCEi3iMfvg4+qKfQmCm6p6n5R7TlceWkP4dujCmGePlQ
         LWDaGnFZM2gkhQJudD6YyPgW+BkjPawrF7d51BCylWIYGlE4i8CEYI9xGJPGSwXr315A
         /jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901071; x=1781505871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S7JrmdgSdxCu8BfAjbSToCwMHMLi8JebgsSdsEiakI=;
        b=H9s8DyUmQb9Gx9QJmLWjr+lKuL5A8Os56aXx+m456Y9RayG6G8rA7tswTWwDC+ajsV
         oMWExmtwi8ad9tR6dyL+TaMbJyZObcUA7NxvVpNN8hxDvrr0vtl11xjJQxNeoxA4RQk4
         +IJFEdwQUD3LkqnS6ED8zoY3W1TsYzyARFwn9Q93PJmZ90cTBQQPJDJnpWfa4hJ6fdhv
         Gh6PIkdw2UwiTK6itWD5+gPigRFkXkAVqu2zYiMrIcJgQLSgm9BcjghYGdt9sE/AtnoR
         sL95Pyar4QRyz3A5yNHhQR+vU9gRn+AdVreqAn1iNTnknC0jiPlX6XaphdtZ2rBnpnRT
         WX3g==
X-Gm-Message-State: AOJu0Yya4KH54y7Xt1/YVtjw9R3QQDaIgSM5Cc3JtyeDlEuOJJH5Vfwg
	duyrNlmmOMg6oBc3hvSLXI3ZtUv3wXbWNEDL/GWgLt+fOZzQ21trRgufg2ue9g==
X-Gm-Gg: Acq92OHETQBHTdmQ8Fjm14+4LGFtaL1H+bsnRL6ycn+qfbM07Z9mxmXob67MJNOK5Oc
	7n/WeKZm234ox4yKrnYtBuSnpSdx/OV0/nGb0YQXe/LLYzw7iWqVjYHot1E0aLaR8JvXTtMsStD
	XdsLbgL3P6J3K1CCu7anKZRoqjkz2cIEBgI8ht/k3oCHEBVabLQzhyOA1NeqQtWqCi2O6JerK8i
	M9Q2l5UCn/OqN9Q33niTlgN6I5DrCCoNyp59Z5x7FJD/db2bwNpibBxLBRX4pUBobER0gpJAoaB
	BEGPSee7cYNCO/JOnqh22Ez3rwikJI/GOeKQjCI32Cf+6CE5swCca7rJRarsb/euFMFy6dYycrp
	0jtU4NrU8fqMnwhLcV/vpztaZtFN/V7lMYNTD9ACQ+qarJzQEqaaPeQlj6ortqYXCn+0WDCmHpj
	JRGn5VqhRcl/w5r+Skh7YFP6hv/WhnQr9Z2uzZFg==
X-Received: by 2002:a17:907:2d20:b0:baa:1db1:ef9b with SMTP id a640c23a62f3a-bf370c61ff0mr703376866b.18.1780901070785;
        Sun, 07 Jun 2026 23:44:30 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v3 0/2] xen/arm: validate hwdom first bank boot placement
Date: Mon,  8 Jun 2026 09:39:17 +0300
Message-ID: <cover.1780896733.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1780901071-BFD7BDB1-9DEBF4DD/0/0
X-purgate-type: clean
X-purgate-size: 2288
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[epam.com,vates.tech,suse.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFAE565337E

From: Mykola Kvach <mykola_kvach@epam.com>

With LLC coloring enabled, the hardware domain memory is allocated by
allocate_hwdom_memory() instead of relying on the fixed direct-map
layout. Since de99f3263555 ("device-tree: Improve hwdom memory
allocation for DMA"), the allocator prefers lower host regions, but the
first-bank filter still only enforces the old 128MB heuristic.

A low candidate bank can satisfy that heuristic while still being
unsuitable for the Arm kernel/DTB/initrd placement rules. Split the Arm
placement logic into reusable helpers first, then validate the candidate
hardware-domain bank 0 against those helpers before allocating it.

Link to CI tests:
  https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/2583876433

Changes in v3:
- Add Oleksii's Release-Acked-by tag.
- Patch 1: update the reverse xg_dom_arm.c placement comment and mention
  the MB(2) mechanical cleanup in the commit message.
- Patch 2: rename the arch hook to
  arch_hwdom_first_bank_can_fit_modules(), document its contract, and
  drop the redundant placement checks noted during review.
- Fix the duplicated "device-tree:" subject prefix in patch 2.

Changes in v2:
- Split the previous single patch into a behavior-preserving Arm
  placement refactoring and a separate hardware-domain first-bank fix.
- Rename find_module_placement() and place_modules() to use DTB/initrd
  terminology.
- Pass ramend to find_dtb_initrd_placement().
- Update the stale tools/libs/guest/xg_dom_arm.c reference.

Link to v1:
  https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola._5Fkvach@epam.com/

Mykola Kvach (2):
  xen/arm: split DTB/initrd placement helpers
  device-tree: validate hwdom bank 0 boot placement

 tools/libs/guest/xg_dom_arm.c           |   2 +-
 xen/arch/arm/acpi/domain_build.c        |   2 -
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/include/asm/domain_build.h |   4 +
 xen/arch/arm/include/asm/kernel.h       |  10 ++
 xen/arch/arm/kernel.c                   | 186 ++++++++++++++++++------
 xen/common/device-tree/domain-build.c   |  31 ++--
 xen/include/xen/fdt-kernel.h            |  14 ++
 8 files changed, 196 insertions(+), 61 deletions(-)

-- 
2.43.0


