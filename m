Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OzoDlBQsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4EA2554B4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250383.1547849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a1-0001Sx-SO; Tue, 10 Mar 2026 17:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250383.1547849; Tue, 10 Mar 2026 17:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a1-0001QB-Pa; Tue, 10 Mar 2026 17:09:13 +0000
Received: by outflank-mailman (input) for mailman id 1250383;
 Tue, 10 Mar 2026 17:09:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a0-0001Q4-55
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:12 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dac0d254-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:10 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4852f73d0a3so29537295e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:10 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:08 -0700 (PDT)
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
X-Inumbo-ID: dac0d254-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162549; x=1773767349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fS3m/olTHFR+S5wMOXBBTVEk4F6WPK3GOur8e80WWZg=;
        b=O6ssJ5irhIT4Rn4mYXzd7xFT0mBwKwfo+YpZb3gcKjPAx+pQeRYbhpQ1BROdWBUsYS
         7T7Y0NDkbivQiygkK5ClZDG2kQYYtIuXciD/hHh+HcGIubGn5vkL2vdORSZ70NiqRHaQ
         f92s/3LT79a7OdVowAqZB3J33ZPPyxsAF0uXb9umoJuLo8E9W1MetVFBkd2p4hi0ynaU
         n22sAZ7kdMNFvrlkXRKYTwtY3m3izZ3wQWqfzoBYwXbIsIj+d9At1r0ryr9CwlSZWm/O
         gUWn08203WG9MbMULgr8mprifoVS+XduRgVzauQPfN0OssojwaLLtchsHerXrB7uYsBH
         uYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162549; x=1773767349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fS3m/olTHFR+S5wMOXBBTVEk4F6WPK3GOur8e80WWZg=;
        b=BzL+qwv/EPkJ/JZoJP7XOuZ/j9BP9UyWp/Yzr3M9p8i8+UMti9PFguy2m1JCBCcIlT
         LpECCmq6SchQDrPny6Mn19rSas7oU3Uw2AAAtSejNTbZBFwA+JtaGXIbHfsf3o2nGrFQ
         p68w19PeVk4LES86y9vqOHgBqMlX8Yiv3uPszwZRX/Vp0v7y2q5m+Uh/1QzuVQD38K23
         guodkvV0WWt5fyuP0AYdh+8j/b6zm4g6euDzNZcS+KEs37Qqmdq+hFDz1f+qhsaiVCNV
         wojjMqCwfFb6MCn8N54u7La3FBX6X9rntDJYlO8NneX5z3sHUNYLzbQb06mshWqoympD
         htnA==
X-Gm-Message-State: AOJu0YyUrGIPDSStL6W/37bCoK77GVKVR7uUqPP57u32ngE6NKDnZTpc
	1/ybe6UvDn10BAamxZWt7nc8JCdW9xc2vXxQowj38tOETq0sXE2S08MsMOUh6cYD
X-Gm-Gg: ATEYQzxhN7konqIaqbkSmUnskjXFnjpqqFAVqiocDHfcFcLPTjzrkNq8rVCvzK2h7hp
	mk4CBDRnn2oZreGEWsGSLx3LIfoGV6OW+yjwTm8gDWqSVsoVsjh4x+EqAJm3I6lHnnIZ8lwGikn
	2r0UHm+BPSENBT9jLosp0QPg4lGQPkTowjTfUYNc6FV9fDoq4oagL6IYI99Kz9Duh7ClCLkgERR
	PRpJAtacdiQF/QYT4i3pG/p5TaewMV6fiPYHLn3OWiC286vdk0/st7tvFkPcpl4/Iba40cRMq5o
	xNjIsnTG1OfmTbzwJa+DwxD0/gzntr1Uc0X5C2BHkpAXXjA3pELfp/ZKaUxK04mY+JHHoqrVhkF
	OsdajdW3d8Q3DbJ5TZtjP3Iorly0NCPralJl7hCaDH43ILiJgOKSmjf5jv1cM2vhc8Ekmo4+H3w
	b7tfmZZ7OMBDrEV2sNu7WmhAfT3flBOBslWHpQYgMnegdA8sASElEbPW6tALFETk303o/bdA==
