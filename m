Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDPbC8qa8WkliwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE148F74E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296938.1573066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiE-0007sU-NZ; Wed, 29 Apr 2026 05:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296938.1573066; Wed, 29 Apr 2026 05:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiE-0007pX-GS; Wed, 29 Apr 2026 05:43:54 +0000
Received: by outflank-mailman (input) for mailman id 1296938;
 Wed, 29 Apr 2026 05:43:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wHxiD-0007oz-Hj
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 05:43:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHxiC-002HZP-EM
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:43:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19a93-2eae-0a2a0a5409dd-0a2a45099eba-16
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:43:51 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19a97-2497-0a2a45090019-d98c6eacb2e2-1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:43:51 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 487A32BCE;
 Tue, 28 Apr 2026 22:43:45 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.90.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F20F3F62B;
 Tue, 28 Apr 2026 22:43:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777441430; bh=ZkzXf1I0vx36Gf7OT0TpzCtmfOpLa/wX5cHp8GKtXYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=o7M6Qm9FMba1I5/874p2BsOS9w4XUG1FccIfjsYOIZ86cRsVo9ynejMq5VN9g0Tp8
	 oHKSyeAwcQgJLbqDU1xVkhAvYxs8RTaHYFyzPv5YpzXkc87DXne2xGa6ML3A6I2qim
	 BAhgAkorP2WoEb1bZBldJMNMhbYPOTDPnCwoxOgg=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 0/6] xen/arm: ffa: Harden notifications and enable VM-to-VM delivery
Date: Wed, 29 Apr 2026 07:43:21 +0200
Message-ID: <cover.1776955622.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1777441431-412B2A53-0932781D/0/0
X-purgate-type: clean
X-purgate-size: 2600
X-Rspamd-Queue-Id: 68BE148F74E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.957];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This series hardens FF-A notification handling in the Arm FF-A mediator
and completes local delivery for non-secure VM-to-VM notifications.

Hardening and state handling (Patches 1-4):
1) Fix notification pending interrupt delivery when vcpu0 is offline by
   reusing a common global NPI injection helper.
2) Replace the single hypervisor notification boolean with a protected
   HYP bitmap and keep bitmap lifecycle tied to the cached endpoint ID.
3) Tighten notification parameter validation so malformed BIND, UNBIND,
   GET, and SET requests are rejected consistently before reaching
   cached state or the SPMC.
4) Preserve the secure pending indication until secure notifications are
   retrieved, protect the secure pending latch with notif_lock,
   serialize SPMC INFO_GET polling, and keep INFO_GET return width
   consistent with the caller.

Local VM notification delivery (Patches 5-6):
1) Track non-secure VM notification bindings locally, promote pending
   state to a per-bit bitmap, and validate BIND/UNBIND requests
   against that state.
2) Deliver non-secure VM-to-VM notifications locally, track whether a
   local NPI is already armed, and only advertise notification support
   when firmware capabilities or CONFIG_FFA_VM_TO_VM actually provide
   it.

Backward compatibility: v1.0/v1.1 guests remain compatible. Valid
guest-visible notification behavior is preserved; the series only
tightens malformed-request handling and enables local non-secure
VM-to-VM delivery when CONFIG_FFA_VM_TO_VM is enabled.

Gitlab branch with patches:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa/-/tree/vm-notif/v2?ref_type=heads
CI pass result:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa/-/pipelines/2474955136

Changes since v1:
- Keep pending notification state stable across failed local NPI injection.
- Tighten local NPI armed-state tracking for Hypervisor and VM notifications.
- Details in each commit message.

Bertrand Marquis (6):
  xen/arm: ffa: Fix NPI injection when vcpu0 is offline
  xen/arm: ffa: Track hypervisor notifications in a bitmap
  xen/arm: ffa: Tighten notification parameter validation
  xen/arm: ffa: Preserve secure notification state when polling SPMC
  xen/arm: ffa: Track VM notification bindings locally
  xen/arm: ffa: Deliver VM-to-VM notifications locally

 xen/arch/arm/tee/ffa.c         |  24 ++-
 xen/arch/arm/tee/ffa_notif.c   | 371 +++++++++++++++++++++++++++------
 xen/arch/arm/tee/ffa_private.h |  25 ++-
 3 files changed, 345 insertions(+), 75 deletions(-)

-- 
2.53.0


