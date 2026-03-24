Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IP2GaCDwmn2eQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:29:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2072308398
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260571.1553835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sT-0000kp-9S; Tue, 24 Mar 2026 12:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260571.1553835; Tue, 24 Mar 2026 12:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sT-0000ip-5d; Tue, 24 Mar 2026 12:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1260571;
 Tue, 24 Mar 2026 12:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehxs=BY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w50sR-0000id-Do
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:28:55 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052c1b96-277d-11f1-b166-2bf370ae4941;
 Tue, 24 Mar 2026 13:28:53 +0100 (CET)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b97a06d7629so701816166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:28:53 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.190])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f43ae8sm638180966b.6.2026.03.24.05.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:28:52 -0700 (PDT)
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
X-Inumbo-ID: 052c1b96-277d-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774355333; x=1774960133; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Kob3w5MlN/prcibwmQMrffsAscHNoAh+y9mXjEqsnA=;
        b=Zpa1vhMvXx91vgsjzm3BtAmHBUAEOxMd56fP2+JzQQQXd4B23JqAtOXR3kFNksIONV
         uWTMJRDjwv3lTndP61VPKLiWOHhYjKFffZ3CZH/jpq39yDaspEIUZPTikIPvX6GLOh0+
         WKBCSTNOnd7NoYH+AhA6Q9SBU6iPjttjmllINPpQyktZxHgql3QKXNMddf1eJcoJchcy
         odZjeZZk3kBCeJABUYxcTavMZwX8hFGgfDT7FqvEkKTZjebc8geimKvZCLoXjS7FEov4
         w+3f+Vjj1Wc77Uv3GEShuDEZZTYLYkK4WR6QtIDERK88zLmgul37tswemLBKnjd18iV7
         cAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355333; x=1774960133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Kob3w5MlN/prcibwmQMrffsAscHNoAh+y9mXjEqsnA=;
        b=QBOgbui3kVFOyX1gSisvSUEgd+XXlP++BZ0pf47GNSW4FWlgQkMZKE4B+lm6SIpl9J
         DdcSF2xU6Xk4Y3nmbfb1mBpqc9npA7zQA1O3V4AaCufv7S/TQmHzUoZA7ydwUNNKi+7Q
         kxO5XdpZ8MhVDaZLtH6li2NyGmJH7+jQCJvNYxVkeDLX9XAj7D5A5BsgDmykzXltIWED
         u7M4+A33Y4q0nBYUz2hKXYXlgsJVfwdzCPolbqEdM0/qvDxTuvHJUZkRYzAoDKUJkei2
         M7v/ODweYG6a7SUITPiX+OmCYAadfdbw8U6OcsXDOEKcADtvAHDj+A119wUIkKsh5ZSl
         2g/g==
X-Gm-Message-State: AOJu0YzUKjQQY1BMzrBlmzqr1WbFVzPWhvNOUjIaFEGT7t1mRBEKs5zH
	y+faf7arF0lfJ8/gkMXKMRFEdAjzWOb1pdig2oRLjZxwrvvfOWQb+DQXlbZNxA==
X-Gm-Gg: ATEYQzxpeTvJtwacajBKyibS2jxO+MfJh6oVX1m12woobDYR2bg+oaIOeC+IXFQym7V
	X4iHWZ+7faVHOqSy9bxgv98X6LaQDNpnda0Nr68kiFc/BY3jEZPS1VRxgYnKbJygPfC2L+b2Rnu
	p/lv/n+3IRyFfwvyoXmpI3ffd8Bot3h+dFyvrmxz97Jd1a4BlIPkoWzxakQOmQhPK87W9w85LDx
	U+2dXqzGv8USGLB4exhMmueJaZ/i/sLwMxTVipjxV7CCyTdhELsa58+9EkOO3jm0sJw7cGAbufP
	MH6J1XQN5SKe84vXZ4Lm2xGru/lRM5qKZXkoZ0o1WWZlwvqC2scj1BP8aIIZMg7ZxWGcbEU1wxL
	gWIzAduHpcBLUeImLfTEHCySrrzQbRELeNoMss7LbC/40SUBRsUg/+VXSSge5mozYTy/wnZUrqN
	RE2NAbdJX1qlNlP8UtbClhAXkUgDM=
X-Received: by 2002:a17:907:e114:b0:b97:c71c:f51 with SMTP id a640c23a62f3a-b982eea0c65mr721284366b.0.1774355332758;
        Tue, 24 Mar 2026 05:28:52 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v17 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Tue, 24 Mar 2026 14:26:33 +0200
Message-ID: <cover.1774353053.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,gmail.com,xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid,changelog.md:url];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E2072308398
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

This patch series introduces the initial support for guest suspend
and resume on ARM platforms using the PSCI SYSTEM_SUSPEND interface. The main
goal is to allow ARM guests to request suspension using PSCI and be resumed
by the control domain (e.g., via "xl resume").


Background

The PSCI SYSTEM_SUSPEND call is part of the PSCI v1.0+ specification and is
used by guests to enter the deepest possible power state. On Xen/ARM, we
emulate this interface in the virtual PSCI (vPSCI) layer for guests.

This series includes:

1. A new vPSCI implementation of the PSCI SYSTEM_SUSPEND function for guests
2. Documentation updates to SUPPORT.md to reflect PSCI and vPSCI support status
3. Enabling "xl resume" command compilation for ARM, which was previously disabled


Usage

For Linux-based guests:
  - Suspend can be triggered using: "echo mem > /sys/power/state" or "systemctl suspend"
  - Resume can be performed from control domain using: "xl resume <domain>"

For more information, refer to the official Linux kernel documentation on power management.

Note that currently, SYSTEM_SUSPEND is supported only for guest domains (not for
the hardware domain).
---

This is the first part of previous patch series and originally consist only
with necessary changes needed for guest domain suspend.

The second part can be found here:
    https://patchew.org/Xen/cover.1765472890.git.mykola._5Fkvach@epam.com/
---
Changes in V17:
- PSCI SYSTEM_SUSPEND is no longer advertised to the hardware domain via
  PSCI_FEATURES.
- Split arch_set_info_guest() into separate validate/apply helpers while
  keeping full PSR validation on the public path.
- Build and validate the PSCI vCPU context during SYSTEM_SUSPEND and store
  it in resume_ctx.
- Make resume use only the prevalidated context and free it afterward;
  add resume_ctx_reset() and cleanup in arch_domain_destroy().
- Make arch_domain_resume() void and drop the error path from domain_resume().

Changes in V16:
- Refactor error handling in domain_resume: move logging to generic code,
  use explicit return code checking.
- Make context clearing conditional on success in arch_domain_resume.

Mykola Kvach (4):
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  tools/xl: Allow compilation of 'xl resume' command on Arm
  SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
  CHANGELOG: Document guest suspend/resume to RAM support on Arm

 CHANGELOG.md                          |   4 +
 SUPPORT.md                            |   5 +-
 tools/include/libxl.h                 |   1 -
 tools/xl/xl.h                         |   4 +-
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_migrate.c                 |   2 +-
 tools/xl/xl_saverestore.c             |   2 +-
 tools/xl/xl_vmcontrol.c               |  12 +--
 xen/arch/arm/domain.c                 |  86 ++++++++++++---
 xen/arch/arm/include/asm/domain.h     |   7 ++
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/suspend.h    |  27 +++++
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 146 +++++++++++++++++++++-----
 xen/common/domain.c                   |   4 +
 xen/include/xen/suspend.h             |  25 +++++
 17 files changed, 277 insertions(+), 57 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/include/xen/suspend.h

-- 
2.43.0