X-Received: by 2002:a05:600c:6387:b0:485:3983:aba8 with SMTP id 5b1f17b1804b1-4853983ad1amr137276295e9.27.1773162549157;
        Tue, 10 Mar 2026 10:09:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 00/27] [RISC-V] Introduce enablemenant of dom0less
Date: Tue, 10 Mar 2026 18:08:33 +0100
Message-ID: <cover.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD4EA2554B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This patch series reprensent a bunch of patches necessary to enable
common part of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

This patch series is based on [1], but a lot of patch could go even without
it.

[1] https://lore.kernel.org/xen-devel/cover.1770821989.git.oleksii.kurochko@gmail.com/

Oleksii Kurochko (27):
  xen/riscv: Implement ARCH_PAGING_MEMPOOL
  xen/riscv: Implement construct_domain()
  xen/riscv: implement prerequisites for domain_create()
  xen/riscv: rework G-stage mode handling
  xen/riscv: introduce guest riscv,isa string
  xen/riscv: implement make_cpus_node()
  xen/riscv: implement make_timer_node()
  xen/riscv: implement make_arch_nodes()
  xen/riscv: implement make_intc_domU_node()
  xen/riscv: generate IMSIC DT node for guest domains
  xen/riscv: create APLIC DT node for guest domains
  xen/riscv: introduce aia_init() and aia_available()
  xen/riscv: add basic VGEIN management for AIA guests
  xen/riscv: introduce per-vCPU IMSIC state
  xen/riscv: add very early virtual APLIC (vAPLIC) initialization
    support
  xen/riscv: implement IRQ mapping for device passthrough
  xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h.
  xen/riscv: add vaplic access check
  xen/riscv: emulate guest writes to virtual APLIC MMIO
  xen/riscv: emulate guest reads from virtual APLIC MMIO
  xen/riscv: introduce (de)initialization helpers for vINTC
  xen/riscv: implement init_intc_phandle()
  xen/riscv: call do_initcalls() in start_xen()
  xen/riscv: init rcu
  xen/riscv: setup system domains
  xen/riscv: provide init_vuart()
  xen/riscv: add initial dom0less infrastructure support

 xen/arch/riscv/Kconfig                  |   2 +
 xen/arch/riscv/Makefile                 |   6 +-
 xen/arch/riscv/aia.c                    | 135 +++++++
 xen/arch/riscv/aplic.c                  |  83 +++++
 xen/arch/riscv/cpufeature.c             |  33 ++
 xen/arch/riscv/dom0less-build.c         |  63 ++++
 xen/arch/riscv/domain-build.c           | 175 +++++++++
 xen/arch/riscv/domain.c                 |  41 ++-
 xen/arch/riscv/imsic.c                  | 155 ++++++++
 xen/arch/riscv/include/asm/aia.h        |  28 ++
 xen/arch/riscv/include/asm/aplic.h      |  37 ++
 xen/arch/riscv/include/asm/cpufeature.h |   2 +
 xen/arch/riscv/include/asm/domain.h     |  17 +
 xen/arch/riscv/include/asm/imsic.h      |  24 ++
 xen/arch/riscv/include/asm/intc.h       |  51 ++-
 xen/arch/riscv/include/asm/p2m.h        |   9 +-
 xen/arch/riscv/include/asm/setup.h      |  21 +-
 xen/arch/riscv/include/asm/vaplic.h     |  36 ++
 xen/arch/riscv/intc.c                   |  60 ++++
 xen/arch/riscv/p2m.c                    |  91 +++--
 xen/arch/riscv/setup.c                  |  14 +
 xen/arch/riscv/stubs.c                  |   9 +-
 xen/arch/riscv/vaplic.c                 | 449 ++++++++++++++++++++++++
 xen/arch/riscv/vmid.c                   |   2 +-
 xen/include/public/arch-riscv.h         |   3 +
 xen/include/public/device_tree_defs.h   |   1 +
 26 files changed, 1488 insertions(+), 59 deletions(-)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/dom0less-build.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.53.0


