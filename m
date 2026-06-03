Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bt0jKWA5IGpJywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:25:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE326388AC
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:25:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SFz156qK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326563.1591967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXA-0003NY-8J; Wed, 03 Jun 2026 14:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326563.1591967; Wed, 03 Jun 2026 14:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXA-0003Ky-5D; Wed, 03 Jun 2026 14:25:28 +0000
Received: by outflank-mailman (input) for mailman id 1326563;
 Wed, 03 Jun 2026 14:25:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUmX8-0003Ks-Rw
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:25:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmX8-00Fxjx-8W
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:25:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a203940-bab6-0a2a0a5309dd-0a2a4504d000-46
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:26 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a203956-1dec-0a2a45040019-d155da2da9fa-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:26 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-befd83e0521so165278566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:25:26 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0517721c2sm162199766b.3.2026.06.03.07.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 07:25:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780496726; x=1781101526; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yo8Lt/DDIuDA5NatzvFT3jFUg8fSKHYGam9lRTcri+U=;
        b=SFz156qKqYeInY3FnXoEAhyUZa2F7I2xmEwenK9H62JymctMAC8iICtrX117SpVGqs
         U1MUSimI2LSsXxb909FQczDlL3oWPUZETeYSFXQs201McVp3R7RnRcL4FZYex9Jod2N4
         GFpXg2DLR12kf43ZbdvaIa9u2YriUHNyTS2p1X6VWOZKOtULvHNeleoAkSzyTHWeZUmm
         duvxtMb9QclfEHrWHsJGe6TsrGUlZt02aTwoVABo2lE7YhDFVVCTC4IHeepq9aUGfRxR
         aiPUUrT6FgKn3tTWUKeDvRDDF5FRk2SQqjXlBA28wyzz1yjEs4KxWgtTkPOdHBq1cOKz
         l7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496726; x=1781101526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo8Lt/DDIuDA5NatzvFT3jFUg8fSKHYGam9lRTcri+U=;
        b=L5gm/2dQPprHlbGREinMSAJ3tJwcGO6Dt2g9wMdc3qplRZbiiq/BortYU+OeETUW1R
         8SoFu62yvuQm9jHf9MLjYfJCpKpwWdsXW3vjjVsTpF2ubOTqaXRtfwPkX/OLS1W91aFB
         GuEH2P8cWHVnJGpJpq4aK546X0Xoa0SRd8PVVkhrDOYmTwKQ4DenfxZJLXpKtqtTAwUo
         JSS8HqVKHJjrdc2Ajx9i7xAZaiBWafmIYBeLswybx6Xv3KsJKVgAL9ABM97EfP4vF/Mi
         tC10dP7SjrOda25yFAhmHAC0iuigxd0AKlfsF1c/L8pUg3op4Vmh+BrC/wy3aAgKTQ9p
         dPNg==
X-Gm-Message-State: AOJu0Yzn9zIIK3Vw2QnFbhNTzwz334f9pK3uNuvJaT1EgM1ozgNXNkuO
	R23Exexb7vnJLu76IHAtjpv6euNKmPepS7orSjtaCxJptBewkOuJmUT4SCM83A==
X-Gm-Gg: Acq92OHu8nVvCRnrq/I3gkz8vcDVtkZOk9vX1u8HKFoyVNlYH90K6KjhgZjwZtXlRHW
	2SFypdbwDSx2l77wUB0cbu8eb/GQj0Pyme7r9AYH4eVHaHzHZX6wBawkSkYgKLRppqJ8jXcVcRk
	uTSHJzQxD31JP+qeqI+jHy9gwzAoYoZ8x8QfGbZDO74GfmCX/8Ezuy7u3EUR5rNV+ufIj3ecMrK
	xTNzO/UMdK0E2QpMVHTSaRry2K2Yu3PnaSdwF6hc/Ze4Mh3hdYeM/DuL45FlOudyUQwmmZgizsu
	sn2vfm/fDaNjoT31mxO3DZfE/HMT5JnZ+tb6+qB7FqBlRF9B6hqNbK/lDCKYqEmXQboV7iPHxAm
	okoYvO4sKiGzpOBAqyoWSS/C6yy72DI9QEkyuJaJ9Y8jNoFwo/YZKFr5NqeHYBZPrfXL0ogey9N
	OT1itcMIhlurPRCFIkyDTuDjRgeJkAnuAIyZ05WLwgXzp67fkZ4kuaJ2YszGsxJkyxzpw2V35SN
	lG3NlNvnke/tqkL8Q==
X-Received: by 2002:a17:907:2d91:b0:bed:15ff:5fe2 with SMTP id a640c23a62f3a-bf09f44243bmr168592966b.17.1780496725652;
        Wed, 03 Jun 2026 07:25:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 0/2]  UBSAN fixes
Date: Wed,  3 Jun 2026 16:25:16 +0200
Message-ID: <cover.1780494838.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1780496726-2B3673FF-BB1FF3E7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1324
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DE326388AC

During Baptiste Le Duc's work on adding CI stuff for RISC-V several UBSAN
issues were found.

This patch series resolves the found issues.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2573666715

---
Changes in v3:
 - Reorder patches in the way that ready to be merged go first.
 - Merged to upstream/staging:
   xen/riscv: fix switch_stack_and_jump() for range beyond 1M
 - Add R-by for patch "libfdt: fix UBSAN null pointer in fdt_property()".
 - Address the comments from ML.
---
Changes in v2:
 - Address comments from ML.
---

Oleksii Kurochko (2):
  libfdt: fix UBSAN null pointer in fdt_property()
  xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page

 xen/arch/arm/Kconfig       |  1 +
 xen/arch/x86/Kconfig       |  1 +
 xen/common/Kconfig         |  3 +++
 xen/common/Makefile        |  2 +-
 xen/common/domain.c        |  6 +++---
 xen/common/domctl.c        | 11 ++++++++---
 xen/common/event_channel.c | 14 +++++++++++---
 xen/common/event_channel.h |  6 ++++++
 xen/common/event_fifo.c    | 11 ++++++++++-
 xen/common/libfdt/fdt_sw.c |  3 ++-
 xen/common/time.c          |  2 ++
 xen/include/xen/shared.h   |  7 +++++++
 xen/include/xen/time.h     |  4 ++++
 13 files changed, 59 insertions(+), 12 deletions(-)

-- 
2.54.0


