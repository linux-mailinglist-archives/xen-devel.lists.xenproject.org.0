Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCG7ObzHnmkuXQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 10:58:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0777195629
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 10:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240477.1541846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBee-0002mv-AT; Wed, 25 Feb 2026 09:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240477.1541846; Wed, 25 Feb 2026 09:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBee-0002lT-7r; Wed, 25 Feb 2026 09:58:04 +0000
Received: by outflank-mailman (input) for mailman id 1240477;
 Wed, 25 Feb 2026 09:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMbn=A5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vvBec-0002lN-G5
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 09:58:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 76f17b1f-1230-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 10:57:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6907165C;
 Wed, 25 Feb 2026 01:57:51 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.86])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E13E33F62B;
 Wed, 25 Feb 2026 01:57:56 -0800 (PST)
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
X-Inumbo-ID: 76f17b1f-1230-11f1-b164-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/4] xen/arm: ffa: Add PARTITION_INFO_GET_REGS support
Date: Wed, 25 Feb 2026 10:57:42 +0100
Message-ID: <cover.1772013062.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: A0777195629
X-Rspamd-Action: no action

This series implements FF-A 1.2 PARTITION_INFO_GET_REGS support,
providing register-based partition info retrieval as an efficient
alternative to the RX buffer-based PARTITION_INFO_GET.

The serie is also introducing a caching system for the list of secure
partitions to prevent retrieving it on each VM call as we expect it to
be static and not changing over time.

The patches are organized as follows:
- patch 1 is modifying existing code to prepare for GET_REGS support by
  adding a start_index in the existing internal function
- patch 2 is introducing the secure partition list caching
- patch 3 is removing the existing suscribers list to directly use the
  cached secure partition list
- patch 4 is adding GET_REGS support

Bertrand Marquis (4):
  xen/arm: ffa: Add start_index to VM partinfo helper
  xen/arm: ffa: Cache SP partition info at init
  xen/arm: ffa: Drop SP subscriber lists
  xen/arm: ffa: Add cached GET_REGS support

 xen/arch/arm/tee/ffa.c          |  16 +
 xen/arch/arm/tee/ffa_partinfo.c | 558 ++++++++++++++++++++++----------
 xen/arch/arm/tee/ffa_private.h  |   4 +-
 3 files changed, 402 insertions(+), 176 deletions(-)

-- 
2.52.0


