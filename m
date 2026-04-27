Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFA+AXmH72ksCQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:57:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62054475BCF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295025.1571722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyo-0004kk-Vx; Mon, 27 Apr 2026 15:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295025.1571722; Mon, 27 Apr 2026 15:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyo-0004hj-T8; Mon, 27 Apr 2026 15:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1295025;
 Mon, 27 Apr 2026 15:34:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHNyn-0004gz-Dx
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:34:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHNym-00EOQ0-8o
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:34:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef81ee-5cb7-0a2a0a5109dd-0a2a4502c8e0-32
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:36 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef820c-af86-0a2a45020019-d1558035a419-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:36 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4891f625344so93940075e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:34:36 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c0354sm737076355e9.11.2026.04.27.08.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 08:34:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777304075; x=1777908875; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eA/7bZB0EQlEtV31qKIh/nBHzxk7MFpmf1h7BISbWxY=;
        b=iwI2Jm8irtLbIJIRJJbblMRm2YDeCLSBvEtw1xZQuJCljkUmz8HeU04ZrHb3TOJNV2
         o5QmqXt9iF6mVNXzgnBKflNcVFSGSj799A0H6gdoa51/nbuEbpre11hnjblY8YAZSkzA
         rr14xsN03eBvhncCuatsDiTUrecosOO/G78AcSkKaWT6mKdwygmxIDh/2Nr+/5s/JubP
         rdiH4c0r8KBLGLZAmycKs8UHMzUHI3UDPdaLBPb2DeEeXrnNpGFEryiODz/JPuR6qhK9
         5h9IFhdhE7XS6jWbFl7fWSnQJbr9H2aqIqoltJDefyLUC4xVpCO5KiCtp+KVlNMfWXHi
         Ydng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304075; x=1777908875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA/7bZB0EQlEtV31qKIh/nBHzxk7MFpmf1h7BISbWxY=;
        b=Y2m/MpWoIE5JWBM7IPPzKrUkdUs1gneYZs7vpqsoKKXyCNMm1rvDdr76siqoQUZye9
         vBm90lbK7XLX+ZwHeZPQOg6Ylqsymj+Zd1VFlqLb98uujJH99j4ZcEfeQJl6P062RrIV
         V9KkA32TAbhFfndl4t279ldiCYM3Q2plO+U8B85C/2gNPhChEVJ95TE3R/vyuJ9hY/tP
         bqBOlMQEq1WgDH1Gn6LfwBRti5mY/5DdeQgb0Hhn9xbg8jNvrilMkY+L6+/y8sFVtuqD
         n2PEmzqdw5zGGiJ/pSFpm04PGmMLbzpLXnw1bpvKwR7cAyDLgLf+pzSvLtKS56QUq4gz
         V5Og==
X-Gm-Message-State: AOJu0YwmFLoj55ynmzJviZfDFLYV4oS0zwdKVi7peP7SweBhNW0YYIMJ
	Z7YungPOiX6AVNW60IsdhLsQSzbK3PlWIMWQRscDDjn9Rn2snAPD6sOkEd0+cg==
X-Gm-Gg: AeBDiesW477jKSZ2pCMHIVwa6Irx6OHi+XZHiZ9IVg47kdLSoR8fegxgtQlqm0RyoWh
	P2BwmN1WoGD1b00wMGEAfz94sWy73bdHk35JUiO6+ek9XKjfE4uUIUBHHpvDSoa3RBAFmQPOMuQ
	3DT4BTu6h7KVGvqhD1NmvWMCtS62Uaqbem83QPiKJpAbPWYVKYgrozjSIAI9uCDD84AkyT21XFn
	e+tC/vqwvwxSVTlhLqhUzfrKmzWxDoKalX9/N94sg1UkUxyrZOD2Qxiag3uSGL1ofXPtA2PYnvT
	8H3dMJ/r00eyx9ter01zktgWboMw3czDMNUIBGxpVnwYdaE/zwmlx6SXUUnsrTyntNGmdK3ZLoz
	Vq5SsBU+vSXnSPA+w5Vx6SM6CkMddFuaA8emwmTLchAqnpoptWoTADr22/YfdLe3oos+nozpthT
	OL6b1C0Ufw+XitzaHaBL4VgjWmbHG7a4QmGM0bQ9hZaVd1j7keLv79kQZsimJgBDSkbL064rDVv
	PBs
X-Received: by 2002:a05:600c:3ba0:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488fb8b91a7mr565248145e9.12.1777304073960;
        Mon, 27 Apr 2026 08:34:33 -0700 (PDT)
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
Subject: [PATCH v4 0/3] dom0less: various updates
Date: Mon, 27 Apr 2026 17:34:22 +0200
Message-ID: <cover.1777296786.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777304076-B316D161-4B878CAC/10/73395122804
X-purgate-type: spam
X-purgate-size: 4093
X-Rspamd-Queue-Id: 62054475BCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.31 / 15.00];
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
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,0.0.0.0:email,1.171.63.0:email,d000000:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.500];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
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

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2482499536

---
Changes in v4:
 - Rebase on top of staging.
 - Add Review-by for patch 1 and 3.
 - Address the comments.
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
 xen/arch/arm/include/asm/domain.h       | 16 ---------
 xen/arch/arm/include/asm/kernel.h       |  4 ---
 xen/arch/arm/kernel.c                   | 16 ++++-----
 xen/common/Kconfig                      |  3 ++
 xen/common/device-tree/dom0less-build.c | 45 ++++++++++++++++++-------
 xen/include/xen/dom0less-build.h        |  2 --
 xen/include/xen/domain.h                | 13 +++++++
 xen/include/xen/fdt-domain-build.h      | 17 +++++++++-
 xen/include/xen/fdt-kernel.h            | 11 ++++++
 xen/include/xen/sched.h                 |  4 +++
 14 files changed, 98 insertions(+), 69 deletions(-)

-- 
2.53.0


